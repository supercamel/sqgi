# Xdp 1.0

SQGI import: `import("Xdp", "1.0")`

Packages: `libportal`
Includes: `Gio-2.0`
Libraries: `libportal.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 2 |
| Interfaces | 0 |
| Records | 3 |
| Unions | 0 |
| Enums | 19 |
| Flags | 13 |
| Functions | 0 |
| Callbacks | 0 |
| Constants | 1 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Portal | GObject.Object | 0 | 6 | 72 | Context for portal calls. The XdpPortal object provides the main context object for the portal operations of libportal. Typically, an application w... |
| Session | GObject.Object | 0 | 1 | 20 | A representation of long-lived screencast portal interactions. The XdpSession object is used to represent portal interactions with the screencast o... |

### Xdp.Portal

Parent: `GObject.Object` ?? Implements: `Gio.Initable` ?? GType: `XdpPortal` ?? C type: `XdpPortal`

Context for portal calls. The XdpPortal object provides the main context object for the portal operations of libportal. Typically, an application w...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| initable_new | `Portal.initable_new() -> Portal throws` | xdp_portal_initable_new |  | Creates a new [class@Portal] object. |
| new | `Portal.new() -> Portal` | xdp_portal_new |  | Creates a new [class@Portal] object. If D-Bus is unavailable this API will abort. We recommend using xdp_portal_initable_new() to safely handle thi... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| running_under_flatpak | `running_under_flatpak() -> gboolean` | xdp_portal_running_under_flatpak |  | Detects if running inside of a Flatpak or WebKit sandbox. See also: [func@Portal.running_under_sandbox]. |
| running_under_sandbox | `running_under_sandbox() -> gboolean` | xdp_portal_running_under_sandbox |  | This function tries to determine if the current process is running under a sandbox that requires the use of portals. If you need to check error con... |
| running_under_snap | `running_under_snap() -> gboolean throws` | xdp_portal_running_under_snap |  | Detects if you are running inside of a Snap sandbox. See also: [func@Portal.running_under_sandbox]. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| access_camera | `Portal.access_camera(parent: Parent?, flags: CameraFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_access_camera |  | Request access to a camera. When the request is done, @callback will be called. You can then call [method@Portal.access_camera_finish] to get the r... |
| access_camera_finish | `Portal.access_camera_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_access_camera_finish |  | Finishes a camera acess request. Returns the result as a boolean. If the access was granted, you can then call [method@Portal.open_pipewire_remote_... |
| add_notification | `Portal.add_notification(id: utf8, notification: GLib.Variant, flags: NotificationFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_add_notification |  | Sends a desktop notification. The following keys may be present in @notification: - title `s`: a user-visible string to display as title - body `s`... |
| add_notification_finish | `Portal.add_notification_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_add_notification_finish |  | Finishes the notification request. Returns the result as a boolean. |
| compose_email | `Portal.compose_email(parent: Parent?, addresses: utf8?, cc: utf8?, bcc: utf8?, subject: utf8?, body: utf8?, attachments: utf8?, flags: EmailFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_compose_email |  | Presents a window that lets the user compose an email, with some pre-filled information. When the request is done, @callback will be called. You ca... |
| compose_email_finish | `Portal.compose_email_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_compose_email_finish |  | Finishes the compose-email request. |
| create_remote_desktop_session | `Portal.create_remote_desktop_session(devices: DeviceType, outputs: OutputType, flags: RemoteDesktopFlags, cursor_mode: CursorMode, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_create_remote_desktop_session |  | Creates a session for remote desktop. When the request is done, @callback will be called. You can then call [method@Portal.create_remote_desktop_se... |
| create_remote_desktop_session_finish | `Portal.create_remote_desktop_session_finish(result: Gio.AsyncResult) -> Session throws` | xdp_portal_create_remote_desktop_session_finish |  | Finishes the create-remote-desktop request, and returns a [class@Session]. |
| create_screencast_session | `Portal.create_screencast_session(outputs: OutputType, flags: ScreencastFlags, cursor_mode: CursorMode, persist_mode: PersistMode, restore_token: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_create_screencast_session |  | Creates a session for a screencast. When the request is done, @callback will be called. You can then call [method@Portal.create_screencast_session_... |
| create_screencast_session_finish | `Portal.create_screencast_session_finish(result: Gio.AsyncResult) -> Session throws` | xdp_portal_create_screencast_session_finish |  | Finishes the create-screencast request, and returns a [class@Session]. |
| dynamic_launcher_get_desktop_entry | `Portal.dynamic_launcher_get_desktop_entry(desktop_file_id: utf8) -> utf8 throws` | xdp_portal_dynamic_launcher_get_desktop_entry |  | This function gets the contents of a .desktop file that was previously installed by the dynamic launcher portal. The @desktop_file_id must be prefi... |
| dynamic_launcher_get_icon | `Portal.dynamic_launcher_get_icon(desktop_file_id: utf8, out_icon_format: utf8?, out_icon_size: guint?) -> GLib.Variant throws` | xdp_portal_dynamic_launcher_get_icon |  | This function gets the icon associated with a .desktop file that was previously installed by the dynamic launcher portal. The @desktop_file_id must... |
| dynamic_launcher_install | `Portal.dynamic_launcher_install(token: utf8, desktop_file_id: utf8, desktop_entry: utf8) -> gboolean throws` | xdp_portal_dynamic_launcher_install |  | This function completes installation of a launcher so that the icon and name given in previous method calls will show up in the desktop environment... |
| dynamic_launcher_launch | `Portal.dynamic_launcher_launch(desktop_file_id: utf8, activation_token: utf8) -> gboolean throws` | xdp_portal_dynamic_launcher_launch |  |  |
| dynamic_launcher_prepare_install | `Portal.dynamic_launcher_prepare_install(parent: Parent?, name: utf8, icon_v: GLib.Variant, launcher_type: LauncherType, target: utf8?, editable_name: gboolean, editable_icon: gboolean, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_dynamic_launcher_prepare_install |  | Presents a dialog to the user so they can confirm they want to install a launcher to their desktop. When the request is done, @callback will be cal... |
| dynamic_launcher_prepare_install_finish | `Portal.dynamic_launcher_prepare_install_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_dynamic_launcher_prepare_install_finish |  | Finishes the prepare-install-launcher request, and returns [struct@GLib.Variant] dictionary with the following information: - name s: the name chos... |
| dynamic_launcher_request_install_token | `Portal.dynamic_launcher_request_install_token(name: utf8, icon_v: GLib.Variant) -> utf8 throws` | xdp_portal_dynamic_launcher_request_install_token |  | Requests a token which can be passed to [method@Portal.dynamic_launcher_install] to complete installation of the launcher without user interaction.... |
| dynamic_launcher_uninstall | `Portal.dynamic_launcher_uninstall(desktop_file_id: utf8) -> gboolean throws` | xdp_portal_dynamic_launcher_uninstall |  | This function uninstalls a launcher that was previously installed using the dynamic launcher portal, resulting in the .desktop file and icon being ... |
| get_user_information | `Portal.get_user_information(parent: Parent?, reason: utf8?, flags: UserInformationFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_get_user_information |  | Gets information about the user. When the request is done, @callback will be called. You can then call [method@Portal.get_user_information_finish] ... |
| get_user_information_finish | `Portal.get_user_information_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_get_user_information_finish |  | Finishes the get-user-information request. Returns the result in the form of a [struct@GLib.Variant] dictionary containing the following fields: - ... |
| is_camera_present | `Portal.is_camera_present() -> gboolean` | xdp_portal_is_camera_present |  | Returns whether any camera are present. |
| location_monitor_start | `Portal.location_monitor_start(parent: Parent?, distance_threshold: guint, time_threshold: guint, accuracy: LocationAccuracy, flags: LocationMonitorFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_location_monitor_start |  | Makes `XdpPortal` start monitoring location changes. When the location changes, the [signal@Portal::location-updated]. signal is emitted. Use [meth... |
| location_monitor_start_finish | `Portal.location_monitor_start_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_location_monitor_start_finish |  | Finishes a location-monitor request. Returns result in the form of boolean. |
| location_monitor_stop | `Portal.location_monitor_stop() -> none` | xdp_portal_location_monitor_stop |  | Stops location monitoring that was started with [method@Portal.location_monitor_start]. |
| open_directory | `Portal.open_directory(parent: Parent, uri: utf8, flags: OpenUriFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_open_directory |  | Opens the directory containing the file specified by the @uri. which must be a file: uri pointing to a file that the application has access to. |
| open_directory_finish | `Portal.open_directory_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_open_directory_finish |  | Finishes the open-directory request. Returns the result in the form of a boolean. |
| open_file | `Portal.open_file(parent: Parent?, title: utf8, filters: GLib.Variant?, current_filter: GLib.Variant?, choices: GLib.Variant?, flags: OpenFileFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_open_file |  | Asks the user to open one or more files. The format for the @filters argument is `a(sa(us))`. Each item in the array specifies a single filter to o... |
| open_file_finish | `Portal.open_file_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_open_file_finish |  | Finishes the open-file request Returns the result in the form of a [struct@GLib.Variant] dictionary containing the following fields: - uris `as`: a... |
| open_pipewire_remote_for_camera | `Portal.open_pipewire_remote_for_camera() -> gint` | xdp_portal_open_pipewire_remote_for_camera |  | Opens a file descriptor to the pipewire remote where the camera nodes are available. The file descriptor should be used to create a pw_core object,... |
| open_uri | `Portal.open_uri(parent: Parent, uri: utf8, flags: OpenUriFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_open_uri |  | Opens @uri with an external handler. |
| open_uri_finish | `Portal.open_uri_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_open_uri_finish |  | Finishes the open-uri request. Returns the result in the form of a boolean. |
| pick_color | `Portal.pick_color(parent: Parent?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_pick_color |  | Lets the user pick a color from the screen. When the request is done, @callback will be called. You can then call [method@Portal.pick_color_finish]... |
| pick_color_finish | `Portal.pick_color_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_pick_color_finish |  | Finishes a pick-color request. Returns the result in the form of a GVariant of the form (ddd), containing red, green and blue components in the ran... |
| prepare_print | `Portal.prepare_print(parent: Parent?, title: utf8, settings: GLib.Variant?, page_setup: GLib.Variant?, flags: PrintFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_prepare_print |  | Presents a print dialog to the user and returns print settings and page setup. When the request is done, @callback will be called. You can then cal... |
| prepare_print_finish | `Portal.prepare_print_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_prepare_print_finish |  | Finishes the prepare-print request. Returns a [struct@GLib.Variant] dictionary with the following information: - settings `a{sv}`: print settings a... |
| print_file | `Portal.print_file(parent: Parent?, title: utf8, token: guint, file: utf8, flags: PrintFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_print_file |  | Prints a file. If a valid token is present in the @options, then this call will print with the settings from the Print call that the token refers t... |
| print_file_finish | `Portal.print_file_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_print_file_finish |  | Finishes the print request. |
| remove_notification | `Portal.remove_notification(id: utf8) -> none` | xdp_portal_remove_notification |  | Withdraws a desktop notification. |
| request_background | `Portal.request_background(parent: Parent?, reason: utf8?, commandline: utf8, flags: BackgroundFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | xdp_portal_request_background |  | Requests background permissions. When the request is done, @callback will be called. You can then call [method@Portal.request_background_finish] to... |
| request_background_finish | `Portal.request_background_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_request_background_finish |  | Finishes the request. Returns `TRUE` if successful. |
| save_file | `Portal.save_file(parent: Parent?, title: utf8, current_name: utf8?, current_folder: utf8?, current_file: utf8?, filters: GLib.Variant?, current_filter: GLib.Variant?, choices: GLib.Variant?, flags: SaveFileFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_save_file |  | Asks the user for a location to save a file. The format for the @filters argument is the same as for [method@Portal.open_file]. The format for the ... |
| save_file_finish | `Portal.save_file_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_save_file_finish |  | Finishes the save-file request. Returns the result in the form of a [struct@GLib.Variant] dictionary containing the following fields: - uris `(as)`... |
| save_files | `Portal.save_files(parent: Parent?, title: utf8, current_name: utf8?, current_folder: utf8?, files: GLib.Variant, choices: GLib.Variant?, flags: SaveFileFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_save_files |  | Asks for a folder as a location to save one or more files. The names of the files will be used as-is and appended to the selected folder's path in ... |
| save_files_finish | `Portal.save_files_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | xdp_portal_save_files_finish |  | Finishes the save-files request. Returns the result in the form of a [struct@GLib.Variant] dictionary containing the following fields: - uris `(as)... |
| session_inhibit | `Portal.session_inhibit(parent: Parent?, reason: utf8?, flags: InhibitFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_session_inhibit |  | Inhibits various session status changes. To obtain an ID that can be used to undo the inhibition, use [method@Portal.session_inhibit_finish] in the... |
| session_inhibit_finish | `Portal.session_inhibit_finish(result: Gio.AsyncResult) -> gint throws` | xdp_portal_session_inhibit_finish |  | Finishes the inhbit request. Returns the ID of the inhibition as a positive integer. The ID can be passed to [method@Portal.session_uninhibit] to u... |
| session_monitor_query_end_response | `Portal.session_monitor_query_end_response() -> none` | xdp_portal_session_monitor_query_end_response |  | This method should be called within one second of receiving a [signal@Portal::session-state-changed] signal with the 'Query End' state, to acknowle... |
| session_monitor_start | `Portal.session_monitor_start(parent: Parent?, flags: SessionMonitorFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_session_monitor_start |  | Makes [class@Portal] start monitoring the login session state. When the state changes, the [signal@Portal::session-state-changed] signal is emitted... |
| session_monitor_start_finish | `Portal.session_monitor_start_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_session_monitor_start_finish |  | Finishes a session-monitor request. Returns the result in the form of boolean. |
| session_monitor_stop | `Portal.session_monitor_stop() -> none` | xdp_portal_session_monitor_stop |  | Stops session state monitoring that was started with [method@Portal.session_monitor_start]. |
| session_uninhibit | `Portal.session_uninhibit(id: gint) -> none` | xdp_portal_session_uninhibit |  | Removes an inhibitor that was created by a call to [method@Portal.session_inhibit]. |
| set_background_status | `Portal.set_background_status(status_message: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_set_background_status |  | Sets the status information of the application, for when it's running in background. |
| set_background_status_finish | `Portal.set_background_status_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_set_background_status_finish |  | Finishes setting the background status of the application. |
| set_wallpaper | `Portal.set_wallpaper(parent: Parent?, uri: utf8, flags: WallpaperFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_set_wallpaper |  | Sets a desktop background image, given by a uri. |
| set_wallpaper_finish | `Portal.set_wallpaper_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_set_wallpaper_finish |  | Finishes the open-uri request. Returns the result in the form of a boolean. |
| spawn | `Portal.spawn(cwd: utf8, argv: utf8, fds: gint?, map_to: gint?, n_fds: gint, env: utf8?, flags: SpawnFlags, sandbox_expose: utf8?, sandbox_expose_ro: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_spawn |  | Creates a new copy of the applications sandbox, and runs a process in, with the given arguments. The learn when the spawned process exits, connect ... |
| spawn_finish | `Portal.spawn_finish(result: Gio.AsyncResult) -> gint throws` | xdp_portal_spawn_finish |  | Finishes the spawn request. Returns the pid of the newly spawned process. |
| spawn_signal | `Portal.spawn_signal(pid: gint, signal: gint, to_process_group: gboolean) -> none` | xdp_portal_spawn_signal |  | Sends a Unix signal to a process that has been spawned by [method@Portal.spawn]. |
| take_screenshot | `Portal.take_screenshot(parent: Parent?, flags: ScreenshotFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_take_screenshot |  | Takes a screenshot. When the request is done, @callback will be called. You can then call [method@Portal.take_screenshot_finish] to get the results. |
| take_screenshot_finish | `Portal.take_screenshot_finish(result: Gio.AsyncResult) -> utf8 throws` | xdp_portal_take_screenshot_finish |  | Finishes a screenshot request. Returns the result in the form of a URI pointing to an image file. |
| trash_file | `Portal.trash_file(path: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_trash_file |  | Sends the file at @path to the trash can. |
| trash_file_finish | `Portal.trash_file_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_trash_file_finish |  | Finishes the trash-file request. Returns the result in the form of a boolean. |
| update_install | `Portal.update_install(parent: Parent, flags: UpdateInstallFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_update_install |  | Installs an available software update. This should be called in response to a [signal@Portal::update-available] signal. During the update installat... |
| update_install_finish | `Portal.update_install_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_update_install_finish |  | Finishes an update-installation request. Returns the result in the form of boolean. Note that the update may not be completely installed by the tim... |
| update_monitor_start | `Portal.update_monitor_start(flags: UpdateMonitorFlags, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_portal_update_monitor_start |  | Makes `XdpPortal` start monitoring for available software updates. When a new update is available, the [signal@Portal::update-available]. signal is... |
| update_monitor_start_finish | `Portal.update_monitor_start_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_portal_update_monitor_start_finish |  | Finishes an update-monitor request. Returns the result in the form of boolean. |
| update_monitor_stop | `Portal.update_monitor_stop() -> none` | xdp_portal_update_monitor_stop |  | Stops update monitoring that was started with [method@Portal.update_monitor_start]. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| location-updated | `latitude: gdouble, longitude: gdouble, altitude: gdouble, accuracy: gdouble, speed: gdouble, heading: gdouble, description: utf8, timestamp_s: gint64, timestamp_ms: gint64` | none | first |  | Emitted when location monitoring is enabled and the location changes. |
| notification-action-invoked | `id: utf8, action: utf8, parameter: GLib.Variant?` | none | first |  | Emitted when a non-exported action is activated on a notification. |
| session-state-changed | `screensaver_active: gboolean, session_state: LoginSessionState` | none | first |  | Emitted when session state monitoring is enabled and the state of the login session changes or the screensaver is activated or deactivated. |
| spawn-exited | `pid: guint, exit_status: guint` | none | first |  | Emitted when a process that was spawned with [method@Portal.spawn] exits. |
| update-available | `running_commit: utf8, local_commit: utf8, remote_commit: utf8` | none | first |  | Emitted when updates monitoring is enabled and a new update is available. It is only sent once with the same information, but it can be sent many t... |
| update-progress | `n_ops: guint, op: guint, progress: guint, status: UpdateStatus, error: utf8, error_message: utf8` | none | first |  | Emitted to indicate progress of an update installation. It is undefined exactly how often it is sent, but it will be emitted at least once at the e... |

### Xdp.Session

Parent: `GObject.Object` ?? GType: `XdpSession` ?? C type: `XdpSession`

A representation of long-lived screencast portal interactions. The XdpSession object is used to represent portal interactions with the screencast o...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `Session.close() -> none` | xdp_session_close |  | Closes the session. |
| connect_to_eis | `Session.connect_to_eis() -> gint throws` | xdp_session_connect_to_eis |  | Connect this XdpRemoteDesktopSession to an EIS implementation and return the fd. This fd can be passed into ei_setup_backend_fd(). See the libei do... |
| get_devices | `Session.get_devices() -> DeviceType` | xdp_session_get_devices |  | Obtains the devices that the user selected. Unless the session is active, this function returns `XDP_DEVICE_NONE`. |
| get_persist_mode | `Session.get_persist_mode() -> PersistMode` | xdp_session_get_persist_mode |  | Retrieves the effective persist mode of @session. May only be called after @session is successfully started, i.e. after [method@Session.start_finish]. |
| get_restore_token | `Session.get_restore_token() -> utf8` | xdp_session_get_restore_token |  | Retrieves the restore token of @session. A restore token will only be available if `XDP_PERSIST_MODE_TRANSIENT` or `XDP_PERSIST_MODE_PERSISTENT` wa... |
| get_session_state | `Session.get_session_state() -> SessionState` | xdp_session_get_session_state |  | Obtains information about the state of the session that is represented by @session. |
| get_session_type | `Session.get_session_type() -> SessionType` | xdp_session_get_session_type |  | Obtains information about the type of session that is represented by @session. |
| get_streams | `Session.get_streams() -> GLib.Variant` | xdp_session_get_streams |  | Obtains the streams that the user selected. The information in the returned [struct@GLib.Variant] has the format `a(ua{sv})`. Each item in the arra... |
| keyboard_key | `Session.keyboard_key(keysym: gboolean, key: gint, state: KeyState) -> none` | xdp_session_keyboard_key |  | Changes the state of the key to @state. May only be called on a remote desktop session with `XDP_DEVICE_KEYBOARD` access. |
| open_pipewire_remote | `Session.open_pipewire_remote() -> gint` | xdp_session_open_pipewire_remote |  | Opens a file descriptor to the pipewire remote where the screencast streams are available. The file descriptor should be used to create a pw_remote... |
| pointer_axis | `Session.pointer_axis(finish: gboolean, dx: gdouble, dy: gdouble) -> none` | xdp_session_pointer_axis |  | The axis movement from a smooth scroll device, such as a touchpad. When applicable, the size of the motion delta should be equivalent to the motion... |
| pointer_axis_discrete | `Session.pointer_axis_discrete(axis: DiscreteAxis, steps: gint) -> none` | xdp_session_pointer_axis_discrete |  | The axis movement from a discrete scroll device. May only be called on a remote desktop session with `XDP_DEVICE_POINTER` access. |
| pointer_button | `Session.pointer_button(button: gint, state: ButtonState) -> none` | xdp_session_pointer_button |  | Changes the state of the button to @state. May only be called on a remote desktop session with `XDP_DEVICE_POINTER` access. |
| pointer_motion | `Session.pointer_motion(dx: gdouble, dy: gdouble) -> none` | xdp_session_pointer_motion |  | Moves the pointer from its current position. May only be called on a remote desktop session with `XDP_DEVICE_POINTER` access. |
| pointer_position | `Session.pointer_position(stream: guint, x: gdouble, y: gdouble) -> none` | xdp_session_pointer_position |  | Moves the pointer to a new position in the given streams logical coordinate space. May only be called on a remote desktop session with `XDP_DEVICE_... |
| start | `Session.start(parent: Parent?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | xdp_session_start |  | Starts the session. When the request is done, @callback will be called. You can then call [method@Session.start_finish] to get the results. |
| start_finish | `Session.start_finish(result: Gio.AsyncResult) -> gboolean throws` | xdp_session_start_finish |  | Finishes the session-start request. |
| touch_down | `Session.touch_down(stream: guint, slot: guint, x: gdouble, y: gdouble) -> none` | xdp_session_touch_down |  | Notify about a new touch down event. The `(x, y)` position represents the new touch point position in the streams logical coordinate space. May onl... |
| touch_position | `Session.touch_position(stream: guint, slot: guint, x: gdouble, y: gdouble) -> none` | xdp_session_touch_position |  | Notify about a new touch motion event. The `(x, y)` position represents where the touch point position in the streams logical coordinate space move... |
| touch_up | `Session.touch_up(slot: guint) -> none` | xdp_session_touch_up |  | Notify about a new touch up event. May only be called on a remote desktop session with `XDP_DEVICE_TOUCHSCREEN` access. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `` | none | cleanup |  | Emitted when a session is closed externally. |

## Enums

### Xdp.ButtonState

GType: `XdpButtonState` ?? C type: `XdpButtonState`

The XdpButtonState enumeration is used to describe the state of buttons.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| pressed | 1 | pressed | the button is up |
| released | 0 | released | the button is down |

### Xdp.CameraFlags

GType: `XdpCameraFlags` ?? C type: `XdpCameraFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.DiscreteAxis

GType: `XdpDiscreteAxis` ?? C type: `XdpDiscreteAxis`

The `XdpDiscreteAxis` enumeration is used to describe the discrete scroll axes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| horizontal_scroll | 0 | horizontal-scroll | the horizontal scroll axis |
| vertical_scroll | 1 | vertical-scroll | the horizontal scroll axis |

### Xdp.EmailFlags

GType: `XdpEmailFlags` ?? C type: `XdpEmailFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.KeyState

GType: `XdpKeyState` ?? C type: `XdpKeyState`

The `XdpKeyState` enumeration is used to describe the state of keys.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| pressed | 1 | pressed | the key is up |
| released | 0 | released | the key is down |

### Xdp.LocationAccuracy

GType: `XdpLocationAccuracy` ?? C type: `XdpLocationAccuracy`

The values of this enum indicate the desired level of accuracy for location information.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| city | 2 | city | City-level accuracy |
| country | 1 | country | Country-level accuracy |
| exact | 5 | exact | Maximum accuracy |
| neighborhood | 3 | neighborhood | Neighborhood-level accuracy |
| none | 0 | none | No particular accuracy |
| street | 4 | street | Street-level accuracy |

### Xdp.LocationMonitorFlags

GType: `XdpLocationMonitorFlags` ?? C type: `XdpLocationMonitorFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.LoginSessionState

GType: `XdpLoginSessionState` ?? C type: `XdpLoginSessionState`

The values of this enum are returned in the [signal@Portal::session-state-changed] signal to indicate the current state of the user session.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ending | 3 | ending | the session is about to end |
| query_end | 2 | query-end | the session is in the query end phase, during which applications can save their state or inhibit the session from ending |
| running | 1 | running | the session is running |

### Xdp.NotificationFlags

GType: `XdpNotificationFlags` ?? C type: `XdpNotificationFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.PersistMode

GType: `XdpPersistMode` ?? C type: `XdpPersistMode`

Options for how the screencast session should persist.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | do not persist |
| persistent | 2 | persistent | persist until the user revokes this permission |
| transient | 1 | transient | persist as long as the application is alive |

### Xdp.PrintFlags

GType: `XdpPrintFlags` ?? C type: `XdpPrintFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.SaveFileFlags

GType: `XdpSaveFileFlags` ?? C type: `XdpSaveFileFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.SessionMonitorFlags

GType: `XdpSessionMonitorFlags` ?? C type: `XdpSessionMonitorFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.SessionState

GType: `XdpSessionState` ?? C type: `XdpSessionState`

The state of a session.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| active | 1 | active | the session is active. |
| closed | 2 | closed | the session is no longer active. |
| initial | 0 | initial | the session has not been started. |

### Xdp.SessionType

GType: `XdpSessionType` ?? C type: `XdpSessionType`

The type of a session.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| remote_desktop | 1 | remote-desktop | a remote desktop session. |
| screencast | 0 | screencast | a screencast session. |

### Xdp.UpdateInstallFlags

GType: `XdpUpdateInstallFlags` ?? C type: `XdpUpdateInstallFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.UpdateMonitorFlags

GType: `XdpUpdateMonitorFlags` ?? C type: `XdpUpdateMonitorFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

### Xdp.UpdateStatus

GType: `XdpUpdateStatus` ?? C type: `XdpUpdateStatus`

The values of this enum are returned in the [signal@Portal::update-progress] signal to indicate the current progress of an installation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| done | 2 | done | Installation finished successfully |
| empty | 1 | empty | Nothing to install |
| failed | 3 | failed | Installation failed |
| running | 0 | running | Installation in progress |

### Xdp.UserInformationFlags

GType: `XdpUserInformationFlags` ?? C type: `XdpUserInformationFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none |  |

## Flags

### Xdp.BackgroundFlags

GType: `XdpBackgroundFlags` ?? C type: `XdpBackgroundFlags`

Options to use when requesting background.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| activatable | 2 | activatable | Whether the application is D-Bus-activatable |
| autostart | 1 | autostart | Request autostart as well |
| none | 0 | none | No options |

### Xdp.CursorMode

GType: `XdpCursorMode` ?? C type: `XdpCursorMode`

Options for how the cursor is handled.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| embedded | 2 | embedded | cursor is embedded on the stream |
| hidden | 1 | hidden | no cursor |
| metadata | 4 | metadata | cursor is sent as metadata of the stream |

### Xdp.DeviceType

GType: `XdpDeviceType` ?? C type: `XdpDeviceType`

Flags to specify what input devices to control for a remote desktop session.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| keyboard | 1 | keyboard | control the keyboard. |
| none | 0 | none | no device |
| pointer | 2 | pointer | control the pointer. |
| touchscreen | 4 | touchscreen | control the touchscreen. |

### Xdp.InhibitFlags

GType: `XdpInhibitFlags` ?? C type: `XdpInhibitFlags`

Flags that determine what session status changes are inhibited.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| idle | 8 | idle | Inhibit the session going idle |
| logout | 1 | logout | Inhibit logout |
| suspend | 4 | suspend | Inhibit suspend |
| user_switch | 2 | user-switch | Inhibit user switching |

### Xdp.LauncherType

GType: `XdpLauncherType` ?? C type: `XdpLauncherType`

The type of a launcher.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| application | 1 | application | a launcher for a regular application |
| webapp | 2 | webapp | a launcher for a web app |

### Xdp.OpenFileFlags

GType: `XdpOpenFileFlags` ?? C type: `XdpOpenFileFlags`

Options for opening files.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multiple | 1 | multiple | Allow selecting multiple files |
| none | 0 | none | No options |

### Xdp.OpenUriFlags

GType: `XdpOpenUriFlags` ?? C type: `XdpOpenUriFlags`

Options for opening uris.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| ask | 1 | ask | Use an application chooser for the given uri |
| none | 0 | none | No options |
| writable | 2 | writable | Allow writing to file (if uri points to a local file that is exported in the document portal and app is sandboxed itself) |

### Xdp.OutputType

GType: `XdpOutputType` ?? C type: `XdpOutputType`

Flags to specify what kind of sources to offer for a screencast session.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| monitor | 1 | monitor | allow selecting monitors |
| none | 0 | none | do not select any output |
| virtual | 4 | virtual | allow creating new virtual displays |
| window | 2 | window | allow selecting individual application windows |

### Xdp.RemoteDesktopFlags

GType: `XdpRemoteDesktopFlags` ?? C type: `XdpRemoteDesktopFlags`

Options for starting remote desktop sessions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multiple | 1 | multiple | allow opening multiple streams |
| none | 0 | none | No options |

### Xdp.ScreencastFlags

GType: `XdpScreencastFlags` ?? C type: `XdpScreencastFlags`

Options for starting screen casts.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multiple | 1 | multiple | allow opening multiple streams |
| none | 0 | none | No options |

### Xdp.ScreenshotFlags

GType: `XdpScreenshotFlags` ?? C type: `XdpScreenshotFlags`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| interactive | 1 | interactive |  |
| none | 0 | none |  |

### Xdp.SpawnFlags

GType: `XdpSpawnFlags` ?? C type: `XdpSpawnFlags`

Flags influencing the spawn operation and how the new sandbox is created.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| clearenv | 1 | clearenv | Clear the environment |
| latest | 2 | latest | Spawn the latest version of the app |
| no_network | 8 | no-network | Spawn without network (equivalent to the --unshare=network option of flatpak run) |
| none | 0 | none | No flags |
| sandbox | 4 | sandbox | Spawn in a sandbox (equivalent to the --sandbox option of flatpak run) |
| watch | 16 | watch | Kill the sandbox when the caller disappears from the session bus |

### Xdp.WallpaperFlags

GType: `XdpWallpaperFlags` ?? C type: `XdpWallpaperFlags`

The values of this enumeration determine where the wallpaper is being set.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| background | 1 | background | Set wallpaper on the desktop background |
| lockscreen | 2 | lockscreen | Set wallpaper on the lockscreen |
| none | 0 | none | No flags |
| preview | 4 | preview | Request the preview to be shown |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Parent |  | 0 | 0 | 2 | Parent window abstraction. The [struct@Parent] struct provides an abstract way to represent a window, without introducing a dependency on a toolkit... |
| PortalClass |  | 0 | 0 | 0 |  |
| SessionClass |  | 0 | 0 | 0 |  |

### Xdp.Parent

GType: `XdpParent` ?? C type: `XdpParent`

Parent window abstraction. The [struct@Parent] struct provides an abstract way to represent a window, without introducing a dependency on a toolkit...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Parent.copy() -> Parent` | xdp_parent_copy |  | Copies @source into a new [struct@Parent]. |
| free | `Parent.free() -> none` | xdp_parent_free |  | Frees @parent. |

### Xdp.PortalClass

C type: `XdpPortalClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Xdp.SessionClass

C type: `XdpSessionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

## Constants

| Name | Type |
| --- | --- |
| WALLPAPER_TARGET_BOTH | gint |

