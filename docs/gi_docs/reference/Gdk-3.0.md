# Gdk 3.0

SQGI import: `import("Gdk", "3.0")`

Packages: `gdk-3.0`
Includes: `GdkPixbuf-2.0`, `Gio-2.0`, `Pango-1.0`, `cairo-1.0`
Libraries: `libgdk-3.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 17 |
| Interfaces | 1 |
| Records | 42 |
| Unions | 1 |
| Enums | 34 |
| Flags | 12 |
| Functions | 114 |
| Callbacks | 5 |
| Constants | 2290 |
| Aliases | 1 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AppLaunchContext | Gio.AppLaunchContext | 0 | 0 | 7 | GdkAppLaunchContext is an implementation of #GAppLaunchContext that handles launching an application in a graphical context. It provides startup no... |
| Cursor | GObject.Object | 0 | 0 | 11 | A #GdkCursor represents a cursor. Its contents are private. |
| Device | GObject.Object | 0 | 2 | 34 | The #GdkDevice object represents a single input device, such as a keyboard, a mouse, a touchpad, etc. See the #GdkDeviceManager documentation for m... |
| DeviceManager | GObject.Object | 0 | 3 | 3 | In addition to a single pointer and keyboard for user interface input, GDK contains support for a variety of input devices, including graphics tabl... |
| DeviceTool | GObject.Object | 0 | 0 | 3 | Gets the hardware ID of this tool, or 0 if it's not known. When non-zero, the identificator is unique for the given tool model, meaning that two id... |
| Display | GObject.Object | 0 | 6 | 48 | #GdkDisplay objects purpose are two fold: - To manage and provide information about input devices (pointers and keyboards) - To manage and provide ... |
| DisplayManager | GObject.Object | 0 | 1 | 5 | The purpose of the #GdkDisplayManager singleton object is to offer notification when displays appear or disappear or the default display changes. Y... |
| DragContext | GObject.Object | 0 | 4 | 12 | Determines the bitmask of actions proposed by the source if gdk_drag_context_get_suggested_action() returns %GDK_ACTION_ASK. |
| DrawingContext | GObject.Object | 0 | 0 | 4 | #GdkDrawingContext is an object that represents the current drawing state of a #GdkWindow. It's possible to use a #GdkDrawingContext to draw on a #... |
| FrameClock | GObject.Object | 0 | 7 | 9 | A #GdkFrameClock tells the application when to update and repaint a window. This may be synced to the vertical refresh rate of the monitor, for exa... |
| GLContext | GObject.Object | 0 | 0 | 17 | #GdkGLContext is an object representing the platform-specific OpenGL drawing context. #GdkGLContexts are created for a #GdkWindow using gdk_window_... |
| Keymap | GObject.Object | 0 | 3 | 15 | A #GdkKeymap defines the translation from keyboard state (including a hardware key, a modifier mask, and active keyboard group) to a keyval. This t... |
| Monitor | GObject.Object | 0 | 1 | 11 | GdkMonitor objects represent the individual outputs that are associated with a #GdkDisplay. GdkDisplay has APIs to enumerate monitors with gdk_disp... |
| Screen | GObject.Object | 0 | 3 | 35 | #GdkScreen objects are the GDK representation of the screen on which windows can be displayed and on which the pointer moves. X originally identifi... |
| Seat | GObject.Object | 0 | 4 | 7 | The #GdkSeat object represents a collection of input devices that belong to a user. |
| Visual | GObject.Object | 0 | 0 | 16 | A #GdkVisual contains information about a particular visual. |
| Window | GObject.Object | 0 | 5 | 162 | Creates a new #GdkWindow using the attributes from @attributes. See #GdkWindowAttr and #GdkWindowAttributesType for more details. Note: to use this... |

### Gdk.AppLaunchContext

Parent: `Gio.AppLaunchContext` ?? GType: `GdkAppLaunchContext` ?? C type: `GdkAppLaunchContext`

GdkAppLaunchContext is an implementation of #GAppLaunchContext that handles launching an application in a graphical context. It provides startup no...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AppLaunchContext.new() -> AppLaunchContext` | gdk_app_launch_context_new | 2.14 | Creates a new #GdkAppLaunchContext. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_desktop | `AppLaunchContext.set_desktop(desktop: gint) -> none` | gdk_app_launch_context_set_desktop | 2.14 | Sets the workspace on which applications will be launched when using this context when running under a window manager that supports multiple worksp... |
| set_display | `AppLaunchContext.set_display(display: Display) -> none` | gdk_app_launch_context_set_display | 2.14 | Sets the display on which applications will be launched when using this context. See also gdk_app_launch_context_set_screen(). |
| set_icon | `AppLaunchContext.set_icon(icon: Gio.Icon?) -> none` | gdk_app_launch_context_set_icon | 2.14 | Sets the icon for applications that are launched with this context. Window Managers can use this information when displaying startup notification. ... |
| set_icon_name | `AppLaunchContext.set_icon_name(icon_name: utf8?) -> none` | gdk_app_launch_context_set_icon_name | 2.14 | Sets the icon for applications that are launched with this context. The @icon_name will be interpreted in the same way as the Icon field in desktop... |
| set_screen | `AppLaunchContext.set_screen(screen: Screen) -> none` | gdk_app_launch_context_set_screen | 2.14 | Sets the screen on which applications will be launched when using this context. See also gdk_app_launch_context_set_display(). Note that, typically... |
| set_timestamp | `AppLaunchContext.set_timestamp(timestamp: guint32) -> none` | gdk_app_launch_context_set_timestamp | 2.14 | Sets the timestamp of @context. The timestamp should ideally be taken from the event that triggered the launch. Window managers can use this inform... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only |  |

### Gdk.Cursor

Parent: `GObject.Object` ?? GType: `GdkCursor` ?? C type: `GdkCursor` ?? Abstract

A #GdkCursor represents a cursor. Its contents are private.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Cursor.new(cursor_type: CursorType) -> Cursor` | gdk_cursor_new |  | Creates a new cursor from the set of builtin cursors for the default display. See gdk_cursor_new_for_display(). To make the cursor invisible, use %... |
| new_for_display | `Cursor.new_for_display(display: Display, cursor_type: CursorType) -> Cursor` | gdk_cursor_new_for_display | 2.2 | Creates a new cursor from the set of builtin cursors. |
| new_from_name | `Cursor.new_from_name(display: Display, name: utf8) -> Cursor` | gdk_cursor_new_from_name | 2.8 | Creates a new cursor by looking up @name in the current cursor theme. A recommended set of cursor names that will work across different platforms c... |
| new_from_pixbuf | `Cursor.new_from_pixbuf(display: Display, pixbuf: GdkPixbuf.Pixbuf, x: gint, y: gint) -> Cursor` | gdk_cursor_new_from_pixbuf | 2.4 | Creates a new cursor from a pixbuf. Not all GDK backends support RGBA cursors. If they are not supported, a monochrome approximation will be displa... |
| new_from_surface | `Cursor.new_from_surface(display: Display, surface: cairo.Surface, x: gdouble, y: gdouble) -> Cursor` | gdk_cursor_new_from_surface | 3.10 | Creates a new cursor from a cairo image surface. Not all GDK backends support RGBA cursors. If they are not supported, a monochrome approximation w... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cursor_type | `Cursor.get_cursor_type() -> CursorType` | gdk_cursor_get_cursor_type | 2.22 | Returns the cursor type for this cursor. |
| get_display | `Cursor.get_display() -> Display` | gdk_cursor_get_display | 2.2 | Returns the display on which the #GdkCursor is defined. |
| get_image | `Cursor.get_image() -> GdkPixbuf.Pixbuf` | gdk_cursor_get_image | 2.8 | Returns a #GdkPixbuf with the image used to display the cursor. Note that depending on the capabilities of the windowing system and on the cursor, ... |
| get_surface | `Cursor.get_surface(x_hot: out gdouble?, y_hot: out gdouble?) -> cairo.Surface` | gdk_cursor_get_surface | 3.10 | Returns a cairo image surface with the image used to display the cursor. Note that depending on the capabilities of the windowing system and on the... |
| ref | `Cursor.ref() -> Cursor` | gdk_cursor_ref |  | Adds a reference to @cursor. |
| unref | `Cursor.unref() -> none` | gdk_cursor_unref |  | Removes a reference from @cursor, deallocating the cursor if no references remain. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cursor-type | CursorType | read, write, construct-only |  |
| display | Display | read, write, construct-only |  |

### Gdk.Device

Parent: `GObject.Object` ?? GType: `GdkDevice` ?? C type: `GdkDevice` ?? Abstract

The #GdkDevice object represents a single input device, such as a keyboard, a mouse, a touchpad, etc. See the #GdkDeviceManager documentation for m...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free_history | `free_history(events: TimeCoord, n_events: gint) -> none` | gdk_device_free_history |  | Frees an array of #GdkTimeCoord that was returned by gdk_device_get_history(). |
| grab_info_libgtk_only | `grab_info_libgtk_only(display: Display, device: Device, grab_window: out Window, owner_events: out gboolean) -> gboolean` | gdk_device_grab_info_libgtk_only |  | Determines information about the current keyboard grab. This is not public API and must not be used by applications. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_associated_device | `Device.get_associated_device() -> Device` | gdk_device_get_associated_device | 3.0 | Returns the associated device to @device, if @device is of type %GDK_DEVICE_TYPE_MASTER, it will return the paired pointer or keyboard. If @device ... |
| get_axes | `Device.get_axes() -> AxisFlags` | gdk_device_get_axes | 3.22 | Returns the axes currently available on the device. |
| get_axis | `Device.get_axis(axes: gdouble, use: AxisUse, value: out gdouble) -> gboolean` | gdk_device_get_axis |  | Interprets an array of double as axis values for a given device, and locates the value in the array for a given axis use. |
| get_axis_use | `Device.get_axis_use(index_: guint) -> AxisUse` | gdk_device_get_axis_use | 2.20 | Returns the axis use for @index_. |
| get_axis_value | `Device.get_axis_value(axes: gdouble, axis_label: Atom, value: out gdouble) -> gboolean` | gdk_device_get_axis_value | 3.0 | Interprets an array of double as axis values for a given device, and locates the value in the array for a given axis label, as returned by gdk_devi... |
| get_device_type | `Device.get_device_type() -> DeviceType` | gdk_device_get_device_type | 3.0 | Returns the device type for @device. |
| get_display | `Device.get_display() -> Display` | gdk_device_get_display | 3.0 | Returns the #GdkDisplay to which @device pertains. |
| get_has_cursor | `Device.get_has_cursor() -> gboolean` | gdk_device_get_has_cursor | 2.20 | Determines whether the pointer follows device motion. This is not meaningful for keyboard devices, which don't have a pointer. |
| get_history | `Device.get_history(window: Window, start: guint32, stop: guint32, events: out TimeCoord?, n_events: out gint?) -> gboolean` | gdk_device_get_history |  | Obtains the motion history for a pointer device; given a starting and ending timestamp, return all events in the motion history for the device in t... |
| get_key | `Device.get_key(index_: guint, keyval: out guint, modifiers: out ModifierType) -> gboolean` | gdk_device_get_key | 2.20 | If @index_ has a valid keyval, this function will return %TRUE and fill in @keyval and @modifiers with the keyval settings. |
| get_last_event_window | `Device.get_last_event_window() -> Window` | gdk_device_get_last_event_window | 3.12 | Gets information about which window the given pointer device is in, based on events that have been received so far from the display server. If anot... |
| get_mode | `Device.get_mode() -> InputMode` | gdk_device_get_mode | 2.20 | Determines the mode of the device. |
| get_n_axes | `Device.get_n_axes() -> gint` | gdk_device_get_n_axes | 3.0 | Returns the number of axes the device currently has. |
| get_n_keys | `Device.get_n_keys() -> gint` | gdk_device_get_n_keys | 2.24 | Returns the number of keys the device currently has. |
| get_name | `Device.get_name() -> utf8` | gdk_device_get_name | 2.20 | Determines the name of the device. |
| get_position | `Device.get_position(screen: out Screen?, x: out gint?, y: out gint?) -> none` | gdk_device_get_position | 3.0 | Gets the current location of @device. As a slave device coordinates are those of its master pointer, This function may not be called on devices of ... |
| get_position_double | `Device.get_position_double(screen: out Screen?, x: out gdouble?, y: out gdouble?) -> none` | gdk_device_get_position_double | 3.10 | Gets the current location of @device in double precision. As a slave device's coordinates are those of its master pointer, this function may not be... |
| get_product_id | `Device.get_product_id() -> utf8` | gdk_device_get_product_id | 3.16 | Returns the product ID of this device, or %NULL if this information couldn't be obtained. This ID is retrieved from the device, and is thus constan... |
| get_seat | `Device.get_seat() -> Seat` | gdk_device_get_seat | 3.20 | Returns the #GdkSeat the device belongs to. |
| get_source | `Device.get_source() -> InputSource` | gdk_device_get_source | 2.20 | Determines the type of the device. |
| get_state | `Device.get_state(window: Window, axes: gdouble?, mask: out ModifierType?) -> none` | gdk_device_get_state |  | Gets the current state of a pointer device relative to @window. As a slave device???s coordinates are those of its master pointer, this function ma... |
| get_vendor_id | `Device.get_vendor_id() -> utf8` | gdk_device_get_vendor_id | 3.16 | Returns the vendor ID of this device, or %NULL if this information couldn't be obtained. This ID is retrieved from the device, and is thus constant... |
| get_window_at_position | `Device.get_window_at_position(win_x: out gint?, win_y: out gint?) -> Window` | gdk_device_get_window_at_position | 3.0 | Obtains the window underneath @device, returning the location of the device in @win_x and @win_y. Returns %NULL if the window tree under @device is... |
| get_window_at_position_double | `Device.get_window_at_position_double(win_x: out gdouble?, win_y: out gdouble?) -> Window` | gdk_device_get_window_at_position_double | 3.0 | Obtains the window underneath @device, returning the location of the device in @win_x and @win_y in double precision. Returns %NULL if the window t... |
| grab | `Device.grab(window: Window, grab_ownership: GrabOwnership, owner_events: gboolean, event_mask: EventMask, cursor: Cursor?, time_: guint32) -> GrabStatus` | gdk_device_grab | 3.0 | Grabs the device so that all events coming from this device are passed to this application until the device is ungrabbed with gdk_device_ungrab(), ... |
| list_axes | `Device.list_axes() -> GLib.List` | gdk_device_list_axes | 3.0 | Returns a #GList of #GdkAtoms, containing the labels for the axes that @device currently has. |
| list_slave_devices | `Device.list_slave_devices() -> GLib.List` | gdk_device_list_slave_devices |  | If the device if of type %GDK_DEVICE_TYPE_MASTER, it will return the list of slave devices attached to it, otherwise it will return %NULL |
| set_axis_use | `Device.set_axis_use(index_: guint, use: AxisUse) -> none` | gdk_device_set_axis_use |  | Specifies how an axis of a device is used. |
| set_key | `Device.set_key(index_: guint, keyval: guint, modifiers: ModifierType) -> none` | gdk_device_set_key |  | Specifies the X key event to generate when a macro button of a device is pressed. |
| set_mode | `Device.set_mode(mode: InputMode) -> gboolean` | gdk_device_set_mode |  | Sets a the mode of an input device. The mode controls if the device is active and whether the device???s range is mapped to the entire screen or to... |
| ungrab | `Device.ungrab(time_: guint32) -> none` | gdk_device_ungrab | 3.0 | Release any grab on @device. |
| warp | `Device.warp(screen: Screen, x: gint, y: gint) -> none` | gdk_device_warp | 3.0 | Warps @device in @display to the point @x,@y on the screen @screen, unless the device is confined to a window by a grab, in which case it will be m... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| associated-device | Device | read | Associated pointer or keyboard with this device, if any. Devices of type #GDK_DEVICE_TYPE_MASTER always come in keyboard/pointer pairs. Other devic... |
| axes | AxisFlags | read | The axes currently available for this device. |
| device-manager | DeviceManager | read, write, construct-only | The #GdkDeviceManager the #GdkDevice pertains to. |
| display | Display | read, write, construct-only | The #GdkDisplay the #GdkDevice pertains to. |
| has-cursor | gboolean | read, write, construct-only | Whether the device is represented by a cursor on the screen. Devices of type %GDK_DEVICE_TYPE_MASTER will have %TRUE here. |
| input-mode | InputMode | read, write |  |
| input-source | InputSource | read, write, construct-only | Source type for the device. |
| n-axes | guint | read | Number of axes in the device. |
| name | utf8 | read, write, construct-only | The device name. |
| num-touches | guint | read, write, construct-only | The maximal number of concurrent touches on a touch device. Will be 0 if the device is not a touch device or if the number of touches is unknown. |
| product-id | utf8 | read, write, construct-only | Product ID of this device, see gdk_device_get_product_id(). |
| seat | Seat | read, write | #GdkSeat of this device. |
| tool | DeviceTool | read |  |
| type | DeviceType | read, write, construct-only | Device role in the device manager. |
| vendor-id | utf8 | read, write, construct-only | Vendor ID of this device, see gdk_device_get_vendor_id(). |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | The ::changed signal is emitted either when the #GdkDevice has changed the number of either axes or keys. For example In X this will normally happe... |
| tool-changed | `tool: DeviceTool` | none | last | 3.22 | The ::tool-changed signal is emitted on pen/eraser #GdkDevices whenever tools enter or leave proximity. |

### Gdk.DeviceManager

Parent: `GObject.Object` ?? GType: `GdkDeviceManager` ?? C type: `GdkDeviceManager` ?? Abstract

In addition to a single pointer and keyboard for user interface input, GDK contains support for a variety of input devices, including graphics tabl...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_client_pointer | `DeviceManager.get_client_pointer() -> Device` | gdk_device_manager_get_client_pointer | 3.0 | Returns the client pointer, that is, the master pointer that acts as the core pointer for this application. In X11, window managers may change this... |
| get_display | `DeviceManager.get_display() -> Display` | gdk_device_manager_get_display | 3.0 | Gets the #GdkDisplay associated to @device_manager. |
| list_devices | `DeviceManager.list_devices(type: DeviceType) -> GLib.List` | gdk_device_manager_list_devices | 3.0 | Returns the list of devices of type @type currently attached to @device_manager. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| device-added | `device: Device` | none | last |  | The ::device-added signal is emitted either when a new master pointer is created, or when a slave (Hardware) input device is plugged in. |
| device-changed | `device: Device` | none | last |  | The ::device-changed signal is emitted whenever a device has changed in the hierarchy, either slave devices being disconnected from their master de... |
| device-removed | `device: Device` | none | last |  | The ::device-removed signal is emitted either when a master pointer is removed, or when a slave (Hardware) input device is unplugged. |

### Gdk.DeviceTool

Parent: `GObject.Object` ?? GType: `GdkDeviceTool` ?? C type: `GdkDeviceTool`

Gets the hardware ID of this tool, or 0 if it's not known. When non-zero, the identificator is unique for the given tool model, meaning that two id...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_hardware_id | `DeviceTool.get_hardware_id() -> guint64` | gdk_device_tool_get_hardware_id | 3.22 | Gets the hardware ID of this tool, or 0 if it's not known. When non-zero, the identificator is unique for the given tool model, meaning that two id... |
| get_serial | `DeviceTool.get_serial() -> guint64` | gdk_device_tool_get_serial | 3.22 | Gets the serial of this tool, this value can be used to identify a physical tool (eg. a tablet pen) across program executions. |
| get_tool_type | `DeviceTool.get_tool_type() -> DeviceToolType` | gdk_device_tool_get_tool_type | 3.22 | Gets the #GdkDeviceToolType of the tool. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| axes | AxisFlags | read, write, construct-only |  |
| hardware-id | guint64 | read, write, construct-only |  |
| serial | guint64 | read, write, construct-only |  |
| tool-type | DeviceToolType | read, write, construct-only |  |

### Gdk.Display

Parent: `GObject.Object` ?? GType: `GdkDisplay` ?? C type: `GdkDisplay`

#GdkDisplay objects purpose are two fold: - To manage and provide information about input devices (pointers and keyboards) - To manage and provide ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Display` | gdk_display_get_default | 2.2 | Gets the default #GdkDisplay. This is a convenience function for: `gdk_display_manager_get_default_display (gdk_display_manager_get ())`. |
| open | `open(display_name: utf8) -> Display` | gdk_display_open | 2.2 | Opens a display. |
| open_default_libgtk_only | `open_default_libgtk_only() -> Display` | gdk_display_open_default_libgtk_only |  | Opens the default display specified by command line arguments or environment variables, sets it as the default display, and returns it. gdk_parse_a... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| beep | `Display.beep() -> none` | gdk_display_beep | 2.2 | Emits a short beep on @display |
| close | `Display.close() -> none` | gdk_display_close | 2.2 | Closes the connection to the windowing system for the given display, and cleans up associated resources. |
| device_is_grabbed | `Display.device_is_grabbed(device: Device) -> gboolean` | gdk_display_device_is_grabbed |  | Returns %TRUE if there is an ongoing grab on @device for @display. |
| flush | `Display.flush() -> none` | gdk_display_flush | 2.4 | Flushes any requests queued for the windowing system; this happens automatically when the main loop blocks waiting for new events, but if your appl... |
| get_app_launch_context | `Display.get_app_launch_context() -> AppLaunchContext` | gdk_display_get_app_launch_context | 3.0 | Returns a #GdkAppLaunchContext suitable for launching applications on the given display. |
| get_default_cursor_size | `Display.get_default_cursor_size() -> guint` | gdk_display_get_default_cursor_size | 2.4 | Returns the default size to use for cursors on @display. |
| get_default_group | `Display.get_default_group() -> Window` | gdk_display_get_default_group | 2.4 | Returns the default group leader window for all toplevel windows on @display. This window is implicitly created by GDK. See gdk_window_set_group(). |
| get_default_screen | `Display.get_default_screen() -> Screen` | gdk_display_get_default_screen | 2.2 | Get the default #GdkScreen for @display. |
| get_default_seat | `Display.get_default_seat() -> Seat` | gdk_display_get_default_seat | 3.20 | Returns the default #GdkSeat for this display. |
| get_device_manager | `Display.get_device_manager() -> DeviceManager` | gdk_display_get_device_manager | 3.0 | Returns the #GdkDeviceManager associated to @display. |
| get_event | `Display.get_event() -> Event` | gdk_display_get_event | 2.2 | Gets the next #GdkEvent to be processed for @display, fetching events from the windowing system if necessary. |
| get_maximal_cursor_size | `Display.get_maximal_cursor_size(width: out guint, height: out guint) -> none` | gdk_display_get_maximal_cursor_size | 2.4 | Gets the maximal size to use for cursors on @display. |
| get_monitor | `Display.get_monitor(monitor_num: gint) -> Monitor` | gdk_display_get_monitor | 3.22 | Gets a monitor associated with this display. |
| get_monitor_at_point | `Display.get_monitor_at_point(x: gint, y: gint) -> Monitor` | gdk_display_get_monitor_at_point | 3.22 | Gets the monitor in which the point (@x, @y) is located, or a nearby monitor if the point is not in any monitor. |
| get_monitor_at_window | `Display.get_monitor_at_window(window: Window) -> Monitor` | gdk_display_get_monitor_at_window | 3.22 | Gets the monitor in which the largest area of @window resides, or a monitor close to @window if it is outside of all monitors. |
| get_n_monitors | `Display.get_n_monitors() -> gint` | gdk_display_get_n_monitors | 3.22 | Gets the number of monitors that belong to @display. The returned number is valid until the next emission of the #GdkDisplay::monitor-added or #Gdk... |
| get_n_screens | `Display.get_n_screens() -> gint` | gdk_display_get_n_screens | 2.2 | Gets the number of screen managed by the @display. |
| get_name | `Display.get_name() -> utf8` | gdk_display_get_name | 2.2 | Gets the name of the display. |
| get_pointer | `Display.get_pointer(screen: out Screen?, x: out gint?, y: out gint?, mask: out ModifierType?) -> none` | gdk_display_get_pointer | 2.2 | Gets the current location of the pointer and the current modifier mask for a given display. |
| get_primary_monitor | `Display.get_primary_monitor() -> Monitor` | gdk_display_get_primary_monitor | 3.22 | Gets the primary monitor for the display. The primary monitor is considered the monitor where the ???main desktop??? lives. While normal applicatio... |
| get_screen | `Display.get_screen(screen_num: gint) -> Screen` | gdk_display_get_screen | 2.2 | Returns a screen object for one of the screens of the display. |
| get_window_at_pointer | `Display.get_window_at_pointer(win_x: out gint?, win_y: out gint?) -> Window` | gdk_display_get_window_at_pointer | 2.2 | Obtains the window underneath the mouse pointer, returning the location of the pointer in that window in @win_x, @win_y for @screen. Returns %NULL ... |
| has_pending | `Display.has_pending() -> gboolean` | gdk_display_has_pending | 3.0 | Returns whether the display has events that are waiting to be processed. |
| is_closed | `Display.is_closed() -> gboolean` | gdk_display_is_closed | 2.22 | Finds out if the display has been closed. |
| keyboard_ungrab | `Display.keyboard_ungrab(time_: guint32) -> none` | gdk_display_keyboard_ungrab | 2.2 | Release any keyboard grab |
| list_devices | `Display.list_devices() -> GLib.List` | gdk_display_list_devices | 2.2 | Returns the list of available input devices attached to @display. The list is statically allocated and should not be freed. |
| list_seats | `Display.list_seats() -> GLib.List` | gdk_display_list_seats | 3.20 | Returns the list of seats known to @display. |
| notify_startup_complete | `Display.notify_startup_complete(startup_id: utf8) -> none` | gdk_display_notify_startup_complete | 3.0 | Indicates to the GUI environment that the application has finished loading, using a given identifier. GTK+ will call this function automatically fo... |
| peek_event | `Display.peek_event() -> Event` | gdk_display_peek_event | 2.2 | Gets a copy of the first #GdkEvent in the @display???s event queue, without removing the event from the queue. (Note that this function will not ge... |
| pointer_is_grabbed | `Display.pointer_is_grabbed() -> gboolean` | gdk_display_pointer_is_grabbed | 2.2 | Test if the pointer is grabbed. |
| pointer_ungrab | `Display.pointer_ungrab(time_: guint32) -> none` | gdk_display_pointer_ungrab | 2.2 | Release any pointer grab. |
| put_event | `Display.put_event(event: Event) -> none` | gdk_display_put_event | 2.2 | Appends a copy of the given event onto the front of the event queue for @display. |
| request_selection_notification | `Display.request_selection_notification(selection: Atom) -> gboolean` | gdk_display_request_selection_notification | 2.6 | Request #GdkEventOwnerChange events for ownership changes of the selection named by the given atom. |
| set_double_click_distance | `Display.set_double_click_distance(distance: guint) -> none` | gdk_display_set_double_click_distance | 2.4 | Sets the double click distance (two clicks within this distance count as a double click and result in a #GDK_2BUTTON_PRESS event). See also gdk_dis... |
| set_double_click_time | `Display.set_double_click_time(msec: guint) -> none` | gdk_display_set_double_click_time | 2.2 | Sets the double click time (two clicks within this time interval count as a double click and result in a #GDK_2BUTTON_PRESS event). Applications sh... |
| store_clipboard | `Display.store_clipboard(clipboard_window: Window, time_: guint32, targets: Atom?, n_targets: gint) -> none` | gdk_display_store_clipboard | 2.6 | Issues a request to the clipboard manager to store the clipboard data. On X11, this is a special program that works according to the FreeDesktop Cl... |
| supports_clipboard_persistence | `Display.supports_clipboard_persistence() -> gboolean` | gdk_display_supports_clipboard_persistence | 2.6 | Returns whether the speicifed display supports clipboard persistance; i.e. if it???s possible to store the clipboard data after an application has ... |
| supports_composite | `Display.supports_composite() -> gboolean` | gdk_display_supports_composite | 2.12 | Returns %TRUE if gdk_window_set_composited() can be used to redirect drawing on the window using compositing. Currently this only works on X11 with... |
| supports_cursor_alpha | `Display.supports_cursor_alpha() -> gboolean` | gdk_display_supports_cursor_alpha | 2.4 | Returns %TRUE if cursors can use an 8bit alpha channel on @display. Otherwise, cursors are restricted to bilevel alpha (i.e. a mask). |
| supports_cursor_color | `Display.supports_cursor_color() -> gboolean` | gdk_display_supports_cursor_color | 2.4 | Returns %TRUE if multicolored cursors are supported on @display. Otherwise, cursors have only a forground and a background color. |
| supports_input_shapes | `Display.supports_input_shapes() -> gboolean` | gdk_display_supports_input_shapes | 2.10 | Returns %TRUE if gdk_window_input_shape_combine_mask() can be used to modify the input shape of windows on @display. |
| supports_selection_notification | `Display.supports_selection_notification() -> gboolean` | gdk_display_supports_selection_notification | 2.6 | Returns whether #GdkEventOwnerChange events will be sent when the owner of a selection changes. |
| supports_shapes | `Display.supports_shapes() -> gboolean` | gdk_display_supports_shapes | 2.10 | Returns %TRUE if gdk_window_shape_combine_mask() can be used to create shaped windows on @display. |
| sync | `Display.sync() -> none` | gdk_display_sync | 2.2 | Flushes any requests queued for the windowing system and waits until all requests have been handled. This is often used for making sure that the di... |
| warp_pointer | `Display.warp_pointer(screen: Screen, x: gint, y: gint) -> none` | gdk_display_warp_pointer | 2.8 | Warps the pointer of @display to the point @x,@y on the screen @screen, unless the pointer is confined to a window by a grab, in which case it will... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `is_error: gboolean` | none | last | 2.2 | The ::closed signal is emitted when the connection to the windowing system for @display is closed. |
| monitor-added | `monitor: Monitor` | none | last | 3.22 | The ::monitor-added signal is emitted whenever a monitor is added. |
| monitor-removed | `monitor: Monitor` | none | last | 3.22 | The ::monitor-removed signal is emitted whenever a monitor is removed. |
| opened | `` | none | last |  | The ::opened signal is emitted when the connection to the windowing system for @display is opened. |
| seat-added | `seat: Seat` | none | last | 3.20 | The ::seat-added signal is emitted whenever a new seat is made known to the windowing system. |
| seat-removed | `seat: Seat` | none | last | 3.20 | The ::seat-removed signal is emitted whenever a seat is removed by the windowing system. |

### Gdk.DisplayManager

Parent: `GObject.Object` ?? GType: `GdkDisplayManager` ?? C type: `GdkDisplayManager`

The purpose of the #GdkDisplayManager singleton object is to offer notification when displays appear or disappear or the default display changes. Y...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> DisplayManager` | gdk_display_manager_get | 2.2 | Gets the singleton #GdkDisplayManager object. When called for the first time, this function consults the `GDK_BACKEND` environment variable to find... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_display | `DisplayManager.get_default_display() -> Display` | gdk_display_manager_get_default_display | 2.2 | Gets the default #GdkDisplay. |
| list_displays | `DisplayManager.list_displays() -> GLib.SList` | gdk_display_manager_list_displays | 2.2 | List all currently open displays. |
| open_display | `DisplayManager.open_display(name: utf8) -> Display` | gdk_display_manager_open_display | 3.0 | Opens a display. |
| set_default_display | `DisplayManager.set_default_display(display: Display) -> none` | gdk_display_manager_set_default_display | 2.2 | Sets @display as the default display. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| default-display | Display | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| display-opened | `display: Display` | none | last | 2.2 | The ::display-opened signal is emitted when a display is opened. |

### Gdk.DragContext

Parent: `GObject.Object` ?? GType: `GdkDragContext` ?? C type: `GdkDragContext`

Determines the bitmask of actions proposed by the source if gdk_drag_context_get_suggested_action() returns %GDK_ACTION_ASK.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_actions | `DragContext.get_actions() -> DragAction` | gdk_drag_context_get_actions | 2.22 | Determines the bitmask of actions proposed by the source if gdk_drag_context_get_suggested_action() returns %GDK_ACTION_ASK. |
| get_dest_window | `DragContext.get_dest_window() -> Window` | gdk_drag_context_get_dest_window | 3.0 | Returns the destination window for the DND operation. |
| get_device | `DragContext.get_device() -> Device` | gdk_drag_context_get_device |  | Returns the #GdkDevice associated to the drag context. |
| get_drag_window | `DragContext.get_drag_window() -> Window` | gdk_drag_context_get_drag_window | 3.20 | Returns the window on which the drag icon should be rendered during the drag operation. Note that the window may not be available until the drag op... |
| get_protocol | `DragContext.get_protocol() -> DragProtocol` | gdk_drag_context_get_protocol | 3.0 | Returns the drag protocol that is used by this context. |
| get_selected_action | `DragContext.get_selected_action() -> DragAction` | gdk_drag_context_get_selected_action | 2.22 | Determines the action chosen by the drag destination. |
| get_source_window | `DragContext.get_source_window() -> Window` | gdk_drag_context_get_source_window | 2.22 | Returns the #GdkWindow where the DND operation started. |
| get_suggested_action | `DragContext.get_suggested_action() -> DragAction` | gdk_drag_context_get_suggested_action | 2.22 | Determines the suggested drag action of the context. |
| list_targets | `DragContext.list_targets() -> GLib.List` | gdk_drag_context_list_targets | 2.22 | Retrieves the list of targets of the context. |
| manage_dnd | `DragContext.manage_dnd(ipc_window: Window, actions: DragAction) -> gboolean` | gdk_drag_context_manage_dnd | 3.20 | Requests the drag and drop operation to be managed by @context. When a drag and drop operation becomes managed, the #GdkDragContext will internally... |
| set_device | `DragContext.set_device(device: Device) -> none` | gdk_drag_context_set_device |  | Associates a #GdkDevice to @context, so all Drag and Drop events for @context are emitted as if they came from this device. |
| set_hotspot | `DragContext.set_hotspot(hot_x: gint, hot_y: gint) -> none` | gdk_drag_context_set_hotspot | 3.20 | Sets the position of the drag window that will be kept under the cursor hotspot. Initially, the hotspot is at the top left corner of the drag window. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| action-changed | `action: DragAction` | none | last | 3.20 | A new action is being chosen for the drag and drop operation. This signal will only be emitted if the #GdkDragContext manages the drag and drop ope... |
| cancel | `reason: DragCancelReason` | none | last | 3.20 | The drag and drop operation was cancelled. This signal will only be emitted if the #GdkDragContext manages the drag and drop operation. See gdk_dra... |
| dnd-finished | `` | none | last | 3.20 | The drag and drop operation was finished, the drag destination finished reading all data. The drag source can now free all miscellaneous data. This... |
| drop-performed | `time: gint` | none | last | 3.20 | The drag and drop operation was performed on an accepting client. This signal will only be emitted if the #GdkDragContext manages the drag and drop... |

### Gdk.DrawingContext

Parent: `GObject.Object` ?? GType: `GdkDrawingContext` ?? C type: `GdkDrawingContext`

#GdkDrawingContext is an object that represents the current drawing state of a #GdkWindow. It's possible to use a #GdkDrawingContext to draw on a #...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cairo_context | `DrawingContext.get_cairo_context() -> cairo.Context` | gdk_drawing_context_get_cairo_context | 3.22 | Retrieves a Cairo context to be used to draw on the #GdkWindow that created the #GdkDrawingContext. The returned context is guaranteed to be valid ... |
| get_clip | `DrawingContext.get_clip() -> cairo.Region` | gdk_drawing_context_get_clip | 3.22 | Retrieves a copy of the clip region used when creating the @context. |
| get_window | `DrawingContext.get_window() -> Window` | gdk_drawing_context_get_window | 3.22 | Retrieves the window that created the drawing @context. |
| is_valid | `DrawingContext.is_valid() -> gboolean` | gdk_drawing_context_is_valid | 3.22 | Checks whether the given #GdkDrawingContext is valid. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| clip | cairo.Region | read, write, construct-only | The clip region applied to the drawing context. |
| window | Window | read, write, construct-only | The #GdkWindow that created the drawing context. |

### Gdk.FrameClock

Parent: `GObject.Object` ?? GType: `GdkFrameClock` ?? C type: `GdkFrameClock` ?? Abstract

A #GdkFrameClock tells the application when to update and repaint a window. This may be synced to the vertical refresh rate of the monitor, for exa...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| begin_updating | `FrameClock.begin_updating() -> none` | gdk_frame_clock_begin_updating | 3.8 | Starts updates for an animation. Until a matching call to gdk_frame_clock_end_updating() is made, the frame clock will continually request a new fr... |
| end_updating | `FrameClock.end_updating() -> none` | gdk_frame_clock_end_updating | 3.8 | Stops updates for an animation. See the documentation for gdk_frame_clock_begin_updating(). |
| get_current_timings | `FrameClock.get_current_timings() -> FrameTimings` | gdk_frame_clock_get_current_timings | 3.8 | Gets the frame timings for the current frame. |
| get_frame_counter | `FrameClock.get_frame_counter() -> gint64` | gdk_frame_clock_get_frame_counter | 3.8 | A #GdkFrameClock maintains a 64-bit counter that increments for each frame drawn. |
| get_frame_time | `FrameClock.get_frame_time() -> gint64` | gdk_frame_clock_get_frame_time | 3.8 | Gets the time that should currently be used for animations. Inside the processing of a frame, it???s the time used to compute the animation positio... |
| get_history_start | `FrameClock.get_history_start() -> gint64` | gdk_frame_clock_get_history_start | 3.8 | #GdkFrameClock internally keeps a history of #GdkFrameTimings objects for recent frames that can be retrieved with gdk_frame_clock_get_timings(). T... |
| get_refresh_info | `FrameClock.get_refresh_info(base_time: gint64, refresh_interval_return: out gint64?, presentation_time_return: out gint64) -> none` | gdk_frame_clock_get_refresh_info | 3.8 | Using the frame history stored in the frame clock, finds the last known presentation time and refresh interval, and assuming that presentation time... |
| get_timings | `FrameClock.get_timings(frame_counter: gint64) -> FrameTimings` | gdk_frame_clock_get_timings | 3.8 | Retrieves a #GdkFrameTimings object holding timing information for the current frame or a recent frame. The #GdkFrameTimings object may not yet be ... |
| request_phase | `FrameClock.request_phase(phase: FrameClockPhase) -> none` | gdk_frame_clock_request_phase | 3.8 | Asks the frame clock to run a particular phase. The signal corresponding the requested phase will be emitted the next time the frame clock processe... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| after-paint | `` | none | last |  | This signal ends processing of the frame. Applications should generally not handle this signal. |
| before-paint | `` | none | last |  | This signal begins processing of the frame. Applications should generally not handle this signal. |
| flush-events | `` | none | last |  | This signal is used to flush pending motion events that are being batched up and compressed together. Applications should not handle this signal. |
| layout | `` | none | last |  | This signal is emitted as the second step of toolkit and application processing of the frame. Any work to update sizes and positions of application... |
| paint | `` | none | last |  | This signal is emitted as the third step of toolkit and application processing of the frame. The frame is repainted. GDK normally handles this inte... |
| resume-events | `` | none | last |  | This signal is emitted after processing of the frame is finished, and is handled internally by GTK+ to resume normal event processing. Applications... |
| update | `` | none | last |  | This signal is emitted as the first step of toolkit and application processing of the frame. Animations should be updated using gdk_frame_clock_get... |

### Gdk.GLContext

Parent: `GObject.Object` ?? GType: `GdkGLContext` ?? C type: `GdkGLContext` ?? Abstract

#GdkGLContext is an object representing the platform-specific OpenGL drawing context. #GdkGLContexts are created for a #GdkWindow using gdk_window_...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_current | `clear_current() -> none` | gdk_gl_context_clear_current | 3.16 | Clears the current #GdkGLContext. Any OpenGL call after this function returns will be ignored until gdk_gl_context_make_current() is called. |
| get_current | `get_current() -> GLContext` | gdk_gl_context_get_current | 3.16 | Retrieves the current #GdkGLContext. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_debug_enabled | `GLContext.get_debug_enabled() -> gboolean` | gdk_gl_context_get_debug_enabled | 3.16 | Retrieves the value set using gdk_gl_context_set_debug_enabled(). |
| get_display | `GLContext.get_display() -> Display` | gdk_gl_context_get_display | 3.16 | Retrieves the #GdkDisplay the @context is created for |
| get_forward_compatible | `GLContext.get_forward_compatible() -> gboolean` | gdk_gl_context_get_forward_compatible | 3.16 | Retrieves the value set using gdk_gl_context_set_forward_compatible(). |
| get_required_version | `GLContext.get_required_version(major: out gint?, minor: out gint?) -> none` | gdk_gl_context_get_required_version | 3.16 | Retrieves the major and minor version requested by calling gdk_gl_context_set_required_version(). |
| get_shared_context | `GLContext.get_shared_context() -> GLContext` | gdk_gl_context_get_shared_context | 3.16 | Retrieves the #GdkGLContext that this @context share data with. |
| get_use_es | `GLContext.get_use_es() -> gboolean` | gdk_gl_context_get_use_es | 3.22 | Checks whether the @context is using an OpenGL or OpenGL ES profile. |
| get_version | `GLContext.get_version(major: out gint, minor: out gint) -> none` | gdk_gl_context_get_version | 3.16 | Retrieves the OpenGL version of the @context. The @context must be realized prior to calling this function. |
| get_window | `GLContext.get_window() -> Window` | gdk_gl_context_get_window | 3.16 | Retrieves the #GdkWindow used by the @context. |
| is_legacy | `GLContext.is_legacy() -> gboolean` | gdk_gl_context_is_legacy | 3.20 | Whether the #GdkGLContext is in legacy mode or not. The #GdkGLContext must be realized before calling this function. When realizing a GL context, G... |
| make_current | `GLContext.make_current() -> none` | gdk_gl_context_make_current | 3.16 | Makes the @context the current one. |
| realize | `GLContext.realize() -> gboolean throws` | gdk_gl_context_realize | 3.16 | Realizes the given #GdkGLContext. It is safe to call this function on a realized #GdkGLContext. |
| set_debug_enabled | `GLContext.set_debug_enabled(enabled: gboolean) -> none` | gdk_gl_context_set_debug_enabled | 3.16 | Sets whether the #GdkGLContext should perform extra validations and run time checking. This is useful during development, but has additional overhe... |
| set_forward_compatible | `GLContext.set_forward_compatible(compatible: gboolean) -> none` | gdk_gl_context_set_forward_compatible | 3.16 | Sets whether the #GdkGLContext should be forward compatible. Forward compatibile contexts must not support OpenGL functionality that has been marke... |
| set_required_version | `GLContext.set_required_version(major: gint, minor: gint) -> none` | gdk_gl_context_set_required_version | 3.16 | Sets the major and minor version of OpenGL to request. Setting @major and @minor to zero will use the default values. The #GdkGLContext must not be... |
| set_use_es | `GLContext.set_use_es(use_es: gint) -> none` | gdk_gl_context_set_use_es | 3.22 | Requests that GDK create a OpenGL ES context instead of an OpenGL one, if the platform and windowing system allows it. The @context must not have b... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only | The #GdkDisplay used to create the #GdkGLContext. |
| shared-context | GLContext | read, write, construct-only | The #GdkGLContext that this context is sharing data with, or %NULL |
| window | Window | read, write, construct-only | The #GdkWindow the gl context is bound to. |

### Gdk.Keymap

Parent: `GObject.Object` ?? GType: `GdkKeymap` ?? C type: `GdkKeymap`

A #GdkKeymap defines the translation from keyboard state (including a hardware key, a modifier mask, and active keyboard group) to a keyval. This t...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Keymap` | gdk_keymap_get_default |  | Returns the #GdkKeymap attached to the default display. |
| get_for_display | `get_for_display(display: Display) -> Keymap` | gdk_keymap_get_for_display | 2.2 | Returns the #GdkKeymap attached to @display. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_virtual_modifiers | `Keymap.add_virtual_modifiers(state: inout ModifierType) -> none` | gdk_keymap_add_virtual_modifiers | 2.20 | Maps the non-virtual modifiers (i.e Mod2, Mod3, ...) which are set in @state to the virtual modifiers (i.e. Super, Hyper and Meta) and set the corr... |
| get_caps_lock_state | `Keymap.get_caps_lock_state() -> gboolean` | gdk_keymap_get_caps_lock_state | 2.16 | Returns whether the Caps Lock modifer is locked. |
| get_direction | `Keymap.get_direction() -> Pango.Direction` | gdk_keymap_get_direction |  | Returns the direction of effective layout of the keymap. |
| get_entries_for_keycode | `Keymap.get_entries_for_keycode(hardware_keycode: guint, keys: out KeymapKey?, keyvals: out guint?, n_entries: out gint) -> gboolean` | gdk_keymap_get_entries_for_keycode |  | Returns the keyvals bound to @hardware_keycode. The Nth #GdkKeymapKey in @keys is bound to the Nth keyval in @keyvals. Free the returned arrays wit... |
| get_entries_for_keyval | `Keymap.get_entries_for_keyval(keyval: guint, keys: out KeymapKey, n_keys: out gint) -> gboolean` | gdk_keymap_get_entries_for_keyval |  | Obtains a list of keycode/group/level combinations that will generate @keyval. Groups and levels are two kinds of keyboard mode; in general, the le... |
| get_modifier_mask | `Keymap.get_modifier_mask(intent: ModifierIntent) -> ModifierType` | gdk_keymap_get_modifier_mask | 3.4 | Returns the modifier mask the @keymap???s windowing system backend uses for a particular purpose. Note that this function always returns real hardw... |
| get_modifier_state | `Keymap.get_modifier_state() -> guint` | gdk_keymap_get_modifier_state | 3.4 | Returns the current modifier state. |
| get_num_lock_state | `Keymap.get_num_lock_state() -> gboolean` | gdk_keymap_get_num_lock_state | 3.0 | Returns whether the Num Lock modifer is locked. |
| get_scroll_lock_state | `Keymap.get_scroll_lock_state() -> gboolean` | gdk_keymap_get_scroll_lock_state | 3.18 | Returns whether the Scroll Lock modifer is locked. |
| have_bidi_layouts | `Keymap.have_bidi_layouts() -> gboolean` | gdk_keymap_have_bidi_layouts | 2.12 | Determines if keyboard layouts for both right-to-left and left-to-right languages are in use. |
| lookup_key | `Keymap.lookup_key(key: KeymapKey) -> guint` | gdk_keymap_lookup_key |  | Looks up the keyval mapped to a keycode/group/level triplet. If no keyval is bound to @key, returns 0. For normal user input, you want to use gdk_k... |
| map_virtual_modifiers | `Keymap.map_virtual_modifiers(state: inout ModifierType) -> gboolean` | gdk_keymap_map_virtual_modifiers | 2.20 | Maps the virtual modifiers (i.e. Super, Hyper and Meta) which are set in @state to their non-virtual counterparts (i.e. Mod2, Mod3,...) and set the... |
| translate_keyboard_state | `Keymap.translate_keyboard_state(hardware_keycode: guint, state: ModifierType, group: gint, keyval: out guint?, effective_group: out gint?, level: out gint?, consumed_modifiers: out ModifierType?) -> gboolean` | gdk_keymap_translate_keyboard_state |  | Translates the contents of a #GdkEventKey into a keyval, effective group, and level. Modifiers that affected the translation and are thus unavailab... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| direction-changed | `` | none | last | 2.0 | The ::direction-changed signal gets emitted when the direction of the keymap changes. |
| keys-changed | `` | none | last | 2.2 | The ::keys-changed signal is emitted when the mapping represented by @keymap changes. |
| state-changed | `` | none | last | 2.16 | The ::state-changed signal is emitted when the state of the keyboard changes, e.g when Caps Lock is turned on or off. See gdk_keymap_get_caps_lock_... |

### Gdk.Monitor

Parent: `GObject.Object` ?? GType: `GdkMonitor` ?? C type: `GdkMonitor`

GdkMonitor objects represent the individual outputs that are associated with a #GdkDisplay. GdkDisplay has APIs to enumerate monitors with gdk_disp...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_display | `Monitor.get_display() -> Display` | gdk_monitor_get_display | 3.22 | Gets the display that this monitor belongs to. |
| get_geometry | `Monitor.get_geometry(geometry: out Rectangle) -> none` | gdk_monitor_get_geometry | 3.22 | Retrieves the size and position of an individual monitor within the display coordinate space. The returned geometry is in ???application pixels???,... |
| get_height_mm | `Monitor.get_height_mm() -> gint` | gdk_monitor_get_height_mm | 3.22 | Gets the height in millimeters of the monitor. |
| get_manufacturer | `Monitor.get_manufacturer() -> utf8` | gdk_monitor_get_manufacturer |  | Gets the name or PNP ID of the monitor's manufacturer, if available. Note that this value might also vary depending on actual display backend. PNP ... |
| get_model | `Monitor.get_model() -> utf8` | gdk_monitor_get_model |  | Gets the a string identifying the monitor model, if available. |
| get_refresh_rate | `Monitor.get_refresh_rate() -> gint` | gdk_monitor_get_refresh_rate | 3.22 | Gets the refresh rate of the monitor, if available. The value is in milli-Hertz, so a refresh rate of 60Hz is returned as 60000. |
| get_scale_factor | `Monitor.get_scale_factor() -> gint` | gdk_monitor_get_scale_factor | 3.22 | Gets the internal scale factor that maps from monitor coordinates to the actual device pixels. On traditional systems this is 1, but on very high d... |
| get_subpixel_layout | `Monitor.get_subpixel_layout() -> SubpixelLayout` | gdk_monitor_get_subpixel_layout | 3.22 | Gets information about the layout of red, green and blue primaries for each pixel in this monitor, if available. |
| get_width_mm | `Monitor.get_width_mm() -> gint` | gdk_monitor_get_width_mm | 3.22 | Gets the width in millimeters of the monitor. |
| get_workarea | `Monitor.get_workarea(workarea: out Rectangle) -> none` | gdk_monitor_get_workarea | 3.22 | Retrieves the size and position of the ???work area??? on a monitor within the display coordinate space. The returned geometry is in ???application... |
| is_primary | `Monitor.is_primary() -> gboolean` | gdk_monitor_is_primary | 3.22 | Gets whether this monitor should be considered primary (see gdk_display_get_primary_monitor()). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only |  |
| geometry | Rectangle | read |  |
| height-mm | gint | read |  |
| manufacturer | utf8 | read |  |
| model | utf8 | read |  |
| refresh-rate | gint | read |  |
| scale-factor | gint | read |  |
| subpixel-layout | SubpixelLayout | read |  |
| width-mm | gint | read |  |
| workarea | Rectangle | read |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| invalidate | `` | none | first |  |  |

### Gdk.Screen

Parent: `GObject.Object` ?? GType: `GdkScreen` ?? C type: `GdkScreen`

#GdkScreen objects are the GDK representation of the screen on which windows can be displayed and on which the pointer moves. X originally identifi...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Screen` | gdk_screen_get_default | 2.2 | Gets the default screen for the default display. (See gdk_display_get_default ()). |
| height | `height() -> gint` | gdk_screen_height |  | Gets the height of the default screen in pixels. The returned size is in ???application pixels???, not in ???device pixels??? (see gdk_screen_get_m... |
| height_mm | `height_mm() -> gint` | gdk_screen_height_mm |  | Returns the height of the default screen in millimeters. Note that on many X servers this value will not be correct. |
| width | `width() -> gint` | gdk_screen_width |  | Gets the width of the default screen in pixels. The returned size is in ???application pixels???, not in ???device pixels??? (see gdk_screen_get_mo... |
| width_mm | `width_mm() -> gint` | gdk_screen_width_mm |  | Returns the width of the default screen in millimeters. Note that on many X servers this value will not be correct. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_active_window | `Screen.get_active_window() -> Window` | gdk_screen_get_active_window | 2.10 | Returns the screen???s currently active window. On X11, this is done by inspecting the _NET_ACTIVE_WINDOW property on the root window, as described... |
| get_display | `Screen.get_display() -> Display` | gdk_screen_get_display | 2.2 | Gets the display to which the @screen belongs. |
| get_font_options | `Screen.get_font_options() -> cairo.FontOptions` | gdk_screen_get_font_options | 2.10 | Gets any options previously set with gdk_screen_set_font_options(). |
| get_height | `Screen.get_height() -> gint` | gdk_screen_get_height | 2.2 | Gets the height of @screen in pixels. The returned size is in ???application pixels???, not in ???device pixels??? (see gdk_screen_get_monitor_scal... |
| get_height_mm | `Screen.get_height_mm() -> gint` | gdk_screen_get_height_mm | 2.2 | Returns the height of @screen in millimeters. Note that this value is somewhat ill-defined when the screen has multiple monitors of different resol... |
| get_monitor_at_point | `Screen.get_monitor_at_point(x: gint, y: gint) -> gint` | gdk_screen_get_monitor_at_point | 2.2 | Returns the monitor number in which the point (@x,@y) is located. |
| get_monitor_at_window | `Screen.get_monitor_at_window(window: Window) -> gint` | gdk_screen_get_monitor_at_window | 2.2 | Returns the number of the monitor in which the largest area of the bounding rectangle of @window resides. |
| get_monitor_geometry | `Screen.get_monitor_geometry(monitor_num: gint, dest: out Rectangle?) -> none` | gdk_screen_get_monitor_geometry | 2.2 | Retrieves the #GdkRectangle representing the size and position of the individual monitor within the entire screen area. The returned geometry is in... |
| get_monitor_height_mm | `Screen.get_monitor_height_mm(monitor_num: gint) -> gint` | gdk_screen_get_monitor_height_mm | 2.14 | Gets the height in millimeters of the specified monitor. |
| get_monitor_plug_name | `Screen.get_monitor_plug_name(monitor_num: gint) -> utf8` | gdk_screen_get_monitor_plug_name | 2.14 | Returns the output name of the specified monitor. Usually something like VGA, DVI, or TV, not the actual product name of the display device. |
| get_monitor_scale_factor | `Screen.get_monitor_scale_factor(monitor_num: gint) -> gint` | gdk_screen_get_monitor_scale_factor | 3.10 | Returns the internal scale factor that maps from monitor coordinates to the actual device pixels. On traditional systems this is 1, but on very hig... |
| get_monitor_width_mm | `Screen.get_monitor_width_mm(monitor_num: gint) -> gint` | gdk_screen_get_monitor_width_mm | 2.14 | Gets the width in millimeters of the specified monitor, if available. |
| get_monitor_workarea | `Screen.get_monitor_workarea(monitor_num: gint, dest: out Rectangle?) -> none` | gdk_screen_get_monitor_workarea | 3.4 | Retrieves the #GdkRectangle representing the size and position of the ???work area??? on a monitor within the entire screen area. The returned geom... |
| get_n_monitors | `Screen.get_n_monitors() -> gint` | gdk_screen_get_n_monitors | 2.2 | Returns the number of monitors which @screen consists of. |
| get_number | `Screen.get_number() -> gint` | gdk_screen_get_number | 2.2 | Gets the index of @screen among the screens in the display to which it belongs. (See gdk_screen_get_display()) |
| get_primary_monitor | `Screen.get_primary_monitor() -> gint` | gdk_screen_get_primary_monitor | 2.20 | Gets the primary monitor for @screen. The primary monitor is considered the monitor where the ???main desktop??? lives. While normal application wi... |
| get_resolution | `Screen.get_resolution() -> gdouble` | gdk_screen_get_resolution | 2.10 | Gets the resolution for font handling on the screen; see gdk_screen_set_resolution() for full details. |
| get_rgba_visual | `Screen.get_rgba_visual() -> Visual` | gdk_screen_get_rgba_visual | 2.8 | Gets a visual to use for creating windows with an alpha channel. The windowing system on which GTK+ is running may not support this capability, in ... |
| get_root_window | `Screen.get_root_window() -> Window` | gdk_screen_get_root_window | 2.2 | Gets the root window of @screen. |
| get_setting | `Screen.get_setting(name: utf8, value: GObject.Value) -> gboolean` | gdk_screen_get_setting | 2.2 | Retrieves a desktop-wide setting such as double-click time for the #GdkScreen @screen. FIXME needs a list of valid settings here, or a link to more... |
| get_system_visual | `Screen.get_system_visual() -> Visual` | gdk_screen_get_system_visual | 2.2 | Get the system???s default visual for @screen. This is the visual for the root window of the display. The return value should not be freed. |
| get_toplevel_windows | `Screen.get_toplevel_windows() -> GLib.List` | gdk_screen_get_toplevel_windows | 2.2 | Obtains a list of all toplevel windows known to GDK on the screen @screen. A toplevel window is a child of the root window (see gdk_get_default_roo... |
| get_width | `Screen.get_width() -> gint` | gdk_screen_get_width | 2.2 | Gets the width of @screen in pixels. The returned size is in ???application pixels???, not in ???device pixels??? (see gdk_screen_get_monitor_scale... |
| get_width_mm | `Screen.get_width_mm() -> gint` | gdk_screen_get_width_mm | 2.2 | Gets the width of @screen in millimeters. Note that this value is somewhat ill-defined when the screen has multiple monitors of different resolutio... |
| get_window_stack | `Screen.get_window_stack() -> GLib.List` | gdk_screen_get_window_stack | 2.10 | Returns a #GList of #GdkWindows representing the current window stack. On X11, this is done by inspecting the _NET_CLIENT_LIST_STACKING property on... |
| is_composited | `Screen.is_composited() -> gboolean` | gdk_screen_is_composited | 2.10 | Returns whether windows with an RGBA visual can reasonably be expected to have their alpha channel drawn correctly on the screen. On X11 this funct... |
| list_visuals | `Screen.list_visuals() -> GLib.List` | gdk_screen_list_visuals | 2.2 | Lists the available visuals for the specified @screen. A visual describes a hardware image data format. For example, a visual might support 24-bit ... |
| make_display_name | `Screen.make_display_name() -> utf8` | gdk_screen_make_display_name | 2.2 | Determines the name to pass to gdk_display_open() to get a #GdkDisplay with this screen as the default screen. |
| set_font_options | `Screen.set_font_options(options: cairo.FontOptions?) -> none` | gdk_screen_set_font_options | 2.10 | Sets the default font options for the screen. These options will be set on any #PangoContext???s newly created with gdk_pango_context_get_for_scree... |
| set_resolution | `Screen.set_resolution(dpi: gdouble) -> none` | gdk_screen_set_resolution | 2.10 | Sets the resolution for font handling on the screen. This is a scale factor between points specified in a #PangoFontDescription and cairo units. Th... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| font-options | gpointer | read, write |  |
| resolution | gdouble | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| composited-changed | `` | none | last | 2.10 | The ::composited-changed signal is emitted when the composited status of the screen changes |
| monitors-changed | `` | none | last | 2.14 | The ::monitors-changed signal is emitted when the number, size or position of the monitors attached to the screen change. Only for X11 and OS X for... |
| size-changed | `` | none | last | 2.2 | The ::size-changed signal is emitted when the pixel width or height of a screen changes. |

### Gdk.Seat

Parent: `GObject.Object` ?? GType: `GdkSeat` ?? C type: `GdkSeat` ?? Abstract

The #GdkSeat object represents a collection of input devices that belong to a user.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_capabilities | `Seat.get_capabilities() -> SeatCapabilities` | gdk_seat_get_capabilities | 3.20 | Returns the capabilities this #GdkSeat currently has. |
| get_display | `Seat.get_display() -> Display` | gdk_seat_get_display |  | Returns the #GdkDisplay this seat belongs to. |
| get_keyboard | `Seat.get_keyboard() -> Device` | gdk_seat_get_keyboard | 3.20 | Returns the master device that routes keyboard events. |
| get_pointer | `Seat.get_pointer() -> Device` | gdk_seat_get_pointer | 3.20 | Returns the master device that routes pointer events. |
| get_slaves | `Seat.get_slaves(capabilities: SeatCapabilities) -> GLib.List` | gdk_seat_get_slaves | 3.20 | Returns the slave devices that match the given capabilities. |
| grab | `Seat.grab(window: Window, capabilities: SeatCapabilities, owner_events: gboolean, cursor: Cursor?, event: Event?, prepare_func: SeatGrabPrepareFunc?, prepare_func_data: gpointer?) -> GrabStatus` | gdk_seat_grab | 3.20 | Grabs the seat so that all events corresponding to the given @capabilities are passed to this application until the seat is ungrabbed with gdk_seat... |
| ungrab | `Seat.ungrab() -> none` | gdk_seat_ungrab | 3.20 | Releases a grab added through gdk_seat_grab(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only | #GdkDisplay of this seat. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| device-added | `device: Device` | none | last | 3.20 | The ::device-added signal is emitted when a new input device is related to this seat. |
| device-removed | `device: Device` | none | last | 3.20 | The ::device-removed signal is emitted when an input device is removed (e.g. unplugged). |
| tool-added | `tool: DeviceTool` | none | last | 3.22 | The ::tool-added signal is emitted whenever a new tool is made known to the seat. The tool may later be assigned to a device (i.e. on proximity wit... |
| tool-removed | `tool: DeviceTool` | none | last | 3.22 | This signal is emitted whenever a tool is no longer known to this @seat. |

### Gdk.Visual

Parent: `GObject.Object` ?? GType: `GdkVisual` ?? C type: `GdkVisual`

A #GdkVisual contains information about a particular visual.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_best | `get_best() -> Visual` | gdk_visual_get_best |  | Get the visual with the most available colors for the default GDK screen. The return value should not be freed. |
| get_best_depth | `get_best_depth() -> gint` | gdk_visual_get_best_depth |  | Get the best available depth for the default GDK screen. ???Best??? means ???largest,??? i.e. 32 preferred over 24 preferred over 8 bits per pixel. |
| get_best_type | `get_best_type() -> VisualType` | gdk_visual_get_best_type |  | Return the best available visual type for the default GDK screen. |
| get_best_with_both | `get_best_with_both(depth: gint, visual_type: VisualType) -> Visual` | gdk_visual_get_best_with_both |  | Combines gdk_visual_get_best_with_depth() and gdk_visual_get_best_with_type(). |
| get_best_with_depth | `get_best_with_depth(depth: gint) -> Visual` | gdk_visual_get_best_with_depth |  | Get the best visual with depth @depth for the default GDK screen. Color visuals and visuals with mutable colormaps are preferred over grayscale or ... |
| get_best_with_type | `get_best_with_type(visual_type: VisualType) -> Visual` | gdk_visual_get_best_with_type |  | Get the best visual of the given @visual_type for the default GDK screen. Visuals with higher color depths are considered better. The return value ... |
| get_system | `get_system() -> Visual` | gdk_visual_get_system |  | Get the system???s default visual for the default GDK screen. This is the visual for the root window of the display. The return value should not be... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_bits_per_rgb | `Visual.get_bits_per_rgb() -> gint` | gdk_visual_get_bits_per_rgb | 2.22 | Returns the number of significant bits per red, green and blue value. Not all GDK backend provide a meaningful value for this function. |
| get_blue_pixel_details | `Visual.get_blue_pixel_details(mask: out guint32?, shift: out gint?, precision: out gint?) -> none` | gdk_visual_get_blue_pixel_details | 2.22 | Obtains values that are needed to calculate blue pixel values in TrueColor and DirectColor. The ???mask??? is the significant bits within the pixel... |
| get_byte_order | `Visual.get_byte_order() -> ByteOrder` | gdk_visual_get_byte_order | 2.22 | Returns the byte order of this visual. The information returned by this function is only relevant when working with XImages, and not all backends r... |
| get_colormap_size | `Visual.get_colormap_size() -> gint` | gdk_visual_get_colormap_size | 2.22 | Returns the size of a colormap for this visual. You have to use platform-specific APIs to manipulate colormaps. |
| get_depth | `Visual.get_depth() -> gint` | gdk_visual_get_depth | 2.22 | Returns the bit depth of this visual. |
| get_green_pixel_details | `Visual.get_green_pixel_details(mask: out guint32?, shift: out gint?, precision: out gint?) -> none` | gdk_visual_get_green_pixel_details | 2.22 | Obtains values that are needed to calculate green pixel values in TrueColor and DirectColor. The ???mask??? is the significant bits within the pixe... |
| get_red_pixel_details | `Visual.get_red_pixel_details(mask: out guint32?, shift: out gint?, precision: out gint?) -> none` | gdk_visual_get_red_pixel_details | 2.22 | Obtains values that are needed to calculate red pixel values in TrueColor and DirectColor. The ???mask??? is the significant bits within the pixel.... |
| get_screen | `Visual.get_screen() -> Screen` | gdk_visual_get_screen | 2.2 | Gets the screen to which this visual belongs |
| get_visual_type | `Visual.get_visual_type() -> VisualType` | gdk_visual_get_visual_type | 2.22 | Returns the type of visual this is (PseudoColor, TrueColor, etc). |

### Gdk.Window

Parent: `GObject.Object` ?? GType: `GdkWindow` ?? C type: `GdkWindow` ?? Abstract

Creates a new #GdkWindow using the attributes from @attributes. See #GdkWindowAttr and #GdkWindowAttributesType for more details. Note: to use this...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Window.new(parent: Window?, attributes: WindowAttr, attributes_mask: WindowAttributesType) -> Window` | gdk_window_new |  | Creates a new #GdkWindow using the attributes from @attributes. See #GdkWindowAttr and #GdkWindowAttributesType for more details. Note: to use this... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| at_pointer | `at_pointer(win_x: out gint?, win_y: out gint?) -> Window` | gdk_window_at_pointer |  | Obtains the window underneath the mouse pointer, returning the location of that window in @win_x, @win_y. Returns %NULL if the window under the mou... |
| constrain_size | `constrain_size(geometry: Geometry, flags: WindowHints, width: gint, height: gint, new_width: out gint, new_height: out gint) -> none` | gdk_window_constrain_size |  | Constrains a desired width and height according to a set of geometry hints (such as minimum and maximum size). |
| process_all_updates | `process_all_updates() -> none` | gdk_window_process_all_updates |  | Calls gdk_window_process_updates() for all windows (see #GdkWindow) in the application. |
| set_debug_updates | `set_debug_updates(setting: gboolean) -> none` | gdk_window_set_debug_updates |  | With update debugging enabled, calls to gdk_window_invalidate_region() clear the invalidated region of the screen to a noticeable color, and GDK pa... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_filter | `Window.add_filter(function: FilterFunc, data: gpointer?) -> none` | gdk_window_add_filter |  | Adds an event filter to @window, allowing you to intercept events before they reach GDK. This is a low-level operation and makes it easy to break G... |
| beep | `Window.beep() -> none` | gdk_window_beep | 2.12 | Emits a short beep associated to @window in the appropriate display, if supported. Otherwise, emits a short beep on the display just as gdk_display... |
| begin_draw_frame | `Window.begin_draw_frame(region: cairo.Region) -> DrawingContext` | gdk_window_begin_draw_frame | 3.22 | Indicates that you are beginning the process of redrawing @region on @window, and provides you with a #GdkDrawingContext. If @window is a top level... |
| begin_move_drag | `Window.begin_move_drag(button: gint, root_x: gint, root_y: gint, timestamp: guint32) -> none` | gdk_window_begin_move_drag |  | Begins a window move operation (for a toplevel window). This function assumes that the drag is controlled by the client pointer device, use gdk_win... |
| begin_move_drag_for_device | `Window.begin_move_drag_for_device(device: Device, button: gint, root_x: gint, root_y: gint, timestamp: guint32) -> none` | gdk_window_begin_move_drag_for_device | 3.4 | Begins a window move operation (for a toplevel window). You might use this function to implement a ???window move grip,??? for example. The functio... |
| begin_paint_rect | `Window.begin_paint_rect(rectangle: Rectangle) -> none` | gdk_window_begin_paint_rect |  | A convenience wrapper around gdk_window_begin_paint_region() which creates a rectangular region for you. See gdk_window_begin_paint_region() for de... |
| begin_paint_region | `Window.begin_paint_region(region: cairo.Region) -> none` | gdk_window_begin_paint_region |  | Indicates that you are beginning the process of redrawing @region. A backing store (offscreen buffer) large enough to contain @region will be creat... |
| begin_resize_drag | `Window.begin_resize_drag(edge: WindowEdge, button: gint, root_x: gint, root_y: gint, timestamp: guint32) -> none` | gdk_window_begin_resize_drag |  | Begins a window resize operation (for a toplevel window). This function assumes that the drag is controlled by the client pointer device, use gdk_w... |
| begin_resize_drag_for_device | `Window.begin_resize_drag_for_device(edge: WindowEdge, device: Device, button: gint, root_x: gint, root_y: gint, timestamp: guint32) -> none` | gdk_window_begin_resize_drag_for_device | 3.4 | Begins a window resize operation (for a toplevel window). You might use this function to implement a ???window resize grip,??? for example; in fact... |
| configure_finished | `Window.configure_finished() -> none` | gdk_window_configure_finished | 2.6 | Does nothing, present only for compatiblity. |
| coords_from_parent | `Window.coords_from_parent(parent_x: gdouble, parent_y: gdouble, x: out gdouble?, y: out gdouble?) -> none` | gdk_window_coords_from_parent | 2.22 | Transforms window coordinates from a parent window to a child window, where the parent window is the normal parent as returned by gdk_window_get_pa... |
| coords_to_parent | `Window.coords_to_parent(x: gdouble, y: gdouble, parent_x: out gdouble?, parent_y: out gdouble?) -> none` | gdk_window_coords_to_parent | 2.22 | Transforms window coordinates from a child window to its parent window, where the parent window is the normal parent as returned by gdk_window_get_... |
| create_gl_context | `Window.create_gl_context() -> GLContext throws` | gdk_window_create_gl_context | 3.16 | Creates a new #GdkGLContext matching the framebuffer format to the visual of the #GdkWindow. The context is disconnected from any particular window... |
| create_similar_image_surface | `Window.create_similar_image_surface(format: cairo.Format, width: gint, height: gint, scale: gint) -> cairo.Surface` | gdk_window_create_similar_image_surface | 3.10 | Create a new image surface that is efficient to draw on the given @window. Initially the surface contents are all 0 (transparent if contents have t... |
| create_similar_surface | `Window.create_similar_surface(content: cairo.Content, width: gint, height: gint) -> cairo.Surface` | gdk_window_create_similar_surface | 2.22 | Create a new surface that is as compatible as possible with the given @window. For example the new surface will have the same fallback resolution a... |
| deiconify | `Window.deiconify() -> none` | gdk_window_deiconify |  | Attempt to deiconify (unminimize) @window. On X11 the window manager may choose to ignore the request to deiconify. When using GTK+, use gtk_window... |
| destroy | `Window.destroy() -> none` | gdk_window_destroy |  | Destroys the window system resources associated with @window and decrements @window's reference count. The window system resources for all children... |
| destroy_notify | `Window.destroy_notify() -> none` | gdk_window_destroy_notify |  |  |
| enable_synchronized_configure | `Window.enable_synchronized_configure() -> none` | gdk_window_enable_synchronized_configure | 2.6 | Does nothing, present only for compatiblity. |
| end_draw_frame | `Window.end_draw_frame(context: DrawingContext) -> none` | gdk_window_end_draw_frame | 3.22 | Indicates that the drawing of the contents of @window started with gdk_window_begin_frame() has been completed. This function will take care of des... |
| end_paint | `Window.end_paint() -> none` | gdk_window_end_paint |  | Indicates that the backing store created by the most recent call to gdk_window_begin_paint_region() should be copied onscreen and deleted, leaving ... |
| ensure_native | `Window.ensure_native() -> gboolean` | gdk_window_ensure_native | 2.18 | Tries to ensure that there is a window-system native window for this GdkWindow. This may fail in some situations, returning %FALSE. Offscreen windo... |
| flush | `Window.flush() -> none` | gdk_window_flush | 2.18 | This function does nothing. |
| focus | `Window.focus(timestamp: guint32) -> none` | gdk_window_focus |  | Sets keyboard focus to @window. In most cases, gtk_window_present_with_time() should be used on a #GtkWindow, rather than calling this function. |
| freeze_toplevel_updates_libgtk_only | `Window.freeze_toplevel_updates_libgtk_only() -> none` | gdk_window_freeze_toplevel_updates_libgtk_only |  | Temporarily freezes a window and all its descendants such that it won't receive expose events. The window will begin receiving expose events again ... |
| freeze_updates | `Window.freeze_updates() -> none` | gdk_window_freeze_updates |  | Temporarily freezes a window such that it won???t receive expose events. The window will begin receiving expose events again when gdk_window_thaw_u... |
| fullscreen | `Window.fullscreen() -> none` | gdk_window_fullscreen | 2.2 | Moves the window into fullscreen mode. This means the window covers the entire screen and is above any panels or task bars. If the window was alrea... |
| fullscreen_on_monitor | `Window.fullscreen_on_monitor(monitor: gint) -> none` | gdk_window_fullscreen_on_monitor |  | Moves the window into fullscreen mode on the given monitor. This means the window covers the entire screen and is above any panels or task bars. If... |
| geometry_changed | `Window.geometry_changed() -> none` | gdk_window_geometry_changed | 2.18 | This function informs GDK that the geometry of an embedded offscreen window has changed. This is necessary for GDK to keep track of which offscreen... |
| get_accept_focus | `Window.get_accept_focus() -> gboolean` | gdk_window_get_accept_focus | 2.22 | Determines whether or not the desktop environment shuld be hinted that the window does not want to receive input focus. |
| get_background_pattern | `Window.get_background_pattern() -> cairo.Pattern` | gdk_window_get_background_pattern | 2.22 | Gets the pattern used to clear the background on @window. |
| get_children | `Window.get_children() -> GLib.List` | gdk_window_get_children |  | Gets the list of children of @window known to GDK. This function only returns children created via GDK, so for example it???s useless when used wit... |
| get_children_with_user_data | `Window.get_children_with_user_data(user_data: gpointer?) -> GLib.List` | gdk_window_get_children_with_user_data | 3.10 | Gets the list of children of @window known to GDK with a particular @user_data set on it. The returned list must be freed, but the elements in the ... |
| get_clip_region | `Window.get_clip_region() -> cairo.Region` | gdk_window_get_clip_region |  | Computes the region of a window that potentially can be written to by drawing primitives. This region may not take into account other factors such ... |
| get_composited | `Window.get_composited() -> gboolean` | gdk_window_get_composited | 2.22 | Determines whether @window is composited. See gdk_window_set_composited(). |
| get_cursor | `Window.get_cursor() -> Cursor` | gdk_window_get_cursor | 2.18 | Retrieves a #GdkCursor pointer for the cursor currently set on the specified #GdkWindow, or %NULL. If the return value is %NULL then there is no cu... |
| get_decorations | `Window.get_decorations(decorations: out WMDecoration) -> gboolean` | gdk_window_get_decorations |  | Returns the decorations set on the GdkWindow with gdk_window_set_decorations(). |
| get_device_cursor | `Window.get_device_cursor(device: Device) -> Cursor` | gdk_window_get_device_cursor | 3.0 | Retrieves a #GdkCursor pointer for the @device currently set on the specified #GdkWindow, or %NULL. If the return value is %NULL then there is no c... |
| get_device_events | `Window.get_device_events(device: Device) -> EventMask` | gdk_window_get_device_events | 3.0 | Returns the event mask for @window corresponding to an specific device. |
| get_device_position | `Window.get_device_position(device: Device, x: out gint?, y: out gint?, mask: out ModifierType?) -> Window` | gdk_window_get_device_position | 3.0 | Obtains the current device position and modifier state. The position is given in coordinates relative to the upper left corner of @window. Use gdk_... |
| get_device_position_double | `Window.get_device_position_double(device: Device, x: out gdouble?, y: out gdouble?, mask: out ModifierType?) -> Window` | gdk_window_get_device_position_double | 3.10 | Obtains the current device position in doubles and modifier state. The position is given in coordinates relative to the upper left corner of @window. |
| get_display | `Window.get_display() -> Display` | gdk_window_get_display | 2.24 | Gets the #GdkDisplay associated with a #GdkWindow. |
| get_drag_protocol | `Window.get_drag_protocol(target: out Window?) -> DragProtocol` | gdk_window_get_drag_protocol | 3.0 | Finds out the DND protocol supported by a window. |
| get_effective_parent | `Window.get_effective_parent() -> Window` | gdk_window_get_effective_parent | 2.22 | Obtains the parent of @window, as known to GDK. Works like gdk_window_get_parent() for normal windows, but returns the window???s embedder for offs... |
| get_effective_toplevel | `Window.get_effective_toplevel() -> Window` | gdk_window_get_effective_toplevel | 2.22 | Gets the toplevel window that???s an ancestor of @window. Works like gdk_window_get_toplevel(), but treats an offscreen window's embedder as its pa... |
| get_event_compression | `Window.get_event_compression() -> gboolean` | gdk_window_get_event_compression | 3.12 | Get the current event compression setting for this window. |
| get_events | `Window.get_events() -> EventMask` | gdk_window_get_events |  | Gets the event mask for @window for all master input devices. See gdk_window_set_events(). |
| get_focus_on_map | `Window.get_focus_on_map() -> gboolean` | gdk_window_get_focus_on_map | 2.22 | Determines whether or not the desktop environment should be hinted that the window does not want to receive input focus when it is mapped. |
| get_frame_clock | `Window.get_frame_clock() -> FrameClock` | gdk_window_get_frame_clock | 3.8 | Gets the frame clock for the window. The frame clock for a window never changes unless the window is reparented to a new toplevel window. |
| get_frame_extents | `Window.get_frame_extents(rect: out Rectangle) -> none` | gdk_window_get_frame_extents |  | Obtains the bounding box of the window, including window manager titlebar/borders if any. The frame position is given in root window coordinates. T... |
| get_fullscreen_mode | `Window.get_fullscreen_mode() -> FullscreenMode` | gdk_window_get_fullscreen_mode | 3.8 | Obtains the #GdkFullscreenMode of the @window. |
| get_geometry | `Window.get_geometry(x: out gint?, y: out gint?, width: out gint?, height: out gint?) -> none` | gdk_window_get_geometry |  | Any of the return location arguments to this function may be %NULL, if you aren???t interested in getting the value of that field. The X and Y coor... |
| get_group | `Window.get_group() -> Window` | gdk_window_get_group | 2.4 | Returns the group leader window for @window. See gdk_window_set_group(). |
| get_height | `Window.get_height() -> gint` | gdk_window_get_height | 2.24 | Returns the height of the given @window. On the X11 platform the returned size is the size reported in the most-recently-processed configure event,... |
| get_modal_hint | `Window.get_modal_hint() -> gboolean` | gdk_window_get_modal_hint | 2.22 | Determines whether or not the window manager is hinted that @window has modal behaviour. |
| get_origin | `Window.get_origin(x: out gint?, y: out gint?) -> gint` | gdk_window_get_origin |  | Obtains the position of a window in root window coordinates. (Compare with gdk_window_get_position() and gdk_window_get_geometry() which return the... |
| get_parent | `Window.get_parent() -> Window` | gdk_window_get_parent |  | Obtains the parent of @window, as known to GDK. Does not query the X server; thus this returns the parent as passed to gdk_window_new(), not the ac... |
| get_pass_through | `Window.get_pass_through() -> gboolean` | gdk_window_get_pass_through | 3.18 | Returns whether input to the window is passed through to the window below. See gdk_window_set_pass_through() for details |
| get_pointer | `Window.get_pointer(x: out gint?, y: out gint?, mask: out ModifierType?) -> Window` | gdk_window_get_pointer |  | Obtains the current pointer position and modifier state. The position is given in coordinates relative to the upper left corner of @window. |
| get_position | `Window.get_position(x: out gint?, y: out gint?) -> none` | gdk_window_get_position |  | Obtains the position of the window as reported in the most-recently-processed #GdkEventConfigure. Contrast with gdk_window_get_geometry() which que... |
| get_root_coords | `Window.get_root_coords(x: gint, y: gint, root_x: out gint, root_y: out gint) -> none` | gdk_window_get_root_coords | 2.18 | Obtains the position of a window position in root window coordinates. This is similar to gdk_window_get_origin() but allows you to pass in any posi... |
| get_root_origin | `Window.get_root_origin(x: out gint, y: out gint) -> none` | gdk_window_get_root_origin |  | Obtains the top-left corner of the window manager frame in root window coordinates. |
| get_scale_factor | `Window.get_scale_factor() -> gint` | gdk_window_get_scale_factor | 3.10 | Returns the internal scale factor that maps from window coordiantes to the actual device pixels. On traditional systems this is 1, but on very high... |
| get_screen | `Window.get_screen() -> Screen` | gdk_window_get_screen | 2.24 | Gets the #GdkScreen associated with a #GdkWindow. |
| get_source_events | `Window.get_source_events(source: InputSource) -> EventMask` | gdk_window_get_source_events |  | Returns the event mask for @window corresponding to the device class specified by @source. |
| get_state | `Window.get_state() -> WindowState` | gdk_window_get_state |  | Gets the bitwise OR of the currently active window state flags, from the #GdkWindowState enumeration. |
| get_support_multidevice | `Window.get_support_multidevice() -> gboolean` | gdk_window_get_support_multidevice | 3.0 | Returns %TRUE if the window is aware of the existence of multiple devices. |
| get_toplevel | `Window.get_toplevel() -> Window` | gdk_window_get_toplevel |  | Gets the toplevel window that???s an ancestor of @window. Any window type but %GDK_WINDOW_CHILD is considered a toplevel window, as is a %GDK_WINDO... |
| get_type_hint | `Window.get_type_hint() -> WindowTypeHint` | gdk_window_get_type_hint | 2.10 | This function returns the type hint set for a window. |
| get_update_area | `Window.get_update_area() -> cairo.Region` | gdk_window_get_update_area |  | Transfers ownership of the update area from @window to the caller of the function. That is, after calling this function, @window will no longer hav... |
| get_user_data | `Window.get_user_data(data: out gpointer?) -> none` | gdk_window_get_user_data |  | Retrieves the user data for @window, which is normally the widget that @window belongs to. See gdk_window_set_user_data(). |
| get_visible_region | `Window.get_visible_region() -> cairo.Region` | gdk_window_get_visible_region |  | Computes the region of the @window that is potentially visible. This does not necessarily take into account if the window is obscured by other wind... |
| get_visual | `Window.get_visual() -> Visual` | gdk_window_get_visual | 2.24 | Gets the #GdkVisual describing the pixel format of @window. |
| get_width | `Window.get_width() -> gint` | gdk_window_get_width | 2.24 | Returns the width of the given @window. On the X11 platform the returned size is the size reported in the most-recently-processed configure event, ... |
| get_window_type | `Window.get_window_type() -> WindowType` | gdk_window_get_window_type |  | Gets the type of the window. See #GdkWindowType. |
| has_native | `Window.has_native() -> gboolean` | gdk_window_has_native | 2.22 | Checks whether the window has a native window or not. Note that you can use gdk_window_ensure_native() if a native window is needed. |
| hide | `Window.hide() -> none` | gdk_window_hide |  | For toplevel windows, withdraws them, so they will no longer be known to the window manager; for all windows, unmaps them, so they won???t be displ... |
| iconify | `Window.iconify() -> none` | gdk_window_iconify |  | Asks to iconify (minimize) @window. The window manager may choose to ignore the request, but normally will honor it. Using gtk_window_iconify() is ... |
| input_shape_combine_region | `Window.input_shape_combine_region(shape_region: cairo.Region, offset_x: gint, offset_y: gint) -> none` | gdk_window_input_shape_combine_region | 2.10 | Like gdk_window_shape_combine_region(), but the shape applies only to event handling. Mouse events which happen while the pointer position correspo... |
| invalidate_maybe_recurse | `Window.invalidate_maybe_recurse(region: cairo.Region, child_func: WindowChildFunc?, user_data: gpointer?) -> none` | gdk_window_invalidate_maybe_recurse |  | Adds @region to the update area for @window. The update area is the region that needs to be redrawn, or ???dirty region.??? The call gdk_window_pro... |
| invalidate_rect | `Window.invalidate_rect(rect: Rectangle?, invalidate_children: gboolean) -> none` | gdk_window_invalidate_rect |  | A convenience wrapper around gdk_window_invalidate_region() which invalidates a rectangular region. See gdk_window_invalidate_region() for details. |
| invalidate_region | `Window.invalidate_region(region: cairo.Region, invalidate_children: gboolean) -> none` | gdk_window_invalidate_region |  | Adds @region to the update area for @window. The update area is the region that needs to be redrawn, or ???dirty region.??? The call gdk_window_pro... |
| is_destroyed | `Window.is_destroyed() -> gboolean` | gdk_window_is_destroyed | 2.18 | Check to see if a window is destroyed.. |
| is_input_only | `Window.is_input_only() -> gboolean` | gdk_window_is_input_only | 2.22 | Determines whether or not the window is an input only window. |
| is_shaped | `Window.is_shaped() -> gboolean` | gdk_window_is_shaped | 2.22 | Determines whether or not the window is shaped. |
| is_viewable | `Window.is_viewable() -> gboolean` | gdk_window_is_viewable |  | Check if the window and all ancestors of the window are mapped. (This is not necessarily "viewable" in the X sense, since we only check as far as w... |
| is_visible | `Window.is_visible() -> gboolean` | gdk_window_is_visible |  | Checks whether the window has been mapped (with gdk_window_show() or gdk_window_show_unraised()). |
| lower | `Window.lower() -> none` | gdk_window_lower |  | Lowers @window to the bottom of the Z-order (stacking order), so that other windows with the same parent window appear above @window. This is true ... |
| mark_paint_from_clip | `Window.mark_paint_from_clip(cr: cairo.Context) -> none` | gdk_window_mark_paint_from_clip | 3.16 | If you call this during a paint (e.g. between gdk_window_begin_paint_region() and gdk_window_end_paint() then GDK will mark the current clip region... |
| maximize | `Window.maximize() -> none` | gdk_window_maximize |  | Maximizes the window. If the window was already maximized, then this function does nothing. On X11, asks the window manager to maximize @window, if... |
| merge_child_input_shapes | `Window.merge_child_input_shapes() -> none` | gdk_window_merge_child_input_shapes | 2.10 | Merges the input shape masks for any child windows into the input shape mask for @window. i.e. the union of all input masks for @window and its chi... |
| merge_child_shapes | `Window.merge_child_shapes() -> none` | gdk_window_merge_child_shapes |  | Merges the shape masks for any child windows into the shape mask for @window. i.e. the union of all masks for @window and its children will become ... |
| move | `Window.move(x: gint, y: gint) -> none` | gdk_window_move |  | Repositions a window relative to its parent window. For toplevel windows, window managers may ignore or modify the move; you should probably use gt... |
| move_region | `Window.move_region(region: cairo.Region, dx: gint, dy: gint) -> none` | gdk_window_move_region | 2.8 | Move the part of @window indicated by @region by @dy pixels in the Y direction and @dx pixels in the X direction. The portions of @region that not ... |
| move_resize | `Window.move_resize(x: gint, y: gint, width: gint, height: gint) -> none` | gdk_window_move_resize |  | Equivalent to calling gdk_window_move() and gdk_window_resize(), except that both operations are performed at once, avoiding strange visual effects... |
| move_to_rect | `Window.move_to_rect(rect: Rectangle, rect_anchor: Gravity, window_anchor: Gravity, anchor_hints: AnchorHints, rect_anchor_dx: gint, rect_anchor_dy: gint) -> none` | gdk_window_move_to_rect | 3.24 | Moves @window to @rect, aligning their anchor points. @rect is relative to the top-left corner of the window that @window is transient for. @rect_a... |
| peek_children | `Window.peek_children() -> GLib.List` | gdk_window_peek_children |  | Like gdk_window_get_children(), but does not copy the list of children, so the list does not need to be freed. |
| process_updates | `Window.process_updates(update_children: gboolean) -> none` | gdk_window_process_updates |  | Sends one or more expose events to @window. The areas in each expose event will cover the entire update area for the window (see gdk_window_invalid... |
| raise | `Window.raise() -> none` | gdk_window_raise |  | Raises @window to the top of the Z-order (stacking order), so that other windows with the same parent window appear below @window. This is true whe... |
| register_dnd | `Window.register_dnd() -> none` | gdk_window_register_dnd |  | Registers a window as a potential drop destination. |
| remove_filter | `Window.remove_filter(function: FilterFunc, data: gpointer?) -> none` | gdk_window_remove_filter |  | Remove a filter previously added with gdk_window_add_filter(). |
| reparent | `Window.reparent(new_parent: Window, x: gint, y: gint) -> none` | gdk_window_reparent |  | Reparents @window into the given @new_parent. The window being reparented will be unmapped as a side effect. |
| resize | `Window.resize(width: gint, height: gint) -> none` | gdk_window_resize |  | Resizes @window; for toplevel windows, asks the window manager to resize the window. The window manager may not allow the resize. When using GTK+, ... |
| restack | `Window.restack(sibling: Window?, above: gboolean) -> none` | gdk_window_restack | 2.18 | Changes the position of @window in the Z-order (stacking order), so that it is above @sibling (if @above is %TRUE) or below @sibling (if @above is ... |
| scroll | `Window.scroll(dx: gint, dy: gint) -> none` | gdk_window_scroll |  | Scroll the contents of @window, both pixels and children, by the given amount. @window itself does not move. Portions of the window that the scroll... |
| set_accept_focus | `Window.set_accept_focus(accept_focus: gboolean) -> none` | gdk_window_set_accept_focus | 2.4 | Setting @accept_focus to %FALSE hints the desktop environment that the window doesn???t want to receive input focus. On X, it is the responsibility... |
| set_background | `Window.set_background(color: Color) -> none` | gdk_window_set_background |  | Sets the background color of @window. However, when using GTK+, influence the background of a widget using a style class or CSS ??? if you???re an ... |
| set_background_pattern | `Window.set_background_pattern(pattern: cairo.Pattern?) -> none` | gdk_window_set_background_pattern |  | Sets the background of @window. A background of %NULL means that the window won't have any background. On the X11 backend it's also possible to inh... |
| set_background_rgba | `Window.set_background_rgba(rgba: RGBA) -> none` | gdk_window_set_background_rgba |  | Sets the background color of @window. See also gdk_window_set_background_pattern(). |
| set_child_input_shapes | `Window.set_child_input_shapes() -> none` | gdk_window_set_child_input_shapes | 2.10 | Sets the input shape mask of @window to the union of input shape masks for all children of @window, ignoring the input shape mask of @window itself... |
| set_child_shapes | `Window.set_child_shapes() -> none` | gdk_window_set_child_shapes |  | Sets the shape mask of @window to the union of shape masks for all children of @window, ignoring the shape mask of @window itself. Contrast with gd... |
| set_composited | `Window.set_composited(composited: gboolean) -> none` | gdk_window_set_composited | 2.12 | Sets a #GdkWindow as composited, or unsets it. Composited windows do not automatically have their contents drawn to the screen. Drawing is redirect... |
| set_cursor | `Window.set_cursor(cursor: Cursor?) -> none` | gdk_window_set_cursor |  | Sets the default mouse pointer for a #GdkWindow. Note that @cursor must be for the same display as @window. Use gdk_cursor_new_for_display() or gdk... |
| set_decorations | `Window.set_decorations(decorations: WMDecoration) -> none` | gdk_window_set_decorations |  | ???Decorations??? are the features the window manager adds to a toplevel #GdkWindow. This function sets the traditional Motif window manager hints ... |
| set_device_cursor | `Window.set_device_cursor(device: Device, cursor: Cursor) -> none` | gdk_window_set_device_cursor | 3.0 | Sets a specific #GdkCursor for a given device when it gets inside @window. Use gdk_cursor_new_for_display() or gdk_cursor_new_from_pixbuf() to crea... |
| set_device_events | `Window.set_device_events(device: Device, event_mask: EventMask) -> none` | gdk_window_set_device_events | 3.0 | Sets the event mask for a given device (Normally a floating device, not attached to any visible pointer) to @window. For example, an event mask inc... |
| set_event_compression | `Window.set_event_compression(event_compression: gboolean) -> none` | gdk_window_set_event_compression | 3.12 | Determines whether or not extra unprocessed motion events in the event queue can be discarded. If %TRUE only the most recent event will be delivere... |
| set_events | `Window.set_events(event_mask: EventMask) -> none` | gdk_window_set_events |  | The event mask for a window determines which events will be reported for that window from all master input devices. For example, an event mask incl... |
| set_focus_on_map | `Window.set_focus_on_map(focus_on_map: gboolean) -> none` | gdk_window_set_focus_on_map | 2.6 | Setting @focus_on_map to %FALSE hints the desktop environment that the window doesn???t want to receive input focus when it is mapped. focus_on_map... |
| set_fullscreen_mode | `Window.set_fullscreen_mode(mode: FullscreenMode) -> none` | gdk_window_set_fullscreen_mode | 3.8 | Specifies whether the @window should span over all monitors (in a multi-head setup) or only the current monitor when in fullscreen mode. The @mode ... |
| set_functions | `Window.set_functions(functions: WMFunction) -> none` | gdk_window_set_functions |  | Sets hints about the window management functions to make available via buttons on the window frame. On the X backend, this function sets the tradit... |
| set_geometry_hints | `Window.set_geometry_hints(geometry: Geometry, geom_mask: WindowHints) -> none` | gdk_window_set_geometry_hints |  | Sets the geometry hints for @window. Hints flagged in @geom_mask are set, hints not flagged in @geom_mask are unset. To unset all hints, use a @geo... |
| set_group | `Window.set_group(leader: Window?) -> none` | gdk_window_set_group |  | Sets the group leader window for @window. By default, GDK sets the group leader for all toplevel windows to a global window implicitly created by G... |
| set_icon_list | `Window.set_icon_list(pixbufs: GLib.List) -> none` | gdk_window_set_icon_list |  | Sets a list of icons for the window. One of these will be used to represent the window when it has been iconified. The icon is usually shown in an ... |
| set_icon_name | `Window.set_icon_name(name: utf8?) -> none` | gdk_window_set_icon_name |  | Windows may have a name used while minimized, distinct from the name they display in their titlebar. Most of the time this is a bad idea from a use... |
| set_invalidate_handler | `Window.set_invalidate_handler(handler: WindowInvalidateHandlerFunc) -> none` | gdk_window_set_invalidate_handler | 3.10 | Registers an invalidate handler for a specific window. This will get called whenever a region in the window or its children is invalidated. This ca... |
| set_keep_above | `Window.set_keep_above(setting: gboolean) -> none` | gdk_window_set_keep_above | 2.4 | Set if @window must be kept above other windows. If the window was already above, then this function does nothing. On X11, asks the window manager ... |
| set_keep_below | `Window.set_keep_below(setting: gboolean) -> none` | gdk_window_set_keep_below | 2.4 | Set if @window must be kept below other windows. If the window was already below, then this function does nothing. On X11, asks the window manager ... |
| set_modal_hint | `Window.set_modal_hint(modal: gboolean) -> none` | gdk_window_set_modal_hint |  | The application can use this hint to tell the window manager that a certain window has modal behaviour. The window manager can use this information... |
| set_opacity | `Window.set_opacity(opacity: gdouble) -> none` | gdk_window_set_opacity | 2.12 | Set @window to render as partially transparent, with opacity 0 being fully transparent and 1 fully opaque. (Values of the opacity parameter are cla... |
| set_opaque_region | `Window.set_opaque_region(region: cairo.Region?) -> none` | gdk_window_set_opaque_region | 3.10 | For optimisation purposes, compositing window managers may like to not draw obscured regions of windows, or turn off blending during for these regi... |
| set_override_redirect | `Window.set_override_redirect(override_redirect: gboolean) -> none` | gdk_window_set_override_redirect |  | An override redirect window is not under the control of the window manager. This means it won???t have a titlebar, won???t be minimizable, etc. - i... |
| set_pass_through | `Window.set_pass_through(pass_through: gboolean) -> none` | gdk_window_set_pass_through | 3.18 | Sets whether input to the window is passed through to the window below. The default value of this is %FALSE, which means that pointer events that h... |
| set_role | `Window.set_role(role: utf8) -> none` | gdk_window_set_role |  | When using GTK+, typically you should use gtk_window_set_role() instead of this low-level function. The window manager and session manager use a wi... |
| set_shadow_width | `Window.set_shadow_width(left: gint, right: gint, top: gint, bottom: gint) -> none` | gdk_window_set_shadow_width | 3.12 | Newer GTK+ windows using client-side decorations use extra geometry around their frames for effects like shadows and invisible borders. Window mana... |
| set_skip_pager_hint | `Window.set_skip_pager_hint(skips_pager: gboolean) -> none` | gdk_window_set_skip_pager_hint | 2.2 | Toggles whether a window should appear in a pager (workspace switcher, or other desktop utility program that displays a small thumbnail representat... |
| set_skip_taskbar_hint | `Window.set_skip_taskbar_hint(skips_taskbar: gboolean) -> none` | gdk_window_set_skip_taskbar_hint | 2.2 | Toggles whether a window should appear in a task list or window list. If a window???s semantic type as specified with gdk_window_set_type_hint() al... |
| set_source_events | `Window.set_source_events(source: InputSource, event_mask: EventMask) -> none` | gdk_window_set_source_events | 3.0 | Sets the event mask for any floating device (i.e. not attached to any visible pointer) that has the source defined as @source. This event mask will... |
| set_startup_id | `Window.set_startup_id(startup_id: utf8) -> none` | gdk_window_set_startup_id | 2.12 | When using GTK+, typically you should use gtk_window_set_startup_id() instead of this low-level function. |
| set_static_gravities | `Window.set_static_gravities(use_static: gboolean) -> gboolean` | gdk_window_set_static_gravities |  | Used to set the bit gravity of the given window to static, and flag it so all children get static subwindow gravity. This is used if you are implem... |
| set_support_multidevice | `Window.set_support_multidevice(support_multidevice: gboolean) -> none` | gdk_window_set_support_multidevice | 3.0 | This function will enable multidevice features in @window. Multidevice aware windows will need to handle properly multiple, per device enter/leave ... |
| set_title | `Window.set_title(title: utf8) -> none` | gdk_window_set_title |  | Sets the title of a toplevel window, to be displayed in the titlebar. If you haven???t explicitly set the icon name for the window (using gdk_windo... |
| set_transient_for | `Window.set_transient_for(parent: Window) -> none` | gdk_window_set_transient_for |  | Indicates to the window manager that @window is a transient dialog associated with the application window @parent. This allows the window manager t... |
| set_type_hint | `Window.set_type_hint(hint: WindowTypeHint) -> none` | gdk_window_set_type_hint |  | The application can use this call to provide a hint to the window manager about the functionality of a window. The window manager can use this info... |
| set_urgency_hint | `Window.set_urgency_hint(urgent: gboolean) -> none` | gdk_window_set_urgency_hint | 2.8 | Toggles whether a window needs the user's urgent attention. |
| set_user_data | `Window.set_user_data(user_data: GObject.Object?) -> none` | gdk_window_set_user_data |  | For most purposes this function is deprecated in favor of g_object_set_data(). However, for historical reasons GTK+ stores the #GtkWidget that owns... |
| shape_combine_region | `Window.shape_combine_region(shape_region: cairo.Region?, offset_x: gint, offset_y: gint) -> none` | gdk_window_shape_combine_region |  | Makes pixels in @window outside @shape_region be transparent, so that the window may be nonrectangular. If @shape_region is %NULL, the shape will b... |
| show | `Window.show() -> none` | gdk_window_show |  | Like gdk_window_show_unraised(), but also raises the window to the top of the window stack (moves the window to the front of the Z-order). This fun... |
| show_unraised | `Window.show_unraised() -> none` | gdk_window_show_unraised |  | Shows a #GdkWindow onscreen, but does not modify its stacking order. In contrast, gdk_window_show() will raise the window to the top of the window ... |
| show_window_menu | `Window.show_window_menu(event: Event) -> gboolean` | gdk_window_show_window_menu | 3.14 | Asks the windowing system to show the window menu. The window menu is the menu shown when right-clicking the titlebar on traditional windows manage... |
| stick | `Window.stick() -> none` | gdk_window_stick |  | ???Pins??? a window such that it???s on all workspaces and does not scroll with viewports, for window managers that have scrollable viewports. (Whe... |
| thaw_toplevel_updates_libgtk_only | `Window.thaw_toplevel_updates_libgtk_only() -> none` | gdk_window_thaw_toplevel_updates_libgtk_only |  | Thaws a window frozen with gdk_window_freeze_toplevel_updates_libgtk_only(). This function is not part of the GDK public API and is only for use by... |
| thaw_updates | `Window.thaw_updates() -> none` | gdk_window_thaw_updates |  | Thaws a window frozen with gdk_window_freeze_updates(). |
| unfullscreen | `Window.unfullscreen() -> none` | gdk_window_unfullscreen | 2.2 | Moves the window out of fullscreen mode. If the window was not fullscreen, does nothing. On X11, asks the window manager to move @window out of the... |
| unmaximize | `Window.unmaximize() -> none` | gdk_window_unmaximize |  | Unmaximizes the window. If the window wasn???t maximized, then this function does nothing. On X11, asks the window manager to unmaximize @window, i... |
| unstick | `Window.unstick() -> none` | gdk_window_unstick |  | Reverse operation for gdk_window_stick(); see gdk_window_stick(), and gtk_window_unstick(). |
| withdraw | `Window.withdraw() -> none` | gdk_window_withdraw |  | Withdraws a window (unmaps it and asks the window manager to forget about it). This function is not really useful as gdk_window_hide() automaticall... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cursor | Cursor | read, write | The mouse pointer for a #GdkWindow. See gdk_window_set_cursor() and gdk_window_get_cursor() for details. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| create-surface | `width: gint, height: gint` | cairo.Surface | last | 3.0 | The ::create-surface signal is emitted when an offscreen window needs its surface (re)created, which happens either when the window is first drawn ... |
| from-embedder | `embedder_x: gdouble, embedder_y: gdouble, offscreen_x: out gdouble, offscreen_y: out gdouble` | none | last | 2.18 | The ::from-embedder signal is emitted to translate coordinates in the embedder of an offscreen window to the offscreen window. See also #GdkWindow:... |
| moved-to-rect | `flipped_rect: gpointer?, final_rect: gpointer?, flipped_x: gboolean, flipped_y: gboolean` | none | first | 3.22 | Emitted when the position of @window is finalized after being moved to a destination rectangle. @window might be flipped over the destination recta... |
| pick-embedded-child | `x: gdouble, y: gdouble` | Window | last | 2.18 | The ::pick-embedded-child signal is emitted to find an embedded child at the given position. |
| to-embedder | `offscreen_x: gdouble, offscreen_y: gdouble, embedder_x: out gdouble, embedder_y: out gdouble` | none | last | 2.18 | The ::to-embedder signal is emitted to translate coordinates in an offscreen window to its embedder. See also #GdkWindow::from-embedder. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_surface | `create_surface(width: gint, height: gint) -> cairo.Surface` |  |  |  |
| from_embedder | `from_embedder(embedder_x: gdouble, embedder_y: gdouble, offscreen_x: gdouble, offscreen_y: gdouble) -> none` |  |  |  |
| pick_embedded_child | `pick_embedded_child(x: gdouble, y: gdouble) -> Window` |  |  |  |
| to_embedder | `to_embedder(offscreen_x: gdouble, offscreen_y: gdouble, embedder_x: gdouble, embedder_y: gdouble) -> none` |  |  |  |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DevicePad |  | 0 | 0 | 4 | #GdkDevicePad is an interface implemented by devices of type %GDK_SOURCE_TABLET_PAD, it allows querying the features provided by the pad device. Ta... |

### Gdk.DevicePad

GType: `GdkDevicePad` ?? C type: `GdkDevicePad`

#GdkDevicePad is an interface implemented by devices of type %GDK_SOURCE_TABLET_PAD, it allows querying the features provided by the pad device. Ta...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_feature_group | `DevicePad.get_feature_group(feature: DevicePadFeature, feature_idx: gint) -> gint` | gdk_device_pad_get_feature_group | 3.22 | Returns the group the given @feature and @idx belong to, or -1 if feature/index do not exist in @pad. |
| get_group_n_modes | `DevicePad.get_group_n_modes(group_idx: gint) -> gint` | gdk_device_pad_get_group_n_modes | 3.22 | Returns the number of modes that @group may have. |
| get_n_features | `DevicePad.get_n_features(feature: DevicePadFeature) -> gint` | gdk_device_pad_get_n_features | 3.22 | Returns the number of features a tablet pad has. |
| get_n_groups | `DevicePad.get_n_groups() -> gint` | gdk_device_pad_get_n_groups | 3.22 | Returns the number of groups this pad device has. Pads have at least one group. A pad group is a subcollection of buttons/strip/rings that is affec... |

## Enums

### Gdk.AxisUse

GType: `GdkAxisUse` ?? C type: `GdkAxisUse`

An enumeration describing the way in which a device axis (valuator) maps onto the predefined valuator types that GTK+ understands. Note that the X ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| distance | 7 | distance | the axis is used for pen/tablet distance information. (Since: 3.22) |
| ignore | 0 | ignore | the axis is ignored. |
| last | 10 | last | a constant equal to the numerically highest axis value. |
| pressure | 3 | pressure | the axis is used for pressure information. |
| rotation | 8 | rotation | the axis is used for pen rotation information. (Since: 3.22) |
| slider | 9 | slider | the axis is used for pen slider information. (Since: 3.22) |
| wheel | 6 | wheel | the axis is used for wheel information. |
| x | 1 | x | the axis is used as the x axis. |
| xtilt | 4 | xtilt | the axis is used for x tilt information. |
| y | 2 | y | the axis is used as the y axis. |
| ytilt | 5 | ytilt | the axis is used for y tilt information. |

### Gdk.ByteOrder

GType: `GdkByteOrder` ?? C type: `GdkByteOrder`

A set of values describing the possible byte-orders for storing pixel values in memory.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lsb_first | 0 | lsb-first | The values are stored with the least-significant byte first. For instance, the 32-bit value 0xffeecc would be stored in memory as 0xcc, 0xee, 0xff,... |
| msb_first | 1 | msb-first | The values are stored with the most-significant byte first. For instance, the 32-bit value 0xffeecc would be stored in memory as 0x00, 0xff, 0xee, ... |

### Gdk.CrossingMode

GType: `GdkCrossingMode` ?? C type: `GdkCrossingMode`

Specifies the crossing mode for #GdkEventCrossing.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| device_switch | 8 | device-switch | crossing because of a device switch (i.e. a mouse taking control of the pointer after a touch device), this event is synthetic as the pointer didn?... |
| grab | 1 | grab | crossing because a grab is activated. |
| gtk_grab | 3 | gtk-grab | crossing because a GTK+ grab is activated. |
| gtk_ungrab | 4 | gtk-ungrab | crossing because a GTK+ grab is deactivated. |
| normal | 0 | normal | crossing because of pointer motion. |
| state_changed | 5 | state-changed | crossing because a GTK+ widget changed state (e.g. sensitivity). |
| touch_begin | 6 | touch-begin | crossing because a touch sequence has begun, this event is synthetic as the pointer might have not left the window. |
| touch_end | 7 | touch-end | crossing because a touch sequence has ended, this event is synthetic as the pointer might have not left the window. |
| ungrab | 2 | ungrab | crossing because a grab is deactivated. |

### Gdk.CursorType

GType: `GdkCursorType` ?? C type: `GdkCursorType`

Predefined cursors. Note that these IDs are directly taken from the X cursor font, and many of these cursors are either not useful, or are not avai...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| arrow | 2 | arrow | ! |
| based_arrow_down | 4 | based-arrow-down | ! |
| based_arrow_up | 6 | based-arrow-up | ! |
| blank_cursor | -2 | blank-cursor | Blank cursor. Since 2.16 |
| boat | 8 | boat | ! |
| bogosity | 10 | bogosity | ! |
| bottom_left_corner | 12 | bottom-left-corner | ! |
| bottom_right_corner | 14 | bottom-right-corner | ! |
| bottom_side | 16 | bottom-side | ! |
| bottom_tee | 18 | bottom-tee | ! |
| box_spiral | 20 | box-spiral | ! |
| center_ptr | 22 | center-ptr | ! |
| circle | 24 | circle | ! |
| clock | 26 | clock | ! |
| coffee_mug | 28 | coffee-mug | ! |
| cross | 30 | cross | ! |
| cross_reverse | 32 | cross-reverse | ! |
| crosshair | 34 | crosshair | ! |
| cursor_is_pixmap | -1 | cursor-is-pixmap | type of cursors constructed with gdk_cursor_new_from_pixbuf() |
| diamond_cross | 36 | diamond-cross | ! |
| dot | 38 | dot | ! |
| dotbox | 40 | dotbox | ! |
| double_arrow | 42 | double-arrow | ! |
| draft_large | 44 | draft-large | ! |
| draft_small | 46 | draft-small | ! |
| draped_box | 48 | draped-box | ! |
| exchange | 50 | exchange | ! |
| fleur | 52 | fleur | ! |
| gobbler | 54 | gobbler | ! |
| gumby | 56 | gumby | ! |
| hand1 | 58 | hand1 | ! |
| hand2 | 60 | hand2 | ! |
| heart | 62 | heart | ! |
| icon | 64 | icon | ! |
| iron_cross | 66 | iron-cross | ! |
| last_cursor | 153 | last-cursor | last cursor type |
| left_ptr | 68 | left-ptr | ! |
| left_side | 70 | left-side | ! |
| left_tee | 72 | left-tee | ! |
| leftbutton | 74 | leftbutton | ! |
| ll_angle | 76 | ll-angle | ! |
| lr_angle | 78 | lr-angle | ! |
| man | 80 | man | ! |
| middlebutton | 82 | middlebutton | ! |
| mouse | 84 | mouse | ! |
| pencil | 86 | pencil | ! |
| pirate | 88 | pirate | ! |
| plus | 90 | plus | ! |
| question_arrow | 92 | question-arrow | ! |
| right_ptr | 94 | right-ptr | ! |
| right_side | 96 | right-side | ! |
| right_tee | 98 | right-tee | ! |
| rightbutton | 100 | rightbutton | ! |
| rtl_logo | 102 | rtl-logo | ! |
| sailboat | 104 | sailboat | ! |
| sb_down_arrow | 106 | sb-down-arrow | ! |
| sb_h_double_arrow | 108 | sb-h-double-arrow | ! |
| sb_left_arrow | 110 | sb-left-arrow | ! |
| sb_right_arrow | 112 | sb-right-arrow | ! |
| sb_up_arrow | 114 | sb-up-arrow | ! |
| sb_v_double_arrow | 116 | sb-v-double-arrow | ! |
| shuttle | 118 | shuttle | ! |
| sizing | 120 | sizing | ! |
| spider | 122 | spider | ! |
| spraycan | 124 | spraycan | ! |
| star | 126 | star | ! |
| target | 128 | target | ! |
| tcross | 130 | tcross | ! |
| top_left_arrow | 132 | top-left-arrow | ! |
| top_left_corner | 134 | top-left-corner | ! |
| top_right_corner | 136 | top-right-corner | ! |
| top_side | 138 | top-side | ! |
| top_tee | 140 | top-tee | ! |
| trek | 142 | trek | ! |
| ul_angle | 144 | ul-angle | ! |
| umbrella | 146 | umbrella | ! |
| ur_angle | 148 | ur-angle | ! |
| watch | 150 | watch | ! |
| x_cursor | 0 | x-cursor | ! |
| xterm | 152 | xterm | ! |

### Gdk.DevicePadFeature

GType: `GdkDevicePadFeature` ?? C type: `GdkDevicePadFeature`

A pad feature.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| button | 0 | button | a button |
| ring | 1 | ring | a ring-shaped interactive area |
| strip | 2 | strip | a straight interactive area |

### Gdk.DeviceToolType

GType: `GdkDeviceToolType` ?? C type: `GdkDeviceToolType`

Indicates the specific type of tool being used being a tablet. Such as an airbrush, pencil, etc.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| airbrush | 5 | airbrush | Tool is an airbrush stylus. |
| brush | 3 | brush | Tool is a brush stylus. |
| eraser | 2 | eraser | Tool is standard tablet eraser. |
| lens | 7 | lens | Tool is a lens cursor. |
| mouse | 6 | mouse | Tool is a mouse. |
| pen | 1 | pen | Tool is a standard tablet stylus. |
| pencil | 4 | pencil | Tool is a pencil stylus. |
| unknown | 0 | unknown | Tool is of an unknown type. |

### Gdk.DeviceType

GType: `GdkDeviceType` ?? C type: `GdkDeviceType`

Indicates the device type. See [above][GdkDeviceManager.description] for more information about the meaning of these device types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| floating | 2 | floating | Device is a physical device, currently not attached to any virtual device. |
| master | 0 | master | Device is a master (or virtual) device. There will be an associated focus indicator on the screen. |
| slave | 1 | slave | Device is a slave (or physical) device. |

### Gdk.DragCancelReason

GType: `GdkDragCancelReason` ?? C type: `GdkDragCancelReason`

Used in #GdkDragContext to the reason of a cancelled DND operation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error | 2 | error | Unspecified error. |
| no_target | 0 | no-target | There is no suitable drop target. |
| user_cancelled | 1 | user-cancelled | Drag cancelled by the user |

### Gdk.DragProtocol

GType: `GdkDragProtocol` ?? C type: `GdkDragProtocol`

Used in #GdkDragContext to indicate the protocol according to which DND is done.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| local | 6 | local | Intra-application DND. |
| motif | 1 | motif | The Motif DND protocol. No longer supported |
| none | 0 | none | no protocol. |
| ole2 | 5 | ole2 | The complex OLE2 DND protocol (not implemented). |
| rootwin | 3 | rootwin | An extension to the Xdnd protocol for unclaimed root window drops. |
| wayland | 7 | wayland | Wayland DND protocol. |
| win32_dropfiles | 4 | win32-dropfiles | The simple WM_DROPFILES protocol. |
| xdnd | 2 | xdnd | The Xdnd protocol. |

### Gdk.EventType

GType: `GdkEventType` ?? C type: `GdkEventType`

Specifies the type of the event. Do not confuse these events with the signals that GTK+ widgets emit. Although many of these events result in corre...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| 2button_press | 5 | 2button-press | a mouse button has been double-clicked (clicked twice within a short period of time). Note that each click also generates a %GDK_BUTTON_PRESS event. |
| 3button_press | 6 | 3button-press | a mouse button has been clicked 3 times in a short period of time. Note that each click also generates a %GDK_BUTTON_PRESS event. |
| button_press | 4 | button-press | a mouse button has been pressed. |
| button_release | 7 | button-release | a mouse button has been released. |
| client_event | 28 | client-event | a message has been received from another application. |
| configure | 13 | configure | the size, position or stacking order of the window has changed. Note that GTK+ discards these events for %GDK_WINDOW_CHILD windows. |
| damage | 36 | damage | the content of the window has been changed. This event type was added in 2.14. |
| delete | 0 | delete | the window manager has requested that the toplevel window be hidden or destroyed, usually when the user clicks on a special icon in the title bar. |
| destroy | 1 | destroy | the window has been destroyed. |
| double_button_press | 5 | double-button-press | alias for %GDK_2BUTTON_PRESS, added in 3.6. |
| drag_enter | 22 | drag-enter | the mouse has entered the window while a drag is in progress. |
| drag_leave | 23 | drag-leave | the mouse has left the window while a drag is in progress. |
| drag_motion | 24 | drag-motion | the mouse has moved in the window while a drag is in progress. |
| drag_status | 25 | drag-status | the status of the drag operation initiated by the window has changed. |
| drop_finished | 27 | drop-finished | the drop operation initiated by the window has completed. |
| drop_start | 26 | drop-start | a drop operation onto the window has started. |
| enter_notify | 10 | enter-notify | the pointer has entered the window. |
| event_last | 48 | event-last | marks the end of the GdkEventType enumeration. Added in 2.18 |
| expose | 2 | expose | all or part of the window has become visible and needs to be redrawn. |
| focus_change | 12 | focus-change | the keyboard focus has entered or left the window. |
| grab_broken | 35 | grab-broken | a pointer or keyboard grab was broken. This event type was added in 2.8. |
| key_press | 8 | key-press | a key has been pressed. |
| key_release | 9 | key-release | a key has been released. |
| leave_notify | 11 | leave-notify | the pointer has left the window. |
| map | 14 | map | the window has been mapped. |
| motion_notify | 3 | motion-notify | the pointer (usually a mouse) has moved. |
| nothing | -1 | nothing | a special code to indicate a null event. |
| owner_change | 34 | owner-change | the owner of a selection has changed. This event type was added in 2.6 |
| pad_button_press | 43 | pad-button-press | A tablet pad button press event. This event type was added in 3.22. |
| pad_button_release | 44 | pad-button-release | A tablet pad button release event. This event type was added in 3.22. |
| pad_group_mode | 47 | pad-group-mode | A tablet pad group mode change. This event type was added in 3.22. |
| pad_ring | 45 | pad-ring | A tablet pad axis event from a "ring". This event type was added in 3.22. |
| pad_strip | 46 | pad-strip | A tablet pad axis event from a "strip". This event type was added in 3.22. |
| property_notify | 16 | property-notify | a property on the window has been changed or deleted. |
| proximity_in | 20 | proximity-in | an input device has moved into contact with a sensing surface (e.g. a touchscreen or graphics tablet). |
| proximity_out | 21 | proximity-out | an input device has moved out of contact with a sensing surface. |
| scroll | 31 | scroll | the scroll wheel was turned |
| selection_clear | 17 | selection-clear | the application has lost ownership of a selection. |
| selection_notify | 19 | selection-notify | a selection has been received. |
| selection_request | 18 | selection-request | another application has requested a selection. |
| setting | 33 | setting | a setting has been modified. |
| touch_begin | 37 | touch-begin | A new touch event sequence has just started. This event type was added in 3.4. |
| touch_cancel | 40 | touch-cancel | A touch event sequence has been canceled. This event type was added in 3.4. |
| touch_end | 39 | touch-end | A touch event sequence has finished. This event type was added in 3.4. |
| touch_update | 38 | touch-update | A touch event sequence has been updated. This event type was added in 3.4. |
| touchpad_pinch | 42 | touchpad-pinch | A touchpad pinch gesture event, the current state is determined by its phase field. This event type was added in 3.18. |
| touchpad_swipe | 41 | touchpad-swipe | A touchpad swipe gesture event, the current state is determined by its phase field. This event type was added in 3.18. |
| triple_button_press | 6 | triple-button-press | alias for %GDK_3BUTTON_PRESS, added in 3.6. |
| unmap | 15 | unmap | the window has been unmapped. |
| visibility_notify | 29 | visibility-notify | the window visibility status has changed. |
| window_state | 32 | window-state | the state of a window has changed. See #GdkWindowState for the possible window states |

### Gdk.FilterReturn

GType: `GdkFilterReturn` ?? C type: `GdkFilterReturn`

Specifies the result of applying a #GdkFilterFunc to a native event.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| continue | 0 | continue | event not handled, continue processing. |
| remove | 2 | remove | event handled, terminate processing. |
| translate | 1 | translate | native event translated into a GDK event and stored in the `event` structure that was passed in. |

### Gdk.FullscreenMode

GType: `GdkFullscreenMode` ?? C type: `GdkFullscreenMode`

Indicates which monitor (in a multi-head setup) a window should span over when in fullscreen mode.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_monitors | 1 | all-monitors | Span across all monitors when fullscreen. |
| current_monitor | 0 | current-monitor | Fullscreen on current monitor only. |

### Gdk.GLError

GType: `GdkGLError` ?? C type: `GdkGLError`

Error enumeration for #GdkGLContext.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| not_available | 0 | not-available | OpenGL support is not available |
| unsupported_format | 1 | unsupported-format | The requested visual format is not supported |
| unsupported_profile | 2 | unsupported-profile | The requested profile is not supported |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gdk_gl_error_quark |  |  |

### Gdk.GrabOwnership

GType: `GdkGrabOwnership` ?? C type: `GdkGrabOwnership`

Defines how device grabs interact with other devices.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| application | 2 | application | Other devices??? events are blocked for the whole application. |
| none | 0 | none | All other devices??? events are allowed. |
| window | 1 | window | Other devices??? events are blocked for the grab window. |

### Gdk.GrabStatus

GType: `GdkGrabStatus` ?? C type: `GdkGrabStatus`

Returned by gdk_device_grab(), gdk_pointer_grab() and gdk_keyboard_grab() to indicate success or the reason for the failure of the grab attempt.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| already_grabbed | 1 | already-grabbed | the resource is actively grabbed by another client. |
| failed | 5 | failed | the grab failed for some other reason. Since 3.16 |
| frozen | 4 | frozen | the resource is frozen by an active grab of another client. |
| invalid_time | 2 | invalid-time | the resource was grabbed more recently than the specified time. |
| not_viewable | 3 | not-viewable | the grab window or the @confine_to window are not viewable. |
| success | 0 | success | the resource was successfully grabbed. |

### Gdk.Gravity

GType: `GdkGravity` ?? C type: `GdkGravity`

Defines the reference point of a window and the meaning of coordinates passed to gtk_window_move(). See gtk_window_move() and the "implementation n...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| center | 5 | center | the reference point is at the center of the window. |
| east | 6 | east | the reference point is at the middle of the right edge. |
| north | 2 | north | the reference point is in the middle of the top edge. |
| north_east | 3 | north-east | the reference point is at the top right corner. |
| north_west | 1 | north-west | the reference point is at the top left corner. |
| south | 8 | south | the reference point is at the middle of the lower edge. |
| south_east | 9 | south-east | the reference point is at the lower right corner. |
| south_west | 7 | south-west | the reference point is at the lower left corner. |
| static | 10 | static | the reference point is at the top left corner of the window itself, ignoring window manager decorations. |
| west | 4 | west | the reference point is at the middle of the left edge. |

### Gdk.InputMode

GType: `GdkInputMode` ?? C type: `GdkInputMode`

An enumeration that describes the mode of an input device.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| disabled | 0 | disabled | the device is disabled and will not report any events. |
| screen | 1 | screen | the device is enabled. The device???s coordinate space maps to the entire screen. |
| window | 2 | window | the device is enabled. The device???s coordinate space is mapped to a single window. The manner in which this window is chosen is undefined, but it... |

### Gdk.InputSource

GType: `GdkInputSource` ?? C type: `GdkInputSource`

An enumeration describing the type of an input device in general terms.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cursor | 3 | cursor | the device is a graphics tablet ???puck??? or similar device. |
| eraser | 2 | eraser | the device is an eraser. Typically, this would be the other end of a stylus on a graphics tablet. |
| keyboard | 4 | keyboard | the device is a keyboard. |
| mouse | 0 | mouse | the device is a mouse. (This will be reported for the core pointer, even if it is something else, such as a trackball.) |
| pen | 1 | pen | the device is a stylus of a graphics tablet or similar device. |
| tablet_pad | 8 | tablet-pad | the device is a "pad", a collection of buttons, rings and strips found in drawing tablets. This device type has been added in 3.22. |
| touchpad | 6 | touchpad | the device is an indirect touch device, such as a touchpad. This device type has been added in 3.4. |
| touchscreen | 5 | touchscreen | the device is a direct-input touch device, such as a touchscreen or tablet. This device type has been added in 3.4. |
| trackpoint | 7 | trackpoint | the device is a trackpoint. This device type has been added in 3.22 |

### Gdk.ModifierIntent

GType: `GdkModifierIntent` ?? C type: `GdkModifierIntent`

This enum is used with gdk_keymap_get_modifier_mask() in order to determine what modifiers the currently used windowing system backend uses for par...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| context_menu | 1 | context-menu | the modifier used to invoke context menus. Note that mouse button 3 always triggers context menus. When this modifier is not 0, it additionally tri... |
| default_mod_mask | 6 | default-mod-mask | The set of modifier masks accepted as modifiers in accelerators. Needed because Command is mapped to MOD2 on OSX, which is widely used, but on X11 ... |
| extend_selection | 2 | extend-selection | the modifier used to extend selections using `modifier`-click or `modifier`-cursor-key |
| modify_selection | 3 | modify-selection | the modifier used to modify selections, which in most cases means toggling the clicked item into or out of the selection. |
| no_text_input | 4 | no-text-input | when any of these modifiers is pressed, the key event cannot produce a symbol directly. This is meant to be used for input methods, and for use cas... |
| primary_accelerator | 0 | primary-accelerator | the primary modifier used to invoke menu accelerators. |
| shift_group | 5 | shift-group | the modifier that switches between keyboard groups (AltGr on X11/Windows and Option/Alt on OS X). |

### Gdk.NotifyType

GType: `GdkNotifyType` ?? C type: `GdkNotifyType`

Specifies the kind of crossing for #GdkEventCrossing. See the X11 protocol specification of LeaveNotify for full details of crossing event generation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ancestor | 0 | ancestor | the window is entered from an ancestor or left towards an ancestor. |
| inferior | 2 | inferior | the window is entered from an inferior or left towards an inferior. |
| nonlinear | 3 | nonlinear | the window is entered from or left towards a window which is neither an ancestor nor an inferior. |
| nonlinear_virtual | 4 | nonlinear-virtual | the pointer moves between two windows which are not ancestors of each other and the window is part of the ancestor chain between one of these windo... |
| unknown | 5 | unknown | an unknown type of enter/leave event occurred. |
| virtual | 1 | virtual | the pointer moves between an ancestor and an inferior of the window. |

### Gdk.OwnerChange

GType: `GdkOwnerChange` ?? C type: `GdkOwnerChange`

Specifies why a selection ownership was changed.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close | 2 | close | the client was closed |
| destroy | 1 | destroy | the window was destroyed |
| new_owner | 0 | new-owner | some other app claimed the ownership |

### Gdk.PropertyState

GType: `GdkPropertyState` ?? C type: `GdkPropertyState`

Specifies the type of a property change for a #GdkEventProperty.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| delete | 1 | delete | the property was deleted. |
| new_value | 0 | new-value | the property value was changed. |

### Gdk.PropMode

GType: `GdkPropMode` ?? C type: `GdkPropMode`

Describes how existing data is combined with new data when using gdk_property_change().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| append | 2 | append | the new data is appended to the existing data. |
| prepend | 1 | prepend | the new data is prepended to the existing data. |
| replace | 0 | replace | the new data replaces the existing data. |

### Gdk.ScrollDirection

GType: `GdkScrollDirection` ?? C type: `GdkScrollDirection`

Specifies the direction for #GdkEventScroll.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| down | 1 | down | the window is scrolled down. |
| left | 2 | left | the window is scrolled to the left. |
| right | 3 | right | the window is scrolled to the right. |
| smooth | 4 | smooth | the scrolling is determined by the delta values in #GdkEventScroll. See gdk_event_get_scroll_deltas(). Since: 3.4 |
| up | 0 | up | the window is scrolled up. |

### Gdk.SettingAction

GType: `GdkSettingAction` ?? C type: `GdkSettingAction`

Specifies the kind of modification applied to a setting in a #GdkEventSetting.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| changed | 1 | changed | a setting was changed. |
| deleted | 2 | deleted | a setting was deleted. |
| new | 0 | new | a setting was added. |

### Gdk.Status

GType: `GdkStatus` ?? C type: `GdkStatus`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error | -1 | error |  |
| error_file | -3 | error-file |  |
| error_mem | -4 | error-mem |  |
| error_param | -2 | error-param |  |
| ok | 0 | ok |  |

### Gdk.SubpixelLayout

GType: `GdkSubpixelLayout` ?? C type: `GdkSubpixelLayout`

This enumeration describes how the red, green and blue components of physical pixels on an output device are laid out.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| horizontal_bgr | 3 | horizontal-bgr | The layout is horizontal, the order is BGR |
| horizontal_rgb | 2 | horizontal-rgb | The layout is horizontal, the order is RGB |
| none | 1 | none | Not organized in this way |
| unknown | 0 | unknown | The layout is not known |
| vertical_bgr | 5 | vertical-bgr | The layout is vertical, the order is BGR |
| vertical_rgb | 4 | vertical-rgb | The layout is vertical, the order is RGB |

### Gdk.TouchpadGesturePhase

GType: `GdkTouchpadGesturePhase` ?? C type: `GdkTouchpadGesturePhase`

Specifies the current state of a touchpad gesture. All gestures are guaranteed to begin with an event with phase %GDK_TOUCHPAD_GESTURE_PHASE_BEGIN,...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| begin | 0 | begin | The gesture has begun. |
| cancel | 3 | cancel | The gesture was cancelled, all changes should be undone. |
| end | 2 | end | The gesture was finished, changes should be permanently applied. |
| update | 1 | update | The gesture has been updated. |

### Gdk.VisibilityState

GType: `GdkVisibilityState` ?? C type: `GdkVisibilityState`

Specifies the visiblity status of a window for a #GdkEventVisibility.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| fully_obscured | 2 | fully-obscured | the window is not visible at all. |
| partial | 1 | partial | the window is partially visible. |
| unobscured | 0 | unobscured | the window is completely visible. |

### Gdk.VisualType

GType: `GdkVisualType` ?? C type: `GdkVisualType`

A set of values that describe the manner in which the pixel values for a visual are converted into RGB values for display.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| direct_color | 5 | direct-color | Each pixel value contains red, green, and blue components as for %GDK_VISUAL_TRUE_COLOR, but the components are mapped via a color table into the f... |
| grayscale | 1 | grayscale | Each pixel is an index into a color map that maps pixel values into grayscale values. The color map can be changed by an application. |
| pseudo_color | 3 | pseudo-color | Each pixel is an index into a color map that maps pixel values into rgb values. The color map can be changed by an application. |
| static_color | 2 | static-color | Each pixel value is an index into a predefined, unmodifiable color map that maps pixel values into RGB values. |
| static_gray | 0 | static-gray | Each pixel value indexes a grayscale value directly. |
| true_color | 4 | true-color | Each pixel value directly contains red, green, and blue components. Use gdk_visual_get_red_pixel_details(), etc, to obtain information about how th... |

### Gdk.WindowEdge

GType: `GdkWindowEdge` ?? C type: `GdkWindowEdge`

Determines a window edge or corner.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| east | 4 | east | the right edge. |
| north | 1 | north | the top edge. |
| north_east | 2 | north-east | the top right corner. |
| north_west | 0 | north-west | the top left corner. |
| south | 6 | south | the lower edge. |
| south_east | 7 | south-east | the lower right corner. |
| south_west | 5 | south-west | the lower left corner. |
| west | 3 | west | the left edge. |

### Gdk.WindowType

GType: `GdkWindowType` ?? C type: `GdkWindowType`

Describes the kind of window.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| child | 2 | child | child window (used to implement e.g. #GtkEntry) |
| foreign | 4 | foreign | foreign window (see gdk_window_foreign_new()) |
| offscreen | 5 | offscreen | offscreen window (see [Offscreen Windows][OFFSCREEN-WINDOWS]). Since 2.18 |
| root | 0 | root | root window; this window has no parent, covers the entire screen, and is created by the window system |
| subsurface | 6 | subsurface | subsurface-based window; This window is visually tied to a toplevel, and is moved/stacked with it. Currently this window type is only implemented i... |
| temp | 3 | temp | override redirect temporary window (used to implement #GtkMenu) |
| toplevel | 1 | toplevel | toplevel window (used to implement #GtkWindow) |

### Gdk.WindowTypeHint

GType: `GdkWindowTypeHint` ?? C type: `GdkWindowTypeHint`

These are hints for the window manager that indicate what type of function the window has. The window manager can use this when determining decorat...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| combo | 12 | combo | A popup from a combo box. |
| desktop | 7 | desktop | Used for creating the desktop background window. |
| dialog | 1 | dialog | Dialog window. |
| dnd | 13 | dnd | A window that is used to implement a DND cursor. |
| dock | 6 | dock | Used for creating dock or panel windows. |
| dropdown_menu | 8 | dropdown-menu | A menu that belongs to a menubar. |
| menu | 2 | menu | Window used to implement a menu; GTK+ uses this hint only for torn-off menus, see #GtkTearoffMenuItem. |
| normal | 0 | normal | Normal toplevel window. |
| notification | 11 | notification | A notification - typically a ???bubble??? that belongs to a status icon. |
| popup_menu | 9 | popup-menu | A menu that does not belong to a menubar, e.g. a context menu. |
| splashscreen | 4 | splashscreen | Window used to display a splash screen during application startup. |
| toolbar | 3 | toolbar | Window used to implement toolbars. |
| tooltip | 10 | tooltip | A tooltip. |
| utility | 5 | utility | Utility windows which are not detached toolbars or dialogs. |

### Gdk.WindowWindowClass

GType: `GdkWindowWindowClass` ?? C type: `GdkWindowWindowClass`

@GDK_INPUT_OUTPUT windows are the standard kind of window you might expect. Such windows receive events and are also displayed on screen. @GDK_INPU...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| input_only | 1 | input-only | window for events only |
| input_output | 0 | input-output | window for graphics and events |

## Flags

### Gdk.AnchorHints

GType: `GdkAnchorHints` ?? C type: `GdkAnchorHints`

Positioning hints for aligning a window relative to a rectangle. These hints determine how the window should be positioned in the case that the win...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| flip | 3 | flip | allow flipping anchors on both axes |
| flip_x | 1 | flip-x | allow flipping anchors horizontally |
| flip_y | 2 | flip-y | allow flipping anchors vertically |
| resize | 48 | resize | allow resizing window on both axes |
| resize_x | 16 | resize-x | allow resizing window horizontally |
| resize_y | 32 | resize-y | allow resizing window vertically |
| slide | 12 | slide | allow sliding window on both axes |
| slide_x | 4 | slide-x | allow sliding window horizontally |
| slide_y | 8 | slide-y | allow sliding window vertically |

### Gdk.AxisFlags

GType: `GdkAxisFlags` ?? C type: `GdkAxisFlags`

Flags describing the current capabilities of a device/tool.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| distance | 128 | distance | Distance axis is present |
| pressure | 8 | pressure | Pressure axis is present |
| rotation | 256 | rotation | Z-axis rotation is present |
| slider | 512 | slider | Slider axis is present |
| wheel | 64 | wheel | Wheel axis is present |
| x | 2 | x | X axis is present |
| xtilt | 16 | xtilt | X tilt axis is present |
| y | 4 | y | Y axis is present |
| ytilt | 32 | ytilt | Y tilt axis is present |

### Gdk.DragAction

GType: `GdkDragAction` ?? C type: `GdkDragAction`

Used in #GdkDragContext to indicate what the destination should do with the dropped data.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ask | 32 | ask | Ask the user what to do with the data. |
| copy | 2 | copy | Copy the data. |
| default | 1 | default | Means nothing, and should not be used. |
| link | 8 | link | Add a link to the data. Note that this is only useful if source and destination agree on what it means. |
| move | 4 | move | Move the data, i.e. first copy it, then delete it from the source using the DELETE target of the X selection protocol. |
| private | 16 | private | Special action which tells the source that the destination will do something that the source doesn???t understand. |

### Gdk.EventMask

GType: `GdkEventMask` ?? C type: `GdkEventMask`

A set of bit-flags to indicate which events a window is to receive. Most of these masks map onto one or more of the #GdkEventType event types above...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_events_mask | 67108862 | all-events-mask | the combination of all the above event masks. |
| button1_motion_mask | 32 | button1-motion-mask | receive pointer motion events while 1 button is pressed |
| button2_motion_mask | 64 | button2-motion-mask | receive pointer motion events while 2 button is pressed |
| button3_motion_mask | 128 | button3-motion-mask | receive pointer motion events while 3 button is pressed |
| button_motion_mask | 16 | button-motion-mask | receive pointer motion events while any button is pressed |
| button_press_mask | 256 | button-press-mask | receive button press events |
| button_release_mask | 512 | button-release-mask | receive button release events |
| enter_notify_mask | 4096 | enter-notify-mask | receive window enter events |
| exposure_mask | 2 | exposure-mask | receive expose events |
| focus_change_mask | 16384 | focus-change-mask | receive focus change events |
| key_press_mask | 1024 | key-press-mask | receive key press events |
| key_release_mask | 2048 | key-release-mask | receive key release events |
| leave_notify_mask | 8192 | leave-notify-mask | receive window leave events |
| pointer_motion_hint_mask | 8 | pointer-motion-hint-mask | deprecated. see the explanation above |
| pointer_motion_mask | 4 | pointer-motion-mask | receive all pointer motion events |
| property_change_mask | 65536 | property-change-mask | receive property change events |
| proximity_in_mask | 262144 | proximity-in-mask | receive proximity in events |
| proximity_out_mask | 524288 | proximity-out-mask | receive proximity out events |
| scroll_mask | 2097152 | scroll-mask | receive scroll events |
| smooth_scroll_mask | 8388608 | smooth-scroll-mask | receive smooth scrolling events. Since 3.4 |
| structure_mask | 32768 | structure-mask | receive events about window configuration change |
| substructure_mask | 1048576 | substructure-mask | receive events about window configuration changes of child windows |
| tablet_pad_mask | 33554432 | tablet-pad-mask | receive tablet pad events. Since 3.22 |
| touch_mask | 4194304 | touch-mask | receive touch events. Since 3.4 |
| touchpad_gesture_mask | 16777216 | touchpad-gesture-mask | receive touchpad gesture events. Since 3.18 |
| visibility_notify_mask | 131072 | visibility-notify-mask | receive visibility change events |

### Gdk.FrameClockPhase

GType: `GdkFrameClockPhase` ?? C type: `GdkFrameClockPhase`

#GdkFrameClockPhase is used to represent the different paint clock phases that can be requested. The elements of the enumeration correspond to the ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after_paint | 64 | after-paint | corresponds to GdkFrameClock::after-paint. Should not be handled by applications. |
| before_paint | 2 | before-paint | corresponds to GdkFrameClock::before-paint. Should not be handled by applications. |
| flush_events | 1 | flush-events | corresponds to GdkFrameClock::flush-events. Should not be handled by applications. |
| layout | 8 | layout | corresponds to GdkFrameClock::layout. |
| none | 0 | none | no phase |
| paint | 16 | paint | corresponds to GdkFrameClock::paint. |
| resume_events | 32 | resume-events | corresponds to GdkFrameClock::resume-events. Should not be handled by applications. |
| update | 4 | update | corresponds to GdkFrameClock::update. |

### Gdk.ModifierType

GType: `GdkModifierType` ?? C type: `GdkModifierType`

A set of bit-flags to indicate the state of modifier keys and mouse buttons in various event types. Typical modifier keys are Shift, Control, Meta,...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| button1_mask | 256 | button1-mask | the first mouse button. |
| button2_mask | 512 | button2-mask | the second mouse button. |
| button3_mask | 1024 | button3-mask | the third mouse button. |
| button4_mask | 2048 | button4-mask | the fourth mouse button. |
| button5_mask | 4096 | button5-mask | the fifth mouse button. |
| control_mask | 4 | control-mask | the Control key. |
| hyper_mask | 134217728 | hyper-mask | the Hyper modifier. Since 2.10 |
| lock_mask | 2 | lock-mask | a Lock key (depending on the modifier mapping of the X server this may either be CapsLock or ShiftLock). |
| meta_mask | 268435456 | meta-mask | the Meta modifier. Since 2.10 |
| mod1_mask | 8 | mod1-mask | the fourth modifier key (it depends on the modifier mapping of the X server which key is interpreted as this modifier, but normally it is the Alt k... |
| mod2_mask | 16 | mod2-mask | the fifth modifier key (it depends on the modifier mapping of the X server which key is interpreted as this modifier). |
| mod3_mask | 32 | mod3-mask | the sixth modifier key (it depends on the modifier mapping of the X server which key is interpreted as this modifier). |
| mod4_mask | 64 | mod4-mask | the seventh modifier key (it depends on the modifier mapping of the X server which key is interpreted as this modifier). |
| mod5_mask | 128 | mod5-mask | the eighth modifier key (it depends on the modifier mapping of the X server which key is interpreted as this modifier). |
| modifier_mask | 1543512063 | modifier-mask | a mask covering all modifier types. |
| modifier_reserved_13_mask | 8192 | modifier-reserved-13-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_14_mask | 16384 | modifier-reserved-14-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_15_mask | 32768 | modifier-reserved-15-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_16_mask | 65536 | modifier-reserved-16-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_17_mask | 131072 | modifier-reserved-17-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_18_mask | 262144 | modifier-reserved-18-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_19_mask | 524288 | modifier-reserved-19-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_20_mask | 1048576 | modifier-reserved-20-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_21_mask | 2097152 | modifier-reserved-21-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_22_mask | 4194304 | modifier-reserved-22-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_23_mask | 8388608 | modifier-reserved-23-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_24_mask | 16777216 | modifier-reserved-24-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_25_mask | 33554432 | modifier-reserved-25-mask | A reserved bit flag; do not use in your own code |
| modifier_reserved_29_mask | 536870912 | modifier-reserved-29-mask | A reserved bit flag; do not use in your own code |
| release_mask | 1073741824 | release-mask | not used in GDK itself. GTK+ uses it to differentiate between (keyval, modifiers) pairs from key press and release events. |
| shift_mask | 1 | shift-mask | the Shift key. |
| super_mask | 67108864 | super-mask | the Super modifier. Since 2.10 |

### Gdk.SeatCapabilities

GType: `GdkSeatCapabilities` ?? C type: `GdkSeatCapabilities`

Flags describing the seat capabilities.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 15 | all | The union of all capabilities |
| all_pointing | 7 | all-pointing | The union of all pointing capabilities |
| keyboard | 8 | keyboard | The seat has keyboard(s) attached |
| none | 0 | none | No input capabilities |
| pointer | 1 | pointer | The seat has a pointer (e.g. mouse) |
| tablet_stylus | 4 | tablet-stylus | The seat has drawing tablet(s) attached |
| touch | 2 | touch | The seat has touchscreen(s) attached |

### Gdk.WindowAttributesType

GType: `GdkWindowAttributesType` ?? C type: `GdkWindowAttributesType`

Used to indicate which fields in the #GdkWindowAttr struct should be honored. For example, if you filled in the ???cursor??? and ???x??? fields of ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cursor | 16 | cursor | Honor the cursor field |
| noredir | 128 | noredir | Honor the override_redirect field |
| title | 2 | title | Honor the title field |
| type_hint | 256 | type-hint | Honor the type_hint field |
| visual | 32 | visual | Honor the visual field |
| wmclass | 64 | wmclass | Honor the wmclass_class and wmclass_name fields |
| x | 4 | x | Honor the X coordinate field |
| y | 8 | y | Honor the Y coordinate field |

### Gdk.WindowHints

GType: `GdkWindowHints` ?? C type: `GdkWindowHints`

Used to indicate which fields of a #GdkGeometry struct should be paid attention to. Also, the presence/absence of @GDK_HINT_POS, @GDK_HINT_USER_POS...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| aspect | 16 | aspect | aspect ratio fields are set |
| base_size | 8 | base-size | base size fields are set |
| max_size | 4 | max-size | max size fields are set |
| min_size | 2 | min-size | min size fields are set |
| pos | 1 | pos | indicates that the program has positioned the window |
| resize_inc | 32 | resize-inc | resize increment fields are set |
| user_pos | 128 | user-pos | indicates that the window???s position was explicitly set by the user |
| user_size | 256 | user-size | indicates that the window???s size was explicitly set by the user |
| win_gravity | 64 | win-gravity | window gravity field is set |

### Gdk.WindowState

GType: `GdkWindowState` ?? C type: `GdkWindowState`

Specifies the state of a toplevel window.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| above | 32 | above | the window is kept above other windows. |
| below | 64 | below | the window is kept below other windows. |
| bottom_resizable | 16384 | bottom-resizable | whether the bottom edge is resizable, Since 3.22.23 |
| bottom_tiled | 8192 | bottom-tiled | whether the bottom edge is tiled, Since 3.22.23 |
| focused | 128 | focused | the window is presented as focused (with active decorations). |
| fullscreen | 16 | fullscreen | the window is maximized without decorations. |
| iconified | 2 | iconified | the window is minimized. |
| left_resizable | 65536 | left-resizable | whether the left edge is resizable, Since 3.22.23 |
| left_tiled | 32768 | left-tiled | whether the left edge is tiled, Since 3.22.23 |
| maximized | 4 | maximized | the window is maximized. |
| right_resizable | 4096 | right-resizable | whether the right edge is resizable, Since 3.22.23 |
| right_tiled | 2048 | right-tiled | whether the right edge is tiled, Since 3.22.23 |
| sticky | 8 | sticky | the window is sticky. |
| tiled | 256 | tiled | the window is in a tiled state, Since 3.10. Since 3.22.23, this is deprecated in favor of per-edge information. |
| top_resizable | 1024 | top-resizable | whether the top edge is resizable, Since 3.22.23 |
| top_tiled | 512 | top-tiled | whether the top edge is tiled, Since 3.22.23 |
| withdrawn | 1 | withdrawn | the window is not shown. |

### Gdk.WMDecoration

GType: `GdkWMDecoration` ?? C type: `GdkWMDecoration`

These are hints originally defined by the Motif toolkit. The window manager can use them when determining how to decorate the window. The hint must...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 1 | all | all decorations should be applied. |
| border | 2 | border | a frame should be drawn around the window. |
| maximize | 64 | maximize | a maximize button should be included. |
| menu | 16 | menu | a button for opening a menu should be included. |
| minimize | 32 | minimize | a minimize button should be included. |
| resizeh | 4 | resizeh | the frame should have resize handles. |
| title | 8 | title | a titlebar should be placed above the window. |

### Gdk.WMFunction

GType: `GdkWMFunction` ?? C type: `GdkWMFunction`

These are hints originally defined by the Motif toolkit. The window manager can use them when determining the functions to offer for the window. Th...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 1 | all | all functions should be offered. |
| close | 32 | close | the window should be closable. |
| maximize | 16 | maximize | the window should be maximizable. |
| minimize | 8 | minimize | the window should be minimizable. |
| move | 4 | move | the window should be movable. |
| resize | 2 | resize | the window should be resizable. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Atom |  | 0 | 0 | 3 | An opaque type representing a string as an index into a table of strings on the X server. |
| Color |  | 0 | 0 | 6 | A #GdkColor is used to describe a color, similar to the XColor struct used in the X11 drawing API. |
| DevicePadInterface |  | 0 | 0 | 0 |  |
| DrawingContextClass |  | 0 | 0 | 0 |  |
| EventAny |  | 0 | 0 | 0 | Contains the fields which are common to all event structs. Any event pointer can safely be cast to a pointer to a #GdkEventAny to access these fields. |
| EventButton |  | 0 | 0 | 0 | Used for button press and button release events. The @type field will be one of %GDK_BUTTON_PRESS, %GDK_2BUTTON_PRESS, %GDK_3BUTTON_PRESS or %GDK_B... |
| EventConfigure |  | 0 | 0 | 0 | Generated when a window size or position has changed. |
| EventCrossing |  | 0 | 0 | 0 | Generated when the pointer enters or leaves a window. |
| EventDND |  | 0 | 0 | 0 | Generated during DND operations. |
| EventExpose |  | 0 | 0 | 0 | Generated when all or part of a window becomes visible and needs to be redrawn. |
| EventFocus |  | 0 | 0 | 0 | Describes a change of keyboard focus. |
| EventGrabBroken |  | 0 | 0 | 0 | Generated when a pointer or keyboard grab is broken. On X11, this happens when the grab window becomes unviewable (i.e. it or one of its ancestors ... |
| EventKey |  | 0 | 0 | 0 | Describes a key press or key release event. |
| EventMotion |  | 0 | 0 | 0 | Generated when the pointer moves. |
| EventOwnerChange |  | 0 | 0 | 0 | Generated when the owner of a selection changes. On X11, this information is only available if the X server supports the XFIXES extension. |
| EventPadAxis |  | 0 | 0 | 0 | Generated during %GDK_SOURCE_TABLET_PAD interaction with tactile sensors. |
| EventPadButton |  | 0 | 0 | 0 | Generated during %GDK_SOURCE_TABLET_PAD button presses and releases. |
| EventPadGroupMode |  | 0 | 0 | 0 | Generated during %GDK_SOURCE_TABLET_PAD mode switches in a group. |
| EventProperty |  | 0 | 0 | 0 | Describes a property change on a window. |
| EventProximity |  | 0 | 0 | 0 | Proximity events are generated when using GDK???s wrapper for the XInput extension. The XInput extension is an add-on for standard X that allows yo... |
| EventScroll |  | 0 | 0 | 0 | Generated from button presses for the buttons 4 to 7. Wheel mice are usually configured to generate button press events for buttons 4 and 5 when th... |
| EventSelection |  | 0 | 0 | 0 | Generated when a selection is requested or ownership of a selection is taken over by another client application. |
| EventSequence |  | 0 | 0 | 0 |  |
| EventSetting |  | 0 | 0 | 0 | Generated when a setting is modified. |
| EventTouch |  | 0 | 0 | 0 | Used for touch events. @type field will be one of %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE, %GDK_TOUCH_END or %GDK_TOUCH_CANCEL. Touch events are groupe... |
| EventTouchpadPinch |  | 0 | 0 | 0 | Generated during touchpad swipe gestures. |
| EventTouchpadSwipe |  | 0 | 0 | 0 | Generated during touchpad swipe gestures. |
| EventVisibility |  | 0 | 0 | 0 | Generated when the window visibility status has changed. |
| EventWindowState |  | 0 | 0 | 0 | Generated when the state of a toplevel window changes. |
| FrameClockClass |  | 0 | 0 | 0 |  |
| FrameClockPrivate |  | 0 | 0 | 0 |  |
| FrameTimings |  | 0 | 0 | 8 | A #GdkFrameTimings object holds timing information for a single frame of the application???s displays. To retrieve #GdkFrameTimings objects, use gd... |
| Geometry |  | 0 | 0 | 0 | The #GdkGeometry struct gives the window manager information about a window???s geometry constraints. Normally you would set these on the GTK+ leve... |
| KeymapKey |  | 0 | 0 | 0 | A #GdkKeymapKey is a hardware key that can be mapped to a keyval. |
| MonitorClass |  | 0 | 0 | 0 |  |
| Point |  | 0 | 0 | 0 | Defines the x and y coordinates of a point. |
| Rectangle |  | 0 | 0 | 3 | Defines the position and size of a rectangle. It is identical to #cairo_rectangle_int_t. |
| RGBA |  | 0 | 0 | 6 | A #GdkRGBA is used to represent a (possibly translucent) color, in a way that is compatible with cairo???s notion of color. |
| TimeCoord |  | 0 | 0 | 0 | A #GdkTimeCoord stores a single event in a motion history. |
| WindowAttr |  | 0 | 0 | 0 | Attributes to use for a newly-created window. |
| WindowClass |  | 0 | 0 | 0 |  |
| WindowRedirect |  | 0 | 0 | 0 |  |

### Gdk.Atom

C type: `GdkAtom`

An opaque type representing a string as an index into a table of strings on the X server.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| intern | `intern(atom_name: utf8, only_if_exists: gboolean) -> Atom` | gdk_atom_intern |  | Finds or creates an atom corresponding to a given string. |
| intern_static_string | `intern_static_string(atom_name: utf8) -> Atom` | gdk_atom_intern_static_string | 2.10 | Finds or creates an atom corresponding to a given string. Note that this function is identical to gdk_atom_intern() except that if a new #GdkAtom i... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| name | `Atom.name() -> utf8` | gdk_atom_name |  | Determines the string corresponding to an atom. |

### Gdk.Color

GType: `GdkColor` ?? C type: `GdkColor`

A #GdkColor is used to describe a color, similar to the XColor struct used in the X11 drawing API.

#### Fields

| Field | Type |
| --- | --- |
| blue | guint16 |
| green | guint16 |
| pixel | guint32 |
| red | guint16 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(spec: utf8, color: out Color) -> gboolean` | gdk_color_parse |  | Parses a textual specification of a color and fill in the @red, @green, and @blue fields of a #GdkColor. The string can either one of a large set o... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Color.copy() -> Color` | gdk_color_copy |  | Makes a copy of a #GdkColor. The result must be freed using gdk_color_free(). |
| equal | `Color.equal(colorb: Color) -> gboolean` | gdk_color_equal |  | Compares two colors. |
| free | `Color.free() -> none` | gdk_color_free |  | Frees a #GdkColor created with gdk_color_copy(). |
| hash | `Color.hash() -> guint` | gdk_color_hash |  | A hash function suitable for using for a hash table that stores #GdkColors. |
| to_string | `Color.to_string() -> utf8` | gdk_color_to_string | 2.12 | Returns a textual specification of @color in the hexadecimal form ???\#rrrrggggbbbb??? where ???r???, ???g??? and ???b??? are hex digits representi... |

### Gdk.DevicePadInterface

C type: `GdkDevicePadInterface`

### Gdk.DrawingContextClass

C type: `GdkDrawingContextClass`

### Gdk.EventAny

C type: `GdkEventAny`

Contains the fields which are common to all event structs. Any event pointer can safely be cast to a pointer to a #GdkEventAny to access these fields.

#### Fields

| Field | Type |
| --- | --- |
| send_event | gint8 |
| type | EventType |
| window | Window |

### Gdk.EventButton

C type: `GdkEventButton`

Used for button press and button release events. The @type field will be one of %GDK_BUTTON_PRESS, %GDK_2BUTTON_PRESS, %GDK_3BUTTON_PRESS or %GDK_B...

#### Fields

| Field | Type |
| --- | --- |
| axes | gdouble |
| button | guint |
| device | Device |
| send_event | gint8 |
| state | ModifierType |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventConfigure

C type: `GdkEventConfigure`

Generated when a window size or position has changed.

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| send_event | gint8 |
| type | EventType |
| width | gint |
| window | Window |
| x | gint |
| y | gint |

### Gdk.EventCrossing

C type: `GdkEventCrossing`

Generated when the pointer enters or leaves a window.

#### Fields

| Field | Type |
| --- | --- |
| detail | NotifyType |
| focus | gboolean |
| mode | CrossingMode |
| send_event | gint8 |
| state | ModifierType |
| subwindow | Window |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventDND

C type: `GdkEventDND`

Generated during DND operations.

#### Fields

| Field | Type |
| --- | --- |
| context | DragContext |
| send_event | gint8 |
| time | guint32 |
| type | EventType |
| window | Window |
| x_root | gshort |
| y_root | gshort |

### Gdk.EventExpose

C type: `GdkEventExpose`

Generated when all or part of a window becomes visible and needs to be redrawn.

#### Fields

| Field | Type |
| --- | --- |
| area | Rectangle |
| count | gint |
| region | cairo.Region |
| send_event | gint8 |
| type | EventType |
| window | Window |

### Gdk.EventFocus

C type: `GdkEventFocus`

Describes a change of keyboard focus.

#### Fields

| Field | Type |
| --- | --- |
| in | gint16 |
| send_event | gint8 |
| type | EventType |
| window | Window |

### Gdk.EventGrabBroken

C type: `GdkEventGrabBroken`

Generated when a pointer or keyboard grab is broken. On X11, this happens when the grab window becomes unviewable (i.e. it or one of its ancestors ...

#### Fields

| Field | Type |
| --- | --- |
| grab_window | Window |
| implicit | gboolean |
| keyboard | gboolean |
| send_event | gint8 |
| type | EventType |
| window | Window |

### Gdk.EventKey

C type: `GdkEventKey`

Describes a key press or key release event.

#### Fields

| Field | Type |
| --- | --- |
| group | guint8 |
| hardware_keycode | guint16 |
| is_modifier | guint |
| keyval | guint |
| length | gint |
| send_event | gint8 |
| state | ModifierType |
| string | utf8 |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventMotion

C type: `GdkEventMotion`

Generated when the pointer moves.

#### Fields

| Field | Type |
| --- | --- |
| axes | gdouble |
| device | Device |
| is_hint | gint16 |
| send_event | gint8 |
| state | ModifierType |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventOwnerChange

C type: `GdkEventOwnerChange`

Generated when the owner of a selection changes. On X11, this information is only available if the X server supports the XFIXES extension.

#### Fields

| Field | Type |
| --- | --- |
| owner | Window |
| reason | OwnerChange |
| selection | Atom |
| selection_time | guint32 |
| send_event | gint8 |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventPadAxis

C type: `GdkEventPadAxis`

Generated during %GDK_SOURCE_TABLET_PAD interaction with tactile sensors.

#### Fields

| Field | Type |
| --- | --- |
| group | guint |
| index | guint |
| mode | guint |
| send_event | gint8 |
| time | guint32 |
| type | EventType |
| value | gdouble |
| window | Window |

### Gdk.EventPadButton

C type: `GdkEventPadButton`

Generated during %GDK_SOURCE_TABLET_PAD button presses and releases.

#### Fields

| Field | Type |
| --- | --- |
| button | guint |
| group | guint |
| mode | guint |
| send_event | gint8 |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventPadGroupMode

C type: `GdkEventPadGroupMode`

Generated during %GDK_SOURCE_TABLET_PAD mode switches in a group.

#### Fields

| Field | Type |
| --- | --- |
| group | guint |
| mode | guint |
| send_event | gint8 |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventProperty

C type: `GdkEventProperty`

Describes a property change on a window.

#### Fields

| Field | Type |
| --- | --- |
| atom | Atom |
| send_event | gint8 |
| state | PropertyState |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventProximity

C type: `GdkEventProximity`

Proximity events are generated when using GDK???s wrapper for the XInput extension. The XInput extension is an add-on for standard X that allows yo...

#### Fields

| Field | Type |
| --- | --- |
| device | Device |
| send_event | gint8 |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventScroll

C type: `GdkEventScroll`

Generated from button presses for the buttons 4 to 7. Wheel mice are usually configured to generate button press events for buttons 4 and 5 when th...

#### Fields

| Field | Type |
| --- | --- |
| delta_x | gdouble |
| delta_y | gdouble |
| device | Device |
| direction | ScrollDirection |
| is_stop | guint |
| send_event | gint8 |
| state | ModifierType |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventSelection

C type: `GdkEventSelection`

Generated when a selection is requested or ownership of a selection is taken over by another client application.

#### Fields

| Field | Type |
| --- | --- |
| property | Atom |
| requestor | Window |
| selection | Atom |
| send_event | gint8 |
| target | Atom |
| time | guint32 |
| type | EventType |
| window | Window |

### Gdk.EventSequence

GType: `GdkEventSequence` ?? C type: `GdkEventSequence`

### Gdk.EventSetting

C type: `GdkEventSetting`

Generated when a setting is modified.

#### Fields

| Field | Type |
| --- | --- |
| action | SettingAction |
| name | utf8 |
| send_event | gint8 |
| type | EventType |
| window | Window |

### Gdk.EventTouch

C type: `GdkEventTouch`

Used for touch events. @type field will be one of %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE, %GDK_TOUCH_END or %GDK_TOUCH_CANCEL. Touch events are groupe...

#### Fields

| Field | Type |
| --- | --- |
| axes | gdouble |
| device | Device |
| emulating_pointer | gboolean |
| send_event | gint8 |
| sequence | EventSequence |
| state | ModifierType |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventTouchpadPinch

C type: `GdkEventTouchpadPinch`

Generated during touchpad swipe gestures.

#### Fields

| Field | Type |
| --- | --- |
| angle_delta | gdouble |
| dx | gdouble |
| dy | gdouble |
| n_fingers | gint8 |
| phase | gint8 |
| scale | gdouble |
| send_event | gint8 |
| state | ModifierType |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventTouchpadSwipe

C type: `GdkEventTouchpadSwipe`

Generated during touchpad swipe gestures.

#### Fields

| Field | Type |
| --- | --- |
| dx | gdouble |
| dy | gdouble |
| n_fingers | gint8 |
| phase | gint8 |
| send_event | gint8 |
| state | ModifierType |
| time | guint32 |
| type | EventType |
| window | Window |
| x | gdouble |
| x_root | gdouble |
| y | gdouble |
| y_root | gdouble |

### Gdk.EventVisibility

C type: `GdkEventVisibility`

Generated when the window visibility status has changed.

#### Fields

| Field | Type |
| --- | --- |
| send_event | gint8 |
| state | VisibilityState |
| type | EventType |
| window | Window |

### Gdk.EventWindowState

C type: `GdkEventWindowState`

Generated when the state of a toplevel window changes.

#### Fields

| Field | Type |
| --- | --- |
| changed_mask | WindowState |
| new_window_state | WindowState |
| send_event | gint8 |
| type | EventType |
| window | Window |

### Gdk.FrameClockClass

C type: `GdkFrameClockClass`

### Gdk.FrameClockPrivate

C type: `GdkFrameClockPrivate`

### Gdk.FrameTimings

GType: `GdkFrameTimings` ?? C type: `GdkFrameTimings`

A #GdkFrameTimings object holds timing information for a single frame of the application???s displays. To retrieve #GdkFrameTimings objects, use gd...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_complete | `FrameTimings.get_complete() -> gboolean` | gdk_frame_timings_get_complete | 3.8 | The timing information in a #GdkFrameTimings is filled in incrementally as the frame as drawn and passed off to the window system for processing an... |
| get_frame_counter | `FrameTimings.get_frame_counter() -> gint64` | gdk_frame_timings_get_frame_counter | 3.8 | Gets the frame counter value of the #GdkFrameClock when this this frame was drawn. |
| get_frame_time | `FrameTimings.get_frame_time() -> gint64` | gdk_frame_timings_get_frame_time |  | Returns the frame time for the frame. This is the time value that is typically used to time animations for the frame. See gdk_frame_clock_get_frame... |
| get_predicted_presentation_time | `FrameTimings.get_predicted_presentation_time() -> gint64` | gdk_frame_timings_get_predicted_presentation_time | 3.8 | Gets the predicted time at which this frame will be displayed. Although no predicted time may be available, if one is available, it will be availab... |
| get_presentation_time | `FrameTimings.get_presentation_time() -> gint64` | gdk_frame_timings_get_presentation_time | 3.8 | Reurns the presentation time. This is the time at which the frame became visible to the user. |
| get_refresh_interval | `FrameTimings.get_refresh_interval() -> gint64` | gdk_frame_timings_get_refresh_interval | 3.8 | Gets the natural interval between presentation times for the display that this frame was displayed on. Frame presentation usually happens during th... |
| ref | `FrameTimings.ref() -> FrameTimings` | gdk_frame_timings_ref | 3.8 | Increases the reference count of @timings. |
| unref | `FrameTimings.unref() -> none` | gdk_frame_timings_unref | 3.8 | Decreases the reference count of @timings. If @timings is no longer referenced, it will be freed. |

### Gdk.Geometry

C type: `GdkGeometry`

The #GdkGeometry struct gives the window manager information about a window???s geometry constraints. Normally you would set these on the GTK+ leve...

#### Fields

| Field | Type |
| --- | --- |
| base_height | gint |
| base_width | gint |
| height_inc | gint |
| max_aspect | gdouble |
| max_height | gint |
| max_width | gint |
| min_aspect | gdouble |
| min_height | gint |
| min_width | gint |
| width_inc | gint |
| win_gravity | Gravity |

### Gdk.KeymapKey

C type: `GdkKeymapKey`

A #GdkKeymapKey is a hardware key that can be mapped to a keyval.

#### Fields

| Field | Type |
| --- | --- |
| group | gint |
| keycode | guint |
| level | gint |

### Gdk.MonitorClass

C type: `GdkMonitorClass`

### Gdk.Point

C type: `GdkPoint`

Defines the x and y coordinates of a point.

#### Fields

| Field | Type |
| --- | --- |
| x | gint |
| y | gint |

### Gdk.Rectangle

GType: `GdkRectangle` ?? C type: `GdkRectangle`

Defines the position and size of a rectangle. It is identical to #cairo_rectangle_int_t.

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| width | gint |
| x | gint |
| y | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `Rectangle.equal(rect2: Rectangle) -> gboolean` | gdk_rectangle_equal | 3.20 | Checks if the two given rectangles are equal. |
| intersect | `Rectangle.intersect(src2: Rectangle, dest: out Rectangle?) -> gboolean` | gdk_rectangle_intersect |  | Calculates the intersection of two rectangles. It is allowed for @dest to be the same as either @src1 or @src2. If the rectangles do not intersect,... |
| union | `Rectangle.union(src2: Rectangle, dest: out Rectangle) -> none` | gdk_rectangle_union |  | Calculates the union of two rectangles. The union of rectangles @src1 and @src2 is the smallest rectangle which includes both @src1 and @src2 withi... |

### Gdk.RGBA

GType: `GdkRGBA` ?? C type: `GdkRGBA`

A #GdkRGBA is used to represent a (possibly translucent) color, in a way that is compatible with cairo???s notion of color.

#### Fields

| Field | Type |
| --- | --- |
| alpha | gdouble |
| blue | gdouble |
| green | gdouble |
| red | gdouble |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `RGBA.copy() -> RGBA` | gdk_rgba_copy | 3.0 | Makes a copy of a #GdkRGBA. The result must be freed through gdk_rgba_free(). |
| equal | `RGBA.equal(p2: RGBA) -> gboolean` | gdk_rgba_equal | 3.0 | Compares two RGBA colors. |
| free | `RGBA.free() -> none` | gdk_rgba_free | 3.0 | Frees a #GdkRGBA created with gdk_rgba_copy() |
| hash | `RGBA.hash() -> guint` | gdk_rgba_hash | 3.0 | A hash function suitable for using for a hash table that stores #GdkRGBAs. |
| parse | `RGBA.parse(spec: utf8) -> gboolean` | gdk_rgba_parse | 3.0 | Parses a textual representation of a color, filling in the @red, @green, @blue and @alpha fields of the @rgba #GdkRGBA. The string can be either on... |
| to_string | `RGBA.to_string() -> utf8` | gdk_rgba_to_string | 3.0 | Returns a textual specification of @rgba in the form `rgb(r,g,b)` or `rgba(r g,b,a)`, where ???r???, ???g???, ???b??? and ???a??? represent the red... |

### Gdk.TimeCoord

C type: `GdkTimeCoord`

A #GdkTimeCoord stores a single event in a motion history.

#### Fields

| Field | Type |
| --- | --- |
| axes | gdouble |
| time | guint32 |

### Gdk.WindowAttr

C type: `GdkWindowAttr`

Attributes to use for a newly-created window.

#### Fields

| Field | Type |
| --- | --- |
| cursor | Cursor |
| event_mask | gint |
| height | gint |
| override_redirect | gboolean |
| title | utf8 |
| type_hint | WindowTypeHint |
| visual | Visual |
| wclass | WindowWindowClass |
| width | gint |
| window_type | WindowType |
| wmclass_class | utf8 |
| wmclass_name | utf8 |
| x | gint |
| y | gint |

### Gdk.WindowClass

C type: `GdkWindowClass`

#### Fields

| Field | Type |
| --- | --- |
| _gdk_reserved1 | none |
| _gdk_reserved2 | none |
| _gdk_reserved3 | none |
| _gdk_reserved4 | none |
| _gdk_reserved5 | none |
| _gdk_reserved6 | none |
| _gdk_reserved7 | none |
| _gdk_reserved8 | none |
| create_surface | cairo.Surface |
| from_embedder | none |
| parent_class | GObject.ObjectClass |
| pick_embedded_child | Window |
| to_embedder | none |

### Gdk.WindowRedirect

C type: `GdkWindowRedirect`

## Unions

### Gdk.Event

GType: `GdkEvent` ?? C type: `GdkEvent`

A #GdkEvent contains a union of all of the event types, and allows access to the data fields in a number of ways. The event type is always the firs...

#### Fields

| Field | Type |
| --- | --- |
| any | EventAny |
| button | EventButton |
| configure | EventConfigure |
| crossing | EventCrossing |
| dnd | EventDND |
| expose | EventExpose |
| focus_change | EventFocus |
| grab_broken | EventGrabBroken |
| key | EventKey |
| motion | EventMotion |
| owner_change | EventOwnerChange |
| pad_axis | EventPadAxis |
| pad_button | EventPadButton |
| pad_group_mode | EventPadGroupMode |
| property | EventProperty |
| proximity | EventProximity |
| scroll | EventScroll |
| selection | EventSelection |
| setting | EventSetting |
| touch | EventTouch |
| touchpad_pinch | EventTouchpadPinch |
| touchpad_swipe | EventTouchpadSwipe |
| type | EventType |
| visibility | EventVisibility |
| window_state | EventWindowState |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Event.new(type: EventType) -> Event` | gdk_event_new | 2.2 | Creates a new event of the given type. All fields are set to 0. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> Event` | gdk_event_get |  | Checks all open displays for a #GdkEvent to process,to be processed on, fetching events from the windowing system if necessary. See gdk_display_get... |
| handler_set | `handler_set(func: EventFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | gdk_event_handler_set |  | Sets the function to call to handle all events from GDK. Note that GTK+ uses this to install its own event handler, so it is usually not useful for... |
| peek | `peek() -> Event` | gdk_event_peek |  | If there is an event waiting in the event queue of some open display, returns a copy of it. See gdk_display_peek_event(). |
| request_motions | `request_motions(event: EventMotion) -> none` | gdk_event_request_motions | 2.12 | Request more motion notifies if @event is a motion notify hint event. This function should be used instead of gdk_window_get_pointer() to request f... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| _get_angle | `Event._get_angle(event2: Event, angle: out gdouble) -> gboolean` | gdk_events_get_angle | 3.0 | If both events contain X/Y information, this function will return %TRUE and return in @angle the relative angle from @event1 to @event2. The rotati... |
| _get_center | `Event._get_center(event2: Event, x: out gdouble, y: out gdouble) -> gboolean` | gdk_events_get_center | 3.0 | If both events contain X/Y information, the center of both coordinates will be returned in @x and @y. |
| _get_distance | `Event._get_distance(event2: Event, distance: out gdouble) -> gboolean` | gdk_events_get_distance | 3.0 | If both events have X/Y information, the distance between both coordinates (as in a straight line going from @event1 to @event2) will be returned. |
| copy | `Event.copy() -> Event` | gdk_event_copy |  | Copies a #GdkEvent, copying or incrementing the reference count of the resources associated with it (e.g. #GdkWindow???s and strings). |
| free | `Event.free() -> none` | gdk_event_free |  | Frees a #GdkEvent, freeing or decrementing any resources associated with it. Note that this function should only be called with events returned fro... |
| get_axis | `Event.get_axis(axis_use: AxisUse, value: out gdouble) -> gboolean` | gdk_event_get_axis |  | Extract the axis value for a particular axis use from an event structure. |
| get_button | `Event.get_button(button: out guint) -> gboolean` | gdk_event_get_button | 3.2 | Extract the button number from an event. |
| get_click_count | `Event.get_click_count(click_count: out guint) -> gboolean` | gdk_event_get_click_count | 3.2 | Extracts the click count from an event. |
| get_coords | `Event.get_coords(x_win: out gdouble?, y_win: out gdouble?) -> gboolean` | gdk_event_get_coords |  | Extract the event window relative x/y coordinates from an event. |
| get_device | `Event.get_device() -> Device` | gdk_event_get_device | 3.0 | If the event contains a ???device??? field, this function will return it, else it will return %NULL. |
| get_device_tool | `Event.get_device_tool() -> DeviceTool` | gdk_event_get_device_tool | 3.22 | If the event was generated by a device that supports different tools (eg. a tablet), this function will return a #GdkDeviceTool representing the to... |
| get_event_sequence | `Event.get_event_sequence() -> EventSequence` | gdk_event_get_event_sequence | 3.4 | If @event if of type %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE, %GDK_TOUCH_END or %GDK_TOUCH_CANCEL, returns the #GdkEventSequence to which the event bel... |
| get_event_type | `Event.get_event_type() -> EventType` | gdk_event_get_event_type | 3.10 | Retrieves the type of the event. |
| get_keycode | `Event.get_keycode(keycode: out guint16) -> gboolean` | gdk_event_get_keycode | 3.2 | Extracts the hardware keycode from an event. Also see gdk_event_get_scancode(). |
| get_keyval | `Event.get_keyval(keyval: out guint) -> gboolean` | gdk_event_get_keyval | 3.2 | Extracts the keyval from an event. |
| get_pointer_emulated | `Event.get_pointer_emulated() -> gboolean` | gdk_event_get_pointer_emulated | 3.22 | #event: a #GdkEvent Returns whether this event is an 'emulated' pointer event (typically from a touch event), as opposed to a real one. |
| get_root_coords | `Event.get_root_coords(x_root: out gdouble?, y_root: out gdouble?) -> gboolean` | gdk_event_get_root_coords |  | Extract the root window relative x/y coordinates from an event. |
| get_scancode | `Event.get_scancode() -> gint` | gdk_event_get_scancode | 3.22 | Gets the keyboard low-level scancode of a key event. This is usually hardware_keycode. On Windows this is the high word of WM_KEY{DOWN,UP} lParam w... |
| get_screen | `Event.get_screen() -> Screen` | gdk_event_get_screen | 2.2 | Returns the screen for the event. The screen is typically the screen for `event->any.window`, but for events such as mouse events, it is the screen... |
| get_scroll_deltas | `Event.get_scroll_deltas(delta_x: out gdouble, delta_y: out gdouble) -> gboolean` | gdk_event_get_scroll_deltas | 3.4 | Retrieves the scroll deltas from a #GdkEvent See also: gdk_event_get_scroll_direction() |
| get_scroll_direction | `Event.get_scroll_direction(direction: out ScrollDirection) -> gboolean` | gdk_event_get_scroll_direction | 3.2 | Extracts the scroll direction from an event. If @event is not of type %GDK_SCROLL, the contents of @direction are undefined. If you wish to handle ... |
| get_seat | `Event.get_seat() -> Seat` | gdk_event_get_seat | 3.20 | Returns the #GdkSeat this event was generated for. |
| get_source_device | `Event.get_source_device() -> Device` | gdk_event_get_source_device | 3.0 | This function returns the hardware (slave) #GdkDevice that has triggered the event, falling back to the virtual (master) device (as in gdk_event_ge... |
| get_state | `Event.get_state(state: out ModifierType) -> gboolean` | gdk_event_get_state |  | If the event contains a ???state??? field, puts that field in @state. Otherwise stores an empty state (0). Returns %TRUE if there was a state field... |
| get_time | `Event.get_time() -> guint32` | gdk_event_get_time |  | Returns the time stamp from @event, if there is one; otherwise returns #GDK_CURRENT_TIME. If @event is %NULL, returns #GDK_CURRENT_TIME. |
| get_window | `Event.get_window() -> Window` | gdk_event_get_window | 3.10 | Extracts the #GdkWindow associated with an event. |
| is_scroll_stop_event | `Event.is_scroll_stop_event() -> gboolean` | gdk_event_is_scroll_stop_event | 3.20 | Check whether a scroll event is a stop scroll event. Scroll sequences with smooth scroll information may provide a stop scroll event once the inter... |
| put | `Event.put() -> none` | gdk_event_put |  | Appends a copy of the given event onto the front of the event queue for event->any.window???s display, or the default event queue if event->any.win... |
| set_device | `Event.set_device(device: Device) -> none` | gdk_event_set_device | 3.0 | Sets the device for @event to @device. The event must have been allocated by GTK+, for instance, by gdk_event_copy(). |
| set_device_tool | `Event.set_device_tool(tool: DeviceTool?) -> none` | gdk_event_set_device_tool | 3.22 | Sets the device tool for this event, should be rarely used. |
| set_screen | `Event.set_screen(screen: Screen) -> none` | gdk_event_set_screen | 2.2 | Sets the screen for @event to @screen. The event must have been allocated by GTK+, for instance, by gdk_event_copy(). |
| set_source_device | `Event.set_source_device(device: Device) -> none` | gdk_event_set_source_device | 3.0 | Sets the slave device for @event to @device. The event must have been allocated by GTK+, for instance by gdk_event_copy(). |
| triggers_context_menu | `Event.triggers_context_menu() -> gboolean` | gdk_event_triggers_context_menu | 3.4 | This function returns whether a #GdkEventButton should trigger a context menu, according to platform conventions. The right mouse button always tri... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_option_entries_libgtk_only | `add_option_entries_libgtk_only(group: GLib.OptionGroup) -> none` | gdk_add_option_entries_libgtk_only |  | Appends gdk option entries to the passed in option group. This is not public API and must not be used by applications. |
| atom_intern | `atom_intern(atom_name: utf8, only_if_exists: gboolean) -> Atom` | gdk_atom_intern |  | Finds or creates an atom corresponding to a given string. |
| atom_intern_static_string | `atom_intern_static_string(atom_name: utf8) -> Atom` | gdk_atom_intern_static_string | 2.10 | Finds or creates an atom corresponding to a given string. Note that this function is identical to gdk_atom_intern() except that if a new #GdkAtom i... |
| beep | `beep() -> none` | gdk_beep |  | Emits a short beep on the default display. |
| cairo_create | `cairo_create(window: Window) -> cairo.Context` | gdk_cairo_create | 2.8 | Creates a Cairo context for drawing to @window. Note that calling cairo_reset_clip() on the resulting #cairo_t will produce undefined results, so a... |
| cairo_draw_from_gl | `cairo_draw_from_gl(cr: cairo.Context, window: Window, source: gint, source_type: gint, buffer_scale: gint, x: gint, y: gint, width: gint, height: gint) -> none` | gdk_cairo_draw_from_gl | 3.16 | This is the main way to draw GL content in GTK+. It takes a render buffer ID (@source_type == #GL_RENDERBUFFER) or a texture id (@source_type == #G... |
| cairo_get_clip_rectangle | `cairo_get_clip_rectangle(cr: cairo.Context, rect: out Rectangle?) -> gboolean` | gdk_cairo_get_clip_rectangle |  | This is a convenience function around cairo_clip_extents(). It rounds the clip extents to integer coordinates and returns a boolean indicating if a... |
| cairo_get_drawing_context | `cairo_get_drawing_context(cr: cairo.Context) -> DrawingContext` | gdk_cairo_get_drawing_context | 3.22 | Retrieves the #GdkDrawingContext that created the Cairo context @cr. |
| cairo_rectangle | `cairo_rectangle(cr: cairo.Context, rectangle: Rectangle) -> none` | gdk_cairo_rectangle | 2.8 | Adds the given rectangle to the current path of @cr. |
| cairo_region | `cairo_region(cr: cairo.Context, region: cairo.Region) -> none` | gdk_cairo_region | 2.8 | Adds the given region to the current path of @cr. |
| cairo_region_create_from_surface | `cairo_region_create_from_surface(surface: cairo.Surface) -> cairo.Region` | gdk_cairo_region_create_from_surface |  | Creates region that describes covers the area where the given @surface is more than 50% opaque. This function takes into account device offsets tha... |
| cairo_set_source_color | `cairo_set_source_color(cr: cairo.Context, color: Color) -> none` | gdk_cairo_set_source_color | 2.8 | Sets the specified #GdkColor as the source color of @cr. |
| cairo_set_source_pixbuf | `cairo_set_source_pixbuf(cr: cairo.Context, pixbuf: GdkPixbuf.Pixbuf, pixbuf_x: gdouble, pixbuf_y: gdouble) -> none` | gdk_cairo_set_source_pixbuf | 2.8 | Sets the given pixbuf as the source pattern for @cr. The pattern has an extend mode of %CAIRO_EXTEND_NONE and is aligned so that the origin of @pix... |
| cairo_set_source_rgba | `cairo_set_source_rgba(cr: cairo.Context, rgba: RGBA) -> none` | gdk_cairo_set_source_rgba | 3.0 | Sets the specified #GdkRGBA as the source color of @cr. |
| cairo_set_source_window | `cairo_set_source_window(cr: cairo.Context, window: Window, x: gdouble, y: gdouble) -> none` | gdk_cairo_set_source_window | 2.24 | Sets the given window as the source pattern for @cr. The pattern has an extend mode of %CAIRO_EXTEND_NONE and is aligned so that the origin of @win... |
| cairo_surface_create_from_pixbuf | `cairo_surface_create_from_pixbuf(pixbuf: GdkPixbuf.Pixbuf, scale: gint, for_window: Window?) -> cairo.Surface` | gdk_cairo_surface_create_from_pixbuf | 3.10 | Creates an image surface with the same contents as the pixbuf. |
| color_parse | `color_parse(spec: utf8, color: out Color) -> gboolean` | gdk_color_parse |  | Parses a textual specification of a color and fill in the @red, @green, and @blue fields of a #GdkColor. The string can either one of a large set o... |
| disable_multidevice | `disable_multidevice() -> none` | gdk_disable_multidevice | 3.0 | Disables multidevice support in GDK. This call must happen prior to gdk_display_open(), gtk_init(), gtk_init_with_args() or gtk_init_check() in ord... |
| drag_abort | `drag_abort(context: DragContext, time_: guint32) -> none` | gdk_drag_abort |  | Aborts a drag without dropping. This function is called by the drag source. This function does not need to be called in managed drag and drop opera... |
| drag_begin | `drag_begin(window: Window, targets: GLib.List) -> DragContext` | gdk_drag_begin |  | Starts a drag and creates a new drag context for it. This function assumes that the drag is controlled by the client pointer device, use gdk_drag_b... |
| drag_begin_for_device | `drag_begin_for_device(window: Window, device: Device, targets: GLib.List) -> DragContext` | gdk_drag_begin_for_device |  | Starts a drag and creates a new drag context for it. This function is called by the drag source. |
| drag_begin_from_point | `drag_begin_from_point(window: Window, device: Device, targets: GLib.List, x_root: gint, y_root: gint) -> DragContext` | gdk_drag_begin_from_point | 3.20 | Starts a drag and creates a new drag context for it. This function is called by the drag source. |
| drag_drop | `drag_drop(context: DragContext, time_: guint32) -> none` | gdk_drag_drop |  | Drops on the current destination. This function is called by the drag source. This function does not need to be called in managed drag and drop ope... |
| drag_drop_done | `drag_drop_done(context: DragContext, success: gboolean) -> none` | gdk_drag_drop_done | 3.20 | Inform GDK if the drop ended successfully. Passing %FALSE for @success may trigger a drag cancellation animation. This function is called by the dr... |
| drag_drop_succeeded | `drag_drop_succeeded(context: DragContext) -> gboolean` | gdk_drag_drop_succeeded | 2.6 | Returns whether the dropped data has been successfully transferred. This function is intended to be used while handling a %GDK_DROP_FINISHED event,... |
| drag_find_window_for_screen | `drag_find_window_for_screen(context: DragContext, drag_window: Window, screen: Screen, x_root: gint, y_root: gint, dest_window: out Window, protocol: out DragProtocol) -> none` | gdk_drag_find_window_for_screen | 2.2 | Finds the destination window and DND protocol to use at the given pointer position. This function is called by the drag source to obtain the @dest_... |
| drag_get_selection | `drag_get_selection(context: DragContext) -> Atom` | gdk_drag_get_selection |  | Returns the selection atom for the current source window. |
| drag_motion | `drag_motion(context: DragContext, dest_window: Window, protocol: DragProtocol, x_root: gint, y_root: gint, suggested_action: DragAction, possible_actions: DragAction, time_: guint32) -> gboolean` | gdk_drag_motion |  | Updates the drag context when the pointer moves or the set of actions changes. This function is called by the drag source. This function does not n... |
| drag_status | `drag_status(context: DragContext, action: DragAction, time_: guint32) -> none` | gdk_drag_status |  | Selects one of the actions offered by the drag source. This function is called by the drag destination in response to gdk_drag_motion() called by t... |
| drop_finish | `drop_finish(context: DragContext, success: gboolean, time_: guint32) -> none` | gdk_drop_finish |  | Ends the drag operation after a drop. This function is called by the drag destination. |
| drop_reply | `drop_reply(context: DragContext, accepted: gboolean, time_: guint32) -> none` | gdk_drop_reply |  | Accepts or rejects a drop. This function is called by the drag destination in response to a drop initiated by the drag source. |
| error_trap_pop | `error_trap_pop() -> gint` | gdk_error_trap_pop |  | Removes an error trap pushed with gdk_error_trap_push(). May block until an error has been definitively received or not received from the X server.... |
| error_trap_pop_ignored | `error_trap_pop_ignored() -> none` | gdk_error_trap_pop_ignored | 3.0 | Removes an error trap pushed with gdk_error_trap_push(), but without bothering to wait and see whether an error occurred. If an error arrives later... |
| error_trap_push | `error_trap_push() -> none` | gdk_error_trap_push |  | This function allows X errors to be trapped instead of the normal behavior of exiting the application. It should only be used if it is not possible... |
| event_get | `event_get() -> Event` | gdk_event_get |  | Checks all open displays for a #GdkEvent to process,to be processed on, fetching events from the windowing system if necessary. See gdk_display_get... |
| event_handler_set | `event_handler_set(func: EventFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | gdk_event_handler_set |  | Sets the function to call to handle all events from GDK. Note that GTK+ uses this to install its own event handler, so it is usually not useful for... |
| event_peek | `event_peek() -> Event` | gdk_event_peek |  | If there is an event waiting in the event queue of some open display, returns a copy of it. See gdk_display_peek_event(). |
| event_request_motions | `event_request_motions(event: EventMotion) -> none` | gdk_event_request_motions | 2.12 | Request more motion notifies if @event is a motion notify hint event. This function should be used instead of gdk_window_get_pointer() to request f... |
| events_get_angle | `events_get_angle(event1: Event, event2: Event, angle: out gdouble) -> gboolean` | gdk_events_get_angle | 3.0 | If both events contain X/Y information, this function will return %TRUE and return in @angle the relative angle from @event1 to @event2. The rotati... |
| events_get_center | `events_get_center(event1: Event, event2: Event, x: out gdouble, y: out gdouble) -> gboolean` | gdk_events_get_center | 3.0 | If both events contain X/Y information, the center of both coordinates will be returned in @x and @y. |
| events_get_distance | `events_get_distance(event1: Event, event2: Event, distance: out gdouble) -> gboolean` | gdk_events_get_distance | 3.0 | If both events have X/Y information, the distance between both coordinates (as in a straight line going from @event1 to @event2) will be returned. |
| events_pending | `events_pending() -> gboolean` | gdk_events_pending |  | Checks if any events are ready to be processed for any display. |
| flush | `flush() -> none` | gdk_flush |  | Flushes the output buffers of all display connections and waits until all requests have been processed. This is rarely needed by applications. |
| get_default_root_window | `get_default_root_window() -> Window` | gdk_get_default_root_window |  | Obtains the root window (parent all other windows are inside) for the default display and screen. |
| get_display | `get_display() -> utf8` | gdk_get_display |  | Gets the name of the display, which usually comes from the `DISPLAY` environment variable or the `--display` command line option. |
| get_display_arg_name | `get_display_arg_name() -> utf8` | gdk_get_display_arg_name | 2.2 | Gets the display name specified in the command line arguments passed to gdk_init() or gdk_parse_args(), if any. |
| get_program_class | `get_program_class() -> utf8` | gdk_get_program_class |  | Gets the program class. Unless the program class has explicitly been set with gdk_set_program_class() or with the `--class` commandline option, the... |
| get_show_events | `get_show_events() -> gboolean` | gdk_get_show_events |  | Gets whether event debugging output is enabled. |
| gl_error_quark | `gl_error_quark() -> GLib.Quark` | gdk_gl_error_quark |  |  |
| init | `init(argc: inout gint, argv: inout utf8) -> none` | gdk_init |  | Initializes the GDK library and connects to the windowing system. If initialization fails, a warning message is output and the application terminat... |
| init_check | `init_check(argc: inout gint, argv: inout utf8) -> gboolean` | gdk_init_check |  | Initializes the GDK library and connects to the windowing system, returning %TRUE on success. Any arguments used by GDK are removed from the array ... |
| keyboard_grab | `keyboard_grab(window: Window, owner_events: gboolean, time_: guint32) -> GrabStatus` | gdk_keyboard_grab |  | Grabs the keyboard so that all events are passed to this application until the keyboard is ungrabbed with gdk_keyboard_ungrab(). This overrides any... |
| keyboard_ungrab | `keyboard_ungrab(time_: guint32) -> none` | gdk_keyboard_ungrab |  | Ungrabs the keyboard on the default display, if it is grabbed by this application. |
| keyval_convert_case | `keyval_convert_case(symbol: guint, lower: out guint, upper: out guint) -> none` | gdk_keyval_convert_case |  | Obtains the upper- and lower-case versions of the keyval @symbol. Examples of keyvals are #GDK_KEY_a, #GDK_KEY_Enter, #GDK_KEY_F1, etc. |
| keyval_from_name | `keyval_from_name(keyval_name: utf8) -> guint` | gdk_keyval_from_name |  | Converts a key name to a key value. The names are the same as those in the `gdk/gdkkeysyms.h` header file but without the leading ???GDK_KEY_???. |
| keyval_is_lower | `keyval_is_lower(keyval: guint) -> gboolean` | gdk_keyval_is_lower |  | Returns %TRUE if the given key value is in lower case. |
| keyval_is_upper | `keyval_is_upper(keyval: guint) -> gboolean` | gdk_keyval_is_upper |  | Returns %TRUE if the given key value is in upper case. |
| keyval_name | `keyval_name(keyval: guint) -> utf8` | gdk_keyval_name |  | Converts a key value into a symbolic name. The names are the same as those in the `gdk/gdkkeysyms.h` header file but without the leading ???GDK_KEY... |
| keyval_to_lower | `keyval_to_lower(keyval: guint) -> guint` | gdk_keyval_to_lower |  | Converts a key value to lower case, if applicable. |
| keyval_to_unicode | `keyval_to_unicode(keyval: guint) -> guint32` | gdk_keyval_to_unicode |  | Convert from a GDK key symbol to the corresponding ISO10646 (Unicode) character. |
| keyval_to_upper | `keyval_to_upper(keyval: guint) -> guint` | gdk_keyval_to_upper |  | Converts a key value to upper case, if applicable. |
| list_visuals | `list_visuals() -> GLib.List` | gdk_list_visuals |  | Lists the available visuals for the default screen. (See gdk_screen_list_visuals()) A visual describes a hardware image data format. For example, a... |
| notify_startup_complete | `notify_startup_complete() -> none` | gdk_notify_startup_complete | 2.2 | Indicates to the GUI environment that the application has finished loading. If the applications opens windows, this function is normally called aft... |
| notify_startup_complete_with_id | `notify_startup_complete_with_id(startup_id: utf8) -> none` | gdk_notify_startup_complete_with_id | 2.12 | Indicates to the GUI environment that the application has finished loading, using a given identifier. GTK+ will call this function automatically fo... |
| offscreen_window_get_embedder | `offscreen_window_get_embedder(window: Window) -> Window` | gdk_offscreen_window_get_embedder | 2.18 | Gets the window that @window is embedded in. |
| offscreen_window_get_surface | `offscreen_window_get_surface(window: Window) -> cairo.Surface` | gdk_offscreen_window_get_surface |  | Gets the offscreen surface that an offscreen window renders into. If you need to keep this around over window resizes, you need to add a reference ... |
| offscreen_window_set_embedder | `offscreen_window_set_embedder(window: Window, embedder: Window) -> none` | gdk_offscreen_window_set_embedder | 2.18 | Sets @window to be embedded in @embedder. To fully embed an offscreen window, in addition to calling this function, it is also necessary to handle ... |
| pango_context_get | `pango_context_get() -> Pango.Context` | gdk_pango_context_get |  | Creates a #PangoContext for the default GDK screen. The context must be freed when you???re finished with it. When using GTK+, normally you should ... |
| pango_context_get_for_display | `pango_context_get_for_display(display: Display) -> Pango.Context` | gdk_pango_context_get_for_display | 3.22 | Creates a #PangoContext for @display. The context must be freed when you???re finished with it. When using GTK+, normally you should use gtk_widget... |
| pango_context_get_for_screen | `pango_context_get_for_screen(screen: Screen) -> Pango.Context` | gdk_pango_context_get_for_screen | 2.2 | Creates a #PangoContext for @screen. The context must be freed when you???re finished with it. When using GTK+, normally you should use gtk_widget_... |
| pango_layout_get_clip_region | `pango_layout_get_clip_region(layout: Pango.Layout, x_origin: gint, y_origin: gint, index_ranges: gint, n_ranges: gint) -> cairo.Region` | gdk_pango_layout_get_clip_region |  | Obtains a clip region which contains the areas where the given ranges of text would be drawn. @x_origin and @y_origin are the top left point to cen... |
| pango_layout_line_get_clip_region | `pango_layout_line_get_clip_region(line: Pango.LayoutLine, x_origin: gint, y_origin: gint, index_ranges: gint, n_ranges: gint) -> cairo.Region` | gdk_pango_layout_line_get_clip_region |  | Obtains a clip region which contains the areas where the given ranges of text would be drawn. @x_origin and @y_origin are the top left position of ... |
| parse_args | `parse_args(argc: inout gint, argv: inout utf8) -> none` | gdk_parse_args | 2.2 | Parse command line arguments, and store for future use by calls to gdk_display_open(). Any arguments used by GDK are removed from the array and @ar... |
| pixbuf_get_from_surface | `pixbuf_get_from_surface(surface: cairo.Surface, src_x: gint, src_y: gint, width: gint, height: gint) -> GdkPixbuf.Pixbuf` | gdk_pixbuf_get_from_surface |  | Transfers image data from a #cairo_surface_t and converts it to an RGB(A) representation inside a #GdkPixbuf. This allows you to efficiently read i... |
| pixbuf_get_from_window | `pixbuf_get_from_window(window: Window, src_x: gint, src_y: gint, width: gint, height: gint) -> GdkPixbuf.Pixbuf` | gdk_pixbuf_get_from_window |  | Transfers image data from a #GdkWindow and converts it to an RGB(A) representation inside a #GdkPixbuf. In other words, copies image data from a se... |
| pointer_grab | `pointer_grab(window: Window, owner_events: gboolean, event_mask: EventMask, confine_to: Window?, cursor: Cursor?, time_: guint32) -> GrabStatus` | gdk_pointer_grab |  | Grabs the pointer (usually a mouse) so that all events are passed to this application until the pointer is ungrabbed with gdk_pointer_ungrab(), or ... |
| pointer_is_grabbed | `pointer_is_grabbed() -> gboolean` | gdk_pointer_is_grabbed |  | Returns %TRUE if the pointer on the default display is currently grabbed by this application. Note that this does not take the inmplicit pointer gr... |
| pointer_ungrab | `pointer_ungrab(time_: guint32) -> none` | gdk_pointer_ungrab |  | Ungrabs the pointer on the default display, if it is grabbed by this application. |
| pre_parse_libgtk_only | `pre_parse_libgtk_only() -> none` | gdk_pre_parse_libgtk_only |  | Prepare for parsing command line arguments for GDK. This is not public API and should not be used in application code. |
| property_change | `property_change(window: Window, property: Atom, type: Atom, format: gint, mode: PropMode, data: guint8, nelements: gint) -> none` | gdk_property_change |  | Changes the contents of a property on a window. |
| property_delete | `property_delete(window: Window, property: Atom) -> none` | gdk_property_delete |  | Deletes a property from a window. |
| property_get | `property_get(window: Window, property: Atom, type: Atom, offset: gulong, length: gulong, pdelete: gint, actual_property_type: out Atom, actual_format: out gint, actual_length: out gint, data: out guint8) -> gboolean` | gdk_property_get |  | Retrieves a portion of the contents of a property. If the property does not exist, then the function returns %FALSE, and %GDK_NONE will be stored i... |
| query_depths | `query_depths(depths: out gint, count: out gint) -> none` | gdk_query_depths |  | This function returns the available bit depths for the default screen. It???s equivalent to listing the visuals (gdk_list_visuals()) and then looki... |
| query_visual_types | `query_visual_types(visual_types: out VisualType, count: out gint) -> none` | gdk_query_visual_types |  | This function returns the available visual types for the default screen. It???s equivalent to listing the visuals (gdk_list_visuals()) and then loo... |
| selection_convert | `selection_convert(requestor: Window, selection: Atom, target: Atom, time_: guint32) -> none` | gdk_selection_convert |  | Retrieves the contents of a selection in a given form. |
| selection_owner_get | `selection_owner_get(selection: Atom) -> Window` | gdk_selection_owner_get |  | Determines the owner of the given selection. |
| selection_owner_get_for_display | `selection_owner_get_for_display(display: Display, selection: Atom) -> Window` | gdk_selection_owner_get_for_display | 2.2 | Determine the owner of the given selection. Note that the return value may be owned by a different process if a foreign window was previously creat... |
| selection_owner_set | `selection_owner_set(owner: Window?, selection: Atom, time_: guint32, send_event: gboolean) -> gboolean` | gdk_selection_owner_set |  | Sets the owner of the given selection. |
| selection_owner_set_for_display | `selection_owner_set_for_display(display: Display, owner: Window?, selection: Atom, time_: guint32, send_event: gboolean) -> gboolean` | gdk_selection_owner_set_for_display | 2.2 | Sets the #GdkWindow @owner as the current owner of the selection @selection. |
| selection_property_get | `selection_property_get(requestor: Window, data: guint8, prop_type: Atom, prop_format: gint) -> gint` | gdk_selection_property_get |  | Retrieves selection data that was stored by the selection data in response to a call to gdk_selection_convert(). This function will not be used by ... |
| selection_send_notify | `selection_send_notify(requestor: Window, selection: Atom, target: Atom, property: Atom, time_: guint32) -> none` | gdk_selection_send_notify |  | Sends a response to SelectionRequest event. |
| selection_send_notify_for_display | `selection_send_notify_for_display(display: Display, requestor: Window, selection: Atom, target: Atom, property: Atom, time_: guint32) -> none` | gdk_selection_send_notify_for_display | 2.2 | Send a response to SelectionRequest event. |
| set_allowed_backends | `set_allowed_backends(backends: utf8) -> none` | gdk_set_allowed_backends | 3.10 | Sets a list of backends that GDK should try to use. This can be be useful if your application does not work with certain GDK backends. By default, ... |
| set_double_click_time | `set_double_click_time(msec: guint) -> none` | gdk_set_double_click_time |  | Set the double click time for the default display. See gdk_display_set_double_click_time(). See also gdk_display_set_double_click_distance(). Appli... |
| set_program_class | `set_program_class(program_class: utf8) -> none` | gdk_set_program_class |  | Sets the program class. The X11 backend uses the program class to set the class name part of the `WM_CLASS` property on toplevel windows; see the I... |
| set_show_events | `set_show_events(show_events: gboolean) -> none` | gdk_set_show_events |  | Sets whether a trace of received events is output. Note that GTK+ must be compiled with debugging (that is, configured using the `--enable-debug` o... |
| setting_get | `setting_get(name: utf8, value: GObject.Value) -> gboolean` | gdk_setting_get |  | Obtains a desktop-wide setting, such as the double-click time, for the default screen. See gdk_screen_get_setting(). |
| synthesize_window_state | `synthesize_window_state(window: Window, unset_flags: WindowState, set_flags: WindowState) -> none` | gdk_synthesize_window_state |  |  |
| test_render_sync | `test_render_sync(window: Window) -> none` | gdk_test_render_sync | 2.14 | Retrieves a pixel from @window to force the windowing system to carry out any pending rendering commands. This function is intended to be used to s... |
| test_simulate_button | `test_simulate_button(window: Window, x: gint, y: gint, button: guint, modifiers: ModifierType, button_pressrelease: EventType) -> gboolean` | gdk_test_simulate_button | 2.14 | This function is intended to be used in GTK+ test programs. It will warp the mouse pointer to the given (@x,@y) coordinates within @window and simu... |
| test_simulate_key | `test_simulate_key(window: Window, x: gint, y: gint, keyval: guint, modifiers: ModifierType, key_pressrelease: EventType) -> gboolean` | gdk_test_simulate_key | 2.14 | This function is intended to be used in GTK+ test programs. If (@x,@y) are > (-1,-1), it will warp the mouse pointer to the given (@x,@y) coordinat... |
| text_property_to_utf8_list_for_display | `text_property_to_utf8_list_for_display(display: Display, encoding: Atom, format: gint, text: guint8, length: gint, list: out utf8) -> gint` | gdk_text_property_to_utf8_list_for_display | 2.2 | Converts a text property in the given encoding to a list of UTF-8 strings. |
| threads_add_idle | `threads_add_idle(function: GLib.SourceFunc, data: gpointer?) -> guint` | gdk_threads_add_idle | 2.12 | A wrapper for the common usage of gdk_threads_add_idle_full() assigning the default priority, #G_PRIORITY_DEFAULT_IDLE. See gdk_threads_add_idle_fu... |
| threads_add_idle_full | `threads_add_idle_full(priority: gint, function: GLib.SourceFunc, data: gpointer?, notify: GLib.DestroyNotify?) -> guint` | gdk_threads_add_idle_full | 2.12 | Adds a function to be called whenever there are no higher priority events pending. If the function returns %FALSE it is automatically removed from ... |
| threads_add_timeout | `threads_add_timeout(interval: guint, function: GLib.SourceFunc, data: gpointer?) -> guint` | gdk_threads_add_timeout | 2.12 | A wrapper for the common usage of gdk_threads_add_timeout_full() assigning the default priority, #G_PRIORITY_DEFAULT. See gdk_threads_add_timeout_f... |
| threads_add_timeout_full | `threads_add_timeout_full(priority: gint, interval: guint, function: GLib.SourceFunc, data: gpointer?, notify: GLib.DestroyNotify?) -> guint` | gdk_threads_add_timeout_full | 2.12 | Sets a function to be called at regular intervals holding the GDK lock, with the given priority. The function is called repeatedly until it returns... |
| threads_add_timeout_seconds | `threads_add_timeout_seconds(interval: guint, function: GLib.SourceFunc, data: gpointer?) -> guint` | gdk_threads_add_timeout_seconds | 2.14 | A wrapper for the common usage of gdk_threads_add_timeout_seconds_full() assigning the default priority, #G_PRIORITY_DEFAULT. For details, see gdk_... |
| threads_add_timeout_seconds_full | `threads_add_timeout_seconds_full(priority: gint, interval: guint, function: GLib.SourceFunc, data: gpointer?, notify: GLib.DestroyNotify?) -> guint` | gdk_threads_add_timeout_seconds_full | 2.14 | A variant of gdk_threads_add_timeout_full() with second-granularity. See g_timeout_add_seconds_full() for a discussion of why it is a good idea to ... |
| threads_enter | `threads_enter() -> none` | gdk_threads_enter |  | This function marks the beginning of a critical section in which GDK and GTK+ functions can be called safely and without causing race conditions. O... |
| threads_init | `threads_init() -> none` | gdk_threads_init |  | Initializes GDK so that it can be used from multiple threads in conjunction with gdk_threads_enter() and gdk_threads_leave(). This call must be mad... |
| threads_leave | `threads_leave() -> none` | gdk_threads_leave |  | Leaves a critical region begun with gdk_threads_enter(). |
| threads_set_lock_functions | `threads_set_lock_functions(enter_fn: GObject.Callback, leave_fn: GObject.Callback) -> none` | gdk_threads_set_lock_functions | 2.4 | Allows the application to replace the standard method that GDK uses to protect its data structures. Normally, GDK creates a single #GMutex that is ... |
| unicode_to_keyval | `unicode_to_keyval(wc: guint32) -> guint` | gdk_unicode_to_keyval |  | Convert from a ISO10646 character to a key symbol. |
| utf8_to_string_target | `utf8_to_string_target(str: utf8) -> utf8` | gdk_utf8_to_string_target |  | Converts an UTF-8 string into the best possible representation as a STRING. The representation of characters not in STRING is not specified; it may... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| EventFunc | `EventFunc(event: Event, data: gpointer?) -> none` |  |  | Specifies the type of function passed to gdk_event_handler_set() to handle all GDK events. |
| FilterFunc | `FilterFunc(xevent: XEvent, event: Event, data: gpointer?) -> FilterReturn` |  |  | Specifies the type of function used to filter native events before they are converted to GDK events. When a filter is called, @event is unpopulated... |
| SeatGrabPrepareFunc | `SeatGrabPrepareFunc(seat: Seat, window: Window, user_data: gpointer?) -> none` |  | 3.20 | Type of the callback used to set up @window so it can be grabbed. A typical action would be ensuring the window is visible, although there's room f... |
| WindowChildFunc | `WindowChildFunc(window: Window, user_data: gpointer?) -> gboolean` |  |  | A function of this type is passed to gdk_window_invalidate_maybe_recurse(). It gets called for each child of the window to determine whether to rec... |
| WindowInvalidateHandlerFunc | `WindowInvalidateHandlerFunc(window: Window, region: cairo.Region) -> none` |  | 3.10 | Whenever some area of the window is invalidated (directly in the window or in a child window) this gets called with @region in the coordinate space... |

## Constants

| Name | Type |
| --- | --- |
| BUTTON_MIDDLE | gint |
| BUTTON_PRIMARY | gint |
| BUTTON_SECONDARY | gint |
| CURRENT_TIME | gint |
| EVENT_PROPAGATE | gboolean |
| EVENT_STOP | gboolean |
| KEY_0 | gint |
| KEY_1 | gint |
| KEY_2 | gint |
| KEY_3 | gint |
| KEY_3270_AltCursor | gint |
| KEY_3270_Attn | gint |
| KEY_3270_BackTab | gint |
| KEY_3270_ChangeScreen | gint |
| KEY_3270_Copy | gint |
| KEY_3270_CursorBlink | gint |
| KEY_3270_CursorSelect | gint |
| KEY_3270_DeleteWord | gint |
| KEY_3270_Duplicate | gint |
| KEY_3270_Enter | gint |
| KEY_3270_EraseEOF | gint |
| KEY_3270_EraseInput | gint |
| KEY_3270_ExSelect | gint |
| KEY_3270_FieldMark | gint |
| KEY_3270_Ident | gint |
| KEY_3270_Jump | gint |
| KEY_3270_KeyClick | gint |
| KEY_3270_Left2 | gint |
| KEY_3270_PA1 | gint |
| KEY_3270_PA2 | gint |
| KEY_3270_PA3 | gint |
| KEY_3270_Play | gint |
| KEY_3270_PrintScreen | gint |
| KEY_3270_Quit | gint |
| KEY_3270_Record | gint |
| KEY_3270_Reset | gint |
| KEY_3270_Right2 | gint |
| KEY_3270_Rule | gint |
| KEY_3270_Setup | gint |
| KEY_3270_Test | gint |
| KEY_4 | gint |
| KEY_5 | gint |
| KEY_6 | gint |
| KEY_7 | gint |
| KEY_8 | gint |
| KEY_9 | gint |
| KEY_a | gint |
| KEY_A | gint |
| KEY_Aacute | gint |
| KEY_aacute | gint |
| KEY_Abelowdot | gint |
| KEY_abelowdot | gint |
| KEY_abovedot | gint |
| KEY_abreve | gint |
| KEY_Abreve | gint |
| KEY_Abreveacute | gint |
| KEY_abreveacute | gint |
| KEY_abrevebelowdot | gint |
| KEY_Abrevebelowdot | gint |
| KEY_abrevegrave | gint |
| KEY_Abrevegrave | gint |
| KEY_abrevehook | gint |
| KEY_Abrevehook | gint |
| KEY_Abrevetilde | gint |
| KEY_abrevetilde | gint |
| KEY_AccessX_Enable | gint |
| KEY_AccessX_Feedback_Enable | gint |
| KEY_acircumflex | gint |
| KEY_Acircumflex | gint |
| KEY_acircumflexacute | gint |
| KEY_Acircumflexacute | gint |
| KEY_Acircumflexbelowdot | gint |
| KEY_acircumflexbelowdot | gint |
| KEY_Acircumflexgrave | gint |
| KEY_acircumflexgrave | gint |
| KEY_Acircumflexhook | gint |
| KEY_acircumflexhook | gint |
| KEY_acircumflextilde | gint |
| KEY_Acircumflextilde | gint |
| KEY_acute | gint |
| KEY_AddFavorite | gint |
| KEY_adiaeresis | gint |
| KEY_Adiaeresis | gint |
| KEY_AE | gint |
| KEY_ae | gint |
| KEY_agrave | gint |
| KEY_Agrave | gint |
| KEY_Ahook | gint |
| KEY_ahook | gint |
| KEY_Alt_L | gint |
| KEY_Alt_R | gint |
| KEY_amacron | gint |
| KEY_Amacron | gint |
| KEY_ampersand | gint |
| KEY_Aogonek | gint |
| KEY_aogonek | gint |
| KEY_apostrophe | gint |
| KEY_ApplicationLeft | gint |
| KEY_ApplicationRight | gint |
| KEY_approxeq | gint |
| KEY_approximate | gint |
| KEY_Arabic_0 | gint |
| KEY_Arabic_1 | gint |
| KEY_Arabic_2 | gint |
| KEY_Arabic_3 | gint |
| KEY_Arabic_4 | gint |
| KEY_Arabic_5 | gint |
| KEY_Arabic_6 | gint |
| KEY_Arabic_7 | gint |
| KEY_Arabic_8 | gint |
| KEY_Arabic_9 | gint |
| KEY_Arabic_ain | gint |
| KEY_Arabic_alef | gint |
| KEY_Arabic_alefmaksura | gint |
| KEY_Arabic_beh | gint |
| KEY_Arabic_comma | gint |
| KEY_Arabic_dad | gint |
| KEY_Arabic_dal | gint |
| KEY_Arabic_damma | gint |
| KEY_Arabic_dammatan | gint |
| KEY_Arabic_ddal | gint |
| KEY_Arabic_farsi_yeh | gint |
| KEY_Arabic_fatha | gint |
| KEY_Arabic_fathatan | gint |
| KEY_Arabic_feh | gint |
| KEY_Arabic_fullstop | gint |
| KEY_Arabic_gaf | gint |
| KEY_Arabic_ghain | gint |
| KEY_Arabic_ha | gint |
| KEY_Arabic_hah | gint |
| KEY_Arabic_hamza | gint |
| KEY_Arabic_hamza_above | gint |
| KEY_Arabic_hamza_below | gint |
| KEY_Arabic_hamzaonalef | gint |
| KEY_Arabic_hamzaonwaw | gint |
| KEY_Arabic_hamzaonyeh | gint |
| KEY_Arabic_hamzaunderalef | gint |
| KEY_Arabic_heh | gint |
| KEY_Arabic_heh_doachashmee | gint |
| KEY_Arabic_heh_goal | gint |
| KEY_Arabic_jeem | gint |
| KEY_Arabic_jeh | gint |
| KEY_Arabic_kaf | gint |
| KEY_Arabic_kasra | gint |
| KEY_Arabic_kasratan | gint |
| KEY_Arabic_keheh | gint |
| KEY_Arabic_khah | gint |
| KEY_Arabic_lam | gint |
| KEY_Arabic_madda_above | gint |
| KEY_Arabic_maddaonalef | gint |
| KEY_Arabic_meem | gint |
| KEY_Arabic_noon | gint |
| KEY_Arabic_noon_ghunna | gint |
| KEY_Arabic_peh | gint |
| KEY_Arabic_percent | gint |
| KEY_Arabic_qaf | gint |
| KEY_Arabic_question_mark | gint |
| KEY_Arabic_ra | gint |
| KEY_Arabic_rreh | gint |
| KEY_Arabic_sad | gint |
| KEY_Arabic_seen | gint |
| KEY_Arabic_semicolon | gint |
| KEY_Arabic_shadda | gint |
| KEY_Arabic_sheen | gint |
| KEY_Arabic_sukun | gint |
| KEY_Arabic_superscript_alef | gint |
| KEY_Arabic_switch | gint |
| KEY_Arabic_tah | gint |
| KEY_Arabic_tatweel | gint |
| KEY_Arabic_tcheh | gint |
| KEY_Arabic_teh | gint |
| KEY_Arabic_tehmarbuta | gint |
| KEY_Arabic_thal | gint |
| KEY_Arabic_theh | gint |
| KEY_Arabic_tteh | gint |
| KEY_Arabic_veh | gint |
| KEY_Arabic_waw | gint |
| KEY_Arabic_yeh | gint |
| KEY_Arabic_yeh_baree | gint |
| KEY_Arabic_zah | gint |
| KEY_Arabic_zain | gint |
| KEY_Aring | gint |
| KEY_aring | gint |
| KEY_Armenian_accent | gint |
| KEY_Armenian_amanak | gint |
| KEY_Armenian_apostrophe | gint |
| KEY_Armenian_AT | gint |
| KEY_Armenian_at | gint |
| KEY_Armenian_ayb | gint |
| KEY_Armenian_AYB | gint |
| KEY_Armenian_BEN | gint |
| KEY_Armenian_ben | gint |
| KEY_Armenian_but | gint |
| KEY_Armenian_cha | gint |
| KEY_Armenian_CHA | gint |
| KEY_Armenian_DA | gint |
| KEY_Armenian_da | gint |
| KEY_Armenian_dza | gint |
| KEY_Armenian_DZA | gint |
| KEY_Armenian_e | gint |
| KEY_Armenian_E | gint |
| KEY_Armenian_exclam | gint |
| KEY_Armenian_FE | gint |
| KEY_Armenian_fe | gint |
| KEY_Armenian_full_stop | gint |
| KEY_Armenian_GHAT | gint |
| KEY_Armenian_ghat | gint |
| KEY_Armenian_GIM | gint |
| KEY_Armenian_gim | gint |
| KEY_Armenian_HI | gint |
| KEY_Armenian_hi | gint |
| KEY_Armenian_ho | gint |
| KEY_Armenian_HO | gint |
| KEY_Armenian_hyphen | gint |
| KEY_Armenian_INI | gint |
| KEY_Armenian_ini | gint |
| KEY_Armenian_je | gint |
| KEY_Armenian_JE | gint |
| KEY_Armenian_ke | gint |
| KEY_Armenian_KE | gint |
| KEY_Armenian_ken | gint |
| KEY_Armenian_KEN | gint |
| KEY_Armenian_khe | gint |
| KEY_Armenian_KHE | gint |
| KEY_Armenian_ligature_ew | gint |
| KEY_Armenian_lyun | gint |
| KEY_Armenian_LYUN | gint |
| KEY_Armenian_men | gint |
| KEY_Armenian_MEN | gint |
| KEY_Armenian_NU | gint |
| KEY_Armenian_nu | gint |
| KEY_Armenian_o | gint |
| KEY_Armenian_O | gint |
| KEY_Armenian_paruyk | gint |
| KEY_Armenian_PE | gint |
| KEY_Armenian_pe | gint |
| KEY_Armenian_pyur | gint |
| KEY_Armenian_PYUR | gint |
| KEY_Armenian_question | gint |
| KEY_Armenian_RA | gint |
| KEY_Armenian_ra | gint |
| KEY_Armenian_RE | gint |
| KEY_Armenian_re | gint |
| KEY_Armenian_se | gint |
| KEY_Armenian_SE | gint |
| KEY_Armenian_separation_mark | gint |
| KEY_Armenian_SHA | gint |
| KEY_Armenian_sha | gint |
| KEY_Armenian_shesht | gint |
| KEY_Armenian_TCHE | gint |
| KEY_Armenian_tche | gint |
| KEY_Armenian_to | gint |
| KEY_Armenian_TO | gint |
| KEY_Armenian_tsa | gint |
| KEY_Armenian_TSA | gint |
| KEY_Armenian_tso | gint |
| KEY_Armenian_TSO | gint |
| KEY_Armenian_TYUN | gint |
| KEY_Armenian_tyun | gint |
| KEY_Armenian_verjaket | gint |
| KEY_Armenian_vev | gint |
| KEY_Armenian_VEV | gint |
| KEY_Armenian_vo | gint |
| KEY_Armenian_VO | gint |
| KEY_Armenian_vyun | gint |
| KEY_Armenian_VYUN | gint |
| KEY_Armenian_YECH | gint |
| KEY_Armenian_yech | gint |
| KEY_Armenian_yentamna | gint |
| KEY_Armenian_ZA | gint |
| KEY_Armenian_za | gint |
| KEY_Armenian_zhe | gint |
| KEY_Armenian_ZHE | gint |
| KEY_asciicircum | gint |
| KEY_asciitilde | gint |
| KEY_asterisk | gint |
| KEY_at | gint |
| KEY_atilde | gint |
| KEY_Atilde | gint |
| KEY_AudibleBell_Enable | gint |
| KEY_AudioCycleTrack | gint |
| KEY_AudioForward | gint |
| KEY_AudioLowerVolume | gint |
| KEY_AudioMedia | gint |
| KEY_AudioMicMute | gint |
| KEY_AudioMute | gint |
| KEY_AudioNext | gint |
| KEY_AudioPause | gint |
| KEY_AudioPlay | gint |
| KEY_AudioPreset | gint |
| KEY_AudioPrev | gint |
| KEY_AudioRaiseVolume | gint |
| KEY_AudioRandomPlay | gint |
| KEY_AudioRecord | gint |
| KEY_AudioRepeat | gint |
| KEY_AudioRewind | gint |
| KEY_AudioStop | gint |
| KEY_Away | gint |
| KEY_B | gint |
| KEY_b | gint |
| KEY_Babovedot | gint |
| KEY_babovedot | gint |
| KEY_Back | gint |
| KEY_BackForward | gint |
| KEY_backslash | gint |
| KEY_BackSpace | gint |
| KEY_ballotcross | gint |
| KEY_bar | gint |
| KEY_Battery | gint |
| KEY_because | gint |
| KEY_Begin | gint |
| KEY_blank | gint |
| KEY_Blue | gint |
| KEY_Bluetooth | gint |
| KEY_Book | gint |
| KEY_botintegral | gint |
| KEY_botleftparens | gint |
| KEY_botleftsqbracket | gint |
| KEY_botleftsummation | gint |
| KEY_botrightparens | gint |
| KEY_botrightsqbracket | gint |
| KEY_botrightsummation | gint |
| KEY_bott | gint |
| KEY_botvertsummationconnector | gint |
| KEY_BounceKeys_Enable | gint |
| KEY_braceleft | gint |
| KEY_braceright | gint |
| KEY_bracketleft | gint |
| KEY_bracketright | gint |
| KEY_braille_blank | gint |
| KEY_braille_dot_1 | gint |
| KEY_braille_dot_10 | gint |
| KEY_braille_dot_2 | gint |
| KEY_braille_dot_3 | gint |
| KEY_braille_dot_4 | gint |
| KEY_braille_dot_5 | gint |
| KEY_braille_dot_6 | gint |
| KEY_braille_dot_7 | gint |
| KEY_braille_dot_8 | gint |
| KEY_braille_dot_9 | gint |
| KEY_braille_dots_1 | gint |
| KEY_braille_dots_12 | gint |
| KEY_braille_dots_123 | gint |
| KEY_braille_dots_1234 | gint |
| KEY_braille_dots_12345 | gint |
| KEY_braille_dots_123456 | gint |
| KEY_braille_dots_1234567 | gint |
| KEY_braille_dots_12345678 | gint |
| KEY_braille_dots_1234568 | gint |
| KEY_braille_dots_123457 | gint |
| KEY_braille_dots_1234578 | gint |
| KEY_braille_dots_123458 | gint |
| KEY_braille_dots_12346 | gint |
| KEY_braille_dots_123467 | gint |
| KEY_braille_dots_1234678 | gint |
| KEY_braille_dots_123468 | gint |
| KEY_braille_dots_12347 | gint |
| KEY_braille_dots_123478 | gint |
| KEY_braille_dots_12348 | gint |
| KEY_braille_dots_1235 | gint |
| KEY_braille_dots_12356 | gint |
| KEY_braille_dots_123567 | gint |
| KEY_braille_dots_1235678 | gint |
| KEY_braille_dots_123568 | gint |
| KEY_braille_dots_12357 | gint |
| KEY_braille_dots_123578 | gint |
| KEY_braille_dots_12358 | gint |
| KEY_braille_dots_1236 | gint |
| KEY_braille_dots_12367 | gint |
| KEY_braille_dots_123678 | gint |
| KEY_braille_dots_12368 | gint |
| KEY_braille_dots_1237 | gint |
| KEY_braille_dots_12378 | gint |
| KEY_braille_dots_1238 | gint |
| KEY_braille_dots_124 | gint |
| KEY_braille_dots_1245 | gint |
| KEY_braille_dots_12456 | gint |
| KEY_braille_dots_124567 | gint |
| KEY_braille_dots_1245678 | gint |
| KEY_braille_dots_124568 | gint |
| KEY_braille_dots_12457 | gint |
| KEY_braille_dots_124578 | gint |
| KEY_braille_dots_12458 | gint |
| KEY_braille_dots_1246 | gint |
| KEY_braille_dots_12467 | gint |
| KEY_braille_dots_124678 | gint |
| KEY_braille_dots_12468 | gint |
| KEY_braille_dots_1247 | gint |
| KEY_braille_dots_12478 | gint |
| KEY_braille_dots_1248 | gint |
| KEY_braille_dots_125 | gint |
| KEY_braille_dots_1256 | gint |
| KEY_braille_dots_12567 | gint |
| KEY_braille_dots_125678 | gint |
| KEY_braille_dots_12568 | gint |
| KEY_braille_dots_1257 | gint |
| KEY_braille_dots_12578 | gint |
| KEY_braille_dots_1258 | gint |
| KEY_braille_dots_126 | gint |
| KEY_braille_dots_1267 | gint |
| KEY_braille_dots_12678 | gint |
| KEY_braille_dots_1268 | gint |
| KEY_braille_dots_127 | gint |
| KEY_braille_dots_1278 | gint |
| KEY_braille_dots_128 | gint |
| KEY_braille_dots_13 | gint |
| KEY_braille_dots_134 | gint |
| KEY_braille_dots_1345 | gint |
| KEY_braille_dots_13456 | gint |
| KEY_braille_dots_134567 | gint |
| KEY_braille_dots_1345678 | gint |
| KEY_braille_dots_134568 | gint |
| KEY_braille_dots_13457 | gint |
| KEY_braille_dots_134578 | gint |
| KEY_braille_dots_13458 | gint |
| KEY_braille_dots_1346 | gint |
| KEY_braille_dots_13467 | gint |
| KEY_braille_dots_134678 | gint |
| KEY_braille_dots_13468 | gint |
| KEY_braille_dots_1347 | gint |
| KEY_braille_dots_13478 | gint |
| KEY_braille_dots_1348 | gint |
| KEY_braille_dots_135 | gint |
| KEY_braille_dots_1356 | gint |
| KEY_braille_dots_13567 | gint |
| KEY_braille_dots_135678 | gint |
| KEY_braille_dots_13568 | gint |
| KEY_braille_dots_1357 | gint |
| KEY_braille_dots_13578 | gint |
| KEY_braille_dots_1358 | gint |
| KEY_braille_dots_136 | gint |
| KEY_braille_dots_1367 | gint |
| KEY_braille_dots_13678 | gint |
| KEY_braille_dots_1368 | gint |
| KEY_braille_dots_137 | gint |
| KEY_braille_dots_1378 | gint |
| KEY_braille_dots_138 | gint |
| KEY_braille_dots_14 | gint |
| KEY_braille_dots_145 | gint |
| KEY_braille_dots_1456 | gint |
| KEY_braille_dots_14567 | gint |
| KEY_braille_dots_145678 | gint |
| KEY_braille_dots_14568 | gint |
| KEY_braille_dots_1457 | gint |
| KEY_braille_dots_14578 | gint |
| KEY_braille_dots_1458 | gint |
| KEY_braille_dots_146 | gint |
| KEY_braille_dots_1467 | gint |
| KEY_braille_dots_14678 | gint |
| KEY_braille_dots_1468 | gint |
| KEY_braille_dots_147 | gint |
| KEY_braille_dots_1478 | gint |
| KEY_braille_dots_148 | gint |
| KEY_braille_dots_15 | gint |
| KEY_braille_dots_156 | gint |
| KEY_braille_dots_1567 | gint |
| KEY_braille_dots_15678 | gint |
| KEY_braille_dots_1568 | gint |
| KEY_braille_dots_157 | gint |
| KEY_braille_dots_1578 | gint |
| KEY_braille_dots_158 | gint |
| KEY_braille_dots_16 | gint |
| KEY_braille_dots_167 | gint |
| KEY_braille_dots_1678 | gint |
| KEY_braille_dots_168 | gint |
| KEY_braille_dots_17 | gint |
| KEY_braille_dots_178 | gint |
| KEY_braille_dots_18 | gint |
| KEY_braille_dots_2 | gint |
| KEY_braille_dots_23 | gint |
| KEY_braille_dots_234 | gint |
| KEY_braille_dots_2345 | gint |
| KEY_braille_dots_23456 | gint |
| KEY_braille_dots_234567 | gint |
| KEY_braille_dots_2345678 | gint |
| KEY_braille_dots_234568 | gint |
| KEY_braille_dots_23457 | gint |
| KEY_braille_dots_234578 | gint |
| KEY_braille_dots_23458 | gint |
| KEY_braille_dots_2346 | gint |
| KEY_braille_dots_23467 | gint |
| KEY_braille_dots_234678 | gint |
| KEY_braille_dots_23468 | gint |
| KEY_braille_dots_2347 | gint |
| KEY_braille_dots_23478 | gint |
| KEY_braille_dots_2348 | gint |
| KEY_braille_dots_235 | gint |
| KEY_braille_dots_2356 | gint |
| KEY_braille_dots_23567 | gint |
| KEY_braille_dots_235678 | gint |
| KEY_braille_dots_23568 | gint |
| KEY_braille_dots_2357 | gint |
| KEY_braille_dots_23578 | gint |
| KEY_braille_dots_2358 | gint |
| KEY_braille_dots_236 | gint |
| KEY_braille_dots_2367 | gint |
| KEY_braille_dots_23678 | gint |
| KEY_braille_dots_2368 | gint |
| KEY_braille_dots_237 | gint |
| KEY_braille_dots_2378 | gint |
| KEY_braille_dots_238 | gint |
| KEY_braille_dots_24 | gint |
| KEY_braille_dots_245 | gint |
| KEY_braille_dots_2456 | gint |
| KEY_braille_dots_24567 | gint |
| KEY_braille_dots_245678 | gint |
| KEY_braille_dots_24568 | gint |
| KEY_braille_dots_2457 | gint |
| KEY_braille_dots_24578 | gint |
| KEY_braille_dots_2458 | gint |
| KEY_braille_dots_246 | gint |
| KEY_braille_dots_2467 | gint |
| KEY_braille_dots_24678 | gint |
| KEY_braille_dots_2468 | gint |
| KEY_braille_dots_247 | gint |
| KEY_braille_dots_2478 | gint |
| KEY_braille_dots_248 | gint |
| KEY_braille_dots_25 | gint |
| KEY_braille_dots_256 | gint |
| KEY_braille_dots_2567 | gint |
| KEY_braille_dots_25678 | gint |
| KEY_braille_dots_2568 | gint |
| KEY_braille_dots_257 | gint |
| KEY_braille_dots_2578 | gint |
| KEY_braille_dots_258 | gint |
| KEY_braille_dots_26 | gint |
| KEY_braille_dots_267 | gint |
| KEY_braille_dots_2678 | gint |
| KEY_braille_dots_268 | gint |
| KEY_braille_dots_27 | gint |
| KEY_braille_dots_278 | gint |
| KEY_braille_dots_28 | gint |
| KEY_braille_dots_3 | gint |
| KEY_braille_dots_34 | gint |
| KEY_braille_dots_345 | gint |
| KEY_braille_dots_3456 | gint |
| KEY_braille_dots_34567 | gint |
| KEY_braille_dots_345678 | gint |
| KEY_braille_dots_34568 | gint |
| KEY_braille_dots_3457 | gint |
| KEY_braille_dots_34578 | gint |
| KEY_braille_dots_3458 | gint |
| KEY_braille_dots_346 | gint |
| KEY_braille_dots_3467 | gint |
| KEY_braille_dots_34678 | gint |
| KEY_braille_dots_3468 | gint |
| KEY_braille_dots_347 | gint |
| KEY_braille_dots_3478 | gint |
| KEY_braille_dots_348 | gint |
| KEY_braille_dots_35 | gint |
| KEY_braille_dots_356 | gint |
| KEY_braille_dots_3567 | gint |
| KEY_braille_dots_35678 | gint |
| KEY_braille_dots_3568 | gint |
| KEY_braille_dots_357 | gint |
| KEY_braille_dots_3578 | gint |
| KEY_braille_dots_358 | gint |
| KEY_braille_dots_36 | gint |
| KEY_braille_dots_367 | gint |
| KEY_braille_dots_3678 | gint |
| KEY_braille_dots_368 | gint |
| KEY_braille_dots_37 | gint |
| KEY_braille_dots_378 | gint |
| KEY_braille_dots_38 | gint |
| KEY_braille_dots_4 | gint |
| KEY_braille_dots_45 | gint |
| KEY_braille_dots_456 | gint |
| KEY_braille_dots_4567 | gint |
| KEY_braille_dots_45678 | gint |
| KEY_braille_dots_4568 | gint |
| KEY_braille_dots_457 | gint |
| KEY_braille_dots_4578 | gint |
| KEY_braille_dots_458 | gint |
| KEY_braille_dots_46 | gint |
| KEY_braille_dots_467 | gint |
| KEY_braille_dots_4678 | gint |
| KEY_braille_dots_468 | gint |
| KEY_braille_dots_47 | gint |
| KEY_braille_dots_478 | gint |
| KEY_braille_dots_48 | gint |
| KEY_braille_dots_5 | gint |
| KEY_braille_dots_56 | gint |
| KEY_braille_dots_567 | gint |
| KEY_braille_dots_5678 | gint |
| KEY_braille_dots_568 | gint |
| KEY_braille_dots_57 | gint |
| KEY_braille_dots_578 | gint |
| KEY_braille_dots_58 | gint |
| KEY_braille_dots_6 | gint |
| KEY_braille_dots_67 | gint |
| KEY_braille_dots_678 | gint |
| KEY_braille_dots_68 | gint |
| KEY_braille_dots_7 | gint |
| KEY_braille_dots_78 | gint |
| KEY_braille_dots_8 | gint |
| KEY_Break | gint |
| KEY_breve | gint |
| KEY_BrightnessAdjust | gint |
| KEY_brokenbar | gint |
| KEY_Byelorussian_shortu | gint |
| KEY_Byelorussian_SHORTU | gint |
| KEY_C | gint |
| KEY_c | gint |
| KEY_C_h | gint |
| KEY_C_H | gint |
| KEY_c_h | gint |
| KEY_Cabovedot | gint |
| KEY_cabovedot | gint |
| KEY_cacute | gint |
| KEY_Cacute | gint |
| KEY_Calculator | gint |
| KEY_Calendar | gint |
| KEY_Cancel | gint |
| KEY_Caps_Lock | gint |
| KEY_careof | gint |
| KEY_caret | gint |
| KEY_caron | gint |
| KEY_Ccaron | gint |
| KEY_ccaron | gint |
| KEY_Ccedilla | gint |
| KEY_ccedilla | gint |
| KEY_Ccircumflex | gint |
| KEY_ccircumflex | gint |
| KEY_CD | gint |
| KEY_cedilla | gint |
| KEY_cent | gint |
| KEY_CH | gint |
| KEY_Ch | gint |
| KEY_ch | gint |
| KEY_checkerboard | gint |
| KEY_checkmark | gint |
| KEY_circle | gint |
| KEY_Clear | gint |
| KEY_ClearGrab | gint |
| KEY_Close | gint |
| KEY_club | gint |
| KEY_Codeinput | gint |
| KEY_colon | gint |
| KEY_ColonSign | gint |
| KEY_comma | gint |
| KEY_Community | gint |
| KEY_containsas | gint |
| KEY_ContrastAdjust | gint |
| KEY_Control_L | gint |
| KEY_Control_R | gint |
| KEY_Copy | gint |
| KEY_copyright | gint |
| KEY_cr | gint |
| KEY_crossinglines | gint |
| KEY_CruzeiroSign | gint |
| KEY_cuberoot | gint |
| KEY_currency | gint |
| KEY_cursor | gint |
| KEY_Cut | gint |
| KEY_CycleAngle | gint |
| KEY_Cyrillic_A | gint |
| KEY_Cyrillic_a | gint |
| KEY_Cyrillic_BE | gint |
| KEY_Cyrillic_be | gint |
| KEY_Cyrillic_CHE | gint |
| KEY_Cyrillic_che | gint |
| KEY_Cyrillic_CHE_descender | gint |
| KEY_Cyrillic_che_descender | gint |
| KEY_Cyrillic_CHE_vertstroke | gint |
| KEY_Cyrillic_che_vertstroke | gint |
| KEY_Cyrillic_DE | gint |
| KEY_Cyrillic_de | gint |
| KEY_Cyrillic_DZHE | gint |
| KEY_Cyrillic_dzhe | gint |
| KEY_Cyrillic_E | gint |
| KEY_Cyrillic_e | gint |
| KEY_Cyrillic_ef | gint |
| KEY_Cyrillic_EF | gint |
| KEY_Cyrillic_EL | gint |
| KEY_Cyrillic_el | gint |
| KEY_Cyrillic_EM | gint |
| KEY_Cyrillic_em | gint |
| KEY_Cyrillic_EN | gint |
| KEY_Cyrillic_en | gint |
| KEY_Cyrillic_EN_descender | gint |
| KEY_Cyrillic_en_descender | gint |
| KEY_Cyrillic_ER | gint |
| KEY_Cyrillic_er | gint |
| KEY_Cyrillic_es | gint |
| KEY_Cyrillic_ES | gint |
| KEY_Cyrillic_GHE | gint |
| KEY_Cyrillic_ghe | gint |
| KEY_Cyrillic_GHE_bar | gint |
| KEY_Cyrillic_ghe_bar | gint |
| KEY_Cyrillic_HA | gint |
| KEY_Cyrillic_ha | gint |
| KEY_Cyrillic_HA_descender | gint |
| KEY_Cyrillic_ha_descender | gint |
| KEY_Cyrillic_HARDSIGN | gint |
| KEY_Cyrillic_hardsign | gint |
| KEY_Cyrillic_I | gint |
| KEY_Cyrillic_i | gint |
| KEY_Cyrillic_i_macron | gint |
| KEY_Cyrillic_I_macron | gint |
| KEY_Cyrillic_ie | gint |
| KEY_Cyrillic_IE | gint |
| KEY_Cyrillic_io | gint |
| KEY_Cyrillic_IO | gint |
| KEY_Cyrillic_JE | gint |
| KEY_Cyrillic_je | gint |
| KEY_Cyrillic_KA | gint |
| KEY_Cyrillic_ka | gint |
| KEY_Cyrillic_KA_descender | gint |
| KEY_Cyrillic_ka_descender | gint |
| KEY_Cyrillic_KA_vertstroke | gint |
| KEY_Cyrillic_ka_vertstroke | gint |
| KEY_Cyrillic_lje | gint |
| KEY_Cyrillic_LJE | gint |
| KEY_Cyrillic_NJE | gint |
| KEY_Cyrillic_nje | gint |
| KEY_Cyrillic_O | gint |
| KEY_Cyrillic_o | gint |
| KEY_Cyrillic_O_bar | gint |
| KEY_Cyrillic_o_bar | gint |
| KEY_Cyrillic_PE | gint |
| KEY_Cyrillic_pe | gint |
| KEY_Cyrillic_schwa | gint |
| KEY_Cyrillic_SCHWA | gint |
| KEY_Cyrillic_SHA | gint |
| KEY_Cyrillic_sha | gint |
| KEY_Cyrillic_SHCHA | gint |
| KEY_Cyrillic_shcha | gint |
| KEY_Cyrillic_SHHA | gint |
| KEY_Cyrillic_shha | gint |
| KEY_Cyrillic_SHORTI | gint |
| KEY_Cyrillic_shorti | gint |
| KEY_Cyrillic_SOFTSIGN | gint |
| KEY_Cyrillic_softsign | gint |
| KEY_Cyrillic_TE | gint |
| KEY_Cyrillic_te | gint |
| KEY_Cyrillic_TSE | gint |
| KEY_Cyrillic_tse | gint |
| KEY_Cyrillic_U | gint |
| KEY_Cyrillic_u | gint |
| KEY_Cyrillic_U_macron | gint |
| KEY_Cyrillic_u_macron | gint |
| KEY_Cyrillic_U_straight | gint |
| KEY_Cyrillic_u_straight | gint |
| KEY_Cyrillic_U_straight_bar | gint |
| KEY_Cyrillic_u_straight_bar | gint |
| KEY_Cyrillic_VE | gint |
| KEY_Cyrillic_ve | gint |
| KEY_Cyrillic_YA | gint |
| KEY_Cyrillic_ya | gint |
| KEY_Cyrillic_YERU | gint |
| KEY_Cyrillic_yeru | gint |
| KEY_Cyrillic_YU | gint |
| KEY_Cyrillic_yu | gint |
| KEY_Cyrillic_ZE | gint |
| KEY_Cyrillic_ze | gint |
| KEY_Cyrillic_ZHE | gint |
| KEY_Cyrillic_zhe | gint |
| KEY_Cyrillic_ZHE_descender | gint |
| KEY_Cyrillic_zhe_descender | gint |
| KEY_D | gint |
| KEY_d | gint |
| KEY_dabovedot | gint |
| KEY_Dabovedot | gint |
| KEY_dagger | gint |
| KEY_Dcaron | gint |
| KEY_dcaron | gint |
| KEY_dead_A | gint |
| KEY_dead_a | gint |
| KEY_dead_abovecomma | gint |
| KEY_dead_abovedot | gint |
| KEY_dead_abovereversedcomma | gint |
| KEY_dead_abovering | gint |
| KEY_dead_aboveverticalline | gint |
| KEY_dead_acute | gint |
| KEY_dead_belowbreve | gint |
| KEY_dead_belowcircumflex | gint |
| KEY_dead_belowcomma | gint |
| KEY_dead_belowdiaeresis | gint |
| KEY_dead_belowdot | gint |
| KEY_dead_belowmacron | gint |
| KEY_dead_belowring | gint |
| KEY_dead_belowtilde | gint |
| KEY_dead_belowverticalline | gint |
| KEY_dead_breve | gint |
| KEY_dead_capital_schwa | gint |
| KEY_dead_caron | gint |
| KEY_dead_cedilla | gint |
| KEY_dead_circumflex | gint |
| KEY_dead_currency | gint |
| KEY_dead_dasia | gint |
| KEY_dead_diaeresis | gint |
| KEY_dead_doubleacute | gint |
| KEY_dead_doublegrave | gint |
| KEY_dead_E | gint |
| KEY_dead_e | gint |
| KEY_dead_grave | gint |
| KEY_dead_greek | gint |
| KEY_dead_hook | gint |
| KEY_dead_horn | gint |
| KEY_dead_I | gint |
| KEY_dead_i | gint |
| KEY_dead_invertedbreve | gint |
| KEY_dead_iota | gint |
| KEY_dead_longsolidusoverlay | gint |
| KEY_dead_lowline | gint |
| KEY_dead_macron | gint |
| KEY_dead_O | gint |
| KEY_dead_o | gint |
| KEY_dead_ogonek | gint |
| KEY_dead_perispomeni | gint |
| KEY_dead_psili | gint |
| KEY_dead_semivoiced_sound | gint |
| KEY_dead_small_schwa | gint |
| KEY_dead_stroke | gint |
| KEY_dead_tilde | gint |
| KEY_dead_U | gint |
| KEY_dead_u | gint |
| KEY_dead_voiced_sound | gint |
| KEY_decimalpoint | gint |
| KEY_degree | gint |
| KEY_Delete | gint |
| KEY_diaeresis | gint |
| KEY_diamond | gint |
| KEY_digitspace | gint |
| KEY_dintegral | gint |
| KEY_Display | gint |
| KEY_division | gint |
| KEY_Documents | gint |
| KEY_dollar | gint |
| KEY_DongSign | gint |
| KEY_DOS | gint |
| KEY_doubbaselinedot | gint |
| KEY_doubleacute | gint |
| KEY_doubledagger | gint |
| KEY_doublelowquotemark | gint |
| KEY_Down | gint |
| KEY_downarrow | gint |
| KEY_downcaret | gint |
| KEY_downshoe | gint |
| KEY_downstile | gint |
| KEY_downtack | gint |
| KEY_dstroke | gint |
| KEY_Dstroke | gint |
| KEY_E | gint |
| KEY_e | gint |
| KEY_eabovedot | gint |
| KEY_Eabovedot | gint |
| KEY_eacute | gint |
| KEY_Eacute | gint |
| KEY_ebelowdot | gint |
| KEY_Ebelowdot | gint |
| KEY_ecaron | gint |
| KEY_Ecaron | gint |
| KEY_ecircumflex | gint |
| KEY_Ecircumflex | gint |
| KEY_Ecircumflexacute | gint |
| KEY_ecircumflexacute | gint |
| KEY_ecircumflexbelowdot | gint |
| KEY_Ecircumflexbelowdot | gint |
| KEY_ecircumflexgrave | gint |
| KEY_Ecircumflexgrave | gint |
| KEY_ecircumflexhook | gint |
| KEY_Ecircumflexhook | gint |
| KEY_Ecircumflextilde | gint |
| KEY_ecircumflextilde | gint |
| KEY_EcuSign | gint |
| KEY_ediaeresis | gint |
| KEY_Ediaeresis | gint |
| KEY_egrave | gint |
| KEY_Egrave | gint |
| KEY_ehook | gint |
| KEY_Ehook | gint |
| KEY_eightsubscript | gint |
| KEY_eightsuperior | gint |
| KEY_Eisu_Shift | gint |
| KEY_Eisu_toggle | gint |
| KEY_Eject | gint |
| KEY_elementof | gint |
| KEY_ellipsis | gint |
| KEY_em3space | gint |
| KEY_em4space | gint |
| KEY_emacron | gint |
| KEY_Emacron | gint |
| KEY_emdash | gint |
| KEY_emfilledcircle | gint |
| KEY_emfilledrect | gint |
| KEY_emopencircle | gint |
| KEY_emopenrectangle | gint |
| KEY_emptyset | gint |
| KEY_emspace | gint |
| KEY_End | gint |
| KEY_endash | gint |
| KEY_enfilledcircbullet | gint |
| KEY_enfilledsqbullet | gint |
| KEY_eng | gint |
| KEY_ENG | gint |
| KEY_enopencircbullet | gint |
| KEY_enopensquarebullet | gint |
| KEY_enspace | gint |
| KEY_eogonek | gint |
| KEY_Eogonek | gint |
| KEY_equal | gint |
| KEY_Escape | gint |
| KEY_eth | gint |
| KEY_ETH | gint |
| KEY_Eth | gint |
| KEY_Etilde | gint |
| KEY_etilde | gint |
| KEY_EuroSign | gint |
| KEY_Excel | gint |
| KEY_exclam | gint |
| KEY_exclamdown | gint |
| KEY_Execute | gint |
| KEY_Explorer | gint |
| KEY_ezh | gint |
| KEY_EZH | gint |
| KEY_F | gint |
| KEY_f | gint |
| KEY_F1 | gint |
| KEY_F10 | gint |
| KEY_F11 | gint |
| KEY_F12 | gint |
| KEY_F13 | gint |
| KEY_F14 | gint |
| KEY_F15 | gint |
| KEY_F16 | gint |
| KEY_F17 | gint |
| KEY_F18 | gint |
| KEY_F19 | gint |
| KEY_F2 | gint |
| KEY_F20 | gint |
| KEY_F21 | gint |
| KEY_F22 | gint |
| KEY_F23 | gint |
| KEY_F24 | gint |
| KEY_F25 | gint |
| KEY_F26 | gint |
| KEY_F27 | gint |
| KEY_F28 | gint |
| KEY_F29 | gint |
| KEY_F3 | gint |
| KEY_F30 | gint |
| KEY_F31 | gint |
| KEY_F32 | gint |
| KEY_F33 | gint |
| KEY_F34 | gint |
| KEY_F35 | gint |
| KEY_F4 | gint |
| KEY_F5 | gint |
| KEY_F6 | gint |
| KEY_F7 | gint |
| KEY_F8 | gint |
| KEY_F9 | gint |
| KEY_Fabovedot | gint |
| KEY_fabovedot | gint |
| KEY_Farsi_0 | gint |
| KEY_Farsi_1 | gint |
| KEY_Farsi_2 | gint |
| KEY_Farsi_3 | gint |
| KEY_Farsi_4 | gint |
| KEY_Farsi_5 | gint |
| KEY_Farsi_6 | gint |
| KEY_Farsi_7 | gint |
| KEY_Farsi_8 | gint |
| KEY_Farsi_9 | gint |
| KEY_Farsi_yeh | gint |
| KEY_Favorites | gint |
| KEY_femalesymbol | gint |
| KEY_ff | gint |
| KEY_FFrancSign | gint |
| KEY_figdash | gint |
| KEY_filledlefttribullet | gint |
| KEY_filledrectbullet | gint |
| KEY_filledrighttribullet | gint |
| KEY_filledtribulletdown | gint |
| KEY_filledtribulletup | gint |
| KEY_Finance | gint |
| KEY_Find | gint |
| KEY_First_Virtual_Screen | gint |
| KEY_fiveeighths | gint |
| KEY_fivesixths | gint |
| KEY_fivesubscript | gint |
| KEY_fivesuperior | gint |
| KEY_Forward | gint |
| KEY_fourfifths | gint |
| KEY_foursubscript | gint |
| KEY_foursuperior | gint |
| KEY_fourthroot | gint |
| KEY_FrameBack | gint |
| KEY_FrameForward | gint |
| KEY_function | gint |
| KEY_g | gint |
| KEY_G | gint |
| KEY_Gabovedot | gint |
| KEY_gabovedot | gint |
| KEY_Game | gint |
| KEY_Gbreve | gint |
| KEY_gbreve | gint |
| KEY_Gcaron | gint |
| KEY_gcaron | gint |
| KEY_gcedilla | gint |
| KEY_Gcedilla | gint |
| KEY_gcircumflex | gint |
| KEY_Gcircumflex | gint |
| KEY_Georgian_an | gint |
| KEY_Georgian_ban | gint |
| KEY_Georgian_can | gint |
| KEY_Georgian_char | gint |
| KEY_Georgian_chin | gint |
| KEY_Georgian_cil | gint |
| KEY_Georgian_don | gint |
| KEY_Georgian_en | gint |
| KEY_Georgian_fi | gint |
| KEY_Georgian_gan | gint |
| KEY_Georgian_ghan | gint |
| KEY_Georgian_hae | gint |
| KEY_Georgian_har | gint |
| KEY_Georgian_he | gint |
| KEY_Georgian_hie | gint |
| KEY_Georgian_hoe | gint |
| KEY_Georgian_in | gint |
| KEY_Georgian_jhan | gint |
| KEY_Georgian_jil | gint |
| KEY_Georgian_kan | gint |
| KEY_Georgian_khar | gint |
| KEY_Georgian_las | gint |
| KEY_Georgian_man | gint |
| KEY_Georgian_nar | gint |
| KEY_Georgian_on | gint |
| KEY_Georgian_par | gint |
| KEY_Georgian_phar | gint |
| KEY_Georgian_qar | gint |
| KEY_Georgian_rae | gint |
| KEY_Georgian_san | gint |
| KEY_Georgian_shin | gint |
| KEY_Georgian_tan | gint |
| KEY_Georgian_tar | gint |
| KEY_Georgian_un | gint |
| KEY_Georgian_vin | gint |
| KEY_Georgian_we | gint |
| KEY_Georgian_xan | gint |
| KEY_Georgian_zen | gint |
| KEY_Georgian_zhar | gint |
| KEY_Go | gint |
| KEY_grave | gint |
| KEY_greater | gint |
| KEY_greaterthanequal | gint |
| KEY_Greek_accentdieresis | gint |
| KEY_Greek_alpha | gint |
| KEY_Greek_ALPHA | gint |
| KEY_Greek_ALPHAaccent | gint |
| KEY_Greek_alphaaccent | gint |
| KEY_Greek_beta | gint |
| KEY_Greek_BETA | gint |
| KEY_Greek_CHI | gint |
| KEY_Greek_chi | gint |
| KEY_Greek_delta | gint |
| KEY_Greek_DELTA | gint |
| KEY_Greek_epsilon | gint |
| KEY_Greek_EPSILON | gint |
| KEY_Greek_epsilonaccent | gint |
| KEY_Greek_EPSILONaccent | gint |
| KEY_Greek_ETA | gint |
| KEY_Greek_eta | gint |
| KEY_Greek_ETAaccent | gint |
| KEY_Greek_etaaccent | gint |
| KEY_Greek_finalsmallsigma | gint |
| KEY_Greek_gamma | gint |
| KEY_Greek_GAMMA | gint |
| KEY_Greek_horizbar | gint |
| KEY_Greek_IOTA | gint |
| KEY_Greek_iota | gint |
| KEY_Greek_IOTAaccent | gint |
| KEY_Greek_iotaaccent | gint |
| KEY_Greek_iotaaccentdieresis | gint |
| KEY_Greek_IOTAdiaeresis | gint |
| KEY_Greek_IOTAdieresis | gint |
| KEY_Greek_iotadieresis | gint |
| KEY_Greek_KAPPA | gint |
| KEY_Greek_kappa | gint |
| KEY_Greek_LAMBDA | gint |
| KEY_Greek_lambda | gint |
| KEY_Greek_lamda | gint |
| KEY_Greek_LAMDA | gint |
| KEY_Greek_MU | gint |
| KEY_Greek_mu | gint |
| KEY_Greek_NU | gint |
| KEY_Greek_nu | gint |
| KEY_Greek_OMEGA | gint |
| KEY_Greek_omega | gint |
| KEY_Greek_OMEGAaccent | gint |
| KEY_Greek_omegaaccent | gint |
| KEY_Greek_OMICRON | gint |
| KEY_Greek_omicron | gint |
| KEY_Greek_OMICRONaccent | gint |
| KEY_Greek_omicronaccent | gint |
| KEY_Greek_PHI | gint |
| KEY_Greek_phi | gint |
| KEY_Greek_PI | gint |
| KEY_Greek_pi | gint |
| KEY_Greek_PSI | gint |
| KEY_Greek_psi | gint |
| KEY_Greek_RHO | gint |
| KEY_Greek_rho | gint |
| KEY_Greek_SIGMA | gint |
| KEY_Greek_sigma | gint |
| KEY_Greek_switch | gint |
| KEY_Greek_TAU | gint |
| KEY_Greek_tau | gint |
| KEY_Greek_THETA | gint |
| KEY_Greek_theta | gint |
| KEY_Greek_UPSILON | gint |
| KEY_Greek_upsilon | gint |
| KEY_Greek_UPSILONaccent | gint |
| KEY_Greek_upsilonaccent | gint |
| KEY_Greek_upsilonaccentdieresis | gint |
| KEY_Greek_UPSILONdieresis | gint |
| KEY_Greek_upsilondieresis | gint |
| KEY_Greek_XI | gint |
| KEY_Greek_xi | gint |
| KEY_Greek_ZETA | gint |
| KEY_Greek_zeta | gint |
| KEY_Green | gint |
| KEY_guillemotleft | gint |
| KEY_guillemotright | gint |
| KEY_H | gint |
| KEY_h | gint |
| KEY_hairspace | gint |
| KEY_Hangul | gint |
| KEY_Hangul_A | gint |
| KEY_Hangul_AE | gint |
| KEY_Hangul_AraeA | gint |
| KEY_Hangul_AraeAE | gint |
| KEY_Hangul_Banja | gint |
| KEY_Hangul_Cieuc | gint |
| KEY_Hangul_Codeinput | gint |
| KEY_Hangul_Dikeud | gint |
| KEY_Hangul_E | gint |
| KEY_Hangul_End | gint |
| KEY_Hangul_EO | gint |
| KEY_Hangul_EU | gint |
| KEY_Hangul_Hanja | gint |
| KEY_Hangul_Hieuh | gint |
| KEY_Hangul_I | gint |
| KEY_Hangul_Ieung | gint |
| KEY_Hangul_J_Cieuc | gint |
| KEY_Hangul_J_Dikeud | gint |
| KEY_Hangul_J_Hieuh | gint |
| KEY_Hangul_J_Ieung | gint |
| KEY_Hangul_J_Jieuj | gint |
| KEY_Hangul_J_Khieuq | gint |
| KEY_Hangul_J_Kiyeog | gint |
| KEY_Hangul_J_KiyeogSios | gint |
| KEY_Hangul_J_KkogjiDalrinIeung | gint |
| KEY_Hangul_J_Mieum | gint |
| KEY_Hangul_J_Nieun | gint |
| KEY_Hangul_J_NieunHieuh | gint |
| KEY_Hangul_J_NieunJieuj | gint |
| KEY_Hangul_J_PanSios | gint |
| KEY_Hangul_J_Phieuf | gint |
| KEY_Hangul_J_Pieub | gint |
| KEY_Hangul_J_PieubSios | gint |
| KEY_Hangul_J_Rieul | gint |
| KEY_Hangul_J_RieulHieuh | gint |
| KEY_Hangul_J_RieulKiyeog | gint |
| KEY_Hangul_J_RieulMieum | gint |
| KEY_Hangul_J_RieulPhieuf | gint |
| KEY_Hangul_J_RieulPieub | gint |
| KEY_Hangul_J_RieulSios | gint |
| KEY_Hangul_J_RieulTieut | gint |
| KEY_Hangul_J_Sios | gint |
| KEY_Hangul_J_SsangKiyeog | gint |
| KEY_Hangul_J_SsangSios | gint |
| KEY_Hangul_J_Tieut | gint |
| KEY_Hangul_J_YeorinHieuh | gint |
| KEY_Hangul_Jamo | gint |
| KEY_Hangul_Jeonja | gint |
| KEY_Hangul_Jieuj | gint |
| KEY_Hangul_Khieuq | gint |
| KEY_Hangul_Kiyeog | gint |
| KEY_Hangul_KiyeogSios | gint |
| KEY_Hangul_KkogjiDalrinIeung | gint |
| KEY_Hangul_Mieum | gint |
| KEY_Hangul_MultipleCandidate | gint |
| KEY_Hangul_Nieun | gint |
| KEY_Hangul_NieunHieuh | gint |
| KEY_Hangul_NieunJieuj | gint |
| KEY_Hangul_O | gint |
| KEY_Hangul_OE | gint |
| KEY_Hangul_PanSios | gint |
| KEY_Hangul_Phieuf | gint |
| KEY_Hangul_Pieub | gint |
| KEY_Hangul_PieubSios | gint |
| KEY_Hangul_PostHanja | gint |
| KEY_Hangul_PreHanja | gint |
| KEY_Hangul_PreviousCandidate | gint |
| KEY_Hangul_Rieul | gint |
| KEY_Hangul_RieulHieuh | gint |
| KEY_Hangul_RieulKiyeog | gint |
| KEY_Hangul_RieulMieum | gint |
| KEY_Hangul_RieulPhieuf | gint |
| KEY_Hangul_RieulPieub | gint |
| KEY_Hangul_RieulSios | gint |
| KEY_Hangul_RieulTieut | gint |
| KEY_Hangul_RieulYeorinHieuh | gint |
| KEY_Hangul_Romaja | gint |
| KEY_Hangul_SingleCandidate | gint |
| KEY_Hangul_Sios | gint |
| KEY_Hangul_Special | gint |
| KEY_Hangul_SsangDikeud | gint |
| KEY_Hangul_SsangJieuj | gint |
| KEY_Hangul_SsangKiyeog | gint |
| KEY_Hangul_SsangPieub | gint |
| KEY_Hangul_SsangSios | gint |
| KEY_Hangul_Start | gint |
| KEY_Hangul_SunkyeongeumMieum | gint |
| KEY_Hangul_SunkyeongeumPhieuf | gint |
| KEY_Hangul_SunkyeongeumPieub | gint |
| KEY_Hangul_switch | gint |
| KEY_Hangul_Tieut | gint |
| KEY_Hangul_U | gint |
| KEY_Hangul_WA | gint |
| KEY_Hangul_WAE | gint |
| KEY_Hangul_WE | gint |
| KEY_Hangul_WEO | gint |
| KEY_Hangul_WI | gint |
| KEY_Hangul_YA | gint |
| KEY_Hangul_YAE | gint |
| KEY_Hangul_YE | gint |
| KEY_Hangul_YEO | gint |
| KEY_Hangul_YeorinHieuh | gint |
| KEY_Hangul_YI | gint |
| KEY_Hangul_YO | gint |
| KEY_Hangul_YU | gint |
| KEY_Hankaku | gint |
| KEY_Hcircumflex | gint |
| KEY_hcircumflex | gint |
| KEY_heart | gint |
| KEY_hebrew_aleph | gint |
| KEY_hebrew_ayin | gint |
| KEY_hebrew_bet | gint |
| KEY_hebrew_beth | gint |
| KEY_hebrew_chet | gint |
| KEY_hebrew_dalet | gint |
| KEY_hebrew_daleth | gint |
| KEY_hebrew_doublelowline | gint |
| KEY_hebrew_finalkaph | gint |
| KEY_hebrew_finalmem | gint |
| KEY_hebrew_finalnun | gint |
| KEY_hebrew_finalpe | gint |
| KEY_hebrew_finalzade | gint |
| KEY_hebrew_finalzadi | gint |
| KEY_hebrew_gimel | gint |
| KEY_hebrew_gimmel | gint |
| KEY_hebrew_he | gint |
| KEY_hebrew_het | gint |
| KEY_hebrew_kaph | gint |
| KEY_hebrew_kuf | gint |
| KEY_hebrew_lamed | gint |
| KEY_hebrew_mem | gint |
| KEY_hebrew_nun | gint |
| KEY_hebrew_pe | gint |
| KEY_hebrew_qoph | gint |
| KEY_hebrew_resh | gint |
| KEY_hebrew_samech | gint |
| KEY_hebrew_samekh | gint |
| KEY_hebrew_shin | gint |
| KEY_Hebrew_switch | gint |
| KEY_hebrew_taf | gint |
| KEY_hebrew_taw | gint |
| KEY_hebrew_tet | gint |
| KEY_hebrew_teth | gint |
| KEY_hebrew_waw | gint |
| KEY_hebrew_yod | gint |
| KEY_hebrew_zade | gint |
| KEY_hebrew_zadi | gint |
| KEY_hebrew_zain | gint |
| KEY_hebrew_zayin | gint |
| KEY_Help | gint |
| KEY_Henkan | gint |
| KEY_Henkan_Mode | gint |
| KEY_hexagram | gint |
| KEY_Hibernate | gint |
| KEY_Hiragana | gint |
| KEY_Hiragana_Katakana | gint |
| KEY_History | gint |
| KEY_Home | gint |
| KEY_HomePage | gint |
| KEY_horizconnector | gint |
| KEY_horizlinescan1 | gint |
| KEY_horizlinescan3 | gint |
| KEY_horizlinescan5 | gint |
| KEY_horizlinescan7 | gint |
| KEY_horizlinescan9 | gint |
| KEY_HotLinks | gint |
| KEY_hstroke | gint |
| KEY_Hstroke | gint |
| KEY_ht | gint |
| KEY_Hyper_L | gint |
| KEY_Hyper_R | gint |
| KEY_hyphen | gint |
| KEY_I | gint |
| KEY_i | gint |
| KEY_Iabovedot | gint |
| KEY_iacute | gint |
| KEY_Iacute | gint |
| KEY_Ibelowdot | gint |
| KEY_ibelowdot | gint |
| KEY_ibreve | gint |
| KEY_Ibreve | gint |
| KEY_icircumflex | gint |
| KEY_Icircumflex | gint |
| KEY_identical | gint |
| KEY_Idiaeresis | gint |
| KEY_idiaeresis | gint |
| KEY_idotless | gint |
| KEY_ifonlyif | gint |
| KEY_igrave | gint |
| KEY_Igrave | gint |
| KEY_Ihook | gint |
| KEY_ihook | gint |
| KEY_imacron | gint |
| KEY_Imacron | gint |
| KEY_implies | gint |
| KEY_includedin | gint |
| KEY_includes | gint |
| KEY_infinity | gint |
| KEY_Insert | gint |
| KEY_integral | gint |
| KEY_intersection | gint |
| KEY_Iogonek | gint |
| KEY_iogonek | gint |
| KEY_ISO_Center_Object | gint |
| KEY_ISO_Continuous_Underline | gint |
| KEY_ISO_Discontinuous_Underline | gint |
| KEY_ISO_Emphasize | gint |
| KEY_ISO_Enter | gint |
| KEY_ISO_Fast_Cursor_Down | gint |
| KEY_ISO_Fast_Cursor_Left | gint |
| KEY_ISO_Fast_Cursor_Right | gint |
| KEY_ISO_Fast_Cursor_Up | gint |
| KEY_ISO_First_Group | gint |
| KEY_ISO_First_Group_Lock | gint |
| KEY_ISO_Group_Latch | gint |
| KEY_ISO_Group_Lock | gint |
| KEY_ISO_Group_Shift | gint |
| KEY_ISO_Last_Group | gint |
| KEY_ISO_Last_Group_Lock | gint |
| KEY_ISO_Left_Tab | gint |
| KEY_ISO_Level2_Latch | gint |
| KEY_ISO_Level3_Latch | gint |
| KEY_ISO_Level3_Lock | gint |
| KEY_ISO_Level3_Shift | gint |
| KEY_ISO_Level5_Latch | gint |
| KEY_ISO_Level5_Lock | gint |
| KEY_ISO_Level5_Shift | gint |
| KEY_ISO_Lock | gint |
| KEY_ISO_Move_Line_Down | gint |
| KEY_ISO_Move_Line_Up | gint |
| KEY_ISO_Next_Group | gint |
| KEY_ISO_Next_Group_Lock | gint |
| KEY_ISO_Partial_Line_Down | gint |
| KEY_ISO_Partial_Line_Up | gint |
| KEY_ISO_Partial_Space_Left | gint |
| KEY_ISO_Partial_Space_Right | gint |
| KEY_ISO_Prev_Group | gint |
| KEY_ISO_Prev_Group_Lock | gint |
| KEY_ISO_Release_Both_Margins | gint |
| KEY_ISO_Release_Margin_Left | gint |
| KEY_ISO_Release_Margin_Right | gint |
| KEY_ISO_Set_Margin_Left | gint |
| KEY_ISO_Set_Margin_Right | gint |
| KEY_itilde | gint |
| KEY_Itilde | gint |
| KEY_iTouch | gint |
| KEY_j | gint |
| KEY_J | gint |
| KEY_jcircumflex | gint |
| KEY_Jcircumflex | gint |
| KEY_jot | gint |
| KEY_k | gint |
| KEY_K | gint |
| KEY_kana_a | gint |
| KEY_kana_A | gint |
| KEY_kana_CHI | gint |
| KEY_kana_closingbracket | gint |
| KEY_kana_comma | gint |
| KEY_kana_conjunctive | gint |
| KEY_kana_e | gint |
| KEY_kana_E | gint |
| KEY_kana_FU | gint |
| KEY_kana_fullstop | gint |
| KEY_kana_HA | gint |
| KEY_kana_HE | gint |
| KEY_kana_HI | gint |
| KEY_kana_HO | gint |
| KEY_kana_HU | gint |
| KEY_kana_i | gint |
| KEY_kana_I | gint |
| KEY_kana_KA | gint |
| KEY_kana_KE | gint |
| KEY_kana_KI | gint |
| KEY_kana_KO | gint |
| KEY_kana_KU | gint |
| KEY_Kana_Lock | gint |
| KEY_kana_MA | gint |
| KEY_kana_ME | gint |
| KEY_kana_MI | gint |
| KEY_kana_middledot | gint |
| KEY_kana_MO | gint |
| KEY_kana_MU | gint |
| KEY_kana_N | gint |
| KEY_kana_NA | gint |
| KEY_kana_NE | gint |
| KEY_kana_NI | gint |
| KEY_kana_NO | gint |
| KEY_kana_NU | gint |
| KEY_kana_O | gint |
| KEY_kana_o | gint |
| KEY_kana_openingbracket | gint |
| KEY_kana_RA | gint |
| KEY_kana_RE | gint |
| KEY_kana_RI | gint |
| KEY_kana_RO | gint |
| KEY_kana_RU | gint |
| KEY_kana_SA | gint |
| KEY_kana_SE | gint |
| KEY_kana_SHI | gint |
| KEY_Kana_Shift | gint |
| KEY_kana_SO | gint |
| KEY_kana_SU | gint |
| KEY_kana_switch | gint |
| KEY_kana_TA | gint |
| KEY_kana_TE | gint |
| KEY_kana_TI | gint |
| KEY_kana_TO | gint |
| KEY_kana_tsu | gint |
| KEY_kana_TSU | gint |
| KEY_kana_tu | gint |
| KEY_kana_TU | gint |
| KEY_kana_U | gint |
| KEY_kana_u | gint |
| KEY_kana_WA | gint |
| KEY_kana_WO | gint |
| KEY_kana_ya | gint |
| KEY_kana_YA | gint |
| KEY_kana_YO | gint |
| KEY_kana_yo | gint |
| KEY_kana_yu | gint |
| KEY_kana_YU | gint |
| KEY_Kanji | gint |
| KEY_Kanji_Bangou | gint |
| KEY_kappa | gint |
| KEY_Katakana | gint |
| KEY_KbdBrightnessDown | gint |
| KEY_KbdBrightnessUp | gint |
| KEY_KbdLightOnOff | gint |
| KEY_kcedilla | gint |
| KEY_Kcedilla | gint |
| KEY_Keyboard | gint |
| KEY_Korean_Won | gint |
| KEY_KP_0 | gint |
| KEY_KP_1 | gint |
| KEY_KP_2 | gint |
| KEY_KP_3 | gint |
| KEY_KP_4 | gint |
| KEY_KP_5 | gint |
| KEY_KP_6 | gint |
| KEY_KP_7 | gint |
| KEY_KP_8 | gint |
| KEY_KP_9 | gint |
| KEY_KP_Add | gint |
| KEY_KP_Begin | gint |
| KEY_KP_Decimal | gint |
| KEY_KP_Delete | gint |
| KEY_KP_Divide | gint |
| KEY_KP_Down | gint |
| KEY_KP_End | gint |
| KEY_KP_Enter | gint |
| KEY_KP_Equal | gint |
| KEY_KP_F1 | gint |
| KEY_KP_F2 | gint |
| KEY_KP_F3 | gint |
| KEY_KP_F4 | gint |
| KEY_KP_Home | gint |
| KEY_KP_Insert | gint |
| KEY_KP_Left | gint |
| KEY_KP_Multiply | gint |
| KEY_KP_Next | gint |
| KEY_KP_Page_Down | gint |
| KEY_KP_Page_Up | gint |
| KEY_KP_Prior | gint |
| KEY_KP_Right | gint |
| KEY_KP_Separator | gint |
| KEY_KP_Space | gint |
| KEY_KP_Subtract | gint |
| KEY_KP_Tab | gint |
| KEY_KP_Up | gint |
| KEY_kra | gint |
| KEY_l | gint |
| KEY_L | gint |
| KEY_L1 | gint |
| KEY_L10 | gint |
| KEY_L2 | gint |
| KEY_L3 | gint |
| KEY_L4 | gint |
| KEY_L5 | gint |
| KEY_L6 | gint |
| KEY_L7 | gint |
| KEY_L8 | gint |
| KEY_L9 | gint |
| KEY_Lacute | gint |
| KEY_lacute | gint |
| KEY_Last_Virtual_Screen | gint |
| KEY_latincross | gint |
| KEY_Launch0 | gint |
| KEY_Launch1 | gint |
| KEY_Launch2 | gint |
| KEY_Launch3 | gint |
| KEY_Launch4 | gint |
| KEY_Launch5 | gint |
| KEY_Launch6 | gint |
| KEY_Launch7 | gint |
| KEY_Launch8 | gint |
| KEY_Launch9 | gint |
| KEY_LaunchA | gint |
| KEY_LaunchB | gint |
| KEY_LaunchC | gint |
| KEY_LaunchD | gint |
| KEY_LaunchE | gint |
| KEY_LaunchF | gint |
| KEY_Lbelowdot | gint |
| KEY_lbelowdot | gint |
| KEY_Lcaron | gint |
| KEY_lcaron | gint |
| KEY_Lcedilla | gint |
| KEY_lcedilla | gint |
| KEY_Left | gint |
| KEY_leftanglebracket | gint |
| KEY_leftarrow | gint |
| KEY_leftcaret | gint |
| KEY_leftdoublequotemark | gint |
| KEY_leftmiddlecurlybrace | gint |
| KEY_leftopentriangle | gint |
| KEY_leftpointer | gint |
| KEY_leftradical | gint |
| KEY_leftshoe | gint |
| KEY_leftsinglequotemark | gint |
| KEY_leftt | gint |
| KEY_lefttack | gint |
| KEY_less | gint |
| KEY_lessthanequal | gint |
| KEY_lf | gint |
| KEY_LightBulb | gint |
| KEY_Linefeed | gint |
| KEY_LiraSign | gint |
| KEY_LogGrabInfo | gint |
| KEY_logicaland | gint |
| KEY_logicalor | gint |
| KEY_LogOff | gint |
| KEY_LogWindowTree | gint |
| KEY_lowleftcorner | gint |
| KEY_lowrightcorner | gint |
| KEY_lstroke | gint |
| KEY_Lstroke | gint |
| KEY_m | gint |
| KEY_M | gint |
| KEY_mabovedot | gint |
| KEY_Mabovedot | gint |
| KEY_Macedonia_DSE | gint |
| KEY_Macedonia_dse | gint |
| KEY_Macedonia_GJE | gint |
| KEY_Macedonia_gje | gint |
| KEY_Macedonia_KJE | gint |
| KEY_Macedonia_kje | gint |
| KEY_macron | gint |
| KEY_Mae_Koho | gint |
| KEY_Mail | gint |
| KEY_MailForward | gint |
| KEY_malesymbol | gint |
| KEY_maltesecross | gint |
| KEY_marker | gint |
| KEY_Market | gint |
| KEY_masculine | gint |
| KEY_Massyo | gint |
| KEY_Meeting | gint |
| KEY_Memo | gint |
| KEY_Menu | gint |
| KEY_MenuKB | gint |
| KEY_MenuPB | gint |
| KEY_Messenger | gint |
| KEY_Meta_L | gint |
| KEY_Meta_R | gint |
| KEY_MillSign | gint |
| KEY_minus | gint |
| KEY_minutes | gint |
| KEY_Mode_switch | gint |
| KEY_ModeLock | gint |
| KEY_MonBrightnessDown | gint |
| KEY_MonBrightnessUp | gint |
| KEY_MouseKeys_Accel_Enable | gint |
| KEY_MouseKeys_Enable | gint |
| KEY_mu | gint |
| KEY_Muhenkan | gint |
| KEY_Multi_key | gint |
| KEY_MultipleCandidate | gint |
| KEY_multiply | gint |
| KEY_Music | gint |
| KEY_musicalflat | gint |
| KEY_musicalsharp | gint |
| KEY_MyComputer | gint |
| KEY_MySites | gint |
| KEY_n | gint |
| KEY_N | gint |
| KEY_nabla | gint |
| KEY_nacute | gint |
| KEY_Nacute | gint |
| KEY_NairaSign | gint |
| KEY_ncaron | gint |
| KEY_Ncaron | gint |
| KEY_ncedilla | gint |
| KEY_Ncedilla | gint |
| KEY_New | gint |
| KEY_News | gint |
| KEY_NewSheqelSign | gint |
| KEY_Next | gint |
| KEY_Next_Virtual_Screen | gint |
| KEY_Next_VMode | gint |
| KEY_ninesubscript | gint |
| KEY_ninesuperior | gint |
| KEY_nl | gint |
| KEY_nobreakspace | gint |
| KEY_notapproxeq | gint |
| KEY_notelementof | gint |
| KEY_notequal | gint |
| KEY_notidentical | gint |
| KEY_notsign | gint |
| KEY_ntilde | gint |
| KEY_Ntilde | gint |
| KEY_Num_Lock | gint |
| KEY_numbersign | gint |
| KEY_numerosign | gint |
| KEY_o | gint |
| KEY_O | gint |
| KEY_oacute | gint |
| KEY_Oacute | gint |
| KEY_obarred | gint |
| KEY_Obarred | gint |
| KEY_obelowdot | gint |
| KEY_Obelowdot | gint |
| KEY_ocaron | gint |
| KEY_Ocaron | gint |
| KEY_ocircumflex | gint |
| KEY_Ocircumflex | gint |
| KEY_ocircumflexacute | gint |
| KEY_Ocircumflexacute | gint |
| KEY_ocircumflexbelowdot | gint |
| KEY_Ocircumflexbelowdot | gint |
| KEY_ocircumflexgrave | gint |
| KEY_Ocircumflexgrave | gint |
| KEY_ocircumflexhook | gint |
| KEY_Ocircumflexhook | gint |
| KEY_ocircumflextilde | gint |
| KEY_Ocircumflextilde | gint |
| KEY_odiaeresis | gint |
| KEY_Odiaeresis | gint |
| KEY_odoubleacute | gint |
| KEY_Odoubleacute | gint |
| KEY_oe | gint |
| KEY_OE | gint |
| KEY_OfficeHome | gint |
| KEY_ogonek | gint |
| KEY_ograve | gint |
| KEY_Ograve | gint |
| KEY_ohook | gint |
| KEY_Ohook | gint |
| KEY_ohorn | gint |
| KEY_Ohorn | gint |
| KEY_ohornacute | gint |
| KEY_Ohornacute | gint |
| KEY_ohornbelowdot | gint |
| KEY_Ohornbelowdot | gint |
| KEY_ohorngrave | gint |
| KEY_Ohorngrave | gint |
| KEY_ohornhook | gint |
| KEY_Ohornhook | gint |
| KEY_ohorntilde | gint |
| KEY_Ohorntilde | gint |
| KEY_omacron | gint |
| KEY_Omacron | gint |
| KEY_oneeighth | gint |
| KEY_onefifth | gint |
| KEY_onehalf | gint |
| KEY_onequarter | gint |
| KEY_onesixth | gint |
| KEY_onesubscript | gint |
| KEY_onesuperior | gint |
| KEY_onethird | gint |
| KEY_ooblique | gint |
| KEY_Ooblique | gint |
| KEY_Open | gint |
| KEY_openrectbullet | gint |
| KEY_openstar | gint |
| KEY_opentribulletdown | gint |
| KEY_opentribulletup | gint |
| KEY_OpenURL | gint |
| KEY_Option | gint |
| KEY_ordfeminine | gint |
| KEY_oslash | gint |
| KEY_Oslash | gint |
| KEY_otilde | gint |
| KEY_Otilde | gint |
| KEY_overbar | gint |
| KEY_Overlay1_Enable | gint |
| KEY_Overlay2_Enable | gint |
| KEY_overline | gint |
| KEY_p | gint |
| KEY_P | gint |
| KEY_pabovedot | gint |
| KEY_Pabovedot | gint |
| KEY_Page_Down | gint |
| KEY_Page_Up | gint |
| KEY_paragraph | gint |
| KEY_parenleft | gint |
| KEY_parenright | gint |
| KEY_partdifferential | gint |
| KEY_partialderivative | gint |
| KEY_Paste | gint |
| KEY_Pause | gint |
| KEY_percent | gint |
| KEY_period | gint |
| KEY_periodcentered | gint |
| KEY_permille | gint |
| KEY_PesetaSign | gint |
| KEY_Phone | gint |
| KEY_phonographcopyright | gint |
| KEY_Pictures | gint |
| KEY_plus | gint |
| KEY_plusminus | gint |
| KEY_Pointer_Accelerate | gint |
| KEY_Pointer_Button1 | gint |
| KEY_Pointer_Button2 | gint |
| KEY_Pointer_Button3 | gint |
| KEY_Pointer_Button4 | gint |
| KEY_Pointer_Button5 | gint |
| KEY_Pointer_Button_Dflt | gint |
| KEY_Pointer_DblClick1 | gint |
| KEY_Pointer_DblClick2 | gint |
| KEY_Pointer_DblClick3 | gint |
| KEY_Pointer_DblClick4 | gint |
| KEY_Pointer_DblClick5 | gint |
| KEY_Pointer_DblClick_Dflt | gint |
| KEY_Pointer_DfltBtnNext | gint |
| KEY_Pointer_DfltBtnPrev | gint |
| KEY_Pointer_Down | gint |
| KEY_Pointer_DownLeft | gint |
| KEY_Pointer_DownRight | gint |
| KEY_Pointer_Drag1 | gint |
| KEY_Pointer_Drag2 | gint |
| KEY_Pointer_Drag3 | gint |
| KEY_Pointer_Drag4 | gint |
| KEY_Pointer_Drag5 | gint |
| KEY_Pointer_Drag_Dflt | gint |
| KEY_Pointer_EnableKeys | gint |
| KEY_Pointer_Left | gint |
| KEY_Pointer_Right | gint |
| KEY_Pointer_Up | gint |
| KEY_Pointer_UpLeft | gint |
| KEY_Pointer_UpRight | gint |
| KEY_PowerDown | gint |
| KEY_PowerOff | gint |
| KEY_prescription | gint |
| KEY_Prev_Virtual_Screen | gint |
| KEY_Prev_VMode | gint |
| KEY_PreviousCandidate | gint |
| KEY_Print | gint |
| KEY_Prior | gint |
| KEY_prolongedsound | gint |
| KEY_punctspace | gint |
| KEY_Q | gint |
| KEY_q | gint |
| KEY_quad | gint |
| KEY_question | gint |
| KEY_questiondown | gint |
| KEY_quotedbl | gint |
| KEY_quoteleft | gint |
| KEY_quoteright | gint |
| KEY_R | gint |
| KEY_r | gint |
| KEY_R1 | gint |
| KEY_R10 | gint |
| KEY_R11 | gint |
| KEY_R12 | gint |
| KEY_R13 | gint |
| KEY_R14 | gint |
| KEY_R15 | gint |
| KEY_R2 | gint |
| KEY_R3 | gint |
| KEY_R4 | gint |
| KEY_R5 | gint |
| KEY_R6 | gint |
| KEY_R7 | gint |
| KEY_R8 | gint |
| KEY_R9 | gint |
| KEY_Racute | gint |
| KEY_racute | gint |
| KEY_radical | gint |
| KEY_Rcaron | gint |
| KEY_rcaron | gint |
| KEY_Rcedilla | gint |
| KEY_rcedilla | gint |
| KEY_Red | gint |
| KEY_Redo | gint |
| KEY_Refresh | gint |
| KEY_registered | gint |
| KEY_Reload | gint |
| KEY_RepeatKeys_Enable | gint |
| KEY_Reply | gint |
| KEY_Return | gint |
| KEY_RFKill | gint |
| KEY_Right | gint |
| KEY_rightanglebracket | gint |
| KEY_rightarrow | gint |
| KEY_rightcaret | gint |
| KEY_rightdoublequotemark | gint |
| KEY_rightmiddlecurlybrace | gint |
| KEY_rightmiddlesummation | gint |
| KEY_rightopentriangle | gint |
| KEY_rightpointer | gint |
| KEY_rightshoe | gint |
| KEY_rightsinglequotemark | gint |
| KEY_rightt | gint |
| KEY_righttack | gint |
| KEY_RockerDown | gint |
| KEY_RockerEnter | gint |
| KEY_RockerUp | gint |
| KEY_Romaji | gint |
| KEY_RotateWindows | gint |
| KEY_RotationKB | gint |
| KEY_RotationPB | gint |
| KEY_RupeeSign | gint |
| KEY_S | gint |
| KEY_s | gint |
| KEY_Sabovedot | gint |
| KEY_sabovedot | gint |
| KEY_Sacute | gint |
| KEY_sacute | gint |
| KEY_Save | gint |
| KEY_Scaron | gint |
| KEY_scaron | gint |
| KEY_Scedilla | gint |
| KEY_scedilla | gint |
| KEY_SCHWA | gint |
| KEY_schwa | gint |
| KEY_Scircumflex | gint |
| KEY_scircumflex | gint |
| KEY_ScreenSaver | gint |
| KEY_script_switch | gint |
| KEY_Scroll_Lock | gint |
| KEY_ScrollClick | gint |
| KEY_ScrollDown | gint |
| KEY_ScrollUp | gint |
| KEY_Search | gint |
| KEY_seconds | gint |
| KEY_section | gint |
| KEY_Select | gint |
| KEY_SelectButton | gint |
| KEY_semicolon | gint |
| KEY_semivoicedsound | gint |
| KEY_Send | gint |
| KEY_Serbian_DJE | gint |
| KEY_Serbian_dje | gint |
| KEY_Serbian_DZE | gint |
| KEY_Serbian_dze | gint |
| KEY_Serbian_JE | gint |
| KEY_Serbian_je | gint |
| KEY_Serbian_LJE | gint |
| KEY_Serbian_lje | gint |
| KEY_Serbian_NJE | gint |
| KEY_Serbian_nje | gint |
| KEY_Serbian_TSHE | gint |
| KEY_Serbian_tshe | gint |
| KEY_seveneighths | gint |
| KEY_sevensubscript | gint |
| KEY_sevensuperior | gint |
| KEY_Shift_L | gint |
| KEY_Shift_Lock | gint |
| KEY_Shift_R | gint |
| KEY_Shop | gint |
| KEY_signaturemark | gint |
| KEY_signifblank | gint |
| KEY_similarequal | gint |
| KEY_SingleCandidate | gint |
| KEY_singlelowquotemark | gint |
| KEY_Sinh_a | gint |
| KEY_Sinh_aa | gint |
| KEY_Sinh_aa2 | gint |
| KEY_Sinh_ae | gint |
| KEY_Sinh_ae2 | gint |
| KEY_Sinh_aee | gint |
| KEY_Sinh_aee2 | gint |
| KEY_Sinh_ai | gint |
| KEY_Sinh_ai2 | gint |
| KEY_Sinh_al | gint |
| KEY_Sinh_au | gint |
| KEY_Sinh_au2 | gint |
| KEY_Sinh_ba | gint |
| KEY_Sinh_bha | gint |
| KEY_Sinh_ca | gint |
| KEY_Sinh_cha | gint |
| KEY_Sinh_dda | gint |
| KEY_Sinh_ddha | gint |
| KEY_Sinh_dha | gint |
| KEY_Sinh_dhha | gint |
| KEY_Sinh_e | gint |
| KEY_Sinh_e2 | gint |
| KEY_Sinh_ee | gint |
| KEY_Sinh_ee2 | gint |
| KEY_Sinh_fa | gint |
| KEY_Sinh_ga | gint |
| KEY_Sinh_gha | gint |
| KEY_Sinh_h2 | gint |
| KEY_Sinh_ha | gint |
| KEY_Sinh_i | gint |
| KEY_Sinh_i2 | gint |
| KEY_Sinh_ii | gint |
| KEY_Sinh_ii2 | gint |
| KEY_Sinh_ja | gint |
| KEY_Sinh_jha | gint |
| KEY_Sinh_jnya | gint |
| KEY_Sinh_ka | gint |
| KEY_Sinh_kha | gint |
| KEY_Sinh_kunddaliya | gint |
| KEY_Sinh_la | gint |
| KEY_Sinh_lla | gint |
| KEY_Sinh_lu | gint |
| KEY_Sinh_lu2 | gint |
| KEY_Sinh_luu | gint |
| KEY_Sinh_luu2 | gint |
| KEY_Sinh_ma | gint |
| KEY_Sinh_mba | gint |
| KEY_Sinh_na | gint |
| KEY_Sinh_ndda | gint |
| KEY_Sinh_ndha | gint |
| KEY_Sinh_ng | gint |
| KEY_Sinh_ng2 | gint |
| KEY_Sinh_nga | gint |
| KEY_Sinh_nja | gint |
| KEY_Sinh_nna | gint |
| KEY_Sinh_nya | gint |
| KEY_Sinh_o | gint |
| KEY_Sinh_o2 | gint |
| KEY_Sinh_oo | gint |
| KEY_Sinh_oo2 | gint |
| KEY_Sinh_pa | gint |
| KEY_Sinh_pha | gint |
| KEY_Sinh_ra | gint |
| KEY_Sinh_ri | gint |
| KEY_Sinh_rii | gint |
| KEY_Sinh_ru2 | gint |
| KEY_Sinh_ruu2 | gint |
| KEY_Sinh_sa | gint |
| KEY_Sinh_sha | gint |
| KEY_Sinh_ssha | gint |
| KEY_Sinh_tha | gint |
| KEY_Sinh_thha | gint |
| KEY_Sinh_tta | gint |
| KEY_Sinh_ttha | gint |
| KEY_Sinh_u | gint |
| KEY_Sinh_u2 | gint |
| KEY_Sinh_uu | gint |
| KEY_Sinh_uu2 | gint |
| KEY_Sinh_va | gint |
| KEY_Sinh_ya | gint |
| KEY_sixsubscript | gint |
| KEY_sixsuperior | gint |
| KEY_slash | gint |
| KEY_Sleep | gint |
| KEY_SlowKeys_Enable | gint |
| KEY_soliddiamond | gint |
| KEY_space | gint |
| KEY_Spell | gint |
| KEY_SplitScreen | gint |
| KEY_squareroot | gint |
| KEY_ssharp | gint |
| KEY_Standby | gint |
| KEY_Start | gint |
| KEY_sterling | gint |
| KEY_StickyKeys_Enable | gint |
| KEY_Stop | gint |
| KEY_stricteq | gint |
| KEY_Subtitle | gint |
| KEY_Super_L | gint |
| KEY_Super_R | gint |
| KEY_Support | gint |
| KEY_Suspend | gint |
| KEY_Switch_VT_1 | gint |
| KEY_Switch_VT_10 | gint |
| KEY_Switch_VT_11 | gint |
| KEY_Switch_VT_12 | gint |
| KEY_Switch_VT_2 | gint |
| KEY_Switch_VT_3 | gint |
| KEY_Switch_VT_4 | gint |
| KEY_Switch_VT_5 | gint |
| KEY_Switch_VT_6 | gint |
| KEY_Switch_VT_7 | gint |
| KEY_Switch_VT_8 | gint |
| KEY_Switch_VT_9 | gint |
| KEY_Sys_Req | gint |
| KEY_t | gint |
| KEY_T | gint |
| KEY_Tab | gint |
| KEY_tabovedot | gint |
| KEY_Tabovedot | gint |
| KEY_TaskPane | gint |
| KEY_Tcaron | gint |
| KEY_tcaron | gint |
| KEY_tcedilla | gint |
| KEY_Tcedilla | gint |
| KEY_telephone | gint |
| KEY_telephonerecorder | gint |
| KEY_Terminal | gint |
| KEY_Terminate_Server | gint |
| KEY_Thai_baht | gint |
| KEY_Thai_bobaimai | gint |
| KEY_Thai_chochan | gint |
| KEY_Thai_chochang | gint |
| KEY_Thai_choching | gint |
| KEY_Thai_chochoe | gint |
| KEY_Thai_dochada | gint |
| KEY_Thai_dodek | gint |
| KEY_Thai_fofa | gint |
| KEY_Thai_fofan | gint |
| KEY_Thai_hohip | gint |
| KEY_Thai_honokhuk | gint |
| KEY_Thai_khokhai | gint |
| KEY_Thai_khokhon | gint |
| KEY_Thai_khokhuat | gint |
| KEY_Thai_khokhwai | gint |
| KEY_Thai_khorakhang | gint |
| KEY_Thai_kokai | gint |
| KEY_Thai_lakkhangyao | gint |
| KEY_Thai_lekchet | gint |
| KEY_Thai_lekha | gint |
| KEY_Thai_lekhok | gint |
| KEY_Thai_lekkao | gint |
| KEY_Thai_leknung | gint |
| KEY_Thai_lekpaet | gint |
| KEY_Thai_leksam | gint |
| KEY_Thai_leksi | gint |
| KEY_Thai_leksong | gint |
| KEY_Thai_leksun | gint |
| KEY_Thai_lochula | gint |
| KEY_Thai_loling | gint |
| KEY_Thai_lu | gint |
| KEY_Thai_maichattawa | gint |
| KEY_Thai_maiek | gint |
| KEY_Thai_maihanakat | gint |
| KEY_Thai_maihanakat_maitho | gint |
| KEY_Thai_maitaikhu | gint |
| KEY_Thai_maitho | gint |
| KEY_Thai_maitri | gint |
| KEY_Thai_maiyamok | gint |
| KEY_Thai_moma | gint |
| KEY_Thai_ngongu | gint |
| KEY_Thai_nikhahit | gint |
| KEY_Thai_nonen | gint |
| KEY_Thai_nonu | gint |
| KEY_Thai_oang | gint |
| KEY_Thai_paiyannoi | gint |
| KEY_Thai_phinthu | gint |
| KEY_Thai_phophan | gint |
| KEY_Thai_phophung | gint |
| KEY_Thai_phosamphao | gint |
| KEY_Thai_popla | gint |
| KEY_Thai_rorua | gint |
| KEY_Thai_ru | gint |
| KEY_Thai_saraa | gint |
| KEY_Thai_saraaa | gint |
| KEY_Thai_saraae | gint |
| KEY_Thai_saraaimaimalai | gint |
| KEY_Thai_saraaimaimuan | gint |
| KEY_Thai_saraam | gint |
| KEY_Thai_sarae | gint |
| KEY_Thai_sarai | gint |
| KEY_Thai_saraii | gint |
| KEY_Thai_sarao | gint |
| KEY_Thai_sarau | gint |
| KEY_Thai_saraue | gint |
| KEY_Thai_sarauee | gint |
| KEY_Thai_sarauu | gint |
| KEY_Thai_sorusi | gint |
| KEY_Thai_sosala | gint |
| KEY_Thai_soso | gint |
| KEY_Thai_sosua | gint |
| KEY_Thai_thanthakhat | gint |
| KEY_Thai_thonangmontho | gint |
| KEY_Thai_thophuthao | gint |
| KEY_Thai_thothahan | gint |
| KEY_Thai_thothan | gint |
| KEY_Thai_thothong | gint |
| KEY_Thai_thothung | gint |
| KEY_Thai_topatak | gint |
| KEY_Thai_totao | gint |
| KEY_Thai_wowaen | gint |
| KEY_Thai_yoyak | gint |
| KEY_Thai_yoying | gint |
| KEY_therefore | gint |
| KEY_thinspace | gint |
| KEY_thorn | gint |
| KEY_THORN | gint |
| KEY_Thorn | gint |
| KEY_threeeighths | gint |
| KEY_threefifths | gint |
| KEY_threequarters | gint |
| KEY_threesubscript | gint |
| KEY_threesuperior | gint |
| KEY_Time | gint |
| KEY_tintegral | gint |
| KEY_ToDoList | gint |
| KEY_Tools | gint |
| KEY_topintegral | gint |
| KEY_topleftparens | gint |
| KEY_topleftradical | gint |
| KEY_topleftsqbracket | gint |
| KEY_topleftsummation | gint |
| KEY_TopMenu | gint |
| KEY_toprightparens | gint |
| KEY_toprightsqbracket | gint |
| KEY_toprightsummation | gint |
| KEY_topt | gint |
| KEY_topvertsummationconnector | gint |
| KEY_TouchpadOff | gint |
| KEY_TouchpadOn | gint |
| KEY_TouchpadToggle | gint |
| KEY_Touroku | gint |
| KEY_trademark | gint |
| KEY_trademarkincircle | gint |
| KEY_Travel | gint |
| KEY_tslash | gint |
| KEY_Tslash | gint |
| KEY_twofifths | gint |
| KEY_twosubscript | gint |
| KEY_twosuperior | gint |
| KEY_twothirds | gint |
| KEY_u | gint |
| KEY_U | gint |
| KEY_uacute | gint |
| KEY_Uacute | gint |
| KEY_ubelowdot | gint |
| KEY_Ubelowdot | gint |
| KEY_ubreve | gint |
| KEY_Ubreve | gint |
| KEY_ucircumflex | gint |
| KEY_Ucircumflex | gint |
| KEY_udiaeresis | gint |
| KEY_Udiaeresis | gint |
| KEY_Udoubleacute | gint |
| KEY_udoubleacute | gint |
| KEY_ugrave | gint |
| KEY_Ugrave | gint |
| KEY_uhook | gint |
| KEY_Uhook | gint |
| KEY_uhorn | gint |
| KEY_Uhorn | gint |
| KEY_uhornacute | gint |
| KEY_Uhornacute | gint |
| KEY_uhornbelowdot | gint |
| KEY_Uhornbelowdot | gint |
| KEY_uhorngrave | gint |
| KEY_Uhorngrave | gint |
| KEY_uhornhook | gint |
| KEY_Uhornhook | gint |
| KEY_Uhorntilde | gint |
| KEY_uhorntilde | gint |
| KEY_Ukrainian_GHE_WITH_UPTURN | gint |
| KEY_Ukrainian_ghe_with_upturn | gint |
| KEY_Ukrainian_I | gint |
| KEY_Ukrainian_i | gint |
| KEY_Ukrainian_IE | gint |
| KEY_Ukrainian_ie | gint |
| KEY_Ukrainian_YI | gint |
| KEY_Ukrainian_yi | gint |
| KEY_Ukranian_I | gint |
| KEY_Ukranian_i | gint |
| KEY_Ukranian_JE | gint |
| KEY_Ukranian_je | gint |
| KEY_Ukranian_YI | gint |
| KEY_Ukranian_yi | gint |
| KEY_umacron | gint |
| KEY_Umacron | gint |
| KEY_underbar | gint |
| KEY_underscore | gint |
| KEY_Undo | gint |
| KEY_Ungrab | gint |
| KEY_union | gint |
| KEY_uogonek | gint |
| KEY_Uogonek | gint |
| KEY_Up | gint |
| KEY_uparrow | gint |
| KEY_upcaret | gint |
| KEY_upleftcorner | gint |
| KEY_uprightcorner | gint |
| KEY_upshoe | gint |
| KEY_upstile | gint |
| KEY_uptack | gint |
| KEY_uring | gint |
| KEY_Uring | gint |
| KEY_User1KB | gint |
| KEY_User2KB | gint |
| KEY_UserPB | gint |
| KEY_utilde | gint |
| KEY_Utilde | gint |
| KEY_UWB | gint |
| KEY_v | gint |
| KEY_V | gint |
| KEY_variation | gint |
| KEY_VendorHome | gint |
| KEY_vertbar | gint |
| KEY_vertconnector | gint |
| KEY_Video | gint |
| KEY_View | gint |
| KEY_voicedsound | gint |
| KEY_VoidSymbol | gint |
| KEY_vt | gint |
| KEY_w | gint |
| KEY_W | gint |
| KEY_wacute | gint |
| KEY_Wacute | gint |
| KEY_WakeUp | gint |
| KEY_wcircumflex | gint |
| KEY_Wcircumflex | gint |
| KEY_wdiaeresis | gint |
| KEY_Wdiaeresis | gint |
| KEY_WebCam | gint |
| KEY_wgrave | gint |
| KEY_Wgrave | gint |
| KEY_WheelButton | gint |
| KEY_WindowClear | gint |
| KEY_WLAN | gint |
| KEY_WonSign | gint |
| KEY_Word | gint |
| KEY_WWAN | gint |
| KEY_WWW | gint |
| KEY_x | gint |
| KEY_X | gint |
| KEY_xabovedot | gint |
| KEY_Xabovedot | gint |
| KEY_Xfer | gint |
| KEY_y | gint |
| KEY_Y | gint |
| KEY_yacute | gint |
| KEY_Yacute | gint |
| KEY_ybelowdot | gint |
| KEY_Ybelowdot | gint |
| KEY_ycircumflex | gint |
| KEY_Ycircumflex | gint |
| KEY_ydiaeresis | gint |
| KEY_Ydiaeresis | gint |
| KEY_Yellow | gint |
| KEY_yen | gint |
| KEY_ygrave | gint |
| KEY_Ygrave | gint |
| KEY_yhook | gint |
| KEY_Yhook | gint |
| KEY_ytilde | gint |
| KEY_Ytilde | gint |
| KEY_z | gint |
| KEY_Z | gint |
| KEY_zabovedot | gint |
| KEY_Zabovedot | gint |
| KEY_zacute | gint |
| KEY_Zacute | gint |
| KEY_zcaron | gint |
| KEY_Zcaron | gint |
| KEY_Zen_Koho | gint |
| KEY_Zenkaku | gint |
| KEY_Zenkaku_Hankaku | gint |
| KEY_zerosubscript | gint |
| KEY_zerosuperior | gint |
| KEY_ZoomIn | gint |
| KEY_ZoomOut | gint |
| KEY_zstroke | gint |
| KEY_Zstroke | gint |
| MAJOR_VERSION | gint |
| MAX_TIMECOORD_AXES | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| PARENT_RELATIVE | gint |
| PRIORITY_REDRAW | gint |

## Aliases

| Name | Type |
| --- | --- |
| XEvent | none |

