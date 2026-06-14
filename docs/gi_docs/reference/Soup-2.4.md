# Soup 2.4

SQGI import: `import("Soup", "2.4")`

Packages: `libsoup-2.4`
Includes: `Gio-2.0`
Libraries: `libsoup-2.4.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 36 |
| Interfaces | 4 |
| Records | 64 |
| Unions | 0 |
| Enums | 26 |
| Flags | 4 |
| Functions | 100 |
| Callbacks | 17 |
| Constants | 116 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Address | GObject.Object | 0 | 0 | 15 | Creates a #SoupAddress from @name and @port. The #SoupAddress's IP address may not be available right away; the caller can call soup_address_resolv... |
| Auth | GObject.Object | 4 | 0 | 18 | The abstract base class for handling authentication. Specific HTTP Authentication mechanisms are implemented by its subclasses, but applications ne... |
| AuthBasic | Auth | 0 | 0 | 0 |  |
| AuthDigest | Auth | 0 | 0 | 0 |  |
| AuthDomain | GObject.Object | 2 | 0 | 10 | Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to @msg, requesting that the client authenticate, and sets @msg's status accordingly. This... |
| AuthDomainBasic | AuthDomain | 0 | 0 | 2 | Creates a #SoupAuthDomainBasic. You must set the %SOUP_AUTH_DOMAIN_REALM parameter, to indicate the realm name to be returned with the authenticati... |
| AuthDomainDigest | AuthDomain | 0 | 0 | 3 | Creates a #SoupAuthDomainDigest. You must set the %SOUP_AUTH_DOMAIN_REALM parameter, to indicate the realm name to be returned with the authenticat... |
| AuthManager | GObject.Object | 0 | 1 | 2 | Clear all credentials cached by @manager |
| AuthNegotiate | Auth | 0 | 0 | 1 | Indicates whether libsoup was built with GSSAPI support. If this is %FALSE, %SOUP_TYPE_AUTH_NEGOTIATE will still be defined and can still be added ... |
| AuthNTLM | Auth | 0 | 0 | 0 |  |
| Cache | GObject.Object | 0 | 0 | 7 | Creates a new #SoupCache. |
| ContentDecoder | GObject.Object | 0 | 0 | 0 |  |
| ContentSniffer | GObject.Object | 0 | 0 | 3 | Creates a new #SoupContentSniffer. |
| CookieJar | GObject.Object | 2 | 1 | 15 | Creates a new #SoupCookieJar. The base #SoupCookieJar class does not support persistent storage of cookies; use a subclass for that. |
| CookieJarDB | CookieJar | 0 | 0 | 1 | Creates a #SoupCookieJarDB. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-session... |
| CookieJarText | CookieJar | 0 | 0 | 1 | Creates a #SoupCookieJarText. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-sessi... |
| HSTSEnforcer | GObject.Object | 1 | 2 | 7 | Creates a new #SoupHSTSEnforcer. The base #SoupHSTSEnforcer class does not support persistent storage of HSTS policies, see #SoupHSTSEnforcerDB for... |
| HSTSEnforcerDB | HSTSEnforcer | 0 | 0 | 1 | Creates a #SoupHSTSEnforcerDB. @filename will be read in during the initialization of a #SoupHSTSEnforcerDB, in order to create an initial set of H... |
| Logger | GObject.Object | 0 | 0 | 6 | Creates a new #SoupLogger with the given debug level. If @level is %SOUP_LOGGER_LOG_BODY, @max_body_size gives the maximum number of bytes of the b... |
| Message | GObject.Object | 0 | 14 | 43 | Represents an HTTP message being sent or received. @status_code will normally be a #SoupStatus value, eg, %SOUP_STATUS_OK, though of course it migh... |
| MultipartInputStream | Gio.FilterInputStream | 0 | 0 | 5 | Creates a new #SoupMultipartInputStream that wraps the #GInputStream obtained by sending the #SoupRequest. Reads should not be done directly throug... |
| ProxyResolverDefault | GObject.Object | 0 | 0 | 0 |  |
| Request | GObject.Object | 3 | 0 | 7 | A request to retrieve a particular URI. |
| RequestData | Request | 0 | 0 | 0 |  |
| Requester | GObject.Object | 0 | 0 | 3 |  |
| RequestFile | Request | 0 | 0 | 1 | Gets a #GFile corresponding to @file's URI |
| RequestHTTP | Request | 0 | 0 | 1 | Gets a new reference to the #SoupMessage associated to this SoupRequest |
| Server | GObject.Object | 0 | 4 | 28 | Creates a new #SoupServer. This is exactly equivalent to calling g_object_new() and specifying %SOUP_TYPE_SERVER as the type. |
| Session | GObject.Object | 2 | 6 | 34 | Creates a #SoupSession with the default options. |
| SessionAsync | Session | 0 | 0 | 2 | Creates an asynchronous #SoupSession with the default options. |
| SessionSync | Session | 0 | 0 | 2 | Creates an synchronous #SoupSession with the default options. |
| Socket | GObject.Object | 0 | 5 | 15 | Creates a new (disconnected) socket |
| WebsocketConnection | GObject.Object | 0 | 5 | 19 | A class representing a WebSocket connection. |
| WebsocketExtension | GObject.Object | 1 | 0 | 5 | Configures @extension with the given @params |
| WebsocketExtensionDeflate | WebsocketExtension | 0 | 0 | 0 |  |
| WebsocketExtensionManager | GObject.Object | 0 | 0 | 0 |  |

### Soup.Address

Parent: `GObject.Object` ?? Implements: `Gio.SocketConnectable` ?? GType: `SoupAddress` ?? C type: `SoupAddress`

Creates a #SoupAddress from @name and @port. The #SoupAddress's IP address may not be available right away; the caller can call soup_address_resolv...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Address.new(name: utf8, port: guint) -> Address` | soup_address_new |  | Creates a #SoupAddress from @name and @port. The #SoupAddress's IP address may not be available right away; the caller can call soup_address_resolv... |
| new_any | `Address.new_any(family: AddressFamily, port: guint) -> Address` | soup_address_new_any |  | Returns a #SoupAddress corresponding to the "any" address for @family (or %NULL if @family isn't supported), suitable for using as a listening #Sou... |
| new_from_sockaddr | `Address.new_from_sockaddr(sa: gpointer?, len: gint) -> Address` | soup_address_new_from_sockaddr |  | Returns a #SoupAddress equivalent to @sa (or %NULL if @sa's address family isn't supported) |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal_by_ip | `Address.equal_by_ip(addr2: Address) -> gboolean` | soup_address_equal_by_ip | 2.26 | Tests if @addr1 and @addr2 have the same IP address. This method can be used with soup_address_hash_by_ip() to create a #GHashTable that hashes on ... |
| equal_by_name | `Address.equal_by_name(addr2: Address) -> gboolean` | soup_address_equal_by_name | 2.26 | Tests if @addr1 and @addr2 have the same "name". This method can be used with soup_address_hash_by_name() to create a #GHashTable that hashes on ad... |
| get_gsockaddr | `Address.get_gsockaddr() -> Gio.SocketAddress` | soup_address_get_gsockaddr | 2.32 | Creates a new #GSocketAddress corresponding to @addr (which is assumed to only have one socket address associated with it). |
| get_name | `Address.get_name() -> utf8` | soup_address_get_name |  | Returns the hostname associated with @addr. This method is not thread-safe; if you call it while @addr is being resolved in another thread, it may ... |
| get_physical | `Address.get_physical() -> utf8` | soup_address_get_physical |  | Returns the physical address associated with @addr as a string. (Eg, "127.0.0.1"). If the address is not yet known, returns %NULL. This method is n... |
| get_port | `Address.get_port() -> guint` | soup_address_get_port |  | Returns the port associated with @addr. |
| get_sockaddr | `Address.get_sockaddr(len: out gint) -> gpointer` | soup_address_get_sockaddr |  | Returns the sockaddr associated with @addr, with its length in *@len. If the sockaddr is not yet known, returns %NULL. This method is not thread-sa... |
| hash_by_ip | `Address.hash_by_ip() -> guint` | soup_address_hash_by_ip | 2.26 | A hash function (for #GHashTable) that corresponds to soup_address_equal_by_ip(), qv |
| hash_by_name | `Address.hash_by_name() -> guint` | soup_address_hash_by_name | 2.26 | A hash function (for #GHashTable) that corresponds to soup_address_equal_by_name(), qv |
| is_resolved | `Address.is_resolved() -> gboolean` | soup_address_is_resolved |  | Tests if @addr has already been resolved. Unlike the other #SoupAddress "get" methods, this is safe to call when @addr might be being resolved in a... |
| resolve_async | `Address.resolve_async(async_context: GLib.MainContext?, cancellable: Gio.Cancellable?, callback: AddressCallback, user_data: gpointer?) -> none` | soup_address_resolve_async |  | Asynchronously resolves the missing half of @addr (its IP address if it was created with soup_address_new(), or its hostname if it was created with... |
| resolve_sync | `Address.resolve_sync(cancellable: Gio.Cancellable?) -> guint` | soup_address_resolve_sync |  | Synchronously resolves the missing half of @addr, as with soup_address_resolve_async(). If @cancellable is non-%NULL, it can be used to cancel the ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| family | AddressFamily | read, write, construct-only |  |
| name | utf8 | read, write, construct-only |  |
| physical | utf8 | read |  |
| port | gint | read, write, construct-only |  |
| protocol | utf8 | read, write, construct-only |  |
| sockaddr | gpointer | read, write, construct-only |  |

### Soup.Auth

Parent: `GObject.Object` ?? Subclasses: `AuthBasic`, `AuthDigest`, `AuthNegotiate`, `AuthNTLM` ?? GType: `SoupAuth` ?? C type: `SoupAuth` ?? Abstract

The abstract base class for handling authentication. Specific HTTP Authentication mechanisms are implemented by its subclasses, but applications ne...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| realm | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Auth.new(type: GType, msg: Message, auth_header: utf8) -> Auth` | soup_auth_new |  | Creates a new #SoupAuth of type @type with the information from @msg and @auth_header. This is called by #SoupSession; you will normally not create... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `Auth.authenticate(username: utf8, password: utf8) -> none` | soup_auth_authenticate |  | Call this on an auth to authenticate it; normally this will cause the auth's message to be requeued with the new authentication info. |
| can_authenticate | `Auth.can_authenticate() -> gboolean` | soup_auth_can_authenticate | 2.54 | Tests if @auth is able to authenticate by providing credentials to the soup_auth_authenticate(). |
| free_protection_space | `Auth.free_protection_space(space: GLib.SList) -> none` | soup_auth_free_protection_space |  | Frees @space. |
| get_authorization | `Auth.get_authorization(msg: Message) -> utf8` | soup_auth_get_authorization |  | Generates an appropriate "Authorization" header for @msg. (The session will only call this if soup_auth_is_authenticated() returned %TRUE.) |
| get_host | `Auth.get_host() -> utf8` | soup_auth_get_host |  | Returns the host that @auth is associated with. |
| get_info | `Auth.get_info() -> utf8` | soup_auth_get_info |  | Gets an opaque identifier for @auth, for use as a hash key or the like. #SoupAuth objects from the same server with the same identifier refer to th... |
| get_protection_space | `Auth.get_protection_space(source_uri: URI) -> GLib.SList` | soup_auth_get_protection_space |  | Returns a list of paths on the server which @auth extends over. (All subdirectories of these paths are also assumed to be part of @auth's protectio... |
| get_realm | `Auth.get_realm() -> utf8` | soup_auth_get_realm |  | Returns @auth's realm. This is an identifier that distinguishes separate authentication spaces on a given server, and may be some string that is me... |
| get_saved_password | `Auth.get_saved_password(user: utf8) -> utf8` | soup_auth_get_saved_password |  |  |
| get_saved_users | `Auth.get_saved_users() -> GLib.SList` | soup_auth_get_saved_users |  |  |
| get_scheme_name | `Auth.get_scheme_name() -> utf8` | soup_auth_get_scheme_name |  | Returns @auth's scheme name. (Eg, "Basic", "Digest", or "NTLM") |
| has_saved_password | `Auth.has_saved_password(username: utf8, password: utf8) -> none` | soup_auth_has_saved_password |  |  |
| is_authenticated | `Auth.is_authenticated() -> gboolean` | soup_auth_is_authenticated |  | Tests if @auth has been given a username and password |
| is_for_proxy | `Auth.is_for_proxy() -> gboolean` | soup_auth_is_for_proxy |  | Tests whether or not @auth is associated with a proxy server rather than an "origin" server. |
| is_ready | `Auth.is_ready(msg: Message) -> gboolean` | soup_auth_is_ready | 2.42 | Tests if @auth is ready to make a request for @msg with. For most auths, this is equivalent to soup_auth_is_authenticated(), but for some auth type... |
| save_password | `Auth.save_password(username: utf8, password: utf8) -> none` | soup_auth_save_password |  |  |
| update | `Auth.update(msg: Message, auth_header: utf8) -> gboolean` | soup_auth_update |  | Updates @auth with the information from @msg and @auth_header, possibly un-authenticating it. As with soup_auth_new(), this is normally only used b... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| host | utf8 | read, write |  |
| is-authenticated | gboolean | read |  |
| is-for-proxy | gboolean | read, write |  |
| realm | utf8 | read, write |  |
| scheme-name | utf8 | read |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `authenticate(username: utf8, password: utf8) -> none` |  |  | Call this on an auth to authenticate it; normally this will cause the auth's message to be requeued with the new authentication info. |
| can_authenticate | `can_authenticate() -> gboolean` |  | 2.54 | Tests if @auth is able to authenticate by providing credentials to the soup_auth_authenticate(). |
| get_authorization | `get_authorization(msg: Message) -> utf8` |  |  | Generates an appropriate "Authorization" header for @msg. (The session will only call this if soup_auth_is_authenticated() returned %TRUE.) |
| get_protection_space | `get_protection_space(source_uri: URI) -> GLib.SList` |  |  | Returns a list of paths on the server which @auth extends over. (All subdirectories of these paths are also assumed to be part of @auth's protectio... |
| is_authenticated | `is_authenticated() -> gboolean` |  |  | Tests if @auth has been given a username and password |
| is_ready | `is_ready(msg: Message) -> gboolean` |  | 2.42 | Tests if @auth is ready to make a request for @msg with. For most auths, this is equivalent to soup_auth_is_authenticated(), but for some auth type... |
| update | `update(msg: Message, auth_header: GLib.HashTable) -> gboolean` |  |  | Updates @auth with the information from @msg and @auth_header, possibly un-authenticating it. As with soup_auth_new(), this is normally only used b... |

### Soup.AuthBasic

Parent: `Auth` ?? GType: `SoupAuthBasic`

### Soup.AuthDigest

Parent: `Auth` ?? GType: `SoupAuthDigest`

### Soup.AuthDomain

Parent: `GObject.Object` ?? Subclasses: `AuthDomainBasic`, `AuthDomainDigest` ?? GType: `SoupAuthDomain` ?? C type: `SoupAuthDomain` ?? Abstract

Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to @msg, requesting that the client authenticate, and sets @msg's status accordingly. This...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accepts | `AuthDomain.accepts(msg: Message) -> utf8` | soup_auth_domain_accepts |  | Checks if @msg contains appropriate authorization for @domain to accept it. Mirroring soup_auth_domain_covers(), this does not check whether or not... |
| add_path | `AuthDomain.add_path(path: utf8) -> none` | soup_auth_domain_add_path |  | Adds @path to @domain, such that requests under @path on @domain's server will require authentication (unless overridden by soup_auth_domain_remove... |
| challenge | `AuthDomain.challenge(msg: Message) -> none` | soup_auth_domain_challenge |  | Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to @msg, requesting that the client authenticate, and sets @msg's status accordingly. This... |
| check_password | `AuthDomain.check_password(msg: Message, username: utf8, password: utf8) -> gboolean` | soup_auth_domain_check_password |  | Checks if @msg authenticates to @domain via @username and @password. This would normally be called from a #SoupAuthDomainGenericAuthCallback. |
| covers | `AuthDomain.covers(msg: Message) -> gboolean` | soup_auth_domain_covers |  | Checks if @domain requires @msg to be authenticated (according to its paths and filter function). This does not actually look at whether @msg <emph... |
| get_realm | `AuthDomain.get_realm() -> utf8` | soup_auth_domain_get_realm |  | Gets the realm name associated with @domain |
| remove_path | `AuthDomain.remove_path(path: utf8) -> none` | soup_auth_domain_remove_path |  | Removes @path from @domain, such that requests under @path on @domain's server will NOT require authentication. This is not simply an undo-er for s... |
| set_filter | `AuthDomain.set_filter(filter: AuthDomainFilter, filter_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_set_filter |  | Adds @filter as an authentication filter to @domain. The filter gets a chance to bypass authentication for certain requests that would otherwise re... |
| set_generic_auth_callback | `AuthDomain.set_generic_auth_callback(auth_callback: AuthDomainGenericAuthCallback, auth_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_set_generic_auth_callback |  | Sets @auth_callback as an authentication-handling callback for @domain. Whenever a request comes in to @domain which cannot be authenticated via a ... |
| try_generic_auth_callback | `AuthDomain.try_generic_auth_callback(msg: Message, username: utf8) -> gboolean` | soup_auth_domain_try_generic_auth_callback |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| add-path | utf8 | write |  |
| filter | AuthDomainFilter | read, write | The #SoupAuthDomainFilter for the domain |
| filter-data | gpointer | read, write |  |
| generic-auth-callback | AuthDomainGenericAuthCallback | read, write | The #SoupAuthDomainGenericAuthCallback for the domain |
| generic-auth-data | gpointer | read, write |  |
| proxy | gboolean | read, write, construct-only |  |
| realm | utf8 | read, write, construct-only |  |
| remove-path | utf8 | write |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accepts | `accepts(msg: Message, header: utf8) -> utf8` |  |  |  |
| challenge | `challenge(msg: Message) -> utf8` |  |  | Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to @msg, requesting that the client authenticate, and sets @msg's status accordingly. This... |
| check_password | `check_password(msg: Message, username: utf8, password: utf8) -> gboolean` |  |  | Checks if @msg authenticates to @domain via @username and @password. This would normally be called from a #SoupAuthDomainGenericAuthCallback. |

### Soup.AuthDomainBasic

Parent: `AuthDomain` ?? GType: `SoupAuthDomainBasic` ?? C type: `SoupAuthDomainBasic`

Creates a #SoupAuthDomainBasic. You must set the %SOUP_AUTH_DOMAIN_REALM parameter, to indicate the realm name to be returned with the authenticati...

#### Fields

| Field | Type |
| --- | --- |
| parent | AuthDomain |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AuthDomainBasic.new(optname1: utf8, ...: void) -> AuthDomain` | soup_auth_domain_basic_new |  | Creates a #SoupAuthDomainBasic. You must set the %SOUP_AUTH_DOMAIN_REALM parameter, to indicate the realm name to be returned with the authenticati... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_auth_callback | `AuthDomainBasic.set_auth_callback(callback: AuthDomainBasicAuthCallback, user_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_basic_set_auth_callback |  | Sets the callback that @domain will use to authenticate incoming requests. For each request containing authorization, @domain will invoke the callb... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auth-callback | AuthDomainBasicAuthCallback | read, write | The #SoupAuthDomainBasicAuthCallback |
| auth-data | gpointer | read, write | The data to pass to the #SoupAuthDomainBasicAuthCallback |

### Soup.AuthDomainDigest

Parent: `AuthDomain` ?? GType: `SoupAuthDomainDigest` ?? C type: `SoupAuthDomainDigest`

Creates a #SoupAuthDomainDigest. You must set the %SOUP_AUTH_DOMAIN_REALM parameter, to indicate the realm name to be returned with the authenticat...

#### Fields

| Field | Type |
| --- | --- |
| parent | AuthDomain |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AuthDomainDigest.new(optname1: utf8, ...: void) -> AuthDomain` | soup_auth_domain_digest_new |  | Creates a #SoupAuthDomainDigest. You must set the %SOUP_AUTH_DOMAIN_REALM parameter, to indicate the realm name to be returned with the authenticat... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| encode_password | `encode_password(username: utf8, realm: utf8, password: utf8) -> utf8` | soup_auth_domain_digest_encode_password |  | Encodes the username/realm/password triplet for Digest authentication. (That is, it returns a stringified MD5 hash of @username, @realm, and @passw... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_auth_callback | `AuthDomainDigest.set_auth_callback(callback: AuthDomainDigestAuthCallback, user_data: gpointer?, dnotify: GLib.DestroyNotify) -> none` | soup_auth_domain_digest_set_auth_callback |  | Sets the callback that @domain will use to authenticate incoming requests. For each request containing authorization, @domain will invoke the callb... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| auth-callback | AuthDomainDigestAuthCallback | read, write | The #SoupAuthDomainDigestAuthCallback |
| auth-data | gpointer | read, write | The data to pass to the #SoupAuthDomainDigestAuthCallback |

### Soup.AuthManager

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupAuthManager` ?? C type: `SoupAuthManager`

Clear all credentials cached by @manager

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | AuthManagerPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_cached_credentials | `AuthManager.clear_cached_credentials() -> none` | soup_auth_manager_clear_cached_credentials | 2.58 | Clear all credentials cached by @manager |
| use_auth | `AuthManager.use_auth(uri: URI, auth: Auth) -> none` | soup_auth_manager_use_auth | 2.42 | Records that @auth is to be used under @uri, as though a WWW-Authenticate header had been received at that URI. This can be used to "preload" @mana... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| authenticate | `msg: Message, auth: Auth, retrying: gboolean` | none | first |  | Emitted when the manager requires the application to provide authentication credentials. #SoupSession connects to this signal and emits its own #So... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| authenticate | `authenticate(msg: Message, auth: Auth, retrying: gboolean) -> none` |  |  |  |

### Soup.AuthNegotiate

Parent: `Auth` ?? GType: `SoupAuthNegotiate`

Indicates whether libsoup was built with GSSAPI support. If this is %FALSE, %SOUP_TYPE_AUTH_NEGOTIATE will still be defined and can still be added ...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| supported | `supported() -> gboolean` | soup_auth_negotiate_supported | 2.54 | Indicates whether libsoup was built with GSSAPI support. If this is %FALSE, %SOUP_TYPE_AUTH_NEGOTIATE will still be defined and can still be added ... |

### Soup.AuthNTLM

Parent: `Auth` ?? GType: `SoupAuthNTLM`

### Soup.Cache

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupCache` ?? C type: `SoupCache`

Creates a new #SoupCache.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | GObject.Object |
| priv | CachePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Cache.new(cache_dir: utf8?, cache_type: CacheType) -> Cache` | soup_cache_new | 2.34 | Creates a new #SoupCache. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `Cache.clear() -> none` | soup_cache_clear | 2.34 | Will remove all entries in the @cache plus all the cache files. |
| dump | `Cache.dump() -> none` | soup_cache_dump | 2.34. | Synchronously writes the cache index out to disk. Contrast with soup_cache_flush(), which writes pending cache <emphasis>entries</emphasis> to disk... |
| flush | `Cache.flush() -> none` | soup_cache_flush | 2.34 | This function will force all pending writes in the @cache to be committed to disk. For doing so it will iterate the #GMainContext associated with @... |
| get_max_size | `Cache.get_max_size() -> guint` | soup_cache_get_max_size | 2.34 | Gets the maximum size of the cache. |
| load | `Cache.load() -> none` | soup_cache_load | 2.34 | Loads the contents of @cache's index into memory. |
| set_max_size | `Cache.set_max_size(max_size: guint) -> none` | soup_cache_set_max_size | 2.34 | Sets the maximum size of the cache. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| cache-dir | utf8 | read, write, construct-only |  |
| cache-type | CacheType | read, write, construct-only |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_cacheability | `get_cacheability(msg: Message) -> Cacheability` |  |  |  |

### Soup.ContentDecoder

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupContentDecoder` ?? C type: `SoupContentDecoder`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ContentDecoderPrivate |

### Soup.ContentSniffer

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupContentSniffer` ?? C type: `SoupContentSniffer`

Creates a new #SoupContentSniffer.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ContentSnifferPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ContentSniffer.new() -> ContentSniffer` | soup_content_sniffer_new | 2.28 | Creates a new #SoupContentSniffer. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_buffer_size | `ContentSniffer.get_buffer_size() -> gsize` | soup_content_sniffer_get_buffer_size | 2.28 | Gets the number of bytes @sniffer needs in order to properly sniff a buffer. |
| sniff | `ContentSniffer.sniff(msg: Message, buffer: Buffer, params: out GLib.HashTable?) -> utf8` | soup_content_sniffer_sniff | 2.28 | Sniffs @buffer to determine its Content-Type. The result may also be influenced by the Content-Type declared in @msg's response headers. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_buffer_size | `get_buffer_size() -> gsize` |  | 2.28 | Gets the number of bytes @sniffer needs in order to properly sniff a buffer. |
| sniff | `sniff(msg: Message, buffer: Buffer, params: out GLib.HashTable?) -> utf8` |  | 2.28 | Sniffs @buffer to determine its Content-Type. The result may also be influenced by the Content-Type declared in @msg's response headers. |

### Soup.CookieJar

Parent: `GObject.Object` ?? Subclasses: `CookieJarDB`, `CookieJarText` ?? Implements: `SessionFeature` ?? GType: `SoupCookieJar` ?? C type: `SoupCookieJar`

Creates a new #SoupCookieJar. The base #SoupCookieJar class does not support persistent storage of cookies; use a subclass for that.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CookieJar.new() -> CookieJar` | soup_cookie_jar_new | 2.24 | Creates a new #SoupCookieJar. The base #SoupCookieJar class does not support persistent storage of cookies; use a subclass for that. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_cookie | `CookieJar.add_cookie(cookie: Cookie) -> none` | soup_cookie_jar_add_cookie | 2.26 | Adds @cookie to @jar, emitting the 'changed' signal if we are modifying an existing cookie or adding a valid new cookie ('valid' means that the coo... |
| add_cookie_full | `CookieJar.add_cookie_full(cookie: Cookie, uri: URI?, first_party: URI?) -> none` | soup_cookie_jar_add_cookie_full | 2.68 | Adds @cookie to @jar, emitting the 'changed' signal if we are modifying an existing cookie or adding a valid new cookie ('valid' means that the coo... |
| add_cookie_with_first_party | `CookieJar.add_cookie_with_first_party(first_party: URI, cookie: Cookie) -> none` | soup_cookie_jar_add_cookie_with_first_party | 2.40 | Adds @cookie to @jar, emitting the 'changed' signal if we are modifying an existing cookie or adding a valid new cookie ('valid' means that the coo... |
| all_cookies | `CookieJar.all_cookies() -> GLib.SList` | soup_cookie_jar_all_cookies | 2.26 | Constructs a #GSList with every cookie inside the @jar. The cookies in the list are a copy of the original, so you have to free them when you are d... |
| delete_cookie | `CookieJar.delete_cookie(cookie: Cookie) -> none` | soup_cookie_jar_delete_cookie | 2.26 | Deletes @cookie from @jar, emitting the 'changed' signal. |
| get_accept_policy | `CookieJar.get_accept_policy() -> CookieJarAcceptPolicy` | soup_cookie_jar_get_accept_policy | 2.30 | Gets @jar's #SoupCookieJarAcceptPolicy |
| get_cookie_list | `CookieJar.get_cookie_list(uri: URI, for_http: gboolean) -> GLib.SList` | soup_cookie_jar_get_cookie_list | 2.40 | Retrieves the list of cookies that would be sent with a request to @uri as a #GSList of #SoupCookie objects. If @for_http is %TRUE, the return valu... |
| get_cookie_list_with_same_site_info | `CookieJar.get_cookie_list_with_same_site_info(uri: URI, top_level: URI?, site_for_cookies: URI?, for_http: gboolean, is_safe_method: gboolean, is_top_level_navigation: gboolean) -> GLib.SList` | soup_cookie_jar_get_cookie_list_with_same_site_info | 2.70 | This is an extended version of soup_cookie_jar_get_cookie_list() that provides more information required to use SameSite cookies. See the SameSite ... |
| get_cookies | `CookieJar.get_cookies(uri: URI, for_http: gboolean) -> utf8` | soup_cookie_jar_get_cookies | 2.24 | Retrieves (in Cookie-header form) the list of cookies that would be sent with a request to @uri. If @for_http is %TRUE, the return value will inclu... |
| is_persistent | `CookieJar.is_persistent() -> gboolean` | soup_cookie_jar_is_persistent | 2.40 | Gets whether @jar stores cookies persistenly. |
| save | `CookieJar.save() -> none` | soup_cookie_jar_save | 2.24 | This function exists for backward compatibility, but does not do anything any more; cookie jars are saved automatically when they are changed. |
| set_accept_policy | `CookieJar.set_accept_policy(policy: CookieJarAcceptPolicy) -> none` | soup_cookie_jar_set_accept_policy | 2.30 | Sets @policy as the cookie acceptance policy for @jar. |
| set_cookie | `CookieJar.set_cookie(uri: URI, cookie: utf8) -> none` | soup_cookie_jar_set_cookie | 2.24 | Adds @cookie to @jar, exactly as though it had appeared in a Set-Cookie header returned from a request to @uri. Keep in mind that if the #SoupCooki... |
| set_cookie_with_first_party | `CookieJar.set_cookie_with_first_party(uri: URI, first_party: URI, cookie: utf8) -> none` | soup_cookie_jar_set_cookie_with_first_party | 2.30 | Adds @cookie to @jar, exactly as though it had appeared in a Set-Cookie header returned from a request to @uri. @first_party will be used to reject... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accept-policy | CookieJarAcceptPolicy | read, write | The policy the jar should follow to accept or reject cookies |
| read-only | gboolean | read, write, construct-only |  |

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
| is_persistent | `is_persistent() -> gboolean` |  | 2.40 | Gets whether @jar stores cookies persistenly. |
| save | `save() -> none` |  | 2.24 | This function exists for backward compatibility, but does not do anything any more; cookie jars are saved automatically when they are changed. |

### Soup.CookieJarDB

Parent: `CookieJar` ?? Implements: `SessionFeature` ?? GType: `SoupCookieJarDB` ?? C type: `SoupCookieJarDB`

Creates a #SoupCookieJarDB. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-session...

#### Fields

| Field | Type |
| --- | --- |
| parent | CookieJar |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CookieJarDB.new(filename: utf8, read_only: gboolean) -> CookieJar` | soup_cookie_jar_db_new | 2.42 | Creates a #SoupCookieJarDB. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-session... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only |  |

### Soup.CookieJarText

Parent: `CookieJar` ?? Implements: `SessionFeature` ?? GType: `SoupCookieJarText` ?? C type: `SoupCookieJarText`

Creates a #SoupCookieJarText. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-sessi...

#### Fields

| Field | Type |
| --- | --- |
| parent | CookieJar |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `CookieJarText.new(filename: utf8, read_only: gboolean) -> CookieJar` | soup_cookie_jar_text_new | 2.26 | Creates a #SoupCookieJarText. @filename will be read in at startup to create an initial set of cookies. If @read_only is %FALSE, then the non-sessi... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only |  |

### Soup.HSTSEnforcer

Parent: `GObject.Object` ?? Subclasses: `HSTSEnforcerDB` ?? Implements: `SessionFeature` ?? GType: `SoupHSTSEnforcer` ?? C type: `SoupHSTSEnforcer`

Creates a new #SoupHSTSEnforcer. The base #SoupHSTSEnforcer class does not support persistent storage of HSTS policies, see #SoupHSTSEnforcerDB for...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | HSTSEnforcerPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HSTSEnforcer.new() -> HSTSEnforcer` | soup_hsts_enforcer_new | 2.68 | Creates a new #SoupHSTSEnforcer. The base #SoupHSTSEnforcer class does not support persistent storage of HSTS policies, see #SoupHSTSEnforcerDB for... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_domains | `HSTSEnforcer.get_domains(session_policies: gboolean) -> GLib.List` | soup_hsts_enforcer_get_domains | 2.68 | Gets a list of domains for which there are policies in @enforcer. |
| get_policies | `HSTSEnforcer.get_policies(session_policies: gboolean) -> GLib.List` | soup_hsts_enforcer_get_policies | 2.68 | Gets a list with the policies in @enforcer. |
| has_valid_policy | `HSTSEnforcer.has_valid_policy(domain: utf8) -> gboolean` | soup_hsts_enforcer_has_valid_policy | 2.68 | Gets whether @hsts_enforcer has a currently valid policy for @domain. |
| is_persistent | `HSTSEnforcer.is_persistent() -> gboolean` | soup_hsts_enforcer_is_persistent | 2.68 | Gets whether @hsts_enforcer stores policies persistenly. |
| set_policy | `HSTSEnforcer.set_policy(policy: HSTSPolicy) -> none` | soup_hsts_enforcer_set_policy | 2.68 | Sets @policy to @hsts_enforcer. If @policy is expired, any existing HSTS policy for its host will be removed instead. If a policy existed for this ... |
| set_session_policy | `HSTSEnforcer.set_session_policy(domain: utf8, include_subdomains: gboolean) -> none` | soup_hsts_enforcer_set_session_policy | 2.68 | Sets a session policy for @domain. A session policy is a policy that is permanent to the lifetime of @hsts_enforcer's #SoupSession and doesn't expire. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `old_policy: HSTSPolicy, new_policy: HSTSPolicy` | none | first |  | Emitted when @hsts_enforcer changes. If a policy has been added, @new_policy will contain the newly-added policy and @old_policy will be %NULL. If ... |
| hsts-enforced | `message: Message` | none | first |  | Emitted when @hsts_enforcer has upgraded the protocol for @message to HTTPS as a result of matching its domain with a HSTS policy. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| changed | `changed(old_policy: HSTSPolicy, new_policy: HSTSPolicy) -> none` |  |  | the class closure for the #SoupHSTSEnforcer::changed signal. |
| has_valid_policy | `has_valid_policy(domain: utf8) -> gboolean` |  | 2.68 | Gets whether @hsts_enforcer has a currently valid policy for @domain. |
| hsts_enforced | `hsts_enforced(message: Message) -> none` |  |  |  |
| is_persistent | `is_persistent() -> gboolean` |  | 2.68 | Gets whether @hsts_enforcer stores policies persistenly. |

### Soup.HSTSEnforcerDB

Parent: `HSTSEnforcer` ?? Implements: `SessionFeature` ?? GType: `SoupHSTSEnforcerDB` ?? C type: `SoupHSTSEnforcerDB`

Creates a #SoupHSTSEnforcerDB. @filename will be read in during the initialization of a #SoupHSTSEnforcerDB, in order to create an initial set of H...

#### Fields

| Field | Type |
| --- | --- |
| parent | HSTSEnforcer |
| priv | HSTSEnforcerDBPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HSTSEnforcerDB.new(filename: utf8) -> HSTSEnforcer` | soup_hsts_enforcer_db_new | 2.68 | Creates a #SoupHSTSEnforcerDB. @filename will be read in during the initialization of a #SoupHSTSEnforcerDB, in order to create an initial set of H... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| filename | utf8 | read, write, construct-only | The filename of the SQLite database where HSTS policies are stored. |

### Soup.Logger

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupLogger` ?? C type: `SoupLogger`

Creates a new #SoupLogger with the given debug level. If @level is %SOUP_LOGGER_LOG_BODY, @max_body_size gives the maximum number of bytes of the b...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Logger.new(level: LoggerLogLevel, max_body_size: gint) -> Logger` | soup_logger_new |  | Creates a new #SoupLogger with the given debug level. If @level is %SOUP_LOGGER_LOG_BODY, @max_body_size gives the maximum number of bytes of the b... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| attach | `Logger.attach(session: Session) -> none` | soup_logger_attach |  | Sets @logger to watch @session and print debug information for its messages. (The session will take a reference on @logger, which will be removed w... |
| detach | `Logger.detach(session: Session) -> none` | soup_logger_detach |  | Stops @logger from watching @session. |
| set_printer | `Logger.set_printer(printer: LoggerPrinter, printer_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_logger_set_printer |  | Sets up an alternate log printing routine, if you don't want the log to go to <literal>stdout</literal>. |
| set_request_filter | `Logger.set_request_filter(request_filter: LoggerFilter, filter_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_logger_set_request_filter |  | Sets up a filter to determine the log level for a given request. For each HTTP request @logger will invoke @request_filter to determine how much (i... |
| set_response_filter | `Logger.set_response_filter(response_filter: LoggerFilter, filter_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_logger_set_response_filter |  | Sets up a filter to determine the log level for a given response. For each HTTP response @logger will invoke @response_filter to determine how much... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| level | LoggerLogLevel | read, write | The level of logging output |
| max-body-size | gint | read, write | If #SoupLogger:level is %SOUP_LOGGER_LOG_BODY, this gives the maximum number of bytes of the body that will be logged. (-1 means "no limit".) |

### Soup.Message

Parent: `GObject.Object` ?? GType: `SoupMessage` ?? C type: `SoupMessage`

Represents an HTTP message being sent or received. @status_code will normally be a #SoupStatus value, eg, %SOUP_STATUS_OK, though of course it migh...

#### Fields

| Field | Type |
| --- | --- |
| method | utf8 |
| parent | GObject.Object |
| reason_phrase | utf8 |
| request_body | MessageBody |
| request_headers | MessageHeaders |
| response_body | MessageBody |
| response_headers | MessageHeaders |
| status_code | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Message.new(method: utf8, uri_string: utf8) -> Message` | soup_message_new |  | Creates a new empty #SoupMessage, which will connect to @uri |
| new_from_uri | `Message.new_from_uri(method: utf8, uri: URI) -> Message` | soup_message_new_from_uri |  | Creates a new empty #SoupMessage, which will connect to @uri |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_header_handler | `Message.add_header_handler(signal: utf8, header: utf8, callback: GObject.Callback, user_data: gpointer?) -> guint` | soup_message_add_header_handler |  | Adds a signal handler to @msg for @signal, as with g_signal_connect(), but the @callback will only be run if @msg's incoming messages headers (that... |
| add_status_code_handler | `Message.add_status_code_handler(signal: utf8, status_code: guint, callback: GObject.Callback, user_data: gpointer?) -> guint` | soup_message_add_status_code_handler |  | Adds a signal handler to @msg for @signal, as with g_signal_connect(), but the @callback will only be run if @msg has the status @status_code. @sig... |
| content_sniffed | `Message.content_sniffed(content_type: utf8, params: GLib.HashTable) -> none` | soup_message_content_sniffed |  |  |
| disable_feature | `Message.disable_feature(feature_type: GType) -> none` | soup_message_disable_feature | 2.28 | This disables the actions of #SoupSessionFeature<!-- -->s with the given @feature_type (or a subclass of that type) on @msg, so that @msg is proces... |
| finished | `Message.finished() -> none` | soup_message_finished |  |  |
| get_address | `Message.get_address() -> Address` | soup_message_get_address | 2.26 | Gets the address @msg's URI points to. After first setting the URI on a message, this will be unresolved, although the message's session will resol... |
| get_first_party | `Message.get_first_party() -> URI` | soup_message_get_first_party | 2.30 | Gets @msg's first-party #SoupURI |
| get_flags | `Message.get_flags() -> MessageFlags` | soup_message_get_flags |  | Gets the flags on @msg |
| get_http_version | `Message.get_http_version() -> HTTPVersion` | soup_message_get_http_version |  | Gets the HTTP version of @msg. This is the minimum of the version from the request and the version from the response. |
| get_https_status | `Message.get_https_status(certificate: out Gio.TlsCertificate, errors: out Gio.TlsCertificateFlags) -> gboolean` | soup_message_get_https_status | 2.34 | If @msg is using https (or attempted to use https but got %SOUP_STATUS_SSL_FAILED), this retrieves the #GTlsCertificate associated with its connect... |
| get_is_top_level_navigation | `Message.get_is_top_level_navigation() -> gboolean` | soup_message_get_is_top_level_navigation | 2.70 | a #SoupMessage |
| get_priority | `Message.get_priority() -> MessagePriority` | soup_message_get_priority | 2.44 | Retrieves the #SoupMessagePriority. If not set this value defaults to #SOUP_MESSAGE_PRIORITY_NORMAL. |
| get_site_for_cookies | `Message.get_site_for_cookies() -> URI` | soup_message_get_site_for_cookies | 2.70 | Gets @msg's site for cookies #SoupURI |
| get_soup_request | `Message.get_soup_request() -> Request` | soup_message_get_soup_request | 2.42 | If @msg is associated with a #SoupRequest, this returns that request. Otherwise it returns %NULL. |
| get_uri | `Message.get_uri() -> URI` | soup_message_get_uri |  | Gets @msg's URI |
| got_body | `Message.got_body() -> none` | soup_message_got_body |  |  |
| got_chunk | `Message.got_chunk(chunk: Buffer) -> none` | soup_message_got_chunk |  |  |
| got_headers | `Message.got_headers() -> none` | soup_message_got_headers |  |  |
| got_informational | `Message.got_informational() -> none` | soup_message_got_informational |  |  |
| is_feature_disabled | `Message.is_feature_disabled(feature_type: GType) -> gboolean` | soup_message_is_feature_disabled | 2.72 | Get whether #SoupSessionFeature<!-- -->s of the given @feature_type (or a subclass of that type) are disabled on @msg. See soup_message_disable_fea... |
| is_keepalive | `Message.is_keepalive() -> gboolean` | soup_message_is_keepalive |  | Determines whether or not @msg's connection can be kept alive for further requests after processing @msg, based on the HTTP version, Connection hea... |
| restarted | `Message.restarted() -> none` | soup_message_restarted |  |  |
| set_chunk_allocator | `Message.set_chunk_allocator(allocator: ChunkAllocator, user_data: gpointer?, destroy_notify: GLib.DestroyNotify) -> none` | soup_message_set_chunk_allocator |  | Sets an alternate chunk-allocation function to use when reading @msg's body when using the traditional (ie, non-#SoupRequest<!-- -->-based) API. Ev... |
| set_first_party | `Message.set_first_party(first_party: URI) -> none` | soup_message_set_first_party | 2.30 | Sets @first_party as the main document #SoupURI for @msg. For details of when and how this is used refer to the documentation for #SoupCookieJarAcc... |
| set_flags | `Message.set_flags(flags: MessageFlags) -> none` | soup_message_set_flags |  | Sets the specified flags on @msg. |
| set_http_version | `Message.set_http_version(version: HTTPVersion) -> none` | soup_message_set_http_version |  | Sets the HTTP version on @msg. The default version is %SOUP_HTTP_1_1. Setting it to %SOUP_HTTP_1_0 will prevent certain functionality from being used. |
| set_is_top_level_navigation | `Message.set_is_top_level_navigation(is_top_level_navigation: gboolean) -> none` | soup_message_set_is_top_level_navigation | 2.70 | See the same-site spec for more information. |
| set_priority | `Message.set_priority(priority: MessagePriority) -> none` | soup_message_set_priority | 2.44 | Sets the priority of a message. Note that this won't have any effect unless used before the message is added to the session's message processing qu... |
| set_redirect | `Message.set_redirect(status_code: guint, redirect_uri: utf8) -> none` | soup_message_set_redirect | 2.38 | Sets @msg's status_code to @status_code and adds a Location header pointing to @redirect_uri. Use this from a #SoupServer when you want to redirect... |
| set_request | `Message.set_request(content_type: utf8?, req_use: MemoryUse, req_body: guint8?, req_length: gsize) -> none` | soup_message_set_request |  | Convenience function to set the request body of a #SoupMessage. If @content_type is %NULL, the request body must be empty as well. |
| set_response | `Message.set_response(content_type: utf8?, resp_use: MemoryUse, resp_body: guint8?, resp_length: gsize) -> none` | soup_message_set_response |  | Convenience function to set the response body of a #SoupMessage. If @content_type is %NULL, the response body must be empty as well. |
| set_site_for_cookies | `Message.set_site_for_cookies(site_for_cookies: URI?) -> none` | soup_message_set_site_for_cookies | 2.70 | Sets @site_for_cookies as the policy URL for same-site cookies for @msg. It is either the URL of the top-level document or %NULL depending on wheth... |
| set_status | `Message.set_status(status_code: guint) -> none` | soup_message_set_status |  | Sets @msg's status code to @status_code. If @status_code is a known value, it will also set @msg's reason_phrase. |
| set_status_full | `Message.set_status_full(status_code: guint, reason_phrase: utf8) -> none` | soup_message_set_status_full |  | Sets @msg's status code and reason phrase. |
| set_uri | `Message.set_uri(uri: URI) -> none` | soup_message_set_uri |  | Sets @msg's URI to @uri. If @msg has already been sent and you want to re-send it with the new URI, you need to call soup_session_requeue_message(). |
| starting | `Message.starting() -> none` | soup_message_starting |  |  |
| wrote_body | `Message.wrote_body() -> none` | soup_message_wrote_body |  |  |
| wrote_body_data | `Message.wrote_body_data(chunk: Buffer) -> none` | soup_message_wrote_body_data |  |  |
| wrote_chunk | `Message.wrote_chunk() -> none` | soup_message_wrote_chunk |  |  |
| wrote_headers | `Message.wrote_headers() -> none` | soup_message_wrote_headers |  |  |
| wrote_informational | `Message.wrote_informational() -> none` | soup_message_wrote_informational |  |  |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| first-party | URI | read, write | The #SoupURI loaded in the application when the message was queued. |
| flags | MessageFlags | read, write |  |
| http-version | HTTPVersion | read, write |  |
| is-top-level-navigation | gboolean | read, write | Set when the message is navigating between top level domains. |
| method | utf8 | read, write |  |
| priority | MessagePriority | read, write |  |
| reason-phrase | utf8 | read, write |  |
| request-body | MessageBody | read |  |
| request-body-data | GLib.Bytes | read | The message's HTTP request body, as a #GBytes. |
| request-headers | MessageHeaders | read |  |
| response-body | MessageBody | read |  |
| response-body-data | GLib.Bytes | read | The message's HTTP response body, as a #GBytes. |
| response-headers | MessageHeaders | read |  |
| server-side | gboolean | read, write, construct-only |  |
| site-for-cookies | URI | read, write |  |
| status-code | guint | read, write |  |
| tls-certificate | Gio.TlsCertificate | read, write | The #GTlsCertificate associated with the message |
| tls-errors | Gio.TlsCertificateFlags | read, write | The verification errors on #SoupMessage:tls-certificate |
| uri | URI | read, write |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| content-sniffed | `type: utf8, params: GLib.HashTable` | none | first | 2.28 | This signal is emitted after #SoupMessage::got-headers, and before the first #SoupMessage::got-chunk. If content sniffing is disabled, or no conten... |
| finished | `` | none | first |  | Emitted when all HTTP processing is finished for a message. (After #SoupMessage::got_body for client-side messages, or after #SoupMessage::wrote_bo... |
| got-body | `` | none | first |  | Emitted after receiving the complete message body. (For a server-side message, this means it has received the request body. For a client-side messa... |
| got-chunk | `chunk: Buffer` | none | first |  | Emitted after receiving a chunk of a message body. Note that "chunk" in this context means any subpiece of the body, not necessarily the specific H... |
| got-headers | `` | none | first |  | Emitted after receiving all message headers for a message. (For a client-side message, this is after receiving the Status-Line and response headers... |
| got-informational | `` | none | first |  | Emitted after receiving a 1xx (Informational) response for a (client-side) message. The response_headers will be filled in with the headers associa... |
| network-event | `event: Gio.SocketClientEvent, connection: Gio.IOStream` | none | first | 2.38 | Emitted to indicate that some network-related event related to @msg has occurred. This essentially proxies the #GSocketClient::event signal, but on... |
| restarted | `` | none | first |  | Emitted when a request that was already sent once is now being sent again (eg, because the first attempt received a redirection response, or becaus... |
| starting | `` | none | first | 2.50 | Emitted just before a message is sent. |
| wrote-body | `` | none | first |  | Emitted immediately after writing the complete body for a message. (For a client-side message, this means that libsoup is done writing and is now w... |
| wrote-body-data | `chunk: Buffer` | none | first | 2.24 | Emitted immediately after writing a portion of the message body to the network. Unlike #SoupMessage::wrote_chunk, this is emitted after every succe... |
| wrote-chunk | `` | none | first |  | Emitted immediately after writing a body chunk for a message. Note that this signal is not parallel to #SoupMessage::got_chunk; it is emitted only ... |
| wrote-headers | `` | none | first |  | Emitted immediately after writing the headers for a message. (For a client-side message, this is after writing the request headers; for a server-si... |
| wrote-informational | `` | none | first |  | Emitted immediately after writing a 1xx (Informational) response for a (server-side) message. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| finished | `finished() -> none` |  |  |  |
| got_body | `got_body() -> none` |  |  |  |
| got_chunk | `got_chunk(chunk: Buffer) -> none` |  |  |  |
| got_headers | `got_headers() -> none` |  |  |  |
| got_informational | `got_informational() -> none` |  |  |  |
| restarted | `restarted() -> none` |  |  |  |
| starting | `starting() -> none` |  |  |  |
| wrote_body | `wrote_body() -> none` |  |  |  |
| wrote_chunk | `wrote_chunk() -> none` |  |  |  |
| wrote_headers | `wrote_headers() -> none` |  |  |  |
| wrote_informational | `wrote_informational() -> none` |  |  |  |

### Soup.MultipartInputStream

Parent: `Gio.FilterInputStream` ?? Implements: `Gio.PollableInputStream` ?? GType: `SoupMultipartInputStream` ?? C type: `SoupMultipartInputStream`

Creates a new #SoupMultipartInputStream that wraps the #GInputStream obtained by sending the #SoupRequest. Reads should not be done directly throug...

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | Gio.FilterInputStream |
| priv | MultipartInputStreamPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MultipartInputStream.new(msg: Message, base_stream: Gio.InputStream) -> MultipartInputStream` | soup_multipart_input_stream_new | 2.40 | Creates a new #SoupMultipartInputStream that wraps the #GInputStream obtained by sending the #SoupRequest. Reads should not be done directly throug... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_headers | `MultipartInputStream.get_headers() -> MessageHeaders` | soup_multipart_input_stream_get_headers | 2.40 | Obtains the headers for the part currently being processed. Note that the #SoupMessageHeaders that are returned are owned by the #SoupMultipartInpu... |
| next_part | `MultipartInputStream.next_part(cancellable: Gio.Cancellable?) -> Gio.InputStream throws` | soup_multipart_input_stream_next_part | 2.40 | Obtains an input stream for the next part. When dealing with a multipart response the input stream needs to be wrapped in a #SoupMultipartInputStre... |
| next_part_async | `MultipartInputStream.next_part_async(io_priority: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, data: gpointer?) -> none` | soup_multipart_input_stream_next_part_async | 2.40 | Obtains a #GInputStream for the next request. See soup_multipart_input_stream_next_part() for details on the workflow. |
| next_part_finish | `MultipartInputStream.next_part_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` | soup_multipart_input_stream_next_part_finish | 2.40 | Finishes an asynchronous request for the next part. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| message | Message | read, write, construct-only |  |

### Soup.ProxyResolverDefault

Parent: `GObject.Object` ?? Implements: `ProxyURIResolver`, `SessionFeature` ?? GType: `SoupProxyResolverDefault` ?? C type: `SoupProxyResolverDefault`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| gproxy-resolver | Gio.ProxyResolver | write |  |

### Soup.Request

Parent: `GObject.Object` ?? Subclasses: `RequestData`, `RequestFile`, `RequestHTTP` ?? Implements: `Gio.Initable` ?? GType: `SoupRequest` ?? C type: `SoupRequest`

A request to retrieve a particular URI.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | RequestPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_content_length | `Request.get_content_length() -> gint64` | soup_request_get_content_length | 2.42 | Gets the length of the data represented by @request. For most request types, this will not be known until after you call soup_request_send() or sou... |
| get_content_type | `Request.get_content_type() -> utf8` | soup_request_get_content_type | 2.42 | Gets the type of the data represented by @request. For most request types, this will not be known until after you call soup_request_send() or soup_... |
| get_session | `Request.get_session() -> Session` | soup_request_get_session | 2.42 | Gets @request's #SoupSession |
| get_uri | `Request.get_uri() -> URI` | soup_request_get_uri | 2.42 | Gets @request's URI |
| send | `Request.send(cancellable: Gio.Cancellable?) -> Gio.InputStream throws` | soup_request_send | 2.42 | Synchronously requests the URI pointed to by @request, and returns a #GInputStream that can be used to read its contents. Note that you cannot use ... |
| send_async | `Request.send_async(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_request_send_async | 2.42 | Begins an asynchronously request for the URI pointed to by @request. Note that you cannot use this method with #SoupRequests attached to a #SoupSes... |
| send_finish | `Request.send_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` | soup_request_send_finish | 2.42 | Gets the result of a soup_request_send_async(). |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| session | Session | read, write, construct-only | The request's #SoupSession. |
| uri | URI | read, write, construct-only | The request URI. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_uri | `check_uri(uri: URI) -> gboolean throws` |  |  |  |
| get_content_length | `get_content_length() -> gint64` |  | 2.42 | Gets the length of the data represented by @request. For most request types, this will not be known until after you call soup_request_send() or sou... |
| get_content_type | `get_content_type() -> utf8` |  | 2.42 | Gets the type of the data represented by @request. For most request types, this will not be known until after you call soup_request_send() or soup_... |
| send | `send(cancellable: Gio.Cancellable?) -> Gio.InputStream throws` |  | 2.42 | Synchronously requests the URI pointed to by @request, and returns a #GInputStream that can be used to read its contents. Note that you cannot use ... |
| send_async | `send_async(cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` |  | 2.42 | Begins an asynchronously request for the URI pointed to by @request. Note that you cannot use this method with #SoupRequests attached to a #SoupSes... |
| send_finish | `send_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` |  | 2.42 | Gets the result of a soup_request_send_async(). |

### Soup.RequestData

Parent: `Request` ?? Implements: `Gio.Initable` ?? GType: `SoupRequestData` ?? C type: `SoupRequestData`

#### Fields

| Field | Type |
| --- | --- |
| parent | Request |
| priv | RequestDataPrivate |

### Soup.Requester

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupRequester` ?? C type: `SoupRequester`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | RequesterPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Requester.new() -> Requester` | soup_requester_new |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| request | `Requester.request(uri_string: utf8) -> Request throws` | soup_requester_request |  |  |
| request_uri | `Requester.request_uri(uri: URI) -> Request throws` | soup_requester_request_uri |  |  |

### Soup.RequestFile

Parent: `Request` ?? Implements: `Gio.Initable` ?? GType: `SoupRequestFile` ?? C type: `SoupRequestFile`

Gets a #GFile corresponding to @file's URI

#### Fields

| Field | Type |
| --- | --- |
| parent | Request |
| priv | RequestFilePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_file | `RequestFile.get_file() -> Gio.File` | soup_request_file_get_file | 2.40 | Gets a #GFile corresponding to @file's URI |

### Soup.RequestHTTP

Parent: `Request` ?? Implements: `Gio.Initable` ?? GType: `SoupRequestHTTP` ?? C type: `SoupRequestHTTP`

Gets a new reference to the #SoupMessage associated to this SoupRequest

#### Fields

| Field | Type |
| --- | --- |
| parent | Request |
| priv | RequestHTTPPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_message | `RequestHTTP.get_message() -> Message` | soup_request_http_get_message | 2.40 | Gets a new reference to the #SoupMessage associated to this SoupRequest |

### Soup.Server

Parent: `GObject.Object` ?? GType: `SoupServer` ?? C type: `SoupServer`

Creates a new #SoupServer. This is exactly equivalent to calling g_object_new() and specifying %SOUP_TYPE_SERVER as the type.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Server.new(optname1: utf8, ...: void) -> Server` | soup_server_new |  | Creates a new #SoupServer. This is exactly equivalent to calling g_object_new() and specifying %SOUP_TYPE_SERVER as the type. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accept_iostream | `Server.accept_iostream(stream: Gio.IOStream, local_addr: Gio.SocketAddress?, remote_addr: Gio.SocketAddress?) -> gboolean throws` | soup_server_accept_iostream | 2.50 | Add a new client stream to the @server. |
| add_auth_domain | `Server.add_auth_domain(auth_domain: AuthDomain) -> none` | soup_server_add_auth_domain |  | Adds an authentication domain to @server. Each auth domain will have the chance to require authentication for each request that comes in; normally ... |
| add_early_handler | `Server.add_early_handler(path: utf8?, callback: ServerCallback, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_server_add_early_handler | 2.50 | Adds an "early" handler to @server for requests under @path. Note that "normal" and "early" handlers are matched up together, so if you add a norma... |
| add_handler | `Server.add_handler(path: utf8?, callback: ServerCallback, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_server_add_handler |  | Adds a handler to @server for requests under @path. If @path is %NULL or "/", then this will be the default handler for all requests that don't hav... |
| add_websocket_extension | `Server.add_websocket_extension(extension_type: GType) -> none` | soup_server_add_websocket_extension | 2.68 | Add support for a WebSocket extension of the given @extension_type. When a WebSocket client requests an extension of @extension_type, a new #SoupWe... |
| add_websocket_handler | `Server.add_websocket_handler(path: utf8?, origin: utf8?, protocols: utf8?, callback: ServerWebsocketCallback, user_data: gpointer?, destroy: GLib.DestroyNotify) -> none` | soup_server_add_websocket_handler |  | Adds a WebSocket handler to @server for requests under @path. (If @path is %NULL or "/", then this will be the default handler for all requests tha... |
| disconnect | `Server.disconnect() -> none` | soup_server_disconnect |  | Closes and frees @server's listening sockets. If you are using the old #SoupServer APIs, this also includes the effect of soup_server_quit(). Note ... |
| get_async_context | `Server.get_async_context() -> GLib.MainContext` | soup_server_get_async_context |  | Gets @server's async_context, if you are using the old API. (With the new API, the server runs in the thread's thread-default #GMainContext, regard... |
| get_listener | `Server.get_listener() -> Socket` | soup_server_get_listener |  | Gets @server's listening socket, if you are using the old API. You should treat this socket as read-only; writing to it or modifiying it may cause ... |
| get_listeners | `Server.get_listeners() -> GLib.SList` | soup_server_get_listeners |  | Gets @server's list of listening sockets. You should treat these sockets as read-only; writing to or modifiying any of these sockets may cause @ser... |
| get_port | `Server.get_port() -> guint` | soup_server_get_port |  | Gets the TCP port that @server is listening on, if you are using the old API. |
| get_uris | `Server.get_uris() -> GLib.SList` | soup_server_get_uris | 2.48 | Gets a list of URIs corresponding to the interfaces @server is listening on. These will contain IP addresses, not hostnames, and will also indicate... |
| is_https | `Server.is_https() -> gboolean` | soup_server_is_https |  | Checks whether @server is capable of https. In order for a server to run https, you must call soup_server_set_ssl_cert_file(), or set the #SoupServ... |
| listen | `Server.listen(address: Gio.SocketAddress, options: ServerListenOptions) -> gboolean throws` | soup_server_listen | 2.48 | This attempts to set up @server to listen for connections on @address. If @options includes %SOUP_SERVER_LISTEN_HTTPS, and @server has been configu... |
| listen_all | `Server.listen_all(port: guint, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_all | 2.48 | This attempts to set up @server to listen for connections on all interfaces on the system. (That is, it listens on the addresses <literal>0.0.0.0</... |
| listen_fd | `Server.listen_fd(fd: gint, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_fd | 2.48 | This attempts to set up @server to listen for connections on @fd. See soup_server_listen() for more details. Note that @server will close @fd when ... |
| listen_local | `Server.listen_local(port: guint, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_local | 2.48 | This attempts to set up @server to listen for connections on "localhost" (that is, <literal>127.0.0.1</literal> and/or <literal>::1</literal>, depe... |
| listen_socket | `Server.listen_socket(socket: Gio.Socket, options: ServerListenOptions) -> gboolean throws` | soup_server_listen_socket | 2.48 | This attempts to set up @server to listen for connections on @socket. See soup_server_listen() for more details. |
| pause_message | `Server.pause_message(msg: Message) -> none` | soup_server_pause_message |  | Pauses I/O on @msg. This can be used when you need to return from the server handler without having the full response ready yet. Use soup_server_un... |
| quit | `Server.quit() -> none` | soup_server_quit |  | Stops processing for @server, if you are using the old API. Call this to clean up after soup_server_run_async(), or to terminate a call to soup_ser... |
| remove_auth_domain | `Server.remove_auth_domain(auth_domain: AuthDomain) -> none` | soup_server_remove_auth_domain |  | Removes @auth_domain from @server. |
| remove_handler | `Server.remove_handler(path: utf8) -> none` | soup_server_remove_handler |  | Removes all handlers (early and normal) registered at @path. |
| remove_websocket_extension | `Server.remove_websocket_extension(extension_type: GType) -> none` | soup_server_remove_websocket_extension | 2.68 | Removes support for WebSocket extension of type @extension_type (or any subclass of @extension_type) from @server. You can also remove extensions e... |
| run | `Server.run() -> none` | soup_server_run |  | Starts @server, if you are using the old API, causing it to listen for and process incoming connections. Unlike soup_server_run_async(), this creat... |
| run_async | `Server.run_async() -> none` | soup_server_run_async |  | Starts @server, if you are using the old API, causing it to listen for and process incoming connections. The server runs in @server's #GMainContext... |
| set_ssl_cert_file | `Server.set_ssl_cert_file(ssl_cert_file: utf8, ssl_key_file: utf8) -> gboolean throws` | soup_server_set_ssl_cert_file | 2.48 | Sets @server up to do https, using the SSL/TLS certificate specified by @ssl_cert_file and @ssl_key_file (which may point to the same file). Altern... |
| unpause_message | `Server.unpause_message(msg: Message) -> none` | soup_server_unpause_message |  | Resumes I/O on @msg. Use this to resume after calling soup_server_pause_message(), or after adding a new chunk to a chunked response. I/O won't act... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| add-websocket-extension | GType | write | Add support for #SoupWebsocketExtension of the given type. (Shortcut for calling soup_server_add_websocket_extension().) |
| async-context | gpointer | read, write, construct-only | The server's #GMainContext, if you are using the old API. Servers created using soup_server_listen() will listen on the #GMainContext that was the ... |
| http-aliases | utf8 | read, write | A %NULL-terminated array of URI schemes that should be considered to be aliases for "http". Eg, if this included <literal>"dav"</literal>, than a U... |
| https-aliases | utf8 | read, write | A comma-delimited list of URI schemes that should be considered to be aliases for "https". See #SoupServer:http-aliases for more information. The d... |
| interface | Address | read, write, construct-only | The address of the network interface the server is listening on, if you are using the old #SoupServer API. (This will not be set if you use soup_se... |
| port | guint | read, write, construct-only | The port the server is listening on, if you are using the old #SoupServer API. (This will not be set if you use soup_server_listen(), etc.) |
| raw-paths | gboolean | read, write, construct-only |  |
| remove-websocket-extension | GType | write | Remove support for #SoupWebsocketExtension of the given type. (Shortcut for calling soup_server_remove_websocket_extension().) |
| server-header | utf8 | read, write | If non-%NULL, the value to use for the "Server" header on #SoupMessage<!-- -->s processed by this server. The Server header is the server equivalen... |
| ssl-cert-file | utf8 | read, write, construct-only | Path to a file containing a PEM-encoded certificate. If you set this property and #SoupServer:ssl-key-file at construct time, then soup_server_new(... |
| ssl-key-file | utf8 | read, write, construct-only | Path to a file containing a PEM-encoded private key. See #SoupServer:ssl-cert-file for more information about how this is used. |
| tls-certificate | Gio.TlsCertificate | read, write, construct-only | A #GTlsCertificate that has a #GTlsCertificate:private-key set. If this is set, then the server will be able to speak https in addition to (or inst... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| request-aborted | `message: Message, client: ClientContext` | none | first |  | Emitted when processing has failed for a message; this could mean either that it could not be read (if #SoupServer::request_read has not been emitt... |
| request-finished | `message: Message, client: ClientContext` | none | first |  | Emitted when the server has finished writing a response to a request. |
| request-read | `message: Message, client: ClientContext` | none | first |  | Emitted when the server has successfully read a request. @message will have all of its request-side information filled in, and if the message was a... |
| request-started | `message: Message, client: ClientContext` | none | first |  | Emitted when the server has started reading a new request. @message will be completely blank; not even the Request-Line will have been read yet. Ab... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| request_aborted | `request_aborted(msg: Message, client: ClientContext) -> none` |  |  |  |
| request_finished | `request_finished(msg: Message, client: ClientContext) -> none` |  |  |  |
| request_read | `request_read(msg: Message, client: ClientContext) -> none` |  |  |  |
| request_started | `request_started(msg: Message, client: ClientContext) -> none` |  |  |  |

### Soup.Session

Parent: `GObject.Object` ?? Subclasses: `SessionAsync`, `SessionSync` ?? GType: `SoupSession` ?? C type: `SoupSession`

Creates a #SoupSession with the default options.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Session.new() -> Session` | soup_session_new | 2.42 | Creates a #SoupSession with the default options. |
| new_with_options | `Session.new_with_options(optname1: utf8, ...: void) -> Session` | soup_session_new_with_options | 2.42 | Creates a #SoupSession with the specified options. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| abort | `Session.abort() -> none` | soup_session_abort |  | Cancels all pending requests in @session and closes all idle persistent connections. The message cancellation has the same semantics as with soup_s... |
| add_feature | `Session.add_feature(feature: SessionFeature) -> none` | soup_session_add_feature | 2.24 | Adds @feature's functionality to @session. You can also add a feature to the session at construct time by using the %SOUP_SESSION_ADD_FEATURE prope... |
| add_feature_by_type | `Session.add_feature_by_type(feature_type: GType) -> none` | soup_session_add_feature_by_type | 2.24 | If @feature_type is the type of a class that implements #SoupSessionFeature, this creates a new feature of that type and adds it to @session as wit... |
| cancel_message | `Session.cancel_message(msg: Message, status_code: guint) -> none` | soup_session_cancel_message |  | Causes @session to immediately finish processing @msg (regardless of its current state) with a final status_code of @status_code. You may call this... |
| connect_async | `Session.connect_async(uri: URI, cancellable: Gio.Cancellable?, progress_callback: SessionConnectProgressCallback?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_connect_async | 2.62 | Start a connection to @uri. The operation can be monitored by providing a @progress_callback and finishes when the connection is done or an error o... |
| connect_finish | `Session.connect_finish(result: Gio.AsyncResult) -> Gio.IOStream throws` | soup_session_connect_finish | 2.62 | Gets the #GIOStream created for the connection to communicate with the server. |
| get_async_context | `Session.get_async_context() -> GLib.MainContext` | soup_session_get_async_context |  | Gets @session's #SoupSession:async-context. This does not add a ref to the context, so you will need to ref it yourself if you want it to outlive i... |
| get_feature | `Session.get_feature(feature_type: GType) -> SessionFeature` | soup_session_get_feature | 2.26 | Gets the first feature in @session of type @feature_type. For features where there may be more than one feature of a given type, use soup_session_g... |
| get_feature_for_message | `Session.get_feature_for_message(feature_type: GType, msg: Message) -> SessionFeature` | soup_session_get_feature_for_message | 2.28 | Gets the first feature in @session of type @feature_type, provided that it is not disabled for @msg. As with soup_session_get_feature(), this shoul... |
| get_features | `Session.get_features(feature_type: GType) -> GLib.SList` | soup_session_get_features | 2.26 | Generates a list of @session's features of type @feature_type. (If you want to see all features, you can pass %SOUP_TYPE_SESSION_FEATURE for @featu... |
| has_feature | `Session.has_feature(feature_type: GType) -> gboolean` | soup_session_has_feature | 2.42 | Tests if @session has at a feature of type @feature_type (which can be the type of either a #SoupSessionFeature, or else a subtype of some class ma... |
| pause_message | `Session.pause_message(msg: Message) -> none` | soup_session_pause_message |  | Pauses HTTP I/O on @msg. Call soup_session_unpause_message() to resume I/O. This may only be called for asynchronous messages (those sent on a #Sou... |
| prefetch_dns | `Session.prefetch_dns(hostname: utf8, cancellable: Gio.Cancellable?, callback: AddressCallback?, user_data: gpointer?) -> none` | soup_session_prefetch_dns | 2.38 | Tells @session that an URI from the given @hostname may be requested shortly, and so the session can try to prepare by resolving the domain name in... |
| prepare_for_uri | `Session.prepare_for_uri(uri: URI) -> none` | soup_session_prepare_for_uri | 2.30 | Tells @session that @uri may be requested shortly, and so the session can try to prepare (resolving the domain name, obtaining proxy address, etc.)... |
| queue_message | `Session.queue_message(msg: Message, callback: SessionCallback?, user_data: gpointer?) -> none` | soup_session_queue_message |  | Queues the message @msg for asynchronously sending the request and receiving a response in the current thread-default #GMainContext. If @msg has be... |
| redirect_message | `Session.redirect_message(msg: Message) -> gboolean` | soup_session_redirect_message | 2.38 | Updates @msg's URI according to its status code and "Location" header, and requeues it on @session. Use this when you have set %SOUP_MESSAGE_NO_RED... |
| remove_feature | `Session.remove_feature(feature: SessionFeature) -> none` | soup_session_remove_feature | 2.24 | Removes @feature's functionality from @session. |
| remove_feature_by_type | `Session.remove_feature_by_type(feature_type: GType) -> none` | soup_session_remove_feature_by_type | 2.24 | Removes all features of type @feature_type (or any subclass of @feature_type) from @session. You can also remove standard features from the session... |
| request | `Session.request(uri_string: utf8) -> Request throws` | soup_session_request | 2.42 | Creates a #SoupRequest for retrieving @uri_string. |
| request_http | `Session.request_http(method: utf8, uri_string: utf8) -> RequestHTTP throws` | soup_session_request_http | 2.42 | Creates a #SoupRequest for retrieving @uri_string, which must be an "http" or "https" URI (or another protocol listed in @session's #SoupSession:ht... |
| request_http_uri | `Session.request_http_uri(method: utf8, uri: URI) -> RequestHTTP throws` | soup_session_request_http_uri | 2.42 | Creates a #SoupRequest for retrieving @uri, which must be an "http" or "https" URI (or another protocol listed in @session's #SoupSession:http-alia... |
| request_uri | `Session.request_uri(uri: URI) -> Request throws` | soup_session_request_uri | 2.42 | Creates a #SoupRequest for retrieving @uri. |
| requeue_message | `Session.requeue_message(msg: Message) -> none` | soup_session_requeue_message |  | This causes @msg to be placed back on the queue to be attempted again. |
| send | `Session.send(msg: Message, cancellable: Gio.Cancellable?) -> Gio.InputStream throws` | soup_session_send | 2.42 | Synchronously sends @msg and waits for the beginning of a response. On success, a #GInputStream will be returned which you can use to read the resp... |
| send_async | `Session.send_async(msg: Message, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_send_async | 2.42 | Asynchronously sends @msg and waits for the beginning of a response. When @callback is called, then either @msg has been sent, and its response hea... |
| send_finish | `Session.send_finish(result: Gio.AsyncResult) -> Gio.InputStream throws` | soup_session_send_finish | 2.42 | Gets the response to a soup_session_send_async() call and (if successful), returns a #GInputStream that can be used to read the response body. |
| send_message | `Session.send_message(msg: Message) -> guint` | soup_session_send_message |  | Synchronously send @msg. This call will not return until the transfer is finished successfully or there is an unrecoverable error. Unlike with soup... |
| steal_connection | `Session.steal_connection(msg: Message) -> Gio.IOStream` | soup_session_steal_connection | 2.50 | "Steals" the HTTP connection associated with @msg from @session. This happens immediately, regardless of the current state of the connection, and @... |
| unpause_message | `Session.unpause_message(msg: Message) -> none` | soup_session_unpause_message |  | Resumes HTTP I/O on @msg. Use this to resume after calling soup_session_pause_message(). If @msg is being sent via blocking I/O, this will resume r... |
| websocket_connect_async | `Session.websocket_connect_async(msg: Message, origin: utf8?, protocols: utf8?, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | soup_session_websocket_connect_async | 2.50 | Asynchronously creates a #SoupWebsocketConnection to communicate with a remote server. All necessary WebSocket-related headers will be added to @ms... |
| websocket_connect_finish | `Session.websocket_connect_finish(result: Gio.AsyncResult) -> WebsocketConnection throws` | soup_session_websocket_connect_finish | 2.50 | Gets the #SoupWebsocketConnection response to a soup_session_websocket_connect_async() call and (if successful), returns a #SoupWebsocketConnection... |
| would_redirect | `Session.would_redirect(msg: Message) -> gboolean` | soup_session_would_redirect | 2.38 | Checks if @msg contains a response that would cause @session to redirect it to a new URL (ignoring @msg's %SOUP_MESSAGE_NO_REDIRECT flag, and the n... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accept-language | utf8 | read, write | If non-%NULL, the value to use for the "Accept-Language" header on #SoupMessage<!-- -->s sent from this session. Setting this will disable #SoupSes... |
| accept-language-auto | gboolean | read, write | If %TRUE, #SoupSession will automatically set the string for the "Accept-Language" header on every #SoupMessage sent, based on the return value of ... |
| add-feature | SessionFeature | read, write | Add a feature object to the session. (Shortcut for calling soup_session_add_feature().) |
| add-feature-by-type | GType | read, write | Add a feature object of the given type to the session. (Shortcut for calling soup_session_add_feature_by_type().) |
| async-context | gpointer | read, write, construct-only | The #GMainContext that miscellaneous session-related asynchronous callbacks are invoked on. (Eg, setting #SoupSession:idle-timeout will add a timeo... |
| http-aliases | utf8 | read, write | A %NULL-terminated array of URI schemes that should be considered to be aliases for "http". Eg, if this included <literal>"dav"</literal>, than a U... |
| https-aliases | utf8 | read, write | A comma-delimited list of URI schemes that should be considered to be aliases for "https". See #SoupSession:http-aliases for more information. The ... |
| idle-timeout | guint | read, write | Connection lifetime (in seconds) when idle. Any connection left idle longer than this will be closed. Although you can change this property at any ... |
| local-address | Address | read, write, construct-only | Sets the #SoupAddress to use for the client side of the connection. Use this property if you want for instance to bind the local socket to a specif... |
| max-conns | gint | read, write |  |
| max-conns-per-host | gint | read, write |  |
| proxy-resolver | Gio.ProxyResolver | read, write | A #GProxyResolver to use with this session. Setting this will clear the #SoupSession:proxy-uri property, and remove any <type>SoupProxyURIResolver<... |
| proxy-uri | URI | read, write | A proxy to use for all http and https requests in this session. Setting this will clear the #SoupSession:proxy-resolver property, and remove any <t... |
| remove-feature-by-type | GType | read, write | Remove feature objects from the session. (Shortcut for calling soup_session_remove_feature_by_type().) |
| ssl-ca-file | utf8 | read, write | File containing SSL CA certificates. If the specified file does not exist or cannot be read, then libsoup will print a warning, and then behave as ... |
| ssl-strict | gboolean | read, write | Normally, if #SoupSession:tls-database is set (including if it was set via #SoupSession:ssl-use-system-ca-file or #SoupSession:ssl-ca-file), then l... |
| ssl-use-system-ca-file | gboolean | read, write | Setting this to %TRUE is equivalent to setting #SoupSession:tls-database to the default system CA database. (and likewise, setting #SoupSession:tls... |
| timeout | guint | read, write | The timeout (in seconds) for socket I/O operations (including connecting to a server, and waiting for a reply to an HTTP request). Although you can... |
| tls-database | Gio.TlsDatabase | read, write | Sets the #GTlsDatabase to use for validating SSL/TLS certificates. Note that setting the #SoupSession:ssl-ca-file or #SoupSession:ssl-use-system-ca... |
| tls-interaction | Gio.TlsInteraction | read, write | A #GTlsInteraction object that will be passed on to any #GTlsConnections created by the session. (This can be used to provide client-side certifica... |
| use-ntlm | gboolean | read, write | Whether or not to use NTLM authentication. |
| use-thread-context | gboolean | read, write | If %TRUE (which it always is on a plain #SoupSession), asynchronous HTTP requests in this session will run in whatever the thread-default #GMainCon... |
| user-agent | utf8 | read, write | If non-%NULL, the value to use for the "User-Agent" header on #SoupMessage<!-- -->s sent from this session. RFC 2616 says: "The User-Agent request-... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| authenticate | `msg: Message, auth: Auth, retrying: gboolean` | none | first |  | Emitted when the session requires authentication. If credentials are available call soup_auth_authenticate() on @auth. If these credentials fail, t... |
| connection-created | `connection: GObject.Object` | none | first | 2.30 | Emitted when a new connection is created. This is an internal signal intended only to be used for debugging purposes, and may go away in the future. |
| request-queued | `msg: Message` | none | first | 2.24 | Emitted when a request is queued on @session. (Note that "queued" doesn't just mean soup_session_queue_message(); soup_session_send_message() impli... |
| request-started | `msg: Message, socket: Socket` | none | first |  | Emitted just before a request is sent. See #SoupSession::request_queued for a detailed description of the message lifecycle within a session. |
| request-unqueued | `msg: Message` | none | first | 2.24 | Emitted when a request is removed from @session's queue, indicating that @session is done with it. See #SoupSession::request_queued for a detailed ... |
| tunneling | `connection: GObject.Object` | none | first | 2.30 | Emitted when an SSL tunnel is being created on a proxy connection. This is an internal signal intended only to be used for debugging purposes, and ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| auth_required | `auth_required(msg: Message, auth: Auth, retrying: gboolean) -> none` |  |  |  |
| authenticate | `authenticate(msg: Message, auth: Auth, retrying: gboolean) -> none` |  |  |  |
| cancel_message | `cancel_message(msg: Message, status_code: guint) -> none` |  |  | Causes @session to immediately finish processing @msg (regardless of its current state) with a final status_code of @status_code. You may call this... |
| flush_queue | `flush_queue() -> none` |  |  |  |
| kick | `kick() -> none` |  |  |  |
| queue_message | `queue_message(msg: Message, callback: SessionCallback?, user_data: gpointer?) -> none` |  |  | Queues the message @msg for asynchronously sending the request and receiving a response in the current thread-default #GMainContext. If @msg has be... |
| request_started | `request_started(msg: Message, socket: Socket) -> none` |  |  |  |
| requeue_message | `requeue_message(msg: Message) -> none` |  |  | This causes @msg to be placed back on the queue to be attempted again. |
| send_message | `send_message(msg: Message) -> guint` |  |  | Synchronously send @msg. This call will not return until the transfer is finished successfully or there is an unrecoverable error. Unlike with soup... |

### Soup.SessionAsync

Parent: `Session` ?? GType: `SoupSessionAsync` ?? C type: `SoupSessionAsync`

Creates an asynchronous #SoupSession with the default options.

#### Fields

| Field | Type |
| --- | --- |
| parent | Session |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SessionAsync.new() -> Session` | soup_session_async_new |  | Creates an asynchronous #SoupSession with the default options. |
| new_with_options | `SessionAsync.new_with_options(optname1: utf8, ...: void) -> Session` | soup_session_async_new_with_options |  | Creates an asynchronous #SoupSession with the specified options. |

### Soup.SessionSync

Parent: `Session` ?? GType: `SoupSessionSync` ?? C type: `SoupSessionSync`

Creates an synchronous #SoupSession with the default options.

#### Fields

| Field | Type |
| --- | --- |
| parent | Session |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SessionSync.new() -> Session` | soup_session_sync_new |  | Creates an synchronous #SoupSession with the default options. |
| new_with_options | `SessionSync.new_with_options(optname1: utf8, ...: void) -> Session` | soup_session_sync_new_with_options |  | Creates an synchronous #SoupSession with the specified options. |

### Soup.Socket

Parent: `GObject.Object` ?? Implements: `Gio.Initable` ?? GType: `SoupSocket` ?? C type: `SoupSocket`

Creates a new (disconnected) socket

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Socket.new(optname1: utf8, ...: void) -> Socket` | soup_socket_new |  | Creates a new (disconnected) socket |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| connect_async | `Socket.connect_async(cancellable: Gio.Cancellable?, callback: SocketCallback, user_data: gpointer?) -> none` | soup_socket_connect_async |  | Begins asynchronously connecting to @sock's remote address. The socket will call @callback when it succeeds or fails (but not before returning from... |
| connect_sync | `Socket.connect_sync(cancellable: Gio.Cancellable?) -> guint` | soup_socket_connect_sync |  | Attempt to synchronously connect @sock to its remote address. If @cancellable is non-%NULL, it can be used to cancel the connection, in which case ... |
| disconnect | `Socket.disconnect() -> none` | soup_socket_disconnect |  | Disconnects @sock. Any further read or write attempts on it will fail. |
| get_fd | `Socket.get_fd() -> gint` | soup_socket_get_fd |  | Gets @sock's underlying file descriptor. Note that fiddling with the file descriptor may break the #SoupSocket. |
| get_local_address | `Socket.get_local_address() -> Address` | soup_socket_get_local_address |  | Returns the #SoupAddress corresponding to the local end of @sock. Calling this method on an unconnected socket is considered to be an error, and pr... |
| get_remote_address | `Socket.get_remote_address() -> Address` | soup_socket_get_remote_address |  | Returns the #SoupAddress corresponding to the remote end of @sock. Calling this method on an unconnected socket is considered to be an error, and p... |
| is_connected | `Socket.is_connected() -> gboolean` | soup_socket_is_connected |  | Tests if @sock is connected to another host |
| is_ssl | `Socket.is_ssl() -> gboolean` | soup_socket_is_ssl |  | Tests if @sock is doing (or has attempted to do) SSL. |
| listen | `Socket.listen() -> gboolean` | soup_socket_listen |  | Makes @sock start listening on its local address. When connections come in, @sock will emit #SoupSocket::new_connection. |
| read | `Socket.read(buffer: guint8, len: gsize, nread: out gsize, cancellable: Gio.Cancellable?) -> SocketIOStatus throws` | soup_socket_read |  | Attempts to read up to @len bytes from @sock into @buffer. If some data is successfully read, soup_socket_read() will return %SOUP_SOCKET_OK, and *... |
| read_until | `Socket.read_until(buffer: guint8, len: gsize, boundary: gpointer?, boundary_len: gsize, nread: out gsize, got_boundary: out gboolean, cancellable: Gio.Cancellable?) -> SocketIOStatus throws` | soup_socket_read_until |  | Like soup_socket_read(), but reads no further than the first occurrence of @boundary. (If the boundary is found, it will be included in the returne... |
| start_proxy_ssl | `Socket.start_proxy_ssl(ssl_host: utf8, cancellable: Gio.Cancellable?) -> gboolean` | soup_socket_start_proxy_ssl |  | Starts using SSL on @socket, expecting to find a host named @ssl_host. |
| start_ssl | `Socket.start_ssl(cancellable: Gio.Cancellable?) -> gboolean` | soup_socket_start_ssl |  | Starts using SSL on @socket. |
| write | `Socket.write(buffer: guint8, len: gsize, nwrote: out gsize, cancellable: Gio.Cancellable?) -> SocketIOStatus throws` | soup_socket_write |  | Attempts to write @len bytes from @buffer to @sock. If some data is successfully written, the return status will be %SOUP_SOCKET_OK, and *@nwrote w... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| async-context | gpointer | read, write, construct-only |  |
| fd | gint | read, write, construct-only |  |
| gsocket | Gio.Socket | write, construct-only |  |
| iostream | Gio.IOStream | write, construct-only |  |
| ipv6-only | gboolean | read, write |  |
| is-server | gboolean | read | Whether or not the socket is a server socket. Note that for "ordinary" #SoupSockets this will be set for both listening sockets and the sockets emi... |
| local-address | Address | read, write, construct-only |  |
| non-blocking | gboolean | read, write | Whether or not the socket uses non-blocking I/O. #SoupSocket's I/O methods are designed around the idea of using a single codepath for both synchro... |
| remote-address | Address | read, write, construct-only |  |
| socket-properties | void | write |  |
| ssl-creds | gpointer | read, write |  |
| ssl-fallback | gboolean | read, write, construct-only |  |
| ssl-strict | gboolean | read, write, construct-only |  |
| timeout | guint | read, write |  |
| tls-certificate | Gio.TlsCertificate | read |  |
| tls-errors | Gio.TlsCertificateFlags | read |  |
| trusted-certificate | gboolean | read |  |
| use-thread-context | gboolean | read, write, construct-only | Use g_main_context_get_thread_default(). |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| disconnected | `` | none | last |  | Emitted when the socket is disconnected, for whatever reason. |
| event | `event: Gio.SocketClientEvent, connection: Gio.IOStream` | none | last | 2.38 | Emitted when a network-related event occurs. See #GSocketClient::event for more details. |
| new-connection | `new: Socket` | none | first |  | Emitted when a listening socket (set up with soup_socket_listen()) receives a new connection. You must ref the @new if you want to keep it; otherwi... |
| readable | `` | none | last |  | Emitted when an async socket is readable. See soup_socket_read(), soup_socket_read_until() and #SoupSocket:non-blocking. |
| writable | `` | none | last |  | Emitted when an async socket is writable. See soup_socket_write() and #SoupSocket:non-blocking. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| disconnected | `disconnected() -> none` |  |  |  |
| new_connection | `new_connection(new_sock: Socket) -> none` |  |  |  |
| readable | `readable() -> none` |  |  |  |
| writable | `writable() -> none` |  |  |  |

### Soup.WebsocketConnection

Parent: `GObject.Object` ?? GType: `SoupWebsocketConnection` ?? C type: `SoupWebsocketConnection`

A class representing a WebSocket connection.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| pv | WebsocketConnectionPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WebsocketConnection.new(stream: Gio.IOStream, uri: URI, type: WebsocketConnectionType, origin: utf8?, protocol: utf8?) -> WebsocketConnection` | soup_websocket_connection_new | 2.50 | Creates a #SoupWebsocketConnection on @stream. This should be called after completing the handshake to begin using the WebSocket protocol. |
| new_with_extensions | `WebsocketConnection.new_with_extensions(stream: Gio.IOStream, uri: URI, type: WebsocketConnectionType, origin: utf8?, protocol: utf8?, extensions: GLib.List) -> WebsocketConnection` | soup_websocket_connection_new_with_extensions | 2.68 | Creates a #SoupWebsocketConnection on @stream with the given active @extensions. This should be called after completing the handshake to begin usin... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `WebsocketConnection.close(code: gushort, data: utf8?) -> none` | soup_websocket_connection_close | 2.50 | Close the connection in an orderly fashion. Note that until the #SoupWebsocketConnection::closed signal fires, the connection is not yet completely... |
| get_close_code | `WebsocketConnection.get_close_code() -> gushort` | soup_websocket_connection_get_close_code | 2.50 | Get the close code received from the WebSocket peer. This only becomes valid once the WebSocket is in the %SOUP_WEBSOCKET_STATE_CLOSED state. The v... |
| get_close_data | `WebsocketConnection.get_close_data() -> utf8` | soup_websocket_connection_get_close_data | 2.50 | Get the close data received from the WebSocket peer. This only becomes valid once the WebSocket is in the %SOUP_WEBSOCKET_STATE_CLOSED state. The d... |
| get_connection_type | `WebsocketConnection.get_connection_type() -> WebsocketConnectionType` | soup_websocket_connection_get_connection_type | 2.50 | Get the connection type (client/server) of the connection. |
| get_extensions | `WebsocketConnection.get_extensions() -> GLib.List` | soup_websocket_connection_get_extensions | 2.68 | Get the extensions chosen via negotiation with the peer. |
| get_io_stream | `WebsocketConnection.get_io_stream() -> Gio.IOStream` | soup_websocket_connection_get_io_stream | 2.50 | Get the I/O stream the WebSocket is communicating over. |
| get_keepalive_interval | `WebsocketConnection.get_keepalive_interval() -> guint` | soup_websocket_connection_get_keepalive_interval | 2.58 | Gets the keepalive interval in seconds or 0 if disabled. |
| get_max_incoming_payload_size | `WebsocketConnection.get_max_incoming_payload_size() -> guint64` | soup_websocket_connection_get_max_incoming_payload_size | 2.56 | Gets the maximum payload size allowed for incoming packets. |
| get_origin | `WebsocketConnection.get_origin() -> utf8` | soup_websocket_connection_get_origin | 2.50 | Get the origin of the WebSocket. |
| get_protocol | `WebsocketConnection.get_protocol() -> utf8` | soup_websocket_connection_get_protocol | 2.50 | Get the protocol chosen via negotiation with the peer. |
| get_state | `WebsocketConnection.get_state() -> WebsocketState` | soup_websocket_connection_get_state | 2.50 | Get the current state of the WebSocket. |
| get_uri | `WebsocketConnection.get_uri() -> URI` | soup_websocket_connection_get_uri | 2.50 | Get the URI of the WebSocket. For servers this represents the address of the WebSocket, and for clients it is the address connected to. |
| send_binary | `WebsocketConnection.send_binary(data: guint8?, length: gsize) -> none` | soup_websocket_connection_send_binary | 2.50 | Send a binary message to the peer. If @length is 0, @data may be %NULL. The message is queued to be sent and will be sent when the main loop is run. |
| send_message | `WebsocketConnection.send_message(type: WebsocketDataType, message: GLib.Bytes) -> none` | soup_websocket_connection_send_message | 2.68 | Send a message of the given @type to the peer. Note that this method, allows to send text messages containing %NULL characters. The message is queu... |
| send_text | `WebsocketConnection.send_text(text: utf8) -> none` | soup_websocket_connection_send_text | 2.50 | Send a %NULL-terminated text (UTF-8) message to the peer. If you need to send text messages containing %NULL characters use soup_websocket_connecti... |
| set_keepalive_interval | `WebsocketConnection.set_keepalive_interval(interval: guint) -> none` | soup_websocket_connection_set_keepalive_interval | 2.58 | Sets the interval in seconds on when to send a ping message which will serve as a keepalive message. If set to 0 the keepalive message is disabled. |
| set_max_incoming_payload_size | `WebsocketConnection.set_max_incoming_payload_size(max_incoming_payload_size: guint64) -> none` | soup_websocket_connection_set_max_incoming_payload_size | 2.56 | Sets the maximum payload size allowed for incoming packets. It does not limit the outgoing packet size. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connection-type | WebsocketConnectionType | read, write, construct-only | The type of connection (client/server). |
| extensions | gpointer | read, write, construct-only | List of #SoupWebsocketExtension objects that are active in the connection. |
| io-stream | Gio.IOStream | read, write, construct-only | The underlying IO stream the WebSocket is communicating over. The input and output streams must be pollable streams. |
| keepalive-interval | guint | read, write | Interval in seconds on when to send a ping message which will serve as a keepalive message. If set to 0 the keepalive message is disabled. |
| max-incoming-payload-size | guint64 | read, write | The maximum payload size for incoming packets the protocol expects or 0 to not limit it. |
| origin | utf8 | read, write, construct-only | The client's Origin. |
| protocol | utf8 | read, write, construct-only | The chosen protocol, or %NULL if a protocol was not agreed upon. |
| state | WebsocketState | read | The current state of the WebSocket. |
| uri | URI | read, write, construct-only | The URI of the WebSocket. For servers this represents the address of the WebSocket, and for clients it is the address connected to. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| closed | `` | none | first | 2.50 | Emitted when the connection has completely closed, either due to an orderly close from the peer, one initiated via soup_websocket_connection_close(... |
| closing | `` | none | last | 2.50 | This signal will be emitted during an orderly close. |
| error | `error: GLib.Error` | none | first | 2.50 | Emitted when an error occurred on the WebSocket. This may be fired multiple times. Fatal errors will be followed by the #SoupWebsocketConnection::c... |
| message | `type: gint, message: GLib.Bytes` | none | first | 2.50 | Emitted when we receive a message from the peer. As a convenience, the @message data will always be NUL-terminated, but the NUL byte will not be in... |
| pong | `message: GLib.Bytes` | none | first | 2.60 | Emitted when we receive a Pong frame (solicited or unsolicited) from the peer. As a convenience, the @message data will always be NUL-terminated, b... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| closed | `closed() -> none` |  |  | default handler for the #SoupWebsocketConnection::closed signal |
| closing | `closing() -> none` |  |  | the default handler for the #SoupWebsocketConnection:closing signal |
| error | `error(error: GLib.Error) -> none` |  |  | default handler for the #SoupWebsocketConnection::error signal |
| message | `message(type: WebsocketDataType, message: GLib.Bytes) -> none` |  |  | default handler for the #SoupWebsocketConnection::message signal |
| pong | `pong(message: GLib.Bytes) -> none` |  |  | default handler for the #SoupWebsocketConnection::pong signal |

### Soup.WebsocketExtension

Parent: `GObject.Object` ?? Subclasses: `WebsocketExtensionDeflate` ?? GType: `SoupWebsocketExtension` ?? C type: `SoupWebsocketExtension` ?? Abstract

Configures @extension with the given @params

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| configure | `WebsocketExtension.configure(connection_type: WebsocketConnectionType, params: GLib.HashTable?) -> gboolean throws` | soup_websocket_extension_configure |  | Configures @extension with the given @params |
| get_request_params | `WebsocketExtension.get_request_params() -> utf8` | soup_websocket_extension_get_request_params | 2.68 | Get the parameters strings to be included in the request header. If the extension doesn't include any parameter in the request, this function retur... |
| get_response_params | `WebsocketExtension.get_response_params() -> utf8` | soup_websocket_extension_get_response_params | 2.68 | Get the parameters strings to be included in the response header. If the extension doesn't include any parameter in the response, this function ret... |
| process_incoming_message | `WebsocketExtension.process_incoming_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` | soup_websocket_extension_process_incoming_message | 2.68 | Process a message after it's received. If the payload isn't changed the given @payload is just returned, otherwise g_bytes_unref() is called on the... |
| process_outgoing_message | `WebsocketExtension.process_outgoing_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` | soup_websocket_extension_process_outgoing_message | 2.68 | Process a message before it's sent. If the payload isn't changed the given @payload is just returned, otherwise g_bytes_unref() is called on the gi... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| configure | `configure(connection_type: WebsocketConnectionType, params: GLib.HashTable?) -> gboolean throws` |  |  | Configures @extension with the given @params |
| get_request_params | `get_request_params() -> utf8` |  | 2.68 | Get the parameters strings to be included in the request header. If the extension doesn't include any parameter in the request, this function retur... |
| get_response_params | `get_response_params() -> utf8` |  | 2.68 | Get the parameters strings to be included in the response header. If the extension doesn't include any parameter in the response, this function ret... |
| process_incoming_message | `process_incoming_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` |  | 2.68 | Process a message after it's received. If the payload isn't changed the given @payload is just returned, otherwise g_bytes_unref() is called on the... |
| process_outgoing_message | `process_outgoing_message(header: inout guint8, payload: GLib.Bytes) -> GLib.Bytes throws` |  | 2.68 | Process a message before it's sent. If the payload isn't changed the given @payload is just returned, otherwise g_bytes_unref() is called on the gi... |

### Soup.WebsocketExtensionDeflate

Parent: `WebsocketExtension` ?? GType: `SoupWebsocketExtensionDeflate` ?? C type: `SoupWebsocketExtensionDeflate`

#### Fields

| Field | Type |
| --- | --- |
| parent | WebsocketExtension |

### Soup.WebsocketExtensionManager

Parent: `GObject.Object` ?? Implements: `SessionFeature` ?? GType: `SoupWebsocketExtensionManager` ?? C type: `SoupWebsocketExtensionManager`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| PasswordManager |  | 0 | 0 | 2 |  |
| ProxyResolver |  | 0 | 0 | 2 |  |
| ProxyURIResolver |  | 0 | 0 | 2 | Asynchronously determines a proxy URI to use for @msg and calls @callback. |
| SessionFeature |  | 0 | 0 | 5 | An object that implement some sort of optional feature for #SoupSession. |

### Soup.PasswordManager

GType: `SoupPasswordManager` ?? C type: `SoupPasswordManager`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_passwords_async | `PasswordManager.get_passwords_async(msg: Message, auth: Auth, retrying: gboolean, async_context: GLib.MainContext, cancellable: Gio.Cancellable?, callback: PasswordManagerCallback, user_data: gpointer?) -> none` | soup_password_manager_get_passwords_async |  |  |
| get_passwords_sync | `PasswordManager.get_passwords_sync(msg: Message, auth: Auth, cancellable: Gio.Cancellable?) -> none` | soup_password_manager_get_passwords_sync |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_passwords_async | `get_passwords_async(msg: Message, auth: Auth, retrying: gboolean, async_context: GLib.MainContext, cancellable: Gio.Cancellable?, callback: PasswordManagerCallback, user_data: gpointer?) -> none` |  |  |  |
| get_passwords_sync | `get_passwords_sync(msg: Message, auth: Auth, cancellable: Gio.Cancellable?) -> none` |  |  |  |

### Soup.ProxyResolver

GType: `SoupProxyResolver` ?? C type: `SoupProxyResolver`

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_proxy_async | `ProxyResolver.get_proxy_async(msg: Message, async_context: GLib.MainContext, cancellable: Gio.Cancellable?, callback: ProxyResolverCallback, user_data: gpointer?) -> none` | soup_proxy_resolver_get_proxy_async |  |  |
| get_proxy_sync | `ProxyResolver.get_proxy_sync(msg: Message, cancellable: Gio.Cancellable?, addr: out Address) -> guint` | soup_proxy_resolver_get_proxy_sync |  |  |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_proxy_async | `get_proxy_async(msg: Message, async_context: GLib.MainContext, cancellable: Gio.Cancellable?, callback: ProxyResolverCallback, user_data: gpointer?) -> none` |  |  |  |
| get_proxy_sync | `get_proxy_sync(msg: Message, cancellable: Gio.Cancellable?, addr: out Address) -> guint` |  |  |  |

### Soup.ProxyURIResolver

GType: `SoupProxyURIResolver` ?? C type: `SoupProxyURIResolver`

Asynchronously determines a proxy URI to use for @msg and calls @callback.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_proxy_uri_async | `ProxyURIResolver.get_proxy_uri_async(uri: URI, async_context: GLib.MainContext?, cancellable: Gio.Cancellable?, callback: ProxyURIResolverCallback, user_data: gpointer?) -> none` | soup_proxy_uri_resolver_get_proxy_uri_async | 2.26.3 | Asynchronously determines a proxy URI to use for @msg and calls @callback. |
| get_proxy_uri_sync | `ProxyURIResolver.get_proxy_uri_sync(uri: URI, cancellable: Gio.Cancellable?, proxy_uri: out URI) -> guint` | soup_proxy_uri_resolver_get_proxy_uri_sync | 2.26.3 | Synchronously determines a proxy URI to use for @uri. If @uri should be sent via proxy, *@proxy_uri will be set to the URI of the proxy, else it wi... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_proxy_uri_async | `get_proxy_uri_async(uri: URI, async_context: GLib.MainContext?, cancellable: Gio.Cancellable?, callback: ProxyURIResolverCallback, user_data: gpointer?) -> none` |  | 2.26.3 | Asynchronously determines a proxy URI to use for @msg and calls @callback. |
| get_proxy_uri_sync | `get_proxy_uri_sync(uri: URI, cancellable: Gio.Cancellable?, proxy_uri: out URI) -> guint` |  | 2.26.3 | Synchronously determines a proxy URI to use for @uri. If @uri should be sent via proxy, *@proxy_uri will be set to the URI of the proxy, else it wi... |

### Soup.SessionFeature

GType: `SoupSessionFeature` ?? C type: `SoupSessionFeature`

An object that implement some sort of optional feature for #SoupSession.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_feature | `SessionFeature.add_feature(type: GType) -> gboolean` | soup_session_feature_add_feature | 2.34 | Adds a "sub-feature" of type @type to the base feature @feature. This is used for features that can be extended with multiple different types. Eg, ... |
| attach | `SessionFeature.attach(session: Session) -> none` | soup_session_feature_attach |  |  |
| detach | `SessionFeature.detach(session: Session) -> none` | soup_session_feature_detach |  |  |
| has_feature | `SessionFeature.has_feature(type: GType) -> gboolean` | soup_session_feature_has_feature | 2.34 | Tests if @feature has a "sub-feature" of type @type. See soup_session_feature_add_feature(). |
| remove_feature | `SessionFeature.remove_feature(type: GType) -> gboolean` | soup_session_feature_remove_feature | 2.34 | Removes the "sub-feature" of type @type from the base feature @feature. See soup_session_feature_add_feature(). |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_feature | `add_feature(type: GType) -> gboolean` |  | 2.34 | Adds a "sub-feature" of type @type to the base feature @feature. This is used for features that can be extended with multiple different types. Eg, ... |
| attach | `attach(session: Session) -> none` |  |  | Perform setup when a feature is added to a session |
| detach | `detach(session: Session) -> none` |  |  | Perform cleanup when a feature is removed from a session |
| has_feature | `has_feature(type: GType) -> gboolean` |  | 2.34 | Tests if @feature has a "sub-feature" of type @type. See soup_session_feature_add_feature(). |
| remove_feature | `remove_feature(type: GType) -> gboolean` |  | 2.34 | Removes the "sub-feature" of type @type from the base feature @feature. See soup_session_feature_add_feature(). |
| request_queued | `request_queued(session: Session, msg: Message) -> none` |  |  | Proxies the session's #SoupSession::request_queued signal |
| request_started | `request_started(session: Session, msg: Message, socket: Socket) -> none` |  |  | Proxies the session's #SoupSession::request_started signal. Deprecated 2.50. Use #SoupMessage::starting instead. |
| request_unqueued | `request_unqueued(session: Session, msg: Message) -> none` |  |  | Proxies the session's #SoupSession::request_unqueued signal |

## Enums

### Soup.AddressFamily

GType: `SoupAddressFamily` ?? C type: `SoupAddressFamily`

The supported address families.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid | -1 | invalid | an invalid %SoupAddress |
| ipv4 | 2 | ipv4 | an IPv4 address |
| ipv6 | 10 | ipv6 | an IPv6 address |

### Soup.CacheResponse

GType: `SoupCacheResponse` ?? C type: `SoupCacheResponse`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| fresh | 0 | fresh |  |
| needs_validation | 1 | needs-validation |  |
| stale | 2 | stale |  |

### Soup.CacheType

GType: `SoupCacheType` ?? C type: `SoupCacheType`

The type of cache; this affects what kinds of responses will be saved.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| shared | 1 | shared | a shared cache |
| single_user | 0 | single-user | a single-user cache |

### Soup.ConnectionState

GType: `SoupConnectionState` ?? C type: `SoupConnectionState`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| connecting | 1 | connecting |  |
| disconnected | 5 | disconnected |  |
| idle | 2 | idle |  |
| in_use | 3 | in-use |  |
| new | 0 | new |  |
| remote_disconnected | 4 | remote-disconnected |  |

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

Date formats that soup_date_to_string() can use. @SOUP_DATE_HTTP and @SOUP_DATE_COOKIE always coerce the time to UTC. @SOUP_DATE_ISO8601_XMLRPC use...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cookie | 2 | cookie | The format for the "Expires" timestamp in the Netscape cookie specification. Eg, "Sun, 06-Nov-1994 08:49:37 GMT". |
| http | 1 | http | RFC 1123 format, used by the HTTP "Date" header. Eg "Sun, 06 Nov 1994 08:49:37 GMT" |
| iso8601 | 5 | iso8601 | An alias for @SOUP_DATE_ISO8601_FULL. |
| iso8601_compact | 4 | iso8601-compact | ISO 8601 date/time with no optional punctuation. Eg, "19941106T094937-0100". |
| iso8601_full | 5 | iso8601-full | ISO 8601 date/time with all optional punctuation. Eg, "1994-11-06T09:49:37-01:00". |
| iso8601_xmlrpc | 6 | iso8601-xmlrpc | ISO 8601 date/time as used by XML-RPC. Eg, "19941106T09:49:37". |
| rfc2822 | 3 | rfc2822 | RFC 2822 format, eg "Sun, 6 Nov 1994 09:49:37 -0100" |

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

### Soup.KnownStatusCode

GType: `SoupKnownStatusCode` ?? C type: `SoupKnownStatusCode`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accepted | 202 | accepted |  |
| bad_gateway | 502 | bad-gateway |  |
| bad_request | 400 | bad-request |  |
| cancelled | 1 | cancelled |  |
| cant_connect | 4 | cant-connect |  |
| cant_connect_proxy | 5 | cant-connect-proxy |  |
| cant_resolve | 2 | cant-resolve |  |
| cant_resolve_proxy | 3 | cant-resolve-proxy |  |
| conflict | 409 | conflict |  |
| continue | 100 | continue |  |
| created | 201 | created |  |
| expectation_failed | 417 | expectation-failed |  |
| failed_dependency | 424 | failed-dependency |  |
| forbidden | 403 | forbidden |  |
| found | 302 | found |  |
| gateway_timeout | 504 | gateway-timeout |  |
| gone | 410 | gone |  |
| http_version_not_supported | 505 | http-version-not-supported |  |
| insufficient_storage | 507 | insufficient-storage |  |
| internal_server_error | 500 | internal-server-error |  |
| invalid_range | 416 | invalid-range |  |
| io_error | 7 | io-error |  |
| length_required | 411 | length-required |  |
| locked | 423 | locked |  |
| malformed | 8 | malformed |  |
| method_not_allowed | 405 | method-not-allowed |  |
| moved_permanently | 301 | moved-permanently |  |
| moved_temporarily | 302 | moved-temporarily |  |
| multi_status | 207 | multi-status |  |
| multiple_choices | 300 | multiple-choices |  |
| no_content | 204 | no-content |  |
| non_authoritative | 203 | non-authoritative |  |
| none | 0 | none |  |
| not_acceptable | 406 | not-acceptable |  |
| not_appearing_in_this_protocol | 306 | not-appearing-in-this-protocol |  |
| not_extended | 510 | not-extended |  |
| not_found | 404 | not-found |  |
| not_implemented | 501 | not-implemented |  |
| not_modified | 304 | not-modified |  |
| ok | 200 | ok |  |
| partial_content | 206 | partial-content |  |
| payment_required | 402 | payment-required |  |
| precondition_failed | 412 | precondition-failed |  |
| processing | 102 | processing |  |
| proxy_authentication_required | 407 | proxy-authentication-required |  |
| proxy_unauthorized | 407 | proxy-unauthorized |  |
| request_entity_too_large | 413 | request-entity-too-large |  |
| request_timeout | 408 | request-timeout |  |
| request_uri_too_long | 414 | request-uri-too-long |  |
| requested_range_not_satisfiable | 416 | requested-range-not-satisfiable |  |
| reset_content | 205 | reset-content |  |
| see_other | 303 | see-other |  |
| service_unavailable | 503 | service-unavailable |  |
| ssl_failed | 6 | ssl-failed |  |
| switching_protocols | 101 | switching-protocols |  |
| temporary_redirect | 307 | temporary-redirect |  |
| tls_failed | 11 | tls-failed |  |
| too_many_redirects | 10 | too-many-redirects |  |
| try_again | 9 | try-again |  |
| unauthorized | 401 | unauthorized |  |
| unprocessable_entity | 422 | unprocessable-entity |  |
| unsupported_media_type | 415 | unsupported-media-type |  |
| use_proxy | 305 | use-proxy |  |

### Soup.LoggerLogLevel

GType: `SoupLoggerLogLevel` ?? C type: `SoupLoggerLogLevel`

Describes the level of logging output to provide.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| body | 3 | body | Log the full headers and request/response bodies. |
| headers | 2 | headers | Log the full request/response headers |
| minimal | 1 | minimal | Log the Request-Line or Status-Line and the Soup-Debug pseudo-headers |
| none | 0 | none | No logging |

### Soup.MemoryUse

GType: `SoupMemoryUse` ?? C type: `SoupMemoryUse`

Describes how #SoupBuffer should use the data passed in by the caller. See also soup_buffer_new_with_owner(), which allows to you create a buffer c...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| copy | 2 | copy | The passed-in data belongs to the caller; the #SoupBuffer will copy it into new memory, leaving the caller free to reuse the original memory. |
| static | 0 | static | The memory is statically allocated and constant; libsoup can use the passed-in buffer directly and not need to worry about it being modified or freed. |
| take | 1 | take | The caller has allocated the memory for the #SoupBuffer's use; libsoup will assume ownership of it and free it (with g_free()) when it is done with... |
| temporary | 3 | temporary | The passed-in data belongs to the caller, but will remain valid for the lifetime of the #SoupBuffer. The difference between this and @SOUP_MEMORY_S... |

### Soup.MessageHeadersType

GType: `SoupMessageHeadersType` ?? C type: `SoupMessageHeadersType`

Value passed to soup_message_headers_new() to set certain default behaviors.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| multipart | 2 | multipart | multipart body part headers |
| request | 0 | request | request headers |
| response | 1 | response | response headers |

### Soup.MessagePriority

GType: `SoupMessagePriority` ?? C type: `SoupMessagePriority`

Priorities that can be set on a #SoupMessage to instruct the message queue to process it before any other message with lower priority.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| high | 3 | high | High priority, a #SoupMessage with this priority will be processed before the ones with the default priority. |
| low | 1 | low | Use this for low priority messages, a #SoupMessage with the default priority will be processed first. |
| normal | 2 | normal | The default priotity, this is the priority assigned to the #SoupMessage by default. |
| very_high | 4 | very-high | The highest priority, use this for very urgent #SoupMessage as they will be the first ones to be attended. |
| very_low | 0 | very-low | The lowest priority, the messages with this priority will be the last ones to be attended. |

### Soup.RequesterError

GType: `SoupRequesterError` ?? C type: `SoupRequesterError`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_uri | 0 | bad-uri |  |
| unsupported_uri_scheme | 1 | unsupported-uri-scheme |  |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_requester_error_quark |  |  |

### Soup.RequestError

GType: `SoupRequestError` ?? C type: `SoupRequestError`

A #SoupRequest error.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bad_uri | 0 | bad-uri | the URI could not be parsed |
| encoding | 3 | encoding | the server's response was in an unsupported format |
| parsing | 2 | parsing | the server's response could not be parsed |
| unsupported_uri_scheme | 1 | unsupported-uri-scheme | the URI scheme is not supported by this #SoupSession |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_request_error_quark |  |  |

### Soup.SameSitePolicy

GType: `SoupSameSitePolicy` ?? C type: `SoupSameSitePolicy`

The cookie is exposed with both cross-site and same-site requests

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lax | 1 | lax | The cookie is withheld on cross-site requests but exposed on cross-site navigations |
| none | 0 | none | The cookie is exposed with both cross-site and same-site requests |
| strict | 2 | strict | The cookie is only exposed for same-site requests |

### Soup.SocketIOStatus

GType: `SoupSocketIOStatus` ?? C type: `SoupSocketIOStatus`

Return value from the #SoupSocket IO methods.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| eof | 2 | eof | End of file |
| error | 3 | error | Other error |
| ok | 0 | ok | Success |
| would_block | 1 | would-block | Cannot read/write any more at this time |

### Soup.Status

GType: `SoupStatus` ?? C type: `SoupStatus`

These represent the known HTTP status code values, plus various network and internal errors. Note that no libsoup functions take or return this typ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accepted | 202 | accepted | 202 Accepted (HTTP) |
| bad_gateway | 502 | bad-gateway | 502 Bad Gateway (HTTP) |
| bad_request | 400 | bad-request | 400 Bad Request (HTTP) |
| cancelled | 1 | cancelled | Message was cancelled locally |
| cant_connect | 4 | cant-connect | Unable to connect to remote host |
| cant_connect_proxy | 5 | cant-connect-proxy | Unable to connect to proxy |
| cant_resolve | 2 | cant-resolve | Unable to resolve destination host name |
| cant_resolve_proxy | 3 | cant-resolve-proxy | Unable to resolve proxy host name |
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
| io_error | 7 | io-error | A network error occurred, or the other end closed the connection unexpectedly |
| length_required | 411 | length-required | 411 Length Required (HTTP) |
| locked | 423 | locked | 423 Locked (WebDAV) |
| malformed | 8 | malformed | Malformed data (usually a programmer error) |
| method_not_allowed | 405 | method-not-allowed | 405 Method Not Allowed (HTTP) |
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
| permanent_redirect | 308 | permanent-redirect |  |
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
| ssl_failed | 6 | ssl-failed | SSL/TLS negotiation failed |
| switching_protocols | 101 | switching-protocols | 101 Switching Protocols (HTTP) |
| temporary_redirect | 307 | temporary-redirect | 307 Temporary Redirect (HTTP) |
| tls_failed | 11 | tls-failed | Used internally |
| too_many_redirects | 10 | too-many-redirects | There were too many redirections |
| try_again | 9 | try-again | Used internally |
| unauthorized | 401 | unauthorized | 401 Unauthorized (HTTP) |
| unprocessable_entity | 422 | unprocessable-entity | 422 Unprocessable Entity (WebDAV) |
| unsupported_media_type | 415 | unsupported-media-type | 415 Unsupported Media Type (HTTP) |
| use_proxy | 305 | use-proxy | 305 Use Proxy (HTTP) |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_phrase | `get_phrase(status_code: guint) -> utf8` | soup_status_get_phrase |  | Looks up the stock HTTP description of @status_code. This is used by soup_message_set_status() to get the correct text to go with a given status co... |
| proxify | `proxify(status_code: guint) -> guint` | soup_status_proxify | 2.26 | Turns %SOUP_STATUS_CANT_RESOLVE into %SOUP_STATUS_CANT_RESOLVE_PROXY and %SOUP_STATUS_CANT_CONNECT into %SOUP_STATUS_CANT_CONNECT_PROXY. Other stat... |

### Soup.TLDError

GType: `SoupTLDError` ?? C type: `SoupTLDError`

Error codes for %SOUP_TLD_ERROR.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| invalid_hostname | 0 | invalid-hostname | A hostname was syntactically invalid. |
| is_ip_address | 1 | is-ip-address | The passed-in "hostname" was actually an IP address (and thus has no base domain or public suffix). |
| no_base_domain | 3 | no-base-domain | The passed-in hostname has no recognized public suffix. |
| no_psl_data | 4 | no-psl-data |  |
| not_enough_domains | 2 | not-enough-domains | The passed-in hostname did not have enough components. Eg, calling soup_tld_get_base_domain() on <literal>"co.uk"</literal>. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_tld_error_quark |  |  |

### Soup.WebsocketCloseCode

GType: `SoupWebsocketCloseCode` ?? C type: `SoupWebsocketCloseCode`

Pre-defined close codes that can be passed to soup_websocket_connection_close() or received from soup_websocket_connection_get_close_code(). (Howev...

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

The type of a #SoupWebsocketConnection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| client | 1 | client | a client-side connection |
| server | 2 | server | a server-side connection |
| unknown | 0 | unknown | unknown/invalid connection |

### Soup.WebsocketDataType

GType: `SoupWebsocketDataType` ?? C type: `SoupWebsocketDataType`

The type of data contained in a #SoupWebsocketConnection::message signal.

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
| get_quark | `get_quark() -> GLib.Quark` | soup_websocket_error_get_quark |  |  |

### Soup.WebsocketState

GType: `SoupWebsocketState` ?? C type: `SoupWebsocketState`

The state of the WebSocket connection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| closed | 3 | closed | the connection is completely closed down |
| closing | 2 | closing | the connection is in the process of closing down; messages may be received, but not sent |
| open | 1 | open | the connection is ready to send messages |

### Soup.XMLRPCError

GType: `SoupXMLRPCError` ?? C type: `SoupXMLRPCError`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| arguments | 0 | arguments |  |
| retval | 1 | retval |  |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_xmlrpc_error_quark |  |  |

### Soup.XMLRPCFault

GType: `SoupXMLRPCFault` ?? C type: `SoupXMLRPCFault`

Pre-defined XML-RPC fault codes from <ulink url="http://xmlrpc-epi.sourceforge.net/specs/rfc.fault_codes.php">http://xmlrpc-epi.sourceforge.net/spe...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| application_error | -32500 | application-error | start of reserved range for application error codes |
| parse_error_invalid_character_for_encoding | -32702 | parse-error-invalid-character-for-encoding | request contained an invalid character |
| parse_error_not_well_formed | -32700 | parse-error-not-well-formed | request was not well-formed |
| parse_error_unsupported_encoding | -32701 | parse-error-unsupported-encoding | request was in an unsupported encoding |
| server_error_internal_xml_rpc_error | -32603 | server-error-internal-xml-rpc-error | internal error |
| server_error_invalid_method_parameters | -32602 | server-error-invalid-method-parameters | invalid parameters |
| server_error_invalid_xml_rpc | -32600 | server-error-invalid-xml-rpc | request was not valid XML-RPC |
| server_error_requested_method_not_found | -32601 | server-error-requested-method-not-found | method not found |
| system_error | -32400 | system-error | start of reserved range for system error codes |
| transport_error | -32300 | transport-error | start of reserved range for transport error codes |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | soup_xmlrpc_fault_quark |  |  |

## Flags

### Soup.Cacheability

GType: `SoupCacheability` ?? C type: `SoupCacheability`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| cacheable | 1 | cacheable |  |
| invalidates | 4 | invalidates |  |
| uncacheable | 2 | uncacheable |  |
| validates | 8 | validates |  |

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
| can_rebuild | 4 | can-rebuild | The caller will rebuild the request body if the message is restarted; see soup_message_body_set_accumulate() for more details. |
| certificate_trusted | 32 | certificate-trusted | if set after an https response has been received, indicates that the server's SSL certificate is trusted according to the session's CA. |
| content_decoded | 16 | content-decoded | Set by #SoupContentDecoder to indicate that it has removed the Content-Encoding on a message (and so headers such as Content-Length may no longer a... |
| do_not_use_auth_cache | 512 | do-not-use-auth-cache | The #SoupAuthManager should not use the credentials cache for this message, neither to use cached credentials to automatically authenticate this me... |
| idempotent | 128 | idempotent | The message is considered idempotent, regardless its #SoupMessage:method, and allows reuse of existing idle connections, instead of always requirin... |
| ignore_connection_limits | 256 | ignore-connection-limits | Request that a new connection is created for the message if there aren't idle connections available and it's not possible to create new connections... |
| new_connection | 64 | new-connection | Requests that the message should be sent on a newly-created connection, not reusing an existing persistent connection. Note that messages with non-... |
| no_redirect | 2 | no-redirect | The session should not follow redirect (3xx) responses received by this message. |
| overwrite_chunks | 8 | overwrite-chunks | Deprecated: equivalent to calling soup_message_body_set_accumulate() on the incoming message body (ie, #SoupMessage:response_body for a client-side... |

### Soup.ServerListenOptions

GType: `SoupServerListenOptions` ?? C type: `SoupServerListenOptions`

Options to pass to soup_server_listen(), etc. %SOUP_SERVER_LISTEN_IPV4_ONLY and %SOUP_SERVER_LISTEN_IPV6_ONLY only make sense with soup_server_list...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| https | 1 | https | Listen for https connections rather than plain http. |
| ipv4_only | 2 | ipv4-only | Only listen on IPv4 interfaces. |
| ipv6_only | 4 | ipv6-only | Only listen on IPv6 interfaces. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AddressClass |  | 0 | 0 | 0 |  |
| AuthClass |  | 0 | 0 | 0 | %TRUE if @auth is still a valid (but potentially unauthenticated) #SoupAuth. %FALSE if something about @auth_params could not be parsed or incorpor... |
| AuthDomainBasicClass |  | 0 | 0 | 0 |  |
| AuthDomainClass |  | 0 | 0 | 0 | a #SoupAuthDomain |
| AuthDomainDigestClass |  | 0 | 0 | 0 |  |
| AuthManagerClass |  | 0 | 0 | 0 |  |
| AuthManagerPrivate |  | 0 | 0 | 0 |  |
| Buffer |  | 0 | 0 | 9 | A data buffer, generally used to represent a chunk of a #SoupMessageBody. @data is a #char because that's generally convenient; in some situations ... |
| CacheClass |  | 0 | 0 | 0 |  |
| CachePrivate |  | 0 | 0 | 0 |  |
| ClientContext |  | 0 | 0 | 9 | A #SoupClientContext provides additional information about the client making a particular request. In particular, you can use soup_client_context_g... |
| Connection |  | 0 | 0 | 0 |  |
| ContentDecoderClass |  | 0 | 0 | 0 |  |
| ContentDecoderPrivate |  | 0 | 0 | 0 |  |
| ContentSnifferClass |  | 0 | 0 | 0 | the sniffed Content-Type of @buffer; this will never be %NULL, but may be "application/octet-stream". |
| ContentSnifferPrivate |  | 0 | 0 | 0 |  |
| Cookie |  | 0 | 0 | 26 | An HTTP cookie. @name and @value will be set for all cookies. If the cookie is generated from a string that appears to have no name, then @name wil... |
| CookieJarClass |  | 0 | 0 | 0 | a #SoupCookieJar |
| CookieJarDBClass |  | 0 | 0 | 0 |  |
| CookieJarTextClass |  | 0 | 0 | 0 |  |
| Date |  | 0 | 0 | 18 | A date and time. The date is assumed to be in the (proleptic) Gregorian calendar. The time is in UTC if @utc is %TRUE. Otherwise, the time is a loc... |
| HSTSEnforcerClass |  | 0 | 0 | 0 | The parent class. |
| HSTSEnforcerDBClass |  | 0 | 0 | 0 |  |
| HSTSEnforcerDBPrivate |  | 0 | 0 | 0 |  |
| HSTSEnforcerPrivate |  | 0 | 0 | 0 |  |
| HSTSPolicy |  | 0 | 0 | 11 | An HTTP Strict Transport Security policy. @domain represents the host that this policy applies to. The domain must be IDNA-canonicalized. soup_hsts... |
| LoggerClass |  | 0 | 0 | 0 |  |
| MessageBody |  | 0 | 0 | 13 | A #SoupMessage request or response body. Note that while @length always reflects the full length of the message body, @data is normally %NULL, and ... |
| MessageClass |  | 0 | 0 | 0 |  |
| MessageHeaders |  | 0 | 0 | 30 | The HTTP message headers associated with a request or response. |
| MessageHeadersIter |  | 0 | 0 | 2 | An opaque type used to iterate over a %SoupMessageHeaders structure. After intializing the iterator with soup_message_headers_iter_init(), call sou... |
| MessageQueue |  | 0 | 0 | 0 |  |
| MessageQueueItem |  | 0 | 0 | 0 |  |
| Multipart |  | 0 | 0 | 9 | Represents a multipart HTTP message body, parsed according to the syntax of RFC 2046. Of particular interest to HTTP are <literal>multipart/byte-ra... |
| MultipartInputStreamClass |  | 0 | 0 | 0 |  |
| MultipartInputStreamPrivate |  | 0 | 0 | 0 |  |
| PasswordManagerInterface |  | 0 | 0 | 0 |  |
| ProxyResolverDefaultClass |  | 0 | 0 | 0 |  |
| ProxyResolverInterface |  | 0 | 0 | 0 |  |
| ProxyURIResolverInterface |  | 0 | 0 | 0 | the #SoupProxyURIResolver |
| Range |  | 0 | 0 | 0 | Represents a byte range as used in the Range header. If @end is non-negative, then @start and @end represent the bounds of of the range, counting f... |
| RequestClass |  | 0 | 0 | 0 | a #GInputStream that can be used to read from the URI pointed to by @request. |
| RequestDataClass |  | 0 | 0 | 0 |  |
| RequestDataPrivate |  | 0 | 0 | 0 |  |
| RequesterClass |  | 0 | 0 | 0 |  |
| RequesterPrivate |  | 0 | 0 | 0 |  |
| RequestFileClass |  | 0 | 0 | 0 |  |
| RequestFilePrivate |  | 0 | 0 | 0 |  |
| RequestHTTPClass |  | 0 | 0 | 0 |  |
| RequestHTTPPrivate |  | 0 | 0 | 0 |  |
| RequestPrivate |  | 0 | 0 | 0 |  |
| ServerClass |  | 0 | 0 | 0 |  |
| SessionAsyncClass |  | 0 | 0 | 0 |  |
| SessionClass |  | 0 | 0 | 0 | a #SoupSession |
| SessionFeatureInterface |  | 0 | 0 | 0 | The interface implemented by #SoupSessionFeature<!-- -->s. |
| SessionSyncClass |  | 0 | 0 | 0 |  |
| SocketClass |  | 0 | 0 | 0 |  |
| URI |  | 0 | 0 | 31 | A #SoupURI represents a (parsed) URI. #SoupURI supports RFC 3986 (URI Generic Syntax), and can parse any valid URI. However, libsoup only uses "htt... |
| WebsocketConnectionClass |  | 0 | 0 | 0 | The abstract base class for #SoupWebsocketConnection |
| WebsocketConnectionPrivate |  | 0 | 0 | 0 |  |
| WebsocketExtensionClass |  | 0 | 0 | 0 | The class structure for the SoupWebsocketExtension. |
| WebsocketExtensionDeflateClass |  | 0 | 0 | 0 |  |
| WebsocketExtensionManagerClass |  | 0 | 0 | 0 |  |
| XMLRPCParams |  | 0 | 0 | 2 | Opaque structure containing XML-RPC methodCall parameter values. Can be parsed using soup_xmlrpc_params_parse() and freed with soup_xmlrpc_params_f... |

### Soup.AddressClass

C type: `SoupAddressClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | GObject.ObjectClass |

### Soup.AuthClass

C type: `SoupAuthClass`

%TRUE if @auth is still a valid (but potentially unauthenticated) #SoupAuth. %FALSE if something about @auth_params could not be parsed or incorpor...

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| authenticate | none |
| can_authenticate | gboolean |
| get_authorization | utf8 |
| get_protection_space | GLib.SList |
| is_authenticated | gboolean |
| is_ready | gboolean |
| parent_class | GObject.ObjectClass |
| scheme_name | utf8 |
| strength | guint |
| update | gboolean |

### Soup.AuthDomainBasicClass

C type: `SoupAuthDomainBasicClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | AuthDomainClass |

### Soup.AuthDomainClass

C type: `SoupAuthDomainClass`

a #SoupAuthDomain

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| accepts | utf8 |
| challenge | utf8 |
| check_password | gboolean |
| parent_class | GObject.ObjectClass |

### Soup.AuthDomainDigestClass

C type: `SoupAuthDomainDigestClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | AuthDomainClass |

### Soup.AuthManagerClass

C type: `SoupAuthManagerClass`

#### Fields

| Field | Type |
| --- | --- |
| authenticate | none |
| parent_class | GObject.ObjectClass |

### Soup.AuthManagerPrivate

C type: `SoupAuthManagerPrivate`

### Soup.Buffer

GType: `SoupBuffer` ?? C type: `SoupBuffer`

A data buffer, generally used to represent a chunk of a #SoupMessageBody. @data is a #char because that's generally convenient; in some situations ...

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| length | gsize |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Buffer.new(use: MemoryUse, data: guint8, length: gsize) -> Buffer` | soup_buffer_new |  | Creates a new #SoupBuffer containing @length bytes from @data. |
| new_take | `Buffer.new_take(data: guint8, length: gsize) -> Buffer` | soup_buffer_new_take | 2.32 | Creates a new #SoupBuffer containing @length bytes from @data. This function is exactly equivalent to soup_buffer_new() with %SOUP_MEMORY_TAKE as f... |
| new_with_owner | `Buffer.new_with_owner(data: guint8, length: gsize, owner: gpointer?, owner_dnotify: GLib.DestroyNotify?) -> Buffer` | soup_buffer_new_with_owner |  | Creates a new #SoupBuffer containing @length bytes from @data. When the #SoupBuffer is freed, it will call @owner_dnotify, passing @owner to it. Yo... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Buffer.copy() -> Buffer` | soup_buffer_copy |  | Makes a copy of @buffer. In reality, #SoupBuffer is a refcounted type, and calling soup_buffer_copy() will normally just increment the refcount on ... |
| free | `Buffer.free() -> none` | soup_buffer_free |  | Frees @buffer. (In reality, as described in the documentation for soup_buffer_copy(), this is actually an "unref" operation, and may or may not act... |
| get_as_bytes | `Buffer.get_as_bytes() -> GLib.Bytes` | soup_buffer_get_as_bytes | 2.40 | Creates a #GBytes pointing to the same memory as @buffer. The #GBytes will hold a reference on @buffer to ensure that it is not freed while the #GB... |
| get_data | `Buffer.get_data(data: out guint8, length: out gsize) -> none` | soup_buffer_get_data | 2.32 | This function exists for use by language bindings, because it's not currently possible to get the right effect by annotating the fields of #SoupBuf... |
| get_owner | `Buffer.get_owner() -> gpointer` | soup_buffer_get_owner |  | Gets the "owner" object for a buffer created with soup_buffer_new_with_owner(). |
| new_subbuffer | `Buffer.new_subbuffer(offset: gsize, length: gsize) -> Buffer` | soup_buffer_new_subbuffer |  | Creates a new #SoupBuffer containing @length bytes "copied" from @parent starting at @offset. (Normally this will not actually copy any data, but w... |

### Soup.CacheClass

C type: `SoupCacheClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| get_cacheability | Cacheability |
| parent_class | GObject.ObjectClass |

### Soup.CachePrivate

C type: `SoupCachePrivate`

### Soup.ClientContext

GType: `SoupClientContext` ?? C type: `SoupClientContext`

A #SoupClientContext provides additional information about the client making a particular request. In particular, you can use soup_client_context_g...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_address | `ClientContext.get_address() -> Address` | soup_client_context_get_address |  | Retrieves the #SoupAddress associated with the remote end of a connection. |
| get_auth_domain | `ClientContext.get_auth_domain() -> AuthDomain` | soup_client_context_get_auth_domain |  | Checks whether the request associated with @client has been authenticated, and if so returns the #SoupAuthDomain that authenticated it. |
| get_auth_user | `ClientContext.get_auth_user() -> utf8` | soup_client_context_get_auth_user |  | Checks whether the request associated with @client has been authenticated, and if so returns the username that the client authenticated as. |
| get_gsocket | `ClientContext.get_gsocket() -> Gio.Socket` | soup_client_context_get_gsocket | 2.48 | Retrieves the #GSocket that @client is associated with. If you are using this method to observe when multiple requests are made on the same persist... |
| get_host | `ClientContext.get_host() -> utf8` | soup_client_context_get_host |  | Retrieves the IP address associated with the remote end of a connection. |
| get_local_address | `ClientContext.get_local_address() -> Gio.SocketAddress` | soup_client_context_get_local_address | 2.48 | Retrieves the #GSocketAddress associated with the local end of a connection. |
| get_remote_address | `ClientContext.get_remote_address() -> Gio.SocketAddress` | soup_client_context_get_remote_address | 2.48 | Retrieves the #GSocketAddress associated with the remote end of a connection. |
| get_socket | `ClientContext.get_socket() -> Socket` | soup_client_context_get_socket |  | Retrieves the #SoupSocket that @client is associated with. If you are using this method to observe when multiple requests are made on the same pers... |
| steal_connection | `ClientContext.steal_connection() -> Gio.IOStream` | soup_client_context_steal_connection | 2.50 | "Steals" the HTTP connection associated with @client from its #SoupServer. This happens immediately, regardless of the current state of the connect... |

### Soup.Connection

C type: `SoupConnection`

### Soup.ContentDecoderClass

C type: `SoupContentDecoderClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| _libsoup_reserved5 | none |
| parent_class | GObject.ObjectClass |

### Soup.ContentDecoderPrivate

C type: `SoupContentDecoderPrivate`

### Soup.ContentSnifferClass

C type: `SoupContentSnifferClass`

the sniffed Content-Type of @buffer; this will never be %NULL, but may be "application/octet-stream".

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| _libsoup_reserved5 | none |
| get_buffer_size | gsize |
| parent_class | GObject.ObjectClass |
| sniff | utf8 |

### Soup.ContentSnifferPrivate

C type: `SoupContentSnifferPrivate`

### Soup.Cookie

GType: `SoupCookie` ?? C type: `SoupCookie`

An HTTP cookie. @name and @value will be set for all cookies. If the cookie is generated from a string that appears to have no name, then @name wil...

#### Fields

| Field | Type |
| --- | --- |
| domain | utf8 |
| expires | Date |
| http_only | gboolean |
| name | utf8 |
| path | utf8 |
| secure | gboolean |
| value | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Cookie.new(name: utf8, value: utf8, domain: utf8, path: utf8, max_age: gint) -> Cookie` | soup_cookie_new | 2.24 | Creates a new #SoupCookie with the given attributes. (Use soup_cookie_set_secure() and soup_cookie_set_http_only() if you need to set those attribu... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse | `parse(header: utf8, origin: URI) -> Cookie` | soup_cookie_parse | 2.24 | Parses @header and returns a #SoupCookie. (If @header contains multiple cookies, only the first one will be parsed.) If @header does not have "path... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| applies_to_uri | `Cookie.applies_to_uri(uri: URI) -> gboolean` | soup_cookie_applies_to_uri | 2.24 | Tests if @cookie should be sent to @uri. (At the moment, this does not check that @cookie's domain matches @uri, because it assumes that the caller... |
| copy | `Cookie.copy() -> Cookie` | soup_cookie_copy | 2.24 | Copies @cookie. |
| domain_matches | `Cookie.domain_matches(host: utf8) -> gboolean` | soup_cookie_domain_matches | 2.30 | Checks if the @cookie's domain and @host match in the sense that @cookie should be sent when making a request to @host, or that @cookie should be a... |
| equal | `Cookie.equal(cookie2: Cookie) -> gboolean` | soup_cookie_equal | 2.24 | Tests if @cookie1 and @cookie2 are equal. Note that currently, this does not check that the cookie domains match. This may change in the future. |
| free | `Cookie.free() -> none` | soup_cookie_free | 2.24 | Frees @cookie |
| get_domain | `Cookie.get_domain() -> utf8` | soup_cookie_get_domain | 2.32 | Gets @cookie's domain |
| get_expires | `Cookie.get_expires() -> Date` | soup_cookie_get_expires | 2.32 | Gets @cookie's expiration time. |
| get_http_only | `Cookie.get_http_only() -> gboolean` | soup_cookie_get_http_only | 2.32 | Gets @cookie's HttpOnly attribute |
| get_name | `Cookie.get_name() -> utf8` | soup_cookie_get_name | 2.32 | Gets @cookie's name |
| get_path | `Cookie.get_path() -> utf8` | soup_cookie_get_path | 2.32 | Gets @cookie's path |
| get_same_site_policy | `Cookie.get_same_site_policy() -> SameSitePolicy` | soup_cookie_get_same_site_policy | 2.70 | a #SoupSameSitePolicy |
| get_secure | `Cookie.get_secure() -> gboolean` | soup_cookie_get_secure | 2.32 | Gets @cookie's secure attribute |
| get_value | `Cookie.get_value() -> utf8` | soup_cookie_get_value | 2.32 | Gets @cookie's value |
| set_domain | `Cookie.set_domain(domain: utf8) -> none` | soup_cookie_set_domain | 2.24 | Sets @cookie's domain to @domain |
| set_expires | `Cookie.set_expires(expires: Date) -> none` | soup_cookie_set_expires | 2.24 | Sets @cookie's expiration time to @expires. If @expires is %NULL, @cookie will be a session cookie and will expire at the end of the client's sessi... |
| set_http_only | `Cookie.set_http_only(http_only: gboolean) -> none` | soup_cookie_set_http_only | 2.24 | Sets @cookie's HttpOnly attribute to @http_only. If %TRUE, @cookie will be marked as "http only", meaning it should not be exposed to web page scri... |
| set_max_age | `Cookie.set_max_age(max_age: gint) -> none` | soup_cookie_set_max_age | 2.24 | Sets @cookie's max age to @max_age. If @max_age is -1, the cookie is a session cookie, and will expire at the end of the client's session. Otherwis... |
| set_name | `Cookie.set_name(name: utf8) -> none` | soup_cookie_set_name | 2.24 | Sets @cookie's name to @name |
| set_path | `Cookie.set_path(path: utf8) -> none` | soup_cookie_set_path | 2.24 | Sets @cookie's path to @path |
| set_same_site_policy | `Cookie.set_same_site_policy(policy: SameSitePolicy) -> none` | soup_cookie_set_same_site_policy | 2.70 | When used in conjunction with soup_cookie_jar_get_cookie_list_with_same_site_info() this sets the policy of when this cookie should be exposed. |
| set_secure | `Cookie.set_secure(secure: gboolean) -> none` | soup_cookie_set_secure | 2.24 | Sets @cookie's secure attribute to @secure. If %TRUE, @cookie will only be transmitted from the client to the server over secure (https) connections. |
| set_value | `Cookie.set_value(value: utf8) -> none` | soup_cookie_set_value | 2.24 | Sets @cookie's value to @value |
| to_cookie_header | `Cookie.to_cookie_header() -> utf8` | soup_cookie_to_cookie_header | 2.24 | Serializes @cookie in the format used by the Cookie header (ie, for returning a cookie from a #SoupSession to a server). |
| to_set_cookie_header | `Cookie.to_set_cookie_header() -> utf8` | soup_cookie_to_set_cookie_header | 2.24 | Serializes @cookie in the format used by the Set-Cookie header (ie, for sending a cookie from a #SoupServer to a client). |

### Soup.CookieJarClass

C type: `SoupCookieJarClass`

a #SoupCookieJar

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| changed | none |
| is_persistent | gboolean |
| parent_class | GObject.ObjectClass |
| save | none |

### Soup.CookieJarDBClass

C type: `SoupCookieJarDBClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | CookieJarClass |

### Soup.CookieJarTextClass

C type: `SoupCookieJarTextClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | CookieJarClass |

### Soup.Date

GType: `SoupDate` ?? C type: `SoupDate`

A date and time. The date is assumed to be in the (proleptic) Gregorian calendar. The time is in UTC if @utc is %TRUE. Otherwise, the time is a loc...

#### Fields

| Field | Type |
| --- | --- |
| day | gint |
| hour | gint |
| minute | gint |
| month | gint |
| offset | gint |
| second | gint |
| utc | gboolean |
| year | gint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Date.new(year: gint, month: gint, day: gint, hour: gint, minute: gint, second: gint) -> Date` | soup_date_new |  | Creates a #SoupDate representing the indicated time, UTC. |
| new_from_now | `Date.new_from_now(offset_seconds: gint) -> Date` | soup_date_new_from_now |  | Creates a #SoupDate representing a time @offset_seconds after the current time (or before it, if @offset_seconds is negative). If offset_seconds is... |
| new_from_string | `Date.new_from_string(date_string: utf8) -> Date` | soup_date_new_from_string |  | Parses @date_string and tries to extract a date from it. This recognizes all of the "HTTP-date" formats from RFC 2616, all ISO 8601 formats contain... |
| new_from_time_t | `Date.new_from_time_t(when: time_t) -> Date` | soup_date_new_from_time_t |  | Creates a #SoupDate corresponding to @when |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Date.copy() -> Date` | soup_date_copy | 2.24 | Copies @date. |
| free | `Date.free() -> none` | soup_date_free | 2.24 | Frees @date. |
| get_day | `Date.get_day() -> gint` | soup_date_get_day | 2.32 | Gets @date's day. |
| get_hour | `Date.get_hour() -> gint` | soup_date_get_hour | 2.32 | Gets @date's hour. |
| get_minute | `Date.get_minute() -> gint` | soup_date_get_minute | 2.32 | Gets @date's minute. |
| get_month | `Date.get_month() -> gint` | soup_date_get_month | 2.32 | Gets @date's month. |
| get_offset | `Date.get_offset() -> gint` | soup_date_get_offset | 2.32 | Gets @date's offset from UTC. |
| get_second | `Date.get_second() -> gint` | soup_date_get_second | 2.32 | Gets @date's second. |
| get_utc | `Date.get_utc() -> gint` | soup_date_get_utc | 2.32 | Gets @date's UTC flag |
| get_year | `Date.get_year() -> gint` | soup_date_get_year | 2.32 | Gets @date's year. |
| is_past | `Date.is_past() -> gboolean` | soup_date_is_past | 2.24 | Determines if @date is in the past. |
| to_string | `Date.to_string(format: DateFormat) -> utf8` | soup_date_to_string |  | Converts @date to a string in the format described by @format. |
| to_time_t | `Date.to_time_t() -> time_t` | soup_date_to_time_t |  | Converts @date to a <type>time_t</type>, assumming it to be in UTC. If @date is not representable as a <type>time_t</type>, it will be clamped into... |
| to_timeval | `Date.to_timeval(time: out GLib.TimeVal) -> none` | soup_date_to_timeval | 2.24 | Converts @date to a #GTimeVal. |

### Soup.HSTSEnforcerClass

C type: `SoupHSTSEnforcerClass`

The parent class.

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| changed | none |
| has_valid_policy | gboolean |
| hsts_enforced | none |
| is_persistent | gboolean |
| parent_class | GObject.ObjectClass |

### Soup.HSTSEnforcerDBClass

C type: `SoupHSTSEnforcerDBClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | HSTSEnforcerClass |

### Soup.HSTSEnforcerDBPrivate

C type: `SoupHSTSEnforcerDBPrivate`

### Soup.HSTSEnforcerPrivate

C type: `SoupHSTSEnforcerPrivate`

### Soup.HSTSPolicy

GType: `SoupHSTSPolicy` ?? C type: `SoupHSTSPolicy`

An HTTP Strict Transport Security policy. @domain represents the host that this policy applies to. The domain must be IDNA-canonicalized. soup_hsts...

#### Fields

| Field | Type |
| --- | --- |
| domain | utf8 |
| expires | Date |
| include_subdomains | gboolean |
| max_age | gulong |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HSTSPolicy.new(domain: utf8, max_age: gulong, include_subdomains: gboolean) -> HSTSPolicy` | soup_hsts_policy_new | 2.68 | Creates a new #SoupHSTSPolicy with the given attributes. @domain is a domain on which the strict transport security policy represented by this obje... |
| new_from_response | `HSTSPolicy.new_from_response(msg: Message) -> HSTSPolicy` | soup_hsts_policy_new_from_response | 2.68 | Parses @msg's first "Strict-Transport-Security" response header and returns a #SoupHSTSPolicy. |
| new_full | `HSTSPolicy.new_full(domain: utf8, max_age: gulong, expires: Date, include_subdomains: gboolean) -> HSTSPolicy` | soup_hsts_policy_new_full | 2.68 | Full version of #soup_hsts_policy_new(), to use with an existing expiration date. See #soup_hsts_policy_new() for details. |
| new_session_policy | `HSTSPolicy.new_session_policy(domain: utf8, include_subdomains: gboolean) -> HSTSPolicy` | soup_hsts_policy_new_session_policy | 2.68 | Creates a new session #SoupHSTSPolicy with the given attributes. A session policy is a policy that is valid during the lifetime of the #SoupHSTSEnf... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `HSTSPolicy.copy() -> HSTSPolicy` | soup_hsts_policy_copy | 2.68 | Copies @policy. |
| equal | `HSTSPolicy.equal(policy2: HSTSPolicy) -> gboolean` | soup_hsts_policy_equal | 2.68 | Tests if @policy1 and @policy2 are equal. |
| free | `HSTSPolicy.free() -> none` | soup_hsts_policy_free | 2.68 | Frees @policy. |
| get_domain | `HSTSPolicy.get_domain() -> utf8` | soup_hsts_policy_get_domain | 2.68 | Gets @policy's domain. |
| includes_subdomains | `HSTSPolicy.includes_subdomains() -> gboolean` | soup_hsts_policy_includes_subdomains | 2.68 | Gets whether @policy include its subdomains. |
| is_expired | `HSTSPolicy.is_expired() -> gboolean` | soup_hsts_policy_is_expired | 2.68 | Gets whether @policy is expired. Permanent policies never expire. |
| is_session_policy | `HSTSPolicy.is_session_policy() -> gboolean` | soup_hsts_policy_is_session_policy | 2.68 | Gets whether @policy is a non-permanent, non-expirable session policy. see soup_hsts_policy_new_session_policy() for details. |

### Soup.LoggerClass

C type: `SoupLoggerClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | GObject.ObjectClass |

### Soup.MessageBody

GType: `SoupMessageBody` ?? C type: `SoupMessageBody`

A #SoupMessage request or response body. Note that while @length always reflects the full length of the message body, @data is normally %NULL, and ...

#### Fields

| Field | Type |
| --- | --- |
| data | utf8 |
| length | gint64 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MessageBody.new() -> MessageBody` | soup_message_body_new |  | Creates a new #SoupMessageBody. #SoupMessage uses this internally; you will not normally need to call it yourself. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `MessageBody.append(use: MemoryUse, data: guint8, length: gsize) -> none` | soup_message_body_append |  | Appends @length bytes from @data to @body according to @use. |
| append_buffer | `MessageBody.append_buffer(buffer: Buffer) -> none` | soup_message_body_append_buffer |  | Appends the data from @buffer to @body. (#SoupMessageBody uses #SoupBuffers internally, so this is normally a constant-time operation that doesn't ... |
| append_take | `MessageBody.append_take(data: guint8, length: gsize) -> none` | soup_message_body_append_take | 2.32 | Appends @length bytes from @data to @body. This function is exactly equivalent to soup_message_body_append() with %SOUP_MEMORY_TAKE as second argum... |
| complete | `MessageBody.complete() -> none` | soup_message_body_complete |  | Tags @body as being complete; Call this when using chunked encoding after you have appended the last chunk. |
| flatten | `MessageBody.flatten() -> Buffer` | soup_message_body_flatten |  | Fills in @body's data field with a buffer containing all of the data in @body (plus an additional '\0' byte not counted by @body's length field). |
| free | `MessageBody.free() -> none` | soup_message_body_free |  | Frees @body. You will not normally need to use this, as #SoupMessage frees its associated message bodies automatically. |
| get_accumulate | `MessageBody.get_accumulate() -> gboolean` | soup_message_body_get_accumulate | 2.24 | Gets the accumulate flag on @body; see soup_message_body_set_accumulate() for details. |
| get_chunk | `MessageBody.get_chunk(offset: gint64) -> Buffer` | soup_message_body_get_chunk |  | Gets a #SoupBuffer containing data from @body starting at @offset. The size of the returned chunk is unspecified. You can iterate through the entir... |
| got_chunk | `MessageBody.got_chunk(chunk: Buffer) -> none` | soup_message_body_got_chunk | 2.24 | Handles the #SoupMessageBody part of receiving a chunk of data from the network. Normally this means appending @chunk to @body, exactly as with sou... |
| set_accumulate | `MessageBody.set_accumulate(accumulate: gboolean) -> none` | soup_message_body_set_accumulate | 2.24 | Sets or clears the accumulate flag on @body. (The default value is %TRUE.) If set to %FALSE, @body's %data field will not be filled in after the bo... |
| truncate | `MessageBody.truncate() -> none` | soup_message_body_truncate |  | Deletes all of the data in @body. |
| wrote_chunk | `MessageBody.wrote_chunk(chunk: Buffer) -> none` | soup_message_body_wrote_chunk | 2.24 | Handles the #SoupMessageBody part of writing a chunk of data to the network. Normally this is a no-op, but if you have set @body's accumulate flag ... |

### Soup.MessageClass

C type: `SoupMessageClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| finished | none |
| got_body | none |
| got_chunk | none |
| got_headers | none |
| got_informational | none |
| parent_class | GObject.ObjectClass |
| restarted | none |
| starting | none |
| wrote_body | none |
| wrote_chunk | none |
| wrote_headers | none |
| wrote_informational | none |

### Soup.MessageHeaders

GType: `SoupMessageHeaders` ?? C type: `SoupMessageHeaders`

The HTTP message headers associated with a request or response.

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MessageHeaders.new(type: MessageHeadersType) -> MessageHeaders` | soup_message_headers_new |  | Creates a #SoupMessageHeaders. (#SoupMessage does this automatically for its own headers. You would only need to use this method if you are manuall... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `MessageHeaders.append(name: utf8, value: utf8) -> none` | soup_message_headers_append |  | Appends a new header with name @name and value @value to @hdrs. (If there is an existing header with name @name, then this creates a second one, wh... |
| clean_connection_headers | `MessageHeaders.clean_connection_headers() -> none` | soup_message_headers_clean_connection_headers | 2.36 | Removes all the headers listed in the Connection header. |
| clear | `MessageHeaders.clear() -> none` | soup_message_headers_clear |  | Clears @hdrs. |
| foreach | `MessageHeaders.foreach(func: MessageHeadersForeachFunc, user_data: gpointer?) -> none` | soup_message_headers_foreach |  | Calls @func once for each header value in @hdrs. Beware that unlike soup_message_headers_get(), this processes the headers in exactly the way they ... |
| free | `MessageHeaders.free() -> none` | soup_message_headers_free |  | Frees @hdrs. |
| free_ranges | `MessageHeaders.free_ranges(ranges: Range) -> none` | soup_message_headers_free_ranges | 2.26 | Frees the array of ranges returned from soup_message_headers_get_ranges(). |
| get | `MessageHeaders.get(name: utf8) -> utf8` | soup_message_headers_get |  | Gets the value of header @name in @hdrs. This method was supposed to work correctly for both single-valued and list-valued headers, but because som... |
| get_content_disposition | `MessageHeaders.get_content_disposition(disposition: out utf8, params: out GLib.HashTable) -> gboolean` | soup_message_headers_get_content_disposition | 2.26 | Looks up the "Content-Disposition" header in @hdrs, parses it, and returns its value in *@disposition and *@params. @params can be %NULL if you are... |
| get_content_length | `MessageHeaders.get_content_length() -> gint64` | soup_message_headers_get_content_length |  | Gets the message body length that @hdrs declare. This will only be non-0 if soup_message_headers_get_encoding() returns %SOUP_ENCODING_CONTENT_LENGTH. |
| get_content_range | `MessageHeaders.get_content_range(start: out gint64, end: out gint64, total_length: out gint64?) -> gboolean` | soup_message_headers_get_content_range | 2.26 | Parses @hdrs's Content-Range header and returns it in @start, @end, and @total_length. If the total length field in the header was specified as "*"... |
| get_content_type | `MessageHeaders.get_content_type(params: out GLib.HashTable?) -> utf8` | soup_message_headers_get_content_type | 2.26 | Looks up the "Content-Type" header in @hdrs, parses it, and returns its value in *@content_type and *@params. @params can be %NULL if you are only ... |
| get_encoding | `MessageHeaders.get_encoding() -> Encoding` | soup_message_headers_get_encoding |  | Gets the message body encoding that @hdrs declare. This may not always correspond to the encoding used on the wire; eg, a HEAD response may declare... |
| get_expectations | `MessageHeaders.get_expectations() -> Expectation` | soup_message_headers_get_expectations |  | Gets the expectations declared by @hdrs's "Expect" header. Currently this will either be %SOUP_EXPECTATION_CONTINUE or %SOUP_EXPECTATION_UNRECOGNIZED. |
| get_headers_type | `MessageHeaders.get_headers_type() -> MessageHeadersType` | soup_message_headers_get_headers_type | 2.50 | Gets the type of headers. |
| get_list | `MessageHeaders.get_list(name: utf8) -> utf8` | soup_message_headers_get_list | 2.28 | Gets the value of header @name in @hdrs. Use this for headers whose values are comma-delimited lists, and which are therefore allowed to appear mul... |
| get_one | `MessageHeaders.get_one(name: utf8) -> utf8` | soup_message_headers_get_one | 2.28 | Gets the value of header @name in @hdrs. Use this for headers whose values are <emphasis>not</emphasis> comma-delimited lists, and which therefore ... |
| get_ranges | `MessageHeaders.get_ranges(total_length: gint64, ranges: out Range, length: out gint) -> gboolean` | soup_message_headers_get_ranges | 2.26 | Parses @hdrs's Range header and returns an array of the requested byte ranges. The returned array must be freed with soup_message_headers_free_rang... |
| header_contains | `MessageHeaders.header_contains(name: utf8, token: utf8) -> gboolean` | soup_message_headers_header_contains | 2.50 | Checks whether the list-valued header @name is present in @hdrs, and contains a case-insensitive match for @token. (If @name is present in @hdrs, t... |
| header_equals | `MessageHeaders.header_equals(name: utf8, value: utf8) -> gboolean` | soup_message_headers_header_equals | 2.50 | Checks whether the header @name is present in @hdrs and is (case-insensitively) equal to @value. |
| remove | `MessageHeaders.remove(name: utf8) -> none` | soup_message_headers_remove |  | Removes @name from @hdrs. If there are multiple values for @name, they are all removed. |
| replace | `MessageHeaders.replace(name: utf8, value: utf8) -> none` | soup_message_headers_replace |  | Replaces the value of the header @name in @hdrs with @value. (See also soup_message_headers_append().) The caller is expected to make sure that @na... |
| set_content_disposition | `MessageHeaders.set_content_disposition(disposition: utf8, params: GLib.HashTable?) -> none` | soup_message_headers_set_content_disposition | 2.26 | Sets the "Content-Disposition" header in @hdrs to @disposition, optionally with additional parameters specified in @params. See soup_message_header... |
| set_content_length | `MessageHeaders.set_content_length(content_length: gint64) -> none` | soup_message_headers_set_content_length |  | Sets the message body length that @hdrs will declare, and sets @hdrs's encoding to %SOUP_ENCODING_CONTENT_LENGTH. You do not normally need to call ... |
| set_content_range | `MessageHeaders.set_content_range(start: gint64, end: gint64, total_length: gint64) -> none` | soup_message_headers_set_content_range | 2.26 | Sets @hdrs's Content-Range header according to the given values. (Note that @total_length is the total length of the entire resource that this is a... |
| set_content_type | `MessageHeaders.set_content_type(content_type: utf8, params: GLib.HashTable?) -> none` | soup_message_headers_set_content_type | 2.26 | Sets the "Content-Type" header in @hdrs to @content_type, optionally with additional parameters specified in @params. |
| set_encoding | `MessageHeaders.set_encoding(encoding: Encoding) -> none` | soup_message_headers_set_encoding |  | Sets the message body encoding that @hdrs will declare. In particular, you should use this if you are going to send a request or response in chunke... |
| set_expectations | `MessageHeaders.set_expectations(expectations: Expectation) -> none` | soup_message_headers_set_expectations |  | Sets @hdrs's "Expect" header according to @expectations. Currently %SOUP_EXPECTATION_CONTINUE is the only known expectation value. You should set t... |
| set_range | `MessageHeaders.set_range(start: gint64, end: gint64) -> none` | soup_message_headers_set_range | 2.26 | Sets @hdrs's Range header to request the indicated range. @start and @end are interpreted as in a #SoupRange. If you need to request multiple range... |
| set_ranges | `MessageHeaders.set_ranges(ranges: Range, length: gint) -> none` | soup_message_headers_set_ranges | 2.26 | Sets @hdrs's Range header to request the indicated ranges. (If you only want to request a single range, you can use soup_message_headers_set_range().) |

### Soup.MessageHeadersIter

C type: `SoupMessageHeadersIter`

An opaque type used to iterate over a %SoupMessageHeaders structure. After intializing the iterator with soup_message_headers_iter_init(), call sou...

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
| next | `MessageHeadersIter.next(name: out utf8, value: out utf8) -> gboolean` | soup_message_headers_iter_next |  | Yields the next name/value pair in the %SoupMessageHeaders being iterated by @iter. If @iter has already yielded the last header, then soup_message... |

### Soup.MessageQueue

C type: `SoupMessageQueue`

### Soup.MessageQueueItem

C type: `SoupMessageQueueItem`

### Soup.Multipart

GType: `SoupMultipart` ?? C type: `SoupMultipart`

Represents a multipart HTTP message body, parsed according to the syntax of RFC 2046. Of particular interest to HTTP are <literal>multipart/byte-ra...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Multipart.new(mime_type: utf8) -> Multipart` | soup_multipart_new | 2.26 | Creates a new empty #SoupMultipart with a randomly-generated boundary string. Note that @mime_type must be the full MIME type, including "multipart/". |
| new_from_message | `Multipart.new_from_message(headers: MessageHeaders, body: MessageBody) -> Multipart` | soup_multipart_new_from_message | 2.26 | Parses @headers and @body to form a new #SoupMultipart |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_form_file | `Multipart.append_form_file(control_name: utf8, filename: utf8, content_type: utf8, body: Buffer) -> none` | soup_multipart_append_form_file | 2.26 | Adds a new MIME part containing @body to @multipart, using "Content-Disposition: form-data", as per the HTML forms specification. See soup_form_req... |
| append_form_string | `Multipart.append_form_string(control_name: utf8, data: utf8) -> none` | soup_multipart_append_form_string | 2.26 | Adds a new MIME part containing @data to @multipart, using "Content-Disposition: form-data", as per the HTML forms specification. See soup_form_req... |
| append_part | `Multipart.append_part(headers: MessageHeaders, body: Buffer) -> none` | soup_multipart_append_part | 2.26 | Adds a new MIME part to @multipart with the given headers and body. (The multipart will make its own copies of @headers and @body, so you should fr... |
| free | `Multipart.free() -> none` | soup_multipart_free | 2.26 | Frees @multipart |
| get_length | `Multipart.get_length() -> gint` | soup_multipart_get_length | 2.26 | Gets the number of body parts in @multipart |
| get_part | `Multipart.get_part(part: gint, headers: out MessageHeaders, body: out Buffer) -> gboolean` | soup_multipart_get_part | 2.26 | Gets the indicated body part from @multipart. |
| to_message | `Multipart.to_message(dest_headers: MessageHeaders, dest_body: MessageBody) -> none` | soup_multipart_to_message | 2.26 | Serializes @multipart to @dest_headers and @dest_body. |

### Soup.MultipartInputStreamClass

C type: `SoupMultipartInputStreamClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | Gio.FilterInputStreamClass |

### Soup.MultipartInputStreamPrivate

C type: `SoupMultipartInputStreamPrivate`

### Soup.PasswordManagerInterface

C type: `SoupPasswordManagerInterface`

#### Fields

| Field | Type |
| --- | --- |
| base | GObject.TypeInterface |
| get_passwords_async | none |
| get_passwords_sync | none |

### Soup.ProxyResolverDefaultClass

C type: `SoupProxyResolverDefaultClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.ProxyResolverInterface

C type: `SoupProxyResolverInterface`

#### Fields

| Field | Type |
| --- | --- |
| base | GObject.TypeInterface |
| get_proxy_async | none |
| get_proxy_sync | guint |

### Soup.ProxyURIResolverInterface

C type: `SoupProxyURIResolverInterface`

the #SoupProxyURIResolver

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| base | GObject.TypeInterface |
| get_proxy_uri_async | none |
| get_proxy_uri_sync | guint |

### Soup.Range

C type: `SoupRange`

Represents a byte range as used in the Range header. If @end is non-negative, then @start and @end represent the bounds of of the range, counting f...

#### Fields

| Field | Type |
| --- | --- |
| end | gint64 |
| start | gint64 |

### Soup.RequestClass

C type: `SoupRequestClass`

a #GInputStream that can be used to read from the URI pointed to by @request.

#### Fields

| Field | Type |
| --- | --- |
| check_uri | gboolean |
| get_content_length | gint64 |
| get_content_type | utf8 |
| parent | GObject.ObjectClass |
| schemes | utf8 |
| send | Gio.InputStream |
| send_async | none |
| send_finish | Gio.InputStream |

### Soup.RequestDataClass

C type: `SoupRequestDataClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | RequestClass |

### Soup.RequestDataPrivate

C type: `SoupRequestDataPrivate`

### Soup.RequesterClass

C type: `SoupRequesterClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Soup.RequesterPrivate

C type: `SoupRequesterPrivate`

### Soup.RequestFileClass

C type: `SoupRequestFileClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | RequestClass |

### Soup.RequestFilePrivate

C type: `SoupRequestFilePrivate`

### Soup.RequestHTTPClass

C type: `SoupRequestHTTPClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | RequestClass |

### Soup.RequestHTTPPrivate

C type: `SoupRequestHTTPPrivate`

### Soup.RequestPrivate

C type: `SoupRequestPrivate`

### Soup.ServerClass

C type: `SoupServerClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | GObject.ObjectClass |
| request_aborted | none |
| request_finished | none |
| request_read | none |
| request_started | none |

### Soup.SessionAsyncClass

C type: `SoupSessionAsyncClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | SessionClass |

### Soup.SessionClass

C type: `SoupSessionClass`

a #SoupSession

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved4 | none |
| auth_required | none |
| authenticate | none |
| cancel_message | none |
| flush_queue | none |
| kick | none |
| parent_class | GObject.ObjectClass |
| queue_message | none |
| request_started | none |
| requeue_message | none |
| send_message | guint |

### Soup.SessionFeatureInterface

C type: `SoupSessionFeatureInterface`

The interface implemented by #SoupSessionFeature<!-- -->s.

#### Fields

| Field | Type |
| --- | --- |
| add_feature | gboolean |
| attach | none |
| detach | none |
| has_feature | gboolean |
| parent | GObject.TypeInterface |
| remove_feature | gboolean |
| request_queued | none |
| request_started | none |
| request_unqueued | none |

### Soup.SessionSyncClass

C type: `SoupSessionSyncClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| parent_class | SessionClass |

### Soup.SocketClass

C type: `SoupSocketClass`

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| disconnected | none |
| new_connection | none |
| parent_class | GObject.ObjectClass |
| readable | none |
| writable | none |

### Soup.URI

GType: `SoupURI` ?? C type: `SoupURI`

A #SoupURI represents a (parsed) URI. #SoupURI supports RFC 3986 (URI Generic Syntax), and can parse any valid URI. However, libsoup only uses "htt...

#### Fields

| Field | Type |
| --- | --- |
| fragment | utf8 |
| host | utf8 |
| password | utf8 |
| path | utf8 |
| port | guint |
| query | utf8 |
| scheme | utf8 |
| user | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `URI.new(uri_string: utf8?) -> URI` | soup_uri_new |  | Parses an absolute URI. You can also pass %NULL for @uri_string if you want to get back an "empty" #SoupURI that you can fill in by hand. (You will... |
| new_with_base | `URI.new_with_base(base: URI, uri_string: utf8) -> URI` | soup_uri_new_with_base |  | Parses @uri_string relative to @base. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| decode | `decode(part: utf8) -> utf8` | soup_uri_decode |  | Fully %<!-- -->-decodes @part. In the past, this would return %NULL if @part contained invalid percent-encoding, but now it just ignores the proble... |
| encode | `encode(part: utf8, escape_extra: utf8?) -> utf8` | soup_uri_encode |  | This %<!-- -->-encodes the given URI part and returns the escaped version in allocated memory, which the caller must free when it is done. |
| normalize | `normalize(part: utf8, unescape_extra: utf8?) -> utf8` | soup_uri_normalize |  | %<!-- -->-decodes any "unreserved" characters (or characters in @unescape_extra) in @part, and %<!-- -->-encodes any non-ASCII characters, spaces, ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `URI.copy() -> URI` | soup_uri_copy |  | Copies @uri |
| copy_host | `URI.copy_host() -> URI` | soup_uri_copy_host | 2.28 | Makes a copy of @uri, considering only the protocol, host, and port |
| equal | `URI.equal(uri2: URI) -> gboolean` | soup_uri_equal |  | Tests whether or not @uri1 and @uri2 are equal in all parts |
| free | `URI.free() -> none` | soup_uri_free |  | Frees @uri. |
| get_fragment | `URI.get_fragment() -> utf8` | soup_uri_get_fragment | 2.32 | Gets @uri's fragment. |
| get_host | `URI.get_host() -> utf8` | soup_uri_get_host | 2.32 | Gets @uri's host. |
| get_password | `URI.get_password() -> utf8` | soup_uri_get_password | 2.32 | Gets @uri's password. |
| get_path | `URI.get_path() -> utf8` | soup_uri_get_path | 2.32 | Gets @uri's path. |
| get_port | `URI.get_port() -> guint` | soup_uri_get_port | 2.32 | Gets @uri's port. |
| get_query | `URI.get_query() -> utf8` | soup_uri_get_query | 2.32 | Gets @uri's query. |
| get_scheme | `URI.get_scheme() -> utf8` | soup_uri_get_scheme | 2.32 | Gets @uri's scheme. |
| get_user | `URI.get_user() -> utf8` | soup_uri_get_user | 2.32 | Gets @uri's user. |
| host_equal | `URI.host_equal(v2: URI) -> gboolean` | soup_uri_host_equal | 2.28 | Compares @v1 and @v2, considering only the scheme, host, and port. |
| host_hash | `URI.host_hash() -> guint` | soup_uri_host_hash | 2.28 | Hashes @key, considering only the scheme, host, and port. |
| set_fragment | `URI.set_fragment(fragment: utf8?) -> none` | soup_uri_set_fragment |  | Sets @uri's fragment to @fragment. |
| set_host | `URI.set_host(host: utf8?) -> none` | soup_uri_set_host |  | Sets @uri's host to @host. If @host is an IPv6 IP address, it should not include the brackets required by the URI syntax; they will be added automa... |
| set_password | `URI.set_password(password: utf8?) -> none` | soup_uri_set_password |  | Sets @uri's password to @password. |
| set_path | `URI.set_path(path: utf8) -> none` | soup_uri_set_path |  | Sets @uri's path to @path. |
| set_port | `URI.set_port(port: guint) -> none` | soup_uri_set_port |  | Sets @uri's port to @port. If @port is 0, @uri will not have an explicitly-specified port. |
| set_query | `URI.set_query(query: utf8?) -> none` | soup_uri_set_query |  | Sets @uri's query to @query. |
| set_query_from_fields | `URI.set_query_from_fields(first_field: utf8, ...: void) -> none` | soup_uri_set_query_from_fields |  | Sets @uri's query to the result of encoding the given form fields and values according to the * HTML form rules. See soup_form_encode() for more in... |
| set_query_from_form | `URI.set_query_from_form(form: GLib.HashTable) -> none` | soup_uri_set_query_from_form |  | Sets @uri's query to the result of encoding @form according to the HTML form rules. See soup_form_encode_hash() for more information. |
| set_scheme | `URI.set_scheme(scheme: utf8) -> none` | soup_uri_set_scheme |  | Sets @uri's scheme to @scheme. This will also set @uri's port to the default port for @scheme, if known. |
| set_user | `URI.set_user(user: utf8?) -> none` | soup_uri_set_user |  | Sets @uri's user to @user. |
| to_string | `URI.to_string(just_path_and_query: gboolean) -> utf8` | soup_uri_to_string |  | Returns a string representing @uri. If @just_path_and_query is %TRUE, this concatenates the path and query together. That is, it constructs the str... |
| uses_default_port | `URI.uses_default_port() -> gboolean` | soup_uri_uses_default_port |  | Tests if @uri uses the default port for its scheme. (Eg, 80 for http.) (This only works for http, https and ftp; libsoup does not know the default ... |

### Soup.WebsocketConnectionClass

C type: `SoupWebsocketConnectionClass`

The abstract base class for #SoupWebsocketConnection

#### Fields

| Field | Type |
| --- | --- |
| closed | none |
| closing | none |
| error | none |
| message | none |
| parent | GObject.ObjectClass |
| pong | none |

### Soup.WebsocketConnectionPrivate

C type: `SoupWebsocketConnectionPrivate`

### Soup.WebsocketExtensionClass

C type: `SoupWebsocketExtensionClass`

The class structure for the SoupWebsocketExtension.

#### Fields

| Field | Type |
| --- | --- |
| _libsoup_reserved1 | none |
| _libsoup_reserved2 | none |
| _libsoup_reserved3 | none |
| _libsoup_reserved4 | none |
| configure | gboolean |
| get_request_params | utf8 |
| get_response_params | utf8 |
| name | utf8 |
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

### Soup.XMLRPCParams

C type: `SoupXMLRPCParams`

Opaque structure containing XML-RPC methodCall parameter values. Can be parsed using soup_xmlrpc_params_parse() and freed with soup_xmlrpc_params_f...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `XMLRPCParams.free() -> none` | soup_xmlrpc_params_free | 2.52 | Free a #SoupXMLRPCParams returned by soup_xmlrpc_parse_request(). |
| parse | `XMLRPCParams.parse(signature: utf8?) -> GLib.Variant throws` | soup_xmlrpc_params_parse | 2.52 | Parse method parameters returned by soup_xmlrpc_parse_request(). Deserialization details: - If @signature is provided, &lt;int&gt; and &lt;i4&gt; c... |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_completion | `add_completion(async_context: GLib.MainContext?, function: GLib.SourceFunc, data: gpointer?) -> GLib.Source` | soup_add_completion | 2.24 | Adds @function to be executed from inside @async_context with the default priority. Use this when you want to complete an action in @async_context'... |
| add_idle | `add_idle(async_context: GLib.MainContext?, function: GLib.SourceFunc, data: gpointer?) -> GLib.Source` | soup_add_idle |  | Adds an idle event as with g_idle_add(), but using the given @async_context. If you want @function to run "right away", use soup_add_completion(), ... |
| add_io_watch | `add_io_watch(async_context: GLib.MainContext?, chan: GLib.IOChannel, condition: GLib.IOCondition, function: GLib.IOFunc, data: gpointer?) -> GLib.Source` | soup_add_io_watch |  | Adds an I/O watch as with g_io_add_watch(), but using the given @async_context. |
| add_timeout | `add_timeout(async_context: GLib.MainContext?, interval: guint, function: GLib.SourceFunc, data: gpointer?) -> GLib.Source` | soup_add_timeout |  | Adds a timeout as with g_timeout_add(), but using the given @async_context. |
| check_version | `check_version(major: guint, minor: guint, micro: guint) -> gboolean` | soup_check_version | 2.42 | Like SOUP_CHECK_VERSION, but the check for soup_check_version is at runtime instead of compile time. This is useful for compiling against older ver... |
| cookie_parse | `cookie_parse(header: utf8, origin: URI) -> Cookie` | soup_cookie_parse | 2.24 | Parses @header and returns a #SoupCookie. (If @header contains multiple cookies, only the first one will be parsed.) If @header does not have "path... |
| cookies_free | `cookies_free(cookies: GLib.SList) -> none` | soup_cookies_free | 2.24 | Frees @cookies. |
| cookies_from_request | `cookies_from_request(msg: Message) -> GLib.SList` | soup_cookies_from_request | 2.24 | Parses @msg's Cookie request header and returns a #GSList of #SoupCookie<!-- -->s. As the "Cookie" header, unlike "Set-Cookie", only contains cooki... |
| cookies_from_response | `cookies_from_response(msg: Message) -> GLib.SList` | soup_cookies_from_response | 2.24 | Parses @msg's Set-Cookie response headers and returns a #GSList of #SoupCookie<!-- -->s. Cookies that do not specify "path" or "domain" attributes ... |
| cookies_to_cookie_header | `cookies_to_cookie_header(cookies: GLib.SList) -> utf8` | soup_cookies_to_cookie_header | 2.24 | Serializes a #GSList of #SoupCookie into a string suitable for setting as the value of the "Cookie" header. |
| cookies_to_request | `cookies_to_request(cookies: GLib.SList, msg: Message) -> none` | soup_cookies_to_request | 2.24 | Adds the name and value of each cookie in @cookies to @msg's "Cookie" request. (If @msg already has a "Cookie" request header, these cookies will b... |
| cookies_to_response | `cookies_to_response(cookies: GLib.SList, msg: Message) -> none` | soup_cookies_to_response | 2.24 | Appends a "Set-Cookie" response header to @msg for each cookie in @cookies. (This is in addition to any other "Set-Cookie" headers @msg may already... |
| form_decode | `form_decode(encoded_form: utf8) -> GLib.HashTable` | soup_form_decode |  | Decodes @form, which is an urlencoded dataset as defined in the HTML 4.01 spec. |
| form_decode_multipart | `form_decode_multipart(msg: Message, file_control_name: utf8?, filename: out utf8?, content_type: out utf8?, file: out Buffer?) -> GLib.HashTable` | soup_form_decode_multipart | 2.26 | Decodes the "multipart/form-data" request in @msg; this is a convenience method for the case when you have a single file upload control in a form. ... |
| form_encode | `form_encode(first_field: utf8, ...: void) -> utf8` | soup_form_encode |  | Encodes the given field names and values into a value of type "application/x-www-form-urlencoded", as defined in the HTML 4.01 spec. This method re... |
| form_encode_datalist | `form_encode_datalist(form_data_set: GLib.Data) -> utf8` | soup_form_encode_datalist |  | Encodes @form_data_set into a value of type "application/x-www-form-urlencoded", as defined in the HTML 4.01 spec. Unlike soup_form_encode_hash(), ... |
| form_encode_hash | `form_encode_hash(form_data_set: GLib.HashTable) -> utf8` | soup_form_encode_hash |  | Encodes @form_data_set into a value of type "application/x-www-form-urlencoded", as defined in the HTML 4.01 spec. Note that the HTML spec states t... |
| form_encode_valist | `form_encode_valist(first_field: utf8, args: va_list) -> utf8` | soup_form_encode_valist |  | See soup_form_encode(). This is mostly an internal method, used by various other methods such as soup_uri_set_query_from_fields() and soup_form_req... |
| form_request_new | `form_request_new(method: utf8, uri: utf8, first_field: utf8, ...: void) -> Message` | soup_form_request_new |  | Creates a new %SoupMessage and sets it up to send the given data to @uri via @method. (That is, if @method is "GET", it will encode the form data i... |
| form_request_new_from_datalist | `form_request_new_from_datalist(method: utf8, uri: utf8, form_data_set: GLib.Data) -> Message` | soup_form_request_new_from_datalist |  | Creates a new %SoupMessage and sets it up to send @form_data_set to @uri via @method, as with soup_form_request_new(). |
| form_request_new_from_hash | `form_request_new_from_hash(method: utf8, uri: utf8, form_data_set: GLib.HashTable) -> Message` | soup_form_request_new_from_hash |  | Creates a new %SoupMessage and sets it up to send @form_data_set to @uri via @method, as with soup_form_request_new(). |
| form_request_new_from_multipart | `form_request_new_from_multipart(uri: utf8, multipart: Multipart) -> Message` | soup_form_request_new_from_multipart | 2.26 | Creates a new %SoupMessage and sets it up to send @multipart to @uri via POST. To send a <literal>"multipart/form-data"</literal> POST, first creat... |
| get_major_version | `get_major_version() -> guint` | soup_get_major_version | 2.42 | Returns the major version number of the libsoup library. (e.g. in libsoup version 2.42.0 this is 2.) This function is in the library, so it represe... |
| get_micro_version | `get_micro_version() -> guint` | soup_get_micro_version | 2.42 | Returns the micro version number of the libsoup library. (e.g. in libsoup version 2.42.0 this is 0.) This function is in the library, so it represe... |
| get_minor_version | `get_minor_version() -> guint` | soup_get_minor_version | 2.42 | Returns the minor version number of the libsoup library. (e.g. in libsoup version 2.42.0 this is 42.) This function is in the library, so it repres... |
| get_resource | `get_resource() -> Gio.Resource` | soup_get_resource |  |  |
| header_contains | `header_contains(header: utf8, token: utf8) -> gboolean` | soup_header_contains |  | Parses @header to see if it contains the token @token (matched case-insensitively). Note that this can't be used with lists that have qvalues. |
| header_free_list | `header_free_list(list: GLib.SList) -> none` | soup_header_free_list |  | Frees @list. |
| header_free_param_list | `header_free_param_list(param_list: GLib.HashTable) -> none` | soup_header_free_param_list |  | Frees @param_list. |
| header_g_string_append_param | `header_g_string_append_param(string: GLib.String, name: utf8, value: utf8) -> none` | soup_header_g_string_append_param | 2.26 | Appends something like <literal>@name=@value</literal> to @string, taking care to quote @value if needed, and if so, to escape any quotes or backsl... |
| header_g_string_append_param_quoted | `header_g_string_append_param_quoted(string: GLib.String, name: utf8, value: utf8) -> none` | soup_header_g_string_append_param_quoted | 2.30 | Appends something like <literal>@name="@value"</literal> to @string, taking care to escape any quotes or backslashes in @value. If @value is (non-A... |
| header_parse_list | `header_parse_list(header: utf8) -> GLib.SList` | soup_header_parse_list |  | Parses a header whose content is described by RFC2616 as "#something", where "something" does not itself contain commas, except as part of quoted-s... |
| header_parse_param_list | `header_parse_param_list(header: utf8) -> GLib.HashTable` | soup_header_parse_param_list |  | Parses a header which is a comma-delimited list of something like: <literal>token [ "=" ( token \| quoted-string ) ]</literal>. Tokens that don't ha... |
| header_parse_param_list_strict | `header_parse_param_list_strict(header: utf8) -> GLib.HashTable` | soup_header_parse_param_list_strict | 2.66 | A strict version of soup_header_parse_param_list() that bails out if there are duplicate parameters. Note that this function will treat RFC5987-enc... |
| header_parse_quality_list | `header_parse_quality_list(header: utf8, unacceptable: out GLib.SList?) -> GLib.SList` | soup_header_parse_quality_list |  | Parses a header whose content is a list of items with optional "qvalue"s (eg, Accept, Accept-Charset, Accept-Encoding, Accept-Language, TE). If @un... |
| header_parse_semi_param_list | `header_parse_semi_param_list(header: utf8) -> GLib.HashTable` | soup_header_parse_semi_param_list | 2.24 | Parses a header which is a semicolon-delimited list of something like: <literal>token [ "=" ( token \| quoted-string ) ]</literal>. Tokens that don'... |
| header_parse_semi_param_list_strict | `header_parse_semi_param_list_strict(header: utf8) -> GLib.HashTable` | soup_header_parse_semi_param_list_strict | 2.66 | A strict version of soup_header_parse_semi_param_list() that bails out if there are duplicate parameters. Note that this function will treat RFC598... |
| headers_parse | `headers_parse(str: utf8, len: gint, dest: MessageHeaders) -> gboolean` | soup_headers_parse | 2.26 | Parses the headers of an HTTP request or response in @str and stores the results in @dest. Beware that @dest may be modified even on failure. This ... |
| headers_parse_request | `headers_parse_request(str: utf8, len: gint, req_headers: MessageHeaders, req_method: out utf8?, req_path: out utf8?, ver: out HTTPVersion?) -> guint` | soup_headers_parse_request |  | Parses the headers of an HTTP request in @str and stores the results in @req_method, @req_path, @ver, and @req_headers. Beware that @req_headers ma... |
| headers_parse_response | `headers_parse_response(str: utf8, len: gint, headers: MessageHeaders, ver: out HTTPVersion?, status_code: out guint?, reason_phrase: out utf8?) -> gboolean` | soup_headers_parse_response |  | Parses the headers of an HTTP response in @str and stores the results in @ver, @status_code, @reason_phrase, and @headers. Beware that @headers may... |
| headers_parse_status_line | `headers_parse_status_line(status_line: utf8, ver: out HTTPVersion?, status_code: out guint?, reason_phrase: out utf8?) -> gboolean` | soup_headers_parse_status_line |  | Parses the HTTP Status-Line string in @status_line into @ver, @status_code, and @reason_phrase. @status_line must be terminated by either "\0" or "... |
| http_error_quark | `http_error_quark() -> GLib.Quark` | soup_http_error_quark |  |  |
| message_headers_iter_init | `message_headers_iter_init(iter: out MessageHeadersIter, hdrs: MessageHeaders) -> none` | soup_message_headers_iter_init |  | Initializes @iter for iterating @hdrs. |
| request_error_quark | `request_error_quark() -> GLib.Quark` | soup_request_error_quark |  |  |
| requester_error_quark | `requester_error_quark() -> GLib.Quark` | soup_requester_error_quark |  |  |
| status_get_phrase | `status_get_phrase(status_code: guint) -> utf8` | soup_status_get_phrase |  | Looks up the stock HTTP description of @status_code. This is used by soup_message_set_status() to get the correct text to go with a given status co... |
| status_proxify | `status_proxify(status_code: guint) -> guint` | soup_status_proxify | 2.26 | Turns %SOUP_STATUS_CANT_RESOLVE into %SOUP_STATUS_CANT_RESOLVE_PROXY and %SOUP_STATUS_CANT_CONNECT into %SOUP_STATUS_CANT_CONNECT_PROXY. Other stat... |
| str_case_equal | `str_case_equal(v1: gpointer?, v2: gpointer?) -> gboolean` | soup_str_case_equal |  | Compares @v1 and @v2 in a case-insensitive manner |
| str_case_hash | `str_case_hash(key: gpointer?) -> guint` | soup_str_case_hash |  | Hashes @key in a case-insensitive manner. |
| tld_domain_is_public_suffix | `tld_domain_is_public_suffix(domain: utf8) -> gboolean` | soup_tld_domain_is_public_suffix | 2.40 | Looks whether the @domain passed as argument is a public domain suffix (.org, .com, .co.uk, etc) or not. Prior to libsoup 2.46, this function requi... |
| tld_error_quark | `tld_error_quark() -> GLib.Quark` | soup_tld_error_quark |  |  |
| tld_get_base_domain | `tld_get_base_domain(hostname: utf8) -> utf8 throws` | soup_tld_get_base_domain | 2.40 | Finds the base domain for a given @hostname. The base domain is composed by the top level domain (such as .org, .com, .co.uk, etc) plus the second ... |
| uri_decode | `uri_decode(part: utf8) -> utf8` | soup_uri_decode |  | Fully %<!-- -->-decodes @part. In the past, this would return %NULL if @part contained invalid percent-encoding, but now it just ignores the proble... |
| uri_encode | `uri_encode(part: utf8, escape_extra: utf8?) -> utf8` | soup_uri_encode |  | This %<!-- -->-encodes the given URI part and returns the escaped version in allocated memory, which the caller must free when it is done. |
| uri_normalize | `uri_normalize(part: utf8, unescape_extra: utf8?) -> utf8` | soup_uri_normalize |  | %<!-- -->-decodes any "unreserved" characters (or characters in @unescape_extra) in @part, and %<!-- -->-encodes any non-ASCII characters, spaces, ... |
| value_array_append | `value_array_append(array: GObject.ValueArray, type: GType, ...: void) -> none` | soup_value_array_append |  | Appends the provided value of type @type to @array as with g_value_array_append(). (The provided data is copied rather than being inserted directly.) |
| value_array_append_vals | `value_array_append_vals(array: GObject.ValueArray, first_type: GType, ...: void) -> none` | soup_value_array_append_vals |  | Appends the provided values into @array as with g_value_array_append(). (The provided data is copied rather than being inserted directly.) |
| value_array_from_args | `value_array_from_args(args: va_list) -> GObject.ValueArray` | soup_value_array_from_args |  | Creates a #GValueArray from the provided arguments, which must consist of pairs of a #GType and a value of that type, terminated by %G_TYPE_INVALID... |
| value_array_get_nth | `value_array_get_nth(array: GObject.ValueArray, index_: guint, type: GType, ...: void) -> gboolean` | soup_value_array_get_nth |  | Gets the @index_ element of @array and stores its value into the provided location. |
| value_array_insert | `value_array_insert(array: GObject.ValueArray, index_: guint, type: GType, ...: void) -> none` | soup_value_array_insert |  | Inserts the provided value of type @type into @array as with g_value_array_insert(). (The provided data is copied rather than being inserted direct... |
| value_array_new | `value_array_new() -> GObject.ValueArray` | soup_value_array_new |  | Creates a new %GValueArray. (This is just a wrapper around g_value_array_new(), for naming consistency purposes.) |
| value_array_new_with_vals | `value_array_new_with_vals(first_type: GType, ...: void) -> GObject.ValueArray` | soup_value_array_new_with_vals |  | Creates a new %GValueArray and copies the provided values into it. |
| value_array_to_args | `value_array_to_args(array: GObject.ValueArray, args: va_list) -> gboolean` | soup_value_array_to_args |  | Extracts a #GValueArray into the provided arguments, which must consist of pairs of a #GType and a value of pointer-to-that-type, terminated by %G_... |
| value_hash_insert | `value_hash_insert(hash: GLib.HashTable, key: utf8, type: GType, ...: void) -> none` | soup_value_hash_insert |  | Inserts the provided value of type @type into @hash. (Unlike with g_hash_table_insert(), both the key and the value are copied). |
| value_hash_insert_vals | `value_hash_insert_vals(hash: GLib.HashTable, first_key: utf8, ...: void) -> none` | soup_value_hash_insert_vals |  | Inserts the given data into @hash. As with soup_value_hash_insert(), the keys and values are copied rather than being inserted directly. |
| value_hash_insert_value | `value_hash_insert_value(hash: GLib.HashTable, key: utf8, value: GObject.Value) -> none` | soup_value_hash_insert_value |  | Inserts @value into @hash. (Unlike with g_hash_table_insert(), both the key and the value are copied). |
| value_hash_lookup | `value_hash_lookup(hash: GLib.HashTable, key: utf8, type: GType, ...: void) -> gboolean` | soup_value_hash_lookup |  | Looks up @key in @hash and stores its value into the provided location. |
| value_hash_lookup_vals | `value_hash_lookup_vals(hash: GLib.HashTable, first_key: utf8, ...: void) -> gboolean` | soup_value_hash_lookup_vals |  | Looks up a number of keys in @hash and returns their values. |
| value_hash_new | `value_hash_new() -> GLib.HashTable` | soup_value_hash_new |  | Creates a #GHashTable whose keys are strings and whose values are #GValue. |
| value_hash_new_with_vals | `value_hash_new_with_vals(first_key: utf8, ...: void) -> GLib.HashTable` | soup_value_hash_new_with_vals |  | Creates a #GHashTable whose keys are strings and whose values are #GValue, and initializes it with the provided data. As with soup_value_hash_inser... |
| websocket_client_prepare_handshake | `websocket_client_prepare_handshake(msg: Message, origin: utf8?, protocols: utf8?) -> none` | soup_websocket_client_prepare_handshake | 2.50 | Adds the necessary headers to @msg to request a WebSocket handshake. The message body and non-WebSocket-related headers are not modified. Use soup_... |
| websocket_client_prepare_handshake_with_extensions | `websocket_client_prepare_handshake_with_extensions(msg: Message, origin: utf8?, protocols: utf8?, supported_extensions: GObject.TypeClass?) -> none` | soup_websocket_client_prepare_handshake_with_extensions | 2.68 | Adds the necessary headers to @msg to request a WebSocket handshake including supported WebSocket extensions. The message body and non-WebSocket-re... |
| websocket_client_verify_handshake | `websocket_client_verify_handshake(msg: Message) -> gboolean throws` | soup_websocket_client_verify_handshake | 2.50 | Looks at the response status code and headers in @msg and determines if they contain a valid WebSocket handshake response (given the handshake requ... |
| websocket_client_verify_handshake_with_extensions | `websocket_client_verify_handshake_with_extensions(msg: Message, supported_extensions: GObject.TypeClass?, accepted_extensions: out GLib.List?) -> gboolean throws` | soup_websocket_client_verify_handshake_with_extensions | 2.68 | Looks at the response status code and headers in @msg and determines if they contain a valid WebSocket handshake response (given the handshake requ... |
| websocket_error_get_quark | `websocket_error_get_quark() -> GLib.Quark` | soup_websocket_error_get_quark |  |  |
| websocket_server_check_handshake | `websocket_server_check_handshake(msg: Message, origin: utf8?, protocols: utf8?) -> gboolean throws` | soup_websocket_server_check_handshake | 2.50 | Examines the method and request headers in @msg and determines whether @msg contains a valid handshake request. If @origin is non-%NULL, then only ... |
| websocket_server_check_handshake_with_extensions | `websocket_server_check_handshake_with_extensions(msg: Message, origin: utf8?, protocols: utf8?, supported_extensions: GObject.TypeClass?) -> gboolean throws` | soup_websocket_server_check_handshake_with_extensions | 2.68 | Examines the method and request headers in @msg and determines whether @msg contains a valid handshake request. If @origin is non-%NULL, then only ... |
| websocket_server_process_handshake | `websocket_server_process_handshake(msg: Message, expected_origin: utf8?, protocols: utf8?) -> gboolean` | soup_websocket_server_process_handshake | 2.50 | Examines the method and request headers in @msg and (assuming @msg contains a valid handshake request), fills in the handshake response. If @expect... |
| websocket_server_process_handshake_with_extensions | `websocket_server_process_handshake_with_extensions(msg: Message, expected_origin: utf8?, protocols: utf8?, supported_extensions: GObject.TypeClass?, accepted_extensions: out GLib.List?) -> gboolean` | soup_websocket_server_process_handshake_with_extensions | 2.68 | Examines the method and request headers in @msg and (assuming @msg contains a valid handshake request), fills in the handshake response. If @expect... |
| xmlrpc_build_fault | `xmlrpc_build_fault(fault_code: gint, fault_format: utf8, ...: void) -> utf8` | soup_xmlrpc_build_fault |  | This creates an XML-RPC fault response and returns it as a string. (To create a successful response, use soup_xmlrpc_build_method_response().) |
| xmlrpc_build_method_call | `xmlrpc_build_method_call(method_name: utf8, params: GObject.Value, n_params: gint) -> utf8` | soup_xmlrpc_build_method_call |  | This creates an XML-RPC methodCall and returns it as a string. This is the low-level method that soup_xmlrpc_request_new() is built on. @params is ... |
| xmlrpc_build_method_response | `xmlrpc_build_method_response(value: GObject.Value) -> utf8` | soup_xmlrpc_build_method_response |  | This creates a (successful) XML-RPC methodResponse and returns it as a string. To create a fault response, use soup_xmlrpc_build_fault(). The glib ... |
| xmlrpc_build_request | `xmlrpc_build_request(method_name: utf8, params: GLib.Variant) -> utf8 throws` | soup_xmlrpc_build_request | 2.52 | This creates an XML-RPC methodCall and returns it as a string. This is the low-level method that soup_xmlrpc_message_new() is built on. @params is ... |
| xmlrpc_build_response | `xmlrpc_build_response(value: GLib.Variant) -> utf8 throws` | soup_xmlrpc_build_response | 2.52 | This creates a (successful) XML-RPC methodResponse and returns it as a string. To create a fault response, use soup_xmlrpc_build_fault(). This is t... |
| xmlrpc_error_quark | `xmlrpc_error_quark() -> GLib.Quark` | soup_xmlrpc_error_quark |  |  |
| xmlrpc_extract_method_call | `xmlrpc_extract_method_call(method_call: utf8, length: gint, method_name: out utf8, ...: void) -> gboolean` | soup_xmlrpc_extract_method_call |  | Parses @method_call to get the name and parameters, and puts the parameters into variables of the appropriate types. The parameters are handled sim... |
| xmlrpc_extract_method_response | `xmlrpc_extract_method_response(method_response: utf8, length: gint, error: GLib.Error, type: GType, ...: void) -> gboolean` | soup_xmlrpc_extract_method_response |  | Parses @method_response and extracts the return value into a variable of the correct type. If @method_response is a fault, the return value will be... |
| xmlrpc_fault_quark | `xmlrpc_fault_quark() -> GLib.Quark` | soup_xmlrpc_fault_quark |  |  |
| xmlrpc_message_new | `xmlrpc_message_new(uri: utf8, method_name: utf8, params: GLib.Variant) -> Message throws` | soup_xmlrpc_message_new | 2.52 | Creates an XML-RPC methodCall and returns a #SoupMessage, ready to send, for that method call. See soup_xmlrpc_build_request() for serialization de... |
| xmlrpc_message_set_fault | `xmlrpc_message_set_fault(msg: Message, fault_code: gint, fault_format: utf8, ...: void) -> none` | soup_xmlrpc_message_set_fault | 2.52 | Sets the status code and response body of @msg to indicate an unsuccessful XML-RPC call, with the error described by @fault_code and @fault_format. |
| xmlrpc_message_set_response | `xmlrpc_message_set_response(msg: Message, value: GLib.Variant) -> gboolean throws` | soup_xmlrpc_message_set_response | 2.52 | Sets the status code and response body of @msg to indicate a successful XML-RPC call, with a return value given by @value. To set a fault response,... |
| xmlrpc_parse_method_call | `xmlrpc_parse_method_call(method_call: utf8, length: gint, method_name: out utf8, params: out GObject.ValueArray) -> gboolean` | soup_xmlrpc_parse_method_call |  | Parses @method_call to get the name and parameters, and returns the parameter values in a #GValueArray; see also soup_xmlrpc_extract_method_call(),... |
| xmlrpc_parse_method_response | `xmlrpc_parse_method_response(method_response: utf8, length: gint, value: out GObject.Value) -> gboolean throws` | soup_xmlrpc_parse_method_response |  | Parses @method_response and returns the return value in @value. If @method_response is a fault, @value will be unchanged, and @error will be set to... |
| xmlrpc_parse_request | `xmlrpc_parse_request(method_call: utf8, length: gint, params: out XMLRPCParams) -> utf8 throws` | soup_xmlrpc_parse_request | 2.52 | Parses @method_call and return the method name. Method parameters can be parsed later using soup_xmlrpc_params_parse(). |
| xmlrpc_parse_response | `xmlrpc_parse_response(method_response: utf8, length: gint, signature: utf8?) -> GLib.Variant throws` | soup_xmlrpc_parse_response | 2.52 | Parses @method_response and returns the return value. If @method_response is a fault, %NULL is returned, and @error will be set to an error in the ... |
| xmlrpc_request_new | `xmlrpc_request_new(uri: utf8, method_name: utf8, ...: void) -> Message` | soup_xmlrpc_request_new |  | Creates an XML-RPC methodCall and returns a #SoupMessage, ready to send, for that method call. The parameters are passed as type/value pairs; ie, f... |
| xmlrpc_set_fault | `xmlrpc_set_fault(msg: Message, fault_code: gint, fault_format: utf8, ...: void) -> none` | soup_xmlrpc_set_fault |  | Sets the status code and response body of @msg to indicate an unsuccessful XML-RPC call, with the error described by @fault_code and @fault_format. |
| xmlrpc_set_response | `xmlrpc_set_response(msg: Message, type: GType, ...: void) -> none` | soup_xmlrpc_set_response |  | Sets the status code and response body of @msg to indicate a successful XML-RPC call, with a return value given by @type and the following varargs ... |
| xmlrpc_variant_get_datetime | `xmlrpc_variant_get_datetime(variant: GLib.Variant) -> Date throws` | soup_xmlrpc_variant_get_datetime | 2.52 | Get the #SoupDate from special #GVariant created by soup_xmlrpc_variant_new_datetime() or by parsing a &lt;dateTime.iso8601&gt; node. See soup_xmlr... |
| xmlrpc_variant_new_datetime | `xmlrpc_variant_new_datetime(date: Date) -> GLib.Variant` | soup_xmlrpc_variant_new_datetime | 2.52 | Construct a special #GVariant used to serialize a &lt;dateTime.iso8601&gt; node. See soup_xmlrpc_build_request(). The actual type of the returned #... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| AddressCallback | `AddressCallback(addr: Address, status: guint, user_data: gpointer?) -> none` |  |  | The callback function passed to soup_address_resolve_async(). |
| AuthDomainBasicAuthCallback | `AuthDomainBasicAuthCallback(domain: AuthDomainBasic, msg: Message, username: utf8, password: utf8, user_data: gpointer?) -> gboolean` |  |  | Callback used by #SoupAuthDomainBasic for authentication purposes. The application should verify that @username and @password and valid and return ... |
| AuthDomainDigestAuthCallback | `AuthDomainDigestAuthCallback(domain: AuthDomainDigest, msg: Message, username: utf8, user_data: gpointer?) -> utf8` |  |  | Callback used by #SoupAuthDomainDigest for authentication purposes. The application should look up @username in its password database, and return t... |
| AuthDomainFilter | `AuthDomainFilter(domain: AuthDomain, msg: Message, user_data: gpointer?) -> gboolean` |  |  | The prototype for a #SoupAuthDomain filter; see soup_auth_domain_set_filter() for details. |
| AuthDomainGenericAuthCallback | `AuthDomainGenericAuthCallback(domain: AuthDomain, msg: Message, username: utf8, user_data: gpointer?) -> gboolean` |  |  | The prototype for a #SoupAuthDomain generic authentication callback. The callback should look up the user's password, call soup_auth_domain_check_p... |
| ChunkAllocator | `ChunkAllocator(msg: Message, max_len: gsize, user_data: gpointer?) -> Buffer` |  |  | The prototype for a chunk allocation callback. This should allocate a new #SoupBuffer and return it for the I/O layer to read message body data off... |
| LoggerFilter | `LoggerFilter(logger: Logger, msg: Message, user_data: gpointer?) -> LoggerLogLevel` |  |  | The prototype for a logging filter. The filter callback will be invoked for each request or response, and should analyze it and return a #SoupLogge... |
| LoggerPrinter | `LoggerPrinter(logger: Logger, level: LoggerLogLevel, direction: gchar, data: utf8, user_data: gpointer?) -> none` |  |  | The prototype for a custom printing callback. @level indicates what kind of information is being printed. Eg, it will be %SOUP_LOGGER_LOG_HEADERS i... |
| MessageHeadersForeachFunc | `MessageHeadersForeachFunc(name: utf8, value: utf8, user_data: gpointer?) -> none` |  |  | The callback passed to soup_message_headers_foreach(). |
| PasswordManagerCallback | `PasswordManagerCallback(password_manager: PasswordManager, msg: Message, auth: Auth, retrying: gboolean, user_data: gpointer?) -> none` |  |  |  |
| ProxyResolverCallback | `ProxyResolverCallback(proxy_resolver: ProxyResolver, msg: Message, arg: guint, addr: Address, user_data: gpointer?) -> none` |  |  |  |
| ProxyURIResolverCallback | `ProxyURIResolverCallback(resolver: ProxyURIResolver, status: guint, proxy_uri: URI, user_data: gpointer?) -> none` |  |  | Callback for soup_proxy_uri_resolver_get_proxy_uri_async() |
| ServerCallback | `ServerCallback(server: Server, msg: Message, path: utf8, query: GLib.HashTable?, client: ClientContext, user_data: gpointer?) -> none` |  |  | A callback used to handle requests to a #SoupServer. @path and @query contain the likewise-named components of the Request-URI, subject to certain ... |
| ServerWebsocketCallback | `ServerWebsocketCallback(server: Server, connection: WebsocketConnection, path: utf8, client: ClientContext, user_data: gpointer?) -> none` |  |  | A callback used to handle WebSocket requests to a #SoupServer. The callback will be invoked after sending the handshake response back to the client... |
| SessionCallback | `SessionCallback(session: Session, msg: Message, user_data: gpointer?) -> none` |  |  | Prototype for the callback passed to soup_session_queue_message(), qv. |
| SessionConnectProgressCallback | `SessionConnectProgressCallback(session: Session, event: Gio.SocketClientEvent, connection: Gio.IOStream, user_data: gpointer?) -> none` |  | 2.62 | Prototype for the progress callback passed to soup_session_connect_async(). |
| SocketCallback | `SocketCallback(sock: Socket, status: guint, user_data: gpointer?) -> none` |  |  | The callback function passed to soup_socket_connect_async(). |

## Constants

| Name | Type |
| --- | --- |
| ADDRESS_ANY_PORT | gint |
| ADDRESS_FAMILY | utf8 |
| ADDRESS_NAME | utf8 |
| ADDRESS_PHYSICAL | utf8 |
| ADDRESS_PORT | utf8 |
| ADDRESS_PROTOCOL | utf8 |
| ADDRESS_SOCKADDR | utf8 |
| AUTH_DOMAIN_ADD_PATH | utf8 |
| AUTH_DOMAIN_BASIC_AUTH_CALLBACK | utf8 |
| AUTH_DOMAIN_BASIC_AUTH_DATA | utf8 |
| AUTH_DOMAIN_DIGEST_AUTH_CALLBACK | utf8 |
| AUTH_DOMAIN_DIGEST_AUTH_DATA | utf8 |
| AUTH_DOMAIN_FILTER | utf8 |
| AUTH_DOMAIN_FILTER_DATA | utf8 |
| AUTH_DOMAIN_GENERIC_AUTH_CALLBACK | utf8 |
| AUTH_DOMAIN_GENERIC_AUTH_DATA | utf8 |
| AUTH_DOMAIN_PROXY | utf8 |
| AUTH_DOMAIN_REALM | utf8 |
| AUTH_DOMAIN_REMOVE_PATH | utf8 |
| AUTH_HOST | utf8 |
| AUTH_IS_AUTHENTICATED | utf8 |
| AUTH_IS_FOR_PROXY | utf8 |
| AUTH_REALM | utf8 |
| AUTH_SCHEME_NAME | utf8 |
| CHAR_HTTP_CTL | gint |
| CHAR_HTTP_SEPARATOR | gint |
| CHAR_URI_GEN_DELIMS | gint |
| CHAR_URI_PERCENT_ENCODED | gint |
| CHAR_URI_SUB_DELIMS | gint |
| COOKIE_JAR_ACCEPT_POLICY | utf8 |
| COOKIE_JAR_DB_FILENAME | utf8 |
| COOKIE_JAR_READ_ONLY | utf8 |
| COOKIE_JAR_TEXT_FILENAME | utf8 |
| COOKIE_MAX_AGE_ONE_DAY | gint |
| COOKIE_MAX_AGE_ONE_HOUR | gint |
| COOKIE_MAX_AGE_ONE_WEEK | gint |
| COOKIE_MAX_AGE_ONE_YEAR | gint |
| FORM_MIME_TYPE_MULTIPART | utf8 |
| FORM_MIME_TYPE_URLENCODED | utf8 |
| HSTS_ENFORCER_DB_FILENAME | utf8 |
| HSTS_POLICY_MAX_AGE_PAST | gint |
| LOGGER_LEVEL | utf8 |
| LOGGER_MAX_BODY_SIZE | utf8 |
| MAJOR_VERSION | gint |
| MESSAGE_FIRST_PARTY | utf8 |
| MESSAGE_FLAGS | utf8 |
| MESSAGE_HTTP_VERSION | utf8 |
| MESSAGE_IS_TOP_LEVEL_NAVIGATION | utf8 |
| MESSAGE_METHOD | utf8 |
| MESSAGE_PRIORITY | utf8 |
| MESSAGE_REASON_PHRASE | utf8 |
| MESSAGE_REQUEST_BODY | utf8 |
| MESSAGE_REQUEST_BODY_DATA | utf8 |
| MESSAGE_REQUEST_HEADERS | utf8 |
| MESSAGE_RESPONSE_BODY | utf8 |
| MESSAGE_RESPONSE_BODY_DATA | utf8 |
| MESSAGE_RESPONSE_HEADERS | utf8 |
| MESSAGE_SERVER_SIDE | utf8 |
| MESSAGE_SITE_FOR_COOKIES | utf8 |
| MESSAGE_STATUS_CODE | utf8 |
| MESSAGE_TLS_CERTIFICATE | utf8 |
| MESSAGE_TLS_ERRORS | utf8 |
| MESSAGE_URI | utf8 |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| REQUEST_SESSION | utf8 |
| REQUEST_URI | utf8 |
| SERVER_ADD_WEBSOCKET_EXTENSION | utf8 |
| SERVER_ASYNC_CONTEXT | utf8 |
| SERVER_HTTP_ALIASES | utf8 |
| SERVER_HTTPS_ALIASES | utf8 |
| SERVER_INTERFACE | utf8 |
| SERVER_PORT | utf8 |
| SERVER_RAW_PATHS | utf8 |
| SERVER_REMOVE_WEBSOCKET_EXTENSION | utf8 |
| SERVER_SERVER_HEADER | utf8 |
| SERVER_SSL_CERT_FILE | utf8 |
| SERVER_SSL_KEY_FILE | utf8 |
| SERVER_TLS_CERTIFICATE | utf8 |
| SESSION_ACCEPT_LANGUAGE | utf8 |
| SESSION_ACCEPT_LANGUAGE_AUTO | utf8 |
| SESSION_ADD_FEATURE | utf8 |
| SESSION_ADD_FEATURE_BY_TYPE | utf8 |
| SESSION_ASYNC_CONTEXT | utf8 |
| SESSION_HTTP_ALIASES | utf8 |
| SESSION_HTTPS_ALIASES | utf8 |
| SESSION_IDLE_TIMEOUT | utf8 |
| SESSION_LOCAL_ADDRESS | utf8 |
| SESSION_MAX_CONNS | utf8 |
| SESSION_MAX_CONNS_PER_HOST | utf8 |
| SESSION_PROXY_RESOLVER | utf8 |
| SESSION_PROXY_URI | utf8 |
| SESSION_REMOVE_FEATURE_BY_TYPE | utf8 |
| SESSION_SSL_CA_FILE | utf8 |
| SESSION_SSL_STRICT | utf8 |
| SESSION_SSL_USE_SYSTEM_CA_FILE | utf8 |
| SESSION_TIMEOUT | utf8 |
| SESSION_TLS_DATABASE | utf8 |
| SESSION_TLS_INTERACTION | utf8 |
| SESSION_USE_NTLM | utf8 |
| SESSION_USE_THREAD_CONTEXT | utf8 |
| SESSION_USER_AGENT | utf8 |
| SOCKET_ASYNC_CONTEXT | utf8 |
| SOCKET_FLAG_NONBLOCKING | utf8 |
| SOCKET_IS_SERVER | utf8 |
| SOCKET_LOCAL_ADDRESS | utf8 |
| SOCKET_REMOTE_ADDRESS | utf8 |
| SOCKET_SSL_CREDENTIALS | utf8 |
| SOCKET_SSL_FALLBACK | utf8 |
| SOCKET_SSL_STRICT | utf8 |
| SOCKET_TIMEOUT | utf8 |
| SOCKET_TLS_CERTIFICATE | utf8 |
| SOCKET_TLS_ERRORS | utf8 |
| SOCKET_TRUSTED_CERTIFICATE | utf8 |
| SOCKET_USE_THREAD_CONTEXT | utf8 |
| VERSION_MIN_REQUIRED | gint |

