# Gdk 4.0

SQGI import: `import("Gdk", "4.0")`

Packages: `gtk4`
Includes: `GdkPixbuf-2.0`, `Gio-2.0`, `Pango-1.0`, `PangoCairo-1.0`, `cairo-1.0`
Libraries: `libgtk-4.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 41 |
| Interfaces | 5 |
| Records | 32 |
| Unions | 0 |
| Enums | 22 |
| Flags | 9 |
| Functions | 39 |
| Callbacks | 2 |
| Constants | 2287 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AppLaunchContext | Gio.AppLaunchContext | 0 | 0 | 5 | `GdkAppLaunchContext` handles launching an application in a graphical context. It is an implementation of `GAppLaunchContext` that provides startup... |
| ButtonEvent | Event | 0 | 0 | 1 | An event related to a button on a pointer device. |
| CairoContext | DrawContext | 0 | 0 | 1 | `GdkCairoContext` is an object representing the platform-specific draw context. `GdkCairoContext`s are created for a surface using [method@Gdk.Surf... |
| Clipboard | GObject.Object | 0 | 1 | 20 | The `GdkClipboard` object represents data shared between applications or inside an application. To get a `GdkClipboard` object, use [method@Gdk.Dis... |
| ContentDeserializer | GObject.Object | 0 | 0 | 11 | A `GdkContentDeserializer` is used to deserialize content received via inter-application data transfers. The `GdkContentDeserializer` transforms se... |
| ContentProvider | GObject.Object | 0 | 1 | 10 | A `GdkContentProvider` is used to provide content for the clipboard or for drag-and-drop operations in a number of formats. To create a `GdkContent... |
| ContentSerializer | GObject.Object | 0 | 0 | 11 | A `GdkContentSerializer` is used to serialize content for inter-application data transfers. The `GdkContentSerializer` transforms an object that is... |
| CrossingEvent | Event | 0 | 0 | 3 | An event caused by a pointing device moving between surfaces. |
| Cursor | GObject.Object | 0 | 0 | 7 | `GdkCursor` is used to create and destroy cursors. Cursors are immutable objects, so once you created them, there is no way to modify them later. Y... |
| DeleteEvent | Event | 0 | 0 | 0 | An event related to closing a top-level surface. |
| Device | GObject.Object | 0 | 2 | 17 | The `GdkDevice` object represents an input device, such as a keyboard, a mouse, or a touchpad. See the [class@Gdk.Seat] documentation for more info... |
| DeviceTool | GObject.Object | 0 | 0 | 4 | A physical tool associated to a `GdkDevice`. |
| Display | GObject.Object | 0 | 5 | 30 | `GdkDisplay` objects are the GDK representation of a workstation. Their purpose are two-fold: - To manage and provide information about input devic... |
| DisplayManager | GObject.Object | 0 | 1 | 5 | A singleton object that offers notification when displays appear or disappear. You can use [func@Gdk.DisplayManager.get] to obtain the `GdkDisplayM... |
| DmabufTexture | Texture | 0 | 0 | 0 | A `GdkTexture` representing a DMA buffer. To create a `GdkDmabufTexture`, use the auxiliary [class@Gdk.DmabufTextureBuilder] object. Dma-buf textur... |
| DmabufTextureBuilder | GObject.Object | 0 | 0 | 26 | `GdkDmabufTextureBuilder` is a builder used to construct [class@Gdk.Texture] objects from DMA buffers. DMA buffers are commonly called **_dma-bufs_... |
| DNDEvent | Event | 0 | 0 | 1 | An event related to drag and drop operations. |
| Drag | GObject.Object | 0 | 3 | 11 | The `GdkDrag` object represents the source of an ongoing DND operation. A `GdkDrag` is created when a drag is started, and stays alive for duration... |
| DrawContext | GObject.Object | 3 | 0 | 6 | Base class for objects implementing different rendering methods. `GdkDrawContext` is the base object used by contexts implementing different render... |
| Drop | GObject.Object | 0 | 0 | 12 | The `GdkDrop` object represents the target of an ongoing DND operation. Possible drop sites get informed about the status of the ongoing drag opera... |
| Event |  | 13 | 0 | 20 | `GdkEvent`s are immutable data structures, created by GDK to represent windowing system events. In GTK applications the events are handled automati... |
| FocusEvent | Event | 0 | 0 | 1 | An event related to a keyboard focus change. |
| FrameClock | GObject.Object | 0 | 7 | 10 | A `GdkFrameClock` tells the application when to update and repaint a surface. This may be synced to the vertical refresh rate of the monitor, for e... |
| GLContext | DrawContext | 0 | 0 | 21 | `GdkGLContext` is an object representing a platform-specific OpenGL draw context. `GdkGLContext`s are created for a surface using [method@Gdk.Surfa... |
| GLTexture | Texture | 0 | 0 | 2 | A GdkTexture representing a GL texture object. |
| GLTextureBuilder | GObject.Object | 0 | 0 | 20 | `GdkGLTextureBuilder` is a builder used to construct [class@Gdk.Texture] objects from GL textures. The operation is quite simple: Create a texture ... |
| GrabBrokenEvent | Event | 0 | 0 | 2 | An event related to a broken windowing system grab. |
| KeyEvent | Event | 0 | 0 | 8 | An event related to a key-based device. |
| MemoryTexture | Texture | 0 | 0 | 1 | A `GdkTexture` representing image data in memory. |
| Monitor | GObject.Object | 0 | 1 | 13 | `GdkMonitor` objects represent the individual outputs that are associated with a `GdkDisplay`. `GdkDisplay` keeps a `GListModel` to enumerate and m... |
| MotionEvent | Event | 0 | 0 | 0 | An event related to a pointer or touch device motion. |
| PadEvent | Event | 0 | 0 | 3 | An event related to a pad-based device. |
| ProximityEvent | Event | 0 | 0 | 0 | An event related to the proximity of a tool to a device. |
| ScrollEvent | Event | 0 | 0 | 4 | An event related to a scrolling motion. |
| Seat | GObject.Object | 0 | 4 | 6 | The `GdkSeat` object represents a collection of input devices that belong to a user. |
| Snapshot | GObject.Object | 0 | 0 | 0 | Base type for snapshot operations. The subclass of `GdkSnapshot` used by GTK is GtkSnapshot. |
| Surface | GObject.Object | 0 | 5 | 27 | A `GdkSurface` is a rectangular region on the screen. It???s a low-level object, used to implement high-level objects such as GtkWindow. The surfac... |
| Texture | GObject.Object | 3 | 0 | 13 | `GdkTexture` is the basic element used to refer to pixel data. It is primarily meant for pixel data that will not change over multiple frames, and ... |
| TouchEvent | Event | 0 | 0 | 1 | An event related to a touch-based device. |
| TouchpadEvent | Event | 0 | 0 | 5 | An event related to a gesture on a touchpad device. Unlike touchscreens, where the windowing system sends basic sequences of begin, update, end eve... |
| VulkanContext | DrawContext | 0 | 1 | 0 | `GdkVulkanContext` is an object representing the platform-specific Vulkan draw context. `GdkVulkanContext`s are created for a surface using [method... |

### Gdk.AppLaunchContext

Parent: `Gio.AppLaunchContext` ?? GType: `GdkAppLaunchContext` ?? C type: `GdkAppLaunchContext`

`GdkAppLaunchContext` handles launching an application in a graphical context. It is an implementation of `GAppLaunchContext` that provides startup...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_display | `AppLaunchContext.get_display() -> Display` | gdk_app_launch_context_get_display |  | Gets the `GdkDisplay` that @context is for. |
| set_desktop | `AppLaunchContext.set_desktop(desktop: gint) -> none` | gdk_app_launch_context_set_desktop |  | Sets the workspace on which applications will be launched. This only works when running under a window manager that supports multiple workspaces, a... |
| set_icon | `AppLaunchContext.set_icon(icon: Gio.Icon?) -> none` | gdk_app_launch_context_set_icon |  | Sets the icon for applications that are launched with this context. Window Managers can use this information when displaying startup notification. ... |
| set_icon_name | `AppLaunchContext.set_icon_name(icon_name: utf8?) -> none` | gdk_app_launch_context_set_icon_name |  | Sets the icon for applications that are launched with this context. The @icon_name will be interpreted in the same way as the Icon field in desktop... |
| set_timestamp | `AppLaunchContext.set_timestamp(timestamp: guint32) -> none` | gdk_app_launch_context_set_timestamp |  | Sets the timestamp of @context. The timestamp should ideally be taken from the event that triggered the launch. Window managers can use this inform... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only | The display that the `GdkAppLaunchContext` is on. |

### Gdk.ButtonEvent

Parent: `Event` ?? GType: `GdkButtonEvent` ?? C type: `GdkButtonEvent`

An event related to a button on a pointer device.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_button | `ButtonEvent.get_button() -> guint` | gdk_button_event_get_button |  | Extract the button number from a button event. |

### Gdk.CairoContext

Parent: `DrawContext` ?? GType: `GdkCairoContext` ?? C type: `GdkCairoContext` ?? Abstract

`GdkCairoContext` is an object representing the platform-specific draw context. `GdkCairoContext`s are created for a surface using [method@Gdk.Surf...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cairo_create | `CairoContext.cairo_create() -> cairo.Context` | gdk_cairo_context_cairo_create |  | Retrieves a Cairo context to be used to draw on the `GdkSurface` of @context. A call to [method@Gdk.DrawContext.begin_frame] with this @context mus... |

### Gdk.Clipboard

Parent: `GObject.Object` ?? GType: `GdkClipboard` ?? C type: `GdkClipboard`

The `GdkClipboard` object represents data shared between applications or inside an application. To get a `GdkClipboard` object, use [method@Gdk.Dis...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content | `Clipboard.get_content() -> ContentProvider` | gdk_clipboard_get_content |  | Returns the `GdkContentProvider` currently set on @clipboard. If the @clipboard is empty or its contents are not owned by the current process, %NUL... |
| get_display | `Clipboard.get_display() -> Display` | gdk_clipboard_get_display |  | Gets the `GdkDisplay` that the clipboard was created for. |
| get_formats | `Clipboard.get_formats() -> ContentFormats` | gdk_clipboard_get_formats |  | Gets the formats that the clipboard can provide its current contents in. |
| is_local | `Clipboard.is_local() -> gboolean` | gdk_clipboard_is_local |  | Returns if the clipboard is local. A clipboard is considered local if it was last claimed by the running application. Note that [method@Gdk.Clipboa... |
| read_async | `Clipboard.read_async(mime_types: utf8, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_clipboard_read_async |  | Asynchronously requests an input stream to read the @clipboard's contents from. When the operation is finished @callback will be called. You must t... |
| read_finish | `Clipboard.read_finish(result: Gio.AsyncResult, out_mime_type: out utf8?) -> Gio.InputStream throws` | gdk_clipboard_read_finish |  | Finishes an asynchronous clipboard read. See [method@Gdk.Clipboard.read_async]. |
| read_text_async | `Clipboard.read_text_async(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_clipboard_read_text_async |  | Asynchronously request the @clipboard contents converted to a string. When the operation is finished @callback will be called. You must then call [... |
| read_text_finish | `Clipboard.read_text_finish(result: Gio.AsyncResult) -> utf8 throws` | gdk_clipboard_read_text_finish |  | Finishes an asynchronous clipboard read. See [method@Gdk.Clipboard.read_text_async]. |
| read_texture_async | `Clipboard.read_texture_async(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_clipboard_read_texture_async |  | Asynchronously request the @clipboard contents converted to a `GdkPixbuf`. When the operation is finished @callback will be called. You must then c... |
| read_texture_finish | `Clipboard.read_texture_finish(result: Gio.AsyncResult) -> Texture throws` | gdk_clipboard_read_texture_finish |  | Finishes an asynchronous clipboard read. See [method@Gdk.Clipboard.read_texture_async]. |
| read_value_async | `Clipboard.read_value_async(type: GType, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_clipboard_read_value_async |  | Asynchronously request the @clipboard contents converted to the given @type. When the operation is finished @callback will be called. You must then... |
| read_value_finish | `Clipboard.read_value_finish(result: Gio.AsyncResult) -> GObject.Value throws` | gdk_clipboard_read_value_finish |  | Finishes an asynchronous clipboard read. See [method@Gdk.Clipboard.read_value_async]. |
| set | `Clipboard.set(type: GType, ...: void) -> none` | gdk_clipboard_set |  | Sets the clipboard to contain the value collected from the given varargs. Values should be passed the same way they are passed to other value colle... |
| set_content | `Clipboard.set_content(provider: ContentProvider?) -> gboolean` | gdk_clipboard_set_content |  | Sets a new content provider on @clipboard. The clipboard will claim the `GdkDisplay`'s resources and advertise these new contents to other applicat... |
| set_text | `Clipboard.set_text(text: utf8) -> none` | gdk_clipboard_set_text |  | Puts the given @text into the clipboard. |
| set_texture | `Clipboard.set_texture(texture: Texture) -> none` | gdk_clipboard_set_texture |  | Puts the given @texture into the clipboard. |
| set_valist | `Clipboard.set_valist(type: GType, args: va_list) -> none` | gdk_clipboard_set_valist |  | Sets the clipboard to contain the value collected from the given @args. |
| set_value | `Clipboard.set_value(value: GObject.Value) -> none` | gdk_clipboard_set_value |  | Sets the @clipboard to contain the given @value. |
| store_async | `Clipboard.store_async(io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_clipboard_store_async |  | Asynchronously instructs the @clipboard to store its contents remotely. If the clipboard is not local, this function does nothing but report succes... |
| store_finish | `Clipboard.store_finish(result: Gio.AsyncResult) -> gboolean throws` | gdk_clipboard_store_finish |  | Finishes an asynchronous clipboard store. See [method@Gdk.Clipboard.store_async]. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| content | ContentProvider | read | The `GdkContentProvider` or %NULL if the clipboard is empty or contents are provided otherwise. |
| display | Display | read, write, construct-only | The `GdkDisplay` that the clipboard belongs to. |
| formats | ContentFormats | read | The possible formats that the clipboard can provide its data in. |
| local | gboolean | read | %TRUE if the contents of the clipboard are owned by this process. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | Emitted when the clipboard changes ownership. |

### Gdk.ContentDeserializer

Parent: `GObject.Object` ?? Implements: `Gio.AsyncResult` ?? GType: `GdkContentDeserializer` ?? C type: `GdkContentDeserializer`

A `GdkContentDeserializer` is used to deserialize content received via inter-application data transfers. The `GdkContentDeserializer` transforms se...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cancellable | `ContentDeserializer.get_cancellable() -> Gio.Cancellable` | gdk_content_deserializer_get_cancellable |  | Gets the cancellable for the current operation. This is the `GCancellable` that was passed to [func@Gdk.content_deserialize_async]. |
| get_gtype | `ContentDeserializer.get_gtype() -> GType` | gdk_content_deserializer_get_gtype |  | Gets the `GType` to create an instance of. |
| get_input_stream | `ContentDeserializer.get_input_stream() -> Gio.InputStream` | gdk_content_deserializer_get_input_stream |  | Gets the input stream for the current operation. This is the stream that was passed to [func@Gdk.content_deserialize_async]. |
| get_mime_type | `ContentDeserializer.get_mime_type() -> utf8` | gdk_content_deserializer_get_mime_type |  | Gets the mime type to deserialize from. |
| get_priority | `ContentDeserializer.get_priority() -> gint` | gdk_content_deserializer_get_priority |  | Gets the I/O priority for the current operation. This is the priority that was passed to [func@Gdk.content_deserialize_async]. |
| get_task_data | `ContentDeserializer.get_task_data() -> gpointer` | gdk_content_deserializer_get_task_data |  | Gets the data that was associated with the current operation. See [method@Gdk.ContentDeserializer.set_task_data]. |
| get_user_data | `ContentDeserializer.get_user_data() -> gpointer` | gdk_content_deserializer_get_user_data |  | Gets the user data that was passed when the deserializer was registered. |
| get_value | `ContentDeserializer.get_value() -> GObject.Value` | gdk_content_deserializer_get_value |  | Gets the `GValue` to store the deserialized object in. |
| return_error | `ContentDeserializer.return_error(error: GLib.Error) -> none` | gdk_content_deserializer_return_error |  | Indicate that the deserialization has ended with an error. This function consumes @error. |
| return_success | `ContentDeserializer.return_success() -> none` | gdk_content_deserializer_return_success |  | Indicate that the deserialization has been successfully completed. |
| set_task_data | `ContentDeserializer.set_task_data(data: gpointer?, notify: GLib.DestroyNotify) -> none` | gdk_content_deserializer_set_task_data |  | Associate data with the current deserialization operation. |

### Gdk.ContentProvider

Parent: `GObject.Object` ?? GType: `GdkContentProvider` ?? C type: `GdkContentProvider`

A `GdkContentProvider` is used to provide content for the clipboard or for drag-and-drop operations in a number of formats. To create a `GdkContent...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_for_bytes | `ContentProvider.new_for_bytes(mime_type: utf8, bytes: GLib.Bytes) -> ContentProvider` | gdk_content_provider_new_for_bytes |  | Create a content provider that provides the given @bytes as data for the given @mime_type. |
| new_for_value | `ContentProvider.new_for_value(value: GObject.Value) -> ContentProvider` | gdk_content_provider_new_for_value |  | Create a content provider that provides the given @value. |
| new_typed | `ContentProvider.new_typed(type: GType, ...: void) -> ContentProvider` | gdk_content_provider_new_typed |  | Create a content provider that provides the value of the given @type. The value is provided using G_VALUE_COLLECT(), so the same rules apply as whe... |
| new_union | `ContentProvider.new_union(providers: ContentProvider?, n_providers: gsize) -> ContentProvider` | gdk_content_provider_new_union |  | Creates a content provider that represents all the given @providers. Whenever data needs to be written, the union provider will try the given @prov... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| content_changed | `ContentProvider.content_changed() -> none` | gdk_content_provider_content_changed |  | Emits the ::content-changed signal. |
| get_value | `ContentProvider.get_value(value: out GObject.Value) -> gboolean throws` | gdk_content_provider_get_value |  | Gets the contents of @provider stored in @value. The @value will have been initialized to the `GType` the value should be provided in. This given `... |
| ref_formats | `ContentProvider.ref_formats() -> ContentFormats` | gdk_content_provider_ref_formats |  | Gets the formats that the provider can provide its current contents in. |
| ref_storable_formats | `ContentProvider.ref_storable_formats() -> ContentFormats` | gdk_content_provider_ref_storable_formats |  | Gets the formats that the provider suggests other applications to store the data in. An example of such an application would be a clipboard manager... |
| write_mime_type_async | `ContentProvider.write_mime_type_async(mime_type: utf8, stream: Gio.OutputStream, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_content_provider_write_mime_type_async |  | Asynchronously writes the contents of @provider to @stream in the given @mime_type. When the operation is finished @callback will be called. You mu... |
| write_mime_type_finish | `ContentProvider.write_mime_type_finish(result: Gio.AsyncResult) -> gboolean throws` | gdk_content_provider_write_mime_type_finish |  | Finishes an asynchronous write operation. See [method@Gdk.ContentProvider.write_mime_type_async]. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| formats | ContentFormats | read | The possible formats that the provider can provide its data in. |
| storable-formats | ContentFormats | read | The subset of formats that clipboard managers should store this provider's data in. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| content-changed | `` | none | last |  | Emitted whenever the content provided by this provider has changed. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| attach_clipboard | `attach_clipboard(clipboard: Clipboard) -> none` |  |  |  |
| content_changed | `content_changed() -> none` |  |  | Emits the ::content-changed signal. |
| detach_clipboard | `detach_clipboard(clipboard: Clipboard) -> none` |  |  |  |
| get_value | `get_value(value: out GObject.Value) -> gboolean throws` |  |  | Gets the contents of @provider stored in @value. The @value will have been initialized to the `GType` the value should be provided in. This given `... |
| ref_formats | `ref_formats() -> ContentFormats` |  |  | Gets the formats that the provider can provide its current contents in. |
| ref_storable_formats | `ref_storable_formats() -> ContentFormats` |  |  | Gets the formats that the provider suggests other applications to store the data in. An example of such an application would be a clipboard manager... |
| write_mime_type_async | `write_mime_type_async(mime_type: utf8, stream: Gio.OutputStream, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously writes the contents of @provider to @stream in the given @mime_type. When the operation is finished @callback will be called. You mu... |
| write_mime_type_finish | `write_mime_type_finish(result: Gio.AsyncResult) -> gboolean throws` |  |  | Finishes an asynchronous write operation. See [method@Gdk.ContentProvider.write_mime_type_async]. |

### Gdk.ContentSerializer

Parent: `GObject.Object` ?? Implements: `Gio.AsyncResult` ?? GType: `GdkContentSerializer` ?? C type: `GdkContentSerializer`

A `GdkContentSerializer` is used to serialize content for inter-application data transfers. The `GdkContentSerializer` transforms an object that is...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cancellable | `ContentSerializer.get_cancellable() -> Gio.Cancellable` | gdk_content_serializer_get_cancellable |  | Gets the cancellable for the current operation. This is the `GCancellable` that was passed to [func@content_serialize_async]. |
| get_gtype | `ContentSerializer.get_gtype() -> GType` | gdk_content_serializer_get_gtype |  | Gets the `GType` to of the object to serialize. |
| get_mime_type | `ContentSerializer.get_mime_type() -> utf8` | gdk_content_serializer_get_mime_type |  | Gets the mime type to serialize to. |
| get_output_stream | `ContentSerializer.get_output_stream() -> Gio.OutputStream` | gdk_content_serializer_get_output_stream |  | Gets the output stream for the current operation. This is the stream that was passed to [func@content_serialize_async]. |
| get_priority | `ContentSerializer.get_priority() -> gint` | gdk_content_serializer_get_priority |  | Gets the I/O priority for the current operation. This is the priority that was passed to [func@content_serialize_async]. |
| get_task_data | `ContentSerializer.get_task_data() -> gpointer` | gdk_content_serializer_get_task_data |  | Gets the data that was associated with the current operation. See [method@Gdk.ContentSerializer.set_task_data]. |
| get_user_data | `ContentSerializer.get_user_data() -> gpointer` | gdk_content_serializer_get_user_data |  | Gets the user data that was passed when the serializer was registered. |
| get_value | `ContentSerializer.get_value() -> GObject.Value` | gdk_content_serializer_get_value |  | Gets the `GValue` to read the object to serialize from. |
| return_error | `ContentSerializer.return_error(error: GLib.Error) -> none` | gdk_content_serializer_return_error |  | Indicate that the serialization has ended with an error. This function consumes @error. |
| return_success | `ContentSerializer.return_success() -> none` | gdk_content_serializer_return_success |  | Indicate that the serialization has been successfully completed. |
| set_task_data | `ContentSerializer.set_task_data(data: gpointer?, notify: GLib.DestroyNotify) -> none` | gdk_content_serializer_set_task_data |  | Associate data with the current serialization operation. |

### Gdk.CrossingEvent

Parent: `Event` ?? GType: `GdkCrossingEvent` ?? C type: `GdkCrossingEvent`

An event caused by a pointing device moving between surfaces.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_detail | `CrossingEvent.get_detail() -> NotifyType` | gdk_crossing_event_get_detail |  | Extracts the notify detail from a crossing event. |
| get_focus | `CrossingEvent.get_focus() -> gboolean` | gdk_crossing_event_get_focus |  | Checks if the @event surface is the focus surface. |
| get_mode | `CrossingEvent.get_mode() -> CrossingMode` | gdk_crossing_event_get_mode |  | Extracts the crossing mode from a crossing event. |

### Gdk.Cursor

Parent: `GObject.Object` ?? GType: `GdkCursor` ?? C type: `GdkCursor`

`GdkCursor` is used to create and destroy cursors. Cursors are immutable objects, so once you created them, there is no way to modify them later. Y...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_name | `Cursor.new_from_name(name: utf8, fallback: Cursor?) -> Cursor` | gdk_cursor_new_from_name |  | Creates a new cursor by looking up @name in the current cursor theme. A recommended set of cursor names that will work across different platforms c... |
| new_from_texture | `Cursor.new_from_texture(texture: Texture, hotspot_x: gint, hotspot_y: gint, fallback: Cursor?) -> Cursor` | gdk_cursor_new_from_texture |  | Creates a new cursor from a `GdkTexture`. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fallback | `Cursor.get_fallback() -> Cursor` | gdk_cursor_get_fallback |  | Returns the fallback for this @cursor. The fallback will be used if this cursor is not available on a given `GdkDisplay`. For named cursors, this c... |
| get_hotspot_x | `Cursor.get_hotspot_x() -> gint` | gdk_cursor_get_hotspot_x |  | Returns the horizontal offset of the hotspot. The hotspot indicates the pixel that will be directly above the cursor. Note that named cursors may h... |
| get_hotspot_y | `Cursor.get_hotspot_y() -> gint` | gdk_cursor_get_hotspot_y |  | Returns the vertical offset of the hotspot. The hotspot indicates the pixel that will be directly above the cursor. Note that named cursors may hav... |
| get_name | `Cursor.get_name() -> utf8` | gdk_cursor_get_name |  | Returns the name of the cursor. If the cursor is not a named cursor, %NULL will be returned. |
| get_texture | `Cursor.get_texture() -> Texture` | gdk_cursor_get_texture |  | Returns the texture for the cursor. If the cursor is a named cursor, %NULL will be returned. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fallback | Cursor | read, write, construct-only | Cursor to fall back to if this cursor cannot be displayed. |
| hotspot-x | gint | read, write, construct-only | X position of the cursor hotspot in the cursor image. |
| hotspot-y | gint | read, write, construct-only | Y position of the cursor hotspot in the cursor image. |
| name | utf8 | read, write, construct-only | Name of this this cursor. The name will be %NULL if the cursor was created from a texture. |
| texture | Texture | read, write, construct-only | The texture displayed by this cursor. The texture will be %NULL if the cursor was created from a name. |

### Gdk.DeleteEvent

Parent: `Event` ?? GType: `GdkDeleteEvent` ?? C type: `GdkDeleteEvent`

An event related to closing a top-level surface.

### Gdk.Device

Parent: `GObject.Object` ?? GType: `GdkDevice` ?? C type: `GdkDevice` ?? Abstract

The `GdkDevice` object represents an input device, such as a keyboard, a mouse, or a touchpad. See the [class@Gdk.Seat] documentation for more info...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_caps_lock_state | `Device.get_caps_lock_state() -> gboolean` | gdk_device_get_caps_lock_state |  | Retrieves whether the Caps Lock modifier of the keyboard is locked. This is only relevant for keyboard devices. |
| get_device_tool | `Device.get_device_tool() -> DeviceTool` | gdk_device_get_device_tool |  | Retrieves the current tool for @device. |
| get_direction | `Device.get_direction() -> Pango.Direction` | gdk_device_get_direction |  | Returns the direction of effective layout of the keyboard. This is only relevant for keyboard devices. The direction of a layout is the direction o... |
| get_display | `Device.get_display() -> Display` | gdk_device_get_display |  | Returns the `GdkDisplay` to which @device pertains. |
| get_has_cursor | `Device.get_has_cursor() -> gboolean` | gdk_device_get_has_cursor |  | Determines whether the pointer follows device motion. This is not meaningful for keyboard devices, which don't have a pointer. |
| get_modifier_state | `Device.get_modifier_state() -> ModifierType` | gdk_device_get_modifier_state |  | Retrieves the current modifier state of the keyboard. This is only relevant for keyboard devices. |
| get_name | `Device.get_name() -> utf8` | gdk_device_get_name |  | The name of the device, suitable for showing in a user interface. |
| get_num_lock_state | `Device.get_num_lock_state() -> gboolean` | gdk_device_get_num_lock_state |  | Retrieves whether the Num Lock modifier of the keyboard is locked. This is only relevant for keyboard devices. |
| get_num_touches | `Device.get_num_touches() -> guint` | gdk_device_get_num_touches |  | Retrieves the number of touch points associated to @device. |
| get_product_id | `Device.get_product_id() -> utf8` | gdk_device_get_product_id |  | Returns the product ID of this device. This ID is retrieved from the device, and does not change. See [method@Gdk.Device.get_vendor_id] for more in... |
| get_scroll_lock_state | `Device.get_scroll_lock_state() -> gboolean` | gdk_device_get_scroll_lock_state |  | Retrieves whether the Scroll Lock modifier of the keyboard is locked. This is only relevant for keyboard devices. |
| get_seat | `Device.get_seat() -> Seat` | gdk_device_get_seat |  | Returns the `GdkSeat` the device belongs to. |
| get_source | `Device.get_source() -> InputSource` | gdk_device_get_source |  | Determines the type of the device. |
| get_surface_at_position | `Device.get_surface_at_position(win_x: out gdouble?, win_y: out gdouble?) -> Surface` | gdk_device_get_surface_at_position |  | Obtains the surface underneath @device, returning the location of the device in @win_x and @win_y. Returns %NULL if the surface tree under @device ... |
| get_timestamp | `Device.get_timestamp() -> guint32` | gdk_device_get_timestamp | 4.2 | Returns the timestamp of the last activity for this device. In practice, this means the timestamp of the last event that was received from the OS f... |
| get_vendor_id | `Device.get_vendor_id() -> utf8` | gdk_device_get_vendor_id |  | Returns the vendor ID of this device. This ID is retrieved from the device, and does not change. This function, together with [method@Gdk.Device.ge... |
| has_bidi_layouts | `Device.has_bidi_layouts() -> gboolean` | gdk_device_has_bidi_layouts |  | Determines if layouts for both right-to-left and left-to-right languages are in use on the keyboard. This is only relevant for keyboard devices. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| caps-lock-state | gboolean | read | Whether Caps Lock is on. This is only relevant for keyboard devices. |
| direction | Pango.Direction | read | The direction of the current layout. This is only relevant for keyboard devices. |
| display | Display | read, write, construct-only | The `GdkDisplay` the `GdkDevice` pertains to. |
| has-bidi-layouts | gboolean | read | Whether the device has both right-to-left and left-to-right layouts. This is only relevant for keyboard devices. |
| has-cursor | gboolean | read, write, construct-only | Whether the device is represented by a cursor on the screen. |
| modifier-state | ModifierType | read | The current modifier state of the device. This is only relevant for keyboard devices. |
| n-axes | guint | read | Number of axes in the device. |
| name | utf8 | read, write, construct-only | The device name. |
| num-lock-state | gboolean | read | Whether Num Lock is on. This is only relevant for keyboard devices. |
| num-touches | guint | read, write, construct-only | The maximal number of concurrent touches on a touch device. Will be 0 if the device is not a touch device or if the number of touches is unknown. |
| product-id | utf8 | read, write, construct-only | Product ID of this device. See [method@Gdk.Device.get_product_id]. |
| scroll-lock-state | gboolean | read | Whether Scroll Lock is on. This is only relevant for keyboard devices. |
| seat | Seat | read, write | `GdkSeat` of this device. |
| source | InputSource | read, write, construct-only | Source type for the device. |
| tool | DeviceTool | read | The `GdkDeviceTool` that is currently used with this device. |
| vendor-id | utf8 | read, write, construct-only | Vendor ID of this device. See [method@Gdk.Device.get_vendor_id]. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | Emitted either when the number of either axes or keys changes. On X11 this will normally happen when the physical device routing events through the... |
| tool-changed | `tool: DeviceTool` | none | last |  | Emitted on pen/eraser devices whenever tools enter or leave proximity. |

### Gdk.DeviceTool

Parent: `GObject.Object` ?? GType: `GdkDeviceTool` ?? C type: `GdkDeviceTool`

A physical tool associated to a `GdkDevice`.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_axes | `DeviceTool.get_axes() -> AxisFlags` | gdk_device_tool_get_axes |  | Gets the axes of the tool. |
| get_hardware_id | `DeviceTool.get_hardware_id() -> guint64` | gdk_device_tool_get_hardware_id |  | Gets the hardware ID of this tool, or 0 if it's not known. When non-zero, the identifier is unique for the given tool model, meaning that two ident... |
| get_serial | `DeviceTool.get_serial() -> guint64` | gdk_device_tool_get_serial |  | Gets the serial number of this tool. This value can be used to identify a physical tool (eg. a tablet pen) across program executions. |
| get_tool_type | `DeviceTool.get_tool_type() -> DeviceToolType` | gdk_device_tool_get_tool_type |  | Gets the `GdkDeviceToolType` of the tool. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| axes | AxisFlags | read, write, construct-only | The axes of the tool. |
| hardware-id | guint64 | read, write, construct-only | The hardware ID of the tool. |
| serial | guint64 | read, write, construct-only | The serial number of the tool. |
| tool-type | DeviceToolType | read, write, construct-only | The type of the tool. |

### Gdk.Display

Parent: `GObject.Object` ?? GType: `GdkDisplay` ?? C type: `GdkDisplay`

`GdkDisplay` objects are the GDK representation of a workstation. Their purpose are two-fold: - To manage and provide information about input devic...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Display` | gdk_display_get_default |  | Gets the default `GdkDisplay`. This is a convenience function for: gdk_display_manager_get_default_display (gdk_display_manager_get ()) |
| open | `open(display_name: utf8?) -> Display` | gdk_display_open |  | Opens a display. If opening the display fails, `NULL` is returned. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| beep | `Display.beep() -> none` | gdk_display_beep |  | Emits a short beep on @display |
| close | `Display.close() -> none` | gdk_display_close |  | Closes the connection to the windowing system for the given display. This cleans up associated resources. |
| create_gl_context | `Display.create_gl_context() -> GLContext throws` | gdk_display_create_gl_context | 4.6 | Creates a new `GdkGLContext` for the `GdkDisplay`. The context is disconnected from any particular surface or surface and cannot be used to draw to... |
| device_is_grabbed | `Display.device_is_grabbed(device: Device) -> gboolean` | gdk_display_device_is_grabbed |  | Returns %TRUE if there is an ongoing grab on @device for @display. |
| flush | `Display.flush() -> none` | gdk_display_flush |  | Flushes any requests queued for the windowing system. This happens automatically when the main loop blocks waiting for new events, but if your appl... |
| get_app_launch_context | `Display.get_app_launch_context() -> AppLaunchContext` | gdk_display_get_app_launch_context |  | Returns a `GdkAppLaunchContext` suitable for launching applications on the given display. |
| get_clipboard | `Display.get_clipboard() -> Clipboard` | gdk_display_get_clipboard |  | Gets the clipboard used for copy/paste operations. |
| get_default_seat | `Display.get_default_seat() -> Seat` | gdk_display_get_default_seat |  | Returns the default `GdkSeat` for this display. Note that a display may not have a seat. In this case, this function will return %NULL. |
| get_dmabuf_formats | `Display.get_dmabuf_formats() -> DmabufFormats` | gdk_display_get_dmabuf_formats | 4.14 | Returns the dma-buf formats that are supported on this display. GTK may use OpenGL or Vulkan to support some formats. Calling this function will th... |
| get_monitor_at_surface | `Display.get_monitor_at_surface(surface: Surface) -> Monitor` | gdk_display_get_monitor_at_surface |  | Gets the monitor in which the largest area of @surface resides. |
| get_monitors | `Display.get_monitors() -> Gio.ListModel` | gdk_display_get_monitors |  | Gets the list of monitors associated with this display. Subsequent calls to this function will always return the same list for the same display. Yo... |
| get_name | `Display.get_name() -> utf8` | gdk_display_get_name |  | Gets the name of the display. |
| get_primary_clipboard | `Display.get_primary_clipboard() -> Clipboard` | gdk_display_get_primary_clipboard |  | Gets the clipboard used for the primary selection. On backends where the primary clipboard is not supported natively, GDK emulates this clipboard l... |
| get_setting | `Display.get_setting(name: utf8, value: GObject.Value) -> gboolean` | gdk_display_get_setting |  | Retrieves a desktop-wide setting such as double-click time for the @display. |
| get_startup_notification_id | `Display.get_startup_notification_id() -> utf8` | gdk_display_get_startup_notification_id |  | Gets the startup notification ID for a Wayland display, or %NULL if no ID has been defined. |
| is_closed | `Display.is_closed() -> gboolean` | gdk_display_is_closed |  | Finds out if the display has been closed. |
| is_composited | `Display.is_composited() -> gboolean` | gdk_display_is_composited |  | Returns whether surfaces can reasonably be expected to have their alpha channel drawn correctly on the screen. Check [method@Gdk.Display.is_rgba] f... |
| is_rgba | `Display.is_rgba() -> gboolean` | gdk_display_is_rgba |  | Returns whether surfaces on this @display are created with an alpha channel. Even if a %TRUE is returned, it is possible that the surface???s alpha... |
| list_seats | `Display.list_seats() -> GLib.List` | gdk_display_list_seats |  | Returns the list of seats known to @display. |
| map_keycode | `Display.map_keycode(keycode: guint, keys: out KeymapKey?, keyvals: out guint?, n_entries: out gint) -> gboolean` | gdk_display_map_keycode |  | Returns the keyvals bound to @keycode. The Nth `GdkKeymapKey` in @keys is bound to the Nth keyval in @keyvals. When a keycode is pressed by the use... |
| map_keyval | `Display.map_keyval(keyval: guint, keys: out KeymapKey, n_keys: out gint) -> gboolean` | gdk_display_map_keyval |  | Obtains a list of keycode/group/level combinations that will generate @keyval. Groups and levels are two kinds of keyboard mode; in general, the le... |
| notify_startup_complete | `Display.notify_startup_complete(startup_id: utf8) -> none` | gdk_display_notify_startup_complete |  | Indicates to the GUI environment that the application has finished loading, using a given identifier. GTK will call this function automatically for... |
| prepare_gl | `Display.prepare_gl() -> gboolean throws` | gdk_display_prepare_gl | 4.4 | Checks that OpenGL is available for @self and ensures that it is properly initialized. When this fails, an @error will be set describing the error ... |
| put_event | `Display.put_event(event: Event) -> none` | gdk_display_put_event |  | Adds the given event to the event queue for @display. |
| supports_input_shapes | `Display.supports_input_shapes() -> gboolean` | gdk_display_supports_input_shapes |  | Returns %TRUE if the display supports input shapes. This means that [method@Gdk.Surface.set_input_region] can be used to modify the input shape of ... |
| supports_shadow_width | `Display.supports_shadow_width() -> gboolean` | gdk_display_supports_shadow_width | 4.14 | Returns whether it's possible for a surface to draw outside of the window area. If %TRUE is returned the application decides if it wants to draw sh... |
| sync | `Display.sync() -> none` | gdk_display_sync |  | Flushes any requests queued for the windowing system and waits until all requests have been handled. This is often used for making sure that the di... |
| translate_key | `Display.translate_key(keycode: guint, state: ModifierType, group: gint, keyval: out guint?, effective_group: out gint?, level: out gint?, consumed: out ModifierType?) -> gboolean` | gdk_display_translate_key |  | Translates the contents of a `GdkEventKey` into a keyval, effective group, and level. Modifiers that affected the translation and are thus unavaila... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| composited | gboolean | read | %TRUE if the display properly composites the alpha channel. |
| dmabuf-formats | DmabufFormats | read | The dma-buf formats that are supported on this display |
| input-shapes | gboolean | read | %TRUE if the display supports input shapes. |
| rgba | gboolean | read | %TRUE if the display supports an alpha channel. |
| shadow-width | gboolean | read | %TRUE if the display supports extensible frames. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `is_error: gboolean` | none | last |  | Emitted when the connection to the windowing system for @display is closed. |
| opened | `` | none | last |  | Emitted when the connection to the windowing system for @display is opened. |
| seat-added | `seat: Seat` | none | last |  | Emitted whenever a new seat is made known to the windowing system. |
| seat-removed | `seat: Seat` | none | last |  | Emitted whenever a seat is removed by the windowing system. |
| setting-changed | `setting: utf8` | none | last |  | Emitted whenever a setting changes its value. |

### Gdk.DisplayManager

Parent: `GObject.Object` ?? GType: `GdkDisplayManager` ?? C type: `GdkDisplayManager`

A singleton object that offers notification when displays appear or disappear. You can use [func@Gdk.DisplayManager.get] to obtain the `GdkDisplayM...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> DisplayManager` | gdk_display_manager_get |  | Gets the singleton `GdkDisplayManager` object. When called for the first time, this function consults the `GDK_BACKEND` environment variable to fin... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_display | `DisplayManager.get_default_display() -> Display` | gdk_display_manager_get_default_display |  | Gets the default `GdkDisplay`. |
| list_displays | `DisplayManager.list_displays() -> GLib.SList` | gdk_display_manager_list_displays |  | List all currently open displays. |
| open_display | `DisplayManager.open_display(name: utf8?) -> Display` | gdk_display_manager_open_display |  | Opens a display. |
| set_default_display | `DisplayManager.set_default_display(display: Display) -> none` | gdk_display_manager_set_default_display |  | Sets @display as the default display. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| default-display | Display | read, write | The default display. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| display-opened | `display: Display` | none | last |  | Emitted when a display is opened. |

### Gdk.DmabufTexture

Parent: `Texture` ?? Implements: `Paintable`, `Gio.Icon`, `Gio.LoadableIcon` ?? GType: `GdkDmabufTexture` ?? C type: `GdkDmabufTexture`

A `GdkTexture` representing a DMA buffer. To create a `GdkDmabufTexture`, use the auxiliary [class@Gdk.DmabufTextureBuilder] object. Dma-buf textur...

### Gdk.DmabufTextureBuilder

Parent: `GObject.Object` ?? GType: `GdkDmabufTextureBuilder` ?? C type: `GdkDmabufTextureBuilder`

`GdkDmabufTextureBuilder` is a builder used to construct [class@Gdk.Texture] objects from DMA buffers. DMA buffers are commonly called **_dma-bufs_...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DmabufTextureBuilder.new() -> DmabufTextureBuilder` | gdk_dmabuf_texture_builder_new | 4.14 | Creates a new texture builder. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| build | `DmabufTextureBuilder.build(destroy: GLib.DestroyNotify?, data: gpointer?) -> Texture throws` | gdk_dmabuf_texture_builder_build | 4.14 | Builds a new `GdkTexture` with the values set up in the builder. It is a programming error to call this function if any mandatory property has not ... |
| get_display | `DmabufTextureBuilder.get_display() -> Display` | gdk_dmabuf_texture_builder_get_display | 4.14 | Returns the display that this texture builder is associated with. |
| get_fd | `DmabufTextureBuilder.get_fd(plane: guint) -> gint` | gdk_dmabuf_texture_builder_get_fd | 4.14 | Gets the file descriptor for a plane. |
| get_fourcc | `DmabufTextureBuilder.get_fourcc() -> guint32` | gdk_dmabuf_texture_builder_get_fourcc | 4.14 | Gets the format previously set via gdk_dmabuf_texture_builder_set_fourcc() or 0 if the format wasn't set. The format is specified as a fourcc code. |
| get_height | `DmabufTextureBuilder.get_height() -> guint` | gdk_dmabuf_texture_builder_get_height | 4.14 | Gets the height previously set via gdk_dmabuf_texture_builder_set_height() or 0 if the height wasn't set. |
| get_modifier | `DmabufTextureBuilder.get_modifier() -> guint64` | gdk_dmabuf_texture_builder_get_modifier | 4.14 | Gets the modifier value. |
| get_n_planes | `DmabufTextureBuilder.get_n_planes() -> guint` | gdk_dmabuf_texture_builder_get_n_planes | 4.14 | Gets the number of planes. |
| get_offset | `DmabufTextureBuilder.get_offset(plane: guint) -> guint` | gdk_dmabuf_texture_builder_get_offset | 4.14 | Gets the offset value for a plane. |
| get_premultiplied | `DmabufTextureBuilder.get_premultiplied() -> gboolean` | gdk_dmabuf_texture_builder_get_premultiplied | 4.14 | Whether the data is premultiplied. |
| get_stride | `DmabufTextureBuilder.get_stride(plane: guint) -> guint` | gdk_dmabuf_texture_builder_get_stride | 4.14 | Gets the stride value for a plane. |
| get_update_region | `DmabufTextureBuilder.get_update_region() -> cairo.Region` | gdk_dmabuf_texture_builder_get_update_region | 4.14 | Gets the region previously set via gdk_dmabuf_texture_builder_set_update_region() or %NULL if none was set. |
| get_update_texture | `DmabufTextureBuilder.get_update_texture() -> Texture` | gdk_dmabuf_texture_builder_get_update_texture | 4.14 | Gets the texture previously set via gdk_dmabuf_texture_builder_set_update_texture() or %NULL if none was set. |
| get_width | `DmabufTextureBuilder.get_width() -> guint` | gdk_dmabuf_texture_builder_get_width | 4.14 | Gets the width previously set via gdk_dmabuf_texture_builder_set_width() or 0 if the width wasn't set. |
| set_display | `DmabufTextureBuilder.set_display(display: Display) -> none` | gdk_dmabuf_texture_builder_set_display | 4.14 | Sets the display that this texture builder is associated with. The display is used to determine the supported dma-buf formats. |
| set_fd | `DmabufTextureBuilder.set_fd(plane: guint, fd: gint) -> none` | gdk_dmabuf_texture_builder_set_fd | 4.14 | Sets the file descriptor for a plane. |
| set_fourcc | `DmabufTextureBuilder.set_fourcc(fourcc: guint32) -> none` | gdk_dmabuf_texture_builder_set_fourcc | 4.14 | Sets the format of the texture. The format is specified as a fourcc code. The format must be set before calling [method@Gdk.GLTextureBuilder.build]. |
| set_height | `DmabufTextureBuilder.set_height(height: guint) -> none` | gdk_dmabuf_texture_builder_set_height | 4.14 | Sets the height of the texture. The height must be set before calling [method@Gdk.GLTextureBuilder.build]. |
| set_modifier | `DmabufTextureBuilder.set_modifier(modifier: guint64) -> none` | gdk_dmabuf_texture_builder_set_modifier | 4.14 | Sets the modifier. |
| set_n_planes | `DmabufTextureBuilder.set_n_planes(n_planes: guint) -> none` | gdk_dmabuf_texture_builder_set_n_planes | 4.14 | Sets the number of planes of the texture. |
| set_offset | `DmabufTextureBuilder.set_offset(plane: guint, offset: guint) -> none` | gdk_dmabuf_texture_builder_set_offset | 4.14 | Sets the offset for a plane. |
| set_premultiplied | `DmabufTextureBuilder.set_premultiplied(premultiplied: gboolean) -> none` | gdk_dmabuf_texture_builder_set_premultiplied | 4.14 | Sets whether the data is premultiplied. Unless otherwise specified, all formats including alpha channels are assumed to be premultiplied. |
| set_stride | `DmabufTextureBuilder.set_stride(plane: guint, stride: guint) -> none` | gdk_dmabuf_texture_builder_set_stride | 4.14 | Sets the stride for a plane. The stride must be set for all planes before calling [method@Gdk.GLTextureBuilder.build]. |
| set_update_region | `DmabufTextureBuilder.set_update_region(region: cairo.Region?) -> none` | gdk_dmabuf_texture_builder_set_update_region | 4.14 | Sets the region to be updated by this texture. Together with [property@Gdk.DmabufTextureBuilder:update-texture] this describes an update of a previ... |
| set_update_texture | `DmabufTextureBuilder.set_update_texture(texture: Texture?) -> none` | gdk_dmabuf_texture_builder_set_update_texture | 4.14 | Sets the texture to be updated by this texture. See [method@Gdk.DmabufTextureBuilder.set_update_region] for an explanation. |
| set_width | `DmabufTextureBuilder.set_width(width: guint) -> none` | gdk_dmabuf_texture_builder_set_width | 4.14 | Sets the width of the texture. The width must be set before calling [method@Gdk.GLTextureBuilder.build]. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write | The display that this texture will be used on. |
| fourcc | guint | read, write | The format of the texture, as a fourcc value. |
| height | guint | read, write | The height of the texture. |
| modifier | guint64 | read, write | The modifier. |
| n-planes | guint | read, write | The number of planes of the texture. Note that you can set properties for other planes, but they will be ignored when constructing the texture. |
| premultiplied | gboolean | read, write | Whether the alpha channel is premultiplied into the others. Only relevant if the format has alpha. |
| update-region | cairo.Region | read, write | The update region for [property@Gdk.GLTextureBuilder:update-texture]. |
| update-texture | Texture | read, write | The texture [property@Gdk.DmabufTextureBuilder:update-region] is an update for. |
| width | guint | read, write | The width of the texture. |

### Gdk.DNDEvent

Parent: `Event` ?? GType: `GdkDNDEvent` ?? C type: `GdkDNDEvent`

An event related to drag and drop operations.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_drop | `DNDEvent.get_drop() -> Drop` | gdk_dnd_event_get_drop |  | Gets the `GdkDrop` object from a DND event. |

### Gdk.Drag

Parent: `GObject.Object` ?? GType: `GdkDrag` ?? C type: `GdkDrag` ?? Abstract

The `GdkDrag` object represents the source of an ongoing DND operation. A `GdkDrag` is created when a drag is started, and stays alive for duration...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| begin | `begin(surface: Surface, device: Device, content: ContentProvider, actions: DragAction, dx: gdouble, dy: gdouble) -> Drag` | gdk_drag_begin |  | Starts a drag and creates a new drag context for it. This function is called by the drag source. After this call, you probably want to set up the d... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drop_done | `Drag.drop_done(success: gboolean) -> none` | gdk_drag_drop_done |  | Informs GDK that the drop ended. Passing %FALSE for @success may trigger a drag cancellation animation. This function is called by the drag source,... |
| get_actions | `Drag.get_actions() -> DragAction` | gdk_drag_get_actions |  | Determines the bitmask of possible actions proposed by the source. |
| get_content | `Drag.get_content() -> ContentProvider` | gdk_drag_get_content |  | Returns the `GdkContentProvider` associated to the `GdkDrag` object. |
| get_device | `Drag.get_device() -> Device` | gdk_drag_get_device |  | Returns the `GdkDevice` associated to the `GdkDrag` object. |
| get_display | `Drag.get_display() -> Display` | gdk_drag_get_display |  | Gets the `GdkDisplay` that the drag object was created for. |
| get_drag_surface | `Drag.get_drag_surface() -> Surface` | gdk_drag_get_drag_surface |  | Returns the surface on which the drag icon should be rendered during the drag operation. Note that the surface may not be available until the drag ... |
| get_formats | `Drag.get_formats() -> ContentFormats` | gdk_drag_get_formats |  | Retrieves the formats supported by this `GdkDrag` object. |
| get_selected_action | `Drag.get_selected_action() -> DragAction` | gdk_drag_get_selected_action |  | Determines the action chosen by the drag destination. |
| get_surface | `Drag.get_surface() -> Surface` | gdk_drag_get_surface |  | Returns the `GdkSurface` where the drag originates. |
| set_hotspot | `Drag.set_hotspot(hot_x: gint, hot_y: gint) -> none` | gdk_drag_set_hotspot |  | Sets the position of the drag surface that will be kept under the cursor hotspot. Initially, the hotspot is at the top left corner of the drag surf... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| actions | DragAction | read, write | The possible actions of this drag. |
| content | ContentProvider | read, write, construct-only | The `GdkContentProvider`. |
| device | Device | read, write, construct-only | The `GdkDevice` that is performing the drag. |
| display | Display | read | The `GdkDisplay` that the drag belongs to. |
| formats | ContentFormats | read, write, construct-only | The possible formats that the drag can provide its data in. |
| selected-action | DragAction | read, write | The currently selected action of the drag. |
| surface | Surface | read, write, construct-only | The surface where the drag originates. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| cancel | `reason: DragCancelReason` | none | last |  | Emitted when the drag operation is cancelled. |
| dnd-finished | `` | none | last |  | Emitted when the destination side has finished reading all data. The drag object can now free all miscellaneous data. |
| drop-performed | `` | none | last |  | Emitted when the drop operation is performed on an accepting client. |

### Gdk.DrawContext

Parent: `GObject.Object` ?? Subclasses: `CairoContext`, `GLContext`, `VulkanContext` ?? GType: `GdkDrawContext` ?? C type: `GdkDrawContext` ?? Abstract

Base class for objects implementing different rendering methods. `GdkDrawContext` is the base object used by contexts implementing different render...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| begin_frame | `DrawContext.begin_frame(region: cairo.Region) -> none` | gdk_draw_context_begin_frame |  | Indicates that you are beginning the process of redrawing @region on the @context's surface. Calling this function begins a drawing operation using... |
| end_frame | `DrawContext.end_frame() -> none` | gdk_draw_context_end_frame |  | Ends a drawing operation started with gdk_draw_context_begin_frame(). This makes the drawing available on screen. See [method@Gdk.DrawContext.begin... |
| get_display | `DrawContext.get_display() -> Display` | gdk_draw_context_get_display |  | Retrieves the `GdkDisplay` the @context is created for |
| get_frame_region | `DrawContext.get_frame_region() -> cairo.Region` | gdk_draw_context_get_frame_region |  | Retrieves the region that is currently being repainted. After a call to [method@Gdk.DrawContext.begin_frame] this function will return a union of t... |
| get_surface | `DrawContext.get_surface() -> Surface` | gdk_draw_context_get_surface |  | Retrieves the surface that @context is bound to. |
| is_in_frame | `DrawContext.is_in_frame() -> gboolean` | gdk_draw_context_is_in_frame |  | Returns %TRUE if @context is in the process of drawing to its surface. This is the case between calls to [method@Gdk.DrawContext.begin_frame] and [... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only | The `GdkDisplay` used to create the `GdkDrawContext`. |
| surface | Surface | read, write, construct-only | The `GdkSurface` the context is bound to. |

### Gdk.Drop

Parent: `GObject.Object` ?? GType: `GdkDrop` ?? C type: `GdkDrop` ?? Abstract

The `GdkDrop` object represents the target of an ongoing DND operation. Possible drop sites get informed about the status of the ongoing drag opera...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| finish | `Drop.finish(action: DragAction) -> none` | gdk_drop_finish |  | Ends the drag operation after a drop. The @action must be a single action selected from the actions available via [method@Gdk.Drop.get_actions]. |
| get_actions | `Drop.get_actions() -> DragAction` | gdk_drop_get_actions |  | Returns the possible actions for this `GdkDrop`. If this value contains multiple actions - i.e. [func@Gdk.DragAction.is_unique] returns %FALSE for ... |
| get_device | `Drop.get_device() -> Device` | gdk_drop_get_device |  | Returns the `GdkDevice` performing the drop. |
| get_display | `Drop.get_display() -> Display` | gdk_drop_get_display |  | Gets the `GdkDisplay` that @self was created for. |
| get_drag | `Drop.get_drag() -> Drag` | gdk_drop_get_drag |  | If this is an in-app drag-and-drop operation, returns the `GdkDrag` that corresponds to this drop. If it is not, %NULL is returned. |
| get_formats | `Drop.get_formats() -> ContentFormats` | gdk_drop_get_formats |  | Returns the `GdkContentFormats` that the drop offers the data to be read in. |
| get_surface | `Drop.get_surface() -> Surface` | gdk_drop_get_surface |  | Returns the `GdkSurface` performing the drop. |
| read_async | `Drop.read_async(mime_types: utf8, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_drop_read_async |  | Asynchronously read the dropped data from a `GdkDrop` in a format that complies with one of the mime types. |
| read_finish | `Drop.read_finish(result: Gio.AsyncResult, out_mime_type: out utf8) -> Gio.InputStream throws` | gdk_drop_read_finish |  | Finishes an async drop read operation. Note that you must not use blocking read calls on the returned stream in the GTK thread, since some platform... |
| read_value_async | `Drop.read_value_async(type: GType, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_drop_read_value_async |  | Asynchronously request the drag operation's contents converted to the given @type. When the operation is finished @callback will be called. You mus... |
| read_value_finish | `Drop.read_value_finish(result: Gio.AsyncResult) -> GObject.Value throws` | gdk_drop_read_value_finish |  | Finishes an async drop read. See [method@Gdk.Drop.read_value_async]. |
| status | `Drop.status(actions: DragAction, preferred: DragAction) -> none` | gdk_drop_status |  | Selects all actions that are potentially supported by the destination. When calling this function, do not restrict the passed in actions to the one... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| actions | DragAction | read, write, construct-only | The possible actions for this drop |
| device | Device | read, write, construct-only | The `GdkDevice` performing the drop |
| display | Display | read | The `GdkDisplay` that the drop belongs to. |
| drag | Drag | read, write, construct-only | The `GdkDrag` that initiated this drop |
| formats | ContentFormats | read, write, construct-only | The possible formats that the drop can provide its data in. |
| surface | Surface | read, write, construct-only | The `GdkSurface` the drop happens on |

### Gdk.Event

Subclasses: `ButtonEvent`, `CrossingEvent`, `DeleteEvent`, `DNDEvent`, `FocusEvent`, `GrabBrokenEvent`, `KeyEvent`, `MotionEvent`, `PadEvent`, `ProximityEvent`, `ScrollEvent`, `TouchEvent`, `TouchpadEvent` ?? GType: `GdkEvent` ?? C type: `GdkEvent` ?? Abstract

`GdkEvent`s are immutable data structures, created by GDK to represent windowing system events. In GTK applications the events are handled automati...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| _get_angle | `Event._get_angle(event2: Event, angle: out gdouble) -> gboolean` | gdk_events_get_angle |  | Returns the relative angle from @event1 to @event2. The relative angle is the angle between the X axis and the line through both events' positions.... |
| _get_center | `Event._get_center(event2: Event, x: out gdouble, y: out gdouble) -> gboolean` | gdk_events_get_center |  | Returns the point halfway between the events' positions. This assumes that both events have X/Y information. If not, this function returns %FALSE. |
| _get_distance | `Event._get_distance(event2: Event, distance: out gdouble) -> gboolean` | gdk_events_get_distance |  | Returns the distance between the event locations. This assumes that both events have X/Y information. If not, this function returns %FALSE. |
| get_axes | `Event.get_axes(axes: out gdouble, n_axes: out guint) -> gboolean` | gdk_event_get_axes |  | Extracts all axis values from an event. To find out which axes are used, use [method@Gdk.DeviceTool.get_axes] on the device tool returned by [metho... |
| get_axis | `Event.get_axis(axis_use: AxisUse, value: out gdouble) -> gboolean` | gdk_event_get_axis |  | Extract the axis value for a particular axis use from an event structure. To find out which axes are used, use [method@Gdk.DeviceTool.get_axes] on ... |
| get_device | `Event.get_device() -> Device` | gdk_event_get_device |  | Returns the device of an event. |
| get_device_tool | `Event.get_device_tool() -> DeviceTool` | gdk_event_get_device_tool |  | Returns a `GdkDeviceTool` representing the tool that caused the event. If the was not generated by a device that supports different tools (such as ... |
| get_display | `Event.get_display() -> Display` | gdk_event_get_display |  | Retrieves the display associated to the @event. |
| get_event_sequence | `Event.get_event_sequence() -> EventSequence` | gdk_event_get_event_sequence |  | Returns the event sequence to which the event belongs. Related touch events are connected in a sequence. Other events typically don't have event se... |
| get_event_type | `Event.get_event_type() -> EventType` | gdk_event_get_event_type |  | Retrieves the type of the event. |
| get_history | `Event.get_history(out_n_coords: out guint) -> TimeCoord` | gdk_event_get_history |  | Retrieves the history of the device that @event is for, as a list of time and coordinates. The history includes positions that are not delivered as... |
| get_modifier_state | `Event.get_modifier_state() -> ModifierType` | gdk_event_get_modifier_state |  | Returns the modifier state field of an event. |
| get_pointer_emulated | `Event.get_pointer_emulated() -> gboolean` | gdk_event_get_pointer_emulated |  | Returns whether this event is an 'emulated' pointer event. Emulated pointer events typically originate from a touch events. |
| get_position | `Event.get_position(x: out gdouble, y: out gdouble) -> gboolean` | gdk_event_get_position |  | Extract the event surface relative x/y coordinates from an event. This position is in surface coordinates. |
| get_seat | `Event.get_seat() -> Seat` | gdk_event_get_seat |  | Returns the seat that originated the event. |
| get_surface | `Event.get_surface() -> Surface` | gdk_event_get_surface |  | Extracts the surface associated with an event. |
| get_time | `Event.get_time() -> guint32` | gdk_event_get_time |  | Returns the timestamp of @event. Not all events have timestamps. In that case, this function returns %GDK_CURRENT_TIME. |
| ref | `Event.ref() -> Event` | gdk_event_ref |  | Increase the ref count of @event. |
| triggers_context_menu | `Event.triggers_context_menu() -> gboolean` | gdk_event_triggers_context_menu |  | Returns whether a `GdkEvent` should trigger a context menu, according to platform conventions. The right mouse button typically triggers context me... |
| unref | `Event.unref() -> none` | gdk_event_unref |  | Decrease the ref count of @event. If the last reference is dropped, the structure is freed. |

### Gdk.FocusEvent

Parent: `Event` ?? GType: `GdkFocusEvent` ?? C type: `GdkFocusEvent`

An event related to a keyboard focus change.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_in | `FocusEvent.get_in() -> gboolean` | gdk_focus_event_get_in |  | Extracts whether this event is about focus entering or leaving the surface. |

### Gdk.FrameClock

Parent: `GObject.Object` ?? GType: `GdkFrameClock` ?? C type: `GdkFrameClock` ?? Abstract

A `GdkFrameClock` tells the application when to update and repaint a surface. This may be synced to the vertical refresh rate of the monitor, for e...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| begin_updating | `FrameClock.begin_updating() -> none` | gdk_frame_clock_begin_updating |  | Starts updates for an animation. Until a matching call to [method@Gdk.FrameClock.end_updating] is made, the frame clock will continually request a ... |
| end_updating | `FrameClock.end_updating() -> none` | gdk_frame_clock_end_updating |  | Stops updates for an animation. See the documentation for [method@Gdk.FrameClock.begin_updating]. |
| get_current_timings | `FrameClock.get_current_timings() -> FrameTimings` | gdk_frame_clock_get_current_timings |  | Gets the frame timings for the current frame. |
| get_fps | `FrameClock.get_fps() -> gdouble` | gdk_frame_clock_get_fps |  | Calculates the current frames-per-second, based on the frame timings of @frame_clock. |
| get_frame_counter | `FrameClock.get_frame_counter() -> gint64` | gdk_frame_clock_get_frame_counter |  | `GdkFrameClock` maintains a 64-bit counter that increments for each frame drawn. |
| get_frame_time | `FrameClock.get_frame_time() -> gint64` | gdk_frame_clock_get_frame_time |  | Gets the time that should currently be used for animations. Inside the processing of a frame, it???s the time used to compute the animation positio... |
| get_history_start | `FrameClock.get_history_start() -> gint64` | gdk_frame_clock_get_history_start |  | Returns the frame counter for the oldest frame available in history. `GdkFrameClock` internally keeps a history of `GdkFrameTimings` objects for re... |
| get_refresh_info | `FrameClock.get_refresh_info(base_time: gint64, refresh_interval_return: out gint64?, presentation_time_return: out gint64) -> none` | gdk_frame_clock_get_refresh_info |  | Predicts a presentation time, based on history. Using the frame history stored in the frame clock, finds the last known presentation time and refre... |
| get_timings | `FrameClock.get_timings(frame_counter: gint64) -> FrameTimings` | gdk_frame_clock_get_timings |  | Retrieves a `GdkFrameTimings` object holding timing information for the current frame or a recent frame. The `GdkFrameTimings` object may not yet b... |
| request_phase | `FrameClock.request_phase(phase: FrameClockPhase) -> none` | gdk_frame_clock_request_phase |  | Asks the frame clock to run a particular phase. The signal corresponding the requested phase will be emitted the next time the frame clock processe... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| after-paint | `` | none | last |  | This signal ends processing of the frame. Applications should generally not handle this signal. |
| before-paint | `` | none | last |  | Begins processing of the frame. Applications should generally not handle this signal. |
| flush-events | `` | none | last |  | Used to flush pending motion events that are being batched up and compressed together. Applications should not handle this signal. |
| layout | `` | none | last |  | Emitted as the second step of toolkit and application processing of the frame. Any work to update sizes and positions of application elements shoul... |
| paint | `` | none | last |  | Emitted as the third step of toolkit and application processing of the frame. The frame is repainted. GDK normally handles this internally and emit... |
| resume-events | `` | none | last |  | Emitted after processing of the frame is finished. This signal is handled internally by GTK to resume normal event processing. Applications should ... |
| update | `` | none | last |  | Emitted as the first step of toolkit and application processing of the frame. Animations should be updated using [method@Gdk.FrameClock.get_frame_t... |

### Gdk.GLContext

Parent: `DrawContext` ?? GType: `GdkGLContext` ?? C type: `GdkGLContext` ?? Abstract

`GdkGLContext` is an object representing a platform-specific OpenGL draw context. `GdkGLContext`s are created for a surface using [method@Gdk.Surfa...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_current | `clear_current() -> none` | gdk_gl_context_clear_current |  | Clears the current `GdkGLContext`. Any OpenGL call after this function returns will be ignored until [method@Gdk.GLContext.make_current] is called. |
| get_current | `get_current() -> GLContext` | gdk_gl_context_get_current |  | Retrieves the current `GdkGLContext`. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_allowed_apis | `GLContext.get_allowed_apis() -> GLAPI` | gdk_gl_context_get_allowed_apis | 4.6 | Gets the allowed APIs set via gdk_gl_context_set_allowed_apis(). |
| get_api | `GLContext.get_api() -> GLAPI` | gdk_gl_context_get_api | 4.6 | Gets the API currently in use. If the renderer has not been realized yet, 0 is returned. |
| get_debug_enabled | `GLContext.get_debug_enabled() -> gboolean` | gdk_gl_context_get_debug_enabled |  | Retrieves whether the context is doing extra validations and runtime checking. See [method@Gdk.GLContext.set_debug_enabled]. |
| get_display | `GLContext.get_display() -> Display` | gdk_gl_context_get_display |  | Retrieves the display the @context is created for |
| get_forward_compatible | `GLContext.get_forward_compatible() -> gboolean` | gdk_gl_context_get_forward_compatible |  | Retrieves whether the context is forward-compatible. See [method@Gdk.GLContext.set_forward_compatible]. |
| get_required_version | `GLContext.get_required_version(major: out gint?, minor: out gint?) -> none` | gdk_gl_context_get_required_version |  | Retrieves required OpenGL version set as a requirement for the @context realization. It will not change even if a greater OpenGL version is support... |
| get_shared_context | `GLContext.get_shared_context() -> GLContext` | gdk_gl_context_get_shared_context |  | Used to retrieves the `GdkGLContext` that this @context share data with. As many contexts can share data now and no single shared context exists an... |
| get_surface | `GLContext.get_surface() -> Surface` | gdk_gl_context_get_surface |  | Retrieves the surface used by the @context. |
| get_use_es | `GLContext.get_use_es() -> gboolean` | gdk_gl_context_get_use_es |  | Checks whether the @context is using an OpenGL or OpenGL ES profile. |
| get_version | `GLContext.get_version(major: out gint, minor: out gint) -> none` | gdk_gl_context_get_version |  | Retrieves the OpenGL version of the @context. The @context must be realized prior to calling this function. |
| is_legacy | `GLContext.is_legacy() -> gboolean` | gdk_gl_context_is_legacy |  | Whether the `GdkGLContext` is in legacy mode or not. The `GdkGLContext` must be realized before calling this function. When realizing a GL context,... |
| is_shared | `GLContext.is_shared(other: GLContext) -> gboolean` | gdk_gl_context_is_shared | 4.4 | Checks if the two GL contexts can share resources. When they can, the texture IDs from @other can be used in @self. This is particularly useful whe... |
| make_current | `GLContext.make_current() -> none` | gdk_gl_context_make_current |  | Makes the @context the current one. |
| realize | `GLContext.realize() -> gboolean throws` | gdk_gl_context_realize |  | Realizes the given `GdkGLContext`. It is safe to call this function on a realized `GdkGLContext`. |
| set_allowed_apis | `GLContext.set_allowed_apis(apis: GLAPI) -> none` | gdk_gl_context_set_allowed_apis | 4.6 | Sets the allowed APIs. When gdk_gl_context_realize() is called, only the allowed APIs will be tried. If you set this to 0, realizing will always fa... |
| set_debug_enabled | `GLContext.set_debug_enabled(enabled: gboolean) -> none` | gdk_gl_context_set_debug_enabled |  | Sets whether the `GdkGLContext` should perform extra validations and runtime checking. This is useful during development, but has additional overhe... |
| set_forward_compatible | `GLContext.set_forward_compatible(compatible: gboolean) -> none` | gdk_gl_context_set_forward_compatible |  | Sets whether the `GdkGLContext` should be forward-compatible. Forward-compatible contexts must not support OpenGL functionality that has been marke... |
| set_required_version | `GLContext.set_required_version(major: gint, minor: gint) -> none` | gdk_gl_context_set_required_version |  | Sets the major and minor version of OpenGL to request. Setting @major and @minor to zero will use the default values. Setting @major and @minor low... |
| set_use_es | `GLContext.set_use_es(use_es: gint) -> none` | gdk_gl_context_set_use_es |  | Requests that GDK create an OpenGL ES context instead of an OpenGL one. Not all platforms support OpenGL ES. The @context must not have been realiz... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| allowed-apis | GLAPI | read, write | The allowed APIs. |
| api | GLAPI | read | The API currently in use. |
| shared-context | GLContext | read, write, construct-only | Always %NULL As many contexts can share data now and no single shared context exists anymore, this function has been deprecated and now always retu... |

### Gdk.GLTexture

Parent: `Texture` ?? Implements: `Paintable`, `Gio.Icon`, `Gio.LoadableIcon` ?? GType: `GdkGLTexture` ?? C type: `GdkGLTexture`

A GdkTexture representing a GL texture object.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GLTexture.new(context: GLContext, id: guint, width: gint, height: gint, destroy: GLib.DestroyNotify, data: gpointer?) -> GLTexture` | gdk_gl_texture_new |  | Creates a new texture for an existing GL texture. Note that the GL texture must not be modified until @destroy is called, which will happen when th... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| release | `GLTexture.release() -> none` | gdk_gl_texture_release |  | Releases the GL resources held by a `GdkGLTexture`. The texture contents are still available via the [method@Gdk.Texture.download] function, after ... |

### Gdk.GLTextureBuilder

Parent: `GObject.Object` ?? GType: `GdkGLTextureBuilder` ?? C type: `GdkGLTextureBuilder`

`GdkGLTextureBuilder` is a builder used to construct [class@Gdk.Texture] objects from GL textures. The operation is quite simple: Create a texture ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GLTextureBuilder.new() -> GLTextureBuilder` | gdk_gl_texture_builder_new | 4.12 | Creates a new texture builder. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| build | `GLTextureBuilder.build(destroy: GLib.DestroyNotify?, data: gpointer?) -> Texture` | gdk_gl_texture_builder_build | 4.12 | Builds a new `GdkTexture` with the values set up in the builder. The `destroy` function gets called when the returned texture gets released; either... |
| get_context | `GLTextureBuilder.get_context() -> GLContext` | gdk_gl_texture_builder_get_context | 4.12 | Gets the context previously set via gdk_gl_texture_builder_set_context() or %NULL if none was set. |
| get_format | `GLTextureBuilder.get_format() -> MemoryFormat` | gdk_gl_texture_builder_get_format | 4.12 | Gets the format previously set via gdk_gl_texture_builder_set_format(). |
| get_has_mipmap | `GLTextureBuilder.get_has_mipmap() -> gboolean` | gdk_gl_texture_builder_get_has_mipmap | 4.12 | Gets whether the texture has a mipmap. |
| get_height | `GLTextureBuilder.get_height() -> gint` | gdk_gl_texture_builder_get_height | 4.12 | Gets the height previously set via gdk_gl_texture_builder_set_height() or 0 if the height wasn't set. |
| get_id | `GLTextureBuilder.get_id() -> guint` | gdk_gl_texture_builder_get_id | 4.12 | Gets the texture id previously set via gdk_gl_texture_builder_set_id() or 0 if the id wasn't set. |
| get_sync | `GLTextureBuilder.get_sync() -> gpointer` | gdk_gl_texture_builder_get_sync | 4.12 | Gets the `GLsync` previously set via gdk_gl_texture_builder_set_sync(). |
| get_update_region | `GLTextureBuilder.get_update_region() -> cairo.Region` | gdk_gl_texture_builder_get_update_region | 4.12 | Gets the region previously set via gdk_gl_texture_builder_set_update_region() or %NULL if none was set. |
| get_update_texture | `GLTextureBuilder.get_update_texture() -> Texture` | gdk_gl_texture_builder_get_update_texture | 4.12 | Gets the texture previously set via gdk_gl_texture_builder_set_update_texture() or %NULL if none was set. |
| get_width | `GLTextureBuilder.get_width() -> gint` | gdk_gl_texture_builder_get_width | 4.12 | Gets the width previously set via gdk_gl_texture_builder_set_width() or 0 if the width wasn't set. |
| set_context | `GLTextureBuilder.set_context(context: GLContext?) -> none` | gdk_gl_texture_builder_set_context | 4.12 | Sets the context to be used for the texture. This is the context that owns the texture. The context must be set before calling [method@Gdk.GLTextur... |
| set_format | `GLTextureBuilder.set_format(format: MemoryFormat) -> none` | gdk_gl_texture_builder_set_format | 4.12 | Sets the format of the texture. The default is `GDK_MEMORY_R8G8B8A8_PREMULTIPLIED`. The format is the preferred format the texture data should be d... |
| set_has_mipmap | `GLTextureBuilder.set_has_mipmap(has_mipmap: gboolean) -> none` | gdk_gl_texture_builder_set_has_mipmap | 4.12 | Sets whether the texture has a mipmap. This allows the renderer and other users of the generated texture to use a higher quality downscaling. Typic... |
| set_height | `GLTextureBuilder.set_height(height: gint) -> none` | gdk_gl_texture_builder_set_height | 4.12 | Sets the height of the texture. The height must be set before calling [method@Gdk.GLTextureBuilder.build]. |
| set_id | `GLTextureBuilder.set_id(id: guint) -> none` | gdk_gl_texture_builder_set_id | 4.12 | Sets the texture id of the texture. The texture id must remain unmodified until the texture was finalized. See [method@Gdk.GLTextureBuilder.build] ... |
| set_sync | `GLTextureBuilder.set_sync(sync: gpointer?) -> none` | gdk_gl_texture_builder_set_sync | 4.12 | Sets the GLSync object to use for the texture. GTK will wait on this object before using the created `GdkTexture`. The `destroy` function that is p... |
| set_update_region | `GLTextureBuilder.set_update_region(region: cairo.Region?) -> none` | gdk_gl_texture_builder_set_update_region | 4.12 | Sets the region to be updated by this texture. Together with [property@Gdk.GLTextureBuilder:update-texture] this describes an update of a previous ... |
| set_update_texture | `GLTextureBuilder.set_update_texture(texture: Texture?) -> none` | gdk_gl_texture_builder_set_update_texture | 4.12 | Sets the texture to be updated by this texture. See [method@Gdk.GLTextureBuilder.set_update_region] for an explanation. |
| set_width | `GLTextureBuilder.set_width(width: gint) -> none` | gdk_gl_texture_builder_set_width | 4.12 | Sets the width of the texture. The width must be set before calling [method@Gdk.GLTextureBuilder.build]. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| context | GLContext | read, write | The context owning the texture. |
| format | MemoryFormat | read, write | The format when downloading the texture. |
| has-mipmap | gboolean | read, write | If the texture has a mipmap. |
| height | gint | read, write | The height of the texture. |
| id | guint | read, write | The texture ID to use. |
| sync | gpointer | read, write | An optional `GLSync` object. If this is set, GTK will wait on it before using the texture. |
| update-region | cairo.Region | read, write | The update region for [property@Gdk.GLTextureBuilder:update-texture]. |
| update-texture | Texture | read, write | The texture [property@Gdk.GLTextureBuilder:update-region] is an update for. |
| width | gint | read, write | The width of the texture. |

### Gdk.GrabBrokenEvent

Parent: `Event` ?? GType: `GdkGrabBrokenEvent` ?? C type: `GdkGrabBrokenEvent`

An event related to a broken windowing system grab.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_grab_surface | `GrabBrokenEvent.get_grab_surface() -> Surface` | gdk_grab_broken_event_get_grab_surface |  | Extracts the grab surface from a grab broken event. |
| get_implicit | `GrabBrokenEvent.get_implicit() -> gboolean` | gdk_grab_broken_event_get_implicit |  | Checks whether the grab broken event is for an implicit grab. |

### Gdk.KeyEvent

Parent: `Event` ?? GType: `GdkKeyEvent` ?? C type: `GdkKeyEvent`

An event related to a key-based device.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_consumed_modifiers | `KeyEvent.get_consumed_modifiers() -> ModifierType` | gdk_key_event_get_consumed_modifiers |  | Extracts the consumed modifiers from a key event. |
| get_keycode | `KeyEvent.get_keycode() -> guint` | gdk_key_event_get_keycode |  | Extracts the keycode from a key event. |
| get_keyval | `KeyEvent.get_keyval() -> guint` | gdk_key_event_get_keyval |  | Extracts the keyval from a key event. |
| get_layout | `KeyEvent.get_layout() -> guint` | gdk_key_event_get_layout |  | Extracts the layout from a key event. |
| get_level | `KeyEvent.get_level() -> guint` | gdk_key_event_get_level |  | Extracts the shift level from a key event. |
| get_match | `KeyEvent.get_match(keyval: out guint, modifiers: out ModifierType) -> gboolean` | gdk_key_event_get_match |  | Gets a keyval and modifier combination that will match the event. See [method@Gdk.KeyEvent.matches]. |
| is_modifier | `KeyEvent.is_modifier() -> gboolean` | gdk_key_event_is_modifier |  | Extracts whether the key event is for a modifier key. |
| matches | `KeyEvent.matches(keyval: guint, modifiers: ModifierType) -> KeyMatch` | gdk_key_event_matches |  | Matches a key event against a keyval and modifiers. This is typically used to trigger keyboard shortcuts such as Ctrl-C. Partial matches are possib... |

### Gdk.MemoryTexture

Parent: `Texture` ?? Implements: `Paintable`, `Gio.Icon`, `Gio.LoadableIcon` ?? GType: `GdkMemoryTexture` ?? C type: `GdkMemoryTexture`

A `GdkTexture` representing image data in memory.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MemoryTexture.new(width: gint, height: gint, format: MemoryFormat, bytes: GLib.Bytes, stride: gsize) -> MemoryTexture` | gdk_memory_texture_new |  | Creates a new texture for a blob of image data. The `GBytes` must contain @stride ?? @height pixels in the given format. |

### Gdk.Monitor

Parent: `GObject.Object` ?? GType: `GdkMonitor` ?? C type: `GdkMonitor`

`GdkMonitor` objects represent the individual outputs that are associated with a `GdkDisplay`. `GdkDisplay` keeps a `GListModel` to enumerate and m...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_connector | `Monitor.get_connector() -> utf8` | gdk_monitor_get_connector |  | Gets the name of the monitor's connector, if available. These are strings such as "eDP-1", or "HDMI-2". They depend on software and hardware config... |
| get_description | `Monitor.get_description() -> utf8` | gdk_monitor_get_description | 4.10 | Gets a string describing the monitor, if available. This can be used to identify a monitor in the UI. |
| get_display | `Monitor.get_display() -> Display` | gdk_monitor_get_display |  | Gets the display that this monitor belongs to. |
| get_geometry | `Monitor.get_geometry(geometry: out Rectangle) -> none` | gdk_monitor_get_geometry |  | Retrieves the size and position of the monitor within the display coordinate space. The returned geometry is in ???application pixels???, not in ??... |
| get_height_mm | `Monitor.get_height_mm() -> gint` | gdk_monitor_get_height_mm |  | Gets the height in millimeters of the monitor. |
| get_manufacturer | `Monitor.get_manufacturer() -> utf8` | gdk_monitor_get_manufacturer |  | Gets the name or PNP ID of the monitor's manufacturer. Note that this value might also vary depending on actual display backend. The PNP ID registr... |
| get_model | `Monitor.get_model() -> utf8` | gdk_monitor_get_model |  | Gets the string identifying the monitor model, if available. |
| get_refresh_rate | `Monitor.get_refresh_rate() -> gint` | gdk_monitor_get_refresh_rate |  | Gets the refresh rate of the monitor, if available. The value is in milli-Hertz, so a refresh rate of 60Hz is returned as 60000. |
| get_scale | `Monitor.get_scale() -> gdouble` | gdk_monitor_get_scale | 4.14 | Gets the internal scale factor that maps from monitor coordinates to device pixels. This can be used if you want to create pixel based data for a p... |
| get_scale_factor | `Monitor.get_scale_factor() -> gint` | gdk_monitor_get_scale_factor |  | Gets the internal scale factor that maps from monitor coordinates to device pixels. On traditional systems this is 1, but on very high density outp... |
| get_subpixel_layout | `Monitor.get_subpixel_layout() -> SubpixelLayout` | gdk_monitor_get_subpixel_layout |  | Gets information about the layout of red, green and blue primaries for pixels. |
| get_width_mm | `Monitor.get_width_mm() -> gint` | gdk_monitor_get_width_mm |  | Gets the width in millimeters of the monitor. |
| is_valid | `Monitor.is_valid() -> gboolean` | gdk_monitor_is_valid |  | Returns %TRUE if the @monitor object corresponds to a physical monitor. The @monitor becomes invalid when the physical monitor is unplugged or remo... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connector | utf8 | read | The connector name. |
| description | utf8 | read | A short description of the monitor, meant for display to the user. |
| display | Display | read, write, construct-only | The `GdkDisplay` of the monitor. |
| geometry | Rectangle | read | The geometry of the monitor. |
| height-mm | gint | read | The height of the monitor, in millimeters. |
| manufacturer | utf8 | read | The manufacturer name. |
| model | utf8 | read | The model name. |
| refresh-rate | gint | read | The refresh rate, in milli-Hertz. |
| scale | gdouble | read | The scale of the monitor. |
| scale-factor | gint | read | The scale factor. The scale factor is the next larger integer, compared to [property@Gdk.Surface:scale]. |
| subpixel-layout | SubpixelLayout | read | The subpixel layout. |
| valid | gboolean | read | Whether the object is still valid. |
| width-mm | gint | read | The width of the monitor, in millimeters. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| invalidate | `` | none | first |  | Emitted when the output represented by @monitor gets disconnected. |

### Gdk.MotionEvent

Parent: `Event` ?? GType: `GdkMotionEvent` ?? C type: `GdkMotionEvent`

An event related to a pointer or touch device motion.

### Gdk.PadEvent

Parent: `Event` ?? GType: `GdkPadEvent` ?? C type: `GdkPadEvent`

An event related to a pad-based device.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_axis_value | `PadEvent.get_axis_value(index: out guint, value: out gdouble) -> none` | gdk_pad_event_get_axis_value |  | Extracts the information from a pad strip or ring event. |
| get_button | `PadEvent.get_button() -> guint` | gdk_pad_event_get_button |  | Extracts information about the pressed button from a pad event. |
| get_group_mode | `PadEvent.get_group_mode(group: out guint, mode: out guint) -> none` | gdk_pad_event_get_group_mode |  | Extracts group and mode information from a pad event. |

### Gdk.ProximityEvent

Parent: `Event` ?? GType: `GdkProximityEvent` ?? C type: `GdkProximityEvent`

An event related to the proximity of a tool to a device.

### Gdk.ScrollEvent

Parent: `Event` ?? GType: `GdkScrollEvent` ?? C type: `GdkScrollEvent`

An event related to a scrolling motion.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_deltas | `ScrollEvent.get_deltas(delta_x: out gdouble, delta_y: out gdouble) -> none` | gdk_scroll_event_get_deltas |  | Extracts the scroll deltas of a scroll event. The deltas will be zero unless the scroll direction is %GDK_SCROLL_SMOOTH. For the representation uni... |
| get_direction | `ScrollEvent.get_direction() -> ScrollDirection` | gdk_scroll_event_get_direction |  | Extracts the direction of a scroll event. |
| get_unit | `ScrollEvent.get_unit() -> ScrollUnit` | gdk_scroll_event_get_unit | 4.8 | Extracts the scroll delta unit of a scroll event. The unit will always be %GDK_SCROLL_UNIT_WHEEL if the scroll direction is not %GDK_SCROLL_SMOOTH. |
| is_stop | `ScrollEvent.is_stop() -> gboolean` | gdk_scroll_event_is_stop |  | Check whether a scroll event is a stop scroll event. Scroll sequences with smooth scroll information may provide a stop scroll event once the inter... |

### Gdk.Seat

Parent: `GObject.Object` ?? GType: `GdkSeat` ?? C type: `GdkSeat` ?? Abstract

The `GdkSeat` object represents a collection of input devices that belong to a user.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_capabilities | `Seat.get_capabilities() -> SeatCapabilities` | gdk_seat_get_capabilities |  | Returns the capabilities this `GdkSeat` currently has. |
| get_devices | `Seat.get_devices(capabilities: SeatCapabilities) -> GLib.List` | gdk_seat_get_devices |  | Returns the devices that match the given capabilities. |
| get_display | `Seat.get_display() -> Display` | gdk_seat_get_display |  | Returns the `GdkDisplay` this seat belongs to. |
| get_keyboard | `Seat.get_keyboard() -> Device` | gdk_seat_get_keyboard |  | Returns the device that routes keyboard events. |
| get_pointer | `Seat.get_pointer() -> Device` | gdk_seat_get_pointer |  | Returns the device that routes pointer events. |
| get_tools | `Seat.get_tools() -> GLib.List` | gdk_seat_get_tools |  | Returns all `GdkDeviceTools` that are known to the application. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Display | read, write, construct-only | `GdkDisplay` of this seat. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| device-added | `device: Device` | none | last |  | Emitted when a new input device is related to this seat. |
| device-removed | `device: Device` | none | last |  | Emitted when an input device is removed (e.g. unplugged). |
| tool-added | `tool: DeviceTool` | none | last |  | Emitted whenever a new tool is made known to the seat. The tool may later be assigned to a device (i.e. on proximity with a tablet). The device wil... |
| tool-removed | `tool: DeviceTool` | none | last |  | Emitted whenever a tool is no longer known to this @seat. |

### Gdk.Snapshot

Parent: `GObject.Object` ?? GType: `GdkSnapshot` ?? C type: `GdkSnapshot` ?? Abstract

Base type for snapshot operations. The subclass of `GdkSnapshot` used by GTK is GtkSnapshot.

### Gdk.Surface

Parent: `GObject.Object` ?? GType: `GdkSurface` ?? C type: `GdkSurface` ?? Abstract

A `GdkSurface` is a rectangular region on the screen. It???s a low-level object, used to implement high-level objects such as GtkWindow. The surfac...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_popup | `Surface.new_popup(parent: Surface, autohide: gboolean) -> Surface` | gdk_surface_new_popup |  | Create a new popup surface. The surface will be attached to @parent and can be positioned relative to it using [method@Gdk.Popup.present]. |
| new_toplevel | `Surface.new_toplevel(display: Display) -> Surface` | gdk_surface_new_toplevel |  | Creates a new toplevel surface. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| beep | `Surface.beep() -> none` | gdk_surface_beep |  | Emits a short beep associated to @surface. If the display of @surface does not support per-surface beeps, emits a short beep on the display just as... |
| create_cairo_context | `Surface.create_cairo_context() -> CairoContext` | gdk_surface_create_cairo_context |  | Creates a new `GdkCairoContext` for rendering on @surface. |
| create_gl_context | `Surface.create_gl_context() -> GLContext throws` | gdk_surface_create_gl_context |  | Creates a new `GdkGLContext` for the `GdkSurface`. The context is disconnected from any particular surface or surface. If the creation of the `GdkG... |
| create_similar_surface | `Surface.create_similar_surface(content: cairo.Content, width: gint, height: gint) -> cairo.Surface` | gdk_surface_create_similar_surface |  | Create a new Cairo surface that is as compatible as possible with the given @surface. For example the new surface will have the same fallback resol... |
| create_vulkan_context | `Surface.create_vulkan_context() -> VulkanContext throws` | gdk_surface_create_vulkan_context |  | Sets an error and returns %NULL. |
| destroy | `Surface.destroy() -> none` | gdk_surface_destroy |  | Destroys the window system resources associated with @surface and decrements @surface's reference count. The window system resources for all childr... |
| get_cursor | `Surface.get_cursor() -> Cursor` | gdk_surface_get_cursor |  | Retrieves a `GdkCursor` pointer for the cursor currently set on the `GdkSurface`. If the return value is %NULL then there is no custom cursor set o... |
| get_device_cursor | `Surface.get_device_cursor(device: Device) -> Cursor` | gdk_surface_get_device_cursor |  | Retrieves a `GdkCursor` pointer for the @device currently set on the specified `GdkSurface`. If the return value is %NULL then there is no custom c... |
| get_device_position | `Surface.get_device_position(device: Device, x: out gdouble?, y: out gdouble?, mask: out ModifierType?) -> gboolean` | gdk_surface_get_device_position |  | Obtains the current device position and modifier state. The position is given in coordinates relative to the upper left corner of @surface. |
| get_display | `Surface.get_display() -> Display` | gdk_surface_get_display |  | Gets the `GdkDisplay` associated with a `GdkSurface`. |
| get_frame_clock | `Surface.get_frame_clock() -> FrameClock` | gdk_surface_get_frame_clock |  | Gets the frame clock for the surface. The frame clock for a surface never changes unless the surface is reparented to a new toplevel surface. |
| get_height | `Surface.get_height() -> gint` | gdk_surface_get_height |  | Returns the height of the given @surface. Surface size is reported in ???application pixels???, not ???device pixels??? (see [method@Gdk.Surface.ge... |
| get_mapped | `Surface.get_mapped() -> gboolean` | gdk_surface_get_mapped |  | Checks whether the surface has been mapped. A surface is mapped with [method@Gdk.Toplevel.present] or [method@Gdk.Popup.present]. |
| get_scale | `Surface.get_scale() -> gdouble` | gdk_surface_get_scale | 4.12 | Returns the internal scale that maps from surface coordinates to the actual device pixels. When the scale is bigger than 1, the windowing system pr... |
| get_scale_factor | `Surface.get_scale_factor() -> gint` | gdk_surface_get_scale_factor |  | Returns the internal scale factor that maps from surface coordinates to the actual device pixels. On traditional systems this is 1, but on very hig... |
| get_width | `Surface.get_width() -> gint` | gdk_surface_get_width |  | Returns the width of the given @surface. Surface size is reported in ???application pixels???, not ???device pixels??? (see [method@Gdk.Surface.get... |
| hide | `Surface.hide() -> none` | gdk_surface_hide |  | Hide the surface. For toplevel surfaces, withdraws them, so they will no longer be known to the window manager; for all surfaces, unmaps them, so t... |
| is_destroyed | `Surface.is_destroyed() -> gboolean` | gdk_surface_is_destroyed |  | Check to see if a surface is destroyed. |
| queue_render | `Surface.queue_render() -> none` | gdk_surface_queue_render |  | Forces a [signal@Gdk.Surface::render] signal emission for @surface to be scheduled. This function is useful for implementations that track invalid ... |
| request_layout | `Surface.request_layout() -> none` | gdk_surface_request_layout |  | Request a layout phase from the surface's frame clock. See [method@Gdk.FrameClock.request_phase]. |
| set_cursor | `Surface.set_cursor(cursor: Cursor?) -> none` | gdk_surface_set_cursor |  | Sets the default mouse pointer for a `GdkSurface`. Passing %NULL for the @cursor argument means that @surface will use the cursor of its parent sur... |
| set_device_cursor | `Surface.set_device_cursor(device: Device, cursor: Cursor) -> none` | gdk_surface_set_device_cursor |  | Sets a specific `GdkCursor` for a given device when it gets inside @surface. Passing %NULL for the @cursor argument means that @surface will use th... |
| set_input_region | `Surface.set_input_region(region: cairo.Region) -> none` | gdk_surface_set_input_region |  | Apply the region to the surface for the purpose of event handling. Mouse events which happen while the pointer position corresponds to an unset bit... |
| set_opaque_region | `Surface.set_opaque_region(region: cairo.Region?) -> none` | gdk_surface_set_opaque_region |  | Marks a region of the `GdkSurface` as opaque. For optimisation purposes, compositing window managers may like to not draw obscured regions of surfa... |
| translate_coordinates | `Surface.translate_coordinates(to: Surface, x: inout gdouble, y: inout gdouble) -> gboolean` | gdk_surface_translate_coordinates |  | Translates coordinates between two surfaces. Note that this only works if @to and @from are popups or transient-for to the same toplevel (directly ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cursor | Cursor | read, write | The mouse pointer for the `GdkSurface`. |
| display | Display | read, write, construct-only | The `GdkDisplay` connection of the surface. |
| frame-clock | FrameClock | read, write, construct-only | The `GdkFrameClock` of the surface. |
| height | gint | read | The height of the surface, in pixels. |
| mapped | gboolean | read | Whether the surface is mapped. |
| scale | gdouble | read | The scale of the surface. |
| scale-factor | gint | read | The scale factor of the surface. The scale factor is the next larger integer, compared to [property@Gdk.Surface:scale]. |
| width | gint | read | The width of the surface in pixels. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| enter-monitor | `monitor: Monitor` | none | first |  | Emitted when @surface starts being present on the monitor. |
| event | `event: Event` | gboolean | last |  | Emitted when GDK receives an input event for @surface. |
| layout | `width: gint, height: gint` | none | first |  | Emitted when the size of @surface is changed, or when relayout should be performed. Surface size is reported in ???application pixels???, not ???de... |
| leave-monitor | `monitor: Monitor` | none | first |  | Emitted when @surface stops being present on the monitor. |
| render | `region: cairo.Region` | gboolean | last |  | Emitted when part of the surface needs to be redrawn. |

### Gdk.Texture

Parent: `GObject.Object` ?? Subclasses: `DmabufTexture`, `GLTexture`, `MemoryTexture` ?? Implements: `Paintable`, `Gio.Icon`, `Gio.LoadableIcon` ?? GType: `GdkTexture` ?? C type: `GdkTexture` ?? Abstract

`GdkTexture` is the basic element used to refer to pixel data. It is primarily meant for pixel data that will not change over multiple frames, and ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_for_pixbuf | `Texture.new_for_pixbuf(pixbuf: GdkPixbuf.Pixbuf) -> Texture` | gdk_texture_new_for_pixbuf |  | Creates a new texture object representing the `GdkPixbuf`. This function is threadsafe, so that you can e.g. use GTask and [method@Gio.Task.run_in_... |
| new_from_bytes | `Texture.new_from_bytes(bytes: GLib.Bytes) -> Texture throws` | gdk_texture_new_from_bytes | 4.6 | Creates a new texture by loading an image from memory, The file format is detected automatically. The supported formats are PNG, JPEG and TIFF, tho... |
| new_from_file | `Texture.new_from_file(file: Gio.File) -> Texture throws` | gdk_texture_new_from_file |  | Creates a new texture by loading an image from a file. The file format is detected automatically. The supported formats are PNG, JPEG and TIFF, tho... |
| new_from_filename | `Texture.new_from_filename(path: filename) -> Texture throws` | gdk_texture_new_from_filename | 4.6 | Creates a new texture by loading an image from a file. The file format is detected automatically. The supported formats are PNG, JPEG and TIFF, tho... |
| new_from_resource | `Texture.new_from_resource(resource_path: utf8) -> Texture` | gdk_texture_new_from_resource |  | Creates a new texture by loading an image from a resource. The file format is detected automatically. The supported formats are PNG and JPEG, thoug... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| download | `Texture.download(data: guint8, stride: gsize) -> none` | gdk_texture_download |  | Downloads the @texture into local memory. This may be an expensive operation, as the actual texture data may reside on a GPU or on a remote display... |
| get_format | `Texture.get_format() -> MemoryFormat` | gdk_texture_get_format | 4.10 | Gets the memory format most closely associated with the data of the texture. Note that it may not be an exact match for texture data stored on the ... |
| get_height | `Texture.get_height() -> gint` | gdk_texture_get_height |  | Returns the height of the @texture, in pixels. |
| get_width | `Texture.get_width() -> gint` | gdk_texture_get_width |  | Returns the width of @texture, in pixels. |
| save_to_png | `Texture.save_to_png(filename: filename) -> gboolean` | gdk_texture_save_to_png |  | Store the given @texture to the @filename as a PNG file. This is a utility function intended for debugging and testing. If you want more control ov... |
| save_to_png_bytes | `Texture.save_to_png_bytes() -> GLib.Bytes` | gdk_texture_save_to_png_bytes | 4.6 | Store the given @texture in memory as a PNG file. Use [ctor@Gdk.Texture.new_from_bytes] to read it back. If you want to serialize a texture, this i... |
| save_to_tiff | `Texture.save_to_tiff(filename: filename) -> gboolean` | gdk_texture_save_to_tiff | 4.6 | Store the given @texture to the @filename as a TIFF file. GTK will attempt to store data without loss. |
| save_to_tiff_bytes | `Texture.save_to_tiff_bytes() -> GLib.Bytes` | gdk_texture_save_to_tiff_bytes | 4.6 | Store the given @texture in memory as a TIFF file. Use [ctor@Gdk.Texture.new_from_bytes] to read it back. This function is intended to store a repr... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| height | gint | read, write, construct-only | The height of the texture, in pixels. |
| width | gint | read, write, construct-only | The width of the texture, in pixels. |

### Gdk.TouchEvent

Parent: `Event` ?? GType: `GdkTouchEvent` ?? C type: `GdkTouchEvent`

An event related to a touch-based device.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_emulating_pointer | `TouchEvent.get_emulating_pointer() -> gboolean` | gdk_touch_event_get_emulating_pointer |  | Extracts whether a touch event is emulating a pointer event. |

### Gdk.TouchpadEvent

Parent: `Event` ?? GType: `GdkTouchpadEvent` ?? C type: `GdkTouchpadEvent`

An event related to a gesture on a touchpad device. Unlike touchscreens, where the windowing system sends basic sequences of begin, update, end eve...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_deltas | `TouchpadEvent.get_deltas(dx: out gdouble, dy: out gdouble) -> none` | gdk_touchpad_event_get_deltas |  | Extracts delta information from a touchpad event. |
| get_gesture_phase | `TouchpadEvent.get_gesture_phase() -> TouchpadGesturePhase` | gdk_touchpad_event_get_gesture_phase |  | Extracts the touchpad gesture phase from a touchpad event. |
| get_n_fingers | `TouchpadEvent.get_n_fingers() -> guint` | gdk_touchpad_event_get_n_fingers |  | Extracts the number of fingers from a touchpad event. |
| get_pinch_angle_delta | `TouchpadEvent.get_pinch_angle_delta() -> gdouble` | gdk_touchpad_event_get_pinch_angle_delta |  | Extracts the angle delta from a touchpad pinch event. |
| get_pinch_scale | `TouchpadEvent.get_pinch_scale() -> gdouble` | gdk_touchpad_event_get_pinch_scale |  | Extracts the scale from a touchpad pinch event. |

### Gdk.VulkanContext

Parent: `DrawContext` ?? Implements: `Gio.Initable` ?? GType: `GdkVulkanContext` ?? C type: `GdkVulkanContext` ?? Abstract

`GdkVulkanContext` is an object representing the platform-specific Vulkan draw context. `GdkVulkanContext`s are created for a surface using [method...

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| images-updated | `` | none | last |  | Emitted when the images managed by this context have changed. Usually this means that the swapchain had to be recreated, for example in response to... |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DevicePad |  | 0 | 0 | 4 | `GdkDevicePad` is an interface implemented by devices of type %GDK_SOURCE_TABLET_PAD It allows querying the features provided by the pad device. Ta... |
| DragSurface |  | 0 | 1 | 1 | A `GdkDragSurface` is an interface for surfaces used during DND. |
| Paintable |  | 0 | 2 | 10 | `GdkPaintable` is a simple interface used by GTK to represent content that can be painted. The content of a `GdkPaintable` can be painted anywhere ... |
| Popup |  | 0 | 0 | 7 | A `GdkPopup` is a surface that is attached to another surface. The `GdkPopup` is positioned relative to its parent surface. `GdkPopup`s are typical... |
| Toplevel |  | 0 | 1 | 19 | A `GdkToplevel` is a freestanding toplevel surface. The `GdkToplevel` interface provides useful APIs for interacting with the windowing system, suc... |

### Gdk.DevicePad

GType: `GdkDevicePad` ?? C type: `GdkDevicePad`

`GdkDevicePad` is an interface implemented by devices of type %GDK_SOURCE_TABLET_PAD It allows querying the features provided by the pad device. Ta...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_feature_group | `DevicePad.get_feature_group(feature: DevicePadFeature, feature_idx: gint) -> gint` | gdk_device_pad_get_feature_group |  | Returns the group the given @feature and @idx belong to. f the feature or index do not exist in @pad, -1 is returned. |
| get_group_n_modes | `DevicePad.get_group_n_modes(group_idx: gint) -> gint` | gdk_device_pad_get_group_n_modes |  | Returns the number of modes that @group may have. |
| get_n_features | `DevicePad.get_n_features(feature: DevicePadFeature) -> gint` | gdk_device_pad_get_n_features |  | Returns the number of features a tablet pad has. |
| get_n_groups | `DevicePad.get_n_groups() -> gint` | gdk_device_pad_get_n_groups |  | Returns the number of groups this pad device has. Pads have at least one group. A pad group is a subcollection of buttons/strip/rings that is affec... |

### Gdk.DragSurface

GType: `GdkDragSurface` ?? C type: `GdkDragSurface`

A `GdkDragSurface` is an interface for surfaces used during DND.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| present | `DragSurface.present(width: gint, height: gint) -> gboolean` | gdk_drag_surface_present |  | Present @drag_surface. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| compute-size | `size: DragSurfaceSize` | none | last | 4.12 | Emitted when the size for the surface needs to be computed, when it is present. This signal will normally be emitted during the native surface layo... |

### Gdk.Paintable

GType: `GdkPaintable` ?? C type: `GdkPaintable`

`GdkPaintable` is a simple interface used by GTK to represent content that can be painted. The content of a `GdkPaintable` can be painted anywhere ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_empty | `new_empty(intrinsic_width: gint, intrinsic_height: gint) -> Paintable` | gdk_paintable_new_empty |  | Returns a paintable that has the given intrinsic size and draws nothing. This is often useful for implementing the [vfunc@Gdk.Paintable.get_current... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compute_concrete_size | `Paintable.compute_concrete_size(specified_width: gdouble, specified_height: gdouble, default_width: gdouble, default_height: gdouble, concrete_width: out gdouble, concrete_height: out gdouble) -> none` | gdk_paintable_compute_concrete_size |  | Compute a concrete size for the `GdkPaintable`. Applies the sizing algorithm outlined in the CSS Image spec to the given @paintable. See that link ... |
| get_current_image | `Paintable.get_current_image() -> Paintable` | gdk_paintable_get_current_image |  | Gets an immutable paintable for the current contents displayed by @paintable. This is useful when you want to retain the current state of an animat... |
| get_flags | `Paintable.get_flags() -> PaintableFlags` | gdk_paintable_get_flags |  | Get flags for the paintable. This is oftentimes useful for optimizations. See [flags@Gdk.PaintableFlags] for the flags and what they mean. |
| get_intrinsic_aspect_ratio | `Paintable.get_intrinsic_aspect_ratio() -> gdouble` | gdk_paintable_get_intrinsic_aspect_ratio |  | Gets the preferred aspect ratio the @paintable would like to be displayed at. The aspect ratio is the width divided by the height, so a value of 0.... |
| get_intrinsic_height | `Paintable.get_intrinsic_height() -> gint` | gdk_paintable_get_intrinsic_height |  | Gets the preferred height the @paintable would like to be displayed at. Consumers of this interface can use this to reserve enough space to draw th... |
| get_intrinsic_width | `Paintable.get_intrinsic_width() -> gint` | gdk_paintable_get_intrinsic_width |  | Gets the preferred width the @paintable would like to be displayed at. Consumers of this interface can use this to reserve enough space to draw the... |
| invalidate_contents | `Paintable.invalidate_contents() -> none` | gdk_paintable_invalidate_contents |  | Called by implementations of `GdkPaintable` to invalidate their contents. Unless the contents are invalidated, implementations must guarantee that ... |
| invalidate_size | `Paintable.invalidate_size() -> none` | gdk_paintable_invalidate_size |  | Called by implementations of `GdkPaintable` to invalidate their size. As long as the size is not invalidated, @paintable must return the same value... |
| snapshot | `Paintable.snapshot(snapshot: Snapshot, width: gdouble, height: gdouble) -> none` | gdk_paintable_snapshot |  | Snapshots the given paintable with the given @width and @height. The paintable is drawn at the current (0,0) offset of the @snapshot. If @width and... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| invalidate-contents | `` | none | last |  | Emitted when the contents of the @paintable change. Examples for such an event would be videos changing to the next frame or the icon theme for an ... |
| invalidate-size | `` | none | last |  | Emitted when the intrinsic size of the @paintable changes. This means the values reported by at least one of [method@Gdk.Paintable.get_intrinsic_wi... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_image | `get_current_image() -> Paintable` |  |  | Gets an immutable paintable for the current contents displayed by @paintable. This is useful when you want to retain the current state of an animat... |
| get_flags | `get_flags() -> PaintableFlags` |  |  | Get flags for the paintable. This is oftentimes useful for optimizations. See [flags@Gdk.PaintableFlags] for the flags and what they mean. |
| get_intrinsic_aspect_ratio | `get_intrinsic_aspect_ratio() -> gdouble` |  |  | Gets the preferred aspect ratio the @paintable would like to be displayed at. The aspect ratio is the width divided by the height, so a value of 0.... |
| get_intrinsic_height | `get_intrinsic_height() -> gint` |  |  | Gets the preferred height the @paintable would like to be displayed at. Consumers of this interface can use this to reserve enough space to draw th... |
| get_intrinsic_width | `get_intrinsic_width() -> gint` |  |  | Gets the preferred width the @paintable would like to be displayed at. Consumers of this interface can use this to reserve enough space to draw the... |
| snapshot | `snapshot(snapshot: Snapshot, width: gdouble, height: gdouble) -> none` |  |  | Snapshots the given paintable with the given @width and @height. The paintable is drawn at the current (0,0) offset of the @snapshot. If @width and... |

### Gdk.Popup

GType: `GdkPopup` ?? C type: `GdkPopup`

A `GdkPopup` is a surface that is attached to another surface. The `GdkPopup` is positioned relative to its parent surface. `GdkPopup`s are typical...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_autohide | `Popup.get_autohide() -> gboolean` | gdk_popup_get_autohide |  | Returns whether this popup is set to hide on outside clicks. |
| get_parent | `Popup.get_parent() -> Surface` | gdk_popup_get_parent |  | Returns the parent surface of a popup. |
| get_position_x | `Popup.get_position_x() -> gint` | gdk_popup_get_position_x |  | Obtains the position of the popup relative to its parent. |
| get_position_y | `Popup.get_position_y() -> gint` | gdk_popup_get_position_y |  | Obtains the position of the popup relative to its parent. |
| get_rect_anchor | `Popup.get_rect_anchor() -> Gravity` | gdk_popup_get_rect_anchor |  | Gets the current popup rectangle anchor. The value returned may change after calling [method@Gdk.Popup.present], or after the [signal@Gdk.Surface::... |
| get_surface_anchor | `Popup.get_surface_anchor() -> Gravity` | gdk_popup_get_surface_anchor |  | Gets the current popup surface anchor. The value returned may change after calling [method@Gdk.Popup.present], or after the [signal@Gdk.Surface::la... |
| present | `Popup.present(width: gint, height: gint, layout: PopupLayout) -> gboolean` | gdk_popup_present |  | Present @popup after having processed the `GdkPopupLayout` rules. If the popup was previously now showing, it will be showed, otherwise it will cha... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| autohide | gboolean | read, write, construct-only | Whether to hide on outside clicks. |
| parent | Surface | read, write, construct-only | The parent surface. |

### Gdk.Toplevel

GType: `GdkToplevel` ?? C type: `GdkToplevel`

A `GdkToplevel` is a freestanding toplevel surface. The `GdkToplevel` interface provides useful APIs for interacting with the windowing system, suc...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| begin_move | `Toplevel.begin_move(device: Device, button: gint, x: gdouble, y: gdouble, timestamp: guint32) -> none` | gdk_toplevel_begin_move |  | Begins an interactive move operation. You might use this function to implement draggable titlebars. |
| begin_resize | `Toplevel.begin_resize(edge: SurfaceEdge, device: Device?, button: gint, x: gdouble, y: gdouble, timestamp: guint32) -> none` | gdk_toplevel_begin_resize |  | Begins an interactive resize operation. You might use this function to implement a ???window resize grip.??? |
| focus | `Toplevel.focus(timestamp: guint32) -> none` | gdk_toplevel_focus |  | Sets keyboard focus to @surface. In most cases, gtk_window_present_with_time() should be used on a GtkWindow, rather than calling this function. |
| get_state | `Toplevel.get_state() -> ToplevelState` | gdk_toplevel_get_state |  | Gets the bitwise or of the currently active surface state flags, from the `GdkToplevelState` enumeration. |
| inhibit_system_shortcuts | `Toplevel.inhibit_system_shortcuts(event: Event?) -> none` | gdk_toplevel_inhibit_system_shortcuts |  | Requests that the @toplevel inhibit the system shortcuts. This is asking the desktop environment/windowing system to let all keyboard events reach ... |
| lower | `Toplevel.lower() -> gboolean` | gdk_toplevel_lower |  | Asks to lower the @toplevel below other windows. The windowing system may choose to ignore the request. |
| minimize | `Toplevel.minimize() -> gboolean` | gdk_toplevel_minimize |  | Asks to minimize the @toplevel. The windowing system may choose to ignore the request. |
| present | `Toplevel.present(layout: ToplevelLayout) -> none` | gdk_toplevel_present |  | Present @toplevel after having processed the `GdkToplevelLayout` rules. If the toplevel was previously not showing, it will be showed, otherwise it... |
| restore_system_shortcuts | `Toplevel.restore_system_shortcuts() -> none` | gdk_toplevel_restore_system_shortcuts |  | Restore default system keyboard shortcuts which were previously inhibited. This undoes the effect of [method@Gdk.Toplevel.inhibit_system_shortcuts]. |
| set_decorated | `Toplevel.set_decorated(decorated: gboolean) -> none` | gdk_toplevel_set_decorated |  | Sets the toplevel to be decorated. Setting @decorated to %FALSE hints the desktop environment that the surface has its own, client-side decorations... |
| set_deletable | `Toplevel.set_deletable(deletable: gboolean) -> none` | gdk_toplevel_set_deletable |  | Sets the toplevel to be deletable. Setting @deletable to %TRUE hints the desktop environment that it should offer the user a way to close the surface. |
| set_icon_list | `Toplevel.set_icon_list(surfaces: GLib.List) -> none` | gdk_toplevel_set_icon_list |  | Sets a list of icons for the surface. One of these will be used to represent the surface in iconic form. The icon may be shown in window lists or t... |
| set_modal | `Toplevel.set_modal(modal: gboolean) -> none` | gdk_toplevel_set_modal |  | Sets the toplevel to be modal. The application can use this hint to tell the window manager that a certain surface has modal behaviour. The window ... |
| set_startup_id | `Toplevel.set_startup_id(startup_id: utf8) -> none` | gdk_toplevel_set_startup_id |  | Sets the startup notification ID. When using GTK, typically you should use gtk_window_set_startup_id() instead of this low-level function. |
| set_title | `Toplevel.set_title(title: utf8) -> none` | gdk_toplevel_set_title |  | Sets the title of a toplevel surface. The title maybe be displayed in the titlebar, in lists of windows, etc. |
| set_transient_for | `Toplevel.set_transient_for(parent: Surface) -> none` | gdk_toplevel_set_transient_for |  | Sets a transient-for parent. Indicates to the window manager that @surface is a transient dialog associated with the application surface @parent. T... |
| show_window_menu | `Toplevel.show_window_menu(event: Event) -> gboolean` | gdk_toplevel_show_window_menu |  | Asks the windowing system to show the window menu. The window menu is the menu shown when right-clicking the titlebar on traditional windows manage... |
| supports_edge_constraints | `Toplevel.supports_edge_constraints() -> gboolean` | gdk_toplevel_supports_edge_constraints |  | Returns whether the desktop environment supports tiled window states. |
| titlebar_gesture | `Toplevel.titlebar_gesture(gesture: TitlebarGesture) -> gboolean` | gdk_toplevel_titlebar_gesture | 4.4 | a `GdkToplevel` |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| decorated | gboolean | read, write | Whether the window manager should add decorations. |
| deletable | gboolean | read, write | Whether the window manager should allow to close the surface. |
| fullscreen-mode | FullscreenMode | read, write | The fullscreen mode of the surface. |
| icon-list | gpointer | read, write | A list of textures to use as icon. |
| modal | gboolean | read, write | Whether the surface is modal. |
| shortcuts-inhibited | gboolean | read | Whether the surface should inhibit keyboard shortcuts. |
| startup-id | utf8 | read, write | The startup ID of the surface. See [class@Gdk.AppLaunchContext] for more information about startup feedback. |
| state | ToplevelState | read | The state of the toplevel. |
| title | utf8 | read, write | The title of the surface. |
| transient-for | Surface | read, write | The transient parent of the surface. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| compute-size | `size: ToplevelSize` | none | last |  | Emitted when the size for the surface needs to be computed, when it is present. This signal will normally be emitted during or after a call to [met... |

## Enums

### Gdk.AxisUse

GType: `GdkAxisUse` ?? C type: `GdkAxisUse`

Defines how device axes are interpreted by GTK. Note that the X and Y axes are not really needed; pointer devices report their location via the x/y...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| delta_x | 3 | delta-x | the axis is used as the scroll x delta |
| delta_y | 4 | delta-y | the axis is used as the scroll y delta |
| distance | 9 | distance | the axis is used for pen/tablet distance information |
| ignore | 0 | ignore | the axis is ignored. |
| last | 12 | last | a constant equal to the numerically highest axis value. |
| pressure | 5 | pressure | the axis is used for pressure information. |
| rotation | 10 | rotation | the axis is used for pen rotation information |
| slider | 11 | slider | the axis is used for pen slider information |
| wheel | 8 | wheel | the axis is used for wheel information. |
| x | 1 | x | the axis is used as the x axis. |
| xtilt | 6 | xtilt | the axis is used for x tilt information. |
| y | 2 | y | the axis is used as the y axis. |
| ytilt | 7 | ytilt | the axis is used for y tilt information. |

### Gdk.CrossingMode

GType: `GdkCrossingMode` ?? C type: `GdkCrossingMode`

Specifies the crossing mode for enter and leave events.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| device_switch | 8 | device-switch | crossing because of a device switch (i.e. a mouse taking control of the pointer after a touch device), this event is synthetic as the pointer didn?... |
| grab | 1 | grab | crossing because a grab is activated. |
| gtk_grab | 3 | gtk-grab | crossing because a GTK grab is activated. |
| gtk_ungrab | 4 | gtk-ungrab | crossing because a GTK grab is deactivated. |
| normal | 0 | normal | crossing because of pointer motion. |
| state_changed | 5 | state-changed | crossing because a GTK widget changed state (e.g. sensitivity). |
| touch_begin | 6 | touch-begin | crossing because a touch sequence has begun, this event is synthetic as the pointer might have not left the surface. |
| touch_end | 7 | touch-end | crossing because a touch sequence has ended, this event is synthetic as the pointer might have not left the surface. |
| ungrab | 2 | ungrab | crossing because a grab is deactivated. |

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

### Gdk.DmabufError

GType: `GdkDmabufError` ?? C type: `GdkDmabufError`

Error enumeration for `GdkDmabufTexture`.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| creation_failed | 2 | creation-failed | GTK failed to create the resource for other reasons |
| not_available | 0 | not-available | Dmabuf support is not available, because the OS is not Linux, or it was explicitly disabled at compile- or runtime |
| unsupported_format | 1 | unsupported-format | The requested format is not supported |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gdk_dmabuf_error_quark |  |  |

### Gdk.DragCancelReason

GType: `GdkDragCancelReason` ?? C type: `GdkDragCancelReason`

Used in `GdkDrag` to the reason of a cancelled DND operation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error | 2 | error | Unspecified error. |
| no_target | 0 | no-target | There is no suitable drop target. |
| user_cancelled | 1 | user-cancelled | Drag cancelled by the user |

### Gdk.EventType

GType: `GdkEventType` ?? C type: `GdkEventType`

Specifies the type of the event.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| button_press | 2 | button-press | a mouse button has been pressed. |
| button_release | 3 | button-release | a mouse button has been released. |
| delete | 0 | delete | the window manager has requested that the toplevel surface be hidden or destroyed, usually when the user clicks on a special icon in the title bar. |
| drag_enter | 11 | drag-enter | the mouse has entered the surface while a drag is in progress. |
| drag_leave | 12 | drag-leave | the mouse has left the surface while a drag is in progress. |
| drag_motion | 13 | drag-motion | the mouse has moved in the surface while a drag is in progress. |
| drop_start | 14 | drop-start | a drop operation onto the surface has started. |
| enter_notify | 6 | enter-notify | the pointer has entered the surface. |
| event_last | 29 | event-last | marks the end of the GdkEventType enumeration. |
| focus_change | 8 | focus-change | the keyboard focus has entered or left the surface. |
| grab_broken | 16 | grab-broken | a pointer or keyboard grab was broken. |
| key_press | 4 | key-press | a key has been pressed. |
| key_release | 5 | key-release | a key has been released. |
| leave_notify | 7 | leave-notify | the pointer has left the surface. |
| motion_notify | 1 | motion-notify | the pointer (usually a mouse) has moved. |
| pad_button_press | 23 | pad-button-press | A tablet pad button press event. |
| pad_button_release | 24 | pad-button-release | A tablet pad button release event. |
| pad_group_mode | 27 | pad-group-mode | A tablet pad group mode change. |
| pad_ring | 25 | pad-ring | A tablet pad axis event from a "ring". |
| pad_strip | 26 | pad-strip | A tablet pad axis event from a "strip". |
| proximity_in | 9 | proximity-in | an input device has moved into contact with a sensing surface (e.g. a touchscreen or graphics tablet). |
| proximity_out | 10 | proximity-out | an input device has moved out of contact with a sensing surface. |
| scroll | 15 | scroll | the scroll wheel was turned |
| touch_begin | 17 | touch-begin | A new touch event sequence has just started. |
| touch_cancel | 20 | touch-cancel | A touch event sequence has been canceled. |
| touch_end | 19 | touch-end | A touch event sequence has finished. |
| touch_update | 18 | touch-update | A touch event sequence has been updated. |
| touchpad_hold | 28 | touchpad-hold | A touchpad hold gesture event, the current state is determined by its phase field. |
| touchpad_pinch | 22 | touchpad-pinch | A touchpad pinch gesture event, the current state is determined by its phase field. |
| touchpad_swipe | 21 | touchpad-swipe | A touchpad swipe gesture event, the current state is determined by its phase field. |

### Gdk.FullscreenMode

GType: `GdkFullscreenMode` ?? C type: `GdkFullscreenMode`

Indicates which monitor a surface should span over when in fullscreen mode.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_monitors | 1 | all-monitors | Span across all monitors when fullscreen. |
| current_monitor | 0 | current-monitor | Fullscreen on current monitor only. |

### Gdk.GLError

GType: `GdkGLError` ?? C type: `GdkGLError`

Error enumeration for `GdkGLContext`.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| compilation_failed | 3 | compilation-failed | The shader compilation failed |
| link_failed | 4 | link-failed | The shader linking failed |
| not_available | 0 | not-available | OpenGL support is not available |
| unsupported_format | 1 | unsupported-format | The requested visual format is not supported |
| unsupported_profile | 2 | unsupported-profile | The requested profile is not supported |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gdk_gl_error_quark |  |  |

### Gdk.Gravity

GType: `GdkGravity` ?? C type: `GdkGravity`

Defines the reference point of a surface and is used in `GdkPopupLayout`.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| center | 5 | center | the reference point is at the center of the surface. |
| east | 6 | east | the reference point is at the middle of the right edge. |
| north | 2 | north | the reference point is in the middle of the top edge. |
| north_east | 3 | north-east | the reference point is at the top right corner. |
| north_west | 1 | north-west | the reference point is at the top left corner. |
| south | 8 | south | the reference point is at the middle of the lower edge. |
| south_east | 9 | south-east | the reference point is at the lower right corner. |
| south_west | 7 | south-west | the reference point is at the lower left corner. |
| static | 10 | static | the reference point is at the top left corner of the surface itself, ignoring window manager decorations. |
| west | 4 | west | the reference point is at the middle of the left edge. |

### Gdk.InputSource

GType: `GdkInputSource` ?? C type: `GdkInputSource`

An enumeration describing the type of an input device in general terms.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| keyboard | 2 | keyboard | the device is a keyboard. |
| mouse | 0 | mouse | the device is a mouse. (This will be reported for the core pointer, even if it is something else, such as a trackball.) |
| pen | 1 | pen | the device is a stylus of a graphics tablet or similar device. |
| tablet_pad | 6 | tablet-pad | the device is a "pad", a collection of buttons, rings and strips found in drawing tablets |
| touchpad | 4 | touchpad | the device is an indirect touch device, such as a touchpad |
| touchscreen | 3 | touchscreen | the device is a direct-input touch device, such as a touchscreen or tablet |
| trackpoint | 5 | trackpoint | the device is a trackpoint |

### Gdk.KeyMatch

GType: `GdkKeyMatch` ?? C type: `GdkKeyMatch`

Describes how well an event matches a given keyval and modifiers. `GdkKeyMatch` values are returned by [method@Gdk.KeyEvent.matches].

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| exact | 2 | exact | The key event matches |
| none | 0 | none | The key event does not match |
| partial | 1 | partial | The key event matches if keyboard state (specifically, the currently active group) is ignored |

### Gdk.MemoryFormat

GType: `GdkMemoryFormat` ?? C type: `GdkMemoryFormat`

`GdkMemoryFormat` describes formats that image data can have in memory. It describes formats by listing the contents of the memory passed to it. So...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| a16 | 25 | a16 | One guint16 value; for alpha. |
| a16_float | 26 | a16-float | One half-float value; for alpha. |
| a32_float | 27 | a32-float | One float value; for alpha. |
| a8 | 24 | a8 | One byte; for alpha. |
| a8b8g8r8 | 6 | a8b8g8r8 | 4 bytes; for alpha, blue, green, red. |
| a8b8g8r8_premultiplied | 28 | a8b8g8r8-premultiplied | 4 bytes; for alpha, blue, green, red, The color values are premultiplied with the alpha value. |
| a8r8g8b8 | 4 | a8r8g8b8 | 4 bytes; for alpha, red, green, blue. |
| a8r8g8b8_premultiplied | 1 | a8r8g8b8-premultiplied | 4 bytes; for alpha, red, green, blue. The color values are premultiplied with the alpha value. |
| b8g8r8 | 8 | b8g8r8 | 3 bytes; for blue, green, red. The data is opaque. |
| b8g8r8a8 | 3 | b8g8r8a8 | 4 bytes; for blue, green, red, alpha. |
| b8g8r8a8_premultiplied | 0 | b8g8r8a8-premultiplied | 4 bytes; for blue, green, red, alpha. The color values are premultiplied with the alpha value. |
| b8g8r8x8 | 29 | b8g8r8x8 | 4 bytes; for blue, green, red, unused. |
| g16 | 23 | g16 | One guint16 value; for grayscale. The data is opaque. |
| g16a16 | 22 | g16a16 | 2 guint16 values; for grayscale, alpha. |
| g16a16_premultiplied | 21 | g16a16-premultiplied | 2 guint16 values; for grayscale, alpha. The color values are premultiplied with the alpha value. |
| g8 | 20 | g8 | One byte; for grayscale. The data is opaque. |
| g8a8 | 19 | g8a8 | 2 bytes; for grayscale, alpha. |
| g8a8_premultiplied | 18 | g8a8-premultiplied | 2 bytes; for grayscale, alpha. The color values are premultiplied with the alpha value. |
| n_formats | 33 | n-formats | The number of formats. This value will change as more formats get added, so do not rely on its concrete integer. |
| r16g16b16 | 9 | r16g16b16 | 3 guint16 values; for red, green, blue. |
| r16g16b16_float | 12 | r16g16b16-float | 3 half-float values; for red, green, blue. The data is opaque. |
| r16g16b16a16 | 11 | r16g16b16a16 | 4 guint16 values; for red, green, blue, alpha. |
| r16g16b16a16_float | 14 | r16g16b16a16-float | 4 half-float values; for red, green, blue and alpha. |
| r16g16b16a16_float_premultiplied | 13 | r16g16b16a16-float-premultiplied | 4 half-float values; for red, green, blue and alpha. The color values are premultiplied with the alpha value. |
| r16g16b16a16_premultiplied | 10 | r16g16b16a16-premultiplied | 4 guint16 values; for red, green, blue, alpha. The color values are premultiplied with the alpha value. |
| r32g32b32_float | 15 | r32g32b32-float | 3 float values; for red, green, blue. |
| r32g32b32a32_float | 17 | r32g32b32a32-float | 4 float values; for red, green, blue and alpha. |
| r32g32b32a32_float_premultiplied | 16 | r32g32b32a32-float-premultiplied | 4 float values; for red, green, blue and alpha. The color values are premultiplied with the alpha value. |
| r8g8b8 | 7 | r8g8b8 | 3 bytes; for red, green, blue. The data is opaque. |
| r8g8b8a8 | 5 | r8g8b8a8 | 4 bytes; for red, green, blue, alpha. |
| r8g8b8a8_premultiplied | 2 | r8g8b8a8-premultiplied | 4 bytes; for red, green, blue, alpha The color values are premultiplied with the alpha value. |
| r8g8b8x8 | 31 | r8g8b8x8 | 4 bytes; for red, green, blue, unused. |
| x8b8g8r8 | 32 | x8b8g8r8 | 4 bytes; for unused, blue, green, red. |
| x8r8g8b8 | 30 | x8r8g8b8 | 4 bytes; for unused, red, green, blue. |

### Gdk.NotifyType

GType: `GdkNotifyType` ?? C type: `GdkNotifyType`

Specifies the kind of crossing for enter and leave events. See the X11 protocol specification of LeaveNotify for full details of crossing event gen...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ancestor | 0 | ancestor | the surface is entered from an ancestor or left towards an ancestor. |
| inferior | 2 | inferior | the surface is entered from an inferior or left towards an inferior. |
| nonlinear | 3 | nonlinear | the surface is entered from or left towards a surface which is neither an ancestor nor an inferior. |
| nonlinear_virtual | 4 | nonlinear-virtual | the pointer moves between two surfaces which are not ancestors of each other and the surface is part of the ancestor chain between one of these sur... |
| unknown | 5 | unknown | an unknown type of enter/leave event occurred. |
| virtual | 1 | virtual | the pointer moves between an ancestor and an inferior of the surface. |

### Gdk.ScrollDirection

GType: `GdkScrollDirection` ?? C type: `GdkScrollDirection`

Specifies the direction for scroll events.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| down | 1 | down | the surface is scrolled down. |
| left | 2 | left | the surface is scrolled to the left. |
| right | 3 | right | the surface is scrolled to the right. |
| smooth | 4 | smooth | the scrolling is determined by the delta values in scroll events. See gdk_scroll_event_get_deltas() |
| up | 0 | up | the surface is scrolled up. |

### Gdk.ScrollUnit

GType: `GdkScrollUnit` ?? C type: `GdkScrollUnit`

Specifies the unit of scroll deltas. When you get %GDK_SCROLL_UNIT_WHEEL, a delta of 1.0 means 1 wheel detent click in the south direction, 2.0 mea...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| surface | 1 | surface | The delta is in surface pixels to scroll directly on screen. |
| wheel | 0 | wheel | The delta is in number of wheel clicks. |

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

### Gdk.SurfaceEdge

GType: `GdkSurfaceEdge` ?? C type: `GdkSurfaceEdge`

Determines a surface edge or corner.

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

### Gdk.TextureError

GType: `GdkTextureError` ?? C type: `GdkTextureError`

Possible errors that can be returned by `GdkTexture` constructors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| corrupt_image | 1 | corrupt-image | The image data appears corrupted |
| too_large | 0 | too-large | Not enough memory to handle this image |
| unsupported_content | 2 | unsupported-content | The image contains features that cannot be loaded |
| unsupported_format | 3 | unsupported-format | The image format is not supported |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gdk_texture_error_quark |  |  |

### Gdk.TitlebarGesture

GType: `GdkTitlebarGesture` ?? C type: `GdkTitlebarGesture`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| double_click | 1 | double-click |  |
| middle_click | 3 | middle-click |  |
| right_click | 2 | right-click |  |

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

### Gdk.VulkanError

GType: `GdkVulkanError` ?? C type: `GdkVulkanError`

Error enumeration for `GdkVulkanContext`.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| not_available | 1 | not-available | Vulkan support is not available on this Surface |
| unsupported | 0 | unsupported | Vulkan is not supported on this backend or has not been compiled in. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | gdk_vulkan_error_quark |  |  |

## Flags

### Gdk.AnchorHints

GType: `GdkAnchorHints` ?? C type: `GdkAnchorHints`

Positioning hints for aligning a surface relative to a rectangle. These hints determine how the surface should be positioned in the case that the s...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| flip | 3 | flip | allow flipping anchors on both axes |
| flip_x | 1 | flip-x | allow flipping anchors horizontally |
| flip_y | 2 | flip-y | allow flipping anchors vertically |
| resize | 48 | resize | allow resizing surface on both axes |
| resize_x | 16 | resize-x | allow resizing surface horizontally |
| resize_y | 32 | resize-y | allow resizing surface vertically |
| slide | 12 | slide | allow sliding surface on both axes |
| slide_x | 4 | slide-x | allow sliding surface horizontally |
| slide_y | 8 | slide-y | allow sliding surface vertically |

### Gdk.AxisFlags

GType: `GdkAxisFlags` ?? C type: `GdkAxisFlags`

Flags describing the current capabilities of a device/tool.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| delta_x | 8 | delta-x | Scroll X delta axis is present |
| delta_y | 16 | delta-y | Scroll Y delta axis is present |
| distance | 512 | distance | Distance axis is present |
| pressure | 32 | pressure | Pressure axis is present |
| rotation | 1024 | rotation | Z-axis rotation is present |
| slider | 2048 | slider | Slider axis is present |
| wheel | 256 | wheel | Wheel axis is present |
| x | 2 | x | X axis is present |
| xtilt | 64 | xtilt | X tilt axis is present |
| y | 4 | y | Y axis is present |
| ytilt | 128 | ytilt | Y tilt axis is present |

### Gdk.DragAction

GType: `GdkDragAction` ?? C type: `GdkDragAction`

Used in `GdkDrop` and `GdkDrag` to indicate the actions that the destination can and should do with the dropped data.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ask | 8 | ask | Ask the user what to do with the data. |
| copy | 1 | copy | Copy the data. |
| link | 4 | link | Add a link to the data. Note that this is only useful if source and destination agree on what it means, and is not supported on all platforms. |
| move | 2 | move | Move the data, i.e. first copy it, then delete it from the source using the DELETE target of the X selection protocol. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_unique | `is_unique(action: DragAction) -> gboolean` | gdk_drag_action_is_unique |  | Checks if @action represents a single action or includes multiple actions. When @action is 0 - ie no action was given, %TRUE is returned. |

### Gdk.FrameClockPhase

GType: `GdkFrameClockPhase` ?? C type: `GdkFrameClockPhase`

Used to represent the different paint clock phases that can be requested. The elements of the enumeration correspond to the signals of `GdkFrameClo...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after_paint | 64 | after-paint | corresponds to GdkFrameClock::after-paint. Should not be handled by applications. |
| before_paint | 2 | before-paint | corresponds to GdkFrameClock::before-paint. Should not be handled by applications. |
| flush_events | 1 | flush-events | corresponds to GdkFrameClock::flush-events. Should not be handled by applications. |
| layout | 8 | layout | corresponds to GdkFrameClock::layout. Should not be handled by applications. |
| none | 0 | none | no phase |
| paint | 16 | paint | corresponds to GdkFrameClock::paint. |
| resume_events | 32 | resume-events | corresponds to GdkFrameClock::resume-events. Should not be handled by applications. |
| update | 4 | update | corresponds to GdkFrameClock::update. |

### Gdk.GLAPI

GType: `GdkGLAPI` ?? C type: `GdkGLAPI`

The list of the different APIs that GdkGLContext can potentially support.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| gl | 1 | gl | The OpenGL API |
| gles | 2 | gles | The OpenGL ES API |

### Gdk.ModifierType

GType: `GdkModifierType` ?? C type: `GdkModifierType`

Flags to indicate the state of modifier keys and mouse buttons in events. Typical modifier keys are Shift, Control, Meta, Super, Hyper, Alt, Compos...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alt_mask | 8 | alt-mask | the fourth modifier key (it depends on the modifier mapping of the X server which key is interpreted as this modifier, but normally it is the Alt k... |
| button1_mask | 256 | button1-mask | the first mouse button. |
| button2_mask | 512 | button2-mask | the second mouse button. |
| button3_mask | 1024 | button3-mask | the third mouse button. |
| button4_mask | 2048 | button4-mask | the fourth mouse button. |
| button5_mask | 4096 | button5-mask | the fifth mouse button. |
| control_mask | 4 | control-mask | the Control key. |
| hyper_mask | 134217728 | hyper-mask | the Hyper modifier |
| lock_mask | 2 | lock-mask | a Lock key (depending on the modifier mapping of the X server this may either be CapsLock or ShiftLock). |
| meta_mask | 268435456 | meta-mask | the Meta modifier |
| no_modifier_mask | 0 | no-modifier-mask | No modifier. |
| shift_mask | 1 | shift-mask | the Shift key. |
| super_mask | 67108864 | super-mask | the Super modifier |

### Gdk.PaintableFlags

GType: `GdkPaintableFlags` ?? C type: `GdkPaintableFlags`

Flags about a paintable object. Implementations use these for optimizations such as caching.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| contents | 2 | contents | The content is immutable. The [signal@Gdk.Paintable::invalidate-contents] signal will never be emitted. |
| size | 1 | size | The size is immutable. The [signal@Gdk.Paintable::invalidate-size] signal will never be emitted. |

### Gdk.SeatCapabilities

GType: `GdkSeatCapabilities` ?? C type: `GdkSeatCapabilities`

Flags describing the seat capabilities.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 31 | all | The union of all capabilities |
| all_pointing | 7 | all-pointing | The union of all pointing capabilities |
| keyboard | 8 | keyboard | The seat has keyboard(s) attached |
| none | 0 | none | No input capabilities |
| pointer | 1 | pointer | The seat has a pointer (e.g. mouse) |
| tablet_pad | 16 | tablet-pad | The seat has drawing tablet pad(s) attached |
| tablet_stylus | 4 | tablet-stylus | The seat has drawing tablet(s) attached |
| touch | 2 | touch | The seat has touchscreen(s) attached |

### Gdk.ToplevelState

GType: `GdkToplevelState` ?? C type: `GdkToplevelState`

Specifies the state of a toplevel surface. On platforms that support information about individual edges, the %GDK_TOPLEVEL_STATE_TILED state will b...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| above | 16 | above | the surface is kept above other surfaces |
| below | 32 | below | the surface is kept below other surfaces |
| bottom_resizable | 8192 | bottom-resizable | whether the bottom edge is resizable |
| bottom_tiled | 4096 | bottom-tiled | whether the bottom edge is tiled |
| focused | 64 | focused | the surface is presented as focused (with active decorations) |
| fullscreen | 8 | fullscreen | the surface is maximized without decorations |
| left_resizable | 32768 | left-resizable | whether the left edge is resizable |
| left_tiled | 16384 | left-tiled | whether the left edge is tiled |
| maximized | 2 | maximized | the surface is maximized |
| minimized | 1 | minimized | the surface is minimized |
| right_resizable | 2048 | right-resizable | whether the right edge is resizable |
| right_tiled | 1024 | right-tiled | whether the right edge is tiled |
| sticky | 4 | sticky | the surface is sticky |
| suspended | 65536 | suspended | the surface is not visible to the user |
| tiled | 128 | tiled | the surface is in a tiled state |
| top_resizable | 512 | top-resizable | whether the top edge is resizable |
| top_tiled | 256 | top-tiled | whether the top edge is tiled |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ContentFormats |  | 0 | 0 | 19 | The `GdkContentFormats` structure is used to advertise and negotiate the format of content. You will encounter `GdkContentFormats` when interacting... |
| ContentFormatsBuilder |  | 0 | 0 | 8 | A `GdkContentFormatsBuilder` is an auxiliary struct used to create new `GdkContentFormats`, and should not be kept around. |
| ContentProviderClass |  | 0 | 0 | 0 | Class structure for `GdkContentProvider`. |
| DevicePadInterface |  | 0 | 0 | 0 |  |
| DmabufFormats |  | 0 | 0 | 6 | The `GdkDmabufFormats` struct provides information about supported DMA buffer formats. You can query whether a given format is supported with [meth... |
| DmabufTextureBuilderClass |  | 0 | 0 | 0 |  |
| DmabufTextureClass |  | 0 | 0 | 0 |  |
| DragSurfaceInterface |  | 0 | 0 | 0 | The `GdkDragSurfaceInterface` implementation is private to GDK. |
| DragSurfaceSize |  | 0 | 0 | 1 | The `GdkDragSurfaceSize` struct contains information that is useful to compute the size of a drag surface. |
| EventSequence |  | 0 | 0 | 0 | `GdkEventSequence` is an opaque type representing a sequence of related touch events. |
| FileList |  | 0 | 0 | 3 | An opaque type representing a list of files. |
| FrameClockClass |  | 0 | 0 | 0 |  |
| FrameClockPrivate |  | 0 | 0 | 0 |  |
| FrameTimings |  | 0 | 0 | 8 | A `GdkFrameTimings` object holds timing information for a single frame of the application???s displays. To retrieve `GdkFrameTimings` objects, use ... |
| GLTextureBuilderClass |  | 0 | 0 | 0 |  |
| GLTextureClass |  | 0 | 0 | 0 |  |
| KeymapKey |  | 0 | 0 | 0 | A `GdkKeymapKey` is a hardware key that can be mapped to a keyval. |
| MemoryTextureClass |  | 0 | 0 | 0 |  |
| MonitorClass |  | 0 | 0 | 0 |  |
| PaintableInterface |  | 0 | 0 | 0 | The list of functions that can be implemented for the `GdkPaintable` interface. Note that apart from the [vfunc@Gdk.Paintable.snapshot] function, n... |
| PopupInterface |  | 0 | 0 | 0 |  |
| PopupLayout |  | 0 | 0 | 17 | The `GdkPopupLayout` struct contains information that is necessary position a [iface@Gdk.Popup] relative to its parent. The positioning requires a ... |
| Rectangle |  | 0 | 0 | 4 | A `GdkRectangle` data type for representing rectangles. `GdkRectangle` is identical to `cairo_rectangle_t`. Together with Cairo???s `cairo_region_t... |
| RGBA |  | 0 | 0 | 8 | A `GdkRGBA` is used to represent a color, in a way that is compatible with cairo???s notion of color. `GdkRGBA` is a convenient way to pass colors ... |
| SnapshotClass |  | 0 | 0 | 0 |  |
| SurfaceClass |  | 0 | 0 | 0 |  |
| TextureClass |  | 0 | 0 | 0 |  |
| TextureDownloader |  | 0 | 0 | 9 | The `GdkTextureDownloader` is used to download the contents of a [class@Gdk.Texture]. It is intended to be created as a short-term object for a sin... |
| TimeCoord |  | 0 | 0 | 0 | A `GdkTimeCoord` stores a single event in a motion history. To check whether an axis is present, check whether the corresponding flag from the [fla... |
| ToplevelInterface |  | 0 | 0 | 0 |  |
| ToplevelLayout |  | 0 | 0 | 12 | The `GdkToplevelLayout` struct contains information that is necessary to present a sovereign window on screen. The `GdkToplevelLayout` struct is ne... |
| ToplevelSize |  | 0 | 0 | 4 | The `GdkToplevelSize` struct contains information that is useful to compute the size of a toplevel. |

### Gdk.ContentFormats

GType: `GdkContentFormats` ?? C type: `GdkContentFormats`

The `GdkContentFormats` structure is used to advertise and negotiate the format of content. You will encounter `GdkContentFormats` when interacting...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContentFormats.new(mime_types: utf8?, n_mime_types: guint) -> ContentFormats` | gdk_content_formats_new |  | Creates a new `GdkContentFormats` from an array of mime types. The mime types must be valid and different from each other or the behavior of the re... |
| new_for_gtype | `ContentFormats.new_for_gtype(type: GType) -> ContentFormats` | gdk_content_formats_new_for_gtype |  | Creates a new `GdkContentFormats` for a given `GType`. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(string: utf8) -> ContentFormats` | gdk_content_formats_parse | 4.4 | Parses the given @string into `GdkContentFormats` and returns the formats. Strings printed via [method@Gdk.ContentFormats.to_string] can be read in... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contain_gtype | `ContentFormats.contain_gtype(type: GType) -> gboolean` | gdk_content_formats_contain_gtype |  | Checks if a given `GType` is part of the given @formats. |
| contain_mime_type | `ContentFormats.contain_mime_type(mime_type: utf8) -> gboolean` | gdk_content_formats_contain_mime_type |  | Checks if a given mime type is part of the given @formats. |
| get_gtypes | `ContentFormats.get_gtypes(n_gtypes: out gsize?) -> GType` | gdk_content_formats_get_gtypes |  | Gets the `GType`s included in @formats. Note that @formats may not contain any `GType`s, in particular when they are empty. In that case %NULL will... |
| get_mime_types | `ContentFormats.get_mime_types(n_mime_types: out gsize?) -> utf8` | gdk_content_formats_get_mime_types |  | Gets the mime types included in @formats. Note that @formats may not contain any mime types, in particular when they are empty. In that case %NULL ... |
| match | `ContentFormats.match(second: ContentFormats) -> gboolean` | gdk_content_formats_match |  | Checks if @first and @second have any matching formats. |
| match_gtype | `ContentFormats.match_gtype(second: ContentFormats) -> GType` | gdk_content_formats_match_gtype |  | Finds the first `GType` from @first that is also contained in @second. If no matching `GType` is found, %G_TYPE_INVALID is returned. |
| match_mime_type | `ContentFormats.match_mime_type(second: ContentFormats) -> utf8` | gdk_content_formats_match_mime_type |  | Finds the first mime type from @first that is also contained in @second. If no matching mime type is found, %NULL is returned. |
| print | `ContentFormats.print(string: GLib.String) -> none` | gdk_content_formats_print |  | Prints the given @formats into a string for human consumption. The result of this function can later be parsed with [func@Gdk.ContentFormats.parse]. |
| ref | `ContentFormats.ref() -> ContentFormats` | gdk_content_formats_ref |  | Increases the reference count of a `GdkContentFormats` by one. |
| to_string | `ContentFormats.to_string() -> utf8` | gdk_content_formats_to_string |  | Prints the given @formats into a human-readable string. The resulting string can be parsed with [func@Gdk.ContentFormats.parse]. This is a small wr... |
| union | `ContentFormats.union(second: ContentFormats) -> ContentFormats` | gdk_content_formats_union |  | Append all missing types from @second to @first, in the order they had in @second. |
| union_deserialize_gtypes | `ContentFormats.union_deserialize_gtypes() -> ContentFormats` | gdk_content_formats_union_deserialize_gtypes |  | Add GTypes for mime types in @formats for which deserializers are registered. |
| union_deserialize_mime_types | `ContentFormats.union_deserialize_mime_types() -> ContentFormats` | gdk_content_formats_union_deserialize_mime_types |  | Add mime types for GTypes in @formats for which deserializers are registered. |
| union_serialize_gtypes | `ContentFormats.union_serialize_gtypes() -> ContentFormats` | gdk_content_formats_union_serialize_gtypes |  | Add GTypes for the mime types in @formats for which serializers are registered. |
| union_serialize_mime_types | `ContentFormats.union_serialize_mime_types() -> ContentFormats` | gdk_content_formats_union_serialize_mime_types |  | Add mime types for GTypes in @formats for which serializers are registered. |
| unref | `ContentFormats.unref() -> none` | gdk_content_formats_unref |  | Decreases the reference count of a `GdkContentFormats` by one. If the resulting reference count is zero, frees the formats. |

### Gdk.ContentFormatsBuilder

GType: `GdkContentFormatsBuilder` ?? C type: `GdkContentFormatsBuilder`

A `GdkContentFormatsBuilder` is an auxiliary struct used to create new `GdkContentFormats`, and should not be kept around.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContentFormatsBuilder.new() -> ContentFormatsBuilder` | gdk_content_formats_builder_new |  | Create a new `GdkContentFormatsBuilder` object. The resulting builder would create an empty `GdkContentFormats`. Use addition functions to add type... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_formats | `ContentFormatsBuilder.add_formats(formats: ContentFormats) -> none` | gdk_content_formats_builder_add_formats |  | Appends all formats from @formats to @builder, skipping those that already exist. |
| add_gtype | `ContentFormatsBuilder.add_gtype(type: GType) -> none` | gdk_content_formats_builder_add_gtype |  | Appends @type to @builder if it has not already been added. |
| add_mime_type | `ContentFormatsBuilder.add_mime_type(mime_type: utf8) -> none` | gdk_content_formats_builder_add_mime_type |  | Appends @mime_type to @builder if it has not already been added. |
| free_to_formats | `ContentFormatsBuilder.free_to_formats() -> ContentFormats` | gdk_content_formats_builder_free_to_formats |  | Creates a new `GdkContentFormats` from the current state of the given @builder, and frees the @builder instance. |
| ref | `ContentFormatsBuilder.ref() -> ContentFormatsBuilder` | gdk_content_formats_builder_ref |  | Acquires a reference on the given @builder. This function is intended primarily for bindings. `GdkContentFormatsBuilder` objects should not be kept... |
| to_formats | `ContentFormatsBuilder.to_formats() -> ContentFormats` | gdk_content_formats_builder_to_formats |  | Creates a new `GdkContentFormats` from the given @builder. The given `GdkContentFormatsBuilder` is reset once this function returns; you cannot cal... |
| unref | `ContentFormatsBuilder.unref() -> none` | gdk_content_formats_builder_unref |  | Releases a reference on the given @builder. |

### Gdk.ContentProviderClass

C type: `GdkContentProviderClass`

Class structure for `GdkContentProvider`.

#### Fields

| Field | Type |
| --- | --- |
| attach_clipboard | none |
| content_changed | none |
| detach_clipboard | none |
| get_value | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| ref_formats | ContentFormats |
| ref_storable_formats | ContentFormats |
| write_mime_type_async | none |
| write_mime_type_finish | gboolean |

### Gdk.DevicePadInterface

C type: `GdkDevicePadInterface`

### Gdk.DmabufFormats

GType: `GdkDmabufFormats` ?? C type: `GdkDmabufFormats`

The `GdkDmabufFormats` struct provides information about supported DMA buffer formats. You can query whether a given format is supported with [meth...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains | `DmabufFormats.contains(fourcc: guint32, modifier: guint64) -> gboolean` | gdk_dmabuf_formats_contains | 4.14 | Returns whether a given format is contained in @formats. |
| equal | `DmabufFormats.equal(formats2: DmabufFormats?) -> gboolean` | gdk_dmabuf_formats_equal | 4.14 | Returns whether @formats1 and @formats2 contain the same dmabuf formats, in the same order. |
| get_format | `DmabufFormats.get_format(idx: gsize, fourcc: out guint32, modifier: out guint64) -> none` | gdk_dmabuf_formats_get_format | 4.14 | Gets the fourcc code and modifier for a format that is contained in @formats. |
| get_n_formats | `DmabufFormats.get_n_formats() -> gsize` | gdk_dmabuf_formats_get_n_formats | 4.14 | Returns the number of formats that the @formats object contains. Note that DMA buffers are a Linux concept, so on other platforms, [method@Gdk.Dmab... |
| ref | `DmabufFormats.ref() -> DmabufFormats` | gdk_dmabuf_formats_ref | 4.14 | Increases the reference count of @formats. |
| unref | `DmabufFormats.unref() -> none` | gdk_dmabuf_formats_unref | 4.14 | Decreases the reference count of @formats. When the reference count reaches zero, the object is freed. |

### Gdk.DmabufTextureBuilderClass

C type: `GdkDmabufTextureBuilderClass`

### Gdk.DmabufTextureClass

C type: `GdkDmabufTextureClass`

### Gdk.DragSurfaceInterface

C type: `GdkDragSurfaceInterface`

The `GdkDragSurfaceInterface` implementation is private to GDK.

### Gdk.DragSurfaceSize

C type: `GdkDragSurfaceSize`

The `GdkDragSurfaceSize` struct contains information that is useful to compute the size of a drag surface.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_size | `DragSurfaceSize.set_size(width: gint, height: gint) -> none` | gdk_drag_surface_size_set_size | 4.12 | Sets the size the drag surface prefers to be resized to. |

### Gdk.EventSequence

GType: `GdkEventSequence` ?? C type: `GdkEventSequence`

`GdkEventSequence` is an opaque type representing a sequence of related touch events.

### Gdk.FileList

GType: `GdkFileList` ?? C type: `GdkFileList`

An opaque type representing a list of files.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_array | `FileList.new_from_array(files: Gio.File, n_files: gsize) -> FileList` | gdk_file_list_new_from_array | 4.8 | Creates a new `GdkFileList` for the given array of files. This function is meant to be used by language bindings. |
| new_from_list | `FileList.new_from_list(files: GLib.SList) -> FileList` | gdk_file_list_new_from_list | 4.8 | Creates a new files list container from a singly linked list of `GFile` instances. This function is meant to be used by language bindings |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_files | `FileList.get_files() -> GLib.SList` | gdk_file_list_get_files | 4.6 | Retrieves the list of files inside a `GdkFileList`. This function is meant for language bindings. |

### Gdk.FrameClockClass

C type: `GdkFrameClockClass`

### Gdk.FrameClockPrivate

C type: `GdkFrameClockPrivate`

### Gdk.FrameTimings

GType: `GdkFrameTimings` ?? C type: `GdkFrameTimings`

A `GdkFrameTimings` object holds timing information for a single frame of the application???s displays. To retrieve `GdkFrameTimings` objects, use ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_complete | `FrameTimings.get_complete() -> gboolean` | gdk_frame_timings_get_complete |  | Returns whether @timings are complete. The timing information in a `GdkFrameTimings` is filled in incrementally as the frame as drawn and passed of... |
| get_frame_counter | `FrameTimings.get_frame_counter() -> gint64` | gdk_frame_timings_get_frame_counter |  | Gets the frame counter value of the `GdkFrameClock` when this frame was drawn. |
| get_frame_time | `FrameTimings.get_frame_time() -> gint64` | gdk_frame_timings_get_frame_time |  | Returns the frame time for the frame. This is the time value that is typically used to time animations for the frame. See [method@Gdk.FrameClock.ge... |
| get_predicted_presentation_time | `FrameTimings.get_predicted_presentation_time() -> gint64` | gdk_frame_timings_get_predicted_presentation_time |  | Gets the predicted time at which this frame will be displayed. Although no predicted time may be available, if one is available, it will be availab... |
| get_presentation_time | `FrameTimings.get_presentation_time() -> gint64` | gdk_frame_timings_get_presentation_time |  | Reurns the presentation time. This is the time at which the frame became visible to the user. |
| get_refresh_interval | `FrameTimings.get_refresh_interval() -> gint64` | gdk_frame_timings_get_refresh_interval |  | Gets the natural interval between presentation times for the display that this frame was displayed on. Frame presentation usually happens during th... |
| ref | `FrameTimings.ref() -> FrameTimings` | gdk_frame_timings_ref |  | Increases the reference count of @timings. |
| unref | `FrameTimings.unref() -> none` | gdk_frame_timings_unref |  | Decreases the reference count of @timings. If @timings is no longer referenced, it will be freed. |

### Gdk.GLTextureBuilderClass

C type: `GdkGLTextureBuilderClass`

### Gdk.GLTextureClass

C type: `GdkGLTextureClass`

### Gdk.KeymapKey

C type: `GdkKeymapKey`

A `GdkKeymapKey` is a hardware key that can be mapped to a keyval.

#### Fields

| Field | Type |
| --- | --- |
| group | gint |
| keycode | guint |
| level | gint |

### Gdk.MemoryTextureClass

C type: `GdkMemoryTextureClass`

### Gdk.MonitorClass

C type: `GdkMonitorClass`

### Gdk.PaintableInterface

C type: `GdkPaintableInterface`

The list of functions that can be implemented for the `GdkPaintable` interface. Note that apart from the [vfunc@Gdk.Paintable.snapshot] function, n...

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_current_image | Paintable |
| get_flags | PaintableFlags |
| get_intrinsic_aspect_ratio | gdouble |
| get_intrinsic_height | gint |
| get_intrinsic_width | gint |
| snapshot | none |

### Gdk.PopupInterface

C type: `GdkPopupInterface`

### Gdk.PopupLayout

GType: `GdkPopupLayout` ?? C type: `GdkPopupLayout`

The `GdkPopupLayout` struct contains information that is necessary position a [iface@Gdk.Popup] relative to its parent. The positioning requires a ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PopupLayout.new(anchor_rect: Rectangle, rect_anchor: Gravity, surface_anchor: Gravity) -> PopupLayout` | gdk_popup_layout_new |  | Create a popup layout description. Used together with [method@Gdk.Popup.present] to describe how a popup surface should be placed and behave on-scr... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `PopupLayout.copy() -> PopupLayout` | gdk_popup_layout_copy |  | Makes a copy of @layout. |
| equal | `PopupLayout.equal(other: PopupLayout) -> gboolean` | gdk_popup_layout_equal |  | Check whether @layout and @other has identical layout properties. |
| get_anchor_hints | `PopupLayout.get_anchor_hints() -> AnchorHints` | gdk_popup_layout_get_anchor_hints |  | Get the `GdkAnchorHints`. |
| get_anchor_rect | `PopupLayout.get_anchor_rect() -> Rectangle` | gdk_popup_layout_get_anchor_rect |  | Get the anchor rectangle. |
| get_offset | `PopupLayout.get_offset(dx: out gint, dy: out gint) -> none` | gdk_popup_layout_get_offset |  | Retrieves the offset for the anchor rectangle. |
| get_rect_anchor | `PopupLayout.get_rect_anchor() -> Gravity` | gdk_popup_layout_get_rect_anchor |  | Returns the anchor position on the anchor rectangle. |
| get_shadow_width | `PopupLayout.get_shadow_width(left: out gint, right: out gint, top: out gint, bottom: out gint) -> none` | gdk_popup_layout_get_shadow_width | 4.2 | Obtains the shadow widths of this layout. |
| get_surface_anchor | `PopupLayout.get_surface_anchor() -> Gravity` | gdk_popup_layout_get_surface_anchor |  | Returns the anchor position on the popup surface. |
| ref | `PopupLayout.ref() -> PopupLayout` | gdk_popup_layout_ref |  | Increases the reference count of @value. |
| set_anchor_hints | `PopupLayout.set_anchor_hints(anchor_hints: AnchorHints) -> none` | gdk_popup_layout_set_anchor_hints |  | Set new anchor hints. The set @anchor_hints determines how @surface will be moved if the anchor points cause it to move off-screen. For example, %G... |
| set_anchor_rect | `PopupLayout.set_anchor_rect(anchor_rect: Rectangle) -> none` | gdk_popup_layout_set_anchor_rect |  | Set the anchor rectangle. |
| set_offset | `PopupLayout.set_offset(dx: gint, dy: gint) -> none` | gdk_popup_layout_set_offset |  | Offset the position of the anchor rectangle with the given delta. |
| set_rect_anchor | `PopupLayout.set_rect_anchor(anchor: Gravity) -> none` | gdk_popup_layout_set_rect_anchor |  | Set the anchor on the anchor rectangle. |
| set_shadow_width | `PopupLayout.set_shadow_width(left: gint, right: gint, top: gint, bottom: gint) -> none` | gdk_popup_layout_set_shadow_width | 4.2 | Sets the shadow width of the popup. The shadow width corresponds to the part of the computed surface size that would consist of the shadow margin s... |
| set_surface_anchor | `PopupLayout.set_surface_anchor(anchor: Gravity) -> none` | gdk_popup_layout_set_surface_anchor |  | Set the anchor on the popup surface. |
| unref | `PopupLayout.unref() -> none` | gdk_popup_layout_unref |  | Decreases the reference count of @value. |

### Gdk.Rectangle

GType: `GdkRectangle` ?? C type: `GdkRectangle`

A `GdkRectangle` data type for representing rectangles. `GdkRectangle` is identical to `cairo_rectangle_t`. Together with Cairo???s `cairo_region_t...

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
| contains_point | `Rectangle.contains_point(x: gint, y: gint) -> gboolean` | gdk_rectangle_contains_point |  | Returns %TRUE if @rect contains the point described by @x and @y. |
| equal | `Rectangle.equal(rect2: Rectangle) -> gboolean` | gdk_rectangle_equal |  | Checks if the two given rectangles are equal. |
| intersect | `Rectangle.intersect(src2: Rectangle, dest: out Rectangle?) -> gboolean` | gdk_rectangle_intersect |  | Calculates the intersection of two rectangles. It is allowed for @dest to be the same as either @src1 or @src2. If the rectangles do not intersect,... |
| union | `Rectangle.union(src2: Rectangle, dest: out Rectangle) -> none` | gdk_rectangle_union |  | Calculates the union of two rectangles. The union of rectangles @src1 and @src2 is the smallest rectangle which includes both @src1 and @src2 withi... |

### Gdk.RGBA

GType: `GdkRGBA` ?? C type: `GdkRGBA`

A `GdkRGBA` is used to represent a color, in a way that is compatible with cairo???s notion of color. `GdkRGBA` is a convenient way to pass colors ...

#### Fields

| Field | Type |
| --- | --- |
| alpha | gfloat |
| blue | gfloat |
| green | gfloat |
| red | gfloat |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `RGBA.copy() -> RGBA` | gdk_rgba_copy |  | Makes a copy of a `GdkRGBA`. The result must be freed through [method@Gdk.RGBA.free]. |
| equal | `RGBA.equal(p2: RGBA) -> gboolean` | gdk_rgba_equal |  | Compares two `GdkRGBA` colors. |
| free | `RGBA.free() -> none` | gdk_rgba_free |  | Frees a `GdkRGBA`. |
| hash | `RGBA.hash() -> guint` | gdk_rgba_hash |  | A hash function suitable for using for a hash table that stores `GdkRGBA`s. |
| is_clear | `RGBA.is_clear() -> gboolean` | gdk_rgba_is_clear |  | Checks if an @rgba value is transparent. That is, drawing with the value would not produce any change. |
| is_opaque | `RGBA.is_opaque() -> gboolean` | gdk_rgba_is_opaque |  | Checks if an @rgba value is opaque. That is, drawing with the value will not retain any results from previous contents. |
| parse | `RGBA.parse(spec: utf8) -> gboolean` | gdk_rgba_parse |  | Parses a textual representation of a color. The string can be either one of: - A standard name (Taken from the CSS specification). - A hexadecimal ... |
| to_string | `RGBA.to_string() -> utf8` | gdk_rgba_to_string |  | Returns a textual specification of @rgba in the form `rgb(r,g,b)` or `rgba(r,g,b,a)`, where ???r???, ???g???, ???b??? and ???a??? represent the red... |

### Gdk.SnapshotClass

C type: `GdkSnapshotClass`

### Gdk.SurfaceClass

C type: `GdkSurfaceClass`

### Gdk.TextureClass

C type: `GdkTextureClass`

### Gdk.TextureDownloader

GType: `GdkTextureDownloader` ?? C type: `GdkTextureDownloader`

The `GdkTextureDownloader` is used to download the contents of a [class@Gdk.Texture]. It is intended to be created as a short-term object for a sin...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TextureDownloader.new(texture: Texture) -> TextureDownloader` | gdk_texture_downloader_new | 4.10 | Creates a new texture downloader for @texture. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `TextureDownloader.copy() -> TextureDownloader` | gdk_texture_downloader_copy | 4.10 | Creates a copy of the downloader. This function is meant for language bindings. |
| download_bytes | `TextureDownloader.download_bytes(out_stride: out gsize) -> GLib.Bytes` | gdk_texture_downloader_download_bytes | 4.10 | Downloads the given texture pixels into a `GBytes`. The rowstride will be stored in the stride value. This function will abort if it tries to downl... |
| download_into | `TextureDownloader.download_into(data: guint8, stride: gsize) -> none` | gdk_texture_downloader_download_into | 4.10 | Downloads the @texture into local memory. |
| free | `TextureDownloader.free() -> none` | gdk_texture_downloader_free | 4.10 | Frees the given downloader and all its associated resources. |
| get_format | `TextureDownloader.get_format() -> MemoryFormat` | gdk_texture_downloader_get_format | 4.10 | Gets the format that the data will be downloaded in. |
| get_texture | `TextureDownloader.get_texture() -> Texture` | gdk_texture_downloader_get_texture | 4.10 | Gets the texture that the downloader will download. |
| set_format | `TextureDownloader.set_format(format: MemoryFormat) -> none` | gdk_texture_downloader_set_format | 4.10 | Sets the format the downloader will download. By default, GDK_MEMORY_DEFAULT is set. |
| set_texture | `TextureDownloader.set_texture(texture: Texture) -> none` | gdk_texture_downloader_set_texture | 4.10 | Changes the texture the downloader will download. |

### Gdk.TimeCoord

C type: `GdkTimeCoord`

A `GdkTimeCoord` stores a single event in a motion history. To check whether an axis is present, check whether the corresponding flag from the [fla...

#### Fields

| Field | Type |
| --- | --- |
| axes | gdouble |
| flags | AxisFlags |
| time | guint32 |

### Gdk.ToplevelInterface

C type: `GdkToplevelInterface`

### Gdk.ToplevelLayout

GType: `GdkToplevelLayout` ?? C type: `GdkToplevelLayout`

The `GdkToplevelLayout` struct contains information that is necessary to present a sovereign window on screen. The `GdkToplevelLayout` struct is ne...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ToplevelLayout.new() -> ToplevelLayout` | gdk_toplevel_layout_new |  | Create a toplevel layout description. Used together with gdk_toplevel_present() to describe how a toplevel surface should be placed and behave on-s... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `ToplevelLayout.copy() -> ToplevelLayout` | gdk_toplevel_layout_copy |  | Create a new `GdkToplevelLayout` and copy the contents of @layout into it. |
| equal | `ToplevelLayout.equal(other: ToplevelLayout) -> gboolean` | gdk_toplevel_layout_equal |  | Check whether @layout and @other has identical layout properties. |
| get_fullscreen | `ToplevelLayout.get_fullscreen(fullscreen: out gboolean) -> gboolean` | gdk_toplevel_layout_get_fullscreen |  | If the layout specifies whether to the toplevel should go fullscreen, the value pointed to by @fullscreen is set to %TRUE if it should go fullscree... |
| get_fullscreen_monitor | `ToplevelLayout.get_fullscreen_monitor() -> Monitor` | gdk_toplevel_layout_get_fullscreen_monitor |  | Returns the monitor that the layout is fullscreening the surface on. |
| get_maximized | `ToplevelLayout.get_maximized(maximized: out gboolean) -> gboolean` | gdk_toplevel_layout_get_maximized |  | If the layout specifies whether to the toplevel should go maximized, the value pointed to by @maximized is set to %TRUE if it should go fullscreen,... |
| get_resizable | `ToplevelLayout.get_resizable() -> gboolean` | gdk_toplevel_layout_get_resizable |  | Returns whether the layout should allow the user to resize the surface. |
| ref | `ToplevelLayout.ref() -> ToplevelLayout` | gdk_toplevel_layout_ref |  | Increases the reference count of @layout. |
| set_fullscreen | `ToplevelLayout.set_fullscreen(fullscreen: gboolean, monitor: Monitor?) -> none` | gdk_toplevel_layout_set_fullscreen |  | Sets whether the layout should cause the surface to be fullscreen when presented. |
| set_maximized | `ToplevelLayout.set_maximized(maximized: gboolean) -> none` | gdk_toplevel_layout_set_maximized |  | Sets whether the layout should cause the surface to be maximized when presented. |
| set_resizable | `ToplevelLayout.set_resizable(resizable: gboolean) -> none` | gdk_toplevel_layout_set_resizable |  | Sets whether the layout should allow the user to resize the surface after it has been presented. |
| unref | `ToplevelLayout.unref() -> none` | gdk_toplevel_layout_unref |  | Decreases the reference count of @layout. |

### Gdk.ToplevelSize

C type: `GdkToplevelSize`

The `GdkToplevelSize` struct contains information that is useful to compute the size of a toplevel.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_bounds | `ToplevelSize.get_bounds(bounds_width: out gint, bounds_height: out gint) -> none` | gdk_toplevel_size_get_bounds |  | Retrieves the bounds the toplevel is placed within. The bounds represent the largest size a toplevel may have while still being able to fit within ... |
| set_min_size | `ToplevelSize.set_min_size(min_width: gint, min_height: gint) -> none` | gdk_toplevel_size_set_min_size |  | Sets the minimum size of the toplevel. The minimum size corresponds to the limitations the toplevel can be shrunk to, without resulting in incorrec... |
| set_shadow_width | `ToplevelSize.set_shadow_width(left: gint, right: gint, top: gint, bottom: gint) -> none` | gdk_toplevel_size_set_shadow_width |  | Sets the shadows size of the toplevel. The shadow width corresponds to the part of the computed surface size that would consist of the shadow margi... |
| set_size | `ToplevelSize.set_size(width: gint, height: gint) -> none` | gdk_toplevel_size_set_size |  | Sets the size the toplevel prefers to be resized to. The size should be within the bounds (see [method@Gdk.ToplevelSize.get_bounds]). The set size ... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cairo_draw_from_gl | `cairo_draw_from_gl(cr: cairo.Context, surface: Surface, source: gint, source_type: gint, buffer_scale: gint, x: gint, y: gint, width: gint, height: gint) -> none` | gdk_cairo_draw_from_gl |  | The main way to not draw GL content in GTK. It takes a render buffer ID (@source_type == GL_RENDERBUFFER) or a texture id (@source_type == GL_TEXTU... |
| cairo_rectangle | `cairo_rectangle(cr: cairo.Context, rectangle: Rectangle) -> none` | gdk_cairo_rectangle |  | Adds the given rectangle to the current path of @cr. |
| cairo_region | `cairo_region(cr: cairo.Context, region: cairo.Region) -> none` | gdk_cairo_region |  | Adds the given region to the current path of @cr. |
| cairo_region_create_from_surface | `cairo_region_create_from_surface(surface: cairo.Surface) -> cairo.Region` | gdk_cairo_region_create_from_surface |  | Creates region that covers the area where the given @surface is more than 50% opaque. This function takes into account device offsets that might be... |
| cairo_set_source_pixbuf | `cairo_set_source_pixbuf(cr: cairo.Context, pixbuf: GdkPixbuf.Pixbuf, pixbuf_x: gdouble, pixbuf_y: gdouble) -> none` | gdk_cairo_set_source_pixbuf |  | Sets the given pixbuf as the source pattern for @cr. The pattern has an extend mode of %CAIRO_EXTEND_NONE and is aligned so that the origin of @pix... |
| cairo_set_source_rgba | `cairo_set_source_rgba(cr: cairo.Context, rgba: RGBA) -> none` | gdk_cairo_set_source_rgba |  | Sets the specified `GdkRGBA` as the source color of @cr. |
| content_deserialize_async | `content_deserialize_async(stream: Gio.InputStream, mime_type: utf8, type: GType, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_content_deserialize_async |  | Read content from the given input stream and deserialize it, asynchronously. The default I/O priority is %G_PRIORITY_DEFAULT (i.e. 0), and lower nu... |
| content_deserialize_finish | `content_deserialize_finish(result: Gio.AsyncResult, value: out GObject.Value) -> gboolean throws` | gdk_content_deserialize_finish |  | Finishes a content deserialization operation. |
| content_formats_parse | `content_formats_parse(string: utf8) -> ContentFormats` | gdk_content_formats_parse | 4.4 | Parses the given @string into `GdkContentFormats` and returns the formats. Strings printed via [method@Gdk.ContentFormats.to_string] can be read in... |
| content_register_deserializer | `content_register_deserializer(mime_type: utf8, type: GType, deserialize: ContentDeserializeFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | gdk_content_register_deserializer |  | Registers a function to deserialize object of a given type. |
| content_register_serializer | `content_register_serializer(type: GType, mime_type: utf8, serialize: ContentSerializeFunc, data: gpointer?, notify: GLib.DestroyNotify) -> none` | gdk_content_register_serializer |  | Registers a function to serialize objects of a given type. |
| content_serialize_async | `content_serialize_async(stream: Gio.OutputStream, mime_type: utf8, value: GObject.Value, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | gdk_content_serialize_async |  | Serialize content and write it to the given output stream, asynchronously. The default I/O priority is %G_PRIORITY_DEFAULT (i.e. 0), and lower numb... |
| content_serialize_finish | `content_serialize_finish(result: Gio.AsyncResult) -> gboolean throws` | gdk_content_serialize_finish |  | Finishes a content serialization operation. |
| dmabuf_error_quark | `dmabuf_error_quark() -> GLib.Quark` | gdk_dmabuf_error_quark |  |  |
| drag_action_is_unique | `drag_action_is_unique(action: DragAction) -> gboolean` | gdk_drag_action_is_unique |  | Checks if @action represents a single action or includes multiple actions. When @action is 0 - ie no action was given, %TRUE is returned. |
| drag_surface_size_get_type | `drag_surface_size_get_type() -> GType` | gdk_drag_surface_size_get_type |  |  |
| events_get_angle | `events_get_angle(event1: Event, event2: Event, angle: out gdouble) -> gboolean` | gdk_events_get_angle |  | Returns the relative angle from @event1 to @event2. The relative angle is the angle between the X axis and the line through both events' positions.... |
| events_get_center | `events_get_center(event1: Event, event2: Event, x: out gdouble, y: out gdouble) -> gboolean` | gdk_events_get_center |  | Returns the point halfway between the events' positions. This assumes that both events have X/Y information. If not, this function returns %FALSE. |
| events_get_distance | `events_get_distance(event1: Event, event2: Event, distance: out gdouble) -> gboolean` | gdk_events_get_distance |  | Returns the distance between the event locations. This assumes that both events have X/Y information. If not, this function returns %FALSE. |
| gl_error_quark | `gl_error_quark() -> GLib.Quark` | gdk_gl_error_quark |  |  |
| intern_mime_type | `intern_mime_type(string: utf8) -> utf8` | gdk_intern_mime_type |  | Canonicalizes the given mime type and interns the result. If @string is not a valid mime type, %NULL is returned instead. See RFC 2048 for the synt... |
| keyval_convert_case | `keyval_convert_case(symbol: guint, lower: out guint, upper: out guint) -> none` | gdk_keyval_convert_case |  | Obtains the upper- and lower-case versions of the keyval @symbol. Examples of keyvals are `GDK_KEY_a`, `GDK_KEY_Enter`, `GDK_KEY_F1`, etc. |
| keyval_from_name | `keyval_from_name(keyval_name: utf8) -> guint` | gdk_keyval_from_name |  | Converts a key name to a key value. The names are the same as those in the `gdk/gdkkeysyms.h` header file but without the leading ???GDK_KEY_???. |
| keyval_is_lower | `keyval_is_lower(keyval: guint) -> gboolean` | gdk_keyval_is_lower |  | Returns %TRUE if the given key value is in lower case. |
| keyval_is_upper | `keyval_is_upper(keyval: guint) -> gboolean` | gdk_keyval_is_upper |  | Returns %TRUE if the given key value is in upper case. |
| keyval_name | `keyval_name(keyval: guint) -> utf8` | gdk_keyval_name |  | Converts a key value into a symbolic name. The names are the same as those in the `gdk/gdkkeysyms.h` header file but without the leading ???GDK_KEY... |
| keyval_to_lower | `keyval_to_lower(keyval: guint) -> guint` | gdk_keyval_to_lower |  | Converts a key value to lower case, if applicable. |
| keyval_to_unicode | `keyval_to_unicode(keyval: guint) -> guint32` | gdk_keyval_to_unicode |  | Convert from a GDK key symbol to the corresponding Unicode character. Note that the conversion does not take the current locale into consideration,... |
| keyval_to_upper | `keyval_to_upper(keyval: guint) -> guint` | gdk_keyval_to_upper |  | Converts a key value to upper case, if applicable. |
| paintable_new_empty | `paintable_new_empty(intrinsic_width: gint, intrinsic_height: gint) -> Paintable` | gdk_paintable_new_empty |  | Returns a paintable that has the given intrinsic size and draws nothing. This is often useful for implementing the [vfunc@Gdk.Paintable.get_current... |
| pango_layout_get_clip_region | `pango_layout_get_clip_region(layout: Pango.Layout, x_origin: gint, y_origin: gint, index_ranges: gint, n_ranges: gint) -> cairo.Region` | gdk_pango_layout_get_clip_region |  | Obtains a clip region which contains the areas where the given ranges of text would be drawn. @x_origin and @y_origin are the top left point to cen... |
| pango_layout_line_get_clip_region | `pango_layout_line_get_clip_region(line: Pango.LayoutLine, x_origin: gint, y_origin: gint, index_ranges: gint, n_ranges: gint) -> cairo.Region` | gdk_pango_layout_line_get_clip_region |  | Obtains a clip region which contains the areas where the given ranges of text would be drawn. @x_origin and @y_origin are the top left position of ... |
| pixbuf_get_from_surface | `pixbuf_get_from_surface(surface: cairo.Surface, src_x: gint, src_y: gint, width: gint, height: gint) -> GdkPixbuf.Pixbuf` | gdk_pixbuf_get_from_surface |  | Transfers image data from a `cairo_surface_t` and converts it to a `GdkPixbuf`. This allows you to efficiently read individual pixels from cairo su... |
| pixbuf_get_from_texture | `pixbuf_get_from_texture(texture: Texture) -> GdkPixbuf.Pixbuf` | gdk_pixbuf_get_from_texture |  | Creates a new pixbuf from @texture. This should generally not be used in newly written code as later stages will almost certainly convert the pixbu... |
| set_allowed_backends | `set_allowed_backends(backends: utf8) -> none` | gdk_set_allowed_backends |  | Sets a list of backends that GDK should try to use. This can be useful if your application does not work with certain GDK backends. By default, GDK... |
| texture_error_quark | `texture_error_quark() -> GLib.Quark` | gdk_texture_error_quark |  |  |
| toplevel_size_get_type | `toplevel_size_get_type() -> GType` | gdk_toplevel_size_get_type |  |  |
| unicode_to_keyval | `unicode_to_keyval(wc: guint32) -> guint` | gdk_unicode_to_keyval |  | Convert from a Unicode character to a key symbol. |
| vulkan_error_quark | `vulkan_error_quark() -> GLib.Quark` | gdk_vulkan_error_quark |  |  |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ContentDeserializeFunc | `ContentDeserializeFunc(deserializer: ContentDeserializer) -> none` |  |  | The type of a function that can be registered with gdk_content_register_deserializer(). When the function gets called to operate on content, it can... |
| ContentSerializeFunc | `ContentSerializeFunc(serializer: ContentSerializer) -> none` |  |  | The type of a function that can be registered with gdk_content_register_serializer(). When the function gets called to operate on content, it can c... |

## Constants

| Name | Type |
| --- | --- |
| ACTION_ALL | gint |
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
| KEY_aacute | gint |
| KEY_Aacute | gint |
| KEY_Abelowdot | gint |
| KEY_abelowdot | gint |
| KEY_abovedot | gint |
| KEY_abreve | gint |
| KEY_Abreve | gint |
| KEY_Abreveacute | gint |
| KEY_abreveacute | gint |
| KEY_Abrevebelowdot | gint |
| KEY_abrevebelowdot | gint |
| KEY_abrevegrave | gint |
| KEY_Abrevegrave | gint |
| KEY_Abrevehook | gint |
| KEY_abrevehook | gint |
| KEY_abrevetilde | gint |
| KEY_Abrevetilde | gint |
| KEY_AccessX_Enable | gint |
| KEY_AccessX_Feedback_Enable | gint |
| KEY_Acircumflex | gint |
| KEY_acircumflex | gint |
| KEY_Acircumflexacute | gint |
| KEY_acircumflexacute | gint |
| KEY_acircumflexbelowdot | gint |
| KEY_Acircumflexbelowdot | gint |
| KEY_Acircumflexgrave | gint |
| KEY_acircumflexgrave | gint |
| KEY_acircumflexhook | gint |
| KEY_Acircumflexhook | gint |
| KEY_acircumflextilde | gint |
| KEY_Acircumflextilde | gint |
| KEY_acute | gint |
| KEY_AddFavorite | gint |
| KEY_Adiaeresis | gint |
| KEY_adiaeresis | gint |
| KEY_ae | gint |
| KEY_AE | gint |
| KEY_Agrave | gint |
| KEY_agrave | gint |
| KEY_ahook | gint |
| KEY_Ahook | gint |
| KEY_Alt_L | gint |
| KEY_Alt_R | gint |
| KEY_Amacron | gint |
| KEY_amacron | gint |
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
| KEY_aring | gint |
| KEY_Aring | gint |
| KEY_Armenian_accent | gint |
| KEY_Armenian_amanak | gint |
| KEY_Armenian_apostrophe | gint |
| KEY_Armenian_AT | gint |
| KEY_Armenian_at | gint |
| KEY_Armenian_AYB | gint |
| KEY_Armenian_ayb | gint |
| KEY_Armenian_ben | gint |
| KEY_Armenian_BEN | gint |
| KEY_Armenian_but | gint |
| KEY_Armenian_cha | gint |
| KEY_Armenian_CHA | gint |
| KEY_Armenian_da | gint |
| KEY_Armenian_DA | gint |
| KEY_Armenian_dza | gint |
| KEY_Armenian_DZA | gint |
| KEY_Armenian_e | gint |
| KEY_Armenian_E | gint |
| KEY_Armenian_exclam | gint |
| KEY_Armenian_FE | gint |
| KEY_Armenian_fe | gint |
| KEY_Armenian_full_stop | gint |
| KEY_Armenian_ghat | gint |
| KEY_Armenian_GHAT | gint |
| KEY_Armenian_GIM | gint |
| KEY_Armenian_gim | gint |
| KEY_Armenian_HI | gint |
| KEY_Armenian_hi | gint |
| KEY_Armenian_HO | gint |
| KEY_Armenian_ho | gint |
| KEY_Armenian_hyphen | gint |
| KEY_Armenian_ini | gint |
| KEY_Armenian_INI | gint |
| KEY_Armenian_je | gint |
| KEY_Armenian_JE | gint |
| KEY_Armenian_ke | gint |
| KEY_Armenian_KE | gint |
| KEY_Armenian_KEN | gint |
| KEY_Armenian_ken | gint |
| KEY_Armenian_khe | gint |
| KEY_Armenian_KHE | gint |
| KEY_Armenian_ligature_ew | gint |
| KEY_Armenian_LYUN | gint |
| KEY_Armenian_lyun | gint |
| KEY_Armenian_MEN | gint |
| KEY_Armenian_men | gint |
| KEY_Armenian_nu | gint |
| KEY_Armenian_NU | gint |
| KEY_Armenian_o | gint |
| KEY_Armenian_O | gint |
| KEY_Armenian_paruyk | gint |
| KEY_Armenian_PE | gint |
| KEY_Armenian_pe | gint |
| KEY_Armenian_PYUR | gint |
| KEY_Armenian_pyur | gint |
| KEY_Armenian_question | gint |
| KEY_Armenian_ra | gint |
| KEY_Armenian_RA | gint |
| KEY_Armenian_RE | gint |
| KEY_Armenian_re | gint |
| KEY_Armenian_se | gint |
| KEY_Armenian_SE | gint |
| KEY_Armenian_separation_mark | gint |
| KEY_Armenian_sha | gint |
| KEY_Armenian_SHA | gint |
| KEY_Armenian_shesht | gint |
| KEY_Armenian_tche | gint |
| KEY_Armenian_TCHE | gint |
| KEY_Armenian_TO | gint |
| KEY_Armenian_to | gint |
| KEY_Armenian_TSA | gint |
| KEY_Armenian_tsa | gint |
| KEY_Armenian_TSO | gint |
| KEY_Armenian_tso | gint |
| KEY_Armenian_tyun | gint |
| KEY_Armenian_TYUN | gint |
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
| KEY_Armenian_za | gint |
| KEY_Armenian_ZA | gint |
| KEY_Armenian_ZHE | gint |
| KEY_Armenian_zhe | gint |
| KEY_asciicircum | gint |
| KEY_asciitilde | gint |
| KEY_asterisk | gint |
| KEY_at | gint |
| KEY_Atilde | gint |
| KEY_atilde | gint |
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
| KEY_Byelorussian_SHORTU | gint |
| KEY_Byelorussian_shortu | gint |
| KEY_C | gint |
| KEY_c | gint |
| KEY_C_h | gint |
| KEY_C_H | gint |
| KEY_c_h | gint |
| KEY_cabovedot | gint |
| KEY_Cabovedot | gint |
| KEY_cacute | gint |
| KEY_Cacute | gint |
| KEY_Calculator | gint |
| KEY_Calendar | gint |
| KEY_Cancel | gint |
| KEY_Caps_Lock | gint |
| KEY_careof | gint |
| KEY_caret | gint |
| KEY_caron | gint |
| KEY_ccaron | gint |
| KEY_Ccaron | gint |
| KEY_Ccedilla | gint |
| KEY_ccedilla | gint |
| KEY_Ccircumflex | gint |
| KEY_ccircumflex | gint |
| KEY_CD | gint |
| KEY_cedilla | gint |
| KEY_cent | gint |
| KEY_Ch | gint |
| KEY_CH | gint |
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
| KEY_Cyrillic_EF | gint |
| KEY_Cyrillic_ef | gint |
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
| KEY_Cyrillic_ES | gint |
| KEY_Cyrillic_es | gint |
| KEY_Cyrillic_GHE | gint |
| KEY_Cyrillic_ghe | gint |
| KEY_Cyrillic_GHE_bar | gint |
| KEY_Cyrillic_ghe_bar | gint |
| KEY_Cyrillic_ha | gint |
| KEY_Cyrillic_HA | gint |
| KEY_Cyrillic_ha_descender | gint |
| KEY_Cyrillic_HA_descender | gint |
| KEY_Cyrillic_hardsign | gint |
| KEY_Cyrillic_HARDSIGN | gint |
| KEY_Cyrillic_i | gint |
| KEY_Cyrillic_I | gint |
| KEY_Cyrillic_i_macron | gint |
| KEY_Cyrillic_I_macron | gint |
| KEY_Cyrillic_IE | gint |
| KEY_Cyrillic_ie | gint |
| KEY_Cyrillic_io | gint |
| KEY_Cyrillic_IO | gint |
| KEY_Cyrillic_je | gint |
| KEY_Cyrillic_JE | gint |
| KEY_Cyrillic_KA | gint |
| KEY_Cyrillic_ka | gint |
| KEY_Cyrillic_KA_descender | gint |
| KEY_Cyrillic_ka_descender | gint |
| KEY_Cyrillic_ka_vertstroke | gint |
| KEY_Cyrillic_KA_vertstroke | gint |
| KEY_Cyrillic_LJE | gint |
| KEY_Cyrillic_lje | gint |
| KEY_Cyrillic_NJE | gint |
| KEY_Cyrillic_nje | gint |
| KEY_Cyrillic_O | gint |
| KEY_Cyrillic_o | gint |
| KEY_Cyrillic_O_bar | gint |
| KEY_Cyrillic_o_bar | gint |
| KEY_Cyrillic_pe | gint |
| KEY_Cyrillic_PE | gint |
| KEY_Cyrillic_SCHWA | gint |
| KEY_Cyrillic_schwa | gint |
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
| KEY_d | gint |
| KEY_D | gint |
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
| KEY_dead_e | gint |
| KEY_dead_E | gint |
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
| KEY_dead_o | gint |
| KEY_dead_O | gint |
| KEY_dead_ogonek | gint |
| KEY_dead_perispomeni | gint |
| KEY_dead_psili | gint |
| KEY_dead_semivoiced_sound | gint |
| KEY_dead_small_schwa | gint |
| KEY_dead_stroke | gint |
| KEY_dead_tilde | gint |
| KEY_dead_u | gint |
| KEY_dead_U | gint |
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
| KEY_Dstroke | gint |
| KEY_dstroke | gint |
| KEY_e | gint |
| KEY_E | gint |
| KEY_eabovedot | gint |
| KEY_Eabovedot | gint |
| KEY_eacute | gint |
| KEY_Eacute | gint |
| KEY_ebelowdot | gint |
| KEY_Ebelowdot | gint |
| KEY_ecaron | gint |
| KEY_Ecaron | gint |
| KEY_Ecircumflex | gint |
| KEY_ecircumflex | gint |
| KEY_ecircumflexacute | gint |
| KEY_Ecircumflexacute | gint |
| KEY_ecircumflexbelowdot | gint |
| KEY_Ecircumflexbelowdot | gint |
| KEY_ecircumflexgrave | gint |
| KEY_Ecircumflexgrave | gint |
| KEY_Ecircumflexhook | gint |
| KEY_ecircumflexhook | gint |
| KEY_Ecircumflextilde | gint |
| KEY_ecircumflextilde | gint |
| KEY_EcuSign | gint |
| KEY_ediaeresis | gint |
| KEY_Ediaeresis | gint |
| KEY_egrave | gint |
| KEY_Egrave | gint |
| KEY_Ehook | gint |
| KEY_ehook | gint |
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
| KEY_ENG | gint |
| KEY_eng | gint |
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
| KEY_etilde | gint |
| KEY_Etilde | gint |
| KEY_EuroSign | gint |
| KEY_Excel | gint |
| KEY_exclam | gint |
| KEY_exclamdown | gint |
| KEY_Execute | gint |
| KEY_Explorer | gint |
| KEY_EZH | gint |
| KEY_ezh | gint |
| KEY_f | gint |
| KEY_F | gint |
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
| KEY_G | gint |
| KEY_g | gint |
| KEY_gabovedot | gint |
| KEY_Gabovedot | gint |
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
| KEY_Greek_BETA | gint |
| KEY_Greek_beta | gint |
| KEY_Greek_chi | gint |
| KEY_Greek_CHI | gint |
| KEY_Greek_delta | gint |
| KEY_Greek_DELTA | gint |
| KEY_Greek_EPSILON | gint |
| KEY_Greek_epsilon | gint |
| KEY_Greek_epsilonaccent | gint |
| KEY_Greek_EPSILONaccent | gint |
| KEY_Greek_eta | gint |
| KEY_Greek_ETA | gint |
| KEY_Greek_etaaccent | gint |
| KEY_Greek_ETAaccent | gint |
| KEY_Greek_finalsmallsigma | gint |
| KEY_Greek_gamma | gint |
| KEY_Greek_GAMMA | gint |
| KEY_Greek_horizbar | gint |
| KEY_Greek_iota | gint |
| KEY_Greek_IOTA | gint |
| KEY_Greek_iotaaccent | gint |
| KEY_Greek_IOTAaccent | gint |
| KEY_Greek_iotaaccentdieresis | gint |
| KEY_Greek_IOTAdiaeresis | gint |
| KEY_Greek_IOTAdieresis | gint |
| KEY_Greek_iotadieresis | gint |
| KEY_Greek_KAPPA | gint |
| KEY_Greek_kappa | gint |
| KEY_Greek_LAMBDA | gint |
| KEY_Greek_lambda | gint |
| KEY_Greek_LAMDA | gint |
| KEY_Greek_lamda | gint |
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
| KEY_h | gint |
| KEY_H | gint |
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
| KEY_hcircumflex | gint |
| KEY_Hcircumflex | gint |
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
| KEY_Iacute | gint |
| KEY_iacute | gint |
| KEY_ibelowdot | gint |
| KEY_Ibelowdot | gint |
| KEY_ibreve | gint |
| KEY_Ibreve | gint |
| KEY_icircumflex | gint |
| KEY_Icircumflex | gint |
| KEY_identical | gint |
| KEY_idiaeresis | gint |
| KEY_Idiaeresis | gint |
| KEY_idotless | gint |
| KEY_ifonlyif | gint |
| KEY_Igrave | gint |
| KEY_igrave | gint |
| KEY_ihook | gint |
| KEY_Ihook | gint |
| KEY_Imacron | gint |
| KEY_imacron | gint |
| KEY_implies | gint |
| KEY_includedin | gint |
| KEY_includes | gint |
| KEY_infinity | gint |
| KEY_Insert | gint |
| KEY_integral | gint |
| KEY_intersection | gint |
| KEY_iogonek | gint |
| KEY_Iogonek | gint |
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
| KEY_Jcircumflex | gint |
| KEY_jcircumflex | gint |
| KEY_jot | gint |
| KEY_K | gint |
| KEY_k | gint |
| KEY_kana_A | gint |
| KEY_kana_a | gint |
| KEY_kana_CHI | gint |
| KEY_kana_closingbracket | gint |
| KEY_kana_comma | gint |
| KEY_kana_conjunctive | gint |
| KEY_kana_E | gint |
| KEY_kana_e | gint |
| KEY_kana_FU | gint |
| KEY_kana_fullstop | gint |
| KEY_kana_HA | gint |
| KEY_kana_HE | gint |
| KEY_kana_HI | gint |
| KEY_kana_HO | gint |
| KEY_kana_HU | gint |
| KEY_kana_I | gint |
| KEY_kana_i | gint |
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
| KEY_kana_TU | gint |
| KEY_kana_tu | gint |
| KEY_kana_u | gint |
| KEY_kana_U | gint |
| KEY_kana_WA | gint |
| KEY_kana_WO | gint |
| KEY_kana_YA | gint |
| KEY_kana_ya | gint |
| KEY_kana_yo | gint |
| KEY_kana_YO | gint |
| KEY_kana_YU | gint |
| KEY_kana_yu | gint |
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
| KEY_L | gint |
| KEY_l | gint |
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
| KEY_lacute | gint |
| KEY_Lacute | gint |
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
| KEY_lcedilla | gint |
| KEY_Lcedilla | gint |
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
| KEY_Tabovedot | gint |
| KEY_tabovedot | gint |
| KEY_TaskPane | gint |
| KEY_tcaron | gint |
| KEY_Tcaron | gint |
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
| KEY_Udiaeresis | gint |
| KEY_udiaeresis | gint |
| KEY_udoubleacute | gint |
| KEY_Udoubleacute | gint |
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
| KEY_Uhornhook | gint |
| KEY_uhornhook | gint |
| KEY_uhorntilde | gint |
| KEY_Uhorntilde | gint |
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
| KEY_V | gint |
| KEY_v | gint |
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
| MODIFIER_MASK | gint |
| PRIORITY_REDRAW | gint |

