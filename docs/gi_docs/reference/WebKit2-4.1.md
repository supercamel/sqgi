# WebKit2 4.1

SQGI import: `import("WebKit2", "4.1")`

Packages: `webkit2gtk-4.1`
Includes: `Gtk-3.0`, `JavaScriptCore-4.1`, `Soup-3.0`
Libraries: `libwebkit2gtk-4.1.so.0`, `libjavascriptcoregtk-4.1.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 52 |
| Interfaces | 1 |
| Records | 128 |
| Unions | 0 |
| Enums | 41 |
| Flags | 7 |
| Functions | 19 |
| Callbacks | 1 |
| Constants | 12 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AuthenticationRequest | GObject.Object | 0 | 2 | 14 | Represents an authentication request. Whenever a client attempts to load a page protected by HTTP authentication, credentials will need to be provi... |
| AutomationSession | GObject.Object | 0 | 2 | 3 | Automation Session. WebKitAutomationSession represents an automation session of a WebKitWebContext. When a new session is requested, a WebKitAutoma... |
| BackForwardList | GObject.Object | 0 | 1 | 9 | List of visited pages. WebKitBackForwardList maintains a list of visited pages used to navigate to recent pages. Items are inserted in the list in ... |
| BackForwardListItem | GObject.InitiallyUnowned | 0 | 0 | 3 | One item of the #WebKitBackForwardList. A history item is part of the #WebKitBackForwardList and consists out of a title and a URI. |
| ClipboardPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for reading clipboard contents. WebKitClipboardPermissionRequest represents a request for permission to decide whether WebKit ... |
| ColorChooserRequest | GObject.Object | 0 | 1 | 5 | A request to open a color chooser. Whenever the user interacts with an <input type='color' /> HTML element, WebKit will need to show a dialog to ch... |
| ContextMenu | GObject.Object | 0 | 0 | 17 | Represents the context menu in a #WebKitWebView. #WebKitContextMenu represents a context menu containing #WebKitContextMenuItem<!-- -->s in a #WebK... |
| ContextMenuItem | GObject.InitiallyUnowned | 0 | 0 | 14 | One item of a #WebKitContextMenu. The #WebKitContextMenu is composed of #WebKitContextMenuItem<!-- -->s. These items can be created from a #GtkActi... |
| CookieManager | GObject.Object | 0 | 1 | 18 | Defines how to handle cookies in a #WebKitWebContext. The WebKitCookieManager defines how to set up and handle cookies. You can get it from a #WebK... |
| DeviceInfoPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for enumerating the user's media devices WebKitDeviceInfoPermissionRequest represents a request for permission to whether WebK... |
| Download | GObject.Object | 0 | 5 | 11 | Object used to communicate with the application when downloading. #WebKitDownload carries information about a download request and response, includ... |
| EditorState | GObject.Object | 0 | 1 | 6 | Web editor state. WebKitEditorState represents the state of a #WebKitWebView editor. Use webkit_web_view_get_editor_state() to get the WebKitEditor... |
| FaviconDatabase | GObject.Object | 0 | 1 | 4 | Provides access to the icons associated with web sites. WebKit will automatically look for available icons in <link> elements on opened pages as we... |
| FileChooserRequest | GObject.Object | 0 | 0 | 6 | A request to open a file chooser. Whenever the user interacts with an HTML input element with file type, WebKit will need to show a dialog to choos... |
| FindController | GObject.Object | 0 | 3 | 9 | Controls text search in a #WebKitWebView. A #WebKitFindController is used to search text in a #WebKitWebView. You can get a #WebKitWebView<!-- -->'... |
| FormSubmissionRequest | GObject.Object | 0 | 0 | 3 | Represents a form submission request. When a form is about to be submitted in a #WebKitWebView, the #WebKitWebView::submit-form signal is emitted. ... |
| GeolocationManager | GObject.Object | 0 | 2 | 3 | Geolocation manager. WebKitGeolocationManager provides API to get the geographical position of the user. Once a #WebKitGeolocationPermissionRequest... |
| GeolocationPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for sharing the user's location. WebKitGeolocationPermissionRequest represents a request for permission to decide whether WebK... |
| HitTestResult | GObject.Object | 0 | 0 | 12 | Result of a Hit Test. A Hit Test is an operation to get context information about a given point in a #WebKitWebView. #WebKitHitTestResult represent... |
| InputMethodContext | GObject.Object | 0 | 5 | 12 | Base class for input method contexts. WebKitInputMethodContext defines the interface to implement WebKit input methods. The input methods are used ... |
| InstallMissingMediaPluginsPermissionRequest | GObject.Object | 0 | 0 | 1 | Previously, a permission request for installing missing media plugins. WebKitInstallMissingMediaPluginsPermissionRequest will no longer ever be cre... |
| MediaKeySystemPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for using an EME Content Decryption Module. WebKitMediaKeySystemPermissionRequest represents a request for permission to decid... |
| NavigationPolicyDecision | PolicyDecision | 0 | 0 | 6 | A policy decision for navigation actions. WebKitNavigationPolicyDecision represents a policy decision for events associated with navigations. If th... |
| Notification | GObject.Object | 0 | 2 | 6 | Holds information about a notification that should be shown to the user. |
| NotificationPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for displaying web notifications. WebKitNotificationPermissionRequest represents a request for permission to decide whether We... |
| OptionMenu | GObject.Object | 0 | 1 | 6 | Represents the dropdown menu of a `select` element in a #WebKitWebView. When a select element in a #WebKitWebView needs to display a dropdown menu,... |
| Plugin | GObject.Object | 0 | 0 | 4 | Represents a plugin, enabling fine-grained control. This object represents a single plugin, found while scanning the various platform plugin direct... |
| PointerLockPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for locking the pointer. WebKitPointerLockPermissionRequest represents a request for permission to decide whether WebKit can l... |
| PolicyDecision | GObject.Object | 2 | 0 | 4 | A pending policy decision. Often WebKit allows the client to decide the policy for certain operations. For instance, a client may want to open a li... |
| PrintCustomWidget | GObject.Object | 0 | 2 | 3 | Allows to embed a custom widget in print dialog. A WebKitPrintCustomWidget allows to embed a custom widget in the print dialog by connecting to the... |
| PrintOperation | GObject.Object | 0 | 3 | 7 | Controls a print operation. A #WebKitPrintOperation controls a print operation in WebKit. With a similar API to #GtkPrintOperation, it lets you set... |
| ResponsePolicyDecision | PolicyDecision | 0 | 0 | 4 | A policy decision for resource responses. WebKitResponsePolicyDecision represents a policy decision for a resource response, whether from the netwo... |
| SecurityManager | GObject.Object | 0 | 0 | 12 | Controls security settings in a #WebKitWebContext. The #WebKitSecurityManager defines security settings for URI schemes in a #WebKitWebContext. Get... |
| Settings | GObject.Object | 0 | 0 | 139 | Control the behaviour of a #WebKitWebView. #WebKitSettings can be applied to a #WebKitWebView to control text charset, color, font sizes, printing ... |
| URIRequest | GObject.Object | 0 | 0 | 5 | Represents a URI request. A #WebKitURIRequest can be created with a URI using the webkit_uri_request_new() method, and you can get the URI of an ex... |
| URIResponse | GObject.Object | 0 | 0 | 6 | Represents an URI response. A #WebKitURIResponse contains information such as the URI, the status code, the content length, the mime type, the HTTP... |
| URISchemeRequest | GObject.Object | 0 | 0 | 10 | Represents a URI scheme request. If you register a particular URI scheme in a #WebKitWebContext, using webkit_web_context_register_uri_scheme(), yo... |
| URISchemeResponse | GObject.Object | 0 | 0 | 4 | Represents a URI scheme response. If you register a particular URI scheme in a #WebKitWebContext, using webkit_web_context_register_uri_scheme(), y... |
| UserContentFilterStore | GObject.Object | 0 | 0 | 12 | Handles storage of user content filters on disk. The WebKitUserContentFilterStore provides the means to import and save JSON rule sets, which can b... |
| UserContentManager | GObject.Object | 0 | 2 | 16 | Manages user-defined content which affects web pages. Using a #WebKitUserContentManager user CSS style sheets can be set to be injected in the web ... |
| UserMediaPermissionRequest | GObject.Object | 0 | 0 | 0 | A permission request for accessing user's audio/video devices. WebKitUserMediaPermissionRequest represents a request for permission to decide wheth... |
| UserMessage | GObject.InitiallyUnowned | 0 | 0 | 6 | Message that can be sent between the UI process and web process extensions. A WebKitUserMessage is a message that can be used for the communication... |
| WebContext | GObject.Object | 0 | 5 | 47 | Manages aspects common to all #WebKitWebView<!-- -->s The #WebKitWebContext manages all aspects common to all #WebKitWebView<!-- -->s. You can defi... |
| WebInspector | GObject.Object | 0 | 5 | 9 | Access to the WebKit inspector. The WebKit Inspector is a graphical tool to inspect and change the content of a #WebKitWebView. It also includes an... |
| WebResource | GObject.Object | 0 | 5 | 4 | Represents a resource at the end of a URI. A #WebKitWebResource encapsulates content for each resource at the end of a particular URI. For example,... |
| WebsiteDataAccessPermissionRequest | GObject.Object | 0 | 0 | 2 | A permission request for accessing website data from third-party domains. WebKitWebsiteDataAccessPermissionRequest represents a request for permiss... |
| WebsiteDataManager | GObject.Object | 0 | 0 | 31 | Manages data stored locally by web sites. You can use WebKitWebsiteDataManager to configure the local directories where website data will be stored... |
| WebsitePolicies | GObject.Object | 0 | 0 | 3 | View specific website policies. WebKitWebsitePolicies allows you to configure per-page policies, currently only autoplay policies are supported. |
| WebView | WebViewBase | 0 | 28 | 97 | The central class of the WPE WebKit and WebKitGTK APIs. #WebKitWebView is the central class of the WPE WebKit and WebKitGTK APIs. It is responsible... |
| WebViewBase | Gtk.Container | 1 | 0 | 0 |  |
| WindowProperties | GObject.Object | 0 | 0 | 8 | Window properties of a #WebKitWebView. The content of a #WebKitWebView can request to change certain properties of the window containing the view. ... |
| XRPermissionRequest | GObject.Object | 0 | 0 | 8 | A permission request for accessing virtual reality (VR) and augmented reality (AR) devices, including sensors and head-mounted displays. WebKitXRPe... |

### WebKit2.AuthenticationRequest

Parent: `GObject.Object` ?? GType: `WebKitAuthenticationRequest` ?? C type: `WebKitAuthenticationRequest`

Represents an authentication request. Whenever a client attempts to load a page protected by HTTP authentication, credentials will need to be provi...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | AuthenticationRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `AuthenticationRequest.authenticate(credential: Credential?) -> none` | webkit_authentication_request_authenticate | 2.2 | Authenticate the #WebKitAuthenticationRequest. Authenticate the #WebKitAuthenticationRequest using the #WebKitCredential supplied. To continue with... |
| can_save_credentials | `AuthenticationRequest.can_save_credentials() -> gboolean` | webkit_authentication_request_can_save_credentials | 2.2 | Determine whether this #WebKitAuthenticationRequest should allow the storage of credentials. Determine whether the authentication method associated... |
| cancel | `AuthenticationRequest.cancel() -> none` | webkit_authentication_request_cancel | 2.2 | Cancel the authentication challenge. This will also cancel the page loading and result in a #WebKitWebView::load-failed signal with a #WebKitNetwor... |
| get_certificate_pin_flags | `AuthenticationRequest.get_certificate_pin_flags() -> Gio.TlsPasswordFlags` | webkit_authentication_request_get_certificate_pin_flags | 2.34 | Get the #GTlsPasswordFlags of the %WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED authentication challenge. |
| get_host | `AuthenticationRequest.get_host() -> utf8` | webkit_authentication_request_get_host | 2.2 | Get the host that this authentication challenge is applicable to. |
| get_port | `AuthenticationRequest.get_port() -> guint` | webkit_authentication_request_get_port | 2.2 | Get the port that this authentication challenge is applicable to. |
| get_proposed_credential | `AuthenticationRequest.get_proposed_credential() -> Credential` | webkit_authentication_request_get_proposed_credential | 2.2 | Get the #WebKitCredential of the proposed authentication challenge. Get the #WebKitCredential of the proposed authentication challenge that was sto... |
| get_realm | `AuthenticationRequest.get_realm() -> utf8` | webkit_authentication_request_get_realm | 2.2 | Get the realm that this authentication challenge is applicable to. |
| get_scheme | `AuthenticationRequest.get_scheme() -> AuthenticationScheme` | webkit_authentication_request_get_scheme | 2.2 | Get the authentication scheme of the authentication challenge. |
| get_security_origin | `AuthenticationRequest.get_security_origin() -> SecurityOrigin` | webkit_authentication_request_get_security_origin | 2.30 | Get the #WebKitSecurityOrigin that this authentication challenge is applicable to. |
| is_for_proxy | `AuthenticationRequest.is_for_proxy() -> gboolean` | webkit_authentication_request_is_for_proxy | 2.2 | Determine whether the authentication challenge is associated with a proxy server. Determine whether the authentication challenge is associated with... |
| is_retry | `AuthenticationRequest.is_retry() -> gboolean` | webkit_authentication_request_is_retry | 2.2 | Determine whether this this is a first attempt or a retry for this authentication challenge. |
| set_can_save_credentials | `AuthenticationRequest.set_can_save_credentials(enabled: gboolean) -> none` | webkit_authentication_request_set_can_save_credentials | 2.30 | Set whether the authentication method associated with @request should allow the storage of credentials. Set whether the authentication method assoc... |
| set_proposed_credential | `AuthenticationRequest.set_proposed_credential(credential: Credential) -> none` | webkit_authentication_request_set_proposed_credential | 2.30 | Set the #WebKitCredential of the proposed authentication challenge. Set the #WebKitCredential of the proposed authentication challenge that was sto... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| authenticated | `credential: Credential` | none | last | 2.30 | This signal is emitted when the user authentication request succeeded. Applications handling their own credential storage should connect to this si... |
| cancelled | `` | none | last | 2.2 | This signal is emitted when the user authentication request is cancelled. It allows the application to dismiss its authentication dialog in case of... |

### WebKit2.AutomationSession

Parent: `GObject.Object` ?? GType: `WebKitAutomationSession` ?? C type: `WebKitAutomationSession`

Automation Session. WebKitAutomationSession represents an automation session of a WebKitWebContext. When a new session is requested, a WebKitAutoma...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | AutomationSessionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_application_info | `AutomationSession.get_application_info() -> ApplicationInfo` | webkit_automation_session_get_application_info | 2.18 | Get the the previously set #WebKitAutomationSession. Get the #WebKitAutomationSession previously set with webkit_automation_session_set_application... |
| get_id | `AutomationSession.get_id() -> utf8` | webkit_automation_session_get_id | 2.18 | Get the unique identifier of a #WebKitAutomationSession |
| set_application_info | `AutomationSession.set_application_info(info: ApplicationInfo) -> none` | webkit_automation_session_set_application_info | 2.18 | Set the application information to @session. This information will be used by the driver service to match the requested capabilities with the actua... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| id | utf8 | read, write, construct-only | The session unique identifier. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| create-web-view | `` | WebView | last detailed | 2.18 | This signal is emitted when the automation client requests a new browsing context to interact with it. The callback handler should return a #WebKit... |
| will-close | `` | none | last | 2.46 | This signal is emitted when the given automation session is about to finish. It allows clients to perform any cleanup tasks before the session is d... |

### WebKit2.BackForwardList

Parent: `GObject.Object` ?? GType: `WebKitBackForwardList` ?? C type: `WebKitBackForwardList`

List of visited pages. WebKitBackForwardList maintains a list of visited pages used to navigate to recent pages. Items are inserted in the list in ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | BackForwardListPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_back_item | `BackForwardList.get_back_item() -> BackForwardListItem` | webkit_back_forward_list_get_back_item |  | Returns the item that precedes the current item. |
| get_back_list | `BackForwardList.get_back_list() -> GLib.List` | webkit_back_forward_list_get_back_list |  | Obtain the list of items preceding the current one. |
| get_back_list_with_limit | `BackForwardList.get_back_list_with_limit(limit: guint) -> GLib.List` | webkit_back_forward_list_get_back_list_with_limit |  | Obtain a list up to some number of items preceding the current one. |
| get_current_item | `BackForwardList.get_current_item() -> BackForwardListItem` | webkit_back_forward_list_get_current_item |  | Returns the current item in @back_forward_list. |
| get_forward_item | `BackForwardList.get_forward_item() -> BackForwardListItem` | webkit_back_forward_list_get_forward_item |  | Returns the item that follows the current item. |
| get_forward_list | `BackForwardList.get_forward_list() -> GLib.List` | webkit_back_forward_list_get_forward_list |  | Obtain the list of items following the current one. |
| get_forward_list_with_limit | `BackForwardList.get_forward_list_with_limit(limit: guint) -> GLib.List` | webkit_back_forward_list_get_forward_list_with_limit |  | Obtain a list up to some number of items following the current one. |
| get_length | `BackForwardList.get_length() -> guint` | webkit_back_forward_list_get_length |  | Obtain the amount of items in the list. |
| get_nth_item | `BackForwardList.get_nth_item(index: gint) -> BackForwardListItem` | webkit_back_forward_list_get_nth_item |  | Returns the item at a given index relative to the current item. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `item_added: BackForwardListItem?, items_removed: gpointer?` | none | last |  | This signal is emitted when @back_forward_list changes. This happens when the current item is updated, a new item is added or one or more items are... |

### WebKit2.BackForwardListItem

Parent: `GObject.InitiallyUnowned` ?? GType: `WebKitBackForwardListItem` ?? C type: `WebKitBackForwardListItem`

One item of the #WebKitBackForwardList. A history item is part of the #WebKitBackForwardList and consists out of a title and a URI.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.InitiallyUnowned |
| priv | BackForwardListItemPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_original_uri | `BackForwardListItem.get_original_uri() -> utf8` | webkit_back_forward_list_item_get_original_uri |  | Obtain the original URI of the item. See also webkit_back_forward_list_item_get_uri(). |
| get_title | `BackForwardListItem.get_title() -> utf8` | webkit_back_forward_list_item_get_title |  | Obtain the title of the item. |
| get_uri | `BackForwardListItem.get_uri() -> utf8` | webkit_back_forward_list_item_get_uri |  | Obtain the URI of the item. This URI may differ from the original URI if the page was, for example, redirected to a new location. See also webkit_b... |

### WebKit2.ClipboardPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitClipboardPermissionRequest` ?? C type: `WebKitClipboardPermissionRequest`

A permission request for reading clipboard contents. WebKitClipboardPermissionRequest represents a request for permission to decide whether WebKit ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ClipboardPermissionRequestPrivate |

### WebKit2.ColorChooserRequest

Parent: `GObject.Object` ?? GType: `WebKitColorChooserRequest` ?? C type: `WebKitColorChooserRequest`

A request to open a color chooser. Whenever the user interacts with an <input type='color' /> HTML element, WebKit will need to show a dialog to ch...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ColorChooserRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel | `ColorChooserRequest.cancel() -> none` | webkit_color_chooser_request_cancel | 2.8 | Cancels @request and the input element changes to use the initial color. Cancels @request and the input element changes to use the initial color it... |
| finish | `ColorChooserRequest.finish() -> none` | webkit_color_chooser_request_finish | 2.8 | Finishes @request and the input element keeps the current value of #WebKitColorChooserRequest:rgba. Finishes @request and the input element keeps t... |
| get_element_rectangle | `ColorChooserRequest.get_element_rectangle(rect: out Gdk.Rectangle) -> none` | webkit_color_chooser_request_get_element_rectangle | 2.8 | Gets the bounding box of the color input element. |
| get_rgba | `ColorChooserRequest.get_rgba(rgba: out Gdk.RGBA) -> none` | webkit_color_chooser_request_get_rgba | 2.8 | Gets the current #GdkRGBA color of @request |
| set_rgba | `ColorChooserRequest.set_rgba(rgba: Gdk.RGBA) -> none` | webkit_color_chooser_request_set_rgba | 2.8 | Sets the current #GdkRGBA color of @request |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| rgba | Gdk.RGBA | read, write | The #GdkRGBA color of the request |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| finished | `` | none | last | 2.8 | Emitted when the @request finishes. This signal can be emitted because the user completed the @request calling webkit_color_chooser_request_finish(... |

### WebKit2.ContextMenu

Parent: `GObject.Object` ?? GType: `WebKitContextMenu` ?? C type: `WebKitContextMenu`

Represents the context menu in a #WebKitWebView. #WebKitContextMenu represents a context menu containing #WebKitContextMenuItem<!-- -->s in a #WebK...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ContextMenuPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContextMenu.new() -> ContextMenu` | webkit_context_menu_new |  | Creates a new #WebKitContextMenu object. Creates a new #WebKitContextMenu object to be used as a submenu of an existing #WebKitContextMenu. The con... |
| new_with_items | `ContextMenu.new_with_items(items: GLib.List) -> ContextMenu` | webkit_context_menu_new_with_items |  | Creates a new #WebKitContextMenu object with the given items. Creates a new #WebKitContextMenu object to be used as a submenu of an existing #WebKi... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `ContextMenu.append(item: ContextMenuItem) -> none` | webkit_context_menu_append |  | Adds @item at the end of the @menu. |
| first | `ContextMenu.first() -> ContextMenuItem` | webkit_context_menu_first |  | Gets the first item in the @menu. |
| get_event | `ContextMenu.get_event() -> Gdk.Event` | webkit_context_menu_get_event | 2.40 | Gets the #GdkEvent that triggered the context menu. This function only returns a valid #GdkEvent when called for a #WebKitContextMenu passed to #We... |
| get_item_at_position | `ContextMenu.get_item_at_position(position: guint) -> ContextMenuItem` | webkit_context_menu_get_item_at_position |  | Gets the item at the given position in the @menu. |
| get_items | `ContextMenu.get_items() -> GLib.List` | webkit_context_menu_get_items |  | Returns the item list of @menu. |
| get_n_items | `ContextMenu.get_n_items() -> guint` | webkit_context_menu_get_n_items |  | Gets the length of the @menu. |
| get_position | `ContextMenu.get_position(x: out gint?, y: out gint?) -> gboolean` | webkit_context_menu_get_position | 2.52 | Gets the position in view coordinates where the context menu was triggered. This function only returns valid coordinates when called for a #WebKitC... |
| get_user_data | `ContextMenu.get_user_data() -> GLib.Variant` | webkit_context_menu_get_user_data | 2.8 | Gets the user data of @menu. This function can be used from the UI Process to get user data previously set from the Web Process with webkit_context... |
| insert | `ContextMenu.insert(item: ContextMenuItem, position: gint) -> none` | webkit_context_menu_insert |  | Inserts @item into the @menu at the given position. If @position is negative, or is larger than the number of items in the #WebKitContextMenu, the ... |
| last | `ContextMenu.last() -> ContextMenuItem` | webkit_context_menu_last |  | Gets the last item in the @menu. |
| move_item | `ContextMenu.move_item(item: ContextMenuItem, position: gint) -> none` | webkit_context_menu_move_item |  | Moves @item to the given position in the @menu. If @position is negative, or is larger than the number of items in the #WebKitContextMenu, the item... |
| prepend | `ContextMenu.prepend(item: ContextMenuItem) -> none` | webkit_context_menu_prepend |  | Adds @item at the beginning of the @menu. |
| remove | `ContextMenu.remove(item: ContextMenuItem) -> none` | webkit_context_menu_remove |  | Removes @item from the @menu. See also webkit_context_menu_remove_all() to remove all items. |
| remove_all | `ContextMenu.remove_all() -> none` | webkit_context_menu_remove_all |  | Removes all items of the @menu. |
| set_user_data | `ContextMenu.set_user_data(user_data: GLib.Variant) -> none` | webkit_context_menu_set_user_data | 2.8 | Sets user data to @menu. This function can be used from a Web Process extension to set user data that can be retrieved from the UI Process using we... |

### WebKit2.ContextMenuItem

Parent: `GObject.InitiallyUnowned` ?? GType: `WebKitContextMenuItem` ?? C type: `WebKitContextMenuItem`

One item of a #WebKitContextMenu. The #WebKitContextMenu is composed of #WebKitContextMenuItem<!-- -->s. These items can be created from a #GtkActi...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.InitiallyUnowned |
| priv | ContextMenuItemPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContextMenuItem.new(action: Gtk.Action) -> ContextMenuItem` | webkit_context_menu_item_new |  | Creates a new #WebKitContextMenuItem for the given @action. |
| new_from_gaction | `ContextMenuItem.new_from_gaction(action: Gio.Action, label: utf8, target: GLib.Variant?) -> ContextMenuItem` | webkit_context_menu_item_new_from_gaction | 2.18 | Creates a new #WebKitContextMenuItem for the given @action and @label. On activation @target will be passed as parameter to the callback. |
| new_from_stock_action | `ContextMenuItem.new_from_stock_action(action: ContextMenuAction) -> ContextMenuItem` | webkit_context_menu_item_new_from_stock_action |  | Creates a new #WebKitContextMenuItem for the given stock action. Stock actions are handled automatically by WebKit so that, for example, when a men... |
| new_from_stock_action_with_label | `ContextMenuItem.new_from_stock_action_with_label(action: ContextMenuAction, label: utf8) -> ContextMenuItem` | webkit_context_menu_item_new_from_stock_action_with_label |  | Creates a new #WebKitContextMenuItem for the given stock action using the given @label. Stock actions have a predefined label, this method can be u... |
| new_separator | `ContextMenuItem.new_separator() -> ContextMenuItem` | webkit_context_menu_item_new_separator |  | Creates a new #WebKitContextMenuItem representing a separator. |
| new_with_submenu | `ContextMenuItem.new_with_submenu(label: utf8, submenu: ContextMenu) -> ContextMenuItem` | webkit_context_menu_item_new_with_submenu |  | Creates a new #WebKitContextMenuItem using the given @label with a submenu. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_action | `ContextMenuItem.get_action() -> Gtk.Action` | webkit_context_menu_item_get_action |  | Gets the action associated to @item as a #GtkAction. |
| get_gaction | `ContextMenuItem.get_gaction() -> Gio.Action` | webkit_context_menu_item_get_gaction | 2.18 | Gets the action associated to @item as a #GAction. |
| get_gaction_target | `ContextMenuItem.get_gaction_target() -> GLib.Variant` | webkit_context_menu_item_get_gaction_target | 2.52 | Gets the target #GVariant associated with @item. |
| get_stock_action | `ContextMenuItem.get_stock_action() -> ContextMenuAction` | webkit_context_menu_item_get_stock_action |  | Gets the #WebKitContextMenuAction of @item. If the #WebKitContextMenuItem was not created for a stock action %WEBKIT_CONTEXT_MENU_ACTION_CUSTOM wil... |
| get_submenu | `ContextMenuItem.get_submenu() -> ContextMenu` | webkit_context_menu_item_get_submenu |  | Gets the submenu of @item. |
| get_title | `ContextMenuItem.get_title() -> utf8` | webkit_context_menu_item_get_title | 2.52 | Gets the title of @item. |
| is_separator | `ContextMenuItem.is_separator() -> gboolean` | webkit_context_menu_item_is_separator |  | Checks whether @item is a separator. |
| set_submenu | `ContextMenuItem.set_submenu(submenu: ContextMenu?) -> none` | webkit_context_menu_item_set_submenu |  | Sets or replaces the @item submenu. If @submenu is %NULL the current submenu of @item is removed. |

### WebKit2.CookieManager

Parent: `GObject.Object` ?? GType: `WebKitCookieManager` ?? C type: `WebKitCookieManager`

Defines how to handle cookies in a #WebKitWebContext. The WebKitCookieManager defines how to set up and handle cookies. You can get it from a #WebK...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | CookieManagerPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_cookie | `CookieManager.add_cookie(cookie: Soup.Cookie, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_add_cookie | 2.20 | Asynchronously add a #SoupCookie to the underlying storage. When the operation is finished, @callback will be called. You can then call webkit_cook... |
| add_cookie_finish | `CookieManager.add_cookie_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_cookie_manager_add_cookie_finish | 2.20 | Finish an asynchronous operation started with webkit_cookie_manager_add_cookie(). |
| delete_all_cookies | `CookieManager.delete_all_cookies() -> none` | webkit_cookie_manager_delete_all_cookies |  | Delete all cookies of @cookie_manager. |
| delete_cookie | `CookieManager.delete_cookie(cookie: Soup.Cookie, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_delete_cookie | 2.20 | Asynchronously delete a #SoupCookie from the current session. When the operation is finished, @callback will be called. You can then call webkit_co... |
| delete_cookie_finish | `CookieManager.delete_cookie_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_cookie_manager_delete_cookie_finish | 2.20 | Finish an asynchronous operation started with webkit_cookie_manager_delete_cookie(). |
| delete_cookies_for_domain | `CookieManager.delete_cookies_for_domain(domain: utf8) -> none` | webkit_cookie_manager_delete_cookies_for_domain |  | Remove all cookies of @cookie_manager for the given @domain. |
| get_accept_policy | `CookieManager.get_accept_policy(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_get_accept_policy |  | Asynchronously get the cookie acceptance policy of @cookie_manager. Note that when policy was set to %WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY an... |
| get_accept_policy_finish | `CookieManager.get_accept_policy_finish(result: Gio.AsyncResult) -> CookieAcceptPolicy throws` | webkit_cookie_manager_get_accept_policy_finish |  | Finish an asynchronous operation started with webkit_cookie_manager_get_accept_policy(). |
| get_all_cookies | `CookieManager.get_all_cookies(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_get_all_cookies | 2.42 | Asynchronously get a list of #SoupCookie from @cookie_manager. When the operation is finished, @callback will be called. You can then call webkit_c... |
| get_all_cookies_finish | `CookieManager.get_all_cookies_finish(result: Gio.AsyncResult) -> GLib.List throws` | webkit_cookie_manager_get_all_cookies_finish | 2.42 | Finish an asynchronous operation started with webkit_cookie_manager_get_all_cookies(). The return value is a #GList of #SoupCookie instances which ... |
| get_cookies | `CookieManager.get_cookies(uri: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_get_cookies | 2.20 | Asynchronously get a list of #SoupCookie from @cookie_manager. Asynchronously get a list of #SoupCookie from @cookie_manager associated with @uri, ... |
| get_cookies_finish | `CookieManager.get_cookies_finish(result: Gio.AsyncResult) -> GLib.List throws` | webkit_cookie_manager_get_cookies_finish | 2.20 | Finish an asynchronous operation started with webkit_cookie_manager_get_cookies(). The return value is a #GList of #SoupCookie instances which shou... |
| get_domains_with_cookies | `CookieManager.get_domains_with_cookies(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_get_domains_with_cookies |  | Asynchronously get the list of domains for which @cookie_manager contains cookies. When the operation is finished, @callback will be called. You ca... |
| get_domains_with_cookies_finish | `CookieManager.get_domains_with_cookies_finish(result: Gio.AsyncResult) -> utf8 throws` | webkit_cookie_manager_get_domains_with_cookies_finish |  | Finish an asynchronous operation started with webkit_cookie_manager_get_domains_with_cookies(). The return value is a %NULL terminated list of stri... |
| replace_cookies | `CookieManager.replace_cookies(cookies: GLib.List, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_cookie_manager_replace_cookies | 2.42 | Asynchronously replace all cookies in @cookie_manager with the given list of @cookies. When the operation is finished, @callback will be called. Yo... |
| replace_cookies_finish | `CookieManager.replace_cookies_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_cookie_manager_replace_cookies_finish | 2.42 | Finish an asynchronous operation started with webkit_cookie_manager_replace_cookies(). |
| set_accept_policy | `CookieManager.set_accept_policy(policy: CookieAcceptPolicy) -> none` | webkit_cookie_manager_set_accept_policy |  | Set the cookie acceptance policy of @cookie_manager as @policy. Note that ITP has its own way to handle third-party cookies, so when it's enabled, ... |
| set_persistent_storage | `CookieManager.set_persistent_storage(filename: utf8, storage: CookiePersistentStorage) -> none` | webkit_cookie_manager_set_persistent_storage |  | Set non-session cookies. Set the @filename where non-session cookies are stored persistently using @storage as the format to read/write the cookies... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | This signal is emitted when cookies are added, removed or modified. |

### WebKit2.DeviceInfoPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitDeviceInfoPermissionRequest` ?? C type: `WebKitDeviceInfoPermissionRequest`

A permission request for enumerating the user's media devices WebKitDeviceInfoPermissionRequest represents a request for permission to whether WebK...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | DeviceInfoPermissionRequestPrivate |

### WebKit2.Download

Parent: `GObject.Object` ?? GType: `WebKitDownload` ?? C type: `WebKitDownload`

Object used to communicate with the application when downloading. #WebKitDownload carries information about a download request and response, includ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | DownloadPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel | `Download.cancel() -> none` | webkit_download_cancel |  | Cancels the download. When the ongoing download operation is effectively cancelled the signal #WebKitDownload::failed is emitted with %WEBKIT_DOWNL... |
| get_allow_overwrite | `Download.get_allow_overwrite() -> gboolean` | webkit_download_get_allow_overwrite | 2.6 | Returns the current value of the #WebKitDownload:allow-overwrite property. Returns the current value of the #WebKitDownload:allow-overwrite propert... |
| get_destination | `Download.get_destination() -> utf8` | webkit_download_get_destination |  | Obtains the destination to which the downloaded file will be written. You can connect to #WebKitDownload::created-destination to make sure this met... |
| get_elapsed_time | `Download.get_elapsed_time() -> gdouble` | webkit_download_get_elapsed_time |  | Gets the elapsed time in seconds, including any fractional part. If the download finished, had an error or was cancelled this is the time between i... |
| get_estimated_progress | `Download.get_estimated_progress() -> gdouble` | webkit_download_get_estimated_progress |  | Gets the value of the #WebKitDownload:estimated-progress property. Gets the value of the #WebKitDownload:estimated-progress property. You can monit... |
| get_received_data_length | `Download.get_received_data_length() -> guint64` | webkit_download_get_received_data_length |  | Gets the length of the data already downloaded for @download. Gets the length of the data already downloaded for @download in bytes. |
| get_request | `Download.get_request() -> URIRequest` | webkit_download_get_request |  | Retrieves the #WebKitURIRequest object that backs the download process. |
| get_response | `Download.get_response() -> URIResponse` | webkit_download_get_response |  | Retrieves the #WebKitURIResponse object that backs the download process. Retrieves the #WebKitURIResponse object that backs the download process. T... |
| get_web_view | `Download.get_web_view() -> WebView` | webkit_download_get_web_view |  | Get the #WebKitWebView that initiated the download. |
| set_allow_overwrite | `Download.set_allow_overwrite(allowed: gboolean) -> none` | webkit_download_set_allow_overwrite | 2.6 | Sets the #WebKitDownload:allow-overwrite property. Sets the #WebKitDownload:allow-overwrite property, which determines whether the download may ove... |
| set_destination | `Download.set_destination(destination: utf8) -> none` | webkit_download_set_destination |  | Sets the destination to which the downloaded file will be written. This method should be called before the download transfer starts or it will not ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| allow-overwrite | gboolean | read, write | Whether or not the download is allowed to overwrite an existing file on disk. If this property is %FALSE and the destination already exists, the do... |
| destination | utf8 | read | The local path to where the download will be saved. |
| estimated-progress | gdouble | read | An estimate of the percent completion for the download operation. This value will range from 0.0 to 1.0. The value is an estimate based on the tota... |
| response | URIResponse | read | The #WebKitURIResponse associated with this download. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| created-destination | `destination: utf8` | none | last |  | This signal is emitted after #WebKitDownload::decide-destination and before #WebKitDownload::received-data to notify that destination file has been... |
| decide-destination | `suggested_filename: utf8` | gboolean | last |  | This signal is emitted after response is received to decide a destination for the download using webkit_download_set_destination(). If this signal ... |
| failed | `error: GLib.Error` | none | last |  | This signal is emitted when an error occurs during the download operation. The given @error, of the domain %WEBKIT_DOWNLOAD_ERROR, contains further... |
| finished | `` | none | last |  | This signal is emitted when download finishes successfully or due to an error. In case of errors #WebKitDownload::failed signal is emitted before t... |
| received-data | `data_length: guint64` | none | last |  | This signal is emitted after response is received, every time new data has been written to the destination. It's useful to know the progress of the... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| decide_destination | `decide_destination(suggested_filename: utf8) -> gboolean` |  |  |  |

### WebKit2.EditorState

Parent: `GObject.Object` ?? GType: `WebKitEditorState` ?? C type: `WebKitEditorState`

Web editor state. WebKitEditorState represents the state of a #WebKitWebView editor. Use webkit_web_view_get_editor_state() to get the WebKitEditor...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | EditorStatePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_typing_attributes | `EditorState.get_typing_attributes() -> guint` | webkit_editor_state_get_typing_attributes | 2.10 | Gets the typing attributes at the current cursor position. If there is a selection, this returns the typing attributes of the selected text. Note t... |
| is_copy_available | `EditorState.is_copy_available() -> gboolean` | webkit_editor_state_is_copy_available | 2.20 | Gets whether a copy command can be issued. |
| is_cut_available | `EditorState.is_cut_available() -> gboolean` | webkit_editor_state_is_cut_available | 2.20 | Gets whether a cut command can be issued. |
| is_paste_available | `EditorState.is_paste_available() -> gboolean` | webkit_editor_state_is_paste_available | 2.20 | Gets whether a paste command can be issued. |
| is_redo_available | `EditorState.is_redo_available() -> gboolean` | webkit_editor_state_is_redo_available | 2.20 | Gets whether a redo command can be issued. |
| is_undo_available | `EditorState.is_undo_available() -> gboolean` | webkit_editor_state_is_undo_available | 2.20 | Gets whether an undo command can be issued. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| typing-attributes | guint | read | Bitmask of #WebKitEditorTypingAttributes flags. See webkit_editor_state_get_typing_attributes() for more information. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last | 2.44 | Emitted when the #WebKitEdtorState is changed. |

### WebKit2.FaviconDatabase

Parent: `GObject.Object` ?? GType: `WebKitFaviconDatabase` ?? C type: `WebKitFaviconDatabase`

Provides access to the icons associated with web sites. WebKit will automatically look for available icons in <link> elements on opened pages as we...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | FaviconDatabasePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `FaviconDatabase.clear() -> none` | webkit_favicon_database_clear |  | Clears all icons from the database. |
| get_favicon | `FaviconDatabase.get_favicon(page_uri: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_favicon_database_get_favicon |  | Asynchronously obtains a favicon image. Asynchronously obtains an image of the favicon for the given page URI. It returns the cached icon if it's i... |
| get_favicon_finish | `FaviconDatabase.get_favicon_finish(result: Gio.AsyncResult) -> cairo.Surface throws` | webkit_favicon_database_get_favicon_finish |  | Finishes an operation started with webkit_favicon_database_get_favicon(). |
| get_favicon_uri | `FaviconDatabase.get_favicon_uri(page_uri: utf8) -> utf8` | webkit_favicon_database_get_favicon_uri |  | Obtains the URI of the favicon for the given @page_uri. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| favicon-changed | `page_uri: utf8, favicon_uri: utf8` | none | last |  | This signal is emitted when the favicon URI of @page_uri has been changed to @favicon_uri in the database. You can connect to this signal and call ... |

### WebKit2.FileChooserRequest

Parent: `GObject.Object` ?? GType: `WebKitFileChooserRequest` ?? C type: `WebKitFileChooserRequest`

A request to open a file chooser. Whenever the user interacts with an HTML input element with file type, WebKit will need to show a dialog to choos...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | FileChooserRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel | `FileChooserRequest.cancel() -> none` | webkit_file_chooser_request_cancel |  | Ask WebKit to cancel the request. It's important to do this in case no selection has been made in the client, otherwise the request won't be proper... |
| get_mime_types | `FileChooserRequest.get_mime_types() -> utf8` | webkit_file_chooser_request_get_mime_types |  | Get the list of MIME types the file chooser dialog should handle. Get the list of MIME types the file chooser dialog should handle, in the format s... |
| get_mime_types_filter | `FileChooserRequest.get_mime_types_filter() -> Gtk.FileFilter` | webkit_file_chooser_request_get_mime_types_filter |  | Get the filter currently associated with the request. Get the filter currently associated with the request, ready to be used by #GtkFileChooser. Th... |
| get_select_multiple | `FileChooserRequest.get_select_multiple() -> gboolean` | webkit_file_chooser_request_get_select_multiple |  | Whether the file chooser should allow selecting multiple files. Determine whether the file chooser associated to this #WebKitFileChooserRequest sho... |
| get_selected_files | `FileChooserRequest.get_selected_files() -> utf8` | webkit_file_chooser_request_get_selected_files |  | Get the list of selected files associated to the request. Get the list of selected files currently associated to the request. Initially, the return... |
| select_files | `FileChooserRequest.select_files(files: utf8) -> none` | webkit_file_chooser_request_select_files |  | Ask WebKit to select local files for upload and complete the request. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filter | Gtk.FileFilter | read | The filter currently associated with the request. See webkit_file_chooser_request_get_mime_types_filter() for more details. |
| mime-types | utf8 | read | A %NULL-terminated array of strings containing the list of MIME types the file chooser dialog should handle. See webkit_file_chooser_request_get_mi... |
| select-multiple | gboolean | read | Whether the file chooser should allow selecting multiple files. See webkit_file_chooser_request_get_select_multiple() for more details. |
| selected-files | utf8 | read | A %NULL-terminated array of strings containing the list of selected files associated to the current request. See webkit_file_chooser_request_get_se... |

### WebKit2.FindController

Parent: `GObject.Object` ?? GType: `WebKitFindController` ?? C type: `WebKitFindController`

Controls text search in a #WebKitWebView. A #WebKitFindController is used to search text in a #WebKitWebView. You can get a #WebKitWebView<!-- -->'...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | FindControllerPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| count_matches | `FindController.count_matches(search_text: utf8, find_options: guint32, max_match_count: guint) -> none` | webkit_find_controller_count_matches |  | Counts the number of matches for @search_text. Counts the number of matches for @search_text found in the #WebKitWebView with the provided @find_op... |
| get_max_match_count | `FindController.get_max_match_count() -> guint` | webkit_find_controller_get_max_match_count |  | Gets the maximum number of matches to report. Gets the maximum number of matches to report during a text lookup. This number is passed as the last ... |
| get_options | `FindController.get_options() -> guint32` | webkit_find_controller_get_options |  | Gets the #WebKitFindOptions for the current search. Gets a bitmask containing the #WebKitFindOptions associated with the current search. |
| get_search_text | `FindController.get_search_text() -> utf8` | webkit_find_controller_get_search_text |  | Gets the text that @find_controller is searching for. Gets the text that @find_controller is currently searching for. This text is passed to either... |
| get_web_view | `FindController.get_web_view() -> WebView` | webkit_find_controller_get_web_view |  | Gets the #WebKitWebView this find controller is associated to. Do not dereference the returned instance as it belongs to the #WebKitFindController. |
| search | `FindController.search(search_text: utf8, find_options: guint32, max_match_count: guint) -> none` | webkit_find_controller_search |  | Looks for @search_text associated with @find_controller. Looks for @search_text in the #WebKitWebView associated with @find_controller since the be... |
| search_finish | `FindController.search_finish() -> none` | webkit_find_controller_search_finish |  | Finishes a find operation. Finishes a find operation started by webkit_find_controller_search(). It will basically unhighlight every text match fou... |
| search_next | `FindController.search_next() -> none` | webkit_find_controller_search_next |  | Looks for the next occurrence of the search text. Calling this method before webkit_find_controller_search() or webkit_find_controller_count_matche... |
| search_previous | `FindController.search_previous() -> none` | webkit_find_controller_search_previous |  | Looks for the previous occurrence of the search text. Calling this method before webkit_find_controller_search() or webkit_find_controller_count_ma... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| max-match-count | guint | read | The maximum number of matches to report for a given search. |
| options | FindOptions | read | The options to be used in the search operation. |
| text | utf8 | read | The current search text for this #WebKitFindController. |
| web-view | WebView | read, write, construct-only | The #WebKitWebView this controller is associated to. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| counted-matches | `match_count: guint` | none | last |  | This signal is emitted when the #WebKitFindController has counted the number of matches for a given text after a call to webkit_find_controller_cou... |
| failed-to-find-text | `` | none | last |  | This signal is emitted when a search operation does not find any result for the given text. It will be issued if the text is not found asynchronous... |
| found-text | `match_count: guint` | none | last |  | This signal is emitted when a given text is found in the web page text. It will be issued if the text is found asynchronously after a call to webki... |

### WebKit2.FormSubmissionRequest

Parent: `GObject.Object` ?? GType: `WebKitFormSubmissionRequest` ?? C type: `WebKitFormSubmissionRequest`

Represents a form submission request. When a form is about to be submitted in a #WebKitWebView, the #WebKitWebView::submit-form signal is emitted. ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | FormSubmissionRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_text_fields | `FormSubmissionRequest.get_text_fields() -> GLib.HashTable` | webkit_form_submission_request_get_text_fields |  | Get the values of the text fields contained in the form associated to @request. Get a #GHashTable with the values of the text fields contained in t... |
| list_text_fields | `FormSubmissionRequest.list_text_fields(field_names: out utf8?, field_values: out utf8?) -> gboolean` | webkit_form_submission_request_list_text_fields | 2.20 | Get lists of the text fields contained in the form associated to @request. Get lists with the names and values of the text fields contained in the ... |
| submit | `FormSubmissionRequest.submit() -> none` | webkit_form_submission_request_submit |  | Continue the form submission. |

### WebKit2.GeolocationManager

Parent: `GObject.Object` ?? GType: `WebKitGeolocationManager` ?? C type: `WebKitGeolocationManager`

Geolocation manager. WebKitGeolocationManager provides API to get the geographical position of the user. Once a #WebKitGeolocationPermissionRequest...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | GeolocationManagerPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| failed | `GeolocationManager.failed(error_message: utf8) -> none` | webkit_geolocation_manager_failed | 2.26 | Notify @manager that determining the position failed. |
| get_enable_high_accuracy | `GeolocationManager.get_enable_high_accuracy() -> gboolean` | webkit_geolocation_manager_get_enable_high_accuracy | 2.26 | Get whether high accuracy is enabled. |
| update_position | `GeolocationManager.update_position(position: GeolocationPosition) -> none` | webkit_geolocation_manager_update_position | 2.26 | Notify @manager that position has been updated to @position. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| enable-high-accuracy | gboolean | read | Whether high accuracy is enabled. This is a read-only property that will be set to %TRUE when a #WebKitGeolocationManager needs to get accurate pos... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| start | `` | gboolean | last | 2.26 | The signal is emitted to notify that @manager needs to start receiving position updates. After this signal is emitted the user should provide the u... |
| stop | `` | none | last | 2.26 | The signal is emitted to notify that @manager doesn't need to receive position updates anymore. |

### WebKit2.GeolocationPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitGeolocationPermissionRequest` ?? C type: `WebKitGeolocationPermissionRequest`

A permission request for sharing the user's location. WebKitGeolocationPermissionRequest represents a request for permission to decide whether WebK...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | GeolocationPermissionRequestPrivate |

### WebKit2.HitTestResult

Parent: `GObject.Object` ?? GType: `WebKitHitTestResult` ?? C type: `WebKitHitTestResult`

Result of a Hit Test. A Hit Test is an operation to get context information about a given point in a #WebKitWebView. #WebKitHitTestResult represent...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | HitTestResultPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| context_is_editable | `HitTestResult.context_is_editable() -> gboolean` | webkit_hit_test_result_context_is_editable |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_EDITABLE flag is present in #WebKitHitTestResult:context. |
| context_is_image | `HitTestResult.context_is_image() -> gboolean` | webkit_hit_test_result_context_is_image |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE flag is present in #WebKitHitTestResult:context. |
| context_is_link | `HitTestResult.context_is_link() -> gboolean` | webkit_hit_test_result_context_is_link |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK flag is present in #WebKitHitTestResult:context. |
| context_is_media | `HitTestResult.context_is_media() -> gboolean` | webkit_hit_test_result_context_is_media |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA flag is present in #WebKitHitTestResult:context. |
| context_is_scrollbar | `HitTestResult.context_is_scrollbar() -> gboolean` | webkit_hit_test_result_context_is_scrollbar |  | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_SCROLLBAR flag is present in #WebKitHitTestResult:context. |
| context_is_selection | `HitTestResult.context_is_selection() -> gboolean` | webkit_hit_test_result_context_is_selection | 2.8 | Gets whether %WEBKIT_HIT_TEST_RESULT_CONTEXT_SELECTION flag is present in #WebKitHitTestResult:context. |
| get_context | `HitTestResult.get_context() -> guint` | webkit_hit_test_result_get_context |  | Gets the value of the #WebKitHitTestResult:context property. |
| get_image_uri | `HitTestResult.get_image_uri() -> utf8` | webkit_hit_test_result_get_image_uri |  | Gets the value of the #WebKitHitTestResult:image-uri property. |
| get_link_label | `HitTestResult.get_link_label() -> utf8` | webkit_hit_test_result_get_link_label |  | Gets the value of the #WebKitHitTestResult:link-label property. |
| get_link_title | `HitTestResult.get_link_title() -> utf8` | webkit_hit_test_result_get_link_title |  | Gets the value of the #WebKitHitTestResult:link-title property. |
| get_link_uri | `HitTestResult.get_link_uri() -> utf8` | webkit_hit_test_result_get_link_uri |  | Gets the value of the #WebKitHitTestResult:link-uri property. |
| get_media_uri | `HitTestResult.get_media_uri() -> utf8` | webkit_hit_test_result_get_media_uri |  | Gets the value of the #WebKitHitTestResult:media-uri property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| context | guint | read, write, construct-only | Bitmask of #WebKitHitTestResultContext flags representing the context of the #WebKitHitTestResult. |
| image-uri | utf8 | read, write, construct-only | The URI of the image if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE is present in #WebKitHitTestResult:context |
| link-label | utf8 | read, write, construct-only | The label of the link if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK is present in #WebKitHitTestResult:context |
| link-title | utf8 | read, write, construct-only | The title of the link if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK is present in #WebKitHitTestResult:context |
| link-uri | utf8 | read, write, construct-only | The URI of the link if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK is present in #WebKitHitTestResult:context |
| media-uri | utf8 | read, write, construct-only | The URI of the media if flag %WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA is present in #WebKitHitTestResult:context |

### WebKit2.InputMethodContext

Parent: `GObject.Object` ?? GType: `WebKitInputMethodContext` ?? C type: `WebKitInputMethodContext` ?? Abstract

Base class for input method contexts. WebKitInputMethodContext defines the interface to implement WebKit input methods. The input methods are used ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | InputMethodContextPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| filter_key_event | `InputMethodContext.filter_key_event(key_event: Gdk.EventKey) -> gboolean` | webkit_input_method_context_filter_key_event | 2.28 | Allow @key_event to be handled by the input method. If %TRUE is returned, then no further processing should be done for the key event. |
| get_input_hints | `InputMethodContext.get_input_hints() -> InputHints` | webkit_input_method_context_get_input_hints | 2.28 | Get the value of the #WebKitInputMethodContext:input-hints property. |
| get_input_purpose | `InputMethodContext.get_input_purpose() -> InputPurpose` | webkit_input_method_context_get_input_purpose | 2.28 | Get the value of the #WebKitInputMethodContext:input-purpose property. |
| get_preedit | `InputMethodContext.get_preedit(text: out utf8?, underlines: out GLib.List?, cursor_offset: out guint?) -> none` | webkit_input_method_context_get_preedit | 2.28 | Get the pre-edit string and a list of WebKitInputMethodUnderline. Get the current pre-edit string for the @context, and a list of WebKitInputMethod... |
| notify_cursor_area | `InputMethodContext.notify_cursor_area(x: gint, y: gint, width: gint, height: gint) -> none` | webkit_input_method_context_notify_cursor_area | 2.28 | Notify @context that cursor area changed in input associated. |
| notify_focus_in | `InputMethodContext.notify_focus_in() -> none` | webkit_input_method_context_notify_focus_in | 2.28 | Notify @context that input associated has gained focus. |
| notify_focus_out | `InputMethodContext.notify_focus_out() -> none` | webkit_input_method_context_notify_focus_out | 2.28 | Notify @context that input associated has lost focus. |
| notify_surrounding | `InputMethodContext.notify_surrounding(text: utf8, length: gint, cursor_index: guint, selection_index: guint) -> none` | webkit_input_method_context_notify_surrounding | 2.28 | Notify @context that the context surrounding the cursor has changed. If there's no selection @selection_index is the same as @cursor_index. |
| reset | `InputMethodContext.reset() -> none` | webkit_input_method_context_reset | 2.28 | Reset the @context. This will typically cause the input to clear the preedit state. |
| set_enable_preedit | `InputMethodContext.set_enable_preedit(enabled: gboolean) -> none` | webkit_input_method_context_set_enable_preedit | 2.28 | Set whether @context should enable preedit to display feedback. |
| set_input_hints | `InputMethodContext.set_input_hints(hints: InputHints) -> none` | webkit_input_method_context_set_input_hints | 2.28 | Set the value of the #WebKitInputMethodContext:input-hints property. |
| set_input_purpose | `InputMethodContext.set_input_purpose(purpose: InputPurpose) -> none` | webkit_input_method_context_set_input_purpose | 2.28 | Set the value of the #WebKitInputMethodContext:input-purpose property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| input-hints | InputHints | read, write | The #WebKitInputHints of the input associated with this context. |
| input-purpose | InputPurpose | read, write | The #WebKitInputPurpose of the input associated with this context. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| committed | `text: utf8` | none | last | 2.28 | Emitted when a complete input sequence has been entered by the user. This can be a single character immediately after a key press or the final resu... |
| delete-surrounding | `offset: gint, n_chars: guint` | none | last | 2.28 | Emitted when the input method wants to delete the context surrounding the cursor. If @offset is a negative value, it means a position before the cu... |
| preedit-changed | `` | none | last | 2.28 | Emitted whenever the preedit sequence currently being entered has changed. It is also emitted at the end of a preedit sequence, in which case webki... |
| preedit-finished | `` | none | last | 2.28 | Emitted when a preediting sequence has been completed or canceled. |
| preedit-started | `` | none | last | 2.28 | Emitted when a new preediting sequence starts. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| committed | `committed(text: utf8) -> none` |  |  |  |
| delete_surrounding | `delete_surrounding(offset: gint, n_chars: guint) -> none` |  |  |  |
| filter_key_event | `filter_key_event(key_event: Gdk.EventKey) -> gboolean` |  | 2.28 | Allow @key_event to be handled by the input method. If %TRUE is returned, then no further processing should be done for the key event. |
| get_preedit | `get_preedit(text: out utf8?, underlines: out GLib.List?, cursor_offset: out guint?) -> none` |  | 2.28 | Get the pre-edit string and a list of WebKitInputMethodUnderline. Get the current pre-edit string for the @context, and a list of WebKitInputMethod... |
| notify_cursor_area | `notify_cursor_area(x: gint, y: gint, width: gint, height: gint) -> none` |  | 2.28 | Notify @context that cursor area changed in input associated. |
| notify_focus_in | `notify_focus_in() -> none` |  | 2.28 | Notify @context that input associated has gained focus. |
| notify_focus_out | `notify_focus_out() -> none` |  | 2.28 | Notify @context that input associated has lost focus. |
| notify_surrounding | `notify_surrounding(text: utf8, length: guint, cursor_index: guint, selection_index: guint) -> none` |  | 2.28 | Notify @context that the context surrounding the cursor has changed. If there's no selection @selection_index is the same as @cursor_index. |
| preedit_changed | `preedit_changed() -> none` |  |  |  |
| preedit_finished | `preedit_finished() -> none` |  |  |  |
| preedit_started | `preedit_started() -> none` |  |  |  |
| reset | `reset() -> none` |  | 2.28 | Reset the @context. This will typically cause the input to clear the preedit state. |
| set_enable_preedit | `set_enable_preedit(enabled: gboolean) -> none` |  | 2.28 | Set whether @context should enable preedit to display feedback. |

### WebKit2.InstallMissingMediaPluginsPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitInstallMissingMediaPluginsPermissionRequest` ?? C type: `WebKitInstallMissingMediaPluginsPermissionRequest`

Previously, a permission request for installing missing media plugins. WebKitInstallMissingMediaPluginsPermissionRequest will no longer ever be cre...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | InstallMissingMediaPluginsPermissionRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_description | `InstallMissingMediaPluginsPermissionRequest.get_description() -> utf8` | webkit_install_missing_media_plugins_permission_request_get_description | 2.10 | This function returns an empty string. |

### WebKit2.MediaKeySystemPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitMediaKeySystemPermissionRequest` ?? C type: `WebKitMediaKeySystemPermissionRequest`

A permission request for using an EME Content Decryption Module. WebKitMediaKeySystemPermissionRequest represents a request for permission to decid...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | MediaKeySystemPermissionRequestPrivate |

### WebKit2.NavigationPolicyDecision

Parent: `PolicyDecision` ?? GType: `WebKitNavigationPolicyDecision` ?? C type: `WebKitNavigationPolicyDecision`

A policy decision for navigation actions. WebKitNavigationPolicyDecision represents a policy decision for events associated with navigations. If th...

#### Fields

| Field | Type |
| --- | --- |
| parent | PolicyDecision |
| priv | NavigationPolicyDecisionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_frame_name | `NavigationPolicyDecision.get_frame_name() -> utf8` | webkit_navigation_policy_decision_get_frame_name |  | Gets the value of the #WebKitNavigationPolicyDecision:frame-name property. |
| get_modifiers | `NavigationPolicyDecision.get_modifiers() -> guint` | webkit_navigation_policy_decision_get_modifiers |  | Gets the value of the #WebKitNavigationPolicyDecision:modifiers property. |
| get_mouse_button | `NavigationPolicyDecision.get_mouse_button() -> guint` | webkit_navigation_policy_decision_get_mouse_button |  | Gets the value of the #WebKitNavigationPolicyDecision:mouse-button property. |
| get_navigation_action | `NavigationPolicyDecision.get_navigation_action() -> NavigationAction` | webkit_navigation_policy_decision_get_navigation_action | 2.6 | Gets the value of the #WebKitNavigationPolicyDecision:navigation-action property. |
| get_navigation_type | `NavigationPolicyDecision.get_navigation_type() -> NavigationType` | webkit_navigation_policy_decision_get_navigation_type |  | Gets the value of the #WebKitNavigationPolicyDecision:navigation-type property. |
| get_request | `NavigationPolicyDecision.get_request() -> URIRequest` | webkit_navigation_policy_decision_get_request |  | Gets the value of the #WebKitNavigationPolicyDecision:request property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| frame-name | utf8 | read | If this navigation request targets a new frame, this property contains the name of that frame. For example if the decision was triggered by clickin... |
| modifiers | guint | read | If the navigation associated with this policy decision was originally triggered by a mouse event, this property contains a bitmask of various #GdkM... |
| mouse-button | guint | read | If the navigation associated with this policy decision was originally triggered by a mouse event, this property contains non-zero button number of ... |
| navigation-action | NavigationAction | read | The #WebKitNavigationAction that triggered this policy decision. |
| navigation-type | NavigationType | read | The type of navigation that triggered this policy decision. This is useful for enacting different policies depending on what type of user action ca... |
| request | URIRequest | read | This property contains the #WebKitURIRequest associated with this navigation. |

### WebKit2.Notification

Parent: `GObject.Object` ?? GType: `WebKitNotification` ?? C type: `WebKitNotification`

Holds information about a notification that should be shown to the user.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | NotificationPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clicked | `Notification.clicked() -> none` | webkit_notification_clicked | 2.12 | Tells WebKit the notification has been clicked. This will emit the #WebKitNotification::clicked signal. |
| close | `Notification.close() -> none` | webkit_notification_close | 2.8 | Closes the notification. |
| get_body | `Notification.get_body() -> utf8` | webkit_notification_get_body | 2.8 | Obtains the body for the notification. |
| get_id | `Notification.get_id() -> guint64` | webkit_notification_get_id | 2.8 | Obtains the unique id for the notification. |
| get_tag | `Notification.get_tag() -> utf8` | webkit_notification_get_tag | 2.16 | Obtains the tag identifier for the notification. |
| get_title | `Notification.get_title() -> utf8` | webkit_notification_get_title | 2.8 | Obtains the title for the notification. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| body | utf8 | read | The body for the notification. |
| id | guint64 | read | The unique id for the notification. |
| tag | utf8 | read | The tag identifier for the notification. |
| title | utf8 | read | The title for the notification. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| clicked | `` | none | last | 2.12 | Emitted when a notification has been clicked. See webkit_notification_clicked(). |
| closed | `` | none | last | 2.8 | Emitted when a notification has been withdrawn. The default handler will close the notification using libnotify, if built with support for it. |

### WebKit2.NotificationPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitNotificationPermissionRequest` ?? C type: `WebKitNotificationPermissionRequest`

A permission request for displaying web notifications. WebKitNotificationPermissionRequest represents a request for permission to decide whether We...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | NotificationPermissionRequestPrivate |

### WebKit2.OptionMenu

Parent: `GObject.Object` ?? GType: `WebKitOptionMenu` ?? C type: `WebKitOptionMenu`

Represents the dropdown menu of a `select` element in a #WebKitWebView. When a select element in a #WebKitWebView needs to display a dropdown menu,...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | OptionMenuPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| activate_item | `OptionMenu.activate_item(index: guint) -> none` | webkit_option_menu_activate_item | 2.18 | Activates the #WebKitOptionMenuItem at @index in @menu. Activating an item changes the value of the element making the item the active one. You are... |
| close | `OptionMenu.close() -> none` | webkit_option_menu_close | 2.18 | Request to close a #WebKitOptionMenu. This emits WebKitOptionMenu::close signal. This function should always be called to notify WebKit that the as... |
| get_event | `OptionMenu.get_event() -> Gdk.Event` | webkit_option_menu_get_event | 2.40 | Gets the #GdkEvent that triggered the dropdown menu. If @menu was not triggered by a user interaction, like a mouse click, %NULL is returned. |
| get_item | `OptionMenu.get_item(index: guint) -> OptionMenuItem` | webkit_option_menu_get_item | 2.18 | Returns the #WebKitOptionMenuItem at @index in @menu. |
| get_n_items | `OptionMenu.get_n_items() -> guint` | webkit_option_menu_get_n_items | 2.18 | Gets the length of the @menu. |
| select_item | `OptionMenu.select_item(index: guint) -> none` | webkit_option_menu_select_item | 2.18 | Selects the #WebKitOptionMenuItem at @index in @menu. Selecting an item changes the text shown by the combo button, but it doesn't change the value... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| close | `` | none | last | 2.18 | Emitted when closing a #WebKitOptionMenu is requested. This can happen when the user explicitly calls webkit_option_menu_close() or when the elemen... |

### WebKit2.Plugin

Parent: `GObject.Object` ?? GType: `WebKitPlugin` ?? C type: `WebKitPlugin`

Represents a plugin, enabling fine-grained control. This object represents a single plugin, found while scanning the various platform plugin direct...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | PluginPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_description | `Plugin.get_description() -> utf8` | webkit_plugin_get_description |  | Obtain the plugin description. |
| get_mime_info_list | `Plugin.get_mime_info_list() -> GLib.List` | webkit_plugin_get_mime_info_list |  | Get information about MIME types handled by the plugin. Get information about MIME types handled by the plugin, as a list of #WebKitMimeInfo. |
| get_name | `Plugin.get_name() -> utf8` | webkit_plugin_get_name |  | Obtain the plugin name. |
| get_path | `Plugin.get_path() -> utf8` | webkit_plugin_get_path |  | Obtain the absolute path where the plugin is installed. |

### WebKit2.PointerLockPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitPointerLockPermissionRequest` ?? C type: `WebKitPointerLockPermissionRequest`

A permission request for locking the pointer. WebKitPointerLockPermissionRequest represents a request for permission to decide whether WebKit can l...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | PointerLockPermissionRequestPrivate |

### WebKit2.PolicyDecision

Parent: `GObject.Object` ?? Subclasses: `NavigationPolicyDecision`, `ResponsePolicyDecision` ?? GType: `WebKitPolicyDecision` ?? C type: `WebKitPolicyDecision` ?? Abstract

A pending policy decision. Often WebKit allows the client to decide the policy for certain operations. For instance, a client may want to open a li...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | PolicyDecisionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| download | `PolicyDecision.download() -> none` | webkit_policy_decision_download |  | Spawn a download from this decision. |
| ignore | `PolicyDecision.ignore() -> none` | webkit_policy_decision_ignore |  | #WebKitResponsePolicyDecision, this would cancel the request. Ignore the action which triggered this decision. For instance, for a #WebKitResponseP... |
| use | `PolicyDecision.use() -> none` | webkit_policy_decision_use |  | Accept the action which triggered this decision. |
| use_with_policies | `PolicyDecision.use_with_policies(policies: WebsitePolicies) -> none` | webkit_policy_decision_use_with_policies | 2.30 | Accept the navigation action and continue with provided @policies. Accept the navigation action which triggered this decision, and continue with @p... |

### WebKit2.PrintCustomWidget

Parent: `GObject.Object` ?? GType: `WebKitPrintCustomWidget` ?? C type: `WebKitPrintCustomWidget`

Allows to embed a custom widget in print dialog. A WebKitPrintCustomWidget allows to embed a custom widget in the print dialog by connecting to the...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | PrintCustomWidgetPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PrintCustomWidget.new(widget: Gtk.Widget, title: utf8) -> PrintCustomWidget` | webkit_print_custom_widget_new | 2.16 | Create a new #WebKitPrintCustomWidget with given @widget and @title. The @widget ownership is taken and it is destroyed together with the dialog ev... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_title | `PrintCustomWidget.get_title() -> utf8` | webkit_print_custom_widget_get_title | 2.16 | Return the value of #WebKitPrintCustomWidget:title property. Return the value of #WebKitPrintCustomWidget:title property for the given @print_custo... |
| get_widget | `PrintCustomWidget.get_widget() -> Gtk.Widget` | webkit_print_custom_widget_get_widget | 2.16 | Return the value of #WebKitPrintCustomWidget:widget property. Return the value of #WebKitPrintCustomWidget:widget property for the given @print_cus... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| title | utf8 | read, write, construct-only | The title of the custom widget. |
| widget | Gtk.Widget | read, write, construct-only | The custom #GtkWidget that will be embedded in the dialog. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| apply | `` | none | last | 2.16 | Emitted right before the printing will start. You should read the information from the widget and update the content based on it if necessary. The ... |
| update | `page_setup: Gtk.PageSetup, print_settings: Gtk.PrintSettings` | none | last | 2.16 | Emitted after change of selected printer in the dialog. The actual page setup and print settings are available and the custom widget can actualize ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| apply | `apply(widget: Gtk.Widget) -> none` |  |  |  |
| update | `update(widget: Gtk.Widget, page_setup: Gtk.PageSetup, print_settings: Gtk.PrintSettings) -> none` |  |  |  |

### WebKit2.PrintOperation

Parent: `GObject.Object` ?? GType: `WebKitPrintOperation` ?? C type: `WebKitPrintOperation`

Controls a print operation. A #WebKitPrintOperation controls a print operation in WebKit. With a similar API to #GtkPrintOperation, it lets you set...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | PrintOperationPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PrintOperation.new(web_view: WebView) -> PrintOperation` | webkit_print_operation_new |  | Create a new #WebKitPrintOperation to print @web_view contents. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_page_setup | `PrintOperation.get_page_setup() -> Gtk.PageSetup` | webkit_print_operation_get_page_setup |  | Return the current page setup of @print_operation. It returns %NULL until either webkit_print_operation_set_page_setup() or webkit_print_operation_... |
| get_print_settings | `PrintOperation.get_print_settings() -> Gtk.PrintSettings` | webkit_print_operation_get_print_settings |  | Return the current print settings of @print_operation. It returns %NULL until either webkit_print_operation_set_print_settings() or webkit_print_op... |
| print | `PrintOperation.print() -> none` | webkit_print_operation_print |  | Start a print operation using current print settings and page setup. Start a print operation using current print settings and page setup without sh... |
| run_dialog | `PrintOperation.run_dialog(parent: Gtk.Window?) -> PrintOperationResponse` | webkit_print_operation_run_dialog |  | Run the print dialog and start printing. Run the print dialog and start printing using the options selected by the user. This method returns when t... |
| set_page_setup | `PrintOperation.set_page_setup(page_setup: Gtk.PageSetup) -> none` | webkit_print_operation_set_page_setup |  | Set the current page setup of @print_operation. Current page setup is used for the initial values of the print dialog when webkit_print_operation_r... |
| set_print_settings | `PrintOperation.set_print_settings(print_settings: Gtk.PrintSettings) -> none` | webkit_print_operation_set_print_settings |  | Set the current print settings of @print_operation. Set the current print settings of @print_operation. Current print settings are used for the ini... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| page-setup | Gtk.PageSetup | read, write | The initial #GtkPageSetup for the print operation. |
| print-settings | Gtk.PrintSettings | read, write | The initial #GtkPrintSettings for the print operation. |
| web-view | WebView | read, write, construct-only | The #WebKitWebView that will be printed. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| create-custom-widget | `` | PrintCustomWidget | last | 2.16 | Emitted when displaying the print dialog with webkit_print_operation_run_dialog(). The returned #WebKitPrintCustomWidget will be added to the print... |
| failed | `error: GLib.Error` | none | last |  | Emitted when an error occurs while printing. The given @error, of the domain %WEBKIT_PRINT_ERROR, contains further details of the failure. The #Web... |
| finished | `` | none | last |  | Emitted when the print operation has finished doing everything required for printing. |

### WebKit2.ResponsePolicyDecision

Parent: `PolicyDecision` ?? GType: `WebKitResponsePolicyDecision` ?? C type: `WebKitResponsePolicyDecision`

A policy decision for resource responses. WebKitResponsePolicyDecision represents a policy decision for a resource response, whether from the netwo...

#### Fields

| Field | Type |
| --- | --- |
| parent | PolicyDecision |
| priv | ResponsePolicyDecisionPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_request | `ResponsePolicyDecision.get_request() -> URIRequest` | webkit_response_policy_decision_get_request |  | Return the #WebKitURIRequest associated with the response decision. Modifications to the returned object are <emphasis>not</emphasis> taken into ac... |
| get_response | `ResponsePolicyDecision.get_response() -> URIResponse` | webkit_response_policy_decision_get_response |  | Gets the value of the #WebKitResponsePolicyDecision:response property. |
| is_main_frame_main_resource | `ResponsePolicyDecision.is_main_frame_main_resource() -> gboolean` | webkit_response_policy_decision_is_main_frame_main_resource | 2.40 | Gets whether the request is the main frame main resource |
| is_mime_type_supported | `ResponsePolicyDecision.is_mime_type_supported() -> gboolean` | webkit_response_policy_decision_is_mime_type_supported | 2.4 | Gets whether the MIME type of the response can be displayed in the #WebKitWebView. Gets whether the MIME type of the response can be displayed in t... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| request | URIRequest | read | This property contains the #WebKitURIRequest associated with this policy decision. |
| response | URIResponse | read | This property contains the #WebKitURIResponse associated with this policy decision. |

### WebKit2.SecurityManager

Parent: `GObject.Object` ?? GType: `WebKitSecurityManager` ?? C type: `WebKitSecurityManager`

Controls security settings in a #WebKitWebContext. The #WebKitSecurityManager defines security settings for URI schemes in a #WebKitWebContext. Get...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | SecurityManagerPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register_uri_scheme_as_cors_enabled | `SecurityManager.register_uri_scheme_as_cors_enabled(scheme: utf8) -> none` | webkit_security_manager_register_uri_scheme_as_cors_enabled |  | Register @scheme as a CORS (Cross-origin resource sharing) enabled scheme. This means that CORS requests are allowed. See W3C CORS specification ht... |
| register_uri_scheme_as_display_isolated | `SecurityManager.register_uri_scheme_as_display_isolated(scheme: utf8) -> none` | webkit_security_manager_register_uri_scheme_as_display_isolated |  | Register @scheme as a display isolated scheme. This means that pages cannot display these URIs unless they are from the same scheme. |
| register_uri_scheme_as_empty_document | `SecurityManager.register_uri_scheme_as_empty_document(scheme: utf8) -> none` | webkit_security_manager_register_uri_scheme_as_empty_document |  | Register @scheme as an empty document scheme. This means that they are allowed to commit synchronously. |
| register_uri_scheme_as_local | `SecurityManager.register_uri_scheme_as_local(scheme: utf8) -> none` | webkit_security_manager_register_uri_scheme_as_local |  | Register @scheme as a local scheme. This means that other non-local pages cannot link to or access URIs of this scheme. |
| register_uri_scheme_as_no_access | `SecurityManager.register_uri_scheme_as_no_access(scheme: utf8) -> none` | webkit_security_manager_register_uri_scheme_as_no_access |  | Register @scheme as a no-access scheme. This means that pages loaded with this URI scheme cannot access pages loaded with any other URI scheme. |
| register_uri_scheme_as_secure | `SecurityManager.register_uri_scheme_as_secure(scheme: utf8) -> none` | webkit_security_manager_register_uri_scheme_as_secure |  | Register @scheme as a secure scheme. This means that mixed content warnings won't be generated for this scheme when included by an HTTPS page. |
| uri_scheme_is_cors_enabled | `SecurityManager.uri_scheme_is_cors_enabled(scheme: utf8) -> gboolean` | webkit_security_manager_uri_scheme_is_cors_enabled |  | Whether @scheme is considered as a CORS enabled scheme. See also webkit_security_manager_register_uri_scheme_as_cors_enabled(). |
| uri_scheme_is_display_isolated | `SecurityManager.uri_scheme_is_display_isolated(scheme: utf8) -> gboolean` | webkit_security_manager_uri_scheme_is_display_isolated |  | Whether @scheme is considered as a display isolated scheme. See also webkit_security_manager_register_uri_scheme_as_display_isolated(). |
| uri_scheme_is_empty_document | `SecurityManager.uri_scheme_is_empty_document(scheme: utf8) -> gboolean` | webkit_security_manager_uri_scheme_is_empty_document |  | Whether @scheme is considered as an empty document scheme. See also webkit_security_manager_register_uri_scheme_as_empty_document(). |
| uri_scheme_is_local | `SecurityManager.uri_scheme_is_local(scheme: utf8) -> gboolean` | webkit_security_manager_uri_scheme_is_local |  | Whether @scheme is considered as a local scheme. See also webkit_security_manager_register_uri_scheme_as_local(). |
| uri_scheme_is_no_access | `SecurityManager.uri_scheme_is_no_access(scheme: utf8) -> gboolean` | webkit_security_manager_uri_scheme_is_no_access |  | Whether @scheme is considered as a no-access scheme. See also webkit_security_manager_register_uri_scheme_as_no_access(). |
| uri_scheme_is_secure | `SecurityManager.uri_scheme_is_secure(scheme: utf8) -> gboolean` | webkit_security_manager_uri_scheme_is_secure |  | Whether @scheme is considered as a secure scheme. See also webkit_security_manager_register_uri_scheme_as_secure(). |

### WebKit2.Settings

Parent: `GObject.Object` ?? GType: `WebKitSettings` ?? C type: `WebKitSettings`

Control the behaviour of a #WebKitWebView. #WebKitSettings can be applied to a #WebKitWebView to control text charset, color, font sizes, printing ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | SettingsPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Settings.new() -> Settings` | webkit_settings_new |  | Creates a new #WebKitSettings instance with default values. It must be manually attached to a #WebKitWebView. See also webkit_settings_new_with_set... |
| new_with_settings | `Settings.new_with_settings(first_setting_name: utf8, ...: void) -> Settings` | webkit_settings_new_with_settings |  | Creates a new #WebKitSettings instance with the given settings. It must be manually attached to a #WebKitWebView. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| font_size_to_pixels | `font_size_to_pixels(points: guint32) -> guint32` | webkit_settings_font_size_to_pixels | 2.20 | Convert @points to the equivalent value in pixels. Applications can use this function to convert font size values in points to font size values in ... |
| font_size_to_points | `font_size_to_points(pixels: guint32) -> guint32` | webkit_settings_font_size_to_points | 2.20 | Convert @pixels to the equivalent value in points. Applications can use this function to convert font size values in pixels to font size values in ... |
| get_all_features | `get_all_features() -> FeatureList` | webkit_settings_get_all_features | 2.42 | Gets the list of all available WebKit features. Features can be toggled with [method@Settings.set_feature_enabled], and their current state determi... |
| get_development_features | `get_development_features() -> FeatureList` | webkit_settings_get_development_features | 2.42 | Gets the list of available development WebKit features. The returned features are a subset of those returned by [func@Settings.get_all_features], a... |
| get_experimental_features | `get_experimental_features() -> FeatureList` | webkit_settings_get_experimental_features | 2.42 | Gets the list of available experimental WebKit features. The returned features are a subset of those returned by [func@Settings.get_all_features], ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| apply_from_key_file | `Settings.apply_from_key_file(key_file: GLib.KeyFile, group_name: utf8) -> gboolean throws` | webkit_settings_apply_from_key_file | 2.46 | Reads the contents of the given @group_name from the given @key_file and apply the value of each key/value to the corresponding property on the @se... |
| get_allow_file_access_from_file_urls | `Settings.get_allow_file_access_from_file_urls() -> gboolean` | webkit_settings_get_allow_file_access_from_file_urls | 2.10 | Get the #WebKitSettings:allow-file-access-from-file-urls property. |
| get_allow_modal_dialogs | `Settings.get_allow_modal_dialogs() -> gboolean` | webkit_settings_get_allow_modal_dialogs |  | Get the #WebKitSettings:allow-modal-dialogs property. |
| get_allow_top_navigation_to_data_urls | `Settings.get_allow_top_navigation_to_data_urls() -> gboolean` | webkit_settings_get_allow_top_navigation_to_data_urls | 2.28 | Get the #WebKitSettings:allow-top-navigation-to-data-urls property. |
| get_allow_universal_access_from_file_urls | `Settings.get_allow_universal_access_from_file_urls() -> gboolean` | webkit_settings_get_allow_universal_access_from_file_urls | 2.14 | Get the #WebKitSettings:allow-universal-access-from-file-urls property. |
| get_auto_load_images | `Settings.get_auto_load_images() -> gboolean` | webkit_settings_get_auto_load_images |  | Get the #WebKitSettings:auto-load-images property. |
| get_cursive_font_family | `Settings.get_cursive_font_family() -> utf8` | webkit_settings_get_cursive_font_family |  | Gets the #WebKitSettings:cursive-font-family property. |
| get_default_charset | `Settings.get_default_charset() -> utf8` | webkit_settings_get_default_charset |  | Gets the #WebKitSettings:default-charset property. |
| get_default_font_family | `Settings.get_default_font_family() -> utf8` | webkit_settings_get_default_font_family |  | Gets the #WebKitSettings:default-font-family property. |
| get_default_font_size | `Settings.get_default_font_size() -> guint32` | webkit_settings_get_default_font_size |  | Gets the #WebKitSettings:default-font-size property. |
| get_default_monospace_font_size | `Settings.get_default_monospace_font_size() -> guint32` | webkit_settings_get_default_monospace_font_size |  | Gets the #WebKitSettings:default-monospace-font-size property. |
| get_disable_web_security | `Settings.get_disable_web_security() -> gboolean` | webkit_settings_get_disable_web_security | 2.40 | Get the #WebKitSettings:disable-web-security property. |
| get_draw_compositing_indicators | `Settings.get_draw_compositing_indicators() -> gboolean` | webkit_settings_get_draw_compositing_indicators |  | Get the #WebKitSettings:draw-compositing-indicators property. |
| get_enable_2d_canvas_acceleration | `Settings.get_enable_2d_canvas_acceleration() -> gboolean` | webkit_settings_get_enable_2d_canvas_acceleration | 2.46 | Get the #WebKitSettings:enable-2d-canvas-acceleration property. |
| get_enable_accelerated_2d_canvas | `Settings.get_enable_accelerated_2d_canvas() -> gboolean` | webkit_settings_get_enable_accelerated_2d_canvas | 2.2 | Get the #WebKitSettings:enable-accelerated-2d-canvas property. |
| get_enable_back_forward_navigation_gestures | `Settings.get_enable_back_forward_navigation_gestures() -> gboolean` | webkit_settings_get_enable_back_forward_navigation_gestures | 2.24 | Get the #WebKitSettings:enable-back-forward-navigation-gestures property. |
| get_enable_caret_browsing | `Settings.get_enable_caret_browsing() -> gboolean` | webkit_settings_get_enable_caret_browsing |  | Get the #WebKitSettings:enable-caret-browsing property. |
| get_enable_developer_extras | `Settings.get_enable_developer_extras() -> gboolean` | webkit_settings_get_enable_developer_extras |  | Get the #WebKitSettings:enable-developer-extras property. |
| get_enable_dns_prefetching | `Settings.get_enable_dns_prefetching() -> gboolean` | webkit_settings_get_enable_dns_prefetching |  | Get the #WebKitSettings:enable-dns-prefetching property. |
| get_enable_encrypted_media | `Settings.get_enable_encrypted_media() -> gboolean` | webkit_settings_get_enable_encrypted_media | 2.20 | Get the #WebKitSettings:enable-encrypted-media property. |
| get_enable_frame_flattening | `Settings.get_enable_frame_flattening() -> gboolean` | webkit_settings_get_enable_frame_flattening |  | Frame flattening is no longer supported. This function returns %FALSE. |
| get_enable_fullscreen | `Settings.get_enable_fullscreen() -> gboolean` | webkit_settings_get_enable_fullscreen |  | Get the #WebKitSettings:enable-fullscreen property. |
| get_enable_html5_database | `Settings.get_enable_html5_database() -> gboolean` | webkit_settings_get_enable_html5_database |  | Get the #WebKitSettings:enable-html5-database property. |
| get_enable_html5_local_storage | `Settings.get_enable_html5_local_storage() -> gboolean` | webkit_settings_get_enable_html5_local_storage |  | Get the #WebKitSettings:enable-html5-local-storage property. |
| get_enable_hyperlink_auditing | `Settings.get_enable_hyperlink_auditing() -> gboolean` | webkit_settings_get_enable_hyperlink_auditing |  | Get the #WebKitSettings:enable-hyperlink-auditing property. |
| get_enable_java | `Settings.get_enable_java() -> gboolean` | webkit_settings_get_enable_java |  | Get the #WebKitSettings:enable-java property. |
| get_enable_javascript | `Settings.get_enable_javascript() -> gboolean` | webkit_settings_get_enable_javascript |  | Get the #WebKitSettings:enable-javascript property. |
| get_enable_javascript_markup | `Settings.get_enable_javascript_markup() -> gboolean` | webkit_settings_get_enable_javascript_markup | 2.24 | Get the #WebKitSettings:enable-javascript-markup property. |
| get_enable_media | `Settings.get_enable_media() -> gboolean` | webkit_settings_get_enable_media | 2.26 | Get the #WebKitSettings:enable-media property. |
| get_enable_media_capabilities | `Settings.get_enable_media_capabilities() -> gboolean` | webkit_settings_get_enable_media_capabilities | 2.22 | Get the #WebKitSettings:enable-media-capabilities property. |
| get_enable_media_stream | `Settings.get_enable_media_stream() -> gboolean` | webkit_settings_get_enable_media_stream | 2.4 | Get the #WebKitSettings:enable-media-stream property. |
| get_enable_mediasource | `Settings.get_enable_mediasource() -> gboolean` | webkit_settings_get_enable_mediasource | 2.4 | Get the #WebKitSettings:enable-mediasource property. |
| get_enable_mock_capture_devices | `Settings.get_enable_mock_capture_devices() -> gboolean` | webkit_settings_get_enable_mock_capture_devices | 2.24 | Get the #WebKitSettings:enable-mock-capture-devices property. |
| get_enable_offline_web_application_cache | `Settings.get_enable_offline_web_application_cache() -> gboolean` | webkit_settings_get_enable_offline_web_application_cache |  | Get the #WebKitSettings:enable-offline-web-application-cache property. |
| get_enable_page_cache | `Settings.get_enable_page_cache() -> gboolean` | webkit_settings_get_enable_page_cache |  | Get the #WebKitSettings:enable-page-cache property. |
| get_enable_plugins | `Settings.get_enable_plugins() -> gboolean` | webkit_settings_get_enable_plugins |  | Get the #WebKitSettings:enable-plugins property. |
| get_enable_private_browsing | `Settings.get_enable_private_browsing() -> gboolean` | webkit_settings_get_enable_private_browsing |  | Get the #WebKitSettings:enable-private-browsing property. |
| get_enable_resizable_text_areas | `Settings.get_enable_resizable_text_areas() -> gboolean` | webkit_settings_get_enable_resizable_text_areas |  | Get the #WebKitSettings:enable-resizable-text-areas property. |
| get_enable_site_specific_quirks | `Settings.get_enable_site_specific_quirks() -> gboolean` | webkit_settings_get_enable_site_specific_quirks |  | Get the #WebKitSettings:enable-site-specific-quirks property. |
| get_enable_smooth_scrolling | `Settings.get_enable_smooth_scrolling() -> gboolean` | webkit_settings_get_enable_smooth_scrolling |  | Get the #WebKitSettings:enable-smooth-scrolling property. |
| get_enable_spatial_navigation | `Settings.get_enable_spatial_navigation() -> gboolean` | webkit_settings_get_enable_spatial_navigation | 2.2 | Get the #WebKitSettings:enable-spatial-navigation property. |
| get_enable_tabs_to_links | `Settings.get_enable_tabs_to_links() -> gboolean` | webkit_settings_get_enable_tabs_to_links |  | Get the #WebKitSettings:enable-tabs-to-links property. |
| get_enable_webaudio | `Settings.get_enable_webaudio() -> gboolean` | webkit_settings_get_enable_webaudio |  | Get the #WebKitSettings:enable-webaudio property. |
| get_enable_webgl | `Settings.get_enable_webgl() -> gboolean` | webkit_settings_get_enable_webgl |  | Get the #WebKitSettings:enable-webgl property. |
| get_enable_webrtc | `Settings.get_enable_webrtc() -> gboolean` | webkit_settings_get_enable_webrtc | 2.38 | Get the [property@Settings:enable-webrtc] property. |
| get_enable_write_console_messages_to_stdout | `Settings.get_enable_write_console_messages_to_stdout() -> gboolean` | webkit_settings_get_enable_write_console_messages_to_stdout | 2.2 | Get the #WebKitSettings:enable-write-console-messages-to-stdout property. |
| get_enable_xss_auditor | `Settings.get_enable_xss_auditor() -> gboolean` | webkit_settings_get_enable_xss_auditor |  | The XSS auditor has been removed. This function returns %FALSE. |
| get_fantasy_font_family | `Settings.get_fantasy_font_family() -> utf8` | webkit_settings_get_fantasy_font_family |  | Gets the #WebKitSettings:fantasy-font-family property. |
| get_feature_enabled | `Settings.get_feature_enabled(feature: Feature) -> gboolean` | webkit_settings_get_feature_enabled | 2.42 | Gets whether a feature is enabled. |
| get_hardware_acceleration_policy | `Settings.get_hardware_acceleration_policy() -> HardwareAccelerationPolicy` | webkit_settings_get_hardware_acceleration_policy | 2.16 | Get the #WebKitSettings:hardware-acceleration-policy property. |
| get_javascript_can_access_clipboard | `Settings.get_javascript_can_access_clipboard() -> gboolean` | webkit_settings_get_javascript_can_access_clipboard |  | Get the #WebKitSettings:javascript-can-access-clipboard property. |
| get_javascript_can_open_windows_automatically | `Settings.get_javascript_can_open_windows_automatically() -> gboolean` | webkit_settings_get_javascript_can_open_windows_automatically |  | Get the #WebKitSettings:javascript-can-open-windows-automatically property. |
| get_load_icons_ignoring_image_load_setting | `Settings.get_load_icons_ignoring_image_load_setting() -> gboolean` | webkit_settings_get_load_icons_ignoring_image_load_setting |  | Setting no longer supported. This function returns %FALSE. |
| get_math_font_family | `Settings.get_math_font_family() -> utf8` | webkit_settings_get_math_font_family |  | Gets the #WebKitSettings:math-font-family property. |
| get_media_content_types_requiring_hardware_support | `Settings.get_media_content_types_requiring_hardware_support() -> utf8` | webkit_settings_get_media_content_types_requiring_hardware_support | 2.30 | Gets the #WebKitSettings:media-content-types-requiring-hardware-support property. |
| get_media_playback_allows_inline | `Settings.get_media_playback_allows_inline() -> gboolean` | webkit_settings_get_media_playback_allows_inline |  | Get the #WebKitSettings:media-playback-allows-inline property. |
| get_media_playback_requires_user_gesture | `Settings.get_media_playback_requires_user_gesture() -> gboolean` | webkit_settings_get_media_playback_requires_user_gesture |  | Get the #WebKitSettings:media-playback-requires-user-gesture property. |
| get_minimum_font_size | `Settings.get_minimum_font_size() -> guint32` | webkit_settings_get_minimum_font_size |  | Gets the #WebKitSettings:minimum-font-size property. |
| get_monospace_font_family | `Settings.get_monospace_font_family() -> utf8` | webkit_settings_get_monospace_font_family |  | Gets the #WebKitSettings:monospace-font-family property. |
| get_pictograph_font_family | `Settings.get_pictograph_font_family() -> utf8` | webkit_settings_get_pictograph_font_family |  | Gets the #WebKitSettings:pictograph-font-family property. |
| get_print_backgrounds | `Settings.get_print_backgrounds() -> gboolean` | webkit_settings_get_print_backgrounds |  | Get the #WebKitSettings:print-backgrounds property. |
| get_sans_serif_font_family | `Settings.get_sans_serif_font_family() -> utf8` | webkit_settings_get_sans_serif_font_family |  | Gets the #WebKitSettings:sans-serif-font-family property. |
| get_serif_font_family | `Settings.get_serif_font_family() -> utf8` | webkit_settings_get_serif_font_family |  | Gets the #WebKitSettings:serif-font-family property. |
| get_user_agent | `Settings.get_user_agent() -> utf8` | webkit_settings_get_user_agent |  | Get the #WebKitSettings:user-agent property. |
| get_webrtc_udp_ports_range | `Settings.get_webrtc_udp_ports_range() -> utf8` | webkit_settings_get_webrtc_udp_ports_range | 2.48 | Get the [property@Settings:webrtc-udp-ports-range] property. |
| get_zoom_text_only | `Settings.get_zoom_text_only() -> gboolean` | webkit_settings_get_zoom_text_only |  | Get the #WebKitSettings:zoom-text-only property. |
| set_allow_file_access_from_file_urls | `Settings.set_allow_file_access_from_file_urls(allowed: gboolean) -> none` | webkit_settings_set_allow_file_access_from_file_urls | 2.10 | Set the #WebKitSettings:allow-file-access-from-file-urls property. |
| set_allow_modal_dialogs | `Settings.set_allow_modal_dialogs(allowed: gboolean) -> none` | webkit_settings_set_allow_modal_dialogs |  | Set the #WebKitSettings:allow-modal-dialogs property. |
| set_allow_top_navigation_to_data_urls | `Settings.set_allow_top_navigation_to_data_urls(allowed: gboolean) -> none` | webkit_settings_set_allow_top_navigation_to_data_urls | 2.28 | Set the #WebKitSettings:allow-top-navigation-to-data-urls property. |
| set_allow_universal_access_from_file_urls | `Settings.set_allow_universal_access_from_file_urls(allowed: gboolean) -> none` | webkit_settings_set_allow_universal_access_from_file_urls | 2.14 | Set the #WebKitSettings:allow-universal-access-from-file-urls property. |
| set_auto_load_images | `Settings.set_auto_load_images(enabled: gboolean) -> none` | webkit_settings_set_auto_load_images |  | Set the #WebKitSettings:auto-load-images property. |
| set_cursive_font_family | `Settings.set_cursive_font_family(cursive_font_family: utf8) -> none` | webkit_settings_set_cursive_font_family |  | Set the #WebKitSettings:cursive-font-family property. |
| set_default_charset | `Settings.set_default_charset(default_charset: utf8) -> none` | webkit_settings_set_default_charset |  | Set the #WebKitSettings:default-charset property. |
| set_default_font_family | `Settings.set_default_font_family(default_font_family: utf8) -> none` | webkit_settings_set_default_font_family |  | Set the #WebKitSettings:default-font-family property. |
| set_default_font_size | `Settings.set_default_font_size(font_size: guint32) -> none` | webkit_settings_set_default_font_size |  | Set the #WebKitSettings:default-font-size property. |
| set_default_monospace_font_size | `Settings.set_default_monospace_font_size(font_size: guint32) -> none` | webkit_settings_set_default_monospace_font_size |  | Set the #WebKitSettings:default-monospace-font-size property. |
| set_disable_web_security | `Settings.set_disable_web_security(disabled: gboolean) -> none` | webkit_settings_set_disable_web_security | 2.40 | Set the #WebKitSettings:disable-web-security property. |
| set_draw_compositing_indicators | `Settings.set_draw_compositing_indicators(enabled: gboolean) -> none` | webkit_settings_set_draw_compositing_indicators |  | Set the #WebKitSettings:draw-compositing-indicators property. |
| set_enable_2d_canvas_acceleration | `Settings.set_enable_2d_canvas_acceleration(enabled: gboolean) -> none` | webkit_settings_set_enable_2d_canvas_acceleration | 2.46 | Set the #WebKitSettings:enable-2d-canvas-acceleration property. |
| set_enable_accelerated_2d_canvas | `Settings.set_enable_accelerated_2d_canvas(enabled: gboolean) -> none` | webkit_settings_set_enable_accelerated_2d_canvas | 2.2 | Set the #WebKitSettings:enable-accelerated-2d-canvas property. |
| set_enable_back_forward_navigation_gestures | `Settings.set_enable_back_forward_navigation_gestures(enabled: gboolean) -> none` | webkit_settings_set_enable_back_forward_navigation_gestures | 2.24 | Set the #WebKitSettings:enable-back-forward-navigation-gestures property. |
| set_enable_caret_browsing | `Settings.set_enable_caret_browsing(enabled: gboolean) -> none` | webkit_settings_set_enable_caret_browsing |  | Set the #WebKitSettings:enable-caret-browsing property. |
| set_enable_developer_extras | `Settings.set_enable_developer_extras(enabled: gboolean) -> none` | webkit_settings_set_enable_developer_extras |  | Set the #WebKitSettings:enable-developer-extras property. |
| set_enable_dns_prefetching | `Settings.set_enable_dns_prefetching(enabled: gboolean) -> none` | webkit_settings_set_enable_dns_prefetching |  | Set the #WebKitSettings:enable-dns-prefetching property. |
| set_enable_encrypted_media | `Settings.set_enable_encrypted_media(enabled: gboolean) -> none` | webkit_settings_set_enable_encrypted_media | 2.20 | Set the #WebKitSettings:enable-encrypted-media property. |
| set_enable_frame_flattening | `Settings.set_enable_frame_flattening(enabled: gboolean) -> none` | webkit_settings_set_enable_frame_flattening |  | Frame flattening is no longer supported. This function does nothing. |
| set_enable_fullscreen | `Settings.set_enable_fullscreen(enabled: gboolean) -> none` | webkit_settings_set_enable_fullscreen |  | Set the #WebKitSettings:enable-fullscreen property. |
| set_enable_html5_database | `Settings.set_enable_html5_database(enabled: gboolean) -> none` | webkit_settings_set_enable_html5_database |  | Set the #WebKitSettings:enable-html5-database property. |
| set_enable_html5_local_storage | `Settings.set_enable_html5_local_storage(enabled: gboolean) -> none` | webkit_settings_set_enable_html5_local_storage |  | Set the #WebKitSettings:enable-html5-local-storage property. |
| set_enable_hyperlink_auditing | `Settings.set_enable_hyperlink_auditing(enabled: gboolean) -> none` | webkit_settings_set_enable_hyperlink_auditing |  | Set the #WebKitSettings:enable-hyperlink-auditing property. |
| set_enable_java | `Settings.set_enable_java(enabled: gboolean) -> none` | webkit_settings_set_enable_java |  | Set the #WebKitSettings:enable-java property. Deprecated function that does nothing. |
| set_enable_javascript | `Settings.set_enable_javascript(enabled: gboolean) -> none` | webkit_settings_set_enable_javascript |  | Set the #WebKitSettings:enable-javascript property. |
| set_enable_javascript_markup | `Settings.set_enable_javascript_markup(enabled: gboolean) -> none` | webkit_settings_set_enable_javascript_markup | 2.24 | Set the #WebKitSettings:enable-javascript-markup property. |
| set_enable_media | `Settings.set_enable_media(enabled: gboolean) -> none` | webkit_settings_set_enable_media | 2.26 | Set the #WebKitSettings:enable-media property. |
| set_enable_media_capabilities | `Settings.set_enable_media_capabilities(enabled: gboolean) -> none` | webkit_settings_set_enable_media_capabilities | 2.22 | Set the #WebKitSettings:enable-media-capabilities property. |
| set_enable_media_stream | `Settings.set_enable_media_stream(enabled: gboolean) -> none` | webkit_settings_set_enable_media_stream | 2.4 | Set the #WebKitSettings:enable-media-stream property. |
| set_enable_mediasource | `Settings.set_enable_mediasource(enabled: gboolean) -> none` | webkit_settings_set_enable_mediasource | 2.4 | Set the #WebKitSettings:enable-mediasource property. |
| set_enable_mock_capture_devices | `Settings.set_enable_mock_capture_devices(enabled: gboolean) -> none` | webkit_settings_set_enable_mock_capture_devices | 2.4 | Set the #WebKitSettings:enable-mock-capture-devices property. |
| set_enable_offline_web_application_cache | `Settings.set_enable_offline_web_application_cache(enabled: gboolean) -> none` | webkit_settings_set_enable_offline_web_application_cache |  | Setting no longer supported. This function does nothing. |
| set_enable_page_cache | `Settings.set_enable_page_cache(enabled: gboolean) -> none` | webkit_settings_set_enable_page_cache |  | Set the #WebKitSettings:enable-page-cache property. |
| set_enable_plugins | `Settings.set_enable_plugins(enabled: gboolean) -> none` | webkit_settings_set_enable_plugins |  | Set the #WebKitSettings:enable-plugins property. |
| set_enable_private_browsing | `Settings.set_enable_private_browsing(enabled: gboolean) -> none` | webkit_settings_set_enable_private_browsing |  | Set the #WebKitSettings:enable-private-browsing property. |
| set_enable_resizable_text_areas | `Settings.set_enable_resizable_text_areas(enabled: gboolean) -> none` | webkit_settings_set_enable_resizable_text_areas |  | Set the #WebKitSettings:enable-resizable-text-areas property. |
| set_enable_site_specific_quirks | `Settings.set_enable_site_specific_quirks(enabled: gboolean) -> none` | webkit_settings_set_enable_site_specific_quirks |  | Set the #WebKitSettings:enable-site-specific-quirks property. |
| set_enable_smooth_scrolling | `Settings.set_enable_smooth_scrolling(enabled: gboolean) -> none` | webkit_settings_set_enable_smooth_scrolling |  | Set the #WebKitSettings:enable-smooth-scrolling property. |
| set_enable_spatial_navigation | `Settings.set_enable_spatial_navigation(enabled: gboolean) -> none` | webkit_settings_set_enable_spatial_navigation | 2.2 | Set the #WebKitSettings:enable-spatial-navigation property. |
| set_enable_tabs_to_links | `Settings.set_enable_tabs_to_links(enabled: gboolean) -> none` | webkit_settings_set_enable_tabs_to_links |  | Set the #WebKitSettings:enable-tabs-to-links property. |
| set_enable_webaudio | `Settings.set_enable_webaudio(enabled: gboolean) -> none` | webkit_settings_set_enable_webaudio |  | Set the #WebKitSettings:enable-webaudio property. |
| set_enable_webgl | `Settings.set_enable_webgl(enabled: gboolean) -> none` | webkit_settings_set_enable_webgl |  | Set the #WebKitSettings:enable-webgl property. |
| set_enable_webrtc | `Settings.set_enable_webrtc(enabled: gboolean) -> none` | webkit_settings_set_enable_webrtc | 2.38 | Set the [property@Settings:enable-webrtc] property. Setting this property to %TRUE implies the media-stream web-setting will also be enabled. |
| set_enable_write_console_messages_to_stdout | `Settings.set_enable_write_console_messages_to_stdout(enabled: gboolean) -> none` | webkit_settings_set_enable_write_console_messages_to_stdout | 2.2 | Set the #WebKitSettings:enable-write-console-messages-to-stdout property. |
| set_enable_xss_auditor | `Settings.set_enable_xss_auditor(enabled: gboolean) -> none` | webkit_settings_set_enable_xss_auditor |  | The XSS auditor has been removed. This function does nothing. |
| set_fantasy_font_family | `Settings.set_fantasy_font_family(fantasy_font_family: utf8) -> none` | webkit_settings_set_fantasy_font_family |  | Set the #WebKitSettings:fantasy-font-family property. |
| set_feature_enabled | `Settings.set_feature_enabled(feature: Feature, enabled: gboolean) -> none` | webkit_settings_set_feature_enabled | 2.42 | Enables or disables a feature. The current status of the feature can be determined with [id@webkit_settings_get_feature_enabled]. To reset a featur... |
| set_hardware_acceleration_policy | `Settings.set_hardware_acceleration_policy(policy: HardwareAccelerationPolicy) -> none` | webkit_settings_set_hardware_acceleration_policy | 2.16 | Set the #WebKitSettings:hardware-acceleration-policy property. |
| set_javascript_can_access_clipboard | `Settings.set_javascript_can_access_clipboard(enabled: gboolean) -> none` | webkit_settings_set_javascript_can_access_clipboard |  | Set the #WebKitSettings:javascript-can-access-clipboard property. |
| set_javascript_can_open_windows_automatically | `Settings.set_javascript_can_open_windows_automatically(enabled: gboolean) -> none` | webkit_settings_set_javascript_can_open_windows_automatically |  | Set the #WebKitSettings:javascript-can-open-windows-automatically property. |
| set_load_icons_ignoring_image_load_setting | `Settings.set_load_icons_ignoring_image_load_setting(enabled: gboolean) -> none` | webkit_settings_set_load_icons_ignoring_image_load_setting |  | Setting no longer supported. This function does nothing. |
| set_math_font_family | `Settings.set_math_font_family(math_font_family: utf8?) -> none` | webkit_settings_set_math_font_family |  | Set the #WebKitSettings:math-font-family property. Since 2.52 |
| set_media_content_types_requiring_hardware_support | `Settings.set_media_content_types_requiring_hardware_support(content_types: utf8?) -> none` | webkit_settings_set_media_content_types_requiring_hardware_support | 2.30 | Set the #WebKitSettings:media-content-types-requiring-hardware-support property. |
| set_media_playback_allows_inline | `Settings.set_media_playback_allows_inline(enabled: gboolean) -> none` | webkit_settings_set_media_playback_allows_inline |  | Set the #WebKitSettings:media-playback-allows-inline property. |
| set_media_playback_requires_user_gesture | `Settings.set_media_playback_requires_user_gesture(enabled: gboolean) -> none` | webkit_settings_set_media_playback_requires_user_gesture |  | Set the #WebKitSettings:media-playback-requires-user-gesture property. |
| set_minimum_font_size | `Settings.set_minimum_font_size(font_size: guint32) -> none` | webkit_settings_set_minimum_font_size |  | Set the #WebKitSettings:minimum-font-size property. |
| set_monospace_font_family | `Settings.set_monospace_font_family(monospace_font_family: utf8) -> none` | webkit_settings_set_monospace_font_family |  | Set the #WebKitSettings:monospace-font-family property. |
| set_pictograph_font_family | `Settings.set_pictograph_font_family(pictograph_font_family: utf8) -> none` | webkit_settings_set_pictograph_font_family |  | Set the #WebKitSettings:pictograph-font-family property. |
| set_print_backgrounds | `Settings.set_print_backgrounds(print_backgrounds: gboolean) -> none` | webkit_settings_set_print_backgrounds |  | Set the #WebKitSettings:print-backgrounds property. |
| set_sans_serif_font_family | `Settings.set_sans_serif_font_family(sans_serif_font_family: utf8) -> none` | webkit_settings_set_sans_serif_font_family |  | Set the #WebKitSettings:sans-serif-font-family property. |
| set_serif_font_family | `Settings.set_serif_font_family(serif_font_family: utf8) -> none` | webkit_settings_set_serif_font_family |  | Set the #WebKitSettings:serif-font-family property. |
| set_user_agent | `Settings.set_user_agent(user_agent: utf8?) -> none` | webkit_settings_set_user_agent |  | Set the #WebKitSettings:user-agent property. |
| set_user_agent_with_application_details | `Settings.set_user_agent_with_application_details(application_name: utf8?, application_version: utf8?) -> none` | webkit_settings_set_user_agent_with_application_details |  | Set the #WebKitSettings:user-agent property by appending the application details. Set the #WebKitSettings:user-agent property by appending the appl... |
| set_webrtc_udp_ports_range | `Settings.set_webrtc_udp_ports_range(udp_port_range: utf8) -> none` | webkit_settings_set_webrtc_udp_ports_range | 2.48 | Set the [property@Settings:webrtc-udp-ports-range] property. |
| set_zoom_text_only | `Settings.set_zoom_text_only(zoom_text_only: gboolean) -> none` | webkit_settings_set_zoom_text_only |  | Set the #WebKitSettings:zoom-text-only property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| allow-file-access-from-file-urls | gboolean | read, write | Whether file access is allowed from file URLs. By default, when something is loaded in a #WebKitWebView using a file URI, cross origin requests to ... |
| allow-modal-dialogs | gboolean | read, write | Determine whether it's allowed to create and run modal dialogs from a #WebKitWebView through JavaScript with <function>window.showModalDialog</func... |
| allow-top-navigation-to-data-urls | gboolean | read, write | Whether or not the top frame is allowed to navigate to data URLs. It is disabled by default due to the risk it poses when loading untrusted URLs, w... |
| allow-universal-access-from-file-urls | gboolean | read, write | Whether or not JavaScript running in the context of a file scheme URL should be allowed to access content from any origin. By default, when somethi... |
| auto-load-images | gboolean | read, write | Determines whether images should be automatically loaded or not. On devices where network bandwidth is of concern, it might be useful to turn this ... |
| cursive-font-family | utf8 | read, write | The font family used as the default for content using a cursive font. |
| default-charset | utf8 | read, write | The default text charset used when interpreting content with an unspecified charset. |
| default-font-family | utf8 | read, write | The font family to use as the default for content that does not specify a font. |
| default-font-size | guint | read, write | The default font size in pixels to use for content displayed if no font size is specified. |
| default-monospace-font-size | guint | read, write | The default font size in pixels to use for content displayed in monospace font if no font size is specified. |
| disable-web-security | gboolean | read, write | Enable or disable support for Web Security on pages. This setting disables the same-origin policy, allowing every website full control over all oth... |
| draw-compositing-indicators | gboolean | read, write | Whether to draw compositing borders and repaint counters on layers drawn with accelerated compositing. This is useful for debugging issues related ... |
| enable-2d-canvas-acceleration | gboolean | read, write | Enable or disable 2D canvas acceleration. If this setting is enabled, the 2D canvas will be accelerated even if Skia CPU is used for rendering. How... |
| enable-accelerated-2d-canvas | gboolean | read, write | Enable or disable accelerated 2D canvas. Accelerated 2D canvas is only available if WebKit was compiled with a version of Cairo including the unsta... |
| enable-back-forward-navigation-gestures | gboolean | read, write | Enable or disable horizontal swipe gesture for back-forward navigation. |
| enable-caret-browsing | gboolean | read, write | Whether to enable accessibility enhanced keyboard navigation. |
| enable-developer-extras | gboolean | read, write | Determines whether or not developer tools, such as the Web Inspector, are enabled. |
| enable-dns-prefetching | gboolean | read, write | Determines whether or not to prefetch domain names. DNS prefetching attempts to resolve domain names before a user tries to follow a link. |
| enable-encrypted-media | gboolean | read, write | Enable or disable support for Encrypted Media API on pages. EncryptedMedia is an experimental JavaScript API for playing encrypted media in HTML. T... |
| enable-frame-flattening | gboolean | read, write | Frame flattening is no longer supported. This property does nothing. |
| enable-fullscreen | gboolean | read, write | Whether to enable the Javascript Fullscreen API. The API allows any HTML element to request fullscreen display. See also the current draft of the s... |
| enable-html5-database | gboolean | read, write | Whether to enable HTML5 client-side SQL database support (IndexedDB). |
| enable-html5-local-storage | gboolean | read, write | Whether to enable HTML5 local storage support. Local storage provides simple synchronous storage access. HTML5 local storage specification is avail... |
| enable-hyperlink-auditing | gboolean | read, write | Determines whether or not hyperlink auditing is enabled. The hyperlink auditing specification is available at http://www.whatwg.org/specs/web-apps/... |
| enable-java | gboolean | read, write | Determines whether or not Java is enabled on the page. |
| enable-javascript | gboolean | read, write | Determines whether or not JavaScript executes within a page. |
| enable-javascript-markup | gboolean | read, write | Determines whether or not JavaScript markup is allowed in document. When this setting is disabled, all JavaScript-related elements and attributes a... |
| enable-media | gboolean | read, write | Enable or disable support for media playback on pages. This setting is enabled by default. Disabling it means `<audio>`, `<track>` and `<video>` el... |
| enable-media-capabilities | gboolean | read, write | Enable or disable support for MediaCapabilities on pages. This specification intends to provide APIs to allow websites to make an optimal decision ... |
| enable-media-stream | gboolean | read, write | Enable or disable support for MediaStream on pages. MediaStream is an experimental proposal for allowing web pages to access audio and video device... |
| enable-mediasource | gboolean | read, write | Enable or disable support for MediaSource on pages. MediaSource extends HTMLMediaElement to allow JavaScript to generate media streams for playback... |
| enable-mock-capture-devices | gboolean | read, write | Enable or disable the Mock Capture Devices. Those are fake Microphone and Camera devices to be used as MediaStream sources. |
| enable-offline-web-application-cache | gboolean | read, write | Unsupported setting. This property does nothing. |
| enable-page-cache | gboolean | read, write | Enable or disable the page cache. Disabling the page cache is generally only useful for special circumstances like low-memory scenarios or special ... |
| enable-plugins | gboolean | read, write | Determines whether or not plugins on the page are enabled. |
| enable-private-browsing | gboolean | read, write | Determines whether or not private browsing is enabled. Private browsing will disable history, cache and form auto-fill for any pages visited. |
| enable-resizable-text-areas | gboolean | read, write | Determines whether or not text areas can be resized. |
| enable-site-specific-quirks | gboolean | read, write | Whether to turn on site-specific quirks. Turning this on will tell WebKit to use some site-specific workarounds for better web compatibility. For e... |
| enable-smooth-scrolling | gboolean | read, write | Enable or disable smooth scrolling. |
| enable-spatial-navigation | gboolean | read, write | Whether to enable Spatial Navigation. This feature consists in the ability to navigate between focusable elements in a Web page, such as hyperlinks... |
| enable-tabs-to-links | gboolean | read, write | Determines whether the tab key cycles through the elements on the page. When this setting is enabled, users will be able to focus the next element ... |
| enable-webaudio | gboolean | read, write | Enable or disable support for WebAudio on pages. WebAudio is an API for processing and synthesizing audio in web applications See also https://weba... |
| enable-webgl | gboolean | read, write | Enable or disable support for WebGL on pages. WebGL enables web content to use an API based on OpenGL ES 2.0. |
| enable-webrtc | gboolean | read, write | Enable WebRTC support for loaded pages. Enabling this setting implies that [property@Settings:enable-media-stream] will be enabled as well. See als... |
| enable-write-console-messages-to-stdout | gboolean | read, write | Enable or disable writing console messages to stdout. These are messages sent to the console with console.log and related methods. |
| enable-xss-auditor | gboolean | read, write | Whether to enable the XSS auditor. This feature filters some kinds of reflective XSS attacks on vulnerable web sites. |
| fantasy-font-family | utf8 | read, write | The font family used as the default for content using a fantasy font. |
| hardware-acceleration-policy | HardwareAccelerationPolicy | read, write | The #WebKitHardwareAccelerationPolicy to decide how to enable and disable hardware acceleration. Disabling hardware acceleration might cause some w... |
| javascript-can-access-clipboard | gboolean | read, write | Whether JavaScript can access the clipboard. The default value is %FALSE. If set to %TRUE, document.execCommand() allows cut, copy and paste commands. |
| javascript-can-open-windows-automatically | gboolean | read, write | Whether JavaScript can open popup windows automatically without user intervention. |
| load-icons-ignoring-image-load-setting | gboolean | read, write | Unsupported setting. This property does nothing. |
| math-font-family | utf8 | read, write | The font family used as the default for content using a math font. |
| media-content-types-requiring-hardware-support | utf8 | read, write | List of media content types requiring hardware support, split by semicolons (:). For example: 'video/webm; codecs="vp*":video/mp4; codecs="avc*":vi... |
| media-playback-allows-inline | gboolean | read, write | Whether media playback is full-screen only or inline playback is allowed. This is %TRUE by default, so media playback can be inline. Setting it to ... |
| media-playback-requires-user-gesture | gboolean | read, write | Whether a user gesture (such as clicking the play button) would be required to start media playback or load media. This is off by default, so media... |
| minimum-font-size | guint | read, write | The minimum font size in pixels used to display text. This setting controls the absolute smallest size. Values other than 0 can potentially break p... |
| monospace-font-family | utf8 | read, write | The font family used as the default for content using a monospace font. |
| pictograph-font-family | utf8 | read, write | The font family used as the default for content using a pictograph font. |
| print-backgrounds | gboolean | read, write | Whether background images should be drawn during printing. |
| sans-serif-font-family | utf8 | read, write | The font family used as the default for content using a sans-serif font. |
| serif-font-family | utf8 | read, write | The font family used as the default for content using a serif font. |
| user-agent | utf8 | read, write | The user-agent string used by WebKit. Unusual user-agent strings may cause web content to render incorrectly or fail to run, as many web pages are ... |
| webrtc-udp-ports-range | utf8 | read, write | Allow customization of the WebRTC UDP ports range. In some constrained environments where a firewall blocks UDP network traffic excepted on a speci... |
| zoom-text-only | gboolean | read, write | Whether #WebKitWebView:zoom-level affects only the text of the page or all the contents. Other contents containing text like form controls will be ... |

### WebKit2.URIRequest

Parent: `GObject.Object` ?? GType: `WebKitURIRequest` ?? C type: `WebKitURIRequest`

Represents a URI request. A #WebKitURIRequest can be created with a URI using the webkit_uri_request_new() method, and you can get the URI of an ex...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | URIRequestPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `URIRequest.new(uri: utf8) -> URIRequest` | webkit_uri_request_new |  | Creates a new #WebKitURIRequest for the given URI. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_http_headers | `URIRequest.get_http_headers() -> Soup.MessageHeaders` | webkit_uri_request_get_http_headers |  | Get the HTTP headers of a #WebKitURIRequest as a #SoupMessageHeaders. |
| get_http_method | `URIRequest.get_http_method() -> utf8` | webkit_uri_request_get_http_method | 2.12 | Get the HTTP method of the #WebKitURIRequest. |
| get_uri | `URIRequest.get_uri() -> utf8` | webkit_uri_request_get_uri |  | Obtains the request URI. |
| set_uri | `URIRequest.set_uri(uri: utf8) -> none` | webkit_uri_request_set_uri |  | Set the URI of @request |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| uri | utf8 | read, write | The URI to which the request will be made. |

### WebKit2.URIResponse

Parent: `GObject.Object` ?? GType: `WebKitURIResponse` ?? C type: `WebKitURIResponse`

Represents an URI response. A #WebKitURIResponse contains information such as the URI, the status code, the content length, the mime type, the HTTP...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | URIResponsePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content_length | `URIResponse.get_content_length() -> guint64` | webkit_uri_response_get_content_length |  | Get the expected content length of the #WebKitURIResponse. It can be 0 if the server provided an incorrect or missing Content-Length. |
| get_http_headers | `URIResponse.get_http_headers() -> Soup.MessageHeaders` | webkit_uri_response_get_http_headers | 2.6 | Get the HTTP headers of a #WebKitURIResponse as a #SoupMessageHeaders. |
| get_mime_type | `URIResponse.get_mime_type() -> utf8` | webkit_uri_response_get_mime_type |  | Gets the MIME type of the response. |
| get_status_code | `URIResponse.get_status_code() -> guint` | webkit_uri_response_get_status_code |  | Get the status code of the #WebKitURIResponse. Get the status code of the #WebKitURIResponse as returned by the server. It will normally be a #Soup... |
| get_suggested_filename | `URIResponse.get_suggested_filename() -> utf8` | webkit_uri_response_get_suggested_filename |  | Get the suggested filename for @response. Get the suggested filename for @response, as specified by the 'Content-Disposition' HTTP header, or %NULL... |
| get_uri | `URIResponse.get_uri() -> utf8` | webkit_uri_response_get_uri |  | Gets the URI which resulted in the response. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| content-length | guint64 | read | The expected content length of the response. |
| http-headers | Soup.MessageHeaders | read | The HTTP headers of the response, or %NULL if the response is not an HTTP response. |
| mime-type | utf8 | read | The MIME type of the response. |
| status-code | guint | read | The status code of the response as returned by the server. |
| suggested-filename | utf8 | read | The suggested filename for the URI response. |
| uri | utf8 | read | The URI for which the response was made. |

### WebKit2.URISchemeRequest

Parent: `GObject.Object` ?? GType: `WebKitURISchemeRequest` ?? C type: `WebKitURISchemeRequest`

Represents a URI scheme request. If you register a particular URI scheme in a #WebKitWebContext, using webkit_web_context_register_uri_scheme(), yo...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | URISchemeRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| finish | `URISchemeRequest.finish(stream: Gio.InputStream, stream_length: gint64, content_type: utf8?) -> none` | webkit_uri_scheme_request_finish |  | Finish a #WebKitURISchemeRequest by setting the contents of the request and its mime type. |
| finish_error | `URISchemeRequest.finish_error(error: GLib.Error) -> none` | webkit_uri_scheme_request_finish_error | 2.2 | Finish a #WebKitURISchemeRequest with a #GError. |
| finish_with_response | `URISchemeRequest.finish_with_response(response: URISchemeResponse) -> none` | webkit_uri_scheme_request_finish_with_response | 2.36 | Finish a #WebKitURISchemeRequest by returning a #WebKitURISchemeResponse |
| get_http_body | `URISchemeRequest.get_http_body() -> Gio.InputStream` | webkit_uri_scheme_request_get_http_body | 2.40 | Get the request body. |
| get_http_headers | `URISchemeRequest.get_http_headers() -> Soup.MessageHeaders` | webkit_uri_scheme_request_get_http_headers | 2.36 | Get the #SoupMessageHeaders of the request. |
| get_http_method | `URISchemeRequest.get_http_method() -> utf8` | webkit_uri_scheme_request_get_http_method | 2.36 | Get the HTTP method of the @request. |
| get_path | `URISchemeRequest.get_path() -> utf8` | webkit_uri_scheme_request_get_path |  | Get the URI path of @request. |
| get_scheme | `URISchemeRequest.get_scheme() -> utf8` | webkit_uri_scheme_request_get_scheme |  | Get the URI scheme of @request. |
| get_uri | `URISchemeRequest.get_uri() -> utf8` | webkit_uri_scheme_request_get_uri |  | Get the URI of @request. |
| get_web_view | `URISchemeRequest.get_web_view() -> WebView` | webkit_uri_scheme_request_get_web_view |  | Get the #WebKitWebView that initiated the request. |

### WebKit2.URISchemeResponse

Parent: `GObject.Object` ?? GType: `WebKitURISchemeResponse` ?? C type: `WebKitURISchemeResponse`

Represents a URI scheme response. If you register a particular URI scheme in a #WebKitWebContext, using webkit_web_context_register_uri_scheme(), y...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | URISchemeResponsePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `URISchemeResponse.new(input_stream: Gio.InputStream, stream_length: gint64) -> URISchemeResponse` | webkit_uri_scheme_response_new | 2.36 | Create a new #WebKitURISchemeResponse |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_content_type | `URISchemeResponse.set_content_type(content_type: utf8) -> none` | webkit_uri_scheme_response_set_content_type | 2.36 | Sets the content type for the @response |
| set_http_headers | `URISchemeResponse.set_http_headers(headers: Soup.MessageHeaders) -> none` | webkit_uri_scheme_response_set_http_headers | 2.36 | Assign the provided #SoupMessageHeaders to the response. @headers need to be of the type %SOUP_MESSAGE_HEADERS_RESPONSE. Any existing headers will ... |
| set_status | `URISchemeResponse.set_status(status_code: guint, reason_phrase: utf8?) -> none` | webkit_uri_scheme_response_set_status | 2.36 | Sets the status code and reason phrase for the @response. If @status_code is a known value and @reason_phrase is %NULL, the @reason_phrase will be ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| stream | Gio.InputStream | write, construct-only | The input stream to read from. |
| stream-length | gint64 | write, construct-only | The input stream length in bytes, `-1` for unknown length. |

### WebKit2.UserContentFilterStore

Parent: `GObject.Object` ?? GType: `WebKitUserContentFilterStore` ?? C type: `WebKitUserContentFilterStore`

Handles storage of user content filters on disk. The WebKitUserContentFilterStore provides the means to import and save JSON rule sets, which can b...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | UserContentFilterStorePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UserContentFilterStore.new(storage_path: utf8) -> UserContentFilterStore` | webkit_user_content_filter_store_new | 2.24 | Create a new #WebKitUserContentFilterStore to manipulate filters stored at @storage_path. The path must point to a local filesystem, and will be cr... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| fetch_identifiers | `UserContentFilterStore.fetch_identifiers(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_user_content_filter_store_fetch_identifiers | 2.24 | Asynchronously retrieve a list of the identifiers for all the stored filters. When the operation is finished, @callback will be invoked, which then... |
| fetch_identifiers_finish | `UserContentFilterStore.fetch_identifiers_finish(result: Gio.AsyncResult) -> utf8` | webkit_user_content_filter_store_fetch_identifiers_finish | 2.24 | Finishes an asynchronous fetch of the list of stored filters. Finishes an asynchronous fetch of the list of identifiers for the stored filters prev... |
| get_path | `UserContentFilterStore.get_path() -> utf8` | webkit_user_content_filter_store_get_path | 2.24 | Gets the storage path for user content filters. |
| load | `UserContentFilterStore.load(identifier: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_user_content_filter_store_load | 2.24 | Asynchronously load a content filter given its @identifier. The filter must have been previously stored using webkit_user_content_filter_store_save... |
| load_finish | `UserContentFilterStore.load_finish(result: Gio.AsyncResult) -> UserContentFilter throws` | webkit_user_content_filter_store_load_finish | 2.24 | Finishes an asynchronous filter load previously started with webkit_user_content_filter_store_load(). |
| remove | `UserContentFilterStore.remove(identifier: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_user_content_filter_store_remove | 2.24 | Asynchronously remove a content filter given its @identifier. When the operation is finished, @callback will be invoked, which then can use webkit_... |
| remove_finish | `UserContentFilterStore.remove_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_user_content_filter_store_remove_finish | 2.24 | Finishes an asynchronous filter removal previously started with webkit_user_content_filter_store_remove(). |
| save | `UserContentFilterStore.save(identifier: utf8, source: GLib.Bytes, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_user_content_filter_store_save | 2.24 | Asynchronously save a content filter from a set source rule. Asynchronously save a content filter from a source rule set in the WebKit content exte... |
| save_finish | `UserContentFilterStore.save_finish(result: Gio.AsyncResult) -> UserContentFilter throws` | webkit_user_content_filter_store_save_finish | 2.24 | Finishes an asynchronous filter save previously started with webkit_user_content_filter_store_save(). |
| save_from_file | `UserContentFilterStore.save_from_file(identifier: utf8, file: Gio.File, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_user_content_filter_store_save_from_file | 2.24 | Asynchronously save a content filter from the contents of a file. Asynchronously save a content filter from the contents of a file, which must be n... |
| save_from_file_finish | `UserContentFilterStore.save_from_file_finish(result: Gio.AsyncResult) -> UserContentFilter throws` | webkit_user_content_filter_store_save_from_file_finish | 2.24 | Finishes and asynchronous filter save previously started with webkit_user_content_filter_store_save_from_file(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| path | utf8 | read, write, construct-only | The directory used for filter storage. This path is used as the base directory where user content filters are stored on disk. |

### WebKit2.UserContentManager

Parent: `GObject.Object` ?? GType: `WebKitUserContentManager` ?? C type: `WebKitUserContentManager`

Manages user-defined content which affects web pages. Using a #WebKitUserContentManager user CSS style sheets can be set to be injected in the web ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | UserContentManagerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UserContentManager.new() -> UserContentManager` | webkit_user_content_manager_new | 2.6 | Creates a new user content manager. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_filter | `UserContentManager.add_filter(filter: UserContentFilter) -> none` | webkit_user_content_manager_add_filter | 2.24 | Adds a #WebKitUserContentFilter to the given #WebKitUserContentManager. The same #WebKitUserContentFilter can be reused with multiple #WebKitUserCo... |
| add_script | `UserContentManager.add_script(script: UserScript) -> none` | webkit_user_content_manager_add_script | 2.6 | Adds a #WebKitUserScript to the given #WebKitUserContentManager. The same #WebKitUserScript can be reused with multiple #WebKitUserContentManager i... |
| add_style_sheet | `UserContentManager.add_style_sheet(stylesheet: UserStyleSheet) -> none` | webkit_user_content_manager_add_style_sheet | 2.6 | Adds a #WebKitUserStyleSheet to the given #WebKitUserContentManager. The same #WebKitUserStyleSheet can be reused with multiple #WebKitUserContentM... |
| register_script_message_handler | `UserContentManager.register_script_message_handler(name: utf8) -> gboolean` | webkit_user_content_manager_register_script_message_handler | 2.8 | Registers a new user script message handler. After it is registered, scripts can use `window.webkit.messageHandlers.<name>.postMessage(value)` to s... |
| register_script_message_handler_in_world | `UserContentManager.register_script_message_handler_in_world(name: utf8, world_name: utf8) -> gboolean` | webkit_user_content_manager_register_script_message_handler_in_world | 2.22 | Registers a new user script message handler in script world. Registers a new user script message handler in script world with name @world_name. See... |
| register_script_message_handler_with_reply | `UserContentManager.register_script_message_handler_with_reply(name: utf8, world_name: utf8?) -> gboolean` | webkit_user_content_manager_register_script_message_handler_with_reply | 2.40 | Registers a new user script message handler in script world with name @world_name. Different from webkit_user_content_manager_register_script_messa... |
| remove_all_filters | `UserContentManager.remove_all_filters() -> none` | webkit_user_content_manager_remove_all_filters | 2.24 | Removes all content filters from the given #WebKitUserContentManager. |
| remove_all_scripts | `UserContentManager.remove_all_scripts() -> none` | webkit_user_content_manager_remove_all_scripts | 2.6 | Removes all user scripts from the given #WebKitUserContentManager See also webkit_user_content_manager_remove_script(). |
| remove_all_style_sheets | `UserContentManager.remove_all_style_sheets() -> none` | webkit_user_content_manager_remove_all_style_sheets | 2.6 | Removes all user style sheets from the given #WebKitUserContentManager. |
| remove_filter | `UserContentManager.remove_filter(filter: UserContentFilter) -> none` | webkit_user_content_manager_remove_filter |  | Removes a filter from the given #WebKitUserContentManager. Since 2.24 |
| remove_filter_by_id | `UserContentManager.remove_filter_by_id(filter_id: utf8) -> none` | webkit_user_content_manager_remove_filter_by_id | 2.26 | Removes a filter by the given identifier. Removes a filter from the given #WebKitUserContentManager given the identifier of a #WebKitUserContentFil... |
| remove_script | `UserContentManager.remove_script(script: UserScript) -> none` | webkit_user_content_manager_remove_script | 2.32 | Removes a #WebKitUserScript from the given #WebKitUserContentManager. See also webkit_user_content_manager_remove_all_scripts(). |
| remove_style_sheet | `UserContentManager.remove_style_sheet(stylesheet: UserStyleSheet) -> none` | webkit_user_content_manager_remove_style_sheet | 2.32 | Removes a #WebKitUserStyleSheet from the given #WebKitUserContentManager. See also webkit_user_content_manager_remove_all_style_sheets(). |
| unregister_script_message_handler | `UserContentManager.unregister_script_message_handler(name: utf8) -> none` | webkit_user_content_manager_unregister_script_message_handler | 2.8 | Unregisters a previously registered message handler. Note that this does *not* disconnect handlers for the #WebKitUserContentManager::script-messag... |
| unregister_script_message_handler_in_world | `UserContentManager.unregister_script_message_handler_in_world(name: utf8, world_name: utf8) -> none` | webkit_user_content_manager_unregister_script_message_handler_in_world | 2.22 | Unregisters a previously registered message handler in script world with name @world_name. Note that this does *not* disconnect handlers for the #W... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| script-message-received | `value: JavascriptResult` | none | last detailed | 2.8 | This signal is emitted when JavaScript in a web view calls <code>window.webkit.messageHandlers.<name>.postMessage()</code>, after registering <code... |
| script-message-with-reply-received | `value: JavaScriptCore.Value, reply: ScriptMessageReply` | gboolean | last detailed | 2.40 | This signal is emitted when JavaScript in a web view calls <code>window.webkit.messageHandlers.<name>.postMessage()</code>, after registering <code... |

### WebKit2.UserMediaPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitUserMediaPermissionRequest` ?? C type: `WebKitUserMediaPermissionRequest`

A permission request for accessing user's audio/video devices. WebKitUserMediaPermissionRequest represents a request for permission to decide wheth...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | UserMediaPermissionRequestPrivate |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| is-for-audio-device | gboolean | read | Whether the media device to which the permission was requested has a microphone or not. |
| is-for-video-device | gboolean | read | Whether the media device to which the permission was requested has a video capture capability or not. |

### WebKit2.UserMessage

Parent: `GObject.InitiallyUnowned` ?? GType: `WebKitUserMessage` ?? C type: `WebKitUserMessage`

Message that can be sent between the UI process and web process extensions. A WebKitUserMessage is a message that can be used for the communication...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.InitiallyUnowned |
| priv | UserMessagePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UserMessage.new(name: utf8, parameters: GLib.Variant?) -> UserMessage` | webkit_user_message_new | 2.28 | Create a new #WebKitUserMessage with @name. |
| new_with_fd_list | `UserMessage.new_with_fd_list(name: utf8, parameters: GLib.Variant?, fd_list: Gio.UnixFDList?) -> UserMessage` | webkit_user_message_new_with_fd_list | 2.28 | Create a new #WebKitUserMessage including also a list of UNIX file descriptors to be sent. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fd_list | `UserMessage.get_fd_list() -> Gio.UnixFDList` | webkit_user_message_get_fd_list | 2.28 | Get the @message list of file descritpor. |
| get_name | `UserMessage.get_name() -> utf8` | webkit_user_message_get_name | 2.28 | Get the @message name. |
| get_parameters | `UserMessage.get_parameters() -> GLib.Variant` | webkit_user_message_get_parameters | 2.28 | Get the @message parameters. |
| send_reply | `UserMessage.send_reply(reply: UserMessage) -> none` | webkit_user_message_send_reply | 2.28 | Send a reply to an user message. If @reply is floating, it's consumed. You can only send a reply to a #WebKitUserMessage that has been received. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fd-list | Gio.UnixFDList | read, write, construct-only | The UNIX file descriptors of the user message. |
| name | utf8 | read, write, construct-only | The name of the user message. |
| parameters | GLib.Variant | read, write, construct-only | The parameters of the user message as a #GVariant, or %NULL if the message doesn't include parameters. Note that only complete types are allowed. |

### WebKit2.WebContext

Parent: `GObject.Object` ?? GType: `WebKitWebContext` ?? C type: `WebKitWebContext`

Manages aspects common to all #WebKitWebView<!-- -->s The #WebKitWebContext manages all aspects common to all #WebKitWebView<!-- -->s. You can defi...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebContextPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebContext.new() -> WebContext` | webkit_web_context_new | 2.8 | Create a new #WebKitWebContext. |
| new_ephemeral | `WebContext.new_ephemeral() -> WebContext` | webkit_web_context_new_ephemeral | 2.16 | Create a new ephemeral #WebKitWebContext. An ephemeral #WebKitWebContext is a context created with an ephemeral #WebKitWebsiteDataManager. This is ... |
| new_with_website_data_manager | `WebContext.new_with_website_data_manager(manager: WebsiteDataManager) -> WebContext` | webkit_web_context_new_with_website_data_manager | 2.10 | Create a new #WebKitWebContext with a #WebKitWebsiteDataManager. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_default | `get_default() -> WebContext` | webkit_web_context_get_default |  | Gets the default web context. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_path_to_sandbox | `WebContext.add_path_to_sandbox(path: filename, read_only: gboolean) -> none` | webkit_web_context_add_path_to_sandbox | 2.26 | Adds a path to be mounted in the sandbox. @path must exist before any web process has been created. It is a fatal error to add paths after a web pr... |
| allow_tls_certificate_for_host | `WebContext.allow_tls_certificate_for_host(certificate: Gio.TlsCertificate, host: utf8) -> none` | webkit_web_context_allow_tls_certificate_for_host | 2.6 | Ignore further TLS errors on the @host for the certificate present in @info. If @host is an IPv6 address, it should not be surrounded by brackets. ... |
| clear_cache | `WebContext.clear_cache() -> none` | webkit_web_context_clear_cache |  | Clears all resources currently cached. See also webkit_web_context_set_cache_model(). |
| download_uri | `WebContext.download_uri(uri: utf8) -> Download` | webkit_web_context_download_uri |  | Requests downloading of the specified URI string. The download operation will not be associated to any #WebKitWebView, if you are interested in sta... |
| get_cache_model | `WebContext.get_cache_model() -> CacheModel` | webkit_web_context_get_cache_model |  | Returns the current cache model. For more information about this value check the documentation of the function webkit_web_context_set_cache_model(). |
| get_cookie_manager | `WebContext.get_cookie_manager() -> CookieManager` | webkit_web_context_get_cookie_manager |  | Get the #WebKitCookieManager of the @context's #WebKitWebsiteDataManager. |
| get_favicon_database | `WebContext.get_favicon_database() -> FaviconDatabase` | webkit_web_context_get_favicon_database |  | Get the #WebKitFaviconDatabase associated with @context. To initialize the database you need to call webkit_web_context_set_favicon_database_direct... |
| get_favicon_database_directory | `WebContext.get_favicon_database_directory() -> utf8` | webkit_web_context_get_favicon_database_directory |  | Get the directory path to store the favicons database. Get the directory path being used to store the favicons database for @context, or %NULL if w... |
| get_geolocation_manager | `WebContext.get_geolocation_manager() -> GeolocationManager` | webkit_web_context_get_geolocation_manager | 2.26 | Get the #WebKitGeolocationManager of @context. |
| get_plugins | `WebContext.get_plugins(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_context_get_plugins |  | Asynchronously get the list of installed plugins. When the operation is finished, @callback will be called. You can then call webkit_web_context_ge... |
| get_plugins_finish | `WebContext.get_plugins_finish(result: Gio.AsyncResult) -> GLib.List throws` | webkit_web_context_get_plugins_finish |  | Finish an asynchronous operation started with webkit_web_context_get_plugins. |
| get_process_model | `WebContext.get_process_model() -> ProcessModel` | webkit_web_context_get_process_model | 2.4 | Returns %WEBKIT_PROCESS_MODEL_MULTIPLE_SECONDARY_PROCESSES. For more information about why this function is deprecated, see webkit_web_context_set_... |
| get_sandbox_enabled | `WebContext.get_sandbox_enabled() -> gboolean` | webkit_web_context_get_sandbox_enabled | 2.26 | Get whether sandboxing is currently enabled. |
| get_security_manager | `WebContext.get_security_manager() -> SecurityManager` | webkit_web_context_get_security_manager |  | Get the #WebKitSecurityManager of @context. |
| get_spell_checking_enabled | `WebContext.get_spell_checking_enabled() -> gboolean` | webkit_web_context_get_spell_checking_enabled |  | Get whether spell checking feature is currently enabled. |
| get_spell_checking_languages | `WebContext.get_spell_checking_languages() -> utf8` | webkit_web_context_get_spell_checking_languages |  | Get the the list of spell checking languages. Get the the list of spell checking languages associated with @context, or %NULL if no languages have ... |
| get_time_zone_override | `WebContext.get_time_zone_override() -> utf8` | webkit_web_context_get_time_zone_override | 2.38 | Get the #WebKitWebContext:time-zone-override property. |
| get_tls_errors_policy | `WebContext.get_tls_errors_policy() -> TLSErrorsPolicy` | webkit_web_context_get_tls_errors_policy |  | Get the TLS errors policy of @context. |
| get_use_system_appearance_for_scrollbars | `WebContext.get_use_system_appearance_for_scrollbars() -> gboolean` | webkit_web_context_get_use_system_appearance_for_scrollbars | 2.30 | Get the #WebKitWebContext:use-system-appearance-for-scrollbars property. |
| get_web_process_count_limit | `WebContext.get_web_process_count_limit() -> guint` | webkit_web_context_get_web_process_count_limit | 2.10 | Gets the maximum number of web processes that can be created at the same time for the @context. This function is now deprecated and always returns ... |
| get_website_data_manager | `WebContext.get_website_data_manager() -> WebsiteDataManager` | webkit_web_context_get_website_data_manager | 2.10 | Get the #WebKitWebsiteDataManager of @context. |
| initialize_notification_permissions | `WebContext.initialize_notification_permissions(allowed_origins: GLib.List, disallowed_origins: GLib.List) -> none` | webkit_web_context_initialize_notification_permissions | 2.16 | Sets initial desktop notification permissions for the @context. @allowed_origins and @disallowed_origins must each be #GList of #WebKitSecurityOrig... |
| is_automation_allowed | `WebContext.is_automation_allowed() -> gboolean` | webkit_web_context_is_automation_allowed | 2.18 | Get whether automation is allowed in @context. See also webkit_web_context_set_automation_allowed(). |
| is_ephemeral | `WebContext.is_ephemeral() -> gboolean` | webkit_web_context_is_ephemeral | 2.16 | Get whether a #WebKitWebContext is ephemeral. |
| prefetch_dns | `WebContext.prefetch_dns(hostname: utf8) -> none` | webkit_web_context_prefetch_dns |  | Resolve the domain name of the given @hostname in advance. Resolve the domain name of the given @hostname in advance, so that if a URI of @hostname... |
| register_uri_scheme | `WebContext.register_uri_scheme(scheme: utf8, callback: URISchemeRequestCallback, user_data: gpointer?, user_data_destroy_func: GLib.DestroyNotify) -> none` | webkit_web_context_register_uri_scheme |  | Register @scheme in @context. Register @scheme in @context, so that when an URI request with @scheme is made in the #WebKitWebContext, the #WebKitU... |
| send_message_to_all_extensions | `WebContext.send_message_to_all_extensions(message: UserMessage) -> none` | webkit_web_context_send_message_to_all_extensions | 2.28 | Send @message to all web process extensions associated to @context. If @message is floating, it's consumed. |
| set_additional_plugins_directory | `WebContext.set_additional_plugins_directory(directory: utf8) -> none` | webkit_web_context_set_additional_plugins_directory |  | Set an additional directory where WebKit will look for plugins. |
| set_automation_allowed | `WebContext.set_automation_allowed(allowed: gboolean) -> none` | webkit_web_context_set_automation_allowed | 2.18 | Set whether automation is allowed in @context. When automation is enabled the browser could be controlled by another process by requesting an autom... |
| set_cache_model | `WebContext.set_cache_model(cache_model: CacheModel) -> none` | webkit_web_context_set_cache_model |  | Specifies a usage model for WebViews. Specifies a usage model for WebViews, which WebKit will use to determine its caching behavior. All web views ... |
| set_disk_cache_directory | `WebContext.set_disk_cache_directory(directory: utf8) -> none` | webkit_web_context_set_disk_cache_directory |  | Set the directory where disk cache files will be stored. This method must be called before loading anything in this context, otherwise it will not ... |
| set_favicon_database_directory | `WebContext.set_favicon_database_directory(path: utf8?) -> none` | webkit_web_context_set_favicon_database_directory |  | Set the directory path to store the favicons database. Set the directory path to be used to store the favicons database for @context on disk. Passi... |
| set_network_proxy_settings | `WebContext.set_network_proxy_settings(proxy_mode: NetworkProxyMode, proxy_settings: NetworkProxySettings?) -> none` | webkit_web_context_set_network_proxy_settings | 2.16 | Set the network proxy settings to be used by connections started in @context. By default %WEBKIT_NETWORK_PROXY_MODE_DEFAULT is used, which means th... |
| set_preferred_languages | `WebContext.set_preferred_languages(languages: utf8?) -> none` | webkit_web_context_set_preferred_languages |  | Set the list of preferred languages. Set the list of preferred languages, sorted from most desirable to least desirable. The list will be used in t... |
| set_process_model | `WebContext.set_process_model(process_model: ProcessModel) -> none` | webkit_web_context_set_process_model | 2.4 | This function previously allowed specifying the process model to use. However, since 2.26, the only allowed process model is %WEBKIT_PROCESS_MODEL_... |
| set_sandbox_enabled | `WebContext.set_sandbox_enabled(enabled: gboolean) -> none` | webkit_web_context_set_sandbox_enabled | 2.26 | Set whether WebKit subprocesses will be sandboxed. Set whether WebKit subprocesses will be sandboxed, limiting access to the system. This method **... |
| set_spell_checking_enabled | `WebContext.set_spell_checking_enabled(enabled: gboolean) -> none` | webkit_web_context_set_spell_checking_enabled |  | Enable or disable the spell checking feature. |
| set_spell_checking_languages | `WebContext.set_spell_checking_languages(languages: utf8) -> none` | webkit_web_context_set_spell_checking_languages |  | Set the list of spell checking languages to be used for spell checking. The locale string typically is in the form lang_COUNTRY, where lang is an I... |
| set_tls_errors_policy | `WebContext.set_tls_errors_policy(policy: TLSErrorsPolicy) -> none` | webkit_web_context_set_tls_errors_policy |  | Set the TLS errors policy of @context as @policy. |
| set_use_system_appearance_for_scrollbars | `WebContext.set_use_system_appearance_for_scrollbars(enabled: gboolean) -> none` | webkit_web_context_set_use_system_appearance_for_scrollbars | 2.30 | Set the #WebKitWebContext:use-system-appearance-for-scrollbars property. This is now deprecated and when WebKit is built with Skia this method does... |
| set_web_extensions_directory | `WebContext.set_web_extensions_directory(directory: utf8) -> none` | webkit_web_context_set_web_extensions_directory |  | Set the directory where WebKit will look for web process extensions. This method must be called before loading anything in this context, otherwise ... |
| set_web_extensions_initialization_user_data | `WebContext.set_web_extensions_initialization_user_data(user_data: GLib.Variant) -> none` | webkit_web_context_set_web_extensions_initialization_user_data | 2.4 | Set user data to be passed to web process extensions on initialization. The data will be passed to the #WebKitWebExtensionInitializeWithUserDataFun... |
| set_web_process_count_limit | `WebContext.set_web_process_count_limit(limit: guint) -> none` | webkit_web_context_set_web_process_count_limit | 2.10 | Sets the maximum number of web processes. Sets the maximum number of web processes that can be created at the same time for the @context. The defau... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| local-storage-directory | utf8 | read, write, construct-only | The directory where local storage data will be saved. |
| memory-pressure-settings | MemoryPressureSettings | write, construct-only | The #WebKitMemoryPressureSettings applied to the web processes created by this context. |
| process-swap-on-cross-site-navigation-enabled | gboolean | read, write, construct-only | Whether swap Web processes on cross-site navigations is enabled. When enabled, pages from each security origin will be handled by their own separat... |
| time-zone-override | utf8 | read, write, construct-only | The timezone override for this web context. Setting this property provides a better alternative to configure the timezone information for all webvi... |
| use-system-appearance-for-scrollbars | gboolean | read, write | Whether to use system appearance for rendering scrollbars. This is enabled by default for backwards compatibility, but it's only recommened to use ... |
| website-data-manager | WebsiteDataManager | read, write, construct-only | The #WebKitWebsiteDataManager associated with this context. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| automation-started | `session: AutomationSession` | none | last | 2.18 | This signal is emitted when a new automation request is made. Note that it will never be emitted if automation is not enabled in @context, see webk... |
| download-started | `download: Download` | none | last |  | This signal is emitted when a new download request is made. |
| initialize-notification-permissions | `` | none | last | 2.16 | This signal is emitted when a #WebKitWebContext needs to set initial notification permissions for a web process. It is emitted when a new web proce... |
| initialize-web-extensions | `` | none | last | 2.4 | This signal is emitted when a new web process is about to be launched. It signals the most appropriate moment to use webkit_web_context_set_web_ext... |
| user-message-received | `message: UserMessage` | gboolean | last | 2.28 | This signal is emitted when a #WebKitUserMessage is received from a web process extension. You can reply to the message using webkit_user_message_s... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| automation_started | `automation_started(session: AutomationSession) -> none` |  |  |  |
| download_started | `download_started(download: Download) -> none` |  |  |  |
| initialize_notification_permissions | `initialize_notification_permissions() -> none` |  |  |  |
| initialize_web_extensions | `initialize_web_extensions() -> none` |  |  |  |
| user_message_received | `user_message_received(message: UserMessage) -> gboolean` |  |  |  |

### WebKit2.WebInspector

Parent: `GObject.Object` ?? GType: `WebKitWebInspector` ?? C type: `WebKitWebInspector`

Access to the WebKit inspector. The WebKit Inspector is a graphical tool to inspect and change the content of a #WebKitWebView. It also includes an...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebInspectorPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| attach | `WebInspector.attach() -> none` | webkit_web_inspector_attach |  | Request @inspector to be attached. The signal #WebKitWebInspector::attach will be emitted. If the inspector is already attached it does nothing. |
| close | `WebInspector.close() -> none` | webkit_web_inspector_close |  | Request @inspector to be closed. |
| detach | `WebInspector.detach() -> none` | webkit_web_inspector_detach |  | Request @inspector to be detached. The signal #WebKitWebInspector::detach will be emitted. If the inspector is already detached it does nothing. |
| get_attached_height | `WebInspector.get_attached_height() -> guint` | webkit_web_inspector_get_attached_height |  | Get the height that the inspector view when attached. Get the height that the inspector view should have when it's attached. If the inspector view ... |
| get_can_attach | `WebInspector.get_can_attach() -> gboolean` | webkit_web_inspector_get_can_attach | 2.8 | Whether the @inspector can be attached to the same window that contains the inspected view. |
| get_inspected_uri | `WebInspector.get_inspected_uri() -> utf8` | webkit_web_inspector_get_inspected_uri |  | Get the URI that is currently being inspected. This can be %NULL if nothing has been loaded yet in the inspected view, if the inspector has been cl... |
| get_web_view | `WebInspector.get_web_view() -> WebViewBase` | webkit_web_inspector_get_web_view |  | Get the #WebKitWebViewBase used to display the inspector. This might be %NULL if the inspector hasn't been loaded yet, or it has been closed. |
| is_attached | `WebInspector.is_attached() -> gboolean` | webkit_web_inspector_is_attached |  | Whether the @inspector view is currently attached to the same window that contains the inspected view. |
| show | `WebInspector.show() -> none` | webkit_web_inspector_show |  | Request @inspector to be shown. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| attached-height | guint | read | The height that the inspector view should have when it is attached. |
| can-attach | gboolean | read | Whether the @inspector can be attached to the same window that contains the inspected view. |
| inspected-uri | utf8 | read | The URI that is currently being inspected. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| attach | `` | gboolean | last |  | Emitted when the inspector is requested to be attached to the window where the inspected web view is. If this signal is not handled the inspector v... |
| bring-to-front | `` | gboolean | last |  | Emitted when the inspector should be shown. If the inspector is not attached the inspector window should be shown on top of any other windows. If t... |
| closed | `` | none | last |  | Emitted when the inspector page is closed. If you are using your own inspector window, you should connect to this signal and destroy your window. |
| detach | `` | gboolean | last |  | Emitted when the inspector is requested to be detached from the window it is currently attached to. The inspector is detached when the inspector pa... |
| open-window | `` | gboolean | last |  | Emitted when the inspector is requested to open in a separate window. If this signal is not handled, a #GtkWindow with the inspector will be create... |

### WebKit2.WebResource

Parent: `GObject.Object` ?? GType: `WebKitWebResource` ?? C type: `WebKitWebResource`

Represents a resource at the end of a URI. A #WebKitWebResource encapsulates content for each resource at the end of a particular URI. For example,...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebResourcePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_data | `WebResource.get_data(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_resource_get_data |  | Asynchronously get the raw data for @resource. When the operation is finished, @callback will be called. You can then call webkit_web_resource_get_... |
| get_data_finish | `WebResource.get_data_finish(result: Gio.AsyncResult, length: out gsize?) -> guint8 throws` | webkit_web_resource_get_data_finish |  | Finish an asynchronous operation started with webkit_web_resource_get_data(). |
| get_response | `WebResource.get_response() -> URIResponse` | webkit_web_resource_get_response |  | Retrieves the #WebKitURIResponse of the resource load operation. This method returns %NULL if called before the response is received from the serve... |
| get_uri | `WebResource.get_uri() -> utf8` | webkit_web_resource_get_uri |  | Returns the current active URI of @resource. The active URI might change during a load operation: <orderedlist> <listitem><para> When the resource ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| response | URIResponse | read | The #WebKitURIResponse associated with this resource. |
| uri | utf8 | read | The current active URI of the #WebKitWebResource. See webkit_web_resource_get_uri() for more details. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| failed | `error: GLib.Error` | none | last |  | This signal is emitted when an error occurs during the resource load operation. |
| failed-with-tls-errors | `certificate: Gio.TlsCertificate, errors: Gio.TlsCertificateFlags` | none | last | 2.8 | This signal is emitted when a TLS error occurs during the resource load operation. |
| finished | `` | none | last |  | This signal is emitted when the resource load finishes successfully or due to an error. In case of errors #WebKitWebResource::failed signal is emit... |
| received-data | `data_length: guint64` | none | last |  | This signal is emitted after response is received, every time new data has been received. It's useful to know the progress of the resource load ope... |
| sent-request | `request: URIRequest, redirected_response: URIResponse` | none | last |  | This signal is emitted when @request has been sent to the server. In case of a server redirection this signal is emitted again with the @request ar... |

### WebKit2.WebsiteDataAccessPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitWebsiteDataAccessPermissionRequest` ?? C type: `WebKitWebsiteDataAccessPermissionRequest`

A permission request for accessing website data from third-party domains. WebKitWebsiteDataAccessPermissionRequest represents a request for permiss...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebsiteDataAccessPermissionRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_domain | `WebsiteDataAccessPermissionRequest.get_current_domain() -> utf8` | webkit_website_data_access_permission_request_get_current_domain | 2.30 | Get the current domain being browsed. |
| get_requesting_domain | `WebsiteDataAccessPermissionRequest.get_requesting_domain() -> utf8` | webkit_website_data_access_permission_request_get_requesting_domain | 2.30 | Get the domain requesting permission to access its cookies while browsing the current domain. |

### WebKit2.WebsiteDataManager

Parent: `GObject.Object` ?? GType: `WebKitWebsiteDataManager` ?? C type: `WebKitWebsiteDataManager`

Manages data stored locally by web sites. You can use WebKitWebsiteDataManager to configure the local directories where website data will be stored...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebsiteDataManagerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebsiteDataManager.new(first_option_name: utf8, ...: void) -> WebsiteDataManager` | webkit_website_data_manager_new | 2.10 | Creates a new #WebKitWebsiteDataManager with the given options. It must be passed as construction parameter of a #WebKitWebContext. |
| new_ephemeral | `WebsiteDataManager.new_ephemeral() -> WebsiteDataManager` | webkit_website_data_manager_new_ephemeral | 2.16 | Creates an ephemeral #WebKitWebsiteDataManager. See #WebKitWebsiteDataManager:is-ephemeral for more details. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_memory_pressure_settings | `set_memory_pressure_settings(settings: MemoryPressureSettings) -> none` | webkit_website_data_manager_set_memory_pressure_settings | 2.34 | Sets @settings as the #WebKitMemoryPressureSettings. Sets @settings as the #WebKitMemoryPressureSettings to be used by all the network processes cr... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `WebsiteDataManager.clear(types: WebsiteDataTypes, timespan: GLib.TimeSpan, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_website_data_manager_clear | 2.16 | Asynchronously clear the website data of the given @types modified in the past @timespan. If @timespan is 0, all website data will be removed. When... |
| clear_finish | `WebsiteDataManager.clear_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_website_data_manager_clear_finish | 2.16 | Finish an asynchronous operation started with webkit_website_data_manager_clear() |
| fetch | `WebsiteDataManager.fetch(types: WebsiteDataTypes, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_website_data_manager_fetch | 2.16 | Asynchronously get the list of #WebKitWebsiteData for the given @types. When the operation is finished, @callback will be called. You can then call... |
| fetch_finish | `WebsiteDataManager.fetch_finish(result: Gio.AsyncResult) -> GLib.List throws` | webkit_website_data_manager_fetch_finish | 2.16 | Finish an asynchronous operation started with webkit_website_data_manager_fetch(). |
| get_base_cache_directory | `WebsiteDataManager.get_base_cache_directory() -> utf8` | webkit_website_data_manager_get_base_cache_directory | 2.10 | Get the #WebKitWebsiteDataManager:base-cache-directory property. |
| get_base_data_directory | `WebsiteDataManager.get_base_data_directory() -> utf8` | webkit_website_data_manager_get_base_data_directory | 2.10 | Get the #WebKitWebsiteDataManager:base-data-directory property. |
| get_cookie_manager | `WebsiteDataManager.get_cookie_manager() -> CookieManager` | webkit_website_data_manager_get_cookie_manager | 2.16 | Get the #WebKitCookieManager of @manager. |
| get_disk_cache_directory | `WebsiteDataManager.get_disk_cache_directory() -> utf8` | webkit_website_data_manager_get_disk_cache_directory | 2.10 | Get the #WebKitWebsiteDataManager:disk-cache-directory property. |
| get_dom_cache_directory | `WebsiteDataManager.get_dom_cache_directory() -> utf8` | webkit_website_data_manager_get_dom_cache_directory | 2.30 | Get the #WebKitWebsiteDataManager:dom-cache-directory property. |
| get_hsts_cache_directory | `WebsiteDataManager.get_hsts_cache_directory() -> utf8` | webkit_website_data_manager_get_hsts_cache_directory | 2.26 | Get the #WebKitWebsiteDataManager:hsts-cache-directory property. |
| get_indexeddb_directory | `WebsiteDataManager.get_indexeddb_directory() -> utf8` | webkit_website_data_manager_get_indexeddb_directory | 2.10 | Get the #WebKitWebsiteDataManager:indexeddb-directory property. |
| get_itp_directory | `WebsiteDataManager.get_itp_directory() -> utf8` | webkit_website_data_manager_get_itp_directory | 2.30 | Get the #WebKitWebsiteDataManager:itp-directory property. |
| get_itp_enabled | `WebsiteDataManager.get_itp_enabled() -> gboolean` | webkit_website_data_manager_get_itp_enabled | 2.30 | Get whether Intelligent Tracking Prevention (ITP) is enabled or not. |
| get_itp_summary | `WebsiteDataManager.get_itp_summary(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_website_data_manager_get_itp_summary | 2.30 | Asynchronously get the list of #WebKitITPThirdParty seen for @manager. Every #WebKitITPThirdParty contains the list of #WebKitITPFirstParty under w... |
| get_itp_summary_finish | `WebsiteDataManager.get_itp_summary_finish(result: Gio.AsyncResult) -> GLib.List throws` | webkit_website_data_manager_get_itp_summary_finish | 2.30 | Finish an asynchronous operation started with webkit_website_data_manager_get_itp_summary(). |
| get_local_storage_directory | `WebsiteDataManager.get_local_storage_directory() -> utf8` | webkit_website_data_manager_get_local_storage_directory | 2.10 | Get the #WebKitWebsiteDataManager:local-storage-directory property. |
| get_offline_application_cache_directory | `WebsiteDataManager.get_offline_application_cache_directory() -> utf8` | webkit_website_data_manager_get_offline_application_cache_directory | 2.10 | Get the #WebKitWebsiteDataManager:offline-application-cache-directory property. |
| get_persistent_credential_storage_enabled | `WebsiteDataManager.get_persistent_credential_storage_enabled() -> gboolean` | webkit_website_data_manager_get_persistent_credential_storage_enabled | 2.30 | Get whether persistent credential storage is enabled or not. See also webkit_website_data_manager_set_persistent_credential_storage_enabled(). |
| get_service_worker_registrations_directory | `WebsiteDataManager.get_service_worker_registrations_directory() -> utf8` | webkit_website_data_manager_get_service_worker_registrations_directory | 2.30 | Get the #WebKitWebsiteDataManager:service-worker-registrations-directory property. |
| get_tls_errors_policy | `WebsiteDataManager.get_tls_errors_policy() -> TLSErrorsPolicy` | webkit_website_data_manager_get_tls_errors_policy | 2.32 | Get the TLS errors policy of @manager. |
| get_websql_directory | `WebsiteDataManager.get_websql_directory() -> utf8` | webkit_website_data_manager_get_websql_directory | 2.10 | Get the #WebKitWebsiteDataManager:websql-directory property. |
| is_ephemeral | `WebsiteDataManager.is_ephemeral() -> gboolean` | webkit_website_data_manager_is_ephemeral | 2.16 | Get whether a #WebKitWebsiteDataManager is ephemeral. See #WebKitWebsiteDataManager:is-ephemeral for more details. |
| remove | `WebsiteDataManager.remove(types: WebsiteDataTypes, website_data: GLib.List, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_website_data_manager_remove | 2.16 | Asynchronously removes the website data in the given @website_data list. Asynchronously removes the website data of the given @types for websites i... |
| remove_finish | `WebsiteDataManager.remove_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_website_data_manager_remove_finish | 2.16 | Finish an asynchronous operation started with webkit_website_data_manager_remove(). |
| set_itp_enabled | `WebsiteDataManager.set_itp_enabled(enabled: gboolean) -> none` | webkit_website_data_manager_set_itp_enabled | 2.30 | Enable or disable Intelligent Tracking Prevention (ITP). When ITP is enabled resource load statistics are collected and used to decide whether to a... |
| set_network_proxy_settings | `WebsiteDataManager.set_network_proxy_settings(proxy_mode: NetworkProxyMode, proxy_settings: NetworkProxySettings?) -> none` | webkit_website_data_manager_set_network_proxy_settings | 2.32 | Set the network proxy settings to be used by connections started in @manager session. By default %WEBKIT_NETWORK_PROXY_MODE_DEFAULT is used, which ... |
| set_persistent_credential_storage_enabled | `WebsiteDataManager.set_persistent_credential_storage_enabled(enabled: gboolean) -> none` | webkit_website_data_manager_set_persistent_credential_storage_enabled | 2.30 | Enable or disable persistent credential storage. When enabled, which is the default for non-ephemeral sessions, the network process will try to rea... |
| set_tls_errors_policy | `WebsiteDataManager.set_tls_errors_policy(policy: TLSErrorsPolicy) -> none` | webkit_website_data_manager_set_tls_errors_policy | 2.32 | Set the TLS errors policy of @manager as @policy. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| base-cache-directory | utf8 | read, write, construct-only | The base directory for caches. If %NULL, a default location will be used. |
| base-data-directory | utf8 | read, write, construct-only | The base directory for website data. If %NULL, a default location will be used. |
| disk-cache-directory | utf8 | read, write, construct-only | The directory where HTTP disk cache will be stored. |
| dom-cache-directory | utf8 | read, write, construct-only | The directory where DOM cache will be stored. |
| hsts-cache-directory | utf8 | read, write, construct-only | The directory where the HTTP Strict-Transport-Security (HSTS) cache will be stored. |
| indexeddb-directory | utf8 | read, write, construct-only | The directory where IndexedDB databases will be stored. |
| is-ephemeral | gboolean | read, write, construct-only | Whether the #WebKitWebsiteDataManager is ephemeral. An ephemeral #WebKitWebsiteDataManager handles all websites data as non-persistent, and nothing... |
| itp-directory | utf8 | read, write, construct-only | The directory where Intelligent Tracking Prevention (ITP) data will be stored. |
| local-storage-directory | utf8 | read, write, construct-only | The directory where local storage data will be stored. |
| offline-application-cache-directory | utf8 | read, write, construct-only | The directory where offline web application cache will be stored. |
| origin-storage-ratio | gdouble | write, construct-only | The percentage of volume space that can be used for data storage for every domain. If the maximum storage is reached the storage request will fail ... |
| service-worker-registrations-directory | utf8 | read, write, construct-only | The directory where service workers registrations will be stored. |
| total-storage-ratio | gdouble | write, construct-only | The percentage of volume space that can be used for data storage for all domains. If the maximum storage is reached the eviction will happen. A val... |
| websql-directory | utf8 | read, write, construct-only | The directory where WebSQL databases will be stored. |

### WebKit2.WebsitePolicies

Parent: `GObject.Object` ?? GType: `WebKitWebsitePolicies` ?? C type: `WebKitWebsitePolicies`

View specific website policies. WebKitWebsitePolicies allows you to configure per-page policies, currently only autoplay policies are supported.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WebsitePoliciesPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebsitePolicies.new() -> WebsitePolicies` | webkit_website_policies_new | 2.30 | Create a new #WebKitWebsitePolicies. |
| new_with_policies | `WebsitePolicies.new_with_policies(first_policy_name: utf8, ...: void) -> WebsitePolicies` | webkit_website_policies_new_with_policies | 2.30 | Create a new #WebKitWebsitePolicies with given policies. Create a new #WebKitWebsitePolicies with policies given as variadic arguments. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_autoplay_policy | `WebsitePolicies.get_autoplay_policy() -> AutoplayPolicy` | webkit_website_policies_get_autoplay_policy | 2.30 | Get the #WebKitWebsitePolicies:autoplay property. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| autoplay | AutoplayPolicy | read, write, construct-only | The #WebKitAutoplayPolicy of #WebKitWebsitePolicies. |

### WebKit2.WebView

Parent: `WebViewBase` ?? Implements: `Atk.ImplementorIface`, `Gtk.Buildable` ?? GType: `WebKitWebView` ?? C type: `WebKitWebView`

The central class of the WPE WebKit and WebKitGTK APIs. #WebKitWebView is the central class of the WPE WebKit and WebKitGTK APIs. It is responsible...

#### Fields

| Field | Type |
| --- | --- |
| parent | WebViewBase |
| priv | WebViewPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebView.new() -> Gtk.Widget` | webkit_web_view_new |  | Creates a new #WebKitWebView with the default #WebKitWebContext. Creates a new #WebKitWebView with the default #WebKitWebContext and no #WebKitUser... |
| new_with_context | `WebView.new_with_context(context: WebContext) -> Gtk.Widget` | webkit_web_view_new_with_context |  | Creates a new #WebKitWebView with the given #WebKitWebContext. Creates a new #WebKitWebView with the given #WebKitWebContext and no #WebKitUserCont... |
| new_with_related_view | `WebView.new_with_related_view(web_view: WebView) -> Gtk.Widget` | webkit_web_view_new_with_related_view | 2.4 | Creates a new #WebKitWebView sharing the same web process with @web_view. This method doesn't have any effect when %WEBKIT_PROCESS_MODEL_SHARED_SEC... |
| new_with_settings | `WebView.new_with_settings(settings: Settings) -> Gtk.Widget` | webkit_web_view_new_with_settings | 2.6 | Creates a new #WebKitWebView with the given #WebKitSettings. See also webkit_web_view_new_with_context(), and webkit_web_view_new_with_user_content... |
| new_with_user_content_manager | `WebView.new_with_user_content_manager(user_content_manager: UserContentManager) -> Gtk.Widget` | webkit_web_view_new_with_user_content_manager | 2.6 | Creates a new #WebKitWebView with the given #WebKitUserContentManager. The content loaded in the view may be affected by the content injected in th... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| call_async_javascript_function | `WebView.call_async_javascript_function(body: utf8, length: gssize, arguments: GLib.Variant?, world_name: utf8?, source_uri: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_call_async_javascript_function | 2.40 | Asynchronously call @body with @arguments in the script world with name @world_name of the main frame current context in @web_view. The @arguments ... |
| call_async_javascript_function_finish | `WebView.call_async_javascript_function_finish(result: Gio.AsyncResult) -> JavaScriptCore.Value throws` | webkit_web_view_call_async_javascript_function_finish | 2.40 | Finish an asynchronous operation started with webkit_web_view_call_async_javascript_function(). |
| can_execute_editing_command | `WebView.can_execute_editing_command(command: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_can_execute_editing_command |  | Asynchronously check if it is possible to execute the given editing command. When the operation is finished, @callback will be called. You can then... |
| can_execute_editing_command_finish | `WebView.can_execute_editing_command_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_web_view_can_execute_editing_command_finish |  | Finish an asynchronous operation started with webkit_web_view_can_execute_editing_command(). |
| can_go_back | `WebView.can_go_back() -> gboolean` | webkit_web_view_can_go_back |  | Determines whether @web_view has a previous history item. |
| can_go_forward | `WebView.can_go_forward() -> gboolean` | webkit_web_view_can_go_forward |  | Determines whether @web_view has a next history item. |
| can_show_mime_type | `WebView.can_show_mime_type(mime_type: utf8) -> gboolean` | webkit_web_view_can_show_mime_type |  | Whether or not a MIME type can be displayed in @web_view. |
| download_uri | `WebView.download_uri(uri: utf8) -> Download` | webkit_web_view_download_uri |  | Requests downloading of the specified URI string for @web_view. |
| evaluate_javascript | `WebView.evaluate_javascript(script: utf8, length: gssize, world_name: utf8?, source_uri: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_evaluate_javascript | 2.40 | Asynchronously evaluate @script in the script world with name @world_name of the main frame current context in @web_view. If @world_name is %NULL, ... |
| evaluate_javascript_finish | `WebView.evaluate_javascript_finish(result: Gio.AsyncResult) -> JavaScriptCore.Value throws` | webkit_web_view_evaluate_javascript_finish | 2.40 | Finish an asynchronous operation started with webkit_web_view_evaluate_javascript(). |
| execute_editing_command | `WebView.execute_editing_command(command: utf8) -> none` | webkit_web_view_execute_editing_command |  | Request to execute the given @command for @web_view. You can use webkit_web_view_can_execute_editing_command() to check whether it's possible to ex... |
| execute_editing_command_with_argument | `WebView.execute_editing_command_with_argument(command: utf8, argument: utf8) -> none` | webkit_web_view_execute_editing_command_with_argument | 2.10 | Request to execute the given @command with @argument for @web_view. You can use webkit_web_view_can_execute_editing_command() to check whether it's... |
| get_automation_presentation_type | `WebView.get_automation_presentation_type() -> AutomationBrowsingContextPresentation` | webkit_web_view_get_automation_presentation_type | 2.28 | Get the presentation type of #WebKitWebView when created for automation. |
| get_back_forward_list | `WebView.get_back_forward_list() -> BackForwardList` | webkit_web_view_get_back_forward_list |  | Obtains the #WebKitBackForwardList associated with the given #WebKitWebView. The #WebKitBackForwardList is owned by the #WebKitWebView. |
| get_background_color | `WebView.get_background_color(rgba: out Gdk.RGBA) -> none` | webkit_web_view_get_background_color | 2.8 | Gets the color that is used to draw the @web_view background. Gets the color that is used to draw the @web_view background before the actual conten... |
| get_camera_capture_state | `WebView.get_camera_capture_state() -> MediaCaptureState` | webkit_web_view_get_camera_capture_state | 2.34 | Get the camera capture state of a #WebKitWebView. |
| get_context | `WebView.get_context() -> WebContext` | webkit_web_view_get_context |  | Gets the web context of @web_view. |
| get_custom_charset | `WebView.get_custom_charset() -> utf8` | webkit_web_view_get_custom_charset |  | Returns the current custom character encoding name of @web_view. |
| get_default_content_security_policy | `WebView.get_default_content_security_policy() -> utf8` | webkit_web_view_get_default_content_security_policy | 2.38 | Gets the configured default Content-Security-Policy. |
| get_display_capture_state | `WebView.get_display_capture_state() -> MediaCaptureState` | webkit_web_view_get_display_capture_state | 2.34 | Get the display capture state of a #WebKitWebView. |
| get_editor_state | `WebView.get_editor_state() -> EditorState` | webkit_web_view_get_editor_state | 2.10 | Gets the web editor state of @web_view. |
| get_estimated_load_progress | `WebView.get_estimated_load_progress() -> gdouble` | webkit_web_view_get_estimated_load_progress |  | Gets the value of the #WebKitWebView:estimated-load-progress property. You can monitor the estimated progress of a load operation by connecting to ... |
| get_favicon | `WebView.get_favicon() -> cairo.Surface` | webkit_web_view_get_favicon |  | Returns favicon currently associated to @web_view. Returns favicon currently associated to @web_view, if any. You can connect to notify::favicon si... |
| get_find_controller | `WebView.get_find_controller() -> FindController` | webkit_web_view_get_find_controller |  | Gets the #WebKitFindController. Gets the #WebKitFindController that will allow the caller to query the #WebKitWebView for the text to look for. |
| get_input_method_context | `WebView.get_input_method_context() -> InputMethodContext` | webkit_web_view_get_input_method_context | 2.28 | Get the #WebKitInputMethodContext currently in use by @web_view. Get the #WebKitInputMethodContext currently in use by @web_view, or %NULL if no in... |
| get_inspector | `WebView.get_inspector() -> WebInspector` | webkit_web_view_get_inspector |  | Get the #WebKitWebInspector associated to @web_view |
| get_is_muted | `WebView.get_is_muted() -> gboolean` | webkit_web_view_get_is_muted | 2.30 | Gets the mute state of @web_view. |
| get_is_web_process_responsive | `WebView.get_is_web_process_responsive() -> gboolean` | webkit_web_view_get_is_web_process_responsive | 2.34 | Get whether the current web process of a #WebKitWebView is responsive. |
| get_javascript_global_context | `WebView.get_javascript_global_context() -> JSGlobalContextRef` | webkit_web_view_get_javascript_global_context |  | Get the global JavaScript context. Get the global JavaScript context used by @web_view to deserialize the result values of scripts executed with we... |
| get_main_resource | `WebView.get_main_resource() -> WebResource` | webkit_web_view_get_main_resource |  | Return the main resource of @web_view. |
| get_microphone_capture_state | `WebView.get_microphone_capture_state() -> MediaCaptureState` | webkit_web_view_get_microphone_capture_state | 2.34 | Get the microphone capture state of a #WebKitWebView. |
| get_page_id | `WebView.get_page_id() -> guint64` | webkit_web_view_get_page_id |  | Get the identifier of the #WebKitWebPage corresponding to the #WebKitWebView |
| get_session_state | `WebView.get_session_state() -> WebViewSessionState` | webkit_web_view_get_session_state | 2.12 | Gets the current session state of @web_view |
| get_settings | `WebView.get_settings() -> Settings` | webkit_web_view_get_settings |  | Gets the #WebKitSettings currently applied to @web_view. If no other #WebKitSettings have been explicitly applied to @web_view with webkit_web_view... |
| get_snapshot | `WebView.get_snapshot(region: SnapshotRegion, options: SnapshotOptions, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_get_snapshot |  | Asynchronously retrieves a snapshot of @web_view for @region. @options specifies how the snapshot should be rendered. When the operation is finishe... |
| get_snapshot_finish | `WebView.get_snapshot_finish(result: Gio.AsyncResult) -> cairo.Surface throws` | webkit_web_view_get_snapshot_finish |  | Finishes an asynchronous operation started with webkit_web_view_get_snapshot(), producing an image of the snapshot using the BGRA8888 pixel format. |
| get_theme_color | `WebView.get_theme_color(rgba: out Gdk.RGBA) -> gboolean` | webkit_web_view_get_theme_color | 2.50 | Gets the theme color that is specified by the content in the @web_view. If the @web_view doesn't have a theme color it will fill the @rgba with tra... |
| get_title | `WebView.get_title() -> utf8` | webkit_web_view_get_title |  | Gets the value of the #WebKitWebView:title property. You can connect to notify::title signal of @web_view to be notified when the title has been re... |
| get_tls_info | `WebView.get_tls_info(certificate: out Gio.TlsCertificate, errors: out Gio.TlsCertificateFlags) -> gboolean` | webkit_web_view_get_tls_info |  | Retrieves the #GTlsCertificate associated with the main resource of @web_view. Retrieves the #GTlsCertificate associated with the main resource of ... |
| get_uri | `WebView.get_uri() -> utf8` | webkit_web_view_get_uri |  | Returns the current active URI of @web_view. The active URI might change during a load operation: <orderedlist> <listitem><para> When nothing has b... |
| get_user_content_manager | `WebView.get_user_content_manager() -> UserContentManager` | webkit_web_view_get_user_content_manager | 2.6 | Gets the user content manager associated to @web_view. |
| get_web_extension_mode | `WebView.get_web_extension_mode() -> WebExtensionMode` | webkit_web_view_get_web_extension_mode | 2.38 | Get the view's #WebKitWebExtensionMode. |
| get_website_data_manager | `WebView.get_website_data_manager() -> WebsiteDataManager` | webkit_web_view_get_website_data_manager | 2.16 | Get the #WebKitWebsiteDataManager associated to @web_view. If @web_view is not ephemeral, the returned #WebKitWebsiteDataManager will be the same a... |
| get_website_policies | `WebView.get_website_policies() -> WebsitePolicies` | webkit_web_view_get_website_policies | 2.30 | Gets the default website policies. Gets the default website policies set on construction in the @web_view. These can be overridden on a per-origin ... |
| get_window_properties | `WebView.get_window_properties() -> WindowProperties` | webkit_web_view_get_window_properties |  | Get the #WebKitWindowProperties object. Get the #WebKitWindowProperties object containing the properties that the window containing @web_view shoul... |
| get_zoom_level | `WebView.get_zoom_level() -> gdouble` | webkit_web_view_get_zoom_level |  | Set the zoom level of @web_view. Get the zoom level of @web_view, i.e. the factor by which the view contents are scaled with respect to their origi... |
| go_back | `WebView.go_back() -> none` | webkit_web_view_go_back |  | Loads the previous history item. You can monitor the load operation by connecting to #WebKitWebView::load-changed signal. |
| go_forward | `WebView.go_forward() -> none` | webkit_web_view_go_forward |  | Loads the next history item. You can monitor the load operation by connecting to #WebKitWebView::load-changed signal. |
| go_to_back_forward_list_item | `WebView.go_to_back_forward_list_item(list_item: BackForwardListItem) -> none` | webkit_web_view_go_to_back_forward_list_item |  | Loads the specific history item @list_item. You can monitor the load operation by connecting to #WebKitWebView::load-changed signal. |
| is_controlled_by_automation | `WebView.is_controlled_by_automation() -> gboolean` | webkit_web_view_is_controlled_by_automation | 2.18 | Get whether a #WebKitWebView was created with #WebKitWebView:is-controlled-by-automation property enabled. Only #WebKitWebView<!-- -->s controlled ... |
| is_editable | `WebView.is_editable() -> gboolean` | webkit_web_view_is_editable | 2.8 | Gets whether the user is allowed to edit the HTML document. When @web_view is not editable an element in the HTML document can only be edited if th... |
| is_ephemeral | `WebView.is_ephemeral() -> gboolean` | webkit_web_view_is_ephemeral | 2.16 | Get whether a #WebKitWebView is ephemeral. To create an ephemeral #WebKitWebView you need to use g_object_new() and pass is-ephemeral property with... |
| is_immersive_mode_enabled | `WebView.is_immersive_mode_enabled() -> gboolean` | webkit_web_view_is_immersive_mode_enabled | 2.52 | Gets whether @web_view is in immersive mode. An immersive session is a mode in which the user is presented with a fully immersive XR experience (su... |
| is_loading | `WebView.is_loading() -> gboolean` | webkit_web_view_is_loading |  | Gets the value of the #WebKitWebView:is-loading property. You can monitor when a #WebKitWebView is loading a page by connecting to notify::is-loadi... |
| is_playing_audio | `WebView.is_playing_audio() -> gboolean` | webkit_web_view_is_playing_audio | 2.8 | Gets the value of the #WebKitWebView:is-playing-audio property. You can monitor when a page in a #WebKitWebView is playing audio by connecting to t... |
| leave_immersive_mode | `WebView.leave_immersive_mode() -> none` | webkit_web_view_leave_immersive_mode | 2.52 | Requests to leave the immersive mode this #WebKitWebView is in. Users interact with web content to start XR sessions, and can typically end the ses... |
| load_alternate_html | `WebView.load_alternate_html(content: utf8, content_uri: utf8, base_uri: utf8?) -> none` | webkit_web_view_load_alternate_html |  | Load the given @content string for the URI @content_uri. This allows clients to display page-loading errors in the #WebKitWebView itself. When this... |
| load_bytes | `WebView.load_bytes(bytes: GLib.Bytes, mime_type: utf8?, encoding: utf8?, base_uri: utf8?) -> none` | webkit_web_view_load_bytes | 2.6 | Load the specified @bytes into @web_view using the given @mime_type and @encoding. When @mime_type is %NULL, it defaults to "text/html". When @enco... |
| load_html | `WebView.load_html(content: utf8, base_uri: utf8?) -> none` | webkit_web_view_load_html |  | Load the given @content string with the specified @base_uri. If @base_uri is not %NULL, relative URLs in the @content will be resolved against @bas... |
| load_plain_text | `WebView.load_plain_text(plain_text: utf8) -> none` | webkit_web_view_load_plain_text |  | Load the specified @plain_text string into @web_view. The mime type of document will be "text/plain". You can monitor the load operation by connect... |
| load_request | `WebView.load_request(request: URIRequest) -> none` | webkit_web_view_load_request |  | Requests loading of the specified #WebKitURIRequest. You can monitor the load operation by connecting to #WebKitWebView::load-changed signal. |
| load_uri | `WebView.load_uri(uri: utf8) -> none` | webkit_web_view_load_uri |  | Requests loading of the specified URI string. You can monitor the load operation by connecting to #WebKitWebView::load-changed signal. |
| reload | `WebView.reload() -> none` | webkit_web_view_reload |  | Reloads the current contents of @web_view. See also webkit_web_view_reload_bypass_cache(). |
| reload_bypass_cache | `WebView.reload_bypass_cache() -> none` | webkit_web_view_reload_bypass_cache |  | Reloads the current contents of @web_view without using any cached data. |
| restore_session_state | `WebView.restore_session_state(state: WebViewSessionState) -> none` | webkit_web_view_restore_session_state | 2.12 | Restore the @web_view session state from @state |
| run_async_javascript_function_in_world | `WebView.run_async_javascript_function_in_world(body: utf8, arguments: GLib.Variant, world_name: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_run_async_javascript_function_in_world | 2.38 | Asynchronously run @body in the script world with name @world_name of the current page context in @web_view. If WebKitSettings:enable-javascript is... |
| run_javascript | `WebView.run_javascript(script: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_run_javascript |  | Asynchronously run @script in the context of the current page in @web_view. If WebKitSettings:enable-javascript is FALSE, this method will do nothi... |
| run_javascript_finish | `WebView.run_javascript_finish(result: Gio.AsyncResult) -> JavascriptResult throws` | webkit_web_view_run_javascript_finish |  | Finish an asynchronous operation started with webkit_web_view_run_javascript(). This is an example of using webkit_web_view_run_javascript() with a... |
| run_javascript_from_gresource | `WebView.run_javascript_from_gresource(resource: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_run_javascript_from_gresource |  | Asynchronously run the script from @resource. Asynchronously run the script from @resource in the context of the current page in @web_view. When th... |
| run_javascript_from_gresource_finish | `WebView.run_javascript_from_gresource_finish(result: Gio.AsyncResult) -> JavascriptResult throws` | webkit_web_view_run_javascript_from_gresource_finish |  | Finish an asynchronous operation started with webkit_web_view_run_javascript_from_gresource(). Check webkit_web_view_run_javascript_finish() for a ... |
| run_javascript_in_world | `WebView.run_javascript_in_world(script: utf8, world_name: utf8, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_run_javascript_in_world | 2.22 | Asynchronously run @script in the script world. Asynchronously run @script in the script world with name @world_name of the current page context in... |
| run_javascript_in_world_finish | `WebView.run_javascript_in_world_finish(result: Gio.AsyncResult) -> JavascriptResult throws` | webkit_web_view_run_javascript_in_world_finish | 2.22 | Finish an asynchronous operation started with webkit_web_view_run_javascript_in_world(). |
| save | `WebView.save(save_mode: SaveMode, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_save |  | Asynchronously save the current web page. Asynchronously save the current web page associated to the #WebKitWebView into a self-contained format us... |
| save_finish | `WebView.save_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` | webkit_web_view_save_finish |  | Finish an asynchronous operation started with webkit_web_view_save(). |
| save_to_file | `WebView.save_to_file(file: Gio.File, save_mode: SaveMode, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_save_to_file |  | Asynchronously save the current web page. Asynchronously save the current web page associated to the #WebKitWebView into a self-contained format us... |
| save_to_file_finish | `WebView.save_to_file_finish(result: Gio.AsyncResult) -> gboolean throws` | webkit_web_view_save_to_file_finish |  | Finish an asynchronous operation started with webkit_web_view_save_to_file(). |
| send_message_to_page | `WebView.send_message_to_page(message: UserMessage, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | webkit_web_view_send_message_to_page | 2.28 | Send @message to the #WebKitWebPage corresponding to @web_view. If @message is floating, it's consumed. If you don't expect any reply, or you simpl... |
| send_message_to_page_finish | `WebView.send_message_to_page_finish(result: Gio.AsyncResult) -> UserMessage throws` | webkit_web_view_send_message_to_page_finish | 2.28 | Finish an asynchronous operation started with webkit_web_view_send_message_to_page(). |
| set_background_color | `WebView.set_background_color(rgba: Gdk.RGBA) -> none` | webkit_web_view_set_background_color | 2.8 | Sets the color that will be used to draw the @web_view background. Sets the color that will be used to draw the @web_view background before the act... |
| set_camera_capture_state | `WebView.set_camera_capture_state(state: MediaCaptureState) -> none` | webkit_web_view_set_camera_capture_state | 2.34 | Set the camera capture state of a #WebKitWebView. If #WebKitSettings:enable-mediastream is %FALSE, this method will have no visible effect. Once th... |
| set_cors_allowlist | `WebView.set_cors_allowlist(allowlist: utf8?) -> none` | webkit_web_view_set_cors_allowlist | 2.34 | Sets the @allowlist for CORS. Sets the @allowlist for which Cross-Origin Resource Sharing checks are disabled in @web_view. URI patterns must be of... |
| set_custom_charset | `WebView.set_custom_charset(charset: utf8?) -> none` | webkit_web_view_set_custom_charset |  | Sets the current custom character encoding override of @web_view. The custom character encoding will override any text encoding detected via HTTP h... |
| set_display_capture_state | `WebView.set_display_capture_state(state: MediaCaptureState) -> none` | webkit_web_view_set_display_capture_state | 2.34 | Set the display capture state of a #WebKitWebView. If #WebKitSettings:enable-mediastream is %FALSE, this method will have no visible effect. Once t... |
| set_editable | `WebView.set_editable(editable: gboolean) -> none` | webkit_web_view_set_editable | 2.8 | Sets whether the user is allowed to edit the HTML document. If @editable is %TRUE, @web_view allows the user to edit the HTML document. If @editabl... |
| set_input_method_context | `WebView.set_input_method_context(context: InputMethodContext?) -> none` | webkit_web_view_set_input_method_context | 2.28 | Set the #WebKitInputMethodContext to be used by @web_view. Set the #WebKitInputMethodContext to be used by @web_view, or %NULL to not use any input... |
| set_is_muted | `WebView.set_is_muted(muted: gboolean) -> none` | webkit_web_view_set_is_muted | 2.30 | Sets the mute state of @web_view. |
| set_microphone_capture_state | `WebView.set_microphone_capture_state(state: MediaCaptureState) -> none` | webkit_web_view_set_microphone_capture_state | 2.34 | Set the microphone capture state of a #WebKitWebView. If #WebKitSettings:enable-mediastream is %FALSE, this method will have no visible effect. Onc... |
| set_settings | `WebView.set_settings(settings: Settings) -> none` | webkit_web_view_set_settings |  | Sets the #WebKitSettings to be applied to @web_view. The existing #WebKitSettings of @web_view will be replaced by @settings. New settings are appl... |
| set_zoom_level | `WebView.set_zoom_level(zoom_level: gdouble) -> none` | webkit_web_view_set_zoom_level |  | Set the zoom level of @web_view. Set the zoom level of @web_view, i.e. the factor by which the view contents are scaled with respect to their origi... |
| stop_loading | `WebView.stop_loading() -> none` | webkit_web_view_stop_loading |  | Stops any ongoing loading operation in @web_view. This method does nothing if no content is being loaded. If there is a loading operation in progre... |
| terminate_web_process | `WebView.terminate_web_process() -> none` | webkit_web_view_terminate_web_process | 2.34 | Terminates the web process associated to @web_view. When the web process gets terminated using this method, the #WebKitWebView::web-process-termina... |
| try_close | `WebView.try_close() -> none` | webkit_web_view_try_close | 2.12 | Tries to close the @web_view. This will fire the onbeforeunload event to ask the user for confirmation to close the page. If there isn't an onbefor... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| automation-presentation-type | AutomationBrowsingContextPresentation | read, write, construct-only | The #WebKitAutomationBrowsingContextPresentation of #WebKitWebView. This should only be used when creating a new #WebKitWebView as a response to #W... |
| camera-capture-state | MediaCaptureState | read, write | Capture state of the camera device. Whenever the user grants a media-request sent by the web page, requesting video capture capabilities (`navigato... |
| default-content-security-policy | utf8 | read, write, construct-only | The default Content-Security-Policy used by the webview as if it were set by an HTTP header. This applies to all content loaded including through n... |
| display-capture-state | MediaCaptureState | read, write | Capture state of the display device. Whenever the user grants a media-request sent by the web page, requesting screencasting capabilities (`navigat... |
| editable | gboolean | read, write | Whether the pages loaded inside #WebKitWebView are editable. For more information see webkit_web_view_set_editable(). |
| estimated-load-progress | gdouble | read | An estimate of the percent completion for the current loading operation. This value will range from 0.0 to 1.0 and, once a load completes, will rem... |
| favicon | gpointer | read | The favicon currently associated to the #WebKitWebView. See webkit_web_view_get_favicon() for more details. |
| is-controlled-by-automation | gboolean | read, write, construct-only | Whether the #WebKitWebView is controlled by automation tools (e.g. WebDriver, Selenium). This is required for views returned as a response to #WebK... |
| is-ephemeral | gboolean | read, write, construct-only | Whether the #WebKitWebView is ephemeral. An ephemeral web view never writes website data to the client storage, no matter what #WebKitWebsiteDataMa... |
| is-immersive-mode-enabled | gboolean | read | Whether the #WebKitWebView is in immersive mode. |
| is-loading | gboolean | read | Whether the #WebKitWebView is currently loading a page. This property becomes %TRUE as soon as a new load operation is requested and before the #We... |
| is-muted | gboolean | read, write | Whether the #WebKitWebView audio is muted. When %TRUE, audio is silenced. It may still be playing, i.e. #WebKitWebView:is-playing-audio may be %TRUE. |
| is-playing-audio | gboolean | read | Whether the #WebKitWebView is currently playing audio from a page. This property becomes %TRUE as soon as web content starts playing any kind of au... |
| is-web-process-responsive | gboolean | read | Whether the web process currently associated to the #WebKitWebView is responsive. |
| microphone-capture-state | MediaCaptureState | read, write | Capture state of the microphone device. Whenever the user grants a media-request sent by the web page, requesting audio capture capabilities (`navi... |
| page-id | guint64 | read | The identifier of the #WebKitWebPage corresponding to the #WebKitWebView. |
| related-view | WebView | write, construct-only | The related #WebKitWebView used when creating the view to share the same web process and network session. This property is not readable because the... |
| settings | Settings | write | The #WebKitSettings of the view. |
| theme-color | Gdk.RGBA | read | The theme color of the WebView's current page. |
| title | utf8 | read | The main frame document title of this #WebKitWebView. If the title has not been received yet, it will be %NULL. |
| uri | utf8 | read | The current active URI of the #WebKitWebView. See webkit_web_view_get_uri() for more details. |
| user-content-manager | UserContentManager | read, write, construct-only | The #WebKitUserContentManager of the view. |
| web-context | WebContext | read, write, construct-only | The #WebKitWebContext of the view. |
| web-extension-mode | WebExtensionMode | read, write, construct-only | This configures @web_view to treat the content as a WebExtension. Note that this refers to the web standard WebExtensions and not WebKitWebExtensio... |
| website-policies | WebsitePolicies | read, write, construct-only | The #WebKitWebsitePolicies for the view. |
| zoom-level | gdouble | read, write | The zoom level of the #WebKitWebView content. See webkit_web_view_set_zoom_level() for more details. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| authenticate | `request: AuthenticationRequest` | gboolean | last | 2.2 | This signal is emitted when the user is challenged with HTTP authentication. To let the application access or supply the credentials as well as to ... |
| close | `` | none | last |  | Emitted when closing a #WebKitWebView is requested. This occurs when a call is made from JavaScript's <function>window.close</function> function or... |
| context-menu | `context_menu: ContextMenu, event: Gdk.Event, hit_test_result: HitTestResult` | gboolean | last |  | Emitted when a context menu is about to be displayed to give the application a chance to customize the proposed menu, prevent the menu from being d... |
| context-menu-dismissed | `` | none | last |  | Emitted after #WebKitWebView::context-menu signal, if the context menu is shown, to notify that the context menu is dismissed. |
| create | `navigation_action: NavigationAction` | Gtk.Widget | last |  | Emitted when the creation of a new #WebKitWebView is requested. If this signal is handled the signal handler should return the newly created #WebKi... |
| decide-policy | `decision: PolicyDecision, decision_type: PolicyDecisionType` | gboolean | last |  | This signal is emitted when WebKit is requesting the client to decide a policy decision, such as whether to navigate to a page, open a new window o... |
| enter-fullscreen | `` | gboolean | last |  | Emitted when JavaScript code calls <function>element.webkitRequestFullScreen</function>. If the signal is not handled the #WebKitWebView will proce... |
| insecure-content-detected | `event: InsecureContentEvent` | none | last |  | Prior to 2.46, this signal was emitted when insecure content was loaded in a secure content. Since 2.46, this signal is generally no longer emitted. |
| leave-fullscreen | `` | gboolean | last |  | Emitted when the #WebKitWebView is about to restore its top level window out of its full screen state. This signal can be used by client code to re... |
| load-changed | `load_event: LoadEvent` | none | last |  | Emitted when a load operation in @web_view changes. The signal is always emitted with %WEBKIT_LOAD_STARTED when a new load request is made and %WEB... |
| load-failed | `load_event: LoadEvent, failing_uri: utf8, error: GLib.Error` | gboolean | last |  | Emitted when an error occurs during a load operation. If the error happened when starting to load data for a page @load_event will be %WEBKIT_LOAD_... |
| load-failed-with-tls-errors | `failing_uri: utf8, certificate: Gio.TlsCertificate, errors: Gio.TlsCertificateFlags` | gboolean | last | 2.6 | Emitted when a TLS error occurs during a load operation. To allow an exception for this @certificate and the host of @failing_uri use webkit_web_co... |
| mouse-target-changed | `hit_test_result: HitTestResult, modifiers: guint` | none | last |  | This signal is emitted when the mouse cursor moves over an element such as a link, image or a media element. To determine what type of element the ... |
| permission-request | `request: PermissionRequest` | gboolean | last |  | This signal is emitted when WebKit is requesting the client to decide about a permission request, such as allowing the browser to switch to fullscr... |
| print | `print_operation: PrintOperation` | gboolean | last |  | Emitted when printing is requested on @web_view, usually by a JavaScript call, before the print dialog is shown. This signal can be used to set the... |
| query-permission-state | `query: PermissionStateQuery` | gboolean | last | 2.40 | This signal allows the User-Agent to respond to permission requests for powerful features, as specified by the Permissions W3C Specification. You c... |
| ready-to-show | `` | none | last |  | Emitted after #WebKitWebView::create on the newly created #WebKitWebView when it should be displayed to the user. When this signal is emitted all t... |
| resource-load-started | `resource: WebResource, request: URIRequest` | none | last |  | Emitted when a new resource is going to be loaded. The @request parameter contains the #WebKitURIRequest that will be sent to the server. You can m... |
| run-as-modal | `` | none | last |  | Emitted after #WebKitWebView::ready-to-show on the newly created #WebKitWebView when JavaScript code calls <function>window.showModalDialog</functi... |
| run-color-chooser | `request: ColorChooserRequest` | gboolean | last | 2.8 | This signal is emitted when the user interacts with a <input type='color' /> HTML element, requesting from WebKit to show a dialog to select a colo... |
| run-file-chooser | `request: FileChooserRequest` | gboolean | last |  | This signal is emitted when the user interacts with a <input type='file' /> HTML element, requesting from WebKit to show a dialog to select one or ... |
| script-dialog | `dialog: ScriptDialog` | gboolean | last |  | Emitted when JavaScript code calls <function>window.alert</function>, <function>window.confirm</function> or <function>window.prompt</function>, or... |
| show-notification | `notification: Notification` | gboolean | last | 2.8 | This signal is emitted when a notification should be presented to the user. The @notification is kept alive until either: 1) the web page cancels i... |
| show-option-menu | `menu: OptionMenu, event: Gdk.Event, rectangle: Gdk.Rectangle` | gboolean | last | 2.18 | This signal is emitted when a select element in @web_view needs to display a dropdown menu. This signal can be used to show a custom menu, using @m... |
| submit-form | `request: FormSubmissionRequest` | none | last |  | This signal is emitted when a form is about to be submitted. The @request argument passed contains information about the text fields of the form. T... |
| user-message-received | `message: UserMessage` | gboolean | last | 2.28 | This signal is emitted when a #WebKitUserMessage is received from the #WebKitWebPage corresponding to @web_view. You can reply to the message using... |
| web-process-crashed | `` | gboolean | last |  | This signal is emitted when the web process crashes. |
| web-process-terminated | `reason: WebProcessTerminationReason` | none | last | 2.20 | This signal is emitted when the web process terminates abnormally due to @reason. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `authenticate(request: AuthenticationRequest) -> gboolean` |  |  |  |
| close | `close() -> none` |  |  |  |
| context_menu | `context_menu(context_menu: ContextMenu, event: Gdk.Event, hit_test_result: HitTestResult) -> gboolean` |  |  |  |
| context_menu_dismissed | `context_menu_dismissed() -> none` |  |  |  |
| create | `create(navigation_action: NavigationAction) -> Gtk.Widget` |  |  |  |
| decide_policy | `decide_policy(decision: PolicyDecision, type: PolicyDecisionType) -> gboolean` |  |  |  |
| enter_fullscreen | `enter_fullscreen() -> gboolean` |  |  |  |
| insecure_content_detected | `insecure_content_detected(event: InsecureContentEvent) -> none` |  |  |  |
| leave_fullscreen | `leave_fullscreen() -> gboolean` |  |  |  |
| load_changed | `load_changed(load_event: LoadEvent) -> none` |  |  |  |
| load_failed | `load_failed(load_event: LoadEvent, failing_uri: utf8, error: GLib.Error) -> gboolean` |  |  |  |
| load_failed_with_tls_errors | `load_failed_with_tls_errors(failing_uri: utf8, certificate: Gio.TlsCertificate, errors: Gio.TlsCertificateFlags) -> gboolean` |  |  |  |
| mouse_target_changed | `mouse_target_changed(hit_test_result: HitTestResult, modifiers: guint) -> none` |  |  |  |
| permission_request | `permission_request(permission_request: PermissionRequest) -> gboolean` |  |  |  |
| print | `print(print_operation: PrintOperation) -> gboolean` |  |  |  |
| query_permission_state | `query_permission_state(query: PermissionStateQuery) -> gboolean` |  |  |  |
| ready_to_show | `ready_to_show() -> none` |  |  |  |
| resource_load_started | `resource_load_started(resource: WebResource, request: URIRequest) -> none` |  |  |  |
| run_as_modal | `run_as_modal() -> none` |  |  |  |
| run_color_chooser | `run_color_chooser(request: ColorChooserRequest) -> gboolean` |  |  |  |
| run_file_chooser | `run_file_chooser(request: FileChooserRequest) -> gboolean` |  |  |  |
| script_dialog | `script_dialog(dialog: ScriptDialog) -> gboolean` |  |  |  |
| show_notification | `show_notification(notification: Notification) -> gboolean` |  |  |  |
| show_option_menu | `show_option_menu(menu: OptionMenu, event: Gdk.Event, rectangle: Gdk.Rectangle) -> gboolean` |  |  |  |
| submit_form | `submit_form(request: FormSubmissionRequest) -> none` |  |  |  |
| user_message_received | `user_message_received(message: UserMessage) -> gboolean` |  |  |  |
| web_process_crashed | `web_process_crashed() -> gboolean` |  |  |  |
| web_process_terminated | `web_process_terminated(reason: WebProcessTerminationReason) -> none` |  |  |  |

### WebKit2.WebViewBase

Parent: `Gtk.Container` ?? Subclasses: `WebView` ?? Implements: `Atk.ImplementorIface`, `Gtk.Buildable` ?? GType: `WebKitWebViewBase` ?? C type: `WebKitWebViewBase`

#### Fields

| Field | Type |
| --- | --- |
| parent | Gtk.Container |
| priv | WebViewBasePrivate |

### WebKit2.WindowProperties

Parent: `GObject.Object` ?? GType: `WebKitWindowProperties` ?? C type: `WebKitWindowProperties`

Window properties of a #WebKitWebView. The content of a #WebKitWebView can request to change certain properties of the window containing the view. ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WindowPropertiesPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_fullscreen | `WindowProperties.get_fullscreen() -> gboolean` | webkit_window_properties_get_fullscreen |  | Get whether the window should be shown in fullscreen state or not. |
| get_geometry | `WindowProperties.get_geometry(geometry: out Gdk.Rectangle) -> none` | webkit_window_properties_get_geometry |  | Get the geometry the window should have on the screen when shown. |
| get_locationbar_visible | `WindowProperties.get_locationbar_visible() -> gboolean` | webkit_window_properties_get_locationbar_visible |  | Get whether the window should have the locationbar visible or not. |
| get_menubar_visible | `WindowProperties.get_menubar_visible() -> gboolean` | webkit_window_properties_get_menubar_visible |  | Get whether the window should have the menubar visible or not. |
| get_resizable | `WindowProperties.get_resizable() -> gboolean` | webkit_window_properties_get_resizable |  | Get whether the window should be resizable by the user or not. |
| get_scrollbars_visible | `WindowProperties.get_scrollbars_visible() -> gboolean` | webkit_window_properties_get_scrollbars_visible |  | Get whether the window should have the scrollbars visible or not. |
| get_statusbar_visible | `WindowProperties.get_statusbar_visible() -> gboolean` | webkit_window_properties_get_statusbar_visible |  | Get whether the window should have the statusbar visible or not. |
| get_toolbar_visible | `WindowProperties.get_toolbar_visible() -> gboolean` | webkit_window_properties_get_toolbar_visible |  | Get whether the window should have the toolbar visible or not. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| fullscreen | gboolean | read, write, construct-only | Whether window will be displayed fullscreen. |
| geometry | Gdk.Rectangle | read, write, construct-only | The size and position of the window on the screen. |
| locationbar-visible | gboolean | read, write, construct-only | Whether the locationbar should be visible for the window. |
| menubar-visible | gboolean | read, write, construct-only | Whether the menubar should be visible for the window. |
| resizable | gboolean | read, write, construct-only | Whether the window can be resized. |
| scrollbars-visible | gboolean | read, write, construct-only | Whether the scrollbars should be visible for the window. |
| statusbar-visible | gboolean | read, write, construct-only | Whether the statusbar should be visible for the window. |
| toolbar-visible | gboolean | read, write, construct-only | Whether the toolbar should be visible for the window. |

### WebKit2.XRPermissionRequest

Parent: `GObject.Object` ?? Implements: `PermissionRequest` ?? GType: `WebKitXRPermissionRequest` ?? C type: `WebKitXRPermissionRequest`

A permission request for accessing virtual reality (VR) and augmented reality (AR) devices, including sensors and head-mounted displays. WebKitXRPe...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | XRPermissionRequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_consent_optional_features | `XRPermissionRequest.get_consent_optional_features() -> XRSessionFeatures` | webkit_xr_permission_request_get_consent_optional_features | 2.52 | Gets the optional features that need user consent. These features can be granted by calling webkit_xr_permission_request_set_granted_optional_featu... |
| get_consent_required_features | `XRPermissionRequest.get_consent_required_features() -> XRSessionFeatures` | webkit_xr_permission_request_get_consent_required_features | 2.52 | Gets the required features that need user consent. These features are automatically granted if the request is allowed with webkit_permission_reques... |
| get_granted_features | `XRPermissionRequest.get_granted_features() -> XRSessionFeatures` | webkit_xr_permission_request_get_granted_features | 2.52 | Gets the features requested by the origin for the XR device, which are either granted by default or have been explicitly granted by the user. |
| get_optional_features_requested | `XRPermissionRequest.get_optional_features_requested() -> XRSessionFeatures` | webkit_xr_permission_request_get_optional_features_requested | 2.52 | Gets the full set of optional features requested by the web application. This includes both already granted features and those requiring consent. |
| get_required_features_requested | `XRPermissionRequest.get_required_features_requested() -> XRSessionFeatures` | webkit_xr_permission_request_get_required_features_requested | 2.52 | Gets the full set of required features requested by the web application. This includes both already granted features and those requiring consent. |
| get_security_origin | `XRPermissionRequest.get_security_origin() -> SecurityOrigin` | webkit_xr_permission_request_get_security_origin | 2.52 | Gets the security origin that initiated the permission request. |
| get_session_mode | `XRPermissionRequest.get_session_mode() -> XRSessionMode` | webkit_xr_permission_request_get_session_mode | 2.52 | Gets the session mode for which permission is being requested. |
| set_granted_optional_features | `XRPermissionRequest.set_granted_optional_features(granted: XRSessionFeatures) -> none` | webkit_xr_permission_request_set_granted_optional_features | 2.52 | Sets which optional features should be granted if the permission request is allowed. This function should be called with a subset of the features f... |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| PermissionRequest |  | 0 | 0 | 2 | A permission request. There are situations where an embedder would need to ask the user for permission to do certain types of operations, such as s... |

### WebKit2.PermissionRequest

GType: `WebKitPermissionRequest` ?? C type: `WebKitPermissionRequest`

A permission request. There are situations where an embedder would need to ask the user for permission to do certain types of operations, such as s...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| allow | `PermissionRequest.allow() -> none` | webkit_permission_request_allow |  | Allow the action which triggered this request. |
| deny | `PermissionRequest.deny() -> none` | webkit_permission_request_deny |  | Deny the action which triggered this request. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| allow | `allow() -> none` |  |  | Allow the action which triggered this request. |
| deny | `deny() -> none` |  |  | Deny the action which triggered this request. |

## Enums

### WebKit2.AuthenticationScheme

GType: `WebKitAuthenticationScheme` ?? C type: `WebKitAuthenticationScheme`

Enum values representing the authentication scheme.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| client_certificate_pin_requested | 9 | client-certificate-pin-requested | Client certificate PIN required for use. Since: 2.34 |
| client_certificate_requested | 7 | client-certificate-requested | Client Certificate Authentication (see RFC 2246). |
| default | 1 | default | The default authentication scheme of WebKit. |
| html_form | 4 | html-form | HTML Form authentication. |
| http_basic | 2 | http-basic | Basic authentication scheme as defined in RFC 2617. |
| http_digest | 3 | http-digest | Digest authentication scheme as defined in RFC 2617. |
| negotiate | 6 | negotiate | Negotiate (or SPNEGO) authentication scheme as defined in RFC 4559. |
| ntlm | 5 | ntlm | NTLM Microsoft proprietary authentication scheme. |
| server_trust_evaluation_requested | 8 | server-trust-evaluation-requested | Server Trust Authentication. |
| unknown | 100 | unknown | Authentication scheme unknown. |

### WebKit2.AutomationBrowsingContextPresentation

GType: `WebKitAutomationBrowsingContextPresentation` ?? C type: `WebKitAutomationBrowsingContextPresentation`

Enum values used for determining the automation browsing context presentation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| tab | 1 | tab | a tab |
| window | 0 | window | a window |

### WebKit2.AutoplayPolicy

GType: `WebKitAutoplayPolicy` ?? C type: `WebKitAutoplayPolicy`

Enum values used to specify autoplay policies.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| allow | 0 | allow | Do not restrict autoplay. |
| allow_without_sound | 1 | allow-without-sound | Allow videos to autoplay if they have no audio track, or if their audio track is muted. |
| deny | 2 | deny | Never allow autoplay. |

### WebKit2.CacheModel

GType: `WebKitCacheModel` ?? C type: `WebKitCacheModel`

Enum values used for determining the #WebKitWebContext cache model.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| document_browser | 2 | document-browser | A cache model optimized for viewing a series of local files -- for example, a documentation viewer or a website designer. WebKit will cache a moder... |
| document_viewer | 0 | document-viewer | Disable the cache completely, which substantially reduces memory usage. Useful for applications that only access a single local file, with no navig... |
| web_browser | 1 | web-browser | Improve document load speed substantially by caching a very large number of resources and previously viewed content. |

### WebKit2.ContextMenuAction

GType: `WebKitContextMenuAction` ?? C type: `WebKitContextMenuAction`

Enum values used to denote the stock actions for #WebKitContextMenuItem<!-- -->s

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bold | 27 | bold | Bold. |
| copy | 14 | copy | Copy current selection the clipboard. |
| copy_audio_link_to_clipboard | 35 | copy-audio-link-to-clipboard | Copy audio link location in to the clipboard. |
| copy_image_to_clipboard | 7 | copy-image-to-clipboard | Copy current image to the clipboard. |
| copy_image_url_to_clipboard | 8 | copy-image-url-to-clipboard | Copy current image location to the clipboard. |
| copy_link_to_clipboard | 4 | copy-link-to-clipboard | Copy link location to the clipboard. |
| copy_video_link_to_clipboard | 34 | copy-video-link-to-clipboard | Copy video link location in to the clipboard. |
| custom | 10000 | custom | Custom action defined by applications. |
| cut | 15 | cut | Cut current selection to the clipboard. |
| delete | 17 | delete | Delete current selection. |
| download_audio_to_disk | 43 | download-audio-to-disk | Download audio to disk. Since 2.2 |
| download_image_to_disk | 6 | download-image-to-disk | Download current image. |
| download_link_to_disk | 3 | download-link-to-disk | Download link destination. |
| download_video_to_disk | 42 | download-video-to-disk | Download video to disk. Since 2.2 |
| enter_video_fullscreen | 38 | enter-video-fullscreen | Show current video element in fullscreen mode. |
| font_menu | 26 | font-menu | Font options menu. |
| go_back | 10 | go-back | Load the previous history item. |
| go_forward | 11 | go-forward | Load the next history item. |
| ignore_grammar | 25 | ignore-grammar | Ignore grammar. |
| ignore_spelling | 23 | ignore-spelling | Causes the spellchecker to ignore the word for this session. |
| input_methods | 19 | input-methods | Input methods menu. |
| insert_emoji | 44 | insert-emoji | Insert an emoji. Since 2.26 |
| inspect_element | 31 | inspect-element | Open current element in the inspector. |
| italic | 28 | italic | Italic. |
| learn_spelling | 24 | learn-spelling | Causes the spellchecker to add the word to the dictionary. |
| media_mute | 41 | media-mute | Mute current media element. |
| media_pause | 40 | media-pause | Pause current media element. |
| media_play | 39 | media-play | Play current media element. |
| no_action | 0 | no-action | No action, used by separator menu items. |
| no_guesses_found | 22 | no-guesses-found | An indicator that spellchecking found no proposed replacements. |
| open_audio_in_new_window | 33 | open-audio-in-new-window | Open current audio element in a new window. |
| open_frame_in_new_window | 9 | open-frame-in-new-window | Open current frame in a new window. |
| open_image_in_new_window | 5 | open-image-in-new-window | Open current image in a new window. |
| open_link | 1 | open-link | Open current link. |
| open_link_in_new_window | 2 | open-link-in-new-window | Open current link in a new window. |
| open_video_in_new_window | 32 | open-video-in-new-window | Open current video element in a new window. |
| outline | 30 | outline | Outline. |
| paste | 16 | paste | Paste clipboard contents. |
| paste_as_plain_text | 45 | paste-as-plain-text | Paste clipboard contents as plain text. Since 2.30 |
| reload | 13 | reload | Reload the contents of current view. |
| select_all | 18 | select-all | Select all text. |
| spelling_guess | 21 | spelling-guess | A proposed replacement for a misspelled word. |
| stop | 12 | stop | Stop any ongoing loading operation. |
| toggle_media_controls | 36 | toggle-media-controls | Enable or disable media controls. |
| toggle_media_loop | 37 | toggle-media-loop | Enable or disable media loop. |
| underline | 29 | underline | Underline. |
| unicode | 20 | unicode | Unicode menu. |

### WebKit2.CookieAcceptPolicy

GType: `WebKitCookieAcceptPolicy` ?? C type: `WebKitCookieAcceptPolicy`

Enum values used to denote the cookie acceptance policies.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| always | 0 | always | Accept all cookies unconditionally. |
| never | 1 | never | Reject all cookies unconditionally. |
| no_third_party | 2 | no-third-party | Accept only cookies set by the main document loaded. |

### WebKit2.CookiePersistentStorage

GType: `WebKitCookiePersistentStorage` ?? C type: `WebKitCookiePersistentStorage`

Enum values used to denote the cookie persistent storage types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| sqlite | 1 | sqlite | Cookies are stored in a SQLite file in the current Mozilla format. |
| text | 0 | text | Cookies are stored in a text file in the Mozilla "cookies.txt" format. |

### WebKit2.CredentialPersistence

GType: `WebKitCredentialPersistence` ?? C type: `WebKitCredentialPersistence`

Enum values representing the duration for which a credential persists.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| for_session | 1 | for-session | Credential persists for session only |
| none | 0 | none | Credential does not persist |
| permanent | 2 | permanent | Credential persists permanently |

### WebKit2.DownloadError

GType: `WebKitDownloadError` ?? C type: `WebKitDownloadError`

Enum values used to denote the various download errors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cancelled_by_user | 400 | cancelled-by-user | Download was cancelled by user |
| destination | 401 | destination | Download failure due to destination error |
| network | 499 | network | Download failure due to network error |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_download_error_quark |  | Gets the quark for the domain of download errors. |

### WebKit2.FaviconDatabaseError

GType: `WebKitFaviconDatabaseError` ?? C type: `WebKitFaviconDatabaseError`

Enum values used to denote the various errors related to the #WebKitFaviconDatabase.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| favicon_not_found | 1 | favicon-not-found | There is not an icon available for the requested URL |
| favicon_unknown | 2 | favicon-unknown | There might be an icon for the requested URL, but its data is unknown at the moment |
| not_initialized | 0 | not-initialized | The #WebKitFaviconDatabase is closed |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_favicon_database_error_quark |  | Gets the quark for the domain of favicon database errors. |

### WebKit2.FeatureStatus

GType: `WebKitFeatureStatus` ?? C type: `WebKitFeatureStatus`

Describes the status of a [struct@WebKitFeature]. The status for a given feature can be obtained with [id@webkit_feature_get_status].

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| developer | 3 | developer | Feature for web developers. The feature is not generally useful for end users, and always disabled by default. |
| embedder | 0 | embedder | Feature that adjust behaviour for specific application needs. The feature is not part of a Web platform feature, not a mature feature intended to b... |
| internal | 2 | internal | Feature for debugging the WebKit engine. The feature is not generally useful for user or web developers, and always disabled by default. |
| mature | 7 | mature | Feature in general use. The feature is always enabled and in general there should be no user-facing interface to toggle it. |
| preview | 5 | preview | Feature ready to be tested by users. The feature is disabled by default, but may be enabled by applications automatically e.g. in their ???technolo... |
| stable | 6 | stable | Feature ready for general use. The feature is enabled by default, but it may still be toggled to support debugging and testing. |
| testable | 4 | testable | Feature in active development and complete enough for testing. The feature may not be yet ready to ship and is disabled by default. |
| unstable | 1 | unstable | Feature in development. The feature may be unfinished, and there are no guarantees about its safety and stability. |

### WebKit2.HardwareAccelerationPolicy

GType: `WebKitHardwareAccelerationPolicy` ?? C type: `WebKitHardwareAccelerationPolicy`

Enum values used for determining the hardware acceleration policy.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| always | 1 | always | Hardware acceleration is always enabled, even for websites not requesting it. |
| never | 2 | never | Hardware acceleration is always disabled, even for websites requesting it. |
| on_demand | 0 | on-demand | Hardware acceleration is enabled/disabled as request by web contents. |

### WebKit2.InputPurpose

GType: `WebKitInputPurpose` ?? C type: `WebKitInputPurpose`

Enum values used to describe the primary purpose of the active editable element.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| digits | 1 | digits | Editable element expects digits |
| email | 5 | email | Editable element expects an email |
| free_form | 0 | free-form | Editable element expects any characters |
| number | 2 | number | Editable element expects a number |
| password | 6 | password | Editable element expects a password |
| phone | 3 | phone | Editable element expects a telephone |
| url | 4 | url | Editable element expects a URL |

### WebKit2.InsecureContentEvent

GType: `WebKitInsecureContentEvent` ?? C type: `WebKitInsecureContentEvent`

Enum values previously used to denote the different events which can trigger the detection of insecure content. Since 2.46, WebKit generally no lon...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| displayed | 1 | displayed | Insecure content has been detected by trying to display any kind of resource (e.g. an image) from an untrusted source. |
| run | 0 | run | Insecure content has been detected by trying to execute any kind of logic (e.g. a script) from an untrusted source. |

### WebKit2.JavascriptError

GType: `WebKitJavascriptError` ?? C type: `WebKitJavascriptError`

Enum values used to denote errors happening when executing JavaScript

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_parameter | 600 | invalid-parameter | An unsupported parameter has been used to call and async function from API. Since 2.40 |
| invalid_result | 601 | invalid-result | The result of JavaScript execution could not be returned. Since 2.40 |
| script_failed | 699 | script-failed | An exception was raised in JavaScript execution |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_javascript_error_quark |  | Gets the quark for the domain of JavaScript errors. |

### WebKit2.LoadEvent

GType: `WebKitLoadEvent` ?? C type: `WebKitLoadEvent`

Enum values used to denote the different events that happen during a #WebKitWebView load operation.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| committed | 2 | committed | The content started arriving for a page load. The necessary transport requirements are established, and the load is being performed. |
| finished | 3 | finished | Load completed. All resources are done loading or there was an error during the load operation. |
| redirected | 1 | redirected | A provisional data source received a server redirect. |
| started | 0 | started | A new load request has been made. No data has been received yet, empty structures have been allocated to perform the load; the load may still fail ... |

### WebKit2.MediaCaptureState

GType: `WebKitMediaCaptureState` ?? C type: `WebKitMediaCaptureState`

Enum values used to specify the capture state of a media device.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| active | 1 | active | Media capture is active. |
| muted | 2 | muted | Media capture is muted. |
| none | 0 | none | Media capture is disabled. |

### WebKit2.NavigationType

GType: `WebKitNavigationType` ?? C type: `WebKitNavigationType`

Enum values used to denote the various navigation types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| back_forward | 2 | back-forward | The navigation was triggered by navigating forward or backward. |
| form_resubmitted | 4 | form-resubmitted | The navigation was triggered by resubmitting a form. |
| form_submitted | 1 | form-submitted | The navigation was triggered by submitting a form. |
| link_clicked | 0 | link-clicked | The navigation was triggered by clicking a link. |
| other | 5 | other | The navigation was triggered by some other action. |
| reload | 3 | reload | The navigation was triggered by reloading. |

### WebKit2.NetworkError

GType: `WebKitNetworkError` ?? C type: `WebKitNetworkError`

Enum values used to denote the various network errors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cancelled | 302 | cancelled | Load failure due to cancellation |
| failed | 399 | failed | Generic load failure |
| file_does_not_exist | 303 | file-does-not-exist | Load failure due to missing file |
| transport | 300 | transport | Load failure due to transport error |
| unknown_protocol | 301 | unknown-protocol | Load failure due to unknown protocol |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_network_error_quark |  | Gets the quark for the domain of networking errors. |

### WebKit2.NetworkProxyMode

GType: `WebKitNetworkProxyMode` ?? C type: `WebKitNetworkProxyMode`

Enum values used to set the network proxy mode.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| custom | 2 | custom | Use custom proxy settings. |
| default | 0 | default | Use the default proxy of the system. |
| no_proxy | 1 | no-proxy | Do not use any proxy. |

### WebKit2.PermissionState

GType: `WebKitPermissionState` ?? C type: `WebKitPermissionState`

Enum values representing query permission results.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| denied | 1 | denied | Access to the feature is denied. |
| granted | 0 | granted | Access to the feature is granted. |
| prompt | 2 | prompt | Access to the feature has to be requested via user prompt. |

### WebKit2.PluginError

GType: `WebKitPluginError` ?? C type: `WebKitPluginError`

Enum values used to denote the various plugin and media errors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cannot_find_plugin | 200 | cannot-find-plugin | Load failure due to missing plugin. Deprecated 2.32 |
| cannot_load_plugin | 201 | cannot-load-plugin | Load failure due to inability to load plugin. Deprecated 2.32 |
| connection_cancelled | 203 | connection-cancelled | Load failure due to connection cancellation. Deprecated 2.32 |
| failed | 299 | failed | Generic plugin load failure. Deprecated 2.32 |
| java_unavailable | 202 | java-unavailable | Load failure due to missing Java support that is required to load plugin. Deprecated 2.32 |
| will_handle_load | 204 | will-handle-load | Preliminary load failure for media content types. A new load will be started to perform the media load. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_plugin_error_quark |  | Gets the quark for the domain of plug-in errors. |

### WebKit2.PolicyDecisionType

GType: `WebKitPolicyDecisionType` ?? C type: `WebKitPolicyDecisionType`

Enum values used for determining the type of a policy decision during #WebKitWebView::decide-policy.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| navigation_action | 0 | navigation-action | This type of policy decision is requested when WebKit is about to navigate to a new page in either the main frame or a subframe. Acceptable policy ... |
| new_window_action | 1 | new-window-action | This type of policy decision is requested when WebKit is about to create a new window. Acceptable policy decisions are either webkit_policy_decisio... |
| response | 2 | response | This type of decision is used when WebKit has received a response for a network resource and is about to start the load. Note that these resources ... |

### WebKit2.PolicyError

GType: `WebKitPolicyError` ?? C type: `WebKitPolicyError`

Enum values used to denote the various policy errors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cannot_show_mime_type | 100 | cannot-show-mime-type | Load failure due to unsupported mime type |
| cannot_show_uri | 101 | cannot-show-uri | Load failure due to URI that can not be shown |
| cannot_use_restricted_port | 103 | cannot-use-restricted-port | Load failure due to port restriction |
| failed | 199 | failed | Generic load failure due to policy error |
| frame_load_interrupted_by_policy_change | 102 | frame-load-interrupted-by-policy-change | Load failure due to frame load interruption by policy change |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_policy_error_quark |  | Gets the quark for the domain of policy errors. |

### WebKit2.PrintError

GType: `WebKitPrintError` ?? C type: `WebKitPrintError`

Enum values used to denote the various print errors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| general | 599 | general | Unspecified error during a print operation |
| invalid_page_range | 501 | invalid-page-range | Invalid page range |
| printer_not_found | 500 | printer-not-found | Selected printer cannot be found |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_print_error_quark |  | Gets the quark for the domain of printing errors. |

### WebKit2.PrintOperationResponse

GType: `WebKitPrintOperationResponse` ?? C type: `WebKitPrintOperationResponse`

Enum values representing the response of the print dialog shown with webkit_print_operation_run_dialog().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cancel | 1 | cancel | Print dialog was cancelled |
| print | 0 | print | Print button was clicked in print dialog |

### WebKit2.ProcessModel

GType: `WebKitProcessModel` ?? C type: `WebKitProcessModel`

Enum values used for determining the #WebKitWebContext process model.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multiple_secondary_processes | 1 | multiple-secondary-processes | Use one process for each #WebKitWebView, while still allowing for some of them to share a process in certain situations. The main advantage of this... |
| shared_secondary_process | 0 | shared-secondary-process | Deprecated 2.26. |

### WebKit2.SaveMode

GType: `WebKitSaveMode` ?? C type: `WebKitSaveMode`

Enum values to specify the different ways in which a #WebKitWebView can save its current web page into a self-contained file.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| mhtml | 0 | mhtml | Save the current page using the MHTML format. |

### WebKit2.ScriptDialogType

GType: `WebKitScriptDialogType` ?? C type: `WebKitScriptDialogType`

Enum values used for determining the type of #WebKitScriptDialog

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alert | 0 | alert | Alert script dialog, used to show a message to the user. |
| before_unload_confirm | 3 | before-unload-confirm | Before unload confirm dialog, used to ask confirmation to leave the current page to the user. Since 2.12 |
| confirm | 1 | confirm | Confirm script dialog, used to ask confirmation to the user. |
| prompt | 2 | prompt | Prompt script dialog, used to ask information to the user. |

### WebKit2.SnapshotError

GType: `WebKitSnapshotError` ?? C type: `WebKitSnapshotError`

Enum values used to denote errors happening when creating snapshots of #WebKitWebView

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| create | 799 | create | An error occurred when creating a webpage snapshot. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_snapshot_error_quark |  | Gets the quark for the domain of page snapshot errors. |

### WebKit2.SnapshotRegion

GType: `WebKitSnapshotRegion` ?? C type: `WebKitSnapshotRegion`

Enum values used to specify the region from which to get a #WebKitWebView snapshot

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| full_document | 1 | full-document | A snapshot of the entire document. |
| visible | 0 | visible | Specifies a snapshot only for the area that is visible in the webview |

### WebKit2.TLSErrorsPolicy

GType: `WebKitTLSErrorsPolicy` ?? C type: `WebKitTLSErrorsPolicy`

Enum values used to denote the TLS errors policy.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| fail | 1 | fail | TLS errors will emit #WebKitWebView::load-failed-with-tls-errors and, if the signal is handled, finish the load. In case the signal is not handled,... |
| ignore | 0 | ignore | Ignore TLS errors. |

### WebKit2.UserContentFilterError

GType: `WebKitUserContentFilterError` ?? C type: `WebKitUserContentFilterError`

Errors that can occur while compiling content filters.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_source | 0 | invalid-source | The JSON source for a content filter is invalid. |
| not_found | 1 | not-found | The requested content filter could not be found. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_user_content_filter_error_quark |  | Gets the quark for the domain of user content filter errors. |

### WebKit2.UserContentInjectedFrames

GType: `WebKitUserContentInjectedFrames` ?? C type: `WebKitUserContentInjectedFrames`

Specifies in which frames user style sheets are to be inserted in.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_frames | 0 | all-frames | Insert the user style sheet in all the frames loaded by the web view, including nested frames. This is the default. |
| top_frame | 1 | top-frame | Insert the user style sheet *only* in the top-level frame loaded by the web view, and *not* in the nested frames. |

### WebKit2.UserMessageError

GType: `WebKitUserMessageError` ?? C type: `WebKitUserMessageError`

Enum values used to denote errors happening when sending user messages.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| message | 0 | message | The message was not handled by the receiver. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_user_message_error_quark |  | Gets the quark for the domain of user message errors. |

### WebKit2.UserScriptInjectionTime

GType: `WebKitUserScriptInjectionTime` ?? C type: `WebKitUserScriptInjectionTime`

Specifies at which place of documents an user script will be inserted.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| end | 1 | end | Insert the code of the user script at the end of the loaded documents. |
| start | 0 | start | Insert the code of the user script at the beginning of loaded documents. This is the default. |

### WebKit2.UserStyleLevel

GType: `WebKitUserStyleLevel` ?? C type: `WebKitUserStyleLevel`

Specifies how to treat an user style sheet.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| author | 1 | author | The style sheet will be treated as if it was provided by the loaded documents. That means other user style sheets may still override it. |
| user | 0 | user | The style sheet is an user style sheet, its contents always override other style sheets. This is the default. |

### WebKit2.WebExtensionMatchPatternError

GType: `WebKitWebExtensionMatchPatternError` ?? C type: `WebKitWebExtensionMatchPatternError`

Enum values used to denote errors happening when creating a #WebKitWebExtensionMatchPattern

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_host | 809 | invalid-host | The host component was invalid. |
| invalid_path | 810 | invalid-path | The path component was invalid. |
| invalid_scheme | 808 | invalid-scheme | The scheme component was invalid. |
| unknown | 899 | unknown | An unknown error occured. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | webkit_web_extension_match_pattern_error_quark | 2.48 | Gets the quark for the domain of Web Extension Match Pattern errors. |

### WebKit2.WebExtensionMode

GType: `WebKitWebExtensionMode` ?? C type: `WebKitWebExtensionMode`

Enum values used for setting if a #WebKitWebView is intended for WebExtensions.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| manifestv2 | 1 | manifestv2 | For a ManifestV2 extension. |
| manifestv3 | 2 | manifestv3 | For a ManifestV3 extension. |
| none | 0 | none | Not for an extension. |

### WebKit2.WebProcessTerminationReason

GType: `WebKitWebProcessTerminationReason` ?? C type: `WebKitWebProcessTerminationReason`

Enum values used to specify the reason why the web process terminated abnormally.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| crashed | 0 | crashed | the web process crashed. |
| exceeded_memory_limit | 1 | exceeded-memory-limit | the web process exceeded the memory limit. |
| terminated_by_api | 2 | terminated-by-api | the web process termination was requested by an API call. Since: 2.34 |

### WebKit2.XRSessionMode

GType: `WebKitXRSessionMode` ?? C type: `WebKitXRSessionMode`

Enum values representing the XR session mode. See <https://immersive-web.github.io/webxr/#xrsessionmode-enum>

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| immersive_ar | 2 | immersive-ar | immersive-ar session mode. |
| immersive_vr | 1 | immersive-vr | immersive-vr session mode. |
| inline | 0 | inline | inline session mode. |

## Flags

### WebKit2.EditorTypingAttributes

GType: `WebKitEditorTypingAttributes` ?? C type: `WebKitEditorTypingAttributes`

Enum values with flags representing typing attributes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bold | 4 | bold | Bold typing attribute. |
| italic | 8 | italic | Italic typing attribute. |
| none | 2 | none | No typing attributes. |
| strikethrough | 32 | strikethrough | Strikethrough typing attribute. |
| underline | 16 | underline | Underline typing attribute. |

### WebKit2.FindOptions

GType: `WebKitFindOptions` ?? C type: `WebKitFindOptions`

Enum values used to specify search options.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| at_word_starts | 2 | at-word-starts | search text only at the begining of the words. |
| backwards | 8 | backwards | search backwards. |
| case_insensitive | 1 | case-insensitive | case insensitive search. |
| none | 0 | none | no search flags, this means a case sensitive, no wrap, forward only search. |
| treat_medial_capital_as_word_start | 4 | treat-medial-capital-as-word-start | treat capital letters in the middle of words as word start. |
| wrap_around | 16 | wrap-around | if not present search will stop at the end of the document. |

### WebKit2.HitTestResultContext

GType: `WebKitHitTestResultContext` ?? C type: `WebKitHitTestResultContext`

Enum values with flags representing the context of a #WebKitHitTestResult.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| document | 2 | document | anywhere in the document. |
| editable | 32 | editable | an editable element |
| image | 8 | image | an image element. |
| link | 4 | link | a hyperlink element. |
| media | 16 | media | a video or audio element. |
| scrollbar | 64 | scrollbar | a scrollbar element. |
| selection | 128 | selection | a selected element. Since 2.8 |

### WebKit2.InputHints

GType: `WebKitInputHints` ?? C type: `WebKitInputHints`

Enum values used to describe hints that might be taken into account by input methods.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| inhibit_osk | 32 | inhibit-osk | Suggest to not show an onscreen keyboard |
| lowercase | 2 | lowercase | Suggest to not autocapitlize |
| none | 0 | none | No special behavior suggested |
| spellcheck | 1 | spellcheck | Suggest spell checking |
| uppercase_chars | 4 | uppercase-chars | Suggest to capitalize all text |
| uppercase_sentences | 16 | uppercase-sentences | Suggest to capitalize the first word of each sentence |
| uppercase_words | 8 | uppercase-words | Suggest to capitalize the first character of each word |

### WebKit2.SnapshotOptions

GType: `WebKitSnapshotOptions` ?? C type: `WebKitSnapshotOptions`

Enum values used to specify options when taking a snapshot from a #WebKitWebView.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| include_selection_highlighting | 1 | include-selection-highlighting | Whether to include in the snapshot the highlight of the selected content. |
| none | 0 | none | Do not include any special options. |
| transparent_background | 2 | transparent-background | Do not fill the background with white before rendering the snapshot. Since 2.8 |

### WebKit2.WebsiteDataTypes

GType: `WebKitWebsiteDataTypes` ?? C type: `WebKitWebsiteDataTypes`

Enum values with flags representing types of Website data.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 16383 | all | All types. |
| cookies | 256 | cookies | Cookies. |
| device_id_hash_salt | 512 | device-id-hash-salt | Hash salt used to generate the device ids used by webpages. Since 2.24 |
| disk_cache | 2 | disk-cache | HTTP disk cache. |
| dom_cache | 8192 | dom-cache | DOM (CacheStorage) cache. Since 2.30 |
| hsts_cache | 1024 | hsts-cache | HSTS cache. Since 2.26 |
| indexeddb_databases | 64 | indexeddb-databases | IndexedDB databases. |
| itp | 2048 | itp | Intelligent Tracking Prevention data. Since 2.30. |
| local_storage | 16 | local-storage | Local storage data. |
| memory_cache | 1 | memory-cache | Memory cache. |
| offline_application_cache | 4 | offline-application-cache | Offline web application cache. |
| plugin_data | 128 | plugin-data | Plugins data. Deprecated 2.32 |
| service_worker_registrations | 4096 | service-worker-registrations | Service worker registrations. Since 2.30 |
| session_storage | 8 | session-storage | Session storage data. |
| websql_databases | 32 | websql-databases | WebSQL databases. Deprecated 2.24 |

### WebKit2.XRSessionFeatures

GType: `WebKitXRSessionFeatures` ?? C type: `WebKitXRSessionFeatures`

Enum values representing the XR session features. See <https://immersive-web.github.io/webxr/#xrreferencespace-interface>. And, see <https://immers...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bounded_floor | 8 | bounded-floor | bounded-floor feature. |
| hand_tracking | 32 | hand-tracking | hand tracking feature. |
| hit_test | 64 | hit-test | hit test feature. |
| layers | 128 | layers | WebXR Layers feature. |
| local | 2 | local | local feature. |
| local_floor | 4 | local-floor | local-floor feature. |
| unbounded | 16 | unbounded | unbounded feature. |
| viewer | 1 | viewer | viewer feature. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ApplicationInfo |  | 0 | 0 | 7 | Information about an application running in automation mode. |
| AuthenticationRequestClass |  | 0 | 0 | 0 |  |
| AuthenticationRequestPrivate |  | 0 | 0 | 0 |  |
| AutomationSessionClass |  | 0 | 0 | 0 |  |
| AutomationSessionPrivate |  | 0 | 0 | 0 |  |
| BackForwardListClass |  | 0 | 0 | 0 |  |
| BackForwardListItemClass |  | 0 | 0 | 0 |  |
| BackForwardListItemPrivate |  | 0 | 0 | 0 |  |
| BackForwardListPrivate |  | 0 | 0 | 0 |  |
| ClipboardPermissionRequestClass |  | 0 | 0 | 0 |  |
| ClipboardPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| ColorChooserRequestClass |  | 0 | 0 | 0 |  |
| ColorChooserRequestPrivate |  | 0 | 0 | 0 |  |
| ContextMenuClass |  | 0 | 0 | 0 |  |
| ContextMenuItemClass |  | 0 | 0 | 0 |  |
| ContextMenuItemPrivate |  | 0 | 0 | 0 |  |
| ContextMenuPrivate |  | 0 | 0 | 0 |  |
| CookieManagerClass |  | 0 | 0 | 0 |  |
| CookieManagerPrivate |  | 0 | 0 | 0 |  |
| Credential |  | 0 | 0 | 10 | Groups information used for user authentication. |
| DeviceInfoPermissionRequestClass |  | 0 | 0 | 0 |  |
| DeviceInfoPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| DownloadClass |  | 0 | 0 | 0 |  |
| DownloadPrivate |  | 0 | 0 | 0 |  |
| EditorStateClass |  | 0 | 0 | 0 |  |
| EditorStatePrivate |  | 0 | 0 | 0 |  |
| FaviconDatabaseClass |  | 0 | 0 | 0 |  |
| FaviconDatabasePrivate |  | 0 | 0 | 0 |  |
| Feature |  | 0 | 0 | 8 | Describes a web engine feature that may be toggled at runtime. The WebKit web engine includes a set of features which may be toggled programmatical... |
| FeatureList |  | 0 | 0 | 4 | Contains a set of toggle-able web engine features. The list supports passing around a set of [struct@Feature] objects and iterating over them: ```c... |
| FileChooserRequestClass |  | 0 | 0 | 0 |  |
| FileChooserRequestPrivate |  | 0 | 0 | 0 |  |
| FindControllerClass |  | 0 | 0 | 0 |  |
| FindControllerPrivate |  | 0 | 0 | 0 |  |
| FormSubmissionRequestClass |  | 0 | 0 | 0 |  |
| FormSubmissionRequestPrivate |  | 0 | 0 | 0 |  |
| GeolocationManagerClass |  | 0 | 0 | 0 |  |
| GeolocationManagerPrivate |  | 0 | 0 | 0 |  |
| GeolocationPermissionRequestClass |  | 0 | 0 | 0 |  |
| GeolocationPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| GeolocationPosition |  | 0 | 0 | 8 | An opaque struct to provide position updates to a #WebKitGeolocationManager. WebKitGeolocationPosition is an opaque struct used to provide position... |
| HitTestResultClass |  | 0 | 0 | 0 |  |
| HitTestResultPrivate |  | 0 | 0 | 0 |  |
| InputMethodContextClass |  | 0 | 0 | 0 | Called via webkit_input_method_context_set_enable_preedit() to control the use of the preedit string. |
| InputMethodContextPrivate |  | 0 | 0 | 0 |  |
| InputMethodUnderline |  | 0 | 0 | 4 | Range of text in an preedit string to be shown underlined. |
| InstallMissingMediaPluginsPermissionRequestClass |  | 0 | 0 | 0 |  |
| InstallMissingMediaPluginsPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| ITPFirstParty |  | 0 | 0 | 5 | Describes a first party origin. |
| ITPThirdParty |  | 0 | 0 | 4 | Describes a third party origin. |
| JavascriptResult |  | 0 | 0 | 5 | Result of JavaScript evaluation in a web view. |
| MediaKeySystemPermissionRequestClass |  | 0 | 0 | 0 |  |
| MediaKeySystemPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| MemoryPressureSettings |  | 0 | 0 | 13 | A boxed type representing the settings for the memory pressure handler #WebKitMemoryPressureSettings is a boxed type that can be used to provide so... |
| MimeInfo |  | 0 | 0 | 5 | Information about a MIME type. |
| NavigationAction |  | 0 | 0 | 9 | Provides details about interaction resulting in a resource load. |
| NavigationPolicyDecisionClass |  | 0 | 0 | 0 |  |
| NavigationPolicyDecisionPrivate |  | 0 | 0 | 0 |  |
| NetworkProxySettings |  | 0 | 0 | 4 | Configures network proxies. WebKitNetworkProxySettings can be used to provide a custom proxy configuration to a #WebKitWebsiteDataManager. You need... |
| NotificationClass |  | 0 | 0 | 0 |  |
| NotificationPermissionRequestClass |  | 0 | 0 | 0 |  |
| NotificationPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| NotificationPrivate |  | 0 | 0 | 0 |  |
| OptionMenuClass |  | 0 | 0 | 0 |  |
| OptionMenuItem |  | 0 | 0 | 8 | One item of a #WebKitOptionMenu. The #WebKitOptionMenu is composed of WebKitOptionMenuItem<!-- -->s. A WebKitOptionMenuItem always has a label and ... |
| OptionMenuPrivate |  | 0 | 0 | 0 |  |
| PermissionRequestIface |  | 0 | 0 | 0 | a #WebKitPermissionRequest |
| PermissionStateQuery |  | 0 | 0 | 5 | This query represents a user's choice to allow or deny access to "powerful features" of the platform, as specified in the Permissions W3C Specifica... |
| PluginClass |  | 0 | 0 | 0 |  |
| PluginPrivate |  | 0 | 0 | 0 |  |
| PointerLockPermissionRequestClass |  | 0 | 0 | 0 |  |
| PointerLockPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| PolicyDecisionClass |  | 0 | 0 | 0 |  |
| PolicyDecisionPrivate |  | 0 | 0 | 0 |  |
| PrintCustomWidgetClass |  | 0 | 0 | 0 |  |
| PrintCustomWidgetPrivate |  | 0 | 0 | 0 |  |
| PrintOperationClass |  | 0 | 0 | 0 |  |
| PrintOperationPrivate |  | 0 | 0 | 0 |  |
| ResponsePolicyDecisionClass |  | 0 | 0 | 0 |  |
| ResponsePolicyDecisionPrivate |  | 0 | 0 | 0 |  |
| ScriptDialog |  | 0 | 0 | 8 | Carries details to be shown in user-facing dialogs. |
| ScriptMessageReply |  | 0 | 0 | 4 | A reply for a script message received. If no reply has been sent by the user, an automatically generated reply with undefined value with be sent. |
| SecurityManagerClass |  | 0 | 0 | 0 |  |
| SecurityManagerPrivate |  | 0 | 0 | 0 |  |
| SecurityOrigin |  | 0 | 0 | 9 | A security boundary for websites. #WebKitSecurityOrigin is a representation of a security domain defined by websites. A security origin consists of... |
| SettingsClass |  | 0 | 0 | 0 |  |
| SettingsPrivate |  | 0 | 0 | 0 |  |
| URIRequestClass |  | 0 | 0 | 0 |  |
| URIRequestPrivate |  | 0 | 0 | 0 |  |
| URIResponseClass |  | 0 | 0 | 0 |  |
| URIResponsePrivate |  | 0 | 0 | 0 |  |
| URISchemeRequestClass |  | 0 | 0 | 0 |  |
| URISchemeRequestPrivate |  | 0 | 0 | 0 |  |
| URISchemeResponseClass |  | 0 | 0 | 0 |  |
| URISchemeResponsePrivate |  | 0 | 0 | 0 |  |
| UserContentFilter |  | 0 | 0 | 3 | A compiled set of rules which applied to resource loads. |
| UserContentFilterStoreClass |  | 0 | 0 | 0 |  |
| UserContentFilterStorePrivate |  | 0 | 0 | 0 |  |
| UserContentManagerClass |  | 0 | 0 | 0 |  |
| UserContentManagerPrivate |  | 0 | 0 | 0 |  |
| UserMediaPermissionRequestClass |  | 0 | 0 | 0 |  |
| UserMediaPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| UserMessageClass |  | 0 | 0 | 0 |  |
| UserMessagePrivate |  | 0 | 0 | 0 |  |
| UserScript |  | 0 | 0 | 4 | A JavaScript snippet which can be injected in loaded pages. |
| UserStyleSheet |  | 0 | 0 | 4 | A CSS style sheet which can be injected in loaded pages. |
| WebContextClass |  | 0 | 0 | 0 |  |
| WebContextPrivate |  | 0 | 0 | 0 |  |
| WebInspectorClass |  | 0 | 0 | 0 |  |
| WebInspectorPrivate |  | 0 | 0 | 0 |  |
| WebResourceClass |  | 0 | 0 | 0 |  |
| WebResourcePrivate |  | 0 | 0 | 0 |  |
| WebsiteData |  | 0 | 0 | 5 | Data stored locally by a web site. WebKitWebsiteData represents data stored in the client by a particular website. A website is normally a set of U... |
| WebsiteDataAccessPermissionRequestClass |  | 0 | 0 | 0 |  |
| WebsiteDataAccessPermissionRequestPrivate |  | 0 | 0 | 0 |  |
| WebsiteDataManagerClass |  | 0 | 0 | 0 |  |
| WebsiteDataManagerPrivate |  | 0 | 0 | 0 |  |
| WebsitePoliciesClass |  | 0 | 0 | 0 |  |
| WebsitePoliciesPrivate |  | 0 | 0 | 0 |  |
| WebViewBaseClass |  | 0 | 0 | 0 |  |
| WebViewBasePrivate |  | 0 | 0 | 0 |  |
| WebViewClass |  | 0 | 0 | 0 |  |
| WebViewPrivate |  | 0 | 0 | 0 |  |
| WebViewSessionState |  | 0 | 0 | 4 | Handles serialization of a web view's browsing state. |
| WindowPropertiesClass |  | 0 | 0 | 0 |  |
| WindowPropertiesPrivate |  | 0 | 0 | 0 |  |
| XRPermissionRequestClass |  | 0 | 0 | 0 |  |
| XRPermissionRequestPrivate |  | 0 | 0 | 0 |  |

### WebKit2.ApplicationInfo

GType: `WebKitApplicationInfo` ?? C type: `WebKitApplicationInfo`

Information about an application running in automation mode.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ApplicationInfo.new() -> ApplicationInfo` | webkit_application_info_new | 2.18 | Creates a new #WebKitApplicationInfo |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `ApplicationInfo.get_name() -> utf8` | webkit_application_info_get_name | 2.18 | Get the name of the application. If webkit_application_info_set_name() hasn't been called with a valid name, this returns g_get_prgname(). |
| get_version | `ApplicationInfo.get_version(major: out guint64, minor: out guint64?, micro: out guint64?) -> none` | webkit_application_info_get_version | 2.18 | Get the application version previously set with webkit_application_info_set_version(). |
| ref | `ApplicationInfo.ref() -> ApplicationInfo` | webkit_application_info_ref | 2.18 | Atomically increments the reference count of @info by one. This function is MT-safe and may be called from any thread. |
| set_name | `ApplicationInfo.set_name(name: utf8) -> none` | webkit_application_info_set_name | 2.18 | Set the name of the application. If not provided, or %NULL is passed, g_get_prgname() will be used. |
| set_version | `ApplicationInfo.set_version(major: guint64, minor: guint64, micro: guint64) -> none` | webkit_application_info_set_version | 2.18 | Set the application version. If the application doesn't use the format major.minor.micro you can pass 0 as the micro to use major.minor, or pass 0 ... |
| unref | `ApplicationInfo.unref() -> none` | webkit_application_info_unref | 2.18 | Atomically decrements the reference count of @info by one. If the reference count drops to 0, all memory allocated by the #WebKitApplicationInfo is... |

### WebKit2.AuthenticationRequestClass

C type: `WebKitAuthenticationRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.AuthenticationRequestPrivate

C type: `WebKitAuthenticationRequestPrivate`

### WebKit2.AutomationSessionClass

C type: `WebKitAutomationSessionClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.AutomationSessionPrivate

C type: `WebKitAutomationSessionPrivate`

### WebKit2.BackForwardListClass

C type: `WebKitBackForwardListClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.BackForwardListItemClass

C type: `WebKitBackForwardListItemClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.InitiallyUnownedClass |

### WebKit2.BackForwardListItemPrivate

C type: `WebKitBackForwardListItemPrivate`

### WebKit2.BackForwardListPrivate

C type: `WebKitBackForwardListPrivate`

### WebKit2.ClipboardPermissionRequestClass

C type: `WebKitClipboardPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2.ClipboardPermissionRequestPrivate

C type: `WebKitClipboardPermissionRequestPrivate`

### WebKit2.ColorChooserRequestClass

C type: `WebKitColorChooserRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2.ColorChooserRequestPrivate

C type: `WebKitColorChooserRequestPrivate`

### WebKit2.ContextMenuClass

C type: `WebKitContextMenuClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.ContextMenuItemClass

C type: `WebKitContextMenuItemClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.InitiallyUnownedClass |

### WebKit2.ContextMenuItemPrivate

C type: `WebKitContextMenuItemPrivate`

### WebKit2.ContextMenuPrivate

C type: `WebKitContextMenuPrivate`

### WebKit2.CookieManagerClass

C type: `WebKitCookieManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.CookieManagerPrivate

C type: `WebKitCookieManagerPrivate`

### WebKit2.Credential

GType: `WebKitCredential` ?? C type: `WebKitCredential`

Groups information used for user authentication.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Credential.new(username: utf8, password: utf8, persistence: CredentialPersistence) -> Credential` | webkit_credential_new | 2.2 | Create a new credential from the provided username, password and persistence mode. |
| new_for_certificate | `Credential.new_for_certificate(certificate: Gio.TlsCertificate?, persistence: CredentialPersistence) -> Credential` | webkit_credential_new_for_certificate | 2.34 | Create a new credential from the @certificate and persistence mode. Note that %WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT is not supported for certifi... |
| new_for_certificate_pin | `Credential.new_for_certificate_pin(pin: utf8, persistence: CredentialPersistence) -> Credential` | webkit_credential_new_for_certificate_pin | 2.34 | Create a new credential from the provided PIN and persistence mode. Note that %WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT is not supported for certifi... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Credential.copy() -> Credential` | webkit_credential_copy | 2.2 | Make a copy of the #WebKitCredential. |
| free | `Credential.free() -> none` | webkit_credential_free | 2.2 | Free the #WebKitCredential. |
| get_certificate | `Credential.get_certificate() -> Gio.TlsCertificate` | webkit_credential_get_certificate | 2.34 | Get the certificate currently held by this #WebKitCredential. |
| get_password | `Credential.get_password() -> utf8` | webkit_credential_get_password | 2.2 | Get the password currently held by this #WebKitCredential. |
| get_persistence | `Credential.get_persistence() -> CredentialPersistence` | webkit_credential_get_persistence | 2.2 | Get the persistence mode currently held by this #WebKitCredential. |
| get_username | `Credential.get_username() -> utf8` | webkit_credential_get_username | 2.2 | Get the username currently held by this #WebKitCredential. |
| has_password | `Credential.has_password() -> gboolean` | webkit_credential_has_password | 2.2 | Determine whether this credential has a password stored. |

### WebKit2.DeviceInfoPermissionRequestClass

C type: `WebKitDeviceInfoPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.DeviceInfoPermissionRequestPrivate

C type: `WebKitDeviceInfoPermissionRequestPrivate`

### WebKit2.DownloadClass

C type: `WebKitDownloadClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| decide_destination | gboolean |
| parent_class | GObject.ObjectClass |

### WebKit2.DownloadPrivate

C type: `WebKitDownloadPrivate`

### WebKit2.EditorStateClass

C type: `WebKitEditorStateClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.EditorStatePrivate

C type: `WebKitEditorStatePrivate`

### WebKit2.FaviconDatabaseClass

C type: `WebKitFaviconDatabaseClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.FaviconDatabasePrivate

C type: `WebKitFaviconDatabasePrivate`

### WebKit2.Feature

GType: `WebKitFeature` ?? C type: `WebKitFeature`

Describes a web engine feature that may be toggled at runtime. The WebKit web engine includes a set of features which may be toggled programmatical...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_category | `Feature.get_category() -> utf8` | webkit_feature_get_category | 2.42 | Gets the category of the feature. Applications which include user interface to toggle features may want to use the category to group related featur... |
| get_default_value | `Feature.get_default_value() -> gboolean` | webkit_feature_get_default_value | 2.42 | Gets whether the feature is enabled by default. The default value may be used by applications which include user interface to toggle features to re... |
| get_details | `Feature.get_details() -> utf8` | webkit_feature_get_details | 2.42 | Gets a description for the @feature. The detailed description should be considered an additional clarification on the purpose of the feature, to be... |
| get_identifier | `Feature.get_identifier() -> utf8` | webkit_feature_get_identifier | 2.42 | Gets a string that uniquely identifies the @feature. |
| get_name | `Feature.get_name() -> utf8` | webkit_feature_get_name | 2.42 | Gets a short name for the @feature. The returned string is suitable to be displayed to end users, but it should not be relied upon being localized.... |
| get_status | `Feature.get_status() -> FeatureStatus` | webkit_feature_get_status | 2.42 | Gets the status of the feature. |
| ref | `Feature.ref() -> Feature` | webkit_feature_ref | 2.42 | Atomically acquires a reference on the given @feature. This function is MT-safe and may be called from any thread. |
| unref | `Feature.unref() -> none` | webkit_feature_unref | 2.42 | Atomically releases a reference on the given @feature. If the reference was the last, the resources associated to the @feature are freed. This func... |

### WebKit2.FeatureList

GType: `WebKitFeatureList` ?? C type: `WebKitFeatureList`

Contains a set of toggle-able web engine features. The list supports passing around a set of [struct@Feature] objects and iterating over them: ```c...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `FeatureList.get(index: gsize) -> Feature` | webkit_feature_list_get | 2.42 | Gets a feature given its index. |
| get_length | `FeatureList.get_length() -> gsize` | webkit_feature_list_get_length |  | Gets the number of elements in the feature list. |
| ref | `FeatureList.ref() -> FeatureList` | webkit_feature_list_ref | 2.42 | Atomically acquires a reference on the given @feature_list. This function is MT-safe and may be called from any thread. |
| unref | `FeatureList.unref() -> none` | webkit_feature_list_unref | 2.42 | Atomically releases a reference on the given @feature_list. If the reference was the last, the resources associated to the @feature_list are freed.... |

### WebKit2.FileChooserRequestClass

C type: `WebKitFileChooserRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.FileChooserRequestPrivate

C type: `WebKitFileChooserRequestPrivate`

### WebKit2.FindControllerClass

C type: `WebKitFindControllerClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.FindControllerPrivate

C type: `WebKitFindControllerPrivate`

### WebKit2.FormSubmissionRequestClass

C type: `WebKitFormSubmissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.FormSubmissionRequestPrivate

C type: `WebKitFormSubmissionRequestPrivate`

### WebKit2.GeolocationManagerClass

C type: `WebKitGeolocationManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.GeolocationManagerPrivate

C type: `WebKitGeolocationManagerPrivate`

### WebKit2.GeolocationPermissionRequestClass

C type: `WebKitGeolocationPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.GeolocationPermissionRequestPrivate

C type: `WebKitGeolocationPermissionRequestPrivate`

### WebKit2.GeolocationPosition

GType: `WebKitGeolocationPosition` ?? C type: `WebKitGeolocationPosition`

An opaque struct to provide position updates to a #WebKitGeolocationManager. WebKitGeolocationPosition is an opaque struct used to provide position...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `GeolocationPosition.new(latitude: gdouble, longitude: gdouble, accuracy: gdouble) -> GeolocationPosition` | webkit_geolocation_position_new | 2.26 | Create a new #WebKitGeolocationPosition. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `GeolocationPosition.copy() -> GeolocationPosition` | webkit_geolocation_position_copy | 2.26 | Make a copy of the #WebKitGeolocationPosition. |
| free | `GeolocationPosition.free() -> none` | webkit_geolocation_position_free | 2.26 | Free the #WebKitGeolocationPosition |
| set_altitude | `GeolocationPosition.set_altitude(altitude: gdouble) -> none` | webkit_geolocation_position_set_altitude | 2.26 | Set the @position altitude. |
| set_altitude_accuracy | `GeolocationPosition.set_altitude_accuracy(altitude_accuracy: gdouble) -> none` | webkit_geolocation_position_set_altitude_accuracy | 2.26 | Set the accuracy of @position altitude. |
| set_heading | `GeolocationPosition.set_heading(heading: gdouble) -> none` | webkit_geolocation_position_set_heading | 2.26 | Set the @position heading. Set the @position heading, as a positive angle between the direction of movement and the North direction, in clockwise d... |
| set_speed | `GeolocationPosition.set_speed(speed: gdouble) -> none` | webkit_geolocation_position_set_speed | 2.26 | Set the @position speed. |
| set_timestamp | `GeolocationPosition.set_timestamp(timestamp: guint64) -> none` | webkit_geolocation_position_set_timestamp | 2.26 | Set the @position timestamp. By default it's the time when the @position was created. |

### WebKit2.HitTestResultClass

C type: `WebKitHitTestResultClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.HitTestResultPrivate

C type: `WebKitHitTestResultPrivate`

### WebKit2.InputMethodContextClass

C type: `WebKitInputMethodContextClass`

Called via webkit_input_method_context_set_enable_preedit() to control the use of the preedit string.

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| _webkit_reserved4 | none |
| _webkit_reserved5 | none |
| _webkit_reserved6 | none |
| _webkit_reserved7 | none |
| committed | none |
| delete_surrounding | none |
| filter_key_event | gboolean |
| get_preedit | none |
| notify_cursor_area | none |
| notify_focus_in | none |
| notify_focus_out | none |
| notify_surrounding | none |
| parent_class | GObject.ObjectClass |
| preedit_changed | none |
| preedit_finished | none |
| preedit_started | none |
| reset | none |
| set_enable_preedit | none |

### WebKit2.InputMethodContextPrivate

C type: `WebKitInputMethodContextPrivate`

### WebKit2.InputMethodUnderline

GType: `WebKitInputMethodUnderline` ?? C type: `WebKitInputMethodUnderline`

Range of text in an preedit string to be shown underlined.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InputMethodUnderline.new(start_offset: guint, end_offset: guint) -> InputMethodUnderline` | webkit_input_method_underline_new | 2.28 | Create a new #WebKitInputMethodUnderline for the given range in preedit string |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `InputMethodUnderline.copy() -> InputMethodUnderline` | webkit_input_method_underline_copy | 2.28 | Make a copy of the #WebKitInputMethodUnderline. |
| free | `InputMethodUnderline.free() -> none` | webkit_input_method_underline_free | 2.28 | Free the #WebKitInputMethodUnderline. |
| set_color | `InputMethodUnderline.set_color(rgba: Gdk.RGBA?) -> none` | webkit_input_method_underline_set_color | 2.28 | Set the color of the underline. If @rgba is %NULL the foreground text color will be used for the underline too. |

### WebKit2.InstallMissingMediaPluginsPermissionRequestClass

C type: `WebKitInstallMissingMediaPluginsPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.InstallMissingMediaPluginsPermissionRequestPrivate

C type: `WebKitInstallMissingMediaPluginsPermissionRequestPrivate`

### WebKit2.ITPFirstParty

GType: `WebKitITPFirstParty` ?? C type: `WebKitITPFirstParty`

Describes a first party origin.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_domain | `ITPFirstParty.get_domain() -> utf8` | webkit_itp_first_party_get_domain | 2.30 | Get the domain name of @itp_first_party. |
| get_last_update_time | `ITPFirstParty.get_last_update_time() -> GLib.DateTime` | webkit_itp_first_party_get_last_update_time | 2.30 | Get the last time a #WebKitITPThirdParty has been seen under @itp_first_party. Each @WebKitITPFirstParty is created by webkit_itp_third_party_get_f... |
| get_website_data_access_allowed | `ITPFirstParty.get_website_data_access_allowed() -> gboolean` | webkit_itp_first_party_get_website_data_access_allowed | 2.30 | Get whether @itp_first_party has granted website data access to its #WebKitITPThirdParty. Each @WebKitITPFirstParty is created by webkit_itp_third_... |
| ref | `ITPFirstParty.ref() -> ITPFirstParty` | webkit_itp_first_party_ref | 2.30 | Atomically increments the reference count of @itp_first_party by one. This function is MT-safe and may be called from any thread. |
| unref | `ITPFirstParty.unref() -> none` | webkit_itp_first_party_unref | 2.30 | Atomically decrements the reference count of @itp_first_party by one. If the reference count drops to 0, all memory allocated by #WebKitITPFirstPar... |

### WebKit2.ITPThirdParty

GType: `WebKitITPThirdParty` ?? C type: `WebKitITPThirdParty`

Describes a third party origin.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_domain | `ITPThirdParty.get_domain() -> utf8` | webkit_itp_third_party_get_domain | 2.30 | Get the domain name of @itp_third_party. |
| get_first_parties | `ITPThirdParty.get_first_parties() -> GLib.List` | webkit_itp_third_party_get_first_parties | 2.30 | Get the list of #WebKitITPFirstParty under which @itp_third_party has been seen. |
| ref | `ITPThirdParty.ref() -> ITPThirdParty` | webkit_itp_third_party_ref | 2.30 | Atomically increments the reference count of @itp_third_party by one. This function is MT-safe and may be called from any thread. |
| unref | `ITPThirdParty.unref() -> none` | webkit_itp_third_party_unref | 2.30 | Atomically decrements the reference count of @itp_third_party by one. If the reference count drops to 0, all memory allocated by #WebKitITPThirdPar... |

### WebKit2.JavascriptResult

GType: `WebKitJavascriptResult` ?? C type: `WebKitJavascriptResult`

Result of JavaScript evaluation in a web view.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_global_context | `JavascriptResult.get_global_context() -> JSGlobalContextRef` | webkit_javascript_result_get_global_context |  | Get the global Javascript context. Get the global Javascript context that should be used with the <function>JSValueRef</function> returned by webki... |
| get_js_value | `JavascriptResult.get_js_value() -> JavaScriptCore.Value` | webkit_javascript_result_get_js_value | 2.22 | Get the #JSCValue of @js_result. |
| get_value | `JavascriptResult.get_value() -> JSValueRef` | webkit_javascript_result_get_value |  | Get the value of @js_result. You should use the <function>JSGlobalContextRef</function> returned by webkit_javascript_result_get_global_context() t... |
| ref | `JavascriptResult.ref() -> JavascriptResult` | webkit_javascript_result_ref |  | Atomically increments the reference count of @js_result by one. This function is MT-safe and may be called from any thread. |
| unref | `JavascriptResult.unref() -> none` | webkit_javascript_result_unref |  | Atomically decrements the reference count of @js_result by one. If the reference count drops to 0, all memory allocated by the #WebKitJavascriptRes... |

### WebKit2.MediaKeySystemPermissionRequestClass

C type: `WebKitMediaKeySystemPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.MediaKeySystemPermissionRequestPrivate

C type: `WebKitMediaKeySystemPermissionRequestPrivate`

### WebKit2.MemoryPressureSettings

GType: `WebKitMemoryPressureSettings` ?? C type: `WebKitMemoryPressureSettings`

A boxed type representing the settings for the memory pressure handler #WebKitMemoryPressureSettings is a boxed type that can be used to provide so...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MemoryPressureSettings.new() -> MemoryPressureSettings` | webkit_memory_pressure_settings_new | 2.34 | Create a new #WebKitMemoryPressureSettings with the default values. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `MemoryPressureSettings.copy() -> MemoryPressureSettings` | webkit_memory_pressure_settings_copy | 2.34 | Make a copy of @settings. |
| free | `MemoryPressureSettings.free() -> none` | webkit_memory_pressure_settings_free | 2.34 | Free the #WebKitMemoryPressureSettings. |
| get_conservative_threshold | `MemoryPressureSettings.get_conservative_threshold() -> gdouble` | webkit_memory_pressure_settings_get_conservative_threshold | 2.34 | Gets the conservative memory usage threshold. |
| get_kill_threshold | `MemoryPressureSettings.get_kill_threshold() -> gdouble` | webkit_memory_pressure_settings_get_kill_threshold | 2.34 | Gets the kill memory usage threshold. |
| get_memory_limit | `MemoryPressureSettings.get_memory_limit() -> guint` | webkit_memory_pressure_settings_get_memory_limit | 2.34 | Gets the memory usage limit. |
| get_poll_interval | `MemoryPressureSettings.get_poll_interval() -> gdouble` | webkit_memory_pressure_settings_get_poll_interval | 2.34 | Gets the interval at which memory usage is checked. |
| get_strict_threshold | `MemoryPressureSettings.get_strict_threshold() -> gdouble` | webkit_memory_pressure_settings_get_strict_threshold | 2.34 | Gets the strict memory usage threshold. |
| set_conservative_threshold | `MemoryPressureSettings.set_conservative_threshold(value: gdouble) -> none` | webkit_memory_pressure_settings_set_conservative_threshold | 2.34 | Sets the memory limit for the conservative policy to start working. Sets @value as the fraction of the defined memory limit where the conservative ... |
| set_kill_threshold | `MemoryPressureSettings.set_kill_threshold(value: gdouble) -> none` | webkit_memory_pressure_settings_set_kill_threshold | 2.34 | Sets @value as the fraction of the defined memory limit where the process will be killed. The threshold must be a value bigger or equal to 0. A val... |
| set_memory_limit | `MemoryPressureSettings.set_memory_limit(memory_limit: guint) -> none` | webkit_memory_pressure_settings_set_memory_limit | 2.34 | Sets @memory_limit the memory limit value to @settings. The default value is the system's RAM size with a maximum of 3GB. |
| set_poll_interval | `MemoryPressureSettings.set_poll_interval(value: gdouble) -> none` | webkit_memory_pressure_settings_set_poll_interval | 2.34 | Sets @value as the poll interval used by @settings. The poll interval value must be bigger than 0. The default value is 30 seconds. |
| set_strict_threshold | `MemoryPressureSettings.set_strict_threshold(value: gdouble) -> none` | webkit_memory_pressure_settings_set_strict_threshold | 2.34 | Sets the memory limit for the strict policy to start working. Sets @value as the fraction of the defined memory limit where the strict policy start... |

### WebKit2.MimeInfo

GType: `WebKitMimeInfo` ?? C type: `WebKitMimeInfo`

Information about a MIME type.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_description | `MimeInfo.get_description() -> utf8` | webkit_mime_info_get_description |  | Gets the description of the MIME type. |
| get_extensions | `MimeInfo.get_extensions() -> utf8` | webkit_mime_info_get_extensions |  | Get the list of file extensions associated to the MIME type. |
| get_mime_type | `MimeInfo.get_mime_type() -> utf8` | webkit_mime_info_get_mime_type |  | Gets the MIME type. |
| ref | `MimeInfo.ref() -> MimeInfo` | webkit_mime_info_ref |  | Atomically increments the reference count of @info by one. This function is MT-safe and may be called from any thread. |
| unref | `MimeInfo.unref() -> none` | webkit_mime_info_unref |  | Atomically decrements the reference count of @info by one. If the reference count drops to 0, all memory allocated by the #WebKitMimeInfo is releas... |

### WebKit2.NavigationAction

GType: `WebKitNavigationAction` ?? C type: `WebKitNavigationAction`

Provides details about interaction resulting in a resource load.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `NavigationAction.copy() -> NavigationAction` | webkit_navigation_action_copy | 2.6 | Make a copy of @navigation. |
| free | `NavigationAction.free() -> none` | webkit_navigation_action_free | 2.6 | Free the #WebKitNavigationAction |
| get_frame_name | `NavigationAction.get_frame_name() -> utf8` | webkit_navigation_action_get_frame_name | 2.40 | Gets the @navigation target frame name. For example if navigation was triggered by clicking a link with a target attribute equal to "_blank", this ... |
| get_modifiers | `NavigationAction.get_modifiers() -> guint` | webkit_navigation_action_get_modifiers | 2.6 | Return the modifier keys. Return a bitmask of #GdkModifierType values describing the modifier keys that were in effect when the navigation was requ... |
| get_mouse_button | `NavigationAction.get_mouse_button() -> guint` | webkit_navigation_action_get_mouse_button | 2.6 | Return the number of the mouse button that triggered the navigation. Return the number of the mouse button that triggered the navigation, or 0 if t... |
| get_navigation_type | `NavigationAction.get_navigation_type() -> NavigationType` | webkit_navigation_action_get_navigation_type | 2.6 | Return the type of action that triggered the navigation. |
| get_request | `NavigationAction.get_request() -> URIRequest` | webkit_navigation_action_get_request | 2.6 | Return the #WebKitURIRequest associated with the navigation action. Modifications to the returned object are <emphasis>not</emphasis> taken into ac... |
| is_redirect | `NavigationAction.is_redirect() -> gboolean` | webkit_navigation_action_is_redirect | 2.20 | Returns whether the @navigation was redirected. |
| is_user_gesture | `NavigationAction.is_user_gesture() -> gboolean` | webkit_navigation_action_is_user_gesture | 2.6 | Return whether the navigation was triggered by a user gesture like a mouse click. |

### WebKit2.NavigationPolicyDecisionClass

C type: `WebKitNavigationPolicyDecisionClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | PolicyDecisionClass |

### WebKit2.NavigationPolicyDecisionPrivate

C type: `WebKitNavigationPolicyDecisionPrivate`

### WebKit2.NetworkProxySettings

GType: `WebKitNetworkProxySettings` ?? C type: `WebKitNetworkProxySettings`

Configures network proxies. WebKitNetworkProxySettings can be used to provide a custom proxy configuration to a #WebKitWebsiteDataManager. You need...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NetworkProxySettings.new(default_proxy_uri: utf8?, ignore_hosts: utf8?) -> NetworkProxySettings` | webkit_network_proxy_settings_new | 2.16 | Create a new #WebKitNetworkProxySettings with the given @default_proxy_uri and @ignore_hosts. The default proxy URI will be used for any URI that d... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_proxy_for_scheme | `NetworkProxySettings.add_proxy_for_scheme(scheme: utf8, proxy_uri: utf8) -> none` | webkit_network_proxy_settings_add_proxy_for_scheme | 2.16 | Adds a URI-scheme-specific proxy. URIs whose scheme matches @uri_scheme will be proxied via @proxy_uri. As with the default proxy URI, if @proxy_ur... |
| copy | `NetworkProxySettings.copy() -> NetworkProxySettings` | webkit_network_proxy_settings_copy | 2.16 | Make a copy of the #WebKitNetworkProxySettings. |
| free | `NetworkProxySettings.free() -> none` | webkit_network_proxy_settings_free | 2.16 | Free the #WebKitNetworkProxySettings. |

### WebKit2.NotificationClass

C type: `WebKitNotificationClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| _webkit_reserved4 | none |
| _webkit_reserved5 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.NotificationPermissionRequestClass

C type: `WebKitNotificationPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2.NotificationPermissionRequestPrivate

C type: `WebKitNotificationPermissionRequestPrivate`

### WebKit2.NotificationPrivate

C type: `WebKitNotificationPrivate`

### WebKit2.OptionMenuClass

C type: `WebKitOptionMenuClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.OptionMenuItem

GType: `WebKitOptionMenuItem` ?? C type: `WebKitOptionMenuItem`

One item of a #WebKitOptionMenu. The #WebKitOptionMenu is composed of WebKitOptionMenuItem<!-- -->s. A WebKitOptionMenuItem always has a label and ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `OptionMenuItem.copy() -> OptionMenuItem` | webkit_option_menu_item_copy | 2.18 | Make a copy of the #WebKitOptionMenuItem. |
| free | `OptionMenuItem.free() -> none` | webkit_option_menu_item_free | 2.18 | Free the #WebKitOptionMenuItem. |
| get_label | `OptionMenuItem.get_label() -> utf8` | webkit_option_menu_item_get_label | 2.18 | Get the label of a #WebKitOptionMenuItem. |
| get_tooltip | `OptionMenuItem.get_tooltip() -> utf8` | webkit_option_menu_item_get_tooltip | 2.18 | Get the tooltip of a #WebKitOptionMenuItem. |
| is_enabled | `OptionMenuItem.is_enabled() -> gboolean` | webkit_option_menu_item_is_enabled | 2.18 | Whether a #WebKitOptionMenuItem is enabled. |
| is_group_child | `OptionMenuItem.is_group_child() -> gboolean` | webkit_option_menu_item_is_group_child | 2.18 | Whether a #WebKitOptionMenuItem is a group child. |
| is_group_label | `OptionMenuItem.is_group_label() -> gboolean` | webkit_option_menu_item_is_group_label | 2.18 | Whether a #WebKitOptionMenuItem is a group label. |
| is_selected | `OptionMenuItem.is_selected() -> gboolean` | webkit_option_menu_item_is_selected | 2.18 | Whether a #WebKitOptionMenuItem is the currently selected one. |

### WebKit2.OptionMenuPrivate

C type: `WebKitOptionMenuPrivate`

### WebKit2.PermissionRequestIface

C type: `WebKitPermissionRequestIface`

a #WebKitPermissionRequest

#### Fields

| Field | Type |
| --- | --- |
| allow | none |
| deny | none |
| parent_interface | GObject.TypeInterface |

### WebKit2.PermissionStateQuery

GType: `WebKitPermissionStateQuery` ?? C type: `WebKitPermissionStateQuery`

This query represents a user's choice to allow or deny access to "powerful features" of the platform, as specified in the Permissions W3C Specifica...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| finish | `PermissionStateQuery.finish(state: PermissionState) -> none` | webkit_permission_state_query_finish | 2.40 | Notify the web-engine of the selected permission state for the given query. This function should only be called as a response to the `WebKitWebView... |
| get_name | `PermissionStateQuery.get_name() -> utf8` | webkit_permission_state_query_get_name | 2.40 | Get the permission name for which access is being queried. |
| get_security_origin | `PermissionStateQuery.get_security_origin() -> SecurityOrigin` | webkit_permission_state_query_get_security_origin | 2.40 | Get the permission origin for which access is being queried. |
| ref | `PermissionStateQuery.ref() -> PermissionStateQuery` | webkit_permission_state_query_ref | 2.40 | Atomically increments the reference count of @query by one. This function is MT-safe and may be called from any thread. |
| unref | `PermissionStateQuery.unref() -> none` | webkit_permission_state_query_unref | 2.40 | Atomically decrements the reference count of @query by one. If the reference count drops to 0, all memory allocated by #WebKitPermissionStateQuery ... |

### WebKit2.PluginClass

C type: `WebKitPluginClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.PluginPrivate

C type: `WebKitPluginPrivate`

### WebKit2.PointerLockPermissionRequestClass

C type: `WebKitPointerLockPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.PointerLockPermissionRequestPrivate

C type: `WebKitPointerLockPermissionRequestPrivate`

### WebKit2.PolicyDecisionClass

C type: `WebKitPolicyDecisionClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.PolicyDecisionPrivate

C type: `WebKitPolicyDecisionPrivate`

### WebKit2.PrintCustomWidgetClass

C type: `WebKitPrintCustomWidgetClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| apply | none |
| parent_class | GObject.ObjectClass |
| update | none |

### WebKit2.PrintCustomWidgetPrivate

C type: `WebKitPrintCustomWidgetPrivate`

### WebKit2.PrintOperationClass

C type: `WebKitPrintOperationClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.PrintOperationPrivate

C type: `WebKitPrintOperationPrivate`

### WebKit2.ResponsePolicyDecisionClass

C type: `WebKitResponsePolicyDecisionClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | PolicyDecisionClass |

### WebKit2.ResponsePolicyDecisionPrivate

C type: `WebKitResponsePolicyDecisionPrivate`

### WebKit2.ScriptDialog

GType: `WebKitScriptDialog` ?? C type: `WebKitScriptDialog`

Carries details to be shown in user-facing dialogs.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `ScriptDialog.close() -> none` | webkit_script_dialog_close | 2.24 | Close @dialog. When handling a #WebKitScriptDialog asynchronously (webkit_script_dialog_ref() was called in #WebKitWebView::script-dialog callback)... |
| confirm_set_confirmed | `ScriptDialog.confirm_set_confirmed(confirmed: gboolean) -> none` | webkit_script_dialog_confirm_set_confirmed |  | Set whether the user confirmed the dialog. This method is used for %WEBKIT_SCRIPT_DIALOG_CONFIRM and %WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM di... |
| get_dialog_type | `ScriptDialog.get_dialog_type() -> ScriptDialogType` | webkit_script_dialog_get_dialog_type |  | Get the dialog type of a #WebKitScriptDialog. |
| get_message | `ScriptDialog.get_message() -> utf8` | webkit_script_dialog_get_message |  | Get the message of a #WebKitScriptDialog. |
| prompt_get_default_text | `ScriptDialog.prompt_get_default_text() -> utf8` | webkit_script_dialog_prompt_get_default_text |  | Get the default text of a #WebKitScriptDialog of type %WEBKIT_SCRIPT_DIALOG_PROMPT. It's an error to use this method with a #WebKitScriptDialog tha... |
| prompt_set_text | `ScriptDialog.prompt_set_text(text: utf8) -> none` | webkit_script_dialog_prompt_set_text |  | Set the text entered by the user in the dialog. This method is used for %WEBKIT_SCRIPT_DIALOG_PROMPT dialogs when #WebKitWebView::script-dialog sig... |
| ref | `ScriptDialog.ref() -> ScriptDialog` | webkit_script_dialog_ref | 2.24 | Atomically increments the reference count of @dialog by one. This function is MT-safe and may be called from any thread. |
| unref | `ScriptDialog.unref() -> none` | webkit_script_dialog_unref | 2.24 | Atomically decrements the reference count of @dialog by one. If the reference count drops to 0, all memory allocated by the #WebKitScriptdialog is ... |

### WebKit2.ScriptMessageReply

GType: `WebKitScriptMessageReply` ?? C type: `WebKitScriptMessageReply`

A reply for a script message received. If no reply has been sent by the user, an automatically generated reply with undefined value with be sent.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `ScriptMessageReply.ref() -> ScriptMessageReply` | webkit_script_message_reply_ref | 2.40 | Atomically increments the reference count of @script_message_reply by one. |
| return_error_message | `ScriptMessageReply.return_error_message(error_message: utf8) -> none` | webkit_script_message_reply_return_error_message | 2.40 | Reply to a script message with an error message. |
| return_value | `ScriptMessageReply.return_value(reply_value: JavaScriptCore.Value) -> none` | webkit_script_message_reply_return_value | 2.40 | Reply to a script message with a value. This function can be called twice for passing the reply value in. |
| unref | `ScriptMessageReply.unref() -> none` | webkit_script_message_reply_unref | 2.40 | Atomically decrements the reference count of @script_message_reply by one. If the reference count drops to 0, all the memory allocated by the #WebK... |

### WebKit2.SecurityManagerClass

C type: `WebKitSecurityManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.SecurityManagerPrivate

C type: `WebKitSecurityManagerPrivate`

### WebKit2.SecurityOrigin

GType: `WebKitSecurityOrigin` ?? C type: `WebKitSecurityOrigin`

A security boundary for websites. #WebKitSecurityOrigin is a representation of a security domain defined by websites. A security origin consists of...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SecurityOrigin.new(protocol: utf8, host: utf8, port: guint16) -> SecurityOrigin` | webkit_security_origin_new | 2.16 | Create a new security origin from the provided protocol, host and port. |
| new_for_uri | `SecurityOrigin.new_for_uri(uri: utf8) -> SecurityOrigin` | webkit_security_origin_new_for_uri | 2.16 | Create a new security origin from the provided. Create a new security origin from the provided URI. Components of @uri other than protocol, host, a... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_host | `SecurityOrigin.get_host() -> utf8` | webkit_security_origin_get_host | 2.16 | Gets the hostname of @origin. It is reasonable for this to be %NULL if its protocol does not require a host component. |
| get_port | `SecurityOrigin.get_port() -> guint16` | webkit_security_origin_get_port | 2.16 | Gets the port of @origin. This function will always return 0 if the port is the default port for the given protocol. For example, http://example.co... |
| get_protocol | `SecurityOrigin.get_protocol() -> utf8` | webkit_security_origin_get_protocol | 2.16 | Gets the protocol of @origin. |
| is_opaque | `SecurityOrigin.is_opaque() -> gboolean` | webkit_security_origin_is_opaque | 2.16 | This function returns %FALSE. This function returns %FALSE. #WebKitSecurityOrigin is now a simple wrapper around a <protocol, host, port> triplet, ... |
| ref | `SecurityOrigin.ref() -> SecurityOrigin` | webkit_security_origin_ref | 2.16 | Atomically increments the reference count of @origin by one. This function is MT-safe and may be called from any thread. |
| to_string | `SecurityOrigin.to_string() -> utf8` | webkit_security_origin_to_string | 2.16 | Gets a string representation of @origin. The string representation is a valid URI with only protocol, host, and port components, or %NULL. |
| unref | `SecurityOrigin.unref() -> none` | webkit_security_origin_unref | 2.16 | Atomically decrements the reference count of @origin by one. If the reference count drops to 0, all memory allocated by #WebKitSecurityOrigin is re... |

### WebKit2.SettingsClass

C type: `WebKitSettingsClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.SettingsPrivate

C type: `WebKitSettingsPrivate`

### WebKit2.URIRequestClass

C type: `WebKitURIRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.URIRequestPrivate

C type: `WebKitURIRequestPrivate`

### WebKit2.URIResponseClass

C type: `WebKitURIResponseClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.URIResponsePrivate

C type: `WebKitURIResponsePrivate`

### WebKit2.URISchemeRequestClass

C type: `WebKitURISchemeRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.URISchemeRequestPrivate

C type: `WebKitURISchemeRequestPrivate`

### WebKit2.URISchemeResponseClass

C type: `WebKitURISchemeResponseClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.URISchemeResponsePrivate

C type: `WebKitURISchemeResponsePrivate`

### WebKit2.UserContentFilter

GType: `WebKitUserContentFilter` ?? C type: `WebKitUserContentFilter`

A compiled set of rules which applied to resource loads.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_identifier | `UserContentFilter.get_identifier() -> utf8` | webkit_user_content_filter_get_identifier | 2.24 | Obtain the identifier previously used to save the @user_content_filter. Obtain the identifier previously used to save the @user_content_filter in t... |
| ref | `UserContentFilter.ref() -> UserContentFilter` | webkit_user_content_filter_ref | 2.24 | Atomically increments the reference count of @user_content_filter by one. This function is MT-safe and may be called from any thread. |
| unref | `UserContentFilter.unref() -> none` | webkit_user_content_filter_unref | 2.24 | Atomically decrements the reference count of @user_content_filter by one. If the reference count drops to 0, all the memory allocated by the #WebKi... |

### WebKit2.UserContentFilterStoreClass

C type: `WebKitUserContentFilterStoreClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.UserContentFilterStorePrivate

C type: `WebKitUserContentFilterStorePrivate`

### WebKit2.UserContentManagerClass

C type: `WebKitUserContentManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.UserContentManagerPrivate

C type: `WebKitUserContentManagerPrivate`

### WebKit2.UserMediaPermissionRequestClass

C type: `WebKitUserMediaPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.UserMediaPermissionRequestPrivate

C type: `WebKitUserMediaPermissionRequestPrivate`

### WebKit2.UserMessageClass

C type: `WebKitUserMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.InitiallyUnownedClass |

### WebKit2.UserMessagePrivate

C type: `WebKitUserMessagePrivate`

### WebKit2.UserScript

GType: `WebKitUserScript` ?? C type: `WebKitUserScript`

A JavaScript snippet which can be injected in loaded pages.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UserScript.new(source: utf8, injected_frames: UserContentInjectedFrames, injection_time: UserScriptInjectionTime, allow_list: utf8?, block_list: utf8?) -> UserScript` | webkit_user_script_new | 2.6 | Creates a new user script. Scripts can be applied to some URIs only by passing non-null values for @allow_list or @block_list. Passing a %NULL allo... |
| new_for_world | `UserScript.new_for_world(source: utf8, injected_frames: UserContentInjectedFrames, injection_time: UserScriptInjectionTime, world_name: utf8, allow_list: utf8?, block_list: utf8?) -> UserScript` | webkit_user_script_new_for_world | 2.22 | Creates a new user script for script world with name @world_name. See webkit_user_script_new() for a full description. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `UserScript.ref() -> UserScript` | webkit_user_script_ref | 2.6 | Atomically increments the reference count of @user_script by one. This function is MT-safe and may be called from any thread. |
| unref | `UserScript.unref() -> none` | webkit_user_script_unref | 2.6 | Atomically decrements the reference count of @user_script by one. If the reference count drops to 0, all memory allocated by #WebKitUserScript is r... |

### WebKit2.UserStyleSheet

GType: `WebKitUserStyleSheet` ?? C type: `WebKitUserStyleSheet`

A CSS style sheet which can be injected in loaded pages.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UserStyleSheet.new(source: utf8, injected_frames: UserContentInjectedFrames, level: UserStyleLevel, allow_list: utf8?, block_list: utf8?) -> UserStyleSheet` | webkit_user_style_sheet_new | 2.6 | Creates a new user style sheet. Style sheets can be applied to some URIs only by passing non-null values for @allow_list or @block_list. Passing a ... |
| new_for_world | `UserStyleSheet.new_for_world(source: utf8, injected_frames: UserContentInjectedFrames, level: UserStyleLevel, world_name: utf8, allow_list: utf8?, block_list: utf8?) -> UserStyleSheet` | webkit_user_style_sheet_new_for_world | 2.22 | Creates a new user style sheet for script world. Creates a new user style sheet for script world with name @world_name. See webkit_user_style_sheet... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `UserStyleSheet.ref() -> UserStyleSheet` | webkit_user_style_sheet_ref | 2.6 | Atomically increments the reference count of @user_style_sheet by one. This function is MT-safe and may be called from any thread. |
| unref | `UserStyleSheet.unref() -> none` | webkit_user_style_sheet_unref | 2.6 | Atomically decrements the reference count of @user_style_sheet by one. If the reference count drops to 0, all memory allocated by #WebKitUserStyleS... |

### WebKit2.WebContextClass

C type: `WebKitWebContextClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| automation_started | none |
| download_started | none |
| initialize_notification_permissions | none |
| initialize_web_extensions | none |
| parent | GObject.ObjectClass |
| user_message_received | gboolean |

### WebKit2.WebContextPrivate

C type: `WebKitWebContextPrivate`

### WebKit2.WebInspectorClass

C type: `WebKitWebInspectorClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.WebInspectorPrivate

C type: `WebKitWebInspectorPrivate`

### WebKit2.WebResourceClass

C type: `WebKitWebResourceClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.WebResourcePrivate

C type: `WebKitWebResourcePrivate`

### WebKit2.WebsiteData

GType: `WebKitWebsiteData` ?? C type: `WebKitWebsiteData`

Data stored locally by a web site. WebKitWebsiteData represents data stored in the client by a particular website. A website is normally a set of U...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `WebsiteData.get_name() -> utf8` | webkit_website_data_get_name | 2.16 | Gets the name of #WebKitWebsiteData. This is the website name, normally represented by a domain or host name. All local documents are grouped in th... |
| get_size | `WebsiteData.get_size(types: WebsiteDataTypes) -> guint64` | webkit_website_data_get_size | 2.16 | Gets the size of the data of types @types in a #WebKitWebsiteData. Note that currently the data size is only known for %WEBKIT_WEBSITE_DATA_DISK_CA... |
| get_types | `WebsiteData.get_types() -> WebsiteDataTypes` | webkit_website_data_get_types | 2.16 | Gets the types of data stored in the client for a #WebKitWebsiteData. These are the types actually present, not the types queried with webkit_websi... |
| ref | `WebsiteData.ref() -> WebsiteData` | webkit_website_data_ref | 2.16 | Atomically increments the reference count of @website_data by one. This function is MT-safe and may be called from any thread. |
| unref | `WebsiteData.unref() -> none` | webkit_website_data_unref | 2.16 | Atomically decrements the reference count of @website_data by one. If the reference count drops to 0, all memory allocated by #WebKitWebsiteData is... |

### WebKit2.WebsiteDataAccessPermissionRequestClass

C type: `WebKitWebsiteDataAccessPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.WebsiteDataAccessPermissionRequestPrivate

C type: `WebKitWebsiteDataAccessPermissionRequestPrivate`

### WebKit2.WebsiteDataManagerClass

C type: `WebKitWebsiteDataManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.WebsiteDataManagerPrivate

C type: `WebKitWebsiteDataManagerPrivate`

### WebKit2.WebsitePoliciesClass

C type: `WebKitWebsitePoliciesClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.WebsitePoliciesPrivate

C type: `WebKitWebsitePoliciesPrivate`

### WebKit2.WebViewBaseClass

C type: `WebKitWebViewBaseClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parentClass | Gtk.ContainerClass |

### WebKit2.WebViewBasePrivate

C type: `WebKitWebViewBasePrivate`

### WebKit2.WebViewClass

C type: `WebKitWebViewClass`

#### Fields

| Field | Type |
| --- | --- |
| authenticate | gboolean |
| close | none |
| context_menu | gboolean |
| context_menu_dismissed | none |
| create | Gtk.Widget |
| decide_policy | gboolean |
| enter_fullscreen | gboolean |
| insecure_content_detected | none |
| leave_fullscreen | gboolean |
| load_changed | none |
| load_failed | gboolean |
| load_failed_with_tls_errors | gboolean |
| mouse_target_changed | none |
| parent | WebViewBaseClass |
| permission_request | gboolean |
| print | gboolean |
| query_permission_state | gboolean |
| ready_to_show | none |
| resource_load_started | none |
| run_as_modal | none |
| run_color_chooser | gboolean |
| run_file_chooser | gboolean |
| script_dialog | gboolean |
| show_notification | gboolean |
| show_option_menu | gboolean |
| submit_form | none |
| user_message_received | gboolean |
| web_process_crashed | gboolean |
| web_process_terminated | none |

### WebKit2.WebViewPrivate

C type: `WebKitWebViewPrivate`

### WebKit2.WebViewSessionState

GType: `WebKitWebViewSessionState` ?? C type: `WebKitWebViewSessionState`

Handles serialization of a web view's browsing state.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebViewSessionState.new(data: GLib.Bytes) -> WebViewSessionState` | webkit_web_view_session_state_new | 2.12 | Creates a new #WebKitWebViewSessionState from serialized data. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref | `WebViewSessionState.ref() -> WebViewSessionState` | webkit_web_view_session_state_ref | 2.12 | Atomically increments the reference count of @state by one. This function is MT-safe and may be called from any thread. |
| serialize | `WebViewSessionState.serialize() -> GLib.Bytes` | webkit_web_view_session_state_serialize | 2.12 | Serializes a #WebKitWebViewSessionState. |
| unref | `WebViewSessionState.unref() -> none` | webkit_web_view_session_state_unref | 2.12 | Atomically decrements the reference count of @state by one. If the reference count drops to 0, all memory allocated by the #WebKitWebViewSessionSta... |

### WebKit2.WindowPropertiesClass

C type: `WebKitWindowPropertiesClass`

#### Fields

| Field | Type |
| --- | --- |
| _webkit_reserved0 | none |
| _webkit_reserved1 | none |
| _webkit_reserved2 | none |
| _webkit_reserved3 | none |
| parent_class | GObject.ObjectClass |

### WebKit2.WindowPropertiesPrivate

C type: `WebKitWindowPropertiesPrivate`

### WebKit2.XRPermissionRequestClass

C type: `WebKitXRPermissionRequestClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### WebKit2.XRPermissionRequestPrivate

C type: `WebKitXRPermissionRequestPrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| download_error_quark | `download_error_quark() -> GLib.Quark` | webkit_download_error_quark |  | Gets the quark for the domain of download errors. |
| favicon_database_error_quark | `favicon_database_error_quark() -> GLib.Quark` | webkit_favicon_database_error_quark |  | Gets the quark for the domain of favicon database errors. |
| get_major_version | `get_major_version() -> guint` | webkit_get_major_version |  | Returns the major version number of the WebKit library. (e.g. in WebKit version 1.8.3 this is 1.) This function is in the library, so it represents... |
| get_micro_version | `get_micro_version() -> guint` | webkit_get_micro_version |  | Returns the micro version number of the WebKit library. (e.g. in WebKit version 1.8.3 this is 3.) This function is in the library, so it represents... |
| get_minor_version | `get_minor_version() -> guint` | webkit_get_minor_version |  | Returns the minor version number of the WebKit library. (e.g. in WebKit version 1.8.3 this is 8.) This function is in the library, so it represents... |
| javascript_error_quark | `javascript_error_quark() -> GLib.Quark` | webkit_javascript_error_quark |  | Gets the quark for the domain of JavaScript errors. |
| media_key_system_permission_get_name | `media_key_system_permission_get_name(request: MediaKeySystemPermissionRequest) -> utf8` | webkit_media_key_system_permission_get_name | 2.32 | Get the key system for which access permission is being requested. |
| network_error_quark | `network_error_quark() -> GLib.Quark` | webkit_network_error_quark |  | Gets the quark for the domain of networking errors. |
| plugin_error_quark | `plugin_error_quark() -> GLib.Quark` | webkit_plugin_error_quark |  | Gets the quark for the domain of plug-in errors. |
| policy_error_quark | `policy_error_quark() -> GLib.Quark` | webkit_policy_error_quark |  | Gets the quark for the domain of policy errors. |
| print_error_quark | `print_error_quark() -> GLib.Quark` | webkit_print_error_quark |  | Gets the quark for the domain of printing errors. |
| snapshot_error_quark | `snapshot_error_quark() -> GLib.Quark` | webkit_snapshot_error_quark |  | Gets the quark for the domain of page snapshot errors. |
| uri_for_display | `uri_for_display(uri: utf8) -> utf8` | webkit_uri_for_display | 2.24 | Use this function to format a URI for display. The URIs used internally by WebKit may contain percent-encoded characters or Punycode, which are not... |
| user_content_filter_error_quark | `user_content_filter_error_quark() -> GLib.Quark` | webkit_user_content_filter_error_quark |  | Gets the quark for the domain of user content filter errors. |
| user_media_permission_is_for_audio_device | `user_media_permission_is_for_audio_device(request: UserMediaPermissionRequest) -> gboolean` | webkit_user_media_permission_is_for_audio_device | 2.8 | Check whether the permission request is for an audio device. |
| user_media_permission_is_for_display_device | `user_media_permission_is_for_display_device(request: UserMediaPermissionRequest) -> gboolean` | webkit_user_media_permission_is_for_display_device | 2.34 | Check whether the permission request is for a display device. |
| user_media_permission_is_for_video_device | `user_media_permission_is_for_video_device(request: UserMediaPermissionRequest) -> gboolean` | webkit_user_media_permission_is_for_video_device | 2.8 | Check whether the permission request is for a video device. |
| user_message_error_quark | `user_message_error_quark() -> GLib.Quark` | webkit_user_message_error_quark |  | Gets the quark for the domain of user message errors. |
| web_extension_match_pattern_error_quark | `web_extension_match_pattern_error_quark() -> GLib.Quark` | webkit_web_extension_match_pattern_error_quark | 2.48 | Gets the quark for the domain of Web Extension Match Pattern errors. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| URISchemeRequestCallback | `URISchemeRequestCallback(request: URISchemeRequest, user_data: gpointer?) -> none` |  |  | Type definition for a function that will be called back when an URI request is made for a user registered URI scheme. |

## Constants

| Name | Type |
| --- | --- |
| EDITING_COMMAND_COPY | utf8 |
| EDITING_COMMAND_CREATE_LINK | utf8 |
| EDITING_COMMAND_CUT | utf8 |
| EDITING_COMMAND_INSERT_IMAGE | utf8 |
| EDITING_COMMAND_PASTE | utf8 |
| EDITING_COMMAND_PASTE_AS_PLAIN_TEXT | utf8 |
| EDITING_COMMAND_REDO | utf8 |
| EDITING_COMMAND_SELECT_ALL | utf8 |
| EDITING_COMMAND_UNDO | utf8 |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |

