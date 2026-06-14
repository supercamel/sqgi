# Gio 2.0

SQGI import: `import("Gio", "2.0")`

Packages: `gio-2.0`, `gio-unix-2.0`
Includes: `GLib-2.0`, `GModule-2.0`, `GObject-2.0`
Libraries: `libgio-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 109 |
| Interfaces | 39 |
| Records | 226 |
| Unions | 0 |
| Enums | 43 |
| Flags | 39 |
| Functions | 164 |
| Callbacks | 31 |
| Constants | 130 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AppInfoMonitor | GObject.Object | 0 | 1 | 1 | `GAppInfoMonitor` monitors application information for changes. `GAppInfoMonitor` is a very simple object used for monitoring the app info database... |
| AppLaunchContext | GObject.Object | 0 | 3 | 7 | Integrating the launch with the launching application. This is used to handle for instance startup notification and launching the new application o... |
| Application | GObject.Object | 0 | 7 | 39 | `GApplication` is the core class for application support. A `GApplication` is the foundation of an application. It wraps some low-level platform-sp... |
| ApplicationCommandLine | GObject.Object | 0 | 0 | 16 | `GApplicationCommandLine` represents a command-line invocation of an application. It is created by [class@Gio.Application] and emitted in the [sign... |
| BufferedInputStream | FilterInputStream | 1 | 0 | 11 | Buffered input stream implements #GFilterInputStream and provides for buffered reads. By default, `GBufferedInputStream`'s buffer size is set at 4 ... |
| BufferedOutputStream | FilterOutputStream | 0 | 0 | 6 | Buffered output stream implements [class@Gio.FilterOutputStream] and provides for buffered writes. By default, `GBufferedOutputStream`'s buffer siz... |
| BytesIcon | GObject.Object | 0 | 0 | 2 | `GBytesIcon` specifies an image held in memory in a common format (usually PNG) to be used as icon. |
| Cancellable | GObject.Object | 0 | 1 | 14 | `GCancellable` allows operations to be cancelled. `GCancellable` is a thread-safe operation cancellation stack used throughout GIO to allow for can... |
| CharsetConverter | GObject.Object | 0 | 0 | 4 | `GCharsetConverter` is an implementation of [iface@Gio.Converter] based on [struct@GLib.IConv]. |
| ConverterInputStream | FilterInputStream | 0 | 0 | 2 | Converter input stream implements [class@Gio.InputStream] and allows conversion of data of various types during reading. As of GLib 2.34, `GConvert... |
| ConverterOutputStream | FilterOutputStream | 0 | 0 | 2 | Converter output stream implements [class@Gio.OutputStream] and allows conversion of data of various types during reading. As of GLib 2.34, `GConve... |
| Credentials | GObject.Object | 0 | 0 | 8 | The `GCredentials` type is a reference-counted wrapper for native credentials. The information in `GCredentials` is typically used for identifying,... |
| DataInputStream | BufferedInputStream | 0 | 0 | 23 | Data input stream implements [class@Gio.InputStream] and includes functions for reading structured data directly from a binary input stream. |
| DataOutputStream | FilterOutputStream | 0 | 0 | 11 | Data output stream implements [class@Gio.OutputStream] and includes functions for writing data directly to an output stream. |
| DBusActionGroup | GObject.Object | 0 | 0 | 1 | `GDBusActionGroup` is an implementation of the [iface@Gio.ActionGroup] interface. `GDBusActionGroup` can be used as a proxy for an action group tha... |
| DBusAuthObserver | GObject.Object | 0 | 2 | 3 | `GDBusAuthObserver` provides a mechanism for participating in how a [class@Gio.DBusServer] (or a [class@Gio.DBusConnection]) authenticates remote p... |
| DBusConnection | GObject.Object | 0 | 1 | 47 | The `GDBusConnection` type is used for D-Bus connections to remote peers such as a message buses. It is a low-level API that offers a lot of flexib... |
| DBusInterfaceSkeleton | GObject.Object | 0 | 1 | 13 | Abstract base class for D-Bus interfaces on the service side. |
| DBusMenuModel | MenuModel | 0 | 0 | 1 | `GDBusMenuModel` is an implementation of [class@Gio.MenuModel] that can be used as a proxy for a menu model that is exported over D-Bus with [metho... |
| DBusMessage | GObject.Object | 0 | 0 | 50 | A type for representing D-Bus messages that can be sent or received on a [class@Gio.DBusConnection]. |
| DBusMethodInvocation | GObject.Object | 0 | 0 | 18 | Instances of the `GDBusMethodInvocation` class are used when handling D-Bus method calls. It provides a way to asynchronously return results and er... |
| DBusObjectManagerClient | GObject.Object | 0 | 2 | 10 | `GDBusObjectManagerClient` is used to create, monitor and delete object proxies for remote objects exported by a [class@Gio.DBusObjectManagerServer... |
| DBusObjectManagerServer | GObject.Object | 0 | 0 | 7 | `GDBusObjectManagerServer` is used to export [iface@Gio.DBusObject] instances using the standardized `org.freedesktop.DBus.ObjectManager` interface... |
| DBusObjectProxy | GObject.Object | 0 | 0 | 2 | A `GDBusObjectProxy` is an object used to represent a remote object with one or more D-Bus interfaces. Normally, you don???t instantiate a `GDBusOb... |
| DBusObjectSkeleton | GObject.Object | 0 | 1 | 6 | A `GDBusObjectSkeleton` instance is essentially a group of D-Bus interfaces. The set of exported interfaces on the object may be dynamic and change... |
| DBusProxy | GObject.Object | 0 | 2 | 25 | `GDBusProxy` is a base class used for proxies to access a D-Bus interface on a remote object. A `GDBusProxy` can be constructed for both well-known... |
| DBusServer | GObject.Object | 0 | 1 | 7 | `GDBusServer` is a helper for listening to and accepting D-Bus connections. This can be used to create a new D-Bus server, allowing two peers to us... |
| DebugControllerDBus | GObject.Object | 0 | 1 | 2 | `GDebugControllerDBus` is an implementation of [iface@Gio.DebugController] which exposes debug settings as a D-Bus object. It is a [iface@Gio.Inita... |
| DesktopAppInfo | GObject.Object | 0 | 0 | 24 | `GDesktopAppInfo` is an implementation of [iface@Gio.AppInfo] based on desktop files. Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-speci... |
| Emblem | GObject.Object | 0 | 0 | 4 | `GEmblem` is an implementation of [iface@Gio.Icon] that supports having an emblem, which is an icon with additional properties. It can than be adde... |
| EmblemedIcon | GObject.Object | 0 | 0 | 5 | `GEmblemedIcon` is an implementation of [iface@Gio.Icon] that supports adding an emblem to an icon. Adding multiple emblems to an icon is ensured v... |
| FileEnumerator | GObject.Object | 0 | 0 | 12 | `GFileEnumerator` allows you to operate on a set of [iface@Gio.File] objects, returning a [class@Gio.FileInfo] structure for each file enumerated (... |
| FileIcon | GObject.Object | 0 | 0 | 2 | `GFileIcon` specifies an icon by pointing to an image file to be used as icon. It implements [iface@Gio.LoadableIcon]. |
| FileInfo | GObject.Object | 0 | 0 | 71 | Stores information about a file system object referenced by a [iface@Gio.File]. Functionality for manipulating basic metadata for files. `GFileInfo... |
| FileInputStream | InputStream | 0 | 0 | 3 | `GFileInputStream` provides input streams that take their content from a file. `GFileInputStream` implements [iface@Gio.Seekable], which allows the... |
| FileIOStream | IOStream | 0 | 0 | 4 | `GFileIOStream` provides I/O streams that both read and write to the same file handle. `GFileIOStream` implements [iface@Gio.Seekable], which allow... |
| FileMonitor | GObject.Object | 0 | 1 | 4 | Monitors a file or directory for changes. To obtain a `GFileMonitor` for a file or directory, use [method@Gio.File.monitor], [method@Gio.File.monit... |
| FilenameCompleter | GObject.Object | 0 | 1 | 4 | Completes partial file and directory names given a partial string by looking in the file system for clues. Can return a list of possible completion... |
| FileOutputStream | OutputStream | 0 | 0 | 4 | `GFileOutputStream` provides output streams that write their content to a file. `GFileOutputStream` implements [iface@Gio.Seekable], which allows t... |
| FilterInputStream | InputStream | 2 | 0 | 3 | Base class for input stream implementations that perform some kind of filtering operation on a base stream. Typical examples of filtering operation... |
| FilterOutputStream | OutputStream | 3 | 0 | 3 | Base class for output stream implementations that perform some kind of filtering operation on a base stream. Typical examples of filtering operatio... |
| InetAddress | GObject.Object | 0 | 0 | 19 | `GInetAddress` represents an IPv4 or IPv6 internet address. Use [method@Gio.Resolver.lookup_by_name] or [method@Gio.Resolver.lookup_by_name_async] ... |
| InetAddressMask | GObject.Object | 0 | 0 | 8 | `GInetAddressMask` represents a range of IPv4 or IPv6 addresses described by a base address and a length indicating how many bits of the base addre... |
| InetSocketAddress | SocketAddress | 1 | 0 | 6 | An IPv4 or IPv6 socket address. That is, the combination of a [class@Gio.InetAddress] and a port number. In UNIX terms, `GInetSocketAddress` corres... |
| InputStream | GObject.Object | 4 | 0 | 19 | `GInputStream` is a base class for implementing streaming input. It has functions to read from a stream ([method@Gio.InputStream.read]), to close a... |
| IOModule | GObject.TypeModule | 0 | 0 | 4 | Provides an interface and default functions for loading and unloading modules. This is used internally to make GIO extensible, but can also be used... |
| IOStream | GObject.Object | 4 | 0 | 11 | `GIOStream` represents an object that has both read and write streams. Generally the two streams act as separate input and output streams, but they... |
| ListStore | GObject.Object | 0 | 0 | 11 | `GListStore` is a simple implementation of [iface@Gio.ListModel] that stores all items in memory. It provides insertions, deletions, and lookups in... |
| MemoryInputStream | InputStream | 0 | 0 | 5 | `GMemoryInputStream` is a class for using arbitrary memory chunks as input for GIO streaming input operations. As of GLib 2.34, `GMemoryInputStream... |
| MemoryOutputStream | OutputStream | 0 | 0 | 7 | `GMemoryOutputStream` is a class for using arbitrary memory chunks as output for GIO streaming output operations. As of GLib 2.34, `GMemoryOutputSt... |
| Menu | MenuModel | 0 | 0 | 16 | `GMenu` is a simple implementation of [class@Gio.MenuModel]. You populate a `GMenu` by adding [class@Gio.MenuItem] instances to it. There are some ... |
| MenuAttributeIter | GObject.Object | 0 | 0 | 4 | #GMenuAttributeIter is an opaque structure type. You must access it using the functions below. |
| MenuItem | GObject.Object | 0 | 0 | 17 | #GMenuItem is an opaque structure type. You must access it using the functions below. |
| MenuLinkIter | GObject.Object | 0 | 0 | 4 | #GMenuLinkIter is an opaque structure type. You must access it using the functions below. |
| MenuModel | GObject.Object | 2 | 1 | 8 | `GMenuModel` represents the contents of a menu ??? an ordered list of menu items. The items are associated with actions, which can be activated thr... |
| MountOperation | GObject.Object | 0 | 6 | 20 | `GMountOperation` provides a mechanism for interacting with the user. It can be used for authenticating mountable operations, such as loop mounting... |
| NativeSocketAddress | SocketAddress | 0 | 0 | 1 | A socket address of some unknown native type. This corresponds to a general `struct sockaddr` of a type not otherwise handled by GLib. |
| NativeVolumeMonitor | VolumeMonitor | 0 | 0 | 0 |  |
| NetworkAddress | GObject.Object | 0 | 0 | 7 | `GNetworkAddress` provides an easy way to resolve a hostname and then attempt to connect to that host, handling the possibility of multiple IP addr... |
| NetworkService | GObject.Object | 0 | 0 | 6 | Like [class@Gio.NetworkAddress] does with hostnames, `GNetworkService` provides an easy way to resolve a SRV record, and then attempt to connect to... |
| Notification | GObject.Object | 0 | 0 | 13 | `GNotification` is a mechanism for creating a notification to be shown to the user ??? typically as a pop-up notification presented by the desktop ... |
| OutputStream | GObject.Object | 4 | 0 | 31 | `GOutputStream` is a base class for implementing streaming output. It has functions to write to a stream ([method@Gio.OutputStream.write]), to clos... |
| Permission | GObject.Object | 1 | 0 | 10 | A `GPermission` represents the status of the caller???s permission to perform a certain action. You can query if the action is currently allowed an... |
| PropertyAction | GObject.Object | 0 | 0 | 1 | A `GPropertyAction` is a way to get a [iface@Gio.Action] with a state value reflecting and controlling the value of a [class@GObject.Object] proper... |
| ProxyAddress | InetSocketAddress | 0 | 0 | 8 | A [class@Gio.InetSocketAddress] representing a connection via a proxy server. |
| ProxyAddressEnumerator | SocketAddressEnumerator | 0 | 0 | 0 | `GProxyAddressEnumerator` is a wrapper around [class@Gio.SocketAddressEnumerator] which takes the [class@Gio.SocketAddress] instances returned by t... |
| Resolver | GObject.Object | 1 | 1 | 21 | The object that handles DNS resolution. Use [func@Gio.Resolver.get_default] to get the default resolver. `GResolver` provides cancellable synchrono... |
| Settings | GObject.Object | 0 | 4 | 51 | The `GSettings` class provides a convenient API for storing and retrieving application settings. Reads and writes can be considered to be non-block... |
| SettingsBackend | GObject.Object | 0 | 0 | 8 | The `GSettingsBackend` interface defines a generic interface for non-strictly-typed data that is stored in a hierarchy. To implement an alternative... |
| SimpleAction | GObject.Object | 0 | 2 | 5 | A `GSimpleAction` is the obvious simple implementation of the [iface@Gio.Action] interface. This is the easiest way to create an action for purpose... |
| SimpleActionGroup | GObject.Object | 0 | 0 | 5 | `GSimpleActionGroup` is a hash table filled with [iface@Gio.Action] objects, implementing the [iface@Gio.ActionGroup] and [iface@Gio.ActionMap] int... |
| SimpleAsyncResult | GObject.Object | 0 | 0 | 22 | As of GLib 2.46, `GSimpleAsyncResult` is deprecated in favor of [class@Gio.Task], which provides a simpler API. `GSimpleAsyncResult` implements [if... |
| SimpleIOStream | IOStream | 0 | 0 | 1 | `GSimpleIOStream` creates a [class@Gio.IOStream] from an arbitrary [class@Gio.InputStream] and [class@Gio.OutputStream]. This allows any pair of in... |
| SimplePermission | Permission | 0 | 0 | 1 | `GSimplePermission` is a trivial implementation of [class@Gio.Permission] that represents a permission that is either always or never allowed. The ... |
| SimpleProxyResolver | GObject.Object | 0 | 0 | 4 | `GSimpleProxyResolver` is a simple [iface@Gio.ProxyResolver] implementation that handles a single default proxy, multiple URI-scheme-specific proxi... |
| Socket | GObject.Object | 0 | 0 | 60 | A `GSocket` is a low-level networking primitive. It is a more or less direct mapping of the BSD socket API in a portable GObject based API. It supp... |
| SocketAddress | GObject.Object | 3 | 0 | 4 | `GSocketAddress` is the equivalent of `struct sockaddr`) and its subtypes in the BSD sockets API. This is an abstract class; use [class@Gio.InetSoc... |
| SocketAddressEnumerator | GObject.Object | 1 | 0 | 3 | `GSocketAddressEnumerator` is an enumerator type for [class@Gio.SocketAddress] instances. It is returned by enumeration functions such as [method@G... |
| SocketClient | GObject.Object | 0 | 1 | 32 | `GSocketClient` is a lightweight high-level utility class for connecting to a network host using a connection oriented socket type. You create a `G... |
| SocketConnection | IOStream | 2 | 0 | 9 | `GSocketConnection` is a [class@Gio.IOStream] for a connected socket. They can be created either by [class@Gio.SocketClient] when connecting to a h... |
| SocketControlMessage | GObject.Object | 2 | 0 | 5 | A `GSocketControlMessage` is a special-purpose utility message that can be sent to or received from a [class@Gio.Socket]. These types of messages a... |
| SocketListener | GObject.Object | 1 | 1 | 13 | A `GSocketListener` is an object that keeps track of a set of server sockets and helps you accept sockets from any of the socket, either sync or as... |
| SocketService | SocketListener | 1 | 1 | 4 | A `GSocketService` is an object that represents a service that is provided to the network or over local sockets. When a new connection is made to t... |
| Subprocess | GObject.Object | 0 | 0 | 26 | `GSubprocess` allows the creation of and interaction with child processes. Processes can be communicated with using standard GIO-style APIs (ie: [c... |
| SubprocessLauncher | GObject.Object | 0 | 0 | 18 | This class contains a set of options for launching child processes, such as where its standard input and output will be directed, the argument list... |
| Task | GObject.Object | 0 | 0 | 38 | A `GTask` represents and manages a cancellable ???task???. ## Asynchronous operations The most common usage of `GTask` is as a [iface@Gio.AsyncResu... |
| TcpConnection | SocketConnection | 1 | 0 | 2 | This is the subclass of [class@Gio.SocketConnection] that is created for TCP/IP sockets. |
| TcpWrapperConnection | TcpConnection | 0 | 0 | 2 | A `GTcpWrapperConnection` can be used to wrap a [class@Gio.IOStream] that is based on a [class@Gio.Socket], but which is not actually a [class@Gio.... |
| TestDBus | GObject.Object | 0 | 0 | 8 | A helper class for testing code which uses D-Bus without touching the user???s session bus. Note that `GTestDBus` modifies the user???s environment... |
| ThemedIcon | GObject.Object | 0 | 0 | 6 | `GThemedIcon` is an implementation of [iface@Gio.Icon] that supports icon themes. `GThemedIcon` contains a list of all of the icons present in an i... |
| ThreadedResolver | Resolver | 0 | 0 | 0 | #GThreadedResolver is an implementation of #GResolver which calls the libc lookup functions in threads to allow them to run asynchronously. |
| ThreadedSocketService | SocketService | 0 | 1 | 1 | A `GThreadedSocketService` is a simple subclass of [class@Gio.SocketService] that handles incoming connections by creating a worker thread and disp... |
| TlsCertificate | GObject.Object | 0 | 0 | 16 | A certificate used for TLS authentication and encryption. This can represent either a certificate only (eg, the certificate received by a client fr... |
| TlsConnection | IOStream | 0 | 1 | 23 | `GTlsConnection` is the base TLS connection class type, which wraps a [class@Gio.IOStream] and provides TLS encryption on top of it. Its subclasses... |
| TlsDatabase | GObject.Object | 0 | 0 | 13 | `GTlsDatabase` is used to look up certificates and other information from a certificate or key store. It is an abstract base class which TLS librar... |
| TlsInteraction | GObject.Object | 0 | 0 | 8 | `GTlsInteraction` provides a mechanism for the TLS connection and database code to interact with the user. It can be used to ask the user for passw... |
| TlsPassword | GObject.Object | 0 | 0 | 10 | An abstract interface representing a password used in TLS. Often used in user interaction such as unlocking a key storage token. |
| UnixConnection | SocketConnection | 0 | 0 | 8 | This is the subclass of [class@Gio.SocketConnection] that is created for UNIX domain sockets. It contains functions to do some of the UNIX socket s... |
| UnixCredentialsMessage | SocketControlMessage | 0 | 0 | 4 | This [class@Gio.SocketControlMessage] contains a [class@Gio.Credentials] instance. It may be sent using [method@Gio.Socket.send_message] and receiv... |
| UnixFDList | GObject.Object | 0 | 0 | 7 | A `GUnixFDList` contains a list of file descriptors. It owns the file descriptors that it contains, closing them when finalized. It may be wrapped ... |
| UnixFDMessage | SocketControlMessage | 0 | 0 | 5 | This [class@Gio.SocketControlMessage] contains a [class@Gio.UnixFDList]. It may be sent using [method@Gio.Socket.send_message] and received using [... |
| UnixInputStream | InputStream | 0 | 0 | 4 | `GUnixInputStream` implements [class@Gio.InputStream] for reading from a UNIX file descriptor, including asynchronous operations. (If the file desc... |
| UnixMountMonitor | GObject.Object | 0 | 2 | 3 | Watches #GUnixMounts for changes. |
| UnixOutputStream | OutputStream | 0 | 0 | 4 | `GUnixOutputStream` implements [class@Gio.OutputStream] for writing to a UNIX file descriptor, including asynchronous operations. (If the file desc... |
| UnixSocketAddress | SocketAddress | 0 | 0 | 8 | Support for UNIX-domain (also known as local) sockets, corresponding to `struct sockaddr_un`. UNIX domain sockets are generally visible in the file... |
| Vfs | GObject.Object | 0 | 0 | 9 | Entry point for using GIO functionality. |
| VolumeMonitor | GObject.Object | 1 | 12 | 7 | `GVolumeMonitor` is for listing the user interesting devices and volumes on the computer. In other words, what a file selector or file manager woul... |
| ZlibCompressor | GObject.Object | 0 | 0 | 3 | `GZlibCompressor` is an implementation of [iface@Gio.Converter] that compresses data using zlib. |
| ZlibDecompressor | GObject.Object | 0 | 0 | 2 | `GZlibDecompressor` is an implementation of [iface@Gio.Converter] that decompresses data compressed with zlib. |

### Gio.AppInfoMonitor

Parent: `GObject.Object` ?? GType: `GAppInfoMonitor` ?? C type: `GAppInfoMonitor`

`GAppInfoMonitor` monitors application information for changes. `GAppInfoMonitor` is a very simple object used for monitoring the app info database...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> AppInfoMonitor` | g_app_info_monitor_get | 2.40 | Gets the #GAppInfoMonitor for the current thread-default main context. The #GAppInfoMonitor will emit a "changed" signal in the thread-default main... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | first | 2.40 | Signal emitted when the app info database changes, when applications are installed or removed. |

### Gio.AppLaunchContext

Parent: `GObject.Object` ?? GType: `GAppLaunchContext` ?? C type: `GAppLaunchContext`

Integrating the launch with the launching application. This is used to handle for instance startup notification and launching the new application o...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | AppLaunchContextPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AppLaunchContext.new() -> AppLaunchContext` | g_app_launch_context_new |  | Creates a new application launch context. This is not normally used, instead you instantiate a subclass of this, such as #GdkAppLaunchContext. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_display | `AppLaunchContext.get_display(info: AppInfo, files: GLib.List) -> utf8` | g_app_launch_context_get_display |  | Gets the display string for the @context. This is used to ensure new applications are started on the same display as the launching application, by ... |
| get_environment | `AppLaunchContext.get_environment() -> filename` | g_app_launch_context_get_environment | 2.32 | Gets the complete environment variable list to be passed to the child process when @context is used to launch an application. This is a %NULL-termi... |
| get_startup_notify_id | `AppLaunchContext.get_startup_notify_id(info: AppInfo, files: GLib.List) -> utf8` | g_app_launch_context_get_startup_notify_id |  | Initiates startup notification for the application and returns the `XDG_ACTIVATION_TOKEN` or `DESKTOP_STARTUP_ID` for the launched operation, if su... |
| launch_failed | `AppLaunchContext.launch_failed(startup_notify_id: utf8) -> none` | g_app_launch_context_launch_failed |  | Called when an application has failed to launch, so that it can cancel the application startup notification started in g_app_launch_context_get_sta... |
| setenv | `AppLaunchContext.setenv(variable: filename, value: filename) -> none` | g_app_launch_context_setenv | 2.32 | Arranges for @variable to be set to @value in the child's environment when @context is used to launch an application. |
| unsetenv | `AppLaunchContext.unsetenv(variable: filename) -> none` | g_app_launch_context_unsetenv | 2.32 | Arranges for @variable to be unset in the child's environment when @context is used to launch an application. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| launch-failed | `startup_notify_id: utf8` | none | last | 2.36 | The #GAppLaunchContext::launch-failed signal is emitted when a #GAppInfo launch fails. The startup notification id is provided, so that the launche... |
| launch-started | `info: AppInfo, platform_data: GLib.Variant?` | none | last | 2.72 | The #GAppLaunchContext::launch-started signal is emitted when a #GAppInfo is about to be launched. If non-null the @platform_data is an GVariant di... |
| launched | `info: AppInfo, platform_data: GLib.Variant` | none | last | 2.36 | The #GAppLaunchContext::launched signal is emitted when a #GAppInfo is successfully launched. Because a launch operation may involve spawning multi... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_display | `get_display(info: AppInfo, files: GLib.List) -> utf8` |  |  | Gets the display string for the @context. This is used to ensure new applications are started on the same display as the launching application, by ... |
| get_startup_notify_id | `get_startup_notify_id(info: AppInfo, files: GLib.List) -> utf8` |  |  | Initiates startup notification for the application and returns the `XDG_ACTIVATION_TOKEN` or `DESKTOP_STARTUP_ID` for the launched operation, if su... |
| launch_failed | `launch_failed(startup_notify_id: utf8) -> none` |  |  | Called when an application has failed to launch, so that it can cancel the application startup notification started in g_app_launch_context_get_sta... |
| launch_started | `launch_started(info: AppInfo, platform_data: GLib.Variant) -> none` |  |  |  |
| launched | `launched(info: AppInfo, platform_data: GLib.Variant) -> none` |  |  |  |

### Gio.Application

Parent: `GObject.Object` ?? Implements: `ActionGroup`, `ActionMap` ?? GType: `GApplication` ?? C type: `GApplication`

`GApplication` is the core class for application support. A `GApplication` is the foundation of an application. It wraps some low-level platform-sp...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ApplicationPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Application.new(application_id: utf8?, flags: ApplicationFlags) -> Application` | g_application_new |  | Creates a new #GApplication instance. If non-%NULL, the application id must be valid. See g_application_id_is_valid(). If no application ID is give... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Application` | g_application_get_default | 2.32 | Returns the default #GApplication instance for this process. Normally there is only one #GApplication per process and it becomes the default when i... |
| id_is_valid | `id_is_valid(application_id: utf8) -> gboolean` | g_application_id_is_valid |  | Checks if @application_id is a valid application identifier. A valid ID is required for calls to g_application_new() and g_application_set_applicat... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `Application.activate() -> none` | g_application_activate | 2.28 | Activates the application. In essence, this results in the #GApplication::activate signal being emitted in the primary instance. The application mu... |
| add_main_option | `Application.add_main_option(long_name: utf8, short_name: gchar, flags: GLib.OptionFlags, arg: GLib.OptionArg, description: utf8, arg_description: utf8?) -> none` | g_application_add_main_option | 2.42 | Add an option to be handled by @application. Calling this function is the equivalent of calling g_application_add_main_option_entries() with a sing... |
| add_main_option_entries | `Application.add_main_option_entries(entries: GLib.OptionEntry) -> none` | g_application_add_main_option_entries | 2.40 | Adds main option entries to be handled by @application. This function is comparable to g_option_context_add_main_entries(). After the commandline a... |
| add_option_group | `Application.add_option_group(group: GLib.OptionGroup) -> none` | g_application_add_option_group | 2.40 | Adds a #GOptionGroup to the commandline handling of @application. This function is comparable to g_option_context_add_group(). Unlike g_application... |
| bind_busy_property | `Application.bind_busy_property(object: GObject.Object, property: utf8) -> none` | g_application_bind_busy_property | 2.44 | Marks @application as busy (see g_application_mark_busy()) while @property on @object is %TRUE. The binding holds a reference to @application while... |
| get_application_id | `Application.get_application_id() -> utf8` | g_application_get_application_id | 2.28 | Gets the unique identifier for @application. |
| get_dbus_connection | `Application.get_dbus_connection() -> DBusConnection` | g_application_get_dbus_connection | 2.34 | Gets the #GDBusConnection being used by the application, or %NULL. If #GApplication is using its D-Bus backend then this function will return the #... |
| get_dbus_object_path | `Application.get_dbus_object_path() -> utf8` | g_application_get_dbus_object_path | 2.34 | Gets the D-Bus object path being used by the application, or %NULL. If #GApplication is using its D-Bus backend then this function will return the ... |
| get_flags | `Application.get_flags() -> ApplicationFlags` | g_application_get_flags | 2.28 | Gets the flags for @application. See #GApplicationFlags. |
| get_inactivity_timeout | `Application.get_inactivity_timeout() -> guint` | g_application_get_inactivity_timeout | 2.28 | Gets the current inactivity timeout for the application. This is the amount of time (in milliseconds) after the last call to g_application_release(... |
| get_is_busy | `Application.get_is_busy() -> gboolean` | g_application_get_is_busy | 2.44 | Gets the application's current busy state, as set through g_application_mark_busy() or g_application_bind_busy_property(). |
| get_is_registered | `Application.get_is_registered() -> gboolean` | g_application_get_is_registered | 2.28 | Checks if @application is registered. An application is registered if g_application_register() has been successfully called. |
| get_is_remote | `Application.get_is_remote() -> gboolean` | g_application_get_is_remote | 2.28 | Checks if @application is remote. If @application is remote then it means that another instance of application already exists (the 'primary' instan... |
| get_resource_base_path | `Application.get_resource_base_path() -> utf8` | g_application_get_resource_base_path | 2.42 | Gets the resource base path of @application. See g_application_set_resource_base_path() for more information. |
| get_version | `Application.get_version() -> utf8` | g_application_get_version | 2.80 | Gets the version of @application. |
| hold | `Application.hold() -> none` | g_application_hold |  | Increases the use count of @application. Use this function to indicate that the application has a reason to continue to run. For example, g_applica... |
| mark_busy | `Application.mark_busy() -> none` | g_application_mark_busy | 2.38 | Increases the busy count of @application. Use this function to indicate that the application is busy, for instance while a long running operation i... |
| open | `Application.open(files: File, n_files: gint, hint: utf8) -> none` | g_application_open | 2.28 | Opens the given files. In essence, this results in the #GApplication::open signal being emitted in the primary instance. @n_files must be greater t... |
| quit | `Application.quit() -> none` | g_application_quit | 2.32 | Immediately quits the application. Upon return to the mainloop, g_application_run() will return, calling only the 'shutdown' function before doing ... |
| register | `Application.register(cancellable: Cancellable?) -> gboolean throws` | g_application_register | 2.28 | Attempts registration of the application. This is the point at which the application discovers if it is the primary instance or merely acting as a ... |
| release | `Application.release() -> none` | g_application_release |  | Decrease the use count of @application. When the use count reaches zero, the application will stop running. Never call this function except to canc... |
| run | `Application.run(argc: gint, argv: filename?) -> gint` | g_application_run | 2.28 | Runs the application. This function is intended to be run from main() and its return value is intended to be returned by main(). Although you are e... |
| send_notification | `Application.send_notification(id: utf8?, notification: Notification) -> none` | g_application_send_notification | 2.40 | Sends a notification on behalf of @application to the desktop shell. There is no guarantee that the notification is displayed immediately, or even ... |
| set_action_group | `Application.set_action_group(action_group: ActionGroup?) -> none` | g_application_set_action_group | 2.28 | This used to be how actions were associated with a #GApplication. Now there is #GActionMap for that. |
| set_application_id | `Application.set_application_id(application_id: utf8?) -> none` | g_application_set_application_id | 2.28 | Sets the unique identifier for @application. The application id can only be modified if @application has not yet been registered. If non-%NULL, the... |
| set_default | `Application.set_default() -> none` | g_application_set_default | 2.32 | Sets or unsets the default application for the process, as returned by g_application_get_default(). This function does not take its own reference o... |
| set_flags | `Application.set_flags(flags: ApplicationFlags) -> none` | g_application_set_flags | 2.28 | Sets the flags for @application. The flags can only be modified if @application has not yet been registered. See #GApplicationFlags. |
| set_inactivity_timeout | `Application.set_inactivity_timeout(inactivity_timeout: guint) -> none` | g_application_set_inactivity_timeout | 2.28 | Sets the current inactivity timeout for the application. This is the amount of time (in milliseconds) after the last call to g_application_release(... |
| set_option_context_description | `Application.set_option_context_description(description: utf8?) -> none` | g_application_set_option_context_description | 2.56 | Adds a description to the @application option context. See g_option_context_set_description() for more information. |
| set_option_context_parameter_string | `Application.set_option_context_parameter_string(parameter_string: utf8?) -> none` | g_application_set_option_context_parameter_string | 2.56 | Sets the parameter string to be used by the commandline handling of @application. This function registers the argument to be passed to g_option_con... |
| set_option_context_summary | `Application.set_option_context_summary(summary: utf8?) -> none` | g_application_set_option_context_summary | 2.56 | Adds a summary to the @application option context. See g_option_context_set_summary() for more information. |
| set_resource_base_path | `Application.set_resource_base_path(resource_path: utf8?) -> none` | g_application_set_resource_base_path | 2.42 | Sets (or unsets) the base resource path of @application. The path is used to automatically load various [application resources][gresource] such as ... |
| set_version | `Application.set_version(version: utf8) -> none` | g_application_set_version | 2.80 | Sets the version number of @application. This will be used to implement a `--version` command line argument The application version can only be mod... |
| unbind_busy_property | `Application.unbind_busy_property(object: GObject.Object, property: utf8) -> none` | g_application_unbind_busy_property | 2.44 | Destroys a binding between @property and the busy state of @application that was previously created with g_application_bind_busy_property(). |
| unmark_busy | `Application.unmark_busy() -> none` | g_application_unmark_busy | 2.38 | Decreases the busy count of @application. When the busy count reaches zero, the new state will be propagated to other processes. This function must... |
| withdraw_notification | `Application.withdraw_notification(id: utf8) -> none` | g_application_withdraw_notification | 2.40 | Withdraws a notification that was sent with g_application_send_notification(). This call does nothing if a notification with @id doesn't exist or t... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| action-group | ActionGroup | write | The group of actions that the application exports. |
| application-id | utf8 | read, write | The unique identifier for the application. |
| flags | ApplicationFlags | read, write | Flags specifying the behaviour of the application. |
| inactivity-timeout | guint | read, write | Time (in milliseconds) to stay alive after becoming idle. |
| is-busy | gboolean | read | Whether the application is currently marked as busy through g_application_mark_busy() or g_application_bind_busy_property(). |
| is-registered | gboolean | read | Whether [method@Gio.Application.register] has been called. |
| is-remote | gboolean | read | Whether this application instance is remote. |
| resource-base-path | utf8 | read, write | The base resource path for the application. |
| version | utf8 | read, write | The human-readable version number of the application. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| activate | `` | none | last |  | The ::activate signal is emitted on the primary instance when an activation occurs. See g_application_activate(). |
| command-line | `command_line: ApplicationCommandLine` | gint | last |  | The ::command-line signal is emitted on the primary instance when a commandline is not handled locally. See g_application_run() and the #GApplicati... |
| handle-local-options | `options: GLib.VariantDict` | gint | last | 2.40 | The ::handle-local-options signal is emitted on the local instance after the parsing of the commandline options has occurred. You can add options t... |
| name-lost | `` | gboolean | last | 2.60 | The ::name-lost signal is emitted only on the registered primary instance when a new instance has taken over. This can only happen if the applicati... |
| open | `files: File, n_files: gint, hint: utf8` | none | last |  | The ::open signal is emitted on the primary instance when there are files to open. See g_application_open() for more information. |
| shutdown | `` | none | last |  | The ::shutdown signal is emitted only on the registered primary instance immediately after the main loop terminates. |
| startup | `` | none | first |  | The ::startup signal is emitted on the primary instance immediately after registration. See g_application_register(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `activate() -> none` |  | 2.28 | Activates the application. In essence, this results in the #GApplication::activate signal being emitted in the primary instance. The application mu... |
| add_platform_data | `add_platform_data(builder: GLib.VariantBuilder) -> none` |  |  | invoked (locally) to add 'platform data' to be sent to the primary instance when activating, opening or invoking actions |
| after_emit | `after_emit(platform_data: GLib.Variant) -> none` |  |  | invoked on the primary instance after 'activate', 'open', 'command-line' or any action invocation, gets the 'platform data' from the calling instance |
| before_emit | `before_emit(platform_data: GLib.Variant) -> none` |  |  | invoked on the primary instance before 'activate', 'open', 'command-line' or any action invocation, gets the 'platform data' from the calling instance |
| command_line | `command_line(command_line: ApplicationCommandLine) -> gint` |  |  | invoked on the primary instance when a command-line is not handled locally |
| dbus_register | `dbus_register(connection: DBusConnection, object_path: utf8) -> gboolean throws` |  |  | invoked locally during registration, if the application is using its D-Bus backend. You can use this to export extra objects on the bus, that need ... |
| dbus_unregister | `dbus_unregister(connection: DBusConnection, object_path: utf8) -> none` |  |  | invoked locally during unregistration, if the application is using its D-Bus backend. Use this to undo anything done by the @dbus_register vfunc. S... |
| handle_local_options | `handle_local_options(options: GLib.VariantDict) -> gint` |  |  | invoked locally after the parsing of the commandline options has occurred. Since: 2.40 |
| local_command_line | `local_command_line(arguments: inout utf8, exit_status: out gint) -> gboolean` |  |  | This virtual function is always invoked in the local instance. It gets passed a pointer to a %NULL-terminated copy of @argv and is expected to remo... |
| name_lost | `name_lost() -> gboolean` |  |  | invoked when another instance is taking over the name. Since: 2.60 |
| open | `open(files: File, n_files: gint, hint: utf8) -> none` |  | 2.28 | Opens the given files. In essence, this results in the #GApplication::open signal being emitted in the primary instance. @n_files must be greater t... |
| quit_mainloop | `quit_mainloop() -> none` |  |  | Used to be invoked on the primary instance when the use count of the application drops to zero (and after any inactivity timeout, if requested). No... |
| run_mainloop | `run_mainloop() -> none` |  |  | Used to be invoked on the primary instance from g_application_run() if the use-count is non-zero. Since 2.32, GApplication is iterating the main co... |
| shutdown | `shutdown() -> none` |  |  | invoked only on the registered primary instance immediately after the main loop terminates |
| startup | `startup() -> none` |  |  | invoked on the primary instance immediately after registration |

### Gio.ApplicationCommandLine

Parent: `GObject.Object` ?? GType: `GApplicationCommandLine` ?? C type: `GApplicationCommandLine`

`GApplicationCommandLine` represents a command-line invocation of an application. It is created by [class@Gio.Application] and emitted in the [sign...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ApplicationCommandLinePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_file_for_arg | `ApplicationCommandLine.create_file_for_arg(arg: filename) -> File` | g_application_command_line_create_file_for_arg | 2.36 | Creates a #GFile corresponding to a filename that was given as part of the invocation of @cmdline. This differs from g_file_new_for_commandline_arg... |
| done | `ApplicationCommandLine.done() -> none` | g_application_command_line_done | 2.80 | Signals that command line processing is completed. For remote invocation, it causes the invoking process to terminate. For local invocation, it doe... |
| get_arguments | `ApplicationCommandLine.get_arguments(argc: out gint?) -> filename` | g_application_command_line_get_arguments | 2.28 | Gets the list of arguments that was passed on the command line. The strings in the array may contain non-UTF-8 data on UNIX (such as filenames or a... |
| get_cwd | `ApplicationCommandLine.get_cwd() -> filename` | g_application_command_line_get_cwd | 2.28 | Gets the working directory of the command line invocation. The string may contain non-utf8 data. It is possible that the remote application did not... |
| get_environ | `ApplicationCommandLine.get_environ() -> filename` | g_application_command_line_get_environ | 2.28 | Gets the contents of the 'environ' variable of the command line invocation, as would be returned by g_get_environ(), ie as a %NULL-terminated list ... |
| get_exit_status | `ApplicationCommandLine.get_exit_status() -> gint` | g_application_command_line_get_exit_status | 2.28 | Gets the exit status of @cmdline. See g_application_command_line_set_exit_status() for more information. |
| get_is_remote | `ApplicationCommandLine.get_is_remote() -> gboolean` | g_application_command_line_get_is_remote | 2.28 | Determines if @cmdline represents a remote invocation. |
| get_options_dict | `ApplicationCommandLine.get_options_dict() -> GLib.VariantDict` | g_application_command_line_get_options_dict | 2.40 | Gets the options that were passed to g_application_command_line(). If you did not override local_command_line() then these are the same options tha... |
| get_platform_data | `ApplicationCommandLine.get_platform_data() -> GLib.Variant` | g_application_command_line_get_platform_data | 2.28 | Gets the platform data associated with the invocation of @cmdline. This is a #GVariant dictionary containing information about the context in which... |
| get_stdin | `ApplicationCommandLine.get_stdin() -> InputStream` | g_application_command_line_get_stdin | 2.34 | Gets the stdin of the invoking process. The #GInputStream can be used to read data passed to the standard input of the invoking process. This doesn... |
| getenv | `ApplicationCommandLine.getenv(name: filename) -> utf8` | g_application_command_line_getenv | 2.28 | Gets the value of a particular environment variable of the command line invocation, as would be returned by g_getenv(). The strings may contain non... |
| print | `ApplicationCommandLine.print(format: utf8, ...: void) -> none` | g_application_command_line_print | 2.28 | Formats a message and prints it using the stdout print handler in the invoking process. If @cmdline is a local invocation then this is exactly equi... |
| print_literal | `ApplicationCommandLine.print_literal(message: utf8) -> none` | g_application_command_line_print_literal | 2.80 | Prints a message using the stdout print handler in the invoking process. Unlike g_application_command_line_print(), @message is not a `printf()`-st... |
| printerr | `ApplicationCommandLine.printerr(format: utf8, ...: void) -> none` | g_application_command_line_printerr | 2.28 | Formats a message and prints it using the stderr print handler in the invoking process. If @cmdline is a local invocation then this is exactly equi... |
| printerr_literal | `ApplicationCommandLine.printerr_literal(message: utf8) -> none` | g_application_command_line_printerr_literal | 2.80 | Prints a message using the stderr print handler in the invoking process. Unlike g_application_command_line_printerr(), @message is not a `printf()`... |
| set_exit_status | `ApplicationCommandLine.set_exit_status(exit_status: gint) -> none` | g_application_command_line_set_exit_status | 2.28 | Sets the exit status that will be used when the invoking process exits. The return value of the #GApplication::command-line signal is passed to thi... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| arguments | GLib.Variant | write, construct-only | The commandline that caused this [signal@Gio.Application::command-line] signal emission. |
| is-remote | gboolean | read | Whether this is a remote commandline. |
| options | GLib.Variant | write, construct-only | The options sent along with the commandline. |
| platform-data | GLib.Variant | write, construct-only | Platform-specific data for the commandline. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| done | `done() -> none` |  | 2.80 | Signals that command line processing is completed. For remote invocation, it causes the invoking process to terminate. For local invocation, it doe... |
| get_stdin | `get_stdin() -> InputStream` |  | 2.34 | Gets the stdin of the invoking process. The #GInputStream can be used to read data passed to the standard input of the invoking process. This doesn... |
| print_literal | `print_literal(message: utf8) -> none` |  | 2.80 | Prints a message using the stdout print handler in the invoking process. Unlike g_application_command_line_print(), @message is not a `printf()`-st... |
| printerr_literal | `printerr_literal(message: utf8) -> none` |  | 2.80 | Prints a message using the stderr print handler in the invoking process. Unlike g_application_command_line_printerr(), @message is not a `printf()`... |

### Gio.BufferedInputStream

Parent: `FilterInputStream` ?? Subclasses: `DataInputStream` ?? Implements: `Seekable` ?? GType: `GBufferedInputStream` ?? C type: `GBufferedInputStream`

Buffered input stream implements #GFilterInputStream and provides for buffered reads. By default, `GBufferedInputStream`'s buffer size is set at 4 ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | FilterInputStream |
| priv | BufferedInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BufferedInputStream.new(base_stream: InputStream) -> InputStream` | g_buffered_input_stream_new |  | Creates a new #GInputStream from the given @base_stream, with a buffer set to the default size (4 kilobytes). |
| new_sized | `BufferedInputStream.new_sized(base_stream: InputStream, size: gsize) -> InputStream` | g_buffered_input_stream_new_sized |  | Creates a new #GBufferedInputStream from the given @base_stream, with a buffer set to @size. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fill | `BufferedInputStream.fill(count: gssize, cancellable: Cancellable?) -> gssize throws` | g_buffered_input_stream_fill |  | Tries to read @count bytes from the stream into the buffer. Will block during this read. If @count is zero, returns zero and does nothing. A value ... |
| fill_async | `BufferedInputStream.fill_async(count: gssize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_buffered_input_stream_fill_async |  | Reads data into @stream's buffer asynchronously, up to @count size. @io_priority can be used to prioritize reads. For the synchronous version of th... |
| fill_finish | `BufferedInputStream.fill_finish(result: AsyncResult) -> gssize throws` | g_buffered_input_stream_fill_finish |  | Finishes an asynchronous read. |
| get_available | `BufferedInputStream.get_available() -> gsize` | g_buffered_input_stream_get_available |  | Gets the size of the available data within the stream. |
| get_buffer_size | `BufferedInputStream.get_buffer_size() -> gsize` | g_buffered_input_stream_get_buffer_size |  | Gets the size of the input buffer. |
| peek | `BufferedInputStream.peek(buffer: guint8, offset: gsize, count: gsize) -> gsize` | g_buffered_input_stream_peek |  | Peeks in the buffer, copying data of size @count into @buffer, offset @offset bytes. |
| peek_buffer | `BufferedInputStream.peek_buffer(count: out gsize) -> guint8` | g_buffered_input_stream_peek_buffer |  | Returns the buffer with the currently available bytes. The returned buffer must not be modified and will become invalid when reading from the strea... |
| read_byte | `BufferedInputStream.read_byte(cancellable: Cancellable?) -> gint throws` | g_buffered_input_stream_read_byte |  | Tries to read a single byte from the stream or the buffer. Will block during this read. On success, the byte read from the stream is returned. On e... |
| set_buffer_size | `BufferedInputStream.set_buffer_size(size: gsize) -> none` | g_buffered_input_stream_set_buffer_size |  | Sets the size of the internal buffer of @stream to @size, or to the size of the contents of the buffer. The buffer can never be resized smaller tha... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| buffer-size | guint | read, write | The size of the backend buffer, in bytes. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fill | `fill(count: gssize, cancellable: Cancellable?) -> gssize throws` |  |  | Tries to read @count bytes from the stream into the buffer. Will block during this read. If @count is zero, returns zero and does nothing. A value ... |
| fill_async | `fill_async(count: gssize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Reads data into @stream's buffer asynchronously, up to @count size. @io_priority can be used to prioritize reads. For the synchronous version of th... |
| fill_finish | `fill_finish(result: AsyncResult) -> gssize throws` |  |  | Finishes an asynchronous read. |

### Gio.BufferedOutputStream

Parent: `FilterOutputStream` ?? Implements: `Seekable` ?? GType: `GBufferedOutputStream` ?? C type: `GBufferedOutputStream`

Buffered output stream implements [class@Gio.FilterOutputStream] and provides for buffered writes. By default, `GBufferedOutputStream`'s buffer siz...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | FilterOutputStream |
| priv | BufferedOutputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BufferedOutputStream.new(base_stream: OutputStream) -> OutputStream` | g_buffered_output_stream_new |  | Creates a new buffered output stream for a base stream. |
| new_sized | `BufferedOutputStream.new_sized(base_stream: OutputStream, size: gsize) -> OutputStream` | g_buffered_output_stream_new_sized |  | Creates a new buffered output stream with a given buffer size. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_auto_grow | `BufferedOutputStream.get_auto_grow() -> gboolean` | g_buffered_output_stream_get_auto_grow |  | Checks if the buffer automatically grows as data is added. |
| get_buffer_size | `BufferedOutputStream.get_buffer_size() -> gsize` | g_buffered_output_stream_get_buffer_size |  | Gets the size of the buffer in the @stream. |
| set_auto_grow | `BufferedOutputStream.set_auto_grow(auto_grow: gboolean) -> none` | g_buffered_output_stream_set_auto_grow |  | Sets whether or not the @stream's buffer should automatically grow. If @auto_grow is true, then each write will just make the buffer larger, and yo... |
| set_buffer_size | `BufferedOutputStream.set_buffer_size(size: gsize) -> none` | g_buffered_output_stream_set_buffer_size |  | Sets the size of the internal buffer to @size. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auto-grow | gboolean | read, write | Whether the buffer should automatically grow. |
| buffer-size | guint | read, write | The size of the backend buffer, in bytes. |

### Gio.BytesIcon

Parent: `GObject.Object` ?? Implements: `Icon`, `LoadableIcon` ?? GType: `GBytesIcon` ?? C type: `GBytesIcon`

`GBytesIcon` specifies an image held in memory in a common format (usually PNG) to be used as icon.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BytesIcon.new(bytes: GLib.Bytes) -> BytesIcon` | g_bytes_icon_new | 2.38 | Creates a new icon for a bytes. This cannot fail, but loading and interpreting the bytes may fail later on (for example, if g_loadable_icon_load() ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_bytes | `BytesIcon.get_bytes() -> GLib.Bytes` | g_bytes_icon_get_bytes | 2.38 | Gets the #GBytes associated with the given @icon. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| bytes | GLib.Bytes | read, write, construct-only | The bytes containing the icon. |

### Gio.Cancellable

Parent: `GObject.Object` ?? GType: `GCancellable` ?? C type: `GCancellable`

`GCancellable` allows operations to be cancelled. `GCancellable` is a thread-safe operation cancellation stack used throughout GIO to allow for can...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | CancellablePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Cancellable.new() -> Cancellable` | g_cancellable_new |  | Creates a new #GCancellable object. Applications that want to start one or more operations that should be cancellable should create a #GCancellable... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current | `get_current() -> Cancellable` | g_cancellable_get_current |  | Gets the top cancellable from the stack. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel | `Cancellable.cancel() -> none` | g_cancellable_cancel |  | Will set @cancellable to cancelled, and will emit the #GCancellable::cancelled signal. (However, see the warning about race conditions in the docum... |
| connect | `Cancellable.connect(callback: GObject.Callback, data: gpointer?, data_destroy_func: GLib.DestroyNotify?) -> gulong` | g_cancellable_connect | 2.22 | Convenience function to connect to the #GCancellable::cancelled signal. Also handles the race condition that may happen if the cancellable is cance... |
| disconnect | `Cancellable.disconnect(handler_id: gulong) -> none` | g_cancellable_disconnect | 2.22 | Disconnects a handler from a cancellable instance similar to g_signal_handler_disconnect(). Additionally, in the event that a signal handler is cur... |
| get_fd | `Cancellable.get_fd() -> gint` | g_cancellable_get_fd |  | Gets the file descriptor for a cancellable job. This can be used to implement cancellable operations on Unix systems. The returned fd will turn rea... |
| is_cancelled | `Cancellable.is_cancelled() -> gboolean` | g_cancellable_is_cancelled |  | Checks if a cancellable job has been cancelled. |
| make_pollfd | `Cancellable.make_pollfd(pollfd: GLib.PollFD) -> gboolean` | g_cancellable_make_pollfd | 2.22 | Creates a #GPollFD corresponding to @cancellable; this can be passed to g_poll() and used to poll for cancellation. This is useful both for unix sy... |
| pop_current | `Cancellable.pop_current() -> none` | g_cancellable_pop_current |  | Pops @cancellable off the cancellable stack (verifying that @cancellable is on the top of the stack). |
| push_current | `Cancellable.push_current() -> none` | g_cancellable_push_current |  | Pushes @cancellable onto the cancellable stack. The current cancellable can then be received using g_cancellable_get_current(). This is useful when... |
| release_fd | `Cancellable.release_fd() -> none` | g_cancellable_release_fd | 2.22 | Releases a resources previously allocated by g_cancellable_get_fd() or g_cancellable_make_pollfd(). For compatibility reasons with older releases, ... |
| reset | `Cancellable.reset() -> none` | g_cancellable_reset |  | Resets @cancellable to its uncancelled state. If cancellable is currently in use by any cancellable operation then the behavior of this function is... |
| set_error_if_cancelled | `Cancellable.set_error_if_cancelled() -> gboolean throws` | g_cancellable_set_error_if_cancelled |  | If the @cancellable is cancelled, sets the error to notify that the operation was cancelled. |
| source_new | `Cancellable.source_new() -> GLib.Source` | g_cancellable_source_new | 2.28 | Creates a source that triggers if @cancellable is cancelled and calls its callback of type #GCancellableSourceFunc. This is primarily useful for at... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| cancelled | `` | none | last |  | Emitted when the operation has been cancelled. Can be used by implementations of cancellable operations. If the operation is cancelled from another... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancelled | `cancelled() -> none` |  |  |  |

### Gio.CharsetConverter

Parent: `GObject.Object` ?? Implements: `Converter`, `Initable` ?? GType: `GCharsetConverter` ?? C type: `GCharsetConverter`

`GCharsetConverter` is an implementation of [iface@Gio.Converter] based on [struct@GLib.IConv].

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CharsetConverter.new(to_charset: utf8, from_charset: utf8) -> CharsetConverter throws` | g_charset_converter_new | 2.24 | Creates a new #GCharsetConverter. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_num_fallbacks | `CharsetConverter.get_num_fallbacks() -> guint` | g_charset_converter_get_num_fallbacks | 2.24 | Gets the number of fallbacks that @converter has applied so far. |
| get_use_fallback | `CharsetConverter.get_use_fallback() -> gboolean` | g_charset_converter_get_use_fallback | 2.24 | Gets the #GCharsetConverter:use-fallback property. |
| set_use_fallback | `CharsetConverter.set_use_fallback(use_fallback: gboolean) -> none` | g_charset_converter_set_use_fallback | 2.24 | Sets the #GCharsetConverter:use-fallback property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| from-charset | utf8 | read, write, construct-only | The character encoding to convert from. |
| to-charset | utf8 | read, write, construct-only | The character encoding to convert to. |
| use-fallback | gboolean | read, write | Use fallback (of form `\<hexval>`) for invalid bytes. |

### Gio.ConverterInputStream

Parent: `FilterInputStream` ?? Implements: `PollableInputStream` ?? GType: `GConverterInputStream` ?? C type: `GConverterInputStream`

Converter input stream implements [class@Gio.InputStream] and allows conversion of data of various types during reading. As of GLib 2.34, `GConvert...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | FilterInputStream |
| priv | ConverterInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ConverterInputStream.new(base_stream: InputStream, converter: Converter) -> InputStream` | g_converter_input_stream_new |  | Creates a new converter input stream for the @base_stream. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_converter | `ConverterInputStream.get_converter() -> Converter` | g_converter_input_stream_get_converter | 2.24 | Gets the #GConverter that is used by @converter_stream. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| converter | Converter | read, write, construct-only | The converter object. |

### Gio.ConverterOutputStream

Parent: `FilterOutputStream` ?? Implements: `PollableOutputStream` ?? GType: `GConverterOutputStream` ?? C type: `GConverterOutputStream`

Converter output stream implements [class@Gio.OutputStream] and allows conversion of data of various types during reading. As of GLib 2.34, `GConve...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | FilterOutputStream |
| priv | ConverterOutputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ConverterOutputStream.new(base_stream: OutputStream, converter: Converter) -> OutputStream` | g_converter_output_stream_new |  | Creates a new converter output stream for the @base_stream. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_converter | `ConverterOutputStream.get_converter() -> Converter` | g_converter_output_stream_get_converter | 2.24 | Gets the #GConverter that is used by @converter_stream. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| converter | Converter | read, write, construct-only | The converter object. |

### Gio.Credentials

Parent: `GObject.Object` ?? GType: `GCredentials` ?? C type: `GCredentials`

The `GCredentials` type is a reference-counted wrapper for native credentials. The information in `GCredentials` is typically used for identifying,...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Credentials.new() -> Credentials` | g_credentials_new | 2.26 | Creates a new #GCredentials object with credentials matching the the current process. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_native | `Credentials.get_native(native_type: CredentialsType) -> gpointer` | g_credentials_get_native | 2.26 | Gets a pointer to native credentials of type @native_type from @credentials. It is a programming error (which will cause a warning to be logged) to... |
| get_unix_pid | `Credentials.get_unix_pid() -> gint throws` | g_credentials_get_unix_pid | 2.36 | Tries to get the UNIX process identifier from @credentials. This method is only available on UNIX platforms. This operation can fail if #GCredentia... |
| get_unix_user | `Credentials.get_unix_user() -> guint throws` | g_credentials_get_unix_user | 2.26 | Tries to get the UNIX user identifier from @credentials. This method is only available on UNIX platforms. This operation can fail if #GCredentials ... |
| is_same_user | `Credentials.is_same_user(other_credentials: Credentials) -> gboolean throws` | g_credentials_is_same_user | 2.26 | Checks if @credentials and @other_credentials is the same user. This operation can fail if #GCredentials is not supported on the the OS. |
| set_native | `Credentials.set_native(native_type: CredentialsType, native: gpointer) -> none` | g_credentials_set_native | 2.26 | Copies the native credentials of type @native_type from @native into @credentials. It is a programming error (which will cause a warning to be logg... |
| set_unix_user | `Credentials.set_unix_user(uid: guint) -> gboolean throws` | g_credentials_set_unix_user | 2.26 | Tries to set the UNIX user identifier on @credentials. This method is only available on UNIX platforms. This operation can fail if #GCredentials is... |
| to_string | `Credentials.to_string() -> utf8` | g_credentials_to_string | 2.26 | Creates a human-readable textual representation of @credentials that can be used in logging and debug messages. The format of the returned string m... |

### Gio.DataInputStream

Parent: `BufferedInputStream` ?? Implements: `Seekable` ?? GType: `GDataInputStream` ?? C type: `GDataInputStream`

Data input stream implements [class@Gio.InputStream] and includes functions for reading structured data directly from a binary input stream.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | BufferedInputStream |
| priv | DataInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DataInputStream.new(base_stream: InputStream) -> DataInputStream` | g_data_input_stream_new |  | Creates a new data input stream for the @base_stream. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_byte_order | `DataInputStream.get_byte_order() -> DataStreamByteOrder` | g_data_input_stream_get_byte_order |  | Gets the byte order for the data input stream. |
| get_newline_type | `DataInputStream.get_newline_type() -> DataStreamNewlineType` | g_data_input_stream_get_newline_type |  | Gets the current newline type for the @stream. |
| read_byte | `DataInputStream.read_byte(cancellable: Cancellable?) -> guint8 throws` | g_data_input_stream_read_byte |  | Reads an unsigned 8-bit/1-byte value from @stream. |
| read_int16 | `DataInputStream.read_int16(cancellable: Cancellable?) -> gint16 throws` | g_data_input_stream_read_int16 |  | Reads a 16-bit/2-byte value from @stream. In order to get the correct byte order for this read operation, see g_data_input_stream_get_byte_order() ... |
| read_int32 | `DataInputStream.read_int32(cancellable: Cancellable?) -> gint32 throws` | g_data_input_stream_read_int32 |  | Reads a signed 32-bit/4-byte value from @stream. In order to get the correct byte order for this read operation, see g_data_input_stream_get_byte_o... |
| read_int64 | `DataInputStream.read_int64(cancellable: Cancellable?) -> gint64 throws` | g_data_input_stream_read_int64 |  | Reads a 64-bit/8-byte value from @stream. In order to get the correct byte order for this read operation, see g_data_input_stream_get_byte_order() ... |
| read_line | `DataInputStream.read_line(length: out gsize?, cancellable: Cancellable?) -> guint8 throws` | g_data_input_stream_read_line |  | Reads a line from the data input stream. Note that no encoding checks or conversion is performed; the input is not guaranteed to be UTF-8, and may ... |
| read_line_async | `DataInputStream.read_line_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_data_input_stream_read_line_async | 2.20 | The asynchronous version of g_data_input_stream_read_line(). It is an error to have two outstanding calls to this function. When the operation is f... |
| read_line_finish | `DataInputStream.read_line_finish(result: AsyncResult, length: out gsize?) -> guint8 throws` | g_data_input_stream_read_line_finish | 2.20 | Finish an asynchronous call started by g_data_input_stream_read_line_async(). Note the warning about string encoding in g_data_input_stream_read_li... |
| read_line_finish_utf8 | `DataInputStream.read_line_finish_utf8(result: AsyncResult, length: out gsize?) -> utf8 throws` | g_data_input_stream_read_line_finish_utf8 | 2.30 | Finish an asynchronous call started by g_data_input_stream_read_line_async(). |
| read_line_utf8 | `DataInputStream.read_line_utf8(length: out gsize?, cancellable: Cancellable?) -> utf8 throws` | g_data_input_stream_read_line_utf8 | 2.30 | Reads a UTF-8 encoded line from the data input stream. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancella... |
| read_uint16 | `DataInputStream.read_uint16(cancellable: Cancellable?) -> guint16 throws` | g_data_input_stream_read_uint16 |  | Reads an unsigned 16-bit/2-byte value from @stream. In order to get the correct byte order for this read operation, see g_data_input_stream_get_byt... |
| read_uint32 | `DataInputStream.read_uint32(cancellable: Cancellable?) -> guint32 throws` | g_data_input_stream_read_uint32 |  | Reads an unsigned 32-bit/4-byte value from @stream. In order to get the correct byte order for this read operation, see g_data_input_stream_get_byt... |
| read_uint64 | `DataInputStream.read_uint64(cancellable: Cancellable?) -> guint64 throws` | g_data_input_stream_read_uint64 |  | Reads an unsigned 64-bit/8-byte value from @stream. In order to get the correct byte order for this read operation, see g_data_input_stream_get_byt... |
| read_until | `DataInputStream.read_until(stop_chars: utf8, length: out gsize?, cancellable: Cancellable?) -> utf8 throws` | g_data_input_stream_read_until |  | Reads a string from the data input stream, up to the first occurrence of any of the stop characters. Note that, in contrast to g_data_input_stream_... |
| read_until_async | `DataInputStream.read_until_async(stop_chars: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_data_input_stream_read_until_async | 2.20 | The asynchronous version of g_data_input_stream_read_until(). It is an error to have two outstanding calls to this function. Note that, in contrast... |
| read_until_finish | `DataInputStream.read_until_finish(result: AsyncResult, length: out gsize?) -> utf8 throws` | g_data_input_stream_read_until_finish | 2.20 | Finish an asynchronous call started by g_data_input_stream_read_until_async(). |
| read_upto | `DataInputStream.read_upto(stop_chars: utf8, stop_chars_len: gssize, length: out gsize?, cancellable: Cancellable?) -> utf8 throws` | g_data_input_stream_read_upto | 2.26 | Reads a string from the data input stream, up to the first occurrence of any of the stop characters. In contrast to g_data_input_stream_read_until(... |
| read_upto_async | `DataInputStream.read_upto_async(stop_chars: utf8, stop_chars_len: gssize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_data_input_stream_read_upto_async | 2.26 | The asynchronous version of g_data_input_stream_read_upto(). It is an error to have two outstanding calls to this function. In contrast to g_data_i... |
| read_upto_finish | `DataInputStream.read_upto_finish(result: AsyncResult, length: out gsize?) -> utf8 throws` | g_data_input_stream_read_upto_finish | 2.24 | Finish an asynchronous call started by g_data_input_stream_read_upto_async(). Note that this function does not consume the stop character. You have... |
| set_byte_order | `DataInputStream.set_byte_order(order: DataStreamByteOrder) -> none` | g_data_input_stream_set_byte_order |  | This function sets the byte order for the given @stream. All subsequent reads from the @stream will be read in the given @order. |
| set_newline_type | `DataInputStream.set_newline_type(type: DataStreamNewlineType) -> none` | g_data_input_stream_set_newline_type |  | Sets the newline type for the @stream. Note that using G_DATA_STREAM_NEWLINE_TYPE_ANY is slightly unsafe. If a read chunk ends in "CR" we must read... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| byte-order | DataStreamByteOrder | read, write | The :byte-order property determines the byte ordering that is used when reading multi-byte entities (such as integers) from the stream. |
| newline-type | DataStreamNewlineType | read, write | The :newline-type property determines what is considered as a line ending when reading complete lines from the stream. |

### Gio.DataOutputStream

Parent: `FilterOutputStream` ?? Implements: `Seekable` ?? GType: `GDataOutputStream` ?? C type: `GDataOutputStream`

Data output stream implements [class@Gio.OutputStream] and includes functions for writing data directly to an output stream.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | FilterOutputStream |
| priv | DataOutputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DataOutputStream.new(base_stream: OutputStream) -> DataOutputStream` | g_data_output_stream_new |  | Creates a new data output stream for @base_stream. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_byte_order | `DataOutputStream.get_byte_order() -> DataStreamByteOrder` | g_data_output_stream_get_byte_order |  | Gets the byte order for the stream. |
| put_byte | `DataOutputStream.put_byte(data: guint8, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_byte |  | Puts a byte into the output stream. |
| put_int16 | `DataOutputStream.put_int16(data: gint16, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_int16 |  | Puts a signed 16-bit integer into the output stream. |
| put_int32 | `DataOutputStream.put_int32(data: gint32, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_int32 |  | Puts a signed 32-bit integer into the output stream. |
| put_int64 | `DataOutputStream.put_int64(data: gint64, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_int64 |  | Puts a signed 64-bit integer into the stream. |
| put_string | `DataOutputStream.put_string(str: utf8, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_string |  | Puts a string into the output stream. |
| put_uint16 | `DataOutputStream.put_uint16(data: guint16, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_uint16 |  | Puts an unsigned 16-bit integer into the output stream. |
| put_uint32 | `DataOutputStream.put_uint32(data: guint32, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_uint32 |  | Puts an unsigned 32-bit integer into the stream. |
| put_uint64 | `DataOutputStream.put_uint64(data: guint64, cancellable: Cancellable?) -> gboolean throws` | g_data_output_stream_put_uint64 |  | Puts an unsigned 64-bit integer into the stream. |
| set_byte_order | `DataOutputStream.set_byte_order(order: DataStreamByteOrder) -> none` | g_data_output_stream_set_byte_order |  | Sets the byte order of the data output stream to @order. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| byte-order | DataStreamByteOrder | read, write | Determines the byte ordering that is used when writing multi-byte entities (such as integers) to the stream. |

### Gio.DBusActionGroup

Parent: `GObject.Object` ?? Implements: `ActionGroup`, `RemoteActionGroup` ?? GType: `GDBusActionGroup` ?? C type: `GDBusActionGroup`

`GDBusActionGroup` is an implementation of the [iface@Gio.ActionGroup] interface. `GDBusActionGroup` can be used as a proxy for an action group tha...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get(connection: DBusConnection, bus_name: utf8?, object_path: utf8) -> DBusActionGroup` | g_dbus_action_group_get | 2.32 | Obtains a #GDBusActionGroup for the action group which is exported at the given @bus_name and @object_path. The thread default main context is take... |

### Gio.DBusAuthObserver

Parent: `GObject.Object` ?? GType: `GDBusAuthObserver` ?? C type: `GDBusAuthObserver`

`GDBusAuthObserver` provides a mechanism for participating in how a [class@Gio.DBusServer] (or a [class@Gio.DBusConnection]) authenticates remote p...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DBusAuthObserver.new() -> DBusAuthObserver` | g_dbus_auth_observer_new | 2.26 | Creates a new #GDBusAuthObserver object. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| allow_mechanism | `DBusAuthObserver.allow_mechanism(mechanism: utf8) -> gboolean` | g_dbus_auth_observer_allow_mechanism | 2.34 | Emits the #GDBusAuthObserver::allow-mechanism signal on @observer. |
| authorize_authenticated_peer | `DBusAuthObserver.authorize_authenticated_peer(stream: IOStream, credentials: Credentials?) -> gboolean` | g_dbus_auth_observer_authorize_authenticated_peer | 2.26 | Emits the #GDBusAuthObserver::authorize-authenticated-peer signal on @observer. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| allow-mechanism | `mechanism: utf8` | gboolean | last | 2.34 | Emitted to check if @mechanism is allowed to be used. |
| authorize-authenticated-peer | `stream: IOStream, credentials: Credentials?` | gboolean | last | 2.26 | Emitted to check if a peer that is successfully authenticated is authorized. |

### Gio.DBusConnection

Parent: `GObject.Object` ?? Implements: `AsyncInitable`, `Initable` ?? GType: `GDBusConnection` ?? C type: `GDBusConnection`

The `GDBusConnection` type is used for D-Bus connections to remote peers such as a message buses. It is a low-level API that offers a lot of flexib...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_finish | `DBusConnection.new_finish(res: AsyncResult) -> DBusConnection throws` | g_dbus_connection_new_finish | 2.26 | Finishes an operation started with g_dbus_connection_new(). |
| new_for_address_finish | `DBusConnection.new_for_address_finish(res: AsyncResult) -> DBusConnection throws` | g_dbus_connection_new_for_address_finish | 2.26 | Finishes an operation started with g_dbus_connection_new_for_address(). |
| new_for_address_sync | `DBusConnection.new_for_address_sync(address: utf8, flags: DBusConnectionFlags, observer: DBusAuthObserver?, cancellable: Cancellable?) -> DBusConnection throws` | g_dbus_connection_new_for_address_sync | 2.26 | Synchronously connects and sets up a D-Bus client connection for exchanging D-Bus messages with an endpoint specified by @address which must be in ... |
| new_sync | `DBusConnection.new_sync(stream: IOStream, guid: utf8?, flags: DBusConnectionFlags, observer: DBusAuthObserver?, cancellable: Cancellable?) -> DBusConnection throws` | g_dbus_connection_new_sync | 2.26 | Synchronously sets up a D-Bus connection for exchanging D-Bus messages with the end represented by @stream. If @stream is a #GSocketConnection, the... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(stream: IOStream, guid: utf8?, flags: DBusConnectionFlags, observer: DBusAuthObserver?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_new | 2.26 | Asynchronously sets up a D-Bus connection for exchanging D-Bus messages with the end represented by @stream. If @stream is a #GSocketConnection, th... |
| new_for_address | `new_for_address(address: utf8, flags: DBusConnectionFlags, observer: DBusAuthObserver?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_new_for_address | 2.26 | Asynchronously connects and sets up a D-Bus client connection for exchanging D-Bus messages with an endpoint specified by @address which must be in... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_filter | `DBusConnection.add_filter(filter_function: DBusMessageFilterFunction, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify) -> guint` | g_dbus_connection_add_filter | 2.26 | Adds a message filter. Filters are handlers that are run on all incoming and outgoing messages, prior to standard dispatch. Filters are run in the ... |
| call | `DBusConnection.call(bus_name: utf8?, object_path: utf8, interface_name: utf8, method_name: utf8, parameters: GLib.Variant?, reply_type: GLib.VariantType?, flags: DBusCallFlags, timeout_msec: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_call | 2.26 | Asynchronously invokes the @method_name method on the @interface_name D-Bus interface on the remote object at @object_path owned by @bus_name. If @... |
| call_finish | `DBusConnection.call_finish(res: AsyncResult) -> GLib.Variant throws` | g_dbus_connection_call_finish | 2.26 | Finishes an operation started with g_dbus_connection_call(). |
| call_sync | `DBusConnection.call_sync(bus_name: utf8?, object_path: utf8, interface_name: utf8, method_name: utf8, parameters: GLib.Variant?, reply_type: GLib.VariantType?, flags: DBusCallFlags, timeout_msec: gint, cancellable: Cancellable?) -> GLib.Variant throws` | g_dbus_connection_call_sync | 2.26 | Synchronously invokes the @method_name method on the @interface_name D-Bus interface on the remote object at @object_path owned by @bus_name. If @c... |
| call_with_unix_fd_list | `DBusConnection.call_with_unix_fd_list(bus_name: utf8?, object_path: utf8, interface_name: utf8, method_name: utf8, parameters: GLib.Variant?, reply_type: GLib.VariantType?, flags: DBusCallFlags, timeout_msec: gint, fd_list: UnixFDList?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_call_with_unix_fd_list | 2.30 | Like g_dbus_connection_call() but also takes a #GUnixFDList object. The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE values in th... |
| call_with_unix_fd_list_finish | `DBusConnection.call_with_unix_fd_list_finish(out_fd_list: out UnixFDList?, res: AsyncResult) -> GLib.Variant throws` | g_dbus_connection_call_with_unix_fd_list_finish | 2.30 | Finishes an operation started with g_dbus_connection_call_with_unix_fd_list(). The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE v... |
| call_with_unix_fd_list_sync | `DBusConnection.call_with_unix_fd_list_sync(bus_name: utf8?, object_path: utf8, interface_name: utf8, method_name: utf8, parameters: GLib.Variant?, reply_type: GLib.VariantType?, flags: DBusCallFlags, timeout_msec: gint, fd_list: UnixFDList?, out_fd_list: out UnixFDList?, cancellable: Cancellable?) -> GLib.Variant throws` | g_dbus_connection_call_with_unix_fd_list_sync | 2.30 | Like g_dbus_connection_call_sync() but also takes and returns #GUnixFDList objects. See g_dbus_connection_call_with_unix_fd_list() and g_dbus_conne... |
| close | `DBusConnection.close(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_close | 2.26 | Closes @connection. Note that this never causes the process to exit (this might only happen if the other end of a shared message bus connection dis... |
| close_finish | `DBusConnection.close_finish(res: AsyncResult) -> gboolean throws` | g_dbus_connection_close_finish | 2.26 | Finishes an operation started with g_dbus_connection_close(). |
| close_sync | `DBusConnection.close_sync(cancellable: Cancellable?) -> gboolean throws` | g_dbus_connection_close_sync | 2.26 | Synchronously closes @connection. The calling thread is blocked until this is done. See g_dbus_connection_close() for the asynchronous version of t... |
| emit_signal | `DBusConnection.emit_signal(destination_bus_name: utf8?, object_path: utf8, interface_name: utf8, signal_name: utf8, parameters: GLib.Variant?) -> gboolean throws` | g_dbus_connection_emit_signal | 2.26 | Emits a signal. If the parameters GVariant is floating, it is consumed. This can only fail if @parameters is not compatible with the D-Bus protocol... |
| export_action_group | `DBusConnection.export_action_group(object_path: utf8, action_group: ActionGroup) -> guint throws` | g_dbus_connection_export_action_group | 2.32 | Exports @action_group on @connection at @object_path. The implemented D-Bus API should be considered private. It is subject to change in the future... |
| export_menu_model | `DBusConnection.export_menu_model(object_path: utf8, menu: MenuModel) -> guint throws` | g_dbus_connection_export_menu_model | 2.32 | Exports @menu on @connection at @object_path. The implemented D-Bus API should be considered private. It is subject to change in the future. An obj... |
| flush | `DBusConnection.flush(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_flush | 2.26 | Asynchronously flushes @connection, that is, writes all queued outgoing message to the transport and then flushes the transport (using g_output_str... |
| flush_finish | `DBusConnection.flush_finish(res: AsyncResult) -> gboolean throws` | g_dbus_connection_flush_finish | 2.26 | Finishes an operation started with g_dbus_connection_flush(). |
| flush_sync | `DBusConnection.flush_sync(cancellable: Cancellable?) -> gboolean throws` | g_dbus_connection_flush_sync | 2.26 | Synchronously flushes @connection. The calling thread is blocked until this is done. See g_dbus_connection_flush() for the asynchronous version of ... |
| get_capabilities | `DBusConnection.get_capabilities() -> DBusCapabilityFlags` | g_dbus_connection_get_capabilities | 2.26 | Gets the capabilities negotiated with the remote peer |
| get_exit_on_close | `DBusConnection.get_exit_on_close() -> gboolean` | g_dbus_connection_get_exit_on_close | 2.26 | Gets whether the process is terminated when @connection is closed by the remote peer. See #GDBusConnection:exit-on-close for more details. |
| get_flags | `DBusConnection.get_flags() -> DBusConnectionFlags` | g_dbus_connection_get_flags | 2.60 | Gets the flags used to construct this connection |
| get_guid | `DBusConnection.get_guid() -> utf8` | g_dbus_connection_get_guid | 2.26 | The GUID of the peer performing the role of server when authenticating. See #GDBusConnection:guid for more details. |
| get_last_serial | `DBusConnection.get_last_serial() -> guint32` | g_dbus_connection_get_last_serial | 2.34 | Retrieves the last serial number assigned to a #GDBusMessage on the current thread. This includes messages sent via both low-level API such as g_db... |
| get_peer_credentials | `DBusConnection.get_peer_credentials() -> Credentials` | g_dbus_connection_get_peer_credentials | 2.26 | Gets the credentials of the authenticated peer. This will always return %NULL unless @connection acted as a server (e.g. %G_DBUS_CONNECTION_FLAGS_A... |
| get_stream | `DBusConnection.get_stream() -> IOStream` | g_dbus_connection_get_stream | 2.26 | Gets the underlying stream used for IO. While the #GDBusConnection is active, it will interact with this stream from a worker thread, so it is not ... |
| get_unique_name | `DBusConnection.get_unique_name() -> utf8` | g_dbus_connection_get_unique_name | 2.26 | Gets the unique name of @connection as assigned by the message bus. This can also be used to figure out if @connection is a message bus connection. |
| is_closed | `DBusConnection.is_closed() -> gboolean` | g_dbus_connection_is_closed | 2.26 | Gets whether @connection is closed. |
| register_object | `DBusConnection.register_object(object_path: utf8, interface_info: DBusInterfaceInfo, vtable: DBusInterfaceVTable?, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify) -> guint throws` | g_dbus_connection_register_object | 2.26 | Registers callbacks for exported objects at @object_path with the D-Bus interface that is described in @interface_info. Calls to functions in @vtab... |
| register_object_with_closures | `DBusConnection.register_object_with_closures(object_path: utf8, interface_info: DBusInterfaceInfo, method_call_closure: GObject.Closure?, get_property_closure: GObject.Closure?, set_property_closure: GObject.Closure?) -> guint throws` | g_dbus_connection_register_object_with_closures | 2.46 | Version of g_dbus_connection_register_object() using closures instead of a #GDBusInterfaceVTable for easier binding in other languages. |
| register_subtree | `DBusConnection.register_subtree(object_path: utf8, vtable: DBusSubtreeVTable, flags: DBusSubtreeFlags, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify) -> guint throws` | g_dbus_connection_register_subtree | 2.26 | Registers a whole subtree of dynamic objects. The @enumerate and @introspection functions in @vtable are used to convey, to remote callers, what no... |
| remove_filter | `DBusConnection.remove_filter(filter_id: guint) -> none` | g_dbus_connection_remove_filter | 2.26 | Removes a filter. Note that since filters run in a different thread, there is a race condition where it is possible that the filter will be running... |
| send_message | `DBusConnection.send_message(message: DBusMessage, flags: DBusSendMessageFlags, out_serial: out guint32?) -> gboolean throws` | g_dbus_connection_send_message | 2.26 | Asynchronously sends @message to the peer represented by @connection. Unless @flags contain the %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, th... |
| send_message_with_reply | `DBusConnection.send_message_with_reply(message: DBusMessage, flags: DBusSendMessageFlags, timeout_msec: gint, out_serial: out guint32?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_connection_send_message_with_reply | 2.26 | Asynchronously sends @message to the peer represented by @connection. Unless @flags contain the %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, th... |
| send_message_with_reply_finish | `DBusConnection.send_message_with_reply_finish(res: AsyncResult) -> DBusMessage throws` | g_dbus_connection_send_message_with_reply_finish | 2.26 | Finishes an operation started with g_dbus_connection_send_message_with_reply(). Note that @error is only set if a local in-process error occurred. ... |
| send_message_with_reply_sync | `DBusConnection.send_message_with_reply_sync(message: DBusMessage, flags: DBusSendMessageFlags, timeout_msec: gint, out_serial: out guint32?, cancellable: Cancellable?) -> DBusMessage throws` | g_dbus_connection_send_message_with_reply_sync | 2.26 | Synchronously sends @message to the peer represented by @connection and blocks the calling thread until a reply is received or the timeout is reach... |
| set_exit_on_close | `DBusConnection.set_exit_on_close(exit_on_close: gboolean) -> none` | g_dbus_connection_set_exit_on_close | 2.26 | Sets whether the process should be terminated when @connection is closed by the remote peer. See #GDBusConnection:exit-on-close for more details. N... |
| signal_subscribe | `DBusConnection.signal_subscribe(sender: utf8?, interface_name: utf8?, member: utf8?, object_path: utf8?, arg0: utf8?, flags: DBusSignalFlags, callback: DBusSignalCallback, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify?) -> guint` | g_dbus_connection_signal_subscribe | 2.26 | Subscribes to signals on @connection and invokes @callback whenever the signal is received. Note that @callback will be invoked in the [thread-defa... |
| signal_unsubscribe | `DBusConnection.signal_unsubscribe(subscription_id: guint) -> none` | g_dbus_connection_signal_unsubscribe | 2.26 | Unsubscribes from signals. Note that there may still be D-Bus traffic to process (relating to this signal subscription) in the current thread-defau... |
| start_message_processing | `DBusConnection.start_message_processing() -> none` | g_dbus_connection_start_message_processing | 2.26 | If @connection was created with %G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING, this method starts processing messages. Does nothing on if @conn... |
| unexport_action_group | `DBusConnection.unexport_action_group(export_id: guint) -> none` | g_dbus_connection_unexport_action_group | 2.32 | Reverses the effect of a previous call to g_dbus_connection_export_action_group(). It is an error to call this function with an ID that wasn't retu... |
| unexport_menu_model | `DBusConnection.unexport_menu_model(export_id: guint) -> none` | g_dbus_connection_unexport_menu_model | 2.32 | Reverses the effect of a previous call to g_dbus_connection_export_menu_model(). It is an error to call this function with an ID that wasn't return... |
| unregister_object | `DBusConnection.unregister_object(registration_id: guint) -> gboolean` | g_dbus_connection_unregister_object | 2.26 | Unregisters an object. |
| unregister_subtree | `DBusConnection.unregister_subtree(registration_id: guint) -> gboolean` | g_dbus_connection_unregister_subtree | 2.26 | Unregisters a subtree. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| address | utf8 | write, construct-only | A D-Bus address specifying potential endpoints that can be used when establishing the connection. |
| authentication-observer | DBusAuthObserver | write, construct-only | A #GDBusAuthObserver object to assist in the authentication process or %NULL. |
| capabilities | DBusCapabilityFlags | read | Flags from the #GDBusCapabilityFlags enumeration representing connection features negotiated with the other peer. |
| closed | gboolean | read | A boolean specifying whether the connection has been closed. |
| exit-on-close | gboolean | read, write | A boolean specifying whether the process will be terminated (by calling `raise(SIGTERM)`) if the connection is closed by the remote peer. Note that... |
| flags | DBusConnectionFlags | read, write, construct-only | Flags from the #GDBusConnectionFlags enumeration. |
| guid | utf8 | read, write, construct-only | The GUID of the peer performing the role of server when authenticating. If you are constructing a #GDBusConnection and pass %G_DBUS_CONNECTION_FLAG... |
| stream | IOStream | read, write, construct-only | The underlying #GIOStream used for I/O. If this is passed on construction and is a #GSocketConnection, then the corresponding #GSocket will be put ... |
| unique-name | utf8 | read | The unique name as assigned by the message bus or %NULL if the connection is not open or not a message bus connection. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `remote_peer_vanished: gboolean, error: GLib.Error?` | none | last | 2.26 | Emitted when the connection is closed. The cause of this event can be - If g_dbus_connection_close() is called. In this case @remote_peer_vanished ... |

### Gio.DBusInterfaceSkeleton

Parent: `GObject.Object` ?? Implements: `DBusInterface` ?? GType: `GDBusInterfaceSkeleton` ?? C type: `GDBusInterfaceSkeleton` ?? Abstract

Abstract base class for D-Bus interfaces on the service side.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | DBusInterfaceSkeletonPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| export | `DBusInterfaceSkeleton.export(connection: DBusConnection, object_path: utf8) -> gboolean throws` | g_dbus_interface_skeleton_export | 2.30 | Exports @interface_ at @object_path on @connection. This can be called multiple times to export the same @interface_ onto multiple connections howe... |
| flush | `DBusInterfaceSkeleton.flush() -> none` | g_dbus_interface_skeleton_flush | 2.30 | If @interface_ has outstanding changes, request for these changes to be emitted immediately. For example, an exported D-Bus interface may queue up ... |
| get_connection | `DBusInterfaceSkeleton.get_connection() -> DBusConnection` | g_dbus_interface_skeleton_get_connection | 2.30 | Gets the first connection that @interface_ is exported on, if any. |
| get_connections | `DBusInterfaceSkeleton.get_connections() -> GLib.List` | g_dbus_interface_skeleton_get_connections | 2.32 | Gets a list of the connections that @interface_ is exported on. |
| get_flags | `DBusInterfaceSkeleton.get_flags() -> DBusInterfaceSkeletonFlags` | g_dbus_interface_skeleton_get_flags | 2.30 | Gets the #GDBusInterfaceSkeletonFlags that describes what the behavior of @interface_ |
| get_info | `DBusInterfaceSkeleton.get_info() -> DBusInterfaceInfo` | g_dbus_interface_skeleton_get_info | 2.30 | Gets D-Bus introspection information for the D-Bus interface implemented by @interface_. |
| get_object_path | `DBusInterfaceSkeleton.get_object_path() -> utf8` | g_dbus_interface_skeleton_get_object_path | 2.30 | Gets the object path that @interface_ is exported on, if any. |
| get_properties | `DBusInterfaceSkeleton.get_properties() -> GLib.Variant` | g_dbus_interface_skeleton_get_properties | 2.30 | Gets all D-Bus properties for @interface_. |
| get_vtable | `DBusInterfaceSkeleton.get_vtable() -> DBusInterfaceVTable` | g_dbus_interface_skeleton_get_vtable | 2.30 | Gets the interface vtable for the D-Bus interface implemented by @interface_. The returned function pointers should expect @interface_ itself to be... |
| has_connection | `DBusInterfaceSkeleton.has_connection(connection: DBusConnection) -> gboolean` | g_dbus_interface_skeleton_has_connection | 2.32 | Checks if @interface_ is exported on @connection. |
| set_flags | `DBusInterfaceSkeleton.set_flags(flags: DBusInterfaceSkeletonFlags) -> none` | g_dbus_interface_skeleton_set_flags | 2.30 | Sets flags describing what the behavior of @skeleton should be. |
| unexport | `DBusInterfaceSkeleton.unexport() -> none` | g_dbus_interface_skeleton_unexport | 2.30 | Stops exporting @interface_ on all connections it is exported on. To unexport @interface_ from only a single connection, use g_dbus_interface_skele... |
| unexport_from_connection | `DBusInterfaceSkeleton.unexport_from_connection(connection: DBusConnection) -> none` | g_dbus_interface_skeleton_unexport_from_connection | 2.32 | Stops exporting @interface_ on @connection. To stop exporting on all connections the interface is exported on, use g_dbus_interface_skeleton_unexpo... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-flags | DBusInterfaceSkeletonFlags | read, write | Flags from the #GDBusInterfaceSkeletonFlags enumeration. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| g-authorize-method | `invocation: DBusMethodInvocation` | gboolean | last | 2.30 | Emitted when a method is invoked by a remote caller and used to determine if the method call is authorized. Note that this signal is emitted in a t... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| flush | `flush() -> none` |  | 2.30 | If @interface_ has outstanding changes, request for these changes to be emitted immediately. For example, an exported D-Bus interface may queue up ... |
| g_authorize_method | `g_authorize_method(invocation: DBusMethodInvocation) -> gboolean` |  |  | Signal class handler for the #GDBusInterfaceSkeleton::g-authorize-method signal. |
| get_info | `get_info() -> DBusInterfaceInfo` |  | 2.30 | Gets D-Bus introspection information for the D-Bus interface implemented by @interface_. |
| get_properties | `get_properties() -> GLib.Variant` |  | 2.30 | Gets all D-Bus properties for @interface_. |
| get_vtable | `get_vtable() -> DBusInterfaceVTable` |  | 2.30 | Gets the interface vtable for the D-Bus interface implemented by @interface_. The returned function pointers should expect @interface_ itself to be... |

### Gio.DBusMenuModel

Parent: `MenuModel` ?? GType: `GDBusMenuModel` ?? C type: `GDBusMenuModel`

`GDBusMenuModel` is an implementation of [class@Gio.MenuModel] that can be used as a proxy for a menu model that is exported over D-Bus with [metho...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get(connection: DBusConnection, bus_name: utf8?, object_path: utf8) -> DBusMenuModel` | g_dbus_menu_model_get | 2.32 | Obtains a #GDBusMenuModel for the menu model which is exported at the given @bus_name and @object_path. The thread default main context is taken at... |

### Gio.DBusMessage

Parent: `GObject.Object` ?? GType: `GDBusMessage` ?? C type: `GDBusMessage`

A type for representing D-Bus messages that can be sent or received on a [class@Gio.DBusConnection].

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DBusMessage.new() -> DBusMessage` | g_dbus_message_new | 2.26 | Creates a new empty #GDBusMessage. |
| new_from_blob | `DBusMessage.new_from_blob(blob: guint8, blob_len: gsize, capabilities: DBusCapabilityFlags) -> DBusMessage throws` | g_dbus_message_new_from_blob | 2.26 | Creates a new #GDBusMessage from the data stored at @blob. The byte order that the message was in can be retrieved using g_dbus_message_get_byte_or... |
| new_method_call | `DBusMessage.new_method_call(name: utf8?, path: utf8, interface_: utf8?, method: utf8) -> DBusMessage` | g_dbus_message_new_method_call | 2.26 | Creates a new #GDBusMessage for a method call. |
| new_signal | `DBusMessage.new_signal(path: utf8, interface_: utf8, signal: utf8) -> DBusMessage` | g_dbus_message_new_signal | 2.26 | Creates a new #GDBusMessage for a signal emission. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bytes_needed | `bytes_needed(blob: guint8, blob_len: gsize) -> gssize throws` | g_dbus_message_bytes_needed | 2.26 | Utility function to calculate how many bytes are needed to completely deserialize the D-Bus message stored at @blob. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `DBusMessage.copy() -> DBusMessage throws` | g_dbus_message_copy | 2.26 | Copies @message. The copy is a deep copy and the returned #GDBusMessage is completely identical except that it is guaranteed to not be locked. This... |
| get_arg0 | `DBusMessage.get_arg0() -> utf8` | g_dbus_message_get_arg0 | 2.26 | Convenience to get the first item in the body of @message. See [method@Gio.DBusMessage.get_arg0_path] for returning object-path-typed arg0 values. |
| get_arg0_path | `DBusMessage.get_arg0_path() -> utf8` | g_dbus_message_get_arg0_path | 2.80 | Convenience to get the first item in the body of @message. See [method@Gio.DBusMessage.get_arg0] for returning string-typed arg0 values. |
| get_body | `DBusMessage.get_body() -> GLib.Variant` | g_dbus_message_get_body | 2.26 | Gets the body of a message. |
| get_byte_order | `DBusMessage.get_byte_order() -> DBusMessageByteOrder` | g_dbus_message_get_byte_order |  | Gets the byte order of @message. |
| get_destination | `DBusMessage.get_destination() -> utf8` | g_dbus_message_get_destination | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field. |
| get_error_name | `DBusMessage.get_error_name() -> utf8` | g_dbus_message_get_error_name | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field. |
| get_flags | `DBusMessage.get_flags() -> DBusMessageFlags` | g_dbus_message_get_flags | 2.26 | Gets the flags for @message. |
| get_header | `DBusMessage.get_header(header_field: DBusMessageHeaderField) -> GLib.Variant` | g_dbus_message_get_header | 2.26 | Gets a header field on @message. The caller is responsible for checking the type of the returned #GVariant matches what is expected. |
| get_header_fields | `DBusMessage.get_header_fields() -> guint8` | g_dbus_message_get_header_fields | 2.26 | Gets an array of all header fields on @message that are set. |
| get_interface | `DBusMessage.get_interface() -> utf8` | g_dbus_message_get_interface | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field. |
| get_locked | `DBusMessage.get_locked() -> gboolean` | g_dbus_message_get_locked | 2.26 | Checks whether @message is locked. To monitor changes to this value, conncet to the #GObject::notify signal to listen for changes on the #GDBusMess... |
| get_member | `DBusMessage.get_member() -> utf8` | g_dbus_message_get_member | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field. |
| get_message_type | `DBusMessage.get_message_type() -> DBusMessageType` | g_dbus_message_get_message_type | 2.26 | Gets the type of @message. |
| get_num_unix_fds | `DBusMessage.get_num_unix_fds() -> guint32` | g_dbus_message_get_num_unix_fds | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field. |
| get_path | `DBusMessage.get_path() -> utf8` | g_dbus_message_get_path | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field. |
| get_reply_serial | `DBusMessage.get_reply_serial() -> guint32` | g_dbus_message_get_reply_serial | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL header field. |
| get_sender | `DBusMessage.get_sender() -> utf8` | g_dbus_message_get_sender | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field. |
| get_serial | `DBusMessage.get_serial() -> guint32` | g_dbus_message_get_serial | 2.26 | Gets the serial for @message. |
| get_signature | `DBusMessage.get_signature() -> utf8` | g_dbus_message_get_signature | 2.26 | Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field. This will always be non-%NULL, but may be an empty string. |
| get_unix_fd_list | `DBusMessage.get_unix_fd_list() -> UnixFDList` | g_dbus_message_get_unix_fd_list | 2.26 | Gets the UNIX file descriptors associated with @message, if any. This method is only available on UNIX. The file descriptors normally correspond to... |
| lock | `DBusMessage.lock() -> none` | g_dbus_message_lock | 2.26 | If @message is locked, does nothing. Otherwise locks the message. |
| new_method_error | `DBusMessage.new_method_error(error_name: utf8, error_message_format: utf8, ...: void) -> DBusMessage` | g_dbus_message_new_method_error | 2.26 | Creates a new #GDBusMessage that is an error reply to @method_call_message. |
| new_method_error_literal | `DBusMessage.new_method_error_literal(error_name: utf8, error_message: utf8) -> DBusMessage` | g_dbus_message_new_method_error_literal | 2.26 | Creates a new #GDBusMessage that is an error reply to @method_call_message. |
| new_method_error_valist | `DBusMessage.new_method_error_valist(error_name: utf8, error_message_format: utf8, var_args: va_list) -> DBusMessage` | g_dbus_message_new_method_error_valist | 2.26 | Like g_dbus_message_new_method_error() but intended for language bindings. |
| new_method_reply | `DBusMessage.new_method_reply() -> DBusMessage` | g_dbus_message_new_method_reply | 2.26 | Creates a new #GDBusMessage that is a reply to @method_call_message. |
| print | `DBusMessage.print(indent: guint) -> utf8` | g_dbus_message_print | 2.26 | Produces a human-readable multi-line description of @message. The contents of the description has no ABI guarantees, the contents and formatting is... |
| set_body | `DBusMessage.set_body(body: GLib.Variant) -> none` | g_dbus_message_set_body | 2.26 | Sets the body @message. As a side-effect the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field is set to the type string of @body (or cleared if ... |
| set_byte_order | `DBusMessage.set_byte_order(byte_order: DBusMessageByteOrder) -> none` | g_dbus_message_set_byte_order |  | Sets the byte order of @message. |
| set_destination | `DBusMessage.set_destination(value: utf8?) -> none` | g_dbus_message_set_destination | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field. |
| set_error_name | `DBusMessage.set_error_name(value: utf8) -> none` | g_dbus_message_set_error_name | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field. |
| set_flags | `DBusMessage.set_flags(flags: DBusMessageFlags) -> none` | g_dbus_message_set_flags | 2.26 | Sets the flags to set on @message. |
| set_header | `DBusMessage.set_header(header_field: DBusMessageHeaderField, value: GLib.Variant?) -> none` | g_dbus_message_set_header | 2.26 | Sets a header field on @message. If @value is floating, @message assumes ownership of @value. |
| set_interface | `DBusMessage.set_interface(value: utf8?) -> none` | g_dbus_message_set_interface | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field. |
| set_member | `DBusMessage.set_member(value: utf8?) -> none` | g_dbus_message_set_member | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field. |
| set_message_type | `DBusMessage.set_message_type(type: DBusMessageType) -> none` | g_dbus_message_set_message_type | 2.26 | Sets @message to be of @type. |
| set_num_unix_fds | `DBusMessage.set_num_unix_fds(value: guint32) -> none` | g_dbus_message_set_num_unix_fds | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field. |
| set_path | `DBusMessage.set_path(value: utf8?) -> none` | g_dbus_message_set_path | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field. |
| set_reply_serial | `DBusMessage.set_reply_serial(value: guint32) -> none` | g_dbus_message_set_reply_serial | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL header field. |
| set_sender | `DBusMessage.set_sender(value: utf8?) -> none` | g_dbus_message_set_sender | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field. |
| set_serial | `DBusMessage.set_serial(serial: guint32) -> none` | g_dbus_message_set_serial | 2.26 | Sets the serial for @message. |
| set_signature | `DBusMessage.set_signature(value: utf8?) -> none` | g_dbus_message_set_signature | 2.26 | Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field. |
| set_unix_fd_list | `DBusMessage.set_unix_fd_list(fd_list: UnixFDList?) -> none` | g_dbus_message_set_unix_fd_list | 2.26 | Sets the UNIX file descriptors associated with @message. As a side-effect the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field is set to the ... |
| to_blob | `DBusMessage.to_blob(out_size: out gsize, capabilities: DBusCapabilityFlags) -> guint8 throws` | g_dbus_message_to_blob | 2.26 | Serializes @message to a blob. The byte order returned by g_dbus_message_get_byte_order() will be used. |
| to_gerror | `DBusMessage.to_gerror() -> gboolean throws` | g_dbus_message_to_gerror | 2.26 | If @message is not of type %G_DBUS_MESSAGE_TYPE_ERROR does nothing and returns %FALSE. Otherwise this method encodes the error in @message as a #GE... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| locked | gboolean | read |  |

### Gio.DBusMethodInvocation

Parent: `GObject.Object` ?? GType: `GDBusMethodInvocation` ?? C type: `GDBusMethodInvocation`

Instances of the `GDBusMethodInvocation` class are used when handling D-Bus method calls. It provides a way to asynchronously return results and er...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_connection | `DBusMethodInvocation.get_connection() -> DBusConnection` | g_dbus_method_invocation_get_connection | 2.26 | Gets the #GDBusConnection the method was invoked on. |
| get_interface_name | `DBusMethodInvocation.get_interface_name() -> utf8` | g_dbus_method_invocation_get_interface_name | 2.26 | Gets the name of the D-Bus interface the method was invoked on. If this method call is a property Get, Set or GetAll call that has been redirected ... |
| get_message | `DBusMethodInvocation.get_message() -> DBusMessage` | g_dbus_method_invocation_get_message | 2.26 | Gets the #GDBusMessage for the method invocation. This is useful if you need to use low-level protocol features, such as UNIX file descriptor passi... |
| get_method_info | `DBusMethodInvocation.get_method_info() -> DBusMethodInfo` | g_dbus_method_invocation_get_method_info | 2.26 | Gets information about the method call, if any. If this method invocation is a property Get, Set or GetAll call that has been redirected to the met... |
| get_method_name | `DBusMethodInvocation.get_method_name() -> utf8` | g_dbus_method_invocation_get_method_name | 2.26 | Gets the name of the method that was invoked. |
| get_object_path | `DBusMethodInvocation.get_object_path() -> utf8` | g_dbus_method_invocation_get_object_path | 2.26 | Gets the object path the method was invoked on. |
| get_parameters | `DBusMethodInvocation.get_parameters() -> GLib.Variant` | g_dbus_method_invocation_get_parameters | 2.26 | Gets the parameters of the method invocation. If there are no input parameters then this will return a GVariant with 0 children rather than NULL. |
| get_property_info | `DBusMethodInvocation.get_property_info() -> DBusPropertyInfo` | g_dbus_method_invocation_get_property_info | 2.38 | Gets information about the property that this method call is for, if any. This will only be set in the case of an invocation in response to a prope... |
| get_sender | `DBusMethodInvocation.get_sender() -> utf8` | g_dbus_method_invocation_get_sender | 2.26 | Gets the bus name that invoked the method. |
| get_user_data | `DBusMethodInvocation.get_user_data() -> gpointer` | g_dbus_method_invocation_get_user_data | 2.26 | Gets the @user_data #gpointer passed to g_dbus_connection_register_object(). |
| return_dbus_error | `DBusMethodInvocation.return_dbus_error(error_name: utf8, error_message: utf8) -> none` | g_dbus_method_invocation_return_dbus_error | 2.26 | Finishes handling a D-Bus method call by returning an error. This method will take ownership of @invocation. See #GDBusInterfaceVTable for more inf... |
| return_error | `DBusMethodInvocation.return_error(domain: GLib.Quark, code: gint, format: utf8, ...: void) -> none` | g_dbus_method_invocation_return_error | 2.26 | Finishes handling a D-Bus method call by returning an error. See g_dbus_error_encode_gerror() for details about what error name will be returned on... |
| return_error_literal | `DBusMethodInvocation.return_error_literal(domain: GLib.Quark, code: gint, message: utf8) -> none` | g_dbus_method_invocation_return_error_literal | 2.26 | Like g_dbus_method_invocation_return_error() but without printf()-style formatting. This method will take ownership of @invocation. See #GDBusInter... |
| return_error_valist | `DBusMethodInvocation.return_error_valist(domain: GLib.Quark, code: gint, format: utf8, var_args: va_list) -> none` | g_dbus_method_invocation_return_error_valist | 2.26 | Like g_dbus_method_invocation_return_error() but intended for language bindings. This method will take ownership of @invocation. See #GDBusInterfac... |
| return_gerror | `DBusMethodInvocation.return_gerror(error: GLib.Error) -> none` | g_dbus_method_invocation_return_gerror | 2.26 | Like g_dbus_method_invocation_return_error() but takes a #GError instead of the error domain, error code and message. This method will take ownersh... |
| return_value | `DBusMethodInvocation.return_value(parameters: GLib.Variant?) -> none` | g_dbus_method_invocation_return_value | 2.26 | Finishes handling a D-Bus method call by returning @parameters. If the @parameters GVariant is floating, it is consumed. It is an error if @paramet... |
| return_value_with_unix_fd_list | `DBusMethodInvocation.return_value_with_unix_fd_list(parameters: GLib.Variant?, fd_list: UnixFDList?) -> none` | g_dbus_method_invocation_return_value_with_unix_fd_list | 2.30 | Like g_dbus_method_invocation_return_value() but also takes a #GUnixFDList. This method is only available on UNIX. This method will take ownership ... |
| take_error | `DBusMethodInvocation.take_error(error: GLib.Error) -> none` | g_dbus_method_invocation_take_error | 2.30 | Like g_dbus_method_invocation_return_gerror() but takes ownership of @error so the caller does not need to free it. This method will take ownership... |

### Gio.DBusObjectManagerClient

Parent: `GObject.Object` ?? Implements: `AsyncInitable`, `DBusObjectManager`, `Initable` ?? GType: `GDBusObjectManagerClient` ?? C type: `GDBusObjectManagerClient`

`GDBusObjectManagerClient` is used to create, monitor and delete object proxies for remote objects exported by a [class@Gio.DBusObjectManagerServer...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | DBusObjectManagerClientPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_finish | `DBusObjectManagerClient.new_finish(res: AsyncResult) -> DBusObjectManagerClient throws` | g_dbus_object_manager_client_new_finish | 2.30 | Finishes an operation started with g_dbus_object_manager_client_new(). |
| new_for_bus_finish | `DBusObjectManagerClient.new_for_bus_finish(res: AsyncResult) -> DBusObjectManagerClient throws` | g_dbus_object_manager_client_new_for_bus_finish | 2.30 | Finishes an operation started with g_dbus_object_manager_client_new_for_bus(). |
| new_for_bus_sync | `DBusObjectManagerClient.new_for_bus_sync(bus_type: BusType, flags: DBusObjectManagerClientFlags, name: utf8, object_path: utf8, get_proxy_type_func: DBusProxyTypeFunc?, get_proxy_type_user_data: gpointer?, get_proxy_type_destroy_notify: GLib.DestroyNotify?, cancellable: Cancellable?) -> DBusObjectManagerClient throws` | g_dbus_object_manager_client_new_for_bus_sync | 2.30 | Like g_dbus_object_manager_client_new_sync() but takes a #GBusType instead of a #GDBusConnection. This is a synchronous failable constructor - the ... |
| new_sync | `DBusObjectManagerClient.new_sync(connection: DBusConnection, flags: DBusObjectManagerClientFlags, name: utf8?, object_path: utf8, get_proxy_type_func: DBusProxyTypeFunc?, get_proxy_type_user_data: gpointer?, get_proxy_type_destroy_notify: GLib.DestroyNotify?, cancellable: Cancellable?) -> DBusObjectManagerClient throws` | g_dbus_object_manager_client_new_sync | 2.30 | Creates a new #GDBusObjectManagerClient object. This is a synchronous failable constructor - the calling thread is blocked until a reply is receive... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(connection: DBusConnection, flags: DBusObjectManagerClientFlags, name: utf8, object_path: utf8, get_proxy_type_func: DBusProxyTypeFunc?, get_proxy_type_user_data: gpointer?, get_proxy_type_destroy_notify: GLib.DestroyNotify?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_object_manager_client_new | 2.30 | Asynchronously creates a new #GDBusObjectManagerClient object. This is an asynchronous failable constructor. When the result is ready, @callback wi... |
| new_for_bus | `new_for_bus(bus_type: BusType, flags: DBusObjectManagerClientFlags, name: utf8, object_path: utf8, get_proxy_type_func: DBusProxyTypeFunc?, get_proxy_type_user_data: gpointer?, get_proxy_type_destroy_notify: GLib.DestroyNotify?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_object_manager_client_new_for_bus | 2.30 | Like g_dbus_object_manager_client_new() but takes a #GBusType instead of a #GDBusConnection. This is an asynchronous failable constructor. When the... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_connection | `DBusObjectManagerClient.get_connection() -> DBusConnection` | g_dbus_object_manager_client_get_connection | 2.30 | Gets the #GDBusConnection used by @manager. |
| get_flags | `DBusObjectManagerClient.get_flags() -> DBusObjectManagerClientFlags` | g_dbus_object_manager_client_get_flags | 2.30 | Gets the flags that @manager was constructed with. |
| get_name | `DBusObjectManagerClient.get_name() -> utf8` | g_dbus_object_manager_client_get_name | 2.30 | Gets the name that @manager is for, or %NULL if not a message bus connection. |
| get_name_owner | `DBusObjectManagerClient.get_name_owner() -> utf8` | g_dbus_object_manager_client_get_name_owner | 2.30 | The unique name that owns the name that @manager is for or %NULL if no-one currently owns that name. You can connect to the #GObject::notify signal... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| bus-type | BusType | write, construct-only | If this property is not %G_BUS_TYPE_NONE, then #GDBusObjectManagerClient:connection must be %NULL and will be set to the #GDBusConnection obtained ... |
| connection | DBusConnection | read, write, construct-only | The #GDBusConnection to use. |
| flags | DBusObjectManagerClientFlags | read, write, construct-only | Flags from the #GDBusObjectManagerClientFlags enumeration. |
| get-proxy-type-destroy-notify | gpointer | read, write, construct-only | A #GDestroyNotify for the #gpointer user_data in #GDBusObjectManagerClient:get-proxy-type-user-data. |
| get-proxy-type-func | gpointer | read, write, construct-only | The #GDBusProxyTypeFunc to use when determining what #GType to use for interface proxies or %NULL. |
| get-proxy-type-user-data | gpointer | read, write, construct-only | The #gpointer user_data to pass to #GDBusObjectManagerClient:get-proxy-type-func. |
| name | utf8 | read, write, construct-only | The well-known name or unique name that the manager is for. |
| name-owner | utf8 | read | The unique name that owns #GDBusObjectManagerClient:name or %NULL if no-one is currently owning the name. Connect to the #GObject::notify signal to... |
| object-path | utf8 | read, write, construct-only | The object path the manager is for. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| interface-proxy-properties-changed | `object_proxy: DBusObjectProxy, interface_proxy: DBusProxy, changed_properties: GLib.Variant, invalidated_properties: utf8` | none | last | 2.30 | Emitted when one or more D-Bus properties on proxy changes. The local cache has already been updated when this signal fires. Note that both @change... |
| interface-proxy-signal | `object_proxy: DBusObjectProxy, interface_proxy: DBusProxy, sender_name: utf8, signal_name: utf8, parameters: GLib.Variant` | none | last | 2.30 | Emitted when a D-Bus signal is received on @interface_proxy. This signal exists purely as a convenience to avoid having to connect signals to all i... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| interface_proxy_properties_changed | `interface_proxy_properties_changed(object_proxy: DBusObjectProxy, interface_proxy: DBusProxy, changed_properties: GLib.Variant, invalidated_properties: utf8) -> none` |  |  | Signal class handler for the #GDBusObjectManagerClient::interface-proxy-properties-changed signal. |
| interface_proxy_signal | `interface_proxy_signal(object_proxy: DBusObjectProxy, interface_proxy: DBusProxy, sender_name: utf8, signal_name: utf8, parameters: GLib.Variant) -> none` |  |  | Signal class handler for the #GDBusObjectManagerClient::interface-proxy-signal signal. |

### Gio.DBusObjectManagerServer

Parent: `GObject.Object` ?? Implements: `DBusObjectManager` ?? GType: `GDBusObjectManagerServer` ?? C type: `GDBusObjectManagerServer`

`GDBusObjectManagerServer` is used to export [iface@Gio.DBusObject] instances using the standardized `org.freedesktop.DBus.ObjectManager` interface...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | DBusObjectManagerServerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DBusObjectManagerServer.new(object_path: utf8) -> DBusObjectManagerServer` | g_dbus_object_manager_server_new | 2.30 | Creates a new #GDBusObjectManagerServer object. The returned server isn't yet exported on any connection. To do so, use g_dbus_object_manager_serve... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| export | `DBusObjectManagerServer.export(object: DBusObjectSkeleton) -> none` | g_dbus_object_manager_server_export | 2.30 | Exports @object on @manager. If there is already a #GDBusObject exported at the object path, then the old object is removed. The object path for @o... |
| export_uniquely | `DBusObjectManagerServer.export_uniquely(object: DBusObjectSkeleton) -> none` | g_dbus_object_manager_server_export_uniquely | 2.30 | Like g_dbus_object_manager_server_export() but appends a string of the form _N (with N being a natural number) to @object's object path if an objec... |
| get_connection | `DBusObjectManagerServer.get_connection() -> DBusConnection` | g_dbus_object_manager_server_get_connection | 2.30 | Gets the #GDBusConnection used by @manager. |
| is_exported | `DBusObjectManagerServer.is_exported(object: DBusObjectSkeleton) -> gboolean` | g_dbus_object_manager_server_is_exported | 2.34 | Returns whether @object is currently exported on @manager. |
| set_connection | `DBusObjectManagerServer.set_connection(connection: DBusConnection?) -> none` | g_dbus_object_manager_server_set_connection |  | Exports all objects managed by @manager on @connection. If @connection is %NULL, stops exporting objects. |
| unexport | `DBusObjectManagerServer.unexport(object_path: utf8) -> gboolean` | g_dbus_object_manager_server_unexport | 2.30 | If @manager has an object at @path, removes the object. Otherwise does nothing. Note that @object_path must be in the hierarchy rooted by the objec... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connection | DBusConnection | read, write | The #GDBusConnection to export objects on. |
| object-path | utf8 | read, write, construct-only | The object path to register the manager object at. |

### Gio.DBusObjectProxy

Parent: `GObject.Object` ?? Implements: `DBusObject` ?? GType: `GDBusObjectProxy` ?? C type: `GDBusObjectProxy`

A `GDBusObjectProxy` is an object used to represent a remote object with one or more D-Bus interfaces. Normally, you don???t instantiate a `GDBusOb...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | DBusObjectProxyPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DBusObjectProxy.new(connection: DBusConnection, object_path: utf8) -> DBusObjectProxy` | g_dbus_object_proxy_new | 2.30 | Creates a new #GDBusObjectProxy for the given connection and object path. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_connection | `DBusObjectProxy.get_connection() -> DBusConnection` | g_dbus_object_proxy_get_connection | 2.30 | Gets the connection that @proxy is for. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-connection | DBusConnection | read, write, construct-only | The connection of the proxy. |
| g-object-path | utf8 | read, write, construct-only | The object path of the proxy. |

### Gio.DBusObjectSkeleton

Parent: `GObject.Object` ?? Implements: `DBusObject` ?? GType: `GDBusObjectSkeleton` ?? C type: `GDBusObjectSkeleton`

A `GDBusObjectSkeleton` instance is essentially a group of D-Bus interfaces. The set of exported interfaces on the object may be dynamic and change...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | DBusObjectSkeletonPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DBusObjectSkeleton.new(object_path: utf8) -> DBusObjectSkeleton` | g_dbus_object_skeleton_new | 2.30 | Creates a new #GDBusObjectSkeleton. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_interface | `DBusObjectSkeleton.add_interface(interface_: DBusInterfaceSkeleton) -> none` | g_dbus_object_skeleton_add_interface | 2.30 | Adds @interface_ to @object. If @object already contains a #GDBusInterfaceSkeleton with the same interface name, it is removed before @interface_ i... |
| flush | `DBusObjectSkeleton.flush() -> none` | g_dbus_object_skeleton_flush | 2.30 | This method simply calls g_dbus_interface_skeleton_flush() on all interfaces belonging to @object. See that method for when flushing is useful. |
| remove_interface | `DBusObjectSkeleton.remove_interface(interface_: DBusInterfaceSkeleton) -> none` | g_dbus_object_skeleton_remove_interface | 2.30 | Removes @interface_ from @object. |
| remove_interface_by_name | `DBusObjectSkeleton.remove_interface_by_name(interface_name: utf8) -> none` | g_dbus_object_skeleton_remove_interface_by_name | 2.30 | Removes the #GDBusInterface with @interface_name from @object. If no D-Bus interface of the given interface exists, this function does nothing. |
| set_object_path | `DBusObjectSkeleton.set_object_path(object_path: utf8) -> none` | g_dbus_object_skeleton_set_object_path | 2.30 | Sets the object path for @object. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-object-path | utf8 | read, write | The object path where the object is exported. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| authorize-method | `interface: DBusInterfaceSkeleton, invocation: DBusMethodInvocation` | gboolean | last | 2.30 | Emitted when a method is invoked by a remote caller and used to determine if the method call is authorized. This signal is like #GDBusInterfaceSkel... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authorize_method | `authorize_method(interface_: DBusInterfaceSkeleton, invocation: DBusMethodInvocation) -> gboolean` |  |  | Signal class handler for the #GDBusObjectSkeleton::authorize-method signal. |

### Gio.DBusProxy

Parent: `GObject.Object` ?? Implements: `AsyncInitable`, `DBusInterface`, `Initable` ?? GType: `GDBusProxy` ?? C type: `GDBusProxy`

`GDBusProxy` is a base class used for proxies to access a D-Bus interface on a remote object. A `GDBusProxy` can be constructed for both well-known...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | DBusProxyPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_finish | `DBusProxy.new_finish(res: AsyncResult) -> DBusProxy throws` | g_dbus_proxy_new_finish | 2.26 | Finishes creating a #GDBusProxy. |
| new_for_bus_finish | `DBusProxy.new_for_bus_finish(res: AsyncResult) -> DBusProxy throws` | g_dbus_proxy_new_for_bus_finish | 2.26 | Finishes creating a #GDBusProxy. |
| new_for_bus_sync | `DBusProxy.new_for_bus_sync(bus_type: BusType, flags: DBusProxyFlags, info: DBusInterfaceInfo?, name: utf8, object_path: utf8, interface_name: utf8, cancellable: Cancellable?) -> DBusProxy throws` | g_dbus_proxy_new_for_bus_sync | 2.26 | Like g_dbus_proxy_new_sync() but takes a #GBusType instead of a #GDBusConnection. #GDBusProxy is used in this [example][gdbus-wellknown-proxy]. |
| new_sync | `DBusProxy.new_sync(connection: DBusConnection, flags: DBusProxyFlags, info: DBusInterfaceInfo?, name: utf8?, object_path: utf8, interface_name: utf8, cancellable: Cancellable?) -> DBusProxy throws` | g_dbus_proxy_new_sync | 2.26 | Creates a proxy for accessing @interface_name on the remote object at @object_path owned by @name at @connection and synchronously loads D-Bus prop... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(connection: DBusConnection, flags: DBusProxyFlags, info: DBusInterfaceInfo?, name: utf8?, object_path: utf8, interface_name: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_proxy_new | 2.26 | Creates a proxy for accessing @interface_name on the remote object at @object_path owned by @name at @connection and asynchronously loads D-Bus pro... |
| new_for_bus | `new_for_bus(bus_type: BusType, flags: DBusProxyFlags, info: DBusInterfaceInfo?, name: utf8, object_path: utf8, interface_name: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_proxy_new_for_bus | 2.26 | Like g_dbus_proxy_new() but takes a #GBusType instead of a #GDBusConnection. #GDBusProxy is used in this [example][gdbus-wellknown-proxy]. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| call | `DBusProxy.call(method_name: utf8, parameters: GLib.Variant?, flags: DBusCallFlags, timeout_msec: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_proxy_call | 2.26 | Asynchronously invokes the @method_name method on @proxy. If @method_name contains any dots, then @name is split into interface and method name par... |
| call_finish | `DBusProxy.call_finish(res: AsyncResult) -> GLib.Variant throws` | g_dbus_proxy_call_finish | 2.26 | Finishes an operation started with g_dbus_proxy_call(). |
| call_sync | `DBusProxy.call_sync(method_name: utf8, parameters: GLib.Variant?, flags: DBusCallFlags, timeout_msec: gint, cancellable: Cancellable?) -> GLib.Variant throws` | g_dbus_proxy_call_sync | 2.26 | Synchronously invokes the @method_name method on @proxy. If @method_name contains any dots, then @name is split into interface and method name part... |
| call_with_unix_fd_list | `DBusProxy.call_with_unix_fd_list(method_name: utf8, parameters: GLib.Variant?, flags: DBusCallFlags, timeout_msec: gint, fd_list: UnixFDList?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_proxy_call_with_unix_fd_list | 2.30 | Like g_dbus_proxy_call() but also takes a #GUnixFDList object. This method is only available on UNIX. |
| call_with_unix_fd_list_finish | `DBusProxy.call_with_unix_fd_list_finish(out_fd_list: out UnixFDList?, res: AsyncResult) -> GLib.Variant throws` | g_dbus_proxy_call_with_unix_fd_list_finish | 2.30 | Finishes an operation started with g_dbus_proxy_call_with_unix_fd_list(). |
| call_with_unix_fd_list_sync | `DBusProxy.call_with_unix_fd_list_sync(method_name: utf8, parameters: GLib.Variant?, flags: DBusCallFlags, timeout_msec: gint, fd_list: UnixFDList?, out_fd_list: out UnixFDList?, cancellable: Cancellable?) -> GLib.Variant throws` | g_dbus_proxy_call_with_unix_fd_list_sync | 2.30 | Like g_dbus_proxy_call_sync() but also takes and returns #GUnixFDList objects. This method is only available on UNIX. |
| get_cached_property | `DBusProxy.get_cached_property(property_name: utf8) -> GLib.Variant` | g_dbus_proxy_get_cached_property | 2.26 | Looks up the value for a property from the cache. This call does no blocking IO. If @proxy has an expected interface (see #GDBusProxy:g-interface-i... |
| get_cached_property_names | `DBusProxy.get_cached_property_names() -> utf8` | g_dbus_proxy_get_cached_property_names | 2.26 | Gets the names of all cached properties on @proxy. |
| get_connection | `DBusProxy.get_connection() -> DBusConnection` | g_dbus_proxy_get_connection | 2.26 | Gets the connection @proxy is for. |
| get_default_timeout | `DBusProxy.get_default_timeout() -> gint` | g_dbus_proxy_get_default_timeout | 2.26 | Gets the timeout to use if -1 (specifying default timeout) is passed as @timeout_msec in the g_dbus_proxy_call() and g_dbus_proxy_call_sync() funct... |
| get_flags | `DBusProxy.get_flags() -> DBusProxyFlags` | g_dbus_proxy_get_flags | 2.26 | Gets the flags that @proxy was constructed with. |
| get_interface_info | `DBusProxy.get_interface_info() -> DBusInterfaceInfo` | g_dbus_proxy_get_interface_info | 2.26 | Returns the #GDBusInterfaceInfo, if any, specifying the interface that @proxy conforms to. See the #GDBusProxy:g-interface-info property for more d... |
| get_interface_name | `DBusProxy.get_interface_name() -> utf8` | g_dbus_proxy_get_interface_name | 2.26 | Gets the D-Bus interface name @proxy is for. |
| get_name | `DBusProxy.get_name() -> utf8` | g_dbus_proxy_get_name | 2.26 | Gets the name that @proxy was constructed for. When connected to a message bus, this will usually be non-%NULL. However, it may be %NULL for a prox... |
| get_name_owner | `DBusProxy.get_name_owner() -> utf8` | g_dbus_proxy_get_name_owner | 2.26 | The unique name that owns the name that @proxy is for or %NULL if no-one currently owns that name. You may connect to the #GObject::notify signal t... |
| get_object_path | `DBusProxy.get_object_path() -> utf8` | g_dbus_proxy_get_object_path | 2.26 | Gets the object path @proxy is for. |
| set_cached_property | `DBusProxy.set_cached_property(property_name: utf8, value: GLib.Variant?) -> none` | g_dbus_proxy_set_cached_property | 2.26 | If @value is not %NULL, sets the cached value for the property with name @property_name to the value in @value. If @value is %NULL, then the cached... |
| set_default_timeout | `DBusProxy.set_default_timeout(timeout_msec: gint) -> none` | g_dbus_proxy_set_default_timeout | 2.26 | Sets the timeout to use if -1 (specifying default timeout) is passed as @timeout_msec in the g_dbus_proxy_call() and g_dbus_proxy_call_sync() funct... |
| set_interface_info | `DBusProxy.set_interface_info(info: DBusInterfaceInfo?) -> none` | g_dbus_proxy_set_interface_info | 2.26 | Ensure that interactions with @proxy conform to the given interface. See the #GDBusProxy:g-interface-info property for more details. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| g-bus-type | BusType | write, construct-only | If this property is not %G_BUS_TYPE_NONE, then #GDBusProxy:g-connection must be %NULL and will be set to the #GDBusConnection obtained by calling g... |
| g-connection | DBusConnection | read, write, construct-only | The #GDBusConnection the proxy is for. |
| g-default-timeout | gint | read, write | The timeout to use if -1 (specifying default timeout) is passed as @timeout_msec in the g_dbus_proxy_call() and g_dbus_proxy_call_sync() functions.... |
| g-flags | DBusProxyFlags | read, write, construct-only | Flags from the #GDBusProxyFlags enumeration. |
| g-interface-info | DBusInterfaceInfo | read, write | Ensure that interactions with this proxy conform to the given interface. This is mainly to ensure that malformed data received from the other peer ... |
| g-interface-name | utf8 | read, write, construct-only | The D-Bus interface name the proxy is for. |
| g-name | utf8 | read, write, construct-only | The well-known or unique name that the proxy is for. |
| g-name-owner | utf8 | read | The unique name that owns #GDBusProxy:g-name or %NULL if no-one currently owns that name. You may connect to #GObject::notify signal to track chang... |
| g-object-path | utf8 | read, write, construct-only | The object path the proxy is for. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| g-properties-changed | `changed_properties: GLib.Variant, invalidated_properties: utf8` | none | last | 2.26 | Emitted when one or more D-Bus properties on @proxy changes. The local cache has already been updated when this signal fires. Note that both @chang... |
| g-signal | `sender_name: utf8?, signal_name: utf8, parameters: GLib.Variant` | none | last detailed | 2.26 | Emitted when a signal from the remote object and interface that @proxy is for, has been received. Since 2.72 this signal supports detailed connecti... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| g_properties_changed | `g_properties_changed(changed_properties: GLib.Variant, invalidated_properties: utf8) -> none` |  |  | Signal class handler for the #GDBusProxy::g-properties-changed signal. |
| g_signal | `g_signal(sender_name: utf8, signal_name: utf8, parameters: GLib.Variant) -> none` |  |  | Signal class handler for the #GDBusProxy::g-signal signal. |

### Gio.DBusServer

Parent: `GObject.Object` ?? Implements: `Initable` ?? GType: `GDBusServer` ?? C type: `GDBusServer`

`GDBusServer` is a helper for listening to and accepting D-Bus connections. This can be used to create a new D-Bus server, allowing two peers to us...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_sync | `DBusServer.new_sync(address: utf8, flags: DBusServerFlags, guid: utf8, observer: DBusAuthObserver?, cancellable: Cancellable?) -> DBusServer throws` | g_dbus_server_new_sync | 2.26 | Creates a new D-Bus server that listens on the first address in @address that works. Once constructed, you can use g_dbus_server_get_client_address... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_client_address | `DBusServer.get_client_address() -> utf8` | g_dbus_server_get_client_address | 2.26 | Gets a D-Bus address string that can be used by clients to connect to @server. This is valid and non-empty if initializing the #GDBusServer succeeded. |
| get_flags | `DBusServer.get_flags() -> DBusServerFlags` | g_dbus_server_get_flags | 2.26 | Gets the flags for @server. |
| get_guid | `DBusServer.get_guid() -> utf8` | g_dbus_server_get_guid | 2.26 | Gets the GUID for @server, as provided to g_dbus_server_new_sync(). |
| is_active | `DBusServer.is_active() -> gboolean` | g_dbus_server_is_active | 2.26 | Gets whether @server is active. |
| start | `DBusServer.start() -> none` | g_dbus_server_start | 2.26 | Starts @server. |
| stop | `DBusServer.stop() -> none` | g_dbus_server_stop | 2.26 | Stops @server. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active | gboolean | read | Whether the server is currently active. |
| address | utf8 | read, write, construct-only | The D-Bus address to listen on. |
| authentication-observer | DBusAuthObserver | read, write, construct-only | A #GDBusAuthObserver object to assist in the authentication process or %NULL. |
| client-address | utf8 | read | The D-Bus address that clients can use. |
| flags | DBusServerFlags | read, write, construct-only | Flags from the #GDBusServerFlags enumeration. |
| guid | utf8 | read, write, construct-only | The GUID of the server. See #GDBusConnection:guid for more details. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| new-connection | `connection: DBusConnection` | gboolean | last | 2.26 | Emitted when a new authenticated connection has been made. Use g_dbus_connection_get_peer_credentials() to figure out what identity (if any), was a... |

### Gio.DebugControllerDBus

Parent: `GObject.Object` ?? Implements: `DebugController`, `Initable` ?? GType: `GDebugControllerDBus` ?? C type: `GDebugControllerDBus`

`GDebugControllerDBus` is an implementation of [iface@Gio.DebugController] which exposes debug settings as a D-Bus object. It is a [iface@Gio.Inita...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DebugControllerDBus.new(connection: DBusConnection, cancellable: Cancellable?) -> DebugControllerDBus throws` | g_debug_controller_dbus_new | 2.72 | Create a new #GDebugControllerDBus and synchronously initialize it. Initializing the object will export the debug object on @connection. The object... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| stop | `DebugControllerDBus.stop() -> none` | g_debug_controller_dbus_stop | 2.72 | Stop the debug controller, unregistering its object from the bus. Any pending method calls to the object will complete successfully, but new ones w... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connection | DBusConnection | read, write, construct-only | The D-Bus connection to expose the debugging interface on. Typically this will be the same connection (to the system or session bus) which the rest... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| authorize | `invocation: DBusMethodInvocation` | gboolean | last | 2.72 | Emitted when a D-Bus peer is trying to change the debug settings and used to determine if that is authorized. This signal is emitted in a dedicated... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authorize | `authorize(invocation: DBusMethodInvocation) -> gboolean` |  |  | Default handler for the #GDebugControllerDBus::authorize signal. |

### Gio.DesktopAppInfo

Parent: `GObject.Object` ?? Implements: `AppInfo` ?? GType: `GDesktopAppInfo` ?? C type: `GDesktopAppInfo`

`GDesktopAppInfo` is an implementation of [iface@Gio.AppInfo] based on desktop files. Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-speci...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DesktopAppInfo.new(desktop_id: utf8) -> DesktopAppInfo` | g_desktop_app_info_new |  | Creates a new #GDesktopAppInfo based on a desktop file id. A desktop file id is the basename of the desktop file, including the .desktop extension.... |
| new_from_filename | `DesktopAppInfo.new_from_filename(filename: filename) -> DesktopAppInfo` | g_desktop_app_info_new_from_filename |  | Creates a new #GDesktopAppInfo. |
| new_from_keyfile | `DesktopAppInfo.new_from_keyfile(key_file: GLib.KeyFile) -> DesktopAppInfo` | g_desktop_app_info_new_from_keyfile | 2.18 | Creates a new #GDesktopAppInfo. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_implementations | `get_implementations(interface: utf8) -> GLib.List` | g_desktop_app_info_get_implementations | 2.42 | Gets all applications that implement @interface. An application implements an interface if that interface is listed in the Implements= line of the ... |
| search | `search(search_string: utf8) -> utf8` | g_desktop_app_info_search |  | Searches desktop files for ones that match @search_string. The return value is an array of strvs. Each strv contains a list of applications that ma... |
| set_desktop_env | `set_desktop_env(desktop_env: utf8) -> none` | g_desktop_app_info_set_desktop_env |  | Sets the name of the desktop that the application is running in. This is used by g_app_info_should_show() and g_desktop_app_info_get_show_in() to e... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_action_name | `DesktopAppInfo.get_action_name(action_name: utf8) -> utf8` | g_desktop_app_info_get_action_name | 2.38 | Gets the user-visible display name of the "additional application action" specified by @action_name. This corresponds to the "Name" key within the ... |
| get_boolean | `DesktopAppInfo.get_boolean(key: utf8) -> gboolean` | g_desktop_app_info_get_boolean | 2.36 | Looks up a boolean value in the keyfile backing @info. The @key is looked up in the "Desktop Entry" group. |
| get_categories | `DesktopAppInfo.get_categories() -> utf8` | g_desktop_app_info_get_categories |  | Gets the categories from the desktop file. |
| get_filename | `DesktopAppInfo.get_filename() -> filename` | g_desktop_app_info_get_filename | 2.24 | When @info was created from a known filename, return it. In some situations such as the #GDesktopAppInfo returned from g_desktop_app_info_new_from_... |
| get_generic_name | `DesktopAppInfo.get_generic_name() -> utf8` | g_desktop_app_info_get_generic_name |  | Gets the generic name from the desktop file. |
| get_is_hidden | `DesktopAppInfo.get_is_hidden() -> gboolean` | g_desktop_app_info_get_is_hidden |  | A desktop file is hidden if the Hidden key in it is set to True. |
| get_keywords | `DesktopAppInfo.get_keywords() -> utf8` | g_desktop_app_info_get_keywords | 2.32 | Gets the keywords from the desktop file. |
| get_locale_string | `DesktopAppInfo.get_locale_string(key: utf8) -> utf8` | g_desktop_app_info_get_locale_string | 2.56 | Looks up a localized string value in the keyfile backing @info translated to the current locale. The @key is looked up in the "Desktop Entry" group. |
| get_nodisplay | `DesktopAppInfo.get_nodisplay() -> gboolean` | g_desktop_app_info_get_nodisplay | 2.30 | Gets the value of the NoDisplay key, which helps determine if the application info should be shown in menus. See %G_KEY_FILE_DESKTOP_KEY_NO_DISPLAY... |
| get_show_in | `DesktopAppInfo.get_show_in(desktop_env: utf8?) -> gboolean` | g_desktop_app_info_get_show_in | 2.30 | Checks if the application info should be shown in menus that list available applications for a specific name of the desktop, based on the `OnlyShow... |
| get_startup_wm_class | `DesktopAppInfo.get_startup_wm_class() -> utf8` | g_desktop_app_info_get_startup_wm_class | 2.34 | Retrieves the StartupWMClass field from @info. This represents the WM_CLASS property of the main window of the application, if launched through @info. |
| get_string | `DesktopAppInfo.get_string(key: utf8) -> utf8` | g_desktop_app_info_get_string | 2.36 | Looks up a string value in the keyfile backing @info. The @key is looked up in the "Desktop Entry" group. |
| get_string_list | `DesktopAppInfo.get_string_list(key: utf8, length: out gsize?) -> utf8` | g_desktop_app_info_get_string_list | 2.60 | Looks up a string list value in the keyfile backing @info. The @key is looked up in the "Desktop Entry" group. |
| has_key | `DesktopAppInfo.has_key(key: utf8) -> gboolean` | g_desktop_app_info_has_key | 2.36 | Returns whether @key exists in the "Desktop Entry" group of the keyfile backing @info. |
| launch_action | `DesktopAppInfo.launch_action(action_name: utf8, launch_context: AppLaunchContext?) -> none` | g_desktop_app_info_launch_action | 2.38 | Activates the named application action. You may only call this function on action names that were returned from g_desktop_app_info_list_actions(). ... |
| launch_uris_as_manager | `DesktopAppInfo.launch_uris_as_manager(uris: GLib.List, launch_context: AppLaunchContext?, spawn_flags: GLib.SpawnFlags, user_setup: GLib.SpawnChildSetupFunc?, user_setup_data: gpointer?, pid_callback: DesktopAppLaunchCallback?, pid_callback_data: gpointer?) -> gboolean throws` | g_desktop_app_info_launch_uris_as_manager |  | This function performs the equivalent of g_app_info_launch_uris(), but is intended primarily for operating system components that launch applicatio... |
| launch_uris_as_manager_with_fds | `DesktopAppInfo.launch_uris_as_manager_with_fds(uris: GLib.List, launch_context: AppLaunchContext?, spawn_flags: GLib.SpawnFlags, user_setup: GLib.SpawnChildSetupFunc?, user_setup_data: gpointer?, pid_callback: DesktopAppLaunchCallback?, pid_callback_data: gpointer?, stdin_fd: gint, stdout_fd: gint, stderr_fd: gint) -> gboolean throws` | g_desktop_app_info_launch_uris_as_manager_with_fds | 2.58 | Equivalent to g_desktop_app_info_launch_uris_as_manager() but allows you to pass in file descriptors for the stdin, stdout and stderr streams of th... |
| list_actions | `DesktopAppInfo.list_actions() -> utf8` | g_desktop_app_info_list_actions | 2.38 | Returns the list of "additional application actions" supported on the desktop file, as per the desktop file specification. As per the specification... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only | The origin filename of this #GDesktopAppInfo |

### Gio.Emblem

Parent: `GObject.Object` ?? Implements: `Icon` ?? GType: `GEmblem` ?? C type: `GEmblem`

`GEmblem` is an implementation of [iface@Gio.Icon] that supports having an emblem, which is an icon with additional properties. It can than be adde...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Emblem.new(icon: Icon) -> Emblem` | g_emblem_new | 2.18 | Creates a new emblem for @icon. |
| new_with_origin | `Emblem.new_with_origin(icon: Icon, origin: EmblemOrigin) -> Emblem` | g_emblem_new_with_origin | 2.18 | Creates a new emblem for @icon. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_icon | `Emblem.get_icon() -> Icon` | g_emblem_get_icon | 2.18 | Gives back the icon from @emblem. |
| get_origin | `Emblem.get_origin() -> EmblemOrigin` | g_emblem_get_origin | 2.18 | Gets the origin of the emblem. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| icon | GObject.Object | read, write, construct-only | The actual icon of the emblem. |
| origin | EmblemOrigin | read, write, construct-only | The origin the emblem is derived from. |

### Gio.EmblemedIcon

Parent: `GObject.Object` ?? Implements: `Icon` ?? GType: `GEmblemedIcon` ?? C type: `GEmblemedIcon`

`GEmblemedIcon` is an implementation of [iface@Gio.Icon] that supports adding an emblem to an icon. Adding multiple emblems to an icon is ensured v...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | EmblemedIconPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `EmblemedIcon.new(icon: Icon, emblem: Emblem?) -> EmblemedIcon` | g_emblemed_icon_new | 2.18 | Creates a new emblemed icon for @icon with the emblem @emblem. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_emblem | `EmblemedIcon.add_emblem(emblem: Emblem) -> none` | g_emblemed_icon_add_emblem | 2.18 | Adds @emblem to the #GList of #GEmblems. |
| clear_emblems | `EmblemedIcon.clear_emblems() -> none` | g_emblemed_icon_clear_emblems | 2.28 | Removes all the emblems from @icon. |
| get_emblems | `EmblemedIcon.get_emblems() -> GLib.List` | g_emblemed_icon_get_emblems | 2.18 | Gets the list of emblems for the @icon. |
| get_icon | `EmblemedIcon.get_icon() -> Icon` | g_emblemed_icon_get_icon | 2.18 | Gets the main icon for @emblemed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| gicon | Icon | read, write, construct-only | The [iface@Gio.Icon] to attach emblems to. |

### Gio.FileEnumerator

Parent: `GObject.Object` ?? GType: `GFileEnumerator` ?? C type: `GFileEnumerator`

`GFileEnumerator` allows you to operate on a set of [iface@Gio.File] objects, returning a [class@Gio.FileInfo] structure for each file enumerated (...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | FileEnumeratorPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `FileEnumerator.close(cancellable: Cancellable?) -> gboolean throws` | g_file_enumerator_close |  | Releases all resources used by this enumerator, making the enumerator return %G_IO_ERROR_CLOSED on all calls. This will be automatically called whe... |
| close_async | `FileEnumerator.close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_enumerator_close_async |  | Asynchronously closes the file enumerator. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable object f... |
| close_finish | `FileEnumerator.close_finish(result: AsyncResult) -> gboolean throws` | g_file_enumerator_close_finish |  | Finishes closing a file enumerator, started from g_file_enumerator_close_async(). If the file enumerator was already closed when g_file_enumerator_... |
| get_child | `FileEnumerator.get_child(info: FileInfo) -> File` | g_file_enumerator_get_child | 2.36 | Return a new #GFile which refers to the file named by @info in the source directory of @enumerator. This function is primarily intended to be used ... |
| get_container | `FileEnumerator.get_container() -> File` | g_file_enumerator_get_container | 2.18 | Get the #GFile container which is being enumerated. |
| has_pending | `FileEnumerator.has_pending() -> gboolean` | g_file_enumerator_has_pending |  | Checks if the file enumerator has pending operations. |
| is_closed | `FileEnumerator.is_closed() -> gboolean` | g_file_enumerator_is_closed |  | Checks if the file enumerator has been closed. |
| iterate | `FileEnumerator.iterate(out_info: out FileInfo?, out_child: out File?, cancellable: Cancellable?) -> gboolean throws` | g_file_enumerator_iterate | 2.44 | This is a version of g_file_enumerator_next_file() that's easier to use correctly from C programs. With g_file_enumerator_next_file(), the gboolean... |
| next_file | `FileEnumerator.next_file(cancellable: Cancellable?) -> FileInfo throws` | g_file_enumerator_next_file |  | Returns information for the next file in the enumerated object. Will block until the information is available. The #GFileInfo returned from this fu... |
| next_files_async | `FileEnumerator.next_files_async(num_files: gint, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_enumerator_next_files_async |  | Request information for a number of files from the enumerator asynchronously. When all I/O for the operation is finished the @callback will be call... |
| next_files_finish | `FileEnumerator.next_files_finish(result: AsyncResult) -> GLib.List throws` | g_file_enumerator_next_files_finish |  | Finishes the asynchronous operation started with g_file_enumerator_next_files_async(). |
| set_pending | `FileEnumerator.set_pending(pending: gboolean) -> none` | g_file_enumerator_set_pending |  | Sets the file enumerator as having pending operations. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| container | File | write, construct-only | The container that is being enumerated. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close_async | `close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously closes the file enumerator. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable object f... |
| close_finish | `close_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes closing a file enumerator, started from g_file_enumerator_close_async(). If the file enumerator was already closed when g_file_enumerator_... |
| close_fn | `close_fn(cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| next_file | `next_file(cancellable: Cancellable?) -> FileInfo throws` |  |  | Returns information for the next file in the enumerated object. Will block until the information is available. The #GFileInfo returned from this fu... |
| next_files_async | `next_files_async(num_files: gint, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Request information for a number of files from the enumerator asynchronously. When all I/O for the operation is finished the @callback will be call... |
| next_files_finish | `next_files_finish(result: AsyncResult) -> GLib.List throws` |  |  | Finishes the asynchronous operation started with g_file_enumerator_next_files_async(). |

### Gio.FileIcon

Parent: `GObject.Object` ?? Implements: `Icon`, `LoadableIcon` ?? GType: `GFileIcon` ?? C type: `GFileIcon`

`GFileIcon` specifies an icon by pointing to an image file to be used as icon. It implements [iface@Gio.LoadableIcon].

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FileIcon.new(file: File) -> FileIcon` | g_file_icon_new |  | Creates a new icon for a file. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_file | `FileIcon.get_file() -> File` | g_file_icon_get_file |  | Gets the #GFile associated with the given @icon. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| file | File | read, write, construct-only | The file containing the icon. |

### Gio.FileInfo

Parent: `GObject.Object` ?? GType: `GFileInfo` ?? C type: `GFileInfo`

Stores information about a file system object referenced by a [iface@Gio.File]. Functionality for manipulating basic metadata for files. `GFileInfo...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FileInfo.new() -> FileInfo` | g_file_info_new |  | Creates a new file info structure. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_status | `FileInfo.clear_status() -> none` | g_file_info_clear_status |  | Clears the status information from @info. |
| copy_into | `FileInfo.copy_into(dest_info: FileInfo) -> none` | g_file_info_copy_into |  | First clears all of the [GFileAttribute][gio-GFileAttribute] of @dest_info, and then copies all of the file attributes from @src_info to @dest_info. |
| dup | `FileInfo.dup() -> FileInfo` | g_file_info_dup |  | Duplicates a file info structure. |
| get_access_date_time | `FileInfo.get_access_date_time() -> GLib.DateTime` | g_file_info_get_access_date_time | 2.70 | Gets the access time of the current @info and returns it as a #GDateTime. It is an error to call this if the #GFileInfo does not contain %G_FILE_AT... |
| get_attribute_as_string | `FileInfo.get_attribute_as_string(attribute: utf8) -> utf8` | g_file_info_get_attribute_as_string |  | Gets the value of an attribute, formatted as a string. This escapes things as needed to make the string valid UTF-8. |
| get_attribute_boolean | `FileInfo.get_attribute_boolean(attribute: utf8) -> gboolean` | g_file_info_get_attribute_boolean |  | Gets the value of a boolean attribute. If the attribute does not contain a boolean value, %FALSE will be returned. |
| get_attribute_byte_string | `FileInfo.get_attribute_byte_string(attribute: utf8) -> utf8` | g_file_info_get_attribute_byte_string |  | Gets the value of a byte string attribute. If the attribute does not contain a byte string, %NULL will be returned. |
| get_attribute_data | `FileInfo.get_attribute_data(attribute: utf8, type: out FileAttributeType?, value_pp: out gpointer?, status: out FileAttributeStatus?) -> gboolean` | g_file_info_get_attribute_data |  | Gets the attribute type, value and status for an attribute key. |
| get_attribute_file_path | `FileInfo.get_attribute_file_path(attribute: utf8) -> filename` | g_file_info_get_attribute_file_path | 2.78 | Gets the value of a byte string attribute as a file path. If the attribute does not contain a byte string, `NULL` will be returned. This function i... |
| get_attribute_int32 | `FileInfo.get_attribute_int32(attribute: utf8) -> gint32` | g_file_info_get_attribute_int32 |  | Gets a signed 32-bit integer contained within the attribute. If the attribute does not contain a signed 32-bit integer, or is invalid, 0 will be re... |
| get_attribute_int64 | `FileInfo.get_attribute_int64(attribute: utf8) -> gint64` | g_file_info_get_attribute_int64 |  | Gets a signed 64-bit integer contained within the attribute. If the attribute does not contain a signed 64-bit integer, or is invalid, 0 will be re... |
| get_attribute_object | `FileInfo.get_attribute_object(attribute: utf8) -> GObject.Object` | g_file_info_get_attribute_object |  | Gets the value of a #GObject attribute. If the attribute does not contain a #GObject, %NULL will be returned. |
| get_attribute_status | `FileInfo.get_attribute_status(attribute: utf8) -> FileAttributeStatus` | g_file_info_get_attribute_status |  | Gets the attribute status for an attribute key. |
| get_attribute_string | `FileInfo.get_attribute_string(attribute: utf8) -> utf8` | g_file_info_get_attribute_string |  | Gets the value of a string attribute. If the attribute does not contain a string, %NULL will be returned. |
| get_attribute_stringv | `FileInfo.get_attribute_stringv(attribute: utf8) -> utf8` | g_file_info_get_attribute_stringv | 2.22 | Gets the value of a stringv attribute. If the attribute does not contain a stringv, %NULL will be returned. |
| get_attribute_type | `FileInfo.get_attribute_type(attribute: utf8) -> FileAttributeType` | g_file_info_get_attribute_type |  | Gets the attribute type for an attribute key. |
| get_attribute_uint32 | `FileInfo.get_attribute_uint32(attribute: utf8) -> guint32` | g_file_info_get_attribute_uint32 |  | Gets an unsigned 32-bit integer contained within the attribute. If the attribute does not contain an unsigned 32-bit integer, or is invalid, 0 will... |
| get_attribute_uint64 | `FileInfo.get_attribute_uint64(attribute: utf8) -> guint64` | g_file_info_get_attribute_uint64 |  | Gets a unsigned 64-bit integer contained within the attribute. If the attribute does not contain an unsigned 64-bit integer, or is invalid, 0 will ... |
| get_content_type | `FileInfo.get_content_type() -> utf8` | g_file_info_get_content_type |  | Gets the file's content type. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE. |
| get_creation_date_time | `FileInfo.get_creation_date_time() -> GLib.DateTime` | g_file_info_get_creation_date_time | 2.70 | Gets the creation time of the current @info and returns it as a #GDateTime. It is an error to call this if the #GFileInfo does not contain %G_FILE_... |
| get_deletion_date | `FileInfo.get_deletion_date() -> GLib.DateTime` | g_file_info_get_deletion_date | 2.36 | Returns the #GDateTime representing the deletion date of the file, as available in %G_FILE_ATTRIBUTE_TRASH_DELETION_DATE. If the %G_FILE_ATTRIBUTE_... |
| get_display_name | `FileInfo.get_display_name() -> utf8` | g_file_info_get_display_name |  | Gets a display name for a file. This is guaranteed to always be set. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBU... |
| get_edit_name | `FileInfo.get_edit_name() -> utf8` | g_file_info_get_edit_name |  | Gets the edit name for a file. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME. |
| get_etag | `FileInfo.get_etag() -> utf8` | g_file_info_get_etag |  | Gets the entity tag for a given #GFileInfo. See %G_FILE_ATTRIBUTE_ETAG_VALUE. It is an error to call this if the #GFileInfo does not contain %G_FIL... |
| get_file_type | `FileInfo.get_file_type() -> FileType` | g_file_info_get_file_type |  | Gets a file's type (whether it is a regular file, symlink, etc). This is different from the file's content type, see g_file_info_get_content_type()... |
| get_icon | `FileInfo.get_icon() -> Icon` | g_file_info_get_icon |  | Gets the icon for a file. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_ICON. |
| get_is_backup | `FileInfo.get_is_backup() -> gboolean` | g_file_info_get_is_backup |  | Checks if a file is a backup file. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_IS_BACKUP. |
| get_is_hidden | `FileInfo.get_is_hidden() -> gboolean` | g_file_info_get_is_hidden |  | Checks if a file is hidden. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN. |
| get_is_symlink | `FileInfo.get_is_symlink() -> gboolean` | g_file_info_get_is_symlink |  | Checks if a file is a symlink. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK. |
| get_modification_date_time | `FileInfo.get_modification_date_time() -> GLib.DateTime` | g_file_info_get_modification_date_time | 2.62 | Gets the modification time of the current @info and returns it as a #GDateTime. It is an error to call this if the #GFileInfo does not contain %G_F... |
| get_modification_time | `FileInfo.get_modification_time(result: out GLib.TimeVal) -> none` | g_file_info_get_modification_time |  | Gets the modification time of the current @info and sets it in @result. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTR... |
| get_name | `FileInfo.get_name() -> filename` | g_file_info_get_name |  | Gets the name for a file. This is guaranteed to always be set. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STA... |
| get_size | `FileInfo.get_size() -> gint64` | g_file_info_get_size |  | Gets the file's size (in bytes). The size is retrieved through the value of the %G_FILE_ATTRIBUTE_STANDARD_SIZE attribute and is converted from #gu... |
| get_sort_order | `FileInfo.get_sort_order() -> gint32` | g_file_info_get_sort_order |  | Gets the value of the sort_order attribute from the #GFileInfo. See %G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER. It is an error to call this if the #GFil... |
| get_symbolic_icon | `FileInfo.get_symbolic_icon() -> Icon` | g_file_info_get_symbolic_icon | 2.34 | Gets the symbolic icon for a file. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON. |
| get_symlink_target | `FileInfo.get_symlink_target() -> filename` | g_file_info_get_symlink_target |  | Gets the symlink target for a given #GFileInfo. It is an error to call this if the #GFileInfo does not contain %G_FILE_ATTRIBUTE_STANDARD_SYMLINK_T... |
| has_attribute | `FileInfo.has_attribute(attribute: utf8) -> gboolean` | g_file_info_has_attribute |  | Checks if a file info structure has an attribute named @attribute. |
| has_namespace | `FileInfo.has_namespace(name_space: utf8) -> gboolean` | g_file_info_has_namespace | 2.22 | Checks if a file info structure has an attribute in the specified @name_space. |
| list_attributes | `FileInfo.list_attributes(name_space: utf8?) -> utf8` | g_file_info_list_attributes |  | Lists the file info structure's attributes. |
| remove_attribute | `FileInfo.remove_attribute(attribute: utf8) -> none` | g_file_info_remove_attribute |  | Removes all cases of @attribute from @info if it exists. |
| set_access_date_time | `FileInfo.set_access_date_time(atime: GLib.DateTime) -> none` | g_file_info_set_access_date_time | 2.70 | Sets the %G_FILE_ATTRIBUTE_TIME_ACCESS and %G_FILE_ATTRIBUTE_TIME_ACCESS_USEC attributes in the file info to the given date/time value. %G_FILE_ATT... |
| set_attribute | `FileInfo.set_attribute(attribute: utf8, type: FileAttributeType, value_p: gpointer) -> none` | g_file_info_set_attribute |  | Sets the @attribute to contain the given value, if possible. To unset the attribute, use %G_FILE_ATTRIBUTE_TYPE_INVALID for @type. |
| set_attribute_boolean | `FileInfo.set_attribute_boolean(attribute: utf8, attr_value: gboolean) -> none` | g_file_info_set_attribute_boolean |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_byte_string | `FileInfo.set_attribute_byte_string(attribute: utf8, attr_value: utf8) -> none` | g_file_info_set_attribute_byte_string |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_file_path | `FileInfo.set_attribute_file_path(attribute: utf8, attr_value: filename) -> none` | g_file_info_set_attribute_file_path | 2.78 | Sets the @attribute to contain the given @attr_value, if possible. This function is meant to be used by language bindings that have specific handli... |
| set_attribute_int32 | `FileInfo.set_attribute_int32(attribute: utf8, attr_value: gint32) -> none` | g_file_info_set_attribute_int32 |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_int64 | `FileInfo.set_attribute_int64(attribute: utf8, attr_value: gint64) -> none` | g_file_info_set_attribute_int64 |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_mask | `FileInfo.set_attribute_mask(mask: FileAttributeMatcher) -> none` | g_file_info_set_attribute_mask |  | Sets @mask on @info to match specific attribute types. |
| set_attribute_object | `FileInfo.set_attribute_object(attribute: utf8, attr_value: GObject.Object) -> none` | g_file_info_set_attribute_object |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_status | `FileInfo.set_attribute_status(attribute: utf8, status: FileAttributeStatus) -> gboolean` | g_file_info_set_attribute_status | 2.22 | Sets the attribute status for an attribute key. This is only needed by external code that implement g_file_set_attributes_from_info() or similar fu... |
| set_attribute_string | `FileInfo.set_attribute_string(attribute: utf8, attr_value: utf8) -> none` | g_file_info_set_attribute_string |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_stringv | `FileInfo.set_attribute_stringv(attribute: utf8, attr_value: utf8) -> none` | g_file_info_set_attribute_stringv |  | Sets the @attribute to contain the given @attr_value, if possible. Sinze: 2.22 |
| set_attribute_uint32 | `FileInfo.set_attribute_uint32(attribute: utf8, attr_value: guint32) -> none` | g_file_info_set_attribute_uint32 |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_attribute_uint64 | `FileInfo.set_attribute_uint64(attribute: utf8, attr_value: guint64) -> none` | g_file_info_set_attribute_uint64 |  | Sets the @attribute to contain the given @attr_value, if possible. |
| set_content_type | `FileInfo.set_content_type(content_type: utf8) -> none` | g_file_info_set_content_type |  | Sets the content type attribute for a given #GFileInfo. See %G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE. |
| set_creation_date_time | `FileInfo.set_creation_date_time(creation_time: GLib.DateTime) -> none` | g_file_info_set_creation_date_time | 2.70 | Sets the %G_FILE_ATTRIBUTE_TIME_CREATED and %G_FILE_ATTRIBUTE_TIME_CREATED_USEC attributes in the file info to the given date/time value. %G_FILE_A... |
| set_display_name | `FileInfo.set_display_name(display_name: utf8) -> none` | g_file_info_set_display_name |  | Sets the display name for the current #GFileInfo. See %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME. |
| set_edit_name | `FileInfo.set_edit_name(edit_name: utf8) -> none` | g_file_info_set_edit_name |  | Sets the edit name for the current file. See %G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME. |
| set_file_type | `FileInfo.set_file_type(type: FileType) -> none` | g_file_info_set_file_type |  | Sets the file type in a #GFileInfo to @type. See %G_FILE_ATTRIBUTE_STANDARD_TYPE. |
| set_icon | `FileInfo.set_icon(icon: Icon) -> none` | g_file_info_set_icon |  | Sets the icon for a given #GFileInfo. See %G_FILE_ATTRIBUTE_STANDARD_ICON. |
| set_is_hidden | `FileInfo.set_is_hidden(is_hidden: gboolean) -> none` | g_file_info_set_is_hidden |  | Sets the "is_hidden" attribute in a #GFileInfo according to @is_hidden. See %G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN. |
| set_is_symlink | `FileInfo.set_is_symlink(is_symlink: gboolean) -> none` | g_file_info_set_is_symlink |  | Sets the "is_symlink" attribute in a #GFileInfo according to @is_symlink. See %G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK. |
| set_modification_date_time | `FileInfo.set_modification_date_time(mtime: GLib.DateTime) -> none` | g_file_info_set_modification_date_time | 2.62 | Sets the %G_FILE_ATTRIBUTE_TIME_MODIFIED and %G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC attributes in the file info to the given date/time value. %G_FILE... |
| set_modification_time | `FileInfo.set_modification_time(mtime: GLib.TimeVal) -> none` | g_file_info_set_modification_time |  | Sets the %G_FILE_ATTRIBUTE_TIME_MODIFIED and %G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC attributes in the file info to the given time value. %G_FILE_ATTR... |
| set_name | `FileInfo.set_name(name: filename) -> none` | g_file_info_set_name |  | Sets the name attribute for the current #GFileInfo. See %G_FILE_ATTRIBUTE_STANDARD_NAME. |
| set_size | `FileInfo.set_size(size: gint64) -> none` | g_file_info_set_size |  | Sets the %G_FILE_ATTRIBUTE_STANDARD_SIZE attribute in the file info to the given size. |
| set_sort_order | `FileInfo.set_sort_order(sort_order: gint32) -> none` | g_file_info_set_sort_order |  | Sets the sort order attribute in the file info structure. See %G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER. |
| set_symbolic_icon | `FileInfo.set_symbolic_icon(icon: Icon) -> none` | g_file_info_set_symbolic_icon | 2.34 | Sets the symbolic icon for a given #GFileInfo. See %G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON. |
| set_symlink_target | `FileInfo.set_symlink_target(symlink_target: filename) -> none` | g_file_info_set_symlink_target |  | Sets the %G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET attribute in the file info to the given symlink target. |
| unset_attribute_mask | `FileInfo.unset_attribute_mask() -> none` | g_file_info_unset_attribute_mask |  | Unsets a mask set by g_file_info_set_attribute_mask(), if one is set. |

### Gio.FileInputStream

Parent: `InputStream` ?? Implements: `Seekable` ?? GType: `GFileInputStream` ?? C type: `GFileInputStream`

`GFileInputStream` provides input streams that take their content from a file. `GFileInputStream` implements [iface@Gio.Seekable], which allows the...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | InputStream |
| priv | FileInputStreamPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| query_info | `FileInputStream.query_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` | g_file_input_stream_query_info |  | Queries a file input stream the given @attributes. This function blocks while querying the stream. For the asynchronous (non-blocking) version of t... |
| query_info_async | `FileInputStream.query_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_input_stream_query_info_async |  | Queries the stream information asynchronously. When the operation is finished @callback will be called. You can then call g_file_input_stream_query... |
| query_info_finish | `FileInputStream.query_info_finish(result: AsyncResult) -> FileInfo throws` | g_file_input_stream_query_info_finish |  | Finishes an asynchronous info query operation. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_seek | `can_seek() -> gboolean` |  |  |  |
| query_info | `query_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` |  |  | Queries a file input stream the given @attributes. This function blocks while querying the stream. For the asynchronous (non-blocking) version of t... |
| query_info_async | `query_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Queries the stream information asynchronously. When the operation is finished @callback will be called. You can then call g_file_input_stream_query... |
| query_info_finish | `query_info_finish(result: AsyncResult) -> FileInfo throws` |  |  | Finishes an asynchronous info query operation. |
| seek | `seek(offset: gint64, type: GLib.SeekType, cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| tell | `tell() -> gint64` |  |  |  |

### Gio.FileIOStream

Parent: `IOStream` ?? Implements: `Seekable` ?? GType: `GFileIOStream` ?? C type: `GFileIOStream`

`GFileIOStream` provides I/O streams that both read and write to the same file handle. `GFileIOStream` implements [iface@Gio.Seekable], which allow...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | IOStream |
| priv | FileIOStreamPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_etag | `FileIOStream.get_etag() -> utf8` | g_file_io_stream_get_etag | 2.22 | Gets the entity tag for the file when it has been written. This must be called after the stream has been written and closed, as the etag can change... |
| query_info | `FileIOStream.query_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` | g_file_io_stream_query_info | 2.22 | Queries a file io stream for the given @attributes. This function blocks while querying the stream. For the asynchronous version of this function, ... |
| query_info_async | `FileIOStream.query_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_io_stream_query_info_async | 2.22 | Asynchronously queries the @stream for a #GFileInfo. When completed, @callback will be called with a #GAsyncResult which can be used to finish the ... |
| query_info_finish | `FileIOStream.query_info_finish(result: AsyncResult) -> FileInfo throws` | g_file_io_stream_query_info_finish | 2.22 | Finalizes the asynchronous query started by g_file_io_stream_query_info_async(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_seek | `can_seek() -> gboolean` |  |  |  |
| can_truncate | `can_truncate() -> gboolean` |  |  |  |
| get_etag | `get_etag() -> utf8` |  | 2.22 | Gets the entity tag for the file when it has been written. This must be called after the stream has been written and closed, as the etag can change... |
| query_info | `query_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` |  | 2.22 | Queries a file io stream for the given @attributes. This function blocks while querying the stream. For the asynchronous version of this function, ... |
| query_info_async | `query_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Asynchronously queries the @stream for a #GFileInfo. When completed, @callback will be called with a #GAsyncResult which can be used to finish the ... |
| query_info_finish | `query_info_finish(result: AsyncResult) -> FileInfo throws` |  | 2.22 | Finalizes the asynchronous query started by g_file_io_stream_query_info_async(). |
| seek | `seek(offset: gint64, type: GLib.SeekType, cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| tell | `tell() -> gint64` |  |  |  |
| truncate_fn | `truncate_fn(size: gint64, cancellable: Cancellable?) -> gboolean throws` |  |  |  |

### Gio.FileMonitor

Parent: `GObject.Object` ?? GType: `GFileMonitor` ?? C type: `GFileMonitor` ?? Abstract

Monitors a file or directory for changes. To obtain a `GFileMonitor` for a file or directory, use [method@Gio.File.monitor], [method@Gio.File.monit...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | FileMonitorPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel | `FileMonitor.cancel() -> gboolean` | g_file_monitor_cancel |  | Cancels a file monitor. |
| emit_event | `FileMonitor.emit_event(child: File, other_file: File, event_type: FileMonitorEvent) -> none` | g_file_monitor_emit_event |  | Emits the #GFileMonitor::changed signal if a change has taken place. Should be called from file monitor implementations only. Implementations are r... |
| is_cancelled | `FileMonitor.is_cancelled() -> gboolean` | g_file_monitor_is_cancelled |  | Returns whether the monitor is canceled. |
| set_rate_limit | `FileMonitor.set_rate_limit(limit_msecs: gint) -> none` | g_file_monitor_set_rate_limit |  | Sets the rate limit to which the @monitor will report consecutive change events to the same file. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cancelled | gboolean | read | Whether the monitor has been cancelled. |
| rate-limit | gint | read, write | The limit of the monitor to watch for changes, in milliseconds. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `file: File, other_file: File?, event_type: FileMonitorEvent` | none | last |  | Emitted when @file has been changed. If using %G_FILE_MONITOR_WATCH_MOVES on a directory monitor, and the information is available (and if supporte... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel | `cancel() -> gboolean` |  |  | Cancels a file monitor. |
| changed | `changed(file: File, other_file: File, event_type: FileMonitorEvent) -> none` |  |  |  |

### Gio.FilenameCompleter

Parent: `GObject.Object` ?? GType: `GFilenameCompleter` ?? C type: `GFilenameCompleter`

Completes partial file and directory names given a partial string by looking in the file system for clues. Can return a list of possible completion...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FilenameCompleter.new() -> FilenameCompleter` | g_filename_completer_new |  | Creates a new filename completer. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_completion_suffix | `FilenameCompleter.get_completion_suffix(initial_text: utf8) -> utf8` | g_filename_completer_get_completion_suffix |  | Obtains a completion for @initial_text from @completer. |
| get_completions | `FilenameCompleter.get_completions(initial_text: utf8) -> utf8` | g_filename_completer_get_completions |  | Gets an array of completion strings for a given initial text. |
| set_dirs_only | `FilenameCompleter.set_dirs_only(dirs_only: gboolean) -> none` | g_filename_completer_set_dirs_only |  | If @dirs_only is %TRUE, @completer will only complete directory names, and not file names. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| got-completion-data | `` | none | last |  | Emitted when the file name completion information comes available. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| got_completion_data | `got_completion_data() -> none` |  |  |  |

### Gio.FileOutputStream

Parent: `OutputStream` ?? Implements: `Seekable` ?? GType: `GFileOutputStream` ?? C type: `GFileOutputStream`

`GFileOutputStream` provides output streams that write their content to a file. `GFileOutputStream` implements [iface@Gio.Seekable], which allows t...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | OutputStream |
| priv | FileOutputStreamPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_etag | `FileOutputStream.get_etag() -> utf8` | g_file_output_stream_get_etag |  | Gets the entity tag for the file when it has been written. This must be called after the stream has been written and closed, as the etag can change... |
| query_info | `FileOutputStream.query_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` | g_file_output_stream_query_info |  | Queries a file output stream for the given @attributes. This function blocks while querying the stream. For the asynchronous version of this functi... |
| query_info_async | `FileOutputStream.query_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_output_stream_query_info_async |  | Asynchronously queries the @stream for a #GFileInfo. When completed, @callback will be called with a #GAsyncResult which can be used to finish the ... |
| query_info_finish | `FileOutputStream.query_info_finish(result: AsyncResult) -> FileInfo throws` | g_file_output_stream_query_info_finish |  | Finalizes the asynchronous query started by g_file_output_stream_query_info_async(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_seek | `can_seek() -> gboolean` |  |  |  |
| can_truncate | `can_truncate() -> gboolean` |  |  |  |
| get_etag | `get_etag() -> utf8` |  |  | Gets the entity tag for the file when it has been written. This must be called after the stream has been written and closed, as the etag can change... |
| query_info | `query_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` |  |  | Queries a file output stream for the given @attributes. This function blocks while querying the stream. For the asynchronous version of this functi... |
| query_info_async | `query_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously queries the @stream for a #GFileInfo. When completed, @callback will be called with a #GAsyncResult which can be used to finish the ... |
| query_info_finish | `query_info_finish(result: AsyncResult) -> FileInfo throws` |  |  | Finalizes the asynchronous query started by g_file_output_stream_query_info_async(). |
| seek | `seek(offset: gint64, type: GLib.SeekType, cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| tell | `tell() -> gint64` |  |  |  |
| truncate_fn | `truncate_fn(size: gint64, cancellable: Cancellable?) -> gboolean throws` |  |  |  |

### Gio.FilterInputStream

Parent: `InputStream` ?? Subclasses: `BufferedInputStream`, `ConverterInputStream` ?? GType: `GFilterInputStream` ?? C type: `GFilterInputStream` ?? Abstract

Base class for input stream implementations that perform some kind of filtering operation on a base stream. Typical examples of filtering operation...

#### Fields

| Field | Type |
| --- | --- |
| base_stream | InputStream |
| parent_instance | InputStream |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_base_stream | `FilterInputStream.get_base_stream() -> InputStream` | g_filter_input_stream_get_base_stream |  | Gets the base stream for the filter stream. |
| get_close_base_stream | `FilterInputStream.get_close_base_stream() -> gboolean` | g_filter_input_stream_get_close_base_stream |  | Returns whether the base stream will be closed when @stream is closed. |
| set_close_base_stream | `FilterInputStream.set_close_base_stream(close_base: gboolean) -> none` | g_filter_input_stream_set_close_base_stream |  | Sets whether the base stream will be closed when @stream is closed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| base-stream | InputStream | read, write, construct-only | The underlying base stream on which the I/O ops will be done. |
| close-base-stream | gboolean | read, write | Whether the base stream should be closed when the filter stream is closed. |

### Gio.FilterOutputStream

Parent: `OutputStream` ?? Subclasses: `BufferedOutputStream`, `ConverterOutputStream`, `DataOutputStream` ?? GType: `GFilterOutputStream` ?? C type: `GFilterOutputStream` ?? Abstract

Base class for output stream implementations that perform some kind of filtering operation on a base stream. Typical examples of filtering operatio...

#### Fields

| Field | Type |
| --- | --- |
| base_stream | OutputStream |
| parent_instance | OutputStream |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_base_stream | `FilterOutputStream.get_base_stream() -> OutputStream` | g_filter_output_stream_get_base_stream |  | Gets the base stream for the filter stream. |
| get_close_base_stream | `FilterOutputStream.get_close_base_stream() -> gboolean` | g_filter_output_stream_get_close_base_stream |  | Returns whether the base stream will be closed when @stream is closed. |
| set_close_base_stream | `FilterOutputStream.set_close_base_stream(close_base: gboolean) -> none` | g_filter_output_stream_set_close_base_stream |  | Sets whether the base stream will be closed when @stream is closed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| base-stream | OutputStream | read, write, construct-only |  |
| close-base-stream | gboolean | read, write, construct-only | Whether the base stream should be closed when the filter stream is closed. |

### Gio.InetAddress

Parent: `GObject.Object` ?? GType: `GInetAddress` ?? C type: `GInetAddress`

`GInetAddress` represents an IPv4 or IPv6 internet address. Use [method@Gio.Resolver.lookup_by_name] or [method@Gio.Resolver.lookup_by_name_async] ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | InetAddressPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_any | `InetAddress.new_any(family: SocketFamily) -> InetAddress` | g_inet_address_new_any | 2.22 | Creates a #GInetAddress for the "any" address (unassigned/"don't care") for @family. |
| new_from_bytes | `InetAddress.new_from_bytes(bytes: guint8, family: SocketFamily) -> InetAddress` | g_inet_address_new_from_bytes | 2.22 | Creates a new #GInetAddress from the given @family and @bytes. @bytes should be 4 bytes for %G_SOCKET_FAMILY_IPV4 and 16 bytes for %G_SOCKET_FAMILY... |
| new_from_string | `InetAddress.new_from_string(string: utf8) -> InetAddress` | g_inet_address_new_from_string | 2.22 | Parses @string as an IP address and creates a new #GInetAddress. |
| new_loopback | `InetAddress.new_loopback(family: SocketFamily) -> InetAddress` | g_inet_address_new_loopback | 2.22 | Creates a #GInetAddress for the loopback address for @family. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `InetAddress.equal(other_address: InetAddress) -> gboolean` | g_inet_address_equal | 2.30 | Checks if two #GInetAddress instances are equal, e.g. the same address. |
| get_family | `InetAddress.get_family() -> SocketFamily` | g_inet_address_get_family | 2.22 | Gets @address's family |
| get_is_any | `InetAddress.get_is_any() -> gboolean` | g_inet_address_get_is_any | 2.22 | Tests whether @address is the "any" address for its family. |
| get_is_link_local | `InetAddress.get_is_link_local() -> gboolean` | g_inet_address_get_is_link_local | 2.22 | Tests whether @address is a link-local address (that is, if it identifies a host on a local network that is not connected to the Internet). |
| get_is_loopback | `InetAddress.get_is_loopback() -> gboolean` | g_inet_address_get_is_loopback | 2.22 | Tests whether @address is the loopback address for its family. |
| get_is_mc_global | `InetAddress.get_is_mc_global() -> gboolean` | g_inet_address_get_is_mc_global | 2.22 | Tests whether @address is a global multicast address. |
| get_is_mc_link_local | `InetAddress.get_is_mc_link_local() -> gboolean` | g_inet_address_get_is_mc_link_local | 2.22 | Tests whether @address is a link-local multicast address. |
| get_is_mc_node_local | `InetAddress.get_is_mc_node_local() -> gboolean` | g_inet_address_get_is_mc_node_local | 2.22 | Tests whether @address is a node-local multicast address. |
| get_is_mc_org_local | `InetAddress.get_is_mc_org_local() -> gboolean` | g_inet_address_get_is_mc_org_local | 2.22 | Tests whether @address is an organization-local multicast address. |
| get_is_mc_site_local | `InetAddress.get_is_mc_site_local() -> gboolean` | g_inet_address_get_is_mc_site_local | 2.22 | Tests whether @address is a site-local multicast address. |
| get_is_multicast | `InetAddress.get_is_multicast() -> gboolean` | g_inet_address_get_is_multicast | 2.22 | Tests whether @address is a multicast address. |
| get_is_site_local | `InetAddress.get_is_site_local() -> gboolean` | g_inet_address_get_is_site_local | 2.22 | Tests whether @address is a site-local address such as 10.0.0.1 (that is, the address identifies a host on a local network that can not be reached ... |
| get_native_size | `InetAddress.get_native_size() -> gsize` | g_inet_address_get_native_size | 2.22 | Gets the size of the native raw binary address for @address. This is the size of the data that you get from g_inet_address_to_bytes(). |
| to_bytes | `InetAddress.to_bytes() -> guint8` | g_inet_address_to_bytes | 2.22 | Gets the raw binary address data from @address. |
| to_string | `InetAddress.to_string() -> utf8` | g_inet_address_to_string | 2.22 | Converts @address to string form. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| bytes | gpointer | read, write, construct-only | The raw address data. |
| family | SocketFamily | read, write, construct-only | The address family (IPv4 or IPv6). |
| is-any | gboolean | read | Whether this is the "any" address for its family. See g_inet_address_get_is_any(). |
| is-link-local | gboolean | read | Whether this is a link-local address. See g_inet_address_get_is_link_local(). |
| is-loopback | gboolean | read | Whether this is the loopback address for its family. See g_inet_address_get_is_loopback(). |
| is-mc-global | gboolean | read | Whether this is a global multicast address. See g_inet_address_get_is_mc_global(). |
| is-mc-link-local | gboolean | read | Whether this is a link-local multicast address. See g_inet_address_get_is_mc_link_local(). |
| is-mc-node-local | gboolean | read | Whether this is a node-local multicast address. See g_inet_address_get_is_mc_node_local(). |
| is-mc-org-local | gboolean | read | Whether this is an organization-local multicast address. See g_inet_address_get_is_mc_org_local(). |
| is-mc-site-local | gboolean | read | Whether this is a site-local multicast address. See g_inet_address_get_is_mc_site_local(). |
| is-multicast | gboolean | read | Whether this is a multicast address. See g_inet_address_get_is_multicast(). |
| is-site-local | gboolean | read | Whether this is a site-local address. See g_inet_address_get_is_loopback(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| to_bytes | `to_bytes() -> guint8` |  | 2.22 | Gets the raw binary address data from @address. |
| to_string | `to_string() -> utf8` |  | 2.22 | Converts @address to string form. |

### Gio.InetAddressMask

Parent: `GObject.Object` ?? Implements: `Initable` ?? GType: `GInetAddressMask` ?? C type: `GInetAddressMask`

`GInetAddressMask` represents a range of IPv4 or IPv6 addresses described by a base address and a length indicating how many bits of the base addre...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | InetAddressMaskPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InetAddressMask.new(addr: InetAddress, length: guint) -> InetAddressMask throws` | g_inet_address_mask_new | 2.32 | Creates a new #GInetAddressMask representing all addresses whose first @length bits match @addr. |
| new_from_string | `InetAddressMask.new_from_string(mask_string: utf8) -> InetAddressMask throws` | g_inet_address_mask_new_from_string | 2.32 | Parses @mask_string as an IP address and (optional) length, and creates a new #GInetAddressMask. The length, if present, is delimited by a "/". If ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `InetAddressMask.equal(mask2: InetAddressMask) -> gboolean` | g_inet_address_mask_equal | 2.32 | Tests if @mask and @mask2 are the same mask. |
| get_address | `InetAddressMask.get_address() -> InetAddress` | g_inet_address_mask_get_address | 2.32 | Gets @mask's base address |
| get_family | `InetAddressMask.get_family() -> SocketFamily` | g_inet_address_mask_get_family | 2.32 | Gets the #GSocketFamily of @mask's address |
| get_length | `InetAddressMask.get_length() -> guint` | g_inet_address_mask_get_length | 2.32 | Gets @mask's length |
| matches | `InetAddressMask.matches(address: InetAddress) -> gboolean` | g_inet_address_mask_matches | 2.32 | Tests if @address falls within the range described by @mask. |
| to_string | `InetAddressMask.to_string() -> utf8` | g_inet_address_mask_to_string | 2.32 | Converts @mask back to its corresponding string form. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| address | InetAddress | read, write | The base address. |
| family | SocketFamily | read | The address family (IPv4 or IPv6). |
| length | guint | read, write | The prefix length, in bytes. |

### Gio.InetSocketAddress

Parent: `SocketAddress` ?? Subclasses: `ProxyAddress` ?? Implements: `SocketConnectable` ?? GType: `GInetSocketAddress` ?? C type: `GInetSocketAddress`

An IPv4 or IPv6 socket address. That is, the combination of a [class@Gio.InetAddress] and a port number. In UNIX terms, `GInetSocketAddress` corres...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketAddress |
| priv | InetSocketAddressPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InetSocketAddress.new(address: InetAddress, port: guint16) -> SocketAddress` | g_inet_socket_address_new | 2.22 | Creates a new #GInetSocketAddress for @address and @port. |
| new_from_string | `InetSocketAddress.new_from_string(address: utf8, port: guint) -> SocketAddress` | g_inet_socket_address_new_from_string | 2.40 | Creates a new #GInetSocketAddress for @address and @port. If @address is an IPv6 address, it can also contain a scope ID (separated from the addres... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_address | `InetSocketAddress.get_address() -> InetAddress` | g_inet_socket_address_get_address | 2.22 | Gets @address's #GInetAddress. |
| get_flowinfo | `InetSocketAddress.get_flowinfo() -> guint32` | g_inet_socket_address_get_flowinfo | 2.32 | Gets the `sin6_flowinfo` field from @address, which must be an IPv6 address. |
| get_port | `InetSocketAddress.get_port() -> guint16` | g_inet_socket_address_get_port | 2.22 | Gets @address's port. |
| get_scope_id | `InetSocketAddress.get_scope_id() -> guint32` | g_inet_socket_address_get_scope_id | 2.32 | Gets the `sin6_scope_id` field from @address, which must be an IPv6 address. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| address | InetAddress | read, write, construct-only | The address. |
| flowinfo | guint | read, write, construct-only | The `sin6_flowinfo` field, for IPv6 addresses. |
| port | guint | read, write, construct-only | The port. |
| scope-id | guint | read, write, construct-only | The `sin6_scope_id` field, for IPv6 addresses. |

### Gio.InputStream

Parent: `GObject.Object` ?? Subclasses: `FileInputStream`, `FilterInputStream`, `MemoryInputStream`, `UnixInputStream` ?? GType: `GInputStream` ?? C type: `GInputStream` ?? Abstract

`GInputStream` is a base class for implementing streaming input. It has functions to read from a stream ([method@Gio.InputStream.read]), to close a...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | InputStreamPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_pending | `InputStream.clear_pending() -> none` | g_input_stream_clear_pending |  | Clears the pending flag on @stream. |
| close | `InputStream.close(cancellable: Cancellable?) -> gboolean throws` | g_input_stream_close |  | Closes the stream, releasing resources related to it. Once the stream is closed, all other operations will return %G_IO_ERROR_CLOSED. Closing a str... |
| close_async | `InputStream.close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_input_stream_close_async |  | Requests an asynchronous closes of the stream, releasing resources related to it. When the operation is finished @callback will be called. You can ... |
| close_finish | `InputStream.close_finish(result: AsyncResult) -> gboolean throws` | g_input_stream_close_finish |  | Finishes closing a stream asynchronously, started from g_input_stream_close_async(). |
| has_pending | `InputStream.has_pending() -> gboolean` | g_input_stream_has_pending |  | Checks if an input stream has pending actions. |
| is_closed | `InputStream.is_closed() -> gboolean` | g_input_stream_is_closed |  | Checks if an input stream is closed. |
| read | `InputStream.read(buffer: out guint8, count: gsize, cancellable: Cancellable?) -> gssize throws` | g_input_stream_read |  | Tries to read @count bytes from the stream into the buffer starting at @buffer. Will block during this read. If count is zero returns zero and does... |
| read_all | `InputStream.read_all(buffer: out guint8, count: gsize, bytes_read: out gsize, cancellable: Cancellable?) -> gboolean throws` | g_input_stream_read_all |  | Tries to read @count bytes from the stream into the buffer starting at @buffer. Will block during this read. This function is similar to g_input_st... |
| read_all_async | `InputStream.read_all_async(buffer: out guint8, count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_input_stream_read_all_async | 2.44 | Request an asynchronous read of @count bytes from the stream into the buffer starting at @buffer. This is the asynchronous equivalent of g_input_st... |
| read_all_finish | `InputStream.read_all_finish(result: AsyncResult, bytes_read: out gsize) -> gboolean throws` | g_input_stream_read_all_finish | 2.44 | Finishes an asynchronous stream read operation started with g_input_stream_read_all_async(). As a special exception to the normal conventions for f... |
| read_async | `InputStream.read_async(buffer: out guint8, count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_input_stream_read_async |  | Request an asynchronous read of @count bytes from the stream into the buffer starting at @buffer. When the operation is finished @callback will be ... |
| read_bytes | `InputStream.read_bytes(count: gsize, cancellable: Cancellable?) -> GLib.Bytes throws` | g_input_stream_read_bytes | 2.34 | Like g_input_stream_read(), this tries to read @count bytes from the stream in a blocking fashion. However, rather than reading into a user-supplie... |
| read_bytes_async | `InputStream.read_bytes_async(count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_input_stream_read_bytes_async | 2.34 | Request an asynchronous read of @count bytes from the stream into a new #GBytes. When the operation is finished @callback will be called. You can t... |
| read_bytes_finish | `InputStream.read_bytes_finish(result: AsyncResult) -> GLib.Bytes throws` | g_input_stream_read_bytes_finish | 2.34 | Finishes an asynchronous stream read-into-#GBytes operation. |
| read_finish | `InputStream.read_finish(result: AsyncResult) -> gssize throws` | g_input_stream_read_finish |  | Finishes an asynchronous stream read operation. |
| set_pending | `InputStream.set_pending() -> gboolean throws` | g_input_stream_set_pending |  | Sets @stream to have actions pending. If the pending flag is already set or @stream is closed, it will return %FALSE and set @error. |
| skip | `InputStream.skip(count: gsize, cancellable: Cancellable?) -> gssize throws` | g_input_stream_skip |  | Tries to skip @count bytes from the stream. Will block during the operation. This is identical to g_input_stream_read(), from a behaviour standpoin... |
| skip_async | `InputStream.skip_async(count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_input_stream_skip_async |  | Request an asynchronous skip of @count bytes from the stream. When the operation is finished @callback will be called. You can then call g_input_st... |
| skip_finish | `InputStream.skip_finish(result: AsyncResult) -> gssize throws` | g_input_stream_skip_finish |  | Finishes a stream skip operation. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close_async | `close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Requests an asynchronous closes of the stream, releasing resources related to it. When the operation is finished @callback will be called. You can ... |
| close_finish | `close_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes closing a stream asynchronously, started from g_input_stream_close_async(). |
| close_fn | `close_fn(cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| read_async | `read_async(buffer: out guint8?, count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Request an asynchronous read of @count bytes from the stream into the buffer starting at @buffer. When the operation is finished @callback will be ... |
| read_finish | `read_finish(result: AsyncResult) -> gssize throws` |  |  | Finishes an asynchronous stream read operation. |
| read_fn | `read_fn(buffer: gpointer?, count: gsize, cancellable: Cancellable?) -> gssize throws` |  |  |  |
| skip | `skip(count: gsize, cancellable: Cancellable?) -> gssize throws` |  |  | Tries to skip @count bytes from the stream. Will block during the operation. This is identical to g_input_stream_read(), from a behaviour standpoin... |
| skip_async | `skip_async(count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Request an asynchronous skip of @count bytes from the stream. When the operation is finished @callback will be called. You can then call g_input_st... |
| skip_finish | `skip_finish(result: AsyncResult) -> gssize throws` |  |  | Finishes a stream skip operation. |

### Gio.IOModule

Parent: `GObject.TypeModule` ?? Implements: `GObject.TypePlugin` ?? GType: `GIOModule` ?? C type: `GIOModule`

Provides an interface and default functions for loading and unloading modules. This is used internally to make GIO extensible, but can also be used...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `IOModule.new(filename: filename) -> IOModule` | g_io_module_new |  | Creates a new GIOModule that will load the specific shared library when in use. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| query | `query() -> utf8` | g_io_module_query | 2.24 | Optional API for GIO modules to implement. Should return a list of all the extension points that may be implemented in this module. This method wil... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `IOModule.load() -> none` | g_io_module_load |  | Required API for GIO modules to implement. This function is run after the module has been loaded into GIO, to initialize the module. Typically, thi... |
| unload | `IOModule.unload() -> none` | g_io_module_unload |  | Required API for GIO modules to implement. This function is run when the module is being unloaded from GIO, to finalize the module. Since 2.56, thi... |

### Gio.IOStream

Parent: `GObject.Object` ?? Subclasses: `FileIOStream`, `SimpleIOStream`, `SocketConnection`, `TlsConnection` ?? GType: `GIOStream` ?? C type: `GIOStream` ?? Abstract

`GIOStream` represents an object that has both read and write streams. Generally the two streams act as separate input and output streams, but they...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | IOStreamPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| splice_finish | `splice_finish(result: AsyncResult) -> gboolean throws` | g_io_stream_splice_finish | 2.28 | Finishes an asynchronous io stream splice operation. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_pending | `IOStream.clear_pending() -> none` | g_io_stream_clear_pending | 2.22 | Clears the pending flag on @stream. |
| close | `IOStream.close(cancellable: Cancellable?) -> gboolean throws` | g_io_stream_close | 2.22 | Closes the stream, releasing resources related to it. This will also close the individual input and output streams, if they are not already closed.... |
| close_async | `IOStream.close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_io_stream_close_async | 2.22 | Requests an asynchronous close of the stream, releasing resources related to it. When the operation is finished @callback will be called. You can t... |
| close_finish | `IOStream.close_finish(result: AsyncResult) -> gboolean throws` | g_io_stream_close_finish | 2.22 | Closes a stream. |
| get_input_stream | `IOStream.get_input_stream() -> InputStream` | g_io_stream_get_input_stream | 2.22 | Gets the input stream for this object. This is used for reading. |
| get_output_stream | `IOStream.get_output_stream() -> OutputStream` | g_io_stream_get_output_stream | 2.22 | Gets the output stream for this object. This is used for writing. |
| has_pending | `IOStream.has_pending() -> gboolean` | g_io_stream_has_pending | 2.22 | Checks if a stream has pending actions. |
| is_closed | `IOStream.is_closed() -> gboolean` | g_io_stream_is_closed | 2.22 | Checks if a stream is closed. |
| set_pending | `IOStream.set_pending() -> gboolean throws` | g_io_stream_set_pending | 2.22 | Sets @stream to have actions pending. If the pending flag is already set or @stream is closed, it will return %FALSE and set @error. |
| splice_async | `IOStream.splice_async(stream2: IOStream, flags: IOStreamSpliceFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_io_stream_splice_async | 2.28 | Asynchronously splice the output stream of @stream1 to the input stream of @stream2, and splice the output stream of @stream2 to the input stream o... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| closed | gboolean | read | Whether the stream is closed. |
| input-stream | InputStream | read | The [class@Gio.InputStream] to read from. |
| output-stream | OutputStream | read | The [class@Gio.OutputStream] to write to. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close_async | `close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Requests an asynchronous close of the stream, releasing resources related to it. When the operation is finished @callback will be called. You can t... |
| close_finish | `close_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Closes a stream. |
| close_fn | `close_fn(cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| get_input_stream | `get_input_stream() -> InputStream` |  | 2.22 | Gets the input stream for this object. This is used for reading. |
| get_output_stream | `get_output_stream() -> OutputStream` |  | 2.22 | Gets the output stream for this object. This is used for writing. |

### Gio.ListStore

Parent: `GObject.Object` ?? Implements: `ListModel` ?? GType: `GListStore` ?? C type: `GListStore`

`GListStore` is a simple implementation of [iface@Gio.ListModel] that stores all items in memory. It provides insertions, deletions, and lookups in...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ListStore.new(item_type: GType) -> ListStore` | g_list_store_new | 2.44 | Creates a new #GListStore with items of type @item_type. @item_type must be a subclass of #GObject. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `ListStore.append(item: GObject.Object) -> none` | g_list_store_append | 2.44 | Appends @item to @store. @item must be of type #GListStore:item-type. This function takes a ref on @item. Use g_list_store_splice() to append multi... |
| find | `ListStore.find(item: GObject.Object, position: out guint?) -> gboolean` | g_list_store_find | 2.64 | Looks up the given @item in the list store by looping over the items until the first occurrence of @item. If @item was not found, then @position wi... |
| find_with_equal_func | `ListStore.find_with_equal_func(item: GObject.Object?, equal_func: GLib.EqualFunc, position: out guint?) -> gboolean` | g_list_store_find_with_equal_func | 2.64 | Looks up the given @item in the list store by looping over the items and comparing them with @equal_func until the first occurrence of @item which ... |
| find_with_equal_func_full | `ListStore.find_with_equal_func_full(item: GObject.Object?, equal_func: GLib.EqualFuncFull, user_data: gpointer?, position: out guint?) -> gboolean` | g_list_store_find_with_equal_func_full | 2.74 | Like g_list_store_find_with_equal_func() but with an additional @user_data that is passed to @equal_func. @item is always passed as second paramete... |
| insert | `ListStore.insert(position: guint, item: GObject.Object) -> none` | g_list_store_insert | 2.44 | Inserts @item into @store at @position. @item must be of type #GListStore:item-type or derived from it. @position must be smaller than the length o... |
| insert_sorted | `ListStore.insert_sorted(item: GObject.Object, compare_func: GLib.CompareDataFunc, user_data: gpointer?) -> guint` | g_list_store_insert_sorted | 2.44 | Inserts @item into @store at a position to be determined by the @compare_func. The list must already be sorted before calling this function or the ... |
| remove | `ListStore.remove(position: guint) -> none` | g_list_store_remove | 2.44 | Removes the item from @store that is at @position. @position must be smaller than the current length of the list. Use g_list_store_splice() to remo... |
| remove_all | `ListStore.remove_all() -> none` | g_list_store_remove_all | 2.44 | Removes all items from @store. |
| sort | `ListStore.sort(compare_func: GLib.CompareDataFunc, user_data: gpointer?) -> none` | g_list_store_sort | 2.46 | Sort the items in @store according to @compare_func. |
| splice | `ListStore.splice(position: guint, n_removals: guint, additions: GObject.Object, n_additions: guint) -> none` | g_list_store_splice | 2.44 | Changes @store by removing @n_removals items and adding @n_additions items to it. @additions must contain @n_additions items of type #GListStore:it... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| item-type | GType | read, write, construct-only | The type of items contained in this list store. Items must be subclasses of #GObject. |
| n-items | guint | read | The number of items contained in this list store. |

### Gio.MemoryInputStream

Parent: `InputStream` ?? Implements: `PollableInputStream`, `Seekable` ?? GType: `GMemoryInputStream` ?? C type: `GMemoryInputStream`

`GMemoryInputStream` is a class for using arbitrary memory chunks as input for GIO streaming input operations. As of GLib 2.34, `GMemoryInputStream...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | InputStream |
| priv | MemoryInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MemoryInputStream.new() -> InputStream` | g_memory_input_stream_new |  | Creates a new empty #GMemoryInputStream. |
| new_from_bytes | `MemoryInputStream.new_from_bytes(bytes: GLib.Bytes) -> InputStream` | g_memory_input_stream_new_from_bytes | 2.34 | Creates a new #GMemoryInputStream with data from the given @bytes. |
| new_from_data | `MemoryInputStream.new_from_data(data: guint8, len: gssize, destroy: GLib.DestroyNotify?) -> InputStream` | g_memory_input_stream_new_from_data |  | Creates a new #GMemoryInputStream with data in memory of a given size. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_bytes | `MemoryInputStream.add_bytes(bytes: GLib.Bytes) -> none` | g_memory_input_stream_add_bytes | 2.34 | Appends @bytes to data that can be read from the input stream. |
| add_data | `MemoryInputStream.add_data(data: guint8, len: gssize, destroy: GLib.DestroyNotify?) -> none` | g_memory_input_stream_add_data |  | Appends @data to data that can be read from the input stream |

### Gio.MemoryOutputStream

Parent: `OutputStream` ?? Implements: `PollableOutputStream`, `Seekable` ?? GType: `GMemoryOutputStream` ?? C type: `GMemoryOutputStream`

`GMemoryOutputStream` is a class for using arbitrary memory chunks as output for GIO streaming output operations. As of GLib 2.34, `GMemoryOutputSt...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | OutputStream |
| priv | MemoryOutputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MemoryOutputStream.new(data: gpointer?, size: gsize, realloc_function: ReallocFunc?, destroy_function: GLib.DestroyNotify?) -> OutputStream` | g_memory_output_stream_new |  | Creates a new #GMemoryOutputStream. In most cases this is not the function you want. See g_memory_output_stream_new_resizable() instead. If @data i... |
| new_resizable | `MemoryOutputStream.new_resizable() -> OutputStream` | g_memory_output_stream_new_resizable | 2.36 | Creates a new #GMemoryOutputStream, using g_realloc() and g_free() for memory allocation. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_data | `MemoryOutputStream.get_data() -> gpointer` | g_memory_output_stream_get_data |  | Gets any loaded data from the @ostream. Note that the returned pointer may become invalid on the next write or truncate operation on the stream. |
| get_data_size | `MemoryOutputStream.get_data_size() -> gsize` | g_memory_output_stream_get_data_size | 2.18 | Returns the number of bytes from the start up to including the last byte written in the stream that has not been truncated away. |
| get_size | `MemoryOutputStream.get_size() -> gsize` | g_memory_output_stream_get_size |  | Gets the size of the currently allocated data area (available from g_memory_output_stream_get_data()). You probably don't want to use this function... |
| steal_as_bytes | `MemoryOutputStream.steal_as_bytes() -> GLib.Bytes` | g_memory_output_stream_steal_as_bytes | 2.34 | Returns data from the @ostream as a #GBytes. @ostream must be closed before calling this function. |
| steal_data | `MemoryOutputStream.steal_data() -> gpointer` | g_memory_output_stream_steal_data | 2.26 | Gets any loaded data from the @ostream. Ownership of the data is transferred to the caller; when no longer needed it must be freed using the free f... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| data | gpointer | read, write, construct-only | Pointer to buffer where data will be written. |
| data-size | gulong | read | Size of data written to the buffer. |
| destroy-function | gpointer | read, write, construct-only | Function called with the buffer as argument when the stream is destroyed. |
| realloc-function | gpointer | read, write, construct-only | Function with realloc semantics called to enlarge the buffer. |
| size | gulong | read, write, construct-only | Current size of the data buffer. |

### Gio.Menu

Parent: `MenuModel` ?? GType: `GMenu` ?? C type: `GMenu`

`GMenu` is a simple implementation of [class@Gio.MenuModel]. You populate a `GMenu` by adding [class@Gio.MenuItem] instances to it. There are some ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Menu.new() -> Menu` | g_menu_new | 2.32 | Creates a new #GMenu. The new menu has no items. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `Menu.append(label: utf8?, detailed_action: utf8?) -> none` | g_menu_append | 2.32 | Convenience function for appending a normal menu item to the end of @menu. Combine g_menu_item_new() and g_menu_insert_item() for a more flexible a... |
| append_item | `Menu.append_item(item: MenuItem) -> none` | g_menu_append_item | 2.32 | Appends @item to the end of @menu. See g_menu_insert_item() for more information. |
| append_section | `Menu.append_section(label: utf8?, section: MenuModel) -> none` | g_menu_append_section | 2.32 | Convenience function for appending a section menu item to the end of @menu. Combine g_menu_item_new_section() and g_menu_insert_item() for a more f... |
| append_submenu | `Menu.append_submenu(label: utf8?, submenu: MenuModel) -> none` | g_menu_append_submenu | 2.32 | Convenience function for appending a submenu menu item to the end of @menu. Combine g_menu_item_new_submenu() and g_menu_insert_item() for a more f... |
| freeze | `Menu.freeze() -> none` | g_menu_freeze | 2.32 | Marks @menu as frozen. After the menu is frozen, it is an error to attempt to make any changes to it. In effect this means that the #GMenu API must... |
| insert | `Menu.insert(position: gint, label: utf8?, detailed_action: utf8?) -> none` | g_menu_insert | 2.32 | Convenience function for inserting a normal menu item into @menu. Combine g_menu_item_new() and g_menu_insert_item() for a more flexible alternative. |
| insert_item | `Menu.insert_item(position: gint, item: MenuItem) -> none` | g_menu_insert_item | 2.32 | Inserts @item into @menu. The "insertion" is actually done by copying all of the attribute and link values of @item and using them to form a new it... |
| insert_section | `Menu.insert_section(position: gint, label: utf8?, section: MenuModel) -> none` | g_menu_insert_section | 2.32 | Convenience function for inserting a section menu item into @menu. Combine g_menu_item_new_section() and g_menu_insert_item() for a more flexible a... |
| insert_submenu | `Menu.insert_submenu(position: gint, label: utf8?, submenu: MenuModel) -> none` | g_menu_insert_submenu | 2.32 | Convenience function for inserting a submenu menu item into @menu. Combine g_menu_item_new_submenu() and g_menu_insert_item() for a more flexible a... |
| prepend | `Menu.prepend(label: utf8?, detailed_action: utf8?) -> none` | g_menu_prepend | 2.32 | Convenience function for prepending a normal menu item to the start of @menu. Combine g_menu_item_new() and g_menu_insert_item() for a more flexibl... |
| prepend_item | `Menu.prepend_item(item: MenuItem) -> none` | g_menu_prepend_item | 2.32 | Prepends @item to the start of @menu. See g_menu_insert_item() for more information. |
| prepend_section | `Menu.prepend_section(label: utf8?, section: MenuModel) -> none` | g_menu_prepend_section | 2.32 | Convenience function for prepending a section menu item to the start of @menu. Combine g_menu_item_new_section() and g_menu_insert_item() for a mor... |
| prepend_submenu | `Menu.prepend_submenu(label: utf8?, submenu: MenuModel) -> none` | g_menu_prepend_submenu | 2.32 | Convenience function for prepending a submenu menu item to the start of @menu. Combine g_menu_item_new_submenu() and g_menu_insert_item() for a mor... |
| remove | `Menu.remove(position: gint) -> none` | g_menu_remove | 2.32 | Removes an item from the menu. @position gives the index of the item to remove. It is an error if position is not in range the range from 0 to one ... |
| remove_all | `Menu.remove_all() -> none` | g_menu_remove_all | 2.38 | Removes all items in the menu. |

### Gio.MenuAttributeIter

Parent: `GObject.Object` ?? GType: `GMenuAttributeIter` ?? C type: `GMenuAttributeIter` ?? Abstract

#GMenuAttributeIter is an opaque structure type. You must access it using the functions below.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | MenuAttributeIterPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `MenuAttributeIter.get_name() -> utf8` | g_menu_attribute_iter_get_name | 2.32 | Gets the name of the attribute at the current iterator position, as a string. The iterator is not advanced. |
| get_next | `MenuAttributeIter.get_next(out_name: out utf8?, value: out GLib.Variant?) -> gboolean` | g_menu_attribute_iter_get_next | 2.32 | This function combines g_menu_attribute_iter_next() with g_menu_attribute_iter_get_name() and g_menu_attribute_iter_get_value(). First the iterator... |
| get_value | `MenuAttributeIter.get_value() -> GLib.Variant` | g_menu_attribute_iter_get_value | 2.32 | Gets the value of the attribute at the current iterator position. The iterator is not advanced. |
| next | `MenuAttributeIter.next() -> gboolean` | g_menu_attribute_iter_next | 2.32 | Attempts to advance the iterator to the next (possibly first) attribute. %TRUE is returned on success, or %FALSE if there are no more attributes. Y... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_next | `get_next(out_name: out utf8?, value: out GLib.Variant?) -> gboolean` |  | 2.32 | This function combines g_menu_attribute_iter_next() with g_menu_attribute_iter_get_name() and g_menu_attribute_iter_get_value(). First the iterator... |

### Gio.MenuItem

Parent: `GObject.Object` ?? GType: `GMenuItem` ?? C type: `GMenuItem`

#GMenuItem is an opaque structure type. You must access it using the functions below.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MenuItem.new(label: utf8?, detailed_action: utf8?) -> MenuItem` | g_menu_item_new | 2.32 | Creates a new #GMenuItem. If @label is non-%NULL it is used to set the "label" attribute of the new item. If @detailed_action is non-%NULL it is us... |
| new_from_model | `MenuItem.new_from_model(model: MenuModel, item_index: gint) -> MenuItem` | g_menu_item_new_from_model | 2.34 | Creates a #GMenuItem as an exact copy of an existing menu item in a #GMenuModel. @item_index must be valid (ie: be sure to call g_menu_model_get_n_... |
| new_section | `MenuItem.new_section(label: utf8?, section: MenuModel) -> MenuItem` | g_menu_item_new_section | 2.32 | Creates a new #GMenuItem representing a section. This is a convenience API around g_menu_item_new() and g_menu_item_set_section(). The effect of ha... |
| new_submenu | `MenuItem.new_submenu(label: utf8?, submenu: MenuModel) -> MenuItem` | g_menu_item_new_submenu | 2.32 | Creates a new #GMenuItem representing a submenu. This is a convenience API around g_menu_item_new() and g_menu_item_set_submenu(). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_attribute | `MenuItem.get_attribute(attribute: utf8, format_string: utf8, ...: void) -> gboolean` | g_menu_item_get_attribute | 2.34 | Queries the named @attribute on @menu_item. If the attribute exists and matches the #GVariantType corresponding to @format_string then @format_stri... |
| get_attribute_value | `MenuItem.get_attribute_value(attribute: utf8, expected_type: GLib.VariantType?) -> GLib.Variant` | g_menu_item_get_attribute_value | 2.34 | Queries the named @attribute on @menu_item. If @expected_type is specified and the attribute does not have this type, %NULL is returned. %NULL is a... |
| get_link | `MenuItem.get_link(link: utf8) -> MenuModel` | g_menu_item_get_link | 2.34 | Queries the named @link on @menu_item. |
| set_action_and_target | `MenuItem.set_action_and_target(action: utf8?, format_string: utf8?, ...: void) -> none` | g_menu_item_set_action_and_target | 2.32 | Sets or unsets the "action" and "target" attributes of @menu_item. If @action is %NULL then both the "action" and "target" attributes are unset (an... |
| set_action_and_target_value | `MenuItem.set_action_and_target_value(action: utf8?, target_value: GLib.Variant?) -> none` | g_menu_item_set_action_and_target_value | 2.32 | Sets or unsets the "action" and "target" attributes of @menu_item. If @action is %NULL then both the "action" and "target" attributes are unset (an... |
| set_attribute | `MenuItem.set_attribute(attribute: utf8, format_string: utf8?, ...: void) -> none` | g_menu_item_set_attribute | 2.32 | Sets or unsets an attribute on @menu_item. The attribute to set or unset is specified by @attribute. This can be one of the standard attribute name... |
| set_attribute_value | `MenuItem.set_attribute_value(attribute: utf8, value: GLib.Variant?) -> none` | g_menu_item_set_attribute_value | 2.32 | Sets or unsets an attribute on @menu_item. The attribute to set or unset is specified by @attribute. This can be one of the standard attribute name... |
| set_detailed_action | `MenuItem.set_detailed_action(detailed_action: utf8) -> none` | g_menu_item_set_detailed_action | 2.32 | Sets the "action" and possibly the "target" attribute of @menu_item. The format of @detailed_action is the same format parsed by g_action_parse_det... |
| set_icon | `MenuItem.set_icon(icon: Icon) -> none` | g_menu_item_set_icon | 2.38 | Sets (or unsets) the icon on @menu_item. This call is the same as calling g_icon_serialize() and using the result as the value to g_menu_item_set_a... |
| set_label | `MenuItem.set_label(label: utf8?) -> none` | g_menu_item_set_label | 2.32 | Sets or unsets the "label" attribute of @menu_item. If @label is non-%NULL it is used as the label for the menu item. If it is %NULL then the label... |
| set_link | `MenuItem.set_link(link: utf8, model: MenuModel?) -> none` | g_menu_item_set_link | 2.32 | Creates a link from @menu_item to @model if non-%NULL, or unsets it. Links are used to establish a relationship between a particular menu item and ... |
| set_section | `MenuItem.set_section(section: MenuModel?) -> none` | g_menu_item_set_section | 2.32 | Sets or unsets the "section" link of @menu_item to @section. The effect of having one menu appear as a section of another is exactly as it sounds: ... |
| set_submenu | `MenuItem.set_submenu(submenu: MenuModel?) -> none` | g_menu_item_set_submenu | 2.32 | Sets or unsets the "submenu" link of @menu_item to @submenu. If @submenu is non-%NULL, it is linked to. If it is %NULL then the link is unset. The ... |

### Gio.MenuLinkIter

Parent: `GObject.Object` ?? GType: `GMenuLinkIter` ?? C type: `GMenuLinkIter` ?? Abstract

#GMenuLinkIter is an opaque structure type. You must access it using the functions below.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | MenuLinkIterPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `MenuLinkIter.get_name() -> utf8` | g_menu_link_iter_get_name | 2.32 | Gets the name of the link at the current iterator position. The iterator is not advanced. |
| get_next | `MenuLinkIter.get_next(out_link: out utf8?, value: out MenuModel?) -> gboolean` | g_menu_link_iter_get_next | 2.32 | This function combines g_menu_link_iter_next() with g_menu_link_iter_get_name() and g_menu_link_iter_get_value(). First the iterator is advanced to... |
| get_value | `MenuLinkIter.get_value() -> MenuModel` | g_menu_link_iter_get_value | 2.32 | Gets the linked #GMenuModel at the current iterator position. The iterator is not advanced. |
| next | `MenuLinkIter.next() -> gboolean` | g_menu_link_iter_next | 2.32 | Attempts to advance the iterator to the next (possibly first) link. %TRUE is returned on success, or %FALSE if there are no more links. You must ca... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_next | `get_next(out_link: out utf8?, value: out MenuModel?) -> gboolean` |  | 2.32 | This function combines g_menu_link_iter_next() with g_menu_link_iter_get_name() and g_menu_link_iter_get_value(). First the iterator is advanced to... |

### Gio.MenuModel

Parent: `GObject.Object` ?? Subclasses: `DBusMenuModel`, `Menu` ?? GType: `GMenuModel` ?? C type: `GMenuModel` ?? Abstract

`GMenuModel` represents the contents of a menu ??? an ordered list of menu items. The items are associated with actions, which can be activated thr...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | MenuModelPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_item_attribute | `MenuModel.get_item_attribute(item_index: gint, attribute: utf8, format_string: utf8, ...: void) -> gboolean` | g_menu_model_get_item_attribute | 2.32 | Queries item at position @item_index in @model for the attribute specified by @attribute. If the attribute exists and matches the #GVariantType cor... |
| get_item_attribute_value | `MenuModel.get_item_attribute_value(item_index: gint, attribute: utf8, expected_type: GLib.VariantType?) -> GLib.Variant` | g_menu_model_get_item_attribute_value | 2.32 | Queries the item at position @item_index in @model for the attribute specified by @attribute. If @expected_type is non-%NULL then it specifies the ... |
| get_item_link | `MenuModel.get_item_link(item_index: gint, link: utf8) -> MenuModel` | g_menu_model_get_item_link | 2.32 | Queries the item at position @item_index in @model for the link specified by @link. If the link exists, the linked #GMenuModel is returned. If the ... |
| get_n_items | `MenuModel.get_n_items() -> gint` | g_menu_model_get_n_items | 2.32 | Query the number of items in @model. |
| is_mutable | `MenuModel.is_mutable() -> gboolean` | g_menu_model_is_mutable | 2.32 | Queries if @model is mutable. An immutable #GMenuModel will never emit the #GMenuModel::items-changed signal. Consumers of the model may make optim... |
| items_changed | `MenuModel.items_changed(position: gint, removed: gint, added: gint) -> none` | g_menu_model_items_changed | 2.32 | Requests emission of the #GMenuModel::items-changed signal on @model. This function should never be called except by #GMenuModel subclasses. Any ot... |
| iterate_item_attributes | `MenuModel.iterate_item_attributes(item_index: gint) -> MenuAttributeIter` | g_menu_model_iterate_item_attributes | 2.32 | Creates a #GMenuAttributeIter to iterate over the attributes of the item at position @item_index in @model. You must free the iterator with g_objec... |
| iterate_item_links | `MenuModel.iterate_item_links(item_index: gint) -> MenuLinkIter` | g_menu_model_iterate_item_links | 2.32 | Creates a #GMenuLinkIter to iterate over the links of the item at position @item_index in @model. You must free the iterator with g_object_unref() ... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| items-changed | `position: gint, removed: gint, added: gint` | none | last |  | Emitted when a change has occurred to the menu. The only changes that can occur to a menu is that items are removed or added. Items may not change ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_item_attribute_value | `get_item_attribute_value(item_index: gint, attribute: utf8, expected_type: GLib.VariantType?) -> GLib.Variant` |  | 2.32 | Queries the item at position @item_index in @model for the attribute specified by @attribute. If @expected_type is non-%NULL then it specifies the ... |
| get_item_attributes | `get_item_attributes(item_index: gint, attributes: out GLib.HashTable) -> none` |  |  | Gets all the attributes associated with the item in the menu model. |
| get_item_link | `get_item_link(item_index: gint, link: utf8) -> MenuModel` |  | 2.32 | Queries the item at position @item_index in @model for the link specified by @link. If the link exists, the linked #GMenuModel is returned. If the ... |
| get_item_links | `get_item_links(item_index: gint, links: out GLib.HashTable) -> none` |  |  | Gets all the links associated with the item in the menu model. |
| get_n_items | `get_n_items() -> gint` |  | 2.32 | Query the number of items in @model. |
| is_mutable | `is_mutable() -> gboolean` |  | 2.32 | Queries if @model is mutable. An immutable #GMenuModel will never emit the #GMenuModel::items-changed signal. Consumers of the model may make optim... |
| iterate_item_attributes | `iterate_item_attributes(item_index: gint) -> MenuAttributeIter` |  | 2.32 | Creates a #GMenuAttributeIter to iterate over the attributes of the item at position @item_index in @model. You must free the iterator with g_objec... |
| iterate_item_links | `iterate_item_links(item_index: gint) -> MenuLinkIter` |  | 2.32 | Creates a #GMenuLinkIter to iterate over the links of the item at position @item_index in @model. You must free the iterator with g_object_unref() ... |

### Gio.MountOperation

Parent: `GObject.Object` ?? GType: `GMountOperation` ?? C type: `GMountOperation`

`GMountOperation` provides a mechanism for interacting with the user. It can be used for authenticating mountable operations, such as loop mounting...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | MountOperationPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MountOperation.new() -> MountOperation` | g_mount_operation_new |  | Creates a new mount operation. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_anonymous | `MountOperation.get_anonymous() -> gboolean` | g_mount_operation_get_anonymous |  | Check to see whether the mount operation is being used for an anonymous user. |
| get_choice | `MountOperation.get_choice() -> gint` | g_mount_operation_get_choice |  | Gets a choice from the mount operation. |
| get_domain | `MountOperation.get_domain() -> utf8` | g_mount_operation_get_domain |  | Gets the domain of the mount operation. |
| get_is_tcrypt_hidden_volume | `MountOperation.get_is_tcrypt_hidden_volume() -> gboolean` | g_mount_operation_get_is_tcrypt_hidden_volume | 2.58 | Check to see whether the mount operation is being used for a TCRYPT hidden volume. |
| get_is_tcrypt_system_volume | `MountOperation.get_is_tcrypt_system_volume() -> gboolean` | g_mount_operation_get_is_tcrypt_system_volume | 2.58 | Check to see whether the mount operation is being used for a TCRYPT system volume. |
| get_password | `MountOperation.get_password() -> utf8` | g_mount_operation_get_password |  | Gets a password from the mount operation. |
| get_password_save | `MountOperation.get_password_save() -> PasswordSave` | g_mount_operation_get_password_save |  | Gets the state of saving passwords for the mount operation. |
| get_pim | `MountOperation.get_pim() -> guint` | g_mount_operation_get_pim | 2.58 | Gets a PIM from the mount operation. |
| get_username | `MountOperation.get_username() -> utf8` | g_mount_operation_get_username |  | Get the user name from the mount operation. |
| reply | `MountOperation.reply(result: MountOperationResult) -> none` | g_mount_operation_reply |  | Emits the #GMountOperation::reply signal. |
| set_anonymous | `MountOperation.set_anonymous(anonymous: gboolean) -> none` | g_mount_operation_set_anonymous |  | Sets the mount operation to use an anonymous user if @anonymous is %TRUE. |
| set_choice | `MountOperation.set_choice(choice: gint) -> none` | g_mount_operation_set_choice |  | Sets a default choice for the mount operation. |
| set_domain | `MountOperation.set_domain(domain: utf8?) -> none` | g_mount_operation_set_domain |  | Sets the mount operation's domain. |
| set_is_tcrypt_hidden_volume | `MountOperation.set_is_tcrypt_hidden_volume(hidden_volume: gboolean) -> none` | g_mount_operation_set_is_tcrypt_hidden_volume | 2.58 | Sets the mount operation to use a hidden volume if @hidden_volume is %TRUE. |
| set_is_tcrypt_system_volume | `MountOperation.set_is_tcrypt_system_volume(system_volume: gboolean) -> none` | g_mount_operation_set_is_tcrypt_system_volume | 2.58 | Sets the mount operation to use a system volume if @system_volume is %TRUE. |
| set_password | `MountOperation.set_password(password: utf8?) -> none` | g_mount_operation_set_password |  | Sets the mount operation's password to @password. |
| set_password_save | `MountOperation.set_password_save(save: PasswordSave) -> none` | g_mount_operation_set_password_save |  | Sets the state of saving passwords for the mount operation. |
| set_pim | `MountOperation.set_pim(pim: guint) -> none` | g_mount_operation_set_pim | 2.58 | Sets the mount operation's PIM to @pim. |
| set_username | `MountOperation.set_username(username: utf8?) -> none` | g_mount_operation_set_username |  | Sets the user name within @op to @username. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| anonymous | gboolean | read, write | Whether to use an anonymous user when authenticating. |
| choice | gint | read, write | The index of the user's choice when a question is asked during the mount operation. See the #GMountOperation::ask-question signal. |
| domain | utf8 | read, write | The domain to use for the mount operation. |
| is-tcrypt-hidden-volume | gboolean | read, write | Whether the device to be unlocked is a TCRYPT hidden volume. See the VeraCrypt documentation. |
| is-tcrypt-system-volume | gboolean | read, write | Whether the device to be unlocked is a TCRYPT system volume. In this context, a system volume is a volume with a bootloader and operating system in... |
| password | utf8 | read, write | The password that is used for authentication when carrying out the mount operation. |
| password-save | PasswordSave | read, write | Determines if and how the password information should be saved. |
| pim | guint | read, write | The VeraCrypt PIM value, when unlocking a VeraCrypt volume. See the VeraCrypt documentation.html). |
| username | utf8 | read, write | The user name that is used for authentication when carrying out the mount operation. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| aborted | `` | none | last | 2.20 | Emitted by the backend when e.g. a device becomes unavailable while a mount operation is in progress. Implementations of GMountOperation should han... |
| ask-password | `message: utf8, default_user: utf8, default_domain: utf8, flags: AskPasswordFlags` | none | last |  | Emitted when a mount operation asks the user for a password. If the message contains a line break, the first line should be presented as a heading.... |
| ask-question | `message: utf8, choices: utf8` | none | last |  | Emitted when asking the user a question and gives a list of choices for the user to choose from. If the message contains a line break, the first li... |
| reply | `result: MountOperationResult` | none | last |  | Emitted when the user has replied to the mount operation. |
| show-processes | `message: utf8, processes: GLib.Pid, choices: utf8` | none | last | 2.22 | Emitted when one or more processes are blocking an operation e.g. unmounting/ejecting a #GMount or stopping a #GDrive. Note that this signal may be... |
| show-unmount-progress | `message: utf8, time_left: gint64, bytes_left: gint64` | none | last | 2.34 | Emitted when an unmount operation has been busy for more than some time (typically 1.5 seconds). When unmounting or ejecting a volume, the kernel m... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| aborted | `aborted() -> none` |  |  |  |
| ask_password | `ask_password(message: utf8, default_user: utf8, default_domain: utf8, flags: AskPasswordFlags) -> none` |  |  |  |
| ask_question | `ask_question(message: utf8, choices: utf8) -> none` |  |  | Virtual implementation of #GMountOperation::ask-question. |
| reply | `reply(result: MountOperationResult) -> none` |  |  | Emits the #GMountOperation::reply signal. |
| show_processes | `show_processes(message: utf8, processes: GLib.Pid, choices: utf8) -> none` |  | 2.22 | Virtual implementation of #GMountOperation::show-processes. |
| show_unmount_progress | `show_unmount_progress(message: utf8, time_left: gint64, bytes_left: gint64) -> none` |  |  |  |

### Gio.NativeSocketAddress

Parent: `SocketAddress` ?? Implements: `SocketConnectable` ?? GType: `GNativeSocketAddress` ?? C type: `GNativeSocketAddress`

A socket address of some unknown native type. This corresponds to a general `struct sockaddr` of a type not otherwise handled by GLib.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketAddress |
| priv | NativeSocketAddressPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NativeSocketAddress.new(native: gpointer?, len: gsize) -> SocketAddress` | g_native_socket_address_new | 2.46 | Creates a new #GNativeSocketAddress for @native and @len. |

### Gio.NativeVolumeMonitor

Parent: `VolumeMonitor` ?? GType: `GNativeVolumeMonitor` ?? C type: `GNativeVolumeMonitor` ?? Abstract

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | VolumeMonitor |

### Gio.NetworkAddress

Parent: `GObject.Object` ?? Implements: `SocketConnectable` ?? GType: `GNetworkAddress` ?? C type: `GNetworkAddress`

`GNetworkAddress` provides an easy way to resolve a hostname and then attempt to connect to that host, handling the possibility of multiple IP addr...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | NetworkAddressPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NetworkAddress.new(hostname: utf8, port: guint16) -> NetworkAddress` | g_network_address_new | 2.22 | Creates a new #GSocketConnectable for connecting to the given @hostname and @port. Note that depending on the configuration of the machine, a @host... |
| new_loopback | `NetworkAddress.new_loopback(port: guint16) -> NetworkAddress` | g_network_address_new_loopback | 2.44 | Creates a new #GSocketConnectable for connecting to the local host over a loopback connection to the given @port. This is intended for use in conne... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(host_and_port: utf8, default_port: guint16) -> NetworkAddress throws` | g_network_address_parse | 2.22 | Creates a new #GSocketConnectable for connecting to the given @hostname and @port. May fail and return %NULL in case parsing @host_and_port fails. ... |
| parse_uri | `parse_uri(uri: utf8, default_port: guint16) -> NetworkAddress throws` | g_network_address_parse_uri | 2.26 | Creates a new #GSocketConnectable for connecting to the given @uri. May fail and return %NULL in case parsing @uri fails. Using this rather than g_... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_hostname | `NetworkAddress.get_hostname() -> utf8` | g_network_address_get_hostname | 2.22 | Gets @addr's hostname. This might be either UTF-8 or ASCII-encoded, depending on what @addr was created with. |
| get_port | `NetworkAddress.get_port() -> guint16` | g_network_address_get_port | 2.22 | Gets @addr's port number |
| get_scheme | `NetworkAddress.get_scheme() -> utf8` | g_network_address_get_scheme | 2.26 | Gets @addr's scheme |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| hostname | utf8 | read, write, construct-only | Hostname to resolve. |
| port | guint | read, write, construct-only | Network port. |
| scheme | utf8 | read, write, construct-only | URI scheme. |

### Gio.NetworkService

Parent: `GObject.Object` ?? Implements: `SocketConnectable` ?? GType: `GNetworkService` ?? C type: `GNetworkService`

Like [class@Gio.NetworkAddress] does with hostnames, `GNetworkService` provides an easy way to resolve a SRV record, and then attempt to connect to...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | NetworkServicePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NetworkService.new(service: utf8, protocol: utf8, domain: utf8) -> NetworkService` | g_network_service_new | 2.22 | Creates a new #GNetworkService representing the given @service, @protocol, and @domain. This will initially be unresolved; use the #GSocketConnecta... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_domain | `NetworkService.get_domain() -> utf8` | g_network_service_get_domain | 2.22 | Gets the domain that @srv serves. This might be either UTF-8 or ASCII-encoded, depending on what @srv was created with. |
| get_protocol | `NetworkService.get_protocol() -> utf8` | g_network_service_get_protocol | 2.22 | Gets @srv's protocol name (eg, "tcp"). |
| get_scheme | `NetworkService.get_scheme() -> utf8` | g_network_service_get_scheme | 2.26 | Gets the URI scheme used to resolve proxies. By default, the service name is used as scheme. |
| get_service | `NetworkService.get_service() -> utf8` | g_network_service_get_service | 2.22 | Gets @srv's service name (eg, "ldap"). |
| set_scheme | `NetworkService.set_scheme(scheme: utf8) -> none` | g_network_service_set_scheme | 2.26 | Set's the URI scheme used to resolve proxies. By default, the service name is used as scheme. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| domain | utf8 | read, write, construct-only | Network domain, for example `example.com`. |
| protocol | utf8 | read, write, construct-only | Network protocol, for example `tcp`. |
| scheme | utf8 | read, write | Network scheme (default is to use service). |
| service | utf8 | read, write, construct-only | Service name, for example `ldap`. |

### Gio.Notification

Parent: `GObject.Object` ?? GType: `GNotification` ?? C type: `GNotification`

`GNotification` is a mechanism for creating a notification to be shown to the user ??? typically as a pop-up notification presented by the desktop ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Notification.new(title: utf8) -> Notification` | g_notification_new | 2.40 | Creates a new #GNotification with @title as its title. After populating @notification with more details, it can be sent to the desktop shell with g... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_button | `Notification.add_button(label: utf8, detailed_action: utf8) -> none` | g_notification_add_button | 2.40 | Adds a button to @notification that activates the action in @detailed_action when clicked. That action must be an application-wide action (starting... |
| add_button_with_target | `Notification.add_button_with_target(label: utf8, action: utf8, target_format: utf8?, ...: void) -> none` | g_notification_add_button_with_target | 2.40 | Adds a button to @notification that activates @action when clicked. @action must be an application-wide action (it must start with "app."). If @tar... |
| add_button_with_target_value | `Notification.add_button_with_target_value(label: utf8, action: utf8, target: GLib.Variant?) -> none` | g_notification_add_button_with_target_value | 2.40 | Adds a button to @notification that activates @action when clicked. @action must be an application-wide action (it must start with "app."). If @tar... |
| set_body | `Notification.set_body(body: utf8?) -> none` | g_notification_set_body | 2.40 | Sets the body of @notification to @body. |
| set_category | `Notification.set_category(category: utf8?) -> none` | g_notification_set_category | 2.70 | Sets the type of @notification to @category. Categories have a main type like `email`, `im` or `device` and can have a detail separated by a `.`, e... |
| set_default_action | `Notification.set_default_action(detailed_action: utf8) -> none` | g_notification_set_default_action | 2.40 | Sets the default action of @notification to @detailed_action. This action is activated when the notification is clicked on. The action in @detailed... |
| set_default_action_and_target | `Notification.set_default_action_and_target(action: utf8, target_format: utf8?, ...: void) -> none` | g_notification_set_default_action_and_target | 2.40 | Sets the default action of @notification to @action. This action is activated when the notification is clicked on. It must be an application-wide a... |
| set_default_action_and_target_value | `Notification.set_default_action_and_target_value(action: utf8, target: GLib.Variant?) -> none` | g_notification_set_default_action_and_target_value | 2.40 | Sets the default action of @notification to @action. This action is activated when the notification is clicked on. It must be an application-wide a... |
| set_icon | `Notification.set_icon(icon: Icon) -> none` | g_notification_set_icon | 2.40 | Sets the icon of @notification to @icon. |
| set_priority | `Notification.set_priority(priority: NotificationPriority) -> none` | g_notification_set_priority |  | Sets the priority of @notification to @priority. See #GNotificationPriority for possible values. |
| set_title | `Notification.set_title(title: utf8) -> none` | g_notification_set_title | 2.40 | Sets the title of @notification to @title. |
| set_urgent | `Notification.set_urgent(urgent: gboolean) -> none` | g_notification_set_urgent | 2.40 | Deprecated in favor of g_notification_set_priority(). |

### Gio.OutputStream

Parent: `GObject.Object` ?? Subclasses: `FileOutputStream`, `FilterOutputStream`, `MemoryOutputStream`, `UnixOutputStream` ?? GType: `GOutputStream` ?? C type: `GOutputStream` ?? Abstract

`GOutputStream` is a base class for implementing streaming output. It has functions to write to a stream ([method@Gio.OutputStream.write]), to clos...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | OutputStreamPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_pending | `OutputStream.clear_pending() -> none` | g_output_stream_clear_pending |  | Clears the pending flag on @stream. |
| close | `OutputStream.close(cancellable: Cancellable?) -> gboolean throws` | g_output_stream_close |  | Closes the stream, releasing resources related to it. Once the stream is closed, all other operations will return %G_IO_ERROR_CLOSED. Closing a str... |
| close_async | `OutputStream.close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_close_async |  | Requests an asynchronous close of the stream, releasing resources related to it. When the operation is finished @callback will be called. You can t... |
| close_finish | `OutputStream.close_finish(result: AsyncResult) -> gboolean throws` | g_output_stream_close_finish |  | Closes an output stream. |
| flush | `OutputStream.flush(cancellable: Cancellable?) -> gboolean throws` | g_output_stream_flush |  | Forces a write of all user-space buffered data for the given @stream. Will block during the operation. Closing the stream will implicitly cause a f... |
| flush_async | `OutputStream.flush_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_flush_async |  | Forces an asynchronous write of all user-space buffered data for the given @stream. For behaviour details see g_output_stream_flush(). When the ope... |
| flush_finish | `OutputStream.flush_finish(result: AsyncResult) -> gboolean throws` | g_output_stream_flush_finish |  | Finishes flushing an output stream. |
| has_pending | `OutputStream.has_pending() -> gboolean` | g_output_stream_has_pending |  | Checks if an output stream has pending actions. |
| is_closed | `OutputStream.is_closed() -> gboolean` | g_output_stream_is_closed |  | Checks if an output stream has already been closed. |
| is_closing | `OutputStream.is_closing() -> gboolean` | g_output_stream_is_closing | 2.24 | Checks if an output stream is being closed. This can be used inside e.g. a flush implementation to see if the flush (or other i/o operation) is cal... |
| printf | `OutputStream.printf(bytes_written: out gsize?, cancellable: Cancellable?, error: GLib.Error, format: utf8, ...: void) -> gboolean` | g_output_stream_printf | 2.40 | This is a utility function around g_output_stream_write_all(). It uses g_strdup_vprintf() to turn @format and @... into a string that is then writt... |
| set_pending | `OutputStream.set_pending() -> gboolean throws` | g_output_stream_set_pending |  | Sets @stream to have actions pending. If the pending flag is already set or @stream is closed, it will return %FALSE and set @error. |
| splice | `OutputStream.splice(source: InputStream, flags: OutputStreamSpliceFlags, cancellable: Cancellable?) -> gssize throws` | g_output_stream_splice |  | Splices an input stream into an output stream. |
| splice_async | `OutputStream.splice_async(source: InputStream, flags: OutputStreamSpliceFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_splice_async |  | Splices a stream asynchronously. When the operation is finished @callback will be called. You can then call g_output_stream_splice_finish() to get ... |
| splice_finish | `OutputStream.splice_finish(result: AsyncResult) -> gssize throws` | g_output_stream_splice_finish |  | Finishes an asynchronous stream splice operation. |
| vprintf | `OutputStream.vprintf(bytes_written: out gsize?, cancellable: Cancellable?, error: GLib.Error, format: utf8, args: va_list) -> gboolean` | g_output_stream_vprintf | 2.40 | This is a utility function around g_output_stream_write_all(). It uses g_strdup_vprintf() to turn @format and @args into a string that is then writ... |
| write | `OutputStream.write(buffer: guint8, count: gsize, cancellable: Cancellable?) -> gssize throws` | g_output_stream_write |  | Tries to write @count bytes from @buffer into the stream. Will block during the operation. If count is 0, returns 0 and does nothing. A value of @c... |
| write_all | `OutputStream.write_all(buffer: guint8, count: gsize, bytes_written: out gsize?, cancellable: Cancellable?) -> gboolean throws` | g_output_stream_write_all |  | Tries to write @count bytes from @buffer into the stream. Will block during the operation. This function is similar to g_output_stream_write(), exc... |
| write_all_async | `OutputStream.write_all_async(buffer: guint8, count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_write_all_async | 2.44 | Request an asynchronous write of @count bytes from @buffer into the stream. When the operation is finished @callback will be called. You can then c... |
| write_all_finish | `OutputStream.write_all_finish(result: AsyncResult, bytes_written: out gsize?) -> gboolean throws` | g_output_stream_write_all_finish | 2.44 | Finishes an asynchronous stream write operation started with g_output_stream_write_all_async(). As a special exception to the normal conventions fo... |
| write_async | `OutputStream.write_async(buffer: guint8, count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_write_async |  | Request an asynchronous write of @count bytes from @buffer into the stream. When the operation is finished @callback will be called. You can then c... |
| write_bytes | `OutputStream.write_bytes(bytes: GLib.Bytes, cancellable: Cancellable?) -> gssize throws` | g_output_stream_write_bytes |  | A wrapper function for g_output_stream_write() which takes a #GBytes as input. This can be more convenient for use by language bindings or in other... |
| write_bytes_async | `OutputStream.write_bytes_async(bytes: GLib.Bytes, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_write_bytes_async |  | This function is similar to g_output_stream_write_async(), but takes a #GBytes as input. Due to the refcounted nature of #GBytes, this allows the s... |
| write_bytes_finish | `OutputStream.write_bytes_finish(result: AsyncResult) -> gssize throws` | g_output_stream_write_bytes_finish |  | Finishes a stream write-from-#GBytes operation. |
| write_finish | `OutputStream.write_finish(result: AsyncResult) -> gssize throws` | g_output_stream_write_finish |  | Finishes a stream write operation. |
| writev | `OutputStream.writev(vectors: OutputVector, n_vectors: gsize, bytes_written: out gsize?, cancellable: Cancellable?) -> gboolean throws` | g_output_stream_writev | 2.60 | Tries to write the bytes contained in the @n_vectors @vectors into the stream. Will block during the operation. If @n_vectors is 0 or the sum of al... |
| writev_all | `OutputStream.writev_all(vectors: OutputVector, n_vectors: gsize, bytes_written: out gsize?, cancellable: Cancellable?) -> gboolean throws` | g_output_stream_writev_all | 2.60 | Tries to write the bytes contained in the @n_vectors @vectors into the stream. Will block during the operation. This function is similar to g_outpu... |
| writev_all_async | `OutputStream.writev_all_async(vectors: OutputVector, n_vectors: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_writev_all_async | 2.60 | Request an asynchronous write of the bytes contained in the @n_vectors @vectors into the stream. When the operation is finished @callback will be c... |
| writev_all_finish | `OutputStream.writev_all_finish(result: AsyncResult, bytes_written: out gsize?) -> gboolean throws` | g_output_stream_writev_all_finish | 2.60 | Finishes an asynchronous stream write operation started with g_output_stream_writev_all_async(). As a special exception to the normal conventions f... |
| writev_async | `OutputStream.writev_async(vectors: OutputVector, n_vectors: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_output_stream_writev_async | 2.60 | Request an asynchronous write of the bytes contained in @n_vectors @vectors into the stream. When the operation is finished @callback will be calle... |
| writev_finish | `OutputStream.writev_finish(result: AsyncResult, bytes_written: out gsize?) -> gboolean throws` | g_output_stream_writev_finish | 2.60 | Finishes a stream writev operation. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close_async | `close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Requests an asynchronous close of the stream, releasing resources related to it. When the operation is finished @callback will be called. You can t... |
| close_finish | `close_finish(result: AsyncResult) -> gboolean throws` |  |  | Closes an output stream. |
| close_fn | `close_fn(cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| flush | `flush(cancellable: Cancellable?) -> gboolean throws` |  |  | Forces a write of all user-space buffered data for the given @stream. Will block during the operation. Closing the stream will implicitly cause a f... |
| flush_async | `flush_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Forces an asynchronous write of all user-space buffered data for the given @stream. For behaviour details see g_output_stream_flush(). When the ope... |
| flush_finish | `flush_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes flushing an output stream. |
| splice | `splice(source: InputStream, flags: OutputStreamSpliceFlags, cancellable: Cancellable?) -> gssize throws` |  |  | Splices an input stream into an output stream. |
| splice_async | `splice_async(source: InputStream, flags: OutputStreamSpliceFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Splices a stream asynchronously. When the operation is finished @callback will be called. You can then call g_output_stream_splice_finish() to get ... |
| splice_finish | `splice_finish(result: AsyncResult) -> gssize throws` |  |  | Finishes an asynchronous stream splice operation. |
| write_async | `write_async(buffer: guint8?, count: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Request an asynchronous write of @count bytes from @buffer into the stream. When the operation is finished @callback will be called. You can then c... |
| write_finish | `write_finish(result: AsyncResult) -> gssize throws` |  |  | Finishes a stream write operation. |
| write_fn | `write_fn(buffer: guint8?, count: gsize, cancellable: Cancellable?) -> gssize throws` |  |  | Tries to write @count bytes from @buffer into the stream. Will block during the operation. If count is 0, returns 0 and does nothing. A value of @c... |
| writev_async | `writev_async(vectors: OutputVector, n_vectors: gsize, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.60 | Request an asynchronous write of the bytes contained in @n_vectors @vectors into the stream. When the operation is finished @callback will be calle... |
| writev_finish | `writev_finish(result: AsyncResult, bytes_written: out gsize?) -> gboolean throws` |  | 2.60 | Finishes a stream writev operation. |
| writev_fn | `writev_fn(vectors: OutputVector, n_vectors: gsize, bytes_written: out gsize?, cancellable: Cancellable?) -> gboolean throws` |  | 2.60 | Tries to write the bytes contained in the @n_vectors @vectors into the stream. Will block during the operation. If @n_vectors is 0 or the sum of al... |

### Gio.Permission

Parent: `GObject.Object` ?? Subclasses: `SimplePermission` ?? GType: `GPermission` ?? C type: `GPermission` ?? Abstract

A `GPermission` represents the status of the caller???s permission to perform a certain action. You can query if the action is currently allowed an...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | PermissionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| acquire | `Permission.acquire(cancellable: Cancellable?) -> gboolean throws` | g_permission_acquire | 2.26 | Attempts to acquire the permission represented by @permission. The precise method by which this happens depends on the permission and the underlyin... |
| acquire_async | `Permission.acquire_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_permission_acquire_async | 2.26 | Attempts to acquire the permission represented by @permission. This is the first half of the asynchronous version of g_permission_acquire(). |
| acquire_finish | `Permission.acquire_finish(result: AsyncResult) -> gboolean throws` | g_permission_acquire_finish | 2.26 | Collects the result of attempting to acquire the permission represented by @permission. This is the second half of the asynchronous version of g_pe... |
| get_allowed | `Permission.get_allowed() -> gboolean` | g_permission_get_allowed | 2.26 | Gets the value of the 'allowed' property. This property is %TRUE if the caller currently has permission to perform the action that @permission repr... |
| get_can_acquire | `Permission.get_can_acquire() -> gboolean` | g_permission_get_can_acquire | 2.26 | Gets the value of the 'can-acquire' property. This property is %TRUE if it is generally possible to acquire the permission by calling g_permission_... |
| get_can_release | `Permission.get_can_release() -> gboolean` | g_permission_get_can_release | 2.26 | Gets the value of the 'can-release' property. This property is %TRUE if it is generally possible to release the permission by calling g_permission_... |
| impl_update | `Permission.impl_update(allowed: gboolean, can_acquire: gboolean, can_release: gboolean) -> none` | g_permission_impl_update | 2.26 | This function is called by the #GPermission implementation to update the properties of the permission. You should never call this function except f... |
| release | `Permission.release(cancellable: Cancellable?) -> gboolean throws` | g_permission_release | 2.26 | Attempts to release the permission represented by @permission. The precise method by which this happens depends on the permission and the underlyin... |
| release_async | `Permission.release_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_permission_release_async | 2.26 | Attempts to release the permission represented by @permission. This is the first half of the asynchronous version of g_permission_release(). |
| release_finish | `Permission.release_finish(result: AsyncResult) -> gboolean throws` | g_permission_release_finish | 2.26 | Collects the result of attempting to release the permission represented by @permission. This is the second half of the asynchronous version of g_pe... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| allowed | gboolean | read | %TRUE if the caller currently has permission to perform the action that @permission represents the permission to perform. |
| can-acquire | gboolean | read | %TRUE if it is generally possible to acquire the permission by calling g_permission_acquire(). |
| can-release | gboolean | read | %TRUE if it is generally possible to release the permission by calling g_permission_release(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| acquire | `acquire(cancellable: Cancellable?) -> gboolean throws` |  | 2.26 | Attempts to acquire the permission represented by @permission. The precise method by which this happens depends on the permission and the underlyin... |
| acquire_async | `acquire_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.26 | Attempts to acquire the permission represented by @permission. This is the first half of the asynchronous version of g_permission_acquire(). |
| acquire_finish | `acquire_finish(result: AsyncResult) -> gboolean throws` |  | 2.26 | Collects the result of attempting to acquire the permission represented by @permission. This is the second half of the asynchronous version of g_pe... |
| release | `release(cancellable: Cancellable?) -> gboolean throws` |  | 2.26 | Attempts to release the permission represented by @permission. The precise method by which this happens depends on the permission and the underlyin... |
| release_async | `release_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.26 | Attempts to release the permission represented by @permission. This is the first half of the asynchronous version of g_permission_release(). |
| release_finish | `release_finish(result: AsyncResult) -> gboolean throws` |  | 2.26 | Collects the result of attempting to release the permission represented by @permission. This is the second half of the asynchronous version of g_pe... |

### Gio.PropertyAction

Parent: `GObject.Object` ?? Implements: `Action` ?? GType: `GPropertyAction` ?? C type: `GPropertyAction`

A `GPropertyAction` is a way to get a [iface@Gio.Action] with a state value reflecting and controlling the value of a [class@GObject.Object] proper...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PropertyAction.new(name: utf8, object: GObject.Object, property_name: utf8) -> PropertyAction` | g_property_action_new | 2.38 | Creates a #GAction corresponding to the value of property @property_name on @object. The property must be existent and readable and writable (and n... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enabled | gboolean | read | If @action is currently enabled. If the action is disabled then calls to g_action_activate() and g_action_change_state() have no effect. |
| invert-boolean | gboolean | read, write, construct-only | If %TRUE, the state of the action will be the negation of the property value, provided the property is boolean. |
| name | utf8 | read, write, construct-only | The name of the action. This is mostly meaningful for identifying the action once it has been added to a #GActionMap. |
| object | GObject.Object | write, construct-only | The object to wrap a property on. The object must be a non-%NULL #GObject with properties. |
| parameter-type | GLib.VariantType | read | The type of the parameter that must be given when activating the action. |
| property-name | utf8 | write, construct-only | The name of the property to wrap on the object. The property must exist on the passed-in object and it must be readable and writable (and not const... |
| state | GLib.Variant | read | The state of the action, or %NULL if the action is stateless. |
| state-type | GLib.VariantType | read | The #GVariantType of the state that the action has, or %NULL if the action is stateless. |

### Gio.ProxyAddress

Parent: `InetSocketAddress` ?? Implements: `SocketConnectable` ?? GType: `GProxyAddress` ?? C type: `GProxyAddress`

A [class@Gio.InetSocketAddress] representing a connection via a proxy server.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | InetSocketAddress |
| priv | ProxyAddressPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ProxyAddress.new(inetaddr: InetAddress, port: guint16, protocol: utf8, dest_hostname: utf8, dest_port: guint16, username: utf8?, password: utf8?) -> SocketAddress` | g_proxy_address_new | 2.26 | Creates a new #GProxyAddress for @inetaddr with @protocol that should tunnel through @dest_hostname and @dest_port. (Note that this method doesn't ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_destination_hostname | `ProxyAddress.get_destination_hostname() -> utf8` | g_proxy_address_get_destination_hostname | 2.26 | Gets @proxy's destination hostname; that is, the name of the host that will be connected to via the proxy, not the name of the proxy itself. |
| get_destination_port | `ProxyAddress.get_destination_port() -> guint16` | g_proxy_address_get_destination_port | 2.26 | Gets @proxy's destination port; that is, the port on the destination host that will be connected to via the proxy, not the port number of the proxy... |
| get_destination_protocol | `ProxyAddress.get_destination_protocol() -> utf8` | g_proxy_address_get_destination_protocol | 2.34 | Gets the protocol that is being spoken to the destination server; eg, "http" or "ftp". |
| get_password | `ProxyAddress.get_password() -> utf8` | g_proxy_address_get_password | 2.26 | Gets @proxy's password. |
| get_protocol | `ProxyAddress.get_protocol() -> utf8` | g_proxy_address_get_protocol | 2.26 | Gets @proxy's protocol. eg, "socks" or "http" |
| get_uri | `ProxyAddress.get_uri() -> utf8` | g_proxy_address_get_uri | 2.34 | Gets the proxy URI that @proxy was constructed from. |
| get_username | `ProxyAddress.get_username() -> utf8` | g_proxy_address_get_username | 2.26 | Gets @proxy's username. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| destination-hostname | utf8 | read, write, construct-only | The proxy destination hostname. |
| destination-port | guint | read, write, construct-only | The proxy destination port. |
| destination-protocol | utf8 | read, write, construct-only | The protocol being spoke to the destination host, or %NULL if the #GProxyAddress doesn't know. |
| password | utf8 | read, write, construct-only | The proxy password. |
| protocol | utf8 | read, write, construct-only | The proxy protocol. |
| uri | utf8 | read, write, construct-only | The URI string that the proxy was constructed from (or %NULL if the creator didn't specify this). |
| username | utf8 | read, write, construct-only | The proxy username. |

### Gio.ProxyAddressEnumerator

Parent: `SocketAddressEnumerator` ?? GType: `GProxyAddressEnumerator` ?? C type: `GProxyAddressEnumerator`

`GProxyAddressEnumerator` is a wrapper around [class@Gio.SocketAddressEnumerator] which takes the [class@Gio.SocketAddress] instances returned by t...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketAddressEnumerator |
| priv | ProxyAddressEnumeratorPrivate |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connectable | SocketConnectable | read, write, construct-only | The connectable being enumerated. |
| default-port | guint | read, write, construct-only | The default port to use if #GProxyAddressEnumerator:uri does not specify one. |
| proxy-resolver | ProxyResolver | read, write | The proxy resolver to use. |
| uri | utf8 | read, write, construct-only | The destination URI. Use `none://` for a generic socket. |

### Gio.Resolver

Parent: `GObject.Object` ?? Subclasses: `ThreadedResolver` ?? GType: `GResolver` ?? C type: `GResolver` ?? Abstract

The object that handles DNS resolution. Use [func@Gio.Resolver.get_default] to get the default resolver. `GResolver` provides cancellable synchrono...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | ResolverPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free_addresses | `free_addresses(addresses: GLib.List) -> none` | g_resolver_free_addresses | 2.22 | Frees @addresses (which should be the return value from g_resolver_lookup_by_name() or g_resolver_lookup_by_name_finish()). (This is a convenience ... |
| free_targets | `free_targets(targets: GLib.List) -> none` | g_resolver_free_targets | 2.22 | Frees @targets (which should be the return value from g_resolver_lookup_service() or g_resolver_lookup_service_finish()). (This is a convenience me... |
| get_default | `get_default() -> Resolver` | g_resolver_get_default | 2.22 | Gets the default #GResolver. You should unref it when you are done with it. #GResolver may use its reference count as a hint about how many threads... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_timeout | `Resolver.get_timeout() -> guint` | g_resolver_get_timeout | 2.78 | Get the timeout applied to all resolver lookups. See #GResolver:timeout. |
| lookup_by_address | `Resolver.lookup_by_address(address: InetAddress, cancellable: Cancellable?) -> utf8 throws` | g_resolver_lookup_by_address | 2.22 | Synchronously reverse-resolves @address to determine its associated hostname. If the DNS resolution fails, @error (if non-%NULL) will be set to a v... |
| lookup_by_address_async | `Resolver.lookup_by_address_async(address: InetAddress, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_resolver_lookup_by_address_async | 2.22 | Begins asynchronously reverse-resolving @address to determine its associated hostname, and eventually calls @callback, which must call g_resolver_l... |
| lookup_by_address_finish | `Resolver.lookup_by_address_finish(result: AsyncResult) -> utf8 throws` | g_resolver_lookup_by_address_finish | 2.22 | Retrieves the result of a previous call to g_resolver_lookup_by_address_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to... |
| lookup_by_name | `Resolver.lookup_by_name(hostname: utf8, cancellable: Cancellable?) -> GLib.List throws` | g_resolver_lookup_by_name | 2.22 | Synchronously resolves @hostname to determine its associated IP address(es). @hostname may be an ASCII-only or UTF-8 hostname, or the textual form ... |
| lookup_by_name_async | `Resolver.lookup_by_name_async(hostname: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_resolver_lookup_by_name_async | 2.22 | Begins asynchronously resolving @hostname to determine its associated IP address(es), and eventually calls @callback, which must call g_resolver_lo... |
| lookup_by_name_finish | `Resolver.lookup_by_name_finish(result: AsyncResult) -> GLib.List throws` | g_resolver_lookup_by_name_finish | 2.22 | Retrieves the result of a call to g_resolver_lookup_by_name_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to a value fro... |
| lookup_by_name_with_flags | `Resolver.lookup_by_name_with_flags(hostname: utf8, flags: ResolverNameLookupFlags, cancellable: Cancellable?) -> GLib.List throws` | g_resolver_lookup_by_name_with_flags | 2.60 | This differs from g_resolver_lookup_by_name() in that you can modify the lookup behavior with @flags. For example this can be used to limit results... |
| lookup_by_name_with_flags_async | `Resolver.lookup_by_name_with_flags_async(hostname: utf8, flags: ResolverNameLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_resolver_lookup_by_name_with_flags_async | 2.60 | Begins asynchronously resolving @hostname to determine its associated IP address(es), and eventually calls @callback, which must call g_resolver_lo... |
| lookup_by_name_with_flags_finish | `Resolver.lookup_by_name_with_flags_finish(result: AsyncResult) -> GLib.List throws` | g_resolver_lookup_by_name_with_flags_finish | 2.60 | Retrieves the result of a call to g_resolver_lookup_by_name_with_flags_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to ... |
| lookup_records | `Resolver.lookup_records(rrname: utf8, record_type: ResolverRecordType, cancellable: Cancellable?) -> GLib.List throws` | g_resolver_lookup_records | 2.34 | Synchronously performs a DNS record lookup for the given @rrname and returns a list of records as #GVariant tuples. See #GResolverRecordType for in... |
| lookup_records_async | `Resolver.lookup_records_async(rrname: utf8, record_type: ResolverRecordType, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_resolver_lookup_records_async | 2.34 | Begins asynchronously performing a DNS lookup for the given @rrname, and eventually calls @callback, which must call g_resolver_lookup_records_fini... |
| lookup_records_finish | `Resolver.lookup_records_finish(result: AsyncResult) -> GLib.List throws` | g_resolver_lookup_records_finish | 2.34 | Retrieves the result of a previous call to g_resolver_lookup_records_async(). Returns a non-empty list of records as #GVariant tuples. See #GResolv... |
| lookup_service | `Resolver.lookup_service(service: utf8, protocol: utf8, domain: utf8, cancellable: Cancellable?) -> GLib.List throws` | g_resolver_lookup_service | 2.22 | Synchronously performs a DNS SRV lookup for the given @service and @protocol in the given @domain and returns an array of #GSrvTarget. @domain may ... |
| lookup_service_async | `Resolver.lookup_service_async(service: utf8, protocol: utf8, domain: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_resolver_lookup_service_async | 2.22 | Begins asynchronously performing a DNS SRV lookup for the given @service and @protocol in the given @domain, and eventually calls @callback, which ... |
| lookup_service_finish | `Resolver.lookup_service_finish(result: AsyncResult) -> GLib.List throws` | g_resolver_lookup_service_finish | 2.22 | Retrieves the result of a previous call to g_resolver_lookup_service_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to a ... |
| set_default | `Resolver.set_default() -> none` | g_resolver_set_default | 2.22 | Sets @resolver to be the application's default resolver (reffing @resolver, and unreffing the previous default resolver, if any). Future calls to g... |
| set_timeout | `Resolver.set_timeout(timeout_ms: guint) -> none` | g_resolver_set_timeout | 2.78 | Set the timeout applied to all resolver lookups. See #GResolver:timeout. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| timeout | guint | read, write | The timeout applied to all resolver lookups, in milliseconds. This may be changed through the lifetime of the #GResolver. The new value will apply ... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| reload | `` | none | last |  | Emitted when the resolver notices that the system resolver configuration has changed. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup_by_address | `lookup_by_address(address: InetAddress, cancellable: Cancellable?) -> utf8 throws` |  | 2.22 | Synchronously reverse-resolves @address to determine its associated hostname. If the DNS resolution fails, @error (if non-%NULL) will be set to a v... |
| lookup_by_address_async | `lookup_by_address_async(address: InetAddress, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Begins asynchronously reverse-resolving @address to determine its associated hostname, and eventually calls @callback, which must call g_resolver_l... |
| lookup_by_address_finish | `lookup_by_address_finish(result: AsyncResult) -> utf8 throws` |  | 2.22 | Retrieves the result of a previous call to g_resolver_lookup_by_address_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to... |
| lookup_by_name | `lookup_by_name(hostname: utf8, cancellable: Cancellable?) -> GLib.List throws` |  | 2.22 | Synchronously resolves @hostname to determine its associated IP address(es). @hostname may be an ASCII-only or UTF-8 hostname, or the textual form ... |
| lookup_by_name_async | `lookup_by_name_async(hostname: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Begins asynchronously resolving @hostname to determine its associated IP address(es), and eventually calls @callback, which must call g_resolver_lo... |
| lookup_by_name_finish | `lookup_by_name_finish(result: AsyncResult) -> GLib.List throws` |  | 2.22 | Retrieves the result of a call to g_resolver_lookup_by_name_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to a value fro... |
| lookup_by_name_with_flags | `lookup_by_name_with_flags(hostname: utf8, flags: ResolverNameLookupFlags, cancellable: Cancellable?) -> GLib.List throws` |  | 2.60 | This differs from g_resolver_lookup_by_name() in that you can modify the lookup behavior with @flags. For example this can be used to limit results... |
| lookup_by_name_with_flags_async | `lookup_by_name_with_flags_async(hostname: utf8, flags: ResolverNameLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.60 | Begins asynchronously resolving @hostname to determine its associated IP address(es), and eventually calls @callback, which must call g_resolver_lo... |
| lookup_by_name_with_flags_finish | `lookup_by_name_with_flags_finish(result: AsyncResult) -> GLib.List throws` |  | 2.60 | Retrieves the result of a call to g_resolver_lookup_by_name_with_flags_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to ... |
| lookup_records | `lookup_records(rrname: utf8, record_type: ResolverRecordType, cancellable: Cancellable?) -> GLib.List throws` |  | 2.34 | Synchronously performs a DNS record lookup for the given @rrname and returns a list of records as #GVariant tuples. See #GResolverRecordType for in... |
| lookup_records_async | `lookup_records_async(rrname: utf8, record_type: ResolverRecordType, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.34 | Begins asynchronously performing a DNS lookup for the given @rrname, and eventually calls @callback, which must call g_resolver_lookup_records_fini... |
| lookup_records_finish | `lookup_records_finish(result: AsyncResult) -> GLib.List throws` |  | 2.34 | Retrieves the result of a previous call to g_resolver_lookup_records_async(). Returns a non-empty list of records as #GVariant tuples. See #GResolv... |
| lookup_service | `lookup_service(rrname: utf8, cancellable: Cancellable?) -> GLib.List throws` |  |  |  |
| lookup_service_async | `lookup_service_async(rrname: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  |  |
| lookup_service_finish | `lookup_service_finish(result: AsyncResult) -> GLib.List throws` |  | 2.22 | Retrieves the result of a previous call to g_resolver_lookup_service_async(). If the DNS resolution failed, @error (if non-%NULL) will be set to a ... |
| reload | `reload() -> none` |  |  |  |

### Gio.Settings

Parent: `GObject.Object` ?? GType: `GSettings` ?? C type: `GSettings`

The `GSettings` class provides a convenient API for storing and retrieving application settings. Reads and writes can be considered to be non-block...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SettingsPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Settings.new(schema_id: utf8) -> Settings` | g_settings_new | 2.26 | Creates a new #GSettings object with the schema specified by @schema_id. It is an error for the schema to not exist: schemas are an essential part ... |
| new_full | `Settings.new_full(schema: SettingsSchema, backend: SettingsBackend?, path: utf8?) -> Settings` | g_settings_new_full | 2.32 | Creates a new #GSettings object with a given schema, backend and path. It should be extremely rare that you ever want to use this function. It is m... |
| new_with_backend | `Settings.new_with_backend(schema_id: utf8, backend: SettingsBackend) -> Settings` | g_settings_new_with_backend | 2.26 | Creates a new #GSettings object with the schema specified by @schema_id and a given #GSettingsBackend. Creating a #GSettings object with a differen... |
| new_with_backend_and_path | `Settings.new_with_backend_and_path(schema_id: utf8, backend: SettingsBackend, path: utf8) -> Settings` | g_settings_new_with_backend_and_path | 2.26 | Creates a new #GSettings object with the schema specified by @schema_id and a given #GSettingsBackend and path. This is a mix of g_settings_new_wit... |
| new_with_path | `Settings.new_with_path(schema_id: utf8, path: utf8) -> Settings` | g_settings_new_with_path | 2.26 | Creates a new #GSettings object with the relocatable schema specified by @schema_id and a given path. You only need to do this if you want to direc... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| list_relocatable_schemas | `list_relocatable_schemas() -> utf8` | g_settings_list_relocatable_schemas | 2.28 | Deprecated. |
| list_schemas | `list_schemas() -> utf8` | g_settings_list_schemas | 2.26 | Deprecated. |
| sync | `sync() -> none` | g_settings_sync |  | Ensures that all pending operations are complete for the default backend. Writes made to a #GSettings are handled asynchronously. For this reason, ... |
| unbind | `unbind(object: GObject.Object, property: utf8) -> none` | g_settings_unbind | 2.26 | Removes an existing binding for @property on @object. Note that bindings are automatically removed when the object is finalized, so it is rarely ne... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| apply | `Settings.apply() -> none` | g_settings_apply |  | Applies any changes that have been made to the settings. This function does nothing unless @settings is in 'delay-apply' mode; see g_settings_delay... |
| bind | `Settings.bind(key: utf8, object: GObject.Object, property: utf8, flags: SettingsBindFlags) -> none` | g_settings_bind | 2.26 | Create a binding between the @key in the @settings object and the property @property of @object. The binding uses the default GIO mapping functions... |
| bind_with_mapping | `Settings.bind_with_mapping(key: utf8, object: GObject.Object, property: utf8, flags: SettingsBindFlags, get_mapping: SettingsBindGetMapping, set_mapping: SettingsBindSetMapping, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | g_settings_bind_with_mapping | 2.26 | Create a binding between the @key in the @settings object and the property @property of @object. The binding uses the provided mapping functions to... |
| bind_writable | `Settings.bind_writable(key: utf8, object: GObject.Object, property: utf8, inverted: gboolean) -> none` | g_settings_bind_writable | 2.26 | Create a binding between the writability of @key in the @settings object and the property @property of @object. The property must be boolean; "sens... |
| create_action | `Settings.create_action(key: utf8) -> Action` | g_settings_create_action | 2.32 | Creates a #GAction corresponding to a given #GSettings key. The action has the same name as the key. The value of the key becomes the state of the ... |
| delay | `Settings.delay() -> none` | g_settings_delay | 2.26 | Changes the #GSettings object into 'delay-apply' mode. In this mode, changes to @settings are not immediately propagated to the backend, but kept l... |
| get | `Settings.get(key: utf8, format: utf8, ...: void) -> none` | g_settings_get | 2.26 | Gets the value that is stored at @key in @settings. A convenience function that combines g_settings_get_value() with g_variant_get(). It is a progr... |
| get_boolean | `Settings.get_boolean(key: utf8) -> gboolean` | g_settings_get_boolean | 2.26 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for booleans. It is a programmer error to give a @key... |
| get_child | `Settings.get_child(name: utf8) -> Settings` | g_settings_get_child | 2.26 | Creates a child settings object which has a base path of `base-path/@name`, where `base-path` is the base path of @settings. The schema for the chi... |
| get_default_value | `Settings.get_default_value(key: utf8) -> GLib.Variant` | g_settings_get_default_value | 2.40 | Gets the "default value" of a key. This is the value that would be read if g_settings_reset() were to be called on the key. Note that this may be a... |
| get_double | `Settings.get_double(key: utf8) -> gdouble` | g_settings_get_double | 2.26 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for doubles. It is a programmer error to give a @key ... |
| get_enum | `Settings.get_enum(key: utf8) -> gint` | g_settings_get_enum | 2.26 | Gets the value that is stored in @settings for @key and converts it to the enum value that it represents. In order to use this function the type of... |
| get_flags | `Settings.get_flags(key: utf8) -> guint` | g_settings_get_flags | 2.26 | Gets the value that is stored in @settings for @key and converts it to the flags value that it represents. In order to use this function the type o... |
| get_has_unapplied | `Settings.get_has_unapplied() -> gboolean` | g_settings_get_has_unapplied | 2.26 | Returns whether the #GSettings object has any unapplied changes. This can only be the case if it is in 'delayed-apply' mode. |
| get_int | `Settings.get_int(key: utf8) -> gint` | g_settings_get_int | 2.26 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for 32-bit integers. It is a programmer error to give... |
| get_int64 | `Settings.get_int64(key: utf8) -> gint64` | g_settings_get_int64 | 2.50 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for 64-bit integers. It is a programmer error to give... |
| get_mapped | `Settings.get_mapped(key: utf8, mapping: SettingsGetMapping, user_data: gpointer?) -> gpointer` | g_settings_get_mapped |  | Gets the value that is stored at @key in @settings, subject to application-level validation/mapping. You should use this function when the applicat... |
| get_range | `Settings.get_range(key: utf8) -> GLib.Variant` | g_settings_get_range | 2.28 | Queries the range of a key. |
| get_string | `Settings.get_string(key: utf8) -> utf8` | g_settings_get_string | 2.26 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for strings. It is a programmer error to give a @key ... |
| get_strv | `Settings.get_strv(key: utf8) -> utf8` | g_settings_get_strv | 2.26 | A convenience variant of g_settings_get() for string arrays. It is a programmer error to give a @key that isn't specified as having an array of str... |
| get_uint | `Settings.get_uint(key: utf8) -> guint` | g_settings_get_uint | 2.30 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for 32-bit unsigned integers. It is a programmer erro... |
| get_uint64 | `Settings.get_uint64(key: utf8) -> guint64` | g_settings_get_uint64 | 2.50 | Gets the value that is stored at @key in @settings. A convenience variant of g_settings_get() for 64-bit unsigned integers. It is a programmer erro... |
| get_user_value | `Settings.get_user_value(key: utf8) -> GLib.Variant` | g_settings_get_user_value | 2.40 | Checks the "user value" of a key, if there is one. The user value of a key is the last value that was set by the user. After calling g_settings_res... |
| get_value | `Settings.get_value(key: utf8) -> GLib.Variant` | g_settings_get_value | 2.26 | Gets the value that is stored in @settings for @key. It is a programmer error to give a @key that isn't contained in the schema for @settings. |
| is_writable | `Settings.is_writable(name: utf8) -> gboolean` | g_settings_is_writable | 2.26 | Finds out if a key can be written or not |
| list_children | `Settings.list_children() -> utf8` | g_settings_list_children |  | Gets the list of children on @settings. The list is exactly the list of strings for which it is not an error to call g_settings_get_child(). There ... |
| list_keys | `Settings.list_keys() -> utf8` | g_settings_list_keys |  | Introspects the list of keys on @settings. You should probably not be calling this function from "normal" code (since you should already know what ... |
| range_check | `Settings.range_check(key: utf8, value: GLib.Variant) -> gboolean` | g_settings_range_check | 2.28 | Checks if the given @value is of the correct type and within the permitted range for @key. |
| reset | `Settings.reset(key: utf8) -> none` | g_settings_reset |  | Resets @key to its default value. This call resets the key, as much as possible, to its default value. That might be the value specified in the sch... |
| revert | `Settings.revert() -> none` | g_settings_revert |  | Reverts all non-applied changes to the settings. This function does nothing unless @settings is in 'delay-apply' mode; see g_settings_delay(). In t... |
| set | `Settings.set(key: utf8, format: utf8, ...: void) -> gboolean` | g_settings_set | 2.26 | Sets @key in @settings to @value. A convenience function that combines g_settings_set_value() with g_variant_new(). It is a programmer error to giv... |
| set_boolean | `Settings.set_boolean(key: utf8, value: gboolean) -> gboolean` | g_settings_set_boolean | 2.26 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for booleans. It is a programmer error to give a @key that isn't specif... |
| set_double | `Settings.set_double(key: utf8, value: gdouble) -> gboolean` | g_settings_set_double | 2.26 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for doubles. It is a programmer error to give a @key that isn't specifi... |
| set_enum | `Settings.set_enum(key: utf8, value: gint) -> gboolean` | g_settings_set_enum |  | Looks up the enumerated type nick for @value and writes it to @key, within @settings. It is a programmer error to give a @key that isn't contained ... |
| set_flags | `Settings.set_flags(key: utf8, value: guint) -> gboolean` | g_settings_set_flags |  | Looks up the flags type nicks for the bits specified by @value, puts them in an array of strings and writes the array to @key, within @settings. It... |
| set_int | `Settings.set_int(key: utf8, value: gint) -> gboolean` | g_settings_set_int | 2.26 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for 32-bit integers. It is a programmer error to give a @key that isn't... |
| set_int64 | `Settings.set_int64(key: utf8, value: gint64) -> gboolean` | g_settings_set_int64 | 2.50 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for 64-bit integers. It is a programmer error to give a @key that isn't... |
| set_string | `Settings.set_string(key: utf8, value: utf8) -> gboolean` | g_settings_set_string | 2.26 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for strings. It is a programmer error to give a @key that isn't specifi... |
| set_strv | `Settings.set_strv(key: utf8, value: utf8?) -> gboolean` | g_settings_set_strv | 2.26 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for string arrays. If @value is %NULL, then @key is set to be the empty... |
| set_uint | `Settings.set_uint(key: utf8, value: guint) -> gboolean` | g_settings_set_uint | 2.30 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for 32-bit unsigned integers. It is a programmer error to give a @key t... |
| set_uint64 | `Settings.set_uint64(key: utf8, value: guint64) -> gboolean` | g_settings_set_uint64 | 2.50 | Sets @key in @settings to @value. A convenience variant of g_settings_set() for 64-bit unsigned integers. It is a programmer error to give a @key t... |
| set_value | `Settings.set_value(key: utf8, value: GLib.Variant) -> gboolean` | g_settings_set_value | 2.26 | Sets @key in @settings to @value. It is a programmer error to give a @key that isn't contained in the schema for @settings or for @value to have th... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| backend | SettingsBackend | read, write, construct-only | The name of the context that the settings are stored in. |
| delay-apply | gboolean | read | Whether the #GSettings object is in 'delay-apply' mode. See g_settings_delay() for details. |
| has-unapplied | gboolean | read | If this property is %TRUE, the #GSettings object has outstanding changes that will be applied when g_settings_apply() is called. |
| path | utf8 | read, write, construct-only | The path within the backend where the settings are stored. |
| schema | utf8 | read, write, construct-only | The name of the schema that describes the types of keys for this #GSettings object. The type of this property is *not* #GSettingsSchema. #GSettings... |
| schema-id | utf8 | read, write, construct-only | The name of the schema that describes the types of keys for this #GSettings object. |
| settings-schema | SettingsSchema | read, write, construct-only | The #GSettingsSchema describing the types of keys for this #GSettings object. Ideally, this property would be called 'schema'. #GSettingsSchema has... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| change-event | `keys: GLib.Quark?, n_keys: gint` | gboolean | last |  | The "change-event" signal is emitted once per change event that affects this settings object. You should connect to this signal only if you are int... |
| changed | `key: utf8` | none | last detailed |  | The "changed" signal is emitted when a key has potentially changed. You should call one of the g_settings_get() calls to check the new value. This ... |
| writable-change-event | `key: guint` | gboolean | last |  | The "writable-change-event" signal is emitted once per writability change event that affects this settings object. You should connect to this signa... |
| writable-changed | `key: utf8` | none | last detailed |  | The "writable-changed" signal is emitted when the writability of a key has potentially changed. You should call g_settings_is_writable() in order t... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| change_event | `change_event(keys: GLib.Quark, n_keys: gint) -> gboolean` |  |  |  |
| changed | `changed(key: utf8) -> none` |  |  |  |
| writable_change_event | `writable_change_event(key: GLib.Quark) -> gboolean` |  |  |  |
| writable_changed | `writable_changed(key: utf8) -> none` |  |  |  |

### Gio.SettingsBackend

Parent: `GObject.Object` ?? GType: `GSettingsBackend` ?? C type: `GSettingsBackend` ?? Abstract

The `GSettingsBackend` interface defines a generic interface for non-strictly-typed data that is stored in a hierarchy. To implement an alternative...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SettingsBackendPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| flatten_tree | `flatten_tree(tree: GLib.Tree, path: out utf8, keys: out utf8, values: out GLib.Variant?) -> none` | g_settings_backend_flatten_tree | 2.26 | Calculate the longest common prefix of all keys in a tree and write out an array of the key names relative to that prefix and, optionally, the valu... |
| get_default | `get_default() -> SettingsBackend` | g_settings_backend_get_default | 2.28 | Returns the default #GSettingsBackend. It is possible to override the default by setting the `GSETTINGS_BACKEND` environment variable to the name o... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `SettingsBackend.changed(key: utf8, origin_tag: gpointer?) -> none` | g_settings_backend_changed | 2.26 | Signals that a single key has possibly changed. Backend implementations should call this if a key has possibly changed its value. @key must be a va... |
| changed_tree | `SettingsBackend.changed_tree(tree: GLib.Tree, origin_tag: gpointer?) -> none` | g_settings_backend_changed_tree | 2.26 | This call is a convenience wrapper. It gets the list of changes from @tree, computes the longest common prefix and calls g_settings_backend_changed(). |
| keys_changed | `SettingsBackend.keys_changed(path: utf8, items: utf8, origin_tag: gpointer?) -> none` | g_settings_backend_keys_changed | 2.26 | Signals that a list of keys have possibly changed. Backend implementations should call this if keys have possibly changed their values. @path must ... |
| path_changed | `SettingsBackend.path_changed(path: utf8, origin_tag: gpointer?) -> none` | g_settings_backend_path_changed | 2.26 | Signals that all keys below a given path may have possibly changed. Backend implementations should call this if an entire path of keys have possibl... |
| path_writable_changed | `SettingsBackend.path_writable_changed(path: utf8) -> none` | g_settings_backend_path_writable_changed | 2.26 | Signals that the writability of all keys below a given path may have changed. Since GSettings performs no locking operations for itself, this call ... |
| writable_changed | `SettingsBackend.writable_changed(key: utf8) -> none` | g_settings_backend_writable_changed | 2.26 | Signals that the writability of a single key has possibly changed. Since GSettings performs no locking operations for itself, this call will always... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_permission | `get_permission(path: utf8) -> Permission` |  |  | virtual method to get permission of a key |
| get_writable | `get_writable(key: utf8) -> gboolean` |  |  | virtual method to get if a key is writable |
| read | `read(key: utf8, expected_type: GLib.VariantType, default_value: gboolean) -> GLib.Variant` |  |  | virtual method to read a key's value |
| read_user_value | `read_user_value(key: utf8, expected_type: GLib.VariantType) -> GLib.Variant` |  |  | virtual method to read user's key value |
| reset | `reset(key: utf8, origin_tag: gpointer?) -> none` |  |  | virtual method to reset state |
| subscribe | `subscribe(name: utf8) -> none` |  |  | virtual method to subscribe to key changes |
| sync | `sync() -> none` |  |  | virtual method to sync state |
| unsubscribe | `unsubscribe(name: utf8) -> none` |  |  | virtual method to unsubscribe to key changes |
| write | `write(key: utf8, value: GLib.Variant, origin_tag: gpointer?) -> gboolean` |  |  | virtual method to change key's value |
| write_tree | `write_tree(tree: GLib.Tree, origin_tag: gpointer?) -> gboolean` |  |  | virtual method to change a tree of keys |

### Gio.SimpleAction

Parent: `GObject.Object` ?? Implements: `Action` ?? GType: `GSimpleAction` ?? C type: `GSimpleAction`

A `GSimpleAction` is the obvious simple implementation of the [iface@Gio.Action] interface. This is the easiest way to create an action for purpose...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SimpleAction.new(name: utf8, parameter_type: GLib.VariantType?) -> SimpleAction` | g_simple_action_new | 2.28 | Creates a new action. The created action is stateless. See g_simple_action_new_stateful() to create an action that has state. |
| new_stateful | `SimpleAction.new_stateful(name: utf8, parameter_type: GLib.VariantType?, state: GLib.Variant) -> SimpleAction` | g_simple_action_new_stateful | 2.28 | Creates a new stateful action. All future state values must have the same #GVariantType as the initial @state. If the @state #GVariant is floating,... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_enabled | `SimpleAction.set_enabled(enabled: gboolean) -> none` | g_simple_action_set_enabled | 2.28 | Sets the action as enabled or not. An action must be enabled in order to be activated or in order to have its state changed from outside callers. T... |
| set_state | `SimpleAction.set_state(value: GLib.Variant) -> none` | g_simple_action_set_state | 2.30 | Sets the state of the action. This directly updates the 'state' property to the given value. This should only be called by the implementor of the a... |
| set_state_hint | `SimpleAction.set_state_hint(state_hint: GLib.Variant?) -> none` | g_simple_action_set_state_hint | 2.44 | Sets the state hint for the action. See g_action_get_state_hint() for more information about action state hints. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enabled | gboolean | read, write | If @action is currently enabled. If the action is disabled then calls to g_action_activate() and g_action_change_state() have no effect. |
| name | utf8 | read, write, construct-only | The name of the action. This is mostly meaningful for identifying the action once it has been added to a #GSimpleActionGroup. |
| parameter-type | GLib.VariantType | read, write, construct-only | The type of the parameter that must be given when activating the action. |
| state | GLib.Variant | read, write | The state of the action, or %NULL if the action is stateless. |
| state-type | GLib.VariantType | read | The #GVariantType of the state that the action has, or %NULL if the action is stateless. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| activate | `parameter: GLib.Variant?` | none | last | 2.28 | Indicates that the action was just activated. @parameter will always be of the expected type, i.e. the parameter type specified when the action was... |
| change-state | `value: GLib.Variant?` | none | last | 2.30 | Indicates that the action just received a request to change its state. @value will always be of the correct state type, i.e. the type of the initia... |

### Gio.SimpleActionGroup

Parent: `GObject.Object` ?? Implements: `ActionGroup`, `ActionMap` ?? GType: `GSimpleActionGroup` ?? C type: `GSimpleActionGroup`

`GSimpleActionGroup` is a hash table filled with [iface@Gio.Action] objects, implementing the [iface@Gio.ActionGroup] and [iface@Gio.ActionMap] int...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SimpleActionGroupPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SimpleActionGroup.new() -> SimpleActionGroup` | g_simple_action_group_new | 2.28 | Creates a new, empty, #GSimpleActionGroup. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_entries | `SimpleActionGroup.add_entries(entries: ActionEntry, n_entries: gint, user_data: gpointer?) -> none` | g_simple_action_group_add_entries | 2.30 | A convenience function for creating multiple #GSimpleAction instances and adding them to the action group. |
| insert | `SimpleActionGroup.insert(action: Action) -> none` | g_simple_action_group_insert | 2.28 | Adds an action to the action group. If the action group already contains an action with the same name as @action then the old action is dropped fro... |
| lookup | `SimpleActionGroup.lookup(action_name: utf8) -> Action` | g_simple_action_group_lookup | 2.28 | Looks up the action with the name @action_name in the group. If no such action exists, returns %NULL. |
| remove | `SimpleActionGroup.remove(action_name: utf8) -> none` | g_simple_action_group_remove | 2.28 | Removes the named action from the action group. If no action of this name is in the group then nothing happens. |

### Gio.SimpleAsyncResult

Parent: `GObject.Object` ?? Implements: `AsyncResult` ?? GType: `GSimpleAsyncResult` ?? C type: `GSimpleAsyncResult`

As of GLib 2.46, `GSimpleAsyncResult` is deprecated in favor of [class@Gio.Task], which provides a simpler API. `GSimpleAsyncResult` implements [if...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SimpleAsyncResult.new(source_object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, source_tag: gpointer?) -> SimpleAsyncResult` | g_simple_async_result_new |  | Creates a #GSimpleAsyncResult. The common convention is to create the #GSimpleAsyncResult in the function that starts the asynchronous operation an... |
| new_error | `SimpleAsyncResult.new_error(source_object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, domain: GLib.Quark, code: gint, format: utf8, ...: void) -> SimpleAsyncResult` | g_simple_async_result_new_error |  | Creates a new #GSimpleAsyncResult with a set error. |
| new_from_error | `SimpleAsyncResult.new_from_error(source_object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, error: GLib.Error) -> SimpleAsyncResult` | g_simple_async_result_new_from_error |  | Creates a #GSimpleAsyncResult from an error condition. |
| new_take_error | `SimpleAsyncResult.new_take_error(source_object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, error: GLib.Error) -> SimpleAsyncResult` | g_simple_async_result_new_take_error | 2.28 | Creates a #GSimpleAsyncResult from an error condition, and takes over the caller's ownership of @error, so the caller does not need to free it anym... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_valid | `is_valid(result: AsyncResult, source: GObject.Object?, source_tag: gpointer?) -> gboolean` | g_simple_async_result_is_valid | 2.20 | Ensures that the data passed to the _finish function of an async operation is consistent. Three checks are performed. First, @result is checked to ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| complete | `SimpleAsyncResult.complete() -> none` | g_simple_async_result_complete |  | Completes an asynchronous I/O job immediately. Must be called in the thread where the asynchronous result was to be delivered, as it invokes the ca... |
| complete_in_idle | `SimpleAsyncResult.complete_in_idle() -> none` | g_simple_async_result_complete_in_idle |  | Completes an asynchronous function in an idle handler in the [thread-default main context][g-main-context-push-thread-default] of the thread that @... |
| get_op_res_gboolean | `SimpleAsyncResult.get_op_res_gboolean() -> gboolean` | g_simple_async_result_get_op_res_gboolean |  | Gets the operation result boolean from within the asynchronous result. |
| get_op_res_gpointer | `SimpleAsyncResult.get_op_res_gpointer() -> gpointer` | g_simple_async_result_get_op_res_gpointer |  | Gets a pointer result as returned by the asynchronous function. |
| get_op_res_gssize | `SimpleAsyncResult.get_op_res_gssize() -> gssize` | g_simple_async_result_get_op_res_gssize |  | Gets a gssize from the asynchronous result. |
| get_source_tag | `SimpleAsyncResult.get_source_tag() -> gpointer` | g_simple_async_result_get_source_tag |  | Gets the source tag for the #GSimpleAsyncResult. |
| propagate_error | `SimpleAsyncResult.propagate_error() -> gboolean throws` | g_simple_async_result_propagate_error |  | Propagates an error from within the simple asynchronous result to a given destination. If the #GCancellable given to a prior call to g_simple_async... |
| run_in_thread | `SimpleAsyncResult.run_in_thread(func: SimpleAsyncThreadFunc, io_priority: gint, cancellable: Cancellable?) -> none` | g_simple_async_result_run_in_thread |  | Runs the asynchronous job in a separate thread and then calls g_simple_async_result_complete_in_idle() on @simple to return the result to the appro... |
| set_check_cancellable | `SimpleAsyncResult.set_check_cancellable(check_cancellable: Cancellable?) -> none` | g_simple_async_result_set_check_cancellable | 2.32 | Sets a #GCancellable to check before dispatching results. This function has one very specific purpose: the provided cancellable is checked at the t... |
| set_error | `SimpleAsyncResult.set_error(domain: GLib.Quark, code: gint, format: utf8, ...: void) -> none` | g_simple_async_result_set_error |  | Sets an error within the asynchronous result without a #GError. |
| set_error_va | `SimpleAsyncResult.set_error_va(domain: GLib.Quark, code: gint, format: utf8, args: va_list) -> none` | g_simple_async_result_set_error_va |  | Sets an error within the asynchronous result without a #GError. Unless writing a binding, see g_simple_async_result_set_error(). |
| set_from_error | `SimpleAsyncResult.set_from_error(error: GLib.Error) -> none` | g_simple_async_result_set_from_error |  | Sets the result from a #GError. |
| set_handle_cancellation | `SimpleAsyncResult.set_handle_cancellation(handle_cancellation: gboolean) -> none` | g_simple_async_result_set_handle_cancellation |  | Sets whether to handle cancellation within the asynchronous operation. This function has nothing to do with g_simple_async_result_set_check_cancell... |
| set_op_res_gboolean | `SimpleAsyncResult.set_op_res_gboolean(op_res: gboolean) -> none` | g_simple_async_result_set_op_res_gboolean |  | Sets the operation result to a boolean within the asynchronous result. |
| set_op_res_gpointer | `SimpleAsyncResult.set_op_res_gpointer(op_res: gpointer?, destroy_op_res: GLib.DestroyNotify) -> none` | g_simple_async_result_set_op_res_gpointer |  | Sets the operation result within the asynchronous result to a pointer. |
| set_op_res_gssize | `SimpleAsyncResult.set_op_res_gssize(op_res: gssize) -> none` | g_simple_async_result_set_op_res_gssize |  | Sets the operation result within the asynchronous result to the given @op_res. |
| take_error | `SimpleAsyncResult.take_error(error: GLib.Error) -> none` | g_simple_async_result_take_error | 2.28 | Sets the result from @error, and takes over the caller's ownership of @error, so the caller does not need to free it any more. |

### Gio.SimpleIOStream

Parent: `IOStream` ?? GType: `GSimpleIOStream` ?? C type: `GSimpleIOStream`

`GSimpleIOStream` creates a [class@Gio.IOStream] from an arbitrary [class@Gio.InputStream] and [class@Gio.OutputStream]. This allows any pair of in...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SimpleIOStream.new(input_stream: InputStream, output_stream: OutputStream) -> IOStream` | g_simple_io_stream_new | 2.44 | Creates a new #GSimpleIOStream wrapping @input_stream and @output_stream. See also #GIOStream. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| input-stream | InputStream | read, write, construct-only | The [class@Gio.InputStream] to read from. |
| output-stream | OutputStream | read, write, construct-only | The [class@Gio.OutputStream] to write to. |

### Gio.SimplePermission

Parent: `Permission` ?? GType: `GSimplePermission` ?? C type: `GSimplePermission`

`GSimplePermission` is a trivial implementation of [class@Gio.Permission] that represents a permission that is either always or never allowed. The ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SimplePermission.new(allowed: gboolean) -> Permission` | g_simple_permission_new | 2.26 | Creates a new #GPermission instance that represents an action that is either always or never allowed. |

### Gio.SimpleProxyResolver

Parent: `GObject.Object` ?? Implements: `ProxyResolver` ?? GType: `GSimpleProxyResolver` ?? C type: `GSimpleProxyResolver`

`GSimpleProxyResolver` is a simple [iface@Gio.ProxyResolver] implementation that handles a single default proxy, multiple URI-scheme-specific proxi...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SimpleProxyResolverPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(default_proxy: utf8?, ignore_hosts: utf8?) -> ProxyResolver` | g_simple_proxy_resolver_new | 2.36 | Creates a new #GSimpleProxyResolver. See #GSimpleProxyResolver:default-proxy and #GSimpleProxyResolver:ignore-hosts for more details on how the arg... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_default_proxy | `SimpleProxyResolver.set_default_proxy(default_proxy: utf8?) -> none` | g_simple_proxy_resolver_set_default_proxy | 2.36 | Sets the default proxy on @resolver, to be used for any URIs that don't match #GSimpleProxyResolver:ignore-hosts or a proxy set via g_simple_proxy_... |
| set_ignore_hosts | `SimpleProxyResolver.set_ignore_hosts(ignore_hosts: utf8) -> none` | g_simple_proxy_resolver_set_ignore_hosts | 2.36 | Sets the list of ignored hosts. See #GSimpleProxyResolver:ignore-hosts for more details on how the @ignore_hosts argument is interpreted. |
| set_uri_proxy | `SimpleProxyResolver.set_uri_proxy(uri_scheme: utf8, proxy: utf8) -> none` | g_simple_proxy_resolver_set_uri_proxy | 2.36 | Adds a URI-scheme-specific proxy to @resolver; URIs whose scheme matches @uri_scheme (and which don't match #GSimpleProxyResolver:ignore-hosts) wil... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| default-proxy | utf8 | read, write | The default proxy URI that will be used for any URI that doesn't match #GSimpleProxyResolver:ignore-hosts, and doesn't match any of the schemes set... |
| ignore-hosts | utf8 | read, write | A list of hostnames and IP addresses that the resolver should allow direct connections to. Entries can be in one of 4 formats: - A hostname, such a... |

### Gio.Socket

Parent: `GObject.Object` ?? Implements: `DatagramBased`, `Initable` ?? GType: `GSocket` ?? C type: `GSocket`

A `GSocket` is a low-level networking primitive. It is a more or less direct mapping of the BSD socket API in a portable GObject based API. It supp...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SocketPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Socket.new(family: SocketFamily, type: SocketType, protocol: SocketProtocol) -> Socket throws` | g_socket_new | 2.22 | Creates a new #GSocket with the defined family, type and protocol. If @protocol is 0 (%G_SOCKET_PROTOCOL_DEFAULT) the default protocol type for the... |
| new_from_fd | `Socket.new_from_fd(fd: gint) -> Socket throws` | g_socket_new_from_fd | 2.22 | Creates a new #GSocket from a native file descriptor or winsock SOCKET handle. This reads all the settings from the file descriptor so that all pro... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept | `Socket.accept(cancellable: Cancellable?) -> Socket throws` | g_socket_accept | 2.22 | Accept incoming connections on a connection-based socket. This removes the first outstanding connection request from the listening socket and creat... |
| bind | `Socket.bind(address: SocketAddress, allow_reuse: gboolean) -> gboolean throws` | g_socket_bind | 2.22 | When a socket is created it is attached to an address family, but it doesn't have an address in this family. g_socket_bind() assigns the address (s... |
| check_connect_result | `Socket.check_connect_result() -> gboolean throws` | g_socket_check_connect_result | 2.22 | Checks and resets the pending connect error for the socket. This is used to check for errors when g_socket_connect() is used in non-blocking mode. |
| close | `Socket.close() -> gboolean throws` | g_socket_close | 2.22 | Closes the socket, shutting down any active connection. Closing a socket does not wait for all outstanding I/O operations to finish, so the caller ... |
| condition_check | `Socket.condition_check(condition: GLib.IOCondition) -> GLib.IOCondition` | g_socket_condition_check | 2.22 | Checks on the readiness of @socket to perform operations. The operations specified in @condition are checked for and masked against the currently-s... |
| condition_timed_wait | `Socket.condition_timed_wait(condition: GLib.IOCondition, timeout_us: gint64, cancellable: Cancellable?) -> gboolean throws` | g_socket_condition_timed_wait | 2.32 | Waits for up to @timeout_us microseconds for @condition to become true on @socket. If the condition is met, %TRUE is returned. If @cancellable is c... |
| condition_wait | `Socket.condition_wait(condition: GLib.IOCondition, cancellable: Cancellable?) -> gboolean throws` | g_socket_condition_wait | 2.22 | Waits for @condition to become true on @socket. When the condition is met, %TRUE is returned. If @cancellable is cancelled before the condition is ... |
| connect | `Socket.connect(address: SocketAddress, cancellable: Cancellable?) -> gboolean throws` | g_socket_connect | 2.22 | Connect the socket to the specified remote address. For connection oriented socket this generally means we attempt to make a connection to the @add... |
| connection_factory_create_connection | `Socket.connection_factory_create_connection() -> SocketConnection` | g_socket_connection_factory_create_connection | 2.22 | Creates a #GSocketConnection subclass of the right type for @socket. |
| create_source | `Socket.create_source(condition: GLib.IOCondition, cancellable: Cancellable?) -> GLib.Source` | g_socket_create_source | 2.22 | Creates a #GSource that can be attached to a %GMainContext to monitor for the availability of the specified @condition on the socket. The #GSource ... |
| get_available_bytes | `Socket.get_available_bytes() -> gssize` | g_socket_get_available_bytes | 2.32 | Get the amount of data pending in the OS input buffer, without blocking. If @socket is a UDP or SCTP socket, this will return the size of just the ... |
| get_blocking | `Socket.get_blocking() -> gboolean` | g_socket_get_blocking | 2.22 | Gets the blocking mode of the socket. For details on blocking I/O, see g_socket_set_blocking(). |
| get_broadcast | `Socket.get_broadcast() -> gboolean` | g_socket_get_broadcast | 2.32 | Gets the broadcast setting on @socket; if %TRUE, it is possible to send packets to broadcast addresses. |
| get_credentials | `Socket.get_credentials() -> Credentials throws` | g_socket_get_credentials | 2.26 | Returns the credentials of the foreign process connected to this socket, if any (e.g. it is only supported for %G_SOCKET_FAMILY_UNIX sockets). If t... |
| get_family | `Socket.get_family() -> SocketFamily` | g_socket_get_family | 2.22 | Gets the socket family of the socket. |
| get_fd | `Socket.get_fd() -> gint` | g_socket_get_fd | 2.22 | Returns the underlying OS socket object. On unix this is a socket file descriptor, and on Windows this is a Winsock2 SOCKET handle. This may be use... |
| get_keepalive | `Socket.get_keepalive() -> gboolean` | g_socket_get_keepalive | 2.22 | Gets the keepalive mode of the socket. For details on this, see g_socket_set_keepalive(). |
| get_listen_backlog | `Socket.get_listen_backlog() -> gint` | g_socket_get_listen_backlog | 2.22 | Gets the listen backlog setting of the socket. For details on this, see g_socket_set_listen_backlog(). |
| get_local_address | `Socket.get_local_address() -> SocketAddress throws` | g_socket_get_local_address | 2.22 | Try to get the local address of a bound socket. This is only useful if the socket has been bound to a local address, either explicitly or implicitl... |
| get_multicast_loopback | `Socket.get_multicast_loopback() -> gboolean` | g_socket_get_multicast_loopback | 2.32 | Gets the multicast loopback setting on @socket; if %TRUE (the default), outgoing multicast packets will be looped back to multicast listeners on th... |
| get_multicast_ttl | `Socket.get_multicast_ttl() -> guint` | g_socket_get_multicast_ttl | 2.32 | Gets the multicast time-to-live setting on @socket; see g_socket_set_multicast_ttl() for more details. |
| get_option | `Socket.get_option(level: gint, optname: gint, value: out gint) -> gboolean throws` | g_socket_get_option | 2.36 | Gets the value of an integer-valued option on @socket, as with getsockopt(). (If you need to fetch a non-integer-valued option, you will need to ca... |
| get_protocol | `Socket.get_protocol() -> SocketProtocol` | g_socket_get_protocol | 2.22 | Gets the socket protocol id the socket was created with. In case the protocol is unknown, -1 is returned. |
| get_remote_address | `Socket.get_remote_address() -> SocketAddress throws` | g_socket_get_remote_address | 2.22 | Try to get the remote address of a connected socket. This is only useful for connection oriented sockets that have been connected. |
| get_socket_type | `Socket.get_socket_type() -> SocketType` | g_socket_get_socket_type | 2.22 | Gets the socket type of the socket. |
| get_timeout | `Socket.get_timeout() -> guint` | g_socket_get_timeout | 2.26 | Gets the timeout setting of the socket. For details on this, see g_socket_set_timeout(). |
| get_ttl | `Socket.get_ttl() -> guint` | g_socket_get_ttl | 2.32 | Gets the unicast time-to-live setting on @socket; see g_socket_set_ttl() for more details. |
| is_closed | `Socket.is_closed() -> gboolean` | g_socket_is_closed | 2.22 | Checks whether a socket is closed. |
| is_connected | `Socket.is_connected() -> gboolean` | g_socket_is_connected | 2.22 | Check whether the socket is connected. This is only useful for connection-oriented sockets. If using g_socket_shutdown(), this function will return... |
| join_multicast_group | `Socket.join_multicast_group(group: InetAddress, source_specific: gboolean, iface: utf8?) -> gboolean throws` | g_socket_join_multicast_group | 2.32 | Registers @socket to receive multicast messages sent to @group. @socket must be a %G_SOCKET_TYPE_DATAGRAM socket, and must have been bound to an ap... |
| join_multicast_group_ssm | `Socket.join_multicast_group_ssm(group: InetAddress, source_specific: InetAddress?, iface: utf8?) -> gboolean throws` | g_socket_join_multicast_group_ssm | 2.56 | Registers @socket to receive multicast messages sent to @group. @socket must be a %G_SOCKET_TYPE_DATAGRAM socket, and must have been bound to an ap... |
| leave_multicast_group | `Socket.leave_multicast_group(group: InetAddress, source_specific: gboolean, iface: utf8?) -> gboolean throws` | g_socket_leave_multicast_group | 2.32 | Removes @socket from the multicast group defined by @group, @iface, and @source_specific (which must all have the same values they had when you joi... |
| leave_multicast_group_ssm | `Socket.leave_multicast_group_ssm(group: InetAddress, source_specific: InetAddress?, iface: utf8?) -> gboolean throws` | g_socket_leave_multicast_group_ssm | 2.56 | Removes @socket from the multicast group defined by @group, @iface, and @source_specific (which must all have the same values they had when you joi... |
| listen | `Socket.listen() -> gboolean throws` | g_socket_listen | 2.22 | Marks the socket as a server socket, i.e. a socket that is used to accept incoming requests using g_socket_accept(). Before calling this the socket... |
| receive | `Socket.receive(buffer: out guint8, size: gsize, cancellable: Cancellable?) -> gssize throws` | g_socket_receive | 2.22 | Receive data (up to @size bytes) from a socket. This is mainly used by connection-oriented sockets; it is identical to g_socket_receive_from() with... |
| receive_bytes | `Socket.receive_bytes(size: gsize, timeout_us: gint64, cancellable: Cancellable?) -> GLib.Bytes throws` | g_socket_receive_bytes | 2.80 | Receives data (up to @size bytes) from a socket. This function is a variant of [method@Gio.Socket.receive] which returns a [struct@GLib.Bytes] rath... |
| receive_bytes_from | `Socket.receive_bytes_from(address: out SocketAddress?, size: gsize, timeout_us: gint64, cancellable: Cancellable?) -> GLib.Bytes throws` | g_socket_receive_bytes_from | 2.80 | Receive data (up to @size bytes) from a socket. This function is a variant of [method@Gio.Socket.receive_from] which returns a [struct@GLib.Bytes] ... |
| receive_from | `Socket.receive_from(address: out SocketAddress?, buffer: out guint8, size: gsize, cancellable: Cancellable?) -> gssize throws` | g_socket_receive_from | 2.22 | Receive data (up to @size bytes) from a socket. If @address is non-%NULL then @address will be set equal to the source address of the received pack... |
| receive_message | `Socket.receive_message(address: out SocketAddress?, vectors: InputVector, num_vectors: gint, messages: out SocketControlMessage?, num_messages: out gint, flags: inout gint, cancellable: Cancellable?) -> gssize throws` | g_socket_receive_message | 2.22 | Receive data from a socket. For receiving multiple messages, see g_socket_receive_messages(); for easier use, see g_socket_receive() and g_socket_r... |
| receive_messages | `Socket.receive_messages(messages: InputMessage, num_messages: guint, flags: gint, cancellable: Cancellable?) -> gint throws` | g_socket_receive_messages | 2.48 | Receive multiple data messages from @socket in one go. This is the most complicated and fully-featured version of this call. For easier use, see g_... |
| receive_with_blocking | `Socket.receive_with_blocking(buffer: out guint8, size: gsize, blocking: gboolean, cancellable: Cancellable?) -> gssize throws` | g_socket_receive_with_blocking | 2.26 | This behaves exactly the same as g_socket_receive(), except that the choice of blocking or non-blocking behavior is determined by the @blocking arg... |
| send | `Socket.send(buffer: guint8, size: gsize, cancellable: Cancellable?) -> gssize throws` | g_socket_send | 2.22 | Tries to send @size bytes from @buffer on the socket. This is mainly used by connection-oriented sockets; it is identical to g_socket_send_to() wit... |
| send_message | `Socket.send_message(address: SocketAddress?, vectors: OutputVector, num_vectors: gint, messages: SocketControlMessage?, num_messages: gint, flags: gint, cancellable: Cancellable?) -> gssize throws` | g_socket_send_message | 2.22 | Send data to @address on @socket. For sending multiple messages see g_socket_send_messages(); for easier use, see g_socket_send() and g_socket_send... |
| send_message_with_timeout | `Socket.send_message_with_timeout(address: SocketAddress?, vectors: OutputVector, num_vectors: gint, messages: SocketControlMessage?, num_messages: gint, flags: gint, timeout_us: gint64, bytes_written: out gsize?, cancellable: Cancellable?) -> PollableReturn throws` | g_socket_send_message_with_timeout | 2.60 | This behaves exactly the same as g_socket_send_message(), except that the choice of timeout behavior is determined by the @timeout_us argument rath... |
| send_messages | `Socket.send_messages(messages: OutputMessage, num_messages: guint, flags: gint, cancellable: Cancellable?) -> gint throws` | g_socket_send_messages | 2.44 | Send multiple data messages from @socket in one go. This is the most complicated and fully-featured version of this call. For easier use, see g_soc... |
| send_to | `Socket.send_to(address: SocketAddress?, buffer: guint8, size: gsize, cancellable: Cancellable?) -> gssize throws` | g_socket_send_to | 2.22 | Tries to send @size bytes from @buffer to @address. If @address is %NULL then the message is sent to the default receiver (set by g_socket_connect(... |
| send_with_blocking | `Socket.send_with_blocking(buffer: guint8, size: gsize, blocking: gboolean, cancellable: Cancellable?) -> gssize throws` | g_socket_send_with_blocking | 2.26 | This behaves exactly the same as g_socket_send(), except that the choice of blocking or non-blocking behavior is determined by the @blocking argume... |
| set_blocking | `Socket.set_blocking(blocking: gboolean) -> none` | g_socket_set_blocking | 2.22 | Sets the blocking mode of the socket. In blocking mode all operations (which don???t take an explicit blocking parameter) block until they succeed ... |
| set_broadcast | `Socket.set_broadcast(broadcast: gboolean) -> none` | g_socket_set_broadcast | 2.32 | Sets whether @socket should allow sending to broadcast addresses. This is %FALSE by default. |
| set_keepalive | `Socket.set_keepalive(keepalive: gboolean) -> none` | g_socket_set_keepalive | 2.22 | Sets or unsets the %SO_KEEPALIVE flag on the underlying socket. When this flag is set on a socket, the system will attempt to verify that the remot... |
| set_listen_backlog | `Socket.set_listen_backlog(backlog: gint) -> none` | g_socket_set_listen_backlog | 2.22 | Sets the maximum number of outstanding connections allowed when listening on this socket. If more clients than this are connecting to the socket an... |
| set_multicast_loopback | `Socket.set_multicast_loopback(loopback: gboolean) -> none` | g_socket_set_multicast_loopback | 2.32 | Sets whether outgoing multicast packets will be received by sockets listening on that multicast address on the same host. This is %TRUE by default. |
| set_multicast_ttl | `Socket.set_multicast_ttl(ttl: guint) -> none` | g_socket_set_multicast_ttl | 2.32 | Sets the time-to-live for outgoing multicast datagrams on @socket. By default, this is 1, meaning that multicast packets will not leave the local n... |
| set_option | `Socket.set_option(level: gint, optname: gint, value: gint) -> gboolean throws` | g_socket_set_option | 2.36 | Sets the value of an integer-valued option on @socket, as with setsockopt(). (If you need to set a non-integer-valued option, you will need to call... |
| set_timeout | `Socket.set_timeout(timeout: guint) -> none` | g_socket_set_timeout | 2.26 | Sets the time in seconds after which I/O operations on @socket will time out if they have not yet completed. On a blocking socket, this means that ... |
| set_ttl | `Socket.set_ttl(ttl: guint) -> none` | g_socket_set_ttl | 2.32 | Sets the time-to-live for outgoing unicast packets on @socket. By default the platform-specific default value is used. |
| shutdown | `Socket.shutdown(shutdown_read: gboolean, shutdown_write: gboolean) -> gboolean throws` | g_socket_shutdown | 2.22 | Shut down part or all of a full-duplex connection. If @shutdown_read is %TRUE then the receiving side of the connection is shut down, and further r... |
| speaks_ipv4 | `Socket.speaks_ipv4() -> gboolean` | g_socket_speaks_ipv4 | 2.22 | Checks if a socket is capable of speaking IPv4. IPv4 sockets are capable of speaking IPv4. On some operating systems and under some combinations of... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| blocking | gboolean | read, write | Whether I/O on this socket is blocking. |
| broadcast | gboolean | read, write | Whether the socket should allow sending to broadcast addresses. |
| family | SocketFamily | read, write, construct-only | The socket???s address family. |
| fd | gint | read, write, construct-only | The socket???s file descriptor. |
| keepalive | gboolean | read, write | Whether to keep the connection alive by sending periodic pings. |
| listen-backlog | gint | read, write | The number of outstanding connections in the listen queue. |
| local-address | SocketAddress | read | The local address the socket is bound to. |
| multicast-loopback | gboolean | read, write | Whether outgoing multicast packets loop back to the local host. |
| multicast-ttl | guint | read, write | Time-to-live out outgoing multicast packets |
| protocol | SocketProtocol | read, write, construct-only | The ID of the protocol to use, or `-1` for unknown. |
| remote-address | SocketAddress | read | The remote address the socket is connected to. |
| timeout | guint | read, write | The timeout in seconds on socket I/O |
| ttl | guint | read, write | Time-to-live for outgoing unicast packets |
| type | SocketType | read, write, construct-only | The socket???s type. |

### Gio.SocketAddress

Parent: `GObject.Object` ?? Subclasses: `InetSocketAddress`, `NativeSocketAddress`, `UnixSocketAddress` ?? Implements: `SocketConnectable` ?? GType: `GSocketAddress` ?? C type: `GSocketAddress` ?? Abstract

`GSocketAddress` is the equivalent of `struct sockaddr`) and its subtypes in the BSD sockets API. This is an abstract class; use [class@Gio.InetSoc...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_native | `SocketAddress.new_from_native(native: gpointer, len: gsize) -> SocketAddress` | g_socket_address_new_from_native | 2.22 | Creates a #GSocketAddress subclass corresponding to the native struct sockaddr @native. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_family | `SocketAddress.get_family() -> SocketFamily` | g_socket_address_get_family | 2.22 | Gets the socket family type of @address. |
| get_native_size | `SocketAddress.get_native_size() -> gssize` | g_socket_address_get_native_size | 2.22 | Gets the size of @address's native struct sockaddr. You can use this to allocate memory to pass to g_socket_address_to_native(). |
| to_native | `SocketAddress.to_native(dest: gpointer?, destlen: gsize) -> gboolean throws` | g_socket_address_to_native | 2.22 | Converts a #GSocketAddress to a native struct sockaddr, which can be passed to low-level functions like connect() or bind(). If not enough space is... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| family | SocketFamily | read | The family of the socket address. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_family | `get_family() -> SocketFamily` |  | 2.22 | Gets the socket family type of @address. |
| get_native_size | `get_native_size() -> gssize` |  | 2.22 | Gets the size of @address's native struct sockaddr. You can use this to allocate memory to pass to g_socket_address_to_native(). |
| to_native | `to_native(dest: gpointer?, destlen: gsize) -> gboolean throws` |  | 2.22 | Converts a #GSocketAddress to a native struct sockaddr, which can be passed to low-level functions like connect() or bind(). If not enough space is... |

### Gio.SocketAddressEnumerator

Parent: `GObject.Object` ?? Subclasses: `ProxyAddressEnumerator` ?? GType: `GSocketAddressEnumerator` ?? C type: `GSocketAddressEnumerator` ?? Abstract

`GSocketAddressEnumerator` is an enumerator type for [class@Gio.SocketAddress] instances. It is returned by enumeration functions such as [method@G...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| next | `SocketAddressEnumerator.next(cancellable: Cancellable?) -> SocketAddress throws` | g_socket_address_enumerator_next |  | Retrieves the next #GSocketAddress from @enumerator. Note that this may block for some amount of time. (Eg, a #GNetworkAddress may need to do a DNS... |
| next_async | `SocketAddressEnumerator.next_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_address_enumerator_next_async |  | Asynchronously retrieves the next #GSocketAddress from @enumerator and then calls @callback, which must call g_socket_address_enumerator_next_finis... |
| next_finish | `SocketAddressEnumerator.next_finish(result: AsyncResult) -> SocketAddress throws` | g_socket_address_enumerator_next_finish |  | Retrieves the result of a completed call to g_socket_address_enumerator_next_async(). See g_socket_address_enumerator_next() for more information a... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| next | `next(cancellable: Cancellable?) -> SocketAddress throws` |  |  | Retrieves the next #GSocketAddress from @enumerator. Note that this may block for some amount of time. (Eg, a #GNetworkAddress may need to do a DNS... |
| next_async | `next_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously retrieves the next #GSocketAddress from @enumerator and then calls @callback, which must call g_socket_address_enumerator_next_finis... |
| next_finish | `next_finish(result: AsyncResult) -> SocketAddress throws` |  |  | Retrieves the result of a completed call to g_socket_address_enumerator_next_async(). See g_socket_address_enumerator_next() for more information a... |

### Gio.SocketClient

Parent: `GObject.Object` ?? GType: `GSocketClient` ?? C type: `GSocketClient`

`GSocketClient` is a lightweight high-level utility class for connecting to a network host using a connection oriented socket type. You create a `G...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SocketClientPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SocketClient.new() -> SocketClient` | g_socket_client_new | 2.22 | Creates a new #GSocketClient with the default options. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_application_proxy | `SocketClient.add_application_proxy(protocol: utf8) -> none` | g_socket_client_add_application_proxy |  | Enable proxy protocols to be handled by the application. When the indicated proxy protocol is returned by the #GProxyResolver, #GSocketClient will ... |
| connect | `SocketClient.connect(connectable: SocketConnectable, cancellable: Cancellable?) -> SocketConnection throws` | g_socket_client_connect | 2.22 | Tries to resolve the @connectable and make a network connection to it. Upon a successful connection, a new #GSocketConnection is constructed and re... |
| connect_async | `SocketClient.connect_async(connectable: SocketConnectable, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_client_connect_async | 2.22 | This is the asynchronous version of g_socket_client_connect(). You may wish to prefer the asynchronous version even in synchronous command line pro... |
| connect_finish | `SocketClient.connect_finish(result: AsyncResult) -> SocketConnection throws` | g_socket_client_connect_finish | 2.22 | Finishes an async connect operation. See g_socket_client_connect_async() |
| connect_to_host | `SocketClient.connect_to_host(host_and_port: utf8, default_port: guint16, cancellable: Cancellable?) -> SocketConnection throws` | g_socket_client_connect_to_host | 2.22 | This is a helper function for g_socket_client_connect(). Attempts to create a TCP connection to the named host. @host_and_port may be in any of a n... |
| connect_to_host_async | `SocketClient.connect_to_host_async(host_and_port: utf8, default_port: guint16, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_client_connect_to_host_async | 2.22 | This is the asynchronous version of g_socket_client_connect_to_host(). When the operation is finished @callback will be called. You can then call g... |
| connect_to_host_finish | `SocketClient.connect_to_host_finish(result: AsyncResult) -> SocketConnection throws` | g_socket_client_connect_to_host_finish | 2.22 | Finishes an async connect operation. See g_socket_client_connect_to_host_async() |
| connect_to_service | `SocketClient.connect_to_service(domain: utf8, service: utf8, cancellable: Cancellable?) -> SocketConnection throws` | g_socket_client_connect_to_service |  | Attempts to create a TCP connection to a service. This call looks up the SRV record for @service at @domain for the "tcp" protocol. It then attempt... |
| connect_to_service_async | `SocketClient.connect_to_service_async(domain: utf8, service: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_client_connect_to_service_async | 2.22 | This is the asynchronous version of g_socket_client_connect_to_service(). |
| connect_to_service_finish | `SocketClient.connect_to_service_finish(result: AsyncResult) -> SocketConnection throws` | g_socket_client_connect_to_service_finish | 2.22 | Finishes an async connect operation. See g_socket_client_connect_to_service_async() |
| connect_to_uri | `SocketClient.connect_to_uri(uri: utf8, default_port: guint16, cancellable: Cancellable?) -> SocketConnection throws` | g_socket_client_connect_to_uri | 2.26 | This is a helper function for g_socket_client_connect(). Attempts to create a TCP connection with a network URI. @uri may be any valid URI containi... |
| connect_to_uri_async | `SocketClient.connect_to_uri_async(uri: utf8, default_port: guint16, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_client_connect_to_uri_async | 2.26 | This is the asynchronous version of g_socket_client_connect_to_uri(). When the operation is finished @callback will be called. You can then call g_... |
| connect_to_uri_finish | `SocketClient.connect_to_uri_finish(result: AsyncResult) -> SocketConnection throws` | g_socket_client_connect_to_uri_finish | 2.26 | Finishes an async connect operation. See g_socket_client_connect_to_uri_async() |
| get_enable_proxy | `SocketClient.get_enable_proxy() -> gboolean` | g_socket_client_get_enable_proxy | 2.26 | Gets the proxy enable state; see g_socket_client_set_enable_proxy() |
| get_family | `SocketClient.get_family() -> SocketFamily` | g_socket_client_get_family | 2.22 | Gets the socket family of the socket client. See g_socket_client_set_family() for details. |
| get_local_address | `SocketClient.get_local_address() -> SocketAddress` | g_socket_client_get_local_address | 2.22 | Gets the local address of the socket client. See g_socket_client_set_local_address() for details. |
| get_protocol | `SocketClient.get_protocol() -> SocketProtocol` | g_socket_client_get_protocol | 2.22 | Gets the protocol name type of the socket client. See g_socket_client_set_protocol() for details. |
| get_proxy_resolver | `SocketClient.get_proxy_resolver() -> ProxyResolver` | g_socket_client_get_proxy_resolver | 2.36 | Gets the #GProxyResolver being used by @client. Normally, this will be the resolver returned by g_proxy_resolver_get_default(), but you can overrid... |
| get_socket_type | `SocketClient.get_socket_type() -> SocketType` | g_socket_client_get_socket_type | 2.22 | Gets the socket type of the socket client. See g_socket_client_set_socket_type() for details. |
| get_timeout | `SocketClient.get_timeout() -> guint` | g_socket_client_get_timeout | 2.26 | Gets the I/O timeout time for sockets created by @client. See g_socket_client_set_timeout() for details. |
| get_tls | `SocketClient.get_tls() -> gboolean` | g_socket_client_get_tls | 2.28 | Gets whether @client creates TLS connections. See g_socket_client_set_tls() for details. |
| get_tls_validation_flags | `SocketClient.get_tls_validation_flags() -> TlsCertificateFlags` | g_socket_client_get_tls_validation_flags | 2.28 | Gets the TLS validation flags used creating TLS connections via @client. This function does not work as originally designed and is impossible to us... |
| set_enable_proxy | `SocketClient.set_enable_proxy(enable: gboolean) -> none` | g_socket_client_set_enable_proxy | 2.26 | Sets whether or not @client attempts to make connections via a proxy server. When enabled (the default), #GSocketClient will use a #GProxyResolver ... |
| set_family | `SocketClient.set_family(family: SocketFamily) -> none` | g_socket_client_set_family | 2.22 | Sets the socket family of the socket client. If this is set to something other than %G_SOCKET_FAMILY_INVALID then the sockets created by this objec... |
| set_local_address | `SocketClient.set_local_address(address: SocketAddress?) -> none` | g_socket_client_set_local_address | 2.22 | Sets the local address of the socket client. The sockets created by this object will bound to the specified address (if not %NULL) before connectin... |
| set_protocol | `SocketClient.set_protocol(protocol: SocketProtocol) -> none` | g_socket_client_set_protocol | 2.22 | Sets the protocol of the socket client. The sockets created by this object will use of the specified protocol. If @protocol is %G_SOCKET_PROTOCOL_D... |
| set_proxy_resolver | `SocketClient.set_proxy_resolver(proxy_resolver: ProxyResolver?) -> none` | g_socket_client_set_proxy_resolver | 2.36 | Overrides the #GProxyResolver used by @client. You can call this if you want to use specific proxies, rather than using the system default proxy se... |
| set_socket_type | `SocketClient.set_socket_type(type: SocketType) -> none` | g_socket_client_set_socket_type | 2.22 | Sets the socket type of the socket client. The sockets created by this object will be of the specified type. It doesn't make sense to specify a typ... |
| set_timeout | `SocketClient.set_timeout(timeout: guint) -> none` | g_socket_client_set_timeout | 2.26 | Sets the I/O timeout for sockets created by @client. @timeout is a time in seconds, or 0 for no timeout (the default). The timeout value affects th... |
| set_tls | `SocketClient.set_tls(tls: gboolean) -> none` | g_socket_client_set_tls | 2.28 | Sets whether @client creates TLS (aka SSL) connections. If @tls is %TRUE, @client will wrap its connections in a #GTlsClientConnection and perform ... |
| set_tls_validation_flags | `SocketClient.set_tls_validation_flags(flags: TlsCertificateFlags) -> none` | g_socket_client_set_tls_validation_flags | 2.28 | Sets the TLS validation flags used when creating TLS connections via @client. The default value is %G_TLS_CERTIFICATE_VALIDATE_ALL. This function d... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enable-proxy | gboolean | read, write | Enable proxy support. |
| family | SocketFamily | read, write | The address family to use for socket construction. |
| local-address | SocketAddress | read, write | The local address constructed sockets will be bound to. |
| protocol | SocketProtocol | read, write | The protocol to use for socket construction, or `0` for default. |
| proxy-resolver | ProxyResolver | read, write | The proxy resolver to use |
| timeout | guint | read, write | The I/O timeout for sockets, in seconds, or `0` for none. |
| tls | gboolean | read, write | Whether to create TLS connections. |
| tls-validation-flags | TlsCertificateFlags | read, write | The TLS validation flags used when creating TLS connections. The default value is %G_TLS_CERTIFICATE_VALIDATE_ALL. GLib guarantees that if certific... |
| type | SocketType | read, write | The type to use for socket construction. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| event | `event: SocketClientEvent, connectable: SocketConnectable, connection: IOStream?` | none | last | 2.32 | Emitted when @client's activity on @connectable changes state. Among other things, this can be used to provide progress information about a network... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| event | `event(event: SocketClientEvent, connectable: SocketConnectable, connection: IOStream) -> none` |  |  |  |

### Gio.SocketConnection

Parent: `IOStream` ?? Subclasses: `TcpConnection`, `UnixConnection` ?? GType: `GSocketConnection` ?? C type: `GSocketConnection`

`GSocketConnection` is a [class@Gio.IOStream] for a connected socket. They can be created either by [class@Gio.SocketClient] when connecting to a h...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | IOStream |
| priv | SocketConnectionPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| factory_lookup_type | `factory_lookup_type(family: SocketFamily, type: SocketType, protocol_id: gint) -> GType` | g_socket_connection_factory_lookup_type | 2.22 | Looks up the #GType to be used when creating socket connections on sockets with the specified @family, @type and @protocol_id. If no type is regist... |
| factory_register_type | `factory_register_type(g_type: GType, family: SocketFamily, type: SocketType, protocol: gint) -> none` | g_socket_connection_factory_register_type | 2.22 | Looks up the #GType to be used when creating socket connections on sockets with the specified @family, @type and @protocol. If no type is registere... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| connect | `SocketConnection.connect(address: SocketAddress, cancellable: Cancellable?) -> gboolean throws` | g_socket_connection_connect | 2.32 | Connect @connection to the specified remote address. |
| connect_async | `SocketConnection.connect_async(address: SocketAddress, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_connection_connect_async | 2.32 | Asynchronously connect @connection to the specified remote address. This clears the #GSocket:blocking flag on @connection's underlying socket if it... |
| connect_finish | `SocketConnection.connect_finish(result: AsyncResult) -> gboolean throws` | g_socket_connection_connect_finish | 2.32 | Gets the result of a g_socket_connection_connect_async() call. |
| get_local_address | `SocketConnection.get_local_address() -> SocketAddress throws` | g_socket_connection_get_local_address | 2.22 | Try to get the local address of a socket connection. |
| get_remote_address | `SocketConnection.get_remote_address() -> SocketAddress throws` | g_socket_connection_get_remote_address | 2.22 | Try to get the remote address of a socket connection. Since GLib 2.40, when used with g_socket_client_connect() or g_socket_client_connect_async(),... |
| get_socket | `SocketConnection.get_socket() -> Socket` | g_socket_connection_get_socket | 2.22 | Gets the underlying #GSocket object of the connection. This can be useful if you want to do something unusual on it not supported by the #GSocketCo... |
| is_connected | `SocketConnection.is_connected() -> gboolean` | g_socket_connection_is_connected | 2.32 | Checks if @connection is connected. This is equivalent to calling g_socket_is_connected() on @connection's underlying #GSocket. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| socket | Socket | read, write, construct-only | The underlying [class@Gio.Socket]. |

### Gio.SocketControlMessage

Parent: `GObject.Object` ?? Subclasses: `UnixCredentialsMessage`, `UnixFDMessage` ?? GType: `GSocketControlMessage` ?? C type: `GSocketControlMessage` ?? Abstract

A `GSocketControlMessage` is a special-purpose utility message that can be sent to or received from a [class@Gio.Socket]. These types of messages a...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SocketControlMessagePrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize | `deserialize(level: gint, type: gint, size: gsize, data: guint8) -> SocketControlMessage` | g_socket_control_message_deserialize | 2.22 | Tries to deserialize a socket control message of a given @level and @type. This will ask all known (to GType) subclasses of #GSocketControlMessage ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_level | `SocketControlMessage.get_level() -> gint` | g_socket_control_message_get_level | 2.22 | Returns the "level" (i.e. the originating protocol) of the control message. This is often SOL_SOCKET. |
| get_msg_type | `SocketControlMessage.get_msg_type() -> gint` | g_socket_control_message_get_msg_type | 2.22 | Returns the protocol specific type of the control message. For instance, for UNIX fd passing this would be SCM_RIGHTS. |
| get_size | `SocketControlMessage.get_size() -> gsize` | g_socket_control_message_get_size | 2.22 | Returns the space required for the control message, not including headers or alignment. |
| serialize | `SocketControlMessage.serialize(data: gpointer) -> none` | g_socket_control_message_serialize | 2.22 | Converts the data in the message to bytes placed in the message. @data is guaranteed to have enough space to fit the size returned by g_socket_cont... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_level | `get_level() -> gint` |  | 2.22 | Returns the "level" (i.e. the originating protocol) of the control message. This is often SOL_SOCKET. |
| get_size | `get_size() -> gsize` |  | 2.22 | Returns the space required for the control message, not including headers or alignment. |
| get_type | `get_type() -> gint` |  |  | gets the protocol specific type of the message. |
| serialize | `serialize(data: gpointer) -> none` |  | 2.22 | Converts the data in the message to bytes placed in the message. @data is guaranteed to have enough space to fit the size returned by g_socket_cont... |

### Gio.SocketListener

Parent: `GObject.Object` ?? Subclasses: `SocketService` ?? GType: `GSocketListener` ?? C type: `GSocketListener`

A `GSocketListener` is an object that keeps track of a set of server sockets and helps you accept sockets from any of the socket, either sync or as...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | SocketListenerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SocketListener.new() -> SocketListener` | g_socket_listener_new | 2.22 | Creates a new #GSocketListener with no sockets to listen for. New listeners can be added with e.g. g_socket_listener_add_address() or g_socket_list... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept | `SocketListener.accept(source_object: out GObject.Object?, cancellable: Cancellable?) -> SocketConnection throws` | g_socket_listener_accept | 2.22 | Blocks waiting for a client to connect to any of the sockets added to the listener. Returns a #GSocketConnection for the socket that was accepted. ... |
| accept_async | `SocketListener.accept_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_listener_accept_async | 2.22 | This is the asynchronous version of g_socket_listener_accept(). When the operation is finished @callback will be called. You can then call g_socket... |
| accept_finish | `SocketListener.accept_finish(result: AsyncResult, source_object: out GObject.Object?) -> SocketConnection throws` | g_socket_listener_accept_finish | 2.22 | Finishes an async accept operation. See g_socket_listener_accept_async() |
| accept_socket | `SocketListener.accept_socket(source_object: out GObject.Object?, cancellable: Cancellable?) -> Socket throws` | g_socket_listener_accept_socket | 2.22 | Blocks waiting for a client to connect to any of the sockets added to the listener. Returns the #GSocket that was accepted. If you want to accept t... |
| accept_socket_async | `SocketListener.accept_socket_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_socket_listener_accept_socket_async | 2.22 | This is the asynchronous version of g_socket_listener_accept_socket(). When the operation is finished @callback will be called. You can then call g... |
| accept_socket_finish | `SocketListener.accept_socket_finish(result: AsyncResult, source_object: out GObject.Object?) -> Socket throws` | g_socket_listener_accept_socket_finish | 2.22 | Finishes an async accept operation. See g_socket_listener_accept_socket_async() |
| add_address | `SocketListener.add_address(address: SocketAddress, type: SocketType, protocol: SocketProtocol, source_object: GObject.Object?, effective_address: out SocketAddress?) -> gboolean throws` | g_socket_listener_add_address | 2.22 | Creates a socket of type @type and protocol @protocol, binds it to @address and adds it to the set of sockets we're accepting sockets from. Note th... |
| add_any_inet_port | `SocketListener.add_any_inet_port(source_object: GObject.Object?) -> guint16 throws` | g_socket_listener_add_any_inet_port | 2.24 | Listens for TCP connections on any available port number for both IPv6 and IPv4 (if each is available). This is useful if you need to have a socket... |
| add_inet_port | `SocketListener.add_inet_port(port: guint16, source_object: GObject.Object?) -> gboolean throws` | g_socket_listener_add_inet_port | 2.22 | Helper function for g_socket_listener_add_address() that creates a TCP/IP socket listening on IPv4 and IPv6 (if supported) on the specified port on... |
| add_socket | `SocketListener.add_socket(socket: Socket, source_object: GObject.Object?) -> gboolean throws` | g_socket_listener_add_socket | 2.22 | Adds @socket to the set of sockets that we try to accept new clients from. The socket must be bound to a local address and listened to. @source_obj... |
| close | `SocketListener.close() -> none` | g_socket_listener_close | 2.22 | Closes all the sockets in the listener. |
| set_backlog | `SocketListener.set_backlog(listen_backlog: gint) -> none` | g_socket_listener_set_backlog | 2.22 | Sets the listen backlog on the sockets in the listener. This must be called before adding any sockets, addresses or ports to the #GSocketListener (... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| listen-backlog | gint | read, write | The number of outstanding connections in the listen queue. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| event | `event: SocketListenerEvent, socket: Socket` | none | last | 2.46 | Emitted when @listener's activity on @socket changes state. Note that when @listener is used to listen on both IPv4 and IPv6, a separate set of sig... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `changed() -> none` |  |  | virtual method called when the set of socket listened to changes |
| event | `event(event: SocketListenerEvent, socket: Socket) -> none` |  |  |  |

### Gio.SocketService

Parent: `SocketListener` ?? Subclasses: `ThreadedSocketService` ?? GType: `GSocketService` ?? C type: `GSocketService`

A `GSocketService` is an object that represents a service that is provided to the network or over local sockets. When a new connection is made to t...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketListener |
| priv | SocketServicePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SocketService.new() -> SocketService` | g_socket_service_new | 2.22 | Creates a new #GSocketService with no sockets to listen for. New listeners can be added with e.g. g_socket_listener_add_address() or g_socket_liste... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_active | `SocketService.is_active() -> gboolean` | g_socket_service_is_active | 2.22 | Check whether the service is active or not. An active service will accept new clients that connect, while a non-active service will let connecting ... |
| start | `SocketService.start() -> none` | g_socket_service_start | 2.22 | Restarts the service, i.e. start accepting connections from the added sockets when the mainloop runs. This only needs to be called after the servic... |
| stop | `SocketService.stop() -> none` | g_socket_service_stop | 2.22 | Stops the service, i.e. stops accepting connections from the added sockets when the mainloop runs. This call is thread-safe, so it may be called fr... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active | gboolean | read, write | Whether the service is currently accepting connections. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| incoming | `connection: SocketConnection, source_object: GObject.Object?` | gboolean | last | 2.22 | The ::incoming signal is emitted when a new incoming connection to @service needs to be handled. The handler must initiate the handling of @connect... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| incoming | `incoming(connection: SocketConnection, source_object: GObject.Object) -> gboolean` |  |  | signal emitted when new connections are accepted |

### Gio.Subprocess

Parent: `GObject.Object` ?? Implements: `Initable` ?? GType: `GSubprocess` ?? C type: `GSubprocess`

`GSubprocess` allows the creation of and interaction with child processes. Processes can be communicated with using standard GIO-style APIs (ie: [c...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Subprocess.new(flags: SubprocessFlags, error: GLib.Error?, argv0: utf8, ...: void) -> Subprocess` | g_subprocess_new | 2.40 | Create a new process with the given flags and varargs argument list. By default, matching the g_spawn_async() defaults, the child's stdin will be s... |
| newv | `Subprocess.newv(argv: filename, flags: SubprocessFlags) -> Subprocess throws` | g_subprocess_newv | 2.40 | Create a new process with the given flags and argument list. The argument list is expected to be %NULL-terminated. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| communicate | `Subprocess.communicate(stdin_buf: GLib.Bytes?, cancellable: Cancellable?, stdout_buf: out GLib.Bytes?, stderr_buf: out GLib.Bytes?) -> gboolean throws` | g_subprocess_communicate | 2.40 | Communicate with the subprocess until it terminates, and all input and output has been completed. If @stdin_buf is given, the subprocess must have ... |
| communicate_async | `Subprocess.communicate_async(stdin_buf: GLib.Bytes?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_subprocess_communicate_async |  | Asynchronous version of g_subprocess_communicate(). Complete invocation with g_subprocess_communicate_finish(). |
| communicate_finish | `Subprocess.communicate_finish(result: AsyncResult, stdout_buf: out GLib.Bytes?, stderr_buf: out GLib.Bytes?) -> gboolean throws` | g_subprocess_communicate_finish |  | Complete an invocation of g_subprocess_communicate_async(). |
| communicate_utf8 | `Subprocess.communicate_utf8(stdin_buf: utf8?, cancellable: Cancellable?, stdout_buf: out utf8?, stderr_buf: out utf8?) -> gboolean throws` | g_subprocess_communicate_utf8 |  | Like g_subprocess_communicate(), but validates the output of the process as UTF-8, and returns it as a regular NUL terminated string. On error, @st... |
| communicate_utf8_async | `Subprocess.communicate_utf8_async(stdin_buf: utf8?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_subprocess_communicate_utf8_async |  | Asynchronous version of g_subprocess_communicate_utf8(). Complete invocation with g_subprocess_communicate_utf8_finish(). |
| communicate_utf8_finish | `Subprocess.communicate_utf8_finish(result: AsyncResult, stdout_buf: out utf8?, stderr_buf: out utf8?) -> gboolean throws` | g_subprocess_communicate_utf8_finish |  | Complete an invocation of g_subprocess_communicate_utf8_async(). |
| force_exit | `Subprocess.force_exit() -> none` | g_subprocess_force_exit | 2.40 | Use an operating-system specific method to attempt an immediate, forceful termination of the process. There is no mechanism to determine whether or... |
| get_exit_status | `Subprocess.get_exit_status() -> gint` | g_subprocess_get_exit_status | 2.40 | Check the exit status of the subprocess, given that it exited normally. This is the value passed to the exit() system call or the return value from... |
| get_identifier | `Subprocess.get_identifier() -> utf8` | g_subprocess_get_identifier | 2.40 | On UNIX, returns the process ID as a decimal string. On Windows, returns the result of GetProcessId() also as a string. If the subprocess has termi... |
| get_if_exited | `Subprocess.get_if_exited() -> gboolean` | g_subprocess_get_if_exited | 2.40 | Check if the given subprocess exited normally (ie: by way of exit() or return from main()). This is equivalent to the system WIFEXITED macro. It is... |
| get_if_signaled | `Subprocess.get_if_signaled() -> gboolean` | g_subprocess_get_if_signaled | 2.40 | Check if the given subprocess terminated in response to a signal. This is equivalent to the system WIFSIGNALED macro. It is an error to call this f... |
| get_status | `Subprocess.get_status() -> gint` | g_subprocess_get_status | 2.40 | Gets the raw status code of the process, as from waitpid(). This value has no particular meaning, but it can be used with the macros defined by the... |
| get_stderr_pipe | `Subprocess.get_stderr_pipe() -> InputStream` | g_subprocess_get_stderr_pipe | 2.40 | Gets the #GInputStream from which to read the stderr output of @subprocess. The process must have been created with %G_SUBPROCESS_FLAGS_STDERR_PIPE... |
| get_stdin_pipe | `Subprocess.get_stdin_pipe() -> OutputStream` | g_subprocess_get_stdin_pipe | 2.40 | Gets the #GOutputStream that you can write to in order to give data to the stdin of @subprocess. The process must have been created with %G_SUBPROC... |
| get_stdout_pipe | `Subprocess.get_stdout_pipe() -> InputStream` | g_subprocess_get_stdout_pipe | 2.40 | Gets the #GInputStream from which to read the stdout output of @subprocess. The process must have been created with %G_SUBPROCESS_FLAGS_STDOUT_PIPE... |
| get_successful | `Subprocess.get_successful() -> gboolean` | g_subprocess_get_successful | 2.40 | Checks if the process was "successful". A process is considered successful if it exited cleanly with an exit status of 0, either by way of the exit... |
| get_term_sig | `Subprocess.get_term_sig() -> gint` | g_subprocess_get_term_sig | 2.40 | Get the signal number that caused the subprocess to terminate, given that it terminated due to a signal. This is equivalent to the system WTERMSIG ... |
| send_signal | `Subprocess.send_signal(signal_num: gint) -> none` | g_subprocess_send_signal | 2.40 | Sends the UNIX signal @signal_num to the subprocess, if it is still running. This API is race-free. If the subprocess has terminated, it will not b... |
| wait | `Subprocess.wait(cancellable: Cancellable?) -> gboolean throws` | g_subprocess_wait | 2.40 | Synchronously wait for the subprocess to terminate. After the process terminates you can query its exit status with functions such as g_subprocess_... |
| wait_async | `Subprocess.wait_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_subprocess_wait_async | 2.40 | Wait for the subprocess to terminate. This is the asynchronous version of g_subprocess_wait(). |
| wait_check | `Subprocess.wait_check(cancellable: Cancellable?) -> gboolean throws` | g_subprocess_wait_check | 2.40 | Combines g_subprocess_wait() with g_spawn_check_wait_status(). |
| wait_check_async | `Subprocess.wait_check_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_subprocess_wait_check_async | 2.40 | Combines g_subprocess_wait_async() with g_spawn_check_wait_status(). This is the asynchronous version of g_subprocess_wait_check(). |
| wait_check_finish | `Subprocess.wait_check_finish(result: AsyncResult) -> gboolean throws` | g_subprocess_wait_check_finish | 2.40 | Collects the result of a previous call to g_subprocess_wait_check_async(). |
| wait_finish | `Subprocess.wait_finish(result: AsyncResult) -> gboolean throws` | g_subprocess_wait_finish | 2.40 | Collects the result of a previous call to g_subprocess_wait_async(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| argv | utf8 | write, construct-only | Argument vector. |
| flags | SubprocessFlags | write, construct-only | Subprocess flags. |

### Gio.SubprocessLauncher

Parent: `GObject.Object` ?? GType: `GSubprocessLauncher` ?? C type: `GSubprocessLauncher`

This class contains a set of options for launching child processes, such as where its standard input and output will be directed, the argument list...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SubprocessLauncher.new(flags: SubprocessFlags) -> SubprocessLauncher` | g_subprocess_launcher_new | 2.40 | Creates a new #GSubprocessLauncher. The launcher is created with the default options. A copy of the environment of the calling process is made at t... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `SubprocessLauncher.close() -> none` | g_subprocess_launcher_close | 2.68 | Closes all the file descriptors previously passed to the object with g_subprocess_launcher_take_fd(), g_subprocess_launcher_take_stderr_fd(), etc. ... |
| getenv | `SubprocessLauncher.getenv(variable: filename) -> filename` | g_subprocess_launcher_getenv | 2.40 | Returns the value of the environment variable @variable in the environment of processes launched from this launcher. On UNIX, the returned string c... |
| set_child_setup | `SubprocessLauncher.set_child_setup(child_setup: GLib.SpawnChildSetupFunc, user_data: gpointer?, destroy_notify: GLib.DestroyNotify) -> none` | g_subprocess_launcher_set_child_setup | 2.40 | Sets up a child setup function. The child setup function will be called after fork() but before exec() on the child's side. @destroy_notify will no... |
| set_cwd | `SubprocessLauncher.set_cwd(cwd: filename) -> none` | g_subprocess_launcher_set_cwd | 2.40 | Sets the current working directory that processes will be launched with. By default processes are launched with the current working directory of th... |
| set_environ | `SubprocessLauncher.set_environ(env: filename) -> none` | g_subprocess_launcher_set_environ | 2.40 | Replace the entire environment of processes launched from this launcher with the given 'environ' variable. Typically you will build this variable b... |
| set_flags | `SubprocessLauncher.set_flags(flags: SubprocessFlags) -> none` | g_subprocess_launcher_set_flags | 2.40 | Sets the flags on the launcher. The default flags are %G_SUBPROCESS_FLAGS_NONE. You may not set flags that specify conflicting options for how to h... |
| set_stderr_file_path | `SubprocessLauncher.set_stderr_file_path(path: filename?) -> none` | g_subprocess_launcher_set_stderr_file_path | 2.40 | Sets the file path to use as the stderr for spawned processes. If @path is %NULL then any previously given path is unset. The file will be created ... |
| set_stdin_file_path | `SubprocessLauncher.set_stdin_file_path(path: filename?) -> none` | g_subprocess_launcher_set_stdin_file_path | 2.40 | Sets the file path to use as the stdin for spawned processes. If @path is %NULL then any previously given path is unset. The file must exist or spa... |
| set_stdout_file_path | `SubprocessLauncher.set_stdout_file_path(path: filename?) -> none` | g_subprocess_launcher_set_stdout_file_path | 2.40 | Sets the file path to use as the stdout for spawned processes. If @path is %NULL then any previously given path is unset. The file will be created ... |
| setenv | `SubprocessLauncher.setenv(variable: filename, value: filename, overwrite: gboolean) -> none` | g_subprocess_launcher_setenv | 2.40 | Sets the environment variable @variable in the environment of processes launched from this launcher. On UNIX, both the variable's name and value ca... |
| spawn | `SubprocessLauncher.spawn(error: GLib.Error, argv0: utf8, ...: void) -> Subprocess` | g_subprocess_launcher_spawn | 2.40 | Creates a #GSubprocess given a provided varargs list of arguments. |
| spawnv | `SubprocessLauncher.spawnv(argv: filename) -> Subprocess throws` | g_subprocess_launcher_spawnv | 2.40 | Creates a #GSubprocess given a provided array of arguments. |
| take_fd | `SubprocessLauncher.take_fd(source_fd: gint, target_fd: gint) -> none` | g_subprocess_launcher_take_fd |  | Transfer an arbitrary file descriptor from parent process to the child. This function takes ownership of the @source_fd; it will be closed in the p... |
| take_stderr_fd | `SubprocessLauncher.take_stderr_fd(fd: gint) -> none` | g_subprocess_launcher_take_stderr_fd | 2.40 | Sets the file descriptor to use as the stderr for spawned processes. If @fd is -1 then any previously given fd is unset. Note that the default beha... |
| take_stdin_fd | `SubprocessLauncher.take_stdin_fd(fd: gint) -> none` | g_subprocess_launcher_take_stdin_fd | 2.40 | Sets the file descriptor to use as the stdin for spawned processes. If @fd is -1 then any previously given fd is unset. Note that if your intention... |
| take_stdout_fd | `SubprocessLauncher.take_stdout_fd(fd: gint) -> none` | g_subprocess_launcher_take_stdout_fd | 2.40 | Sets the file descriptor to use as the stdout for spawned processes. If @fd is -1 then any previously given fd is unset. Note that the default beha... |
| unsetenv | `SubprocessLauncher.unsetenv(variable: filename) -> none` | g_subprocess_launcher_unsetenv | 2.40 | Removes the environment variable @variable from the environment of processes launched from this launcher. On UNIX, the variable's name can be an ar... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| flags | SubprocessFlags | write, construct-only | [flags@Gio.SubprocessFlags] for launched processes. |

### Gio.Task

Parent: `GObject.Object` ?? Implements: `AsyncResult` ?? GType: `GTask` ?? C type: `GTask`

A `GTask` represents and manages a cancellable ???task???. ## Asynchronous operations The most common usage of `GTask` is as a [iface@Gio.AsyncResu...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Task.new(source_object: GObject.Object?, cancellable: Cancellable?, callback: AsyncReadyCallback?, callback_data: gpointer?) -> Task` | g_task_new | 2.36 | Creates a #GTask acting on @source_object, which will eventually be used to invoke @callback in the current [thread-default main context][g-main-co... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_valid | `is_valid(result: AsyncResult, source_object: GObject.Object?) -> gboolean` | g_task_is_valid | 2.36 | Checks that @result is a #GTask, and that @source_object is its source object (or that @source_object is %NULL and @result has no source object). T... |
| report_error | `report_error(source_object: GObject.Object?, callback: AsyncReadyCallback?, callback_data: gpointer?, source_tag: gpointer?, error: GLib.Error) -> none` | g_task_report_error | 2.36 | Creates a #GTask and then immediately calls g_task_return_error() on it. Use this in the wrapper function of an asynchronous method when you want t... |
| report_new_error | `report_new_error(source_object: GObject.Object?, callback: AsyncReadyCallback?, callback_data: gpointer?, source_tag: gpointer?, domain: GLib.Quark, code: gint, format: utf8, ...: void) -> none` | g_task_report_new_error | 2.36 | Creates a #GTask and then immediately calls g_task_return_new_error() on it. Use this in the wrapper function of an asynchronous method when you wa... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| attach_source | `Task.attach_source(source: GLib.Source, callback: GLib.SourceFunc) -> none` | g_task_attach_source | 2.36 | A utility function for dealing with async operations where you need to wait for a #GSource to trigger. Attaches @source to @task's #GMainContext wi... |
| get_cancellable | `Task.get_cancellable() -> Cancellable` | g_task_get_cancellable | 2.36 | Gets @task's #GCancellable |
| get_check_cancellable | `Task.get_check_cancellable() -> gboolean` | g_task_get_check_cancellable | 2.36 | Gets @task's check-cancellable flag. See g_task_set_check_cancellable() for more details. |
| get_completed | `Task.get_completed() -> gboolean` | g_task_get_completed | 2.44 | Gets the value of #GTask:completed. This changes from %FALSE to %TRUE after the task???s callback is invoked, and will return %FALSE if called from... |
| get_context | `Task.get_context() -> GLib.MainContext` | g_task_get_context | 2.36 | Gets the #GMainContext that @task will return its result in (that is, the context that was the [thread-default main context][g-main-context-push-th... |
| get_name | `Task.get_name() -> utf8` | g_task_get_name | 2.60 | Gets @task???s name. See g_task_set_name(). |
| get_priority | `Task.get_priority() -> gint` | g_task_get_priority | 2.36 | Gets @task's priority |
| get_return_on_cancel | `Task.get_return_on_cancel() -> gboolean` | g_task_get_return_on_cancel | 2.36 | Gets @task's return-on-cancel flag. See g_task_set_return_on_cancel() for more details. |
| get_source_object | `Task.get_source_object() -> GObject.Object` | g_task_get_source_object | 2.36 | Gets the source object from @task. Like g_async_result_get_source_object(), but does not ref the object. |
| get_source_tag | `Task.get_source_tag() -> gpointer` | g_task_get_source_tag | 2.36 | Gets @task's source tag. See g_task_set_source_tag(). |
| get_task_data | `Task.get_task_data() -> gpointer` | g_task_get_task_data | 2.36 | Gets @task's `task_data`. |
| had_error | `Task.had_error() -> gboolean` | g_task_had_error | 2.36 | Tests if @task resulted in an error. |
| propagate_boolean | `Task.propagate_boolean() -> gboolean throws` | g_task_propagate_boolean | 2.36 | Gets the result of @task as a #gboolean. If the task resulted in an error, or was cancelled, then this will instead return %FALSE and set @error. S... |
| propagate_int | `Task.propagate_int() -> gssize throws` | g_task_propagate_int | 2.36 | Gets the result of @task as an integer (#gssize). If the task resulted in an error, or was cancelled, then this will instead return -1 and set @err... |
| propagate_pointer | `Task.propagate_pointer() -> gpointer throws` | g_task_propagate_pointer | 2.36 | Gets the result of @task as a pointer, and transfers ownership of that value to the caller. If the task resulted in an error, or was cancelled, the... |
| propagate_value | `Task.propagate_value(value: out GObject.Value) -> gboolean throws` | g_task_propagate_value | 2.64 | Gets the result of @task as a #GValue, and transfers ownership of that value to the caller. As with g_task_return_value(), this is a generic low-le... |
| return_boolean | `Task.return_boolean(result: gboolean) -> none` | g_task_return_boolean | 2.36 | Sets @task's result to @result and completes the task (see g_task_return_pointer() for more discussion of exactly what this means). |
| return_error | `Task.return_error(error: GLib.Error) -> none` | g_task_return_error | 2.36 | Sets @task's result to @error (which @task assumes ownership of) and completes the task (see g_task_return_pointer() for more discussion of exactly... |
| return_error_if_cancelled | `Task.return_error_if_cancelled() -> gboolean` | g_task_return_error_if_cancelled | 2.36 | Checks if @task's #GCancellable has been cancelled, and if so, sets @task's error accordingly and completes the task (see g_task_return_pointer() f... |
| return_int | `Task.return_int(result: gssize) -> none` | g_task_return_int | 2.36 | Sets @task's result to @result and completes the task (see g_task_return_pointer() for more discussion of exactly what this means). |
| return_new_error | `Task.return_new_error(domain: GLib.Quark, code: gint, format: utf8, ...: void) -> none` | g_task_return_new_error | 2.36 | Sets @task's result to a new #GError created from @domain, @code, @format, and the remaining arguments, and completes the task (see g_task_return_p... |
| return_new_error_literal | `Task.return_new_error_literal(domain: GLib.Quark, code: gint, message: utf8) -> none` | g_task_return_new_error_literal | 2.80 | Sets @task???s result to a new [type@GLib.Error] created from @domain, @code, @message and completes the task. See [method@Gio.Task.return_pointer]... |
| return_pointer | `Task.return_pointer(result: gpointer?, result_destroy: GLib.DestroyNotify?) -> none` | g_task_return_pointer | 2.36 | Sets @task's result to @result and completes the task. If @result is not %NULL, then @result_destroy will be used to free @result if the caller doe... |
| return_prefixed_error | `Task.return_prefixed_error(error: GLib.Error, format: utf8, ...: void) -> none` | g_task_return_prefixed_error | 2.80 | Sets @task's result to @error (which @task assumes ownership of), with the message prefixed according to @format, and completes the task (see g_tas... |
| return_value | `Task.return_value(result: GObject.Value?) -> none` | g_task_return_value | 2.64 | Sets @task's result to @result (by copying it) and completes the task. If @result is %NULL then a #GValue of type %G_TYPE_POINTER with a value of %... |
| run_in_thread | `Task.run_in_thread(task_func: TaskThreadFunc) -> none` | g_task_run_in_thread | 2.36 | Runs @task_func in another thread. When @task_func returns, @task's #GAsyncReadyCallback will be invoked in @task's #GMainContext. This takes a ref... |
| run_in_thread_sync | `Task.run_in_thread_sync(task_func: TaskThreadFunc) -> none` | g_task_run_in_thread_sync | 2.36 | Runs @task_func in another thread, and waits for it to return or be cancelled. You can use g_task_propagate_pointer(), etc, afterward to get the re... |
| set_check_cancellable | `Task.set_check_cancellable(check_cancellable: gboolean) -> none` | g_task_set_check_cancellable | 2.36 | Sets or clears @task's check-cancellable flag. If this is %TRUE (the default), then g_task_propagate_pointer(), etc, and g_task_had_error() will ch... |
| set_name | `Task.set_name(name: utf8?) -> none` | g_task_set_name | 2.60 | Sets @task???s name, used in debugging and profiling. The name defaults to %NULL. The task name should describe in a human readable way what the ta... |
| set_priority | `Task.set_priority(priority: gint) -> none` | g_task_set_priority | 2.36 | Sets @task's priority. If you do not call this, it will default to %G_PRIORITY_DEFAULT. This will affect the priority of #GSources created with g_t... |
| set_return_on_cancel | `Task.set_return_on_cancel(return_on_cancel: gboolean) -> gboolean` | g_task_set_return_on_cancel | 2.36 | Sets or clears @task's return-on-cancel flag. This is only meaningful for tasks run via g_task_run_in_thread() or g_task_run_in_thread_sync(). If @... |
| set_source_tag | `Task.set_source_tag(source_tag: gpointer?) -> none` | g_task_set_source_tag | 2.36 | Sets @task's source tag. You can use this to tag a task return value with a particular pointer (usually a pointer to the function doing the tagging... |
| set_static_name | `Task.set_static_name(name: utf8?) -> none` | g_task_set_static_name | 2.76 | Sets @task???s name, used in debugging and profiling. This is a variant of g_task_set_name() that avoids copying @name. |
| set_task_data | `Task.set_task_data(task_data: gpointer?, task_data_destroy: GLib.DestroyNotify?) -> none` | g_task_set_task_data | 2.36 | Sets @task's task data (freeing the existing task data, if any). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| completed | gboolean | read | Whether the task has completed, meaning its callback (if set) has been invoked. This can only happen after g_task_return_pointer(), g_task_return_e... |

### Gio.TcpConnection

Parent: `SocketConnection` ?? Subclasses: `TcpWrapperConnection` ?? GType: `GTcpConnection` ?? C type: `GTcpConnection`

This is the subclass of [class@Gio.SocketConnection] that is created for TCP/IP sockets.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketConnection |
| priv | TcpConnectionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_graceful_disconnect | `TcpConnection.get_graceful_disconnect() -> gboolean` | g_tcp_connection_get_graceful_disconnect | 2.22 | Checks if graceful disconnects are used. See g_tcp_connection_set_graceful_disconnect(). |
| set_graceful_disconnect | `TcpConnection.set_graceful_disconnect(graceful_disconnect: gboolean) -> none` | g_tcp_connection_set_graceful_disconnect | 2.22 | This enables graceful disconnects on close. A graceful disconnect means that we signal the receiving end that the connection is terminated and wait... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| graceful-disconnect | gboolean | read, write | Whether [method@Gio.IOStream.close] does a graceful disconnect. |

### Gio.TcpWrapperConnection

Parent: `TcpConnection` ?? GType: `GTcpWrapperConnection` ?? C type: `GTcpWrapperConnection`

A `GTcpWrapperConnection` can be used to wrap a [class@Gio.IOStream] that is based on a [class@Gio.Socket], but which is not actually a [class@Gio....

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | TcpConnection |
| priv | TcpWrapperConnectionPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TcpWrapperConnection.new(base_io_stream: IOStream, socket: Socket) -> SocketConnection` | g_tcp_wrapper_connection_new | 2.28 | Wraps @base_io_stream and @socket together as a #GSocketConnection. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_base_io_stream | `TcpWrapperConnection.get_base_io_stream() -> IOStream` | g_tcp_wrapper_connection_get_base_io_stream |  | Gets @conn's base #GIOStream |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| base-io-stream | IOStream | read, write, construct-only | The wrapped [class@Gio.IOStream]. |

### Gio.TestDBus

Parent: `GObject.Object` ?? GType: `GTestDBus` ?? C type: `GTestDBus`

A helper class for testing code which uses D-Bus without touching the user???s session bus. Note that `GTestDBus` modifies the user???s environment...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TestDBus.new(flags: TestDBusFlags) -> TestDBus` | g_test_dbus_new |  | Create a new #GTestDBus object. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| unset | `unset() -> none` | g_test_dbus_unset |  | Unset DISPLAY and DBUS_SESSION_BUS_ADDRESS env variables to ensure the test won't use user's session bus. This is useful for unit tests that want t... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_service_dir | `TestDBus.add_service_dir(path: utf8) -> none` | g_test_dbus_add_service_dir |  | Add a path where dbus-daemon will look up .service files. This can't be called after g_test_dbus_up(). |
| down | `TestDBus.down() -> none` | g_test_dbus_down |  | Stop the session bus started by g_test_dbus_up(). This will wait for the singleton returned by g_bus_get() or g_bus_get_sync() to be destroyed. Thi... |
| get_bus_address | `TestDBus.get_bus_address() -> utf8` | g_test_dbus_get_bus_address |  | Get the address on which dbus-daemon is running. If g_test_dbus_up() has not been called yet, %NULL is returned. This can be used with g_dbus_conne... |
| get_flags | `TestDBus.get_flags() -> TestDBusFlags` | g_test_dbus_get_flags |  | Get the flags of the #GTestDBus object. |
| stop | `TestDBus.stop() -> none` | g_test_dbus_stop |  | Stop the session bus started by g_test_dbus_up(). Unlike g_test_dbus_down(), this won't verify the #GDBusConnection singleton returned by g_bus_get... |
| up | `TestDBus.up() -> none` | g_test_dbus_up |  | Start a dbus-daemon instance and set DBUS_SESSION_BUS_ADDRESS. After this call, it is safe for unit tests to start sending messages on the session ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| flags | TestDBusFlags | read, write, construct-only | #GTestDBusFlags specifying the behaviour of the D-Bus session. |

### Gio.ThemedIcon

Parent: `GObject.Object` ?? Implements: `Icon` ?? GType: `GThemedIcon` ?? C type: `GThemedIcon`

`GThemedIcon` is an implementation of [iface@Gio.Icon] that supports icon themes. `GThemedIcon` contains a list of all of the icons present in an i...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ThemedIcon.new(iconname: utf8) -> ThemedIcon` | g_themed_icon_new |  | Creates a new themed icon for @iconname. |
| new_from_names | `ThemedIcon.new_from_names(iconnames: utf8, len: gint) -> ThemedIcon` | g_themed_icon_new_from_names |  | Creates a new themed icon for @iconnames. |
| new_with_default_fallbacks | `ThemedIcon.new_with_default_fallbacks(iconname: utf8) -> ThemedIcon` | g_themed_icon_new_with_default_fallbacks |  | Creates a new themed icon for @iconname, and all the names that can be created by shortening @iconname at '-' characters. In the following example,... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_name | `ThemedIcon.append_name(iconname: utf8) -> none` | g_themed_icon_append_name |  | Append a name to the list of icons from within @icon. Note that doing so invalidates the hash computed by prior calls to g_icon_hash(). |
| get_names | `ThemedIcon.get_names() -> utf8` | g_themed_icon_get_names |  | Gets the names of icons from within @icon. |
| prepend_name | `ThemedIcon.prepend_name(iconname: utf8) -> none` | g_themed_icon_prepend_name | 2.18 | Prepend a name to the list of icons from within @icon. Note that doing so invalidates the hash computed by prior calls to g_icon_hash(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| name | utf8 | write, construct-only | The icon name. |
| names | utf8 | read, write, construct-only | A %NULL-terminated array of icon names. |
| use-default-fallbacks | gboolean | read, write, construct-only | Whether to use the default fallbacks found by shortening the icon name at '-' characters. If the "names" array has more than one element, ignores a... |

### Gio.ThreadedResolver

Parent: `Resolver` ?? GType: `GThreadedResolver` ?? C type: `GThreadedResolver`

#GThreadedResolver is an implementation of #GResolver which calls the libc lookup functions in threads to allow them to run asynchronously.

### Gio.ThreadedSocketService

Parent: `SocketService` ?? GType: `GThreadedSocketService` ?? C type: `GThreadedSocketService`

A `GThreadedSocketService` is a simple subclass of [class@Gio.SocketService] that handles incoming connections by creating a worker thread and disp...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketService |
| priv | ThreadedSocketServicePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ThreadedSocketService.new(max_threads: gint) -> SocketService` | g_threaded_socket_service_new | 2.22 | Creates a new #GThreadedSocketService with no listeners. Listeners must be added with one of the #GSocketListener "add" methods. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| max-threads | gint | read, write, construct-only | The maximum number of threads handling clients for this service. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| run | `connection: SocketConnection, source_object: GObject.Object?` | gboolean | last |  | The ::run signal is emitted in a worker thread in response to an incoming connection. This thread is dedicated to handling @connection and may perf... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| run | `run(connection: SocketConnection, source_object: GObject.Object) -> gboolean` |  |  |  |

### Gio.TlsCertificate

Parent: `GObject.Object` ?? GType: `GTlsCertificate` ?? C type: `GTlsCertificate` ?? Abstract

A certificate used for TLS authentication and encryption. This can represent either a certificate only (eg, the certificate received by a client fr...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | TlsCertificatePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_file | `TlsCertificate.new_from_file(file: filename) -> TlsCertificate throws` | g_tls_certificate_new_from_file | 2.28 | Creates a #GTlsCertificate from the data in @file. As of 2.72, if the filename ends in `.p12` or `.pfx` the data is loaded by g_tls_certificate_new... |
| new_from_file_with_password | `TlsCertificate.new_from_file_with_password(file: filename, password: utf8) -> TlsCertificate throws` | g_tls_certificate_new_from_file_with_password | 2.72 | Creates a #GTlsCertificate from the data in @file. If @file cannot be read or parsed, the function will return %NULL and set @error. Any unknown fi... |
| new_from_files | `TlsCertificate.new_from_files(cert_file: filename, key_file: filename) -> TlsCertificate throws` | g_tls_certificate_new_from_files | 2.28 | Creates a #GTlsCertificate from the PEM-encoded data in @cert_file and @key_file. The returned certificate will be the first certificate found in @... |
| new_from_pem | `TlsCertificate.new_from_pem(data: utf8, length: gssize) -> TlsCertificate throws` | g_tls_certificate_new_from_pem | 2.28 | Creates a #GTlsCertificate from the PEM-encoded data in @data. If @data includes both a certificate and a private key, then the returned certificat... |
| new_from_pkcs11_uris | `TlsCertificate.new_from_pkcs11_uris(pkcs11_uri: utf8, private_key_pkcs11_uri: utf8?) -> TlsCertificate throws` | g_tls_certificate_new_from_pkcs11_uris | 2.68 | Creates a #GTlsCertificate from a PKCS \#11 URI. An example @pkcs11_uri would be `pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20C... |
| new_from_pkcs12 | `TlsCertificate.new_from_pkcs12(data: guint8, length: gsize, password: utf8?) -> TlsCertificate throws` | g_tls_certificate_new_from_pkcs12 | 2.72 | Creates a #GTlsCertificate from the data in @data. It must contain a certificate and matching private key. If extra certificates are included they ... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| list_new_from_file | `list_new_from_file(file: filename) -> GLib.List throws` | g_tls_certificate_list_new_from_file | 2.28 | Creates one or more #GTlsCertificates from the PEM-encoded data in @file. If @file cannot be read or parsed, the function will return %NULL and set... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_dns_names | `TlsCertificate.get_dns_names() -> GLib.Bytes` | g_tls_certificate_get_dns_names | 2.70 | Gets the value of #GTlsCertificate:dns-names. |
| get_ip_addresses | `TlsCertificate.get_ip_addresses() -> InetAddress` | g_tls_certificate_get_ip_addresses | 2.70 | Gets the value of #GTlsCertificate:ip-addresses. |
| get_issuer | `TlsCertificate.get_issuer() -> TlsCertificate` | g_tls_certificate_get_issuer | 2.28 | Gets the #GTlsCertificate representing @cert's issuer, if known |
| get_issuer_name | `TlsCertificate.get_issuer_name() -> utf8` | g_tls_certificate_get_issuer_name | 2.70 | Returns the issuer name from the certificate. |
| get_not_valid_after | `TlsCertificate.get_not_valid_after() -> GLib.DateTime` | g_tls_certificate_get_not_valid_after | 2.70 | Returns the time at which the certificate became or will become invalid. |
| get_not_valid_before | `TlsCertificate.get_not_valid_before() -> GLib.DateTime` | g_tls_certificate_get_not_valid_before | 2.70 | Returns the time at which the certificate became or will become valid. |
| get_subject_name | `TlsCertificate.get_subject_name() -> utf8` | g_tls_certificate_get_subject_name | 2.70 | Returns the subject name from the certificate. |
| is_same | `TlsCertificate.is_same(cert_two: TlsCertificate) -> gboolean` | g_tls_certificate_is_same | 2.34 | Check if two #GTlsCertificate objects represent the same certificate. The raw DER byte data of the two certificates are checked for equality. This ... |
| verify | `TlsCertificate.verify(identity: SocketConnectable?, trusted_ca: TlsCertificate?) -> TlsCertificateFlags` | g_tls_certificate_verify | 2.28 | This verifies @cert and returns a set of #GTlsCertificateFlags indicating any problems found with it. This can be used to verify a certificate outs... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| certificate | guint8 | read, write, construct-only | The DER (binary) encoded representation of the certificate. This property and the #GTlsCertificate:certificate-pem property represent the same data... |
| certificate-pem | utf8 | read, write, construct-only | The PEM (ASCII) encoded representation of the certificate. This property and the #GTlsCertificate:certificate property represent the same data, jus... |
| dns-names | gpointer | read | The DNS names from the certificate's Subject Alternative Names (SANs), %NULL if unavailable. |
| ip-addresses | gpointer | read | The IP addresses from the certificate's Subject Alternative Names (SANs), %NULL if unavailable. |
| issuer | TlsCertificate | read, write, construct-only | A #GTlsCertificate representing the entity that issued this certificate. If %NULL, this means that the certificate is either self-signed, or else t... |
| issuer-name | utf8 | read | The issuer from the certificate, %NULL if unavailable. |
| not-valid-after | GLib.DateTime | read | The time at which this cert is no longer valid, %NULL if unavailable. |
| not-valid-before | GLib.DateTime | read | The time at which this cert is considered to be valid, %NULL if unavailable. |
| password | utf8 | write, construct-only | An optional password used when constructed with GTlsCertificate:pkcs12-data. |
| pkcs11-uri | utf8 | read, write, construct-only | A URI referencing the PKCS \#11 objects containing an X.509 certificate and optionally a private key. If %NULL, the certificate is either not backe... |
| pkcs12-data | guint8 | write, construct-only | The PKCS #12 formatted data used to construct the object. See also: g_tls_certificate_new_from_pkcs12() |
| private-key | guint8 | read, write, construct-only | The DER (binary) encoded representation of the certificate's private key, in either PKCS \#1 format or unencrypted PKCS \#8 format. PKCS \#8 format... |
| private-key-pem | utf8 | read, write, construct-only | The PEM (ASCII) encoded representation of the certificate's private key in either PKCS \#1 format ("`BEGIN RSA PRIVATE KEY`") or unencrypted PKCS \... |
| private-key-pkcs11-uri | utf8 | read, write, construct-only | A URI referencing a PKCS \#11 object containing a private key. |
| subject-name | utf8 | read | The subject from the cert, %NULL if unavailable. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| verify | `verify(identity: SocketConnectable?, trusted_ca: TlsCertificate?) -> TlsCertificateFlags` |  | 2.28 | This verifies @cert and returns a set of #GTlsCertificateFlags indicating any problems found with it. This can be used to verify a certificate outs... |

### Gio.TlsConnection

Parent: `IOStream` ?? GType: `GTlsConnection` ?? C type: `GTlsConnection` ?? Abstract

`GTlsConnection` is the base TLS connection class type, which wraps a [class@Gio.IOStream] and provides TLS encryption on top of it. Its subclasses...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | IOStream |
| priv | TlsConnectionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| emit_accept_certificate | `TlsConnection.emit_accept_certificate(peer_cert: TlsCertificate, errors: TlsCertificateFlags) -> gboolean` | g_tls_connection_emit_accept_certificate | 2.28 | Used by #GTlsConnection implementations to emit the #GTlsConnection::accept-certificate signal. |
| get_certificate | `TlsConnection.get_certificate() -> TlsCertificate` | g_tls_connection_get_certificate | 2.28 | Gets @conn's certificate, as set by g_tls_connection_set_certificate(). |
| get_channel_binding_data | `TlsConnection.get_channel_binding_data(type: TlsChannelBindingType, data: out guint8?) -> gboolean throws` | g_tls_connection_get_channel_binding_data | 2.66 | Query the TLS backend for TLS channel binding data of @type for @conn. This call retrieves TLS channel binding data as specified in RFC 5056, RFC 5... |
| get_ciphersuite_name | `TlsConnection.get_ciphersuite_name() -> utf8` | g_tls_connection_get_ciphersuite_name | 2.70 | Returns the name of the current TLS ciphersuite, or %NULL if the connection has not handshaked or has been closed. Beware that the TLS backend may ... |
| get_database | `TlsConnection.get_database() -> TlsDatabase` | g_tls_connection_get_database | 2.30 | Gets the certificate database that @conn uses to verify peer certificates. See g_tls_connection_set_database(). |
| get_interaction | `TlsConnection.get_interaction() -> TlsInteraction` | g_tls_connection_get_interaction | 2.30 | Get the object that will be used to interact with the user. It will be used for things like prompting the user for passwords. If %NULL is returned,... |
| get_negotiated_protocol | `TlsConnection.get_negotiated_protocol() -> utf8` | g_tls_connection_get_negotiated_protocol | 2.60 | Gets the name of the application-layer protocol negotiated during the handshake. If the peer did not use the ALPN extension, or did not advertise a... |
| get_peer_certificate | `TlsConnection.get_peer_certificate() -> TlsCertificate` | g_tls_connection_get_peer_certificate | 2.28 | Gets @conn's peer's certificate after the handshake has completed or failed. (It is not set during the emission of #GTlsConnection::accept-certific... |
| get_peer_certificate_errors | `TlsConnection.get_peer_certificate_errors() -> TlsCertificateFlags` | g_tls_connection_get_peer_certificate_errors | 2.28 | Gets the errors associated with validating @conn's peer's certificate, after the handshake has completed or failed. (It is not set during the emiss... |
| get_protocol_version | `TlsConnection.get_protocol_version() -> TlsProtocolVersion` | g_tls_connection_get_protocol_version | 2.70 | Returns the current TLS protocol version, which may be %G_TLS_PROTOCOL_VERSION_UNKNOWN if the connection has not handshaked, or has been closed, or... |
| get_rehandshake_mode | `TlsConnection.get_rehandshake_mode() -> TlsRehandshakeMode` | g_tls_connection_get_rehandshake_mode | 2.28 | Gets @conn rehandshaking mode. See g_tls_connection_set_rehandshake_mode() for details. |
| get_require_close_notify | `TlsConnection.get_require_close_notify() -> gboolean` | g_tls_connection_get_require_close_notify | 2.28 | Tests whether or not @conn expects a proper TLS close notification when the connection is closed. See g_tls_connection_set_require_close_notify() f... |
| get_use_system_certdb | `TlsConnection.get_use_system_certdb() -> gboolean` | g_tls_connection_get_use_system_certdb |  | Gets whether @conn uses the system certificate database to verify peer certificates. See g_tls_connection_set_use_system_certdb(). |
| handshake | `TlsConnection.handshake(cancellable: Cancellable?) -> gboolean throws` | g_tls_connection_handshake | 2.28 | Attempts a TLS handshake on @conn. On the client side, it is never necessary to call this method; although the connection needs to perform a handsh... |
| handshake_async | `TlsConnection.handshake_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_connection_handshake_async | 2.28 | Asynchronously performs a TLS handshake on @conn. See g_tls_connection_handshake() for more information. |
| handshake_finish | `TlsConnection.handshake_finish(result: AsyncResult) -> gboolean throws` | g_tls_connection_handshake_finish | 2.28 | Finish an asynchronous TLS handshake operation. See g_tls_connection_handshake() for more information. |
| set_advertised_protocols | `TlsConnection.set_advertised_protocols(protocols: utf8?) -> none` | g_tls_connection_set_advertised_protocols | 2.60 | Sets the list of application-layer protocols to advertise that the caller is willing to speak on this connection. The Application-Layer Protocol Ne... |
| set_certificate | `TlsConnection.set_certificate(certificate: TlsCertificate) -> none` | g_tls_connection_set_certificate | 2.28 | This sets the certificate that @conn will present to its peer during the TLS handshake. For a #GTlsServerConnection, it is mandatory to set this, a... |
| set_database | `TlsConnection.set_database(database: TlsDatabase?) -> none` | g_tls_connection_set_database | 2.30 | Sets the certificate database that is used to verify peer certificates. This is set to the default database by default. See g_tls_backend_get_defau... |
| set_interaction | `TlsConnection.set_interaction(interaction: TlsInteraction?) -> none` | g_tls_connection_set_interaction | 2.30 | Set the object that will be used to interact with the user. It will be used for things like prompting the user for passwords. The @interaction argu... |
| set_rehandshake_mode | `TlsConnection.set_rehandshake_mode(mode: TlsRehandshakeMode) -> none` | g_tls_connection_set_rehandshake_mode | 2.28 | Since GLib 2.64, changing the rehandshake mode is no longer supported and will have no effect. With TLS 1.3, rehandshaking has been removed from th... |
| set_require_close_notify | `TlsConnection.set_require_close_notify(require_close_notify: gboolean) -> none` | g_tls_connection_set_require_close_notify | 2.28 | Sets whether or not @conn expects a proper TLS close notification before the connection is closed. If this is %TRUE (the default), then @conn will ... |
| set_use_system_certdb | `TlsConnection.set_use_system_certdb(use_system_certdb: gboolean) -> none` | g_tls_connection_set_use_system_certdb |  | Sets whether @conn uses the system certificate database to verify peer certificates. This is %TRUE by default. If set to %FALSE, then peer certific... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| advertised-protocols | utf8 | read, write | The list of application-layer protocols that the connection advertises that it is willing to speak. See g_tls_connection_set_advertised_protocols(). |
| base-io-stream | IOStream | read, write, construct-only | The #GIOStream that the connection wraps. The connection holds a reference to this stream, and may run operations on the stream from other threads ... |
| certificate | TlsCertificate | read, write | The connection's certificate; see g_tls_connection_set_certificate(). |
| ciphersuite-name | utf8 | read | The name of the TLS ciphersuite in use. See g_tls_connection_get_ciphersuite_name(). |
| database | TlsDatabase | read, write | The certificate database to use when verifying this TLS connection. If no certificate database is set, then the default database will be used. See ... |
| interaction | TlsInteraction | read, write | A #GTlsInteraction object to be used when the connection or certificate database need to interact with the user. This will be used to prompt the us... |
| negotiated-protocol | utf8 | read | The application-layer protocol negotiated during the TLS handshake. See g_tls_connection_get_negotiated_protocol(). |
| peer-certificate | TlsCertificate | read | The connection's peer's certificate, after the TLS handshake has completed or failed. Note in particular that this is not yet set during the emissi... |
| peer-certificate-errors | TlsCertificateFlags | read | The errors noticed while verifying #GTlsConnection:peer-certificate. Normally this should be 0, but it may not be if #GTlsClientConnection:validati... |
| protocol-version | TlsProtocolVersion | read | The TLS protocol version in use. See g_tls_connection_get_protocol_version(). |
| rehandshake-mode | TlsRehandshakeMode | read, write | The rehandshaking mode. See g_tls_connection_set_rehandshake_mode(). |
| require-close-notify | gboolean | read, write | Whether or not proper TLS close notification is required. See g_tls_connection_set_require_close_notify(). |
| use-system-certdb | gboolean | read, write | Whether or not the system certificate database will be used to verify peer certificates. See g_tls_connection_set_use_system_certdb(). |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| accept-certificate | `peer_cert: TlsCertificate, errors: TlsCertificateFlags` | gboolean | last | 2.28 | Emitted during the TLS handshake after the peer certificate has been received. You can examine @peer_cert's certification path by calling g_tls_cer... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_certificate | `accept_certificate(peer_cert: TlsCertificate, errors: TlsCertificateFlags) -> gboolean` |  |  | Check whether to accept a certificate. |
| get_binding_data | `get_binding_data(type: TlsChannelBindingType, data: guint8) -> gboolean throws` |  |  | Retrieve TLS channel binding data (Since: 2.66) |
| get_negotiated_protocol | `get_negotiated_protocol() -> utf8` |  | 2.60 | Gets the name of the application-layer protocol negotiated during the handshake. If the peer did not use the ALPN extension, or did not advertise a... |
| handshake | `handshake(cancellable: Cancellable?) -> gboolean throws` |  | 2.28 | Attempts a TLS handshake on @conn. On the client side, it is never necessary to call this method; although the connection needs to perform a handsh... |
| handshake_async | `handshake_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.28 | Asynchronously performs a TLS handshake on @conn. See g_tls_connection_handshake() for more information. |
| handshake_finish | `handshake_finish(result: AsyncResult) -> gboolean throws` |  | 2.28 | Finish an asynchronous TLS handshake operation. See g_tls_connection_handshake() for more information. |

### Gio.TlsDatabase

Parent: `GObject.Object` ?? GType: `GTlsDatabase` ?? C type: `GTlsDatabase` ?? Abstract

`GTlsDatabase` is used to look up certificates and other information from a certificate or key store. It is an abstract base class which TLS librar...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | TlsDatabasePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_certificate_handle | `TlsDatabase.create_certificate_handle(certificate: TlsCertificate) -> utf8` | g_tls_database_create_certificate_handle | 2.30 | Create a handle string for the certificate. The database will only be able to create a handle for certificates that originate from the database. In... |
| lookup_certificate_for_handle | `TlsDatabase.lookup_certificate_for_handle(handle: utf8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?) -> TlsCertificate throws` | g_tls_database_lookup_certificate_for_handle | 2.30 | Look up a certificate by its handle. The handle should have been created by calling g_tls_database_create_certificate_handle() on a #GTlsDatabase o... |
| lookup_certificate_for_handle_async | `TlsDatabase.lookup_certificate_for_handle_async(handle: utf8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_database_lookup_certificate_for_handle_async | 2.30 | Asynchronously look up a certificate by its handle in the database. See g_tls_database_lookup_certificate_for_handle() for more information. |
| lookup_certificate_for_handle_finish | `TlsDatabase.lookup_certificate_for_handle_finish(result: AsyncResult) -> TlsCertificate throws` | g_tls_database_lookup_certificate_for_handle_finish | 2.30 | Finish an asynchronous lookup of a certificate by its handle. See g_tls_database_lookup_certificate_for_handle() for more information. If the handl... |
| lookup_certificate_issuer | `TlsDatabase.lookup_certificate_issuer(certificate: TlsCertificate, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?) -> TlsCertificate throws` | g_tls_database_lookup_certificate_issuer | 2.30 | Look up the issuer of @certificate in the database. The #GTlsCertificate:issuer property of @certificate is not modified, and the two certificates ... |
| lookup_certificate_issuer_async | `TlsDatabase.lookup_certificate_issuer_async(certificate: TlsCertificate, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_database_lookup_certificate_issuer_async | 2.30 | Asynchronously look up the issuer of @certificate in the database. See g_tls_database_lookup_certificate_issuer() for more information. |
| lookup_certificate_issuer_finish | `TlsDatabase.lookup_certificate_issuer_finish(result: AsyncResult) -> TlsCertificate throws` | g_tls_database_lookup_certificate_issuer_finish | 2.30 | Finish an asynchronous lookup issuer operation. See g_tls_database_lookup_certificate_issuer() for more information. |
| lookup_certificates_issued_by | `TlsDatabase.lookup_certificates_issued_by(issuer_raw_dn: guint8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?) -> GLib.List throws` | g_tls_database_lookup_certificates_issued_by | 2.30 | Look up certificates issued by this issuer in the database. This function can block, use g_tls_database_lookup_certificates_issued_by_async() to pe... |
| lookup_certificates_issued_by_async | `TlsDatabase.lookup_certificates_issued_by_async(issuer_raw_dn: guint8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_database_lookup_certificates_issued_by_async | 2.30 | Asynchronously look up certificates issued by this issuer in the database. See g_tls_database_lookup_certificates_issued_by() for more information.... |
| lookup_certificates_issued_by_finish | `TlsDatabase.lookup_certificates_issued_by_finish(result: AsyncResult) -> GLib.List throws` | g_tls_database_lookup_certificates_issued_by_finish | 2.30 | Finish an asynchronous lookup of certificates. See g_tls_database_lookup_certificates_issued_by() for more information. |
| verify_chain | `TlsDatabase.verify_chain(chain: TlsCertificate, purpose: utf8, identity: SocketConnectable?, interaction: TlsInteraction?, flags: TlsDatabaseVerifyFlags, cancellable: Cancellable?) -> TlsCertificateFlags throws` | g_tls_database_verify_chain | 2.30 | Determines the validity of a certificate chain, outside the context of a TLS session. @chain is a chain of #GTlsCertificate objects each pointing t... |
| verify_chain_async | `TlsDatabase.verify_chain_async(chain: TlsCertificate, purpose: utf8, identity: SocketConnectable?, interaction: TlsInteraction?, flags: TlsDatabaseVerifyFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_database_verify_chain_async | 2.30 | Asynchronously determines the validity of a certificate chain after looking up and adding any missing certificates to the chain. See g_tls_database... |
| verify_chain_finish | `TlsDatabase.verify_chain_finish(result: AsyncResult) -> TlsCertificateFlags throws` | g_tls_database_verify_chain_finish | 2.30 | Finish an asynchronous verify chain operation. See g_tls_database_verify_chain() for more information. If @chain is found to be valid, then the ret... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_certificate_handle | `create_certificate_handle(certificate: TlsCertificate) -> utf8` |  | 2.30 | Create a handle string for the certificate. The database will only be able to create a handle for certificates that originate from the database. In... |
| lookup_certificate_for_handle | `lookup_certificate_for_handle(handle: utf8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?) -> TlsCertificate throws` |  | 2.30 | Look up a certificate by its handle. The handle should have been created by calling g_tls_database_create_certificate_handle() on a #GTlsDatabase o... |
| lookup_certificate_for_handle_async | `lookup_certificate_for_handle_async(handle: utf8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.30 | Asynchronously look up a certificate by its handle in the database. See g_tls_database_lookup_certificate_for_handle() for more information. |
| lookup_certificate_for_handle_finish | `lookup_certificate_for_handle_finish(result: AsyncResult) -> TlsCertificate throws` |  | 2.30 | Finish an asynchronous lookup of a certificate by its handle. See g_tls_database_lookup_certificate_for_handle() for more information. If the handl... |
| lookup_certificate_issuer | `lookup_certificate_issuer(certificate: TlsCertificate, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?) -> TlsCertificate throws` |  | 2.30 | Look up the issuer of @certificate in the database. The #GTlsCertificate:issuer property of @certificate is not modified, and the two certificates ... |
| lookup_certificate_issuer_async | `lookup_certificate_issuer_async(certificate: TlsCertificate, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.30 | Asynchronously look up the issuer of @certificate in the database. See g_tls_database_lookup_certificate_issuer() for more information. |
| lookup_certificate_issuer_finish | `lookup_certificate_issuer_finish(result: AsyncResult) -> TlsCertificate throws` |  | 2.30 | Finish an asynchronous lookup issuer operation. See g_tls_database_lookup_certificate_issuer() for more information. |
| lookup_certificates_issued_by | `lookup_certificates_issued_by(issuer_raw_dn: guint8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?) -> GLib.List throws` |  | 2.30 | Look up certificates issued by this issuer in the database. This function can block, use g_tls_database_lookup_certificates_issued_by_async() to pe... |
| lookup_certificates_issued_by_async | `lookup_certificates_issued_by_async(issuer_raw_dn: guint8, interaction: TlsInteraction?, flags: TlsDatabaseLookupFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.30 | Asynchronously look up certificates issued by this issuer in the database. See g_tls_database_lookup_certificates_issued_by() for more information.... |
| lookup_certificates_issued_by_finish | `lookup_certificates_issued_by_finish(result: AsyncResult) -> GLib.List throws` |  | 2.30 | Finish an asynchronous lookup of certificates. See g_tls_database_lookup_certificates_issued_by() for more information. |
| verify_chain | `verify_chain(chain: TlsCertificate, purpose: utf8, identity: SocketConnectable?, interaction: TlsInteraction?, flags: TlsDatabaseVerifyFlags, cancellable: Cancellable?) -> TlsCertificateFlags throws` |  | 2.30 | Determines the validity of a certificate chain, outside the context of a TLS session. @chain is a chain of #GTlsCertificate objects each pointing t... |
| verify_chain_async | `verify_chain_async(chain: TlsCertificate, purpose: utf8, identity: SocketConnectable?, interaction: TlsInteraction?, flags: TlsDatabaseVerifyFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.30 | Asynchronously determines the validity of a certificate chain after looking up and adding any missing certificates to the chain. See g_tls_database... |
| verify_chain_finish | `verify_chain_finish(result: AsyncResult) -> TlsCertificateFlags throws` |  | 2.30 | Finish an asynchronous verify chain operation. See g_tls_database_verify_chain() for more information. If @chain is found to be valid, then the ret... |

### Gio.TlsInteraction

Parent: `GObject.Object` ?? GType: `GTlsInteraction` ?? C type: `GTlsInteraction`

`GTlsInteraction` provides a mechanism for the TLS connection and database code to interact with the user. It can be used to ask the user for passw...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | TlsInteractionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ask_password | `TlsInteraction.ask_password(password: TlsPassword, cancellable: Cancellable?) -> TlsInteractionResult throws` | g_tls_interaction_ask_password | 2.30 | Run synchronous interaction to ask the user for a password. In general, g_tls_interaction_invoke_ask_password() should be used instead of this func... |
| ask_password_async | `TlsInteraction.ask_password_async(password: TlsPassword, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_interaction_ask_password_async | 2.30 | Run asynchronous interaction to ask the user for a password. In general, g_tls_interaction_invoke_ask_password() should be used instead of this fun... |
| ask_password_finish | `TlsInteraction.ask_password_finish(result: AsyncResult) -> TlsInteractionResult throws` | g_tls_interaction_ask_password_finish | 2.30 | Complete an ask password user interaction request. This should be once the g_tls_interaction_ask_password_async() completion callback is called. If... |
| invoke_ask_password | `TlsInteraction.invoke_ask_password(password: TlsPassword, cancellable: Cancellable?) -> TlsInteractionResult throws` | g_tls_interaction_invoke_ask_password | 2.30 | Invoke the interaction to ask the user for a password. It invokes this interaction in the main loop, specifically the #GMainContext returned by g_m... |
| invoke_request_certificate | `TlsInteraction.invoke_request_certificate(connection: TlsConnection, flags: TlsCertificateRequestFlags, cancellable: Cancellable?) -> TlsInteractionResult throws` | g_tls_interaction_invoke_request_certificate | 2.40 | Invoke the interaction to ask the user to choose a certificate to use with the connection. It invokes this interaction in the main loop, specifical... |
| request_certificate | `TlsInteraction.request_certificate(connection: TlsConnection, flags: TlsCertificateRequestFlags, cancellable: Cancellable?) -> TlsInteractionResult throws` | g_tls_interaction_request_certificate | 2.40 | Run synchronous interaction to ask the user to choose a certificate to use with the connection. In general, g_tls_interaction_invoke_request_certif... |
| request_certificate_async | `TlsInteraction.request_certificate_async(connection: TlsConnection, flags: TlsCertificateRequestFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_tls_interaction_request_certificate_async | 2.40 | Run asynchronous interaction to ask the user for a certificate to use with the connection. In general, g_tls_interaction_invoke_request_certificate... |
| request_certificate_finish | `TlsInteraction.request_certificate_finish(result: AsyncResult) -> TlsInteractionResult throws` | g_tls_interaction_request_certificate_finish | 2.40 | Complete a request certificate user interaction request. This should be once the g_tls_interaction_request_certificate_async() completion callback ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ask_password | `ask_password(password: TlsPassword, cancellable: Cancellable?) -> TlsInteractionResult throws` |  | 2.30 | Run synchronous interaction to ask the user for a password. In general, g_tls_interaction_invoke_ask_password() should be used instead of this func... |
| ask_password_async | `ask_password_async(password: TlsPassword, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.30 | Run asynchronous interaction to ask the user for a password. In general, g_tls_interaction_invoke_ask_password() should be used instead of this fun... |
| ask_password_finish | `ask_password_finish(result: AsyncResult) -> TlsInteractionResult throws` |  | 2.30 | Complete an ask password user interaction request. This should be once the g_tls_interaction_ask_password_async() completion callback is called. If... |
| request_certificate | `request_certificate(connection: TlsConnection, flags: TlsCertificateRequestFlags, cancellable: Cancellable?) -> TlsInteractionResult throws` |  | 2.40 | Run synchronous interaction to ask the user to choose a certificate to use with the connection. In general, g_tls_interaction_invoke_request_certif... |
| request_certificate_async | `request_certificate_async(connection: TlsConnection, flags: TlsCertificateRequestFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.40 | Run asynchronous interaction to ask the user for a certificate to use with the connection. In general, g_tls_interaction_invoke_request_certificate... |
| request_certificate_finish | `request_certificate_finish(result: AsyncResult) -> TlsInteractionResult throws` |  | 2.40 | Complete a request certificate user interaction request. This should be once the g_tls_interaction_request_certificate_async() completion callback ... |

### Gio.TlsPassword

Parent: `GObject.Object` ?? GType: `GTlsPassword` ?? C type: `GTlsPassword`

An abstract interface representing a password used in TLS. Often used in user interaction such as unlocking a key storage token.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | TlsPasswordPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `TlsPassword.new(flags: TlsPasswordFlags, description: utf8) -> TlsPassword` | g_tls_password_new |  | Create a new #GTlsPassword object. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_description | `TlsPassword.get_description() -> utf8` | g_tls_password_get_description | 2.30 | Get a description string about what the password will be used for. |
| get_flags | `TlsPassword.get_flags() -> TlsPasswordFlags` | g_tls_password_get_flags | 2.30 | Get flags about the password. |
| get_value | `TlsPassword.get_value(length: out gsize?) -> guint8` | g_tls_password_get_value | 2.30 | Get the password value. If @length is not %NULL then it will be filled in with the length of the password value. (Note that the password value is n... |
| get_warning | `TlsPassword.get_warning() -> utf8` | g_tls_password_get_warning | 2.30 | Get a user readable translated warning. Usually this warning is a representation of the password flags returned from g_tls_password_get_flags(). |
| set_description | `TlsPassword.set_description(description: utf8) -> none` | g_tls_password_set_description | 2.30 | Set a description string about what the password will be used for. |
| set_flags | `TlsPassword.set_flags(flags: TlsPasswordFlags) -> none` | g_tls_password_set_flags | 2.30 | Set flags about the password. |
| set_value | `TlsPassword.set_value(value: guint8, length: gssize) -> none` | g_tls_password_set_value | 2.30 | Set the value for this password. The @value will be copied by the password object. Specify the @length, for a non-nul-terminated password. Pass -1 ... |
| set_value_full | `TlsPassword.set_value_full(value: guint8, length: gssize, destroy: GLib.DestroyNotify?) -> none` | g_tls_password_set_value_full | 2.30 | Provide the value for this password. The @value will be owned by the password object, and later freed using the @destroy function callback. Specify... |
| set_warning | `TlsPassword.set_warning(warning: utf8) -> none` | g_tls_password_set_warning | 2.30 | Set a user readable translated warning. Usually this warning is a representation of the password flags returned from g_tls_password_get_flags(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| description | utf8 | read, write | Description of what the password is for. |
| flags | TlsPasswordFlags | read, write | Flags about the password. |
| warning | utf8 | read, write | Warning about the password. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_warning | `get_default_warning() -> utf8` |  |  | virtual method for g_tls_password_get_warning() if no value has been set using g_tls_password_set_warning() |
| get_value | `get_value(length: out gsize?) -> guint8` |  | 2.30 | Get the password value. If @length is not %NULL then it will be filled in with the length of the password value. (Note that the password value is n... |
| set_value | `set_value(value: guint8, length: gssize, destroy: GLib.DestroyNotify?) -> none` |  | 2.30 | Provide the value for this password. The @value will be owned by the password object, and later freed using the @destroy function callback. Specify... |

### Gio.UnixConnection

Parent: `SocketConnection` ?? GType: `GUnixConnection` ?? C type: `GUnixConnection`

This is the subclass of [class@Gio.SocketConnection] that is created for UNIX domain sockets. It contains functions to do some of the UNIX socket s...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketConnection |
| priv | UnixConnectionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| receive_credentials | `UnixConnection.receive_credentials(cancellable: Cancellable?) -> Credentials throws` | g_unix_connection_receive_credentials | 2.26 | Receives credentials from the sending end of the connection. The sending end has to call g_unix_connection_send_credentials() (or similar) for this... |
| receive_credentials_async | `UnixConnection.receive_credentials_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_unix_connection_receive_credentials_async | 2.32 | Asynchronously receive credentials. For more details, see g_unix_connection_receive_credentials() which is the synchronous version of this call. Wh... |
| receive_credentials_finish | `UnixConnection.receive_credentials_finish(result: AsyncResult) -> Credentials throws` | g_unix_connection_receive_credentials_finish | 2.32 | Finishes an asynchronous receive credentials operation started with g_unix_connection_receive_credentials_async(). |
| receive_fd | `UnixConnection.receive_fd(cancellable: Cancellable?) -> gint throws` | g_unix_connection_receive_fd | 2.22 | Receives a file descriptor from the sending end of the connection. The sending end has to call g_unix_connection_send_fd() for this to work. As wel... |
| send_credentials | `UnixConnection.send_credentials(cancellable: Cancellable?) -> gboolean throws` | g_unix_connection_send_credentials | 2.26 | Passes the credentials of the current user the receiving side of the connection. The receiving end has to call g_unix_connection_receive_credential... |
| send_credentials_async | `UnixConnection.send_credentials_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_unix_connection_send_credentials_async | 2.32 | Asynchronously send credentials. For more details, see g_unix_connection_send_credentials() which is the synchronous version of this call. When the... |
| send_credentials_finish | `UnixConnection.send_credentials_finish(result: AsyncResult) -> gboolean throws` | g_unix_connection_send_credentials_finish | 2.32 | Finishes an asynchronous send credentials operation started with g_unix_connection_send_credentials_async(). |
| send_fd | `UnixConnection.send_fd(fd: gint, cancellable: Cancellable?) -> gboolean throws` | g_unix_connection_send_fd | 2.22 | Passes a file descriptor to the receiving side of the connection. The receiving end has to call g_unix_connection_receive_fd() to accept the file d... |

### Gio.UnixCredentialsMessage

Parent: `SocketControlMessage` ?? GType: `GUnixCredentialsMessage` ?? C type: `GUnixCredentialsMessage`

This [class@Gio.SocketControlMessage] contains a [class@Gio.Credentials] instance. It may be sent using [method@Gio.Socket.send_message] and receiv...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketControlMessage |
| priv | UnixCredentialsMessagePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixCredentialsMessage.new() -> SocketControlMessage` | g_unix_credentials_message_new | 2.26 | Creates a new #GUnixCredentialsMessage with credentials matching the current processes. |
| new_with_credentials | `UnixCredentialsMessage.new_with_credentials(credentials: Credentials) -> SocketControlMessage` | g_unix_credentials_message_new_with_credentials | 2.26 | Creates a new #GUnixCredentialsMessage holding @credentials. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_supported | `is_supported() -> gboolean` | g_unix_credentials_message_is_supported | 2.26 | Checks if passing #GCredentials on a #GSocket is supported on this platform. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_credentials | `UnixCredentialsMessage.get_credentials() -> Credentials` | g_unix_credentials_message_get_credentials | 2.26 | Gets the credentials stored in @message. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| credentials | Credentials | read, write, construct-only | The credentials stored in the message. |

### Gio.UnixFDList

Parent: `GObject.Object` ?? GType: `GUnixFDList` ?? C type: `GUnixFDList`

A `GUnixFDList` contains a list of file descriptors. It owns the file descriptors that it contains, closing them when finalized. It may be wrapped ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | UnixFDListPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixFDList.new() -> UnixFDList` | g_unix_fd_list_new | 2.24 | Creates a new #GUnixFDList containing no file descriptors. |
| new_from_array | `UnixFDList.new_from_array(fds: gint, n_fds: gint) -> UnixFDList` | g_unix_fd_list_new_from_array | 2.24 | Creates a new #GUnixFDList containing the file descriptors given in @fds. The file descriptors become the property of the new list and may no longe... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `UnixFDList.append(fd: gint) -> gint throws` | g_unix_fd_list_append | 2.24 | Adds a file descriptor to @list. The file descriptor is duplicated using dup(). You keep your copy of the descriptor and the copy contained in @lis... |
| get | `UnixFDList.get(index_: gint) -> gint throws` | g_unix_fd_list_get | 2.24 | Gets a file descriptor out of @list. @index_ specifies the index of the file descriptor to get. It is a programmer error for @index_ to be out of r... |
| get_length | `UnixFDList.get_length() -> gint` | g_unix_fd_list_get_length | 2.24 | Gets the length of @list (ie: the number of file descriptors contained within). |
| peek_fds | `UnixFDList.peek_fds(length: out gint?) -> gint` | g_unix_fd_list_peek_fds | 2.24 | Returns the array of file descriptors that is contained in this object. After this call, the descriptors remain the property of @list. The caller m... |
| steal_fds | `UnixFDList.steal_fds(length: out gint?) -> gint` | g_unix_fd_list_steal_fds | 2.24 | Returns the array of file descriptors that is contained in this object. After this call, the descriptors are no longer contained in @list. Further ... |

### Gio.UnixFDMessage

Parent: `SocketControlMessage` ?? GType: `GUnixFDMessage` ?? C type: `GUnixFDMessage`

This [class@Gio.SocketControlMessage] contains a [class@Gio.UnixFDList]. It may be sent using [method@Gio.Socket.send_message] and received using [...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketControlMessage |
| priv | UnixFDMessagePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixFDMessage.new() -> SocketControlMessage` | g_unix_fd_message_new | 2.22 | Creates a new #GUnixFDMessage containing an empty file descriptor list. |
| new_with_fd_list | `UnixFDMessage.new_with_fd_list(fd_list: UnixFDList) -> SocketControlMessage` | g_unix_fd_message_new_with_fd_list | 2.24 | Creates a new #GUnixFDMessage containing @list. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_fd | `UnixFDMessage.append_fd(fd: gint) -> gboolean throws` | g_unix_fd_message_append_fd | 2.22 | Adds a file descriptor to @message. The file descriptor is duplicated using dup(). You keep your copy of the descriptor and the copy contained in @... |
| get_fd_list | `UnixFDMessage.get_fd_list() -> UnixFDList` | g_unix_fd_message_get_fd_list | 2.24 | Gets the #GUnixFDList contained in @message. This function does not return a reference to the caller, but the returned list is valid for the lifeti... |
| steal_fds | `UnixFDMessage.steal_fds(length: out gint?) -> gint` | g_unix_fd_message_steal_fds | 2.22 | Returns the array of file descriptors that is contained in this object. After this call, the descriptors are no longer contained in @message. Furth... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fd-list | UnixFDList | read, write, construct-only | The [class@Gio.UnixFDList] object to send with the message. |

### Gio.UnixInputStream

Parent: `InputStream` ?? Implements: `FileDescriptorBased`, `PollableInputStream` ?? GType: `GUnixInputStream` ?? C type: `GUnixInputStream`

`GUnixInputStream` implements [class@Gio.InputStream] for reading from a UNIX file descriptor, including asynchronous operations. (If the file desc...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | InputStream |
| priv | UnixInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixInputStream.new(fd: gint, close_fd: gboolean) -> InputStream` | g_unix_input_stream_new |  | Creates a new #GUnixInputStream for the given @fd. If @close_fd is %TRUE, the file descriptor will be closed when the stream is closed. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_close_fd | `UnixInputStream.get_close_fd() -> gboolean` | g_unix_input_stream_get_close_fd | 2.20 | Returns whether the file descriptor of @stream will be closed when the stream is closed. |
| get_fd | `UnixInputStream.get_fd() -> gint` | g_unix_input_stream_get_fd | 2.20 | Return the UNIX file descriptor that the stream reads from. |
| set_close_fd | `UnixInputStream.set_close_fd(close_fd: gboolean) -> none` | g_unix_input_stream_set_close_fd | 2.20 | Sets whether the file descriptor of @stream shall be closed when the stream is closed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| close-fd | gboolean | read, write | Whether to close the file descriptor when the stream is closed. |
| fd | gint | read, write, construct-only | The file descriptor that the stream reads from. |

### Gio.UnixMountMonitor

Parent: `GObject.Object` ?? GType: `GUnixMountMonitor` ?? C type: `GUnixMountMonitor`

Watches #GUnixMounts for changes.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixMountMonitor.new() -> UnixMountMonitor` | g_unix_mount_monitor_new |  | Deprecated alias for g_unix_mount_monitor_get(). This function was never a true constructor, which is why it was renamed. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get() -> UnixMountMonitor` | g_unix_mount_monitor_get | 2.44 | Gets the #GUnixMountMonitor for the current thread-default main context. The mount monitor can be used to monitor for changes to the list of mounte... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_rate_limit | `UnixMountMonitor.set_rate_limit(limit_msec: gint) -> none` | g_unix_mount_monitor_set_rate_limit | 2.18 | This function does nothing. Before 2.44, this was a partially-effective way of controlling the rate at which events would be reported under some un... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| mountpoints-changed | `` | none | last |  | Emitted when the unix mount points have changed. |
| mounts-changed | `` | none | last |  | Emitted when the unix mounts have changed. |

### Gio.UnixOutputStream

Parent: `OutputStream` ?? Implements: `FileDescriptorBased`, `PollableOutputStream` ?? GType: `GUnixOutputStream` ?? C type: `GUnixOutputStream`

`GUnixOutputStream` implements [class@Gio.OutputStream] for writing to a UNIX file descriptor, including asynchronous operations. (If the file desc...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | OutputStream |
| priv | UnixOutputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixOutputStream.new(fd: gint, close_fd: gboolean) -> OutputStream` | g_unix_output_stream_new |  | Creates a new #GUnixOutputStream for the given @fd. If @close_fd, is %TRUE, the file descriptor will be closed when the output stream is destroyed. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_close_fd | `UnixOutputStream.get_close_fd() -> gboolean` | g_unix_output_stream_get_close_fd | 2.20 | Returns whether the file descriptor of @stream will be closed when the stream is closed. |
| get_fd | `UnixOutputStream.get_fd() -> gint` | g_unix_output_stream_get_fd | 2.20 | Return the UNIX file descriptor that the stream writes to. |
| set_close_fd | `UnixOutputStream.set_close_fd(close_fd: gboolean) -> none` | g_unix_output_stream_set_close_fd | 2.20 | Sets whether the file descriptor of @stream shall be closed when the stream is closed. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| close-fd | gboolean | read, write | Whether to close the file descriptor when the stream is closed. |
| fd | gint | read, write, construct-only | The file descriptor that the stream writes to. |

### Gio.UnixSocketAddress

Parent: `SocketAddress` ?? Implements: `SocketConnectable` ?? GType: `GUnixSocketAddress` ?? C type: `GUnixSocketAddress`

Support for UNIX-domain (also known as local) sockets, corresponding to `struct sockaddr_un`. UNIX domain sockets are generally visible in the file...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | SocketAddress |
| priv | UnixSocketAddressPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnixSocketAddress.new(path: utf8) -> SocketAddress` | g_unix_socket_address_new | 2.22 | Creates a new #GUnixSocketAddress for @path. To create abstract socket addresses, on systems that support that, use g_unix_socket_address_new_abstr... |
| new_abstract | `UnixSocketAddress.new_abstract(path: gchar, path_len: gint) -> SocketAddress` | g_unix_socket_address_new_abstract |  | Creates a new %G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED #GUnixSocketAddress for @path. |
| new_with_type | `UnixSocketAddress.new_with_type(path: gchar, path_len: gint, type: UnixSocketAddressType) -> SocketAddress` | g_unix_socket_address_new_with_type | 2.26 | Creates a new #GUnixSocketAddress of type @type with name @path. If @type is %G_UNIX_SOCKET_ADDRESS_PATH, this is equivalent to calling g_unix_sock... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| abstract_names_supported | `abstract_names_supported() -> gboolean` | g_unix_socket_address_abstract_names_supported | 2.22 | Checks if abstract UNIX domain socket names are supported. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_address_type | `UnixSocketAddress.get_address_type() -> UnixSocketAddressType` | g_unix_socket_address_get_address_type | 2.26 | Gets @address's type. |
| get_is_abstract | `UnixSocketAddress.get_is_abstract() -> gboolean` | g_unix_socket_address_get_is_abstract | 2.22 | Tests if @address is abstract. |
| get_path | `UnixSocketAddress.get_path() -> utf8` | g_unix_socket_address_get_path | 2.22 | Gets @address's path, or for abstract sockets the "name". Guaranteed to be zero-terminated, but an abstract socket may contain embedded zeros, and ... |
| get_path_len | `UnixSocketAddress.get_path_len() -> gsize` | g_unix_socket_address_get_path_len | 2.22 | Gets the length of @address's path. For details, see g_unix_socket_address_get_path(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| abstract | gboolean | read, write, construct-only | Whether or not this is an abstract address |
| address-type | UnixSocketAddressType | read, write, construct-only | The type of Unix socket address. |
| path | utf8 | read, write, construct-only | Unix socket path. |
| path-as-array | guint8 | read, write, construct-only | Unix socket path, as a byte array. |

### Gio.Vfs

Parent: `GObject.Object` ?? GType: `GVfs` ?? C type: `GVfs`

Entry point for using GIO functionality.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> Vfs` | g_vfs_get_default |  | Gets the default #GVfs for the system. |
| get_local | `get_local() -> Vfs` | g_vfs_get_local |  | Gets the local #GVfs for the system. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_file_for_path | `Vfs.get_file_for_path(path: utf8) -> File` | g_vfs_get_file_for_path |  | Gets a #GFile for @path. |
| get_file_for_uri | `Vfs.get_file_for_uri(uri: utf8) -> File` | g_vfs_get_file_for_uri |  | Gets a #GFile for @uri. This operation never fails, but the returned object might not support any I/O operation if the URI is malformed or if the U... |
| get_supported_uri_schemes | `Vfs.get_supported_uri_schemes() -> utf8` | g_vfs_get_supported_uri_schemes |  | Gets a list of URI schemes supported by @vfs. |
| is_active | `Vfs.is_active() -> gboolean` | g_vfs_is_active |  | Checks if the VFS is active. |
| parse_name | `Vfs.parse_name(parse_name: utf8) -> File` | g_vfs_parse_name |  | This operation never fails, but the returned object might not support any I/O operations if the @parse_name cannot be parsed by the #GVfs module. |
| register_uri_scheme | `Vfs.register_uri_scheme(scheme: utf8, uri_func: VfsFileLookupFunc?, uri_data: gpointer?, uri_destroy: GLib.DestroyNotify?, parse_name_func: VfsFileLookupFunc?, parse_name_data: gpointer?, parse_name_destroy: GLib.DestroyNotify?) -> gboolean` | g_vfs_register_uri_scheme | 2.50 | Registers @uri_func and @parse_name_func as the #GFile URI and parse name lookup functions for URIs with a scheme matching @scheme. Note that @sche... |
| unregister_uri_scheme | `Vfs.unregister_uri_scheme(scheme: utf8) -> gboolean` | g_vfs_unregister_uri_scheme | 2.50 | Unregisters the URI handler for @scheme previously registered with g_vfs_register_uri_scheme(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_writable_namespaces | `add_writable_namespaces(list: FileAttributeInfoList) -> none` |  |  |  |
| deserialize_icon | `deserialize_icon(value: GLib.Variant) -> Icon` |  |  |  |
| get_file_for_path | `get_file_for_path(path: utf8) -> File` |  |  | Gets a #GFile for @path. |
| get_file_for_uri | `get_file_for_uri(uri: utf8) -> File` |  |  | Gets a #GFile for @uri. This operation never fails, but the returned object might not support any I/O operation if the URI is malformed or if the U... |
| get_supported_uri_schemes | `get_supported_uri_schemes() -> utf8` |  |  | Gets a list of URI schemes supported by @vfs. |
| is_active | `is_active() -> gboolean` |  |  | Checks if the VFS is active. |
| local_file_add_info | `local_file_add_info(filename: utf8, device: guint64, attribute_matcher: FileAttributeMatcher, info: FileInfo, cancellable: Cancellable?, extra_data: gpointer?, free_extra_data: GLib.DestroyNotify) -> none` |  |  |  |
| local_file_moved | `local_file_moved(source: utf8, dest: utf8) -> none` |  |  |  |
| local_file_removed | `local_file_removed(filename: utf8) -> none` |  |  |  |
| local_file_set_attributes | `local_file_set_attributes(filename: utf8, info: FileInfo, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` |  |  |  |
| parse_name | `parse_name(parse_name: utf8) -> File` |  |  | This operation never fails, but the returned object might not support any I/O operations if the @parse_name cannot be parsed by the #GVfs module. |

### Gio.VolumeMonitor

Parent: `GObject.Object` ?? Subclasses: `NativeVolumeMonitor` ?? GType: `GVolumeMonitor` ?? C type: `GVolumeMonitor`

`GVolumeMonitor` is for listing the user interesting devices and volumes on the computer. In other words, what a file selector or file manager woul...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| adopt_orphan_mount | `adopt_orphan_mount(mount: Mount) -> Volume` | g_volume_monitor_adopt_orphan_mount |  | This function should be called by any #GVolumeMonitor implementation when a new #GMount object is created that is not associated with a #GVolume ob... |
| get | `get() -> VolumeMonitor` | g_volume_monitor_get |  | Gets the volume monitor used by gio. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_connected_drives | `VolumeMonitor.get_connected_drives() -> GLib.List` | g_volume_monitor_get_connected_drives |  | Gets a list of drives connected to the system. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_o... |
| get_mount_for_uuid | `VolumeMonitor.get_mount_for_uuid(uuid: utf8) -> Mount` | g_volume_monitor_get_mount_for_uuid |  | Finds a #GMount object by its UUID (see g_mount_get_uuid()) |
| get_mounts | `VolumeMonitor.get_mounts() -> GLib.List` | g_volume_monitor_get_mounts |  | Gets a list of the mounts on the system. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_object_... |
| get_volume_for_uuid | `VolumeMonitor.get_volume_for_uuid(uuid: utf8) -> Volume` | g_volume_monitor_get_volume_for_uuid |  | Finds a #GVolume object by its UUID (see g_volume_get_uuid()) |
| get_volumes | `VolumeMonitor.get_volumes() -> GLib.List` | g_volume_monitor_get_volumes |  | Gets a list of the volumes on the system. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_object... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| drive-changed | `drive: Drive` | none | last |  | Emitted when a drive changes. |
| drive-connected | `drive: Drive` | none | last |  | Emitted when a drive is connected to the system. |
| drive-disconnected | `drive: Drive` | none | last |  | Emitted when a drive is disconnected from the system. |
| drive-eject-button | `drive: Drive` | none | last | 2.18 | Emitted when the eject button is pressed on @drive. |
| drive-stop-button | `drive: Drive` | none | last | 2.22 | Emitted when the stop button is pressed on @drive. |
| mount-added | `mount: Mount` | none | last |  | Emitted when a mount is added. |
| mount-changed | `mount: Mount` | none | last |  | Emitted when a mount changes. |
| mount-pre-unmount | `mount: Mount` | none | last |  | May be emitted when a mount is about to be removed. This signal depends on the backend and is only emitted if GIO was used to unmount. |
| mount-removed | `mount: Mount` | none | last |  | Emitted when a mount is removed. |
| volume-added | `volume: Volume` | none | last |  | Emitted when a mountable volume is added to the system. |
| volume-changed | `volume: Volume` | none | last |  | Emitted when mountable volume is changed. |
| volume-removed | `volume: Volume` | none | last |  | Emitted when a mountable volume is removed from the system. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drive_changed | `drive_changed(drive: Drive) -> none` |  |  |  |
| drive_connected | `drive_connected(drive: Drive) -> none` |  |  |  |
| drive_disconnected | `drive_disconnected(drive: Drive) -> none` |  |  |  |
| drive_eject_button | `drive_eject_button(drive: Drive) -> none` |  |  |  |
| drive_stop_button | `drive_stop_button(drive: Drive) -> none` |  |  |  |
| get_connected_drives | `get_connected_drives() -> GLib.List` |  |  | Gets a list of drives connected to the system. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_o... |
| get_mount_for_uuid | `get_mount_for_uuid(uuid: utf8) -> Mount` |  |  | Finds a #GMount object by its UUID (see g_mount_get_uuid()) |
| get_mounts | `get_mounts() -> GLib.List` |  |  | Gets a list of the mounts on the system. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_object_... |
| get_volume_for_uuid | `get_volume_for_uuid(uuid: utf8) -> Volume` |  |  | Finds a #GVolume object by its UUID (see g_volume_get_uuid()) |
| get_volumes | `get_volumes() -> GLib.List` |  |  | Gets a list of the volumes on the system. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_object... |
| mount_added | `mount_added(mount: Mount) -> none` |  |  |  |
| mount_changed | `mount_changed(mount: Mount) -> none` |  |  |  |
| mount_pre_unmount | `mount_pre_unmount(mount: Mount) -> none` |  |  |  |
| mount_removed | `mount_removed(mount: Mount) -> none` |  |  |  |
| volume_added | `volume_added(volume: Volume) -> none` |  |  |  |
| volume_changed | `volume_changed(volume: Volume) -> none` |  |  |  |
| volume_removed | `volume_removed(volume: Volume) -> none` |  |  |  |

### Gio.ZlibCompressor

Parent: `GObject.Object` ?? Implements: `Converter` ?? GType: `GZlibCompressor` ?? C type: `GZlibCompressor`

`GZlibCompressor` is an implementation of [iface@Gio.Converter] that compresses data using zlib.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ZlibCompressor.new(format: ZlibCompressorFormat, level: gint) -> ZlibCompressor` | g_zlib_compressor_new | 2.24 | Creates a new #GZlibCompressor. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_file_info | `ZlibCompressor.get_file_info() -> FileInfo` | g_zlib_compressor_get_file_info | 2.26 | Returns the #GZlibCompressor:file-info property. |
| set_file_info | `ZlibCompressor.set_file_info(file_info: FileInfo?) -> none` | g_zlib_compressor_set_file_info | 2.26 | Sets @file_info in @compressor. If non-%NULL, and @compressor's #GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP, it will be used... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| file-info | FileInfo | read, write | If set to a non-%NULL #GFileInfo object, and #GZlibCompressor:format is %G_ZLIB_COMPRESSOR_FORMAT_GZIP, the compressor will write the file name and... |
| format | ZlibCompressorFormat | read, write, construct-only | The format of the compressed data. |
| level | gint | read, write, construct-only | The level of compression from `0` (no compression) to `9` (most compression). `-1` for the default level. |

### Gio.ZlibDecompressor

Parent: `GObject.Object` ?? Implements: `Converter` ?? GType: `GZlibDecompressor` ?? C type: `GZlibDecompressor`

`GZlibDecompressor` is an implementation of [iface@Gio.Converter] that decompresses data compressed with zlib.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ZlibDecompressor.new(format: ZlibCompressorFormat) -> ZlibDecompressor` | g_zlib_decompressor_new | 2.24 | Creates a new #GZlibDecompressor. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_file_info | `ZlibDecompressor.get_file_info() -> FileInfo` | g_zlib_decompressor_get_file_info | 2.26 | Retrieves the #GFileInfo constructed from the GZIP header data of compressed data processed by @compressor, or %NULL if @decompressor's #GZlibDecom... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| file-info | FileInfo | read | A #GFileInfo containing the information found in the GZIP header of the data stream processed, or %NULL if the header was not yet fully processed, ... |
| format | ZlibCompressorFormat | read, write, construct-only | The format of the compressed data. |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Action |  | 0 | 0 | 11 | `GAction` represents a single named action. The main interface to an action is that it can be activated with [method@Gio.Action.activate]. This res... |
| ActionGroup |  | 0 | 4 | 14 | `GActionGroup` represents a group of actions. Actions can be used to expose functionality in a structured way, either from one part of a program to... |
| ActionMap |  | 0 | 0 | 5 | `GActionMap` is an interface for action containers. The `GActionMap` interface is implemented by [iface@Gio.ActionGroup] implementations that opera... |
| AppInfo |  | 0 | 0 | 40 | Information about an installed application and methods to launch it (with file arguments). `GAppInfo` and `GAppLaunchContext` are used for describi... |
| AsyncInitable |  | 0 | 0 | 6 | `GAsyncInitable` is an interface for asynchronously initializable objects. This is the asynchronous version of [iface@Gio.Initable]; it behaves the... |
| AsyncResult |  | 0 | 0 | 4 | `GAsyncResult` provides a base class for implementing asynchronous function results. Asynchronous operations are broken up into two separate operat... |
| Converter |  | 0 | 0 | 2 | `GConverter` is an interface for streaming conversions. `GConverter` is implemented by objects that convert binary data in various ways. The conver... |
| DatagramBased |  | 0 | 0 | 5 | Interface for socket-like objects with datagram semantics. A `GDatagramBased` is a networking interface for representing datagram-based communicati... |
| DBusInterface |  | 0 | 0 | 4 | Base type for D-Bus interfaces. The `GDBusInterface` type is the base type for D-Bus interfaces both on the service side (see [class@Gio.DBusInterf... |
| DBusObject |  | 0 | 2 | 3 | The `GDBusObject` type is the base type for D-Bus objects on both the service side (see [class@Gio.DBusObjectSkeleton]) and the client side (see [c... |
| DBusObjectManager |  | 0 | 4 | 4 | The `GDBusObjectManager` type is the base type for service- and client-side implementations of the standardized `org.freedesktop.DBus.ObjectManager... |
| DebugController |  | 0 | 0 | 2 | `GDebugController` is an interface to expose control of debugging features and debug output. It is implemented on Linux using [class@Gio.DebugContr... |
| DesktopAppInfoLookup |  | 0 | 0 | 1 | #GDesktopAppInfoLookup is an opaque data structure and can only be accessed using the following functions. |
| Drive |  | 0 | 4 | 28 | `GDrive` represents a piece of hardware connected to the machine. It???s generally only created for removable hardware or hardware with removable m... |
| DtlsClientConnection |  | 0 | 0 | 6 | `GDtlsClientConnection` is the client-side subclass of [iface@Gio.DtlsConnection], representing a client-side DTLS connection. |
| DtlsConnection |  | 0 | 1 | 27 | `GDtlsConnection` is the base DTLS connection class type, which wraps a [iface@Gio.DatagramBased] and provides DTLS encryption on top of it. Its su... |
| DtlsServerConnection |  | 0 | 0 | 1 | `GDtlsServerConnection` is the server-side subclass of [iface@Gio.DtlsConnection], representing a server-side DTLS connection. |
| File |  | 0 | 0 | 141 | `GFile` is a high level abstraction for manipulating files on a virtual file system. `GFile`s are lightweight, immutable objects that do no I/O upo... |
| FileDescriptorBased |  | 0 | 0 | 1 | `GFileDescriptorBased` is an interface for file descriptor based IO. It is implemented by streams (implementations of [class@Gio.InputStream] or [c... |
| Icon |  | 0 | 0 | 6 | `GIcon` is a very minimal interface for icons. It provides functions for checking the equality of two icons, hashing of icons and serializing an ic... |
| Initable |  | 0 | 0 | 4 | `GInitable` is implemented by objects that can fail during initialization. If an object implements this interface then it must be initialized as th... |
| ListModel |  | 0 | 1 | 5 | `GListModel` is an interface that represents a mutable list of [class@GObject.Object]. Its main intention is as a model for various widgets in user... |
| LoadableIcon |  | 0 | 0 | 3 | `GLoadableIcon` extends the [iface@Gio.Icon] interface and adds the ability to load icons from streams. |
| MemoryMonitor |  | 0 | 1 | 1 | `GMemoryMonitor` will monitor system memory and suggest to the application when to free memory so as to leave more room for other applications. It ... |
| Mount |  | 0 | 3 | 27 | The `GMount` interface represents user-visible mounts. Note, when porting from GnomeVFS, `GMount` is the moral equivalent of `GnomeVFSVolume`. `GMo... |
| NetworkMonitor |  | 0 | 1 | 7 | `GNetworkMonitor` provides an easy-to-use cross-platform API for monitoring network connectivity. On Linux, the available implementations are based... |
| PollableInputStream |  | 0 | 0 | 4 | `GPollableInputStream` is implemented by [class@Gio.InputStream]s that can be polled for readiness to read. This can be used when interfacing with ... |
| PollableOutputStream |  | 0 | 0 | 5 | `GPollableOutputStream` is implemented by [class@Gio.OutputStream]s that can be polled for readiness to write. This can be used when interfacing wi... |
| PowerProfileMonitor |  | 0 | 0 | 2 | `GPowerProfileMonitor` makes it possible for applications as well as OS components to monitor system power profiles and act upon them. It currently... |
| Proxy |  | 0 | 0 | 5 | A `GProxy` handles connecting to a remote host via a given type of proxy server. It is implemented by the `gio-proxy` extension point. The extensio... |
| ProxyResolver |  | 0 | 0 | 5 | `GProxyResolver` provides synchronous and asynchronous network proxy resolution. `GProxyResolver` is used within [class@Gio.SocketClient] through t... |
| RemoteActionGroup |  | 0 | 0 | 2 | The `GRemoteActionGroup` interface is implemented by [iface@Gio.ActionGroup] instances that either transmit action invocations to other processes o... |
| Seekable |  | 0 | 0 | 5 | `GSeekable` is implemented by streams (implementations of [class@Gio.InputStream] or [class@Gio.OutputStream]) that support seeking. Seekable strea... |
| SocketConnectable |  | 0 | 0 | 3 | Objects that describe one or more potential socket endpoints implement `GSocketConnectable`. Callers can then use [method@Gio.SocketConnectable.enu... |
| TlsBackend |  | 0 | 0 | 11 | TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an internal type used to coordinate the different classes implemented by a TLS ba... |
| TlsClientConnection |  | 0 | 0 | 9 | `GTlsClientConnection` is the client-side subclass of [class@Gio.TlsConnection], representing a client-side TLS connection. |
| TlsFileDatabase |  | 0 | 0 | 1 | `GTlsFileDatabase` is implemented by [class@Gio.TlsDatabase] objects which load their certificate information from a file. It is an interface which... |
| TlsServerConnection |  | 0 | 0 | 1 | `GTlsServerConnection` is the server-side subclass of [class@Gio.TlsConnection], representing a server-side TLS connection. |
| Volume |  | 0 | 2 | 19 | The `GVolume` interface represents user-visible objects that can be mounted. Note, when porting from GnomeVFS, `GVolume` is the moral equivalent of... |

### Gio.Action

GType: `GAction` ?? C type: `GAction`

`GAction` represents a single named action. The main interface to an action is that it can be activated with [method@Gio.Action.activate]. This res...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| name_is_valid | `name_is_valid(action_name: utf8) -> gboolean` | g_action_name_is_valid | 2.38 | Checks if @action_name is valid. @action_name is valid if it consists only of alphanumeric characters, plus '-' and '.'. The empty string is not a ... |
| parse_detailed_name | `parse_detailed_name(detailed_name: utf8, action_name: out utf8?, target_value: out GLib.Variant?) -> gboolean throws` | g_action_parse_detailed_name | 2.38 | Parses a detailed action name into its separate name and target components. Detailed action names can have three formats. The first format is used ... |
| print_detailed_name | `print_detailed_name(action_name: utf8, target_value: GLib.Variant?) -> utf8` | g_action_print_detailed_name | 2.38 | Formats a detailed action name from @action_name and @target_value. It is an error to call this function with an invalid action name. This function... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `Action.activate(parameter: GLib.Variant?) -> none` | g_action_activate | 2.28 | Activates the action. @parameter must be the correct type of parameter for the action (ie: the parameter type given at construction time). If the p... |
| change_state | `Action.change_state(value: GLib.Variant) -> none` | g_action_change_state | 2.30 | Request for the state of @action to be changed to @value. The action must be stateful and @value must be of the correct type. See g_action_get_stat... |
| get_enabled | `Action.get_enabled() -> gboolean` | g_action_get_enabled | 2.28 | Checks if @action is currently enabled. An action must be enabled in order to be activated or in order to have its state changed from outside callers. |
| get_name | `Action.get_name() -> utf8` | g_action_get_name | 2.28 | Queries the name of @action. |
| get_parameter_type | `Action.get_parameter_type() -> GLib.VariantType` | g_action_get_parameter_type | 2.28 | Queries the type of the parameter that must be given when activating @action. When activating the action using g_action_activate(), the #GVariant g... |
| get_state | `Action.get_state() -> GLib.Variant` | g_action_get_state | 2.28 | Queries the current state of @action. If the action is not stateful then %NULL will be returned. If the action is stateful then the type of the ret... |
| get_state_hint | `Action.get_state_hint() -> GLib.Variant` | g_action_get_state_hint | 2.28 | Requests a hint about the valid range of values for the state of @action. If %NULL is returned it either means that the action is not stateful or t... |
| get_state_type | `Action.get_state_type() -> GLib.VariantType` | g_action_get_state_type | 2.28 | Queries the type of the state of @action. If the action is stateful (e.g. created with g_simple_action_new_stateful()) then this function returns t... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enabled | gboolean | read | If @action is currently enabled. If the action is disabled then calls to g_action_activate() and g_action_change_state() have no effect. |
| name | utf8 | read | The name of the action. This is mostly meaningful for identifying the action once it has been added to a #GActionGroup. It is immutable. |
| parameter-type | GLib.VariantType | read | The type of the parameter that must be given when activating the action. This is immutable, and may be %NULL if no parameter is needed when activat... |
| state | GLib.Variant | read | The state of the action, or %NULL if the action is stateless. |
| state-type | GLib.VariantType | read | The #GVariantType of the state that the action has, or %NULL if the action is stateless. This is immutable. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate | `activate(parameter: GLib.Variant?) -> none` |  | 2.28 | Activates the action. @parameter must be the correct type of parameter for the action (ie: the parameter type given at construction time). If the p... |
| change_state | `change_state(value: GLib.Variant) -> none` |  | 2.30 | Request for the state of @action to be changed to @value. The action must be stateful and @value must be of the correct type. See g_action_get_stat... |
| get_enabled | `get_enabled() -> gboolean` |  | 2.28 | Checks if @action is currently enabled. An action must be enabled in order to be activated or in order to have its state changed from outside callers. |
| get_name | `get_name() -> utf8` |  | 2.28 | Queries the name of @action. |
| get_parameter_type | `get_parameter_type() -> GLib.VariantType` |  | 2.28 | Queries the type of the parameter that must be given when activating @action. When activating the action using g_action_activate(), the #GVariant g... |
| get_state | `get_state() -> GLib.Variant` |  | 2.28 | Queries the current state of @action. If the action is not stateful then %NULL will be returned. If the action is stateful then the type of the ret... |
| get_state_hint | `get_state_hint() -> GLib.Variant` |  | 2.28 | Requests a hint about the valid range of values for the state of @action. If %NULL is returned it either means that the action is not stateful or t... |
| get_state_type | `get_state_type() -> GLib.VariantType` |  | 2.28 | Queries the type of the state of @action. If the action is stateful (e.g. created with g_simple_action_new_stateful()) then this function returns t... |

### Gio.ActionGroup

GType: `GActionGroup` ?? C type: `GActionGroup`

`GActionGroup` represents a group of actions. Actions can be used to expose functionality in a structured way, either from one part of a program to...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| action_added | `ActionGroup.action_added(action_name: utf8) -> none` | g_action_group_action_added | 2.28 | Emits the #GActionGroup::action-added signal on @action_group. This function should only be called by #GActionGroup implementations. |
| action_enabled_changed | `ActionGroup.action_enabled_changed(action_name: utf8, enabled: gboolean) -> none` | g_action_group_action_enabled_changed | 2.28 | Emits the #GActionGroup::action-enabled-changed signal on @action_group. This function should only be called by #GActionGroup implementations. |
| action_removed | `ActionGroup.action_removed(action_name: utf8) -> none` | g_action_group_action_removed | 2.28 | Emits the #GActionGroup::action-removed signal on @action_group. This function should only be called by #GActionGroup implementations. |
| action_state_changed | `ActionGroup.action_state_changed(action_name: utf8, state: GLib.Variant) -> none` | g_action_group_action_state_changed | 2.28 | Emits the #GActionGroup::action-state-changed signal on @action_group. This function should only be called by #GActionGroup implementations. |
| activate_action | `ActionGroup.activate_action(action_name: utf8, parameter: GLib.Variant?) -> none` | g_action_group_activate_action | 2.28 | Activate the named action within @action_group. If the action is expecting a parameter, then the correct type of parameter must be given as @parame... |
| change_action_state | `ActionGroup.change_action_state(action_name: utf8, value: GLib.Variant) -> none` | g_action_group_change_action_state | 2.28 | Request for the state of the named action within @action_group to be changed to @value. The action must be stateful and @value must be of the corre... |
| get_action_enabled | `ActionGroup.get_action_enabled(action_name: utf8) -> gboolean` | g_action_group_get_action_enabled | 2.28 | Checks if the named action within @action_group is currently enabled. An action must be enabled in order to be activated or in order to have its st... |
| get_action_parameter_type | `ActionGroup.get_action_parameter_type(action_name: utf8) -> GLib.VariantType` | g_action_group_get_action_parameter_type | 2.28 | Queries the type of the parameter that must be given when activating the named action within @action_group. When activating the action using g_acti... |
| get_action_state | `ActionGroup.get_action_state(action_name: utf8) -> GLib.Variant` | g_action_group_get_action_state | 2.28 | Queries the current state of the named action within @action_group. If the action is not stateful then %NULL will be returned. If the action is sta... |
| get_action_state_hint | `ActionGroup.get_action_state_hint(action_name: utf8) -> GLib.Variant` | g_action_group_get_action_state_hint | 2.28 | Requests a hint about the valid range of values for the state of the named action within @action_group. If %NULL is returned it either means that t... |
| get_action_state_type | `ActionGroup.get_action_state_type(action_name: utf8) -> GLib.VariantType` | g_action_group_get_action_state_type | 2.28 | Queries the type of the state of the named action within @action_group. If the action is stateful then this function returns the #GVariantType of t... |
| has_action | `ActionGroup.has_action(action_name: utf8) -> gboolean` | g_action_group_has_action | 2.28 | Checks if the named action exists within @action_group. |
| list_actions | `ActionGroup.list_actions() -> utf8` | g_action_group_list_actions | 2.28 | Lists the actions contained within @action_group. The caller is responsible for freeing the list with g_strfreev() when it is no longer required. |
| query_action | `ActionGroup.query_action(action_name: utf8, enabled: out gboolean, parameter_type: out GLib.VariantType?, state_type: out GLib.VariantType?, state_hint: out GLib.Variant?, state: out GLib.Variant?) -> gboolean` | g_action_group_query_action | 2.32 | Queries all aspects of the named action within an @action_group. This function acquires the information available from g_action_group_has_action(),... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| action-added | `action_name: utf8` | none | last detailed | 2.28 | Signals that a new action was just added to the group. This signal is emitted after the action has been added and is now visible. |
| action-enabled-changed | `action_name: utf8, enabled: gboolean` | none | last detailed | 2.28 | Signals that the enabled status of the named action has changed. |
| action-removed | `action_name: utf8` | none | last detailed | 2.28 | Signals that an action is just about to be removed from the group. This signal is emitted before the action is removed, so the action is still visi... |
| action-state-changed | `action_name: utf8, value: GLib.Variant` | none | last detailed | 2.28 | Signals that the state of the named action has changed. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| action_added | `action_added(action_name: utf8) -> none` |  | 2.28 | Emits the #GActionGroup::action-added signal on @action_group. This function should only be called by #GActionGroup implementations. |
| action_enabled_changed | `action_enabled_changed(action_name: utf8, enabled: gboolean) -> none` |  | 2.28 | Emits the #GActionGroup::action-enabled-changed signal on @action_group. This function should only be called by #GActionGroup implementations. |
| action_removed | `action_removed(action_name: utf8) -> none` |  | 2.28 | Emits the #GActionGroup::action-removed signal on @action_group. This function should only be called by #GActionGroup implementations. |
| action_state_changed | `action_state_changed(action_name: utf8, state: GLib.Variant) -> none` |  | 2.28 | Emits the #GActionGroup::action-state-changed signal on @action_group. This function should only be called by #GActionGroup implementations. |
| activate_action | `activate_action(action_name: utf8, parameter: GLib.Variant?) -> none` |  | 2.28 | Activate the named action within @action_group. If the action is expecting a parameter, then the correct type of parameter must be given as @parame... |
| change_action_state | `change_action_state(action_name: utf8, value: GLib.Variant) -> none` |  | 2.28 | Request for the state of the named action within @action_group to be changed to @value. The action must be stateful and @value must be of the corre... |
| get_action_enabled | `get_action_enabled(action_name: utf8) -> gboolean` |  | 2.28 | Checks if the named action within @action_group is currently enabled. An action must be enabled in order to be activated or in order to have its st... |
| get_action_parameter_type | `get_action_parameter_type(action_name: utf8) -> GLib.VariantType` |  | 2.28 | Queries the type of the parameter that must be given when activating the named action within @action_group. When activating the action using g_acti... |
| get_action_state | `get_action_state(action_name: utf8) -> GLib.Variant` |  | 2.28 | Queries the current state of the named action within @action_group. If the action is not stateful then %NULL will be returned. If the action is sta... |
| get_action_state_hint | `get_action_state_hint(action_name: utf8) -> GLib.Variant` |  | 2.28 | Requests a hint about the valid range of values for the state of the named action within @action_group. If %NULL is returned it either means that t... |
| get_action_state_type | `get_action_state_type(action_name: utf8) -> GLib.VariantType` |  | 2.28 | Queries the type of the state of the named action within @action_group. If the action is stateful then this function returns the #GVariantType of t... |
| has_action | `has_action(action_name: utf8) -> gboolean` |  | 2.28 | Checks if the named action exists within @action_group. |
| list_actions | `list_actions() -> utf8` |  | 2.28 | Lists the actions contained within @action_group. The caller is responsible for freeing the list with g_strfreev() when it is no longer required. |
| query_action | `query_action(action_name: utf8, enabled: out gboolean, parameter_type: out GLib.VariantType?, state_type: out GLib.VariantType?, state_hint: out GLib.Variant?, state: out GLib.Variant?) -> gboolean` |  | 2.32 | Queries all aspects of the named action within an @action_group. This function acquires the information available from g_action_group_has_action(),... |

### Gio.ActionMap

GType: `GActionMap` ?? C type: `GActionMap`

`GActionMap` is an interface for action containers. The `GActionMap` interface is implemented by [iface@Gio.ActionGroup] implementations that opera...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_action | `ActionMap.add_action(action: Action) -> none` | g_action_map_add_action | 2.32 | Adds an action to the @action_map. If the action map already contains an action with the same name as @action then the old action is dropped from t... |
| add_action_entries | `ActionMap.add_action_entries(entries: ActionEntry, n_entries: gint, user_data: gpointer?) -> none` | g_action_map_add_action_entries | 2.32 | A convenience function for creating multiple #GSimpleAction instances and adding them to a #GActionMap. Each action is constructed as per one #GAct... |
| lookup_action | `ActionMap.lookup_action(action_name: utf8) -> Action` | g_action_map_lookup_action | 2.32 | Looks up the action with the name @action_name in @action_map. If no such action exists, returns %NULL. |
| remove_action | `ActionMap.remove_action(action_name: utf8) -> none` | g_action_map_remove_action | 2.32 | Removes the named action from the action map. If no action of this name is in the map then nothing happens. |
| remove_action_entries | `ActionMap.remove_action_entries(entries: ActionEntry, n_entries: gint) -> none` | g_action_map_remove_action_entries | 2.78 | Remove actions from a #GActionMap. This is meant as the reverse of g_action_map_add_action_entries(). \|[<!-- language="C" --> static const GActionE... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_action | `add_action(action: Action) -> none` |  | 2.32 | Adds an action to the @action_map. If the action map already contains an action with the same name as @action then the old action is dropped from t... |
| lookup_action | `lookup_action(action_name: utf8) -> Action` |  | 2.32 | Looks up the action with the name @action_name in @action_map. If no such action exists, returns %NULL. |
| remove_action | `remove_action(action_name: utf8) -> none` |  | 2.32 | Removes the named action from the action map. If no action of this name is in the map then nothing happens. |

### Gio.AppInfo

GType: `GAppInfo` ?? C type: `GAppInfo`

Information about an installed application and methods to launch it (with file arguments). `GAppInfo` and `GAppLaunchContext` are used for describi...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_from_commandline | `create_from_commandline(commandline: filename, application_name: utf8?, flags: AppInfoCreateFlags) -> AppInfo throws` | g_app_info_create_from_commandline |  | Creates a new #GAppInfo from the given information. Note that for @commandline, the quoting rules of the Exec key of the freedesktop.org Desktop En... |
| get_all | `get_all() -> GLib.List` | g_app_info_get_all |  | Gets a list of all of the applications currently registered on this system. For desktop files, this includes applications that have `NoDisplay=true... |
| get_all_for_type | `get_all_for_type(content_type: utf8) -> GLib.List` | g_app_info_get_all_for_type |  | Gets a list of all #GAppInfos for a given content type, including the recommended and fallback #GAppInfos. See g_app_info_get_recommended_for_type(... |
| get_default_for_type | `get_default_for_type(content_type: utf8, must_support_uris: gboolean) -> AppInfo` | g_app_info_get_default_for_type |  | Gets the default #GAppInfo for a given content type. |
| get_default_for_type_async | `get_default_for_type_async(content_type: utf8, must_support_uris: gboolean, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_get_default_for_type_async | 2.74 | Asynchronously gets the default #GAppInfo for a given content type. |
| get_default_for_type_finish | `get_default_for_type_finish(result: AsyncResult) -> AppInfo throws` | g_app_info_get_default_for_type_finish | 2.74 | Finishes a default #GAppInfo lookup started by g_app_info_get_default_for_type_async(). If no #GAppInfo is found, then @error will be set to %G_IO_... |
| get_default_for_uri_scheme | `get_default_for_uri_scheme(uri_scheme: utf8) -> AppInfo` | g_app_info_get_default_for_uri_scheme |  | Gets the default application for handling URIs with the given URI scheme. A URI scheme is the initial part of the URI, up to but not including the ... |
| get_default_for_uri_scheme_async | `get_default_for_uri_scheme_async(uri_scheme: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_get_default_for_uri_scheme_async | 2.74 | Asynchronously gets the default application for handling URIs with the given URI scheme. A URI scheme is the initial part of the URI, up to but not... |
| get_default_for_uri_scheme_finish | `get_default_for_uri_scheme_finish(result: AsyncResult) -> AppInfo throws` | g_app_info_get_default_for_uri_scheme_finish | 2.74 | Finishes a default #GAppInfo lookup started by g_app_info_get_default_for_uri_scheme_async(). If no #GAppInfo is found, then @error will be set to ... |
| get_fallback_for_type | `get_fallback_for_type(content_type: utf8) -> GLib.List` | g_app_info_get_fallback_for_type | 2.28 | Gets a list of fallback #GAppInfos for a given content type, i.e. those applications which claim to support the given content type by MIME type sub... |
| get_recommended_for_type | `get_recommended_for_type(content_type: utf8) -> GLib.List` | g_app_info_get_recommended_for_type | 2.28 | Gets a list of recommended #GAppInfos for a given content type, i.e. those applications which claim to support the given content type exactly, and ... |
| launch_default_for_uri | `launch_default_for_uri(uri: utf8, context: AppLaunchContext?) -> gboolean throws` | g_app_info_launch_default_for_uri |  | Utility function that launches the default application registered to handle the specified uri. Synchronous I/O is done on the uri to detect the typ... |
| launch_default_for_uri_async | `launch_default_for_uri_async(uri: utf8, context: AppLaunchContext?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_launch_default_for_uri_async | 2.50 | Async version of g_app_info_launch_default_for_uri(). This version is useful if you are interested in receiving error information in the case where... |
| launch_default_for_uri_finish | `launch_default_for_uri_finish(result: AsyncResult) -> gboolean throws` | g_app_info_launch_default_for_uri_finish | 2.50 | Finishes an asynchronous launch-default-for-uri operation. |
| reset_type_associations | `reset_type_associations(content_type: utf8) -> none` | g_app_info_reset_type_associations | 2.20 | Removes all changes to the type associations done by g_app_info_set_as_default_for_type(), g_app_info_set_as_default_for_extension(), g_app_info_ad... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_supports_type | `AppInfo.add_supports_type(content_type: utf8) -> gboolean throws` | g_app_info_add_supports_type |  | Adds a content type to the application information to indicate the application is capable of opening files with the given content type. |
| can_delete | `AppInfo.can_delete() -> gboolean` | g_app_info_can_delete | 2.20 | Obtains the information whether the #GAppInfo can be deleted. See g_app_info_delete(). |
| can_remove_supports_type | `AppInfo.can_remove_supports_type() -> gboolean` | g_app_info_can_remove_supports_type |  | Checks if a supported content type can be removed from an application. |
| delete | `AppInfo.delete() -> gboolean` | g_app_info_delete | 2.20 | Tries to delete a #GAppInfo. On some platforms, there may be a difference between user-defined #GAppInfos which can be deleted, and system-wide one... |
| dup | `AppInfo.dup() -> AppInfo` | g_app_info_dup |  | Creates a duplicate of a #GAppInfo. |
| equal | `AppInfo.equal(appinfo2: AppInfo) -> gboolean` | g_app_info_equal |  | Checks if two #GAppInfos are equal. Note that the check *may not* compare each individual field, and only does an identity check. In case detecting... |
| get_commandline | `AppInfo.get_commandline() -> filename` | g_app_info_get_commandline | 2.20 | Gets the commandline with which the application will be started. |
| get_description | `AppInfo.get_description() -> utf8` | g_app_info_get_description |  | Gets a human-readable description of an installed application. |
| get_display_name | `AppInfo.get_display_name() -> utf8` | g_app_info_get_display_name | 2.24 | Gets the display name of the application. The display name is often more descriptive to the user than the name itself. |
| get_executable | `AppInfo.get_executable() -> filename` | g_app_info_get_executable |  | Gets the executable's name for the installed application. This is intended to be used for debugging or labelling what program is going to be run. T... |
| get_icon | `AppInfo.get_icon() -> Icon` | g_app_info_get_icon |  | Gets the icon for the application. |
| get_id | `AppInfo.get_id() -> utf8` | g_app_info_get_id |  | Gets the ID of an application. An id is a string that identifies the application. The exact format of the id is platform dependent. For instance, o... |
| get_name | `AppInfo.get_name() -> utf8` | g_app_info_get_name |  | Gets the installed name of the application. |
| get_supported_types | `AppInfo.get_supported_types() -> utf8` | g_app_info_get_supported_types | 2.34 | Retrieves the list of content types that @app_info claims to support. If this information is not provided by the environment, this function will re... |
| launch | `AppInfo.launch(files: GLib.List?, context: AppLaunchContext?) -> gboolean throws` | g_app_info_launch |  | Launches the application. Passes @files to the launched application as arguments, using the optional @context to get information about the details ... |
| launch_uris | `AppInfo.launch_uris(uris: GLib.List?, context: AppLaunchContext?) -> gboolean throws` | g_app_info_launch_uris |  | Launches the application. This passes the @uris to the launched application as arguments, using the optional @context to get information about the ... |
| launch_uris_async | `AppInfo.launch_uris_async(uris: GLib.List?, context: AppLaunchContext?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_launch_uris_async | 2.60 | Async version of g_app_info_launch_uris(). The @callback is invoked immediately after the application launch, but it waits for activation in case o... |
| launch_uris_finish | `AppInfo.launch_uris_finish(result: AsyncResult) -> gboolean throws` | g_app_info_launch_uris_finish | 2.60 | Finishes a g_app_info_launch_uris_async() operation. |
| remove_supports_type | `AppInfo.remove_supports_type(content_type: utf8) -> gboolean throws` | g_app_info_remove_supports_type |  | Removes a supported type from an application, if possible. |
| set_as_default_for_extension | `AppInfo.set_as_default_for_extension(extension: filename) -> gboolean throws` | g_app_info_set_as_default_for_extension |  | Sets the application as the default handler for the given file extension. |
| set_as_default_for_type | `AppInfo.set_as_default_for_type(content_type: utf8) -> gboolean throws` | g_app_info_set_as_default_for_type |  | Sets the application as the default handler for a given type. |
| set_as_last_used_for_type | `AppInfo.set_as_last_used_for_type(content_type: utf8) -> gboolean throws` | g_app_info_set_as_last_used_for_type |  | Sets the application as the last used application for a given type. This will make the application appear as first in the list returned by g_app_in... |
| should_show | `AppInfo.should_show() -> gboolean` | g_app_info_should_show |  | Checks if the application info should be shown in menus that list available applications. |
| supports_files | `AppInfo.supports_files() -> gboolean` | g_app_info_supports_files |  | Checks if the application accepts files as arguments. |
| supports_uris | `AppInfo.supports_uris() -> gboolean` | g_app_info_supports_uris |  | Checks if the application supports reading files and directories from URIs. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_supports_type | `add_supports_type(content_type: utf8) -> gboolean throws` |  |  | Adds a content type to the application information to indicate the application is capable of opening files with the given content type. |
| can_delete | `can_delete() -> gboolean` |  | 2.20 | Obtains the information whether the #GAppInfo can be deleted. See g_app_info_delete(). |
| can_remove_supports_type | `can_remove_supports_type() -> gboolean` |  |  | Checks if a supported content type can be removed from an application. |
| do_delete | `do_delete() -> gboolean` |  | 2.20 | Tries to delete a #GAppInfo. On some platforms, there may be a difference between user-defined #GAppInfos which can be deleted, and system-wide one... |
| dup | `dup() -> AppInfo` |  |  | Creates a duplicate of a #GAppInfo. |
| equal | `equal(appinfo2: AppInfo) -> gboolean` |  |  | Checks if two #GAppInfos are equal. Note that the check *may not* compare each individual field, and only does an identity check. In case detecting... |
| get_commandline | `get_commandline() -> filename` |  | 2.20 | Gets the commandline with which the application will be started. |
| get_description | `get_description() -> utf8` |  |  | Gets a human-readable description of an installed application. |
| get_display_name | `get_display_name() -> utf8` |  | 2.24 | Gets the display name of the application. The display name is often more descriptive to the user than the name itself. |
| get_executable | `get_executable() -> filename` |  |  | Gets the executable's name for the installed application. This is intended to be used for debugging or labelling what program is going to be run. T... |
| get_icon | `get_icon() -> Icon` |  |  | Gets the icon for the application. |
| get_id | `get_id() -> utf8` |  |  | Gets the ID of an application. An id is a string that identifies the application. The exact format of the id is platform dependent. For instance, o... |
| get_name | `get_name() -> utf8` |  |  | Gets the installed name of the application. |
| get_supported_types | `get_supported_types() -> utf8` |  | 2.34 | Retrieves the list of content types that @app_info claims to support. If this information is not provided by the environment, this function will re... |
| launch | `launch(files: GLib.List?, context: AppLaunchContext?) -> gboolean throws` |  |  | Launches the application. Passes @files to the launched application as arguments, using the optional @context to get information about the details ... |
| launch_uris | `launch_uris(uris: GLib.List?, context: AppLaunchContext?) -> gboolean throws` |  |  | Launches the application. This passes the @uris to the launched application as arguments, using the optional @context to get information about the ... |
| launch_uris_async | `launch_uris_async(uris: GLib.List?, context: AppLaunchContext?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.60 | Async version of g_app_info_launch_uris(). The @callback is invoked immediately after the application launch, but it waits for activation in case o... |
| launch_uris_finish | `launch_uris_finish(result: AsyncResult) -> gboolean throws` |  | 2.60 | Finishes a g_app_info_launch_uris_async() operation. |
| remove_supports_type | `remove_supports_type(content_type: utf8) -> gboolean throws` |  |  | Removes a supported type from an application, if possible. |
| set_as_default_for_extension | `set_as_default_for_extension(extension: filename) -> gboolean throws` |  |  | Sets the application as the default handler for the given file extension. |
| set_as_default_for_type | `set_as_default_for_type(content_type: utf8) -> gboolean throws` |  |  | Sets the application as the default handler for a given type. |
| set_as_last_used_for_type | `set_as_last_used_for_type(content_type: utf8) -> gboolean throws` |  |  | Sets the application as the last used application for a given type. This will make the application appear as first in the list returned by g_app_in... |
| should_show | `should_show() -> gboolean` |  |  | Checks if the application info should be shown in menus that list available applications. |
| supports_files | `supports_files() -> gboolean` |  |  | Checks if the application accepts files as arguments. |
| supports_uris | `supports_uris() -> gboolean` |  |  | Checks if the application supports reading files and directories from URIs. |

### Gio.AsyncInitable

GType: `GAsyncInitable` ?? C type: `GAsyncInitable`

`GAsyncInitable` is an interface for asynchronously initializable objects. This is the asynchronous version of [iface@Gio.Initable]; it behaves the...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_async | `new_async(object_type: GType, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?, first_property_name: utf8?, ...: void) -> none` | g_async_initable_new_async | 2.22 | Helper function for constructing #GAsyncInitable object. This is similar to g_object_new() but also initializes the object asynchronously. When the... |
| new_valist_async | `new_valist_async(object_type: GType, first_property_name: utf8, var_args: va_list, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_async_initable_new_valist_async | 2.22 | Helper function for constructing #GAsyncInitable object. This is similar to g_object_new_valist() but also initializes the object asynchronously. W... |
| newv_async | `newv_async(object_type: GType, n_parameters: guint, parameters: GObject.Parameter, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_async_initable_newv_async | 2.22 | Helper function for constructing #GAsyncInitable object. This is similar to g_object_newv() but also initializes the object asynchronously. When th... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init_async | `AsyncInitable.init_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_async_initable_init_async | 2.22 | Starts asynchronous initialization of the object implementing the interface. This must be done before any real use of the object after initial cons... |
| init_finish | `AsyncInitable.init_finish(res: AsyncResult) -> gboolean throws` | g_async_initable_init_finish | 2.22 | Finishes asynchronous initialization and returns the result. See g_async_initable_init_async(). |
| new_finish | `AsyncInitable.new_finish(res: AsyncResult) -> GObject.Object throws` | g_async_initable_new_finish | 2.22 | Finishes the async construction for the various g_async_initable_new calls, returning the created object or %NULL on error. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init_async | `init_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Starts asynchronous initialization of the object implementing the interface. This must be done before any real use of the object after initial cons... |
| init_finish | `init_finish(res: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes asynchronous initialization and returns the result. See g_async_initable_init_async(). |

### Gio.AsyncResult

GType: `GAsyncResult` ?? C type: `GAsyncResult`

`GAsyncResult` provides a base class for implementing asynchronous function results. Asynchronous operations are broken up into two separate operat...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_source_object | `AsyncResult.get_source_object() -> GObject.Object` | g_async_result_get_source_object |  | Gets the source object from a #GAsyncResult. |
| get_user_data | `AsyncResult.get_user_data() -> gpointer` | g_async_result_get_user_data |  | Gets the user data from a #GAsyncResult. |
| is_tagged | `AsyncResult.is_tagged(source_tag: gpointer?) -> gboolean` | g_async_result_is_tagged | 2.34 | Checks if @res has the given @source_tag (generally a function pointer indicating the function @res was created by). |
| legacy_propagate_error | `AsyncResult.legacy_propagate_error() -> gboolean throws` | g_async_result_legacy_propagate_error | 2.34 | If @res is a #GSimpleAsyncResult, this is equivalent to g_simple_async_result_propagate_error(). Otherwise it returns %FALSE. This can be used for ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_source_object | `get_source_object() -> GObject.Object` |  |  | Gets the source object from a #GAsyncResult. |
| get_user_data | `get_user_data() -> gpointer` |  |  | Gets the user data from a #GAsyncResult. |
| is_tagged | `is_tagged(source_tag: gpointer?) -> gboolean` |  | 2.34 | Checks if @res has the given @source_tag (generally a function pointer indicating the function @res was created by). |

### Gio.Converter

GType: `GConverter` ?? C type: `GConverter`

`GConverter` is an interface for streaming conversions. `GConverter` is implemented by objects that convert binary data in various ways. The conver...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| convert | `Converter.convert(inbuf: guint8, inbuf_size: gsize, outbuf: guint8, outbuf_size: gsize, flags: ConverterFlags, bytes_read: out gsize, bytes_written: out gsize) -> ConverterResult throws` | g_converter_convert | 2.24 | This is the main operation used when converting data. It is to be called multiple times in a loop, and each time it will do some work, i.e. produci... |
| reset | `Converter.reset() -> none` | g_converter_reset | 2.24 | Resets all internal state in the converter, making it behave as if it was just created. If the converter has any internal state that would produce ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| convert | `convert(inbuf: guint8?, inbuf_size: gsize, outbuf: guint8, outbuf_size: gsize, flags: ConverterFlags, bytes_read: out gsize, bytes_written: out gsize) -> ConverterResult throws` |  | 2.24 | This is the main operation used when converting data. It is to be called multiple times in a loop, and each time it will do some work, i.e. produci... |
| reset | `reset() -> none` |  | 2.24 | Resets all internal state in the converter, making it behave as if it was just created. If the converter has any internal state that would produce ... |

### Gio.DatagramBased

GType: `GDatagramBased` ?? C type: `GDatagramBased`

Interface for socket-like objects with datagram semantics. A `GDatagramBased` is a networking interface for representing datagram-based communicati...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| condition_check | `DatagramBased.condition_check(condition: GLib.IOCondition) -> GLib.IOCondition` | g_datagram_based_condition_check | 2.48 | Checks on the readiness of @datagram_based to perform operations. The operations specified in @condition are checked for and masked against the cur... |
| condition_wait | `DatagramBased.condition_wait(condition: GLib.IOCondition, timeout: gint64, cancellable: Cancellable?) -> gboolean throws` | g_datagram_based_condition_wait | 2.48 | Waits for up to @timeout microseconds for condition to become true on @datagram_based. If the condition is met, %TRUE is returned. If @cancellable ... |
| create_source | `DatagramBased.create_source(condition: GLib.IOCondition, cancellable: Cancellable?) -> GLib.Source` | g_datagram_based_create_source | 2.48 | Creates a #GSource that can be attached to a #GMainContext to monitor for the availability of the specified @condition on the #GDatagramBased. The ... |
| receive_messages | `DatagramBased.receive_messages(messages: InputMessage, num_messages: guint, flags: gint, timeout: gint64, cancellable: Cancellable?) -> gint throws` | g_datagram_based_receive_messages | 2.48 | Receive one or more data messages from @datagram_based in one go. @messages must point to an array of #GInputMessage structs and @num_messages must... |
| send_messages | `DatagramBased.send_messages(messages: OutputMessage, num_messages: guint, flags: gint, timeout: gint64, cancellable: Cancellable?) -> gint throws` | g_datagram_based_send_messages | 2.48 | Send one or more data messages from @datagram_based in one go. @messages must point to an array of #GOutputMessage structs and @num_messages must b... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| condition_check | `condition_check(condition: GLib.IOCondition) -> GLib.IOCondition` |  | 2.48 | Checks on the readiness of @datagram_based to perform operations. The operations specified in @condition are checked for and masked against the cur... |
| condition_wait | `condition_wait(condition: GLib.IOCondition, timeout: gint64, cancellable: Cancellable?) -> gboolean throws` |  | 2.48 | Waits for up to @timeout microseconds for condition to become true on @datagram_based. If the condition is met, %TRUE is returned. If @cancellable ... |
| create_source | `create_source(condition: GLib.IOCondition, cancellable: Cancellable?) -> GLib.Source` |  | 2.48 | Creates a #GSource that can be attached to a #GMainContext to monitor for the availability of the specified @condition on the #GDatagramBased. The ... |
| receive_messages | `receive_messages(messages: InputMessage, num_messages: guint, flags: gint, timeout: gint64, cancellable: Cancellable?) -> gint throws` |  | 2.48 | Receive one or more data messages from @datagram_based in one go. @messages must point to an array of #GInputMessage structs and @num_messages must... |
| send_messages | `send_messages(messages: OutputMessage, num_messages: guint, flags: gint, timeout: gint64, cancellable: Cancellable?) -> gint throws` |  | 2.48 | Send one or more data messages from @datagram_based in one go. @messages must point to an array of #GOutputMessage structs and @num_messages must b... |

### Gio.DBusInterface

GType: `GDBusInterface` ?? C type: `GDBusInterface`

Base type for D-Bus interfaces. The `GDBusInterface` type is the base type for D-Bus interfaces both on the service side (see [class@Gio.DBusInterf...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dup_object | `DBusInterface.dup_object() -> DBusObject` | g_dbus_interface_dup_object | 2.32 | Gets the #GDBusObject that @interface_ belongs to, if any. |
| get_info | `DBusInterface.get_info() -> DBusInterfaceInfo` | g_dbus_interface_get_info | 2.30 | Gets D-Bus introspection information for the D-Bus interface implemented by @interface_. |
| get_object | `DBusInterface.get_object() -> DBusObject` | g_dbus_interface_get_object | 2.30 | Gets the #GDBusObject that @interface_ belongs to, if any. It is not safe to use the returned object if @interface_ or the returned object is being... |
| set_object | `DBusInterface.set_object(object: DBusObject?) -> none` | g_dbus_interface_set_object | 2.30 | Sets the #GDBusObject for @interface_ to @object. Note that @interface_ will hold a weak reference to @object. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dup_object | `dup_object() -> DBusObject` |  | 2.32 | Gets the #GDBusObject that @interface_ belongs to, if any. |
| get_info | `get_info() -> DBusInterfaceInfo` |  | 2.30 | Gets D-Bus introspection information for the D-Bus interface implemented by @interface_. |
| get_object | `get_object() -> DBusObject` |  | 2.30 | Gets the #GDBusObject that @interface_ belongs to, if any. It is not safe to use the returned object if @interface_ or the returned object is being... |
| set_object | `set_object(object: DBusObject?) -> none` |  | 2.30 | Sets the #GDBusObject for @interface_ to @object. Note that @interface_ will hold a weak reference to @object. |

### Gio.DBusObject

GType: `GDBusObject` ?? C type: `GDBusObject`

The `GDBusObject` type is the base type for D-Bus objects on both the service side (see [class@Gio.DBusObjectSkeleton]) and the client side (see [c...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_interface | `DBusObject.get_interface(interface_name: utf8) -> DBusInterface` | g_dbus_object_get_interface | 2.30 | Gets the D-Bus interface with name @interface_name associated with @object, if any. |
| get_interfaces | `DBusObject.get_interfaces() -> GLib.List` | g_dbus_object_get_interfaces | 2.30 | Gets the D-Bus interfaces associated with @object. |
| get_object_path | `DBusObject.get_object_path() -> utf8` | g_dbus_object_get_object_path | 2.30 | Gets the object path for @object. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| interface-added | `interface: DBusInterface` | none | last | 2.30 | Emitted when @interface is added to @object. |
| interface-removed | `interface: DBusInterface` | none | last | 2.30 | Emitted when @interface is removed from @object. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_interface | `get_interface(interface_name: utf8) -> DBusInterface` |  | 2.30 | Gets the D-Bus interface with name @interface_name associated with @object, if any. |
| get_interfaces | `get_interfaces() -> GLib.List` |  | 2.30 | Gets the D-Bus interfaces associated with @object. |
| get_object_path | `get_object_path() -> utf8` |  | 2.30 | Gets the object path for @object. |
| interface_added | `interface_added(interface_: DBusInterface) -> none` |  |  | Signal handler for the #GDBusObject::interface-added signal. |
| interface_removed | `interface_removed(interface_: DBusInterface) -> none` |  |  | Signal handler for the #GDBusObject::interface-removed signal. |

### Gio.DBusObjectManager

GType: `GDBusObjectManager` ?? C type: `GDBusObjectManager`

The `GDBusObjectManager` type is the base type for service- and client-side implementations of the standardized `org.freedesktop.DBus.ObjectManager...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_interface | `DBusObjectManager.get_interface(object_path: utf8, interface_name: utf8) -> DBusInterface` | g_dbus_object_manager_get_interface | 2.30 | Gets the interface proxy for @interface_name at @object_path, if any. |
| get_object | `DBusObjectManager.get_object(object_path: utf8) -> DBusObject` | g_dbus_object_manager_get_object | 2.30 | Gets the #GDBusObject at @object_path, if any. |
| get_object_path | `DBusObjectManager.get_object_path() -> utf8` | g_dbus_object_manager_get_object_path | 2.30 | Gets the object path that @manager is for. |
| get_objects | `DBusObjectManager.get_objects() -> GLib.List` | g_dbus_object_manager_get_objects | 2.30 | Gets all #GDBusObject objects known to @manager. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| interface-added | `object: DBusObject, interface: DBusInterface` | none | last | 2.30 | Emitted when @interface is added to @object. This signal exists purely as a convenience to avoid having to connect signals to all objects managed b... |
| interface-removed | `object: DBusObject, interface: DBusInterface` | none | last | 2.30 | Emitted when @interface has been removed from @object. This signal exists purely as a convenience to avoid having to connect signals to all objects... |
| object-added | `object: DBusObject` | none | last | 2.30 | Emitted when @object is added to @manager. |
| object-removed | `object: DBusObject` | none | last | 2.30 | Emitted when @object is removed from @manager. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_interface | `get_interface(object_path: utf8, interface_name: utf8) -> DBusInterface` |  | 2.30 | Gets the interface proxy for @interface_name at @object_path, if any. |
| get_object | `get_object(object_path: utf8) -> DBusObject` |  | 2.30 | Gets the #GDBusObject at @object_path, if any. |
| get_object_path | `get_object_path() -> utf8` |  | 2.30 | Gets the object path that @manager is for. |
| get_objects | `get_objects() -> GLib.List` |  | 2.30 | Gets all #GDBusObject objects known to @manager. |
| interface_added | `interface_added(object: DBusObject, interface_: DBusInterface) -> none` |  |  | Signal handler for the #GDBusObjectManager::interface-added signal. |
| interface_removed | `interface_removed(object: DBusObject, interface_: DBusInterface) -> none` |  |  | Signal handler for the #GDBusObjectManager::interface-removed signal. |
| object_added | `object_added(object: DBusObject) -> none` |  |  | Signal handler for the #GDBusObjectManager::object-added signal. |
| object_removed | `object_removed(object: DBusObject) -> none` |  |  | Signal handler for the #GDBusObjectManager::object-removed signal. |

### Gio.DebugController

GType: `GDebugController` ?? C type: `GDebugController`

`GDebugController` is an interface to expose control of debugging features and debug output. It is implemented on Linux using [class@Gio.DebugContr...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_debug_enabled | `DebugController.get_debug_enabled() -> gboolean` | g_debug_controller_get_debug_enabled | 2.72 | Get the value of #GDebugController:debug-enabled. |
| set_debug_enabled | `DebugController.set_debug_enabled(debug_enabled: gboolean) -> none` | g_debug_controller_set_debug_enabled | 2.72 | Set the value of #GDebugController:debug-enabled. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| debug-enabled | gboolean | read, write | %TRUE if debug output should be exposed (for example by forwarding it to the journal), %FALSE otherwise. |

### Gio.DesktopAppInfoLookup

GType: `GDesktopAppInfoLookup` ?? C type: `GDesktopAppInfoLookup`

#GDesktopAppInfoLookup is an opaque data structure and can only be accessed using the following functions.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_for_uri_scheme | `DesktopAppInfoLookup.get_default_for_uri_scheme(uri_scheme: utf8) -> AppInfo` | g_desktop_app_info_lookup_get_default_for_uri_scheme |  | Gets the default application for launching applications using this URI scheme for a particular #GDesktopAppInfoLookup implementation. The #GDesktop... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_for_uri_scheme | `get_default_for_uri_scheme(uri_scheme: utf8) -> AppInfo` |  |  | Gets the default application for launching applications using this URI scheme for a particular #GDesktopAppInfoLookup implementation. The #GDesktop... |

### Gio.Drive

GType: `GDrive` ?? C type: `GDrive`

`GDrive` represents a piece of hardware connected to the machine. It???s generally only created for removable hardware or hardware with removable m...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_eject | `Drive.can_eject() -> gboolean` | g_drive_can_eject |  | Checks if a drive can be ejected. |
| can_poll_for_media | `Drive.can_poll_for_media() -> gboolean` | g_drive_can_poll_for_media |  | Checks if a drive can be polled for media changes. |
| can_start | `Drive.can_start() -> gboolean` | g_drive_can_start | 2.22 | Checks if a drive can be started. |
| can_start_degraded | `Drive.can_start_degraded() -> gboolean` | g_drive_can_start_degraded | 2.22 | Checks if a drive can be started degraded. |
| can_stop | `Drive.can_stop() -> gboolean` | g_drive_can_stop | 2.22 | Checks if a drive can be stopped. |
| eject | `Drive.eject(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_drive_eject |  | Asynchronously ejects a drive. When the operation is finished, @callback will be called. You can then call g_drive_eject_finish() to obtain the res... |
| eject_finish | `Drive.eject_finish(result: AsyncResult) -> gboolean throws` | g_drive_eject_finish |  | Finishes ejecting a drive. |
| eject_with_operation | `Drive.eject_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_drive_eject_with_operation | 2.22 | Ejects a drive. This is an asynchronous operation, and is finished by calling g_drive_eject_with_operation_finish() with the @drive and #GAsyncResu... |
| eject_with_operation_finish | `Drive.eject_with_operation_finish(result: AsyncResult) -> gboolean throws` | g_drive_eject_with_operation_finish | 2.22 | Finishes ejecting a drive. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| enumerate_identifiers | `Drive.enumerate_identifiers() -> utf8` | g_drive_enumerate_identifiers |  | Gets the kinds of identifiers that @drive has. Use g_drive_get_identifier() to obtain the identifiers themselves. |
| get_icon | `Drive.get_icon() -> Icon` | g_drive_get_icon |  | Gets the icon for @drive. |
| get_identifier | `Drive.get_identifier(kind: utf8) -> utf8` | g_drive_get_identifier |  | Gets the identifier of the given kind for @drive. The only identifier currently available is %G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE. |
| get_name | `Drive.get_name() -> utf8` | g_drive_get_name |  | Gets the name of @drive. |
| get_sort_key | `Drive.get_sort_key() -> utf8` | g_drive_get_sort_key | 2.32 | Gets the sort key for @drive, if any. |
| get_start_stop_type | `Drive.get_start_stop_type() -> DriveStartStopType` | g_drive_get_start_stop_type | 2.22 | Gets a hint about how a drive can be started/stopped. |
| get_symbolic_icon | `Drive.get_symbolic_icon() -> Icon` | g_drive_get_symbolic_icon | 2.34 | Gets the icon for @drive. |
| get_volumes | `Drive.get_volumes() -> GLib.List` | g_drive_get_volumes |  | Get a list of mountable volumes for @drive. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_obje... |
| has_media | `Drive.has_media() -> gboolean` | g_drive_has_media |  | Checks if the @drive has media. Note that the OS may not be polling the drive for media changes; see g_drive_is_media_check_automatic() for more de... |
| has_volumes | `Drive.has_volumes() -> gboolean` | g_drive_has_volumes |  | Check if @drive has any mountable volumes. |
| is_media_check_automatic | `Drive.is_media_check_automatic() -> gboolean` | g_drive_is_media_check_automatic |  | Checks if @drive is capable of automatically detecting media changes. |
| is_media_removable | `Drive.is_media_removable() -> gboolean` | g_drive_is_media_removable |  | Checks if the @drive supports removable media. |
| is_removable | `Drive.is_removable() -> gboolean` | g_drive_is_removable | 2.50 | Checks if the #GDrive and/or its media is considered removable by the user. See g_drive_is_media_removable(). |
| poll_for_media | `Drive.poll_for_media(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_drive_poll_for_media |  | Asynchronously polls @drive to see if media has been inserted or removed. When the operation is finished, @callback will be called. You can then ca... |
| poll_for_media_finish | `Drive.poll_for_media_finish(result: AsyncResult) -> gboolean throws` | g_drive_poll_for_media_finish |  | Finishes an operation started with g_drive_poll_for_media() on a drive. |
| start | `Drive.start(flags: DriveStartFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_drive_start | 2.22 | Asynchronously starts a drive. When the operation is finished, @callback will be called. You can then call g_drive_start_finish() to obtain the res... |
| start_finish | `Drive.start_finish(result: AsyncResult) -> gboolean throws` | g_drive_start_finish | 2.22 | Finishes starting a drive. |
| stop | `Drive.stop(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_drive_stop | 2.22 | Asynchronously stops a drive. When the operation is finished, @callback will be called. You can then call g_drive_stop_finish() to obtain the resul... |
| stop_finish | `Drive.stop_finish(result: AsyncResult) -> gboolean throws` | g_drive_stop_finish | 2.22 | Finishes stopping a drive. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | Emitted when the drive's state has changed. |
| disconnected | `` | none | last |  | This signal is emitted when the #GDrive have been disconnected. If the recipient is holding references to the object they should release them so th... |
| eject-button | `` | none | last |  | Emitted when the physical eject button (if any) of a drive has been pressed. |
| stop-button | `` | none | last | 2.22 | Emitted when the physical stop button (if any) of a drive has been pressed. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_eject | `can_eject() -> gboolean` |  |  | Checks if a drive can be ejected. |
| can_poll_for_media | `can_poll_for_media() -> gboolean` |  |  | Checks if a drive can be polled for media changes. |
| can_start | `can_start() -> gboolean` |  | 2.22 | Checks if a drive can be started. |
| can_start_degraded | `can_start_degraded() -> gboolean` |  | 2.22 | Checks if a drive can be started degraded. |
| can_stop | `can_stop() -> gboolean` |  | 2.22 | Checks if a drive can be stopped. |
| changed | `changed() -> none` |  |  | Signal emitted when the drive is changed. |
| disconnected | `disconnected() -> none` |  |  | The removed signal that is emitted when the #GDrive have been disconnected. If the recipient is holding references to the object they should releas... |
| eject | `eject(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously ejects a drive. When the operation is finished, @callback will be called. You can then call g_drive_eject_finish() to obtain the res... |
| eject_button | `eject_button() -> none` |  |  | Signal emitted when the physical eject button (if any) of a drive have been pressed. |
| eject_finish | `eject_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes ejecting a drive. |
| eject_with_operation | `eject_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Ejects a drive. This is an asynchronous operation, and is finished by calling g_drive_eject_with_operation_finish() with the @drive and #GAsyncResu... |
| eject_with_operation_finish | `eject_with_operation_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes ejecting a drive. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| enumerate_identifiers | `enumerate_identifiers() -> utf8` |  |  | Gets the kinds of identifiers that @drive has. Use g_drive_get_identifier() to obtain the identifiers themselves. |
| get_icon | `get_icon() -> Icon` |  |  | Gets the icon for @drive. |
| get_identifier | `get_identifier(kind: utf8) -> utf8` |  |  | Gets the identifier of the given kind for @drive. The only identifier currently available is %G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE. |
| get_name | `get_name() -> utf8` |  |  | Gets the name of @drive. |
| get_sort_key | `get_sort_key() -> utf8` |  | 2.32 | Gets the sort key for @drive, if any. |
| get_start_stop_type | `get_start_stop_type() -> DriveStartStopType` |  | 2.22 | Gets a hint about how a drive can be started/stopped. |
| get_symbolic_icon | `get_symbolic_icon() -> Icon` |  | 2.34 | Gets the icon for @drive. |
| get_volumes | `get_volumes() -> GLib.List` |  |  | Get a list of mountable volumes for @drive. The returned list should be freed with g_list_free(), after its elements have been unreffed with g_obje... |
| has_media | `has_media() -> gboolean` |  |  | Checks if the @drive has media. Note that the OS may not be polling the drive for media changes; see g_drive_is_media_check_automatic() for more de... |
| has_volumes | `has_volumes() -> gboolean` |  |  | Check if @drive has any mountable volumes. |
| is_media_check_automatic | `is_media_check_automatic() -> gboolean` |  |  | Checks if @drive is capable of automatically detecting media changes. |
| is_media_removable | `is_media_removable() -> gboolean` |  |  | Checks if the @drive supports removable media. |
| is_removable | `is_removable() -> gboolean` |  | 2.50 | Checks if the #GDrive and/or its media is considered removable by the user. See g_drive_is_media_removable(). |
| poll_for_media | `poll_for_media(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously polls @drive to see if media has been inserted or removed. When the operation is finished, @callback will be called. You can then ca... |
| poll_for_media_finish | `poll_for_media_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes an operation started with g_drive_poll_for_media() on a drive. |
| start | `start(flags: DriveStartFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Asynchronously starts a drive. When the operation is finished, @callback will be called. You can then call g_drive_start_finish() to obtain the res... |
| start_finish | `start_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes starting a drive. |
| stop | `stop(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Asynchronously stops a drive. When the operation is finished, @callback will be called. You can then call g_drive_stop_finish() to obtain the resul... |
| stop_button | `stop_button() -> none` |  |  | Signal emitted when the physical stop button (if any) of a drive have been pressed. Since 2.22. |
| stop_finish | `stop_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes stopping a drive. |

### Gio.DtlsClientConnection

GType: `GDtlsClientConnection` ?? C type: `GDtlsClientConnection`

`GDtlsClientConnection` is the client-side subclass of [iface@Gio.DtlsConnection], representing a client-side DTLS connection.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(base_socket: DatagramBased, server_identity: SocketConnectable?) -> DtlsClientConnection throws` | g_dtls_client_connection_new | 2.48 | Creates a new #GDtlsClientConnection wrapping @base_socket which is assumed to communicate with the server identified by @server_identity. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_accepted_cas | `DtlsClientConnection.get_accepted_cas() -> GLib.List` | g_dtls_client_connection_get_accepted_cas | 2.48 | Gets the list of distinguished names of the Certificate Authorities that the server will accept certificates from. This will be set during the TLS ... |
| get_server_identity | `DtlsClientConnection.get_server_identity() -> SocketConnectable` | g_dtls_client_connection_get_server_identity | 2.48 | Gets @conn's expected server identity |
| get_validation_flags | `DtlsClientConnection.get_validation_flags() -> TlsCertificateFlags` | g_dtls_client_connection_get_validation_flags | 2.48 | Gets @conn's validation flags This function does not work as originally designed and is impossible to use correctly. See #GDtlsClientConnection:val... |
| set_server_identity | `DtlsClientConnection.set_server_identity(identity: SocketConnectable) -> none` | g_dtls_client_connection_set_server_identity | 2.48 | Sets @conn's expected server identity, which is used both to tell servers on virtual hosts which certificate to present, and also to let @conn know... |
| set_validation_flags | `DtlsClientConnection.set_validation_flags(flags: TlsCertificateFlags) -> none` | g_dtls_client_connection_set_validation_flags | 2.48 | Sets @conn's validation flags, to override the default set of checks performed when validating a server certificate. By default, %G_TLS_CERTIFICATE... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accepted-cas | GLib.List | read | A list of the distinguished names of the Certificate Authorities that the server will accept client certificates signed by. If the server requests ... |
| server-identity | SocketConnectable | read, write | A #GSocketConnectable describing the identity of the server that is expected on the other end of the connection. If the %G_TLS_CERTIFICATE_BAD_IDEN... |
| validation-flags | TlsCertificateFlags | read, write | What steps to perform when validating a certificate received from a server. Server certificates that fail to validate in any of the ways indicated ... |

### Gio.DtlsConnection

GType: `GDtlsConnection` ?? C type: `GDtlsConnection`

`GDtlsConnection` is the base DTLS connection class type, which wraps a [iface@Gio.DatagramBased] and provides DTLS encryption on top of it. Its su...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `DtlsConnection.close(cancellable: Cancellable?) -> gboolean throws` | g_dtls_connection_close | 2.48 | Close the DTLS connection. This is equivalent to calling g_dtls_connection_shutdown() to shut down both sides of the connection. Closing a #GDtlsCo... |
| close_async | `DtlsConnection.close_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dtls_connection_close_async | 2.48 | Asynchronously close the DTLS connection. See g_dtls_connection_close() for more information. |
| close_finish | `DtlsConnection.close_finish(result: AsyncResult) -> gboolean throws` | g_dtls_connection_close_finish | 2.48 | Finish an asynchronous TLS close operation. See g_dtls_connection_close() for more information. |
| emit_accept_certificate | `DtlsConnection.emit_accept_certificate(peer_cert: TlsCertificate, errors: TlsCertificateFlags) -> gboolean` | g_dtls_connection_emit_accept_certificate | 2.48 | Used by #GDtlsConnection implementations to emit the #GDtlsConnection::accept-certificate signal. |
| get_certificate | `DtlsConnection.get_certificate() -> TlsCertificate` | g_dtls_connection_get_certificate | 2.48 | Gets @conn's certificate, as set by g_dtls_connection_set_certificate(). |
| get_channel_binding_data | `DtlsConnection.get_channel_binding_data(type: TlsChannelBindingType, data: out guint8?) -> gboolean throws` | g_dtls_connection_get_channel_binding_data | 2.66 | Query the TLS backend for TLS channel binding data of @type for @conn. This call retrieves TLS channel binding data as specified in RFC 5056, RFC 5... |
| get_ciphersuite_name | `DtlsConnection.get_ciphersuite_name() -> utf8` | g_dtls_connection_get_ciphersuite_name | 2.70 | Returns the name of the current DTLS ciphersuite, or %NULL if the connection has not handshaked or has been closed. Beware that the TLS backend may... |
| get_database | `DtlsConnection.get_database() -> TlsDatabase` | g_dtls_connection_get_database | 2.48 | Gets the certificate database that @conn uses to verify peer certificates. See g_dtls_connection_set_database(). |
| get_interaction | `DtlsConnection.get_interaction() -> TlsInteraction` | g_dtls_connection_get_interaction | 2.48 | Get the object that will be used to interact with the user. It will be used for things like prompting the user for passwords. If %NULL is returned,... |
| get_negotiated_protocol | `DtlsConnection.get_negotiated_protocol() -> utf8` | g_dtls_connection_get_negotiated_protocol | 2.60 | Gets the name of the application-layer protocol negotiated during the handshake. If the peer did not use the ALPN extension, or did not advertise a... |
| get_peer_certificate | `DtlsConnection.get_peer_certificate() -> TlsCertificate` | g_dtls_connection_get_peer_certificate | 2.48 | Gets @conn's peer's certificate after the handshake has completed or failed. (It is not set during the emission of #GDtlsConnection::accept-certifi... |
| get_peer_certificate_errors | `DtlsConnection.get_peer_certificate_errors() -> TlsCertificateFlags` | g_dtls_connection_get_peer_certificate_errors | 2.48 | Gets the errors associated with validating @conn's peer's certificate, after the handshake has completed or failed. (It is not set during the emiss... |
| get_protocol_version | `DtlsConnection.get_protocol_version() -> TlsProtocolVersion` | g_dtls_connection_get_protocol_version | 2.70 | Returns the current DTLS protocol version, which may be %G_TLS_PROTOCOL_VERSION_UNKNOWN if the connection has not handshaked, or has been closed, o... |
| get_rehandshake_mode | `DtlsConnection.get_rehandshake_mode() -> TlsRehandshakeMode` | g_dtls_connection_get_rehandshake_mode | 2.48 | Gets @conn rehandshaking mode. See g_dtls_connection_set_rehandshake_mode() for details. |
| get_require_close_notify | `DtlsConnection.get_require_close_notify() -> gboolean` | g_dtls_connection_get_require_close_notify | 2.48 | Tests whether or not @conn expects a proper TLS close notification when the connection is closed. See g_dtls_connection_set_require_close_notify() ... |
| handshake | `DtlsConnection.handshake(cancellable: Cancellable?) -> gboolean throws` | g_dtls_connection_handshake | 2.48 | Attempts a TLS handshake on @conn. On the client side, it is never necessary to call this method; although the connection needs to perform a handsh... |
| handshake_async | `DtlsConnection.handshake_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dtls_connection_handshake_async | 2.48 | Asynchronously performs a TLS handshake on @conn. See g_dtls_connection_handshake() for more information. |
| handshake_finish | `DtlsConnection.handshake_finish(result: AsyncResult) -> gboolean throws` | g_dtls_connection_handshake_finish | 2.48 | Finish an asynchronous TLS handshake operation. See g_dtls_connection_handshake() for more information. |
| set_advertised_protocols | `DtlsConnection.set_advertised_protocols(protocols: utf8?) -> none` | g_dtls_connection_set_advertised_protocols | 2.60 | Sets the list of application-layer protocols to advertise that the caller is willing to speak on this connection. The Application-Layer Protocol Ne... |
| set_certificate | `DtlsConnection.set_certificate(certificate: TlsCertificate) -> none` | g_dtls_connection_set_certificate | 2.48 | This sets the certificate that @conn will present to its peer during the TLS handshake. For a #GDtlsServerConnection, it is mandatory to set this, ... |
| set_database | `DtlsConnection.set_database(database: TlsDatabase?) -> none` | g_dtls_connection_set_database | 2.48 | Sets the certificate database that is used to verify peer certificates. This is set to the default database by default. See g_tls_backend_get_defau... |
| set_interaction | `DtlsConnection.set_interaction(interaction: TlsInteraction?) -> none` | g_dtls_connection_set_interaction | 2.48 | Set the object that will be used to interact with the user. It will be used for things like prompting the user for passwords. The @interaction argu... |
| set_rehandshake_mode | `DtlsConnection.set_rehandshake_mode(mode: TlsRehandshakeMode) -> none` | g_dtls_connection_set_rehandshake_mode | 2.48 | Since GLib 2.64, changing the rehandshake mode is no longer supported and will have no effect. With TLS 1.3, rehandshaking has been removed from th... |
| set_require_close_notify | `DtlsConnection.set_require_close_notify(require_close_notify: gboolean) -> none` | g_dtls_connection_set_require_close_notify | 2.48 | Sets whether or not @conn expects a proper TLS close notification before the connection is closed. If this is %TRUE (the default), then @conn will ... |
| shutdown | `DtlsConnection.shutdown(shutdown_read: gboolean, shutdown_write: gboolean, cancellable: Cancellable?) -> gboolean throws` | g_dtls_connection_shutdown | 2.48 | Shut down part or all of a DTLS connection. If @shutdown_read is %TRUE then the receiving side of the connection is shut down, and further reading ... |
| shutdown_async | `DtlsConnection.shutdown_async(shutdown_read: gboolean, shutdown_write: gboolean, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dtls_connection_shutdown_async | 2.48 | Asynchronously shut down part or all of the DTLS connection. See g_dtls_connection_shutdown() for more information. |
| shutdown_finish | `DtlsConnection.shutdown_finish(result: AsyncResult) -> gboolean throws` | g_dtls_connection_shutdown_finish | 2.48 | Finish an asynchronous TLS shutdown operation. See g_dtls_connection_shutdown() for more information. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| advertised-protocols | utf8 | read, write | The list of application-layer protocols that the connection advertises that it is willing to speak. See g_dtls_connection_set_advertised_protocols(). |
| base-socket | DatagramBased | read, write, construct-only | The #GDatagramBased that the connection wraps. Note that this may be any implementation of #GDatagramBased, not just a #GSocket. |
| certificate | TlsCertificate | read, write | The connection's certificate; see g_dtls_connection_set_certificate(). |
| ciphersuite-name | utf8 | read | The name of the DTLS ciphersuite in use. See g_dtls_connection_get_ciphersuite_name(). |
| database | TlsDatabase | read, write | The certificate database to use when verifying this TLS connection. If no certificate database is set, then the default database will be used. See ... |
| interaction | TlsInteraction | read, write | A #GTlsInteraction object to be used when the connection or certificate database need to interact with the user. This will be used to prompt the us... |
| negotiated-protocol | utf8 | read | The application-layer protocol negotiated during the TLS handshake. See g_dtls_connection_get_negotiated_protocol(). |
| peer-certificate | TlsCertificate | read | The connection's peer's certificate, after the TLS handshake has completed or failed. Note in particular that this is not yet set during the emissi... |
| peer-certificate-errors | TlsCertificateFlags | read | The errors noticed while verifying #GDtlsConnection:peer-certificate. Normally this should be 0, but it may not be if #GDtlsClientConnection:valida... |
| protocol-version | TlsProtocolVersion | read | The DTLS protocol version in use. See g_dtls_connection_get_protocol_version(). |
| rehandshake-mode | TlsRehandshakeMode | read, write | The rehandshaking mode. See g_dtls_connection_set_rehandshake_mode(). |
| require-close-notify | gboolean | read, write | Whether or not proper TLS close notification is required. See g_dtls_connection_set_require_close_notify(). |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| accept-certificate | `peer_cert: TlsCertificate, errors: TlsCertificateFlags` | gboolean | last | 2.48 | Emitted during the TLS handshake after the peer certificate has been received. You can examine @peer_cert's certification path by calling g_tls_cer... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_certificate | `accept_certificate(peer_cert: TlsCertificate, errors: TlsCertificateFlags) -> gboolean` |  |  | Check whether to accept a certificate. |
| get_binding_data | `get_binding_data(type: TlsChannelBindingType, data: guint8) -> gboolean throws` |  |  | Retrieve TLS channel binding data (Since: 2.66) |
| get_negotiated_protocol | `get_negotiated_protocol() -> utf8` |  | 2.60 | Gets the name of the application-layer protocol negotiated during the handshake. If the peer did not use the ALPN extension, or did not advertise a... |
| handshake | `handshake(cancellable: Cancellable?) -> gboolean throws` |  | 2.48 | Attempts a TLS handshake on @conn. On the client side, it is never necessary to call this method; although the connection needs to perform a handsh... |
| handshake_async | `handshake_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.48 | Asynchronously performs a TLS handshake on @conn. See g_dtls_connection_handshake() for more information. |
| handshake_finish | `handshake_finish(result: AsyncResult) -> gboolean throws` |  | 2.48 | Finish an asynchronous TLS handshake operation. See g_dtls_connection_handshake() for more information. |
| set_advertised_protocols | `set_advertised_protocols(protocols: utf8?) -> none` |  | 2.60 | Sets the list of application-layer protocols to advertise that the caller is willing to speak on this connection. The Application-Layer Protocol Ne... |
| shutdown | `shutdown(shutdown_read: gboolean, shutdown_write: gboolean, cancellable: Cancellable?) -> gboolean throws` |  | 2.48 | Shut down part or all of a DTLS connection. If @shutdown_read is %TRUE then the receiving side of the connection is shut down, and further reading ... |
| shutdown_async | `shutdown_async(shutdown_read: gboolean, shutdown_write: gboolean, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.48 | Asynchronously shut down part or all of the DTLS connection. See g_dtls_connection_shutdown() for more information. |
| shutdown_finish | `shutdown_finish(result: AsyncResult) -> gboolean throws` |  | 2.48 | Finish an asynchronous TLS shutdown operation. See g_dtls_connection_shutdown() for more information. |

### Gio.DtlsServerConnection

GType: `GDtlsServerConnection` ?? C type: `GDtlsServerConnection`

`GDtlsServerConnection` is the server-side subclass of [iface@Gio.DtlsConnection], representing a server-side DTLS connection.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(base_socket: DatagramBased, certificate: TlsCertificate?) -> DtlsServerConnection throws` | g_dtls_server_connection_new | 2.48 | Creates a new #GDtlsServerConnection wrapping @base_socket. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| authentication-mode | TlsAuthenticationMode | read, write | The #GTlsAuthenticationMode for the server. This can be changed before calling g_dtls_connection_handshake() if you want to rehandshake with a diff... |

### Gio.File

GType: `GFile` ?? C type: `GFile`

`GFile` is a high level abstraction for manipulating files on a virtual file system. `GFile`s are lightweight, immutable objects that do no I/O upo...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_build_filename | `new_build_filename(first_element: filename, ...: void) -> File` | g_file_new_build_filename | 2.56 | Constructs a #GFile from a series of elements using the correct separator for filenames. Using this function is equivalent to calling g_build_filen... |
| new_build_filenamev | `new_build_filenamev(args: filename) -> File` | g_file_new_build_filenamev | 2.78 | Constructs a #GFile from a vector of elements using the correct separator for filenames. Using this function is equivalent to calling g_build_filen... |
| new_for_commandline_arg | `new_for_commandline_arg(arg: filename) -> File` | g_file_new_for_commandline_arg |  | Creates a #GFile with the given argument from the command line. The value of @arg can be either a URI, an absolute path or a relative path resolved... |
| new_for_commandline_arg_and_cwd | `new_for_commandline_arg_and_cwd(arg: filename, cwd: filename) -> File` | g_file_new_for_commandline_arg_and_cwd | 2.36 | Creates a #GFile with the given argument from the command line. This function is similar to g_file_new_for_commandline_arg() except that it allows ... |
| new_for_path | `new_for_path(path: filename) -> File` | g_file_new_for_path |  | Constructs a #GFile for a given path. This operation never fails, but the returned object might not support any I/O operation if @path is malformed. |
| new_for_uri | `new_for_uri(uri: utf8) -> File` | g_file_new_for_uri |  | Constructs a #GFile for a given URI. This operation never fails, but the returned object might not support any I/O operation if @uri is malformed o... |
| new_tmp | `new_tmp(tmpl: filename?, iostream: out FileIOStream) -> File throws` | g_file_new_tmp | 2.32 | Opens a file in the preferred directory for temporary files (as returned by g_get_tmp_dir()) and returns a #GFile and #GFileIOStream pointing to it... |
| new_tmp_async | `new_tmp_async(tmpl: filename?, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_new_tmp_async | 2.74 | Asynchronously opens a file in the preferred directory for temporary files (as returned by g_get_tmp_dir()) as g_file_new_tmp(). @tmpl should be a ... |
| new_tmp_dir_async | `new_tmp_dir_async(tmpl: filename?, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_new_tmp_dir_async | 2.74 | Asynchronously creates a directory in the preferred directory for temporary files (as returned by g_get_tmp_dir()) as g_dir_make_tmp(). @tmpl shoul... |
| new_tmp_dir_finish | `new_tmp_dir_finish(result: AsyncResult) -> File throws` | g_file_new_tmp_dir_finish | 2.74 | Finishes a temporary directory creation started by g_file_new_tmp_dir_async(). |
| new_tmp_finish | `new_tmp_finish(result: AsyncResult, iostream: out FileIOStream) -> File throws` | g_file_new_tmp_finish | 2.74 | Finishes a temporary file creation started by g_file_new_tmp_async(). |
| parse_name | `parse_name(parse_name: utf8) -> File` | g_file_parse_name |  | Constructs a #GFile with the given @parse_name (i.e. something given by g_file_get_parse_name()). This operation never fails, but the returned obje... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_to | `File.append_to(flags: FileCreateFlags, cancellable: Cancellable?) -> FileOutputStream throws` | g_file_append_to |  | Gets an output stream for appending data to the file. If the file doesn't already exist it is created. By default files created are generally reada... |
| append_to_async | `File.append_to_async(flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_append_to_async |  | Asynchronously opens @file for appending. For more details, see g_file_append_to() which is the synchronous version of this call. When the operatio... |
| append_to_finish | `File.append_to_finish(res: AsyncResult) -> FileOutputStream throws` | g_file_append_to_finish |  | Finishes an asynchronous file append operation started with g_file_append_to_async(). |
| build_attribute_list_for_copy | `File.build_attribute_list_for_copy(flags: FileCopyFlags, cancellable: Cancellable?) -> utf8 throws` | g_file_build_attribute_list_for_copy | 2.68 | Prepares the file attribute query string for copying to @file. This function prepares an attribute query string to be passed to g_file_query_info()... |
| copy | `File.copy(destination: File, flags: FileCopyFlags, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?) -> gboolean throws` | g_file_copy |  | Copies the file @source to the location specified by @destination. Can not handle recursive copies of directories. If the flag %G_FILE_COPY_OVERWRI... |
| copy_async | `File.copy_async(destination: File, flags: FileCopyFlags, io_priority: gint, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_copy_async |  | Copies the file @source to the location specified by @destination asynchronously. For details of the behaviour, see g_file_copy(). If @progress_cal... |
| copy_attributes | `File.copy_attributes(destination: File, flags: FileCopyFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_copy_attributes |  | Copies the file attributes from @source to @destination. Normally only a subset of the file attributes are copied, those that are copies in a norma... |
| copy_finish | `File.copy_finish(res: AsyncResult) -> gboolean throws` | g_file_copy_finish |  | Finishes copying the file started with g_file_copy_async(). |
| create | `File.create(flags: FileCreateFlags, cancellable: Cancellable?) -> FileOutputStream throws` | g_file_create |  | Creates a new file and returns an output stream for writing to it. The file must not already exist. By default files created are generally readable... |
| create_async | `File.create_async(flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_create_async |  | Asynchronously creates a new file and returns an output stream for writing to it. The file must not already exist. For more details, see g_file_cre... |
| create_finish | `File.create_finish(res: AsyncResult) -> FileOutputStream throws` | g_file_create_finish |  | Finishes an asynchronous file create operation started with g_file_create_async(). |
| create_readwrite | `File.create_readwrite(flags: FileCreateFlags, cancellable: Cancellable?) -> FileIOStream throws` | g_file_create_readwrite | 2.22 | Creates a new file and returns a stream for reading and writing to it. The file must not already exist. By default files created are generally read... |
| create_readwrite_async | `File.create_readwrite_async(flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_create_readwrite_async | 2.22 | Asynchronously creates a new file and returns a stream for reading and writing to it. The file must not already exist. For more details, see g_file... |
| create_readwrite_finish | `File.create_readwrite_finish(res: AsyncResult) -> FileIOStream throws` | g_file_create_readwrite_finish | 2.22 | Finishes an asynchronous file create operation started with g_file_create_readwrite_async(). |
| delete | `File.delete(cancellable: Cancellable?) -> gboolean throws` | g_file_delete |  | Deletes a file. If the @file is a directory, it will only be deleted if it is empty. This has the same semantics as g_unlink(). If @file doesn???t ... |
| delete_async | `File.delete_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_delete_async | 2.34 | Asynchronously delete a file. If the @file is a directory, it will only be deleted if it is empty. This has the same semantics as g_unlink(). |
| delete_finish | `File.delete_finish(result: AsyncResult) -> gboolean throws` | g_file_delete_finish | 2.34 | Finishes deleting a file started with g_file_delete_async(). |
| dup | `File.dup() -> File` | g_file_dup |  | Duplicates a #GFile handle. This operation does not duplicate the actual file or directory represented by the #GFile; see g_file_copy() if attempti... |
| eject_mountable | `File.eject_mountable(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_eject_mountable |  | Starts an asynchronous eject on a mountable. When this operation has completed, @callback will be called with @user_user data, and the operation ca... |
| eject_mountable_finish | `File.eject_mountable_finish(result: AsyncResult) -> gboolean throws` | g_file_eject_mountable_finish |  | Finishes an asynchronous eject operation started by g_file_eject_mountable(). |
| eject_mountable_with_operation | `File.eject_mountable_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_eject_mountable_with_operation | 2.22 | Starts an asynchronous eject on a mountable. When this operation has completed, @callback will be called with @user_user data, and the operation ca... |
| eject_mountable_with_operation_finish | `File.eject_mountable_with_operation_finish(result: AsyncResult) -> gboolean throws` | g_file_eject_mountable_with_operation_finish | 2.22 | Finishes an asynchronous eject operation started by g_file_eject_mountable_with_operation(). |
| enumerate_children | `File.enumerate_children(attributes: utf8, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> FileEnumerator throws` | g_file_enumerate_children |  | Gets the requested information about the files in a directory. The result is a #GFileEnumerator object that will give out #GFileInfo objects for al... |
| enumerate_children_async | `File.enumerate_children_async(attributes: utf8, flags: FileQueryInfoFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_enumerate_children_async |  | Asynchronously gets the requested information about the files in a directory. The result is a #GFileEnumerator object that will give out #GFileInfo... |
| enumerate_children_finish | `File.enumerate_children_finish(res: AsyncResult) -> FileEnumerator throws` | g_file_enumerate_children_finish |  | Finishes an async enumerate children operation. See g_file_enumerate_children_async(). |
| equal | `File.equal(file2: File) -> gboolean` | g_file_equal |  | Checks if the two given #GFiles refer to the same file. Note that two #GFiles that differ can still refer to the same file on the filesystem due to... |
| find_enclosing_mount | `File.find_enclosing_mount(cancellable: Cancellable?) -> Mount throws` | g_file_find_enclosing_mount |  | Gets a #GMount for the #GFile. #GMount is returned only for user interesting locations, see #GVolumeMonitor. If the #GFileIface for @file does not ... |
| find_enclosing_mount_async | `File.find_enclosing_mount_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_find_enclosing_mount_async |  | Asynchronously gets the mount for the file. For more details, see g_file_find_enclosing_mount() which is the synchronous version of this call. When... |
| find_enclosing_mount_finish | `File.find_enclosing_mount_finish(res: AsyncResult) -> Mount throws` | g_file_find_enclosing_mount_finish |  | Finishes an asynchronous find mount request. See g_file_find_enclosing_mount_async(). |
| get_basename | `File.get_basename() -> filename` | g_file_get_basename |  | Gets the base name (the last component of the path) for a given #GFile. If called for the top level of a system (such as the filesystem root or a u... |
| get_child | `File.get_child(name: filename) -> File` | g_file_get_child |  | Gets a child of @file with basename equal to @name. Note that the file with that specific name might not exist, but you can still have a #GFile tha... |
| get_child_for_display_name | `File.get_child_for_display_name(display_name: utf8) -> File throws` | g_file_get_child_for_display_name |  | Gets the child of @file for a given @display_name (i.e. a UTF-8 version of the name). If this function fails, it returns %NULL and @error will be s... |
| get_parent | `File.get_parent() -> File` | g_file_get_parent |  | Gets the parent directory for the @file. If the @file represents the root directory of the file system, then %NULL will be returned. This call does... |
| get_parse_name | `File.get_parse_name() -> utf8` | g_file_get_parse_name |  | Gets the parse name of the @file. A parse name is a UTF-8 string that describes the file such that one can get the #GFile back using g_file_parse_n... |
| get_path | `File.get_path() -> filename` | g_file_get_path |  | Gets the local pathname for #GFile, if one exists. If non-%NULL, this is guaranteed to be an absolute, canonical path. It might contain symlinks. T... |
| get_relative_path | `File.get_relative_path(descendant: File) -> filename` | g_file_get_relative_path |  | Gets the path for @descendant relative to @parent. This call does no blocking I/O. |
| get_uri | `File.get_uri() -> utf8` | g_file_get_uri |  | Gets the URI for the @file. This call does no blocking I/O. |
| get_uri_scheme | `File.get_uri_scheme() -> utf8` | g_file_get_uri_scheme |  | Gets the URI scheme for a #GFile. RFC 3986 decodes the scheme as: \|[ URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ] ]\| Common schemes in... |
| has_parent | `File.has_parent(parent: File?) -> gboolean` | g_file_has_parent | 2.24 | Checks if @file has a parent, and optionally, if it is @parent. If @parent is %NULL then this function returns %TRUE if @file has any parent at all... |
| has_prefix | `File.has_prefix(prefix: File) -> gboolean` | g_file_has_prefix |  | Checks whether @file has the prefix specified by @prefix. In other words, if the names of initial elements of @file's pathname match @prefix. Only ... |
| has_uri_scheme | `File.has_uri_scheme(uri_scheme: utf8) -> gboolean` | g_file_has_uri_scheme |  | Checks to see if a #GFile has a given URI scheme. This call does no blocking I/O. |
| hash | `File.hash() -> guint` | g_file_hash |  | Creates a hash value for a #GFile. This call does no blocking I/O. |
| is_native | `File.is_native() -> gboolean` | g_file_is_native |  | Checks to see if a file is native to the platform. A native file is one expressed in the platform-native filename format, e.g. "C:\Windows" or "/us... |
| load_bytes | `File.load_bytes(cancellable: Cancellable?, etag_out: out utf8?) -> GLib.Bytes throws` | g_file_load_bytes | 2.56 | Loads the contents of @file and returns it as #GBytes. If @file is a resource:// based URI, the resulting bytes will reference the embedded resourc... |
| load_bytes_async | `File.load_bytes_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_load_bytes_async | 2.56 | Asynchronously loads the contents of @file as #GBytes. If @file is a resource:// based URI, the resulting bytes will reference the embedded resourc... |
| load_bytes_finish | `File.load_bytes_finish(result: AsyncResult, etag_out: out utf8?) -> GLib.Bytes throws` | g_file_load_bytes_finish | 2.56 | Completes an asynchronous request to g_file_load_bytes_async(). For resources, @etag_out will be set to %NULL. The data contained in the resulting ... |
| load_contents | `File.load_contents(cancellable: Cancellable?, contents: out guint8, length: out gsize?, etag_out: out utf8?) -> gboolean throws` | g_file_load_contents |  | Loads the content of the file into memory. The data is always zero-terminated, but this is not included in the resultant @length. The returned @con... |
| load_contents_async | `File.load_contents_async(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_load_contents_async |  | Starts an asynchronous load of the @file's contents. For more details, see g_file_load_contents() which is the synchronous version of this call. Wh... |
| load_contents_finish | `File.load_contents_finish(res: AsyncResult, contents: out guint8, length: out gsize?, etag_out: out utf8?) -> gboolean throws` | g_file_load_contents_finish |  | Finishes an asynchronous load of the @file's contents. The contents are placed in @contents, and @length is set to the size of the @contents string... |
| load_partial_contents_async | `File.load_partial_contents_async(cancellable: Cancellable?, read_more_callback: FileReadMoreCallback, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_load_partial_contents_async |  | Reads the partial contents of a file. A #GFileReadMoreCallback should be used to stop reading from the file when appropriate, else this function wi... |
| load_partial_contents_finish | `File.load_partial_contents_finish(res: AsyncResult, contents: out guint8, length: out gsize?, etag_out: out utf8?) -> gboolean throws` | g_file_load_partial_contents_finish |  | Finishes an asynchronous partial load operation that was started with g_file_load_partial_contents_async(). The data is always zero-terminated, but... |
| make_directory | `File.make_directory(cancellable: Cancellable?) -> gboolean throws` | g_file_make_directory |  | Creates a directory. Note that this will only create a child directory of the immediate parent directory of the path or URI given by the #GFile. To... |
| make_directory_async | `File.make_directory_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_make_directory_async | 2.38 | Asynchronously creates a directory. |
| make_directory_finish | `File.make_directory_finish(result: AsyncResult) -> gboolean throws` | g_file_make_directory_finish | 2.38 | Finishes an asynchronous directory creation, started with g_file_make_directory_async(). |
| make_directory_with_parents | `File.make_directory_with_parents(cancellable: Cancellable?) -> gboolean throws` | g_file_make_directory_with_parents | 2.18 | Creates a directory and any parent directories that may not exist similar to 'mkdir -p'. If the file system does not support creating directories, ... |
| make_symbolic_link | `File.make_symbolic_link(symlink_value: filename, cancellable: Cancellable?) -> gboolean throws` | g_file_make_symbolic_link |  | Creates a symbolic link named @file which contains the string @symlink_value. If @cancellable is not %NULL, then the operation can be cancelled by ... |
| make_symbolic_link_async | `File.make_symbolic_link_async(symlink_value: filename, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_make_symbolic_link_async | 2.74 | Asynchronously creates a symbolic link named @file which contains the string @symlink_value. |
| make_symbolic_link_finish | `File.make_symbolic_link_finish(result: AsyncResult) -> gboolean throws` | g_file_make_symbolic_link_finish | 2.74 | Finishes an asynchronous symbolic link creation, started with g_file_make_symbolic_link_async(). |
| measure_disk_usage | `File.measure_disk_usage(flags: FileMeasureFlags, cancellable: Cancellable?, progress_callback: FileMeasureProgressCallback?, progress_data: gpointer?, disk_usage: out guint64?, num_dirs: out guint64?, num_files: out guint64?) -> gboolean throws` | g_file_measure_disk_usage | 2.38 | Recursively measures the disk usage of @file. This is essentially an analog of the 'du' command, but it also reports the number of directories and ... |
| measure_disk_usage_async | `File.measure_disk_usage_async(flags: FileMeasureFlags, io_priority: gint, cancellable: Cancellable?, progress_callback: FileMeasureProgressCallback?, progress_data: gpointer?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_measure_disk_usage_async | 2.38 | Recursively measures the disk usage of @file. This is the asynchronous version of g_file_measure_disk_usage(). See there for more information. |
| measure_disk_usage_finish | `File.measure_disk_usage_finish(result: AsyncResult, disk_usage: out guint64?, num_dirs: out guint64?, num_files: out guint64?) -> gboolean throws` | g_file_measure_disk_usage_finish | 2.38 | Collects the results from an earlier call to g_file_measure_disk_usage_async(). See g_file_measure_disk_usage() for more information. |
| monitor | `File.monitor(flags: FileMonitorFlags, cancellable: Cancellable?) -> FileMonitor throws` | g_file_monitor | 2.18 | Obtains a file or directory monitor for the given file, depending on the type of the file. If @cancellable is not %NULL, then the operation can be ... |
| monitor_directory | `File.monitor_directory(flags: FileMonitorFlags, cancellable: Cancellable?) -> FileMonitor throws` | g_file_monitor_directory |  | Obtains a directory monitor for the given file. This may fail if directory monitoring is not supported. If @cancellable is not %NULL, then the oper... |
| monitor_file | `File.monitor_file(flags: FileMonitorFlags, cancellable: Cancellable?) -> FileMonitor throws` | g_file_monitor_file |  | Obtains a file monitor for the given file. If no file notification mechanism exists, then regular polling of the file is used. If @cancellable is n... |
| mount_enclosing_volume | `File.mount_enclosing_volume(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_mount_enclosing_volume |  | Starts a @mount_operation, mounting the volume that contains the file @location. When this operation has completed, @callback will be called with @... |
| mount_enclosing_volume_finish | `File.mount_enclosing_volume_finish(result: AsyncResult) -> gboolean throws` | g_file_mount_enclosing_volume_finish |  | Finishes a mount operation started by g_file_mount_enclosing_volume(). |
| mount_mountable | `File.mount_mountable(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_mount_mountable |  | Mounts a file of type G_FILE_TYPE_MOUNTABLE. Using @mount_operation, you can request callbacks when, for instance, passwords are needed during auth... |
| mount_mountable_finish | `File.mount_mountable_finish(result: AsyncResult) -> File throws` | g_file_mount_mountable_finish |  | Finishes a mount operation. See g_file_mount_mountable() for details. Finish an asynchronous mount operation that was started with g_file_mount_mou... |
| move | `File.move(destination: File, flags: FileCopyFlags, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?) -> gboolean throws` | g_file_move |  | Tries to move the file or directory @source to the location specified by @destination. If native move operations are supported then this is used, o... |
| move_async | `File.move_async(destination: File, flags: FileCopyFlags, io_priority: gint, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_move_async | 2.72 | Asynchronously moves a file @source to the location of @destination. For details of the behaviour, see g_file_move(). If @progress_callback is not ... |
| move_finish | `File.move_finish(result: AsyncResult) -> gboolean throws` | g_file_move_finish | 2.72 | Finishes an asynchronous file movement, started with g_file_move_async(). |
| open_readwrite | `File.open_readwrite(cancellable: Cancellable?) -> FileIOStream throws` | g_file_open_readwrite | 2.22 | Opens an existing file for reading and writing. The result is a #GFileIOStream that can be used to read and write the contents of the file. If @can... |
| open_readwrite_async | `File.open_readwrite_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_open_readwrite_async | 2.22 | Asynchronously opens @file for reading and writing. For more details, see g_file_open_readwrite() which is the synchronous version of this call. Wh... |
| open_readwrite_finish | `File.open_readwrite_finish(res: AsyncResult) -> FileIOStream throws` | g_file_open_readwrite_finish | 2.22 | Finishes an asynchronous file read operation started with g_file_open_readwrite_async(). |
| peek_path | `File.peek_path() -> filename` | g_file_peek_path | 2.56 | Exactly like g_file_get_path(), but caches the result via g_object_set_qdata_full(). This is useful for example in C applications which mix `g_file... |
| poll_mountable | `File.poll_mountable(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_poll_mountable | 2.22 | Polls a file of type %G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable object... |
| poll_mountable_finish | `File.poll_mountable_finish(result: AsyncResult) -> gboolean throws` | g_file_poll_mountable_finish | 2.22 | Finishes a poll operation. See g_file_poll_mountable() for details. Finish an asynchronous poll operation that was polled with g_file_poll_mountabl... |
| query_default_handler | `File.query_default_handler(cancellable: Cancellable?) -> AppInfo throws` | g_file_query_default_handler |  | Returns the #GAppInfo that is registered as the default application to handle the file specified by @file. If @cancellable is not %NULL, then the o... |
| query_default_handler_async | `File.query_default_handler_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_query_default_handler_async | 2.60 | Async version of g_file_query_default_handler(). |
| query_default_handler_finish | `File.query_default_handler_finish(result: AsyncResult) -> AppInfo throws` | g_file_query_default_handler_finish | 2.60 | Finishes a g_file_query_default_handler_async() operation. |
| query_exists | `File.query_exists(cancellable: Cancellable?) -> gboolean` | g_file_query_exists |  | Utility function to check if a particular file exists. This is implemented using g_file_query_info() and as such does blocking I/O. Note that in ma... |
| query_file_type | `File.query_file_type(flags: FileQueryInfoFlags, cancellable: Cancellable?) -> FileType` | g_file_query_file_type | 2.18 | Utility function to inspect the #GFileType of a file. This is implemented using g_file_query_info() and as such does blocking I/O. The primary use ... |
| query_filesystem_info | `File.query_filesystem_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` | g_file_query_filesystem_info |  | Similar to g_file_query_info(), but obtains information about the filesystem the @file is on, rather than the file itself. For instance the amount ... |
| query_filesystem_info_async | `File.query_filesystem_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_query_filesystem_info_async |  | Asynchronously gets the requested information about the filesystem that the specified @file is on. The result is a #GFileInfo object that contains ... |
| query_filesystem_info_finish | `File.query_filesystem_info_finish(res: AsyncResult) -> FileInfo throws` | g_file_query_filesystem_info_finish |  | Finishes an asynchronous filesystem info query. See g_file_query_filesystem_info_async(). |
| query_info | `File.query_info(attributes: utf8, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> FileInfo throws` | g_file_query_info |  | Gets the requested information about specified @file. The result is a #GFileInfo object that contains key-value attributes (such as the type or siz... |
| query_info_async | `File.query_info_async(attributes: utf8, flags: FileQueryInfoFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_query_info_async |  | Asynchronously gets the requested information about specified @file. The result is a #GFileInfo object that contains key-value attributes (such as ... |
| query_info_finish | `File.query_info_finish(res: AsyncResult) -> FileInfo throws` | g_file_query_info_finish |  | Finishes an asynchronous file info query. See g_file_query_info_async(). |
| query_settable_attributes | `File.query_settable_attributes(cancellable: Cancellable?) -> FileAttributeInfoList throws` | g_file_query_settable_attributes |  | Obtain the list of settable attributes for the file. Returns the type and full attribute name of all the attributes that can be set on this file. T... |
| query_writable_namespaces | `File.query_writable_namespaces(cancellable: Cancellable?) -> FileAttributeInfoList throws` | g_file_query_writable_namespaces |  | Obtain the list of attribute namespaces where new attributes can be created by a user. An example of this is extended attributes (in the "xattr" na... |
| read | `File.read(cancellable: Cancellable?) -> FileInputStream throws` | g_file_read |  | Opens a file for reading. The result is a #GFileInputStream that can be used to read the contents of the file. If @cancellable is not %NULL, then t... |
| read_async | `File.read_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_read_async |  | Asynchronously opens @file for reading. For more details, see g_file_read() which is the synchronous version of this call. When the operation is fi... |
| read_finish | `File.read_finish(res: AsyncResult) -> FileInputStream throws` | g_file_read_finish |  | Finishes an asynchronous file read operation started with g_file_read_async(). |
| replace | `File.replace(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, cancellable: Cancellable?) -> FileOutputStream throws` | g_file_replace |  | Returns an output stream for overwriting the file, possibly creating a backup copy of the file first. If the file doesn't exist, it will be created... |
| replace_async | `File.replace_async(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_replace_async |  | Asynchronously overwrites the file, replacing the contents, possibly creating a backup copy of the file first. For more details, see g_file_replace... |
| replace_contents | `File.replace_contents(contents: guint8, length: gsize, etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, new_etag: out utf8?, cancellable: Cancellable?) -> gboolean throws` | g_file_replace_contents |  | Replaces the contents of @file with @contents of @length bytes. If @etag is specified (not %NULL), any existing file must have that etag, or the er... |
| replace_contents_async | `File.replace_contents_async(contents: guint8, length: gsize, etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_replace_contents_async |  | Starts an asynchronous replacement of @file with the given @contents of @length bytes. @etag will replace the document's current entity tag. When t... |
| replace_contents_bytes_async | `File.replace_contents_bytes_async(contents: GLib.Bytes, etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_replace_contents_bytes_async | 2.40 | Same as g_file_replace_contents_async() but takes a #GBytes input instead. This function will keep a ref on @contents until the operation is done. ... |
| replace_contents_finish | `File.replace_contents_finish(res: AsyncResult, new_etag: out utf8?) -> gboolean throws` | g_file_replace_contents_finish |  | Finishes an asynchronous replace of the given @file. See g_file_replace_contents_async(). Sets @new_etag to the new entity tag for the document, if... |
| replace_finish | `File.replace_finish(res: AsyncResult) -> FileOutputStream throws` | g_file_replace_finish |  | Finishes an asynchronous file replace operation started with g_file_replace_async(). |
| replace_readwrite | `File.replace_readwrite(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, cancellable: Cancellable?) -> FileIOStream throws` | g_file_replace_readwrite | 2.22 | Returns an output stream for overwriting the file in readwrite mode, possibly creating a backup copy of the file first. If the file doesn't exist, ... |
| replace_readwrite_async | `File.replace_readwrite_async(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_replace_readwrite_async | 2.22 | Asynchronously overwrites the file in read-write mode, replacing the contents, possibly creating a backup copy of the file first. For more details,... |
| replace_readwrite_finish | `File.replace_readwrite_finish(res: AsyncResult) -> FileIOStream throws` | g_file_replace_readwrite_finish | 2.22 | Finishes an asynchronous file replace operation started with g_file_replace_readwrite_async(). |
| resolve_relative_path | `File.resolve_relative_path(relative_path: filename) -> File` | g_file_resolve_relative_path |  | Resolves a relative path for @file to an absolute path. This call does no blocking I/O. If the @relative_path is an absolute path name, the resolut... |
| set_attribute | `File.set_attribute(attribute: utf8, type: FileAttributeType, value_p: gpointer?, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute |  | Sets an attribute in the file with attribute name @attribute to @value_p. Some attributes can be unset by setting @type to %G_FILE_ATTRIBUTE_TYPE_I... |
| set_attribute_byte_string | `File.set_attribute_byte_string(attribute: utf8, value: utf8, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute_byte_string |  | Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING to @value. If @attribute is of a different type, this operation will fail, returning %FA... |
| set_attribute_int32 | `File.set_attribute_int32(attribute: utf8, value: gint32, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute_int32 |  | Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_INT32 to @value. If @attribute is of a different type, this operation will fail. If @cancellable is ... |
| set_attribute_int64 | `File.set_attribute_int64(attribute: utf8, value: gint64, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute_int64 |  | Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_INT64 to @value. If @attribute is of a different type, this operation will fail. If @cancellable is ... |
| set_attribute_string | `File.set_attribute_string(attribute: utf8, value: utf8, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute_string |  | Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_STRING to @value. If @attribute is of a different type, this operation will fail. If @cancellable is... |
| set_attribute_uint32 | `File.set_attribute_uint32(attribute: utf8, value: guint32, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute_uint32 |  | Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_UINT32 to @value. If @attribute is of a different type, this operation will fail. If @cancellable is... |
| set_attribute_uint64 | `File.set_attribute_uint64(attribute: utf8, value: guint64, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attribute_uint64 |  | Sets @attribute of type %G_FILE_ATTRIBUTE_TYPE_UINT64 to @value. If @attribute is of a different type, this operation will fail. If @cancellable is... |
| set_attributes_async | `File.set_attributes_async(info: FileInfo, flags: FileQueryInfoFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_set_attributes_async |  | Asynchronously sets the attributes of @file with @info. For more details, see g_file_set_attributes_from_info(), which is the synchronous version o... |
| set_attributes_finish | `File.set_attributes_finish(result: AsyncResult, info: out FileInfo) -> gboolean throws` | g_file_set_attributes_finish |  | Finishes setting an attribute started in g_file_set_attributes_async(). |
| set_attributes_from_info | `File.set_attributes_from_info(info: FileInfo, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` | g_file_set_attributes_from_info |  | Tries to set all attributes in the #GFileInfo on the target values, not stopping on the first error. If there is any error during this operation th... |
| set_display_name | `File.set_display_name(display_name: utf8, cancellable: Cancellable?) -> File throws` | g_file_set_display_name |  | Renames @file to the specified display name. The display name is converted from UTF-8 to the correct encoding for the target filesystem if possible... |
| set_display_name_async | `File.set_display_name_async(display_name: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_set_display_name_async |  | Asynchronously sets the display name for a given #GFile. For more details, see g_file_set_display_name() which is the synchronous version of this c... |
| set_display_name_finish | `File.set_display_name_finish(res: AsyncResult) -> File throws` | g_file_set_display_name_finish |  | Finishes setting a display name started with g_file_set_display_name_async(). |
| start_mountable | `File.start_mountable(flags: DriveStartFlags, start_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_start_mountable | 2.22 | Starts a file of type %G_FILE_TYPE_MOUNTABLE. Using @start_operation, you can request callbacks when, for instance, passwords are needed during aut... |
| start_mountable_finish | `File.start_mountable_finish(result: AsyncResult) -> gboolean throws` | g_file_start_mountable_finish | 2.22 | Finishes a start operation. See g_file_start_mountable() for details. Finish an asynchronous start operation that was started with g_file_start_mou... |
| stop_mountable | `File.stop_mountable(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_stop_mountable | 2.22 | Stops a file of type %G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable object... |
| stop_mountable_finish | `File.stop_mountable_finish(result: AsyncResult) -> gboolean throws` | g_file_stop_mountable_finish | 2.22 | Finishes a stop operation, see g_file_stop_mountable() for details. Finish an asynchronous stop operation that was started with g_file_stop_mountab... |
| supports_thread_contexts | `File.supports_thread_contexts() -> gboolean` | g_file_supports_thread_contexts | 2.22 | Checks if @file supports [thread-default contexts][g-main-context-push-thread-default-context]. If this returns %FALSE, you cannot perform asynchro... |
| trash | `File.trash(cancellable: Cancellable?) -> gboolean throws` | g_file_trash |  | Sends @file to the "Trashcan", if possible. This is similar to deleting it, but the user can recover it before emptying the trashcan. Not all file ... |
| trash_async | `File.trash_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_trash_async | 2.38 | Asynchronously sends @file to the Trash location, if possible. |
| trash_finish | `File.trash_finish(result: AsyncResult) -> gboolean throws` | g_file_trash_finish | 2.38 | Finishes an asynchronous file trashing operation, started with g_file_trash_async(). |
| unmount_mountable | `File.unmount_mountable(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_unmount_mountable |  | Unmounts a file of type G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable obje... |
| unmount_mountable_finish | `File.unmount_mountable_finish(result: AsyncResult) -> gboolean throws` | g_file_unmount_mountable_finish |  | Finishes an unmount operation, see g_file_unmount_mountable() for details. Finish an asynchronous unmount operation that was started with g_file_un... |
| unmount_mountable_with_operation | `File.unmount_mountable_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_unmount_mountable_with_operation | 2.22 | Unmounts a file of type %G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable obj... |
| unmount_mountable_with_operation_finish | `File.unmount_mountable_with_operation_finish(result: AsyncResult) -> gboolean throws` | g_file_unmount_mountable_with_operation_finish | 2.22 | Finishes an unmount operation, see g_file_unmount_mountable_with_operation() for details. Finish an asynchronous unmount operation that was started... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_to | `append_to(flags: FileCreateFlags, cancellable: Cancellable?) -> FileOutputStream throws` |  |  | Gets an output stream for appending data to the file. If the file doesn't already exist it is created. By default files created are generally reada... |
| append_to_async | `append_to_async(flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously opens @file for appending. For more details, see g_file_append_to() which is the synchronous version of this call. When the operatio... |
| append_to_finish | `append_to_finish(res: AsyncResult) -> FileOutputStream throws` |  |  | Finishes an asynchronous file append operation started with g_file_append_to_async(). |
| copy | `copy(destination: File, flags: FileCopyFlags, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?) -> gboolean throws` |  |  | Copies the file @source to the location specified by @destination. Can not handle recursive copies of directories. If the flag %G_FILE_COPY_OVERWRI... |
| copy_async | `copy_async(destination: File, flags: FileCopyFlags, io_priority: gint, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Copies the file @source to the location specified by @destination asynchronously. For details of the behaviour, see g_file_copy(). If @progress_cal... |
| copy_finish | `copy_finish(res: AsyncResult) -> gboolean throws` |  |  | Finishes copying the file started with g_file_copy_async(). |
| create | `create(flags: FileCreateFlags, cancellable: Cancellable?) -> FileOutputStream throws` |  |  | Creates a new file and returns an output stream for writing to it. The file must not already exist. By default files created are generally readable... |
| create_async | `create_async(flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously creates a new file and returns an output stream for writing to it. The file must not already exist. For more details, see g_file_cre... |
| create_finish | `create_finish(res: AsyncResult) -> FileOutputStream throws` |  |  | Finishes an asynchronous file create operation started with g_file_create_async(). |
| create_readwrite | `create_readwrite(flags: FileCreateFlags, cancellable: Cancellable?) -> FileIOStream throws` |  | 2.22 | Creates a new file and returns a stream for reading and writing to it. The file must not already exist. By default files created are generally read... |
| create_readwrite_async | `create_readwrite_async(flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Asynchronously creates a new file and returns a stream for reading and writing to it. The file must not already exist. For more details, see g_file... |
| create_readwrite_finish | `create_readwrite_finish(res: AsyncResult) -> FileIOStream throws` |  | 2.22 | Finishes an asynchronous file create operation started with g_file_create_readwrite_async(). |
| delete_file | `delete_file(cancellable: Cancellable?) -> gboolean throws` |  |  | Deletes a file. If the @file is a directory, it will only be deleted if it is empty. This has the same semantics as g_unlink(). If @file doesn???t ... |
| delete_file_async | `delete_file_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.34 | Asynchronously delete a file. If the @file is a directory, it will only be deleted if it is empty. This has the same semantics as g_unlink(). |
| delete_file_finish | `delete_file_finish(result: AsyncResult) -> gboolean throws` |  | 2.34 | Finishes deleting a file started with g_file_delete_async(). |
| dup | `dup() -> File` |  |  | Duplicates a #GFile handle. This operation does not duplicate the actual file or directory represented by the #GFile; see g_file_copy() if attempti... |
| eject_mountable | `eject_mountable(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Starts an asynchronous eject on a mountable. When this operation has completed, @callback will be called with @user_user data, and the operation ca... |
| eject_mountable_finish | `eject_mountable_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes an asynchronous eject operation started by g_file_eject_mountable(). |
| eject_mountable_with_operation | `eject_mountable_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Starts an asynchronous eject on a mountable. When this operation has completed, @callback will be called with @user_user data, and the operation ca... |
| eject_mountable_with_operation_finish | `eject_mountable_with_operation_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes an asynchronous eject operation started by g_file_eject_mountable_with_operation(). |
| enumerate_children | `enumerate_children(attributes: utf8, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> FileEnumerator throws` |  |  | Gets the requested information about the files in a directory. The result is a #GFileEnumerator object that will give out #GFileInfo objects for al... |
| enumerate_children_async | `enumerate_children_async(attributes: utf8, flags: FileQueryInfoFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously gets the requested information about the files in a directory. The result is a #GFileEnumerator object that will give out #GFileInfo... |
| enumerate_children_finish | `enumerate_children_finish(res: AsyncResult) -> FileEnumerator throws` |  |  | Finishes an async enumerate children operation. See g_file_enumerate_children_async(). |
| equal | `equal(file2: File) -> gboolean` |  |  | Checks if the two given #GFiles refer to the same file. Note that two #GFiles that differ can still refer to the same file on the filesystem due to... |
| find_enclosing_mount | `find_enclosing_mount(cancellable: Cancellable?) -> Mount throws` |  |  | Gets a #GMount for the #GFile. #GMount is returned only for user interesting locations, see #GVolumeMonitor. If the #GFileIface for @file does not ... |
| find_enclosing_mount_async | `find_enclosing_mount_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously gets the mount for the file. For more details, see g_file_find_enclosing_mount() which is the synchronous version of this call. When... |
| find_enclosing_mount_finish | `find_enclosing_mount_finish(res: AsyncResult) -> Mount throws` |  |  | Finishes an asynchronous find mount request. See g_file_find_enclosing_mount_async(). |
| get_basename | `get_basename() -> filename` |  |  | Gets the base name (the last component of the path) for a given #GFile. If called for the top level of a system (such as the filesystem root or a u... |
| get_child_for_display_name | `get_child_for_display_name(display_name: utf8) -> File throws` |  |  | Gets the child of @file for a given @display_name (i.e. a UTF-8 version of the name). If this function fails, it returns %NULL and @error will be s... |
| get_parent | `get_parent() -> File` |  |  | Gets the parent directory for the @file. If the @file represents the root directory of the file system, then %NULL will be returned. This call does... |
| get_parse_name | `get_parse_name() -> utf8` |  |  | Gets the parse name of the @file. A parse name is a UTF-8 string that describes the file such that one can get the #GFile back using g_file_parse_n... |
| get_path | `get_path() -> filename` |  |  | Gets the local pathname for #GFile, if one exists. If non-%NULL, this is guaranteed to be an absolute, canonical path. It might contain symlinks. T... |
| get_relative_path | `get_relative_path(descendant: File) -> filename` |  |  | Gets the path for @descendant relative to @parent. This call does no blocking I/O. |
| get_uri | `get_uri() -> utf8` |  |  | Gets the URI for the @file. This call does no blocking I/O. |
| get_uri_scheme | `get_uri_scheme() -> utf8` |  |  | Gets the URI scheme for a #GFile. RFC 3986 decodes the scheme as: \|[ URI = scheme ":" hier-part [ "?" query ] [ "#" fragment ] ]\| Common schemes in... |
| has_uri_scheme | `has_uri_scheme(uri_scheme: utf8) -> gboolean` |  |  | Checks to see if a #GFile has a given URI scheme. This call does no blocking I/O. |
| hash | `hash() -> guint` |  |  | Creates a hash value for a #GFile. This call does no blocking I/O. |
| is_native | `is_native() -> gboolean` |  |  | Checks to see if a file is native to the platform. A native file is one expressed in the platform-native filename format, e.g. "C:\Windows" or "/us... |
| make_directory | `make_directory(cancellable: Cancellable?) -> gboolean throws` |  |  | Creates a directory. Note that this will only create a child directory of the immediate parent directory of the path or URI given by the #GFile. To... |
| make_directory_async | `make_directory_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.38 | Asynchronously creates a directory. |
| make_directory_finish | `make_directory_finish(result: AsyncResult) -> gboolean throws` |  | 2.38 | Finishes an asynchronous directory creation, started with g_file_make_directory_async(). |
| make_symbolic_link | `make_symbolic_link(symlink_value: filename, cancellable: Cancellable?) -> gboolean throws` |  |  | Creates a symbolic link named @file which contains the string @symlink_value. If @cancellable is not %NULL, then the operation can be cancelled by ... |
| make_symbolic_link_async | `make_symbolic_link_async(symlink_value: filename, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.74 | Asynchronously creates a symbolic link named @file which contains the string @symlink_value. |
| make_symbolic_link_finish | `make_symbolic_link_finish(result: AsyncResult) -> gboolean throws` |  | 2.74 | Finishes an asynchronous symbolic link creation, started with g_file_make_symbolic_link_async(). |
| measure_disk_usage | `measure_disk_usage(flags: FileMeasureFlags, cancellable: Cancellable?, progress_callback: FileMeasureProgressCallback?, progress_data: gpointer?, disk_usage: out guint64?, num_dirs: out guint64?, num_files: out guint64?) -> gboolean throws` |  | 2.38 | Recursively measures the disk usage of @file. This is essentially an analog of the 'du' command, but it also reports the number of directories and ... |
| measure_disk_usage_async | `measure_disk_usage_async(flags: FileMeasureFlags, io_priority: gint, cancellable: Cancellable?, progress_callback: FileMeasureProgressCallback?, progress_data: gpointer?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.38 | Recursively measures the disk usage of @file. This is the asynchronous version of g_file_measure_disk_usage(). See there for more information. |
| measure_disk_usage_finish | `measure_disk_usage_finish(result: AsyncResult, disk_usage: out guint64?, num_dirs: out guint64?, num_files: out guint64?) -> gboolean throws` |  | 2.38 | Collects the results from an earlier call to g_file_measure_disk_usage_async(). See g_file_measure_disk_usage() for more information. |
| monitor_dir | `monitor_dir(flags: FileMonitorFlags, cancellable: Cancellable?) -> FileMonitor throws` |  |  | Obtains a directory monitor for the given file. This may fail if directory monitoring is not supported. If @cancellable is not %NULL, then the oper... |
| monitor_file | `monitor_file(flags: FileMonitorFlags, cancellable: Cancellable?) -> FileMonitor throws` |  |  | Obtains a file monitor for the given file. If no file notification mechanism exists, then regular polling of the file is used. If @cancellable is n... |
| mount_enclosing_volume | `mount_enclosing_volume(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Starts a @mount_operation, mounting the volume that contains the file @location. When this operation has completed, @callback will be called with @... |
| mount_enclosing_volume_finish | `mount_enclosing_volume_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes a mount operation started by g_file_mount_enclosing_volume(). |
| mount_mountable | `mount_mountable(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Mounts a file of type G_FILE_TYPE_MOUNTABLE. Using @mount_operation, you can request callbacks when, for instance, passwords are needed during auth... |
| mount_mountable_finish | `mount_mountable_finish(result: AsyncResult) -> File throws` |  |  | Finishes a mount operation. See g_file_mount_mountable() for details. Finish an asynchronous mount operation that was started with g_file_mount_mou... |
| move | `move(destination: File, flags: FileCopyFlags, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?) -> gboolean throws` |  |  | Tries to move the file or directory @source to the location specified by @destination. If native move operations are supported then this is used, o... |
| move_async | `move_async(destination: File, flags: FileCopyFlags, io_priority: gint, cancellable: Cancellable?, progress_callback: FileProgressCallback?, progress_callback_data: gpointer?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.72 | Asynchronously moves a file @source to the location of @destination. For details of the behaviour, see g_file_move(). If @progress_callback is not ... |
| move_finish | `move_finish(result: AsyncResult) -> gboolean throws` |  | 2.72 | Finishes an asynchronous file movement, started with g_file_move_async(). |
| open_readwrite | `open_readwrite(cancellable: Cancellable?) -> FileIOStream throws` |  | 2.22 | Opens an existing file for reading and writing. The result is a #GFileIOStream that can be used to read and write the contents of the file. If @can... |
| open_readwrite_async | `open_readwrite_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Asynchronously opens @file for reading and writing. For more details, see g_file_open_readwrite() which is the synchronous version of this call. Wh... |
| open_readwrite_finish | `open_readwrite_finish(res: AsyncResult) -> FileIOStream throws` |  | 2.22 | Finishes an asynchronous file read operation started with g_file_open_readwrite_async(). |
| poll_mountable | `poll_mountable(cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Polls a file of type %G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable object... |
| poll_mountable_finish | `poll_mountable_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes a poll operation. See g_file_poll_mountable() for details. Finish an asynchronous poll operation that was polled with g_file_poll_mountabl... |
| prefix_matches | `prefix_matches(file: File) -> gboolean` |  |  | Checks whether @file has the prefix specified by @prefix. In other words, if the names of initial elements of @file's pathname match @prefix. Only ... |
| query_filesystem_info | `query_filesystem_info(attributes: utf8, cancellable: Cancellable?) -> FileInfo throws` |  |  | Similar to g_file_query_info(), but obtains information about the filesystem the @file is on, rather than the file itself. For instance the amount ... |
| query_filesystem_info_async | `query_filesystem_info_async(attributes: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously gets the requested information about the filesystem that the specified @file is on. The result is a #GFileInfo object that contains ... |
| query_filesystem_info_finish | `query_filesystem_info_finish(res: AsyncResult) -> FileInfo throws` |  |  | Finishes an asynchronous filesystem info query. See g_file_query_filesystem_info_async(). |
| query_info | `query_info(attributes: utf8, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> FileInfo throws` |  |  | Gets the requested information about specified @file. The result is a #GFileInfo object that contains key-value attributes (such as the type or siz... |
| query_info_async | `query_info_async(attributes: utf8, flags: FileQueryInfoFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously gets the requested information about specified @file. The result is a #GFileInfo object that contains key-value attributes (such as ... |
| query_info_finish | `query_info_finish(res: AsyncResult) -> FileInfo throws` |  |  | Finishes an asynchronous file info query. See g_file_query_info_async(). |
| query_settable_attributes | `query_settable_attributes(cancellable: Cancellable?) -> FileAttributeInfoList throws` |  |  | Obtain the list of settable attributes for the file. Returns the type and full attribute name of all the attributes that can be set on this file. T... |
| query_writable_namespaces | `query_writable_namespaces(cancellable: Cancellable?) -> FileAttributeInfoList throws` |  |  | Obtain the list of attribute namespaces where new attributes can be created by a user. An example of this is extended attributes (in the "xattr" na... |
| read_async | `read_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously opens @file for reading. For more details, see g_file_read() which is the synchronous version of this call. When the operation is fi... |
| read_finish | `read_finish(res: AsyncResult) -> FileInputStream throws` |  |  | Finishes an asynchronous file read operation started with g_file_read_async(). |
| read_fn | `read_fn(cancellable: Cancellable?) -> FileInputStream throws` |  |  | Opens a file for reading. The result is a #GFileInputStream that can be used to read the contents of the file. If @cancellable is not %NULL, then t... |
| replace | `replace(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, cancellable: Cancellable?) -> FileOutputStream throws` |  |  | Returns an output stream for overwriting the file, possibly creating a backup copy of the file first. If the file doesn't exist, it will be created... |
| replace_async | `replace_async(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously overwrites the file, replacing the contents, possibly creating a backup copy of the file first. For more details, see g_file_replace... |
| replace_finish | `replace_finish(res: AsyncResult) -> FileOutputStream throws` |  |  | Finishes an asynchronous file replace operation started with g_file_replace_async(). |
| replace_readwrite | `replace_readwrite(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, cancellable: Cancellable?) -> FileIOStream throws` |  | 2.22 | Returns an output stream for overwriting the file in readwrite mode, possibly creating a backup copy of the file first. If the file doesn't exist, ... |
| replace_readwrite_async | `replace_readwrite_async(etag: utf8?, make_backup: gboolean, flags: FileCreateFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Asynchronously overwrites the file in read-write mode, replacing the contents, possibly creating a backup copy of the file first. For more details,... |
| replace_readwrite_finish | `replace_readwrite_finish(res: AsyncResult) -> FileIOStream throws` |  | 2.22 | Finishes an asynchronous file replace operation started with g_file_replace_readwrite_async(). |
| resolve_relative_path | `resolve_relative_path(relative_path: filename) -> File` |  |  | Resolves a relative path for @file to an absolute path. This call does no blocking I/O. If the @relative_path is an absolute path name, the resolut... |
| set_attribute | `set_attribute(attribute: utf8, type: FileAttributeType, value_p: gpointer?, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` |  |  | Sets an attribute in the file with attribute name @attribute to @value_p. Some attributes can be unset by setting @type to %G_FILE_ATTRIBUTE_TYPE_I... |
| set_attributes_async | `set_attributes_async(info: FileInfo, flags: FileQueryInfoFlags, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously sets the attributes of @file with @info. For more details, see g_file_set_attributes_from_info(), which is the synchronous version o... |
| set_attributes_finish | `set_attributes_finish(result: AsyncResult, info: out FileInfo) -> gboolean throws` |  |  | Finishes setting an attribute started in g_file_set_attributes_async(). |
| set_attributes_from_info | `set_attributes_from_info(info: FileInfo, flags: FileQueryInfoFlags, cancellable: Cancellable?) -> gboolean throws` |  |  | Tries to set all attributes in the #GFileInfo on the target values, not stopping on the first error. If there is any error during this operation th... |
| set_display_name | `set_display_name(display_name: utf8, cancellable: Cancellable?) -> File throws` |  |  | Renames @file to the specified display name. The display name is converted from UTF-8 to the correct encoding for the target filesystem if possible... |
| set_display_name_async | `set_display_name_async(display_name: utf8, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously sets the display name for a given #GFile. For more details, see g_file_set_display_name() which is the synchronous version of this c... |
| set_display_name_finish | `set_display_name_finish(res: AsyncResult) -> File throws` |  |  | Finishes setting a display name started with g_file_set_display_name_async(). |
| start_mountable | `start_mountable(flags: DriveStartFlags, start_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Starts a file of type %G_FILE_TYPE_MOUNTABLE. Using @start_operation, you can request callbacks when, for instance, passwords are needed during aut... |
| start_mountable_finish | `start_mountable_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes a start operation. See g_file_start_mountable() for details. Finish an asynchronous start operation that was started with g_file_start_mou... |
| stop_mountable | `stop_mountable(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Stops a file of type %G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable object... |
| stop_mountable_finish | `stop_mountable_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes a stop operation, see g_file_stop_mountable() for details. Finish an asynchronous stop operation that was started with g_file_stop_mountab... |
| trash | `trash(cancellable: Cancellable?) -> gboolean throws` |  |  | Sends @file to the "Trashcan", if possible. This is similar to deleting it, but the user can recover it before emptying the trashcan. Not all file ... |
| trash_async | `trash_async(io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.38 | Asynchronously sends @file to the Trash location, if possible. |
| trash_finish | `trash_finish(result: AsyncResult) -> gboolean throws` |  | 2.38 | Finishes an asynchronous file trashing operation, started with g_file_trash_async(). |
| unmount_mountable | `unmount_mountable(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Unmounts a file of type G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable obje... |
| unmount_mountable_finish | `unmount_mountable_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes an unmount operation, see g_file_unmount_mountable() for details. Finish an asynchronous unmount operation that was started with g_file_un... |
| unmount_mountable_with_operation | `unmount_mountable_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Unmounts a file of type %G_FILE_TYPE_MOUNTABLE. If @cancellable is not %NULL, then the operation can be cancelled by triggering the cancellable obj... |
| unmount_mountable_with_operation_finish | `unmount_mountable_with_operation_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes an unmount operation, see g_file_unmount_mountable_with_operation() for details. Finish an asynchronous unmount operation that was started... |

### Gio.FileDescriptorBased

GType: `GFileDescriptorBased` ?? C type: `GFileDescriptorBased`

`GFileDescriptorBased` is an interface for file descriptor based IO. It is implemented by streams (implementations of [class@Gio.InputStream] or [c...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fd | `FileDescriptorBased.get_fd() -> gint` | g_file_descriptor_based_get_fd | 2.24 | Gets the underlying file descriptor. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fd | `get_fd() -> gint` |  | 2.24 | Gets the underlying file descriptor. |

### Gio.Icon

GType: `GIcon` ?? C type: `GIcon`

`GIcon` is a very minimal interface for icons. It provides functions for checking the equality of two icons, hashing of icons and serializing an ic...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize | `deserialize(value: GLib.Variant) -> Icon` | g_icon_deserialize | 2.38 | Deserializes a #GIcon previously serialized using g_icon_serialize(). |
| new_for_string | `new_for_string(str: utf8) -> Icon throws` | g_icon_new_for_string | 2.20 | Generate a #GIcon instance from @str. This function can fail if @str is not valid - see g_icon_to_string() for discussion. If your application or l... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `Icon.equal(icon2: Icon?) -> gboolean` | g_icon_equal |  | Checks if two icons are equal. |
| hash | `Icon.hash() -> guint` | g_icon_hash |  | Gets a hash for an icon. |
| serialize | `Icon.serialize() -> GLib.Variant` | g_icon_serialize | 2.38 | Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved back by calling g_icon_deserialize() on the returned value. As serializ... |
| to_string | `Icon.to_string() -> utf8` | g_icon_to_string | 2.20 | Generates a textual representation of @icon that can be used for serialization such as when passing @icon to a different process or saving it to pe... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `equal(icon2: Icon?) -> gboolean` |  |  | Checks if two icons are equal. |
| hash | `hash() -> guint` |  |  | Gets a hash for an icon. |
| serialize | `serialize() -> GLib.Variant` |  | 2.38 | Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved back by calling g_icon_deserialize() on the returned value. As serializ... |
| to_tokens | `to_tokens(tokens: out utf8, out_version: out gint) -> gboolean` |  | 2.20 | Serializes the @icon into string tokens. This is can be invoked when g_icon_new_for_string() is called. |

### Gio.Initable

GType: `GInitable` ?? C type: `GInitable`

`GInitable` is implemented by objects that can fail during initialization. If an object implements this interface then it must be initialized as th...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(object_type: GType, cancellable: Cancellable?, error: GLib.Error, first_property_name: utf8?, ...: void) -> GObject.Object` | g_initable_new | 2.22 | Helper function for constructing #GInitable object. This is similar to g_object_new() but also initializes the object and returns %NULL, setting an... |
| new_valist | `new_valist(object_type: GType, first_property_name: utf8, var_args: va_list, cancellable: Cancellable?) -> GObject.Object throws` | g_initable_new_valist | 2.22 | Helper function for constructing #GInitable object. This is similar to g_object_new_valist() but also initializes the object and returns %NULL, set... |
| newv | `newv(object_type: GType, n_parameters: guint, parameters: GObject.Parameter, cancellable: Cancellable?) -> GObject.Object throws` | g_initable_newv | 2.22 | Helper function for constructing #GInitable object. This is similar to g_object_newv() but also initializes the object and returns %NULL, setting a... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init | `Initable.init(cancellable: Cancellable?) -> gboolean throws` | g_initable_init | 2.22 | Initializes the object implementing the interface. This method is intended for language bindings. If writing in C, g_initable_new() should typicall... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init | `init(cancellable: Cancellable?) -> gboolean throws` |  | 2.22 | Initializes the object implementing the interface. This method is intended for language bindings. If writing in C, g_initable_new() should typicall... |

### Gio.ListModel

GType: `GListModel` ?? C type: `GListModel`

`GListModel` is an interface that represents a mutable list of [class@GObject.Object]. Its main intention is as a model for various widgets in user...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_item | `ListModel.get_item(position: guint) -> gpointer` | g_list_model_get_item | 2.44 | Get the item at @position. If @position is greater than the number of items in @list, %NULL is returned. %NULL is never returned for an index that ... |
| get_item_type | `ListModel.get_item_type() -> GType` | g_list_model_get_item_type | 2.44 | Gets the type of the items in @list. All items returned from g_list_model_get_item() are of the type returned by this function, or a subtype, or if... |
| get_n_items | `ListModel.get_n_items() -> guint` | g_list_model_get_n_items | 2.44 | Gets the number of items in @list. Depending on the model implementation, calling this function may be less efficient than iterating the list with ... |
| get_object | `ListModel.get_object(position: guint) -> GObject.Object` | g_list_model_get_object | 2.44 | Get the item at @position. If @position is greater than the number of items in @list, %NULL is returned. %NULL is never returned for an index that ... |
| items_changed | `ListModel.items_changed(position: guint, removed: guint, added: guint) -> none` | g_list_model_items_changed | 2.44 | Emits the #GListModel::items-changed signal on @list. This function should only be called by classes implementing #GListModel. It has to be called ... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| items-changed | `position: guint, removed: guint, added: guint` | none | last | 2.44 | This signal is emitted whenever items were added to or removed from @list. At @position, @removed items were removed and @added items were added in... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_item | `get_item(position: guint) -> GObject.Object` |  | 2.44 | Get the item at @position. If @position is greater than the number of items in @list, %NULL is returned. %NULL is never returned for an index that ... |
| get_item_type | `get_item_type() -> GType` |  | 2.44 | Gets the type of the items in @list. All items returned from g_list_model_get_item() are of the type returned by this function, or a subtype, or if... |
| get_n_items | `get_n_items() -> guint` |  | 2.44 | Gets the number of items in @list. Depending on the model implementation, calling this function may be less efficient than iterating the list with ... |

### Gio.LoadableIcon

GType: `GLoadableIcon` ?? C type: `GLoadableIcon`

`GLoadableIcon` extends the [iface@Gio.Icon] interface and adds the ability to load icons from streams.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `LoadableIcon.load(size: gint, type: out utf8?, cancellable: Cancellable?) -> InputStream throws` | g_loadable_icon_load |  | Loads a loadable icon. For the asynchronous version of this function, see g_loadable_icon_load_async(). |
| load_async | `LoadableIcon.load_async(size: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_loadable_icon_load_async |  | Loads an icon asynchronously. To finish this function, see g_loadable_icon_load_finish(). For the synchronous, blocking version of this function, s... |
| load_finish | `LoadableIcon.load_finish(res: AsyncResult, type: out utf8?) -> InputStream throws` | g_loadable_icon_load_finish |  | Finishes an asynchronous icon load started in g_loadable_icon_load_async(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load(size: gint, type: out utf8?, cancellable: Cancellable?) -> InputStream throws` |  |  | Loads a loadable icon. For the asynchronous version of this function, see g_loadable_icon_load_async(). |
| load_async | `load_async(size: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Loads an icon asynchronously. To finish this function, see g_loadable_icon_load_finish(). For the synchronous, blocking version of this function, s... |
| load_finish | `load_finish(res: AsyncResult, type: out utf8?) -> InputStream throws` |  |  | Finishes an asynchronous icon load started in g_loadable_icon_load_async(). |

### Gio.MemoryMonitor

GType: `GMemoryMonitor` ?? C type: `GMemoryMonitor`

`GMemoryMonitor` will monitor system memory and suggest to the application when to free memory so as to leave more room for other applications. It ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dup_default | `dup_default() -> MemoryMonitor` | g_memory_monitor_dup_default | 2.64 | Gets a reference to the default #GMemoryMonitor for the system. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| low-memory-warning | `level: MemoryMonitorWarningLevel` | none | last | 2.64 | Emitted when the system is running low on free memory. The signal handler should then take the appropriate action depending on the warning level. S... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| low_memory_warning | `low_memory_warning(level: MemoryMonitorWarningLevel) -> none` |  |  | the virtual function pointer for the #GMemoryMonitor::low-memory-warning signal. |

### Gio.Mount

GType: `GMount` ?? C type: `GMount`

The `GMount` interface represents user-visible mounts. Note, when porting from GnomeVFS, `GMount` is the moral equivalent of `GnomeVFSVolume`. `GMo...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_eject | `Mount.can_eject() -> gboolean` | g_mount_can_eject |  | Checks if @mount can be ejected. |
| can_unmount | `Mount.can_unmount() -> gboolean` | g_mount_can_unmount |  | Checks if @mount can be unmounted. |
| eject | `Mount.eject(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_mount_eject |  | Ejects a mount. This is an asynchronous operation, and is finished by calling g_mount_eject_finish() with the @mount and #GAsyncResult data returne... |
| eject_finish | `Mount.eject_finish(result: AsyncResult) -> gboolean throws` | g_mount_eject_finish |  | Finishes ejecting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| eject_with_operation | `Mount.eject_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_mount_eject_with_operation | 2.22 | Ejects a mount. This is an asynchronous operation, and is finished by calling g_mount_eject_with_operation_finish() with the @mount and #GAsyncResu... |
| eject_with_operation_finish | `Mount.eject_with_operation_finish(result: AsyncResult) -> gboolean throws` | g_mount_eject_with_operation_finish | 2.22 | Finishes ejecting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| get_default_location | `Mount.get_default_location() -> File` | g_mount_get_default_location |  | Gets the default location of @mount. The default location of the given @mount is a path that reflects the main entry point for the user (e.g. the h... |
| get_drive | `Mount.get_drive() -> Drive` | g_mount_get_drive |  | Gets the drive for the @mount. This is a convenience method for getting the #GVolume and then using that object to get the #GDrive. |
| get_icon | `Mount.get_icon() -> Icon` | g_mount_get_icon |  | Gets the icon for @mount. |
| get_name | `Mount.get_name() -> utf8` | g_mount_get_name |  | Gets the name of @mount. |
| get_root | `Mount.get_root() -> File` | g_mount_get_root |  | Gets the root directory on @mount. |
| get_sort_key | `Mount.get_sort_key() -> utf8` | g_mount_get_sort_key | 2.32 | Gets the sort key for @mount, if any. |
| get_symbolic_icon | `Mount.get_symbolic_icon() -> Icon` | g_mount_get_symbolic_icon | 2.34 | Gets the symbolic icon for @mount. |
| get_uuid | `Mount.get_uuid() -> utf8` | g_mount_get_uuid |  | Gets the UUID for the @mount. The reference is typically based on the file system UUID for the mount in question and should be considered an opaque... |
| get_volume | `Mount.get_volume() -> Volume` | g_mount_get_volume |  | Gets the volume for the @mount. |
| guess_content_type | `Mount.guess_content_type(force_rescan: gboolean, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_mount_guess_content_type | 2.18 | Tries to guess the type of content stored on @mount. Returns one or more textual identifiers of well-known content types (typically prefixed with "... |
| guess_content_type_finish | `Mount.guess_content_type_finish(result: AsyncResult) -> utf8 throws` | g_mount_guess_content_type_finish | 2.18 | Finishes guessing content types of @mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be... |
| guess_content_type_sync | `Mount.guess_content_type_sync(force_rescan: gboolean, cancellable: Cancellable?) -> utf8 throws` | g_mount_guess_content_type_sync | 2.18 | Tries to guess the type of content stored on @mount. Returns one or more textual identifiers of well-known content types (typically prefixed with "... |
| is_shadowed | `Mount.is_shadowed() -> gboolean` | g_mount_is_shadowed | 2.20 | Determines if @mount is shadowed. Applications or libraries should avoid displaying @mount in the user interface if it is shadowed. A mount is said... |
| remount | `Mount.remount(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_mount_remount |  | Remounts a mount. This is an asynchronous operation, and is finished by calling g_mount_remount_finish() with the @mount and #GAsyncResults data re... |
| remount_finish | `Mount.remount_finish(result: AsyncResult) -> gboolean throws` | g_mount_remount_finish |  | Finishes remounting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| shadow | `Mount.shadow() -> none` | g_mount_shadow | 2.20 | Increments the shadow count on @mount. Usually used by #GVolumeMonitor implementations when creating a shadow mount for @mount, see g_mount_is_shad... |
| unmount | `Mount.unmount(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_mount_unmount |  | Unmounts a mount. This is an asynchronous operation, and is finished by calling g_mount_unmount_finish() with the @mount and #GAsyncResult data ret... |
| unmount_finish | `Mount.unmount_finish(result: AsyncResult) -> gboolean throws` | g_mount_unmount_finish |  | Finishes unmounting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| unmount_with_operation | `Mount.unmount_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_mount_unmount_with_operation | 2.22 | Unmounts a mount. This is an asynchronous operation, and is finished by calling g_mount_unmount_with_operation_finish() with the @mount and #GAsync... |
| unmount_with_operation_finish | `Mount.unmount_with_operation_finish(result: AsyncResult) -> gboolean throws` | g_mount_unmount_with_operation_finish | 2.22 | Finishes unmounting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| unshadow | `Mount.unshadow() -> none` | g_mount_unshadow | 2.20 | Decrements the shadow count on @mount. Usually used by #GVolumeMonitor implementations when destroying a shadow mount for @mount, see g_mount_is_sh... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | Emitted when the mount has been changed. |
| pre-unmount | `` | none | last | 2.22 | This signal may be emitted when the #GMount is about to be unmounted. This signal depends on the backend and is only emitted if GIO was used to unm... |
| unmounted | `` | none | last |  | This signal is emitted when the #GMount have been unmounted. If the recipient is holding references to the object they should release them so the o... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_eject | `can_eject() -> gboolean` |  |  | Checks if @mount can be ejected. |
| can_unmount | `can_unmount() -> gboolean` |  |  | Checks if @mount can be unmounted. |
| changed | `changed() -> none` |  |  | Changed signal that is emitted when the mount's state has changed. |
| eject | `eject(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Ejects a mount. This is an asynchronous operation, and is finished by calling g_mount_eject_finish() with the @mount and #GAsyncResult data returne... |
| eject_finish | `eject_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes ejecting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| eject_with_operation | `eject_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Ejects a mount. This is an asynchronous operation, and is finished by calling g_mount_eject_with_operation_finish() with the @mount and #GAsyncResu... |
| eject_with_operation_finish | `eject_with_operation_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes ejecting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| get_default_location | `get_default_location() -> File` |  |  | Gets the default location of @mount. The default location of the given @mount is a path that reflects the main entry point for the user (e.g. the h... |
| get_drive | `get_drive() -> Drive` |  |  | Gets the drive for the @mount. This is a convenience method for getting the #GVolume and then using that object to get the #GDrive. |
| get_icon | `get_icon() -> Icon` |  |  | Gets the icon for @mount. |
| get_name | `get_name() -> utf8` |  |  | Gets the name of @mount. |
| get_root | `get_root() -> File` |  |  | Gets the root directory on @mount. |
| get_sort_key | `get_sort_key() -> utf8` |  | 2.32 | Gets the sort key for @mount, if any. |
| get_symbolic_icon | `get_symbolic_icon() -> Icon` |  | 2.34 | Gets the symbolic icon for @mount. |
| get_uuid | `get_uuid() -> utf8` |  |  | Gets the UUID for the @mount. The reference is typically based on the file system UUID for the mount in question and should be considered an opaque... |
| get_volume | `get_volume() -> Volume` |  |  | Gets the volume for the @mount. |
| guess_content_type | `guess_content_type(force_rescan: gboolean, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.18 | Tries to guess the type of content stored on @mount. Returns one or more textual identifiers of well-known content types (typically prefixed with "... |
| guess_content_type_finish | `guess_content_type_finish(result: AsyncResult) -> utf8 throws` |  | 2.18 | Finishes guessing content types of @mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be... |
| guess_content_type_sync | `guess_content_type_sync(force_rescan: gboolean, cancellable: Cancellable?) -> utf8 throws` |  | 2.18 | Tries to guess the type of content stored on @mount. Returns one or more textual identifiers of well-known content types (typically prefixed with "... |
| pre_unmount | `pre_unmount() -> none` |  |  | The ::pre-unmount signal that is emitted when the #GMount will soon be emitted. If the recipient is somehow holding the mount open by keeping an op... |
| remount | `remount(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Remounts a mount. This is an asynchronous operation, and is finished by calling g_mount_remount_finish() with the @mount and #GAsyncResults data re... |
| remount_finish | `remount_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes remounting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| unmount | `unmount(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Unmounts a mount. This is an asynchronous operation, and is finished by calling g_mount_unmount_finish() with the @mount and #GAsyncResult data ret... |
| unmount_finish | `unmount_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes unmounting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| unmount_with_operation | `unmount_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Unmounts a mount. This is an asynchronous operation, and is finished by calling g_mount_unmount_with_operation_finish() with the @mount and #GAsync... |
| unmount_with_operation_finish | `unmount_with_operation_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes unmounting a mount. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| unmounted | `unmounted() -> none` |  |  | The unmounted signal that is emitted when the #GMount have been unmounted. If the recipient is holding references to the object they should release... |

### Gio.NetworkMonitor

GType: `GNetworkMonitor` ?? C type: `GNetworkMonitor`

`GNetworkMonitor` provides an easy-to-use cross-platform API for monitoring network connectivity. On Linux, the available implementations are based...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> NetworkMonitor` | g_network_monitor_get_default | 2.32 | Gets the default #GNetworkMonitor for the system. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_reach | `NetworkMonitor.can_reach(connectable: SocketConnectable, cancellable: Cancellable?) -> gboolean throws` | g_network_monitor_can_reach | 2.32 | Attempts to determine whether or not the host pointed to by @connectable can be reached, without actually trying to connect to it. This may return ... |
| can_reach_async | `NetworkMonitor.can_reach_async(connectable: SocketConnectable, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_network_monitor_can_reach_async |  | Asynchronously attempts to determine whether or not the host pointed to by @connectable can be reached, without actually trying to connect to it. F... |
| can_reach_finish | `NetworkMonitor.can_reach_finish(result: AsyncResult) -> gboolean throws` | g_network_monitor_can_reach_finish |  | Finishes an async network connectivity test. See g_network_monitor_can_reach_async(). |
| get_connectivity | `NetworkMonitor.get_connectivity() -> NetworkConnectivity` | g_network_monitor_get_connectivity | 2.44 | Gets a more detailed networking state than g_network_monitor_get_network_available(). If #GNetworkMonitor:network-available is %FALSE, then the con... |
| get_network_available | `NetworkMonitor.get_network_available() -> gboolean` | g_network_monitor_get_network_available | 2.32 | Checks if the network is available. "Available" here means that the system has a default route available for at least one of IPv4 or IPv6. It does ... |
| get_network_metered | `NetworkMonitor.get_network_metered() -> gboolean` | g_network_monitor_get_network_metered | 2.46 | Checks if the network is metered. See #GNetworkMonitor:network-metered for more details. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connectivity | NetworkConnectivity | read | More detailed information about the host's network connectivity. See g_network_monitor_get_connectivity() and #GNetworkConnectivity for more details. |
| network-available | gboolean | read | Whether the network is considered available. That is, whether the system has a default route for at least one of IPv4 or IPv6. Real-world networks ... |
| network-metered | gboolean | read | Whether the network is considered metered. That is, whether the system has traffic flowing through the default connection that is subject to limita... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| network-changed | `network_available: gboolean` | none | last | 2.32 | Emitted when the network configuration changes. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_reach | `can_reach(connectable: SocketConnectable, cancellable: Cancellable?) -> gboolean throws` |  | 2.32 | Attempts to determine whether or not the host pointed to by @connectable can be reached, without actually trying to connect to it. This may return ... |
| can_reach_async | `can_reach_async(connectable: SocketConnectable, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Asynchronously attempts to determine whether or not the host pointed to by @connectable can be reached, without actually trying to connect to it. F... |
| can_reach_finish | `can_reach_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes an async network connectivity test. See g_network_monitor_can_reach_async(). |
| network_changed | `network_changed(network_available: gboolean) -> none` |  |  | the virtual function pointer for the GNetworkMonitor::network-changed signal. |

### Gio.PollableInputStream

GType: `GPollableInputStream` ?? C type: `GPollableInputStream`

`GPollableInputStream` is implemented by [class@Gio.InputStream]s that can be polled for readiness to read. This can be used when interfacing with ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_poll | `PollableInputStream.can_poll() -> gboolean` | g_pollable_input_stream_can_poll | 2.28 | Checks if @stream is actually pollable. Some classes may implement #GPollableInputStream but have only certain instances of that class be pollable.... |
| create_source | `PollableInputStream.create_source(cancellable: Cancellable?) -> GLib.Source` | g_pollable_input_stream_create_source | 2.28 | Creates a #GSource that triggers when @stream can be read, or @cancellable is triggered or an error occurs. The callback on the source is of the #G... |
| is_readable | `PollableInputStream.is_readable() -> gboolean` | g_pollable_input_stream_is_readable | 2.28 | Checks if @stream can be read. Note that some stream types may not be able to implement this 100% reliably, and it is possible that a call to g_inp... |
| read_nonblocking | `PollableInputStream.read_nonblocking(buffer: out guint8, count: gsize, cancellable: Cancellable?) -> gssize throws` | g_pollable_input_stream_read_nonblocking |  | Attempts to read up to @count bytes from @stream into @buffer, as with g_input_stream_read(). If @stream is not currently readable, this will immed... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_poll | `can_poll() -> gboolean` |  | 2.28 | Checks if @stream is actually pollable. Some classes may implement #GPollableInputStream but have only certain instances of that class be pollable.... |
| create_source | `create_source(cancellable: Cancellable?) -> GLib.Source` |  | 2.28 | Creates a #GSource that triggers when @stream can be read, or @cancellable is triggered or an error occurs. The callback on the source is of the #G... |
| is_readable | `is_readable() -> gboolean` |  | 2.28 | Checks if @stream can be read. Note that some stream types may not be able to implement this 100% reliably, and it is possible that a call to g_inp... |
| read_nonblocking | `read_nonblocking(buffer: out guint8?, count: gsize) -> gssize throws` |  |  | Attempts to read up to @count bytes from @stream into @buffer, as with g_input_stream_read(). If @stream is not currently readable, this will immed... |

### Gio.PollableOutputStream

GType: `GPollableOutputStream` ?? C type: `GPollableOutputStream`

`GPollableOutputStream` is implemented by [class@Gio.OutputStream]s that can be polled for readiness to write. This can be used when interfacing wi...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_poll | `PollableOutputStream.can_poll() -> gboolean` | g_pollable_output_stream_can_poll | 2.28 | Checks if @stream is actually pollable. Some classes may implement #GPollableOutputStream but have only certain instances of that class be pollable... |
| create_source | `PollableOutputStream.create_source(cancellable: Cancellable?) -> GLib.Source` | g_pollable_output_stream_create_source | 2.28 | Creates a #GSource that triggers when @stream can be written, or @cancellable is triggered or an error occurs. The callback on the source is of the... |
| is_writable | `PollableOutputStream.is_writable() -> gboolean` | g_pollable_output_stream_is_writable | 2.28 | Checks if @stream can be written. Note that some stream types may not be able to implement this 100% reliably, and it is possible that a call to g_... |
| write_nonblocking | `PollableOutputStream.write_nonblocking(buffer: guint8, count: gsize, cancellable: Cancellable?) -> gssize throws` | g_pollable_output_stream_write_nonblocking |  | Attempts to write up to @count bytes from @buffer to @stream, as with g_output_stream_write(). If @stream is not currently writable, this will imme... |
| writev_nonblocking | `PollableOutputStream.writev_nonblocking(vectors: OutputVector, n_vectors: gsize, bytes_written: out gsize?, cancellable: Cancellable?) -> PollableReturn throws` | g_pollable_output_stream_writev_nonblocking | 2.60 | Attempts to write the bytes contained in the @n_vectors @vectors to @stream, as with g_output_stream_writev(). If @stream is not currently writable... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_poll | `can_poll() -> gboolean` |  | 2.28 | Checks if @stream is actually pollable. Some classes may implement #GPollableOutputStream but have only certain instances of that class be pollable... |
| create_source | `create_source(cancellable: Cancellable?) -> GLib.Source` |  | 2.28 | Creates a #GSource that triggers when @stream can be written, or @cancellable is triggered or an error occurs. The callback on the source is of the... |
| is_writable | `is_writable() -> gboolean` |  | 2.28 | Checks if @stream can be written. Note that some stream types may not be able to implement this 100% reliably, and it is possible that a call to g_... |
| write_nonblocking | `write_nonblocking(buffer: guint8?, count: gsize) -> gssize throws` |  |  | Attempts to write up to @count bytes from @buffer to @stream, as with g_output_stream_write(). If @stream is not currently writable, this will imme... |
| writev_nonblocking | `writev_nonblocking(vectors: OutputVector, n_vectors: gsize, bytes_written: out gsize?) -> PollableReturn throws` |  | 2.60 | Attempts to write the bytes contained in the @n_vectors @vectors to @stream, as with g_output_stream_writev(). If @stream is not currently writable... |

### Gio.PowerProfileMonitor

GType: `GPowerProfileMonitor` ?? C type: `GPowerProfileMonitor`

`GPowerProfileMonitor` makes it possible for applications as well as OS components to monitor system power profiles and act upon them. It currently...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dup_default | `dup_default() -> PowerProfileMonitor` | g_power_profile_monitor_dup_default | 2.70 | Gets a reference to the default #GPowerProfileMonitor for the system. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_power_saver_enabled | `PowerProfileMonitor.get_power_saver_enabled() -> gboolean` | g_power_profile_monitor_get_power_saver_enabled | 2.70 | Gets whether the system is in ???Power Saver??? mode. You are expected to listen to the #GPowerProfileMonitor::notify::power-saver-enabled signal t... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| power-saver-enabled | gboolean | read | Whether ???Power Saver??? mode is enabled on the system. |

### Gio.Proxy

GType: `GProxy` ?? C type: `GProxy`

A `GProxy` handles connecting to a remote host via a given type of proxy server. It is implemented by the `gio-proxy` extension point. The extensio...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_for_protocol | `get_default_for_protocol(protocol: utf8) -> Proxy` | g_proxy_get_default_for_protocol | 2.26 | Find the `gio-proxy` extension point for a proxy implementation that supports the specified protocol. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| connect | `Proxy.connect(connection: IOStream, proxy_address: ProxyAddress, cancellable: Cancellable?) -> IOStream throws` | g_proxy_connect | 2.26 | Given @connection to communicate with a proxy (eg, a #GSocketConnection that is connected to the proxy server), this does the necessary handshake t... |
| connect_async | `Proxy.connect_async(connection: IOStream, proxy_address: ProxyAddress, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_proxy_connect_async | 2.26 | Asynchronous version of g_proxy_connect(). |
| connect_finish | `Proxy.connect_finish(result: AsyncResult) -> IOStream throws` | g_proxy_connect_finish | 2.26 | See g_proxy_connect(). |
| supports_hostname | `Proxy.supports_hostname() -> gboolean` | g_proxy_supports_hostname | 2.26 | Some proxy protocols expect to be passed a hostname, which they will resolve to an IP address themselves. Others, like SOCKS4, do not allow this. T... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| connect | `connect(connection: IOStream, proxy_address: ProxyAddress, cancellable: Cancellable?) -> IOStream throws` |  | 2.26 | Given @connection to communicate with a proxy (eg, a #GSocketConnection that is connected to the proxy server), this does the necessary handshake t... |
| connect_async | `connect_async(connection: IOStream, proxy_address: ProxyAddress, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.26 | Asynchronous version of g_proxy_connect(). |
| connect_finish | `connect_finish(result: AsyncResult) -> IOStream throws` |  | 2.26 | See g_proxy_connect(). |
| supports_hostname | `supports_hostname() -> gboolean` |  | 2.26 | Some proxy protocols expect to be passed a hostname, which they will resolve to an IP address themselves. Others, like SOCKS4, do not allow this. T... |

### Gio.ProxyResolver

GType: `GProxyResolver` ?? C type: `GProxyResolver`

`GProxyResolver` provides synchronous and asynchronous network proxy resolution. `GProxyResolver` is used within [class@Gio.SocketClient] through t...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> ProxyResolver` | g_proxy_resolver_get_default | 2.26 | Gets the default #GProxyResolver for the system. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_supported | `ProxyResolver.is_supported() -> gboolean` | g_proxy_resolver_is_supported | 2.26 | Checks if @resolver can be used on this system. (This is used internally; g_proxy_resolver_get_default() will only return a proxy resolver that ret... |
| lookup | `ProxyResolver.lookup(uri: utf8, cancellable: Cancellable?) -> utf8 throws` | g_proxy_resolver_lookup | 2.26 | Looks into the system proxy configuration to determine what proxy, if any, to use to connect to @uri. The returned proxy URIs are of the form `<pro... |
| lookup_async | `ProxyResolver.lookup_async(uri: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_proxy_resolver_lookup_async | 2.26 | Asynchronous lookup of proxy. See g_proxy_resolver_lookup() for more details. |
| lookup_finish | `ProxyResolver.lookup_finish(result: AsyncResult) -> utf8 throws` | g_proxy_resolver_lookup_finish | 2.26 | Call this function to obtain the array of proxy URIs when g_proxy_resolver_lookup_async() is complete. See g_proxy_resolver_lookup() for more details. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| is_supported | `is_supported() -> gboolean` |  | 2.26 | Checks if @resolver can be used on this system. (This is used internally; g_proxy_resolver_get_default() will only return a proxy resolver that ret... |
| lookup | `lookup(uri: utf8, cancellable: Cancellable?) -> utf8 throws` |  | 2.26 | Looks into the system proxy configuration to determine what proxy, if any, to use to connect to @uri. The returned proxy URIs are of the form `<pro... |
| lookup_async | `lookup_async(uri: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.26 | Asynchronous lookup of proxy. See g_proxy_resolver_lookup() for more details. |
| lookup_finish | `lookup_finish(result: AsyncResult) -> utf8 throws` |  | 2.26 | Call this function to obtain the array of proxy URIs when g_proxy_resolver_lookup_async() is complete. See g_proxy_resolver_lookup() for more details. |

### Gio.RemoteActionGroup

GType: `GRemoteActionGroup` ?? C type: `GRemoteActionGroup`

The `GRemoteActionGroup` interface is implemented by [iface@Gio.ActionGroup] instances that either transmit action invocations to other processes o...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate_action_full | `RemoteActionGroup.activate_action_full(action_name: utf8, parameter: GLib.Variant?, platform_data: GLib.Variant) -> none` | g_remote_action_group_activate_action_full | 2.32 | Activates the remote action. This is the same as g_action_group_activate_action() except that it allows for provision of "platform data" to be sent... |
| change_action_state_full | `RemoteActionGroup.change_action_state_full(action_name: utf8, value: GLib.Variant, platform_data: GLib.Variant) -> none` | g_remote_action_group_change_action_state_full | 2.32 | Changes the state of a remote action. This is the same as g_action_group_change_action_state() except that it allows for provision of "platform dat... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate_action_full | `activate_action_full(action_name: utf8, parameter: GLib.Variant?, platform_data: GLib.Variant) -> none` |  | 2.32 | Activates the remote action. This is the same as g_action_group_activate_action() except that it allows for provision of "platform data" to be sent... |
| change_action_state_full | `change_action_state_full(action_name: utf8, value: GLib.Variant, platform_data: GLib.Variant) -> none` |  | 2.32 | Changes the state of a remote action. This is the same as g_action_group_change_action_state() except that it allows for provision of "platform dat... |

### Gio.Seekable

GType: `GSeekable` ?? C type: `GSeekable`

`GSeekable` is implemented by streams (implementations of [class@Gio.InputStream] or [class@Gio.OutputStream]) that support seeking. Seekable strea...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_seek | `Seekable.can_seek() -> gboolean` | g_seekable_can_seek |  | Tests if the stream supports the #GSeekableIface. |
| can_truncate | `Seekable.can_truncate() -> gboolean` | g_seekable_can_truncate |  | Tests if the length of the stream can be adjusted with g_seekable_truncate(). |
| seek | `Seekable.seek(offset: gint64, type: GLib.SeekType, cancellable: Cancellable?) -> gboolean throws` | g_seekable_seek |  | Seeks in the stream by the given @offset, modified by @type. Attempting to seek past the end of the stream will have different results depending on... |
| tell | `Seekable.tell() -> gint64` | g_seekable_tell |  | Tells the current position within the stream. |
| truncate | `Seekable.truncate(offset: gint64, cancellable: Cancellable?) -> gboolean throws` | g_seekable_truncate |  | Sets the length of the stream to @offset. If the stream was previously larger than @offset, the extra data is discarded. If the stream was previous... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_seek | `can_seek() -> gboolean` |  |  | Tests if the stream supports the #GSeekableIface. |
| can_truncate | `can_truncate() -> gboolean` |  |  | Tests if the length of the stream can be adjusted with g_seekable_truncate(). |
| seek | `seek(offset: gint64, type: GLib.SeekType, cancellable: Cancellable?) -> gboolean throws` |  |  | Seeks in the stream by the given @offset, modified by @type. Attempting to seek past the end of the stream will have different results depending on... |
| tell | `tell() -> gint64` |  |  | Tells the current position within the stream. |
| truncate_fn | `truncate_fn(offset: gint64, cancellable: Cancellable?) -> gboolean throws` |  |  | Sets the length of the stream to @offset. If the stream was previously larger than @offset, the extra data is discarded. If the stream was previous... |

### Gio.SocketConnectable

GType: `GSocketConnectable` ?? C type: `GSocketConnectable`

Objects that describe one or more potential socket endpoints implement `GSocketConnectable`. Callers can then use [method@Gio.SocketConnectable.enu...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| enumerate | `SocketConnectable.enumerate() -> SocketAddressEnumerator` | g_socket_connectable_enumerate | 2.22 | Creates a #GSocketAddressEnumerator for @connectable. |
| proxy_enumerate | `SocketConnectable.proxy_enumerate() -> SocketAddressEnumerator` | g_socket_connectable_proxy_enumerate | 2.26 | Creates a #GSocketAddressEnumerator for @connectable that will return a #GProxyAddress for each of its addresses that you must connect to via a pro... |
| to_string | `SocketConnectable.to_string() -> utf8` | g_socket_connectable_to_string | 2.48 | Format a #GSocketConnectable as a string. This is a human-readable format for use in debugging output, and is not a stable serialization format. It... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| enumerate | `enumerate() -> SocketAddressEnumerator` |  | 2.22 | Creates a #GSocketAddressEnumerator for @connectable. |
| proxy_enumerate | `proxy_enumerate() -> SocketAddressEnumerator` |  | 2.26 | Creates a #GSocketAddressEnumerator for @connectable that will return a #GProxyAddress for each of its addresses that you must connect to via a pro... |
| to_string | `to_string() -> utf8` |  | 2.48 | Format a #GSocketConnectable as a string. This is a human-readable format for use in debugging output, and is not a stable serialization format. It... |

### Gio.TlsBackend

GType: `GTlsBackend` ?? C type: `GTlsBackend`

TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an internal type used to coordinate the different classes implemented by a TLS ba...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> TlsBackend` | g_tls_backend_get_default | 2.28 | Gets the default #GTlsBackend for the system. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_certificate_type | `TlsBackend.get_certificate_type() -> GType` | g_tls_backend_get_certificate_type | 2.28 | Gets the #GType of @backend's #GTlsCertificate implementation. |
| get_client_connection_type | `TlsBackend.get_client_connection_type() -> GType` | g_tls_backend_get_client_connection_type | 2.28 | Gets the #GType of @backend's #GTlsClientConnection implementation. |
| get_default_database | `TlsBackend.get_default_database() -> TlsDatabase` | g_tls_backend_get_default_database | 2.30 | Gets the default #GTlsDatabase used to verify TLS connections. |
| get_dtls_client_connection_type | `TlsBackend.get_dtls_client_connection_type() -> GType` | g_tls_backend_get_dtls_client_connection_type | 2.48 | Gets the #GType of @backend???s #GDtlsClientConnection implementation. |
| get_dtls_server_connection_type | `TlsBackend.get_dtls_server_connection_type() -> GType` | g_tls_backend_get_dtls_server_connection_type | 2.48 | Gets the #GType of @backend???s #GDtlsServerConnection implementation. |
| get_file_database_type | `TlsBackend.get_file_database_type() -> GType` | g_tls_backend_get_file_database_type | 2.30 | Gets the #GType of @backend's #GTlsFileDatabase implementation. |
| get_server_connection_type | `TlsBackend.get_server_connection_type() -> GType` | g_tls_backend_get_server_connection_type | 2.28 | Gets the #GType of @backend's #GTlsServerConnection implementation. |
| set_default_database | `TlsBackend.set_default_database(database: TlsDatabase?) -> none` | g_tls_backend_set_default_database | 2.60 | Set the default #GTlsDatabase used to verify TLS connections Any subsequent call to g_tls_backend_get_default_database() will return the database s... |
| supports_dtls | `TlsBackend.supports_dtls() -> gboolean` | g_tls_backend_supports_dtls | 2.48 | Checks if DTLS is supported. DTLS support may not be available even if TLS support is available, and vice-versa. |
| supports_tls | `TlsBackend.supports_tls() -> gboolean` | g_tls_backend_supports_tls | 2.28 | Checks if TLS is supported; if this returns %FALSE for the default #GTlsBackend, it means no "real" TLS backend is available. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_database | `get_default_database() -> TlsDatabase` |  | 2.30 | Gets the default #GTlsDatabase used to verify TLS connections. |
| supports_dtls | `supports_dtls() -> gboolean` |  | 2.48 | Checks if DTLS is supported. DTLS support may not be available even if TLS support is available, and vice-versa. |
| supports_tls | `supports_tls() -> gboolean` |  | 2.28 | Checks if TLS is supported; if this returns %FALSE for the default #GTlsBackend, it means no "real" TLS backend is available. |

### Gio.TlsClientConnection

GType: `GTlsClientConnection` ?? C type: `GTlsClientConnection`

`GTlsClientConnection` is the client-side subclass of [class@Gio.TlsConnection], representing a client-side TLS connection.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(base_io_stream: IOStream, server_identity: SocketConnectable?) -> TlsClientConnection throws` | g_tls_client_connection_new | 2.28 | Creates a new #GTlsClientConnection wrapping @base_io_stream (which must have pollable input and output streams) which is assumed to communicate wi... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_session_state | `TlsClientConnection.copy_session_state(source: TlsClientConnection) -> none` | g_tls_client_connection_copy_session_state | 2.46 | Possibly copies session state from one connection to another, for use in TLS session resumption. This is not normally needed, but may be used when ... |
| get_accepted_cas | `TlsClientConnection.get_accepted_cas() -> GLib.List` | g_tls_client_connection_get_accepted_cas | 2.28 | Gets the list of distinguished names of the Certificate Authorities that the server will accept certificates from. This will be set during the TLS ... |
| get_server_identity | `TlsClientConnection.get_server_identity() -> SocketConnectable` | g_tls_client_connection_get_server_identity | 2.28 | Gets @conn's expected server identity |
| get_use_ssl3 | `TlsClientConnection.get_use_ssl3() -> gboolean` | g_tls_client_connection_get_use_ssl3 | 2.28 | SSL 3.0 is no longer supported. See g_tls_client_connection_set_use_ssl3() for details. |
| get_validation_flags | `TlsClientConnection.get_validation_flags() -> TlsCertificateFlags` | g_tls_client_connection_get_validation_flags | 2.28 | Gets @conn's validation flags This function does not work as originally designed and is impossible to use correctly. See #GTlsClientConnection:vali... |
| set_server_identity | `TlsClientConnection.set_server_identity(identity: SocketConnectable) -> none` | g_tls_client_connection_set_server_identity | 2.28 | Sets @conn's expected server identity, which is used both to tell servers on virtual hosts which certificate to present, and also to let @conn know... |
| set_use_ssl3 | `TlsClientConnection.set_use_ssl3(use_ssl3: gboolean) -> none` | g_tls_client_connection_set_use_ssl3 | 2.28 | Since GLib 2.42.1, SSL 3.0 is no longer supported. From GLib 2.42.1 through GLib 2.62, this function could be used to force use of TLS 1.0, the low... |
| set_validation_flags | `TlsClientConnection.set_validation_flags(flags: TlsCertificateFlags) -> none` | g_tls_client_connection_set_validation_flags | 2.28 | Sets @conn's validation flags, to override the default set of checks performed when validating a server certificate. By default, %G_TLS_CERTIFICATE... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accepted-cas | GLib.List | read | A list of the distinguished names of the Certificate Authorities that the server will accept client certificates signed by. If the server requests ... |
| server-identity | SocketConnectable | read, write | A #GSocketConnectable describing the identity of the server that is expected on the other end of the connection. If the %G_TLS_CERTIFICATE_BAD_IDEN... |
| use-ssl3 | gboolean | read, write | SSL 3.0 is no longer supported. See g_tls_client_connection_set_use_ssl3() for details. |
| validation-flags | TlsCertificateFlags | read, write | What steps to perform when validating a certificate received from a server. Server certificates that fail to validate in any of the ways indicated ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_session_state | `copy_session_state(source: TlsClientConnection) -> none` |  | 2.46 | Possibly copies session state from one connection to another, for use in TLS session resumption. This is not normally needed, but may be used when ... |

### Gio.TlsFileDatabase

GType: `GTlsFileDatabase` ?? C type: `GTlsFileDatabase`

`GTlsFileDatabase` is implemented by [class@Gio.TlsDatabase] objects which load their certificate information from a file. It is an interface which...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(anchors: filename) -> TlsFileDatabase throws` | g_tls_file_database_new | 2.30 | Creates a new #GTlsFileDatabase which uses anchor certificate authorities in @anchors to verify certificate chains. The certificates in @anchors mu... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| anchors | utf8 | read, write | The path to a file containing PEM encoded certificate authority root anchors. The certificates in this file will be treated as root authorities for... |

### Gio.TlsServerConnection

GType: `GTlsServerConnection` ?? C type: `GTlsServerConnection`

`GTlsServerConnection` is the server-side subclass of [class@Gio.TlsConnection], representing a server-side TLS connection.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(base_io_stream: IOStream, certificate: TlsCertificate?) -> TlsServerConnection throws` | g_tls_server_connection_new | 2.28 | Creates a new #GTlsServerConnection wrapping @base_io_stream (which must have pollable input and output streams). See the documentation for #GTlsCo... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| authentication-mode | TlsAuthenticationMode | read, write | The #GTlsAuthenticationMode for the server. This can be changed before calling g_tls_connection_handshake() if you want to rehandshake with a diffe... |

### Gio.Volume

GType: `GVolume` ?? C type: `GVolume`

The `GVolume` interface represents user-visible objects that can be mounted. Note, when porting from GnomeVFS, `GVolume` is the moral equivalent of...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_eject | `Volume.can_eject() -> gboolean` | g_volume_can_eject |  | Checks if a volume can be ejected. |
| can_mount | `Volume.can_mount() -> gboolean` | g_volume_can_mount |  | Checks if a volume can be mounted. |
| eject | `Volume.eject(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_volume_eject |  | Ejects a volume. This is an asynchronous operation, and is finished by calling g_volume_eject_finish() with the @volume and #GAsyncResult returned ... |
| eject_finish | `Volume.eject_finish(result: AsyncResult) -> gboolean throws` | g_volume_eject_finish |  | Finishes ejecting a volume. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| eject_with_operation | `Volume.eject_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_volume_eject_with_operation | 2.22 | Ejects a volume. This is an asynchronous operation, and is finished by calling g_volume_eject_with_operation_finish() with the @volume and #GAsyncR... |
| eject_with_operation_finish | `Volume.eject_with_operation_finish(result: AsyncResult) -> gboolean throws` | g_volume_eject_with_operation_finish | 2.22 | Finishes ejecting a volume. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| enumerate_identifiers | `Volume.enumerate_identifiers() -> utf8` | g_volume_enumerate_identifiers |  | Gets the kinds of identifiers that @volume has. Use g_volume_get_identifier() to obtain the identifiers themselves. |
| get_activation_root | `Volume.get_activation_root() -> File` | g_volume_get_activation_root | 2.18 | Gets the activation root for a #GVolume if it is known ahead of mount time. Returns %NULL otherwise. If not %NULL and if @volume is mounted, then t... |
| get_drive | `Volume.get_drive() -> Drive` | g_volume_get_drive |  | Gets the drive for the @volume. |
| get_icon | `Volume.get_icon() -> Icon` | g_volume_get_icon |  | Gets the icon for @volume. |
| get_identifier | `Volume.get_identifier(kind: utf8) -> utf8` | g_volume_get_identifier |  | Gets the identifier of the given kind for @volume. See the introduction for more information about volume identifiers. |
| get_mount | `Volume.get_mount() -> Mount` | g_volume_get_mount |  | Gets the mount for the @volume. |
| get_name | `Volume.get_name() -> utf8` | g_volume_get_name |  | Gets the name of @volume. |
| get_sort_key | `Volume.get_sort_key() -> utf8` | g_volume_get_sort_key | 2.32 | Gets the sort key for @volume, if any. |
| get_symbolic_icon | `Volume.get_symbolic_icon() -> Icon` | g_volume_get_symbolic_icon | 2.34 | Gets the symbolic icon for @volume. |
| get_uuid | `Volume.get_uuid() -> utf8` | g_volume_get_uuid |  | Gets the UUID for the @volume. The reference is typically based on the file system UUID for the volume in question and should be considered an opaq... |
| mount | `Volume.mount(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_volume_mount |  | Mounts a volume. This is an asynchronous operation, and is finished by calling g_volume_mount_finish() with the @volume and #GAsyncResult returned ... |
| mount_finish | `Volume.mount_finish(result: AsyncResult) -> gboolean throws` | g_volume_mount_finish |  | Finishes mounting a volume. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. If t... |
| should_automount | `Volume.should_automount() -> gboolean` | g_volume_should_automount |  | Returns whether the volume should be automatically mounted. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | Emitted when the volume has been changed. |
| removed | `` | none | last |  | This signal is emitted when the #GVolume have been removed. If the recipient is holding references to the object they should release them so the ob... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| can_eject | `can_eject() -> gboolean` |  |  | Checks if a volume can be ejected. |
| can_mount | `can_mount() -> gboolean` |  |  | Checks if a volume can be mounted. |
| changed | `changed() -> none` |  |  | Changed signal that is emitted when the volume's state has changed. |
| eject | `eject(flags: MountUnmountFlags, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Ejects a volume. This is an asynchronous operation, and is finished by calling g_volume_eject_finish() with the @volume and #GAsyncResult returned ... |
| eject_finish | `eject_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes ejecting a volume. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| eject_with_operation | `eject_with_operation(flags: MountUnmountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.22 | Ejects a volume. This is an asynchronous operation, and is finished by calling g_volume_eject_with_operation_finish() with the @volume and #GAsyncR... |
| eject_with_operation_finish | `eject_with_operation_finish(result: AsyncResult) -> gboolean throws` |  | 2.22 | Finishes ejecting a volume. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. |
| enumerate_identifiers | `enumerate_identifiers() -> utf8` |  |  | Gets the kinds of identifiers that @volume has. Use g_volume_get_identifier() to obtain the identifiers themselves. |
| get_activation_root | `get_activation_root() -> File` |  | 2.18 | Gets the activation root for a #GVolume if it is known ahead of mount time. Returns %NULL otherwise. If not %NULL and if @volume is mounted, then t... |
| get_drive | `get_drive() -> Drive` |  |  | Gets the drive for the @volume. |
| get_icon | `get_icon() -> Icon` |  |  | Gets the icon for @volume. |
| get_identifier | `get_identifier(kind: utf8) -> utf8` |  |  | Gets the identifier of the given kind for @volume. See the introduction for more information about volume identifiers. |
| get_mount | `get_mount() -> Mount` |  |  | Gets the mount for the @volume. |
| get_name | `get_name() -> utf8` |  |  | Gets the name of @volume. |
| get_sort_key | `get_sort_key() -> utf8` |  | 2.32 | Gets the sort key for @volume, if any. |
| get_symbolic_icon | `get_symbolic_icon() -> Icon` |  | 2.34 | Gets the symbolic icon for @volume. |
| get_uuid | `get_uuid() -> utf8` |  |  | Gets the UUID for the @volume. The reference is typically based on the file system UUID for the volume in question and should be considered an opaq... |
| mount_finish | `mount_finish(result: AsyncResult) -> gboolean throws` |  |  | Finishes mounting a volume. If any errors occurred during the operation, @error will be set to contain the errors and %FALSE will be returned. If t... |
| mount_fn | `mount_fn(flags: MountMountFlags, mount_operation: MountOperation?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` |  |  | Mounts a volume. This is an asynchronous operation, and is finished by calling g_volume_mount_finish() with the @volume and #GAsyncResult returned ... |
| removed | `removed() -> none` |  |  | The removed signal that is emitted when the #GVolume have been removed. If the recipient is holding references to the object they should release th... |
| should_automount | `should_automount() -> gboolean` |  |  | Returns whether the volume should be automatically mounted. |

## Enums

### Gio.BusType

GType: `GBusType` ?? C type: `GBusType`

An enumeration for well-known message buses.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | Not a message bus. |
| session | 2 | session | The login session message bus. |
| starter | -1 | starter | An alias for the message bus that activated the process, if any. |
| system | 1 | system | The system-wide message bus. |

### Gio.ConverterResult

GType: `GConverterResult` ?? C type: `GConverterResult`

Results returned from g_converter_convert().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| converted | 1 | converted | Some data was consumed or produced |
| error | 0 | error | There was an error during conversion. |
| finished | 2 | finished | The conversion is finished |
| flushed | 3 | flushed | Flushing is finished |

### Gio.CredentialsType

GType: `GCredentialsType` ?? C type: `GCredentialsType`

Enumeration describing different kinds of native credential types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| apple_xucred | 6 | apple-xucred | The native credentials type is a `struct xucred`. Added in 2.66. |
| freebsd_cmsgcred | 2 | freebsd-cmsgcred | The native credentials type is a `struct cmsgcred`. |
| invalid | 0 | invalid | Indicates an invalid native credential type. |
| linux_ucred | 1 | linux-ucred | The native credentials type is a `struct ucred`. |
| netbsd_unpcbid | 5 | netbsd-unpcbid | The native credentials type is a `struct unpcbid`. Added in 2.42. |
| openbsd_sockpeercred | 3 | openbsd-sockpeercred | The native credentials type is a `struct sockpeercred`. Added in 2.30. |
| solaris_ucred | 4 | solaris-ucred | The native credentials type is a `ucred_t`. Added in 2.40. |
| win32_pid | 7 | win32-pid | The native credentials type is a PID `DWORD`. Added in 2.72. |

### Gio.DataStreamByteOrder

GType: `GDataStreamByteOrder` ?? C type: `GDataStreamByteOrder`

#GDataStreamByteOrder is used to ensure proper endianness of streaming data sources across various machine architectures.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| big_endian | 0 | big-endian | Selects Big Endian byte order. |
| host_endian | 2 | host-endian | Selects endianness based on host machine's architecture. |
| little_endian | 1 | little-endian | Selects Little Endian byte order. |

### Gio.DataStreamNewlineType

GType: `GDataStreamNewlineType` ?? C type: `GDataStreamNewlineType`

#GDataStreamNewlineType is used when checking for or setting the line endings for a given file.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| any | 3 | any | Automatically try to handle any line ending type. |
| cr | 1 | cr | Selects "CR" line endings. |
| cr_lf | 2 | cr-lf | Selects "CR, LF" line ending, common on Microsoft Windows. |
| lf | 0 | lf | Selects "LF" line endings, common on most modern UNIX platforms. |

### Gio.DBusError

GType: `GDBusError` ?? C type: `GDBusError`

Error codes for the %G_DBUS_ERROR error domain.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| access_denied | 9 | access-denied | Security restrictions don't allow doing what you're trying to do. |
| address_in_use | 14 | address-in-use | Can't bind a socket since its address is in use (i.e. EADDRINUSE). |
| adt_audit_data_unknown | 39 | adt-audit-data-unknown | Asked for ADT audit data and it wasn't available. |
| auth_failed | 10 | auth-failed | Authentication didn't work. |
| bad_address | 6 | bad-address | A D-Bus bus address was malformed. |
| disconnected | 15 | disconnected | The connection is disconnected and you're trying to use it. |
| failed | 0 | failed | A generic error; "something went wrong" - see the error message for more. |
| file_exists | 18 | file-exists | Existing file and the operation you're using does not silently overwrite. |
| file_not_found | 17 | file-not-found | Missing file. |
| invalid_args | 16 | invalid-args | Invalid arguments passed to a method call. |
| invalid_file_content | 37 | invalid-file-content | A file contains invalid syntax or is otherwise broken. |
| invalid_signature | 36 | invalid-signature | A type signature is not valid. |
| io_error | 5 | io-error | Something went wrong reading or writing to a socket, for example. |
| limits_exceeded | 8 | limits-exceeded | Some limited resource is exhausted. |
| match_rule_invalid | 22 | match-rule-invalid | The match rule isn't syntactically valid. |
| match_rule_not_found | 21 | match-rule-not-found | Tried to remove or modify a match rule that didn't exist. |
| name_has_no_owner | 3 | name-has-no-owner | The bus name you referenced doesn't exist (i.e. no application owns it). |
| no_memory | 1 | no-memory | There was not enough memory to complete an operation. |
| no_network | 13 | no-network | No network access (probably ENETUNREACH on a socket). |
| no_reply | 4 | no-reply | No reply to a message expecting one, usually means a timeout occurred. |
| no_server | 11 | no-server | Unable to connect to server (probably caused by ECONNREFUSED on a socket). |
| not_supported | 7 | not-supported | Requested operation isn't supported (like ENOSYS on UNIX). |
| object_path_in_use | 40 | object-path-in-use | There's already an object with the requested object path. |
| property_read_only | 44 | property-read-only | Property you tried to set is read-only. Since 2.42 |
| selinux_security_context_unknown | 38 | selinux-security-context-unknown | Asked for SELinux security context and it wasn't available. |
| service_unknown | 2 | service-unknown | The bus doesn't know how to launch a service to supply the bus name you wanted. |
| spawn_child_exited | 25 | spawn-child-exited | While starting a new process, the child exited with a status code. |
| spawn_child_signaled | 26 | spawn-child-signaled | While starting a new process, the child exited on a signal. |
| spawn_config_invalid | 29 | spawn-config-invalid | We failed to setup the config parser correctly. |
| spawn_exec_failed | 23 | spawn-exec-failed | While starting a new process, the exec() call failed. |
| spawn_failed | 27 | spawn-failed | While starting a new process, something went wrong. |
| spawn_file_invalid | 33 | spawn-file-invalid | Service file invalid (Name, User or Exec missing). |
| spawn_fork_failed | 24 | spawn-fork-failed | While starting a new process, the fork() call failed. |
| spawn_no_memory | 34 | spawn-no-memory | Tried to get a UNIX process ID and it wasn't available. |
| spawn_permissions_invalid | 32 | spawn-permissions-invalid | Permissions are incorrect on the setuid helper. |
| spawn_service_invalid | 30 | spawn-service-invalid | Bus name was not valid. |
| spawn_service_not_found | 31 | spawn-service-not-found | Service file not found in system-services directory. |
| spawn_setup_failed | 28 | spawn-setup-failed | We failed to setup the environment correctly. |
| timed_out | 20 | timed-out | Certain timeout errors, e.g. while starting a service. Warning: this is confusingly-named given that %G_DBUS_ERROR_TIMEOUT also exists. We can't fi... |
| timeout | 12 | timeout | Certain timeout errors, possibly ETIMEDOUT on a socket. Note that %G_DBUS_ERROR_NO_REPLY is used for message reply timeouts. Warning: this is confu... |
| unix_process_id_unknown | 35 | unix-process-id-unknown | Tried to get a UNIX process ID and it wasn't available. |
| unknown_interface | 42 | unknown-interface | Interface you invoked a method on isn't known by the object. Since 2.42 |
| unknown_method | 19 | unknown-method | Method name you invoked isn't known by the object you invoked it on. |
| unknown_object | 41 | unknown-object | Object you invoked a method on isn't known. Since 2.42 |
| unknown_property | 43 | unknown-property | Property you tried to access isn't known by the object. Since 2.42 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| encode_gerror | `encode_gerror(error: GLib.Error) -> utf8` | g_dbus_error_encode_gerror | 2.26 | Creates a D-Bus error name to use for @error. If @error matches a registered error (cf. g_dbus_error_register_error()), the corresponding D-Bus err... |
| get_remote_error | `get_remote_error(error: GLib.Error) -> utf8` | g_dbus_error_get_remote_error | 2.26 | Gets the D-Bus error name used for @error, if any. This function is guaranteed to return a D-Bus error name for all #GErrors returned from function... |
| is_remote_error | `is_remote_error(error: GLib.Error) -> gboolean` | g_dbus_error_is_remote_error | 2.26 | Checks if @error represents an error received via D-Bus from a remote peer. If so, use g_dbus_error_get_remote_error() to get the name of the error. |
| new_for_dbus_error | `new_for_dbus_error(dbus_error_name: utf8, dbus_error_message: utf8) -> GLib.Error` | g_dbus_error_new_for_dbus_error | 2.26 | Creates a #GError based on the contents of @dbus_error_name and @dbus_error_message. Errors registered with g_dbus_error_register_error() will be l... |
| quark | `quark() -> GLib.Quark` | g_dbus_error_quark |  |  |
| register_error | `register_error(error_domain: GLib.Quark, error_code: gint, dbus_error_name: utf8) -> gboolean` | g_dbus_error_register_error | 2.26 | Creates an association to map between @dbus_error_name and #GErrors specified by @error_domain and @error_code. This is typically done in the routi... |
| register_error_domain | `register_error_domain(error_domain_quark_name: utf8, quark_volatile: gsize, entries: DBusErrorEntry, num_entries: guint) -> none` | g_dbus_error_register_error_domain | 2.26 | Helper function for associating a #GError error domain with D-Bus error names. While @quark_volatile has a `volatile` qualifier, this is a historic... |
| set_dbus_error | `set_dbus_error(error: GLib.Error, dbus_error_name: utf8, dbus_error_message: utf8, format: utf8?, ...: void) -> none` | g_dbus_error_set_dbus_error | 2.26 | Does nothing if @error is %NULL. Otherwise sets *@error to a new #GError created with g_dbus_error_new_for_dbus_error() with @dbus_error_message pr... |
| set_dbus_error_valist | `set_dbus_error_valist(error: GLib.Error, dbus_error_name: utf8, dbus_error_message: utf8, format: utf8?, var_args: va_list) -> none` | g_dbus_error_set_dbus_error_valist | 2.26 | Like g_dbus_error_set_dbus_error() but intended for language bindings. |
| strip_remote_error | `strip_remote_error(error: GLib.Error) -> gboolean` | g_dbus_error_strip_remote_error | 2.26 | Looks for extra information in the error message used to recover the D-Bus error name and strips it if found. If stripped, the message field in @er... |
| unregister_error | `unregister_error(error_domain: GLib.Quark, error_code: gint, dbus_error_name: utf8) -> gboolean` | g_dbus_error_unregister_error | 2.26 | Destroys an association previously set up with g_dbus_error_register_error(). |

### Gio.DBusMessageByteOrder

GType: `GDBusMessageByteOrder` ?? C type: `GDBusMessageByteOrder`

Enumeration used to describe the byte order of a D-Bus message.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| big_endian | 66 | big-endian | The byte order is big endian. |
| little_endian | 108 | little-endian | The byte order is little endian. |

### Gio.DBusMessageHeaderField

GType: `GDBusMessageHeaderField` ?? C type: `GDBusMessageHeaderField`

Header fields used in #GDBusMessage.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| destination | 6 | destination | The name the message is intended for. |
| error_name | 4 | error-name | The name of the error that occurred. |
| interface | 2 | interface | The interface name. |
| invalid | 0 | invalid | Not a valid header field. |
| member | 3 | member | The method or signal name. |
| num_unix_fds | 9 | num-unix-fds | The number of UNIX file descriptors that accompany the message. |
| path | 1 | path | The object path. |
| reply_serial | 5 | reply-serial | The serial number the message is a reply to. |
| sender | 7 | sender | Unique name of the sender of the message (filled in by the bus). |
| signature | 8 | signature | The signature of the message body. |

### Gio.DBusMessageType

GType: `GDBusMessageType` ?? C type: `GDBusMessageType`

Message types used in #GDBusMessage.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error | 3 | error | Error reply. |
| invalid | 0 | invalid | Message is of invalid type. |
| method_call | 1 | method-call | Method call. |
| method_return | 2 | method-return | Method reply. |
| signal | 4 | signal | Signal emission. |

### Gio.DriveStartStopType

GType: `GDriveStartStopType` ?? C type: `GDriveStartStopType`

Enumeration describing how a drive can be started/stopped.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multidisk | 3 | multidisk | The start/stop methods will assemble/disassemble a virtual drive from several physical drives. |
| network | 2 | network | The start/stop methods are used for connecting/disconnect to the drive over the network. |
| password | 4 | password | The start/stop methods will unlock/lock the disk (for example using the ATA <quote>SECURITY UNLOCK DEVICE</quote> command) |
| shutdown | 1 | shutdown | The stop method will physically shut down the drive and e.g. power down the port the drive is attached to. |
| unknown | 0 | unknown | Unknown or drive doesn't support start/stop. |

### Gio.EmblemOrigin

GType: `GEmblemOrigin` ?? C type: `GEmblemOrigin`

GEmblemOrigin is used to add information about the origin of the emblem to #GEmblem.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| device | 1 | device | Emblem adds device-specific information |
| livemetadata | 2 | livemetadata | Emblem depicts live metadata, such as "readonly" |
| tag | 3 | tag | Emblem comes from a user-defined tag, e.g. set by nautilus (in the future) |
| unknown | 0 | unknown | Emblem of unknown origin |

### Gio.FileAttributeStatus

GType: `GFileAttributeStatus` ?? C type: `GFileAttributeStatus`

Used by g_file_set_attributes_from_info() when setting file attributes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| error_setting | 2 | error-setting | Indicates an error in setting the value. |
| set | 1 | set | Attribute value is set. |
| unset | 0 | unset | Attribute value is unset (empty). |

### Gio.FileAttributeType

GType: `GFileAttributeType` ?? C type: `GFileAttributeType`

The data types for file attributes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| boolean | 3 | boolean | a boolean value. |
| byte_string | 2 | byte-string | a zero terminated string of non-zero bytes. |
| int32 | 5 | int32 | a signed 4-byte/32-bit integer. |
| int64 | 7 | int64 | a signed 8-byte/64-bit integer. |
| invalid | 0 | invalid | indicates an invalid or uninitialized type. |
| object | 8 | object | a #GObject. |
| string | 1 | string | a null terminated UTF8 string. |
| stringv | 9 | stringv | a %NULL terminated char **. Since 2.22 |
| uint32 | 4 | uint32 | an unsigned 4-byte/32-bit integer. |
| uint64 | 6 | uint64 | an unsigned 8-byte/64-bit integer. |

### Gio.FileMonitorEvent

GType: `GFileMonitorEvent` ?? C type: `GFileMonitorEvent`

Specifies what type of event a monitor event is.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| attribute_changed | 4 | attribute-changed | a file attribute was changed. |
| changed | 0 | changed | a file changed. |
| changes_done_hint | 1 | changes-done-hint | a hint that this was probably the last change in a set of changes. |
| created | 3 | created | a file was created. |
| deleted | 2 | deleted | a file was deleted. |
| moved | 7 | moved | the file was moved -- only sent if the (deprecated) %G_FILE_MONITOR_SEND_MOVED flag is set |
| moved_in | 9 | moved-in | the file was moved into the monitored directory from another location -- only sent if the %G_FILE_MONITOR_WATCH_MOVES flag is set. Since: 2.46. |
| moved_out | 10 | moved-out | the file was moved out of the monitored directory to another location -- only sent if the %G_FILE_MONITOR_WATCH_MOVES flag is set. Since: 2.46 |
| pre_unmount | 5 | pre-unmount | the file location will soon be unmounted. |
| renamed | 8 | renamed | the file was renamed within the current directory -- only sent if the %G_FILE_MONITOR_WATCH_MOVES flag is set. Since: 2.46. |
| unmounted | 6 | unmounted | the file location was unmounted. |

### Gio.FilesystemPreviewType

GType: `GFilesystemPreviewType` ?? C type: `GFilesystemPreviewType`

Indicates a hint from the file system whether files should be previewed in a file manager. Returned as the value of the key %G_FILE_ATTRIBUTE_FILES...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| if_always | 0 | if-always | Only preview files if user has explicitly requested it. |
| if_local | 1 | if-local | Preview files if user has requested preview of "local" files. |
| never | 2 | never | Never preview files. |

### Gio.FileType

GType: `GFileType` ?? C type: `GFileType`

Indicates the file's on-disk type. On Windows systems a file will never have %G_FILE_TYPE_SYMBOLIC_LINK type; use #GFileInfo and %G_FILE_ATTRIBUTE_...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| directory | 2 | directory | File handle represents a directory. |
| mountable | 6 | mountable | File is a mountable location. |
| regular | 1 | regular | File handle represents a regular file. |
| shortcut | 5 | shortcut | File is a shortcut (Windows systems). |
| special | 4 | special | File is a "special" file, such as a socket, fifo, block device, or character device. |
| symbolic_link | 3 | symbolic-link | File handle represents a symbolic link (Unix systems). |
| unknown | 0 | unknown | File's type is unknown. |

### Gio.IOErrorEnum

GType: `GIOErrorEnum` ?? C type: `GIOErrorEnum`

Error codes returned by GIO functions. Note that this domain may be extended in future GLib releases. In general, new error codes either only apply...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| address_in_use | 33 | address-in-use | The requested address is already in use. Since 2.22 |
| already_mounted | 17 | already-mounted | File is already mounted. |
| broken_pipe | 44 | broken-pipe | Broken pipe. Since 2.36 |
| busy | 26 | busy | File is busy. |
| cancelled | 19 | cancelled | Operation was cancelled. See #GCancellable. |
| cant_create_backup | 22 | cant-create-backup | Backup couldn't be created. |
| closed | 18 | closed | File was closed. |
| connection_closed | 44 | connection-closed | Connection closed by peer. Note that this is the same code as %G_IO_ERROR_BROKEN_PIPE; before 2.44 some "connection closed" errors returned %G_IO_E... |
| connection_refused | 39 | connection-refused | Connection refused. Since 2.26 |
| dbus_error | 36 | dbus-error | A remote object generated an error that doesn't correspond to a locally registered #GError error domain. Use g_dbus_error_get_remote_error() to ext... |
| destination_unset | 48 | destination-unset | Destination address unset. Since 2.80 |
| exists | 2 | exists | File already exists. |
| failed | 0 | failed | Generic error condition for when an operation fails and no more specific #GIOErrorEnum value is defined. |
| failed_handled | 30 | failed-handled | Operation failed and a helper program has already interacted with the user. Do not display any error dialog. |
| filename_too_long | 9 | filename-too-long | Filename is too many characters. |
| host_not_found | 28 | host-not-found | Host couldn't be found (remote operations). |
| host_unreachable | 37 | host-unreachable | Host unreachable. Since 2.26 |
| invalid_argument | 13 | invalid-argument | Invalid argument. |
| invalid_data | 35 | invalid-data | The input data was invalid. Since 2.24 |
| invalid_filename | 10 | invalid-filename | Filename is invalid or contains invalid characters. |
| is_directory | 3 | is-directory | File is a directory. |
| message_too_large | 46 | message-too-large | Message too large. Since 2.48. |
| network_unreachable | 38 | network-unreachable | Network unreachable. Since 2.26 |
| no_space | 12 | no-space | No space left on drive. |
| no_such_device | 47 | no-such-device | No such device found. Since 2.74 |
| not_connected | 45 | not-connected | Transport endpoint is not connected. Since 2.44 |
| not_directory | 4 | not-directory | File is not a directory. |
| not_empty | 5 | not-empty | File is a directory that isn't empty. |
| not_found | 1 | not-found | File not found. |
| not_initialized | 32 | not-initialized | The object has not been initialized. Since 2.22 |
| not_mountable_file | 8 | not-mountable-file | File cannot be mounted. |
| not_mounted | 16 | not-mounted | File isn't mounted. |
| not_regular_file | 6 | not-regular-file | File is not a regular file. |
| not_supported | 15 | not-supported | Operation (or one of its parameters) not supported |
| not_symbolic_link | 7 | not-symbolic-link | File is not a symbolic link. |
| partial_input | 34 | partial-input | Need more input to finish operation. Since 2.24 |
| pending | 20 | pending | Operations are still pending. |
| permission_denied | 14 | permission-denied | Permission denied. |
| proxy_auth_failed | 41 | proxy-auth-failed | Proxy authentication failed. Since 2.26 |
| proxy_failed | 40 | proxy-failed | Connection to proxy server failed. Since 2.26 |
| proxy_need_auth | 42 | proxy-need-auth | Proxy server needs authentication. Since 2.26 |
| proxy_not_allowed | 43 | proxy-not-allowed | Proxy connection is not allowed by ruleset. Since 2.26 |
| read_only | 21 | read-only | File is read only. |
| timed_out | 24 | timed-out | Operation timed out. |
| too_many_links | 11 | too-many-links | File contains too many symbolic links. |
| too_many_open_files | 31 | too-many-open-files | The current process has too many files open and can't open any more. Duplicate descriptors do count toward this limit. Since 2.20 |
| would_block | 27 | would-block | Operation would block. |
| would_merge | 29 | would-merge | Operation would merge files. |
| would_recurse | 25 | would-recurse | Operation would be recursive. |
| wrong_etag | 23 | wrong-etag | File's Entity Tag was incorrect. |

### Gio.IOModuleScopeFlags

GType: `GIOModuleScopeFlags` ?? C type: `GIOModuleScopeFlags`

Flags for use with g_io_module_scope_new().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| block_duplicates | 1 | block-duplicates | When using this scope to load or scan modules, automatically block a modules which has the same base basename as previously loaded module. |
| none | 0 | none | No module scan flags |

### Gio.MemoryMonitorWarningLevel

GType: `GMemoryMonitorWarningLevel` ?? C type: `GMemoryMonitorWarningLevel`

Memory availability warning levels. Note that because new values might be added, it is recommended that applications check #GMemoryMonitorWarningLe...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| critical | 255 | critical | The system will soon start terminating processes to reclaim memory, including background processes. |
| low | 50 | low | Memory on the device is low, processes should free up unneeded resources (for example, in-memory caches) so they can be used elsewhere. |
| medium | 100 | medium | Same as @G_MEMORY_MONITOR_WARNING_LEVEL_LOW but the device has even less free memory, so processes should try harder to free up unneeded resources.... |

### Gio.MountOperationResult

GType: `GMountOperationResult` ?? C type: `GMountOperationResult`

#GMountOperationResult is returned as a result when a request for information is send by the mounting operation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| aborted | 1 | aborted | The user requested the mount operation to be aborted |
| handled | 0 | handled | The request was fulfilled and the user specified data is now available |
| unhandled | 2 | unhandled | The request was unhandled (i.e. not implemented) |

### Gio.NetworkConnectivity

GType: `GNetworkConnectivity` ?? C type: `GNetworkConnectivity`

The host's network connectivity state, as reported by #GNetworkMonitor.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| full | 4 | full | The host is connected to a network, and appears to be able to reach the full Internet. |
| limited | 2 | limited | The host is connected to a network, but does not appear to be able to reach the full Internet, perhaps due to upstream network problems. |
| local | 1 | local | The host is not configured with a route to the Internet; it may or may not be connected to a local network. |
| portal | 3 | portal | The host is behind a captive portal and cannot reach the full Internet. |

### Gio.NotificationPriority

GType: `GNotificationPriority` ?? C type: `GNotificationPriority`

Priority levels for #GNotifications.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| high | 2 | high | for events that require more attention, usually because responses are time-sensitive (for example chat and SMS messages or alarms) |
| low | 1 | low | for notifications that do not require immediate attention - typically used for contextual background information, such as contact birthdays or loca... |
| normal | 0 | normal | the default priority, to be used for the majority of notifications (for example email messages, software updates, completed download/sync operations) |
| urgent | 3 | urgent | for urgent notifications, or notifications that require a response in a short space of time (for example phone calls or emergency warnings) |

### Gio.PasswordSave

GType: `GPasswordSave` ?? C type: `GPasswordSave`

#GPasswordSave is used to indicate the lifespan of a saved password. #Gvfs stores passwords in the Gnome keyring when this flag allows it to, and l...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| for_session | 1 | for-session | save a password for the session. |
| never | 0 | never | never save a password. |
| permanently | 2 | permanently | save a password permanently. |

### Gio.PollableReturn

GType: `GPollableReturn` ?? C type: `GPollableReturn`

Return value for various IO operations that signal errors via the return value and not necessarily via a #GError. This enum exists to be able to re...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| failed | 0 | failed | Generic error condition for when an operation fails. |
| ok | 1 | ok | The operation was successfully finished. |
| would_block | -27 | would-block | The operation would block. |

### Gio.ResolverError

GType: `GResolverError` ?? C type: `GResolverError`

An error code used with %G_RESOLVER_ERROR in a #GError returned from a #GResolver routine.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| internal | 2 | internal | unknown error |
| not_found | 0 | not-found | the requested name/address/service was not found |
| temporary_failure | 1 | temporary-failure | the requested information could not be looked up due to a network error or similar problem |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | g_resolver_error_quark | 2.22 | Gets the #GResolver Error Quark. |

### Gio.ResolverRecordType

GType: `GResolverRecordType` ?? C type: `GResolverRecordType`

The type of record that g_resolver_lookup_records() or g_resolver_lookup_records_async() should retrieve. The records are returned as lists of #GVa...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| mx | 2 | mx | look up DNS MX records for a domain |
| ns | 5 | ns | look up DNS NS records for a domain |
| soa | 4 | soa | look up DNS SOA records for a zone |
| srv | 1 | srv | look up DNS SRV records for a domain |
| txt | 3 | txt | look up DNS TXT records for a name |

### Gio.ResourceError

GType: `GResourceError` ?? C type: `GResourceError`

An error code used with %G_RESOURCE_ERROR in a #GError returned from a #GResource routine.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| internal | 1 | internal | unknown error |
| not_found | 0 | not-found | no file was found at the requested path |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | g_resource_error_quark | 2.32 | Gets the #GResource Error Quark. |

### Gio.SocketClientEvent

GType: `GSocketClientEvent` ?? C type: `GSocketClientEvent`

Describes an event occurring on a #GSocketClient. See the #GSocketClient::event signal for more details. Additional values may be added to this typ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| complete | 8 | complete | The client is done with a particular #GSocketConnectable. |
| connected | 3 | connected | The client has connected to a remote host. |
| connecting | 2 | connecting | The client is connecting to a remote host (either a proxy or the destination server). |
| proxy_negotiated | 5 | proxy-negotiated | The client has negotiated with the proxy server. |
| proxy_negotiating | 4 | proxy-negotiating | The client is negotiating with a proxy to connect to the destination server. |
| resolved | 1 | resolved | The client has completed a DNS lookup. |
| resolving | 0 | resolving | The client is doing a DNS lookup. |
| tls_handshaked | 7 | tls-handshaked | The client has performed a TLS handshake. |
| tls_handshaking | 6 | tls-handshaking | The client is performing a TLS handshake. |

### Gio.SocketFamily

GType: `GSocketFamily` ?? C type: `GSocketFamily`

The protocol family of a #GSocketAddress. (These values are identical to the system defines %AF_INET, %AF_INET6 and %AF_UNIX, if available.)

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid | 0 | invalid | no address family |
| ipv4 | 2 | ipv4 | the IPv4 family |
| ipv6 | 10 | ipv6 | the IPv6 family |
| unix | 1 | unix | the UNIX domain family |

### Gio.SocketListenerEvent

GType: `GSocketListenerEvent` ?? C type: `GSocketListenerEvent`

Describes an event occurring on a #GSocketListener. See the #GSocketListener::event signal for more details. Additional values may be added to this...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| binding | 0 | binding | The listener is about to bind a socket. |
| bound | 1 | bound | The listener has bound a socket. |
| listened | 3 | listened | The listener is now listening on this socket. |
| listening | 2 | listening | The listener is about to start listening on this socket. |

### Gio.SocketProtocol

GType: `GSocketProtocol` ?? C type: `GSocketProtocol`

A protocol identifier is specified when creating a #GSocket, which is a family/type specific identifier, where 0 means the default protocol for the...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 | default | The default protocol for the family/type |
| sctp | 132 | sctp | SCTP over IP |
| tcp | 6 | tcp | TCP over IP |
| udp | 17 | udp | UDP over IP |
| unknown | -1 | unknown | The protocol type is unknown |

### Gio.SocketType

GType: `GSocketType` ?? C type: `GSocketType`

Flags used when creating a #GSocket. Some protocols may not implement all the socket types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| datagram | 2 | datagram | Connectionless, unreliable datagram passing. (e.g. UDP) |
| invalid | 0 | invalid | Type unknown or wrong |
| seqpacket | 3 | seqpacket | Reliable connection-based passing of datagrams of fixed maximum length (e.g. SCTP). |
| stream | 1 | stream | Reliable connection-based byte streams (e.g. TCP). |

### Gio.TlsAuthenticationMode

GType: `GTlsAuthenticationMode` ?? C type: `GTlsAuthenticationMode`

The client authentication mode for a #GTlsServerConnection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | client authentication not required |
| requested | 1 | requested | client authentication is requested |
| required | 2 | required | client authentication is required |

### Gio.TlsCertificateRequestFlags

GType: `GTlsCertificateRequestFlags` ?? C type: `GTlsCertificateRequestFlags`

Flags for g_tls_interaction_request_certificate(), g_tls_interaction_request_certificate_async(), and g_tls_interaction_invoke_request_certificate().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags |

### Gio.TlsChannelBindingError

GType: `GTlsChannelBindingError` ?? C type: `GTlsChannelBindingError`

An error code used with %G_TLS_CHANNEL_BINDING_ERROR in a #GError to indicate a TLS channel binding retrieval error.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| general_error | 4 | general-error | Any other backend error preventing binding data retrieval. |
| invalid_state | 1 | invalid-state | The handshake is not yet complete on the connection which is a strong requirement for any existing binding type. |
| not_available | 2 | not-available | Handshake is complete but binding data is not available. That normally indicates the TLS implementation failed to provide the binding data. For exa... |
| not_implemented | 0 | not-implemented | Either entire binding retrieval facility or specific binding type is not implemented in the TLS backend. |
| not_supported | 3 | not-supported | Binding type is not supported on the current connection. This error could be triggered when requesting `tls-server-end-point` binding data for a ce... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | g_tls_channel_binding_error_quark | 2.66 | Gets the TLS channel binding error quark. |

### Gio.TlsChannelBindingType

GType: `GTlsChannelBindingType` ?? C type: `GTlsChannelBindingType`

The type of TLS channel binding data to retrieve from #GTlsConnection or #GDtlsConnection, as documented by RFC 5929 or RFC 9266. The `tls-unique-f...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| exporter | 2 | exporter | `tls-exporter` binding type. Since: 2.74 |
| server_end_point | 1 | server-end-point | `tls-server-end-point` binding type |
| unique | 0 | unique | `tls-unique` binding type |

### Gio.TlsDatabaseLookupFlags

GType: `GTlsDatabaseLookupFlags` ?? C type: `GTlsDatabaseLookupFlags`

Flags for g_tls_database_lookup_certificate_for_handle(), g_tls_database_lookup_certificate_issuer(), and g_tls_database_lookup_certificates_issued...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| keypair | 1 | keypair | Restrict lookup to certificates that have a private key. |
| none | 0 | none | No lookup flags |

### Gio.TlsError

GType: `GTlsError` ?? C type: `GTlsError`

An error code used with %G_TLS_ERROR in a #GError returned from a TLS-related routine.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_certificate | 2 | bad-certificate | The certificate presented could not be parsed or failed validation. |
| bad_certificate_password | 8 | bad-certificate-password | The certificate failed to load because a password was incorrect. Since: 2.72 |
| certificate_required | 5 | certificate-required | The TLS handshake failed because the server requested a client-side certificate, but none was provided. See g_tls_connection_set_certificate(). |
| eof | 6 | eof | The TLS connection was closed without proper notice, which may indicate an attack. See g_tls_connection_set_require_close_notify(). |
| handshake | 4 | handshake | The TLS handshake failed because the peer's certificate was not acceptable. |
| inappropriate_fallback | 7 | inappropriate-fallback | The TLS handshake failed because the client sent the fallback SCSV, indicating a protocol downgrade attack. Since: 2.60 |
| misc | 1 | misc | Miscellaneous TLS error |
| not_tls | 3 | not-tls | The TLS handshake failed because the peer does not seem to be a TLS server. |
| unavailable | 0 | unavailable | No TLS provider is available |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | g_tls_error_quark | 2.28 | Gets the TLS error quark. |

### Gio.TlsInteractionResult

GType: `GTlsInteractionResult` ?? C type: `GTlsInteractionResult`

#GTlsInteractionResult is returned by various functions in #GTlsInteraction when finishing an interaction request.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| failed | 2 | failed | The interaction has failed, or was cancelled. and the operation should be aborted. |
| handled | 1 | handled | The interaction completed, and resulting data is available. |
| unhandled | 0 | unhandled | The interaction was unhandled (i.e. not implemented). |

### Gio.TlsProtocolVersion

GType: `GTlsProtocolVersion` ?? C type: `GTlsProtocolVersion`

The TLS or DTLS protocol version used by a #GTlsConnection or #GDtlsConnection. The integer values of these versions are sequential to ensure newer...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| dtls_1_0 | 201 | dtls-1-0 | DTLS 1.0, which is insecure and should not be used |
| dtls_1_2 | 202 | dtls-1-2 | DTLS 1.2, defined by RFC 6347 |
| ssl_3_0 | 1 | ssl-3-0 | SSL 3.0, which is insecure and should not be used |
| tls_1_0 | 2 | tls-1-0 | TLS 1.0, which is insecure and should not be used |
| tls_1_1 | 3 | tls-1-1 | TLS 1.1, which is insecure and should not be used |
| tls_1_2 | 4 | tls-1-2 | TLS 1.2, defined by RFC 5246 |
| tls_1_3 | 5 | tls-1-3 | TLS 1.3, defined by RFC 8446 |
| unknown | 0 | unknown | No protocol version or unknown protocol version |

### Gio.TlsRehandshakeMode

GType: `GTlsRehandshakeMode` ?? C type: `GTlsRehandshakeMode`

When to allow rehandshaking. See g_tls_connection_set_rehandshake_mode().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| never | 0 | never | Never allow rehandshaking |
| safely | 1 | safely | Allow safe rehandshaking only |
| unsafely | 2 | unsafely | Allow unsafe rehandshaking |

### Gio.UnixSocketAddressType

GType: `GUnixSocketAddressType` ?? C type: `GUnixSocketAddressType`

The type of name used by a #GUnixSocketAddress. %G_UNIX_SOCKET_ADDRESS_PATH indicates a traditional unix domain socket bound to a filesystem path. ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| abstract | 3 | abstract | an abstract name |
| abstract_padded | 4 | abstract-padded | an abstract name, 0-padded to the full length of a unix socket name |
| anonymous | 1 | anonymous | anonymous |
| invalid | 0 | invalid | invalid |
| path | 2 | path | a filesystem path |

### Gio.ZlibCompressorFormat

GType: `GZlibCompressorFormat` ?? C type: `GZlibCompressorFormat`

Used to select the type of data format to use for #GZlibDecompressor and #GZlibCompressor.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| gzip | 1 | gzip | gzip file format |
| raw | 2 | raw | deflate compression with no header |
| zlib | 0 | zlib | deflate compression with zlib header |

## Flags

### Gio.AppInfoCreateFlags

GType: `GAppInfoCreateFlags` ?? C type: `GAppInfoCreateFlags`

Flags used when creating a #GAppInfo.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| needs_terminal | 1 | needs-terminal | Application opens in a terminal window. |
| none | 0 | none | No flags. |
| supports_startup_notification | 4 | supports-startup-notification | Application supports startup notification. Since 2.26 |
| supports_uris | 2 | supports-uris | Application supports URI arguments. |

### Gio.ApplicationFlags

GType: `GApplicationFlags` ?? C type: `GApplicationFlags`

Flags used to define the behaviour of a #GApplication.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| allow_replacement | 128 | allow-replacement | Allow another instance to take over the bus name. Since: 2.60 |
| can_override_app_id | 64 | can-override-app-id | Allow users to override the application ID from the command line with `--gapplication-app-id`. Since: 2.48 |
| default_flags | 0 | default-flags | Default flags. Since: 2.74 |
| flags_none | 0 | flags-none | Default. Deprecated in 2.74, use %G_APPLICATION_DEFAULT_FLAGS instead |
| handles_command_line | 8 | handles-command-line | This application handles command line arguments (in the primary instance). Note that this flag only affect the default implementation of local_comm... |
| handles_open | 4 | handles-open | This application handles opening files (in the primary instance). Note that this flag only affects the default implementation of local_command_line... |
| is_launcher | 2 | is-launcher | Don't try to become the primary instance. |
| is_service | 1 | is-service | Run as a service. In this mode, registration fails if the service is already running, and the application will initially wait up to 10 seconds for ... |
| non_unique | 32 | non-unique | Make no attempts to do any of the typical single-instance application negotiation, even if the application ID is given. The application neither att... |
| replace | 256 | replace | Take over from another instance. This flag is usually set by passing `--gapplication-replace` on the commandline. Since: 2.60 |
| send_environment | 16 | send-environment | Send the environment of the launching process to the primary instance. Set this flag if your application is expected to behave differently dependin... |

### Gio.AskPasswordFlags

GType: `GAskPasswordFlags` ?? C type: `GAskPasswordFlags`

#GAskPasswordFlags are used to request specific information from the user, or to notify the user of their choices in an authentication situation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| anonymous_supported | 16 | anonymous-supported | operation supports anonymous users. |
| need_domain | 4 | need-domain | operation requires a domain. |
| need_password | 1 | need-password | operation requires a password. |
| need_username | 2 | need-username | operation requires a username. |
| saving_supported | 8 | saving-supported | operation supports saving settings. |
| tcrypt | 32 | tcrypt | operation takes TCRYPT parameters (Since: 2.58) |

### Gio.BusNameOwnerFlags

GType: `GBusNameOwnerFlags` ?? C type: `GBusNameOwnerFlags`

Flags used in g_bus_own_name().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| allow_replacement | 1 | allow-replacement | Allow another message bus connection to claim the name. |
| do_not_queue | 4 | do-not-queue | If another message bus connection owns the name, immediately return an error from g_bus_own_name() rather than entering the waiting queue for that ... |
| none | 0 | none | No flags set. |
| replace | 2 | replace | If another message bus connection owns the name and have specified %G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT, then take the name from the other con... |

### Gio.BusNameWatcherFlags

GType: `GBusNameWatcherFlags` ?? C type: `GBusNameWatcherFlags`

Flags used in g_bus_watch_name().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| auto_start | 1 | auto-start | If no-one owns the name when beginning to watch the name, ask the bus to launch an owner for the name. |
| none | 0 | none | No flags set. |

### Gio.ConverterFlags

GType: `GConverterFlags` ?? C type: `GConverterFlags`

Flags used when calling a g_converter_convert().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| flush | 2 | flush | Flush data |
| input_at_end | 1 | input-at-end | At end of input data |
| none | 0 | none | No flags. |

### Gio.DBusCallFlags

GType: `GDBusCallFlags` ?? C type: `GDBusCallFlags`

Flags used in g_dbus_connection_call() and similar APIs.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| allow_interactive_authorization | 2 | allow-interactive-authorization | the caller is prepared to wait for interactive authorization. Since 2.46. |
| no_auto_start | 1 | no-auto-start | The bus must not launch an owner for the destination name in response to this method invocation. |
| none | 0 | none | No flags set. |

### Gio.DBusCapabilityFlags

GType: `GDBusCapabilityFlags` ?? C type: `GDBusCapabilityFlags`

Capabilities negotiated with the remote peer.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |
| unix_fd_passing | 1 | unix-fd-passing | The connection supports exchanging UNIX file descriptors with the remote peer. |

### Gio.DBusConnectionFlags

GType: `GDBusConnectionFlags` ?? C type: `GDBusConnectionFlags`

Flags used when creating a new #GDBusConnection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| authentication_allow_anonymous | 4 | authentication-allow-anonymous | When authenticating as a server, allow the anonymous authentication method. |
| authentication_client | 1 | authentication-client | Perform authentication against server. |
| authentication_require_same_user | 32 | authentication-require-same-user | When authenticating as a server, require the UID of the peer to be the same as the UID of the server. (Since: 2.68) |
| authentication_server | 2 | authentication-server | Perform authentication against client. |
| cross_namespace | 64 | cross-namespace | When authenticating, try to use protocols that work across a Linux user namespace boundary, even if this reduces interoperability with older D-Bus ... |
| delay_message_processing | 16 | delay-message-processing | If set, processing of D-Bus messages is delayed until g_dbus_connection_start_message_processing() is called. |
| message_bus_connection | 8 | message-bus-connection | Pass this flag if connecting to a peer that is a message bus. This means that the Hello() method will be invoked as part of the connection setup. |
| none | 0 | none | No flags set. |

### Gio.DBusInterfaceSkeletonFlags

GType: `GDBusInterfaceSkeletonFlags` ?? C type: `GDBusInterfaceSkeletonFlags`

Flags describing the behavior of a #GDBusInterfaceSkeleton instance.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| handle_method_invocations_in_thread | 1 | handle-method-invocations-in-thread | Each method invocation is handled in a thread dedicated to the invocation. This means that the method implementation can use blocking IO without bl... |
| none | 0 | none | No flags set. |

### Gio.DBusMessageFlags

GType: `GDBusMessageFlags` ?? C type: `GDBusMessageFlags`

Message flags used in #GDBusMessage.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| allow_interactive_authorization | 4 | allow-interactive-authorization | If set on a method call, this flag means that the caller is prepared to wait for interactive authorization. Since 2.46. |
| no_auto_start | 2 | no-auto-start | The bus must not launch an owner for the destination name in response to this message. |
| no_reply_expected | 1 | no-reply-expected | A reply is not expected. |
| none | 0 | none | No flags set. |

### Gio.DBusObjectManagerClientFlags

GType: `GDBusObjectManagerClientFlags` ?? C type: `GDBusObjectManagerClientFlags`

Flags used when constructing a #GDBusObjectManagerClient.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| do_not_auto_start | 1 | do-not-auto-start | If not set and the manager is for a well-known name, then request the bus to launch an owner for the name if no-one owns the name. This flag can on... |
| none | 0 | none | No flags set. |

### Gio.DBusPropertyInfoFlags

GType: `GDBusPropertyInfoFlags` ?? C type: `GDBusPropertyInfoFlags`

Flags describing the access control of a D-Bus property.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |
| readable | 1 | readable | Property is readable. |
| writable | 2 | writable | Property is writable. |

### Gio.DBusProxyFlags

GType: `GDBusProxyFlags` ?? C type: `GDBusProxyFlags`

Flags used when constructing an instance of a #GDBusProxy derived class.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| do_not_auto_start | 4 | do-not-auto-start | If the proxy is for a well-known name, do not ask the bus to launch an owner during proxy initialization or a method call. This flag is only meanin... |
| do_not_auto_start_at_construction | 16 | do-not-auto-start-at-construction | If the proxy is for a well-known name, do not ask the bus to launch an owner during proxy initialization, but allow it to be autostarted by a metho... |
| do_not_connect_signals | 2 | do-not-connect-signals | Don't connect to signals on the remote object. |
| do_not_load_properties | 1 | do-not-load-properties | Don't load properties. |
| get_invalidated_properties | 8 | get-invalidated-properties | If set, the property value for any __invalidated property__ will be (asynchronously) retrieved upon receiving the `PropertiesChanged` D-Bus signal ... |
| no_match_rule | 32 | no-match-rule | Don't actually send the AddMatch D-Bus call for this signal subscription. This gives you more control over which match rules you add (but you must ... |
| none | 0 | none | No flags set. |

### Gio.DBusSendMessageFlags

GType: `GDBusSendMessageFlags` ?? C type: `GDBusSendMessageFlags`

Flags used when sending #GDBusMessages on a #GDBusConnection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |
| preserve_serial | 1 | preserve-serial | Do not automatically assign a serial number from the #GDBusConnection object when sending a message. |

### Gio.DBusServerFlags

GType: `GDBusServerFlags` ?? C type: `GDBusServerFlags`

Flags used when creating a #GDBusServer.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| authentication_allow_anonymous | 2 | authentication-allow-anonymous | Allow the anonymous authentication method. |
| authentication_require_same_user | 4 | authentication-require-same-user | Require the UID of the peer to be the same as the UID of the server when authenticating. (Since: 2.68) |
| none | 0 | none | No flags set. |
| run_in_thread | 1 | run-in-thread | All #GDBusServer::new-connection signals will run in separated dedicated threads (see signal for details). |

### Gio.DBusSignalFlags

GType: `GDBusSignalFlags` ?? C type: `GDBusSignalFlags`

Flags used when subscribing to signals via g_dbus_connection_signal_subscribe().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| match_arg0_namespace | 2 | match-arg0-namespace | Match first arguments that contain a bus or interface name with the given namespace. |
| match_arg0_path | 4 | match-arg0-path | Match first arguments that contain an object path that is either equivalent to the given path, or one of the paths is a subpath of the other. |
| no_match_rule | 1 | no-match-rule | Don't actually send the AddMatch D-Bus call for this signal subscription. This gives you more control over which match rules you add (but you must ... |
| none | 0 | none | No flags set. |

### Gio.DBusSubtreeFlags

GType: `GDBusSubtreeFlags` ?? C type: `GDBusSubtreeFlags`

Flags passed to g_dbus_connection_register_subtree().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| dispatch_to_unenumerated_nodes | 1 | dispatch-to-unenumerated-nodes | Method calls to objects not in the enumerated range will still be dispatched. This is useful if you want to dynamically spawn objects in the subtree. |
| none | 0 | none | No flags set. |

### Gio.DriveStartFlags

GType: `GDriveStartFlags` ?? C type: `GDriveStartFlags`

Flags used when starting a drive.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |

### Gio.FileAttributeInfoFlags

GType: `GFileAttributeInfoFlags` ?? C type: `GFileAttributeInfoFlags`

Flags specifying the behaviour of an attribute.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| copy_when_moved | 2 | copy-when-moved | copy the attribute values when the file is moved. |
| copy_with_file | 1 | copy-with-file | copy the attribute values when the file is copied. |
| none | 0 | none | no flags set. |

### Gio.FileCopyFlags

GType: `GFileCopyFlags` ?? C type: `GFileCopyFlags`

Flags used when copying or moving files.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_metadata | 8 | all-metadata | Copy all file metadata instead of just default set used for copy (see #GFileInfo). |
| backup | 2 | backup | Make a backup of any existing files. |
| no_fallback_for_move | 16 | no-fallback-for-move | Don't use copy and delete fallback if native move not supported. |
| nofollow_symlinks | 4 | nofollow-symlinks | Don't follow symlinks. |
| none | 0 | none | No flags set. |
| overwrite | 1 | overwrite | Overwrite any existing files |
| target_default_modified_time | 64 | target-default-modified-time | Use default modification timestamps instead of copying them from the source file. Since 2.80 |
| target_default_perms | 32 | target-default-perms | Leaves target file with default perms, instead of setting the source file perms. |

### Gio.FileCreateFlags

GType: `GFileCreateFlags` ?? C type: `GFileCreateFlags`

Flags used when an operation may create a file.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |
| private | 1 | private | Create a file that can only be accessed by the current user. |
| replace_destination | 2 | replace-destination | Replace the destination as if it didn't exist before. Don't try to keep any old permissions, replace instead of following links. This is generally ... |

### Gio.FileMeasureFlags

GType: `GFileMeasureFlags` ?? C type: `GFileMeasureFlags`

Flags that can be used with g_file_measure_disk_usage().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| apparent_size | 4 | apparent-size | Tally usage based on apparent file sizes. Normally, the block-size is used, if available, as this is a more accurate representation of disk space u... |
| no_xdev | 8 | no-xdev | Do not cross mount point boundaries. Compare with `du -x`. |
| none | 0 | none | No flags set. |
| report_any_error | 2 | report-any-error | Report any error encountered while traversing the directory tree. Normally errors are only reported for the toplevel file. |

### Gio.FileMonitorFlags

GType: `GFileMonitorFlags` ?? C type: `GFileMonitorFlags`

Flags used to set what a #GFileMonitor will watch for.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |
| send_moved | 2 | send-moved | Pair DELETED and CREATED events caused by file renames (moves) and send a single G_FILE_MONITOR_EVENT_MOVED event instead (NB: not supported on all... |
| watch_hard_links | 4 | watch-hard-links | Watch for changes to the file made via another hard link. Since 2.36. |
| watch_mounts | 1 | watch-mounts | Watch for mount events. |
| watch_moves | 8 | watch-moves | Watch for rename operations on a monitored directory. This causes %G_FILE_MONITOR_EVENT_RENAMED, %G_FILE_MONITOR_EVENT_MOVED_IN and %G_FILE_MONITOR... |

### Gio.FileQueryInfoFlags

GType: `GFileQueryInfoFlags` ?? C type: `GFileQueryInfoFlags`

Flags used when querying a #GFileInfo.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| nofollow_symlinks | 1 | nofollow-symlinks | Don't follow symlinks. |
| none | 0 | none | No flags set. |

### Gio.IOStreamSpliceFlags

GType: `GIOStreamSpliceFlags` ?? C type: `GIOStreamSpliceFlags`

GIOStreamSpliceFlags determine how streams should be spliced.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close_stream1 | 1 | close-stream1 | Close the first stream after the splice. |
| close_stream2 | 2 | close-stream2 | Close the second stream after the splice. |
| none | 0 | none | Do not close either stream. |
| wait_for_both | 4 | wait-for-both | Wait for both splice operations to finish before calling the callback. |

### Gio.MountMountFlags

GType: `GMountMountFlags` ?? C type: `GMountMountFlags`

Flags used when mounting a mount.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |

### Gio.MountUnmountFlags

GType: `GMountUnmountFlags` ?? C type: `GMountUnmountFlags`

Flags used when an unmounting a mount.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| force | 1 | force | Unmount even if there are outstanding file operations on the mount. |
| none | 0 | none | No flags set. |

### Gio.OutputStreamSpliceFlags

GType: `GOutputStreamSpliceFlags` ?? C type: `GOutputStreamSpliceFlags`

GOutputStreamSpliceFlags determine how streams should be spliced.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| close_source | 1 | close-source | Close the source stream after the splice. |
| close_target | 2 | close-target | Close the target stream after the splice. |
| none | 0 | none | Do not close either stream. |

### Gio.ResolverNameLookupFlags

GType: `GResolverNameLookupFlags` ?? C type: `GResolverNameLookupFlags`

Flags to modify lookup behavior.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 | default | default behavior (same as g_resolver_lookup_by_name()) |
| ipv4_only | 1 | ipv4-only | only resolve ipv4 addresses |
| ipv6_only | 2 | ipv6-only | only resolve ipv6 addresses |

### Gio.ResourceFlags

GType: `GResourceFlags` ?? C type: `GResourceFlags`

GResourceFlags give information about a particular file inside a resource bundle.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| compressed | 1 | compressed | The file is compressed. |
| none | 0 | none | No flags set. |

### Gio.ResourceLookupFlags

GType: `GResourceLookupFlags` ?? C type: `GResourceLookupFlags`

GResourceLookupFlags determine how resource path lookups are handled.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags set. |

### Gio.SettingsBindFlags

GType: `GSettingsBindFlags` ?? C type: `GSettingsBindFlags`

Flags used when creating a binding. These flags determine in which direction the binding works. The default is to synchronize in both directions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| default | 0 | default | Equivalent to `G_SETTINGS_BIND_GET\|G_SETTINGS_BIND_SET` |
| get | 1 | get | Update the #GObject property when the setting changes. It is an error to use this flag if the property is not writable. |
| get_no_changes | 8 | get-no-changes | When set in addition to %G_SETTINGS_BIND_GET, set the #GObject property value initially from the setting, but do not listen for changes of the setting |
| invert_boolean | 16 | invert-boolean | When passed to g_settings_bind(), uses a pair of mapping functions that invert the boolean value when mapping between the setting and the property.... |
| no_sensitivity | 4 | no-sensitivity | Do not try to bind a "sensitivity" property to the writability of the setting |
| set | 2 | set | Update the setting when the #GObject property changes. It is an error to use this flag if the property is not readable. |

### Gio.SocketMsgFlags

GType: `GSocketMsgFlags` ?? C type: `GSocketMsgFlags`

Flags used in g_socket_receive_message() and g_socket_send_message(). The flags listed in the enum are some commonly available flags, but the value...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| dontroute | 4 | dontroute | Don't use a gateway to send out the packet, only send to hosts on directly connected networks. |
| none | 0 | none | No flags. |
| oob | 1 | oob | Request to send/receive out of band data. |
| peek | 2 | peek | Read data from the socket without removing it from the queue. |

### Gio.SubprocessFlags

GType: `GSubprocessFlags` ?? C type: `GSubprocessFlags`

Flags to define the behaviour of a #GSubprocess. Note that the default for stdin is to redirect from `/dev/null`. For stdout and stderr the default...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| inherit_fds | 128 | inherit-fds | spawned processes will inherit the file descriptors of their parent, unless those descriptors have been explicitly marked as close-on-exec. This fl... |
| none | 0 | none | No flags. |
| search_path_from_envp | 256 | search-path-from-envp | if path searching is needed when spawning the subprocess, use the `PATH` in the launcher environment. (Since: 2.72) |
| stderr_merge | 64 | stderr-merge | merge the stderr of the spawned process with whatever the stdout happens to be. This is a good way of directing both streams to a common log file, ... |
| stderr_pipe | 16 | stderr-pipe | create a pipe for the stderr of the spawned process that can be accessed with g_subprocess_get_stderr_pipe(). |
| stderr_silence | 32 | stderr-silence | silence the stderr of the spawned process (ie: redirect to `/dev/null`). |
| stdin_inherit | 2 | stdin-inherit | stdin is inherited from the calling process. |
| stdin_pipe | 1 | stdin-pipe | create a pipe for the stdin of the spawned process that can be accessed with g_subprocess_get_stdin_pipe(). |
| stdout_pipe | 4 | stdout-pipe | create a pipe for the stdout of the spawned process that can be accessed with g_subprocess_get_stdout_pipe(). |
| stdout_silence | 8 | stdout-silence | silence the stdout of the spawned process (ie: redirect to `/dev/null`). |

### Gio.TestDBusFlags

GType: `GTestDBusFlags` ?? C type: `GTestDBusFlags`

Flags to define future #GTestDBus behaviour.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No flags. |

### Gio.TlsCertificateFlags

GType: `GTlsCertificateFlags` ?? C type: `GTlsCertificateFlags`

A set of flags describing TLS certification validation. This can be used to describe why a particular certificate was rejected (for example, in #GT...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_identity | 2 | bad-identity | The certificate does not match the expected identity of the site that it was retrieved from. |
| expired | 8 | expired | The certificate has expired |
| generic_error | 64 | generic-error | Some other error occurred validating the certificate |
| insecure | 32 | insecure | The certificate's algorithm is considered insecure. |
| no_flags | 0 | no-flags | No flags set. Since: 2.74 |
| not_activated | 4 | not-activated | The certificate's activation time is still in the future |
| revoked | 16 | revoked | The certificate has been revoked according to the #GTlsConnection's certificate revocation list. |
| unknown_ca | 1 | unknown-ca | The signing certificate authority is not known. |
| validate_all | 127 | validate-all | the combination of all of the above flags |

### Gio.TlsDatabaseVerifyFlags

GType: `GTlsDatabaseVerifyFlags` ?? C type: `GTlsDatabaseVerifyFlags`

Flags for g_tls_database_verify_chain().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| none | 0 | none | No verification flags |

### Gio.TlsPasswordFlags

GType: `GTlsPasswordFlags` ?? C type: `GTlsPasswordFlags`

Various flags for the password.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| final_try | 8 | final-try | Hint to the user that this is the last try to get this password right. |
| many_tries | 4 | many-tries | Hint to the user that the password has been wrong many times, and the user may not have many chances left. |
| none | 0 | none | No flags |
| pkcs11_context_specific | 64 | pkcs11-context-specific | For PKCS #11, the context-specific PIN is required. Since: 2.70. |
| pkcs11_security_officer | 32 | pkcs11-security-officer | For PKCS #11, the security officer PIN is required. Since: 2.70. |
| pkcs11_user | 16 | pkcs11-user | For PKCS #11, the user PIN is required. Since: 2.70. |
| retry | 2 | retry | The password was wrong, and the user should retry. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ActionEntry |  | 0 | 0 | 0 | This struct defines a single action. It is for use with g_action_map_add_action_entries(). The order of the items in the structure are intended to ... |
| ActionGroupInterface |  | 0 | 0 | 0 | The virtual function table for #GActionGroup. |
| ActionInterface |  | 0 | 0 | 0 | The virtual function table for #GAction. |
| ActionMapInterface |  | 0 | 0 | 0 | The virtual function table for #GActionMap. |
| AppInfoIface |  | 0 | 0 | 0 | Application Information interface, for operating system portability. |
| AppLaunchContextClass |  | 0 | 0 | 0 | a display string for the display. |
| AppLaunchContextPrivate |  | 0 | 0 | 0 |  |
| ApplicationClass |  | 0 | 0 | 0 | Virtual function table for #GApplication. |
| ApplicationCommandLineClass |  | 0 | 0 | 0 | The #GApplicationCommandLineClass-struct contains private data only. |
| ApplicationCommandLinePrivate |  | 0 | 0 | 0 |  |
| ApplicationPrivate |  | 0 | 0 | 0 |  |
| AsyncInitableIface |  | 0 | 0 | 0 | Provides an interface for asynchronous initializing object such that initialization may fail. |
| AsyncResultIface |  | 0 | 0 | 0 | Interface definition for #GAsyncResult. |
| BufferedInputStreamClass |  | 0 | 0 | 0 | the number of bytes read into @stream's buffer, up to @count, or -1 on error. |
| BufferedInputStreamPrivate |  | 0 | 0 | 0 |  |
| BufferedOutputStreamClass |  | 0 | 0 | 0 |  |
| BufferedOutputStreamPrivate |  | 0 | 0 | 0 |  |
| CancellableClass |  | 0 | 0 | 0 |  |
| CancellablePrivate |  | 0 | 0 | 0 |  |
| CharsetConverterClass |  | 0 | 0 | 0 |  |
| ConverterIface |  | 0 | 0 | 0 | Provides an interface for converting data from one type to another type. The conversion can be stateful and may fail at any place. |
| ConverterInputStreamClass |  | 0 | 0 | 0 |  |
| ConverterInputStreamPrivate |  | 0 | 0 | 0 |  |
| ConverterOutputStreamClass |  | 0 | 0 | 0 |  |
| ConverterOutputStreamPrivate |  | 0 | 0 | 0 |  |
| CredentialsClass |  | 0 | 0 | 0 | Class structure for #GCredentials. |
| DatagramBasedInterface |  | 0 | 0 | 0 | Provides an interface for socket-like objects which have datagram semantics, following the Berkeley sockets API. The interface methods are thin wra... |
| DataInputStreamClass |  | 0 | 0 | 0 |  |
| DataInputStreamPrivate |  | 0 | 0 | 0 |  |
| DataOutputStreamClass |  | 0 | 0 | 0 |  |
| DataOutputStreamPrivate |  | 0 | 0 | 0 |  |
| DBusAnnotationInfo |  | 0 | 0 | 3 | Information about an annotation. |
| DBusArgInfo |  | 0 | 0 | 2 | Information about an argument for a method or a signal. |
| DBusErrorEntry |  | 0 | 0 | 0 | Struct used in g_dbus_error_register_error_domain(). |
| DBusInterfaceIface |  | 0 | 0 | 0 | Base type for D-Bus interfaces. |
| DBusInterfaceInfo |  | 0 | 0 | 8 | Information about a D-Bus interface. |
| DBusInterfaceSkeletonClass |  | 0 | 0 | 0 | Class structure for #GDBusInterfaceSkeleton. |
| DBusInterfaceSkeletonPrivate |  | 0 | 0 | 0 |  |
| DBusInterfaceVTable |  | 0 | 0 | 0 | Virtual table for handling properties and method calls for a D-Bus interface. Since 2.38, if you want to handle getting/setting D-Bus properties as... |
| DBusMethodInfo |  | 0 | 0 | 2 | Information about a method on an D-Bus interface. |
| DBusNodeInfo |  | 0 | 0 | 5 | Information about nodes in a remote object hierarchy. |
| DBusObjectIface |  | 0 | 0 | 0 | Base object type for D-Bus objects. |
| DBusObjectManagerClientClass |  | 0 | 0 | 0 | Class structure for #GDBusObjectManagerClient. |
| DBusObjectManagerClientPrivate |  | 0 | 0 | 0 |  |
| DBusObjectManagerIface |  | 0 | 0 | 0 | Base type for D-Bus object managers. |
| DBusObjectManagerServerClass |  | 0 | 0 | 0 | Class structure for #GDBusObjectManagerServer. |
| DBusObjectManagerServerPrivate |  | 0 | 0 | 0 |  |
| DBusObjectProxyClass |  | 0 | 0 | 0 | Class structure for #GDBusObjectProxy. |
| DBusObjectProxyPrivate |  | 0 | 0 | 0 |  |
| DBusObjectSkeletonClass |  | 0 | 0 | 0 | Class structure for #GDBusObjectSkeleton. |
| DBusObjectSkeletonPrivate |  | 0 | 0 | 0 |  |
| DBusPropertyInfo |  | 0 | 0 | 2 | Information about a D-Bus property on a D-Bus interface. |
| DBusProxyClass |  | 0 | 0 | 0 | Class structure for #GDBusProxy. |
| DBusProxyPrivate |  | 0 | 0 | 0 |  |
| DBusSignalInfo |  | 0 | 0 | 2 | Information about a signal on a D-Bus interface. |
| DBusSubtreeVTable |  | 0 | 0 | 0 | Virtual table for handling subtrees registered with g_dbus_connection_register_subtree(). |
| DebugControllerDBusClass |  | 0 | 0 | 0 | The virtual function table for #GDebugControllerDBus. |
| DebugControllerInterface |  | 0 | 0 | 0 | The virtual function table for #GDebugController. |
| DesktopAppInfoClass |  | 0 | 0 | 0 |  |
| DesktopAppInfoLookupIface |  | 0 | 0 | 0 | Interface that is used by backends to associate default handlers with URI schemes. |
| DriveIface |  | 0 | 0 | 0 | Interface for creating #GDrive implementations. |
| DtlsClientConnectionInterface |  | 0 | 0 | 0 | vtable for a #GDtlsClientConnection implementation. |
| DtlsConnectionInterface |  | 0 | 0 | 0 | Virtual method table for a #GDtlsConnection implementation. |
| DtlsServerConnectionInterface |  | 0 | 0 | 0 | vtable for a #GDtlsServerConnection implementation. |
| EmblemClass |  | 0 | 0 | 0 |  |
| EmblemedIconClass |  | 0 | 0 | 0 |  |
| EmblemedIconPrivate |  | 0 | 0 | 0 |  |
| FileAttributeInfo |  | 0 | 0 | 0 | Information about a specific attribute. |
| FileAttributeInfoList |  | 0 | 0 | 6 | Acts as a lightweight registry for possible valid file attributes. The registry stores Key-Value pair formats as #GFileAttributeInfos. |
| FileAttributeMatcher |  | 0 | 0 | 9 | Determines if a string matches a file attribute. |
| FileDescriptorBasedIface |  | 0 | 0 | 0 | An interface for file descriptor based io objects. |
| FileEnumeratorClass |  | 0 | 0 | 0 | A #GFileInfo or %NULL on error or end of enumerator. Free the returned object with g_object_unref() when no longer needed. |
| FileEnumeratorPrivate |  | 0 | 0 | 0 |  |
| FileIconClass |  | 0 | 0 | 0 |  |
| FileIface |  | 0 | 0 | 0 | An interface for writing VFS file handles. |
| FileInfoClass |  | 0 | 0 | 0 |  |
| FileInputStreamClass |  | 0 | 0 | 0 | a #GFileInfo, or %NULL on error. |
| FileInputStreamPrivate |  | 0 | 0 | 0 |  |
| FileIOStreamClass |  | 0 | 0 | 0 | a #GFileInfo for the @stream, or %NULL on error. |
| FileIOStreamPrivate |  | 0 | 0 | 0 |  |
| FileMonitorClass |  | 0 | 0 | 0 | always %TRUE |
| FileMonitorPrivate |  | 0 | 0 | 0 |  |
| FilenameCompleterClass |  | 0 | 0 | 0 |  |
| FileOutputStreamClass |  | 0 | 0 | 0 | a #GFileInfo for the @stream, or %NULL on error. |
| FileOutputStreamPrivate |  | 0 | 0 | 0 |  |
| FilterInputStreamClass |  | 0 | 0 | 0 |  |
| FilterOutputStreamClass |  | 0 | 0 | 0 |  |
| IconIface |  | 0 | 0 | 0 | GIconIface is used to implement GIcon types for various different systems. See #GThemedIcon and #GLoadableIcon for examples of how to implement thi... |
| InetAddressClass |  | 0 | 0 | 0 | a representation of @address as a string, which should be freed after use. |
| InetAddressMaskClass |  | 0 | 0 | 0 |  |
| InetAddressMaskPrivate |  | 0 | 0 | 0 |  |
| InetAddressPrivate |  | 0 | 0 | 0 |  |
| InetSocketAddressClass |  | 0 | 0 | 0 |  |
| InetSocketAddressPrivate |  | 0 | 0 | 0 |  |
| InitableIface |  | 0 | 0 | 0 | Provides an interface for initializing object such that initialization may fail. |
| InputMessage |  | 0 | 0 | 0 | Structure used for scatter/gather data input when receiving multiple messages or packets in one go. You generally pass in an array of empty #GInput... |
| InputStreamClass |  | 0 | 0 | 0 | Number of bytes skipped, or -1 on error |
| InputStreamPrivate |  | 0 | 0 | 0 |  |
| InputVector |  | 0 | 0 | 0 | Structure used for scatter/gather data input. You generally pass in an array of #GInputVectors and the operation will store the read data starting ... |
| IOExtension |  | 0 | 0 | 4 | #GIOExtension is an opaque data structure and can only be accessed using the following functions. |
| IOExtensionPoint |  | 0 | 0 | 7 | `GIOExtensionPoint` provides a mechanism for modules to extend the functionality of the library or application that loaded it in an organized fashi... |
| IOModuleClass |  | 0 | 0 | 0 |  |
| IOModuleScope |  | 0 | 0 | 3 | Represents a scope for loading IO modules. A scope can be used for blocking duplicate modules, or blocking a module you don't want to load. The sco... |
| IOSchedulerJob |  | 0 | 0 | 2 | Opaque class for defining and scheduling IO jobs. |
| IOStreamAdapter |  | 0 | 0 | 0 |  |
| IOStreamClass |  | 0 | 0 | 0 | a #GInputStream, owned by the #GIOStream. Do not free. |
| IOStreamPrivate |  | 0 | 0 | 0 |  |
| ListModelInterface |  | 0 | 0 | 0 | The virtual function table for #GListModel. |
| ListStoreClass |  | 0 | 0 | 0 |  |
| LoadableIconIface |  | 0 | 0 | 0 | Interface for icons that can be loaded as a stream. |
| MemoryInputStreamClass |  | 0 | 0 | 0 |  |
| MemoryInputStreamPrivate |  | 0 | 0 | 0 |  |
| MemoryMonitorInterface |  | 0 | 0 | 0 | The virtual function table for #GMemoryMonitor. |
| MemoryOutputStreamClass |  | 0 | 0 | 0 |  |
| MemoryOutputStreamPrivate |  | 0 | 0 | 0 |  |
| MenuAttributeIterClass |  | 0 | 0 | 0 | %TRUE on success, or %FALSE if there is no additional attribute |
| MenuAttributeIterPrivate |  | 0 | 0 | 0 |  |
| MenuLinkIterClass |  | 0 | 0 | 0 | %TRUE on success, or %FALSE if there is no additional link |
| MenuLinkIterPrivate |  | 0 | 0 | 0 |  |
| MenuModelClass |  | 0 | 0 | 0 | %TRUE if the model is mutable (ie: "items-changed" may be emitted). |
| MenuModelPrivate |  | 0 | 0 | 0 |  |
| MountIface |  | 0 | 0 | 0 | Interface for implementing operations for mounts. |
| MountOperationClass |  | 0 | 0 | 0 | a #GMountOperation |
| MountOperationPrivate |  | 0 | 0 | 0 |  |
| NativeSocketAddressClass |  | 0 | 0 | 0 |  |
| NativeSocketAddressPrivate |  | 0 | 0 | 0 |  |
| NativeVolumeMonitorClass |  | 0 | 0 | 0 |  |
| NetworkAddressClass |  | 0 | 0 | 0 |  |
| NetworkAddressPrivate |  | 0 | 0 | 0 |  |
| NetworkMonitorInterface |  | 0 | 0 | 0 | The virtual function table for #GNetworkMonitor. |
| NetworkServiceClass |  | 0 | 0 | 0 |  |
| NetworkServicePrivate |  | 0 | 0 | 0 |  |
| OutputMessage |  | 0 | 0 | 0 | Structure used for scatter/gather data output when sending multiple messages or packets in one go. You generally pass in an array of #GOutputVector... |
| OutputStreamClass |  | 0 | 0 | 0 | Number of bytes written, or -1 on error |
| OutputStreamPrivate |  | 0 | 0 | 0 |  |
| OutputVector |  | 0 | 0 | 0 | Structure used for scatter/gather data output. You generally pass in an array of #GOutputVectors and the operation will use all the buffers as if t... |
| PermissionClass |  | 0 | 0 | 0 | %TRUE if the permission was successfully acquired |
| PermissionPrivate |  | 0 | 0 | 0 |  |
| PollableInputStreamInterface |  | 0 | 0 | 0 | The interface for pollable input streams. The default implementation of @can_poll always returns %TRUE. The default implementation of @read_nonbloc... |
| PollableOutputStreamInterface |  | 0 | 0 | 0 | The interface for pollable output streams. The default implementation of @can_poll always returns %TRUE. The default implementation of @write_nonbl... |
| PowerProfileMonitorInterface |  | 0 | 0 | 0 | The virtual function table for #GPowerProfileMonitor. |
| ProxyAddressClass |  | 0 | 0 | 0 | Class structure for #GProxyAddress. |
| ProxyAddressEnumeratorClass |  | 0 | 0 | 0 | Class structure for #GProxyAddressEnumerator. |
| ProxyAddressEnumeratorPrivate |  | 0 | 0 | 0 |  |
| ProxyAddressPrivate |  | 0 | 0 | 0 |  |
| ProxyInterface |  | 0 | 0 | 0 | Provides an interface for handling proxy connection and payload. |
| ProxyResolverInterface |  | 0 | 0 | 0 | The virtual function table for #GProxyResolver. |
| RemoteActionGroupInterface |  | 0 | 0 | 0 | The virtual function table for #GRemoteActionGroup. |
| ResolverClass |  | 0 | 0 | 0 | a non-empty #GList of #GInetAddress, or %NULL on error. You must unref each of the addresses and free the list when you are done with it. (You can ... |
| ResolverPrivate |  | 0 | 0 | 0 |  |
| Resource |  | 0 | 0 | 10 | Applications and libraries often contain binary or textual data that is really part of the application, rather than user data. For instance `GtkBui... |
| SeekableIface |  | 0 | 0 | 0 | Provides an interface for implementing seekable functionality on I/O Streams. |
| SettingsBackendClass |  | 0 | 0 | 0 | Class structure for #GSettingsBackend. |
| SettingsBackendPrivate |  | 0 | 0 | 0 |  |
| SettingsClass |  | 0 | 0 | 0 |  |
| SettingsPrivate |  | 0 | 0 | 0 |  |
| SettingsSchema |  | 0 | 0 | 8 | The [struct@Gio.SettingsSchemaSource] and `GSettingsSchema` APIs provide a mechanism for advanced control over the loading of schemas and a mechani... |
| SettingsSchemaKey |  | 0 | 0 | 9 | #GSettingsSchemaKey is an opaque data structure and can only be accessed using the following functions. |
| SettingsSchemaSource |  | 0 | 0 | 6 | This is an opaque structure type. You may not access it directly. |
| SimpleActionGroupClass |  | 0 | 0 | 0 |  |
| SimpleActionGroupPrivate |  | 0 | 0 | 0 |  |
| SimpleAsyncResultClass |  | 0 | 0 | 0 |  |
| SimpleProxyResolverClass |  | 0 | 0 | 0 |  |
| SimpleProxyResolverPrivate |  | 0 | 0 | 0 |  |
| SocketAddressClass |  | 0 | 0 | 0 | the socket family type of @address |
| SocketAddressEnumeratorClass |  | 0 | 0 | 0 | Class structure for #GSocketAddressEnumerator. |
| SocketClass |  | 0 | 0 | 0 |  |
| SocketClientClass |  | 0 | 0 | 0 |  |
| SocketClientPrivate |  | 0 | 0 | 0 |  |
| SocketConnectableIface |  | 0 | 0 | 0 | Provides an interface for returning a #GSocketAddressEnumerator and #GProxyAddressEnumerator |
| SocketConnectionClass |  | 0 | 0 | 0 |  |
| SocketConnectionPrivate |  | 0 | 0 | 0 |  |
| SocketControlMessageClass |  | 0 | 0 | 0 | Class structure for #GSocketControlMessage. |
| SocketControlMessagePrivate |  | 0 | 0 | 0 |  |
| SocketListenerClass |  | 0 | 0 | 0 | Class structure for #GSocketListener. |
| SocketListenerPrivate |  | 0 | 0 | 0 |  |
| SocketPrivate |  | 0 | 0 | 0 |  |
| SocketServiceClass |  | 0 | 0 | 0 | Class structure for #GSocketService. |
| SocketServicePrivate |  | 0 | 0 | 0 |  |
| SrvTarget |  | 0 | 0 | 8 | A single target host/port that a network service is running on. SRV (service) records are used by some network protocols to provide service-specifi... |
| StaticResource |  | 0 | 0 | 3 | #GStaticResource is an opaque data structure and can only be accessed using the following functions. |
| TaskClass |  | 0 | 0 | 0 |  |
| TcpConnectionClass |  | 0 | 0 | 0 |  |
| TcpConnectionPrivate |  | 0 | 0 | 0 |  |
| TcpWrapperConnectionClass |  | 0 | 0 | 0 |  |
| TcpWrapperConnectionPrivate |  | 0 | 0 | 0 |  |
| ThemedIconClass |  | 0 | 0 | 0 |  |
| ThreadedResolverClass |  | 0 | 0 | 0 |  |
| ThreadedSocketServiceClass |  | 0 | 0 | 0 |  |
| ThreadedSocketServicePrivate |  | 0 | 0 | 0 |  |
| TlsBackendInterface |  | 0 | 0 | 0 | Provides an interface for describing TLS-related types. |
| TlsCertificateClass |  | 0 | 0 | 0 | the appropriate #GTlsCertificateFlags |
| TlsCertificatePrivate |  | 0 | 0 | 0 |  |
| TlsClientConnectionInterface |  | 0 | 0 | 0 | vtable for a #GTlsClientConnection implementation. |
| TlsConnectionClass |  | 0 | 0 | 0 | The class structure for the #GTlsConnection type. |
| TlsConnectionPrivate |  | 0 | 0 | 0 |  |
| TlsDatabaseClass |  | 0 | 0 | 0 | The class for #GTlsDatabase. Derived classes should implement the various virtual methods. _async and _finish methods have a default implementation... |
| TlsDatabasePrivate |  | 0 | 0 | 0 |  |
| TlsFileDatabaseInterface |  | 0 | 0 | 0 | Provides an interface for #GTlsFileDatabase implementations. |
| TlsInteractionClass |  | 0 | 0 | 0 | The class for #GTlsInteraction. Derived classes implement the various virtual interaction methods to handle TLS interactions. Derived classes can c... |
| TlsInteractionPrivate |  | 0 | 0 | 0 |  |
| TlsPasswordClass |  | 0 | 0 | 0 | Class structure for #GTlsPassword. |
| TlsPasswordPrivate |  | 0 | 0 | 0 |  |
| TlsServerConnectionInterface |  | 0 | 0 | 0 | vtable for a #GTlsServerConnection implementation. |
| UnixConnectionClass |  | 0 | 0 | 0 |  |
| UnixConnectionPrivate |  | 0 | 0 | 0 |  |
| UnixCredentialsMessageClass |  | 0 | 0 | 0 | Class structure for #GUnixCredentialsMessage. |
| UnixCredentialsMessagePrivate |  | 0 | 0 | 0 |  |
| UnixFDListClass |  | 0 | 0 | 0 |  |
| UnixFDListPrivate |  | 0 | 0 | 0 |  |
| UnixFDMessageClass |  | 0 | 0 | 0 |  |
| UnixFDMessagePrivate |  | 0 | 0 | 0 |  |
| UnixInputStreamClass |  | 0 | 0 | 0 |  |
| UnixInputStreamPrivate |  | 0 | 0 | 0 |  |
| UnixMountEntry |  | 0 | 0 | 0 | Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>). This corresponds roughly to a mtab entry. |
| UnixMountMonitorClass |  | 0 | 0 | 0 |  |
| UnixMountPoint |  | 0 | 0 | 15 | Defines a Unix mount point (e.g. <filename>/dev</filename>). This corresponds roughly to a fstab entry. |
| UnixOutputStreamClass |  | 0 | 0 | 0 |  |
| UnixOutputStreamPrivate |  | 0 | 0 | 0 |  |
| UnixSocketAddressClass |  | 0 | 0 | 0 |  |
| UnixSocketAddressPrivate |  | 0 | 0 | 0 |  |
| VfsClass |  | 0 | 0 | 0 | %TRUE if construction of the @vfs was successful and it is now active. |
| VolumeIface |  | 0 | 0 | 0 | Interface for implementing operations for mountable volumes. |
| VolumeMonitorClass |  | 0 | 0 | 0 | a #GList of connected #GDrive objects. |
| ZlibCompressorClass |  | 0 | 0 | 0 |  |
| ZlibDecompressorClass |  | 0 | 0 | 0 |  |

### Gio.ActionEntry

C type: `GActionEntry`

This struct defines a single action. It is for use with g_action_map_add_action_entries(). The order of the items in the structure are intended to ...

#### Fields

| Field | Type |
| --- | --- |
| activate | none |
| change_state | none |
| name | utf8 |
| padding | gsize |
| parameter_type | utf8 |
| state | utf8 |

### Gio.ActionGroupInterface

C type: `GActionGroupInterface`

The virtual function table for #GActionGroup.

#### Fields

| Field | Type |
| --- | --- |
| action_added | none |
| action_enabled_changed | none |
| action_removed | none |
| action_state_changed | none |
| activate_action | none |
| change_action_state | none |
| g_iface | GObject.TypeInterface |
| get_action_enabled | gboolean |
| get_action_parameter_type | GLib.VariantType |
| get_action_state | GLib.Variant |
| get_action_state_hint | GLib.Variant |
| get_action_state_type | GLib.VariantType |
| has_action | gboolean |
| list_actions | utf8 |
| query_action | gboolean |

### Gio.ActionInterface

C type: `GActionInterface`

The virtual function table for #GAction.

#### Fields

| Field | Type |
| --- | --- |
| activate | none |
| change_state | none |
| g_iface | GObject.TypeInterface |
| get_enabled | gboolean |
| get_name | utf8 |
| get_parameter_type | GLib.VariantType |
| get_state | GLib.Variant |
| get_state_hint | GLib.Variant |
| get_state_type | GLib.VariantType |

### Gio.ActionMapInterface

C type: `GActionMapInterface`

The virtual function table for #GActionMap.

#### Fields

| Field | Type |
| --- | --- |
| add_action | none |
| g_iface | GObject.TypeInterface |
| lookup_action | Action |
| remove_action | none |

### Gio.AppInfoIface

C type: `GAppInfoIface`

Application Information interface, for operating system portability.

#### Fields

| Field | Type |
| --- | --- |
| add_supports_type | gboolean |
| can_delete | gboolean |
| can_remove_supports_type | gboolean |
| do_delete | gboolean |
| dup | AppInfo |
| equal | gboolean |
| g_iface | GObject.TypeInterface |
| get_commandline | filename |
| get_description | utf8 |
| get_display_name | utf8 |
| get_executable | filename |
| get_icon | Icon |
| get_id | utf8 |
| get_name | utf8 |
| get_supported_types | utf8 |
| launch | gboolean |
| launch_uris | gboolean |
| launch_uris_async | none |
| launch_uris_finish | gboolean |
| remove_supports_type | gboolean |
| set_as_default_for_extension | gboolean |
| set_as_default_for_type | gboolean |
| set_as_last_used_for_type | gboolean |
| should_show | gboolean |
| supports_files | gboolean |
| supports_uris | gboolean |

### Gio.AppLaunchContextClass

C type: `GAppLaunchContextClass`

a display string for the display.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| get_display | utf8 |
| get_startup_notify_id | utf8 |
| launch_failed | none |
| launch_started | none |
| launched | none |
| parent_class | GObject.ObjectClass |

### Gio.AppLaunchContextPrivate

C type: `GAppLaunchContextPrivate`

### Gio.ApplicationClass

C type: `GApplicationClass`

Virtual function table for #GApplication.

#### Fields

| Field | Type |
| --- | --- |
| activate | none |
| add_platform_data | none |
| after_emit | none |
| before_emit | none |
| command_line | gint |
| dbus_register | gboolean |
| dbus_unregister | none |
| handle_local_options | gint |
| local_command_line | gboolean |
| name_lost | gboolean |
| open | none |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| quit_mainloop | none |
| run_mainloop | none |
| shutdown | none |
| startup | none |

### Gio.ApplicationCommandLineClass

C type: `GApplicationCommandLineClass`

The #GApplicationCommandLineClass-struct contains private data only.

#### Fields

| Field | Type |
| --- | --- |
| done | none |
| get_stdin | InputStream |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| print_literal | none |
| printerr_literal | none |

### Gio.ApplicationCommandLinePrivate

C type: `GApplicationCommandLinePrivate`

### Gio.ApplicationPrivate

C type: `GApplicationPrivate`

### Gio.AsyncInitableIface

C type: `GAsyncInitableIface`

Provides an interface for asynchronous initializing object such that initialization may fail.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| init_async | none |
| init_finish | gboolean |

### Gio.AsyncResultIface

C type: `GAsyncResultIface`

Interface definition for #GAsyncResult.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_source_object | GObject.Object |
| get_user_data | gpointer |
| is_tagged | gboolean |

### Gio.BufferedInputStreamClass

C type: `GBufferedInputStreamClass`

the number of bytes read into @stream's buffer, up to @count, or -1 on error.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| fill | gssize |
| fill_async | none |
| fill_finish | gssize |
| parent_class | FilterInputStreamClass |

### Gio.BufferedInputStreamPrivate

C type: `GBufferedInputStreamPrivate`

### Gio.BufferedOutputStreamClass

C type: `GBufferedOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| parent_class | FilterOutputStreamClass |

### Gio.BufferedOutputStreamPrivate

C type: `GBufferedOutputStreamPrivate`

### Gio.CancellableClass

C type: `GCancellableClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| cancelled | none |
| parent_class | GObject.ObjectClass |

### Gio.CancellablePrivate

C type: `GCancellablePrivate`

### Gio.CharsetConverterClass

C type: `GCharsetConverterClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.ConverterIface

C type: `GConverterIface`

Provides an interface for converting data from one type to another type. The conversion can be stateful and may fail at any place.

#### Fields

| Field | Type |
| --- | --- |
| convert | ConverterResult |
| g_iface | GObject.TypeInterface |
| reset | none |

### Gio.ConverterInputStreamClass

C type: `GConverterInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | FilterInputStreamClass |

### Gio.ConverterInputStreamPrivate

C type: `GConverterInputStreamPrivate`

### Gio.ConverterOutputStreamClass

C type: `GConverterOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | FilterOutputStreamClass |

### Gio.ConverterOutputStreamPrivate

C type: `GConverterOutputStreamPrivate`

### Gio.CredentialsClass

C type: `GCredentialsClass`

Class structure for #GCredentials.

### Gio.DatagramBasedInterface

C type: `GDatagramBasedInterface`

Provides an interface for socket-like objects which have datagram semantics, following the Berkeley sockets API. The interface methods are thin wra...

#### Fields

| Field | Type |
| --- | --- |
| condition_check | GLib.IOCondition |
| condition_wait | gboolean |
| create_source | GLib.Source |
| g_iface | GObject.TypeInterface |
| receive_messages | gint |
| send_messages | gint |

### Gio.DataInputStreamClass

C type: `GDataInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | BufferedInputStreamClass |

### Gio.DataInputStreamPrivate

C type: `GDataInputStreamPrivate`

### Gio.DataOutputStreamClass

C type: `GDataOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | FilterOutputStreamClass |

### Gio.DataOutputStreamPrivate

C type: `GDataOutputStreamPrivate`

### Gio.DBusAnnotationInfo

GType: `GDBusAnnotationInfo` ?? C type: `GDBusAnnotationInfo`

Information about an annotation.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| key | utf8 |
| ref_count | gint |
| value | utf8 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup | `lookup(annotations: DBusAnnotationInfo?, name: utf8) -> utf8` | g_dbus_annotation_info_lookup | 2.26 | Looks up the value of an annotation. The cost of this function is O(n) in number of annotations. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `DBusAnnotationInfo.ref() -> DBusAnnotationInfo` | g_dbus_annotation_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusAnnotationInfo.unref() -> none` | g_dbus_annotation_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusArgInfo

GType: `GDBusArgInfo` ?? C type: `GDBusArgInfo`

Information about an argument for a method or a signal.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| name | utf8 |
| ref_count | gint |
| signature | utf8 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `DBusArgInfo.ref() -> DBusArgInfo` | g_dbus_arg_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusArgInfo.unref() -> none` | g_dbus_arg_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusErrorEntry

C type: `GDBusErrorEntry`

Struct used in g_dbus_error_register_error_domain().

#### Fields

| Field | Type |
| --- | --- |
| dbus_error_name | utf8 |
| error_code | gint |

### Gio.DBusInterfaceIface

C type: `GDBusInterfaceIface`

Base type for D-Bus interfaces.

#### Fields

| Field | Type |
| --- | --- |
| dup_object | DBusObject |
| get_info | DBusInterfaceInfo |
| get_object | DBusObject |
| parent_iface | GObject.TypeInterface |
| set_object | none |

### Gio.DBusInterfaceInfo

GType: `GDBusInterfaceInfo` ?? C type: `GDBusInterfaceInfo`

Information about a D-Bus interface.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| methods | DBusMethodInfo |
| name | utf8 |
| properties | DBusPropertyInfo |
| ref_count | gint |
| signals | DBusSignalInfo |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cache_build | `DBusInterfaceInfo.cache_build() -> none` | g_dbus_interface_info_cache_build | 2.30 | Builds a lookup-cache to speed up g_dbus_interface_info_lookup_method(), g_dbus_interface_info_lookup_signal() and g_dbus_interface_info_lookup_pro... |
| cache_release | `DBusInterfaceInfo.cache_release() -> none` | g_dbus_interface_info_cache_release | 2.30 | Decrements the usage count for the cache for @info built by g_dbus_interface_info_cache_build() (if any) and frees the resources used by the cache ... |
| generate_xml | `DBusInterfaceInfo.generate_xml(indent: guint, string_builder: GLib.String) -> none` | g_dbus_interface_info_generate_xml | 2.26 | Appends an XML representation of @info (and its children) to @string_builder. This function is typically used for generating introspection XML docu... |
| lookup_method | `DBusInterfaceInfo.lookup_method(name: utf8) -> DBusMethodInfo` | g_dbus_interface_info_lookup_method | 2.26 | Looks up information about a method. The cost of this function is O(n) in number of methods unless g_dbus_interface_info_cache_build() has been use... |
| lookup_property | `DBusInterfaceInfo.lookup_property(name: utf8) -> DBusPropertyInfo` | g_dbus_interface_info_lookup_property | 2.26 | Looks up information about a property. The cost of this function is O(n) in number of properties unless g_dbus_interface_info_cache_build() has bee... |
| lookup_signal | `DBusInterfaceInfo.lookup_signal(name: utf8) -> DBusSignalInfo` | g_dbus_interface_info_lookup_signal | 2.26 | Looks up information about a signal. The cost of this function is O(n) in number of signals unless g_dbus_interface_info_cache_build() has been use... |
| ref | `DBusInterfaceInfo.ref() -> DBusInterfaceInfo` | g_dbus_interface_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusInterfaceInfo.unref() -> none` | g_dbus_interface_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusInterfaceSkeletonClass

C type: `GDBusInterfaceSkeletonClass`

Class structure for #GDBusInterfaceSkeleton.

#### Fields

| Field | Type |
| --- | --- |
| flush | none |
| g_authorize_method | gboolean |
| get_info | DBusInterfaceInfo |
| get_properties | GLib.Variant |
| get_vtable | DBusInterfaceVTable |
| parent_class | GObject.ObjectClass |
| signal_padding | gpointer |
| vfunc_padding | gpointer |

### Gio.DBusInterfaceSkeletonPrivate

C type: `GDBusInterfaceSkeletonPrivate`

### Gio.DBusInterfaceVTable

C type: `GDBusInterfaceVTable`

Virtual table for handling properties and method calls for a D-Bus interface. Since 2.38, if you want to handle getting/setting D-Bus properties as...

#### Fields

| Field | Type |
| --- | --- |
| get_property | DBusInterfaceGetPropertyFunc |
| method_call | DBusInterfaceMethodCallFunc |
| padding | gpointer |
| set_property | DBusInterfaceSetPropertyFunc |

### Gio.DBusMethodInfo

GType: `GDBusMethodInfo` ?? C type: `GDBusMethodInfo`

Information about a method on an D-Bus interface.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| in_args | DBusArgInfo |
| name | utf8 |
| out_args | DBusArgInfo |
| ref_count | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `DBusMethodInfo.ref() -> DBusMethodInfo` | g_dbus_method_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusMethodInfo.unref() -> none` | g_dbus_method_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusNodeInfo

GType: `GDBusNodeInfo` ?? C type: `GDBusNodeInfo`

Information about nodes in a remote object hierarchy.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| interfaces | DBusInterfaceInfo |
| nodes | DBusNodeInfo |
| path | utf8 |
| ref_count | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_for_xml | `DBusNodeInfo.new_for_xml(xml_data: utf8) -> DBusNodeInfo throws` | g_dbus_node_info_new_for_xml | 2.26 | Parses @xml_data and returns a #GDBusNodeInfo representing the data. The introspection XML must contain exactly one top-level <node> element. Note ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| generate_xml | `DBusNodeInfo.generate_xml(indent: guint, string_builder: GLib.String) -> none` | g_dbus_node_info_generate_xml | 2.26 | Appends an XML representation of @info (and its children) to @string_builder. This function is typically used for generating introspection XML docu... |
| lookup_interface | `DBusNodeInfo.lookup_interface(name: utf8) -> DBusInterfaceInfo` | g_dbus_node_info_lookup_interface | 2.26 | Looks up information about an interface. The cost of this function is O(n) in number of interfaces. |
| ref | `DBusNodeInfo.ref() -> DBusNodeInfo` | g_dbus_node_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusNodeInfo.unref() -> none` | g_dbus_node_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusObjectIface

C type: `GDBusObjectIface`

Base object type for D-Bus objects.

#### Fields

| Field | Type |
| --- | --- |
| get_interface | DBusInterface |
| get_interfaces | GLib.List |
| get_object_path | utf8 |
| interface_added | none |
| interface_removed | none |
| parent_iface | GObject.TypeInterface |

### Gio.DBusObjectManagerClientClass

C type: `GDBusObjectManagerClientClass`

Class structure for #GDBusObjectManagerClient.

#### Fields

| Field | Type |
| --- | --- |
| interface_proxy_properties_changed | none |
| interface_proxy_signal | none |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.DBusObjectManagerClientPrivate

C type: `GDBusObjectManagerClientPrivate`

### Gio.DBusObjectManagerIface

C type: `GDBusObjectManagerIface`

Base type for D-Bus object managers.

#### Fields

| Field | Type |
| --- | --- |
| get_interface | DBusInterface |
| get_object | DBusObject |
| get_object_path | utf8 |
| get_objects | GLib.List |
| interface_added | none |
| interface_removed | none |
| object_added | none |
| object_removed | none |
| parent_iface | GObject.TypeInterface |

### Gio.DBusObjectManagerServerClass

C type: `GDBusObjectManagerServerClass`

Class structure for #GDBusObjectManagerServer.

#### Fields

| Field | Type |
| --- | --- |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.DBusObjectManagerServerPrivate

C type: `GDBusObjectManagerServerPrivate`

### Gio.DBusObjectProxyClass

C type: `GDBusObjectProxyClass`

Class structure for #GDBusObjectProxy.

#### Fields

| Field | Type |
| --- | --- |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.DBusObjectProxyPrivate

C type: `GDBusObjectProxyPrivate`

### Gio.DBusObjectSkeletonClass

C type: `GDBusObjectSkeletonClass`

Class structure for #GDBusObjectSkeleton.

#### Fields

| Field | Type |
| --- | --- |
| authorize_method | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.DBusObjectSkeletonPrivate

C type: `GDBusObjectSkeletonPrivate`

### Gio.DBusPropertyInfo

GType: `GDBusPropertyInfo` ?? C type: `GDBusPropertyInfo`

Information about a D-Bus property on a D-Bus interface.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| flags | DBusPropertyInfoFlags |
| name | utf8 |
| ref_count | gint |
| signature | utf8 |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `DBusPropertyInfo.ref() -> DBusPropertyInfo` | g_dbus_property_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusPropertyInfo.unref() -> none` | g_dbus_property_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusProxyClass

C type: `GDBusProxyClass`

Class structure for #GDBusProxy.

#### Fields

| Field | Type |
| --- | --- |
| g_properties_changed | none |
| g_signal | none |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.DBusProxyPrivate

C type: `GDBusProxyPrivate`

### Gio.DBusSignalInfo

GType: `GDBusSignalInfo` ?? C type: `GDBusSignalInfo`

Information about a signal on a D-Bus interface.

#### Fields

| Field | Type |
| --- | --- |
| annotations | DBusAnnotationInfo |
| args | DBusArgInfo |
| name | utf8 |
| ref_count | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `DBusSignalInfo.ref() -> DBusSignalInfo` | g_dbus_signal_info_ref | 2.26 | If @info is statically allocated does nothing. Otherwise increases the reference count. |
| unref | `DBusSignalInfo.unref() -> none` | g_dbus_signal_info_unref | 2.26 | If @info is statically allocated, does nothing. Otherwise decreases the reference count of @info. When its reference count drops to 0, the memory u... |

### Gio.DBusSubtreeVTable

C type: `GDBusSubtreeVTable`

Virtual table for handling subtrees registered with g_dbus_connection_register_subtree().

#### Fields

| Field | Type |
| --- | --- |
| dispatch | DBusSubtreeDispatchFunc |
| enumerate | DBusSubtreeEnumerateFunc |
| introspect | DBusSubtreeIntrospectFunc |
| padding | gpointer |

### Gio.DebugControllerDBusClass

C type: `GDebugControllerDBusClass`

The virtual function table for #GDebugControllerDBus.

#### Fields

| Field | Type |
| --- | --- |
| authorize | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.DebugControllerInterface

C type: `GDebugControllerInterface`

The virtual function table for #GDebugController.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gio.DesktopAppInfoClass

C type: `GDesktopAppInfoClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.DesktopAppInfoLookupIface

C type: `GDesktopAppInfoLookupIface`

Interface that is used by backends to associate default handlers with URI schemes.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_default_for_uri_scheme | AppInfo |

### Gio.DriveIface

C type: `GDriveIface`

Interface for creating #GDrive implementations.

#### Fields

| Field | Type |
| --- | --- |
| can_eject | gboolean |
| can_poll_for_media | gboolean |
| can_start | gboolean |
| can_start_degraded | gboolean |
| can_stop | gboolean |
| changed | none |
| disconnected | none |
| eject | none |
| eject_button | none |
| eject_finish | gboolean |
| eject_with_operation | none |
| eject_with_operation_finish | gboolean |
| enumerate_identifiers | utf8 |
| g_iface | GObject.TypeInterface |
| get_icon | Icon |
| get_identifier | utf8 |
| get_name | utf8 |
| get_sort_key | utf8 |
| get_start_stop_type | DriveStartStopType |
| get_symbolic_icon | Icon |
| get_volumes | GLib.List |
| has_media | gboolean |
| has_volumes | gboolean |
| is_media_check_automatic | gboolean |
| is_media_removable | gboolean |
| is_removable | gboolean |
| poll_for_media | none |
| poll_for_media_finish | gboolean |
| start | none |
| start_finish | gboolean |
| stop | none |
| stop_button | none |
| stop_finish | gboolean |

### Gio.DtlsClientConnectionInterface

C type: `GDtlsClientConnectionInterface`

vtable for a #GDtlsClientConnection implementation.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gio.DtlsConnectionInterface

C type: `GDtlsConnectionInterface`

Virtual method table for a #GDtlsConnection implementation.

#### Fields

| Field | Type |
| --- | --- |
| accept_certificate | gboolean |
| g_iface | GObject.TypeInterface |
| get_binding_data | gboolean |
| get_negotiated_protocol | utf8 |
| handshake | gboolean |
| handshake_async | none |
| handshake_finish | gboolean |
| set_advertised_protocols | none |
| shutdown | gboolean |
| shutdown_async | none |
| shutdown_finish | gboolean |

### Gio.DtlsServerConnectionInterface

C type: `GDtlsServerConnectionInterface`

vtable for a #GDtlsServerConnection implementation.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gio.EmblemClass

C type: `GEmblemClass`

### Gio.EmblemedIconClass

C type: `GEmblemedIconClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.EmblemedIconPrivate

C type: `GEmblemedIconPrivate`

### Gio.FileAttributeInfo

C type: `GFileAttributeInfo`

Information about a specific attribute.

#### Fields

| Field | Type |
| --- | --- |
| flags | FileAttributeInfoFlags |
| name | utf8 |
| type | FileAttributeType |

### Gio.FileAttributeInfoList

GType: `GFileAttributeInfoList` ?? C type: `GFileAttributeInfoList`

Acts as a lightweight registry for possible valid file attributes. The registry stores Key-Value pair formats as #GFileAttributeInfos.

#### Fields

| Field | Type |
| --- | --- |
| infos | FileAttributeInfo |
| n_infos | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FileAttributeInfoList.new() -> FileAttributeInfoList` | g_file_attribute_info_list_new |  | Creates a new file attribute info list. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `FileAttributeInfoList.add(name: utf8, type: FileAttributeType, flags: FileAttributeInfoFlags) -> none` | g_file_attribute_info_list_add |  | Adds a new attribute with @name to the @list, setting its @type and @flags. |
| dup | `FileAttributeInfoList.dup() -> FileAttributeInfoList` | g_file_attribute_info_list_dup |  | Makes a duplicate of a file attribute info list. |
| lookup | `FileAttributeInfoList.lookup(name: utf8) -> FileAttributeInfo` | g_file_attribute_info_list_lookup |  | Gets the file attribute with the name @name from @list. |
| ref | `FileAttributeInfoList.ref() -> FileAttributeInfoList` | g_file_attribute_info_list_ref |  | References a file attribute info list. |
| unref | `FileAttributeInfoList.unref() -> none` | g_file_attribute_info_list_unref |  | Removes a reference from the given @list. If the reference count falls to zero, the @list is deleted. |

### Gio.FileAttributeMatcher

GType: `GFileAttributeMatcher` ?? C type: `GFileAttributeMatcher`

Determines if a string matches a file attribute.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `FileAttributeMatcher.new(attributes: utf8) -> FileAttributeMatcher` | g_file_attribute_matcher_new |  | Creates a new file attribute matcher, which matches attributes against a given string. #GFileAttributeMatchers are reference counted structures, an... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| enumerate_namespace | `FileAttributeMatcher.enumerate_namespace(ns: utf8) -> gboolean` | g_file_attribute_matcher_enumerate_namespace |  | Checks if the matcher will match all of the keys in a given namespace. This will always return %TRUE if a wildcard character is in use (e.g. if mat... |
| enumerate_next | `FileAttributeMatcher.enumerate_next() -> utf8` | g_file_attribute_matcher_enumerate_next |  | Gets the next matched attribute from a #GFileAttributeMatcher. |
| matches | `FileAttributeMatcher.matches(attribute: utf8) -> gboolean` | g_file_attribute_matcher_matches |  | Checks if an attribute will be matched by an attribute matcher. If the matcher was created with the "*" matching string, this function will always ... |
| matches_only | `FileAttributeMatcher.matches_only(attribute: utf8) -> gboolean` | g_file_attribute_matcher_matches_only |  | Checks if an attribute matcher only matches a given attribute. Always returns %FALSE if "*" was used when creating the matcher. |
| ref | `FileAttributeMatcher.ref() -> FileAttributeMatcher` | g_file_attribute_matcher_ref |  | References a file attribute matcher. |
| subtract | `FileAttributeMatcher.subtract(subtract: FileAttributeMatcher?) -> FileAttributeMatcher` | g_file_attribute_matcher_subtract |  | Subtracts all attributes of @subtract from @matcher and returns a matcher that supports those attributes. Note that currently it is not possible to... |
| to_string | `FileAttributeMatcher.to_string() -> utf8` | g_file_attribute_matcher_to_string | 2.32 | Prints what the matcher is matching against. The format will be equal to the format passed to g_file_attribute_matcher_new(). The output however, m... |
| unref | `FileAttributeMatcher.unref() -> none` | g_file_attribute_matcher_unref |  | Unreferences @matcher. If the reference count falls below 1, the @matcher is automatically freed. |

### Gio.FileDescriptorBasedIface

C type: `GFileDescriptorBasedIface`

An interface for file descriptor based io objects.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_fd | gint |

### Gio.FileEnumeratorClass

C type: `GFileEnumeratorClass`

A #GFileInfo or %NULL on error or end of enumerator. Free the returned object with g_object_unref() when no longer needed.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| _g_reserved7 | none |
| close_async | none |
| close_finish | gboolean |
| close_fn | gboolean |
| next_file | FileInfo |
| next_files_async | none |
| next_files_finish | GLib.List |
| parent_class | GObject.ObjectClass |

### Gio.FileEnumeratorPrivate

C type: `GFileEnumeratorPrivate`

### Gio.FileIconClass

C type: `GFileIconClass`

### Gio.FileIface

C type: `GFileIface`

An interface for writing VFS file handles.

#### Fields

| Field | Type |
| --- | --- |
| _query_settable_attributes_async | none |
| _query_settable_attributes_finish | none |
| _query_writable_namespaces_async | none |
| _query_writable_namespaces_finish | none |
| append_to | FileOutputStream |
| append_to_async | none |
| append_to_finish | FileOutputStream |
| copy | gboolean |
| copy_async | none |
| copy_finish | gboolean |
| create | FileOutputStream |
| create_async | none |
| create_finish | FileOutputStream |
| create_readwrite | FileIOStream |
| create_readwrite_async | none |
| create_readwrite_finish | FileIOStream |
| delete_file | gboolean |
| delete_file_async | none |
| delete_file_finish | gboolean |
| dup | File |
| eject_mountable | none |
| eject_mountable_finish | gboolean |
| eject_mountable_with_operation | none |
| eject_mountable_with_operation_finish | gboolean |
| enumerate_children | FileEnumerator |
| enumerate_children_async | none |
| enumerate_children_finish | FileEnumerator |
| equal | gboolean |
| find_enclosing_mount | Mount |
| find_enclosing_mount_async | none |
| find_enclosing_mount_finish | Mount |
| g_iface | GObject.TypeInterface |
| get_basename | filename |
| get_child_for_display_name | File |
| get_parent | File |
| get_parse_name | utf8 |
| get_path | filename |
| get_relative_path | filename |
| get_uri | utf8 |
| get_uri_scheme | utf8 |
| has_uri_scheme | gboolean |
| hash | guint |
| is_native | gboolean |
| make_directory | gboolean |
| make_directory_async | none |
| make_directory_finish | gboolean |
| make_symbolic_link | gboolean |
| make_symbolic_link_async | none |
| make_symbolic_link_finish | gboolean |
| measure_disk_usage | gboolean |
| measure_disk_usage_async | none |
| measure_disk_usage_finish | gboolean |
| monitor_dir | FileMonitor |
| monitor_file | FileMonitor |
| mount_enclosing_volume | none |
| mount_enclosing_volume_finish | gboolean |
| mount_mountable | none |
| mount_mountable_finish | File |
| move | gboolean |
| move_async | none |
| move_finish | gboolean |
| open_readwrite | FileIOStream |
| open_readwrite_async | none |
| open_readwrite_finish | FileIOStream |
| poll_mountable | none |
| poll_mountable_finish | gboolean |
| prefix_matches | gboolean |
| query_filesystem_info | FileInfo |
| query_filesystem_info_async | none |
| query_filesystem_info_finish | FileInfo |
| query_info | FileInfo |
| query_info_async | none |
| query_info_finish | FileInfo |
| query_settable_attributes | FileAttributeInfoList |
| query_writable_namespaces | FileAttributeInfoList |
| read_async | none |
| read_finish | FileInputStream |
| read_fn | FileInputStream |
| replace | FileOutputStream |
| replace_async | none |
| replace_finish | FileOutputStream |
| replace_readwrite | FileIOStream |
| replace_readwrite_async | none |
| replace_readwrite_finish | FileIOStream |
| resolve_relative_path | File |
| set_attribute | gboolean |
| set_attributes_async | none |
| set_attributes_finish | gboolean |
| set_attributes_from_info | gboolean |
| set_display_name | File |
| set_display_name_async | none |
| set_display_name_finish | File |
| start_mountable | none |
| start_mountable_finish | gboolean |
| stop_mountable | none |
| stop_mountable_finish | gboolean |
| supports_thread_contexts | gboolean |
| trash | gboolean |
| trash_async | none |
| trash_finish | gboolean |
| unmount_mountable | none |
| unmount_mountable_finish | gboolean |
| unmount_mountable_with_operation | none |
| unmount_mountable_with_operation_finish | gboolean |

### Gio.FileInfoClass

C type: `GFileInfoClass`

### Gio.FileInputStreamClass

C type: `GFileInputStreamClass`

a #GFileInfo, or %NULL on error.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| can_seek | gboolean |
| parent_class | InputStreamClass |
| query_info | FileInfo |
| query_info_async | none |
| query_info_finish | FileInfo |
| seek | gboolean |
| tell | gint64 |

### Gio.FileInputStreamPrivate

C type: `GFileInputStreamPrivate`

### Gio.FileIOStreamClass

C type: `GFileIOStreamClass`

a #GFileInfo for the @stream, or %NULL on error.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| can_seek | gboolean |
| can_truncate | gboolean |
| get_etag | utf8 |
| parent_class | IOStreamClass |
| query_info | FileInfo |
| query_info_async | none |
| query_info_finish | FileInfo |
| seek | gboolean |
| tell | gint64 |
| truncate_fn | gboolean |

### Gio.FileIOStreamPrivate

C type: `GFileIOStreamPrivate`

### Gio.FileMonitorClass

C type: `GFileMonitorClass`

always %TRUE

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| cancel | gboolean |
| changed | none |
| parent_class | GObject.ObjectClass |

### Gio.FileMonitorPrivate

C type: `GFileMonitorPrivate`

### Gio.FilenameCompleterClass

C type: `GFilenameCompleterClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| got_completion_data | none |
| parent_class | GObject.ObjectClass |

### Gio.FileOutputStreamClass

C type: `GFileOutputStreamClass`

a #GFileInfo for the @stream, or %NULL on error.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| can_seek | gboolean |
| can_truncate | gboolean |
| get_etag | utf8 |
| parent_class | OutputStreamClass |
| query_info | FileInfo |
| query_info_async | none |
| query_info_finish | FileInfo |
| seek | gboolean |
| tell | gint64 |
| truncate_fn | gboolean |

### Gio.FileOutputStreamPrivate

C type: `GFileOutputStreamPrivate`

### Gio.FilterInputStreamClass

C type: `GFilterInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| parent_class | InputStreamClass |

### Gio.FilterOutputStreamClass

C type: `GFilterOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| parent_class | OutputStreamClass |

### Gio.IconIface

C type: `GIconIface`

GIconIface is used to implement GIcon types for various different systems. See #GThemedIcon and #GLoadableIcon for examples of how to implement thi...

#### Fields

| Field | Type |
| --- | --- |
| equal | gboolean |
| from_tokens | Icon |
| g_iface | GObject.TypeInterface |
| hash | guint |
| serialize | GLib.Variant |
| to_tokens | gboolean |

### Gio.InetAddressClass

C type: `GInetAddressClass`

a representation of @address as a string, which should be freed after use.

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |
| to_bytes | guint8 |
| to_string | utf8 |

### Gio.InetAddressMaskClass

C type: `GInetAddressMaskClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.InetAddressMaskPrivate

C type: `GInetAddressMaskPrivate`

### Gio.InetAddressPrivate

C type: `GInetAddressPrivate`

### Gio.InetSocketAddressClass

C type: `GInetSocketAddressClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | SocketAddressClass |

### Gio.InetSocketAddressPrivate

C type: `GInetSocketAddressPrivate`

### Gio.InitableIface

C type: `GInitableIface`

Provides an interface for initializing object such that initialization may fail.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| init | gboolean |

### Gio.InputMessage

C type: `GInputMessage`

Structure used for scatter/gather data input when receiving multiple messages or packets in one go. You generally pass in an array of empty #GInput...

#### Fields

| Field | Type |
| --- | --- |
| address | SocketAddress |
| bytes_received | gsize |
| control_messages | SocketControlMessage |
| flags | gint |
| num_control_messages | guint |
| num_vectors | guint |
| vectors | InputVector |

### Gio.InputStreamClass

C type: `GInputStreamClass`

Number of bytes skipped, or -1 on error

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| close_async | none |
| close_finish | gboolean |
| close_fn | gboolean |
| parent_class | GObject.ObjectClass |
| read_async | none |
| read_finish | gssize |
| read_fn | gssize |
| skip | gssize |
| skip_async | none |
| skip_finish | gssize |

### Gio.InputStreamPrivate

C type: `GInputStreamPrivate`

### Gio.InputVector

C type: `GInputVector`

Structure used for scatter/gather data input. You generally pass in an array of #GInputVectors and the operation will store the read data starting ...

#### Fields

| Field | Type |
| --- | --- |
| buffer | gpointer |
| size | gsize |

### Gio.IOExtension

C type: `GIOExtension`

#GIOExtension is an opaque data structure and can only be accessed using the following functions.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `IOExtension.get_name() -> utf8` | g_io_extension_get_name |  | Gets the name under which @extension was registered. Note that the same type may be registered as extension for multiple extension points, under di... |
| get_priority | `IOExtension.get_priority() -> gint` | g_io_extension_get_priority |  | Gets the priority with which @extension was registered. |
| get_type | `IOExtension.get_type() -> GType` | g_io_extension_get_type |  | Gets the type associated with @extension. |
| ref_class | `IOExtension.ref_class() -> GObject.TypeClass` | g_io_extension_ref_class |  | Gets a reference to the class for the type that is associated with @extension. |

### Gio.IOExtensionPoint

C type: `GIOExtensionPoint`

`GIOExtensionPoint` provides a mechanism for modules to extend the functionality of the library or application that loaded it in an organized fashi...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| implement | `implement(extension_point_name: utf8, type: GType, extension_name: utf8, priority: gint) -> IOExtension` | g_io_extension_point_implement |  | Registers @type as extension for the extension point with name @extension_point_name. If @type has already been registered as an extension for this... |
| lookup | `lookup(name: utf8) -> IOExtensionPoint` | g_io_extension_point_lookup |  | Looks up an existing extension point. |
| register | `register(name: utf8) -> IOExtensionPoint` | g_io_extension_point_register |  | Registers an extension point. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_extension_by_name | `IOExtensionPoint.get_extension_by_name(name: utf8) -> IOExtension` | g_io_extension_point_get_extension_by_name |  | Finds a #GIOExtension for an extension point by name. |
| get_extensions | `IOExtensionPoint.get_extensions() -> GLib.List` | g_io_extension_point_get_extensions |  | Gets a list of all extensions that implement this extension point. The list is sorted by priority, beginning with the highest priority. |
| get_required_type | `IOExtensionPoint.get_required_type() -> GType` | g_io_extension_point_get_required_type |  | Gets the required type for @extension_point. |
| set_required_type | `IOExtensionPoint.set_required_type(type: GType) -> none` | g_io_extension_point_set_required_type |  | Sets the required type for @extension_point to @type. All implementations must henceforth have this type. |

### Gio.IOModuleClass

C type: `GIOModuleClass`

### Gio.IOModuleScope

C type: `GIOModuleScope`

Represents a scope for loading IO modules. A scope can be used for blocking duplicate modules, or blocking a module you don't want to load. The sco...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(flags: IOModuleScopeFlags) -> IOModuleScope` | g_io_module_scope_new | 2.30 | Create a new scope for loading of IO modules. A scope can be used for blocking duplicate modules, or blocking a module you don't want to load. Spec... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| block | `IOModuleScope.block(basename: utf8) -> none` | g_io_module_scope_block | 2.30 | Block modules with the given @basename from being loaded when this scope is used with g_io_modules_scan_all_in_directory_with_scope() or g_io_modul... |
| free | `IOModuleScope.free() -> none` | g_io_module_scope_free | 2.30 | Free a module scope. |

### Gio.IOSchedulerJob

C type: `GIOSchedulerJob`

Opaque class for defining and scheduling IO jobs.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| send_to_mainloop | `IOSchedulerJob.send_to_mainloop(func: GLib.SourceFunc, user_data: gpointer?, notify: GLib.DestroyNotify?) -> gboolean` | g_io_scheduler_job_send_to_mainloop |  | Used from an I/O job to send a callback to be run in the thread that the job was started from, waiting for the result (and thus blocking the I/O job). |
| send_to_mainloop_async | `IOSchedulerJob.send_to_mainloop_async(func: GLib.SourceFunc, user_data: gpointer?, notify: GLib.DestroyNotify?) -> none` | g_io_scheduler_job_send_to_mainloop_async |  | Used from an I/O job to send a callback to be run asynchronously in the thread that the job was started from. The callback will be run when the mai... |

### Gio.IOStreamAdapter

C type: `GIOStreamAdapter`

### Gio.IOStreamClass

C type: `GIOStreamClass`

a #GInputStream, owned by the #GIOStream. Do not free.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved10 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| _g_reserved7 | none |
| _g_reserved8 | none |
| _g_reserved9 | none |
| close_async | none |
| close_finish | gboolean |
| close_fn | gboolean |
| get_input_stream | InputStream |
| get_output_stream | OutputStream |
| parent_class | GObject.ObjectClass |

### Gio.IOStreamPrivate

C type: `GIOStreamPrivate`

### Gio.ListModelInterface

C type: `GListModelInterface`

The virtual function table for #GListModel.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_item | GObject.Object |
| get_item_type | GType |
| get_n_items | guint |

### Gio.ListStoreClass

C type: `GListStoreClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.LoadableIconIface

C type: `GLoadableIconIface`

Interface for icons that can be loaded as a stream.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| load | InputStream |
| load_async | none |
| load_finish | InputStream |

### Gio.MemoryInputStreamClass

C type: `GMemoryInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | InputStreamClass |

### Gio.MemoryInputStreamPrivate

C type: `GMemoryInputStreamPrivate`

### Gio.MemoryMonitorInterface

C type: `GMemoryMonitorInterface`

The virtual function table for #GMemoryMonitor.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| low_memory_warning | none |

### Gio.MemoryOutputStreamClass

C type: `GMemoryOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | OutputStreamClass |

### Gio.MemoryOutputStreamPrivate

C type: `GMemoryOutputStreamPrivate`

### Gio.MenuAttributeIterClass

C type: `GMenuAttributeIterClass`

%TRUE on success, or %FALSE if there is no additional attribute

#### Fields

| Field | Type |
| --- | --- |
| get_next | gboolean |
| parent_class | GObject.ObjectClass |

### Gio.MenuAttributeIterPrivate

C type: `GMenuAttributeIterPrivate`

### Gio.MenuLinkIterClass

C type: `GMenuLinkIterClass`

%TRUE on success, or %FALSE if there is no additional link

#### Fields

| Field | Type |
| --- | --- |
| get_next | gboolean |
| parent_class | GObject.ObjectClass |

### Gio.MenuLinkIterPrivate

C type: `GMenuLinkIterPrivate`

### Gio.MenuModelClass

C type: `GMenuModelClass`

%TRUE if the model is mutable (ie: "items-changed" may be emitted).

#### Fields

| Field | Type |
| --- | --- |
| get_item_attribute_value | GLib.Variant |
| get_item_attributes | none |
| get_item_link | MenuModel |
| get_item_links | none |
| get_n_items | gint |
| is_mutable | gboolean |
| iterate_item_attributes | MenuAttributeIter |
| iterate_item_links | MenuLinkIter |
| parent_class | GObject.ObjectClass |

### Gio.MenuModelPrivate

C type: `GMenuModelPrivate`

### Gio.MountIface

C type: `GMountIface`

Interface for implementing operations for mounts.

#### Fields

| Field | Type |
| --- | --- |
| can_eject | gboolean |
| can_unmount | gboolean |
| changed | none |
| eject | none |
| eject_finish | gboolean |
| eject_with_operation | none |
| eject_with_operation_finish | gboolean |
| g_iface | GObject.TypeInterface |
| get_default_location | File |
| get_drive | Drive |
| get_icon | Icon |
| get_name | utf8 |
| get_root | File |
| get_sort_key | utf8 |
| get_symbolic_icon | Icon |
| get_uuid | utf8 |
| get_volume | Volume |
| guess_content_type | none |
| guess_content_type_finish | utf8 |
| guess_content_type_sync | utf8 |
| pre_unmount | none |
| remount | none |
| remount_finish | gboolean |
| unmount | none |
| unmount_finish | gboolean |
| unmount_with_operation | none |
| unmount_with_operation_finish | gboolean |
| unmounted | none |

### Gio.MountOperationClass

C type: `GMountOperationClass`

a #GMountOperation

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| _g_reserved7 | none |
| _g_reserved8 | none |
| _g_reserved9 | none |
| aborted | none |
| ask_password | none |
| ask_question | none |
| parent_class | GObject.ObjectClass |
| reply | none |
| show_processes | none |
| show_unmount_progress | none |

### Gio.MountOperationPrivate

C type: `GMountOperationPrivate`

### Gio.NativeSocketAddressClass

C type: `GNativeSocketAddressClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | SocketAddressClass |

### Gio.NativeSocketAddressPrivate

C type: `GNativeSocketAddressPrivate`

### Gio.NativeVolumeMonitorClass

C type: `GNativeVolumeMonitorClass`

#### Fields

| Field | Type |
| --- | --- |
| get_mount_for_mount_path | Mount |
| parent_class | VolumeMonitorClass |

### Gio.NetworkAddressClass

C type: `GNetworkAddressClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.NetworkAddressPrivate

C type: `GNetworkAddressPrivate`

### Gio.NetworkMonitorInterface

C type: `GNetworkMonitorInterface`

The virtual function table for #GNetworkMonitor.

#### Fields

| Field | Type |
| --- | --- |
| can_reach | gboolean |
| can_reach_async | none |
| can_reach_finish | gboolean |
| g_iface | GObject.TypeInterface |
| network_changed | none |

### Gio.NetworkServiceClass

C type: `GNetworkServiceClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.NetworkServicePrivate

C type: `GNetworkServicePrivate`

### Gio.OutputMessage

C type: `GOutputMessage`

Structure used for scatter/gather data output when sending multiple messages or packets in one go. You generally pass in an array of #GOutputVector...

#### Fields

| Field | Type |
| --- | --- |
| address | SocketAddress |
| bytes_sent | guint |
| control_messages | SocketControlMessage |
| num_control_messages | guint |
| num_vectors | guint |
| vectors | OutputVector |

### Gio.OutputStreamClass

C type: `GOutputStreamClass`

Number of bytes written, or -1 on error

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| _g_reserved7 | none |
| _g_reserved8 | none |
| close_async | none |
| close_finish | gboolean |
| close_fn | gboolean |
| flush | gboolean |
| flush_async | none |
| flush_finish | gboolean |
| parent_class | GObject.ObjectClass |
| splice | gssize |
| splice_async | none |
| splice_finish | gssize |
| write_async | none |
| write_finish | gssize |
| write_fn | gssize |
| writev_async | none |
| writev_finish | gboolean |
| writev_fn | gboolean |

### Gio.OutputStreamPrivate

C type: `GOutputStreamPrivate`

### Gio.OutputVector

C type: `GOutputVector`

Structure used for scatter/gather data output. You generally pass in an array of #GOutputVectors and the operation will use all the buffers as if t...

#### Fields

| Field | Type |
| --- | --- |
| buffer | gpointer |
| size | gsize |

### Gio.PermissionClass

C type: `GPermissionClass`

%TRUE if the permission was successfully acquired

#### Fields

| Field | Type |
| --- | --- |
| acquire | gboolean |
| acquire_async | none |
| acquire_finish | gboolean |
| parent_class | GObject.ObjectClass |
| release | gboolean |
| release_async | none |
| release_finish | gboolean |
| reserved | gpointer |

### Gio.PermissionPrivate

C type: `GPermissionPrivate`

### Gio.PollableInputStreamInterface

C type: `GPollableInputStreamInterface`

The interface for pollable input streams. The default implementation of @can_poll always returns %TRUE. The default implementation of @read_nonbloc...

#### Fields

| Field | Type |
| --- | --- |
| can_poll | gboolean |
| create_source | GLib.Source |
| g_iface | GObject.TypeInterface |
| is_readable | gboolean |
| read_nonblocking | gssize |

### Gio.PollableOutputStreamInterface

C type: `GPollableOutputStreamInterface`

The interface for pollable output streams. The default implementation of @can_poll always returns %TRUE. The default implementation of @write_nonbl...

#### Fields

| Field | Type |
| --- | --- |
| can_poll | gboolean |
| create_source | GLib.Source |
| g_iface | GObject.TypeInterface |
| is_writable | gboolean |
| write_nonblocking | gssize |
| writev_nonblocking | PollableReturn |

### Gio.PowerProfileMonitorInterface

C type: `GPowerProfileMonitorInterface`

The virtual function table for #GPowerProfileMonitor.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gio.ProxyAddressClass

C type: `GProxyAddressClass`

Class structure for #GProxyAddress.

#### Fields

| Field | Type |
| --- | --- |
| parent_class | InetSocketAddressClass |

### Gio.ProxyAddressEnumeratorClass

C type: `GProxyAddressEnumeratorClass`

Class structure for #GProxyAddressEnumerator.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| _g_reserved7 | none |
| parent_class | SocketAddressEnumeratorClass |

### Gio.ProxyAddressEnumeratorPrivate

C type: `GProxyAddressEnumeratorPrivate`

### Gio.ProxyAddressPrivate

C type: `GProxyAddressPrivate`

### Gio.ProxyInterface

C type: `GProxyInterface`

Provides an interface for handling proxy connection and payload.

#### Fields

| Field | Type |
| --- | --- |
| connect | IOStream |
| connect_async | none |
| connect_finish | IOStream |
| g_iface | GObject.TypeInterface |
| supports_hostname | gboolean |

### Gio.ProxyResolverInterface

C type: `GProxyResolverInterface`

The virtual function table for #GProxyResolver.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| is_supported | gboolean |
| lookup | utf8 |
| lookup_async | none |
| lookup_finish | utf8 |

### Gio.RemoteActionGroupInterface

C type: `GRemoteActionGroupInterface`

The virtual function table for #GRemoteActionGroup.

#### Fields

| Field | Type |
| --- | --- |
| activate_action_full | none |
| change_action_state_full | none |
| g_iface | GObject.TypeInterface |

### Gio.ResolverClass

C type: `GResolverClass`

a non-empty #GList of #GInetAddress, or %NULL on error. You must unref each of the addresses and free the list when you are done with it. (You can ...

#### Fields

| Field | Type |
| --- | --- |
| lookup_by_address | utf8 |
| lookup_by_address_async | none |
| lookup_by_address_finish | utf8 |
| lookup_by_name | GLib.List |
| lookup_by_name_async | none |
| lookup_by_name_finish | GLib.List |
| lookup_by_name_with_flags | GLib.List |
| lookup_by_name_with_flags_async | none |
| lookup_by_name_with_flags_finish | GLib.List |
| lookup_records | GLib.List |
| lookup_records_async | none |
| lookup_records_finish | GLib.List |
| lookup_service | GLib.List |
| lookup_service_async | none |
| lookup_service_finish | GLib.List |
| parent_class | GObject.ObjectClass |
| reload | none |

### Gio.ResolverPrivate

C type: `GResolverPrivate`

### Gio.Resource

GType: `GResource` ?? C type: `GResource`

Applications and libraries often contain binary or textual data that is really part of the application, rather than user data. For instance `GtkBui...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_data | `Resource.new_from_data(data: GLib.Bytes) -> Resource throws` | g_resource_new_from_data | 2.32 | Creates a GResource from a reference to the binary resource bundle. This will keep a reference to @data while the resource lives, so the data shoul... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load(filename: filename) -> Resource throws` | g_resource_load | 2.32 | Loads a binary resource bundle and creates a #GResource representation of it, allowing you to query it for data. If you want to use this resource i... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| _register | `Resource._register() -> none` | g_resources_register | 2.32 | Registers the resource with the process-global set of resources. Once a resource is registered the files in it can be accessed with the global reso... |
| _unregister | `Resource._unregister() -> none` | g_resources_unregister | 2.32 | Unregisters the resource from the process-global set of resources. |
| enumerate_children | `Resource.enumerate_children(path: utf8, lookup_flags: ResourceLookupFlags) -> utf8 throws` | g_resource_enumerate_children | 2.32 | Returns all the names of children at the specified @path in the resource. The return result is a %NULL terminated list of strings which should be r... |
| get_info | `Resource.get_info(path: utf8, lookup_flags: ResourceLookupFlags, size: out gsize?, flags: out guint32?) -> gboolean throws` | g_resource_get_info | 2.32 | Looks for a file at the specified @path in the resource and if found returns information about it. @lookup_flags controls the behaviour of the lookup. |
| lookup_data | `Resource.lookup_data(path: utf8, lookup_flags: ResourceLookupFlags) -> GLib.Bytes throws` | g_resource_lookup_data | 2.32 | Looks for a file at the specified @path in the resource and returns a #GBytes that lets you directly access the data in memory. The data is always ... |
| open_stream | `Resource.open_stream(path: utf8, lookup_flags: ResourceLookupFlags) -> InputStream throws` | g_resource_open_stream | 2.32 | Looks for a file at the specified @path in the resource and returns a #GInputStream that lets you read the data. @lookup_flags controls the behavio... |
| ref | `Resource.ref() -> Resource` | g_resource_ref | 2.32 | Atomically increments the reference count of @resource by one. This function is MT-safe and may be called from any thread. |
| unref | `Resource.unref() -> none` | g_resource_unref | 2.32 | Atomically decrements the reference count of @resource by one. If the reference count drops to 0, all memory allocated by the resource is released.... |

### Gio.SeekableIface

C type: `GSeekableIface`

Provides an interface for implementing seekable functionality on I/O Streams.

#### Fields

| Field | Type |
| --- | --- |
| can_seek | gboolean |
| can_truncate | gboolean |
| g_iface | GObject.TypeInterface |
| seek | gboolean |
| tell | gint64 |
| truncate_fn | gboolean |

### Gio.SettingsBackendClass

C type: `GSettingsBackendClass`

Class structure for #GSettingsBackend.

#### Fields

| Field | Type |
| --- | --- |
| get_permission | Permission |
| get_writable | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| read | GLib.Variant |
| read_user_value | GLib.Variant |
| reset | none |
| subscribe | none |
| sync | none |
| unsubscribe | none |
| write | gboolean |
| write_tree | gboolean |

### Gio.SettingsBackendPrivate

C type: `GSettingsBackendPrivate`

### Gio.SettingsClass

C type: `GSettingsClass`

#### Fields

| Field | Type |
| --- | --- |
| change_event | gboolean |
| changed | none |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| writable_change_event | gboolean |
| writable_changed | none |

### Gio.SettingsPrivate

C type: `GSettingsPrivate`

### Gio.SettingsSchema

GType: `GSettingsSchema` ?? C type: `GSettingsSchema`

The [struct@Gio.SettingsSchemaSource] and `GSettingsSchema` APIs provide a mechanism for advanced control over the loading of schemas and a mechani...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_id | `SettingsSchema.get_id() -> utf8` | g_settings_schema_get_id |  | Get the ID of @schema. |
| get_key | `SettingsSchema.get_key(name: utf8) -> SettingsSchemaKey` | g_settings_schema_get_key | 2.40 | Gets the key named @name from @schema. It is a programmer error to request a key that does not exist. See g_settings_schema_list_keys(). |
| get_path | `SettingsSchema.get_path() -> utf8` | g_settings_schema_get_path | 2.32 | Gets the path associated with @schema, or %NULL. Schemas may be single-instance or relocatable. Single-instance schemas correspond to exactly one s... |
| has_key | `SettingsSchema.has_key(name: utf8) -> gboolean` | g_settings_schema_has_key | 2.40 | Checks if @schema has a key named @name. |
| list_children | `SettingsSchema.list_children() -> utf8` | g_settings_schema_list_children | 2.44 | Gets the list of children in @schema. You should free the return value with g_strfreev() when you are done with it. |
| list_keys | `SettingsSchema.list_keys() -> utf8` | g_settings_schema_list_keys | 2.46 | Introspects the list of keys on @schema. You should probably not be calling this function from "normal" code (since you should already know what ke... |
| ref | `SettingsSchema.ref() -> SettingsSchema` | g_settings_schema_ref | 2.32 | Increase the reference count of @schema, returning a new reference. |
| unref | `SettingsSchema.unref() -> none` | g_settings_schema_unref | 2.32 | Decrease the reference count of @schema, possibly freeing it. |

### Gio.SettingsSchemaKey

GType: `GSettingsSchemaKey` ?? C type: `GSettingsSchemaKey`

#GSettingsSchemaKey is an opaque data structure and can only be accessed using the following functions.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default_value | `SettingsSchemaKey.get_default_value() -> GLib.Variant` | g_settings_schema_key_get_default_value | 2.40 | Gets the default value for @key. Note that this is the default value according to the schema. System administrator defaults and lockdown are not vi... |
| get_description | `SettingsSchemaKey.get_description() -> utf8` | g_settings_schema_key_get_description | 2.34 | Gets the description for @key. If no description has been provided in the schema for @key, returns %NULL. The description can be one sentence to se... |
| get_name | `SettingsSchemaKey.get_name() -> utf8` | g_settings_schema_key_get_name | 2.44 | Gets the name of @key. |
| get_range | `SettingsSchemaKey.get_range() -> GLib.Variant` | g_settings_schema_key_get_range | 2.40 | Queries the range of a key. This function will return a #GVariant that fully describes the range of values that are valid for @key. The type of #GV... |
| get_summary | `SettingsSchemaKey.get_summary() -> utf8` | g_settings_schema_key_get_summary | 2.34 | Gets the summary for @key. If no summary has been provided in the schema for @key, returns %NULL. The summary is a short description of the purpose... |
| get_value_type | `SettingsSchemaKey.get_value_type() -> GLib.VariantType` | g_settings_schema_key_get_value_type | 2.40 | Gets the #GVariantType of @key. |
| range_check | `SettingsSchemaKey.range_check(value: GLib.Variant) -> gboolean` | g_settings_schema_key_range_check | 2.40 | Checks if the given @value is within the permitted range for @key. It is a programmer error if @value is not of the correct type ??? you must check... |
| ref | `SettingsSchemaKey.ref() -> SettingsSchemaKey` | g_settings_schema_key_ref | 2.40 | Increase the reference count of @key, returning a new reference. |
| unref | `SettingsSchemaKey.unref() -> none` | g_settings_schema_key_unref | 2.40 | Decrease the reference count of @key, possibly freeing it. |

### Gio.SettingsSchemaSource

GType: `GSettingsSchemaSource` ?? C type: `GSettingsSchemaSource`

This is an opaque structure type. You may not access it directly.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_directory | `SettingsSchemaSource.new_from_directory(directory: filename, parent: SettingsSchemaSource?, trusted: gboolean) -> SettingsSchemaSource throws` | g_settings_schema_source_new_from_directory | 2.32 | Attempts to create a new schema source corresponding to the contents of the given directory. This function is not required for normal uses of #GSet... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> SettingsSchemaSource` | g_settings_schema_source_get_default | 2.32 | Gets the default system schema source. This function is not required for normal uses of #GSettings but it may be useful to authors of plugin manage... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| list_schemas | `SettingsSchemaSource.list_schemas(recursive: gboolean, non_relocatable: out utf8, relocatable: out utf8) -> none` | g_settings_schema_source_list_schemas | 2.40 | Lists the schemas in a given source. If @recursive is %TRUE then include parent sources. If %FALSE then only include the schemas from one source (i... |
| lookup | `SettingsSchemaSource.lookup(schema_id: utf8, recursive: gboolean) -> SettingsSchema` | g_settings_schema_source_lookup | 2.32 | Looks up a schema with the identifier @schema_id in @source. This function is not required for normal uses of #GSettings but it may be useful to au... |
| ref | `SettingsSchemaSource.ref() -> SettingsSchemaSource` | g_settings_schema_source_ref | 2.32 | Increase the reference count of @source, returning a new reference. |
| unref | `SettingsSchemaSource.unref() -> none` | g_settings_schema_source_unref | 2.32 | Decrease the reference count of @source, possibly freeing it. |

### Gio.SimpleActionGroupClass

C type: `GSimpleActionGroupClass`

#### Fields

| Field | Type |
| --- | --- |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Gio.SimpleActionGroupPrivate

C type: `GSimpleActionGroupPrivate`

### Gio.SimpleAsyncResultClass

C type: `GSimpleAsyncResultClass`

### Gio.SimpleProxyResolverClass

C type: `GSimpleProxyResolverClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | GObject.ObjectClass |

### Gio.SimpleProxyResolverPrivate

C type: `GSimpleProxyResolverPrivate`

### Gio.SocketAddressClass

C type: `GSocketAddressClass`

the socket family type of @address

#### Fields

| Field | Type |
| --- | --- |
| get_family | SocketFamily |
| get_native_size | gssize |
| parent_class | GObject.ObjectClass |
| to_native | gboolean |

### Gio.SocketAddressEnumeratorClass

C type: `GSocketAddressEnumeratorClass`

Class structure for #GSocketAddressEnumerator.

#### Fields

| Field | Type |
| --- | --- |
| next | SocketAddress |
| next_async | none |
| next_finish | SocketAddress |
| parent_class | GObject.ObjectClass |

### Gio.SocketClass

C type: `GSocketClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved10 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| _g_reserved7 | none |
| _g_reserved8 | none |
| _g_reserved9 | none |
| parent_class | GObject.ObjectClass |

### Gio.SocketClientClass

C type: `GSocketClientClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| event | none |
| parent_class | GObject.ObjectClass |

### Gio.SocketClientPrivate

C type: `GSocketClientPrivate`

### Gio.SocketConnectableIface

C type: `GSocketConnectableIface`

Provides an interface for returning a #GSocketAddressEnumerator and #GProxyAddressEnumerator

#### Fields

| Field | Type |
| --- | --- |
| enumerate | SocketAddressEnumerator |
| g_iface | GObject.TypeInterface |
| proxy_enumerate | SocketAddressEnumerator |
| to_string | utf8 |

### Gio.SocketConnectionClass

C type: `GSocketConnectionClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| parent_class | IOStreamClass |

### Gio.SocketConnectionPrivate

C type: `GSocketConnectionPrivate`

### Gio.SocketControlMessageClass

C type: `GSocketControlMessageClass`

Class structure for #GSocketControlMessage.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| deserialize | SocketControlMessage |
| get_level | gint |
| get_size | gsize |
| get_type | gint |
| parent_class | GObject.ObjectClass |
| serialize | none |

### Gio.SocketControlMessagePrivate

C type: `GSocketControlMessagePrivate`

### Gio.SocketListenerClass

C type: `GSocketListenerClass`

Class structure for #GSocketListener.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| changed | none |
| event | none |
| parent_class | GObject.ObjectClass |

### Gio.SocketListenerPrivate

C type: `GSocketListenerPrivate`

### Gio.SocketPrivate

C type: `GSocketPrivate`

### Gio.SocketServiceClass

C type: `GSocketServiceClass`

Class structure for #GSocketService.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| incoming | gboolean |
| parent_class | SocketListenerClass |

### Gio.SocketServicePrivate

C type: `GSocketServicePrivate`

### Gio.SrvTarget

GType: `GSrvTarget` ?? C type: `GSrvTarget`

A single target host/port that a network service is running on. SRV (service) records are used by some network protocols to provide service-specifi...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SrvTarget.new(hostname: utf8, port: guint16, priority: guint16, weight: guint16) -> SrvTarget` | g_srv_target_new | 2.22 | Creates a new #GSrvTarget with the given parameters. You should not need to use this; normally #GSrvTargets are created by #GResolver. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| list_sort | `list_sort(targets: GLib.List) -> GLib.List` | g_srv_target_list_sort | 2.22 | Sorts @targets in place according to the algorithm in RFC 2782. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `SrvTarget.copy() -> SrvTarget` | g_srv_target_copy | 2.22 | Copies @target |
| free | `SrvTarget.free() -> none` | g_srv_target_free | 2.22 | Frees @target |
| get_hostname | `SrvTarget.get_hostname() -> utf8` | g_srv_target_get_hostname | 2.22 | Gets @target's hostname (in ASCII form; if you are going to present this to the user, you should use g_hostname_is_ascii_encoded() to check if it c... |
| get_port | `SrvTarget.get_port() -> guint16` | g_srv_target_get_port | 2.22 | Gets @target's port |
| get_priority | `SrvTarget.get_priority() -> guint16` | g_srv_target_get_priority | 2.22 | Gets @target's priority. You should not need to look at this; #GResolver already sorts the targets according to the algorithm in RFC 2782. |
| get_weight | `SrvTarget.get_weight() -> guint16` | g_srv_target_get_weight | 2.22 | Gets @target's weight. You should not need to look at this; #GResolver already sorts the targets according to the algorithm in RFC 2782. |

### Gio.StaticResource

C type: `GStaticResource`

#GStaticResource is an opaque data structure and can only be accessed using the following functions.

#### Fields

| Field | Type |
| --- | --- |
| data | guint8 |
| data_len | gsize |
| next | StaticResource |
| padding | gpointer |
| resource | Resource |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fini | `StaticResource.fini() -> none` | g_static_resource_fini | 2.32 | Finalized a GResource initialized by g_static_resource_init(). This is normally used by code generated by [glib-compile-resources][glib-compile-res... |
| get_resource | `StaticResource.get_resource() -> Resource` | g_static_resource_get_resource | 2.32 | Gets the GResource that was registered by a call to g_static_resource_init(). This is normally used by code generated by [glib-compile-resources][g... |
| init | `StaticResource.init() -> none` | g_static_resource_init | 2.32 | Initializes a GResource from static data using a GStaticResource. This is normally used by code generated by [glib-compile-resources][glib-compile-... |

### Gio.TaskClass

C type: `GTaskClass`

### Gio.TcpConnectionClass

C type: `GTcpConnectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | SocketConnectionClass |

### Gio.TcpConnectionPrivate

C type: `GTcpConnectionPrivate`

### Gio.TcpWrapperConnectionClass

C type: `GTcpWrapperConnectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | TcpConnectionClass |

### Gio.TcpWrapperConnectionPrivate

C type: `GTcpWrapperConnectionPrivate`

### Gio.ThemedIconClass

C type: `GThemedIconClass`

### Gio.ThreadedResolverClass

C type: `GThreadedResolverClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | ResolverClass |

### Gio.ThreadedSocketServiceClass

C type: `GThreadedSocketServiceClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | SocketServiceClass |
| run | gboolean |

### Gio.ThreadedSocketServicePrivate

C type: `GThreadedSocketServicePrivate`

### Gio.TlsBackendInterface

C type: `GTlsBackendInterface`

Provides an interface for describing TLS-related types.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| get_certificate_type | GType |
| get_client_connection_type | GType |
| get_default_database | TlsDatabase |
| get_dtls_client_connection_type | GType |
| get_dtls_server_connection_type | GType |
| get_file_database_type | GType |
| get_server_connection_type | GType |
| supports_dtls | gboolean |
| supports_tls | gboolean |

### Gio.TlsCertificateClass

C type: `GTlsCertificateClass`

the appropriate #GTlsCertificateFlags

#### Fields

| Field | Type |
| --- | --- |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| verify | TlsCertificateFlags |

### Gio.TlsCertificatePrivate

C type: `GTlsCertificatePrivate`

### Gio.TlsClientConnectionInterface

C type: `GTlsClientConnectionInterface`

vtable for a #GTlsClientConnection implementation.

#### Fields

| Field | Type |
| --- | --- |
| copy_session_state | none |
| g_iface | GObject.TypeInterface |

### Gio.TlsConnectionClass

C type: `GTlsConnectionClass`

The class structure for the #GTlsConnection type.

#### Fields

| Field | Type |
| --- | --- |
| accept_certificate | gboolean |
| get_binding_data | gboolean |
| get_negotiated_protocol | utf8 |
| handshake | gboolean |
| handshake_async | none |
| handshake_finish | gboolean |
| padding | gpointer |
| parent_class | IOStreamClass |

### Gio.TlsConnectionPrivate

C type: `GTlsConnectionPrivate`

### Gio.TlsDatabaseClass

C type: `GTlsDatabaseClass`

The class for #GTlsDatabase. Derived classes should implement the various virtual methods. _async and _finish methods have a default implementation...

#### Fields

| Field | Type |
| --- | --- |
| create_certificate_handle | utf8 |
| lookup_certificate_for_handle | TlsCertificate |
| lookup_certificate_for_handle_async | none |
| lookup_certificate_for_handle_finish | TlsCertificate |
| lookup_certificate_issuer | TlsCertificate |
| lookup_certificate_issuer_async | none |
| lookup_certificate_issuer_finish | TlsCertificate |
| lookup_certificates_issued_by | GLib.List |
| lookup_certificates_issued_by_async | none |
| lookup_certificates_issued_by_finish | GLib.List |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| verify_chain | TlsCertificateFlags |
| verify_chain_async | none |
| verify_chain_finish | TlsCertificateFlags |

### Gio.TlsDatabasePrivate

C type: `GTlsDatabasePrivate`

### Gio.TlsFileDatabaseInterface

C type: `GTlsFileDatabaseInterface`

Provides an interface for #GTlsFileDatabase implementations.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |
| padding | gpointer |

### Gio.TlsInteractionClass

C type: `GTlsInteractionClass`

The class for #GTlsInteraction. Derived classes implement the various virtual interaction methods to handle TLS interactions. Derived classes can c...

#### Fields

| Field | Type |
| --- | --- |
| ask_password | TlsInteractionResult |
| ask_password_async | none |
| ask_password_finish | TlsInteractionResult |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| request_certificate | TlsInteractionResult |
| request_certificate_async | none |
| request_certificate_finish | TlsInteractionResult |

### Gio.TlsInteractionPrivate

C type: `GTlsInteractionPrivate`

### Gio.TlsPasswordClass

C type: `GTlsPasswordClass`

Class structure for #GTlsPassword.

#### Fields

| Field | Type |
| --- | --- |
| get_default_warning | utf8 |
| get_value | guint8 |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| set_value | none |

### Gio.TlsPasswordPrivate

C type: `GTlsPasswordPrivate`

### Gio.TlsServerConnectionInterface

C type: `GTlsServerConnectionInterface`

vtable for a #GTlsServerConnection implementation.

#### Fields

| Field | Type |
| --- | --- |
| g_iface | GObject.TypeInterface |

### Gio.UnixConnectionClass

C type: `GUnixConnectionClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | SocketConnectionClass |

### Gio.UnixConnectionPrivate

C type: `GUnixConnectionPrivate`

### Gio.UnixCredentialsMessageClass

C type: `GUnixCredentialsMessageClass`

Class structure for #GUnixCredentialsMessage.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| parent_class | SocketControlMessageClass |

### Gio.UnixCredentialsMessagePrivate

C type: `GUnixCredentialsMessagePrivate`

### Gio.UnixFDListClass

C type: `GUnixFDListClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | GObject.ObjectClass |

### Gio.UnixFDListPrivate

C type: `GUnixFDListPrivate`

### Gio.UnixFDMessageClass

C type: `GUnixFDMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| parent_class | SocketControlMessageClass |

### Gio.UnixFDMessagePrivate

C type: `GUnixFDMessagePrivate`

### Gio.UnixInputStreamClass

C type: `GUnixInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | InputStreamClass |

### Gio.UnixInputStreamPrivate

C type: `GUnixInputStreamPrivate`

### Gio.UnixMountEntry

GType: `GUnixMountEntry` ?? C type: `GUnixMountEntry`

Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>). This corresponds roughly to a mtab entry.

### Gio.UnixMountMonitorClass

C type: `GUnixMountMonitorClass`

### Gio.UnixMountPoint

GType: `GUnixMountPoint` ?? C type: `GUnixMountPoint`

Defines a Unix mount point (e.g. <filename>/dev</filename>). This corresponds roughly to a fstab entry.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| at | `at(mount_path: filename, time_read: out guint64?) -> UnixMountPoint` | g_unix_mount_point_at | 2.66 | Gets a #GUnixMountPoint for a given mount path. If @time_read is set, it will be filled with a unix timestamp for checking if the mount points have... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compare | `UnixMountPoint.compare(mount2: UnixMountPoint) -> gint` | g_unix_mount_point_compare |  | Compares two unix mount points. |
| copy | `UnixMountPoint.copy() -> UnixMountPoint` | g_unix_mount_point_copy | 2.54 | Makes a copy of @mount_point. |
| free | `UnixMountPoint.free() -> none` | g_unix_mount_point_free |  | Frees a unix mount point. |
| get_device_path | `UnixMountPoint.get_device_path() -> filename` | g_unix_mount_point_get_device_path |  | Gets the device path for a unix mount point. |
| get_fs_type | `UnixMountPoint.get_fs_type() -> utf8` | g_unix_mount_point_get_fs_type |  | Gets the file system type for the mount point. |
| get_mount_path | `UnixMountPoint.get_mount_path() -> filename` | g_unix_mount_point_get_mount_path |  | Gets the mount path for a unix mount point. |
| get_options | `UnixMountPoint.get_options() -> utf8` | g_unix_mount_point_get_options | 2.32 | Gets the options for the mount point. |
| guess_can_eject | `UnixMountPoint.guess_can_eject() -> gboolean` | g_unix_mount_point_guess_can_eject |  | Guesses whether a Unix mount point can be ejected. |
| guess_icon | `UnixMountPoint.guess_icon() -> Icon` | g_unix_mount_point_guess_icon |  | Guesses the icon of a Unix mount point. |
| guess_name | `UnixMountPoint.guess_name() -> utf8` | g_unix_mount_point_guess_name |  | Guesses the name of a Unix mount point. The result is a translated string. |
| guess_symbolic_icon | `UnixMountPoint.guess_symbolic_icon() -> Icon` | g_unix_mount_point_guess_symbolic_icon | 2.34 | Guesses the symbolic icon of a Unix mount point. |
| is_loopback | `UnixMountPoint.is_loopback() -> gboolean` | g_unix_mount_point_is_loopback |  | Checks if a unix mount point is a loopback device. |
| is_readonly | `UnixMountPoint.is_readonly() -> gboolean` | g_unix_mount_point_is_readonly |  | Checks if a unix mount point is read only. |
| is_user_mountable | `UnixMountPoint.is_user_mountable() -> gboolean` | g_unix_mount_point_is_user_mountable |  | Checks if a unix mount point is mountable by the user. |

### Gio.UnixOutputStreamClass

C type: `GUnixOutputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| parent_class | OutputStreamClass |

### Gio.UnixOutputStreamPrivate

C type: `GUnixOutputStreamPrivate`

### Gio.UnixSocketAddressClass

C type: `GUnixSocketAddressClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | SocketAddressClass |

### Gio.UnixSocketAddressPrivate

C type: `GUnixSocketAddressPrivate`

### Gio.VfsClass

C type: `GVfsClass`

%TRUE if construction of the @vfs was successful and it is now active.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| add_writable_namespaces | none |
| deserialize_icon | Icon |
| get_file_for_path | File |
| get_file_for_uri | File |
| get_supported_uri_schemes | utf8 |
| is_active | gboolean |
| local_file_add_info | none |
| local_file_moved | none |
| local_file_removed | none |
| local_file_set_attributes | gboolean |
| parent_class | GObject.ObjectClass |
| parse_name | File |

### Gio.VolumeIface

C type: `GVolumeIface`

Interface for implementing operations for mountable volumes.

#### Fields

| Field | Type |
| --- | --- |
| can_eject | gboolean |
| can_mount | gboolean |
| changed | none |
| eject | none |
| eject_finish | gboolean |
| eject_with_operation | none |
| eject_with_operation_finish | gboolean |
| enumerate_identifiers | utf8 |
| g_iface | GObject.TypeInterface |
| get_activation_root | File |
| get_drive | Drive |
| get_icon | Icon |
| get_identifier | utf8 |
| get_mount | Mount |
| get_name | utf8 |
| get_sort_key | utf8 |
| get_symbolic_icon | Icon |
| get_uuid | utf8 |
| mount_finish | gboolean |
| mount_fn | none |
| removed | none |
| should_automount | gboolean |

### Gio.VolumeMonitorClass

C type: `GVolumeMonitorClass`

a #GList of connected #GDrive objects.

#### Fields

| Field | Type |
| --- | --- |
| _g_reserved1 | none |
| _g_reserved2 | none |
| _g_reserved3 | none |
| _g_reserved4 | none |
| _g_reserved5 | none |
| _g_reserved6 | none |
| adopt_orphan_mount | Volume |
| drive_changed | none |
| drive_connected | none |
| drive_disconnected | none |
| drive_eject_button | none |
| drive_stop_button | none |
| get_connected_drives | GLib.List |
| get_mount_for_uuid | Mount |
| get_mounts | GLib.List |
| get_volume_for_uuid | Volume |
| get_volumes | GLib.List |
| is_supported | gboolean |
| mount_added | none |
| mount_changed | none |
| mount_pre_unmount | none |
| mount_removed | none |
| parent_class | GObject.ObjectClass |
| volume_added | none |
| volume_changed | none |
| volume_removed | none |

### Gio.ZlibCompressorClass

C type: `GZlibCompressorClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Gio.ZlibDecompressorClass

C type: `GZlibDecompressorClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| action_name_is_valid | `action_name_is_valid(action_name: utf8) -> gboolean` | g_action_name_is_valid | 2.38 | Checks if @action_name is valid. @action_name is valid if it consists only of alphanumeric characters, plus '-' and '.'. The empty string is not a ... |
| action_parse_detailed_name | `action_parse_detailed_name(detailed_name: utf8, action_name: out utf8?, target_value: out GLib.Variant?) -> gboolean throws` | g_action_parse_detailed_name | 2.38 | Parses a detailed action name into its separate name and target components. Detailed action names can have three formats. The first format is used ... |
| action_print_detailed_name | `action_print_detailed_name(action_name: utf8, target_value: GLib.Variant?) -> utf8` | g_action_print_detailed_name | 2.38 | Formats a detailed action name from @action_name and @target_value. It is an error to call this function with an invalid action name. This function... |
| app_info_create_from_commandline | `app_info_create_from_commandline(commandline: filename, application_name: utf8?, flags: AppInfoCreateFlags) -> AppInfo throws` | g_app_info_create_from_commandline |  | Creates a new #GAppInfo from the given information. Note that for @commandline, the quoting rules of the Exec key of the freedesktop.org Desktop En... |
| app_info_get_all | `app_info_get_all() -> GLib.List` | g_app_info_get_all |  | Gets a list of all of the applications currently registered on this system. For desktop files, this includes applications that have `NoDisplay=true... |
| app_info_get_all_for_type | `app_info_get_all_for_type(content_type: utf8) -> GLib.List` | g_app_info_get_all_for_type |  | Gets a list of all #GAppInfos for a given content type, including the recommended and fallback #GAppInfos. See g_app_info_get_recommended_for_type(... |
| app_info_get_default_for_type | `app_info_get_default_for_type(content_type: utf8, must_support_uris: gboolean) -> AppInfo` | g_app_info_get_default_for_type |  | Gets the default #GAppInfo for a given content type. |
| app_info_get_default_for_type_async | `app_info_get_default_for_type_async(content_type: utf8, must_support_uris: gboolean, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_get_default_for_type_async | 2.74 | Asynchronously gets the default #GAppInfo for a given content type. |
| app_info_get_default_for_type_finish | `app_info_get_default_for_type_finish(result: AsyncResult) -> AppInfo throws` | g_app_info_get_default_for_type_finish | 2.74 | Finishes a default #GAppInfo lookup started by g_app_info_get_default_for_type_async(). If no #GAppInfo is found, then @error will be set to %G_IO_... |
| app_info_get_default_for_uri_scheme | `app_info_get_default_for_uri_scheme(uri_scheme: utf8) -> AppInfo` | g_app_info_get_default_for_uri_scheme |  | Gets the default application for handling URIs with the given URI scheme. A URI scheme is the initial part of the URI, up to but not including the ... |
| app_info_get_default_for_uri_scheme_async | `app_info_get_default_for_uri_scheme_async(uri_scheme: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_get_default_for_uri_scheme_async | 2.74 | Asynchronously gets the default application for handling URIs with the given URI scheme. A URI scheme is the initial part of the URI, up to but not... |
| app_info_get_default_for_uri_scheme_finish | `app_info_get_default_for_uri_scheme_finish(result: AsyncResult) -> AppInfo throws` | g_app_info_get_default_for_uri_scheme_finish | 2.74 | Finishes a default #GAppInfo lookup started by g_app_info_get_default_for_uri_scheme_async(). If no #GAppInfo is found, then @error will be set to ... |
| app_info_get_fallback_for_type | `app_info_get_fallback_for_type(content_type: utf8) -> GLib.List` | g_app_info_get_fallback_for_type | 2.28 | Gets a list of fallback #GAppInfos for a given content type, i.e. those applications which claim to support the given content type by MIME type sub... |
| app_info_get_recommended_for_type | `app_info_get_recommended_for_type(content_type: utf8) -> GLib.List` | g_app_info_get_recommended_for_type | 2.28 | Gets a list of recommended #GAppInfos for a given content type, i.e. those applications which claim to support the given content type exactly, and ... |
| app_info_launch_default_for_uri | `app_info_launch_default_for_uri(uri: utf8, context: AppLaunchContext?) -> gboolean throws` | g_app_info_launch_default_for_uri |  | Utility function that launches the default application registered to handle the specified uri. Synchronous I/O is done on the uri to detect the typ... |
| app_info_launch_default_for_uri_async | `app_info_launch_default_for_uri_async(uri: utf8, context: AppLaunchContext?, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_app_info_launch_default_for_uri_async | 2.50 | Async version of g_app_info_launch_default_for_uri(). This version is useful if you are interested in receiving error information in the case where... |
| app_info_launch_default_for_uri_finish | `app_info_launch_default_for_uri_finish(result: AsyncResult) -> gboolean throws` | g_app_info_launch_default_for_uri_finish | 2.50 | Finishes an asynchronous launch-default-for-uri operation. |
| app_info_reset_type_associations | `app_info_reset_type_associations(content_type: utf8) -> none` | g_app_info_reset_type_associations | 2.20 | Removes all changes to the type associations done by g_app_info_set_as_default_for_type(), g_app_info_set_as_default_for_extension(), g_app_info_ad... |
| async_initable_newv_async | `async_initable_newv_async(object_type: GType, n_parameters: guint, parameters: GObject.Parameter, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_async_initable_newv_async | 2.22 | Helper function for constructing #GAsyncInitable object. This is similar to g_object_newv() but also initializes the object asynchronously. When th... |
| bus_get | `bus_get(bus_type: BusType, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_bus_get | 2.26 | Asynchronously connects to the message bus specified by @bus_type. When the operation is finished, @callback will be invoked. You can then call g_b... |
| bus_get_finish | `bus_get_finish(res: AsyncResult) -> DBusConnection throws` | g_bus_get_finish | 2.26 | Finishes an operation started with g_bus_get(). The returned object is a singleton, that is, shared with other callers of g_bus_get() and g_bus_get... |
| bus_get_sync | `bus_get_sync(bus_type: BusType, cancellable: Cancellable?) -> DBusConnection throws` | g_bus_get_sync | 2.26 | Synchronously connects to the message bus specified by @bus_type. Note that the returned object may shared with other callers, e.g. if two separate... |
| bus_own_name | `bus_own_name(bus_type: BusType, name: utf8, flags: BusNameOwnerFlags, bus_acquired_handler: BusAcquiredCallback?, name_acquired_handler: BusNameAcquiredCallback?, name_lost_handler: BusNameLostCallback?, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify?) -> guint` | g_bus_own_name | 2.26 | Starts acquiring @name on the bus specified by @bus_type and calls @name_acquired_handler and @name_lost_handler when the name is acquired respecti... |
| bus_own_name_on_connection | `bus_own_name_on_connection(connection: DBusConnection, name: utf8, flags: BusNameOwnerFlags, name_acquired_handler: BusNameAcquiredCallback?, name_lost_handler: BusNameLostCallback?, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify?) -> guint` | g_bus_own_name_on_connection | 2.26 | Like g_bus_own_name() but takes a #GDBusConnection instead of a #GBusType. |
| bus_own_name_on_connection_with_closures | `bus_own_name_on_connection_with_closures(connection: DBusConnection, name: utf8, flags: BusNameOwnerFlags, name_acquired_closure: GObject.Closure?, name_lost_closure: GObject.Closure?) -> guint` | g_bus_own_name_on_connection_with_closures | 2.26 | Version of g_bus_own_name_on_connection() using closures instead of callbacks for easier binding in other languages. |
| bus_own_name_with_closures | `bus_own_name_with_closures(bus_type: BusType, name: utf8, flags: BusNameOwnerFlags, bus_acquired_closure: GObject.Closure?, name_acquired_closure: GObject.Closure?, name_lost_closure: GObject.Closure?) -> guint` | g_bus_own_name_with_closures | 2.26 | Version of g_bus_own_name() using closures instead of callbacks for easier binding in other languages. |
| bus_unown_name | `bus_unown_name(owner_id: guint) -> none` | g_bus_unown_name | 2.26 | Stops owning a name. Note that there may still be D-Bus traffic to process (relating to owning and unowning the name) in the current thread-default... |
| bus_unwatch_name | `bus_unwatch_name(watcher_id: guint) -> none` | g_bus_unwatch_name | 2.26 | Stops watching a name. Note that there may still be D-Bus traffic to process (relating to watching and unwatching the name) in the current thread-d... |
| bus_watch_name | `bus_watch_name(bus_type: BusType, name: utf8, flags: BusNameWatcherFlags, name_appeared_handler: BusNameAppearedCallback?, name_vanished_handler: BusNameVanishedCallback?, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify?) -> guint` | g_bus_watch_name | 2.26 | Starts watching @name on the bus specified by @bus_type and calls @name_appeared_handler and @name_vanished_handler when the name is known to have ... |
| bus_watch_name_on_connection | `bus_watch_name_on_connection(connection: DBusConnection, name: utf8, flags: BusNameWatcherFlags, name_appeared_handler: BusNameAppearedCallback?, name_vanished_handler: BusNameVanishedCallback?, user_data: gpointer?, user_data_free_func: GLib.DestroyNotify?) -> guint` | g_bus_watch_name_on_connection | 2.26 | Like g_bus_watch_name() but takes a #GDBusConnection instead of a #GBusType. |
| bus_watch_name_on_connection_with_closures | `bus_watch_name_on_connection_with_closures(connection: DBusConnection, name: utf8, flags: BusNameWatcherFlags, name_appeared_closure: GObject.Closure?, name_vanished_closure: GObject.Closure?) -> guint` | g_bus_watch_name_on_connection_with_closures | 2.26 | Version of g_bus_watch_name_on_connection() using closures instead of callbacks for easier binding in other languages. |
| bus_watch_name_with_closures | `bus_watch_name_with_closures(bus_type: BusType, name: utf8, flags: BusNameWatcherFlags, name_appeared_closure: GObject.Closure?, name_vanished_closure: GObject.Closure?) -> guint` | g_bus_watch_name_with_closures | 2.26 | Version of g_bus_watch_name() using closures instead of callbacks for easier binding in other languages. |
| content_type_can_be_executable | `content_type_can_be_executable(type: utf8) -> gboolean` | g_content_type_can_be_executable |  | Checks if a content type can be executable. Note that for instance things like text files can be executables (i.e. scripts and batch files). |
| content_type_equals | `content_type_equals(type1: utf8, type2: utf8) -> gboolean` | g_content_type_equals |  | Compares two content types for equality. |
| content_type_from_mime_type | `content_type_from_mime_type(mime_type: utf8) -> utf8` | g_content_type_from_mime_type | 2.18 | Tries to find a content type based on the mime type name. |
| content_type_get_description | `content_type_get_description(type: utf8) -> utf8` | g_content_type_get_description |  | Gets the human readable description of the content type. |
| content_type_get_generic_icon_name | `content_type_get_generic_icon_name(type: utf8) -> utf8` | g_content_type_get_generic_icon_name | 2.34 | Gets the generic icon name for a content type. See the shared-mime-info specification for more on the generic icon name. |
| content_type_get_icon | `content_type_get_icon(type: utf8) -> Icon` | g_content_type_get_icon |  | Gets the icon for a content type. |
| content_type_get_mime_dirs | `content_type_get_mime_dirs() -> utf8` | g_content_type_get_mime_dirs | 2.60 | Get the list of directories which MIME data is loaded from. See g_content_type_set_mime_dirs() for details. |
| content_type_get_mime_type | `content_type_get_mime_type(type: utf8) -> utf8` | g_content_type_get_mime_type |  | Gets the mime type for the content type, if one is registered. |
| content_type_get_symbolic_icon | `content_type_get_symbolic_icon(type: utf8) -> Icon` | g_content_type_get_symbolic_icon | 2.34 | Gets the symbolic icon for a content type. |
| content_type_guess | `content_type_guess(filename: filename?, data: guint8?, data_size: gsize, result_uncertain: out gboolean?) -> utf8` | g_content_type_guess |  | Guesses the content type based on example data. If the function is uncertain, @result_uncertain will be set to %TRUE. Either @filename or @data may... |
| content_type_guess_for_tree | `content_type_guess_for_tree(root: File) -> utf8` | g_content_type_guess_for_tree | 2.18 | Tries to guess the type of the tree with root @root, by looking at the files it contains. The result is an array of content types, with the best gu... |
| content_type_is_a | `content_type_is_a(type: utf8, supertype: utf8) -> gboolean` | g_content_type_is_a |  | Determines if @type is a subset of @supertype. |
| content_type_is_mime_type | `content_type_is_mime_type(type: utf8, mime_type: utf8) -> gboolean` | g_content_type_is_mime_type | 2.52 | Determines if @type is a subset of @mime_type. Convenience wrapper around g_content_type_is_a(). |
| content_type_is_unknown | `content_type_is_unknown(type: utf8) -> gboolean` | g_content_type_is_unknown |  | Checks if the content type is the generic "unknown" type. On UNIX this is the "application/octet-stream" mimetype, while on win32 it is "*" and on ... |
| content_type_set_mime_dirs | `content_type_set_mime_dirs(dirs: utf8?) -> none` | g_content_type_set_mime_dirs | 2.60 | Set the list of directories used by GIO to load the MIME database. If @dirs is %NULL, the directories used are the default: - the `mime` subdirecto... |
| content_types_get_registered | `content_types_get_registered() -> GLib.List` | g_content_types_get_registered |  | Gets a list of strings containing all the registered content types known to the system. The list and its data should be freed using `g_list_free_fu... |
| dbus_address_escape_value | `dbus_address_escape_value(string: utf8) -> utf8` | g_dbus_address_escape_value | 2.36 | Escape @string so it can appear in a D-Bus address as the value part of a key-value pair. For instance, if @string is `/run/bus-for-:0`, this funct... |
| dbus_address_get_for_bus_sync | `dbus_address_get_for_bus_sync(bus_type: BusType, cancellable: Cancellable?) -> utf8 throws` | g_dbus_address_get_for_bus_sync | 2.26 | Synchronously looks up the D-Bus address for the well-known message bus instance specified by @bus_type. This may involve using various platform sp... |
| dbus_address_get_stream | `dbus_address_get_stream(address: utf8, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_dbus_address_get_stream | 2.26 | Asynchronously connects to an endpoint specified by @address and sets up the connection so it is in a state to run the client-side of the D-Bus aut... |
| dbus_address_get_stream_finish | `dbus_address_get_stream_finish(res: AsyncResult, out_guid: out utf8?) -> IOStream throws` | g_dbus_address_get_stream_finish | 2.26 | Finishes an operation started with g_dbus_address_get_stream(). A server is not required to set a GUID, so @out_guid may be set to %NULL even on su... |
| dbus_address_get_stream_sync | `dbus_address_get_stream_sync(address: utf8, out_guid: out utf8?, cancellable: Cancellable?) -> IOStream throws` | g_dbus_address_get_stream_sync | 2.26 | Synchronously connects to an endpoint specified by @address and sets up the connection so it is in a state to run the client-side of the D-Bus auth... |
| dbus_annotation_info_lookup | `dbus_annotation_info_lookup(annotations: DBusAnnotationInfo?, name: utf8) -> utf8` | g_dbus_annotation_info_lookup | 2.26 | Looks up the value of an annotation. The cost of this function is O(n) in number of annotations. |
| dbus_error_encode_gerror | `dbus_error_encode_gerror(error: GLib.Error) -> utf8` | g_dbus_error_encode_gerror | 2.26 | Creates a D-Bus error name to use for @error. If @error matches a registered error (cf. g_dbus_error_register_error()), the corresponding D-Bus err... |
| dbus_error_get_remote_error | `dbus_error_get_remote_error(error: GLib.Error) -> utf8` | g_dbus_error_get_remote_error | 2.26 | Gets the D-Bus error name used for @error, if any. This function is guaranteed to return a D-Bus error name for all #GErrors returned from function... |
| dbus_error_is_remote_error | `dbus_error_is_remote_error(error: GLib.Error) -> gboolean` | g_dbus_error_is_remote_error | 2.26 | Checks if @error represents an error received via D-Bus from a remote peer. If so, use g_dbus_error_get_remote_error() to get the name of the error. |
| dbus_error_new_for_dbus_error | `dbus_error_new_for_dbus_error(dbus_error_name: utf8, dbus_error_message: utf8) -> GLib.Error` | g_dbus_error_new_for_dbus_error | 2.26 | Creates a #GError based on the contents of @dbus_error_name and @dbus_error_message. Errors registered with g_dbus_error_register_error() will be l... |
| dbus_error_quark | `dbus_error_quark() -> GLib.Quark` | g_dbus_error_quark |  |  |
| dbus_error_register_error | `dbus_error_register_error(error_domain: GLib.Quark, error_code: gint, dbus_error_name: utf8) -> gboolean` | g_dbus_error_register_error | 2.26 | Creates an association to map between @dbus_error_name and #GErrors specified by @error_domain and @error_code. This is typically done in the routi... |
| dbus_error_register_error_domain | `dbus_error_register_error_domain(error_domain_quark_name: utf8, quark_volatile: gsize, entries: DBusErrorEntry, num_entries: guint) -> none` | g_dbus_error_register_error_domain | 2.26 | Helper function for associating a #GError error domain with D-Bus error names. While @quark_volatile has a `volatile` qualifier, this is a historic... |
| dbus_error_strip_remote_error | `dbus_error_strip_remote_error(error: GLib.Error) -> gboolean` | g_dbus_error_strip_remote_error | 2.26 | Looks for extra information in the error message used to recover the D-Bus error name and strips it if found. If stripped, the message field in @er... |
| dbus_error_unregister_error | `dbus_error_unregister_error(error_domain: GLib.Quark, error_code: gint, dbus_error_name: utf8) -> gboolean` | g_dbus_error_unregister_error | 2.26 | Destroys an association previously set up with g_dbus_error_register_error(). |
| dbus_escape_object_path | `dbus_escape_object_path(s: utf8) -> utf8` | g_dbus_escape_object_path | 2.68 | This is a language binding friendly version of g_dbus_escape_object_path_bytestring(). |
| dbus_escape_object_path_bytestring | `dbus_escape_object_path_bytestring(bytes: guint8) -> utf8` | g_dbus_escape_object_path_bytestring | 2.68 | Escapes @bytes for use in a D-Bus object path component. @bytes is an array of zero or more nonzero bytes in an unspecified encoding, followed by a... |
| dbus_generate_guid | `dbus_generate_guid() -> utf8` | g_dbus_generate_guid | 2.26 | Generate a D-Bus GUID that can be used with e.g. g_dbus_connection_new(). See the D-Bus specification regarding what strings are valid D-Bus GUIDs.... |
| dbus_gvalue_to_gvariant | `dbus_gvalue_to_gvariant(gvalue: GObject.Value, type: GLib.VariantType) -> GLib.Variant` | g_dbus_gvalue_to_gvariant | 2.30 | Converts a #GValue to a #GVariant of the type indicated by the @type parameter. The conversion is using the following rules: - `G_TYPE_STRING`: 's'... |
| dbus_gvariant_to_gvalue | `dbus_gvariant_to_gvalue(value: GLib.Variant, out_gvalue: out GObject.Value) -> none` | g_dbus_gvariant_to_gvalue | 2.30 | Converts a #GVariant to a #GValue. If @value is floating, it is consumed. The rules specified in the g_dbus_gvalue_to_gvariant() function are used ... |
| dbus_is_address | `dbus_is_address(string: utf8) -> gboolean` | g_dbus_is_address | 2.26 | Checks if @string is a D-Bus address. This doesn't check if @string is actually supported by #GDBusServer or #GDBusConnection - use g_dbus_is_suppo... |
| dbus_is_error_name | `dbus_is_error_name(string: utf8) -> gboolean` | g_dbus_is_error_name | 2.70 | Check whether @string is a valid D-Bus error name. This function returns the same result as g_dbus_is_interface_name(), because D-Bus error names a... |
| dbus_is_guid | `dbus_is_guid(string: utf8) -> gboolean` | g_dbus_is_guid | 2.26 | Checks if @string is a D-Bus GUID. See the documentation for g_dbus_generate_guid() for more information about the format of a GUID. |
| dbus_is_interface_name | `dbus_is_interface_name(string: utf8) -> gboolean` | g_dbus_is_interface_name | 2.26 | Checks if @string is a valid D-Bus interface name. |
| dbus_is_member_name | `dbus_is_member_name(string: utf8) -> gboolean` | g_dbus_is_member_name | 2.26 | Checks if @string is a valid D-Bus member (e.g. signal or method) name. |
| dbus_is_name | `dbus_is_name(string: utf8) -> gboolean` | g_dbus_is_name | 2.26 | Checks if @string is a valid D-Bus bus name (either unique or well-known). |
| dbus_is_supported_address | `dbus_is_supported_address(string: utf8) -> gboolean throws` | g_dbus_is_supported_address | 2.26 | Like g_dbus_is_address() but also checks if the library supports the transports in @string and that key/value pairs for each transport are valid. S... |
| dbus_is_unique_name | `dbus_is_unique_name(string: utf8) -> gboolean` | g_dbus_is_unique_name | 2.26 | Checks if @string is a valid D-Bus unique bus name. |
| dbus_unescape_object_path | `dbus_unescape_object_path(s: utf8) -> guint8` | g_dbus_unescape_object_path | 2.68 | Unescapes an string that was previously escaped with g_dbus_escape_object_path(). If the string is in a format that could not have been returned by... |
| dtls_client_connection_new | `dtls_client_connection_new(base_socket: DatagramBased, server_identity: SocketConnectable?) -> DtlsClientConnection throws` | g_dtls_client_connection_new | 2.48 | Creates a new #GDtlsClientConnection wrapping @base_socket which is assumed to communicate with the server identified by @server_identity. |
| dtls_server_connection_new | `dtls_server_connection_new(base_socket: DatagramBased, certificate: TlsCertificate?) -> DtlsServerConnection throws` | g_dtls_server_connection_new | 2.48 | Creates a new #GDtlsServerConnection wrapping @base_socket. |
| file_new_build_filenamev | `file_new_build_filenamev(args: filename) -> File` | g_file_new_build_filenamev | 2.78 | Constructs a #GFile from a vector of elements using the correct separator for filenames. Using this function is equivalent to calling g_build_filen... |
| file_new_for_commandline_arg | `file_new_for_commandline_arg(arg: filename) -> File` | g_file_new_for_commandline_arg |  | Creates a #GFile with the given argument from the command line. The value of @arg can be either a URI, an absolute path or a relative path resolved... |
| file_new_for_commandline_arg_and_cwd | `file_new_for_commandline_arg_and_cwd(arg: filename, cwd: filename) -> File` | g_file_new_for_commandline_arg_and_cwd | 2.36 | Creates a #GFile with the given argument from the command line. This function is similar to g_file_new_for_commandline_arg() except that it allows ... |
| file_new_for_path | `file_new_for_path(path: filename) -> File` | g_file_new_for_path |  | Constructs a #GFile for a given path. This operation never fails, but the returned object might not support any I/O operation if @path is malformed. |
| file_new_for_uri | `file_new_for_uri(uri: utf8) -> File` | g_file_new_for_uri |  | Constructs a #GFile for a given URI. This operation never fails, but the returned object might not support any I/O operation if @uri is malformed o... |
| file_new_tmp | `file_new_tmp(tmpl: filename?, iostream: out FileIOStream) -> File throws` | g_file_new_tmp | 2.32 | Opens a file in the preferred directory for temporary files (as returned by g_get_tmp_dir()) and returns a #GFile and #GFileIOStream pointing to it... |
| file_new_tmp_async | `file_new_tmp_async(tmpl: filename?, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_new_tmp_async | 2.74 | Asynchronously opens a file in the preferred directory for temporary files (as returned by g_get_tmp_dir()) as g_file_new_tmp(). @tmpl should be a ... |
| file_new_tmp_dir_async | `file_new_tmp_dir_async(tmpl: filename?, io_priority: gint, cancellable: Cancellable?, callback: AsyncReadyCallback?, user_data: gpointer?) -> none` | g_file_new_tmp_dir_async | 2.74 | Asynchronously creates a directory in the preferred directory for temporary files (as returned by g_get_tmp_dir()) as g_dir_make_tmp(). @tmpl shoul... |
| file_new_tmp_dir_finish | `file_new_tmp_dir_finish(result: AsyncResult) -> File throws` | g_file_new_tmp_dir_finish | 2.74 | Finishes a temporary directory creation started by g_file_new_tmp_dir_async(). |
| file_new_tmp_finish | `file_new_tmp_finish(result: AsyncResult, iostream: out FileIOStream) -> File throws` | g_file_new_tmp_finish | 2.74 | Finishes a temporary file creation started by g_file_new_tmp_async(). |
| file_parse_name | `file_parse_name(parse_name: utf8) -> File` | g_file_parse_name |  | Constructs a #GFile with the given @parse_name (i.e. something given by g_file_get_parse_name()). This operation never fails, but the returned obje... |
| icon_deserialize | `icon_deserialize(value: GLib.Variant) -> Icon` | g_icon_deserialize | 2.38 | Deserializes a #GIcon previously serialized using g_icon_serialize(). |
| icon_new_for_string | `icon_new_for_string(str: utf8) -> Icon throws` | g_icon_new_for_string | 2.20 | Generate a #GIcon instance from @str. This function can fail if @str is not valid - see g_icon_to_string() for discussion. If your application or l... |
| initable_newv | `initable_newv(object_type: GType, n_parameters: guint, parameters: GObject.Parameter, cancellable: Cancellable?) -> GObject.Object throws` | g_initable_newv | 2.22 | Helper function for constructing #GInitable object. This is similar to g_object_newv() but also initializes the object and returns %NULL, setting a... |
| io_error_from_errno | `io_error_from_errno(err_no: gint) -> IOErrorEnum` | g_io_error_from_errno |  | Converts `errno.h` error codes into GIO error codes. The fallback value %G_IO_ERROR_FAILED is returned for error codes not currently handled (but n... |
| io_error_from_file_error | `io_error_from_file_error(file_error: GLib.FileError) -> IOErrorEnum` | g_io_error_from_file_error | 2.74 | Converts #GFileError error codes into GIO error codes. |
| io_error_quark | `io_error_quark() -> GLib.Quark` | g_io_error_quark |  | Gets the GIO Error Quark. |
| io_extension_point_implement | `io_extension_point_implement(extension_point_name: utf8, type: GType, extension_name: utf8, priority: gint) -> IOExtension` | g_io_extension_point_implement |  | Registers @type as extension for the extension point with name @extension_point_name. If @type has already been registered as an extension for this... |
| io_extension_point_lookup | `io_extension_point_lookup(name: utf8) -> IOExtensionPoint` | g_io_extension_point_lookup |  | Looks up an existing extension point. |
| io_extension_point_register | `io_extension_point_register(name: utf8) -> IOExtensionPoint` | g_io_extension_point_register |  | Registers an extension point. |
| io_modules_load_all_in_directory | `io_modules_load_all_in_directory(dirname: filename) -> GLib.List` | g_io_modules_load_all_in_directory |  | Loads all the modules in the specified directory. If don't require all modules to be initialized (and thus registering all gtypes) then you can use... |
| io_modules_load_all_in_directory_with_scope | `io_modules_load_all_in_directory_with_scope(dirname: filename, scope: IOModuleScope) -> GLib.List` | g_io_modules_load_all_in_directory_with_scope | 2.30 | Loads all the modules in the specified directory. If don't require all modules to be initialized (and thus registering all gtypes) then you can use... |
| io_modules_scan_all_in_directory | `io_modules_scan_all_in_directory(dirname: filename) -> none` | g_io_modules_scan_all_in_directory | 2.24 | Scans all the modules in the specified directory, ensuring that any extension point implemented by a module is registered. This may not actually lo... |
| io_modules_scan_all_in_directory_with_scope | `io_modules_scan_all_in_directory_with_scope(dirname: filename, scope: IOModuleScope) -> none` | g_io_modules_scan_all_in_directory_with_scope | 2.30 | Scans all the modules in the specified directory, ensuring that any extension point implemented by a module is registered. This may not actually lo... |
| io_scheduler_cancel_all_jobs | `io_scheduler_cancel_all_jobs() -> none` | g_io_scheduler_cancel_all_jobs |  | Cancels all cancellable I/O jobs. A job is cancellable if a #GCancellable was passed into g_io_scheduler_push_job(). |
| io_scheduler_push_job | `io_scheduler_push_job(job_func: IOSchedulerJobFunc, user_data: gpointer?, notify: GLib.DestroyNotify?, io_priority: gint, cancellable: Cancellable?) -> none` | g_io_scheduler_push_job |  | Schedules the I/O job to run in another thread. @notify will be called on @user_data after @job_func has returned, regardless whether the job was c... |
| keyfile_settings_backend_new | `keyfile_settings_backend_new(filename: utf8, root_path: utf8, root_group: utf8?) -> SettingsBackend` | g_keyfile_settings_backend_new |  | Creates a keyfile-backed #GSettingsBackend. The filename of the keyfile to use is given by @filename. All settings read to or written from the back... |
| memory_monitor_dup_default | `memory_monitor_dup_default() -> MemoryMonitor` | g_memory_monitor_dup_default | 2.64 | Gets a reference to the default #GMemoryMonitor for the system. |
| memory_settings_backend_new | `memory_settings_backend_new() -> SettingsBackend` | g_memory_settings_backend_new | 2.28 | Creates a memory-backed #GSettingsBackend. This backend allows changes to settings, but does not write them to any backing storage, so the next tim... |
| network_monitor_get_default | `network_monitor_get_default() -> NetworkMonitor` | g_network_monitor_get_default | 2.32 | Gets the default #GNetworkMonitor for the system. |
| networking_init | `networking_init() -> none` | g_networking_init | 2.36 | Initializes the platform networking libraries (eg, on Windows, this calls WSAStartup()). GLib will call this itself if it is needed, so you only ne... |
| null_settings_backend_new | `null_settings_backend_new() -> SettingsBackend` | g_null_settings_backend_new | 2.28 | Creates a readonly #GSettingsBackend. This backend does not allow changes to settings, so all settings will always have their default values. |
| pollable_source_new | `pollable_source_new(pollable_stream: GObject.Object) -> GLib.Source` | g_pollable_source_new | 2.28 | Utility method for #GPollableInputStream and #GPollableOutputStream implementations. Creates a new #GSource that expects a callback of type #GPolla... |
| pollable_source_new_full | `pollable_source_new_full(pollable_stream: GObject.Object, child_source: GLib.Source?, cancellable: Cancellable?) -> GLib.Source` | g_pollable_source_new_full | 2.34 | Utility method for #GPollableInputStream and #GPollableOutputStream implementations. Creates a new #GSource, as with g_pollable_source_new(), but a... |
| pollable_stream_read | `pollable_stream_read(stream: InputStream, buffer: guint8, count: gsize, blocking: gboolean, cancellable: Cancellable?) -> gssize throws` | g_pollable_stream_read | 2.34 | Tries to read from @stream, as with g_input_stream_read() (if @blocking is %TRUE) or g_pollable_input_stream_read_nonblocking() (if @blocking is %F... |
| pollable_stream_write | `pollable_stream_write(stream: OutputStream, buffer: guint8, count: gsize, blocking: gboolean, cancellable: Cancellable?) -> gssize throws` | g_pollable_stream_write | 2.34 | Tries to write to @stream, as with g_output_stream_write() (if @blocking is %TRUE) or g_pollable_output_stream_write_nonblocking() (if @blocking is... |
| pollable_stream_write_all | `pollable_stream_write_all(stream: OutputStream, buffer: guint8, count: gsize, blocking: gboolean, bytes_written: out gsize, cancellable: Cancellable?) -> gboolean throws` | g_pollable_stream_write_all | 2.34 | Tries to write @count bytes to @stream, as with g_output_stream_write_all(), but using g_pollable_stream_write() rather than g_output_stream_write(... |
| power_profile_monitor_dup_default | `power_profile_monitor_dup_default() -> PowerProfileMonitor` | g_power_profile_monitor_dup_default | 2.70 | Gets a reference to the default #GPowerProfileMonitor for the system. |
| proxy_get_default_for_protocol | `proxy_get_default_for_protocol(protocol: utf8) -> Proxy` | g_proxy_get_default_for_protocol | 2.26 | Find the `gio-proxy` extension point for a proxy implementation that supports the specified protocol. |
| proxy_resolver_get_default | `proxy_resolver_get_default() -> ProxyResolver` | g_proxy_resolver_get_default | 2.26 | Gets the default #GProxyResolver for the system. |
| resolver_error_quark | `resolver_error_quark() -> GLib.Quark` | g_resolver_error_quark | 2.22 | Gets the #GResolver Error Quark. |
| resource_error_quark | `resource_error_quark() -> GLib.Quark` | g_resource_error_quark | 2.32 | Gets the #GResource Error Quark. |
| resource_load | `resource_load(filename: filename) -> Resource throws` | g_resource_load | 2.32 | Loads a binary resource bundle and creates a #GResource representation of it, allowing you to query it for data. If you want to use this resource i... |
| resources_enumerate_children | `resources_enumerate_children(path: utf8, lookup_flags: ResourceLookupFlags) -> utf8 throws` | g_resources_enumerate_children | 2.32 | Returns all the names of children at the specified @path in the set of globally registered resources. The return result is a %NULL terminated list ... |
| resources_get_info | `resources_get_info(path: utf8, lookup_flags: ResourceLookupFlags, size: out gsize?, flags: out guint32?) -> gboolean throws` | g_resources_get_info | 2.32 | Looks for a file at the specified @path in the set of globally registered resources and if found returns information about it. @lookup_flags contro... |
| resources_lookup_data | `resources_lookup_data(path: utf8, lookup_flags: ResourceLookupFlags) -> GLib.Bytes throws` | g_resources_lookup_data | 2.32 | Looks for a file at the specified @path in the set of globally registered resources and returns a #GBytes that lets you directly access the data in... |
| resources_open_stream | `resources_open_stream(path: utf8, lookup_flags: ResourceLookupFlags) -> InputStream throws` | g_resources_open_stream | 2.32 | Looks for a file at the specified @path in the set of globally registered resources and returns a #GInputStream that lets you read the data. @looku... |
| resources_register | `resources_register(resource: Resource) -> none` | g_resources_register | 2.32 | Registers the resource with the process-global set of resources. Once a resource is registered the files in it can be accessed with the global reso... |
| resources_unregister | `resources_unregister(resource: Resource) -> none` | g_resources_unregister | 2.32 | Unregisters the resource from the process-global set of resources. |
| settings_schema_source_get_default | `settings_schema_source_get_default() -> SettingsSchemaSource` | g_settings_schema_source_get_default | 2.32 | Gets the default system schema source. This function is not required for normal uses of #GSettings but it may be useful to authors of plugin manage... |
| simple_async_report_error_in_idle | `simple_async_report_error_in_idle(object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, domain: GLib.Quark, code: gint, format: utf8, ...: void) -> none` | g_simple_async_report_error_in_idle |  | Reports an error in an asynchronous function in an idle function by directly setting the contents of the #GAsyncResult with the given error informa... |
| simple_async_report_gerror_in_idle | `simple_async_report_gerror_in_idle(object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, error: GLib.Error) -> none` | g_simple_async_report_gerror_in_idle |  | Reports an error in an idle function. Similar to g_simple_async_report_error_in_idle(), but takes a #GError rather than building a new one. |
| simple_async_report_take_gerror_in_idle | `simple_async_report_take_gerror_in_idle(object: GObject.Object?, callback: AsyncReadyCallback?, user_data: gpointer?, error: GLib.Error) -> none` | g_simple_async_report_take_gerror_in_idle | 2.28 | Reports an error in an idle function. Similar to g_simple_async_report_gerror_in_idle(), but takes over the caller's ownership of @error, so the ca... |
| srv_target_list_sort | `srv_target_list_sort(targets: GLib.List) -> GLib.List` | g_srv_target_list_sort | 2.22 | Sorts @targets in place according to the algorithm in RFC 2782. |
| tls_backend_get_default | `tls_backend_get_default() -> TlsBackend` | g_tls_backend_get_default | 2.28 | Gets the default #GTlsBackend for the system. |
| tls_channel_binding_error_quark | `tls_channel_binding_error_quark() -> GLib.Quark` | g_tls_channel_binding_error_quark | 2.66 | Gets the TLS channel binding error quark. |
| tls_client_connection_new | `tls_client_connection_new(base_io_stream: IOStream, server_identity: SocketConnectable?) -> TlsClientConnection throws` | g_tls_client_connection_new | 2.28 | Creates a new #GTlsClientConnection wrapping @base_io_stream (which must have pollable input and output streams) which is assumed to communicate wi... |
| tls_error_quark | `tls_error_quark() -> GLib.Quark` | g_tls_error_quark | 2.28 | Gets the TLS error quark. |
| tls_file_database_new | `tls_file_database_new(anchors: filename) -> TlsFileDatabase throws` | g_tls_file_database_new | 2.30 | Creates a new #GTlsFileDatabase which uses anchor certificate authorities in @anchors to verify certificate chains. The certificates in @anchors mu... |
| tls_server_connection_new | `tls_server_connection_new(base_io_stream: IOStream, certificate: TlsCertificate?) -> TlsServerConnection throws` | g_tls_server_connection_new | 2.28 | Creates a new #GTlsServerConnection wrapping @base_io_stream (which must have pollable input and output streams). See the documentation for #GTlsCo... |
| unix_is_mount_path_system_internal | `unix_is_mount_path_system_internal(mount_path: filename) -> gboolean` | g_unix_is_mount_path_system_internal |  | Determines if @mount_path is considered an implementation of the OS. This is primarily used for hiding mountable and mounted volumes that only are ... |
| unix_is_system_device_path | `unix_is_system_device_path(device_path: utf8) -> gboolean` | g_unix_is_system_device_path | 2.56 | Determines if @device_path is considered a block device path which is only used in implementation of the OS. This is primarily used for hiding moun... |
| unix_is_system_fs_type | `unix_is_system_fs_type(fs_type: utf8) -> gboolean` | g_unix_is_system_fs_type | 2.56 | Determines if @fs_type is considered a type of file system which is only used in implementation of the OS. This is primarily used for hiding mounte... |
| unix_mount_at | `unix_mount_at(mount_path: filename, time_read: out guint64?) -> UnixMountEntry` | g_unix_mount_at |  | Gets a #GUnixMountEntry for a given mount path. If @time_read is set, it will be filled with a unix timestamp for checking if the mounts have chang... |
| unix_mount_compare | `unix_mount_compare(mount1: UnixMountEntry, mount2: UnixMountEntry) -> gint` | g_unix_mount_compare |  | Compares two unix mounts. |
| unix_mount_copy | `unix_mount_copy(mount_entry: UnixMountEntry) -> UnixMountEntry` | g_unix_mount_copy | 2.54 | Makes a copy of @mount_entry. |
| unix_mount_for | `unix_mount_for(file_path: filename, time_read: out guint64?) -> UnixMountEntry` | g_unix_mount_for | 2.52 | Gets a #GUnixMountEntry for a given file path. If @time_read is set, it will be filled with a unix timestamp for checking if the mounts have change... |
| unix_mount_free | `unix_mount_free(mount_entry: UnixMountEntry) -> none` | g_unix_mount_free |  | Frees a unix mount. |
| unix_mount_get_device_path | `unix_mount_get_device_path(mount_entry: UnixMountEntry) -> filename` | g_unix_mount_get_device_path |  | Gets the device path for a unix mount. |
| unix_mount_get_fs_type | `unix_mount_get_fs_type(mount_entry: UnixMountEntry) -> utf8` | g_unix_mount_get_fs_type |  | Gets the filesystem type for the unix mount. |
| unix_mount_get_mount_path | `unix_mount_get_mount_path(mount_entry: UnixMountEntry) -> filename` | g_unix_mount_get_mount_path |  | Gets the mount path for a unix mount. |
| unix_mount_get_options | `unix_mount_get_options(mount_entry: UnixMountEntry) -> utf8` | g_unix_mount_get_options | 2.58 | Gets a comma-separated list of mount options for the unix mount. For example, `rw,relatime,seclabel,data=ordered`. This is similar to g_unix_mount_... |
| unix_mount_get_root_path | `unix_mount_get_root_path(mount_entry: UnixMountEntry) -> utf8` | g_unix_mount_get_root_path | 2.60 | Gets the root of the mount within the filesystem. This is useful e.g. for mounts created by bind operation, or btrfs subvolumes. For example, the r... |
| unix_mount_guess_can_eject | `unix_mount_guess_can_eject(mount_entry: UnixMountEntry) -> gboolean` | g_unix_mount_guess_can_eject |  | Guesses whether a Unix mount can be ejected. |
| unix_mount_guess_icon | `unix_mount_guess_icon(mount_entry: UnixMountEntry) -> Icon` | g_unix_mount_guess_icon |  | Guesses the icon of a Unix mount. |
| unix_mount_guess_name | `unix_mount_guess_name(mount_entry: UnixMountEntry) -> utf8` | g_unix_mount_guess_name |  | Guesses the name of a Unix mount. The result is a translated string. |
| unix_mount_guess_should_display | `unix_mount_guess_should_display(mount_entry: UnixMountEntry) -> gboolean` | g_unix_mount_guess_should_display |  | Guesses whether a Unix mount should be displayed in the UI. |
| unix_mount_guess_symbolic_icon | `unix_mount_guess_symbolic_icon(mount_entry: UnixMountEntry) -> Icon` | g_unix_mount_guess_symbolic_icon | 2.34 | Guesses the symbolic icon of a Unix mount. |
| unix_mount_is_readonly | `unix_mount_is_readonly(mount_entry: UnixMountEntry) -> gboolean` | g_unix_mount_is_readonly |  | Checks if a unix mount is mounted read only. |
| unix_mount_is_system_internal | `unix_mount_is_system_internal(mount_entry: UnixMountEntry) -> gboolean` | g_unix_mount_is_system_internal |  | Checks if a Unix mount is a system mount. This is the Boolean OR of g_unix_is_system_fs_type(), g_unix_is_system_device_path() and g_unix_is_mount_... |
| unix_mount_point_at | `unix_mount_point_at(mount_path: filename, time_read: out guint64?) -> UnixMountPoint` | g_unix_mount_point_at | 2.66 | Gets a #GUnixMountPoint for a given mount path. If @time_read is set, it will be filled with a unix timestamp for checking if the mount points have... |
| unix_mount_points_changed_since | `unix_mount_points_changed_since(time: guint64) -> gboolean` | g_unix_mount_points_changed_since |  | Checks if the unix mount points have changed since a given unix time. |
| unix_mount_points_get | `unix_mount_points_get(time_read: out guint64?) -> GLib.List` | g_unix_mount_points_get |  | Gets a #GList of #GUnixMountPoint containing the unix mount points. If @time_read is set, it will be filled with the mount timestamp, allowing for ... |
| unix_mounts_changed_since | `unix_mounts_changed_since(time: guint64) -> gboolean` | g_unix_mounts_changed_since |  | Checks if the unix mounts have changed since a given unix time. |
| unix_mounts_get | `unix_mounts_get(time_read: out guint64?) -> GLib.List` | g_unix_mounts_get |  | Gets a #GList of #GUnixMountEntry containing the unix mounts. If @time_read is set, it will be filled with the mount timestamp, allowing for checki... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| AsyncReadyCallback | `AsyncReadyCallback(source_object: GObject.Object?, res: AsyncResult, data: gpointer?) -> none` |  |  | Type definition for a function that will be called back when an asynchronous operation within GIO has been completed. #GAsyncReadyCallback callback... |
| BusAcquiredCallback | `BusAcquiredCallback(connection: DBusConnection, name: utf8, user_data: gpointer?) -> none` |  | 2.26 | Invoked when a connection to a message bus has been obtained. |
| BusNameAcquiredCallback | `BusNameAcquiredCallback(connection: DBusConnection, name: utf8, user_data: gpointer?) -> none` |  | 2.26 | Invoked when the name is acquired. |
| BusNameAppearedCallback | `BusNameAppearedCallback(connection: DBusConnection, name: utf8, name_owner: utf8, user_data: gpointer?) -> none` |  | 2.26 | Invoked when the name being watched is known to have to have an owner. |
| BusNameLostCallback | `BusNameLostCallback(connection: DBusConnection, name: utf8, user_data: gpointer?) -> none` |  | 2.26 | Invoked when the name is lost or @connection has been closed. |
| BusNameVanishedCallback | `BusNameVanishedCallback(connection: DBusConnection, name: utf8, user_data: gpointer?) -> none` |  | 2.26 | Invoked when the name being watched is known not to have to have an owner. This is also invoked when the #GDBusConnection on which the watch was es... |
| CancellableSourceFunc | `CancellableSourceFunc(cancellable: Cancellable?, data: gpointer?) -> gboolean` |  | 2.28 | This is the function type of the callback used for the #GSource returned by g_cancellable_source_new(). |
| DatagramBasedSourceFunc | `DatagramBasedSourceFunc(datagram_based: DatagramBased, condition: GLib.IOCondition, data: gpointer?) -> gboolean` |  | 2.48 | This is the function type of the callback used for the #GSource returned by g_datagram_based_create_source(). |
| DBusInterfaceGetPropertyFunc | `DBusInterfaceGetPropertyFunc(connection: DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, property_name: utf8, error: GLib.Error, user_data: gpointer?) -> GLib.Variant` |  | 2.26 | The type of the @get_property function in #GDBusInterfaceVTable. |
| DBusInterfaceMethodCallFunc | `DBusInterfaceMethodCallFunc(connection: DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, method_name: utf8, parameters: GLib.Variant, invocation: DBusMethodInvocation, user_data: gpointer?) -> none` |  | 2.26 | The type of the @method_call function in #GDBusInterfaceVTable. |
| DBusInterfaceSetPropertyFunc | `DBusInterfaceSetPropertyFunc(connection: DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, property_name: utf8, value: GLib.Variant, error: GLib.Error, user_data: gpointer?) -> gboolean` |  | 2.26 | The type of the @set_property function in #GDBusInterfaceVTable. |
| DBusMessageFilterFunction | `DBusMessageFilterFunction(connection: DBusConnection, message: DBusMessage, incoming: gboolean, user_data: gpointer?) -> DBusMessage` |  | 2.26 | Signature for function used in g_dbus_connection_add_filter(). A filter function is passed a #GDBusMessage and expected to return a #GDBusMessage t... |
| DBusProxyTypeFunc | `DBusProxyTypeFunc(manager: DBusObjectManagerClient, object_path: utf8, interface_name: utf8?, data: gpointer?) -> GType` |  | 2.30 | Function signature for a function used to determine the #GType to use for an interface proxy (if @interface_name is not %NULL) or object proxy (if ... |
| DBusSignalCallback | `DBusSignalCallback(connection: DBusConnection, sender_name: utf8?, object_path: utf8, interface_name: utf8, signal_name: utf8, parameters: GLib.Variant, user_data: gpointer?) -> none` |  | 2.26 | Signature for callback function used in g_dbus_connection_signal_subscribe(). |
| DBusSubtreeDispatchFunc | `DBusSubtreeDispatchFunc(connection: DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, node: utf8, out_user_data: gpointer, user_data: gpointer?) -> DBusInterfaceVTable` |  | 2.26 | The type of the @dispatch function in #GDBusSubtreeVTable. Subtrees are flat. @node, if non-%NULL, is always exactly one segment of the object path... |
| DBusSubtreeEnumerateFunc | `DBusSubtreeEnumerateFunc(connection: DBusConnection, sender: utf8, object_path: utf8, user_data: gpointer?) -> utf8` |  | 2.26 | The type of the @enumerate function in #GDBusSubtreeVTable. This function is called when generating introspection data and also when preparing to d... |
| DBusSubtreeIntrospectFunc | `DBusSubtreeIntrospectFunc(connection: DBusConnection, sender: utf8, object_path: utf8, node: utf8, user_data: gpointer?) -> DBusInterfaceInfo` |  | 2.26 | The type of the @introspect function in #GDBusSubtreeVTable. Subtrees are flat. @node, if non-%NULL, is always exactly one segment of the object pa... |
| DesktopAppLaunchCallback | `DesktopAppLaunchCallback(appinfo: DesktopAppInfo, pid: GLib.Pid, user_data: gpointer?) -> none` |  |  | During invocation, g_desktop_app_info_launch_uris_as_manager() may create one or more child processes. This callback is invoked once for each, prov... |
| FileMeasureProgressCallback | `FileMeasureProgressCallback(reporting: gboolean, current_size: guint64, num_dirs: guint64, num_files: guint64, data: gpointer?) -> none` |  | 2.38 | This callback type is used by g_file_measure_disk_usage() to make periodic progress reports when measuring the amount of disk spaced used by a dire... |
| FileProgressCallback | `FileProgressCallback(current_num_bytes: gint64, total_num_bytes: gint64, data: gpointer?) -> none` |  |  | When doing file operations that may take a while, such as moving a file or copying a file, a progress callback is used to pass how far along that o... |
| FileReadMoreCallback | `FileReadMoreCallback(file_contents: utf8, file_size: gint64, callback_data: gpointer?) -> gboolean` |  |  | When loading the partial contents of a file with g_file_load_partial_contents_async(), it may become necessary to determine if any more data from t... |
| IOSchedulerJobFunc | `IOSchedulerJobFunc(job: IOSchedulerJob, cancellable: Cancellable?, data: gpointer?) -> gboolean` |  |  | I/O Job function. Long-running jobs should periodically check the @cancellable to see if they have been cancelled. |
| PollableSourceFunc | `PollableSourceFunc(pollable_stream: GObject.Object, data: gpointer?) -> gboolean` |  | 2.28 | This is the function type of the callback used for the #GSource returned by g_pollable_input_stream_create_source() and g_pollable_output_stream_cr... |
| ReallocFunc | `ReallocFunc(data: gpointer?, size: gsize) -> gpointer` |  |  | Changes the size of the memory block pointed to by @data to @size bytes. The function should have the same semantics as realloc(). |
| SettingsBindGetMapping | `SettingsBindGetMapping(value: GObject.Value, variant: GLib.Variant, user_data: gpointer?) -> gboolean` |  |  | The type for the function that is used to convert from #GSettings to an object property. The @value is already initialized to hold values of the ap... |
| SettingsBindSetMapping | `SettingsBindSetMapping(value: GObject.Value, expected_type: GLib.VariantType, user_data: gpointer?) -> GLib.Variant` |  |  | The type for the function that is used to convert an object property value to a #GVariant for storing it in #GSettings. |
| SettingsGetMapping | `SettingsGetMapping(value: GLib.Variant, result: out gpointer?, user_data: gpointer?) -> gboolean` |  |  | The type of the function that is used to convert from a value stored in a #GSettings to a value that is useful to the application. If the value is ... |
| SimpleAsyncThreadFunc | `SimpleAsyncThreadFunc(res: SimpleAsyncResult, object: GObject.Object, cancellable: Cancellable?) -> none` |  |  | Simple thread function that runs an asynchronous operation and checks for cancellation. |
| SocketSourceFunc | `SocketSourceFunc(socket: Socket, condition: GLib.IOCondition, data: gpointer?) -> gboolean` |  | 2.22 | This is the function type of the callback used for the #GSource returned by g_socket_create_source(). |
| TaskThreadFunc | `TaskThreadFunc(task: Task, source_object: GObject.Object, task_data: gpointer?, cancellable: Cancellable?) -> none` |  | 2.36 | The prototype for a task function to be run in a thread via g_task_run_in_thread() or g_task_run_in_thread_sync(). If the return-on-cancel flag is ... |
| VfsFileLookupFunc | `VfsFileLookupFunc(vfs: Vfs, identifier: utf8, user_data: gpointer?) -> File` |  | 2.50 | This function type is used by g_vfs_register_uri_scheme() to make it possible for a client to associate an URI scheme to a different #GFile impleme... |

## Constants

| Name | Type |
| --- | --- |
| DBUS_METHOD_INVOCATION_HANDLED | gboolean |
| DBUS_METHOD_INVOCATION_UNHANDLED | gboolean |
| DEBUG_CONTROLLER_EXTENSION_POINT_NAME | utf8 |
| DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME | utf8 |
| DRIVE_IDENTIFIER_KIND_UNIX_DEVICE | utf8 |
| FILE_ATTRIBUTE_ACCESS_CAN_DELETE | utf8 |
| FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE | utf8 |
| FILE_ATTRIBUTE_ACCESS_CAN_READ | utf8 |
| FILE_ATTRIBUTE_ACCESS_CAN_RENAME | utf8 |
| FILE_ATTRIBUTE_ACCESS_CAN_TRASH | utf8 |
| FILE_ATTRIBUTE_ACCESS_CAN_WRITE | utf8 |
| FILE_ATTRIBUTE_DOS_IS_ARCHIVE | utf8 |
| FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT | utf8 |
| FILE_ATTRIBUTE_DOS_IS_SYSTEM | utf8 |
| FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG | utf8 |
| FILE_ATTRIBUTE_ETAG_VALUE | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_FREE | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_READONLY | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_REMOTE | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_SIZE | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_TYPE | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW | utf8 |
| FILE_ATTRIBUTE_FILESYSTEM_USED | utf8 |
| FILE_ATTRIBUTE_GVFS_BACKEND | utf8 |
| FILE_ATTRIBUTE_ID_FILE | utf8 |
| FILE_ATTRIBUTE_ID_FILESYSTEM | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_START | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE | utf8 |
| FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE | utf8 |
| FILE_ATTRIBUTE_OWNER_GROUP | utf8 |
| FILE_ATTRIBUTE_OWNER_USER | utf8 |
| FILE_ATTRIBUTE_OWNER_USER_REAL | utf8 |
| FILE_ATTRIBUTE_PREVIEW_ICON | utf8 |
| FILE_ATTRIBUTE_RECENT_MODIFIED | utf8 |
| FILE_ATTRIBUTE_SELINUX_CONTEXT | utf8 |
| FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE | utf8 |
| FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE | utf8 |
| FILE_ATTRIBUTE_STANDARD_COPY_NAME | utf8 |
| FILE_ATTRIBUTE_STANDARD_DESCRIPTION | utf8 |
| FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME | utf8 |
| FILE_ATTRIBUTE_STANDARD_EDIT_NAME | utf8 |
| FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE | utf8 |
| FILE_ATTRIBUTE_STANDARD_ICON | utf8 |
| FILE_ATTRIBUTE_STANDARD_IS_BACKUP | utf8 |
| FILE_ATTRIBUTE_STANDARD_IS_HIDDEN | utf8 |
| FILE_ATTRIBUTE_STANDARD_IS_SYMLINK | utf8 |
| FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL | utf8 |
| FILE_ATTRIBUTE_STANDARD_IS_VOLATILE | utf8 |
| FILE_ATTRIBUTE_STANDARD_NAME | utf8 |
| FILE_ATTRIBUTE_STANDARD_SIZE | utf8 |
| FILE_ATTRIBUTE_STANDARD_SORT_ORDER | utf8 |
| FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON | utf8 |
| FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET | utf8 |
| FILE_ATTRIBUTE_STANDARD_TARGET_URI | utf8 |
| FILE_ATTRIBUTE_STANDARD_TYPE | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_IS_VALID | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_PATH | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAILING_FAILED | utf8 |
| FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL | utf8 |
| FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE | utf8 |
| FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE | utf8 |
| FILE_ATTRIBUTE_TIME_ACCESS | utf8 |
| FILE_ATTRIBUTE_TIME_ACCESS_NSEC | utf8 |
| FILE_ATTRIBUTE_TIME_ACCESS_USEC | utf8 |
| FILE_ATTRIBUTE_TIME_CHANGED | utf8 |
| FILE_ATTRIBUTE_TIME_CHANGED_NSEC | utf8 |
| FILE_ATTRIBUTE_TIME_CHANGED_USEC | utf8 |
| FILE_ATTRIBUTE_TIME_CREATED | utf8 |
| FILE_ATTRIBUTE_TIME_CREATED_NSEC | utf8 |
| FILE_ATTRIBUTE_TIME_CREATED_USEC | utf8 |
| FILE_ATTRIBUTE_TIME_MODIFIED | utf8 |
| FILE_ATTRIBUTE_TIME_MODIFIED_NSEC | utf8 |
| FILE_ATTRIBUTE_TIME_MODIFIED_USEC | utf8 |
| FILE_ATTRIBUTE_TRASH_DELETION_DATE | utf8 |
| FILE_ATTRIBUTE_TRASH_ITEM_COUNT | utf8 |
| FILE_ATTRIBUTE_TRASH_ORIG_PATH | utf8 |
| FILE_ATTRIBUTE_UNIX_BLOCK_SIZE | utf8 |
| FILE_ATTRIBUTE_UNIX_BLOCKS | utf8 |
| FILE_ATTRIBUTE_UNIX_DEVICE | utf8 |
| FILE_ATTRIBUTE_UNIX_GID | utf8 |
| FILE_ATTRIBUTE_UNIX_INODE | utf8 |
| FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT | utf8 |
| FILE_ATTRIBUTE_UNIX_MODE | utf8 |
| FILE_ATTRIBUTE_UNIX_NLINK | utf8 |
| FILE_ATTRIBUTE_UNIX_RDEV | utf8 |
| FILE_ATTRIBUTE_UNIX_UID | utf8 |
| MEMORY_MONITOR_EXTENSION_POINT_NAME | utf8 |
| MENU_ATTRIBUTE_ACTION | utf8 |
| MENU_ATTRIBUTE_ACTION_NAMESPACE | utf8 |
| MENU_ATTRIBUTE_ICON | utf8 |
| MENU_ATTRIBUTE_LABEL | utf8 |
| MENU_ATTRIBUTE_TARGET | utf8 |
| MENU_EXPORTER_MAX_SECTION_SIZE | gint |
| MENU_LINK_SECTION | utf8 |
| MENU_LINK_SUBMENU | utf8 |
| NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME | utf8 |
| NETWORK_MONITOR_EXTENSION_POINT_NAME | utf8 |
| POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME | utf8 |
| PROXY_EXTENSION_POINT_NAME | utf8 |
| PROXY_RESOLVER_EXTENSION_POINT_NAME | utf8 |
| SETTINGS_BACKEND_EXTENSION_POINT_NAME | utf8 |
| TLS_BACKEND_EXTENSION_POINT_NAME | utf8 |
| TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT | utf8 |
| TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER | utf8 |
| VFS_EXTENSION_POINT_NAME | utf8 |
| VOLUME_IDENTIFIER_KIND_CLASS | utf8 |
| VOLUME_IDENTIFIER_KIND_HAL_UDI | utf8 |
| VOLUME_IDENTIFIER_KIND_LABEL | utf8 |
| VOLUME_IDENTIFIER_KIND_NFS_MOUNT | utf8 |
| VOLUME_IDENTIFIER_KIND_UNIX_DEVICE | utf8 |
| VOLUME_IDENTIFIER_KIND_UUID | utf8 |
| VOLUME_MONITOR_EXTENSION_POINT_NAME | utf8 |

