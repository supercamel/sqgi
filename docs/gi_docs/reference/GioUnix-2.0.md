# GioUnix 2.0

SQGI import: `import("GioUnix", "2.0")`

Packages: `gio-unix-2.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`, `Gio-2.0`
Libraries: `libgio-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 5 |
| Interfaces | 2 |
| Records | 12 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 41 |
| Callbacks | 1 |
| Constants | 1 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DesktopAppInfo | GObject.Object | 0 | 0 | 24 | `GDesktopAppInfo` is an implementation of [iface@Gio.AppInfo] based on desktop files. Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-speci... |
| FDMessage | Gio.SocketControlMessage | 0 | 0 | 5 | This [class@Gio.SocketControlMessage] contains a [class@Gio.UnixFDList]. It may be sent using [method@Gio.Socket.send_message] and received using [... |
| InputStream | Gio.InputStream | 0 | 0 | 4 | `GUnixInputStream` implements [class@Gio.InputStream] for reading from a UNIX file descriptor, including asynchronous operations. (If the file desc... |
| MountMonitor | GObject.Object | 0 | 2 | 3 | Watches #GUnixMounts for changes. |
| OutputStream | Gio.OutputStream | 0 | 0 | 4 | `GUnixOutputStream` implements [class@Gio.OutputStream] for writing to a UNIX file descriptor, including asynchronous operations. (If the file desc... |

### GioUnix.DesktopAppInfo

Parent: `GObject.Object` ?? Implements: `Gio.AppInfo` ?? GType: `GDesktopAppInfo` ?? C type: `GDesktopAppInfo`

`GDesktopAppInfo` is an implementation of [iface@Gio.AppInfo] based on desktop files. Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-speci...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DesktopAppInfo.new(desktop_id: utf8) -> Gio.DesktopAppInfo` | g_desktop_app_info_new |  | Creates a new #GDesktopAppInfo based on a desktop file id. A desktop file id is the basename of the desktop file, including the .desktop extension.... |
| new_from_filename | `DesktopAppInfo.new_from_filename(filename: filename) -> Gio.DesktopAppInfo` | g_desktop_app_info_new_from_filename |  | Creates a new #GDesktopAppInfo. |
| new_from_keyfile | `DesktopAppInfo.new_from_keyfile(key_file: GLib.KeyFile) -> Gio.DesktopAppInfo` | g_desktop_app_info_new_from_keyfile | 2.18 | Creates a new #GDesktopAppInfo. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_action_name | `get_action_name(info: Gio.DesktopAppInfo, action_name: utf8) -> utf8` | g_desktop_app_info_get_action_name | 2.38 | Gets the user-visible display name of the "additional application action" specified by @action_name. This corresponds to the "Name" key within the ... |
| get_boolean | `get_boolean(info: Gio.DesktopAppInfo, key: utf8) -> gboolean` | g_desktop_app_info_get_boolean | 2.36 | Looks up a boolean value in the keyfile backing @info. The @key is looked up in the "Desktop Entry" group. |
| get_categories | `get_categories(info: Gio.DesktopAppInfo) -> utf8` | g_desktop_app_info_get_categories |  | Gets the categories from the desktop file. |
| get_filename | `get_filename(info: Gio.DesktopAppInfo) -> filename` | g_desktop_app_info_get_filename | 2.24 | When @info was created from a known filename, return it. In some situations such as the #GDesktopAppInfo returned from g_desktop_app_info_new_from_... |
| get_generic_name | `get_generic_name(info: Gio.DesktopAppInfo) -> utf8` | g_desktop_app_info_get_generic_name |  | Gets the generic name from the desktop file. |
| get_implementations | `get_implementations(interface: utf8) -> GLib.List` | g_desktop_app_info_get_implementations | 2.42 | Gets all applications that implement @interface. An application implements an interface if that interface is listed in the Implements= line of the ... |
| get_is_hidden | `get_is_hidden(info: Gio.DesktopAppInfo) -> gboolean` | g_desktop_app_info_get_is_hidden |  | A desktop file is hidden if the Hidden key in it is set to True. |
| get_keywords | `get_keywords(info: Gio.DesktopAppInfo) -> utf8` | g_desktop_app_info_get_keywords | 2.32 | Gets the keywords from the desktop file. |
| get_locale_string | `get_locale_string(info: Gio.DesktopAppInfo, key: utf8) -> utf8` | g_desktop_app_info_get_locale_string | 2.56 | Looks up a localized string value in the keyfile backing @info translated to the current locale. The @key is looked up in the "Desktop Entry" group. |
| get_nodisplay | `get_nodisplay(info: Gio.DesktopAppInfo) -> gboolean` | g_desktop_app_info_get_nodisplay | 2.30 | Gets the value of the NoDisplay key, which helps determine if the application info should be shown in menus. See %G_KEY_FILE_DESKTOP_KEY_NO_DISPLAY... |
| get_show_in | `get_show_in(info: Gio.DesktopAppInfo, desktop_env: utf8?) -> gboolean` | g_desktop_app_info_get_show_in | 2.30 | Checks if the application info should be shown in menus that list available applications for a specific name of the desktop, based on the `OnlyShow... |
| get_startup_wm_class | `get_startup_wm_class(info: Gio.DesktopAppInfo) -> utf8` | g_desktop_app_info_get_startup_wm_class | 2.34 | Retrieves the StartupWMClass field from @info. This represents the WM_CLASS property of the main window of the application, if launched through @info. |
| get_string | `get_string(info: Gio.DesktopAppInfo, key: utf8) -> utf8` | g_desktop_app_info_get_string | 2.36 | Looks up a string value in the keyfile backing @info. The @key is looked up in the "Desktop Entry" group. |
| get_string_list | `get_string_list(info: Gio.DesktopAppInfo, key: utf8, length: out gsize?) -> utf8` | g_desktop_app_info_get_string_list | 2.60 | Looks up a string list value in the keyfile backing @info. The @key is looked up in the "Desktop Entry" group. |
| has_key | `has_key(info: Gio.DesktopAppInfo, key: utf8) -> gboolean` | g_desktop_app_info_has_key | 2.36 | Returns whether @key exists in the "Desktop Entry" group of the keyfile backing @info. |
| launch_action | `launch_action(info: Gio.DesktopAppInfo, action_name: utf8, launch_context: Gio.AppLaunchContext?) -> none` | g_desktop_app_info_launch_action | 2.38 | Activates the named application action. You may only call this function on action names that were returned from g_desktop_app_info_list_actions(). ... |
| launch_uris_as_manager | `launch_uris_as_manager(appinfo: Gio.DesktopAppInfo, uris: GLib.List, launch_context: Gio.AppLaunchContext?, spawn_flags: GLib.SpawnFlags, user_setup: GLib.SpawnChildSetupFunc?, user_setup_data: gpointer?, pid_callback: Gio.DesktopAppLaunchCallback?, pid_callback_data: gpointer?) -> gboolean throws` | g_desktop_app_info_launch_uris_as_manager |  | This function performs the equivalent of g_app_info_launch_uris(), but is intended primarily for operating system components that launch applicatio... |
| launch_uris_as_manager_with_fds | `launch_uris_as_manager_with_fds(appinfo: Gio.DesktopAppInfo, uris: GLib.List, launch_context: Gio.AppLaunchContext?, spawn_flags: GLib.SpawnFlags, user_setup: GLib.SpawnChildSetupFunc?, user_setup_data: gpointer?, pid_callback: Gio.DesktopAppLaunchCallback?, pid_callback_data: gpointer?, stdin_fd: gint, stdout_fd: gint, stderr_fd: gint) -> gboolean throws` | g_desktop_app_info_launch_uris_as_manager_with_fds | 2.58 | Equivalent to g_desktop_app_info_launch_uris_as_manager() but allows you to pass in file descriptors for the stdin, stdout and stderr streams of th... |
| list_actions | `list_actions(info: Gio.DesktopAppInfo) -> utf8` | g_desktop_app_info_list_actions | 2.38 | Returns the list of "additional application actions" supported on the desktop file, as per the desktop file specification. As per the specification... |
| search | `search(search_string: utf8) -> utf8` | g_desktop_app_info_search |  | Searches desktop files for ones that match @search_string. The return value is an array of strvs. Each strv contains a list of applications that ma... |
| set_desktop_env | `set_desktop_env(desktop_env: utf8) -> none` | g_desktop_app_info_set_desktop_env |  | Sets the name of the desktop that the application is running in. This is used by g_app_info_should_show() and g_desktop_app_info_get_show_in() to e... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only | The origin filename of this #GDesktopAppInfo |

### GioUnix.FDMessage

Parent: `Gio.SocketControlMessage` ?? GType: `GUnixFDMessage` ?? C type: `GUnixFDMessage`

This [class@Gio.SocketControlMessage] contains a [class@Gio.UnixFDList]. It may be sent using [method@Gio.Socket.send_message] and received using [...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gio.SocketControlMessage |
| priv | Gio.UnixFDMessagePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FDMessage.new() -> Gio.SocketControlMessage` | g_unix_fd_message_new | 2.22 | Creates a new #GUnixFDMessage containing an empty file descriptor list. |
| new_with_fd_list | `FDMessage.new_with_fd_list(fd_list: Gio.UnixFDList) -> Gio.SocketControlMessage` | g_unix_fd_message_new_with_fd_list | 2.24 | Creates a new #GUnixFDMessage containing @list. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_fd | `append_fd(message: Gio.UnixFDMessage, fd: gint) -> gboolean throws` | g_unix_fd_message_append_fd | 2.22 | Adds a file descriptor to @message. The file descriptor is duplicated using dup(). You keep your copy of the descriptor and the copy contained in @... |
| get_fd_list | `get_fd_list(message: Gio.UnixFDMessage) -> Gio.UnixFDList` | g_unix_fd_message_get_fd_list | 2.24 | Gets the #GUnixFDList contained in @message. This function does not return a reference to the caller, but the returned list is valid for the lifeti... |
| steal_fds | `steal_fds(message: Gio.UnixFDMessage, length: out gint?) -> gint` | g_unix_fd_message_steal_fds | 2.22 | Returns the array of file descriptors that is contained in this object. After this call, the descriptors are no longer contained in @message. Furth... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fd-list | Gio.UnixFDList | read, write, construct-only | The [class@Gio.UnixFDList] object to send with the message. |

### GioUnix.InputStream

Parent: `Gio.InputStream` ?? Implements: `Gio.PollableInputStream`, `FileDescriptorBased` ?? GType: `GUnixInputStream` ?? C type: `GUnixInputStream`

`GUnixInputStream` implements [class@Gio.InputStream] for reading from a UNIX file descriptor, including asynchronous operations. (If the file desc...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gio.InputStream |
| priv | Gio.UnixInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InputStream.new(fd: gint, close_fd: gboolean) -> Gio.InputStream` | g_unix_input_stream_new |  | Creates a new #GUnixInputStream for the given @fd. If @close_fd is %TRUE, the file descriptor will be closed when the stream is closed. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_close_fd | `get_close_fd(stream: Gio.UnixInputStream) -> gboolean` | g_unix_input_stream_get_close_fd | 2.20 | Returns whether the file descriptor of @stream will be closed when the stream is closed. |
| get_fd | `get_fd(stream: Gio.UnixInputStream) -> gint` | g_unix_input_stream_get_fd | 2.20 | Return the UNIX file descriptor that the stream reads from. |
| set_close_fd | `set_close_fd(stream: Gio.UnixInputStream, close_fd: gboolean) -> none` | g_unix_input_stream_set_close_fd | 2.20 | Sets whether the file descriptor of @stream shall be closed when the stream is closed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| close-fd | gboolean | read, write | Whether to close the file descriptor when the stream is closed. |
| fd | gint | read, write, construct-only | The file descriptor that the stream reads from. |

### GioUnix.MountMonitor

Parent: `GObject.Object` ?? GType: `GUnixMountMonitor` ?? C type: `GUnixMountMonitor`

Watches #GUnixMounts for changes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MountMonitor.new() -> Gio.UnixMountMonitor` | g_unix_mount_monitor_new |  | Deprecated alias for g_unix_mount_monitor_get(). This function was never a true constructor, which is why it was renamed. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> Gio.UnixMountMonitor` | g_unix_mount_monitor_get | 2.44 | Gets the #GUnixMountMonitor for the current thread-default main context. The mount monitor can be used to monitor for changes to the list of mounte... |
| set_rate_limit | `set_rate_limit(mount_monitor: Gio.UnixMountMonitor, limit_msec: gint) -> none` | g_unix_mount_monitor_set_rate_limit | 2.18 | This function does nothing. Before 2.44, this was a partially-effective way of controlling the rate at which events would be reported under some un... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| mountpoints-changed | `` | none | last |  | Emitted when the unix mount points have changed. |
| mounts-changed | `` | none | last |  | Emitted when the unix mounts have changed. |

### GioUnix.OutputStream

Parent: `Gio.OutputStream` ?? Implements: `Gio.PollableOutputStream`, `FileDescriptorBased` ?? GType: `GUnixOutputStream` ?? C type: `GUnixOutputStream`

`GUnixOutputStream` implements [class@Gio.OutputStream] for writing to a UNIX file descriptor, including asynchronous operations. (If the file desc...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gio.OutputStream |
| priv | Gio.UnixOutputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `OutputStream.new(fd: gint, close_fd: gboolean) -> Gio.OutputStream` | g_unix_output_stream_new |  | Creates a new #GUnixOutputStream for the given @fd. If @close_fd, is %TRUE, the file descriptor will be closed when the output stream is destroyed. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_close_fd | `get_close_fd(stream: Gio.UnixOutputStream) -> gboolean` | g_unix_output_stream_get_close_fd | 2.20 | Returns whether the file descriptor of @stream will be closed when the stream is closed. |
| get_fd | `get_fd(stream: Gio.UnixOutputStream) -> gint` | g_unix_output_stream_get_fd | 2.20 | Return the UNIX file descriptor that the stream writes to. |
| set_close_fd | `set_close_fd(stream: Gio.UnixOutputStream, close_fd: gboolean) -> none` | g_unix_output_stream_set_close_fd | 2.20 | Sets whether the file descriptor of @stream shall be closed when the stream is closed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| close-fd | gboolean | read, write | Whether to close the file descriptor when the stream is closed. |
| fd | gint | read, write, construct-only | The file descriptor that the stream writes to. |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DesktopAppInfoLookup |  | 0 | 0 | 1 | #GDesktopAppInfoLookup is an opaque data structure and can only be accessed using the following functions. |
| FileDescriptorBased |  | 0 | 0 | 1 | `GFileDescriptorBased` is an interface for file descriptor based IO. It is implemented by streams (implementations of [class@Gio.InputStream] or [c... |

### GioUnix.DesktopAppInfoLookup

GType: `GDesktopAppInfoLookup` ?? C type: `GDesktopAppInfoLookup`

#GDesktopAppInfoLookup is an opaque data structure and can only be accessed using the following functions.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_for_uri_scheme | `get_default_for_uri_scheme(lookup: Gio.DesktopAppInfoLookup, uri_scheme: utf8) -> Gio.AppInfo` | g_desktop_app_info_lookup_get_default_for_uri_scheme |  | Gets the default application for launching applications using this URI scheme for a particular #GDesktopAppInfoLookup implementation. The #GDesktop... |

### GioUnix.FileDescriptorBased

GType: `GFileDescriptorBased` ?? C type: `GFileDescriptorBased`

`GFileDescriptorBased` is an interface for file descriptor based IO. It is implemented by streams (implementations of [class@Gio.InputStream] or [c...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fd | `get_fd(fd_based: Gio.FileDescriptorBased) -> gint` | g_file_descriptor_based_get_fd | 2.24 | Gets the underlying file descriptor. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| DesktopAppInfoClass |  | 0 | 0 | 0 |  |
| DesktopAppInfoLookupIface |  | 0 | 0 | 0 | Interface that is used by backends to associate default handlers with URI schemes. |
| FDMessageClass |  | 0 | 0 | 0 |  |
| FDMessagePrivate |  | 0 | 0 | 0 |  |
| FileDescriptorBasedIface |  | 0 | 0 | 0 | An interface for file descriptor based io objects. |
| InputStreamClass |  | 0 | 0 | 0 |  |
| InputStreamPrivate |  | 0 | 0 | 0 |  |
| MountEntry |  | 0 | 0 | 0 | Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>). This corresponds roughly to a mtab entry. |
| MountMonitorClass |  | 0 | 0 | 0 |  |
| MountPoint |  | 0 | 0 | 15 | Defines a Unix mount point (e.g. <filename>/dev</filename>). This corresponds roughly to a fstab entry. |
| OutputStreamClass |  | 0 | 0 | 0 |  |
| OutputStreamPrivate |  | 0 | 0 | 0 |  |

### GioUnix.DesktopAppInfoClass

C type: `GDesktopAppInfoClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### GioUnix.DesktopAppInfoLookupIface

C type: `GDesktopAppInfoLookupIface`

Interface that is used by backends to associate default handlers with URI schemes.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_default_for_uri_scheme | Gio.AppInfo |

### GioUnix.FDMessageClass

C type: `GUnixFDMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| parent_class | Gio.SocketControlMessageClass |

### GioUnix.FDMessagePrivate

C type: `GUnixFDMessagePrivate`

### GioUnix.FileDescriptorBasedIface

C type: `GFileDescriptorBasedIface`

An interface for file descriptor based io objects.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_fd | gint |

### GioUnix.InputStreamClass

C type: `GUnixInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | Gio.InputStreamClass |

### GioUnix.InputStreamPrivate

C type: `GUnixInputStreamPrivate`

### GioUnix.MountEntry

GType: `GUnixMountEntry` ?? C type: `GUnixMountEntry`

Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>). This corresponds roughly to a mtab entry.

### GioUnix.MountMonitorClass

C type: `GUnixMountMonitorClass`

### GioUnix.MountPoint

GType: `GUnixMountPoint` ?? C type: `GUnixMountPoint`

Defines a Unix mount point (e.g. <filename>/dev</filename>). This corresponds roughly to a fstab entry.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| at | `at(mount_path: filename, time_read: out guint64?) -> Gio.UnixMountPoint` | g_unix_mount_point_at | 2.66 | Gets a #GUnixMountPoint for a given mount path. If @time_read is set, it will be filled with a unix timestamp for checking if the mount points have... |
| compare | `compare(mount1: Gio.UnixMountPoint, mount2: Gio.UnixMountPoint) -> gint` | g_unix_mount_point_compare |  | Compares two unix mount points. |
| copy | `copy(mount_point: Gio.UnixMountPoint) -> Gio.UnixMountPoint` | g_unix_mount_point_copy | 2.54 | Makes a copy of @mount_point. |
| free | `free(mount_point: Gio.UnixMountPoint) -> none` | g_unix_mount_point_free |  | Frees a unix mount point. |
| get_device_path | `get_device_path(mount_point: Gio.UnixMountPoint) -> filename` | g_unix_mount_point_get_device_path |  | Gets the device path for a unix mount point. |
| get_fs_type | `get_fs_type(mount_point: Gio.UnixMountPoint) -> utf8` | g_unix_mount_point_get_fs_type |  | Gets the file system type for the mount point. |
| get_mount_path | `get_mount_path(mount_point: Gio.UnixMountPoint) -> filename` | g_unix_mount_point_get_mount_path |  | Gets the mount path for a unix mount point. |
| get_options | `get_options(mount_point: Gio.UnixMountPoint) -> utf8` | g_unix_mount_point_get_options | 2.32 | Gets the options for the mount point. |
| guess_can_eject | `guess_can_eject(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_guess_can_eject |  | Guesses whether a Unix mount point can be ejected. |
| guess_icon | `guess_icon(mount_point: Gio.UnixMountPoint) -> Gio.Icon` | g_unix_mount_point_guess_icon |  | Guesses the icon of a Unix mount point. |
| guess_name | `guess_name(mount_point: Gio.UnixMountPoint) -> utf8` | g_unix_mount_point_guess_name |  | Guesses the name of a Unix mount point. The result is a translated string. |
| guess_symbolic_icon | `guess_symbolic_icon(mount_point: Gio.UnixMountPoint) -> Gio.Icon` | g_unix_mount_point_guess_symbolic_icon | 2.34 | Guesses the symbolic icon of a Unix mount point. |
| is_loopback | `is_loopback(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_is_loopback |  | Checks if a unix mount point is a loopback device. |
| is_readonly | `is_readonly(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_is_readonly |  | Checks if a unix mount point is read only. |
| is_user_mountable | `is_user_mountable(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_is_user_mountable |  | Checks if a unix mount point is mountable by the user. |

### GioUnix.OutputStreamClass

C type: `GUnixOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | Gio.OutputStreamClass |

### GioUnix.OutputStreamPrivate

C type: `GUnixOutputStreamPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| desktop_app_info_lookup_get_default_for_uri_scheme | `desktop_app_info_lookup_get_default_for_uri_scheme(lookup: Gio.DesktopAppInfoLookup, uri_scheme: utf8) -> Gio.AppInfo` | g_desktop_app_info_lookup_get_default_for_uri_scheme |  | Gets the default application for launching applications using this URI scheme for a particular #GDesktopAppInfoLookup implementation. The #GDesktop... |
| file_descriptor_based_get_fd | `file_descriptor_based_get_fd(fd_based: Gio.FileDescriptorBased) -> gint` | g_file_descriptor_based_get_fd | 2.24 | Gets the underlying file descriptor. |
| is_mount_path_system_internal | `is_mount_path_system_internal(mount_path: filename) -> gboolean` | g_unix_is_mount_path_system_internal |  | Determines if @mount_path is considered an implementation of the OS. This is primarily used for hiding mountable and mounted volumes that only are ... |
| is_system_device_path | `is_system_device_path(device_path: utf8) -> gboolean` | g_unix_is_system_device_path | 2.56 | Determines if @device_path is considered a block device path which is only used in implementation of the OS. This is primarily used for hiding moun... |
| is_system_fs_type | `is_system_fs_type(fs_type: utf8) -> gboolean` | g_unix_is_system_fs_type | 2.56 | Determines if @fs_type is considered a type of file system which is only used in implementation of the OS. This is primarily used for hiding mounte... |
| mount_at | `mount_at(mount_path: filename, time_read: out guint64?) -> Gio.UnixMountEntry` | g_unix_mount_at |  | Gets a #GUnixMountEntry for a given mount path. If @time_read is set, it will be filled with a unix timestamp for checking if the mounts have chang... |
| mount_compare | `mount_compare(mount1: Gio.UnixMountEntry, mount2: Gio.UnixMountEntry) -> gint` | g_unix_mount_compare |  | Compares two unix mounts. |
| mount_copy | `mount_copy(mount_entry: Gio.UnixMountEntry) -> Gio.UnixMountEntry` | g_unix_mount_copy | 2.54 | Makes a copy of @mount_entry. |
| mount_for | `mount_for(file_path: filename, time_read: out guint64?) -> Gio.UnixMountEntry` | g_unix_mount_for | 2.52 | Gets a #GUnixMountEntry for a given file path. If @time_read is set, it will be filled with a unix timestamp for checking if the mounts have change... |
| mount_free | `mount_free(mount_entry: Gio.UnixMountEntry) -> none` | g_unix_mount_free |  | Frees a unix mount. |
| mount_get_device_path | `mount_get_device_path(mount_entry: Gio.UnixMountEntry) -> filename` | g_unix_mount_get_device_path |  | Gets the device path for a unix mount. |
| mount_get_fs_type | `mount_get_fs_type(mount_entry: Gio.UnixMountEntry) -> utf8` | g_unix_mount_get_fs_type |  | Gets the filesystem type for the unix mount. |
| mount_get_mount_path | `mount_get_mount_path(mount_entry: Gio.UnixMountEntry) -> filename` | g_unix_mount_get_mount_path |  | Gets the mount path for a unix mount. |
| mount_get_options | `mount_get_options(mount_entry: Gio.UnixMountEntry) -> utf8` | g_unix_mount_get_options | 2.58 | Gets a comma-separated list of mount options for the unix mount. For example, `rw,relatime,seclabel,data=ordered`. This is similar to g_unix_mount_... |
| mount_get_root_path | `mount_get_root_path(mount_entry: Gio.UnixMountEntry) -> utf8` | g_unix_mount_get_root_path | 2.60 | Gets the root of the mount within the filesystem. This is useful e.g. for mounts created by bind operation, or btrfs subvolumes. For example, the r... |
| mount_guess_can_eject | `mount_guess_can_eject(mount_entry: Gio.UnixMountEntry) -> gboolean` | g_unix_mount_guess_can_eject |  | Guesses whether a Unix mount can be ejected. |
| mount_guess_icon | `mount_guess_icon(mount_entry: Gio.UnixMountEntry) -> Gio.Icon` | g_unix_mount_guess_icon |  | Guesses the icon of a Unix mount. |
| mount_guess_name | `mount_guess_name(mount_entry: Gio.UnixMountEntry) -> utf8` | g_unix_mount_guess_name |  | Guesses the name of a Unix mount. The result is a translated string. |
| mount_guess_should_display | `mount_guess_should_display(mount_entry: Gio.UnixMountEntry) -> gboolean` | g_unix_mount_guess_should_display |  | Guesses whether a Unix mount should be displayed in the UI. |
| mount_guess_symbolic_icon | `mount_guess_symbolic_icon(mount_entry: Gio.UnixMountEntry) -> Gio.Icon` | g_unix_mount_guess_symbolic_icon | 2.34 | Guesses the symbolic icon of a Unix mount. |
| mount_is_readonly | `mount_is_readonly(mount_entry: Gio.UnixMountEntry) -> gboolean` | g_unix_mount_is_readonly |  | Checks if a unix mount is mounted read only. |
| mount_is_system_internal | `mount_is_system_internal(mount_entry: Gio.UnixMountEntry) -> gboolean` | g_unix_mount_is_system_internal |  | Checks if a Unix mount is a system mount. This is the Boolean OR of g_unix_is_system_fs_type(), g_unix_is_system_device_path() and g_unix_is_mount_... |
| mount_point_at | `mount_point_at(mount_path: filename, time_read: out guint64?) -> Gio.UnixMountPoint` | g_unix_mount_point_at | 2.66 | Gets a #GUnixMountPoint for a given mount path. If @time_read is set, it will be filled with a unix timestamp for checking if the mount points have... |
| mount_point_compare | `mount_point_compare(mount1: Gio.UnixMountPoint, mount2: Gio.UnixMountPoint) -> gint` | g_unix_mount_point_compare |  | Compares two unix mount points. |
| mount_point_copy | `mount_point_copy(mount_point: Gio.UnixMountPoint) -> Gio.UnixMountPoint` | g_unix_mount_point_copy | 2.54 | Makes a copy of @mount_point. |
| mount_point_free | `mount_point_free(mount_point: Gio.UnixMountPoint) -> none` | g_unix_mount_point_free |  | Frees a unix mount point. |
| mount_point_get_device_path | `mount_point_get_device_path(mount_point: Gio.UnixMountPoint) -> filename` | g_unix_mount_point_get_device_path |  | Gets the device path for a unix mount point. |
| mount_point_get_fs_type | `mount_point_get_fs_type(mount_point: Gio.UnixMountPoint) -> utf8` | g_unix_mount_point_get_fs_type |  | Gets the file system type for the mount point. |
| mount_point_get_mount_path | `mount_point_get_mount_path(mount_point: Gio.UnixMountPoint) -> filename` | g_unix_mount_point_get_mount_path |  | Gets the mount path for a unix mount point. |
| mount_point_get_options | `mount_point_get_options(mount_point: Gio.UnixMountPoint) -> utf8` | g_unix_mount_point_get_options | 2.32 | Gets the options for the mount point. |
| mount_point_guess_can_eject | `mount_point_guess_can_eject(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_guess_can_eject |  | Guesses whether a Unix mount point can be ejected. |
| mount_point_guess_icon | `mount_point_guess_icon(mount_point: Gio.UnixMountPoint) -> Gio.Icon` | g_unix_mount_point_guess_icon |  | Guesses the icon of a Unix mount point. |
| mount_point_guess_name | `mount_point_guess_name(mount_point: Gio.UnixMountPoint) -> utf8` | g_unix_mount_point_guess_name |  | Guesses the name of a Unix mount point. The result is a translated string. |
| mount_point_guess_symbolic_icon | `mount_point_guess_symbolic_icon(mount_point: Gio.UnixMountPoint) -> Gio.Icon` | g_unix_mount_point_guess_symbolic_icon | 2.34 | Guesses the symbolic icon of a Unix mount point. |
| mount_point_is_loopback | `mount_point_is_loopback(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_is_loopback |  | Checks if a unix mount point is a loopback device. |
| mount_point_is_readonly | `mount_point_is_readonly(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_is_readonly |  | Checks if a unix mount point is read only. |
| mount_point_is_user_mountable | `mount_point_is_user_mountable(mount_point: Gio.UnixMountPoint) -> gboolean` | g_unix_mount_point_is_user_mountable |  | Checks if a unix mount point is mountable by the user. |
| mount_points_changed_since | `mount_points_changed_since(time: guint64) -> gboolean` | g_unix_mount_points_changed_since |  | Checks if the unix mount points have changed since a given unix time. |
| mount_points_get | `mount_points_get(time_read: out guint64?) -> GLib.List` | g_unix_mount_points_get |  | Gets a #GList of #GUnixMountPoint containing the unix mount points. If @time_read is set, it will be filled with the mount timestamp, allowing for ... |
| mounts_changed_since | `mounts_changed_since(time: guint64) -> gboolean` | g_unix_mounts_changed_since |  | Checks if the unix mounts have changed since a given unix time. |
| mounts_get | `mounts_get(time_read: out guint64?) -> GLib.List` | g_unix_mounts_get |  | Gets a #GList of #GUnixMountEntry containing the unix mounts. If @time_read is set, it will be filled with the mount timestamp, allowing for checki... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| DesktopAppLaunchCallback | `DesktopAppLaunchCallback(appinfo: Gio.DesktopAppInfo, pid: GLib.Pid, user_data: gpointer?) -> none` |  |  | During invocation, g_desktop_app_info_launch_uris_as_manager() may create one or more child processes. This callback is invoked once for each, prov... |

## Constants

| Name | Type |
| --- | --- |
| DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME | utf8 |

