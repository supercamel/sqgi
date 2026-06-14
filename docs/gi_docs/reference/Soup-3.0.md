# Soup 3.0

SQGI import: `import("Soup", "3.0")`

Packages: `libsoup-3.0`
Includes: `Gio-2.0`
Libraries: `libsoup-3.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 27 |
| Interfaces | 1 |
| Records | 32 |
| Unions | 0 |
| Enums | 19 |
| Flags | 4 |
| Functions | 48 |
| Callbacks | 9 |
| Constants | 12 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Auth | GObject.Object | 4 | 0 | 16 | The abstract base class for handling authentication. Specific HTTP Authentication mechanisms are implemented by its subclasses, but applications ne... |
| AuthBasic | Auth | 0 | 0 | 0 | HTTP "Basic" authentication. [class@Session]s support this by default; if you want to disable support for it, call [method@Session.remove_feature_b... |
| AuthDigest | Auth | 0 | 0 | 0 | HTTP "Digest" authentication. [class@Session]s support this by default; if you want to disable support for it, call [method@Session.remove_feature_... |
| AuthDomain | GObject.Object | 2 | 0 | 9 | Server-side authentication. A #SoupAuthDomain manages authentication for all or part of a [class@Server]. To make a server require authentication, ... |
| AuthDomainBasic | AuthDomain | 0 | 0 | 2 | Server-side "Basic" authentication. #SoupAuthDomainBasic handles the server side of HTTP "Basic" (ie, cleartext password) authentication. |
| AuthDomainDigest | AuthDomain | 0 | 0 | 3 | Server-side "Digest" authentication. #SoupAuthDomainDigest handles the server side of HTTP "Digest" authentication. |
| AuthManager | GObject.Object | 0 | 0 | 2 | HTTP client-side authentication handler. #SoupAuthManager is the [iface@SessionFeature] that handles HTTP authentication for a [class@Session]. A #... |
| AuthNegotiate | Auth | 0 | 0 | 1 | HTTP-based GSS-Negotiate authentication, as defined by RFC 4559. [class@Session]s do not support this type by default; if you want to enable suppor... |
| AuthNTLM | Auth | 0 | 0 | 0 | HTTP-based NTLM authentication. [class@Session]s do not support this type by default; if you want to enable support for it, call [method@Session.ad... |
| Cache | GObject.Object | 0 | 0 | 7 | File-based cache for HTTP resources. |
| ContentDecoder | GObject.Object | 0 | 0 | 0 | Handles decoding of HTTP messages. #SoupContentDecoder handles adding the "Accept-Encoding" header on outgoing messages, and processing the "Conten... |
| ContentSniffer | GObject.Object | 0 | 0 | 2 | Sniffs the mime type of messages. A #SoupContentSniffer tries to detect the actual content type of the files that are being downloaded by looking a... |
| CookieJar | GObject.Object | 2 | 1 | 14 | Automatic cookie handling for SoupSession. A #SoupCookieJar stores [struct@Cookie]s and arrange for them to be sent with the appropriate [class@Mes... |
| CookieJarDB | CookieJar | 0 | 0 | 1 | Database-based Cookie Jar. #SoupCookieJarDB is a [class@CookieJar] that reads cookies from and writes them to a sqlite database in the new Mozilla ... |
| CookieJarText | CookieJar | 0 | 0 | 1 | Text-file-based ("cookies.txt") Cookie Jar #SoupCookieJarText is a [class@CookieJar] that reads cookies from and writes them to a text file in form... |
| HSTSEnforcer | GObject.Object | 1 | 1 | 7 | Automatic HTTP Strict Transport Security enforcing for [class@Session]. A #SoupHSTSEnforcer stores HSTS policies and enforces them when required. #... |
| HSTSEnforcerDB | HSTSEnforcer | 0 | 0 | 1 | Persistent HTTP Strict Transport Security enforcer. #SoupHSTSEnforcerDB is a [class@HSTSEnforcer] that uses a SQLite database as a backend for pers... |
| Logger | GObject.Object | 0 | 0 | 6 | Debug logging support #SoupLogger watches a [class@Session] and logs the HTTP traffic that it generates, for debugging purposes. Many applications ... |
| Message | GObject.Object | 0 | 17 | 47 | Represents an HTTP message being sent or received. A #SoupMessage represents an HTTP message that is being sent or received. You would create a #So... |
| MultipartInputStream | Gio.FilterInputStream | 0 | 0 | 5 | Handles streams of multipart messages. This adds support for the multipart responses. For handling the multiple parts the user needs to wrap the [c... |
| Server | GObject.Object | 0 | 4 | 26 | A HTTP server. #SoupServer implements a simple HTTP server. To begin, create a server using [ctor@Server.new]. Add at least one handler by calling ... |
| ServerMessage | GObject.Object | 0 | 12 | 23 | An HTTP server request and response pair. A SoupServerMessage represents an HTTP message that is being sent or received on a [class@Server]. [class... |
| Session | GObject.Object | 0 | 2 | 44 | Soup session state object. #SoupSession is the object that controls client-side HTTP. A #SoupSession encapsulates all of the state that libsoup is ... |
| WebsocketConnection | GObject.Object | 0 | 5 | 18 | The WebSocket Protocol Provides support for the WebSocket protocol. To connect to a WebSocket server, create a [class@Session] and call [method@Ses... |
| WebsocketExtension | GObject.Object | 1 | 0 | 5 | A WebSocket extension #SoupWebsocketExtension is the base class for WebSocket extension objects. |
| WebsocketExtensionDeflate | WebsocketExtension | 0 | 0 | 0 | A SoupWebsocketExtensionDeflate is a [class@WebsocketExtension] implementing permessage-deflate (RFC 7692). This extension is used by default in a ... |
| WebsocketExtensionManager | GObject.Object | 0 | 0 | 0 | SoupWebsocketExtensionManager is the [iface@SessionFeature] that handles WebSockets extensions for a [class@Session]. A #SoupWebsocketExtensionMana... |

### Soup.Auth

Parent: `GObject.Object` ?? Subclasses: `AuthBasic`, `AuthDigest`, `AuthNegotiate`, `AuthNTLM` ?? GType: `SoupAuth` ?? C type: `SoupAuth` ?? Abstract

The abstract base class for handling authentication. Specific HTTP Authentication mechanisms are implemented by its subclasses, but applications ne...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Auth.new(type: GType, msg: Message, auth_header: utf8) -> Auth` | soup_auth_new |  | Creates a new #SoupAuth of type @type with the information from @msg and @auth_header. This is called by [class@Session]; you will normally not cre... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `Auth.authenticate(username: utf8, password: utf8) -> none` | soup_auth_authenticate |  | Call this on an auth to authenticate it. Normally this will cause the auth's message to be requeued with the new authentication info. |
| can_authenticate | `Auth.can_authenticate() -> gboolean` | soup_auth_can_authenticate |  | Tests if @auth is able to authenticate by providing credentials to the [method@Auth.authenticate]. |
| cancel | `Auth.cancel() -> none` | soup_auth_cancel |  | Call this on an auth to cancel it. You need to cancel an auth to complete an asynchronous authenticate operation when no credentials are provided (... |
| free_protection_space | `Auth.free_protection_space(space: GLib.SList) -> none` | soup_auth_free_protection_space |  | Frees @space. |
| get_authority | `Auth.get_authority() -> utf8` | soup_auth_get_authority |  | Returns the authority (host:port) that @auth is associated with. |
| get_authorization | `Auth.get_authorization(msg: Message) -> utf8` | soup_auth_get_authorization |  | Generates an appropriate "Authorization" header for @msg. (The session will only call this if [method@Auth.is_authenticated] returned %TRUE.) |
| get_info | `Auth.get_info() -> utf8` | soup_auth_get_info |  | Gets an opaque identifier for @auth. The identifier can be used as a hash key or the like. #SoupAuth objects from the same server with the same ide... |
| get_protection_space | `Auth.get_protection_space(source_uri: GLib.Uri) -> GLib.SList` | soup_auth_get_protection_space |  | Returns a list of paths on the server which @auth extends over. (All subdirectories of these paths are also assumed to be part of @auth's protectio... |
| get_realm | `Auth.get_realm() -> utf8` | soup_auth_get_realm |  | Returns @auth's realm. This is an identifier that distinguishes separate authentication spaces on a given server, and may be some string that is me... |
| get_scheme_name | `Auth.get_scheme_name() -> utf8` | soup_auth_get_scheme_name |  | soup_auth_get_scheme_name: (attributes org.gtk.Method.get_property=scheme-name) Returns @auth's scheme name. (Eg, "Basic", "Digest", or "NTLM") |
| is_authenticated | `Auth.is_authenticated() -> gboolean` | soup_auth_is_authenticated |  | Tests if @auth has been given a username and password. |
| is_cancelled | `Auth.is_cancelled() -> gboolean` | soup_auth_is_cancelled |  | Tests if @auth has been cancelled |
| is_for_proxy | `Auth.is_for_proxy() -> gboolean` | soup_auth_is_for_proxy |  | Tests whether or not @auth is associated with a proxy server rather than an "origin" server. |
| is_ready | `Auth.is_ready(msg: Message) -> gboolean` | soup_auth_is_ready |  | Tests if @auth is ready to make a request for @msg with. For most auths, this is equivalent to [method@Auth.is_authenticated], but for some auth ty... |
| update | `Auth.update(msg: Message, auth_header: utf8) -> gboolean` | soup_auth_update |  | Updates @auth with the information from @msg and @auth_header, possibly un-authenticating it. As with [ctor@Auth.new], this is normally only used b... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| authority | utf8 | read, write | The authority (host:port) being authenticated to. |
| is-authenticated | gboolean | read | Whether or not the auth has been authenticated. |
| is-cancelled | gboolean | read | Whether or not the auth has been cancelled. |
| is-for-proxy | gboolean | read, write | Whether or not the auth is for a proxy server. |
| realm | utf8 | read, write | The authentication realm. |
| scheme-name | utf8 | read | The authentication scheme name. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `authenticate(username: utf8, password: utf8) -> none` |  |  | Call this on an auth to authenticate it. Normally this will cause the auth's message to be requeued with the new authentication info. |
| can_authenticate | `can_authenticate() -> gboolean` |  |  | Tests if @auth is able to authenticate by providing credentials to the [method@Auth.authenticate]. |
| get_authorization | `get_authorization(msg: Message) -> utf8` |  |  | Generates an appropriate "Authorization" header for @msg. (The session will only call this if [method@Auth.is_authenticated] returned %TRUE.) |
| get_protection_space | `get_protection_space(source_uri: GLib.Uri) -> GLib.SList` |  |  | Returns a list of paths on the server which @auth extends over. (All subdirectories of these paths are also assumed to be part of @auth's protectio... |
| is_authenticated | `is_authenticated() -> gboolean` |  |  | Tests if @auth has been given a username and password. |
| is_ready | `is_ready(msg: Message) -> gboolean` |  |  | Tests if @auth is ready to make a request for @msg with. For most auths, this is equivalent to [method@Auth.is_authenticated], but for some auth ty... |
| update | `update(msg: Message, auth_header: GLib.HashTable) -> gboolean` |  |  | Updates @auth with the information from @msg and @auth_header, possibly un-authenticating it. As with [ctor@Auth.new], this is normally only used b... |

### Soup.AuthBasic

Parent: `Auth` ?? GType: `SoupAuthBasic` ?? Final

HTTP "Basic" authentication. [class@Session]s support this by default; if you want to disable support for it, call [method@Session.remove_feature_b...

### Soup.AuthDigest

Parent: `Auth` ?? GType: `SoupAuthDigest` ?? Final

HTTP "Digest" authentication. [class@Session]s support this by default; if you want to disable support for it, call [method@Session.remove_feature_...

### Soup.AuthDomain

Parent: `GObject.Object` ?? Subclasses: `AuthDomainBasic`, `AuthDomainDigest` ?? GType: `SoupAuthDomain` ?? C type: `SoupAuthDomain` ?? Abstract

Server-side authentication. A #SoupAuthDomain manages authentication for all or part of a [class@Server]. To make a server require authentication, ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accepts | `AuthDomain.accepts(msg: ServerMessage) -> utf8` | soup_auth_domain_accepts |  | Checks if @msg contains appropriate authorization for @domain to accept it. Mirroring [method@AuthDomain.covers], this does not check whether or no... |
| add_path | `AuthDomain.add_path(path: utf8) -> none` | soup_auth_domain_add_path |  | Adds @path to @domain. Requests under @path on @domain's server will require authentication (unless overridden by [method@AuthDomain.remove_path] o... |
| challenge | `AuthDomain.challenge(msg: ServerMessage) -> none` | soup_auth_domain_challenge |  | Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to @msg. It requests that the client authenticate, and sets @msg's status accordingly. Thi... |
| check_password | `AuthDomain.check_password(msg: ServerMessage, username: utf8, password: utf8) -> gboolean` | soup_auth_domain_check_password |  | Checks if @msg authenticates to @domain via @username and @password. This would normally be called from a [callback@AuthDomainGenericAuthCallback]. |
| covers | `AuthDomain.covers(msg: ServerMessage) -> gboolean` | soup_auth_domain_covers |  | Checks if @domain requires @msg to be authenticated (according to its paths and filter function). This does not actually look at whether @msg *is* ... |
| get_realm | `AuthDomain.get_realm() -> utf8` | soup_auth_domain_get_realm |  | Gets the realm name associated with @domain. |
| remove_path | `AuthDomain.remove_path(path: utf8) -> none` | soup_auth_domain_remove_path |  | Removes @path from @domain. Requests under @path on @domain's server will NOT require authentication. This is not simply an undo-er for [method@Aut... |
| set_filter | `AuthDomain.set_filter(filter: AuthDomainFilter, filter_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_set_filter |  | Adds @filter as an authentication filter to @domain. The filter gets a chance to bypass authentication for certain requests that would otherwise re... |
| set_generic_auth_callback | `AuthDomain.set_generic_auth_callback(auth_callback: AuthDomainGenericAuthCallback, auth_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_set_generic_auth_callback |  | Sets @auth_callback as an authentication-handling callback for @domain. Whenever a request comes in to @domain which cannot be authenticated via a ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filter | AuthDomainFilter | read, write | The [callback@AuthDomainFilter] for the domain. |
| filter-data | gpointer | read, write | Data to pass to the [callback@AuthDomainFilter]. |
| generic-auth-callback | AuthDomainGenericAuthCallback | read, write | The [callback@AuthDomainGenericAuthCallback]. |
| generic-auth-data | gpointer | read, write | The data to pass to the [callback@AuthDomainGenericAuthCallback]. |
| proxy | gboolean | read, write, construct-only | Whether or not this is a proxy auth domain. |
| realm | utf8 | read, write, construct-only | The realm of this auth domain. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accepts | `accepts(msg: ServerMessage, header: utf8) -> utf8` |  |  |  |
| challenge | `challenge(msg: ServerMessage) -> utf8` |  |  | Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to @msg. It requests that the client authenticate, and sets @msg's status accordingly. Thi... |
| check_password | `check_password(msg: ServerMessage, username: utf8, password: utf8) -> gboolean` |  |  | Checks if @msg authenticates to @domain via @username and @password. This would normally be called from a [callback@AuthDomainGenericAuthCallback]. |

### Soup.AuthDomainBasic

Parent: `AuthDomain` ?? GType: `SoupAuthDomainBasic` ?? C type: `SoupAuthDomainBasic` ?? Final

Server-side "Basic" authentication. #SoupAuthDomainBasic handles the server side of HTTP "Basic" (ie, cleartext password) authentication.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AuthDomainBasic.new(optname1: utf8, ...: void) -> AuthDomain` | soup_auth_domain_basic_new |  | Creates a #SoupAuthDomainBasic. You must set the [property@AuthDomain:realm] property, to indicate the realm name to be returned with the authentic... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_auth_callback | `AuthDomainBasic.set_auth_callback(callback: AuthDomainBasicAuthCallback, user_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_basic_set_auth_callback |  | Sets the callback that @domain will use to authenticate incoming requests. For each request containing authorization, @domain will invoke the callb... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auth-callback | AuthDomainBasicAuthCallback | read, write | The [callback@AuthDomainBasicAuthCallback]. |
| auth-data | gpointer | read, write | The data to pass to the [callback@AuthDomainBasicAuthCallback]. |

### Soup.AuthDomainDigest

Parent: `AuthDomain` ?? GType: `SoupAuthDomainDigest` ?? C type: `SoupAuthDomainDigest` ?? Final

Server-side "Digest" authentication. #SoupAuthDomainDigest handles the server side of HTTP "Digest" authentication.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AuthDomainDigest.new(optname1: utf8, ...: void) -> AuthDomain` | soup_auth_domain_digest_new |  | Creates a #SoupAuthDomainDigest. You must set the [property@AuthDomain:realm] property, to indicate the realm name to be returned with the authenti... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| encode_password | `encode_password(username: utf8, realm: utf8, password: utf8) -> utf8` | soup_auth_domain_digest_encode_password |  | Encodes the username/realm/password triplet for Digest authentication. That is, it returns a stringified MD5 hash of @username, @realm, and @passwo... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_auth_callback | `AuthDomainDigest.set_auth_callback(callback: AuthDomainDigestAuthCallback, user_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_digest_set_auth_callback |  | Sets the callback that @domain will use to authenticate incoming requests. For each request containing authorization, @domain will invoke the callb... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auth-callback | AuthDomainDigestAuthCallback | read, write | The [callback@AuthDomainDigestAuthCallback]. |
| auth-data | gpointer | read, write | The data to pass to the [callback@AuthDomainDigestAuthCallback]. |

### Soup.AuthManager

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupAuthManager` ?? C type: `SoupAuthManager` ?? Final

HTTP client-side authentication handler. #SoupAuthManager is the [iface@SessionFeature] that handles HTTP authentication for a [class@Session]. A #...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_cached_credentials | `AuthManager.clear_cached_credentials() -> none` | soup_auth_manager_clear_cached_credentials |  | Clear all credentials cached by @manager. |
| use_auth | `AuthManager.use_auth(uri: GLib.Uri, auth: Auth) -> none` | soup_auth_manager_use_auth |  | Records that @auth is to be used under @uri, as though a WWW-Authenticate header had been received at that URI. This can be used to "preload" @mana... |

### Soup.AuthNegotiate

Parent: `Auth` ?? GType: `SoupAuthNegotiate` ?? Final

HTTP-based GSS-Negotiate authentication, as defined by RFC 4559. [class@Session]s do not support this type by default; if you want to enable suppor...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| supported | `supported() -> gboolean` | soup_auth_negotiate_supported |  | Indicates whether libsoup was built with GSSAPI support. If this is %FALSE, %SOUP_TYPE_AUTH_NEGOTIATE will still be defined and can still be added ... |

### Soup.AuthNTLM

Parent: `Auth` ?? GType: `SoupAuthNTLM` ?? Final

HTTP-based NTLM authentication. [class@Session]s do not support this type by default; if you want to enable support for it, call [method@Session.ad...

### Soup.Cache

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupCache` ?? C type: `SoupCache`

File-based cache for HTTP resources.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Cache.new(cache_dir: utf8?, cache_type: CacheType) -> Cache` | soup_cache_new |  | Creates a new #SoupCache. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `Cache.clear() -> none` | soup_cache_clear |  | Will remove all entries in the @cache plus all the cache files. This is not thread safe and must be called only from the thread that created the #S... |
| dump | `Cache.dump() -> none` | soup_cache_dump |  | Synchronously writes the cache index out to disk. Contrast with [method@Cache.flush], which writes pending cache *entries* to disk. You must call t... |
| flush | `Cache.flush() -> none` | soup_cache_flush |  | Forces all pending writes in the @cache to be committed to disk. For doing so it will iterate the [struct@GLib.MainContext] associated with @cache'... |
| get_max_size | `Cache.get_max_size() -> guint` | soup_cache_get_max_size |  | Gets the maximum size of the cache. |
| load | `Cache.load() -> none` | soup_cache_load |  | Loads the contents of @cache's index into memory. This is not thread safe and must be called only from the thread that created the #SoupCache |
| set_max_size | `Cache.set_max_size(max_size: guint) -> none` | soup_cache_set_max_size |  | Sets the maximum size of the cache. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cache-dir | utf8 | read, write, construct-only | The directory to store the cache files. |
| cache-type | CacheType | read, write, construct-only | Whether the cache is private or shared. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cacheability | `get_cacheability(msg: Message) -> Cacheability` |  |  |  |

### Soup.ContentDecoder

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupContentDecoder` ?? C type: `SoupContentDecoder` ?? Final

Handles decoding of HTTP messages. #SoupContentDecoder handles adding the "Accept-Encoding" header on outgoing messages, and processing the "Conten...

### Soup.ContentSniffer

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupContentSniffer` ?? C type: `SoupContentSniffer` ?? Final

Sniffs the mime type of messages. A #SoupContentSniffer tries to detect the actual content type of the files that are being downloaded by looking a...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContentSniffer.new() -> ContentSniffer` | soup_content_sniffer_new |  | Creates a new #SoupContentSniffer. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| sniff | `ContentSniffer.sniff(msg: Message, buffer: GLib.Bytes, params: out GLib.HashTable?) -> utf8` | soup_content_sniffer_sniff |  | Sniffs @buffer to determine its Content-Type. The result may also be influenced by the Content-Type declared in @msg's response headers. |

### Soup.CookieJar

Parent: `GObject.Object` ?? Subclasses: `CookieJarDB`, `CookieJarText` ?? Implements: `SessionFeature` ?? GType: `SoupCookieJar` ?? C type: `SoupCookieJar`

Automatic cookie handling for SoupSession. A #SoupCookieJar stores [struct@Cookie]s and arrange for them to be sent with the appropriate [class@Mes...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CookieJar.new() -> CookieJar` | soup_cookie_jar_new |  | Creates a new #SoupCookieJar. The base #SoupCookieJar class does not support persistent storage of cookies; use a subclass for that. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_cookie | `CookieJar.add_cookie(cookie: Cookie) -> none` | soup_cookie_jar_add_cookie |  | Adds @cookie to @jar. Emits the [signal@CookieJar::changed] signal if we are modifying an existing cookie or adding a valid new cookie ('valid' mea... |
| add_cookie_full | `CookieJar.add_cookie_full(cookie: Cookie, uri: GLib.Uri?, first_party: GLib.Uri?) -> none` | soup_cookie_jar_add_cookie_full |  | Adds @cookie to @jar. Emits the [signal@CookieJar::changed] signal if we are modifying an existing cookie or adding a valid new cookie ('valid' mea... |
| add_cookie_with_first_party | `CookieJar.add_cookie_with_first_party(first_party: GLib.Uri, cookie: Cookie) -> none` | soup_cookie_jar_add_cookie_with_first_party |  | Adds @cookie to @jar. Emits the [signal@CookieJar::changed] signal if we are modifying an existing cookie or adding a valid new cookie ('valid' mea... |
| all_cookies | `CookieJar.all_cookies() -> GLib.SList` | soup_cookie_jar_all_cookies |  | Constructs a [struct@GLib.List] with every cookie inside the @jar. The cookies in the list are a copy of the original, so you have to free them whe... |
| delete_cookie | `CookieJar.delete_cookie(cookie: Cookie) -> none` | soup_cookie_jar_delete_cookie |  | Deletes @cookie from @jar. Emits the [signal@CookieJar::changed] signal. |
| get_accept_policy | `CookieJar.get_accept_policy() -> CookieJarAcceptPolicy` | soup_cookie_jar_get_accept_policy |  | Gets @jar's [enum@CookieJarAcceptPolicy]. |
| get_cookie_list | `CookieJar.get_cookie_list(uri: GLib.Uri, for_http: gboolean) -> GLib.SList` | soup_cookie_jar_get_cookie_list |  | Retrieves the list of cookies that would be sent with a request to @uri as a [struct@GLib.List] of #SoupCookie objects. If @for_http is %TRUE, the ... |
| get_cookie_list_with_same_site_info | `CookieJar.get_cookie_list_with_same_site_info(uri: GLib.Uri, top_level: GLib.Uri?, site_for_cookies: GLib.Uri?, for_http: gboolean, is_safe_method: gboolean, is_top_level_navigation: gboolean) -> GLib.SList` | soup_cookie_jar_get_cookie_list_with_same_site_info |  | This is an extended version of [method@CookieJar.get_cookie_list] that provides more information required to use SameSite cookies. See the SameSite... |
| get_cookies | `CookieJar.get_cookies(uri: GLib.Uri, for_http: gboolean) -> utf8` | soup_cookie_jar_get_cookies |  | Retrieves (in Cookie-header form) the list of cookies that would be sent with a request to @uri. If @for_http is %TRUE, the return value will inclu... |
| is_persistent | `CookieJar.is_persistent() -> gboolean` | soup_cookie_jar_is_persistent |  | Gets whether @jar stores cookies persistenly. |
| set_accept_policy | `CookieJar.set_accept_policy(policy: CookieJarAcceptPolicy) -> none` | soup_cookie_jar_set_accept_policy |  | Sets @policy as the cookie acceptance policy for @jar. |
| set_cookie | `CookieJar.set_cookie(uri: GLib.Uri, cookie: utf8) -> none` | soup_cookie_jar_set_cookie |  | Adds @cookie to @jar, exactly as though it had appeared in a Set-Cookie header returned from a request to @uri. Keep in mind that if the [enum@Cook... |
| set_cookie_with_first_party | `CookieJar.set_cookie_with_first_party(uri: GLib.Uri, first_party: GLib.Uri, cookie: utf8) -> none` | soup_cookie_jar_set_cookie_with_first_party |  | Adds @cookie to @jar, exactly as though it had appeared in a Set-Cookie header returned from a request to @uri. @first_party will be used to reject... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accept-policy | CookieJarAcceptPolicy | read, write | The policy the jar should follow to accept or reject cookies. |
| read-only | gboolean | read, write, construct-only | Whether or not the cookie jar is read-only. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `old_cookie: Cookie, new_cookie: Cookie` | none | first |  | Emitted when @jar changes. If a cookie has been added, @new_cookie will contain the newly-added cookie and @old_cookie will be %NULL. If a cookie h... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `changed(old_cookie: Cookie, new_cookie: Cookie) -> none` |  |  |  |
| is_persistent | `is_persistent() -> gboolean` |  |  | Gets whether @jar stores cookies persistenly. |
| save | `save() -> none` |  |  |  |

### Soup.CookieJarDB

Parent: `CookieJar` ?? Implements: `SessionFeature` ?? GType: `SoupCookieJarDB` ?? C type: `SoupCookieJarDB` ?? Final

Database-based Cookie Jar. #SoupCookieJarDB is a [class@CookieJar] that reads cookies from and writes them to a sqlite database in the new Mozilla ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CookieJarDB.new(filename: utf8, read_only: gboolean) -> CookieJar` | soup_cookie_jar_db_new |  | Creates a #SoupCookieJarDB. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-session... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only | Cookie-storage filename. |

### Soup.CookieJarText

Parent: `CookieJar` ?? Implements: `SessionFeature` ?? GType: `SoupCookieJarText` ?? C type: `SoupCookieJarText` ?? Final

Text-file-based ("cookies.txt") Cookie Jar #SoupCookieJarText is a [class@CookieJar] that reads cookies from and writes them to a text file in form...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CookieJarText.new(filename: utf8, read_only: gboolean) -> CookieJar` | soup_cookie_jar_text_new |  | Creates a #SoupCookieJarText. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-sessi... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only | Cookie-storage filename. |

### Soup.HSTSEnforcer

Parent: `GObject.Object` ?? Subclasses: `HSTSEnforcerDB` ?? Implements: `SessionFeature` ?? GType: `SoupHSTSEnforcer` ?? C type: `SoupHSTSEnforcer`

Automatic HTTP Strict Transport Security enforcing for [class@Session]. A #SoupHSTSEnforcer stores HSTS policies and enforces them when required. #...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HSTSEnforcer.new() -> HSTSEnforcer` | soup_hsts_enforcer_new |  | Creates a new #SoupHSTSEnforcer. The base #SoupHSTSEnforcer class does not support persistent storage of HSTS policies, see [class@HSTSEnforcerDB] ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_domains | `HSTSEnforcer.get_domains(session_policies: gboolean) -> GLib.List` | soup_hsts_enforcer_get_domains |  | Gets a list of domains for which there are policies in @enforcer. |
| get_policies | `HSTSEnforcer.get_policies(session_policies: gboolean) -> GLib.List` | soup_hsts_enforcer_get_policies |  | Gets a list with the policies in @enforcer. |
| has_valid_policy | `HSTSEnforcer.has_valid_policy(domain: utf8) -> gboolean` | soup_hsts_enforcer_has_valid_policy |  | Gets whether @hsts_enforcer has a currently valid policy for @domain. |
| is_persistent | `HSTSEnforcer.is_persistent() -> gboolean` | soup_hsts_enforcer_is_persistent |  | Gets whether @hsts_enforcer stores policies persistenly. |
| set_policy | `HSTSEnforcer.set_policy(policy: HSTSPolicy) -> none` | soup_hsts_enforcer_set_policy |  | Sets @policy to @hsts_enforcer. If @policy is expired, any existing HSTS policy for its host will be removed instead. If a policy existed for this ... |
| set_session_policy | `HSTSEnforcer.set_session_policy(domain: utf8, include_subdomains: gboolean) -> none` | soup_hsts_enforcer_set_session_policy |  | Sets a session policy for @domain. A session policy is a policy that is permanent to the lifetime of @hsts_enforcer's [class@Session] and doesn't e... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `old_policy: HSTSPolicy, new_policy: HSTSPolicy` | none | first |  | Emitted when @hsts_enforcer changes. If a policy has been added, @new_policy will contain the newly-added policy and @old_policy will be %NULL. If ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `changed(old_policy: HSTSPolicy, new_policy: HSTSPolicy) -> none` |  |  | The class closure for the #SoupHSTSEnforcer::changed signal. |
| has_valid_policy | `has_valid_policy(domain: utf8) -> gboolean` |  |  | Gets whether @hsts_enforcer has a currently valid policy for @domain. |
| is_persistent | `is_persistent() -> gboolean` |  |  | Gets whether @hsts_enforcer stores policies persistenly. |

### Soup.HSTSEnforcerDB

Parent: `HSTSEnforcer` ?? Implements: `SessionFeature` ?? GType: `SoupHSTSEnforcerDB` ?? C type: `SoupHSTSEnforcerDB` ?? Final

Persistent HTTP Strict Transport Security enforcer. #SoupHSTSEnforcerDB is a [class@HSTSEnforcer] that uses a SQLite database as a backend for pers...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HSTSEnforcerDB.new(filename: utf8) -> HSTSEnforcer` | soup_hsts_enforcer_db_new |  | Creates a #SoupHSTSEnforcerDB. @filename will be read in during the initialization of a #SoupHSTSEnforcerDB, in order to create an initial set of H... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only | The filename of the SQLite database where HSTS policies are stored. |

### Soup.Logger

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupLogger` ?? C type: `SoupLogger` ?? Final

Debug logging support #SoupLogger watches a [class@Session] and logs the HTTP traffic that it generates, for debugging purposes. Many applications ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Logger.new(level: LoggerLogLevel) -> Logger` | soup_logger_new |  | Creates a new #SoupLogger with the given debug level. If you need finer control over what message parts are and aren't logged, use [method@Logger.s... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_max_body_size | `Logger.get_max_body_size() -> gint` | soup_logger_get_max_body_size |  | Get the maximum body size for @logger. |
| set_max_body_size | `Logger.set_max_body_size(max_body_size: gint) -> none` | soup_logger_set_max_body_size |  | Sets the maximum body size for @logger (-1 means no limit). |
| set_printer | `Logger.set_printer(printer: LoggerPrinter, printer_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_logger_set_printer |  | Sets up an alternate log printing routine, if you don't want the log to go to `stdout`. |
| set_request_filter | `Logger.set_request_filter(request_filter: LoggerFilter, filter_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_logger_set_request_filter |  | Sets up a filter to determine the log level for a given request. For each HTTP request @logger will invoke @request_filter to determine how much (i... |
| set_response_filter | `Logger.set_response_filter(response_filter: LoggerFilter, filter_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_logger_set_response_filter |  | Sets up a filter to determine the log level for a given response. For each HTTP response @logger will invoke @response_filter to determine how much... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| level | LoggerLogLevel | read, write | The level of logging output. |
| max-body-size | gint | read, write | If [property@Logger:level] is %SOUP_LOGGER_LOG_BODY, this gives the maximum number of bytes of the body that will be logged. (-1 means "no limit".) |

### Soup.Message

Parent: `GObject.Object` ?? GType: `SoupMessage` ?? C type: `SoupMessage` ?? Final

Represents an HTTP message being sent or received. A #SoupMessage represents an HTTP message that is being sent or received. You would create a #So...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Message.new(method: utf8, uri_string: utf8) -> Message` | soup_message_new |  | Creates a new empty #SoupMessage, which will connect to @uri. |
| new_from_encoded_form | `Message.new_from_encoded_form(method: utf8, uri_string: utf8, encoded_form: utf8) -> Message` | soup_message_new_from_encoded_form |  | Creates a new #SoupMessage and sets it up to send the given @encoded_form to @uri via @method. If @method is "GET", it will include the form data i... |
| new_from_multipart | `Message.new_from_multipart(uri_string: utf8, multipart: Multipart) -> Message` | soup_message_new_from_multipart |  | Creates a new #SoupMessage and sets it up to send @multipart to @uri_string via POST. |
| new_from_uri | `Message.new_from_uri(method: utf8, uri: GLib.Uri) -> Message` | soup_message_new_from_uri |  | Creates a new empty #SoupMessage, which will connect to @uri. |
| new_options_ping | `Message.new_options_ping(base_uri: GLib.Uri) -> Message` | soup_message_new_options_ping |  | Creates a new #SoupMessage to send `OPTIONS *` to a server. The path of @base_uri will be ignored. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_flags | `Message.add_flags(flags: MessageFlags) -> none` | soup_message_add_flags |  | Adds @flags to the set of @msg's flags. |
| add_header_handler | `Message.add_header_handler(signal: utf8, header: utf8, callback: GObject.Callback, user_data: gpointer?) -> guint` | soup_message_add_header_handler |  | Adds a signal handler to @msg for @signal. Similar to [func@GObject.signal_connect], but the @callback will only be run if @msg's incoming messages... |
| add_status_code_handler | `Message.add_status_code_handler(signal: utf8, status_code: guint, callback: GObject.Callback, user_data: gpointer?) -> guint` | soup_message_add_status_code_handler |  | Adds a signal handler to @msg for @signal. Similar to [func@GObject.signal_connect], but the @callback will only be run if @msg has the status @sta... |
| disable_feature | `Message.disable_feature(feature_type: GType) -> none` | soup_message_disable_feature |  | Disables the actions of [iface@SessionFeature]s with the given @feature_type (or a subclass of that type) on @msg. @msg is processed as though the ... |
| get_connection_id | `Message.get_connection_id() -> guint64` | soup_message_get_connection_id |  | Returns the unique idenfier for the last connection used. This may be 0 if it was a cached resource or it has not gotten a connection yet. |
| get_first_party | `Message.get_first_party() -> GLib.Uri` | soup_message_get_first_party |  | Gets @msg's first-party [struct@GLib.Uri]. |
| get_flags | `Message.get_flags() -> MessageFlags` | soup_message_get_flags |  | Gets the flags on @msg. |
| get_force_http1 | `Message.get_force_http1() -> gboolean` | soup_message_get_force_http1 | 3.4 | Returns whether HTTP/1 version is currently demanded for the @msg send. |
| get_http_version | `Message.get_http_version() -> HTTPVersion` | soup_message_get_http_version |  | Gets the HTTP version of @msg. This is the minimum of the version from the request and the version from the response. |
| get_is_options_ping | `Message.get_is_options_ping() -> gboolean` | soup_message_get_is_options_ping |  | Gets whether @msg is intended to be used to send `OPTIONS *` to a server. |
| get_is_top_level_navigation | `Message.get_is_top_level_navigation() -> gboolean` | soup_message_get_is_top_level_navigation |  | Returns if this message is set as a top level navigation. Used for same-site policy checks. |
| get_method | `Message.get_method() -> utf8` | soup_message_get_method |  | Returns the method of this message. |
| get_metrics | `Message.get_metrics() -> MessageMetrics` | soup_message_get_metrics |  | Get the [struct@MessageMetrics] of @msg. If the flag %SOUP_MESSAGE_COLLECT_METRICS is not enabled for @msg this will return %NULL. |
| get_priority | `Message.get_priority() -> MessagePriority` | soup_message_get_priority |  | Retrieves the [enum@MessagePriority]. If not set this value defaults to #SOUP_MESSAGE_PRIORITY_NORMAL. |
| get_reason_phrase | `Message.get_reason_phrase() -> utf8` | soup_message_get_reason_phrase |  | Returns the reason phrase for the status of this message. |
| get_remote_address | `Message.get_remote_address() -> Gio.SocketAddress` | soup_message_get_remote_address |  | Get the remote [class@Gio.SocketAddress] of the connection associated with the message. The returned address can be %NULL if the connection hasn't ... |
| get_request_headers | `Message.get_request_headers() -> MessageHeaders` | soup_message_get_request_headers |  | Returns the headers sent with the request. |
| get_response_headers | `Message.get_response_headers() -> MessageHeaders` | soup_message_get_response_headers |  | Returns the headers recieved with the response. |
| get_site_for_cookies | `Message.get_site_for_cookies() -> GLib.Uri` | soup_message_get_site_for_cookies |  | Gets @msg's site for cookies #GUri. |
| get_status | `Message.get_status() -> Status` | soup_message_get_status |  | Returns the set status of this message. |
| get_tls_ciphersuite_name | `Message.get_tls_ciphersuite_name() -> utf8` | soup_message_get_tls_ciphersuite_name |  | Gets the name of the TLS ciphersuite negotiated for @msg's connection. |
| get_tls_peer_certificate | `Message.get_tls_peer_certificate() -> Gio.TlsCertificate` | soup_message_get_tls_peer_certificate |  | Gets the peer's [class@Gio.TlsCertificate] associated with @msg's connection. Note that this is not set yet during the emission of [signal@Message:... |
| get_tls_peer_certificate_errors | `Message.get_tls_peer_certificate_errors() -> Gio.TlsCertificateFlags` | soup_message_get_tls_peer_certificate_errors |  | Gets the errors associated with validating @msg's TLS peer certificate. Note that this is not set yet during the emission of [signal@Message::accep... |
| get_tls_protocol_version | `Message.get_tls_protocol_version() -> Gio.TlsProtocolVersion` | soup_message_get_tls_protocol_version |  | Gets the TLS protocol version negotiated for @msg's connection. If the message connection is not SSL, %G_TLS_PROTOCOL_VERSION_UNKNOWN is returned. |
| get_uri | `Message.get_uri() -> GLib.Uri` | soup_message_get_uri |  | Gets @msg's URI. |
| is_feature_disabled | `Message.is_feature_disabled(feature_type: GType) -> gboolean` | soup_message_is_feature_disabled |  | Get whether [iface@SessionFeature]s of the given @feature_type (or a subclass of that type) are disabled on @msg. See [method@Message.disable_featu... |
| is_keepalive | `Message.is_keepalive() -> gboolean` | soup_message_is_keepalive |  | Determines whether or not @msg's connection can be kept alive for further requests after processing @msg. The result is based on the HTTP version, ... |
| query_flags | `Message.query_flags(flags: MessageFlags) -> gboolean` | soup_message_query_flags |  | Queries if @flags are present in the set of @msg's flags. |
| remove_flags | `Message.remove_flags(flags: MessageFlags) -> none` | soup_message_remove_flags |  | Removes @flags from the set of @msg's flags. |
| set_first_party | `Message.set_first_party(first_party: GLib.Uri) -> none` | soup_message_set_first_party |  | Sets @first_party as the main document #GUri for @msg. For details of when and how this is used refer to the documentation for [enum@CookieJarAccep... |
| set_flags | `Message.set_flags(flags: MessageFlags) -> none` | soup_message_set_flags |  | Sets the specified flags on @msg. |
| set_force_http1 | `Message.set_force_http1(value: gboolean) -> none` | soup_message_set_force_http1 | 3.4 | Sets whether HTTP/1 version should be used when sending this message. Some connections can still override it, if needed. Note the value is unset af... |
| set_is_options_ping | `Message.set_is_options_ping(is_options_ping: gboolean) -> none` | soup_message_set_is_options_ping |  | Set whether @msg is intended to be used to send `OPTIONS *` to a server. When set to %TRUE, the path of [property@Message:uri] will be ignored and ... |
| set_is_top_level_navigation | `Message.set_is_top_level_navigation(is_top_level_navigation: gboolean) -> none` | soup_message_set_is_top_level_navigation |  | Sets whether the current request is a top-level navitation. See the same-site spec for more information. |
| set_method | `Message.set_method(method: utf8) -> none` | soup_message_set_method |  | Set @msg's HTTP method to @method. |
| set_priority | `Message.set_priority(priority: MessagePriority) -> none` | soup_message_set_priority |  | Sets the priority of a message. Note that this won't have any effect unless used before the message is added to the session's message processing qu... |
| set_request_body | `Message.set_request_body(content_type: utf8?, stream: Gio.InputStream?, content_length: gssize) -> none` | soup_message_set_request_body |  | Set the request body of a #SoupMessage. If @content_type is %NULL and @stream is not %NULL the Content-Type header will not be changed if present. ... |
| set_request_body_from_bytes | `Message.set_request_body_from_bytes(content_type: utf8?, bytes: GLib.Bytes?) -> none` | soup_message_set_request_body_from_bytes |  | Set the request body of a #SoupMessage from [struct@GLib.Bytes]. If @content_type is %NULL and @bytes is not %NULL the Content-Type header will not... |
| set_site_for_cookies | `Message.set_site_for_cookies(site_for_cookies: GLib.Uri?) -> none` | soup_message_set_site_for_cookies |  | Sets @site_for_cookies as the policy URL for same-site cookies for @msg. It is either the URL of the top-level document or %NULL depending on wheth... |
| set_tls_client_certificate | `Message.set_tls_client_certificate(certificate: Gio.TlsCertificate?) -> none` | soup_message_set_tls_client_certificate |  | Sets the @certificate to be used by @msg's connection when a client certificate is requested during the TLS handshake. You can call this as a respo... |
| set_uri | `Message.set_uri(uri: GLib.Uri) -> none` | soup_message_set_uri |  | Sets @msg's URI to @uri. If @msg has already been sent and you want to re-send it with the new URI, you need to send it again. |
| tls_client_certificate_password_request_complete | `Message.tls_client_certificate_password_request_complete() -> none` | soup_message_tls_client_certificate_password_request_complete |  | Completes a certificate password request. You must call this as a response to [signal@Message::request-certificate-password] signal, to notify @msg... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| first-party | GLib.Uri | read, write | The [struct@GLib.Uri] loaded in the application when the message was queued. |
| flags | MessageFlags | read, write | Various message options. |
| http-version | HTTPVersion | read | The HTTP protocol version to use. |
| is-options-ping | gboolean | read, write | Whether the message is an OPTIONS ping. The #SoupMessage is intended to be used to send `OPTIONS *` to a server. When set to %TRUE, the path of [pr... |
| is-top-level-navigation | gboolean | read, write | Set when the message is navigating between top level domains. |
| method | utf8 | read, write | The message's HTTP method. |
| priority | MessagePriority | read, write | Sets the priority of the #SoupMessage. See [method@Message.set_priority] for further details. |
| reason-phrase | utf8 | read | The HTTP response reason phrase. |
| remote-address | Gio.SocketAddress | read | The remote [class@Gio.SocketAddress] of the connection associated with the message. |
| request-headers | MessageHeaders | read | The HTTP request headers. |
| response-headers | MessageHeaders | read | The HTTP response headers. |
| site-for-cookies | GLib.Uri | read, write | Site used to compare cookies against. Used for SameSite cookie support. |
| status-code | guint | read | The HTTP response status code. |
| tls-ciphersuite-name | utf8 | read | The Name of TLS ciphersuite negotiated for this message connection. |
| tls-peer-certificate | Gio.TlsCertificate | read | The peer's [class@Gio.TlsCertificate] associated with the message. |
| tls-peer-certificate-errors | Gio.TlsCertificateFlags | read | The verification errors on [property@Message:tls-peer-certificate]. |
| tls-protocol-version | Gio.TlsProtocolVersion | read | The TLS protocol version negotiated for the message connection. |
| uri | GLib.Uri | read, write | The message's Request-URI. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| accept-certificate | `tls_peer_certificate: Gio.TlsCertificate, tls_peer_errors: Gio.TlsCertificateFlags` | gboolean | last |  | Emitted during the @msg's connection TLS handshake after an unacceptable TLS certificate has been received. You can return %TRUE to accept @tls_cer... |
| authenticate | `auth: Auth, retrying: gboolean` | gboolean | last |  | Emitted when the message requires authentication. If credentials are available call [method@Auth.authenticate] on @auth. If these credentials fail,... |
| content-sniffed | `type: utf8, params: GLib.HashTable` | none | first |  | This signal is emitted after [signal@Message::got-headers]. If content sniffing is disabled, or no content sniffing will be performed, due to the s... |
| finished | `` | none | first |  | Emitted when all HTTP processing is finished for a message. (After [signal@Message::got_body]). |
| got-body | `` | none | first |  | Emitted after receiving the complete message response body. |
| got-body-data | `chunk_size: guint` | none | first | 3.4 | Emitted after reading a portion of the message body from the network. |
| got-headers | `` | none | first |  | Emitted after receiving the Status-Line and response headers. See also [method@Message.add_header_handler] and [method@Message.add_status_code_hand... |
| got-informational | `` | none | first |  | Emitted after receiving a 1xx (Informational) response for a (client-side) message. The response_headers will be filled in with the headers associa... |
| hsts-enforced | `` | none | last |  | Emitted when [class@HSTSEnforcer] has upgraded the protocol for @msg to HTTPS as a result of matching its domain with a HSTS policy. |
| network-event | `event: Gio.SocketClientEvent, connection: Gio.IOStream` | none | first |  | Emitted to indicate that some network-related event related to @msg has occurred. This essentially proxies the [signal@Gio.SocketClient::event] sig... |
| request-certificate | `tls_connection: Gio.TlsClientConnection` | gboolean | last |  | Emitted during the @msg's connection TLS handshake when @tls_connection requests a certificate from the client. You can set the client certificate ... |
| request-certificate-password | `tls_password: Gio.TlsPassword` | gboolean | last |  | Emitted during the @msg's connection TLS handshake when @tls_connection requests a certificate password from the client. You can set the certificat... |
| restarted | `` | none | first |  | Emitted when a request that was already sent once is now being sent again. e.g. because the first attempt received a redirection response, or becau... |
| starting | `` | none | first |  | Emitted just before a message is sent. |
| wrote-body | `` | none | first |  | Emitted immediately after writing the complete body for a message. |
| wrote-body-data | `chunk_size: guint` | none | first |  | Emitted immediately after writing a portion of the message body to the network. |
| wrote-headers | `` | none | first |  | Emitted immediately after writing the request headers for a message. |

### Soup.MultipartInputStream

Parent: `Gio.FilterInputStream` ?? Implements: `Gio.PollableInputStream` ?? GType: `SoupMultipartInputStream` ?? C type: `SoupMultipartInputStream` ?? Final

Handles streams of multipart messages. This adds support for the multipart responses. For handling the multiple parts the user needs to wrap the [c...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MultipartInputStream.new(msg: Message, base_stream: Gio.InputStream) -> MultipartInputStream` | soup_multipart_input_stream_new |  | Creates a new #SoupMultipartInputStream that wraps the [class@Gio.InputStream] obtained by sending the [class@Message]. Reads should not be done di... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_headers | `MultipartInputStream.get_headers() -> MessageHeaders` | soup_multipart_input_stream_get_headers |  | Obtains the headers for the part currently being processed. Note that the [struct@MessageHeaders] that are returned are owned by the #SoupMultipart... |
| next_part | `MultipartInputStream.next_part(cancellable: Gio.Cancellable?) -> Gio.InputStream throws` | soup_multipart_input_stream_next_part |  | Obtains an input stream for the next part. When dealing with a multipart response the input stream needs to be wrapped in a #SoupMultipartInputStre... |
| next_part_async | `MultipartInputStream.next_part_async(io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | soup_multipart_input_stream_next_part_async |  | Obtains a [class@Gio.InputStream] for the next request. See [method@MultipartInputStream.next_part] for details on the workflow. |
| next_part_finish | `MultipartInputStream.next_part_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` | soup_multipart_input_stream_next_part_finish |  | Finishes an asynchronous request for the next part. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| message | Message | read, write, construct-only | The [class@Message]. |

### Soup.Server

Parent: `GObject.Object` ?? GType: `SoupServer` ?? C type: `SoupServer`

A HTTP server. #SoupServer implements a simple HTTP server. To begin, create a server using [ctor@Server.new]. Add at least one handler by calling ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Server.new(optname1: utf8, ...: void) -> Server` | soup_server_new |  | Creates a new #SoupServer. This is exactly equivalent to calling [ctor@GObject.Object.new] and specifying %SOUP_TYPE_SERVER as the type. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_iostream | `Server.accept_iostream(stream: Gio.IOStream, local_addr: Gio.SocketAddress?, remote_addr: Gio.SocketAddress?) -> gboolean throws` | soup_server_accept_iostream |  | Adds a new client stream to the @server. |
| add_auth_domain | `Server.add_auth_domain(auth_domain: AuthDomain) -> none` | soup_server_add_auth_domain |  | Adds an authentication domain to @server. Each auth domain will have the chance to require authentication for each request that comes in; normally ... |
| add_early_handler | `Server.add_early_handler(path: utf8?, callback: ServerCallback, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_server_add_early_handler |  | Adds an "early" handler to @server for requests prefixed by @path. Note that "normal" and "early" handlers are matched up together, so if you add a... |
| add_handler | `Server.add_handler(path: utf8?, callback: ServerCallback, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_server_add_handler |  | Adds a handler to @server for requests prefixed by @path. If @path is %NULL or "/", then this will be the default handler for all requests that don... |
| add_websocket_extension | `Server.add_websocket_extension(extension_type: GType) -> none` | soup_server_add_websocket_extension |  | Add support for a WebSocket extension of the given @extension_type. When a WebSocket client requests an extension of @extension_type, a new [class@... |
| add_websocket_handler | `Server.add_websocket_handler(path: utf8?, origin: utf8?, protocols: utf8?, callback: ServerWebsocketCallback, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_server_add_websocket_handler |  | Adds a WebSocket handler to @server for requests prefixed by @path. If @path is %NULL or "/", then this will be the default handler for all request... |
| disconnect | `Server.disconnect() -> none` | soup_server_disconnect |  | Closes and frees @server's listening sockets. Note that if there are currently requests in progress on @server, that they will continue to be proce... |
| get_listeners | `Server.get_listeners() -> GLib.SList` | soup_server_get_listeners |  | Gets @server's list of listening sockets. You should treat these sockets as read-only; writing to or modifiying any of these sockets may cause @ser... |
| get_tls_auth_mode | `Server.get_tls_auth_mode() -> Gio.TlsAuthenticationMode` | soup_server_get_tls_auth_mode |  | Gets the @server SSL/TLS client authentication mode. |
| get_tls_certificate | `Server.get_tls_certificate() -> Gio.TlsCertificate` | soup_server_get_tls_certificate |  | Gets the @server SSL/TLS certificate. |
| get_tls_database | `Server.get_tls_database() -> Gio.TlsDatabase` | soup_server_get_tls_database |  | Gets the @server SSL/TLS database. |
| get_uris | `Server.get_uris() -> GLib.SList` | soup_server_get_uris |  | Gets a list of URIs corresponding to the interfaces @server is listening on. These will contain IP addresses, not hostnames, and will also indicate... |
| is_https | `Server.is_https() -> gboolean` | soup_server_is_https |  | Checks whether @server is capable of https. In order for a server to run https, you must call [method@Server.set_tls_certificate], or set the [prop... |
| listen | `Server.listen(address: Gio.SocketAddress, options: ServerListenOptions) -> gboolean throws` | soup_server_listen |  | Attempts to set up @server to listen for connections on @address. If @options includes %SOUP_SERVER_LISTEN_HTTPS, and @server has been configured f... |
| listen_all | `Server.listen_all(port: guint, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_all |  | Attempts to set up @server to listen for connections on all interfaces on the system. That is, it listens on the addresses `0.0.0.0` and/or `::`, d... |
| listen_local | `Server.listen_local(port: guint, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_local |  | Attempts to set up @server to listen for connections on "localhost". That is, `127.0.0.1` and/or `::1`, depending on whether @options includes %SOU... |
| listen_socket | `Server.listen_socket(socket: Gio.Socket, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_socket |  | Attempts to set up @server to listen for connections on @socket. See [method@Server.listen] for more details. |
| pause_message | `Server.pause_message(msg: ServerMessage) -> none` | soup_server_pause_message |  | Pauses I/O on @msg. This can be used when you need to return from the server handler without having the full response ready yet. Use [method@Server... |
| remove_auth_domain | `Server.remove_auth_domain(auth_domain: AuthDomain) -> none` | soup_server_remove_auth_domain |  | Removes @auth_domain from @server. |
| remove_handler | `Server.remove_handler(path: utf8) -> none` | soup_server_remove_handler |  | Removes all handlers (early and normal) registered at @path. |
| remove_websocket_extension | `Server.remove_websocket_extension(extension_type: GType) -> none` | soup_server_remove_websocket_extension |  | Removes support for WebSocket extension of type @extension_type (or any subclass of @extension_type) from @server. |
| set_tls_auth_mode | `Server.set_tls_auth_mode(mode: Gio.TlsAuthenticationMode) -> none` | soup_server_set_tls_auth_mode |  | Sets @server's #GTlsAuthenticationMode to use for SSL/TLS client authentication. |
| set_tls_certificate | `Server.set_tls_certificate(certificate: Gio.TlsCertificate) -> none` | soup_server_set_tls_certificate |  | Sets @server up to do https, using the given SSL/TLS @certificate. |
| set_tls_database | `Server.set_tls_database(tls_database: Gio.TlsDatabase) -> none` | soup_server_set_tls_database |  | Sets @server's #GTlsDatabase to use for validating SSL/TLS client certificates. |
| unpause_message | `Server.unpause_message(msg: ServerMessage) -> none` | soup_server_unpause_message |  | Resumes I/O on @msg. Use this to resume after calling [method@Server.pause_message], or after adding a new chunk to a chunked response. I/O won't a... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| raw-paths | gboolean | read, write, construct-only | If %TRUE, percent-encoding in the Request-URI path will not be automatically decoded. |
| server-header | utf8 | read, write | Server header. If non-%NULL, the value to use for the "Server" header on [class@ServerMessage]s processed by this server. The Server header is the ... |
| tls-auth-mode | Gio.TlsAuthenticationMode | read, write | A [enum@Gio.TlsAuthenticationMode] for SSL/TLS client authentication. |
| tls-certificate | Gio.TlsCertificate | read, write | A [class@Gio.TlsCertificate[] that has a [property@Gio.TlsCertificate:private-key] set. If this is set, then the server will be able to speak https... |
| tls-database | Gio.TlsDatabase | read, write | A [class@Gio.TlsDatabase] to use for validating SSL/TLS client certificates. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| request-aborted | `message: ServerMessage` | none | first |  | Emitted when processing has failed for a message. This could mean either that it could not be read (if [signal@Server::request-read] has not been e... |
| request-finished | `message: ServerMessage` | none | first |  | Emitted when the server has finished writing a response to a request. |
| request-read | `message: ServerMessage` | none | first |  | Emitted when the server has successfully read a request. @message will have all of its request-side information filled in, and if the message was a... |
| request-started | `message: ServerMessage` | none | first |  | Emitted when the server has started reading a new request. @message will be completely blank; not even the Request-Line will have been read yet. Ab... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| request_aborted | `request_aborted(msg: ServerMessage) -> none` |  |  |  |
| request_finished | `request_finished(msg: ServerMessage) -> none` |  |  |  |
| request_read | `request_read(msg: ServerMessage) -> none` |  |  |  |
| request_started | `request_started(msg: ServerMessage) -> none` |  |  |  |

### Soup.ServerMessage

Parent: `GObject.Object` ?? GType: `SoupServerMessage` ?? C type: `SoupServerMessage` ?? Final

An HTTP server request and response pair. A SoupServerMessage represents an HTTP message that is being sent or received on a [class@Server]. [class...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_http_version | `ServerMessage.get_http_version() -> HTTPVersion` | soup_server_message_get_http_version |  | Get the HTTP version of @msg. |
| get_local_address | `ServerMessage.get_local_address() -> Gio.SocketAddress` | soup_server_message_get_local_address |  | Retrieves the [class@Gio.SocketAddress] associated with the local end of a connection. |
| get_method | `ServerMessage.get_method() -> utf8` | soup_server_message_get_method |  | Get the HTTP method of @msg. |
| get_reason_phrase | `ServerMessage.get_reason_phrase() -> utf8` | soup_server_message_get_reason_phrase |  | Get the HTTP reason phrase of @msg. |
| get_remote_address | `ServerMessage.get_remote_address() -> Gio.SocketAddress` | soup_server_message_get_remote_address |  | Retrieves the [class@Gio.SocketAddress] associated with the remote end of a connection. |
| get_remote_host | `ServerMessage.get_remote_host() -> utf8` | soup_server_message_get_remote_host |  | Retrieves the IP address associated with the remote end of a connection. |
| get_request_body | `ServerMessage.get_request_body() -> MessageBody` | soup_server_message_get_request_body |  | Get the request body of @msg. |
| get_request_headers | `ServerMessage.get_request_headers() -> MessageHeaders` | soup_server_message_get_request_headers |  | Get the request headers of @msg. |
| get_response_body | `ServerMessage.get_response_body() -> MessageBody` | soup_server_message_get_response_body |  | Get the response body of @msg. |
| get_response_headers | `ServerMessage.get_response_headers() -> MessageHeaders` | soup_server_message_get_response_headers |  | Get the response headers of @msg. |
| get_socket | `ServerMessage.get_socket() -> Gio.Socket` | soup_server_message_get_socket |  | Retrieves the [class@Gio.Socket] that @msg is associated with. If you are using this method to observe when multiple requests are made on the same ... |
| get_status | `ServerMessage.get_status() -> guint` | soup_server_message_get_status |  | Get the HTTP status code of @msg. |
| get_tls_peer_certificate | `ServerMessage.get_tls_peer_certificate() -> Gio.TlsCertificate` | soup_server_message_get_tls_peer_certificate | 3.2 | Gets the peer's #GTlsCertificate associated with @msg's connection. Note that this is not set yet during the emission of SoupServerMessage::accept-... |
| get_tls_peer_certificate_errors | `ServerMessage.get_tls_peer_certificate_errors() -> Gio.TlsCertificateFlags` | soup_server_message_get_tls_peer_certificate_errors | 3.2 | Gets the errors associated with validating @msg's TLS peer certificate. Note that this is not set yet during the emission of SoupServerMessage::acc... |
| get_uri | `ServerMessage.get_uri() -> GLib.Uri` | soup_server_message_get_uri |  | Get @msg's URI. |
| is_options_ping | `ServerMessage.is_options_ping() -> gboolean` | soup_server_message_is_options_ping |  | Gets if @msg represents an OPTIONS message with the path `*`. |
| pause | `ServerMessage.pause() -> none` | soup_server_message_pause | 3.2 | Pauses I/O on @msg. This can be used when you need to return from the server handler without having the full response ready yet. Use [method@Server... |
| set_http_version | `ServerMessage.set_http_version(version: HTTPVersion) -> none` | soup_server_message_set_http_version |  | Set the HTTP version of @msg. |
| set_redirect | `ServerMessage.set_redirect(status_code: guint, redirect_uri: utf8) -> none` | soup_server_message_set_redirect |  | Sets @msg's status_code to @status_code and adds a Location header pointing to @redirect_uri. Use this from a [class@Server] when you want to redir... |
| set_response | `ServerMessage.set_response(content_type: utf8?, resp_use: MemoryUse, resp_body: guint8?, resp_length: gsize) -> none` | soup_server_message_set_response |  | Convenience function to set the response body of a #SoupServerMessage. If @content_type is %NULL, the response body must be empty as well. |
| set_status | `ServerMessage.set_status(status_code: guint, reason_phrase: utf8?) -> none` | soup_server_message_set_status |  | Sets @msg's status code to @status_code. If @status_code is a known value and @reason_phrase is %NULL, the reason_phrase will be set automatically. |
| steal_connection | `ServerMessage.steal_connection() -> Gio.IOStream` | soup_server_message_steal_connection |  | "Steals" the HTTP connection associated with @msg from its #SoupServer. This happens immediately, regardless of the current state of the connection... |
| unpause | `ServerMessage.unpause() -> none` | soup_server_message_unpause | 3.2 | Resumes I/O on @msg. Use this to resume after calling [method@ServerMessage.pause], or after adding a new chunk to a chunked response. I/O won't ac... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| tls-peer-certificate | Gio.TlsCertificate | read | The peer's #GTlsCertificate associated with the message |
| tls-peer-certificate-errors | Gio.TlsCertificateFlags | read | The verification errors on #SoupServerMessage:tls-peer-certificate |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| accept-certificate | `tls_peer_certificate: Gio.TlsCertificate, tls_peer_errors: Gio.TlsCertificateFlags` | gboolean | last |  | Emitted during the @msg's connection TLS handshake after client TLS certificate has been received. You can return %TRUE to accept @tls_certificate ... |
| connected | `` | none | last |  | Emitted when the @msg's socket is connected and the TLS handshake completed. |
| disconnected | `` | none | last |  | Emitted when the @msg's socket is disconnected. |
| finished | `` | none | last |  | Emitted when all HTTP processing is finished for a message. (After [signal@ServerMessage::wrote-body]). |
| got-body | `` | none | last |  | Emitted after receiving the complete request body. |
| got-chunk | `chunk: GLib.Bytes` | none | first |  | Emitted after receiving a chunk of a message body. Note that "chunk" in this context means any subpiece of the body, not necessarily the specific H... |
| got-headers | `` | none | last |  | Emitted after receiving the Request-Line and request headers. |
| wrote-body | `` | none | last |  | Emitted immediately after writing the complete response body for a message. |
| wrote-body-data | `chunk_size: guint` | none | last |  | Emitted immediately after writing a portion of the message body to the network. |
| wrote-chunk | `` | none | last |  | Emitted immediately after writing a body chunk for a message. Note that this signal is not parallel to [signal@ServerMessage::got-chunk]; it is emi... |
| wrote-headers | `` | none | last |  | Emitted immediately after writing the response headers for a message. |
| wrote-informational | `` | none | last |  | Emitted immediately after writing a 1xx (Informational) response. |

### Soup.Session

Parent: `GObject.Object` ?? GType: `SoupSession` ?? C type: `SoupSession`

Soup session state object. #SoupSession is the object that controls client-side HTTP. A #SoupSession encapsulates all of the state that libsoup is ...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Session.new() -> Session` | soup_session_new |  | Creates a #SoupSession with the default options. |
| new_with_options | `Session.new_with_options(optname1: utf8, ...: void) -> Session` | soup_session_new_with_options |  | Creates a #SoupSession with the specified options. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| abort | `Session.abort() -> none` | soup_session_abort |  | Cancels all pending requests in @session and closes all idle persistent connections. |
| add_feature | `Session.add_feature(feature: SessionFeature) -> none` | soup_session_add_feature |  | Adds @feature's functionality to @session. You cannot add multiple features of the same [alias@GLib.Type] to a session. See the main #SoupSession d... |
| add_feature_by_type | `Session.add_feature_by_type(feature_type: GType) -> none` | soup_session_add_feature_by_type |  | If @feature_type is the type of a class that implements [iface@SessionFeature], this creates a new feature of that type and adds it to @session as ... |
| get_accept_language | `Session.get_accept_language() -> utf8` | soup_session_get_accept_language |  | Get the value used by @session for the "Accept-Language" header on new requests. |
| get_accept_language_auto | `Session.get_accept_language_auto() -> gboolean` | soup_session_get_accept_language_auto |  | Gets whether @session automatically sets the "Accept-Language" header on new requests. |
| get_async_result_message | `Session.get_async_result_message(result: Gio.AsyncResult) -> Message` | soup_session_get_async_result_message |  | Gets the [class@Message] of the @result asynchronous operation This is useful to get the [class@Message] of an asynchronous operation started by @s... |
| get_feature | `Session.get_feature(feature_type: GType) -> SessionFeature` | soup_session_get_feature |  | Gets the feature in @session of type @feature_type. |
| get_feature_for_message | `Session.get_feature_for_message(feature_type: GType, msg: Message) -> SessionFeature` | soup_session_get_feature_for_message |  | Gets the feature in @session of type @feature_type, provided that it is not disabled for @msg. |
| get_idle_timeout | `Session.get_idle_timeout() -> guint` | soup_session_get_idle_timeout |  | Get the timeout in seconds for idle connection lifetime currently used by @session. |
| get_local_address | `Session.get_local_address() -> Gio.InetSocketAddress` | soup_session_get_local_address |  | Get the [class@Gio.InetSocketAddress] to use for the client side of connections in @session. |
| get_max_conns | `Session.get_max_conns() -> guint` | soup_session_get_max_conns |  | Get the maximum number of connections that @session can open at once. |
| get_max_conns_per_host | `Session.get_max_conns_per_host() -> guint` | soup_session_get_max_conns_per_host |  | Get the maximum number of connections that @session can open at once to a given host. |
| get_proxy_resolver | `Session.get_proxy_resolver() -> Gio.ProxyResolver` | soup_session_get_proxy_resolver |  | Get the [iface@Gio.ProxyResolver] currently used by @session. |
| get_remote_connectable | `Session.get_remote_connectable() -> Gio.SocketConnectable` | soup_session_get_remote_connectable |  | Gets the remote connectable if one set. |
| get_timeout | `Session.get_timeout() -> guint` | soup_session_get_timeout |  | Get the timeout in seconds for socket I/O operations currently used by @session. |
| get_tls_database | `Session.get_tls_database() -> Gio.TlsDatabase` | soup_session_get_tls_database |  | Get the [class@Gio.TlsDatabase] currently used by @session. |
| get_tls_interaction | `Session.get_tls_interaction() -> Gio.TlsInteraction` | soup_session_get_tls_interaction |  | Get the [class@Gio.TlsInteraction] currently used by @session. |
| get_user_agent | `Session.get_user_agent() -> utf8` | soup_session_get_user_agent |  | Get the value used by @session for the "User-Agent" header on new requests. |
| has_feature | `Session.has_feature(feature_type: GType) -> gboolean` | soup_session_has_feature |  | Tests if @session has at a feature of type @feature_type (which can be the type of either a [iface@SessionFeature], or else a subtype of some class... |
| preconnect_async | `Session.preconnect_async(msg: Message, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_preconnect_async |  | Start a preconnection to @msg. Once the connection is done, it will remain in idle state so that it can be reused by future requests. If there's al... |
| preconnect_finish | `Session.preconnect_finish(result: Gio.AsyncResult) -> gboolean throws` | soup_session_preconnect_finish |  | Complete a preconnect async operation started with [method@Session.preconnect_async]. |
| remove_feature | `Session.remove_feature(feature: SessionFeature) -> none` | soup_session_remove_feature |  | Removes @feature's functionality from @session. |
| remove_feature_by_type | `Session.remove_feature_by_type(feature_type: GType) -> none` | soup_session_remove_feature_by_type |  | Removes all features of type @feature_type (or any subclass of @feature_type) from @session. |
| send | `Session.send(msg: Message, cancellable: Gio.Cancellable?) -> Gio.InputStream throws` | soup_session_send |  | Synchronously sends @msg and waits for the beginning of a response. On success, a [class@Gio.InputStream] will be returned which you can use to rea... |
| send_and_read | `Session.send_and_read(msg: Message, cancellable: Gio.Cancellable?) -> GLib.Bytes throws` | soup_session_send_and_read |  | Synchronously sends @msg and reads the response body. On success, a [struct@GLib.Bytes] will be returned with the response body. This function shou... |
| send_and_read_async | `Session.send_and_read_async(msg: Message, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_send_and_read_async |  | Asynchronously sends @msg and reads the response body. When @callback is called, then either @msg has been sent, and its response body read, or els... |
| send_and_read_finish | `Session.send_and_read_finish(result: Gio.AsyncResult) -> GLib.Bytes throws` | soup_session_send_and_read_finish |  | Gets the response to a [method@Session.send_and_read_async]. If successful, returns a [struct@GLib.Bytes] with the response body. |
| send_and_splice | `Session.send_and_splice(msg: Message, out_stream: Gio.OutputStream, flags: Gio.OutputStreamSpliceFlags, cancellable: Gio.Cancellable?) -> gssize throws` | soup_session_send_and_splice | 3.4 | Synchronously sends @msg and splices the response body stream into @out_stream. See [method@Session.send] for more details on the general semantics. |
| send_and_splice_async | `Session.send_and_splice_async(msg: Message, out_stream: Gio.OutputStream, flags: Gio.OutputStreamSpliceFlags, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_send_and_splice_async | 3.4 | Asynchronously sends @msg and splices the response body stream into @out_stream. When @callback is called, then either @msg has been sent and its r... |
| send_and_splice_finish | `Session.send_and_splice_finish(result: Gio.AsyncResult) -> gssize throws` | soup_session_send_and_splice_finish | 3.4 | Gets the response to a [method@Session.send_and_splice_async]. |
| send_async | `Session.send_async(msg: Message, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_send_async |  | Asynchronously sends @msg and waits for the beginning of a response. When @callback is called, then either @msg has been sent, and its response hea... |
| send_finish | `Session.send_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` | soup_session_send_finish |  | Gets the response to a [method@Session.send_async] call. If successful returns a [class@Gio.InputStream] that can be used to read the response body. |
| set_accept_language | `Session.set_accept_language(accept_language: utf8) -> none` | soup_session_set_accept_language |  | Set the value to use for the "Accept-Language" header on [class@Message]s sent from @session. If @accept_language is %NULL then no "Accept-Language... |
| set_accept_language_auto | `Session.set_accept_language_auto(accept_language_auto: gboolean) -> none` | soup_session_set_accept_language_auto |  | Set whether @session will automatically set the "Accept-Language" header on requests using a value generated from system languages based on [func@G... |
| set_idle_timeout | `Session.set_idle_timeout(timeout: guint) -> none` | soup_session_set_idle_timeout |  | Set a timeout in seconds for idle connection lifetime to be used by @session on new connections. See [property@Session:idle-timeout] for more infor... |
| set_proxy_resolver | `Session.set_proxy_resolver(proxy_resolver: Gio.ProxyResolver?) -> none` | soup_session_set_proxy_resolver |  | Set a [iface@Gio.ProxyResolver] to be used by @session on new connections. If @proxy_resolver is %NULL then no proxies will be used. See [property@... |
| set_timeout | `Session.set_timeout(timeout: guint) -> none` | soup_session_set_timeout |  | Set a timeout in seconds for socket I/O operations to be used by @session on new connections. See [property@Session:timeout] for more information. |
| set_tls_database | `Session.set_tls_database(tls_database: Gio.TlsDatabase?) -> none` | soup_session_set_tls_database |  | Set a [class@GIo.TlsDatabase] to be used by @session on new connections. If @tls_database is %NULL then certificate validation will always fail. Se... |
| set_tls_interaction | `Session.set_tls_interaction(tls_interaction: Gio.TlsInteraction?) -> none` | soup_session_set_tls_interaction |  | Set a [class@Gio.TlsInteraction] to be used by @session on new connections. If @tls_interaction is %NULL then client certificate validation will al... |
| set_user_agent | `Session.set_user_agent(user_agent: utf8) -> none` | soup_session_set_user_agent |  | Set the value to use for the "User-Agent" header on [class@Message]s sent from @session. If @user_agent has trailing whitespace, @session will appe... |
| websocket_connect_async | `Session.websocket_connect_async(msg: Message, origin: utf8?, protocols: utf8?, io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_websocket_connect_async |  | Asynchronously creates a [class@WebsocketConnection] to communicate with a remote server. All necessary WebSocket-related headers will be added to ... |
| websocket_connect_finish | `Session.websocket_connect_finish(result: Gio.AsyncResult) -> WebsocketConnection throws` | soup_session_websocket_connect_finish |  | Gets the [class@WebsocketConnection] response to a [method@Session.websocket_connect_async] call. If successful, returns a [class@WebsocketConnecti... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accept-language | utf8 | read, write | If non-%NULL, the value to use for the "Accept-Language" header on [class@Message]s sent from this session. Setting this will disable [property@Ses... |
| accept-language-auto | gboolean | read, write | If %TRUE, #SoupSession will automatically set the string for the "Accept-Language" header on every [class@Message] sent, based on the return value ... |
| idle-timeout | guint | read, write | Connection lifetime (in seconds) when idle. Any connection left idle longer than this will be closed. Although you can change this property at any ... |
| local-address | Gio.InetSocketAddress | read, write, construct-only | Sets the [class@Gio.InetSocketAddress] to use for the client side of the connection. Use this property if you want for instance to bind the local s... |
| max-conns | gint | read, write, construct-only | The maximum number of connections that the session can open at once. |
| max-conns-per-host | gint | read, write, construct-only | The maximum number of connections that the session can open at once to a given host. |
| proxy-resolver | Gio.ProxyResolver | read, write | A [iface@Gio.ProxyResolver] to use with this session. If no proxy resolver is set, then the default proxy resolver will be used. See [func@Gio.Prox... |
| remote-connectable | Gio.SocketConnectable | read, write, construct-only | Sets a socket to make outgoing connections on. This will override the default behaviour of opening TCP/IP sockets to the hosts specified in the URI... |
| timeout | guint | read, write | The timeout (in seconds) for socket I/O operations (including connecting to a server, and waiting for a reply to an HTTP request). Although you can... |
| tls-database | Gio.TlsDatabase | read, write | Sets the [class@Gio.TlsDatabase] to use for validating SSL/TLS certificates. If no certificate database is set, then the default database will be u... |
| tls-interaction | Gio.TlsInteraction | read, write | A [class@Gio.TlsInteraction] object that will be passed on to any [class@Gio.TlsConnection]s created by the session. This can be used to provide cl... |
| user-agent | utf8 | read, write | User-Agent string. If non-%NULL, the value to use for the "User-Agent" header on [class@Message]s sent from this session. RFC 2616 says: "The User-... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| request-queued | `msg: Message` | none | last |  | Emitted when a request is queued on @session. When sending a request, first [signal@Session::request-queued] is emitted, indicating that the sessio... |
| request-unqueued | `msg: Message` | none | last |  | Emitted when a request is removed from @session's queue, indicating that @session is done with it. See [signal@Session::request-queued] for a detai... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| request_queued | `request_queued(msg: Message) -> none` |  |  |  |
| request_unqueued | `request_unqueued(msg: Message) -> none` |  |  |  |

### Soup.WebsocketConnection

Parent: `GObject.Object` ?? GType: `SoupWebsocketConnection` ?? C type: `SoupWebsocketConnection` ?? Final

The WebSocket Protocol Provides support for the WebSocket protocol. To connect to a WebSocket server, create a [class@Session] and call [method@Ses...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebsocketConnection.new(stream: Gio.IOStream, uri: GLib.Uri, type: WebsocketConnectionType, origin: utf8?, protocol: utf8?, extensions: GLib.List) -> WebsocketConnection` | soup_websocket_connection_new |  | Creates a #SoupWebsocketConnection on @stream with the given active @extensions. This should be called after completing the handshake to begin usin... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `WebsocketConnection.close(code: gushort, data: utf8?) -> none` | soup_websocket_connection_close |  | Close the connection in an orderly fashion. Note that until the [signal@WebsocketConnection::closed] signal fires, the connection is not yet comple... |
| get_close_code | `WebsocketConnection.get_close_code() -> gushort` | soup_websocket_connection_get_close_code |  | Get the close code received from the WebSocket peer. This only becomes valid once the WebSocket is in the %SOUP_WEBSOCKET_STATE_CLOSED state. The v... |
| get_close_data | `WebsocketConnection.get_close_data() -> utf8` | soup_websocket_connection_get_close_data |  | Get the close data received from the WebSocket peer. This only becomes valid once the WebSocket is in the %SOUP_WEBSOCKET_STATE_CLOSED state. The d... |
| get_connection_type | `WebsocketConnection.get_connection_type() -> WebsocketConnectionType` | soup_websocket_connection_get_connection_type |  | Get the connection type (client/server) of the connection. |
| get_extensions | `WebsocketConnection.get_extensions() -> GLib.List` | soup_websocket_connection_get_extensions |  | Get the extensions chosen via negotiation with the peer. |
| get_io_stream | `WebsocketConnection.get_io_stream() -> Gio.IOStream` | soup_websocket_connection_get_io_stream |  | Get the I/O stream the WebSocket is communicating over. |
| get_keepalive_interval | `WebsocketConnection.get_keepalive_interval() -> guint` | soup_websocket_connection_get_keepalive_interval |  | Gets the keepalive interval in seconds or 0 if disabled. |
| get_max_incoming_payload_size | `WebsocketConnection.get_max_incoming_payload_size() -> guint64` | soup_websocket_connection_get_max_incoming_payload_size |  | Gets the maximum payload size allowed for incoming packets. |
| get_origin | `WebsocketConnection.get_origin() -> utf8` | soup_websocket_connection_get_origin |  | Get the origin of the WebSocket. |
| get_protocol | `WebsocketConnection.get_protocol() -> utf8` | soup_websocket_connection_get_protocol |  | Get the protocol chosen via negotiation with the peer. |
| get_state | `WebsocketConnection.get_state() -> WebsocketState` | soup_websocket_connection_get_state |  | Get the current state of the WebSocket. |
| get_uri | `WebsocketConnection.get_uri() -> GLib.Uri` | soup_websocket_connection_get_uri |  | Get the URI of the WebSocket. For servers this represents the address of the WebSocket, and for clients it is the address connected to. |
| send_binary | `WebsocketConnection.send_binary(data: guint8?, length: gsize) -> none` | soup_websocket_connection_send_binary |  | Send a binary message to the peer. If @length is 0, @data may be %NULL. The message is queued to be sent and will be sent when the main loop is run. |
| send_message | `WebsocketConnection.send_message(type: WebsocketDataType, message: GLib.Bytes) -> none` | soup_websocket_connection_send_message |  | Send a message of the given @type to the peer. Note that this method, allows to send text messages containing %NULL characters. The message is queu... |
| send_text | `WebsocketConnection.send_text(text: utf8) -> none` | soup_websocket_connection_send_text |  | Send a %NULL-terminated text (UTF-8) message to the peer. If you need to send text messages containing %NULL characters use [method@WebsocketConnec... |
| set_keepalive_interval | `WebsocketConnection.set_keepalive_interval(interval: guint) -> none` | soup_websocket_connection_set_keepalive_interval |  | Sets the interval in seconds on when to send a ping message which will serve as a keepalive message. If set to 0 the keepalive message is disabled. |
| set_max_incoming_payload_size | `WebsocketConnection.set_max_incoming_payload_size(max_incoming_payload_size: guint64) -> none` | soup_websocket_connection_set_max_incoming_payload_size |  | Sets the maximum payload size allowed for incoming packets. It does not limit the outgoing packet size. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connection-type | WebsocketConnectionType | read, write, construct-only | The type of connection (client/server). |
| extensions | gpointer | read, write, construct-only | List of [class@WebsocketExtension] objects that are active in the connection. |
| io-stream | Gio.IOStream | read, write, construct-only | The underlying IO stream the WebSocket is communicating over. The input and output streams must be pollable streams. |
| keepalive-interval | guint | read, write | Interval in seconds on when to send a ping message which will serve as a keepalive message. If set to 0 the keepalive message is disabled. |
| max-incoming-payload-size | guint64 | read, write | The maximum payload size for incoming packets. The protocol expects or 0 to not limit it. |
| origin | utf8 | read, write, construct-only | The client's Origin. |
| protocol | utf8 | read, write, construct-only | The chosen protocol, or %NULL if a protocol was not agreed upon. |
| state | WebsocketState | read | The current state of the WebSocket. |
| uri | GLib.Uri | read, write, construct-only | The URI of the WebSocket. For servers this represents the address of the WebSocket, and for clients it is the address connected to. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `` | none | first |  | Emitted when the connection has completely closed. This happens either due to an orderly close from the peer, one initiated via [method@WebsocketCo... |
| closing | `` | none | last |  | This signal will be emitted during an orderly close. |
| error | `error: GLib.Error` | none | first |  | Emitted when an error occurred on the WebSocket. This may be fired multiple times. Fatal errors will be followed by the [signal@WebsocketConnection... |
| message | `type: gint, message: GLib.Bytes` | none | first |  | Emitted when we receive a message from the peer. As a convenience, the @message data will always be %NULL-terminated, but the NUL byte will not be ... |
| pong | `message: GLib.Bytes` | none | first |  | Emitted when we receive a Pong frame (solicited or unsolicited) from the peer. As a convenience, the @message data will always be %NULL-terminated,... |

### Soup.WebsocketExtension

Parent: `GObject.Object` ?? Subclasses: `WebsocketExtensionDeflate` ?? GType: `SoupWebsocketExtension` ?? C type: `SoupWebsocketExtension` ?? Abstract

A WebSocket extension #SoupWebsocketExtension is the base class for WebSocket extension objects.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| configure | `WebsocketExtension.configure(connection_type: WebsocketConnectionType, params: GLib.HashTable?) -> gboolean throws` | soup_websocket_extension_configure |  | Configures @extension with the given @params. |
| get_request_params | `WebsocketExtension.get_request_params() -> utf8` | soup_websocket_extension_get_request_params |  | Get the parameters strings to be included in the request header. If the extension doesn't include any parameter in the request, this function retur... |
| get_response_params | `WebsocketExtension.get_response_params() -> utf8` | soup_websocket_extension_get_response_params |  | Get the parameters strings to be included in the response header. If the extension doesn't include any parameter in the response, this function ret... |
| process_incoming_message | `WebsocketExtension.process_incoming_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` | soup_websocket_extension_process_incoming_message |  | Process a message after it's received. If the payload isn't changed the given @payload is just returned, otherwise [method@GLib.Bytes.unref] is cal... |
| process_outgoing_message | `WebsocketExtension.process_outgoing_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` | soup_websocket_extension_process_outgoing_message |  | Process a message before it's sent. If the payload isn't changed the given @payload is just returned, otherwise [method@Glib.Bytes.unref] is called... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| configure | `configure(connection_type: WebsocketConnectionType, params: GLib.HashTable?) -> gboolean throws` |  |  | Configures @extension with the given @params. |
| get_request_params | `get_request_params() -> utf8` |  |  | Get the parameters strings to be included in the request header. If the extension doesn't include any parameter in the request, this function retur... |
| get_response_params | `get_response_params() -> utf8` |  |  | Get the parameters strings to be included in the response header. If the extension doesn't include any parameter in the response, this function ret... |
| process_incoming_message | `process_incoming_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` |  |  | Process a message after it's received. If the payload isn't changed the given @payload is just returned, otherwise [method@GLib.Bytes.unref] is cal... |
| process_outgoing_message | `process_outgoing_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` |  |  | Process a message before it's sent. If the payload isn't changed the given @payload is just returned, otherwise [method@Glib.Bytes.unref] is called... |

### Soup.WebsocketExtensionDeflate

Parent: `WebsocketExtension` ?? GType: `SoupWebsocketExtensionDeflate` ?? C type: `SoupWebsocketExtensionDeflate` ?? Final

A SoupWebsocketExtensionDeflate is a [class@WebsocketExtension] implementing permessage-deflate (RFC 7692). This extension is used by default in a ...

### Soup.WebsocketExtensionManager

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupWebsocketExtensionManager` ?? C type: `SoupWebsocketExtensionManager` ?? Final

SoupWebsocketExtensionManager is the [iface@SessionFeature] that handles WebSockets extensions for a [class@Session]. A #SoupWebsocketExtensionMana...

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| SessionFeature |  | 0 | 0 | 0 | Interface for miscellaneous [class@Session] features. #SoupSessionFeature is the interface used by classes that extend the functionality of a [clas... |

### Soup.SessionFeature

GType: `SoupSessionFeature` ?? C type: `SoupSessionFeature`

Interface for miscellaneous [class@Session] features. #SoupSessionFeature is the interface used by classes that extend the functionality of a [clas...

## Enums

### Soup.CacheType

GType: `SoupCacheType` ?? C type: `SoupCacheType`

The type of cache; this affects what kinds of responses will be saved.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| shared | 1 | shared | a shared cache |
| single_user | 0 | single-user | a single-user cache |

### Soup.CookieJarAcceptPolicy

GType: `SoupCookieJarAcceptPolicy` ?? C type: `SoupCookieJarAcceptPolicy`

The policy for accepting or rejecting cookies returned in responses.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| always | 0 | always | accept all cookies unconditionally. |
| grandfathered_third_party | 3 | grandfathered-third-party | accept all cookies set by the main document loaded in the application using libsoup, and from domains that have previously set at least one cookie ... |
| never | 1 | never | reject all cookies unconditionally. |
| no_third_party | 2 | no-third-party | accept all cookies set by the main document loaded in the application using libsoup. An example of the most common case, web browsers, would be: If... |

### Soup.DateFormat

GType: `SoupDateFormat` ?? C type: `SoupDateFormat`

Date formats that [func@date_time_to_string] can use. @SOUP_DATE_HTTP and @SOUP_DATE_COOKIE always coerce the time to UTC. This enum may be extende...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cookie | 2 | cookie | The format for the "Expires" timestamp in the Netscape cookie specification. Eg, "Sun, 06-Nov-1994 08:49:37 GMT". |
| http | 1 | http | RFC 1123 format, used by the HTTP "Date" header. Eg "Sun, 06 Nov 1994 08:49:37 GMT". |

### Soup.Encoding

GType: `SoupEncoding` ?? C type: `SoupEncoding`

How a message body is encoded for transport

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| byteranges | 5 | byteranges | multipart/byteranges (Reserved for future use: NOT CURRENTLY IMPLEMENTED) |
| chunked | 4 | chunked | chunked encoding (currently only supported for response) |
| content_length | 2 | content-length | Content-Length encoding |
| eof | 3 | eof | Response body ends when the connection is closed |
| none | 1 | none | no body is present (which is not the same as a 0-length body, and only occurs in certain places) |
| unrecognized | 0 | unrecognized | unknown / error |

### Soup.HTTPVersion

GType: `SoupHTTPVersion` ?? C type: `SoupHTTPVersion`

Indicates the HTTP protocol version being used.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| http_1_0 | 0 | http-1-0 | HTTP 1.0 (RFC 1945) |
| http_1_1 | 1 | http-1-1 | HTTP 1.1 (RFC 2616) |
| http_2_0 | 2 | http-2-0 | HTTP 2.0 (RFC 7540) |

### Soup.LoggerLogLevel

GType: `SoupLoggerLogLevel` ?? C type: `SoupLoggerLogLevel`

Describes the level of logging output to provide.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| body | 3 | body | Log the full headers and request/response bodies |
| headers | 2 | headers | Log the full request/response headers |
| minimal | 1 | minimal | Log the Request-Line or Status-Line and the Soup-Debug pseudo-headers |
| none | 0 | none | No logging |

### Soup.MemoryUse

GType: `SoupMemoryUse` ?? C type: `SoupMemoryUse`

The lifetime of the memory being passed.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| copy | 2 | copy | The passed-in data belongs to the caller and libsoup will copy it into new memory leaving the caller free to reuse the original memory. |
| static | 0 | static | The memory is statically allocated and constant; libsoup can use the passed-in buffer directly and not need to worry about it being modified or freed. |
| take | 1 | take | The caller has allocated the memory and libsoup will assume ownership of it and free it with [func@GLib.free]. |

### Soup.MessageHeadersType

GType: `SoupMessageHeadersType` ?? C type: `SoupMessageHeadersType`

Value passed to [ctor@MessageHeaders.new] to set certain default behaviors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multipart | 2 | multipart | multipart body part headers |
| request | 0 | request | request headers |
| response | 1 | response | response headers |

### Soup.MessagePriority

GType: `SoupMessagePriority` ?? C type: `SoupMessagePriority`

Priorities that can be set on a [class@Message] to instruct the message queue to process it before any other message with lower priority.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| high | 3 | high | High priority, a #SoupMessage with this priority will be processed before the ones with the default priority. |
| low | 1 | low | Use this for low priority messages, a #SoupMessage with the default priority will be processed first. |
| normal | 2 | normal | The default priotity, this is the priority assigned to the #SoupMessage by default. |
| very_high | 4 | very-high | The highest priority, use this for very urgent #SoupMessage as they will be the first ones to be attended. |
| very_low | 0 | very-low | The lowest priority, the messages with this priority will be the last ones to be attended. |

### Soup.SameSitePolicy

GType: `SoupSameSitePolicy` ?? C type: `SoupSameSitePolicy`

Represents the same-site policies of a cookie.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lax | 1 | lax | The cookie is withheld on cross-site requests but exposed on cross-site navigations |
| none | 0 | none | The cookie is exposed with both cross-site and same-site requests |
| strict | 2 | strict | The cookie is only exposed for same-site requests |

### Soup.SessionError

GType: `SoupSessionError` ?? C type: `SoupSessionError`

A #SoupSession error.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| encoding | 1 | encoding | the server's response was in an unsupported format |
| message_already_in_queue | 6 | message-already-in-queue | the message is already in the session queue. Messages can only be reused after unqueued. |
| parsing | 0 | parsing | the server's response could not be parsed |
| redirect_bad_uri | 5 | redirect-bad-uri | failed to redirect message because Location header contains an invalid URI |
| redirect_no_location | 4 | redirect-no-location | failed to redirect message because Location header was missing or empty in response |
| too_many_redirects | 2 | too-many-redirects | the message has been redirected too many times |
| too_many_restarts | 3 | too-many-restarts | the message has been restarted too many times |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_session_error_quark |  | Registers error quark for SoupSession if needed. |

### Soup.Status

GType: `SoupStatus` ?? C type: `SoupStatus`

These represent the known HTTP status code values, plus various network and internal errors. Note that no libsoup functions take or return this typ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accepted | 202 | accepted | 202 Accepted (HTTP) |
| bad_gateway | 502 | bad-gateway | 502 Bad Gateway (HTTP) |
| bad_request | 400 | bad-request | 400 Bad Request (HTTP) |
| conflict | 409 | conflict | 409 Conflict (HTTP) |
| continue | 100 | continue | 100 Continue (HTTP) |
| created | 201 | created | 201 Created (HTTP) |
| expectation_failed | 417 | expectation-failed | 417 Expectation Failed (HTTP) |
| failed_dependency | 424 | failed-dependency | 424 Failed Dependency (WebDAV) |
| forbidden | 403 | forbidden | 403 Forbidden (HTTP) |
| found | 302 | found | 302 Found (HTTP) |
| gateway_timeout | 504 | gateway-timeout | 504 Gateway Timeout (HTTP) |
| gone | 410 | gone | 410 Gone (HTTP) |
| http_version_not_supported | 505 | http-version-not-supported | 505 HTTP Version Not Supported (HTTP) |
| insufficient_storage | 507 | insufficient-storage | 507 Insufficient Storage (WebDAV) |
| internal_server_error | 500 | internal-server-error | 500 Internal Server Error (HTTP) |
| invalid_range | 416 | invalid-range | shorter alias for %SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE |
| length_required | 411 | length-required | 411 Length Required (HTTP) |
| locked | 423 | locked | 423 Locked (WebDAV) |
| method_not_allowed | 405 | method-not-allowed | 405 Method Not Allowed (HTTP) |
| misdirected_request | 421 | misdirected-request | 421 Misdirected Request |
| moved_permanently | 301 | moved-permanently | 301 Moved Permanently (HTTP) |
| moved_temporarily | 302 | moved-temporarily | 302 Moved Temporarily (old name, RFC 2068) |
| multi_status | 207 | multi-status | 207 Multi-Status (WebDAV) |
| multiple_choices | 300 | multiple-choices | 300 Multiple Choices (HTTP) |
| no_content | 204 | no-content | 204 No Content (HTTP) |
| non_authoritative | 203 | non-authoritative | 203 Non-Authoritative Information (HTTP) |
| none | 0 | none | No status available. (Eg, the message has not been sent yet) |
| not_acceptable | 406 | not-acceptable | 406 Not Acceptable (HTTP) |
| not_appearing_in_this_protocol | 306 | not-appearing-in-this-protocol | 306 [Unused] (HTTP) |
| not_extended | 510 | not-extended | 510 Not Extended (RFC 2774) |
| not_found | 404 | not-found | 404 Not Found (HTTP) |
| not_implemented | 501 | not-implemented | 501 Not Implemented (HTTP) |
| not_modified | 304 | not-modified | 304 Not Modified (HTTP) |
| ok | 200 | ok | 200 Success (HTTP). Also used by many lower-level soup routines to indicate success. |
| partial_content | 206 | partial-content | 206 Partial Content (HTTP) |
| payment_required | 402 | payment-required | 402 Payment Required (HTTP) |
| permanent_redirect | 308 | permanent-redirect | 308 Permanent Redirect (HTTP) |
| precondition_failed | 412 | precondition-failed | 412 Precondition Failed (HTTP) |
| processing | 102 | processing | 102 Processing (WebDAV) |
| proxy_authentication_required | 407 | proxy-authentication-required | 407 Proxy Authentication Required (HTTP) |
| proxy_unauthorized | 407 | proxy-unauthorized | shorter alias for %SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED |
| request_entity_too_large | 413 | request-entity-too-large | 413 Request Entity Too Large (HTTP) |
| request_timeout | 408 | request-timeout | 408 Request Timeout (HTTP) |
| request_uri_too_long | 414 | request-uri-too-long | 414 Request-URI Too Long (HTTP) |
| requested_range_not_satisfiable | 416 | requested-range-not-satisfiable | 416 Requested Range Not Satisfiable (HTTP) |
| reset_content | 205 | reset-content | 205 Reset Content (HTTP) |
| see_other | 303 | see-other | 303 See Other (HTTP) |
| service_unavailable | 503 | service-unavailable | 503 Service Unavailable (HTTP) |
| switching_protocols | 101 | switching-protocols | 101 Switching Protocols (HTTP) |
| temporary_redirect | 307 | temporary-redirect | 307 Temporary Redirect (HTTP) |
| unauthorized | 401 | unauthorized | 401 Unauthorized (HTTP) |
| unprocessable_entity | 422 | unprocessable-entity | 422 Unprocessable Entity (WebDAV) |
| unsupported_media_type | 415 | unsupported-media-type | 415 Unsupported Media Type (HTTP) |
| use_proxy | 305 | use-proxy | 305 Use Proxy (HTTP) |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_phrase | `get_phrase(status_code: guint) -> utf8` | soup_status_get_phrase |  | Looks up the stock HTTP description of @status_code. *There is no reason for you to ever use this function.* If you wanted the textual description ... |

### Soup.TLDError

GType: `SoupTLDError` ?? C type: `SoupTLDError`

Error codes for %SOUP_TLD_ERROR.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_hostname | 0 | invalid-hostname | A hostname was syntactically invalid. |
| is_ip_address | 1 | is-ip-address | The passed-in "hostname" was actually an IP address (and thus has no base domain or public suffix). |
| no_base_domain | 3 | no-base-domain | The passed-in hostname has no recognized public suffix. |
| no_psl_data | 4 | no-psl-data | The Public Suffix List was not available. |
| not_enough_domains | 2 | not-enough-domains | The passed-in hostname did not have enough components. Eg, calling [func@tld_get_base_domain] on <literal>"co.uk"</literal>. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_tld_error_quark |  | Registers error quark for soup_tld_get_base_domain() if needed. |

### Soup.URIComponent

GType: `SoupURIComponent` ?? C type: `SoupURIComponent`

Enum values passed to [func@uri_copy] to indicate the components of the URI that should be updated with the given values.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| auth_params | 4 | auth-params | the URI authentication parameters component |
| fragment | 9 | fragment | the URI fragment component |
| host | 5 | host | the URI host component |
| none | 0 | none | no component |
| password | 3 | password | the URI password component |
| path | 7 | path | the URI path component |
| port | 6 | port | the URI port component |
| query | 8 | query | the URI query component |
| scheme | 1 | scheme | the URI scheme component |
| user | 2 | user | the URI user component |

### Soup.WebsocketCloseCode

GType: `SoupWebsocketCloseCode` ?? C type: `SoupWebsocketCloseCode`

Pre-defined close codes that can be passed to [method@WebsocketConnection.close] or received from [method@WebsocketConnection.get_close_code]. Howe...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| abnormal | 1006 | abnormal | reserved value indicating that the connection was closed abnormally; must not be sent. |
| bad_data | 1007 | bad-data | the endpoint received data that was invalid (eg, non-UTF-8 data in a text message). |
| going_away | 1001 | going-away | the client/server is going away |
| no_extension | 1010 | no-extension | the client is closing the connection because the server failed to negotiate a required extension. |
| no_status | 1005 | no-status | reserved value indicating that no close code was present; must not be sent. |
| normal | 1000 | normal | a normal, non-error close |
| policy_violation | 1008 | policy-violation | generic error code indicating some sort of policy violation. |
| protocol_error | 1002 | protocol-error | a protocol error occurred |
| server_error | 1011 | server-error | the server is closing the connection because it was unable to fulfill the request. |
| tls_handshake | 1015 | tls-handshake | reserved value indicating that the TLS handshake failed; must not be sent. |
| too_big | 1009 | too-big | the endpoint received a message that is too big to process. |
| unsupported_data | 1003 | unsupported-data | the endpoint received data of a type that it does not support. |

### Soup.WebsocketConnectionType

GType: `SoupWebsocketConnectionType` ?? C type: `SoupWebsocketConnectionType`

The type of a [class@WebsocketConnection].

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| client | 1 | client | a client-side connection |
| server | 2 | server | a server-side connection |
| unknown | 0 | unknown | unknown/invalid connection |

### Soup.WebsocketDataType

GType: `SoupWebsocketDataType` ?? C type: `SoupWebsocketDataType`

The type of data contained in a [signal@WebsocketConnection::message] signal.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| binary | 2 | binary | binary data |
| text | 1 | text | UTF-8 text |

### Soup.WebsocketError

GType: `SoupWebsocketError` ?? C type: `SoupWebsocketError`

WebSocket-related errors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_handshake | 2 | bad-handshake | the WebSocket handshake failed because some detail was invalid (eg, incorrect accept key). |
| bad_origin | 3 | bad-origin | the WebSocket handshake failed because the "Origin" header was not an allowed value. |
| failed | 0 | failed | a generic error |
| not_websocket | 1 | not-websocket | attempted to handshake with a server that does not appear to understand WebSockets. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_websocket_error_quark |  | Registers error quark for SoupWebsocket if needed. |

### Soup.WebsocketState

GType: `SoupWebsocketState` ?? C type: `SoupWebsocketState`

The state of the WebSocket connection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| closed | 3 | closed | the connection is completely closed down |
| closing | 2 | closing | the connection is in the process of closing down; messages may be received, but not sent |
| open | 1 | open | the connection is ready to send messages |

## Flags

### Soup.Cacheability

GType: `SoupCacheability` ?? C type: `SoupCacheability`

Indicates if a message should or shouldn't be cached.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cacheable | 1 | cacheable | The message should be cached |
| invalidates | 4 | invalidates | The messages cache should be invalidated |
| uncacheable | 2 | uncacheable | The message shouldn't be cached |
| validates | 8 | validates | The messages cache should be updated |

### Soup.Expectation

GType: `SoupExpectation` ?? C type: `SoupExpectation`

Represents the parsed value of the "Expect" header.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| continue | 2 | continue | "100-continue" |
| unrecognized | 1 | unrecognized | any unrecognized expectation |

### Soup.MessageFlags

GType: `SoupMessageFlags` ?? C type: `SoupMessageFlags`

Various flags that can be set on a #SoupMessage to alter its behavior.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| collect_metrics | 32 | collect-metrics | Metrics will be collected for this message. |
| do_not_use_auth_cache | 16 | do-not-use-auth-cache | The [class@AuthManager] should not use the credentials cache for this message, neither to use cached credentials to automatically authenticate this... |
| idempotent | 8 | idempotent | The message is considered idempotent, regardless its [property@Message:method], and allows reuse of existing idle connections, instead of always re... |
| new_connection | 4 | new-connection | Requests that the message should be sent on a newly-created connection, not reusing an existing persistent connection. Note that messages with non-... |
| no_redirect | 2 | no-redirect | The session should not follow redirect (3xx) responses received by this message. |

### Soup.ServerListenOptions

GType: `SoupServerListenOptions` ?? C type: `SoupServerListenOptions`

Options to pass to [method@Server.listen], etc. %SOUP_SERVER_LISTEN_IPV4_ONLY and %SOUP_SERVER_LISTEN_IPV6_ONLY only make sense with [method@Server...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| https | 1 | https | Listen for https connections rather than plain http. |
| ipv4_only | 2 | ipv4-only | Only listen on IPv4 interfaces. |
| ipv6_only | 4 | ipv6-only | Only listen on IPv6 interfaces. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AuthClass |  | 0 | 0 | 0 | %TRUE if @auth is still a valid (but potentially unauthenticated) #SoupAuth. %FALSE if something about @auth_params could not be parsed or incorpor... |
| AuthDomainBasicClass |  | 0 | 0 | 0 |  |
| AuthDomainClass |  | 0 | 0 | 0 | a #SoupAuthDomain |
| AuthDomainDigestClass |  | 0 | 0 | 0 |  |
| AuthManagerClass |  | 0 | 0 | 0 |  |
| CacheClass |  | 0 | 0 | 0 |  |
| ContentDecoderClass |  | 0 | 0 | 0 |  |
| ContentSnifferClass |  | 0 | 0 | 0 |  |
| Cookie |  | 0 | 0 | 26 | Implements HTTP cookies, as described by RFC 6265. To have a [class@Session] handle cookies for your appliction automatically, use a [class@CookieJ... |
| CookieJarClass |  | 0 | 0 | 0 | %TRUE if @jar storage is persistent or %FALSE otherwise. |
| CookieJarDBClass |  | 0 | 0 | 0 |  |
| CookieJarTextClass |  | 0 | 0 | 0 |  |
| HSTSEnforcerClass |  | 0 | 0 | 0 | Class structure for #SoupHSTSEnforcer. |
| HSTSEnforcerDBClass |  | 0 | 0 | 0 |  |
| HSTSPolicy |  | 0 | 0 | 13 | #SoupHSTSPolicy implements HTTP policies, as described by RFC 6797. @domain represents the host that this policy applies to. The domain must be IDN... |
| LoggerClass |  | 0 | 0 | 0 |  |
| MessageBody |  | 0 | 0 | 14 | #SoupMessageBody represents the request or response body of a [class@Message]. Note that while @length always reflects the full length of the messa... |
| MessageClass |  | 0 | 0 | 0 |  |
| MessageHeaders |  | 0 | 0 | 30 | The HTTP message headers associated with a request or response. |
| MessageHeadersIter |  | 0 | 0 | 2 | An opaque type used to iterate over a %SoupMessageHeaders structure. After intializing the iterator with [func@MessageHeadersIter.init], call [meth... |
| MessageMetrics |  | 0 | 0 | 17 | Contains metrics collected while loading a [class@Message] either from the network or the disk cache. Metrics are not collected by default for a [c... |
| Multipart |  | 0 | 0 | 9 | Represents a multipart HTTP message body, parsed according to the syntax of RFC 2046. Of particular interest to HTTP are `multipart/byte-ranges` an... |
| MultipartInputStreamClass |  | 0 | 0 | 0 |  |
| Range |  | 0 | 0 | 0 | Represents a byte range as used in the Range header. If @end is non-negative, then @start and @end represent the bounds of of the range, counting f... |
| ServerClass |  | 0 | 0 | 0 |  |
| ServerMessageClass |  | 0 | 0 | 0 |  |
| SessionClass |  | 0 | 0 | 0 |  |
| SessionFeatureInterface |  | 0 | 0 | 0 | The interface implemented by [iface@SessionFeature]s. |
| WebsocketConnectionClass |  | 0 | 0 | 0 | The abstract base class for [class@WebsocketConnection]. |
| WebsocketExtensionClass |  | 0 | 0 | 0 | The class structure for the #SoupWebsocketExtension. |
| WebsocketExtensionDeflateClass |  | 0 | 0 | 0 |  |
| WebsocketExtensionManagerClass |  | 0 | 0 | 0 |  |

### Soup.AuthClass

C type: `SoupAuthClass`

%TRUE if @auth is still a valid (but potentially unauthenticated) #SoupAuth. %FALSE if something about @auth_params could not be parsed or incorpor...

#### Fields

| Field | Type |
| --- | --- |
| authenticate | none |
| can_authenticate | gboolean |
| get_authorization | utf8 |
| get_protection_space | GLib.SList |
| is_authenticated | gboolean |
| is_ready | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| scheme_name | utf8 |
| strength | guint |
| update | gboolean |

### Soup.AuthDomainBasicClass

C type: `SoupAuthDomainBasicClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | AuthDomainClass |

### Soup.AuthDomainClass

C type: `SoupAuthDomainClass`

a #SoupAuthDomain

#### Fields

| Field | Type |
| --- | --- |
| accepts | utf8 |
| challenge | utf8 |
| check_password | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Soup.AuthDomainDigestClass

C type: `SoupAuthDomainDigestClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | AuthDomainClass |

### Soup.AuthManagerClass

C type: `SoupAuthManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.CacheClass

C type: `SoupCacheClass`

#### Fields

| Field | Type |
| --- | --- |
| get_cacheability | Cacheability |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Soup.ContentDecoderClass

C type: `SoupContentDecoderClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.ContentSnifferClass

C type: `SoupContentSnifferClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.Cookie

GType: `SoupCookie` ?? C type: `SoupCookie`

Implements HTTP cookies, as described by RFC 6265. To have a [class@Session] handle cookies for your appliction automatically, use a [class@CookieJ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Cookie.new(name: utf8, value: utf8, domain: utf8, path: utf8, max_age: gint) -> Cookie` | soup_cookie_new |  | Creates a new #SoupCookie with the given attributes. Use [method@Cookie.set_secure] and [method@Cookie.set_http_only] if you need to set those attr... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(header: utf8, origin: GLib.Uri?) -> Cookie` | soup_cookie_parse |  | Parses @header and returns a #SoupCookie. If @header contains multiple cookies, only the first one will be parsed. If @header does not have "path" ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| applies_to_uri | `Cookie.applies_to_uri(uri: GLib.Uri) -> gboolean` | soup_cookie_applies_to_uri |  | Tests if @cookie should be sent to @uri. (At the moment, this does not check that @cookie's domain matches @uri, because it assumes that the caller... |
| copy | `Cookie.copy() -> Cookie` | soup_cookie_copy |  | Copies @cookie. |
| domain_matches | `Cookie.domain_matches(host: utf8) -> gboolean` | soup_cookie_domain_matches |  | Checks if the @cookie's domain and @host match. The domains match if @cookie should be sent when making a request to @host, or that @cookie should ... |
| equal | `Cookie.equal(cookie2: Cookie) -> gboolean` | soup_cookie_equal |  | Tests if @cookie1 and @cookie2 are equal. Note that currently, this does not check that the cookie domains match. This may change in the future. |
| free | `Cookie.free() -> none` | soup_cookie_free |  | Frees @cookie. |
| get_domain | `Cookie.get_domain() -> utf8` | soup_cookie_get_domain |  | Gets @cookie's domain. |
| get_expires | `Cookie.get_expires() -> GLib.DateTime` | soup_cookie_get_expires |  | Gets @cookie's expiration time. |
| get_http_only | `Cookie.get_http_only() -> gboolean` | soup_cookie_get_http_only |  | Gets @cookie's HttpOnly attribute. |
| get_name | `Cookie.get_name() -> utf8` | soup_cookie_get_name |  | Gets @cookie's name. |
| get_path | `Cookie.get_path() -> utf8` | soup_cookie_get_path |  | Gets @cookie's path. |
| get_same_site_policy | `Cookie.get_same_site_policy() -> SameSitePolicy` | soup_cookie_get_same_site_policy |  | Returns the same-site policy for this cookie. |
| get_secure | `Cookie.get_secure() -> gboolean` | soup_cookie_get_secure |  | Gets @cookie's secure attribute. |
| get_value | `Cookie.get_value() -> utf8` | soup_cookie_get_value |  | Gets @cookie's value. |
| set_domain | `Cookie.set_domain(domain: utf8) -> none` | soup_cookie_set_domain |  | Sets @cookie's domain to @domain. |
| set_expires | `Cookie.set_expires(expires: GLib.DateTime) -> none` | soup_cookie_set_expires |  | Sets @cookie's expiration time to @expires. If @expires is %NULL, @cookie will be a session cookie and will expire at the end of the client's sessi... |
| set_http_only | `Cookie.set_http_only(http_only: gboolean) -> none` | soup_cookie_set_http_only |  | Sets @cookie's HttpOnly attribute to @http_only. If %TRUE, @cookie will be marked as "http only", meaning it should not be exposed to web page scri... |
| set_max_age | `Cookie.set_max_age(max_age: gint) -> none` | soup_cookie_set_max_age |  | Sets @cookie's max age to @max_age. If @max_age is -1, the cookie is a session cookie, and will expire at the end of the client's session. Otherwis... |
| set_name | `Cookie.set_name(name: utf8) -> none` | soup_cookie_set_name |  | Sets @cookie's name to @name. |
| set_path | `Cookie.set_path(path: utf8) -> none` | soup_cookie_set_path |  | Sets @cookie's path to @path. |
| set_same_site_policy | `Cookie.set_same_site_policy(policy: SameSitePolicy) -> none` | soup_cookie_set_same_site_policy |  | When used in conjunction with [method@CookieJar.get_cookie_list_with_same_site_info] this sets the policy of when this cookie should be exposed. |
| set_secure | `Cookie.set_secure(secure: gboolean) -> none` | soup_cookie_set_secure |  | Sets @cookie's secure attribute to @secure. If %TRUE, @cookie will only be transmitted from the client to the server over secure (https) connections. |
| set_value | `Cookie.set_value(value: utf8) -> none` | soup_cookie_set_value |  | Sets @cookie's value to @value. |
| to_cookie_header | `Cookie.to_cookie_header() -> utf8` | soup_cookie_to_cookie_header |  | Serializes @cookie in the format used by the Cookie header (ie, for returning a cookie from a [class@Session] to a server). |
| to_set_cookie_header | `Cookie.to_set_cookie_header() -> utf8` | soup_cookie_to_set_cookie_header |  | Serializes @cookie in the format used by the Set-Cookie header. i.e. for sending a cookie from a [class@Server] to a client. |

### Soup.CookieJarClass

C type: `SoupCookieJarClass`

%TRUE if @jar storage is persistent or %FALSE otherwise.

#### Fields

| Field | Type |
| --- | --- |
| changed | none |
| is_persistent | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| save | none |

### Soup.CookieJarDBClass

C type: `SoupCookieJarDBClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | CookieJarClass |

### Soup.CookieJarTextClass

C type: `SoupCookieJarTextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | CookieJarClass |

### Soup.HSTSEnforcerClass

C type: `SoupHSTSEnforcerClass`

Class structure for #SoupHSTSEnforcer.

#### Fields

| Field | Type |
| --- | --- |
| changed | none |
| has_valid_policy | gboolean |
| is_persistent | gboolean |
| padding | gpointer |
| parent_class | GObject.ObjectClass |

### Soup.HSTSEnforcerDBClass

C type: `SoupHSTSEnforcerDBClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | HSTSEnforcerClass |

### Soup.HSTSPolicy

GType: `SoupHSTSPolicy` ?? C type: `SoupHSTSPolicy`

#SoupHSTSPolicy implements HTTP policies, as described by RFC 6797. @domain represents the host that this policy applies to. The domain must be IDN...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HSTSPolicy.new(domain: utf8, max_age: gulong, include_subdomains: gboolean) -> HSTSPolicy` | soup_hsts_policy_new |  | Creates a new #SoupHSTSPolicy with the given attributes. @domain is a domain on which the strict transport security policy represented by this obje... |
| new_from_response | `HSTSPolicy.new_from_response(msg: Message) -> HSTSPolicy` | soup_hsts_policy_new_from_response |  | Parses @msg's first "Strict-Transport-Security" response header and returns a #SoupHSTSPolicy. |
| new_full | `HSTSPolicy.new_full(domain: utf8, max_age: gulong, expires: GLib.DateTime, include_subdomains: gboolean) -> HSTSPolicy` | soup_hsts_policy_new_full |  | Full version of [ctor@HSTSPolicy.new], to use with an existing expiration date. See [ctor@HSTSPolicy.new] for details. |
| new_session_policy | `HSTSPolicy.new_session_policy(domain: utf8, include_subdomains: gboolean) -> HSTSPolicy` | soup_hsts_policy_new_session_policy |  | Creates a new session #SoupHSTSPolicy with the given attributes. A session policy is a policy that is valid during the lifetime of the [class@HSTSE... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `HSTSPolicy.copy() -> HSTSPolicy` | soup_hsts_policy_copy |  | Copies @policy. |
| equal | `HSTSPolicy.equal(policy2: HSTSPolicy) -> gboolean` | soup_hsts_policy_equal |  | Tests if @policy1 and @policy2 are equal. |
| free | `HSTSPolicy.free() -> none` | soup_hsts_policy_free |  | Frees @policy. |
| get_domain | `HSTSPolicy.get_domain() -> utf8` | soup_hsts_policy_get_domain |  | Gets @policy's domain. |
| get_expires | `HSTSPolicy.get_expires() -> GLib.DateTime` | soup_hsts_policy_get_expires |  | Returns the expiration date for @policy. |
| get_max_age | `HSTSPolicy.get_max_age() -> gulong` | soup_hsts_policy_get_max_age |  | Returns the max age for @policy. |
| includes_subdomains | `HSTSPolicy.includes_subdomains() -> gboolean` | soup_hsts_policy_includes_subdomains |  | Gets whether @policy include its subdomains. |
| is_expired | `HSTSPolicy.is_expired() -> gboolean` | soup_hsts_policy_is_expired |  | Gets whether @policy is expired. Permanent policies never expire. |
| is_session_policy | `HSTSPolicy.is_session_policy() -> gboolean` | soup_hsts_policy_is_session_policy |  | Gets whether @policy is a non-permanent, non-expirable session policy. See [ctor@HSTSPolicy.new_session_policy] for details. |

### Soup.LoggerClass

C type: `SoupLoggerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.MessageBody

GType: `SoupMessageBody` ?? C type: `SoupMessageBody`

#SoupMessageBody represents the request or response body of a [class@Message]. Note that while @length always reflects the full length of the messa...

#### Fields

| Field | Type |
| --- | --- |
| data | guint8 |
| length | gint64 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MessageBody.new() -> MessageBody` | soup_message_body_new |  | Creates a new #SoupMessageBody. [class@Message] uses this internally; you will not normally need to call it yourself. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `MessageBody.append(use: MemoryUse, data: guint8, length: gsize) -> none` | soup_message_body_append |  | Appends @length bytes from @data to @body according to @use. |
| append_bytes | `MessageBody.append_bytes(buffer: GLib.Bytes) -> none` | soup_message_body_append_bytes |  | Appends the data from @buffer to @body. |
| append_take | `MessageBody.append_take(data: guint8, length: gsize) -> none` | soup_message_body_append_take |  | Appends @length bytes from @data to @body. This function is exactly equivalent to [method@MessageBody.append] with %SOUP_MEMORY_TAKE as second argu... |
| complete | `MessageBody.complete() -> none` | soup_message_body_complete |  | Tags @body as being complete. Call this when using chunked encoding after you have appended the last chunk. |
| flatten | `MessageBody.flatten() -> GLib.Bytes` | soup_message_body_flatten |  | Fills in @body's data field with a buffer containing all of the data in @body. Adds an additional `\0` byte not counted by @body's length field. |
| get_accumulate | `MessageBody.get_accumulate() -> gboolean` | soup_message_body_get_accumulate |  | Gets the accumulate flag on @body. See [method@MessageBody.set_accumulate. for details. |
| get_chunk | `MessageBody.get_chunk(offset: gint64) -> GLib.Bytes` | soup_message_body_get_chunk |  | Gets a [struct@GLib.Bytes] containing data from @body starting at @offset. The size of the returned chunk is unspecified. You can iterate through t... |
| got_chunk | `MessageBody.got_chunk(chunk: GLib.Bytes) -> none` | soup_message_body_got_chunk |  | Handles the #SoupMessageBody part of receiving a chunk of data from the network. Normally this means appending @chunk to @body, exactly as with [me... |
| ref | `MessageBody.ref() -> MessageBody` | soup_message_body_ref |  | Atomically increments the reference count of @body by one. |
| set_accumulate | `MessageBody.set_accumulate(accumulate: gboolean) -> none` | soup_message_body_set_accumulate |  | Sets or clears the accumulate flag on @body. (The default value is %TRUE.) If set to %FALSE, @body's data field will not be filled in after the bod... |
| truncate | `MessageBody.truncate() -> none` | soup_message_body_truncate |  | Deletes all of the data in @body. |
| unref | `MessageBody.unref() -> none` | soup_message_body_unref |  | Atomically decrements the reference count of @body by one. When the reference count reaches zero, the resources allocated by @body are freed |
| wrote_chunk | `MessageBody.wrote_chunk(chunk: GLib.Bytes) -> none` | soup_message_body_wrote_chunk |  | Handles the #SoupMessageBody part of writing a chunk of data to the network. Normally this is a no-op, but if you have set @body's accumulate flag ... |

### Soup.MessageClass

C type: `SoupMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.MessageHeaders

GType: `SoupMessageHeaders` ?? C type: `SoupMessageHeaders`

The HTTP message headers associated with a request or response.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MessageHeaders.new(type: MessageHeadersType) -> MessageHeaders` | soup_message_headers_new |  | Creates a #SoupMessageHeaders. ([class@Message] does this automatically for its own headers. You would only need to use this method if you are manu... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `MessageHeaders.append(name: utf8, value: utf8) -> none` | soup_message_headers_append |  | Appends a new header with name @name and value @value to @hdrs. (If there is an existing header with name @name, then this creates a second one, wh... |
| clean_connection_headers | `MessageHeaders.clean_connection_headers() -> none` | soup_message_headers_clean_connection_headers |  | Removes all the headers listed in the Connection header. |
| clear | `MessageHeaders.clear() -> none` | soup_message_headers_clear |  | Clears @hdrs. |
| foreach | `MessageHeaders.foreach(func: MessageHeadersForeachFunc, user_data: gpointer?) -> none` | soup_message_headers_foreach |  | Calls @func once for each header value in @hdrs. Beware that unlike [method@MessageHeaders.get_list], this processes the headers in exactly the way... |
| free_ranges | `MessageHeaders.free_ranges(ranges: Range) -> none` | soup_message_headers_free_ranges |  | Frees the array of ranges returned from [method@MessageHeaders.get_ranges]. |
| get_content_disposition | `MessageHeaders.get_content_disposition(disposition: out utf8, params: out GLib.HashTable) -> gboolean` | soup_message_headers_get_content_disposition |  | Looks up the "Content-Disposition" header in @hdrs, parses it, and returns its value in *@disposition and *@params. @params can be %NULL if you are... |
| get_content_length | `MessageHeaders.get_content_length() -> gint64` | soup_message_headers_get_content_length |  | Gets the message body length that @hdrs declare. This will only be non-0 if [method@MessageHeaders.get_encoding] returns %SOUP_ENCODING_CONTENT_LEN... |
| get_content_range | `MessageHeaders.get_content_range(start: out gint64, end: out gint64, total_length: out gint64?) -> gboolean` | soup_message_headers_get_content_range |  | Parses @hdrs's Content-Range header and returns it in @start, @end, and @total_length. If the total length field in the header was specified as "*"... |
| get_content_type | `MessageHeaders.get_content_type(params: out GLib.HashTable?) -> utf8` | soup_message_headers_get_content_type |  | Looks up the "Content-Type" header in @hdrs, parses it, and returns its value in *@content_type and *@params. @params can be %NULL if you are only ... |
| get_encoding | `MessageHeaders.get_encoding() -> Encoding` | soup_message_headers_get_encoding |  | Gets the message body encoding that @hdrs declare. This may not always correspond to the encoding used on the wire; eg, a HEAD response may declare... |
| get_expectations | `MessageHeaders.get_expectations() -> Expectation` | soup_message_headers_get_expectations |  | Gets the expectations declared by @hdrs's "Expect" header. Currently this will either be %SOUP_EXPECTATION_CONTINUE or %SOUP_EXPECTATION_UNRECOGNIZED. |
| get_headers_type | `MessageHeaders.get_headers_type() -> MessageHeadersType` | soup_message_headers_get_headers_type |  | Gets the type of headers. |
| get_list | `MessageHeaders.get_list(name: utf8) -> utf8` | soup_message_headers_get_list |  | Gets the value of header @name in @hdrs. Use this for headers whose values are comma-delimited lists, and which are therefore allowed to appear mul... |
| get_one | `MessageHeaders.get_one(name: utf8) -> utf8` | soup_message_headers_get_one |  | Gets the value of header @name in @hdrs. Use this for headers whose values are *not* comma-delimited lists, and which therefore can only appear at ... |
| get_ranges | `MessageHeaders.get_ranges(total_length: gint64, ranges: out Range, length: out gint) -> gboolean` | soup_message_headers_get_ranges |  | Parses @hdrs's Range header and returns an array of the requested byte ranges. The returned array must be freed with [method@MessageHeaders.free_ra... |
| header_contains | `MessageHeaders.header_contains(name: utf8, token: utf8) -> gboolean` | soup_message_headers_header_contains |  | Checks whether the list-valued header @name is present in @hdrs, and contains a case-insensitive match for @token. (If @name is present in @hdrs, t... |
| header_equals | `MessageHeaders.header_equals(name: utf8, value: utf8) -> gboolean` | soup_message_headers_header_equals |  | Checks whether the header @name is present in @hdrs and is (case-insensitively) equal to @value. |
| ref | `MessageHeaders.ref() -> MessageHeaders` | soup_message_headers_ref |  | Atomically increments the reference count of @hdrs by one. |
| remove | `MessageHeaders.remove(name: utf8) -> none` | soup_message_headers_remove |  | Removes @name from @hdrs. If there are multiple values for @name, they are all removed. |
| replace | `MessageHeaders.replace(name: utf8, value: utf8) -> none` | soup_message_headers_replace |  | Replaces the value of the header @name in @hdrs with @value. See also [method@MessageHeaders.append]. The caller is expected to make sure that @nam... |
| set_content_disposition | `MessageHeaders.set_content_disposition(disposition: utf8, params: GLib.HashTable?) -> none` | soup_message_headers_set_content_disposition |  | Sets the "Content-Disposition" header in @hdrs to @disposition, optionally with additional parameters specified in @params. See [method@MessageHead... |
| set_content_length | `MessageHeaders.set_content_length(content_length: gint64) -> none` | soup_message_headers_set_content_length |  | Sets the message body length that @hdrs will declare, and sets @hdrs's encoding to %SOUP_ENCODING_CONTENT_LENGTH. You do not normally need to call ... |
| set_content_range | `MessageHeaders.set_content_range(start: gint64, end: gint64, total_length: gint64) -> none` | soup_message_headers_set_content_range |  | Sets @hdrs's Content-Range header according to the given values. (Note that @total_length is the total length of the entire resource that this is a... |
| set_content_type | `MessageHeaders.set_content_type(content_type: utf8, params: GLib.HashTable?) -> none` | soup_message_headers_set_content_type |  | Sets the "Content-Type" header in @hdrs to @content_type. Accepts additional parameters specified in @params. |
| set_encoding | `MessageHeaders.set_encoding(encoding: Encoding) -> none` | soup_message_headers_set_encoding |  | Sets the message body encoding that @hdrs will declare. In particular, you should use this if you are going to send a request or response in chunke... |
| set_expectations | `MessageHeaders.set_expectations(expectations: Expectation) -> none` | soup_message_headers_set_expectations |  | Sets @hdrs's "Expect" header according to @expectations. Currently %SOUP_EXPECTATION_CONTINUE is the only known expectation value. You should set t... |
| set_range | `MessageHeaders.set_range(start: gint64, end: gint64) -> none` | soup_message_headers_set_range |  | Sets @hdrs's Range header to request the indicated range. @start and @end are interpreted as in a [struct@Range]. If you need to request multiple r... |
| set_ranges | `MessageHeaders.set_ranges(ranges: Range, length: gint) -> none` | soup_message_headers_set_ranges |  | Sets @hdrs's Range header to request the indicated ranges. If you only want to request a single range, you can use [method@MessageHeaders.set_range]. |
| unref | `MessageHeaders.unref() -> none` | soup_message_headers_unref |  | Atomically decrements the reference count of @hdrs by one. When the reference count reaches zero, the resources allocated by @hdrs are freed |

### Soup.MessageHeadersIter

C type: `SoupMessageHeadersIter`

An opaque type used to iterate over a %SoupMessageHeaders structure. After intializing the iterator with [func@MessageHeadersIter.init], call [meth...

#### Fields

| Field | Type |
| --- | --- |
| dummy | gpointer |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| init | `init(iter: out MessageHeadersIter, hdrs: MessageHeaders) -> none` | soup_message_headers_iter_init |  | Initializes @iter for iterating @hdrs. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| next | `MessageHeadersIter.next(name: out utf8, value: out utf8) -> gboolean` | soup_message_headers_iter_next |  | Yields the next name/value pair in the [struct@MessageHeaders] being iterated by @iter. If @iter has already yielded the last header, then [method@... |

### Soup.MessageMetrics

GType: `SoupMessageMetrics` ?? C type: `SoupMessageMetrics`

Contains metrics collected while loading a [class@Message] either from the network or the disk cache. Metrics are not collected by default for a [c...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `MessageMetrics.copy() -> MessageMetrics` | soup_message_metrics_copy |  | Copies @metrics. |
| free | `MessageMetrics.free() -> none` | soup_message_metrics_free |  | Frees @metrics. |
| get_connect_end | `MessageMetrics.get_connect_end() -> guint64` | soup_message_metrics_get_connect_end |  | Get the time immediately after the [class@Message] completed the connection to the server. This includes the time for the proxy negotiation and TLS... |
| get_connect_start | `MessageMetrics.get_connect_start() -> guint64` | soup_message_metrics_get_connect_start |  | Get the time immediately before the [class@Message] started to establish the connection to the server. It will be 0 if no network connection was re... |
| get_dns_end | `MessageMetrics.get_dns_end() -> guint64` | soup_message_metrics_get_dns_end |  | Get the time immediately after the [class@Message] completed the domain lookup name for the resource. It will be 0 if no domain lookup was required... |
| get_dns_start | `MessageMetrics.get_dns_start() -> guint64` | soup_message_metrics_get_dns_start |  | Get the time immediately before the [class@Message] started the domain lookup name for the resource. It will be 0 if no domain lookup was required ... |
| get_fetch_start | `MessageMetrics.get_fetch_start() -> guint64` | soup_message_metrics_get_fetch_start |  | Get the time immediately before the [class@Message] started to fetch a resource either from a remote server or local disk cache. |
| get_request_body_bytes_sent | `MessageMetrics.get_request_body_bytes_sent() -> guint64` | soup_message_metrics_get_request_body_bytes_sent |  | Get the number of bytes sent to the network for the request body. This is the size of the body sent, after encodings are applied, so it might be gr... |
| get_request_body_size | `MessageMetrics.get_request_body_size() -> guint64` | soup_message_metrics_get_request_body_size |  | Get the request body size in bytes. This is the size of the original body given to the request before any encoding is applied. This value is availa... |
| get_request_header_bytes_sent | `MessageMetrics.get_request_header_bytes_sent() -> guint64` | soup_message_metrics_get_request_header_bytes_sent |  | Get the number of bytes sent to the network for the request headers. This value is available right before [signal@Message::wrote-headers] signal is... |
| get_request_start | `MessageMetrics.get_request_start() -> guint64` | soup_message_metrics_get_request_start |  | Get the time immediately before the [class@Message] started the request of the resource from the server or the local disk cache. |
| get_response_body_bytes_received | `MessageMetrics.get_response_body_bytes_received() -> guint64` | soup_message_metrics_get_response_body_bytes_received |  | Get the number of bytes received from the network for the response body. This value is available right before [signal@Message::got-body] signal is ... |
| get_response_body_size | `MessageMetrics.get_response_body_size() -> guint64` | soup_message_metrics_get_response_body_size |  | Get the response body size in bytes. This is the size of the body as given to the user after all encodings are applied, so it might be greater than... |
| get_response_end | `MessageMetrics.get_response_end() -> guint64` | soup_message_metrics_get_response_end |  | Get the time immediately after the [class@Message] received the last bytes of the response from the server or the local disk cache. In case of load... |
| get_response_header_bytes_received | `MessageMetrics.get_response_header_bytes_received() -> guint64` | soup_message_metrics_get_response_header_bytes_received |  | Get the number of bytes received from the network for the response headers. This value is available right before [signal@Message::got-headers] sign... |
| get_response_start | `MessageMetrics.get_response_start() -> guint64` | soup_message_metrics_get_response_start |  | Get the time immediately after the [class@Message] received the first bytes of the response from the server or the local disk cache. |
| get_tls_start | `MessageMetrics.get_tls_start() -> guint64` | soup_message_metrics_get_tls_start |  | Get the time immediately before the [class@Message] started the TLS handshake. It will be 0 if no TLS handshake was required to fetch the resource ... |

### Soup.Multipart

GType: `SoupMultipart` ?? C type: `SoupMultipart`

Represents a multipart HTTP message body, parsed according to the syntax of RFC 2046. Of particular interest to HTTP are `multipart/byte-ranges` an...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Multipart.new(mime_type: utf8) -> Multipart` | soup_multipart_new |  | Creates a new empty #SoupMultipart with a randomly-generated boundary string. Note that @mime_type must be the full MIME type, including "multipart... |
| new_from_message | `Multipart.new_from_message(headers: MessageHeaders, body: GLib.Bytes) -> Multipart` | soup_multipart_new_from_message |  | Parses @headers and @body to form a new #SoupMultipart |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_form_file | `Multipart.append_form_file(control_name: utf8, filename: utf8?, content_type: utf8?, body: GLib.Bytes) -> none` | soup_multipart_append_form_file |  | Adds a new MIME part containing @body to @multipart Uses "Content-Disposition: form-data", as per the HTML forms specification. |
| append_form_string | `Multipart.append_form_string(control_name: utf8, data: utf8) -> none` | soup_multipart_append_form_string |  | Adds a new MIME part containing @data to @multipart. Uses "Content-Disposition: form-data", as per the HTML forms specification. |
| append_part | `Multipart.append_part(headers: MessageHeaders, body: GLib.Bytes) -> none` | soup_multipart_append_part |  | Adds a new MIME part to @multipart with the given headers and body. (The multipart will make its own copies of @headers and @body, so you should fr... |
| free | `Multipart.free() -> none` | soup_multipart_free |  | Frees @multipart. |
| get_length | `Multipart.get_length() -> gint` | soup_multipart_get_length |  | Gets the number of body parts in @multipart. |
| get_part | `Multipart.get_part(part: gint, headers: out MessageHeaders, body: out GLib.Bytes) -> gboolean` | soup_multipart_get_part |  | Gets the indicated body part from @multipart. |
| to_message | `Multipart.to_message(dest_headers: MessageHeaders, dest_body: out GLib.Bytes) -> none` | soup_multipart_to_message |  | Serializes @multipart to @dest_headers and @dest_body. |

### Soup.MultipartInputStreamClass

C type: `SoupMultipartInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gio.FilterInputStreamClass |

### Soup.Range

C type: `SoupRange`

Represents a byte range as used in the Range header. If @end is non-negative, then @start and @end represent the bounds of of the range, counting f...

#### Fields

| Field | Type |
| --- | --- |
| end | gint64 |
| start | gint64 |

### Soup.ServerClass

C type: `SoupServerClass`

#### Fields

| Field | Type |
| --- | --- |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| request_aborted | none |
| request_finished | none |
| request_read | none |
| request_started | none |

### Soup.ServerMessageClass

C type: `SoupServerMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.SessionClass

C type: `SoupSessionClass`

#### Fields

| Field | Type |
| --- | --- |
| _soup_reserved1 | none |
| _soup_reserved2 | none |
| _soup_reserved3 | none |
| _soup_reserved4 | none |
| _soup_reserved5 | none |
| _soup_reserved6 | none |
| _soup_reserved7 | none |
| _soup_reserved8 | none |
| parent_class | GObject.ObjectClass |
| request_queued | none |
| request_unqueued | none |

### Soup.SessionFeatureInterface

C type: `SoupSessionFeatureInterface`

The interface implemented by [iface@SessionFeature]s.

### Soup.WebsocketConnectionClass

C type: `SoupWebsocketConnectionClass`

The abstract base class for [class@WebsocketConnection].

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.WebsocketExtensionClass

C type: `SoupWebsocketExtensionClass`

The class structure for the #SoupWebsocketExtension.

#### Fields

| Field | Type |
| --- | --- |
| configure | gboolean |
| get_request_params | utf8 |
| get_response_params | utf8 |
| name | utf8 |
| padding | gpointer |
| parent_class | GObject.ObjectClass |
| process_incoming_message | GLib.Bytes |
| process_outgoing_message | GLib.Bytes |

### Soup.WebsocketExtensionDeflateClass

C type: `SoupWebsocketExtensionDeflateClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | WebsocketExtensionClass |

### Soup.WebsocketExtensionManagerClass

C type: `SoupWebsocketExtensionManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_version | `check_version(major: guint, minor: guint, micro: guint) -> gboolean` | soup_check_version |  | Like [func@CHECK_VERSION], but the check for soup_check_version is at runtime instead of compile time. This is useful for compiling against older v... |
| cookie_parse | `cookie_parse(header: utf8, origin: GLib.Uri?) -> Cookie` | soup_cookie_parse |  | Parses @header and returns a #SoupCookie. If @header contains multiple cookies, only the first one will be parsed. If @header does not have "path" ... |
| cookies_free | `cookies_free(cookies: GLib.SList) -> none` | soup_cookies_free |  | Frees @cookies. |
| cookies_from_request | `cookies_from_request(msg: Message) -> GLib.SList` | soup_cookies_from_request |  | Parses @msg's Cookie request header and returns a [struct@GLib.SList] of `SoupCookie`s. As the "Cookie" header, unlike "Set-Cookie", only contains ... |
| cookies_from_response | `cookies_from_response(msg: Message) -> GLib.SList` | soup_cookies_from_response |  | Parses @msg's Set-Cookie response headers and returns a [struct@GLib.SList] of `SoupCookie`s. Cookies that do not specify "path" or "domain" attrib... |
| cookies_to_cookie_header | `cookies_to_cookie_header(cookies: GLib.SList) -> utf8` | soup_cookies_to_cookie_header |  | Serializes a [struct@GLib.SList] of #SoupCookie into a string suitable for setting as the value of the "Cookie" header. |
| cookies_to_request | `cookies_to_request(cookies: GLib.SList, msg: Message) -> none` | soup_cookies_to_request |  | Adds the name and value of each cookie in @cookies to @msg's "Cookie" request. If @msg already has a "Cookie" request header, these cookies will be... |
| cookies_to_response | `cookies_to_response(cookies: GLib.SList, msg: Message) -> none` | soup_cookies_to_response |  | Appends a "Set-Cookie" response header to @msg for each cookie in @cookies. This is in addition to any other "Set-Cookie" headers @msg may already ... |
| date_time_new_from_http_string | `date_time_new_from_http_string(date_string: utf8) -> GLib.DateTime` | soup_date_time_new_from_http_string |  | Parses @date_string and tries to extract a date from it. This recognizes all of the "HTTP-date" formats from RFC 2616, RFC 2822 dates, and reasonab... |
| date_time_to_string | `date_time_to_string(date: GLib.DateTime, format: DateFormat) -> utf8` | soup_date_time_to_string |  | Converts @date to a string in the format described by @format. |
| form_decode | `form_decode(encoded_form: utf8) -> GLib.HashTable` | soup_form_decode |  | Decodes @form. which is an urlencoded dataset as defined in the HTML 4.01 spec. |
| form_decode_multipart | `form_decode_multipart(multipart: Multipart, file_control_name: utf8?, filename: out utf8?, content_type: out utf8?, file: out GLib.Bytes?) -> GLib.HashTable` | soup_form_decode_multipart |  | Decodes the "multipart/form-data" request in @multipart. this is a convenience method for the case when you have a single file upload control in a ... |
| form_encode | `form_encode(first_field: utf8, ...: void) -> utf8` | soup_form_encode |  | Encodes the given field names and values into a value of type "application/x-www-form-urlencoded". Encodes as defined in the HTML 4.01 spec. This m... |
| form_encode_datalist | `form_encode_datalist(form_data_set: GLib.Data) -> utf8` | soup_form_encode_datalist |  | Encodes @form_data_set into a value of type "application/x-www-form-urlencoded". Encodes as defined in the HTML 4.01 spec. Unlike [func@form_encode... |
| form_encode_hash | `form_encode_hash(form_data_set: GLib.HashTable) -> utf8` | soup_form_encode_hash |  | Encodes @form_data_set into a value of type "application/x-www-form-urlencoded". Encodes as defined in the HTML 4.01 spec. Note that the HTML spec ... |
| form_encode_valist | `form_encode_valist(first_field: utf8, args: va_list) -> utf8` | soup_form_encode_valist |  | See [func@form_encode]. This is mostly an internal method, used by various other methods such as [func@form_encode]. See also: [ctor@Message.new_fr... |
| get_major_version | `get_major_version() -> guint` | soup_get_major_version |  | Returns the major version number of the libsoup library. e.g. in libsoup version 2.42.0 this is 2. This function is in the library, so it represent... |
| get_micro_version | `get_micro_version() -> guint` | soup_get_micro_version |  | Returns the micro version number of the libsoup library. e.g. in libsoup version 2.42.0 this is 0. This function is in the library, so it represent... |
| get_minor_version | `get_minor_version() -> guint` | soup_get_minor_version |  | Returns the minor version number of the libsoup library. e.g. in libsoup version 2.42.0 this is 42. This function is in the library, so it represen... |
| header_contains | `header_contains(header: utf8, token: utf8) -> gboolean` | soup_header_contains |  | Parses @header to see if it contains the token @token (matched case-insensitively). Note that this can't be used with lists that have qvalues. |
| header_free_list | `header_free_list(list: GLib.SList) -> none` | soup_header_free_list |  | Frees @list. |
| header_free_param_list | `header_free_param_list(param_list: GLib.HashTable) -> none` | soup_header_free_param_list |  | Frees @param_list. |
| header_g_string_append_param | `header_g_string_append_param(string: GLib.String, name: utf8, value: utf8?) -> none` | soup_header_g_string_append_param |  | Appends something like `name=value` to @string, taking care to quote @value if needed, and if so, to escape any quotes or backslashes in @value. Al... |
| header_g_string_append_param_quoted | `header_g_string_append_param_quoted(string: GLib.String, name: utf8, value: utf8) -> none` | soup_header_g_string_append_param_quoted |  | Appends something like `name="value"` to @string, taking care to escape any quotes or backslashes in @value. If @value is (non-ASCII) UTF-8, this w... |
| header_parse_list | `header_parse_list(header: utf8) -> GLib.SList` | soup_header_parse_list |  | Parses a header whose content is described by RFC2616 as `#something`. "something" does not itself contain commas, except as part of quoted-strings. |
| header_parse_param_list | `header_parse_param_list(header: utf8) -> GLib.HashTable` | soup_header_parse_param_list |  | Parses a header which is a comma-delimited list of something like: `token [ "=" ( token \| quoted-string ) ]`. Tokens that don't have an associated ... |
| header_parse_param_list_strict | `header_parse_param_list_strict(header: utf8) -> GLib.HashTable` | soup_header_parse_param_list_strict |  | A strict version of [func@header_parse_param_list] that bails out if there are duplicate parameters. Note that this function will treat RFC5987-enc... |
| header_parse_quality_list | `header_parse_quality_list(header: utf8, unacceptable: out GLib.SList?) -> GLib.SList` | soup_header_parse_quality_list |  | Parses a header whose content is a list of items with optional "qvalue"s (eg, Accept, Accept-Charset, Accept-Encoding, Accept-Language, TE). If @un... |
| header_parse_semi_param_list | `header_parse_semi_param_list(header: utf8) -> GLib.HashTable` | soup_header_parse_semi_param_list |  | Parses a header which is a semicolon-delimited list of something like: `token [ "=" ( token \| quoted-string ) ]`. Tokens that don't have an associa... |
| header_parse_semi_param_list_strict | `header_parse_semi_param_list_strict(header: utf8) -> GLib.HashTable` | soup_header_parse_semi_param_list_strict |  | A strict version of [func@header_parse_semi_param_list] that bails out if there are duplicate parameters. Note that this function will treat RFC598... |
| headers_parse | `headers_parse(str: utf8, len: gint, dest: MessageHeaders) -> gboolean` | soup_headers_parse |  | Parses the headers of an HTTP request or response in @str and stores the results in @dest. Beware that @dest may be modified even on failure. This ... |
| headers_parse_request | `headers_parse_request(str: utf8, len: gint, req_headers: MessageHeaders, req_method: out utf8?, req_path: out utf8?, ver: out HTTPVersion?) -> guint` | soup_headers_parse_request |  | Parses the headers of an HTTP request in @str and stores the results in @req_method, @req_path, @ver, and @req_headers. Beware that @req_headers ma... |
| headers_parse_response | `headers_parse_response(str: utf8, len: gint, headers: MessageHeaders, ver: out HTTPVersion?, status_code: out guint?, reason_phrase: out utf8?) -> gboolean` | soup_headers_parse_response |  | Parses the headers of an HTTP response in @str and stores the results in @ver, @status_code, @reason_phrase, and @headers. Beware that @headers may... |
| headers_parse_status_line | `headers_parse_status_line(status_line: utf8, ver: out HTTPVersion?, status_code: out guint?, reason_phrase: out utf8?) -> gboolean` | soup_headers_parse_status_line |  | Parses the HTTP Status-Line string in @status_line into @ver, @status_code, and @reason_phrase. @status_line must be terminated by either "\0" or "... |
| message_headers_iter_init | `message_headers_iter_init(iter: out MessageHeadersIter, hdrs: MessageHeaders) -> none` | soup_message_headers_iter_init |  | Initializes @iter for iterating @hdrs. |
| session_error_quark | `session_error_quark() -> GLib.Quark` | soup_session_error_quark |  | Registers error quark for SoupSession if needed. |
| status_get_phrase | `status_get_phrase(status_code: guint) -> utf8` | soup_status_get_phrase |  | Looks up the stock HTTP description of @status_code. *There is no reason for you to ever use this function.* If you wanted the textual description ... |
| tld_domain_is_public_suffix | `tld_domain_is_public_suffix(domain: utf8) -> gboolean` | soup_tld_domain_is_public_suffix |  | Looks whether the @domain passed as argument is a public domain suffix (.org, .com, .co.uk, etc) or not. Prior to libsoup 2.46, this function requi... |
| tld_error_quark | `tld_error_quark() -> GLib.Quark` | soup_tld_error_quark |  | Registers error quark for soup_tld_get_base_domain() if needed. |
| tld_get_base_domain | `tld_get_base_domain(hostname: utf8) -> utf8 throws` | soup_tld_get_base_domain |  | Finds the base domain for a given @hostname The base domain is composed by the top level domain (such as .org, .com, .co.uk, etc) plus the second l... |
| uri_copy | `uri_copy(uri: GLib.Uri, first_component: URIComponent, ...: void) -> GLib.Uri` | soup_uri_copy |  | As of 3.4.0 this will detect the default ports of HTTP(s) and WS(S) URIs when copying and set it to the default port of the new scheme. So for exam... |
| uri_decode_data_uri | `uri_decode_data_uri(uri: utf8, content_type: out utf8?) -> GLib.Bytes` | soup_uri_decode_data_uri |  | Decodes the given data URI and returns its contents and @content_type. |
| uri_equal | `uri_equal(uri1: GLib.Uri, uri2: GLib.Uri) -> gboolean` | soup_uri_equal |  | Tests whether or not @uri1 and @uri2 are equal in all parts. |
| websocket_client_prepare_handshake | `websocket_client_prepare_handshake(msg: Message, origin: utf8?, protocols: utf8?, supported_extensions: GObject.TypeClass?) -> none` | soup_websocket_client_prepare_handshake |  | Adds the necessary headers to @msg to request a WebSocket handshake including supported WebSocket extensions. The message body and non-WebSocket-re... |
| websocket_client_verify_handshake | `websocket_client_verify_handshake(msg: Message, supported_extensions: GObject.TypeClass?, accepted_extensions: out GLib.List?) -> gboolean throws` | soup_websocket_client_verify_handshake |  | Looks at the response status code and headers in @msg and determines if they contain a valid WebSocket handshake response (given the handshake requ... |
| websocket_error_quark | `websocket_error_quark() -> GLib.Quark` | soup_websocket_error_quark |  | Registers error quark for SoupWebsocket if needed. |
| websocket_server_check_handshake | `websocket_server_check_handshake(msg: ServerMessage, origin: utf8?, protocols: utf8?, supported_extensions: GObject.TypeClass?) -> gboolean throws` | soup_websocket_server_check_handshake |  | Examines the method and request headers in @msg and determines whether @msg contains a valid handshake request. If @origin is non-%NULL, then only ... |
| websocket_server_process_handshake | `websocket_server_process_handshake(msg: ServerMessage, expected_origin: utf8?, protocols: utf8?, supported_extensions: GObject.TypeClass?, accepted_extensions: out GLib.List?) -> gboolean` | soup_websocket_server_process_handshake |  | Examines the method and request headers in @msg and (assuming @msg contains a valid handshake request), fills in the handshake response. If @expect... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| AuthDomainBasicAuthCallback | `AuthDomainBasicAuthCallback(domain: AuthDomainBasic, msg: ServerMessage, username: utf8, password: utf8, user_data: gpointer?) -> gboolean` |  |  | Callback used by #SoupAuthDomainBasic for authentication purposes. The application should verify that @username and @password and valid and return ... |
| AuthDomainDigestAuthCallback | `AuthDomainDigestAuthCallback(domain: AuthDomainDigest, msg: ServerMessage, username: utf8, user_data: gpointer?) -> utf8` |  |  | Callback used by #SoupAuthDomainDigest for authentication purposes. The application should look up @username in its password database, and return t... |
| AuthDomainFilter | `AuthDomainFilter(domain: AuthDomain, msg: ServerMessage, user_data: gpointer?) -> gboolean` |  |  | The prototype for a #SoupAuthDomain filter. See [method@AuthDomain.set_filter] for details. |
| AuthDomainGenericAuthCallback | `AuthDomainGenericAuthCallback(domain: AuthDomain, msg: ServerMessage, username: utf8, user_data: gpointer?) -> gboolean` |  |  | The prototype for a #SoupAuthDomain generic authentication callback. The callback should look up the user's password, call [method@AuthDomain.check... |
| LoggerFilter | `LoggerFilter(logger: Logger, msg: Message, user_data: gpointer?) -> LoggerLogLevel` |  |  | The prototype for a logging filter. The filter callback will be invoked for each request or response, and should analyze it and return a [enum@Logg... |
| LoggerPrinter | `LoggerPrinter(logger: Logger, level: LoggerLogLevel, direction: gchar, data: utf8, user_data: gpointer?) -> none` |  |  | The prototype for a custom printing callback. @level indicates what kind of information is being printed. Eg, it will be %SOUP_LOGGER_LOG_HEADERS i... |
| MessageHeadersForeachFunc | `MessageHeadersForeachFunc(name: utf8, value: utf8, user_data: gpointer?) -> none` |  |  | The callback passed to [method@MessageHeaders.foreach]. |
| ServerCallback | `ServerCallback(server: Server, msg: ServerMessage, path: utf8, query: GLib.HashTable?, user_data: gpointer?) -> none` |  |  | A callback used to handle requests to a [class@Server]. @path and @query contain the likewise-named components of the Request-URI, subject to certa... |
| ServerWebsocketCallback | `ServerWebsocketCallback(server: Server, msg: ServerMessage, path: utf8, connection: WebsocketConnection, user_data: gpointer?) -> none` |  |  | A callback used to handle WebSocket requests to a #SoupServer. The callback will be invoked after sending the handshake response back to the client... |

## Constants

| Name | Type |
| --- | --- |
| COOKIE_MAX_AGE_ONE_DAY | gint |
| COOKIE_MAX_AGE_ONE_HOUR | gint |
| COOKIE_MAX_AGE_ONE_WEEK | gint |
| COOKIE_MAX_AGE_ONE_YEAR | gint |
| FORM_MIME_TYPE_MULTIPART | utf8 |
| FORM_MIME_TYPE_URLENCODED | utf8 |
| HSTS_POLICY_MAX_AGE_PAST | gint |
| HTTP_URI_FLAGS | gint |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| VERSION_MIN_REQUIRED | gint |

