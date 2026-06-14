# IBus 1.0

SQGI import: `import("IBus", "1.0")`

Packages: `ibus-1.0`
Includes: `GLib-2.0`, `GObject-2.0`, `Gio-2.0`
Libraries: `libibus-1.0.so.5`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 29 |
| Interfaces | 0 |
| Records | 49 |
| Unions | 0 |
| Enums | 12 |
| Flags | 5 |
| Functions | 37 |
| Callbacks | 6 |
| Constants | 4293 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Attribute | Serializable | 0 | 0 | 5 | An IBusAttribute represents an attribute that associate to IBusText. It decorates preedit buffer and auxiliary text with underline, foreground and ... |
| AttrList | Serializable | 0 | 0 | 3 | Array of IBusAttribute. |
| Bus | Object | 0 | 5 | 76 | An IBusBus connects with IBus daemon. |
| Component | Serializable | 0 | 0 | 19 | An IBusComponent is an executable program. It provides services such as user interface, configuration, and input method engine (IME). It is recomme... |
| Config | Proxy | 0 | 1 | 15 | An IBusConfig provides engine configuration methods such as get and set the configure settings to configuration file. Currently, IBusConfig support... |
| ConfigService | Service | 0 | 0 | 2 | An IBusConfigService is a base class for other configuration services such as GConf. Currently, directly known sub class is IBusConfigGConf. IBusCo... |
| EmojiData | Serializable | 0 | 0 | 9 | Emoji data likes emoji unicode, annotations, description, category. You can get extended values with g_object_get_properties. |
| Engine | Service | 1 | 22 | 21 | An IBusEngine provides infrastructure for input method engine. Developers can "extend" this class for input method engine development. see_also: #I... |
| EngineDesc | Serializable | 0 | 0 | 21 | An IBusEngineDesc stores description data of IBusEngine. The description data can either be passed to ibus_engine_desc_new(), or loaded from an XML... |
| EngineSimple | Engine | 0 | 0 | 3 | An IBusEngineSimple provides table-based input method logic. see_also: #IBusEngine |
| ExtensionEvent | Serializable | 0 | 0 | 6 | IBusExtensionEvent properties. |
| Factory | Service | 0 | 1 | 3 | An IBusFactory is an #IBusService that creates input method engine (IME) instance. It provides CreateEngine remote method, which creates an IME ins... |
| HotkeyProfile | Serializable | 0 | 1 | 7 | An opaque data type representing an IBusHotkeyProfile. |
| InputContext | Proxy | 0 | 22 | 28 | An IBusInputContext is a proxy object of BusInputContext, which manages the context for input methods that supports text input in various natural l... |
| Keymap | Object | 0 | 0 | 3 | An IBusKeymap defines the mapping between keyboard scancodes and keyboard symbols such as numbers, alphabets, and punctuation marks. Some input met... |
| LookupTable | Serializable | 0 | 0 | 23 | An IBusLookuptable stores the candidate words or phrases for users to choose from. Use ibus_engine_update_lookup_table(), ibus_engine_show_lookup_t... |
| Object | GObject.InitiallyUnowned | 4 | 1 | 2 | IBusObject is the base object for all objects in IBus. |
| ObservedPath | Serializable | 0 | 0 | 5 | IBusObservedPath provides methods for file path manipulation, such as monitor modification, directory tree traversal. |
| PanelService | Service | 0 | 30 | 17 | An IBusPanelService is a base class for UI services. Developers can "extend" this class for panel UI development. |
| Property | Serializable | 0 | 0 | 21 | An IBusProperty is an UI component like a button or a menu item which shows the status of corresponding input method engine property. End user can ... |
| PropList | Serializable | 0 | 0 | 4 | See_also: #IBusProperty, #IBusEngine |
| Proxy | Gio.DBusProxy | 2 | 1 | 1 | An IBusProxy is the base of all proxy objects, which communicate the corresponding #IBusServices on the other end of IBusConnection. For example, I... |
| Registry | Serializable | 0 | 1 | 12 | An #IBusRegistry loads IBus component files and generates the cache files. see_also: #IBusComponent |
| Serializable | Object | 16 | 0 | 7 | An #IBusSerializable is an IBus object which can be serialized, that is, to be to and from a #GVariant. This class is to be extended by other class... |
| Service | Object | 4 | 0 | 6 | An IBusService is a base class for services. |
| Text | Serializable | 0 | 0 | 11 | An IBusText is the main text object in IBus. The text is decorated according to associated IBusAttribute, e.g. the foreground/background color, und... |
| UnicodeBlock | Serializable | 0 | 0 | 6 | Creates a new #IBusUnicodeBlock. block property is required. e.g. ibus_unicode_block_new ("start", 0x0000, "end", "0x007f", "name", "basic", NULL) |
| UnicodeData | Serializable | 0 | 0 | 9 | Unicode data likes code, name, alias, block-name. You can get extended values with g_object_get_properties. |
| XEvent | Serializable | 0 | 0 | 22 | An IBusXEvent provides a wrapper of XEvent. see_also: #IBusComponent, #IBusEngineDesc |

### IBus.Attribute

Parent: `Serializable` ?? GType: `IBusAttribute` ?? C type: `IBusAttribute`

An IBusAttribute represents an attribute that associate to IBusText. It decorates preedit buffer and auxiliary text with underline, foreground and ...

#### Fields

| Field | Type |
| --- | --- |
| end_index | guint |
| parent | Serializable |
| start_index | guint |
| type | guint |
| value | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Attribute.new(type: guint, value: guint, start_index: guint, end_index: guint) -> Attribute` | ibus_attribute_new |  | Creates a new IBusAttribute. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_attr_type | `Attribute.get_attr_type() -> guint` | ibus_attribute_get_attr_type |  | Gets an enum of #IBusAttrType. |
| get_end_index | `Attribute.get_end_index() -> guint` | ibus_attribute_get_end_index |  | Gets an end unsigned index |
| get_start_index | `Attribute.get_start_index() -> guint` | ibus_attribute_get_start_index |  | Gets a start unsigned index |
| get_value | `Attribute.get_value() -> guint` | ibus_attribute_get_value |  | Gets an unsigned int value relative with #IBusAttrType. If the type is %IBUS_ATTR_TYPE_UNDERLINE, the return value is #IBusAttrUnderline. If the ty... |

### IBus.AttrList

Parent: `Serializable` ?? GType: `IBusAttrList` ?? C type: `IBusAttrList`

Array of IBusAttribute.

#### Fields

| Field | Type |
| --- | --- |
| attributes | gpointer |
| parent | Serializable |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `AttrList.new() -> AttrList` | ibus_attr_list_new |  | Creates an new #IBusAttrList. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `AttrList.append(attr: Attribute) -> none` | ibus_attr_list_append |  | Append an IBusAttribute to IBusAttrList, and increase reference. |
| get | `AttrList.get(index: guint) -> Attribute` | ibus_attr_list_get |  | Returns #IBusAttribute at given index. Borrowed reference. |

### IBus.Bus

Parent: `Object` ?? GType: `IBusBus` ?? C type: `IBusBus`

An IBusBus connects with IBus daemon.

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |
| priv | BusPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Bus.new() -> Bus` | ibus_bus_new |  | Creates a new #IBusBus instance. |
| new_async | `Bus.new_async() -> Bus` | ibus_bus_new_async |  | Creates a new #IBusBus instance. The instance will asynchronously connect to the IBus daemon. |
| new_async_client | `Bus.new_async_client() -> Bus` | ibus_bus_new_async_client |  | Creates a new #IBusBus instance for client use only. It will possibly be limited in what it can do. The instance will asynchronously connect to the... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_match | `Bus.add_match(rule: utf8) -> gboolean` | ibus_bus_add_match |  | Add a match rule to an #IBusBus synchronously. |
| add_match_async | `Bus.add_match_async(rule: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_add_match_async |  | Add a match rule to an #IBusBus asynchronously. |
| add_match_async_finish | `Bus.add_match_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_add_match_async_finish |  | Finishes an operation started with ibus_bus_add_match_async(). |
| create_input_context | `Bus.create_input_context(client_name: utf8) -> InputContext` | ibus_bus_create_input_context |  | Create an input context for client synchronously. |
| create_input_context_async | `Bus.create_input_context_async(client_name: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_create_input_context_async |  | Create an input context for client asynchronously. |
| create_input_context_async_finish | `Bus.create_input_context_async_finish(res: Gio.AsyncResult) -> InputContext throws` | ibus_bus_create_input_context_async_finish |  | Finishes an operation started with ibus_bus_create_input_context_async(). |
| current_input_context | `Bus.current_input_context() -> utf8` | ibus_bus_current_input_context |  | Get the current focused input context synchronously. |
| current_input_context_async | `Bus.current_input_context_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_current_input_context_async |  | Get the current focused input context asynchronously. |
| current_input_context_async_finish | `Bus.current_input_context_async_finish(res: Gio.AsyncResult) -> utf8 throws` | ibus_bus_current_input_context_async_finish |  | Finishes an operation started with ibus_bus_current_input_context_async(). |
| exit | `Bus.exit(restart: gboolean) -> gboolean` | ibus_bus_exit |  | Exit or restart ibus-daemon synchronously. |
| exit_async | `Bus.exit_async(restart: gboolean, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_exit_async |  | Exit or restart ibus-daemon asynchronously. |
| exit_async_finish | `Bus.exit_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_exit_async_finish |  | Finishes an operation started with ibus_bus_exit_async(). |
| get_config | `Bus.get_config() -> Config` | ibus_bus_get_config |  | Get the config instance from #IBusBus. |
| get_connection | `Bus.get_connection() -> Gio.DBusConnection` | ibus_bus_get_connection |  | Gets a #GDBusConnection of an #IBusBus instance. |
| get_engines_by_names | `Bus.get_engines_by_names(names: utf8) -> EngineDesc` | ibus_bus_get_engines_by_names |  | Get engines by given names synchronously. If some engine names do not exist, this function will simply ignore them, and return rest of engines. TOD... |
| get_global_engine | `Bus.get_global_engine() -> EngineDesc` | ibus_bus_get_global_engine |  | Get the description of current global engine synchronously. |
| get_global_engine_async | `Bus.get_global_engine_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_get_global_engine_async |  | Get the description of current global engine asynchronously. |
| get_global_engine_async_finish | `Bus.get_global_engine_async_finish(res: Gio.AsyncResult) -> EngineDesc throws` | ibus_bus_get_global_engine_async_finish |  | Finishes an operation started with ibus_bus_get_global_engine_async_finish(). |
| get_ibus_property | `Bus.get_ibus_property(property_name: utf8) -> GLib.Variant` | ibus_bus_get_ibus_property |  | Get org.freedesktop.DBus.Properties. |
| get_ibus_property_async | `Bus.get_ibus_property_async(property_name: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_get_ibus_property_async |  | Get org.freedesktop.DBus.Properties asynchronously. |
| get_ibus_property_async_finish | `Bus.get_ibus_property_async_finish(res: Gio.AsyncResult) -> GLib.Variant throws` | ibus_bus_get_ibus_property_async_finish |  | Finishes an operation started with ibus_bus_get_ibus_property_async(). |
| get_name_owner | `Bus.get_name_owner(name: utf8) -> utf8` | ibus_bus_get_name_owner |  | Return the name owner synchronously. |
| get_name_owner_async | `Bus.get_name_owner_async(name: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_get_name_owner_async |  | Return the name owner asynchronously. |
| get_name_owner_async_finish | `Bus.get_name_owner_async_finish(res: Gio.AsyncResult) -> utf8 throws` | ibus_bus_get_name_owner_async_finish |  | Finishes an operation started with ibus_bus_get_name_owner_async(). |
| get_service_name | `Bus.get_service_name() -> utf8` | ibus_bus_get_service_name |  | Return the main service name to use for calls on the ibus connection. |
| get_use_global_engine | `Bus.get_use_global_engine() -> gboolean` | ibus_bus_get_use_global_engine |  | Check if the bus's "use_global_engine" option is enabled or not synchronously. |
| get_use_global_engine_async | `Bus.get_use_global_engine_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_get_use_global_engine_async |  | Check if the bus's "use_global_engine" option is enabled or not asynchronously. |
| get_use_global_engine_async_finish | `Bus.get_use_global_engine_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_get_use_global_engine_async_finish |  | Finishes an operation started with ibus_bus_get_use_global_engine_async(). |
| get_use_sys_layout | `Bus.get_use_sys_layout() -> gboolean` | ibus_bus_get_use_sys_layout |  | Check if the bus's "use_sys_layout" option is enabled or not synchronously. |
| get_use_sys_layout_async | `Bus.get_use_sys_layout_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_get_use_sys_layout_async |  | Check if the bus's "use_sys_layout" option is enabled or not asynchronously. |
| get_use_sys_layout_async_finish | `Bus.get_use_sys_layout_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_get_use_sys_layout_async_finish |  | Finishes an operation started with ibus_bus_get_use_sys_layout_async(). |
| hello | `Bus.hello() -> utf8` | ibus_bus_hello |  | This function sends a "HELLO" message to DBus daemon, which replies the unique name of current IBus process. |
| is_connected | `Bus.is_connected() -> gboolean` | ibus_bus_is_connected |  | Return %TRUE if @bus is connected to IBus daemon. |
| is_global_engine_enabled | `Bus.is_global_engine_enabled() -> gboolean` | ibus_bus_is_global_engine_enabled |  | Check if the current global engine is enabled or not synchronously. |
| is_global_engine_enabled_async | `Bus.is_global_engine_enabled_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_is_global_engine_enabled_async |  | Check if the current global engine is enabled or not asynchronously. |
| is_global_engine_enabled_async_finish | `Bus.is_global_engine_enabled_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_is_global_engine_enabled_async_finish |  | Finishes an operation started with ibus_bus_is_global_engine_enabled_async(). |
| list_active_engines | `Bus.list_active_engines() -> GLib.List` | ibus_bus_list_active_engines |  | List active engines synchronously. |
| list_active_engines_async | `Bus.list_active_engines_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_list_active_engines_async |  | List active engines asynchronously. |
| list_active_engines_async_finish | `Bus.list_active_engines_async_finish(res: Gio.AsyncResult) -> GLib.List throws` | ibus_bus_list_active_engines_async_finish |  | Finishes an operation started with ibus_bus_list_active_engines_async(). |
| list_engines | `Bus.list_engines() -> GLib.List` | ibus_bus_list_engines |  | List engines synchronously. |
| list_engines_async | `Bus.list_engines_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_list_engines_async |  | List engines asynchronously. |
| list_engines_async_finish | `Bus.list_engines_async_finish(res: Gio.AsyncResult) -> GLib.List throws` | ibus_bus_list_engines_async_finish |  | Finishes an operation started with ibus_bus_list_engines_async(). |
| list_names | `Bus.list_names() -> GLib.List` | ibus_bus_list_names |  | Return lists that attached to @bus. <note><para>[FixMe] Not implemented yet, only return %NULL.</para></note> <note><para>[FixMe] Add async version... |
| list_queued_owners | `Bus.list_queued_owners(name: utf8) -> GLib.List` | ibus_bus_list_queued_owners |  | Lists the unique bus names of connections currently queued for a bus name. FIXME add an asynchronous version. |
| name_has_owner | `Bus.name_has_owner(name: utf8) -> gboolean` | ibus_bus_name_has_owner |  | Checks whether the name has owner synchronously. |
| name_has_owner_async | `Bus.name_has_owner_async(name: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_name_has_owner_async |  | Checks whether the name has owner asynchronously. |
| name_has_owner_async_finish | `Bus.name_has_owner_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_name_has_owner_async_finish |  | Finishes an operation started with ibus_bus_name_has_owner_async(). |
| preload_engines | `Bus.preload_engines(names: utf8) -> gboolean` | ibus_bus_preload_engines |  | Start bus components by engine names synchronously. |
| preload_engines_async | `Bus.preload_engines_async(names: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_preload_engines_async |  | Start bus components by engine names asynchronously. |
| preload_engines_async_finish | `Bus.preload_engines_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_preload_engines_async_finish |  | Finishes an operation started with ibus_bus_preload_engines_async(). |
| register_component | `Bus.register_component(component: Component) -> gboolean` | ibus_bus_register_component |  | Register a component to an #IBusBus synchronously. |
| register_component_async | `Bus.register_component_async(component: Component, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_register_component_async |  | Register a component to an #IBusBus asynchronously. |
| register_component_async_finish | `Bus.register_component_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_register_component_async_finish |  | Finishes an operation started with ibus_bus_register_component_async(). |
| release_name | `Bus.release_name(name: utf8) -> guint` | ibus_bus_release_name |  | Release a name to IBus daemon synchronously. |
| release_name_async | `Bus.release_name_async(name: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_release_name_async |  | Release a name to IBus daemon asynchronously. |
| release_name_async_finish | `Bus.release_name_async_finish(res: Gio.AsyncResult) -> guint throws` | ibus_bus_release_name_async_finish |  | Finishes an operation started with ibus_bus_release_name_async(). |
| remove_match | `Bus.remove_match(rule: utf8) -> gboolean` | ibus_bus_remove_match |  | Remove a match rule to an #IBusBus synchronously. |
| remove_match_async | `Bus.remove_match_async(rule: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_remove_match_async |  | Remove a match rule to an IBusBus asynchronously. |
| remove_match_async_finish | `Bus.remove_match_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_remove_match_async_finish |  | Finishes an operation started with ibus_bus_remove_match_async(). |
| request_name | `Bus.request_name(name: utf8, flags: guint32) -> guint32` | ibus_bus_request_name |  | Request a name from IBus daemon synchronously. |
| request_name_async | `Bus.request_name_async(name: utf8, flags: guint, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_request_name_async |  | Request a name from IBus daemon asynchronously. |
| request_name_async_finish | `Bus.request_name_async_finish(res: Gio.AsyncResult) -> guint throws` | ibus_bus_request_name_async_finish |  | Finishes an operation started with ibus_bus_request_name_async(). |
| set_global_engine | `Bus.set_global_engine(global_engine: utf8) -> gboolean` | ibus_bus_set_global_engine |  | Set current global engine synchronously. |
| set_global_engine_async | `Bus.set_global_engine_async(global_engine: utf8, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_set_global_engine_async |  | Set current global engine asynchronously. |
| set_global_engine_async_finish | `Bus.set_global_engine_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_set_global_engine_async_finish |  | Finishes an operation started with ibus_bus_set_global_engine_async(). |
| set_global_shortcut_keys | `Bus.set_global_shortcut_keys(gtype: BusGlobalBindingType, keys: ProcessKeyEventData) -> gboolean` | ibus_bus_set_global_shortcut_keys | 1.5.29 | Set global shorcut keys for the Wayland session. |
| set_global_shortcut_keys_async | `Bus.set_global_shortcut_keys_async(gtype: BusGlobalBindingType, keys: ProcessKeyEventData, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_set_global_shortcut_keys_async | 1.5.29 | Sete global shorcut keys for the Wayland session asynchronously. |
| set_global_shortcut_keys_async_finish | `Bus.set_global_shortcut_keys_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_set_global_shortcut_keys_async_finish | 1.5.29 | Finishes an operation started with ibus_bus_set_global_shortcut_keys_async(). |
| set_ibus_property | `Bus.set_ibus_property(property_name: utf8, value: GLib.Variant) -> none` | ibus_bus_set_ibus_property |  | Set org.freedesktop.DBus.Properties. |
| set_ibus_property_async | `Bus.set_ibus_property_async(property_name: utf8, value: GLib.Variant, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_bus_set_ibus_property_async |  | Set org.freedesktop.DBus.Properties asynchronously. |
| set_ibus_property_async_finish | `Bus.set_ibus_property_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_bus_set_ibus_property_async_finish |  | Finishes an operation started with ibus_bus_set_ibus_property_async(). |
| set_watch_dbus_signal | `Bus.set_watch_dbus_signal(watch: gboolean) -> none` | ibus_bus_set_watch_dbus_signal |  | Start or stop watching the NameOwnerChanged DBus signal. |
| set_watch_ibus_signal | `Bus.set_watch_ibus_signal(watch: gboolean) -> none` | ibus_bus_set_watch_ibus_signal |  | Start or stop watching the GlobalEngineChanged IBus signal. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| client-only | gboolean | read, write, construct-only | Whether the #IBusBus object is for client use only. |
| connect-async | gboolean | read, write, construct-only | Whether the #IBusBus object should connect asynchronously to the bus. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| connected | `` | none | last |  | Emitted when #IBusBus is connected to ibus-daemon. |
| disconnected | `` | none | last |  | Emitted when #IBusBus is disconnected from ibus-daemon. |
| global-engine-changed | `name: utf8` | none | last |  | Emitted when global engine is changed. |
| global-shortcut-key-responded | `type: guint8, is_pressed: gboolean, is_backward: gboolean` | none | last |  | Emitted when global shortcut key is responded. |
| name-owner-changed | `name: utf8, old_owner: utf8, new_owner: utf8` | none | last |  | Emitted when D-Bus name owner is changed. |

### IBus.Component

Parent: `Serializable` ?? GType: `IBusComponent` ?? C type: `IBusComponent`

An IBusComponent is an executable program. It provides services such as user interface, configuration, and input method engine (IME). It is recomme...

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| pdummy | gpointer |
| priv | ComponentPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Component.new(name: utf8, description: utf8, version: utf8, license: utf8, author: utf8, homepage: utf8, command_line: utf8, textdomain: utf8) -> Component` | ibus_component_new |  | Creates a new #IBusComponent. |
| new_from_file | `Component.new_from_file(filename: utf8) -> Component` | ibus_component_new_from_file |  | Creates a new #IBusComponent from an XML file. Note that a component file usually contains engine descriptions, if it does, ibus_engine_desc_new_fr... |
| new_from_xml_node | `Component.new_from_xml_node(node: XML) -> Component` | ibus_component_new_from_xml_node |  | Creates a new #IBusComponent from an XML tree. |
| new_varargs | `Component.new_varargs(first_property_name: utf8, ...: void) -> Component` | ibus_component_new_varargs |  | Creates a new #IBusComponent. ibus_component_new_varargs() supports the va_list format. name property is required. e.g. IBusComponent *component = ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_engine | `Component.add_engine(engine: EngineDesc) -> none` | ibus_component_add_engine |  | Add an engine to #IBusComponent according to the description in @engine. |
| add_observed_path | `Component.add_observed_path(path: utf8, access_fs: gboolean) -> none` | ibus_component_add_observed_path |  | Add an observed path to #IBusComponent. |
| check_modification | `Component.check_modification() -> gboolean` | ibus_component_check_modification |  | Check whether the observed paths of component is modified. |
| get_author | `Component.get_author() -> utf8` | ibus_component_get_author |  | Gets the author property in #IBusComponent. It should not be freed. |
| get_description | `Component.get_description() -> utf8` | ibus_component_get_description |  | Gets the description property in #IBusComponent. It should not be freed. |
| get_engines | `Component.get_engines() -> GLib.List` | ibus_component_get_engines |  | Gets the engines of this component. |
| get_exec | `Component.get_exec() -> utf8` | ibus_component_get_exec |  | Gets the exec property in #IBusComponent. It should not be freed. |
| get_homepage | `Component.get_homepage() -> utf8` | ibus_component_get_homepage |  | Gets the homepage property in #IBusComponent. It should not be freed. |
| get_license | `Component.get_license() -> utf8` | ibus_component_get_license |  | Gets the license property in #IBusComponent. It should not be freed. |
| get_name | `Component.get_name() -> utf8` | ibus_component_get_name |  | Gets the name property in #IBusComponent. It should not be freed. |
| get_observed_paths | `Component.get_observed_paths() -> GLib.List` | ibus_component_get_observed_paths |  | Gets the observed paths of this component. |
| get_textdomain | `Component.get_textdomain() -> utf8` | ibus_component_get_textdomain |  | Gets the textdomain property in #IBusComponent. It should not be freed. |
| get_version | `Component.get_version() -> utf8` | ibus_component_get_version |  | Gets the version property in #IBusComponent. It should not be freed. |
| output | `Component.output(output: GLib.String, indent: gint) -> none` | ibus_component_output |  | Output #IBusComponent as an XML-formatted string. The output string can be then shown on the screen or written to file. |
| output_engines | `Component.output_engines(output: GLib.String, indent: gint) -> none` | ibus_component_output_engines |  | Output engine description as an XML-formatted string. The output string can be then shown on the screen or written to file. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| author | utf8 | read, write, construct-only | The author of component |
| command-line | utf8 | read, write, construct-only | The exec path of component |
| description | utf8 | read, write, construct-only | The description of component |
| homepage | utf8 | read, write, construct-only | The homepage of component |
| license | utf8 | read, write, construct-only | The license of component |
| name | utf8 | read, write, construct-only | The name of component |
| textdomain | utf8 | read, write, construct-only | The textdomain of component |
| version | utf8 | read, write, construct-only | The version of component |

### IBus.Config

Parent: `Proxy` ?? Implements: `Gio.AsyncInitable`, `Gio.DBusInterface`, `Gio.Initable` ?? GType: `IBusConfig` ?? C type: `IBusConfig`

An IBusConfig provides engine configuration methods such as get and set the configure settings to configuration file. Currently, IBusConfig support...

#### Fields

| Field | Type |
| --- | --- |
| parent | Proxy |
| priv | ConfigPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Config.new(connection: Gio.DBusConnection, cancellable: Gio.Cancellable?) -> Config throws` | ibus_config_new |  | Create a new #IBusConfig from existing #GDBusConnection. |
| new_async_finish | `Config.new_async_finish(res: Gio.AsyncResult) -> Config throws` | ibus_config_new_async_finish |  | Finishes an operation started with ibus_config_new_async(). |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_async | `new_async(connection: Gio.DBusConnection, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_config_new_async |  | New an #IBusConfig asynchronously. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_value | `Config.get_value(section: utf8, name: utf8) -> GLib.Variant` | ibus_config_get_value |  | Get the value of a configuration option synchronously. GConf stores configure options in a tree-like structure, and the IBus related setting is at ... |
| get_value_async | `Config.get_value_async(section: utf8, name: utf8, timeout_ms: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_config_get_value_async |  | Get the value of a configuration option asynchronously. See also: ibus_config_get_value(). |
| get_value_async_finish | `Config.get_value_async_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | ibus_config_get_value_async_finish |  | Finish get value of a configuration option. |
| get_values | `Config.get_values(section: utf8) -> GLib.Variant` | ibus_config_get_values |  | Get all values in a section synchronously. |
| get_values_async | `Config.get_values_async(section: utf8, timeout_ms: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_config_get_values_async |  | Get all values in a section asynchronously. See also: ibus_config_get_values(). |
| get_values_async_finish | `Config.get_values_async_finish(result: Gio.AsyncResult) -> GLib.Variant throws` | ibus_config_get_values_async_finish |  | Finish get values in a section. |
| set_value | `Config.set_value(section: utf8, name: utf8, value: GLib.Variant) -> gboolean` | ibus_config_set_value |  | Set the value of a configuration option synchronously. |
| set_value_async | `Config.set_value_async(section: utf8, name: utf8, value: GLib.Variant, timeout_ms: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_config_set_value_async |  | Set the value of a configuration option asynchronously. See also: ibus_config_set_value(). |
| set_value_async_finish | `Config.set_value_async_finish(result: Gio.AsyncResult) -> gboolean throws` | ibus_config_set_value_async_finish |  | Finish set value of a configuration option. |
| unset | `Config.unset(section: utf8, name: utf8) -> gboolean` | ibus_config_unset |  | Remove an entry of a configuration option. |
| unwatch | `Config.unwatch(section: utf8?, name: utf8?) -> gboolean` | ibus_config_unwatch |  | Unsubscribe from the configuration option change notification. |
| watch | `Config.watch(section: utf8?, name: utf8?) -> gboolean` | ibus_config_watch |  | Subscribe to the configuration option change notification. Until this function is called, every change will be notified to the client through #IBus... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| value-changed | `section: utf8, name: utf8, value: GLib.Variant` | none | last |  | Emitted when configuration value is changed. <note><para>Argument @user_data is ignored in this function.</para></note> |

### IBus.ConfigService

Parent: `Service` ?? GType: `IBusConfigService` ?? C type: `IBusConfigService`

An IBusConfigService is a base class for other configuration services such as GConf. Currently, directly known sub class is IBusConfigGConf. IBusCo...

#### Fields

| Field | Type |
| --- | --- |
| parent | Service |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ConfigService.new(connection: Gio.DBusConnection) -> ConfigService` | ibus_config_service_new |  | Creates an new #IBusConfigService from an #GDBusConnection. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| value_changed | `ConfigService.value_changed(section: utf8, name: utf8, value: GLib.Variant) -> none` | ibus_config_service_value_changed |  | Change a value of a configuration option by sending a "ValueChanged" message to IBus service. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_value | `get_value(section: utf8, name: utf8) -> GLib.Variant throws` |  |  |  |
| get_values | `get_values(section: utf8) -> GLib.Variant throws` |  |  |  |
| set_value | `set_value(section: utf8, name: utf8, value: GLib.Variant) -> gboolean throws` |  |  |  |
| unset_value | `unset_value(section: utf8, name: utf8) -> gboolean throws` |  |  |  |

### IBus.EmojiData

Parent: `Serializable` ?? GType: `IBusEmojiData` ?? C type: `IBusEmojiData`

Emoji data likes emoji unicode, annotations, description, category. You can get extended values with g_object_get_properties.

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| priv | EmojiDataPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `EmojiData.new(first_property_name: utf8, ...: void) -> EmojiData` | ibus_emoji_data_new |  | Creates a new #IBusEmojiData. emoji property is required. e.g. ibus_emoji_data_new ("emoji", "????", NULL) |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load(path: utf8) -> GLib.SList` | ibus_emoji_data_load |  | An #IBusEmojiData list loaded from the saved cache file. |
| save | `save(path: utf8, list: GLib.SList) -> none` | ibus_emoji_data_save |  | Save the list of #IBusEmojiData to the cache file. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_annotations | `EmojiData.get_annotations() -> GLib.SList` | ibus_emoji_data_get_annotations |  | Gets the annotation list in #IBusEmojiData. It should not be freed. |
| get_category | `EmojiData.get_category() -> utf8` | ibus_emoji_data_get_category |  | Gets the emoji category in #IBusEmojiData. It should not be freed. |
| get_description | `EmojiData.get_description() -> utf8` | ibus_emoji_data_get_description |  | Gets the emoji description in #IBusEmojiData. It should not be freed. |
| get_emoji | `EmojiData.get_emoji() -> utf8` | ibus_emoji_data_get_emoji |  | Gets the emoji character in #IBusEmojiData. It should not be freed. |
| set_annotations | `EmojiData.set_annotations(annotations: GLib.SList) -> none` | ibus_emoji_data_set_annotations |  | Sets the annotation list in #IBusEmojiData. |
| set_description | `EmojiData.set_description(description: utf8) -> none` | ibus_emoji_data_set_description |  | Sets the description in #IBusEmojiData. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| annotations | gpointer | read, write | The emoji annotations |
| category | utf8 | read, write, construct-only | The emoji category |
| description | utf8 | read, write | The emoji description |
| emoji | utf8 | read, write, construct-only | The emoji character |

### IBus.Engine

Parent: `Service` ?? Subclasses: `EngineSimple` ?? GType: `IBusEngine` ?? C type: `IBusEngine`

An IBusEngine provides infrastructure for input method engine. Developers can "extend" this class for input method engine development. see_also: #I...

#### Fields

| Field | Type |
| --- | --- |
| client_capabilities | guint |
| cursor_area | Rectangle |
| enabled | gboolean |
| has_focus | gboolean |
| parent | Service |
| priv | EnginePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Engine.new(engine_name: utf8, object_path: utf8, connection: Gio.DBusConnection) -> Engine` | ibus_engine_new |  | Create a new #IBusEngine. |
| new_with_type | `Engine.new_with_type(engine_type: GType, engine_name: utf8, object_path: utf8, connection: Gio.DBusConnection) -> Engine` | ibus_engine_new_with_type |  | Create a new #IBusEngine. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| commit_text | `Engine.commit_text(text: Text) -> none` | ibus_engine_commit_text |  | Commit output of input method to IBus client. (Note: The text object will be released, if it is floating. If caller want to keep the object, caller... |
| delete_surrounding_text | `Engine.delete_surrounding_text(offset: gint, nchars: guint) -> none` | ibus_engine_delete_surrounding_text |  | Delete surrounding text. |
| forward_key_event | `Engine.forward_key_event(keyval: guint, keycode: guint, state: guint) -> none` | ibus_engine_forward_key_event |  | Forward the key event. |
| get_content_type | `Engine.get_content_type(purpose: out guint?, hints: out guint?) -> none` | ibus_engine_get_content_type |  | Get content-type (primary purpose and hints) of the current input context. See also: #IBusEngine::set-content-type |
| get_name | `Engine.get_name() -> utf8` | ibus_engine_get_name |  | Return the name of #IBusEngine. |
| get_surrounding_text | `Engine.get_surrounding_text(text: out Text?, cursor_pos: out guint?, anchor_pos: out guint?) -> none` | ibus_engine_get_surrounding_text |  | Get surrounding text. It is also used to tell the input-context that the engine will utilize surrounding-text. In that case, it must be called in #... |
| hide_auxiliary_text | `Engine.hide_auxiliary_text() -> none` | ibus_engine_hide_auxiliary_text |  | Hide the auxiliary bar. |
| hide_lookup_table | `Engine.hide_lookup_table() -> none` | ibus_engine_hide_lookup_table |  | Hide the lookup table. |
| hide_preedit_text | `Engine.hide_preedit_text() -> none` | ibus_engine_hide_preedit_text |  | Hide the pre-edit buffer. |
| register_properties | `Engine.register_properties(prop_list: PropList) -> none` | ibus_engine_register_properties |  | Register and show properties in language bar. (Note: The prop_list object will be released, if it is floating. If caller want to keep the object, c... |
| show_auxiliary_text | `Engine.show_auxiliary_text() -> none` | ibus_engine_show_auxiliary_text |  | Show the auxiliary bar. |
| show_lookup_table | `Engine.show_lookup_table() -> none` | ibus_engine_show_lookup_table |  | Show the lookup table. |
| show_preedit_text | `Engine.show_preedit_text() -> none` | ibus_engine_show_preedit_text |  | Show the pre-edit buffer. |
| update_auxiliary_text | `Engine.update_auxiliary_text(text: Text, visible: gboolean) -> none` | ibus_engine_update_auxiliary_text |  | Update the auxiliary bar. (Note: The text object will be released, if it is floating. If caller want to keep the object, caller should make the obj... |
| update_lookup_table | `Engine.update_lookup_table(lookup_table: LookupTable, visible: gboolean) -> none` | ibus_engine_update_lookup_table |  | Update the lookup table. (Note: The table object will be released, if it is floating. If caller want to keep the object, caller should make the obj... |
| update_lookup_table_fast | `Engine.update_lookup_table_fast(lookup_table: LookupTable, visible: gboolean) -> none` | ibus_engine_update_lookup_table_fast |  | Fast update for big lookup table. If size of lookup table is not over table page size *4, then it calls ibus_engine_update_lookup_table(). (Note: T... |
| update_preedit_text | `Engine.update_preedit_text(text: Text, cursor_pos: guint, visible: gboolean) -> none` | ibus_engine_update_preedit_text |  | Update the pre-edit buffer. (Note: The text object will be released, if it is floating. If caller want to keep the object, caller should make the o... |
| update_preedit_text_with_mode | `Engine.update_preedit_text_with_mode(text: Text, cursor_pos: guint, visible: gboolean, mode: PreeditFocusMode) -> none` | ibus_engine_update_preedit_text_with_mode |  | Update the pre-edit buffer with commit mode. Similar to ibus_engine_update_preedit_text(), this function allows users to specify the behavior on fo... |
| update_property | `Engine.update_property(prop: Property) -> none` | ibus_engine_update_property |  | Update the state displayed in language bar. (Note: The prop object will be released, if it is floating. If caller want to keep the object, caller s... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| active-surrounding-text | gboolean | read, write, construct-only | When this property is set to %TRUE, "RequireSurroundingText" D-Bus signal will be called by ibus-daemon on every focus-in/out event, with no need f... |
| engine-name | utf8 | read, write, construct-only | Name of this IBusEngine. |
| has-focus-id | gboolean | read, write, construct-only | Use #IBusEngine::focus_in_id()/focus_out_id() class method insteads of focus_in()/focus_out() class methods when this property is set to %TRUE. Oth... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| cancel-hand-writing | `n_strokes: guint` | none | last |  | Emitted when a hand writing operation is cancelled. Implement the member function IBusEngineClass::cancel_hand_writing in extended class to receive... |
| candidate-clicked | `index: guint, button: guint, state: guint` | none | last |  | Emitted when candidate on lookup table is clicked. Implement the member function IBusEngineClass::candidate_clicked in extended class to receive th... |
| cursor-down | `` | none | last |  | Emitted when the down cursor button is pressed. Implement the member function IBusEngineClass::cursor_down in extended class to receive this signal... |
| cursor-up | `` | none | last |  | Emitted when the up cursor button is pressed. Implement the member function IBusEngineClass::cursor_up in extended class to receive this signal. <n... |
| disable | `` | none | last |  | Emitted when the IME is disabled. Implement the member function IBusEngineClass::disable in extended class to receive this signal. See also: ibus_b... |
| enable | `` | none | last |  | Emitted when the IME is enabled. Implement the member function IBusEngineClass::enable in extended class to receive this signal. See also: ibus_bus... |
| focus-in | `` | none | last |  | Emitted when the client application get the focus. Implement the member function IBusEngineClass::focus_in in extended class to receive this signal... |
| focus-in-id | `object_path: utf8, client: utf8` | none | last |  | Emitted when the client application get the focus. Implement the member function IBusEngineClass::focus_in in extended class to receive this signal... |
| focus-out | `` | none | last |  | Emitted when the client application lost the focus. Implement the member function IBusEngineClass::focus_out in extended class to receive this sign... |
| focus-out-id | `object_path: utf8` | none | last |  | Emitted when the client application lost the focus. Implement the member function IBusEngineClass::focus_out in extended class to receive this sign... |
| page-down | `` | none | last |  | Emitted when the page-down button is pressed. Implement the member function IBusEngineClass::page_down in extended class to receive this signal. <n... |
| page-up | `` | none | last |  | Emitted when the page-up button is pressed. Implement the member function IBusEngineClass::page_up in extended class to receive this signal. <note>... |
| process-hand-writing-event | `coordinates: gpointer?, coordinates_len: guint` | none | last |  | Emitted when a hand writing operation is cancelled. Implement the member function IBusEngineClass::cancel_hand_writing in extended class to receive... |
| process-key-event | `keyval: guint, keycode: guint, state: guint` | gboolean | last |  | Emitted when a key event is received. Implement the member function IBusEngineClass::process_key_event in extended class to receive this signal. Bo... |
| property-activate | `name: utf8, state: guint` | none | last |  | Emitted when a property is activated or change changed. Implement the member function IBusEngineClass::property_activate in extended class to recei... |
| property-hide | `name: utf8` | none | last |  | Emitted when a property is hidden. Implement the member function IBusEngineClass::property_hide in extended class to receive this signal. <note><pa... |
| property-show | `name: utf8` | none | last |  | Emitted when a property is shown. Implement the member function IBusEngineClass::property_side in extended class to receive this signal. <note><par... |
| reset | `` | none | last |  | Emitted when the IME is reset. Implement the member function IBusEngineClass::reset in extended class to receive this signal. See also: ibus_input_... |
| set-capabilities | `caps: guint` | none | last |  | Emitted when the client application capabilities is set. Implement the member function IBusEngineClass::set_capabilities in extended class to recei... |
| set-content-type | `purpose: guint, hints: guint` | none | last |  | Emitted when the client application content-type (primary purpose and hints) is set. The engine could change the behavior according to the content-... |
| set-cursor-location | `x: gint, y: gint, w: gint, h: gint` | none | last |  | Emitted when the location of IME is set. Implement the member function IBusEngineClass::set_cursor_location in extended class to receive this signa... |
| set-surrounding-text | `text: GObject.Object, cursor_pos: guint, anchor_pos: guint` | none | last |  | Emitted when a surrounding text is set. Implement the member function IBusEngineClass::set_surrounding_text in extended class to receive this signa... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel_hand_writing | `cancel_hand_writing(n_strokes: guint) -> none` |  |  |  |
| candidate_clicked | `candidate_clicked(index: guint, button: guint, state: guint) -> none` |  |  |  |
| cursor_down | `cursor_down() -> none` |  |  |  |
| cursor_up | `cursor_up() -> none` |  |  |  |
| disable | `disable() -> none` |  |  |  |
| enable | `enable() -> none` |  |  |  |
| focus_in | `focus_in() -> none` |  |  |  |
| focus_in_id | `focus_in_id(object_path: utf8, client: utf8) -> none` |  |  |  |
| focus_out | `focus_out() -> none` |  |  |  |
| focus_out_id | `focus_out_id(object_path: utf8) -> none` |  |  |  |
| page_down | `page_down() -> none` |  |  |  |
| page_up | `page_up() -> none` |  |  |  |
| process_hand_writing_event | `process_hand_writing_event(coordinates: gdouble, coordinates_len: guint) -> none` |  |  |  |
| process_key_event | `process_key_event(keyval: guint, keycode: guint, state: guint) -> gboolean` |  |  |  |
| property_activate | `property_activate(prop_name: utf8, prop_state: guint) -> none` |  |  |  |
| property_hide | `property_hide(prop_name: utf8) -> none` |  |  |  |
| property_show | `property_show(prop_name: utf8) -> none` |  |  |  |
| reset | `reset() -> none` |  |  |  |
| set_capabilities | `set_capabilities(caps: guint) -> none` |  |  |  |
| set_content_type | `set_content_type(purpose: guint, hints: guint) -> none` |  |  |  |
| set_cursor_location | `set_cursor_location(x: gint, y: gint, w: gint, h: gint) -> none` |  |  |  |
| set_surrounding_text | `set_surrounding_text(text: Text, cursor_index: guint, anchor_pos: guint) -> none` |  |  |  |

### IBus.EngineDesc

Parent: `Serializable` ?? GType: `IBusEngineDesc` ?? C type: `IBusEngineDesc`

An IBusEngineDesc stores description data of IBusEngine. The description data can either be passed to ibus_engine_desc_new(), or loaded from an XML...

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| priv | EngineDescPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `EngineDesc.new(name: utf8, longname: utf8, description: utf8, language: utf8, license: utf8, author: utf8, icon: utf8, layout: utf8) -> EngineDesc` | ibus_engine_desc_new |  | Creates a new #IBusEngineDesc. If layout is "default", the engine inherits the current layout and does not change the layout. The layouts "default"... |
| new_from_xml_node | `EngineDesc.new_from_xml_node(node: XML) -> EngineDesc` | ibus_engine_desc_new_from_xml_node |  | Creates a new IBusEngineDesc from an XML node. <note><para>This function is called by ibus_component_new_from_file(), so developers normally do not... |
| new_varargs | `EngineDesc.new_varargs(first_property_name: utf8, ...: void) -> EngineDesc` | ibus_engine_desc_new_varargs |  | Creates a new #IBusEngineDesc. ibus_engine_desc_new_varargs() supports the va_list format. name property is required. e.g. ibus_engine_desc_new_var... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_author | `EngineDesc.get_author() -> utf8` | ibus_engine_desc_get_author |  | Gets the author property in IBusEngineDesc. It should not be freed. |
| get_description | `EngineDesc.get_description() -> utf8` | ibus_engine_desc_get_description |  | Gets the description property in IBusEngineDesc. It should not be freed. |
| get_hotkeys | `EngineDesc.get_hotkeys() -> utf8` | ibus_engine_desc_get_hotkeys |  | Gets the hotkeys property in IBusEngineDesc. It should not be freed. |
| get_icon | `EngineDesc.get_icon() -> utf8` | ibus_engine_desc_get_icon |  | Gets the icon property in IBusEngineDesc. It should not be freed. |
| get_icon_prop_key | `EngineDesc.get_icon_prop_key() -> utf8` | ibus_engine_desc_get_icon_prop_key |  | Gets the key of IBusProperty to load the panel icon dynamically in IBusEngineDesc. It should not be freed. |
| get_language | `EngineDesc.get_language() -> utf8` | ibus_engine_desc_get_language |  | Gets the language property in IBusEngineDesc. It should not be freed. |
| get_layout | `EngineDesc.get_layout() -> utf8` | ibus_engine_desc_get_layout |  | Gets the layout property in IBusEngineDesc. It should not be freed. |
| get_layout_option | `EngineDesc.get_layout_option() -> utf8` | ibus_engine_desc_get_layout_option |  | Gets the keyboard option property in IBusEngineDesc. It should not be freed. |
| get_layout_variant | `EngineDesc.get_layout_variant() -> utf8` | ibus_engine_desc_get_layout_variant |  | Gets the keyboard variant property in IBusEngineDesc. It should not be freed. |
| get_license | `EngineDesc.get_license() -> utf8` | ibus_engine_desc_get_license |  | Gets the license property in IBusEngineDesc. It should not be freed. |
| get_longname | `EngineDesc.get_longname() -> utf8` | ibus_engine_desc_get_longname |  | Gets the longname property in IBusEngineDesc. It should not be freed. |
| get_name | `EngineDesc.get_name() -> utf8` | ibus_engine_desc_get_name |  | Gets the name property in IBusEngineDesc. It should not be freed. |
| get_rank | `EngineDesc.get_rank() -> guint` | ibus_engine_desc_get_rank |  | Gets the rank property in IBusEngineDesc. |
| get_setup | `EngineDesc.get_setup() -> utf8` | ibus_engine_desc_get_setup |  | Gets the setup property in IBusEngineDesc. It should not be freed. |
| get_symbol | `EngineDesc.get_symbol() -> utf8` | ibus_engine_desc_get_symbol |  | Gets the symbol property in IBusEngineDesc. It should not be freed. |
| get_textdomain | `EngineDesc.get_textdomain() -> utf8` | ibus_engine_desc_get_textdomain |  | Gets the textdomain property in IBusEngineDesc. It should not be freed. |
| get_version | `EngineDesc.get_version() -> utf8` | ibus_engine_desc_get_version |  | Gets the version property in IBusEngineDesc. It should not be freed. |
| output | `EngineDesc.output(output: GLib.String, indent: gint) -> none` | ibus_engine_desc_output |  | Output XML-formatted input method engine description. The result will be append to GString specified in @output. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| author | utf8 | read, write, construct-only | The author of engine description |
| description | utf8 | read, write, construct-only | The description of engine description |
| hotkeys | utf8 | read, write, construct-only | The hotkeys of engine description |
| icon | utf8 | read, write, construct-only | The icon of engine description |
| icon-prop-key | utf8 | read, write, construct-only | The key of IBusProperty to change panel icon dynamically. |
| language | utf8 | read, write, construct-only | The language of engine description |
| layout | utf8 | read, write, construct-only | The layout of engine description |
| layout-option | utf8 | read, write, construct-only | The keyboard option of engine description |
| layout-variant | utf8 | read, write, construct-only | The keyboard variant of engine description |
| license | utf8 | read, write, construct-only | The license of engine description |
| longname | utf8 | read, write, construct-only | The longname of engine description |
| name | utf8 | read, write, construct-only | The name of engine description |
| rank | guint | read, write, construct-only | The rank of engine description |
| setup | utf8 | read, write, construct-only | The exec lists of the engine setup command |
| symbol | utf8 | read, write, construct-only | The symbol chars of engine description instead of icon image |
| textdomain | utf8 | read, write, construct-only | The textdomain of engine description |
| version | utf8 | read, write, construct-only | The version number of engine description |

### IBus.EngineSimple

Parent: `Engine` ?? GType: `IBusEngineSimple` ?? C type: `IBusEngineSimple`

An IBusEngineSimple provides table-based input method logic. see_also: #IBusEngine

#### Fields

| Field | Type |
| --- | --- |
| parent | Engine |
| priv | EngineSimplePrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_compose_file | `EngineSimple.add_compose_file(file: utf8) -> gboolean` | ibus_engine_simple_add_compose_file |  | Call ibus_engine_simple_add_table() internally by locale. |
| add_table | `EngineSimple.add_table(data: guint16, max_seq_len: gint, n_seqs: gint) -> none` | ibus_engine_simple_add_table |  | Adds an additional table to search to the engine. Each row of the table consists of max_seq_len key symbols followed by two guint16 interpreted as ... |
| add_table_by_locale | `EngineSimple.add_table_by_locale(locale: utf8?) -> gboolean` | ibus_engine_simple_add_table_by_locale |  | Call ibus_engine_simple_add_table() internally by locale. |

### IBus.ExtensionEvent

Parent: `Serializable` ?? GType: `IBusExtensionEvent` ?? C type: `IBusExtensionEvent`

IBusExtensionEvent properties.

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| priv | ExtensionEventPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ExtensionEvent.new(first_property_name: utf8, ...: void) -> ExtensionEvent` | ibus_extension_event_new |  | Create a new #IBusExtensionEvent. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_name | `ExtensionEvent.get_name() -> utf8` | ibus_extension_event_get_name |  |  |
| get_params | `ExtensionEvent.get_params() -> utf8` | ibus_extension_event_get_params |  | Parameters to enable the extension for #IBusXEvent |
| get_version | `ExtensionEvent.get_version() -> guint` | ibus_extension_event_get_version |  | Version of #IBusExtensionEvent |
| is_enabled | `ExtensionEvent.is_enabled() -> gboolean` | ibus_extension_event_is_enabled |  | %TRUE if the extension is enabled for #IBusExtensionEvent |
| is_extension | `ExtensionEvent.is_extension() -> gboolean` | ibus_extension_event_is_extension |  | %TRUE if the #IBusExtensionEvent is called by an extension. %FALSE if the #IBusExtensionEvent is called by an active engine or panel. If this value... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| is-enabled | gboolean | read, write, construct-only | %TRUE if the extension is enabled in the #IBusExtensionEvent. |
| is-extension | gboolean | read, write, construct-only | %TRUE if the #IBusExtensionEvent is called by an extension. %FALSE if the #IBusExtensionEvent is called by an active engine or panel. If this value... |
| name | utf8 | read, write, construct-only | Name of the extension in the #IBusExtensionEvent. |
| params | utf8 | read, write, construct-only | Parameters to enable the extension in the #IBusExtensionEvent. |
| version | guint | read | Version of the #IBusExtensionEvent. |

### IBus.Factory

Parent: `Service` ?? GType: `IBusFactory` ?? C type: `IBusFactory`

An IBusFactory is an #IBusService that creates input method engine (IME) instance. It provides CreateEngine remote method, which creates an IME ins...

#### Fields

| Field | Type |
| --- | --- |
| parent | Service |
| priv | FactoryPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Factory.new(connection: Gio.DBusConnection) -> Factory` | ibus_factory_new |  | Creates a new #IBusFactory. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_engine | `Factory.add_engine(engine_name: utf8, engine_type: GType) -> none` | ibus_factory_add_engine |  | Add an engine to the factory. |
| create_engine | `Factory.create_engine(engine_name: utf8) -> Engine` | ibus_factory_create_engine |  | Creates an #IBusEngine with @engine_name. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| create-engine | `engine_name: utf8` | Engine | last |  | The ::create-engine signal is a signal to create IBusEngine with @engine_name, which gets emitted when IBusFactory received CreateEngine dbus metho... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_engine | `create_engine(engine_name: utf8) -> Engine` |  |  | Creates an #IBusEngine with @engine_name. |

### IBus.HotkeyProfile

Parent: `Serializable` ?? GType: `IBusHotkeyProfile` ?? C type: `IBusHotkeyProfile`

An opaque data type representing an IBusHotkeyProfile.

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `HotkeyProfile.new() -> HotkeyProfile` | ibus_hotkey_profile_new |  | Creates a new #IBusHotkeyProfile. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_hotkey | `HotkeyProfile.add_hotkey(keyval: guint, modifiers: guint, event: GLib.Quark) -> gboolean` | ibus_hotkey_profile_add_hotkey |  | Adds a hotkey and its associated event to an #IBusHotkeyProfile. |
| add_hotkey_from_string | `HotkeyProfile.add_hotkey_from_string(str: utf8, event: GLib.Quark) -> gboolean` | ibus_hotkey_profile_add_hotkey_from_string |  | Adds a hotkey and its associated event to an #IBusHotkeyProfile. The hotkey is in string format, such like <constant>Control+Shift+A</constant>. |
| filter_key_event | `HotkeyProfile.filter_key_event(keyval: guint, modifiers: guint, prev_keyval: guint, prev_modifiers: guint, user_data: gpointer?) -> GLib.Quark` | ibus_hotkey_profile_filter_key_event |  | Emits a <constant>::trigger</constant> signal when a hotkey is in a profile. |
| lookup_hotkey | `HotkeyProfile.lookup_hotkey(keyval: guint, modifiers: guint) -> GLib.Quark` | ibus_hotkey_profile_lookup_hotkey |  | The event associated to the hotkey or 0 if the hotkey is not in the profile. |
| remove_hotkey | `HotkeyProfile.remove_hotkey(keyval: guint, modifiers: guint) -> gboolean` | ibus_hotkey_profile_remove_hotkey |  | Removes the hotkey for an #IBusHotkeyProfile. |
| remove_hotkey_by_event | `HotkeyProfile.remove_hotkey_by_event(event: GLib.Quark) -> gboolean` | ibus_hotkey_profile_remove_hotkey_by_event |  | Removes the hotkey for an #IBusHotkeyProfile by event. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| trigger | `event: guint, user_data: gpointer?` | none | last detailed |  | Emitted when a hotkey is pressed and the hotkey is in profile. Implement the member function trigger() in extended class to receive this signal. <n... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| trigger | `trigger(event: GLib.Quark, user_data: gpointer?) -> none` |  |  |  |

### IBus.InputContext

Parent: `Proxy` ?? Implements: `Gio.AsyncInitable`, `Gio.DBusInterface`, `Gio.Initable` ?? GType: `IBusInputContext` ?? C type: `IBusInputContext`

An IBusInputContext is a proxy object of BusInputContext, which manages the context for input methods that supports text input in various natural l...

#### Fields

| Field | Type |
| --- | --- |
| parent | Proxy |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `InputContext.new(path: utf8, connection: Gio.DBusConnection, cancellable: Gio.Cancellable?) -> InputContext throws` | ibus_input_context_new |  | Creates a new #IBusInputContext. |
| new_async_finish | `InputContext.new_async_finish(res: Gio.AsyncResult) -> InputContext throws` | ibus_input_context_new_async_finish |  | Finishes an operation started with ibus_input_context_new_async(). |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_input_context | `get_input_context(path: utf8, connection: Gio.DBusConnection) -> InputContext` | ibus_input_context_get_input_context |  | Gets an existing IBusInputContext. |
| get_input_context_async | `get_input_context_async(path: utf8, connection: Gio.DBusConnection, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_input_context_get_input_context_async |  | Gets an existing #IBusInputContext asynchronously. |
| get_input_context_async_finish | `get_input_context_async_finish(res: Gio.AsyncResult) -> InputContext throws` | ibus_input_context_get_input_context_async_finish |  | Finishes an operation started with ibus_input_context_get_input_context_async(). |
| new_async | `new_async(path: utf8, connection: Gio.DBusConnection, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_input_context_new_async |  | Creates a new #IBusInputContext asynchronously. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| cancel_hand_writing | `InputContext.cancel_hand_writing(n_strokes: guint) -> none` | ibus_input_context_cancel_hand_writing |  | Clear handwriting stroke(s) in the current input method engine. see_also: #IBusEngine::cancel-hand-writing |
| focus_in | `InputContext.focus_in() -> none` | ibus_input_context_focus_in |  | Invoked when the client application get focus. An asynchronous IPC will be performed. see_also: #IBusEngine::focus_in. |
| focus_out | `InputContext.focus_out() -> none` | ibus_input_context_focus_out |  | Invoked when the client application get focus. An asynchronous IPC will be performed. see_also: #IBusEngine::focus_out. |
| get_engine | `InputContext.get_engine() -> EngineDesc` | ibus_input_context_get_engine |  | Gets an IME engine description for the context. A synchronous IPC will be performed. |
| get_engine_async | `InputContext.get_engine_async(timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_input_context_get_engine_async |  | An asynchronous IPC will be performed. |
| get_engine_async_finish | `InputContext.get_engine_async_finish(res: Gio.AsyncResult) -> EngineDesc throws` | ibus_input_context_get_engine_async_finish |  | Finishes an operation started with ibus_input_context_get_engine_async(). |
| needs_surrounding_text | `InputContext.needs_surrounding_text() -> gboolean` | ibus_input_context_needs_surrounding_text |  | Check whether the current engine requires surrounding-text. |
| post_process_key_event | `InputContext.post_process_key_event() -> none` | ibus_input_context_post_process_key_event | 1.5.29 | Call this API after ibus_input_context_process_key_event() returns to retrieve commit-text and forwar-key-event signals during calling ibus_input_c... |
| process_hand_writing_event | `InputContext.process_hand_writing_event(coordinates: gdouble, coordinates_len: guint) -> none` | ibus_input_context_process_hand_writing_event |  | Pass a handwriting stroke to an input method engine. In this API, a coordinate (0.0, 0.0) represents the top-left corner of an area for handwriting... |
| process_key_event | `InputContext.process_key_event(keyval: guint32, keycode: guint32, state: guint32) -> gboolean` | ibus_input_context_process_key_event |  | Pass the key event to input method engine and wait for the reply from ibus (i.e. synchronous IPC). |
| process_key_event_async | `InputContext.process_key_event_async(keyval: guint32, keycode: guint32, state: guint32, timeout_msec: gint, cancellable: Gio.Cancellable?, callback: Gio.AsyncReadyCallback?, user_data: gpointer?) -> none` | ibus_input_context_process_key_event_async |  | Pass the key event to input method engine. Key symbols are characters/symbols produced by key press, for example, pressing "s" generates key symbol... |
| process_key_event_async_finish | `InputContext.process_key_event_async_finish(res: Gio.AsyncResult) -> gboolean throws` | ibus_input_context_process_key_event_async_finish |  | Finishes an operation started with ibus_input_context_process_key_event_async(). |
| property_activate | `InputContext.property_activate(prop_name: utf8, state: guint32) -> none` | ibus_input_context_property_activate |  | Activate the property asynchronously. See also: #IBusEngine::property_activate |
| reset | `InputContext.reset() -> none` | ibus_input_context_reset |  | Invoked when the IME is reset. An asynchronous IPC will be performed. see_also: #IBusEngine::reset |
| set_capabilities | `InputContext.set_capabilities(capabilities: guint32) -> none` | ibus_input_context_set_capabilities |  | Set the capabilities flags of client application asynchronously. When IBUS_CAP_FOCUS is not set, IBUS_CAP_PREEDIT_TEXT, IBUS_CAP_AUXILIARY_TEXT, IB... |
| set_client_commit_preedit | `InputContext.set_client_commit_preedit(client_commit: gboolean) -> none` | ibus_input_context_set_client_commit_preedit |  | Set whether #IBusInputContext commits pre-edit texts or not. If %TRUE, 'update-preedit-text-with-mode' signal is emitted instead of 'update-preedit... |
| set_content_type | `InputContext.set_content_type(purpose: guint, hints: guint) -> none` | ibus_input_context_set_content_type |  | Set content-type (primary purpose and hints) of the context. This information is particularly useful to implement intelligent behavior in engines, ... |
| set_cursor_location | `InputContext.set_cursor_location(x: gint32, y: gint32, w: gint32, h: gint32) -> none` | ibus_input_context_set_cursor_location |  | Set the cursor location of IBus input context asynchronously. see_also: #IBusEngine::set-cursor-location |
| set_cursor_location_relative | `InputContext.set_cursor_location_relative(x: gint32, y: gint32, w: gint32, h: gint32) -> none` | ibus_input_context_set_cursor_location_relative |  | Set the relative cursor location of IBus input context asynchronously. |
| set_engine | `InputContext.set_engine(name: utf8) -> none` | ibus_input_context_set_engine |  | Invoked when the IME engine is changed. An asynchronous IPC will be performed. |
| set_post_process_key_event | `InputContext.set_post_process_key_event(enable: gboolean) -> none` | ibus_input_context_set_post_process_key_event | 1.5.29 | An #IBusInputContext. |
| set_surrounding_text | `InputContext.set_surrounding_text(text: Text, cursor_pos: guint32, anchor_pos: guint32) -> none` | ibus_input_context_set_surrounding_text |  | An #IBusInputContext. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| commit-text | `text: Text` | none | last |  | Emitted when the text is going to be committed. (Note: The text object is floating, and it will be released after the signal. If signal handler wan... |
| cursor-down-lookup-table | `` | none | last |  | Emitted to select next candidate of lookup table. |
| cursor-up-lookup-table | `` | none | last |  | Emitted to select previous candidate of lookup table. |
| delete-surrounding-text | `offset: gint, n_chars: guint` | none | last |  | Emitted to delete surrounding text event from IME to client of IME. |
| disabled | `` | none | last |  | Emitted when an IME is disabled. |
| enabled | `` | none | last |  | Emitted when an IME is enabled. |
| forward-key-event | `keyval: guint, keycode: guint, modifiers: guint` | none | last |  | Emitted to forward key event from IME to client of IME. |
| hide-auxiliary-text | `` | none | last |  | Emitted to hide auxiliary text. |
| hide-lookup-table | `` | none | last |  | Emitted to hide lookup table. |
| hide-preedit-text | `` | none | last |  | Emitted to hide preedit text. |
| page-down-lookup-table | `` | none | last |  | Emitted to view the next page of lookup table. |
| page-up-lookup-table | `` | none | last |  | Emitted to view the previous page of lookup table. |
| register-properties | `props: PropList` | none | last |  | Emitted to register the properties in @props. (Note: The props object is floating, and it will be released after the signal. If signal handler want... |
| require-surrounding-text | `` | none | last |  | Emitted to receive the RequireSurroundingText signal from the daemon. |
| show-auxiliary-text | `` | none | last |  | Emitted to show auxiliary text. |
| show-lookup-table | `` | none | last |  | Emitted to show lookup table. |
| show-preedit-text | `` | none | last |  | Emitted to show preedit text. |
| update-auxiliary-text | `text: Text, visible: gboolean` | none | last |  | Emitted to hide auxilary text. (Note: The text object is floating, and it will be released after the signal. If signal handler wants to keep the ob... |
| update-lookup-table | `table: LookupTable, visible: gboolean` | none | last |  | Emitted to update lookup table. (Note: The table object is floating, and it will be released after the signal. If signal handler wants to keep the ... |
| update-preedit-text | `text: Text, cursor_pos: guint, visible: gboolean` | none | last |  | Emitted to update preedit text. (Note: The text object is floating, and it will be released after the signal. If signal handler wants to keep the o... |
| update-preedit-text-with-mode | `text: Text, cursor_pos: guint, visible: gboolean, mode: guint` | none | last |  | Emitted to update preedit text with the mode. (Note: The text object is floating, and it will be released after the signal. If signal handler wants... |
| update-property | `prop: Property` | none | last |  | Emitted to update the property @prop. (Note: The prop object is floating, and it will be released after the signal. If signal handler wants to keep... |

### IBus.Keymap

Parent: `Object` ?? GType: `IBusKeymap` ?? C type: `IBusKeymap`

An IBusKeymap defines the mapping between keyboard scancodes and keyboard symbols such as numbers, alphabets, and punctuation marks. Some input met...

#### Fields

| Field | Type |
| --- | --- |
| keymap | guint |
| name | utf8 |
| parent | Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Keymap.new(name: utf8) -> Keymap` | ibus_keymap_new |  | Get an #IBusKeymap associated with the giving name. This function loads the keymap file specified in @name in the IBUS_DATA_DIR/keymaps directory. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get | `get(name: utf8) -> Keymap` | ibus_keymap_get |  | Get an IBusKeymap associated with the giving name. This function loads the keymap file specified in @name in the IBUS_DATA_DIR/keymaps directory. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup_keysym | `Keymap.lookup_keysym(keycode: guint16, state: guint32) -> guint` | ibus_keymap_lookup_keysym |  | Converts the scancode to keysym, given the keymap. |

### IBus.LookupTable

Parent: `Serializable` ?? GType: `IBusLookupTable` ?? C type: `IBusLookupTable`

An IBusLookuptable stores the candidate words or phrases for users to choose from. Use ibus_engine_update_lookup_table(), ibus_engine_show_lookup_t...

#### Fields

| Field | Type |
| --- | --- |
| candidates | gpointer |
| cursor_pos | guint |
| cursor_visible | gboolean |
| labels | gpointer |
| orientation | gint |
| page_size | guint |
| parent | Serializable |
| round | gboolean |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `LookupTable.new(page_size: guint, cursor_pos: guint, cursor_visible: gboolean, round: gboolean) -> LookupTable` | ibus_lookup_table_new |  | Craetes a new #IBusLookupTable. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_candidate | `LookupTable.append_candidate(text: Text) -> none` | ibus_lookup_table_append_candidate |  | Append a candidate word/phrase to IBusLookupTable, and increase reference. |
| append_label | `LookupTable.append_label(text: Text) -> none` | ibus_lookup_table_append_label |  | Append a candidate word/phrase to IBusLookupTable, and increase reference. This function is needed if the input method select candidate with non-nu... |
| clear | `LookupTable.clear() -> none` | ibus_lookup_table_clear |  | Clear and remove all candidate from an IBusLookupTable. |
| cursor_down | `LookupTable.cursor_down() -> gboolean` | ibus_lookup_table_cursor_down |  | Go to next candidate of an #IBusLookupTable. It returns FALSE if it is already at the last candidate, unless <code>table&gt;-round==TRUE</code>, wh... |
| cursor_up | `LookupTable.cursor_up() -> gboolean` | ibus_lookup_table_cursor_up |  | Go to previous candidate of an #IBusLookupTable. It returns FALSE if it is already at the first candidate, unless <code>table&gt;-round==TRUE</code... |
| get_candidate | `LookupTable.get_candidate(index: guint) -> Text` | ibus_lookup_table_get_candidate |  | Return #IBusText at the given index. Borrowed reference. |
| get_cursor_in_page | `LookupTable.get_cursor_in_page() -> guint` | ibus_lookup_table_get_cursor_in_page |  | Gets the cursor position in current page of #IBusLookupTable. |
| get_cursor_pos | `LookupTable.get_cursor_pos() -> guint` | ibus_lookup_table_get_cursor_pos |  | Gets the cursor position of #IBusLookupTable. |
| get_label | `LookupTable.get_label(index: guint) -> Text` | ibus_lookup_table_get_label |  | Return #IBusText at the given index. Borrowed reference. |
| get_number_of_candidates | `LookupTable.get_number_of_candidates() -> guint` | ibus_lookup_table_get_number_of_candidates |  | Return the number of candidate in the table. |
| get_orientation | `LookupTable.get_orientation() -> gint` | ibus_lookup_table_get_orientation |  | Returns the orientation of the #IBusLookupTable. |
| get_page_size | `LookupTable.get_page_size() -> guint` | ibus_lookup_table_get_page_size |  | Gets the number of candidate shown per page. |
| is_cursor_visible | `LookupTable.is_cursor_visible() -> gboolean` | ibus_lookup_table_is_cursor_visible |  | Returns whether the cursor of an #IBusLookupTable is visible. |
| is_round | `LookupTable.is_round() -> gboolean` | ibus_lookup_table_is_round |  | Returns whether the #IBusLookupTable is round. |
| page_down | `LookupTable.page_down() -> gboolean` | ibus_lookup_table_page_down |  | Go to next page of an #IBusLookupTable. It returns FALSE if it is already at the last page, unless <code>table&gt;-round==TRUE</code>, where it wil... |
| page_up | `LookupTable.page_up() -> gboolean` | ibus_lookup_table_page_up |  | Go to previous page of an #IBusLookupTable. It returns FALSE if it is already at the first page, unless <code>table&gt;-round==TRUE</code>, where i... |
| set_cursor_pos | `LookupTable.set_cursor_pos(cursor_pos: guint) -> none` | ibus_lookup_table_set_cursor_pos |  | Set the cursor position of IBusLookupTable. |
| set_cursor_visible | `LookupTable.set_cursor_visible(visible: gboolean) -> none` | ibus_lookup_table_set_cursor_visible |  | Set whether to make the cursor of an IBusLookupTable visible or not. |
| set_label | `LookupTable.set_label(index: guint, text: Text) -> none` | ibus_lookup_table_set_label |  | Append a candidate word/phrase to IBusLookupTable, and increase reference. This function is needed if the input method select candidate with non-nu... |
| set_orientation | `LookupTable.set_orientation(orientation: gint) -> none` | ibus_lookup_table_set_orientation |  | Set the orientation. |
| set_page_size | `LookupTable.set_page_size(page_size: guint) -> none` | ibus_lookup_table_set_page_size |  | Set the number of candidate shown per page. |
| set_round | `LookupTable.set_round(round: gboolean) -> none` | ibus_lookup_table_set_round |  | Set whether to make the IBusLookupTable round or not. |

### IBus.Object

Parent: `GObject.InitiallyUnowned` ?? Subclasses: `Bus`, `Keymap`, `Serializable`, `Service` ?? GType: `IBusObject` ?? C type: `IBusObject`

IBusObject is the base object for all objects in IBus.

#### Fields

| Field | Type |
| --- | --- |
| flags | guint32 |
| parent | GObject.InitiallyUnowned |
| priv | ObjectPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Object.new() -> Object` | ibus_object_new |  | Creates a new #IBusObject. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `Object.destroy() -> none` | ibus_object_destroy |  | Emit the "destroy" signal notifying all reference holders that they should release the #IBusObject. The memory for the object itself won't be delet... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| destroy | `` | none | last |  | Destroy and free an IBusObject See also: ibus_object_destroy(). <note><para>Argument @user_data is ignored in this function.</para></note> |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `destroy() -> none` |  |  | Emit the "destroy" signal notifying all reference holders that they should release the #IBusObject. The memory for the object itself won't be delet... |

### IBus.ObservedPath

Parent: `Serializable` ?? GType: `IBusObservedPath` ?? C type: `IBusObservedPath`

IBusObservedPath provides methods for file path manipulation, such as monitor modification, directory tree traversal.

#### Fields

| Field | Type |
| --- | --- |
| is_dir | gboolean |
| is_exist | gboolean |
| mtime | glong |
| parent | Serializable |
| path | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ObservedPath.new(path: utf8, fill_stat: gboolean) -> ObservedPath` | ibus_observed_path_new |  | Creates a new #IBusObservedPath from an XML node. |
| new_from_xml_node | `ObservedPath.new_from_xml_node(node: XML, fill_stat: gboolean) -> ObservedPath` | ibus_observed_path_new_from_xml_node |  | Creates an new #IBusObservedPath from an XML node. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_modification | `ObservedPath.check_modification() -> gboolean` | ibus_observed_path_check_modification |  | Checks whether the path is modified by comparing the mtime in object and mtime in file system. |
| output | `ObservedPath.output(output: GLib.String, indent: gint) -> none` | ibus_observed_path_output |  | Append the observed path to a string with following format: &lt;path mtime="&lt;i&gt;modified time&lt;/i&gt;" &gt;&lt;i&gt;path&lt;/i&gt;&lt;/path&gt; |
| traverse | `ObservedPath.traverse(dir_only: gboolean) -> GLib.List` | ibus_observed_path_traverse |  | Recursively traverse the path and put the files and subdirectory in to a newly allocated GLists, if the @path is a directory. Otherwise returns NULL. |

### IBus.PanelService

Parent: `Service` ?? GType: `IBusPanelService` ?? C type: `IBusPanelService`

An IBusPanelService is a base class for UI services. Developers can "extend" this class for panel UI development.

#### Fields

| Field | Type |
| --- | --- |
| parent | Service |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PanelService.new(connection: Gio.DBusConnection) -> PanelService` | ibus_panel_service_new |  | Creates a new #IBusPanelService from an #GDBusConnection. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| candidate_clicked | `PanelService.candidate_clicked(index: guint, button: guint, state: guint) -> none` | ibus_panel_service_candidate_clicked |  | Notify that a candidate is clicked by sending a "CandidateClicked" to IBus service. |
| commit_text | `PanelService.commit_text(text: Text) -> none` | ibus_panel_service_commit_text |  | Notify that a text is sent by sending a "CommitText" message to IBus service. |
| cursor_down | `PanelService.cursor_down() -> none` | ibus_panel_service_cursor_down |  | Notify that the cursor is down by sending a "CursorDown" to IBus service. |
| cursor_up | `PanelService.cursor_up() -> none` | ibus_panel_service_cursor_up |  | Notify that the cursor is up by sending a "CursorUp" to IBus service. |
| hide_preedit_text_received | `PanelService.hide_preedit_text_received() -> none` | ibus_panel_service_hide_preedit_text_received |  | Notify that the preedit is hidden by the panel extension |
| page_down | `PanelService.page_down() -> none` | ibus_panel_service_page_down |  | Notify that the page is down by sending a "PageDown" to IBus service. |
| page_up | `PanelService.page_up() -> none` | ibus_panel_service_page_up |  | Notify that the page is up by sending a "PageUp" to IBus service. |
| panel_extension | `PanelService.panel_extension(event: ExtensionEvent) -> none` | ibus_panel_service_panel_extension |  | Enable or disable a panel extension with #IBusExtensionEvent. Notify that a data is sent by sending a "PanelExtension" message to IBus panel extens... |
| panel_extension_register_keys | `PanelService.panel_extension_register_keys(first_property_name: utf8, ...: void) -> none` | ibus_panel_service_panel_extension_register_keys |  | Register shortcut keys to enable panel extensions with #IBusExtensionEvent. Notify that a data is sent by sending a "PanelExtensionRegisterKeys" me... |
| property_activate | `PanelService.property_activate(prop_name: utf8, prop_state: guint) -> none` | ibus_panel_service_property_activate |  | Notify that a property is active by sending a "PropertyActivate" message to IBus service. |
| property_hide | `PanelService.property_hide(prop_name: utf8) -> none` | ibus_panel_service_property_hide |  | Notify that a property is hidden by sending a "ValueChanged" message to IBus service. |
| property_show | `PanelService.property_show(prop_name: utf8) -> none` | ibus_panel_service_property_show |  | Notify that a property is shown by sending a "ValueChanged" message to IBus service. |
| show_preedit_text_received | `PanelService.show_preedit_text_received() -> none` | ibus_panel_service_show_preedit_text_received |  | Notify that the preedit is shown by the panel extension |
| update_auxiliary_text_received | `PanelService.update_auxiliary_text_received(text: Text, visible: gboolean) -> none` | ibus_panel_service_update_auxiliary_text_received |  | Notify that the auxilirary is updated by the panel extension. (Note: The table object will be released, if it is floating. If caller want to keep t... |
| update_lookup_table_received | `PanelService.update_lookup_table_received(table: LookupTable, visible: gboolean) -> none` | ibus_panel_service_update_lookup_table_received |  | Notify that the lookup table is updated by the panel extension. (Note: The table object will be released, if it is floating. If caller want to keep... |
| update_preedit_text_received | `PanelService.update_preedit_text_received(text: Text, cursor_pos: guint, visible: gboolean) -> none` | ibus_panel_service_update_preedit_text_received |  | Notify that the preedit is updated by the panel extension (Note: The table object will be released, if it is floating. If caller want to keep the o... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| candidate-clicked-lookup-table | `object: guint, p0: guint, p1: guint` | none | last |  |  |
| commit-text-received | `text: Text` | none | last |  | Emitted when the client application get the ::commit-text-received. Implement the member function IBusPanelServiceClass::commit_text_received in ex... |
| cursor-down-lookup-table | `` | none | last |  | Emitted when the client application get the ::cursor-down-lookup-table. Implement the member function IBusPanelServiceClass::cursor_down_lookup_tab... |
| cursor-up-lookup-table | `` | none | last |  | Emitted when the client application get the ::cursor-up-lookup-table. Implement the member function IBusPanelServiceClass::cursor_up_lookup_table i... |
| destroy-context | `input_context_path: utf8` | none | last |  | Emitted when the client application destroys. Implement the member function IBusPanelServiceClass::destroy_context in extended class to receive thi... |
| focus-in | `input_context_path: utf8` | none | last |  | Emitted when the client application get the ::focus-in. Implement the member function IBusPanelServiceClass::focus_in in extended class to receive ... |
| focus-out | `input_context_path: utf8` | none | last |  | Emitted when the client application get the ::focus-out. Implement the member function IBusPanelServiceClass::focus_out in extended class to receiv... |
| hide-auxiliary-text | `` | none | last |  | Emitted when the client application get the ::hide-auxiliary-text. Implement the member function IBusPanelServiceClass::hide_auxiliary_text in exte... |
| hide-language-bar | `` | none | last |  | Emitted when the client application get the ::hide-language-bar. Implement the member function IBusPanelServiceClass::hide_language_bar in extended... |
| hide-lookup-table | `` | none | last |  | Emitted when the client application get the ::hide-lookup-table. Implement the member function IBusPanelServiceClass::hide_lookup_table in extended... |
| hide-preedit-text | `` | none | last |  | Emitted when the client application get the ::hide-preedit-text. Implement the member function IBusPanelServiceClass::hide_preedit_text in extended... |
| page-down-lookup-table | `` | none | last |  | Emitted when the client application get the ::page-down-lookup-table. Implement the member function IBusPanelServiceClass::page_down_lookup_table i... |
| page-up-lookup-table | `` | none | last |  | Emitted when the client application get the ::page-up-lookup-table. Implement the member function IBusPanelServiceClass::page_up_lookup_table in ex... |
| panel-extension-received | `data: ExtensionEvent` | none | last |  | Emitted when the client application get the ::panel-extension-received. Implement the member function IBusPanelServiceClass::panel_extension_receiv... |
| process-key-event | `keyval: guint, keycode: guint, state: guint` | gboolean | last |  | Emitted when a key event is received. Implement the member function IBusPanelServiceClass::process_key_event in extended class to receive this sign... |
| register-properties | `prop_list: PropList` | none | last |  | Emitted when the client application get the ::register-properties. Implement the member function IBusPanelServiceClass::register_properties in exte... |
| reset | `` | none | last |  | Emitted when the client application get the ::reset. Implement the member function IBusPanelServiceClass::reset in extended class to receive this s... |
| set-content-type | `purpose: guint, hints: guint` | none | last |  | Emitted when the client application get the ::set-content-type. Implement the member function IBusPanelServiceClass::set_content_type in extended c... |
| set-cursor-location | `x: gint, y: gint, w: gint, h: gint` | none | last |  | Emitted when the client application get the ::set-cursor-location. Implement the member function IBusPanelServiceClass::set_cursor_location in exte... |
| set-cursor-location-relative | `x: gint, y: gint, w: gint, h: gint` | none | last |  | Emitted when the client application get the set-cursor-location-relative. Implement the member function set_cursor_location_relative() in extended ... |
| show-auxiliary-text | `` | none | last |  | Emitted when the client application get the ::show-auxiliary-text. Implement the member function IBusPanelServiceClass::show_auxiliary_text in exte... |
| show-language-bar | `` | none | last |  | Emitted when the client application get the ::show-language-bar. Implement the member function IBusPanelServiceClass::show_language_bar in extended... |
| show-lookup-table | `` | none | last |  | Emitted when the client application get the ::show-lookup-table. Implement the member function IBusPanelServiceClass::show_lookup_table in extended... |
| show-preedit-text | `` | none | last |  | Emitted when the client application get the ::show-preedit-text. Implement the member function IBusPanelServiceClass::show_preedit_text in extended... |
| start-setup | `` | none | last |  | Emitted when the client application get the ::start-setup. Implement the member function IBusPanelServiceClass::start_setup in extended class to re... |
| state-changed | `` | none | last |  | Emitted when the client application get the ::state-changed. Implement the member function IBusPanelServiceClass::state_changed in extended class t... |
| update-auxiliary-text | `text: Text, visible: gboolean` | none | last |  | Emitted when the client application get the ::update-auxiliary-text. Implement the member function IBusPanelServiceClass::update_auxiliary_text in ... |
| update-lookup-table | `lookup_table: LookupTable, visible: gboolean` | none | last |  | Emitted when the client application get the ::update-lookup-table. Implement the member function IBusPanelServiceClass::update_lookup_table in exte... |
| update-preedit-text | `text: Text, cursor_pos: guint, visible: gboolean` | none | last |  | Emitted when the client application get the ::update-preedit-text. Implement the member function IBusPanelServiceClass::update_preedit_text in exte... |
| update-property | `prop: Property` | none | last |  | Emitted when the client application get the ::update-property. Implement the member function IBusPanelServiceClass::update_property in extended cla... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| candidate_clicked_lookup_table | `candidate_clicked_lookup_table(index: guint, button: guint, state: guint) -> none` |  |  |  |
| commit_text_received | `commit_text_received(text: Text) -> none` |  |  |  |
| cursor_down_lookup_table | `cursor_down_lookup_table() -> none` |  |  |  |
| cursor_up_lookup_table | `cursor_up_lookup_table() -> none` |  |  |  |
| destroy_context | `destroy_context(input_context_path: utf8) -> none` |  |  |  |
| focus_in | `focus_in(input_context_path: utf8) -> none` |  |  |  |
| focus_out | `focus_out(input_context_path: utf8) -> none` |  |  |  |
| hide_auxiliary_text | `hide_auxiliary_text() -> none` |  |  |  |
| hide_language_bar | `hide_language_bar() -> none` |  |  |  |
| hide_lookup_table | `hide_lookup_table() -> none` |  |  |  |
| hide_preedit_text | `hide_preedit_text() -> none` |  |  |  |
| page_down_lookup_table | `page_down_lookup_table() -> none` |  |  |  |
| page_up_lookup_table | `page_up_lookup_table() -> none` |  |  |  |
| panel_extension_received | `panel_extension_received(event: ExtensionEvent) -> none` |  |  |  |
| process_key_event | `process_key_event(keyval: guint, keycode: guint, state: guint) -> gboolean` |  |  |  |
| register_properties | `register_properties(prop_list: PropList) -> none` |  |  |  |
| reset | `reset() -> none` |  |  |  |
| set_content_type | `set_content_type(purpose: guint, hints: guint) -> none` |  |  |  |
| set_cursor_location | `set_cursor_location(x: gint, y: gint, w: gint, h: gint) -> none` |  |  |  |
| set_cursor_location_relative | `set_cursor_location_relative(x: gint, y: gint, w: gint, h: gint) -> none` |  |  |  |
| show_auxiliary_text | `show_auxiliary_text() -> none` |  |  |  |
| show_language_bar | `show_language_bar() -> none` |  |  |  |
| show_lookup_table | `show_lookup_table() -> none` |  |  |  |
| show_preedit_text | `show_preedit_text() -> none` |  |  |  |
| start_setup | `start_setup() -> none` |  |  |  |
| state_changed | `state_changed() -> none` |  |  |  |
| update_auxiliary_text | `update_auxiliary_text(text: Text, visible: gboolean) -> none` |  |  |  |
| update_lookup_table | `update_lookup_table(lookup_table: LookupTable, visible: gboolean) -> none` |  |  |  |
| update_preedit_text | `update_preedit_text(text: Text, cursor_pos: guint, visible: gboolean) -> none` |  |  |  |
| update_property | `update_property(prop: Property) -> none` |  |  |  |

### IBus.Property

Parent: `Serializable` ?? GType: `IBusProperty` ?? C type: `IBusProperty`

An IBusProperty is an UI component like a button or a menu item which shows the status of corresponding input method engine property. End user can ...

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| pdummy | gpointer |
| priv | PropertyPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Property.new(key: utf8, type: PropType, label: Text, icon: utf8?, tooltip: Text, sensitive: gboolean, visible: gboolean, state: PropState, prop_list: PropList?) -> Property` | ibus_property_new |  | Creates a new #IBusProperty. |
| new_varargs | `Property.new_varargs(first_property_name: utf8, ...: void) -> Property` | ibus_property_new_varargs |  | Creates a new #IBusProperty. ibus_property_new_varargs() supports the va_list format. name property is required. e.g. ibus_property_new_varargs("ke... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_icon | `Property.get_icon() -> utf8` | ibus_property_get_icon |  | Get the icon of #IBusProperty. |
| get_key | `Property.get_key() -> utf8` | ibus_property_get_key |  | Get the key of #IBusProperty. |
| get_label | `Property.get_label() -> Text` | ibus_property_get_label |  | Get the label of #IBusProperty. |
| get_prop_type | `Property.get_prop_type() -> PropType` | ibus_property_get_prop_type |  |  |
| get_sensitive | `Property.get_sensitive() -> gboolean` | ibus_property_get_sensitive |  | Get the sensitive of #IBusProperty. |
| get_state | `Property.get_state() -> PropState` | ibus_property_get_state |  | Get the state of #IBusProperty. |
| get_sub_props | `Property.get_sub_props() -> PropList` | ibus_property_get_sub_props |  | Get the IBusPropList of #IBusProperty. |
| get_symbol | `Property.get_symbol() -> Text` | ibus_property_get_symbol |  | Get the symbol of #IBusProperty. |
| get_tooltip | `Property.get_tooltip() -> Text` | ibus_property_get_tooltip |  | Get the tooltip of #IBusProperty. |
| get_visible | `Property.get_visible() -> gboolean` | ibus_property_get_visible |  | Get the visible of #IBusProperty. |
| set_icon | `Property.set_icon(icon: utf8) -> none` | ibus_property_set_icon |  | Set the icon of #IBusProperty. |
| set_label | `Property.set_label(label: Text) -> none` | ibus_property_set_label |  | Set the label of #IBusProperty. |
| set_sensitive | `Property.set_sensitive(sensitive: gboolean) -> none` | ibus_property_set_sensitive |  | Set whether the #IBusProperty is sensitive. |
| set_state | `Property.set_state(state: PropState) -> none` | ibus_property_set_state |  | Set the state of the #IBusProperty. |
| set_sub_props | `Property.set_sub_props(prop_list: PropList) -> none` | ibus_property_set_sub_props |  | Set the sub IBusProperties. |
| set_symbol | `Property.set_symbol(symbol: Text) -> none` | ibus_property_set_symbol |  | Set the symbol of #IBusProperty. |
| set_tooltip | `Property.set_tooltip(tooltip: Text) -> none` | ibus_property_set_tooltip |  | Set the tooltip of #IBusProperty. |
| set_visible | `Property.set_visible(visible: gboolean) -> none` | ibus_property_set_visible |  | Set whether the #IBusProperty is visible. |
| update | `Property.update(prop_update: Property) -> gboolean` | ibus_property_update |  | Update the content of an #IBusProperty. #IBusProperty @prop_update can either be sub-property of @prop, or holds new values for @prop. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| icon | utf8 | read, write |  |
| key | utf8 | read, write, construct-only |  |
| label | Text | read, write |  |
| prop-type | PropType | read, write, construct-only |  |
| sensitive | gboolean | read, write |  |
| state | PropState | read, write |  |
| sub-props | PropList | read, write |  |
| symbol | Text | read, write |  |
| tooltip | Text | read, write |  |
| visible | gboolean | read, write |  |

### IBus.PropList

Parent: `Serializable` ?? GType: `IBusPropList` ?? C type: `IBusPropList`

See_also: #IBusProperty, #IBusEngine

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| properties | gpointer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `PropList.new() -> PropList` | ibus_prop_list_new |  | Create a new #IBusPropList. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `PropList.append(prop: Property) -> none` | ibus_prop_list_append |  | Append an IBusProperty to an IBusPropList, and increase reference. |
| get | `PropList.get(index: guint) -> Property` | ibus_prop_list_get |  | Gets #IBusProperty at given index. Borrowed reference. |
| update_property | `PropList.update_property(prop: Property) -> gboolean` | ibus_prop_list_update_property |  | Update an IBusProperty in IBusPropList. |

### IBus.Proxy

Parent: `Gio.DBusProxy` ?? Subclasses: `Config`, `InputContext` ?? Implements: `Gio.AsyncInitable`, `Gio.DBusInterface`, `Gio.Initable` ?? GType: `IBusProxy` ?? C type: `IBusProxy`

An IBusProxy is the base of all proxy objects, which communicate the corresponding #IBusServices on the other end of IBusConnection. For example, I...

#### Fields

| Field | Type |
| --- | --- |
| flags | guint32 |
| own | gboolean |
| parent | Gio.DBusProxy |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `Proxy.destroy() -> none` | ibus_proxy_destroy |  | Dispose the proxy object. If the dbus connection is alive and the own variable above is TRUE (which is the default), org.freedesktop.IBus.Service.D... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| destroy | `` | none | last |  | Destroy and free an IBusProxy See also: ibus_proxy_destroy(). <note><para>Argument @user_data is ignored in this function.</para></note> |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| destroy | `destroy() -> none` |  |  | Dispose the proxy object. If the dbus connection is alive and the own variable above is TRUE (which is the default), org.freedesktop.IBus.Service.D... |

### IBus.Registry

Parent: `Serializable` ?? GType: `IBusRegistry` ?? C type: `IBusRegistry`

An #IBusRegistry loads IBus component files and generates the cache files. see_also: #IBusComponent

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| priv | RegistryPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Registry.new() -> Registry` | ibus_registry_new |  | Creates a new #IBusRegistry |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_modification | `Registry.check_modification() -> gboolean` | ibus_registry_check_modification |  | Check if the registry is updated. |
| get_components | `Registry.get_components() -> GLib.List` | ibus_registry_get_components |  | List components. |
| get_observed_paths | `Registry.get_observed_paths() -> GLib.List` | ibus_registry_get_observed_paths |  | List observed paths. |
| load | `Registry.load() -> none` | ibus_registry_load |  | Read all XML files in a IBus component directory (typically /usr/share/ibus/component/ *.xml) and update the registry object. IBUS_COMPONENT_PATH e... |
| load_cache | `Registry.load_cache(is_user: gboolean) -> gboolean` | ibus_registry_load_cache |  | Load the user or system registry cache. |
| load_cache_file | `Registry.load_cache_file(filename: utf8) -> gboolean` | ibus_registry_load_cache_file |  | Load the registry cache @filename. |
| load_in_dir | `Registry.load_in_dir(dirname: utf8) -> none` | ibus_registry_load_in_dir |  | Read all XML files in @dirname, create a #IBusComponent object for each file, and add the component objects to the registry. If @dirname is "/usr/s... |
| output | `Registry.output(output: GLib.String, indent: gint) -> none` | ibus_registry_output |  | Output #IBusRegistry as an XML-formatted string. The output string can be then shown on the screen or written to file. |
| save_cache | `Registry.save_cache(is_user: gboolean) -> gboolean` | ibus_registry_save_cache |  | Save the registry in a user directory or system directory. |
| save_cache_file | `Registry.save_cache_file(filename: utf8) -> gboolean` | ibus_registry_save_cache_file |  | Save the registry cache @filename. |
| start_monitor_changes | `Registry.start_monitor_changes() -> none` | ibus_registry_start_monitor_changes |  | Start to monitor observed paths. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| changed | `` | none | last |  | Emitted when any observed paths are changed. A method is not associated in this class. the "changed" signal would be handled in other classes. See ... |

### IBus.Serializable

Parent: `Object` ?? Subclasses: `Attribute`, `AttrList`, `Component`, `EmojiData`, `EngineDesc`, `ExtensionEvent`, `HotkeyProfile`, `LookupTable`, `ObservedPath`, `Property`, `PropList`, `Registry`, `Text`, `UnicodeBlock`, `UnicodeData`, `XEvent` ?? GType: `IBusSerializable` ?? C type: `IBusSerializable`

An #IBusSerializable is an IBus object which can be serialized, that is, to be to and from a #GVariant. This class is to be extended by other class...

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |
| priv | SerializablePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Serializable.new() -> Serializable` | ibus_serializable_new |  | Creates a new instance of an #IBusSerializable. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deserialize_object | `deserialize_object(variant: GLib.Variant) -> Serializable` | ibus_serializable_deserialize_object |  | Deserialize a #GVariant to an #IBusSerializable/ The deserialize method should be implemented in extended class. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Serializable.copy() -> Serializable` | ibus_serializable_copy |  | Clone an #IBusSerializable. The copy method should be implemented in extended class. |
| get_qattachment | `Serializable.get_qattachment(key: GLib.Quark) -> GLib.Variant` | ibus_serializable_get_qattachment |  | Gets a value from attachment of an #IBusSerializable. |
| remove_qattachment | `Serializable.remove_qattachment(key: GLib.Quark) -> none` | ibus_serializable_remove_qattachment |  | Remove a value from attachment of an #IBusSerializable. See also: ibus_serializable_remove_attachment(). |
| serialize_object | `Serializable.serialize_object() -> GLib.Variant` | ibus_serializable_serialize_object |  | Serialize an #IBusSerializable to a #GVariant. The serialize method should be implemented in extended class. |
| set_qattachment | `Serializable.set_qattachment(key: GLib.Quark, value: GLib.Variant) -> none` | ibus_serializable_set_qattachment |  | Attach a value to an #IBusSerializable. If the value is floating, the serializable will take the ownership. See also: ibus_serializable_set_attachm... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `copy(src: Serializable) -> gboolean` |  |  |  |
| deserialize | `deserialize(variant: GLib.Variant) -> gint` |  |  |  |
| serialize | `serialize(builder: GLib.VariantBuilder) -> gboolean` |  |  |  |

### IBus.Service

Parent: `Object` ?? Subclasses: `ConfigService`, `Engine`, `Factory`, `PanelService` ?? GType: `IBusService` ?? C type: `IBusService`

An IBusService is a base class for services.

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |
| priv | ServicePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Service.new(connection: Gio.DBusConnection, path: utf8) -> Service` | ibus_service_new |  | Creantes a new #IBusService. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| emit_signal | `Service.emit_signal(dest_bus_name: utf8, interface_name: utf8, signal_name: utf8, parameters: GLib.Variant) -> gboolean throws` | ibus_service_emit_signal |  |  |
| get_connection | `Service.get_connection() -> Gio.DBusConnection` | ibus_service_get_connection |  | Gets a connections. |
| get_object_path | `Service.get_object_path() -> utf8` | ibus_service_get_object_path |  | Gets the object path of an IBusService. |
| register | `Service.register(connection: Gio.DBusConnection) -> gboolean throws` | ibus_service_register |  | Registers service to a connection. |
| unregister | `Service.unregister(connection: Gio.DBusConnection) -> none` | ibus_service_unregister |  | Unregisters service from a connection. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| connection | Gio.DBusConnection | read, write | The connection of service object. |
| object-path | utf8 | read, write, construct-only | The path of service object. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| service_get_property | `service_get_property(connection: Gio.DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, property_name: utf8) -> GLib.Variant throws` |  |  | The ::service_get_property class method is to connect GDBusInterfaceGetPropertyFunc(). |
| service_method_call | `service_method_call(connection: Gio.DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, method_name: utf8, parameters: GLib.Variant, invocation: Gio.DBusMethodInvocation) -> none` |  |  | The ::service_method_call class method is to connect GDBusInterfaceMethodCallFunc(). |
| service_set_property | `service_set_property(connection: Gio.DBusConnection, sender: utf8, object_path: utf8, interface_name: utf8, property_name: utf8, value: GLib.Variant) -> gboolean throws` |  |  | The ::service_set_property class method is to connect GDBusInterfaceSetPropertyFunc(). |

### IBus.Text

Parent: `Serializable` ?? GType: `IBusText` ?? C type: `IBusText`

An IBusText is the main text object in IBus. The text is decorated according to associated IBusAttribute, e.g. the foreground/background color, und...

#### Fields

| Field | Type |
| --- | --- |
| attrs | AttrList |
| is_static | gboolean |
| parent | Serializable |
| text | utf8 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_printf | `Text.new_from_printf(fmt: utf8, ...: void) -> Text` | ibus_text_new_from_printf |  | Creates a new #IBusText from a printf expression. The result of printf expression is stored in the new IBusText instance. |
| new_from_static_string | `Text.new_from_static_string(str: utf8) -> Text` | ibus_text_new_from_static_string |  | Creates a new #IBusText from a static string. Since @str is a static string which won't be freed. This function will NOT duplicate @str. |
| new_from_string | `Text.new_from_string(str: utf8) -> Text` | ibus_text_new_from_string |  | Creates a new #IBusText from a string. @str will be duplicated in #IBusText, so feel free to free @str after this function. |
| new_from_ucs4 | `Text.new_from_ucs4(str: gunichar) -> Text` | ibus_text_new_from_ucs4 |  | Creates a new #IBusText from an UCS-4 encoded string. @str will be duplicated in IBusText, so feel free to free @str after this function. |
| new_from_unichar | `Text.new_from_unichar(c: gunichar) -> Text` | ibus_text_new_from_unichar |  | Creates a new #IBusText from a single UCS4-encoded character. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append_attribute | `Text.append_attribute(type: guint, value: guint, start_index: guint, end_index: gint) -> none` | ibus_text_append_attribute |  | Append an IBusAttribute for IBusText. |
| get_attributes | `Text.get_attributes() -> AttrList` | ibus_text_get_attributes |  | Return the attributes in an #IBusText. Should not be freed. |
| get_is_static | `Text.get_is_static() -> gboolean` | ibus_text_get_is_static |  | Return the is_static in an #IBusText. |
| get_length | `Text.get_length() -> guint` | ibus_text_get_length |  | Return number of characters in an #IBusText. This function is based on g_utf8_strlen(), so unlike strlen(), it does not count by bytes but characte... |
| get_text | `Text.get_text() -> utf8` | ibus_text_get_text |  | Return the text in an #IBusText. Should not be freed. |
| set_attributes | `Text.set_attributes(attrs: AttrList) -> none` | ibus_text_set_attributes |  | An IBusText. |

### IBus.UnicodeBlock

Parent: `Serializable` ?? GType: `IBusUnicodeBlock` ?? C type: `IBusUnicodeBlock`

Creates a new #IBusUnicodeBlock. block property is required. e.g. ibus_unicode_block_new ("start", 0x0000, "end", "0x007f", "name", "basic", NULL)

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| priv | UnicodeBlockPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnicodeBlock.new(first_property_name: utf8, ...: void) -> UnicodeBlock` | ibus_unicode_block_new |  | Creates a new #IBusUnicodeBlock. block property is required. e.g. ibus_unicode_block_new ("start", 0x0000, "end", "0x007f", "name", "basic", NULL) |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load(path: utf8) -> GLib.SList` | ibus_unicode_block_load |  | An #IBusUnicodeBlock list loaded from the saved cache file. |
| save | `save(path: utf8, list: GLib.SList) -> none` | ibus_unicode_block_save |  | Save the list of #IBusUnicodeBlock to the cache file. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_end | `UnicodeBlock.get_end() -> gunichar` | ibus_unicode_block_get_end |  | Gets the end code point in #IBusUnicodeBlock. |
| get_name | `UnicodeBlock.get_name() -> utf8` | ibus_unicode_block_get_name |  | Gets the name in #IBusUnicodeBlock. It should not be freed. |
| get_start | `UnicodeBlock.get_start() -> gunichar` | ibus_unicode_block_get_start |  | Gets the start code point in #IBusUnicodeBlock. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| end | guint | read, write, construct-only | The Uniode end code point |
| name | utf8 | read, write | The Uniode block name |
| start | guint | read, write, construct-only | The Uniode start code point |

### IBus.UnicodeData

Parent: `Serializable` ?? GType: `IBusUnicodeData` ?? C type: `IBusUnicodeData`

Unicode data likes code, name, alias, block-name. You can get extended values with g_object_get_properties.

#### Fields

| Field | Type |
| --- | --- |
| parent | Serializable |
| priv | UnicodeDataPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `UnicodeData.new(first_property_name: utf8, ...: void) -> UnicodeData` | ibus_unicode_data_new |  | Creates a new #IBusUnicodeData. code property is required. e.g. ibus_unicode_data_new ("code", 0x3042, NULL) |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load(path: utf8, object: GObject.Object?) -> GLib.SList` | ibus_unicode_data_load |  | An #IBusUnicodeData list loaded from the saved cache file. |
| load_async | `load_async(path: utf8, object: GObject.Object?, cancellable: Gio.Cancellable?, callback: UnicodeDataLoadAsyncFinish, user_data: gpointer?) -> none` | ibus_unicode_data_load_async |  | IBusUnicodeDataLoadAsyncFinish can receive the list of #IBusUnicodeData. |
| save | `save(path: utf8, list: GLib.SList) -> none` | ibus_unicode_data_save |  | Save the list of #IBusUnicodeData to the cache file. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_alias | `UnicodeData.get_alias() -> utf8` | ibus_unicode_data_get_alias |  | Gets the alias in #IBusUnicodeData. It should not be freed. |
| get_block_name | `UnicodeData.get_block_name() -> utf8` | ibus_unicode_data_get_block_name |  | Gets the block name in #IBusUnicodeData. It should not be freed. |
| get_code | `UnicodeData.get_code() -> gunichar` | ibus_unicode_data_get_code |  | Gets the code point in #IBusUnicodeData. |
| get_name | `UnicodeData.get_name() -> utf8` | ibus_unicode_data_get_name |  | Gets the name in #IBusUnicodeData. It should not be freed. |
| set_block_name | `UnicodeData.set_block_name(block_name: utf8) -> none` | ibus_unicode_data_set_block_name |  | Sets the block name in #IBusUnicodeData. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| alias | utf8 | read, write | The Uniode alias name |
| block-name | utf8 | read, write | The Uniode block name |
| code | guint | read, write, construct-only | The Uniode code point |
| name | utf8 | read, write | The Uniode name |

### IBus.XEvent

Parent: `Serializable` ?? GType: `IBusXEvent` ?? C type: `IBusXEvent`

An IBusXEvent provides a wrapper of XEvent. see_also: #IBusComponent, #IBusEngineDesc

#### Fields

| Field | Type |
| --- | --- |
| event_type | XEventType |
| parent | Serializable |
| priv | XEventPrivate |
| send_event | gint8 |
| serial | gulong |
| window | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `XEvent.new(first_property_name: utf8, ...: void) -> XEvent` | ibus_x_event_new |  | Create a new #IBusXEvent. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_event_type | `XEvent.get_event_type() -> XEventType` | ibus_x_event_get_event_type |  | IBusXEventType of #IBusXEvent |
| get_group | `XEvent.get_group() -> guint8` | ibus_x_event_get_group |  | group of #IBusXEvent |
| get_hardware_keycode | `XEvent.get_hardware_keycode() -> guint16` | ibus_x_event_get_hardware_keycode |  | hardware keycode of #IBusXEvent |
| get_is_modifier | `XEvent.get_is_modifier() -> gboolean` | ibus_x_event_get_is_modifier |  | is_modifier of #IBusXEvent |
| get_keyval | `XEvent.get_keyval() -> guint` | ibus_x_event_get_keyval |  | keyval of #IBusXEvent |
| get_length | `XEvent.get_length() -> gint` | ibus_x_event_get_length |  | length of #IBusXEvent |
| get_purpose | `XEvent.get_purpose() -> utf8` | ibus_x_event_get_purpose |  | purpose of #IBusXEvent |
| get_root | `XEvent.get_root() -> guint32` | ibus_x_event_get_root |  | root window of #IBusXEvent |
| get_same_screen | `XEvent.get_same_screen() -> gboolean` | ibus_x_event_get_same_screen |  | same_screen of #IBusXEvent |
| get_send_event | `XEvent.get_send_event() -> gint8` | ibus_x_event_get_send_event |  | send_event of #IBusXEvent |
| get_serial | `XEvent.get_serial() -> gulong` | ibus_x_event_get_serial |  | serial of #IBusXEvent |
| get_state | `XEvent.get_state() -> guint` | ibus_x_event_get_state |  | state of #IBusXEvent |
| get_string | `XEvent.get_string() -> utf8` | ibus_x_event_get_string |  | string of #IBusXEvent |
| get_subwindow | `XEvent.get_subwindow() -> guint32` | ibus_x_event_get_subwindow |  | subwindow of #IBusXEvent |
| get_time | `XEvent.get_time() -> guint32` | ibus_x_event_get_time |  | time of #IBusXEvent |
| get_version | `XEvent.get_version() -> guint` | ibus_x_event_get_version |  | Version of #IBusXEvent |
| get_window | `XEvent.get_window() -> guint32` | ibus_x_event_get_window |  | XID of #IBusXEvent |
| get_x | `XEvent.get_x() -> gint` | ibus_x_event_get_x |  | x of #IBusXEvent |
| get_x_root | `XEvent.get_x_root() -> gint` | ibus_x_event_get_x_root |  | x-root of #IBusXEvent |
| get_y | `XEvent.get_y() -> gint` | ibus_x_event_get_y |  | y of #IBusXEvent |
| get_y_root | `XEvent.get_y_root() -> gint` | ibus_x_event_get_y_root |  | y-root of #IBusXEvent |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| event-type | gint | read, write, construct-only | IBusXEventType of this IBusXEvent. |
| group | guint | read, write, construct-only | group of this IBusXEvent. |
| hardware-keycode | guint | read, write, construct-only | hardware keycode of this IBusXEvent. |
| is-modifier | gboolean | read, write, construct-only | is_modifier of this IBusXEvent. |
| keyval | guint | read, write, construct-only | keyval of this IBusXEvent. |
| length | gint | read, write, construct-only | keyval of this IBusXEvent. |
| purpose | utf8 | read, write, construct-only | purpose of this IBusXEvent. |
| root | guint | read, write, construct-only | root window of this IBusXEvent. |
| same-screen | gboolean | read, write, construct-only | same_screen of this IBusXEvent. |
| send-event | gint | read, write, construct-only | send_event of this IBusXEvent. |
| serial | gulong | read, write, construct-only | serial of this IBusXEvent. |
| state | guint | read, write, construct-only | state of this IBusXEvent. |
| string | utf8 | read, write, construct-only | string of this IBusXEvent. |
| subwindow | guint | read, write, construct-only | subwindow of this IBusXEvent. |
| time | guint | read, write, construct-only | time of this IBusXEvent. |
| version | guint | read | Version of this IBusXEvent. |
| window | guint | read, write, construct-only | window of this IBusXEvent. |
| x | gint | read, write, construct-only | x of this IBusXEvent. |
| x-root | gint | read, write, construct-only | root-x of this IBusXEvent. |
| y | gint | read, write, construct-only | x of this IBusXEvent. |
| y-root | gint | read, write, construct-only | root-y of this IBusXEvent. |

## Enums

### IBus.AttrType

GType: `IBusAttrType` ?? C type: `IBusAttrType`

Type enumeration of IBusText attribute.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| background | 3 | background | Background color. |
| foreground | 2 | foreground | Foreground color. |
| underline | 1 | underline | Decorate with underline. |

### IBus.AttrUnderline

GType: `IBusAttrUnderline` ?? C type: `IBusAttrUnderline`

Type of IBusText attribute.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| double | 2 | double | Double underline. |
| error | 4 | error | Error underline |
| low | 3 | low | Low underline ? FIXME |
| none | 0 | none | No underline. |
| single | 1 | single | Single underline. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(underline_type: guint, start_index: guint, end_index: guint) -> Attribute` | ibus_attr_underline_new |  | Creates a new underline #IBusAttribute. |

### IBus.BusGlobalBindingType

GType: `IBusBusGlobalBindingType` ?? C type: `IBusBusGlobalBindingType`

Type enumeration of IBusBusGlobalBindingType.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| any | 0 | any | Any types |
| emoji_typing | 2 | emoji-typing | Emoji typing |
| ime_switcher | 1 | ime-switcher | IME switcher |

### IBus.BusRequestNameReply

GType: `IBusBusRequestNameReply` ?? C type: `IBusBusRequestNameReply`

same as DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| already_owner | 4 | already-owner | same as DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER |
| exists | 3 | exists | same as DBUS_REQUEST_NAME_REPLY_EXISTS |
| in_queue | 2 | in-queue | same as DBUS_REQUEST_NAME_REPLY_IN_QUEUE |
| primary_owner | 1 | primary-owner | same as DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER |

### IBus.BusStartServiceByNameReply

GType: `IBusBusStartServiceByNameReply` ?? C type: `IBusBusStartServiceByNameReply`

same as DBUS_START_REPLY_SUCCESS

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| already_running | 2 | already-running | same as DBUS_START_REPLY_ALREADY_RUNNING |
| success | 1 | success | same as DBUS_START_REPLY_SUCCESS |

### IBus.Error

GType: `IBusError` ?? C type: `IBusError`

There is no engine associated with input context.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| failed | 2 | failed | General failure. |
| no_config | 1 | no-config | There is no config module running. |
| no_engine | 0 | no-engine | There is no engine associated with input context. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| quark | `quark() -> GLib.Quark` | ibus_error_quark |  |  |

### IBus.InputPurpose

GType: `IBusInputPurpose` ?? C type: `IBusInputPurpose`

Describes primary purpose of the input context. This information is particularly useful to implement intelligent behavior in engines, such as autom...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alpha | 1 | alpha | Allow only alphabetic characters |
| digits | 2 | digits | Allow only digits |
| email | 6 | email | Edited field expects email address |
| free_form | 0 | free-form | Allow any character |
| name | 7 | name | Edited field expects the name of a person |
| number | 3 | number | Edited field expects numbers |
| password | 8 | password | Like @IBUS_INPUT_PURPOSE_FREE_FORM, but characters are hidden |
| phone | 4 | phone | Edited field expects phone number |
| pin | 9 | pin | Like @IBUS_INPUT_PURPOSE_DIGITS, but characters are hidden |
| terminal | 10 | terminal | Allow any character, in addition to control codes. Since 1.5.24 |
| url | 5 | url | Edited field expects URL |

### IBus.Orientation

GType: `IBusOrientation` ?? C type: `IBusOrientation`

Orientation of UI.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| horizontal | 0 | horizontal | Horizontal orientation. |
| system | 2 | system | Use ibus global orientation setup. |
| vertical | 1 | vertical | Vertival orientation. |

### IBus.PreeditFocusMode

GType: `IBusPreeditFocusMode` ?? C type: `IBusPreeditFocusMode`

Pre-edit commit mode when the focus is lost.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| clear | 0 | clear | pre-edit text is cleared. |
| commit | 1 | commit | pre-edit text is committed. |

### IBus.PropState

GType: `IBusPropState` ?? C type: `IBusPropState`

State of #IBusProperty. The actual effect depends on #IBusPropType of the IBusProperty. <variablelist> <varlistentry> <term>PROP_TYPE_TOGGLE</term>...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| checked | 1 | checked | Property option is checked. |
| inconsistent | 2 | inconsistent | The state is inconsistent with the associated IME property. |
| unchecked | 0 | unchecked | Property option is unchecked. |

### IBus.PropType

GType: `IBusPropType` ?? C type: `IBusPropType`

Type enumeration of IBusProperty.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| menu | 3 | menu | Property is shown as a menu, usually imply it has sub menu items. |
| normal | 0 | normal | Property is shown as normal text. |
| radio | 2 | radio | Property is shown as a radio selection option. |
| separator | 4 | separator | A separator for menu. |
| toggle | 1 | toggle | Property is shown as a toggle button. |

### IBus.XEventType

GType: `IBusXEventType` ?? C type: `IBusXEventType`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| event_last | 3 | event-last |  |
| key_press | 0 | key-press |  |
| key_release | 1 | key-release |  |
| nothing | -1 | nothing |  |
| other | 2 | other |  |

## Flags

### IBus.BusNameFlag

GType: `IBusBusNameFlag` ?? C type: `IBusBusNameFlag`

same as DBUS_NAME_FLAG_ALLOW_REPLACEMENT

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| allow_replacement | 1 | allow-replacement | same as DBUS_NAME_FLAG_ALLOW_REPLACEMENT |
| do_not_queue | 4 | do-not-queue | same as DBUS_NAME_FLAG_DO_NOT_QUEUE |
| replace_existing | 2 | replace-existing | same as DBUS_NAME_FLAG_REPLACE_EXISTING |

### IBus.Capabilite

GType: `IBusCapabilite` ?? C type: `IBusCapabilite`

Capability flags of UI.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| auxiliary_text | 2 | auxiliary-text | UI is capable to show auxiliary text. |
| focus | 8 | focus | UI is capable to get focus. |
| lookup_table | 4 | lookup-table | UI is capable to show the lookup table. |
| osk | 64 | osk | UI is owned by on-screen keyboard. |
| preedit_text | 1 | preedit-text | UI is capable to show pre-edit text. |
| property | 16 | property | UI is capable to have property. |
| surrounding_text | 32 | surrounding-text | Client can provide surround text, or IME can handle surround text. |
| sync_process_key | 128 | sync-process-key | Asynchronous process key events are not supported and the ibus_engine_forward_key_event() should not be used for the return value of #IBusEngine::p... |
| sync_process_key_v2 | 128 | sync-process-key-v2 |  |

### IBus.InputHints

GType: `IBusInputHints` ?? C type: `IBusInputHints`

Describes hints that might be taken into account by engines. Note that engines may already tailor their behaviour according to the #IBusInputPurpos...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| emoji | 512 | emoji | Suggest offering Emoji support. Since 1.5.24 |
| inhibit_osk | 128 | inhibit-osk | Suggest to not show an onscreen keyboard (e.g for a calculator that already has all the keys). |
| lowercase | 8 | lowercase | Suggest to convert all text to lowercase |
| no_emoji | 1024 | no-emoji | Suggest not offering Emoji support. Since 1.5.24 |
| no_spellcheck | 2 | no-spellcheck | Suggest not checking for typos |
| none | 0 | none | No special behaviour suggested |
| private | 2048 | private | Request that the input method should not update personalized data (like typing history). Since 1.5.26 |
| spellcheck | 1 | spellcheck | Suggest checking for typos |
| uppercase_chars | 16 | uppercase-chars | Suggest to capitalize all text |
| uppercase_sentences | 64 | uppercase-sentences | Suggest to capitalize the first word of each sentence |
| uppercase_words | 32 | uppercase-words | Suggest to capitalize the first character of each word |
| vertical_writing | 256 | vertical-writing | The text is vertical. Since 1.5.11 |
| word_completion | 4 | word-completion | Suggest word completion |

### IBus.ModifierType

GType: `IBusModifierType` ?? C type: `IBusModifierType`

Handles key modifier such as control, shift and alt and release event. Note that nits 15 - 25 are currently unused, while bit 29 is used internally.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| button1_mask | 256 | button1-mask | Mouse button 1 (left) is activated. |
| button2_mask | 512 | button2-mask | Mouse button 2 (middle) is activated. |
| button3_mask | 1024 | button3-mask | Mouse button 3 (right) is activated. |
| button4_mask | 2048 | button4-mask | Mouse button 4 (scroll up) is activated. |
| button5_mask | 4096 | button5-mask | Mouse button 5 (scroll down) is activated. |
| control_mask | 4 | control-mask | Control key is activated. |
| forward_mask | 33554432 | forward-mask | Forward mask indicates the event has been forward from ibus. |
| handled_mask | 16777216 | handled-mask | Handled mask indicates the event has been handled by ibus. |
| hyper_mask | 134217728 | hyper-mask | Hyper key is activated. |
| ignored_mask | 33554432 | ignored-mask | It is an alias of IBUS_FORWARD_MASK. |
| lock_mask | 2 | lock-mask | Cap Lock is locked. |
| meta_mask | 268435456 | meta-mask | Meta key is activated. |
| mod1_mask | 8 | mod1-mask | Modifier 1 (Usually Alt_L (0x40), Alt_R (0x6c), Meta_L (0xcd)) activated. |
| mod2_mask | 16 | mod2-mask | Modifier 2 (Usually Num_Lock (0x4d)) activated. |
| mod3_mask | 32 | mod3-mask | Modifier 3 activated. |
| mod4_mask | 64 | mod4-mask | Modifier 4 (Usually Super_L (0xce), Hyper_L (0xcf)) activated. |
| mod5_mask | 128 | mod5-mask | Modifier 5 (ISO_Level3_Shift (0x5c), Mode_switch (0xcb)) activated. |
| modifier_mask | 1593843711 | modifier-mask | Modifier mask for the all the masks above. |
| release_mask | 1073741824 | release-mask | Key is released. |
| shift_mask | 1 | shift-mask | Shift is activated. |
| super_mask | 67108864 | super-mask | Super (Usually Win) key is activated. |

### IBus.ObjectFlags

GType: `IBusObjectFlags` ?? C type: `IBusObjectFlags`

The flags are used internally.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| destroyed | 2 | destroyed | Used during emitting IBusObject::destroy signal. |
| in_destruction | 1 | in-destruction | Used in GObjectClass::dispose |
| reserved_1 | 4 | reserved-1 | Reserved. |
| reserved_2 | 8 | reserved-2 | Reserved. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AttributeClass |  | 0 | 0 | 0 |  |
| AttrListClass |  | 0 | 0 | 0 |  |
| BusClass |  | 0 | 0 | 0 |  |
| BusPrivate |  | 0 | 0 | 0 |  |
| ComponentClass |  | 0 | 0 | 0 |  |
| ComponentPrivate |  | 0 | 0 | 0 |  |
| ConfigClass |  | 0 | 0 | 0 |  |
| ConfigPrivate |  | 0 | 0 | 0 |  |
| ConfigServiceClass |  | 0 | 0 | 0 |  |
| EmojiDataClass |  | 0 | 0 | 0 |  |
| EmojiDataPrivate |  | 0 | 0 | 0 |  |
| EngineClass |  | 0 | 0 | 0 |  |
| EngineDescClass |  | 0 | 0 | 0 |  |
| EngineDescPrivate |  | 0 | 0 | 0 |  |
| EnginePrivate |  | 0 | 0 | 0 |  |
| EngineSimpleClass |  | 0 | 0 | 0 |  |
| EngineSimplePrivate |  | 0 | 0 | 0 |  |
| ExtensionEventClass |  | 0 | 0 | 0 |  |
| ExtensionEventPrivate |  | 0 | 0 | 0 |  |
| FactoryClass |  | 0 | 0 | 0 | #IBusEngine with @engine_name. |
| FactoryPrivate |  | 0 | 0 | 0 |  |
| HotkeyProfileClass |  | 0 | 0 | 0 |  |
| InputContextClass |  | 0 | 0 | 0 |  |
| KeymapClass |  | 0 | 0 | 0 |  |
| LookupTableClass |  | 0 | 0 | 0 |  |
| ObjectClass |  | 0 | 0 | 0 | an #IBusObject to destroy. |
| ObjectPrivate |  | 0 | 0 | 0 |  |
| ObservedPathClass |  | 0 | 0 | 0 |  |
| PanelServiceClass |  | 0 | 0 | 0 |  |
| ProcessKeyEventData |  | 0 | 0 | 0 | IBuProcessKeyEventData properties. |
| PropertyClass |  | 0 | 0 | 0 |  |
| PropertyPrivate |  | 0 | 0 | 0 |  |
| PropListClass |  | 0 | 0 | 0 | Class structure for #IBusPropList. |
| ProxyClass |  | 0 | 0 | 0 | An #IBusProxy |
| Rectangle |  | 0 | 0 | 0 | Rectangle definition. |
| RegistryClass |  | 0 | 0 | 0 |  |
| RegistryPrivate |  | 0 | 0 | 0 |  |
| SerializableClass |  | 0 | 0 | 0 |  |
| SerializablePrivate |  | 0 | 0 | 0 |  |
| ServiceClass |  | 0 | 0 | 2 | An #IBusService. |
| ServicePrivate |  | 0 | 0 | 0 |  |
| TextClass |  | 0 | 0 | 0 |  |
| UnicodeBlockClass |  | 0 | 0 | 0 |  |
| UnicodeBlockPrivate |  | 0 | 0 | 0 |  |
| UnicodeDataClass |  | 0 | 0 | 0 |  |
| UnicodeDataPrivate |  | 0 | 0 | 0 |  |
| XEventClass |  | 0 | 0 | 0 |  |
| XEventPrivate |  | 0 | 0 | 0 |  |
| XML |  | 0 | 0 | 5 | IBusXML lists data structure and handling function for XML in IBus. |

### IBus.AttributeClass

C type: `IBusAttributeClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.AttrListClass

C type: `IBusAttrListClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.BusClass

C type: `IBusBusClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | ObjectClass |

### IBus.BusPrivate

C type: `IBusBusPrivate`

### IBus.ComponentClass

C type: `IBusComponentClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.ComponentPrivate

C type: `IBusComponentPrivate`

### IBus.ConfigClass

C type: `IBusConfigClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | ProxyClass |

### IBus.ConfigPrivate

C type: `IBusConfigPrivate`

### IBus.ConfigServiceClass

C type: `IBusConfigServiceClass`

#### Fields

| Field | Type |
| --- | --- |
| get_value | GLib.Variant |
| get_values | GLib.Variant |
| parent | ServiceClass |
| pdummy | gpointer |
| set_value | gboolean |
| unset_value | gboolean |

### IBus.EmojiDataClass

C type: `IBusEmojiDataClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.EmojiDataPrivate

C type: `IBusEmojiDataPrivate`

### IBus.EngineClass

C type: `IBusEngineClass`

#### Fields

| Field | Type |
| --- | --- |
| cancel_hand_writing | none |
| candidate_clicked | none |
| cursor_down | none |
| cursor_up | none |
| disable | none |
| enable | none |
| focus_in | none |
| focus_in_id | none |
| focus_out | none |
| focus_out_id | none |
| page_down | none |
| page_up | none |
| parent | ServiceClass |
| pdummy | gpointer |
| process_hand_writing_event | none |
| process_key_event | gboolean |
| property_activate | none |
| property_hide | none |
| property_show | none |
| reset | none |
| set_capabilities | none |
| set_content_type | none |
| set_cursor_location | none |
| set_surrounding_text | none |

### IBus.EngineDescClass

C type: `IBusEngineDescClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.EngineDescPrivate

C type: `IBusEngineDescPrivate`

### IBus.EnginePrivate

C type: `IBusEnginePrivate`

### IBus.EngineSimpleClass

C type: `IBusEngineSimpleClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | EngineClass |
| pdummy | gpointer |

### IBus.EngineSimplePrivate

C type: `IBusEngineSimplePrivate`

### IBus.ExtensionEventClass

C type: `IBusExtensionEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |
| pdummy | gpointer |

### IBus.ExtensionEventPrivate

C type: `IBusExtensionEventPrivate`

### IBus.FactoryClass

C type: `IBusFactoryClass`

#IBusEngine with @engine_name.

#### Fields

| Field | Type |
| --- | --- |
| create_engine | Engine |
| parent | ServiceClass |
| pdummy | gpointer |

### IBus.FactoryPrivate

C type: `IBusFactoryPrivate`

### IBus.HotkeyProfileClass

C type: `IBusHotkeyProfileClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |
| trigger | none |

### IBus.InputContextClass

C type: `IBusInputContextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | ProxyClass |
| pdummy | gpointer |

### IBus.KeymapClass

C type: `IBusKeymapClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | ObjectClass |

### IBus.LookupTableClass

C type: `IBusLookupTableClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.ObjectClass

C type: `IBusObjectClass`

an #IBusObject to destroy.

#### Fields

| Field | Type |
| --- | --- |
| destroy | none |
| parent | GObject.InitiallyUnownedClass |
| pdummy | gpointer |

### IBus.ObjectPrivate

C type: `IBusObjectPrivate`

### IBus.ObservedPathClass

C type: `IBusObservedPathClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.PanelServiceClass

C type: `IBusPanelServiceClass`

#### Fields

| Field | Type |
| --- | --- |
| candidate_clicked_lookup_table | none |
| commit_text_received | none |
| cursor_down_lookup_table | none |
| cursor_up_lookup_table | none |
| destroy_context | none |
| focus_in | none |
| focus_out | none |
| hide_auxiliary_text | none |
| hide_language_bar | none |
| hide_lookup_table | none |
| hide_preedit_text | none |
| page_down_lookup_table | none |
| page_up_lookup_table | none |
| panel_extension_received | none |
| parent | ServiceClass |
| pdummy | gpointer |
| process_key_event | gboolean |
| register_properties | none |
| reset | none |
| set_content_type | none |
| set_cursor_location | none |
| set_cursor_location_relative | none |
| show_auxiliary_text | none |
| show_language_bar | none |
| show_lookup_table | none |
| show_preedit_text | none |
| start_setup | none |
| state_changed | none |
| update_auxiliary_text | none |
| update_lookup_table | none |
| update_preedit_text | none |
| update_property | none |

### IBus.ProcessKeyEventData

C type: `IBusProcessKeyEventData`

IBuProcessKeyEventData properties.

#### Fields

| Field | Type |
| --- | --- |
| keycode | guint |
| keyval | guint |
| state | guint |

### IBus.PropertyClass

C type: `IBusPropertyClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.PropertyPrivate

C type: `IBusPropertyPrivate`

### IBus.PropListClass

C type: `IBusPropListClass`

Class structure for #IBusPropList.

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.ProxyClass

C type: `IBusProxyClass`

An #IBusProxy

#### Fields

| Field | Type |
| --- | --- |
| destroy | none |
| parent | Gio.DBusProxyClass |
| pdummy | gpointer |

### IBus.Rectangle

C type: `IBusRectangle`

Rectangle definition.

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| width | gint |
| x | gint |
| y | gint |

### IBus.RegistryClass

C type: `IBusRegistryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.RegistryPrivate

C type: `IBusRegistryPrivate`

### IBus.SerializableClass

C type: `IBusSerializableClass`

#### Fields

| Field | Type |
| --- | --- |
| copy | gboolean |
| deserialize | gint |
| parent | ObjectClass |
| pdummy | gpointer |
| serialize | gboolean |

### IBus.SerializablePrivate

C type: `IBusSerializablePrivate`

### IBus.ServiceClass

C type: `IBusServiceClass`

An #IBusService.

#### Fields

| Field | Type |
| --- | --- |
| interfaces | gpointer |
| parent | ObjectClass |
| pdummy | gpointer |
| service_get_property | GLib.Variant |
| service_method_call | none |
| service_set_property | gboolean |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_interfaces | `ServiceClass.add_interfaces(xml_data: utf8) -> gboolean` | ibus_service_class_add_interfaces |  | Set the interface introspection information with the service class. |
| free_interfaces | `ServiceClass.free_interfaces(depth: gint) -> gint` | ibus_service_class_free_interfaces |  | Free the first @depth interfaces if @depth is positive. Free the last -@depth interfaces if @depth is negative. |

### IBus.ServicePrivate

C type: `IBusServicePrivate`

### IBus.TextClass

C type: `IBusTextClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.UnicodeBlockClass

C type: `IBusUnicodeBlockClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.UnicodeBlockPrivate

C type: `IBusUnicodeBlockPrivate`

### IBus.UnicodeDataClass

C type: `IBusUnicodeDataClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |

### IBus.UnicodeDataPrivate

C type: `IBusUnicodeDataPrivate`

### IBus.XEventClass

C type: `IBusXEventClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | SerializableClass |
| pdummy | gpointer |

### IBus.XEventPrivate

C type: `IBusXEventPrivate`

### IBus.XML

GType: `IBusXML` ?? C type: `IBusXML`

IBusXML lists data structure and handling function for XML in IBus.

#### Fields

| Field | Type |
| --- | --- |
| attributes | utf8 |
| name | utf8 |
| sub_nodes | GLib.List |
| text | utf8 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| parse_buffer | `parse_buffer(buffer: utf8) -> XML` | ibus_xml_parse_buffer |  | Parse a string buffer which contains an XML-formatted string, and return a corresponding XML tree. |
| parse_file | `parse_file(name: utf8) -> XML` | ibus_xml_parse_file |  | Parse an XML file and return a corresponding XML tree. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `XML.copy() -> XML` | ibus_xml_copy |  | Creates a copy of @node, which should be freed with ibus_xml_free(). Primarily used by language bindings, not that useful otherwise (since @node ca... |
| free | `XML.free() -> none` | ibus_xml_free |  | Free an XML tree. |
| output | `XML.output(output: GLib.String) -> none` | ibus_xml_output |  | Output an XML tree to a GString. |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| accelerator_name | `accelerator_name(accelerator_key: guint, accelerator_mods: ModifierType) -> utf8` | ibus_accelerator_name |  | Converts an accelerator keyval and modifier mask into a string parseable by gtk_accelerator_parse(). For example, if you pass in #IBUS_KEY_q and #I... |
| accelerator_parse | `accelerator_parse(accelerator: utf8, accelerator_key: out guint?, accelerator_mods: out ModifierType?) -> none` | ibus_accelerator_parse | 1.5.18 | Parses a string representing an accelerator. The format looks like ???&lt;Control&gt;a??? or ???&lt;Shift&gt;&lt;Alt&gt;F1??? or ???&lt;Release%gt;... |
| accelerator_valid | `accelerator_valid(keyval: guint, modifiers: ModifierType) -> gboolean` | ibus_accelerator_valid |  | Determines whether a given keyval and modifier mask constitute a valid keyboard accelerator. For example, the #IBUS_KEY_a keyval plus #IBUS_CONTROL... |
| attr_background_new | `attr_background_new(color: guint, start_index: guint, end_index: guint) -> Attribute` | ibus_attr_background_new |  | Creates a new background #IBusAttribute. |
| attr_foreground_new | `attr_foreground_new(color: guint, start_index: guint, end_index: guint) -> Attribute` | ibus_attr_foreground_new |  | Creates a new foreground #IBusAttribute. |
| attr_underline_new | `attr_underline_new(underline_type: guint, start_index: guint, end_index: guint) -> Attribute` | ibus_attr_underline_new |  | Creates a new underline #IBusAttribute. |
| emoji_dict_load | `emoji_dict_load(path: utf8) -> GLib.HashTable` | ibus_emoji_dict_load |  | An Emoji dictionary file loaded from the saved cache file. A hash table of { emoji character, #IBusEmojiData object } is loaded from the saved cach... |
| emoji_dict_lookup | `emoji_dict_lookup(dict: GLib.HashTable, emoji: utf8) -> EmojiData` | ibus_emoji_dict_lookup |  | An #IBusEmojiData of @emoji. This API was prepared for the old dict foramat with Gir and Vala but no longer needed. Use ibus_emoji_data_load() inst... |
| emoji_dict_save | `emoji_dict_save(path: utf8, dict: GLib.HashTable) -> none` | ibus_emoji_dict_save |  | Saves the Emoji dictionary to the cache file. Recommend to use ibus_emoji_data_save() instead becase GSList in GHashTable does not work with Gir an... |
| error_quark | `error_quark() -> GLib.Quark` | ibus_error_quark |  |  |
| free_strv | `free_strv(strv: utf8) -> none` | ibus_free_strv |  | Free a list of strings. |
| get_address | `get_address() -> utf8` | ibus_get_address |  | Return the D-Bus address of IBus. It will find the address from following source: <orderedlist> <listitem><para>Environment variable IBUS_ADDRESS</... |
| get_daemon_uid | `get_daemon_uid() -> glong` | ibus_get_daemon_uid |  | Get UID of ibus-daemon. |
| get_language_name | `get_language_name(_locale: utf8) -> utf8` | ibus_get_language_name |  | translated language name |
| get_local_machine_id | `get_local_machine_id() -> utf8` | ibus_get_local_machine_id |  | Obtains the machine UUID of the machine this process is running on. |
| get_socket_path | `get_socket_path() -> utf8` | ibus_get_socket_path |  | Get the path of socket file. |
| get_timeout | `get_timeout() -> gint` | ibus_get_timeout |  | Get the GDBus timeout in milliseconds. The timeout is for clients (e.g. im-ibus.so), not for ibus-daemon. Note that the timeout for ibus-daemon cou... |
| get_untranslated_language_name | `get_untranslated_language_name(_locale: utf8) -> utf8` | ibus_get_untranslated_language_name |  | untranslated language name |
| get_user_name | `get_user_name() -> utf8` | ibus_get_user_name |  | Get the current user name. It is determined by: <orderedlist> <listitem><para>getlogin()</para></listitem> <listitem><para>Environment variable SUD... |
| init | `init() -> none` | ibus_init |  | Initialize the ibus types. |
| key_event_from_string | `key_event_from_string(string: utf8, keyval: out guint, modifiers: out guint) -> gboolean` | ibus_key_event_from_string |  | Parse key event string and return key symbol and modifiers. |
| key_event_to_string | `key_event_to_string(keyval: guint, modifiers: guint) -> utf8` | ibus_key_event_to_string |  | Return the name of a key symbol and modifiers. For example, if press ctrl, shift, and enter, then this function returns: Shift+Control+enter. |
| keyval_convert_case | `keyval_convert_case(symbol: guint, lower: out guint, upper: out guint) -> none` | ibus_keyval_convert_case |  | Obtains the upper- and lower-case versions of the keyval @symbol. Examples of keyvals are #IBUS_KEY_a, #IBUS_KEY_Return, #IBUS_KEY_F1, etc. |
| keyval_from_name | `keyval_from_name(keyval_name: utf8) -> guint` | ibus_keyval_from_name |  | Return the key symbol that associate with the key name. |
| keyval_name | `keyval_name(keyval: guint) -> utf8` | ibus_keyval_name |  | Return the name of a key symbol. Note that the returned string is used internally, so don't free it. |
| keyval_to_lower | `keyval_to_lower(keyval: guint) -> guint` | ibus_keyval_to_lower |  | Converts a key value to lower case, if applicable. |
| keyval_to_unicode | `keyval_to_unicode(keyval: guint) -> gunichar` | ibus_keyval_to_unicode |  | Convert from an IBus key symbol to the corresponding ISO10646 (Unicode) character. |
| keyval_to_upper | `keyval_to_upper(keyval: guint) -> guint` | ibus_keyval_to_upper |  | Converts a key value to upper case, if applicable. |
| main | `main() -> none` | ibus_main |  | Runs an IBus main loop until ibus_quit() is called in the loop. See also: ibus_quit(). |
| quit | `quit() -> none` | ibus_quit |  | Stops an IBus from running. Any calls to ibus_quit() for the loop will return. See also: ibus_main(). |
| set_display | `set_display(display: utf8) -> none` | ibus_set_display |  | Set the display address. |
| set_log_handler | `set_log_handler(verbose: gboolean) -> none` | ibus_set_log_handler |  | Sets GLIB's log handler to ours. Our log handler adds time info including hour, minute, second, and microsecond, like: (ibus-daemon:7088): IBUS-DEB... |
| unicode_to_keyval | `unicode_to_keyval(wc: gunichar) -> guint` | ibus_unicode_to_keyval |  | Convert from a ISO10646 character to a key symbol. |
| unset_log_handler | `unset_log_handler() -> none` | ibus_unset_log_handler |  | Remove the log handler which is set by ibus_set_log_handler. |
| write_address | `write_address(address: utf8) -> none` | ibus_write_address |  | Write D-Bus address to socket file. See also: ibus_get_address(). |
| xml_parse_buffer | `xml_parse_buffer(buffer: utf8) -> XML` | ibus_xml_parse_buffer |  | Parse a string buffer which contains an XML-formatted string, and return a corresponding XML tree. |
| xml_parse_file | `xml_parse_file(name: utf8) -> XML` | ibus_xml_parse_file |  | Parse an XML file and return a corresponding XML tree. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| FreeFunc | `FreeFunc(object: gpointer?) -> none` |  |  | Free function prototype. |
| ObjectDestroyFunc | `ObjectDestroyFunc(object: Object) -> none` |  |  |  |
| SerializableCopyFunc | `SerializableCopyFunc(dest: Serializable, src: Serializable) -> gboolean` |  |  | Prototype of copy function. Copy function copy from source #IBusSerializable to the destination one. Returns a gboolean value which indicates wheth... |
| SerializableDeserializeFunc | `SerializableDeserializeFunc(serializable: Serializable, variant: GLib.Variant) -> gint` |  |  | Prototype of deserialize function. Deserialize function convert a #GVariant to #IBusSerializable. Returns an integer value which indicates how many... |
| SerializableSerializeFunc | `SerializableSerializeFunc(serializable: Serializable, builder: GLib.VariantBuilder) -> gboolean` |  |  | Prototype of serialize function. Serialize function convert an #IBusSerializable to #GVariantBuilder. Returns a gboolean value which indicates whet... |
| UnicodeDataLoadAsyncFinish | `UnicodeDataLoadAsyncFinish(data_list: GLib.SList, user_data: gpointer?) -> none` |  |  | This callback can receive the list of #IBusUnicodeData. |

## Constants

| Name | Type |
| --- | --- |
| 0 | gint |
| 1 | gint |
| 2 | gint |
| 3 | gint |
| 3270_AltCursor | gint |
| 3270_Attn | gint |
| 3270_BackTab | gint |
| 3270_ChangeScreen | gint |
| 3270_Copy | gint |
| 3270_CursorBlink | gint |
| 3270_CursorSelect | gint |
| 3270_DeleteWord | gint |
| 3270_Duplicate | gint |
| 3270_Enter | gint |
| 3270_EraseEOF | gint |
| 3270_EraseInput | gint |
| 3270_ExSelect | gint |
| 3270_FieldMark | gint |
| 3270_Ident | gint |
| 3270_Jump | gint |
| 3270_KeyClick | gint |
| 3270_Left2 | gint |
| 3270_PA1 | gint |
| 3270_PA2 | gint |
| 3270_PA3 | gint |
| 3270_Play | gint |
| 3270_PrintScreen | gint |
| 3270_Quit | gint |
| 3270_Record | gint |
| 3270_Reset | gint |
| 3270_Right2 | gint |
| 3270_Rule | gint |
| 3270_Setup | gint |
| 3270_Test | gint |
| 4 | gint |
| 5 | gint |
| 6 | gint |
| 7 | gint |
| 8 | gint |
| 9 | gint |
| a | gint |
| A | gint |
| aacute | gint |
| Aacute | gint |
| abelowdot | gint |
| Abelowdot | gint |
| abovedot | gint |
| abreve | gint |
| Abreve | gint |
| abreveacute | gint |
| Abreveacute | gint |
| abrevebelowdot | gint |
| Abrevebelowdot | gint |
| Abrevegrave | gint |
| abrevegrave | gint |
| abrevehook | gint |
| Abrevehook | gint |
| abrevetilde | gint |
| Abrevetilde | gint |
| AccessX_Enable | gint |
| AccessX_Feedback_Enable | gint |
| Acircumflex | gint |
| acircumflex | gint |
| acircumflexacute | gint |
| Acircumflexacute | gint |
| acircumflexbelowdot | gint |
| Acircumflexbelowdot | gint |
| acircumflexgrave | gint |
| Acircumflexgrave | gint |
| Acircumflexhook | gint |
| acircumflexhook | gint |
| Acircumflextilde | gint |
| acircumflextilde | gint |
| acute | gint |
| Adiaeresis | gint |
| adiaeresis | gint |
| ae | gint |
| AE | gint |
| Agrave | gint |
| agrave | gint |
| Ahook | gint |
| ahook | gint |
| Alt_L | gint |
| Alt_R | gint |
| amacron | gint |
| Amacron | gint |
| ampersand | gint |
| aogonek | gint |
| Aogonek | gint |
| apostrophe | gint |
| approxeq | gint |
| approximate | gint |
| Arabic_0 | gint |
| Arabic_1 | gint |
| Arabic_2 | gint |
| Arabic_3 | gint |
| Arabic_4 | gint |
| Arabic_5 | gint |
| Arabic_6 | gint |
| Arabic_7 | gint |
| Arabic_8 | gint |
| Arabic_9 | gint |
| Arabic_ain | gint |
| Arabic_alef | gint |
| Arabic_alefmaksura | gint |
| Arabic_beh | gint |
| Arabic_comma | gint |
| Arabic_dad | gint |
| Arabic_dal | gint |
| Arabic_damma | gint |
| Arabic_dammatan | gint |
| Arabic_ddal | gint |
| Arabic_farsi_yeh | gint |
| Arabic_fatha | gint |
| Arabic_fathatan | gint |
| Arabic_feh | gint |
| Arabic_fullstop | gint |
| Arabic_gaf | gint |
| Arabic_ghain | gint |
| Arabic_ha | gint |
| Arabic_hah | gint |
| Arabic_hamza | gint |
| Arabic_hamza_above | gint |
| Arabic_hamza_below | gint |
| Arabic_hamzaonalef | gint |
| Arabic_hamzaonwaw | gint |
| Arabic_hamzaonyeh | gint |
| Arabic_hamzaunderalef | gint |
| Arabic_heh | gint |
| Arabic_heh_doachashmee | gint |
| Arabic_heh_goal | gint |
| Arabic_jeem | gint |
| Arabic_jeh | gint |
| Arabic_kaf | gint |
| Arabic_kasra | gint |
| Arabic_kasratan | gint |
| Arabic_keheh | gint |
| Arabic_khah | gint |
| Arabic_lam | gint |
| Arabic_madda_above | gint |
| Arabic_maddaonalef | gint |
| Arabic_meem | gint |
| Arabic_noon | gint |
| Arabic_noon_ghunna | gint |
| Arabic_peh | gint |
| Arabic_percent | gint |
| Arabic_qaf | gint |
| Arabic_question_mark | gint |
| Arabic_ra | gint |
| Arabic_rreh | gint |
| Arabic_sad | gint |
| Arabic_seen | gint |
| Arabic_semicolon | gint |
| Arabic_shadda | gint |
| Arabic_sheen | gint |
| Arabic_sukun | gint |
| Arabic_superscript_alef | gint |
| Arabic_switch | gint |
| Arabic_tah | gint |
| Arabic_tatweel | gint |
| Arabic_tcheh | gint |
| Arabic_teh | gint |
| Arabic_tehmarbuta | gint |
| Arabic_thal | gint |
| Arabic_theh | gint |
| Arabic_tteh | gint |
| Arabic_veh | gint |
| Arabic_waw | gint |
| Arabic_yeh | gint |
| Arabic_yeh_baree | gint |
| Arabic_zah | gint |
| Arabic_zain | gint |
| aring | gint |
| Aring | gint |
| Armenian_accent | gint |
| Armenian_amanak | gint |
| Armenian_apostrophe | gint |
| Armenian_AT | gint |
| Armenian_at | gint |
| Armenian_ayb | gint |
| Armenian_AYB | gint |
| Armenian_BEN | gint |
| Armenian_ben | gint |
| Armenian_but | gint |
| Armenian_CHA | gint |
| Armenian_cha | gint |
| Armenian_DA | gint |
| Armenian_da | gint |
| Armenian_dza | gint |
| Armenian_DZA | gint |
| Armenian_E | gint |
| Armenian_e | gint |
| Armenian_exclam | gint |
| Armenian_FE | gint |
| Armenian_fe | gint |
| Armenian_full_stop | gint |
| Armenian_GHAT | gint |
| Armenian_ghat | gint |
| Armenian_GIM | gint |
| Armenian_gim | gint |
| Armenian_HI | gint |
| Armenian_hi | gint |
| Armenian_ho | gint |
| Armenian_HO | gint |
| Armenian_hyphen | gint |
| Armenian_INI | gint |
| Armenian_ini | gint |
| Armenian_JE | gint |
| Armenian_je | gint |
| Armenian_KE | gint |
| Armenian_ke | gint |
| Armenian_KEN | gint |
| Armenian_ken | gint |
| Armenian_khe | gint |
| Armenian_KHE | gint |
| Armenian_ligature_ew | gint |
| Armenian_LYUN | gint |
| Armenian_lyun | gint |
| Armenian_men | gint |
| Armenian_MEN | gint |
| Armenian_nu | gint |
| Armenian_NU | gint |
| Armenian_o | gint |
| Armenian_O | gint |
| Armenian_paruyk | gint |
| Armenian_PE | gint |
| Armenian_pe | gint |
| Armenian_PYUR | gint |
| Armenian_pyur | gint |
| Armenian_question | gint |
| Armenian_ra | gint |
| Armenian_RA | gint |
| Armenian_re | gint |
| Armenian_RE | gint |
| Armenian_SE | gint |
| Armenian_se | gint |
| Armenian_separation_mark | gint |
| Armenian_sha | gint |
| Armenian_SHA | gint |
| Armenian_shesht | gint |
| Armenian_TCHE | gint |
| Armenian_tche | gint |
| Armenian_TO | gint |
| Armenian_to | gint |
| Armenian_tsa | gint |
| Armenian_TSA | gint |
| Armenian_TSO | gint |
| Armenian_tso | gint |
| Armenian_tyun | gint |
| Armenian_TYUN | gint |
| Armenian_verjaket | gint |
| Armenian_VEV | gint |
| Armenian_vev | gint |
| Armenian_vo | gint |
| Armenian_VO | gint |
| Armenian_VYUN | gint |
| Armenian_vyun | gint |
| Armenian_YECH | gint |
| Armenian_yech | gint |
| Armenian_yentamna | gint |
| Armenian_ZA | gint |
| Armenian_za | gint |
| Armenian_zhe | gint |
| Armenian_ZHE | gint |
| asciicircum | gint |
| asciitilde | gint |
| asterisk | gint |
| at | gint |
| Atilde | gint |
| atilde | gint |
| AudibleBell_Enable | gint |
| b | gint |
| B | gint |
| babovedot | gint |
| Babovedot | gint |
| backslash | gint |
| BackSpace | gint |
| ballotcross | gint |
| bar | gint |
| because | gint |
| Begin | gint |
| blank | gint |
| botintegral | gint |
| botleftparens | gint |
| botleftsqbracket | gint |
| botleftsummation | gint |
| botrightparens | gint |
| botrightsqbracket | gint |
| botrightsummation | gint |
| bott | gint |
| botvertsummationconnector | gint |
| BounceKeys_Enable | gint |
| braceleft | gint |
| braceright | gint |
| bracketleft | gint |
| bracketright | gint |
| braille_blank | gint |
| braille_dot_1 | gint |
| braille_dot_10 | gint |
| braille_dot_2 | gint |
| braille_dot_3 | gint |
| braille_dot_4 | gint |
| braille_dot_5 | gint |
| braille_dot_6 | gint |
| braille_dot_7 | gint |
| braille_dot_8 | gint |
| braille_dot_9 | gint |
| braille_dots_1 | gint |
| braille_dots_12 | gint |
| braille_dots_123 | gint |
| braille_dots_1234 | gint |
| braille_dots_12345 | gint |
| braille_dots_123456 | gint |
| braille_dots_1234567 | gint |
| braille_dots_12345678 | gint |
| braille_dots_1234568 | gint |
| braille_dots_123457 | gint |
| braille_dots_1234578 | gint |
| braille_dots_123458 | gint |
| braille_dots_12346 | gint |
| braille_dots_123467 | gint |
| braille_dots_1234678 | gint |
| braille_dots_123468 | gint |
| braille_dots_12347 | gint |
| braille_dots_123478 | gint |
| braille_dots_12348 | gint |
| braille_dots_1235 | gint |
| braille_dots_12356 | gint |
| braille_dots_123567 | gint |
| braille_dots_1235678 | gint |
| braille_dots_123568 | gint |
| braille_dots_12357 | gint |
| braille_dots_123578 | gint |
| braille_dots_12358 | gint |
| braille_dots_1236 | gint |
| braille_dots_12367 | gint |
| braille_dots_123678 | gint |
| braille_dots_12368 | gint |
| braille_dots_1237 | gint |
| braille_dots_12378 | gint |
| braille_dots_1238 | gint |
| braille_dots_124 | gint |
| braille_dots_1245 | gint |
| braille_dots_12456 | gint |
| braille_dots_124567 | gint |
| braille_dots_1245678 | gint |
| braille_dots_124568 | gint |
| braille_dots_12457 | gint |
| braille_dots_124578 | gint |
| braille_dots_12458 | gint |
| braille_dots_1246 | gint |
| braille_dots_12467 | gint |
| braille_dots_124678 | gint |
| braille_dots_12468 | gint |
| braille_dots_1247 | gint |
| braille_dots_12478 | gint |
| braille_dots_1248 | gint |
| braille_dots_125 | gint |
| braille_dots_1256 | gint |
| braille_dots_12567 | gint |
| braille_dots_125678 | gint |
| braille_dots_12568 | gint |
| braille_dots_1257 | gint |
| braille_dots_12578 | gint |
| braille_dots_1258 | gint |
| braille_dots_126 | gint |
| braille_dots_1267 | gint |
| braille_dots_12678 | gint |
| braille_dots_1268 | gint |
| braille_dots_127 | gint |
| braille_dots_1278 | gint |
| braille_dots_128 | gint |
| braille_dots_13 | gint |
| braille_dots_134 | gint |
| braille_dots_1345 | gint |
| braille_dots_13456 | gint |
| braille_dots_134567 | gint |
| braille_dots_1345678 | gint |
| braille_dots_134568 | gint |
| braille_dots_13457 | gint |
| braille_dots_134578 | gint |
| braille_dots_13458 | gint |
| braille_dots_1346 | gint |
| braille_dots_13467 | gint |
| braille_dots_134678 | gint |
| braille_dots_13468 | gint |
| braille_dots_1347 | gint |
| braille_dots_13478 | gint |
| braille_dots_1348 | gint |
| braille_dots_135 | gint |
| braille_dots_1356 | gint |
| braille_dots_13567 | gint |
| braille_dots_135678 | gint |
| braille_dots_13568 | gint |
| braille_dots_1357 | gint |
| braille_dots_13578 | gint |
| braille_dots_1358 | gint |
| braille_dots_136 | gint |
| braille_dots_1367 | gint |
| braille_dots_13678 | gint |
| braille_dots_1368 | gint |
| braille_dots_137 | gint |
| braille_dots_1378 | gint |
| braille_dots_138 | gint |
| braille_dots_14 | gint |
| braille_dots_145 | gint |
| braille_dots_1456 | gint |
| braille_dots_14567 | gint |
| braille_dots_145678 | gint |
| braille_dots_14568 | gint |
| braille_dots_1457 | gint |
| braille_dots_14578 | gint |
| braille_dots_1458 | gint |
| braille_dots_146 | gint |
| braille_dots_1467 | gint |
| braille_dots_14678 | gint |
| braille_dots_1468 | gint |
| braille_dots_147 | gint |
| braille_dots_1478 | gint |
| braille_dots_148 | gint |
| braille_dots_15 | gint |
| braille_dots_156 | gint |
| braille_dots_1567 | gint |
| braille_dots_15678 | gint |
| braille_dots_1568 | gint |
| braille_dots_157 | gint |
| braille_dots_1578 | gint |
| braille_dots_158 | gint |
| braille_dots_16 | gint |
| braille_dots_167 | gint |
| braille_dots_1678 | gint |
| braille_dots_168 | gint |
| braille_dots_17 | gint |
| braille_dots_178 | gint |
| braille_dots_18 | gint |
| braille_dots_2 | gint |
| braille_dots_23 | gint |
| braille_dots_234 | gint |
| braille_dots_2345 | gint |
| braille_dots_23456 | gint |
| braille_dots_234567 | gint |
| braille_dots_2345678 | gint |
| braille_dots_234568 | gint |
| braille_dots_23457 | gint |
| braille_dots_234578 | gint |
| braille_dots_23458 | gint |
| braille_dots_2346 | gint |
| braille_dots_23467 | gint |
| braille_dots_234678 | gint |
| braille_dots_23468 | gint |
| braille_dots_2347 | gint |
| braille_dots_23478 | gint |
| braille_dots_2348 | gint |
| braille_dots_235 | gint |
| braille_dots_2356 | gint |
| braille_dots_23567 | gint |
| braille_dots_235678 | gint |
| braille_dots_23568 | gint |
| braille_dots_2357 | gint |
| braille_dots_23578 | gint |
| braille_dots_2358 | gint |
| braille_dots_236 | gint |
| braille_dots_2367 | gint |
| braille_dots_23678 | gint |
| braille_dots_2368 | gint |
| braille_dots_237 | gint |
| braille_dots_2378 | gint |
| braille_dots_238 | gint |
| braille_dots_24 | gint |
| braille_dots_245 | gint |
| braille_dots_2456 | gint |
| braille_dots_24567 | gint |
| braille_dots_245678 | gint |
| braille_dots_24568 | gint |
| braille_dots_2457 | gint |
| braille_dots_24578 | gint |
| braille_dots_2458 | gint |
| braille_dots_246 | gint |
| braille_dots_2467 | gint |
| braille_dots_24678 | gint |
| braille_dots_2468 | gint |
| braille_dots_247 | gint |
| braille_dots_2478 | gint |
| braille_dots_248 | gint |
| braille_dots_25 | gint |
| braille_dots_256 | gint |
| braille_dots_2567 | gint |
| braille_dots_25678 | gint |
| braille_dots_2568 | gint |
| braille_dots_257 | gint |
| braille_dots_2578 | gint |
| braille_dots_258 | gint |
| braille_dots_26 | gint |
| braille_dots_267 | gint |
| braille_dots_2678 | gint |
| braille_dots_268 | gint |
| braille_dots_27 | gint |
| braille_dots_278 | gint |
| braille_dots_28 | gint |
| braille_dots_3 | gint |
| braille_dots_34 | gint |
| braille_dots_345 | gint |
| braille_dots_3456 | gint |
| braille_dots_34567 | gint |
| braille_dots_345678 | gint |
| braille_dots_34568 | gint |
| braille_dots_3457 | gint |
| braille_dots_34578 | gint |
| braille_dots_3458 | gint |
| braille_dots_346 | gint |
| braille_dots_3467 | gint |
| braille_dots_34678 | gint |
| braille_dots_3468 | gint |
| braille_dots_347 | gint |
| braille_dots_3478 | gint |
| braille_dots_348 | gint |
| braille_dots_35 | gint |
| braille_dots_356 | gint |
| braille_dots_3567 | gint |
| braille_dots_35678 | gint |
| braille_dots_3568 | gint |
| braille_dots_357 | gint |
| braille_dots_3578 | gint |
| braille_dots_358 | gint |
| braille_dots_36 | gint |
| braille_dots_367 | gint |
| braille_dots_3678 | gint |
| braille_dots_368 | gint |
| braille_dots_37 | gint |
| braille_dots_378 | gint |
| braille_dots_38 | gint |
| braille_dots_4 | gint |
| braille_dots_45 | gint |
| braille_dots_456 | gint |
| braille_dots_4567 | gint |
| braille_dots_45678 | gint |
| braille_dots_4568 | gint |
| braille_dots_457 | gint |
| braille_dots_4578 | gint |
| braille_dots_458 | gint |
| braille_dots_46 | gint |
| braille_dots_467 | gint |
| braille_dots_4678 | gint |
| braille_dots_468 | gint |
| braille_dots_47 | gint |
| braille_dots_478 | gint |
| braille_dots_48 | gint |
| braille_dots_5 | gint |
| braille_dots_56 | gint |
| braille_dots_567 | gint |
| braille_dots_5678 | gint |
| braille_dots_568 | gint |
| braille_dots_57 | gint |
| braille_dots_578 | gint |
| braille_dots_58 | gint |
| braille_dots_6 | gint |
| braille_dots_67 | gint |
| braille_dots_678 | gint |
| braille_dots_68 | gint |
| braille_dots_7 | gint |
| braille_dots_78 | gint |
| braille_dots_8 | gint |
| Break | gint |
| breve | gint |
| brokenbar | gint |
| Byelorussian_SHORTU | gint |
| Byelorussian_shortu | gint |
| c | gint |
| C | gint |
| Cabovedot | gint |
| cabovedot | gint |
| Cacute | gint |
| cacute | gint |
| Cancel | gint |
| Caps_Lock | gint |
| careof | gint |
| caret | gint |
| caron | gint |
| Ccaron | gint |
| ccaron | gint |
| Ccedilla | gint |
| ccedilla | gint |
| ccircumflex | gint |
| Ccircumflex | gint |
| cedilla | gint |
| cent | gint |
| checkerboard | gint |
| checkmark | gint |
| circle | gint |
| Clear | gint |
| club | gint |
| Codeinput | gint |
| colon | gint |
| ColonSign | gint |
| comma | gint |
| containsas | gint |
| Control_L | gint |
| Control_R | gint |
| copyright | gint |
| cr | gint |
| crossinglines | gint |
| CruzeiroSign | gint |
| cuberoot | gint |
| currency | gint |
| cursor | gint |
| Cyrillic_A | gint |
| Cyrillic_a | gint |
| Cyrillic_BE | gint |
| Cyrillic_be | gint |
| Cyrillic_CHE | gint |
| Cyrillic_che | gint |
| Cyrillic_che_descender | gint |
| Cyrillic_CHE_descender | gint |
| Cyrillic_CHE_vertstroke | gint |
| Cyrillic_che_vertstroke | gint |
| Cyrillic_de | gint |
| Cyrillic_DE | gint |
| Cyrillic_DZHE | gint |
| Cyrillic_dzhe | gint |
| Cyrillic_E | gint |
| Cyrillic_e | gint |
| Cyrillic_ef | gint |
| Cyrillic_EF | gint |
| Cyrillic_EL | gint |
| Cyrillic_el | gint |
| Cyrillic_EM | gint |
| Cyrillic_em | gint |
| Cyrillic_EN | gint |
| Cyrillic_en | gint |
| Cyrillic_en_descender | gint |
| Cyrillic_EN_descender | gint |
| Cyrillic_ER | gint |
| Cyrillic_er | gint |
| Cyrillic_es | gint |
| Cyrillic_ES | gint |
| Cyrillic_ghe | gint |
| Cyrillic_GHE | gint |
| Cyrillic_ghe_bar | gint |
| Cyrillic_GHE_bar | gint |
| Cyrillic_HA | gint |
| Cyrillic_ha | gint |
| Cyrillic_ha_descender | gint |
| Cyrillic_HA_descender | gint |
| Cyrillic_HARDSIGN | gint |
| Cyrillic_hardsign | gint |
| Cyrillic_I | gint |
| Cyrillic_i | gint |
| Cyrillic_I_macron | gint |
| Cyrillic_i_macron | gint |
| Cyrillic_IE | gint |
| Cyrillic_ie | gint |
| Cyrillic_IO | gint |
| Cyrillic_io | gint |
| Cyrillic_JE | gint |
| Cyrillic_je | gint |
| Cyrillic_KA | gint |
| Cyrillic_ka | gint |
| Cyrillic_KA_descender | gint |
| Cyrillic_ka_descender | gint |
| Cyrillic_KA_vertstroke | gint |
| Cyrillic_ka_vertstroke | gint |
| Cyrillic_LJE | gint |
| Cyrillic_lje | gint |
| Cyrillic_NJE | gint |
| Cyrillic_nje | gint |
| Cyrillic_O | gint |
| Cyrillic_o | gint |
| Cyrillic_O_bar | gint |
| Cyrillic_o_bar | gint |
| Cyrillic_PE | gint |
| Cyrillic_pe | gint |
| Cyrillic_SCHWA | gint |
| Cyrillic_schwa | gint |
| Cyrillic_SHA | gint |
| Cyrillic_sha | gint |
| Cyrillic_SHCHA | gint |
| Cyrillic_shcha | gint |
| Cyrillic_SHHA | gint |
| Cyrillic_shha | gint |
| Cyrillic_SHORTI | gint |
| Cyrillic_shorti | gint |
| Cyrillic_SOFTSIGN | gint |
| Cyrillic_softsign | gint |
| Cyrillic_TE | gint |
| Cyrillic_te | gint |
| Cyrillic_TSE | gint |
| Cyrillic_tse | gint |
| Cyrillic_u | gint |
| Cyrillic_U | gint |
| Cyrillic_U_macron | gint |
| Cyrillic_u_macron | gint |
| Cyrillic_U_straight | gint |
| Cyrillic_u_straight | gint |
| Cyrillic_U_straight_bar | gint |
| Cyrillic_u_straight_bar | gint |
| Cyrillic_VE | gint |
| Cyrillic_ve | gint |
| Cyrillic_YA | gint |
| Cyrillic_ya | gint |
| Cyrillic_yeru | gint |
| Cyrillic_YERU | gint |
| Cyrillic_YU | gint |
| Cyrillic_yu | gint |
| Cyrillic_ZE | gint |
| Cyrillic_ze | gint |
| Cyrillic_ZHE | gint |
| Cyrillic_zhe | gint |
| Cyrillic_zhe_descender | gint |
| Cyrillic_ZHE_descender | gint |
| d | gint |
| D | gint |
| dabovedot | gint |
| Dabovedot | gint |
| dagger | gint |
| dcaron | gint |
| Dcaron | gint |
| dead_abovecomma | gint |
| dead_abovedot | gint |
| dead_abovereversedcomma | gint |
| dead_abovering | gint |
| dead_acute | gint |
| dead_belowbreve | gint |
| dead_belowcircumflex | gint |
| dead_belowdiaeresis | gint |
| dead_belowdot | gint |
| dead_belowmacron | gint |
| dead_belowring | gint |
| dead_belowtilde | gint |
| dead_breve | gint |
| dead_caron | gint |
| dead_cedilla | gint |
| dead_circumflex | gint |
| dead_dasia | gint |
| dead_diaeresis | gint |
| dead_doubleacute | gint |
| dead_grave | gint |
| dead_hook | gint |
| dead_horn | gint |
| dead_iota | gint |
| dead_macron | gint |
| dead_ogonek | gint |
| dead_perispomeni | gint |
| dead_psili | gint |
| dead_semivoiced_sound | gint |
| dead_stroke | gint |
| dead_tilde | gint |
| dead_voiced_sound | gint |
| decimalpoint | gint |
| degree | gint |
| Delete | gint |
| diaeresis | gint |
| diamond | gint |
| digitspace | gint |
| dintegral | gint |
| division | gint |
| dollar | gint |
| DongSign | gint |
| doubbaselinedot | gint |
| doubleacute | gint |
| doubledagger | gint |
| doublelowquotemark | gint |
| Down | gint |
| downarrow | gint |
| downcaret | gint |
| downshoe | gint |
| downstile | gint |
| downtack | gint |
| dstroke | gint |
| Dstroke | gint |
| e | gint |
| E | gint |
| Eabovedot | gint |
| eabovedot | gint |
| eacute | gint |
| Eacute | gint |
| Ebelowdot | gint |
| ebelowdot | gint |
| ecaron | gint |
| Ecaron | gint |
| ecircumflex | gint |
| Ecircumflex | gint |
| ecircumflexacute | gint |
| Ecircumflexacute | gint |
| Ecircumflexbelowdot | gint |
| ecircumflexbelowdot | gint |
| ecircumflexgrave | gint |
| Ecircumflexgrave | gint |
| ecircumflexhook | gint |
| Ecircumflexhook | gint |
| ecircumflextilde | gint |
| Ecircumflextilde | gint |
| EcuSign | gint |
| ediaeresis | gint |
| Ediaeresis | gint |
| Egrave | gint |
| egrave | gint |
| ehook | gint |
| Ehook | gint |
| eightsubscript | gint |
| eightsuperior | gint |
| Eisu_Shift | gint |
| Eisu_toggle | gint |
| elementof | gint |
| ellipsis | gint |
| em3space | gint |
| em4space | gint |
| Emacron | gint |
| emacron | gint |
| emdash | gint |
| emfilledcircle | gint |
| emfilledrect | gint |
| emopencircle | gint |
| emopenrectangle | gint |
| emptyset | gint |
| emspace | gint |
| End | gint |
| endash | gint |
| enfilledcircbullet | gint |
| enfilledsqbullet | gint |
| ENG | gint |
| eng | gint |
| enopencircbullet | gint |
| enopensquarebullet | gint |
| enspace | gint |
| eogonek | gint |
| Eogonek | gint |
| equal | gint |
| Escape | gint |
| eth | gint |
| ETH | gint |
| Eth | gint |
| Etilde | gint |
| etilde | gint |
| EuroSign | gint |
| exclam | gint |
| exclamdown | gint |
| Execute | gint |
| f | gint |
| F | gint |
| F1 | gint |
| F10 | gint |
| F11 | gint |
| F12 | gint |
| F13 | gint |
| F14 | gint |
| F15 | gint |
| F16 | gint |
| F17 | gint |
| F18 | gint |
| F19 | gint |
| F2 | gint |
| F20 | gint |
| F21 | gint |
| F22 | gint |
| F23 | gint |
| F24 | gint |
| F25 | gint |
| F26 | gint |
| F27 | gint |
| F28 | gint |
| F29 | gint |
| F3 | gint |
| F30 | gint |
| F31 | gint |
| F32 | gint |
| F33 | gint |
| F34 | gint |
| F35 | gint |
| F4 | gint |
| F5 | gint |
| F6 | gint |
| F7 | gint |
| F8 | gint |
| F9 | gint |
| fabovedot | gint |
| Fabovedot | gint |
| Farsi_0 | gint |
| Farsi_1 | gint |
| Farsi_2 | gint |
| Farsi_3 | gint |
| Farsi_4 | gint |
| Farsi_5 | gint |
| Farsi_6 | gint |
| Farsi_7 | gint |
| Farsi_8 | gint |
| Farsi_9 | gint |
| Farsi_yeh | gint |
| femalesymbol | gint |
| ff | gint |
| FFrancSign | gint |
| figdash | gint |
| filledlefttribullet | gint |
| filledrectbullet | gint |
| filledrighttribullet | gint |
| filledtribulletdown | gint |
| filledtribulletup | gint |
| Find | gint |
| First_Virtual_Screen | gint |
| fiveeighths | gint |
| fivesixths | gint |
| fivesubscript | gint |
| fivesuperior | gint |
| fourfifths | gint |
| foursubscript | gint |
| foursuperior | gint |
| fourthroot | gint |
| function | gint |
| g | gint |
| G | gint |
| gabovedot | gint |
| Gabovedot | gint |
| gbreve | gint |
| Gbreve | gint |
| Gcaron | gint |
| gcaron | gint |
| gcedilla | gint |
| Gcedilla | gint |
| Gcircumflex | gint |
| gcircumflex | gint |
| Georgian_an | gint |
| Georgian_ban | gint |
| Georgian_can | gint |
| Georgian_char | gint |
| Georgian_chin | gint |
| Georgian_cil | gint |
| Georgian_don | gint |
| Georgian_en | gint |
| Georgian_fi | gint |
| Georgian_gan | gint |
| Georgian_ghan | gint |
| Georgian_hae | gint |
| Georgian_har | gint |
| Georgian_he | gint |
| Georgian_hie | gint |
| Georgian_hoe | gint |
| Georgian_in | gint |
| Georgian_jhan | gint |
| Georgian_jil | gint |
| Georgian_kan | gint |
| Georgian_khar | gint |
| Georgian_las | gint |
| Georgian_man | gint |
| Georgian_nar | gint |
| Georgian_on | gint |
| Georgian_par | gint |
| Georgian_phar | gint |
| Georgian_qar | gint |
| Georgian_rae | gint |
| Georgian_san | gint |
| Georgian_shin | gint |
| Georgian_tan | gint |
| Georgian_tar | gint |
| Georgian_un | gint |
| Georgian_vin | gint |
| Georgian_we | gint |
| Georgian_xan | gint |
| Georgian_zen | gint |
| Georgian_zhar | gint |
| grave | gint |
| greater | gint |
| greaterthanequal | gint |
| Greek_accentdieresis | gint |
| Greek_ALPHA | gint |
| Greek_alpha | gint |
| Greek_ALPHAaccent | gint |
| Greek_alphaaccent | gint |
| Greek_BETA | gint |
| Greek_beta | gint |
| Greek_CHI | gint |
| Greek_chi | gint |
| Greek_DELTA | gint |
| Greek_delta | gint |
| Greek_EPSILON | gint |
| Greek_epsilon | gint |
| Greek_EPSILONaccent | gint |
| Greek_epsilonaccent | gint |
| Greek_ETA | gint |
| Greek_eta | gint |
| Greek_ETAaccent | gint |
| Greek_etaaccent | gint |
| Greek_finalsmallsigma | gint |
| Greek_GAMMA | gint |
| Greek_gamma | gint |
| Greek_horizbar | gint |
| Greek_iota | gint |
| Greek_IOTA | gint |
| Greek_iotaaccent | gint |
| Greek_IOTAaccent | gint |
| Greek_iotaaccentdieresis | gint |
| Greek_IOTAdiaeresis | gint |
| Greek_iotadieresis | gint |
| Greek_IOTAdieresis | gint |
| Greek_KAPPA | gint |
| Greek_kappa | gint |
| Greek_lambda | gint |
| Greek_LAMBDA | gint |
| Greek_lamda | gint |
| Greek_LAMDA | gint |
| Greek_mu | gint |
| Greek_MU | gint |
| Greek_nu | gint |
| Greek_NU | gint |
| Greek_omega | gint |
| Greek_OMEGA | gint |
| Greek_omegaaccent | gint |
| Greek_OMEGAaccent | gint |
| Greek_omicron | gint |
| Greek_OMICRON | gint |
| Greek_omicronaccent | gint |
| Greek_OMICRONaccent | gint |
| Greek_phi | gint |
| Greek_PHI | gint |
| Greek_pi | gint |
| Greek_PI | gint |
| Greek_PSI | gint |
| Greek_psi | gint |
| Greek_rho | gint |
| Greek_RHO | gint |
| Greek_SIGMA | gint |
| Greek_sigma | gint |
| Greek_switch | gint |
| Greek_TAU | gint |
| Greek_tau | gint |
| Greek_theta | gint |
| Greek_THETA | gint |
| Greek_upsilon | gint |
| Greek_UPSILON | gint |
| Greek_upsilonaccent | gint |
| Greek_UPSILONaccent | gint |
| Greek_upsilonaccentdieresis | gint |
| Greek_upsilondieresis | gint |
| Greek_UPSILONdieresis | gint |
| Greek_XI | gint |
| Greek_xi | gint |
| Greek_ZETA | gint |
| Greek_zeta | gint |
| guillemotleft | gint |
| guillemotright | gint |
| h | gint |
| H | gint |
| hairspace | gint |
| Hangul | gint |
| Hangul_A | gint |
| Hangul_AE | gint |
| Hangul_AraeA | gint |
| Hangul_AraeAE | gint |
| Hangul_Banja | gint |
| Hangul_Cieuc | gint |
| Hangul_Codeinput | gint |
| Hangul_Dikeud | gint |
| Hangul_E | gint |
| Hangul_End | gint |
| Hangul_EO | gint |
| Hangul_EU | gint |
| Hangul_Hanja | gint |
| Hangul_Hieuh | gint |
| Hangul_I | gint |
| Hangul_Ieung | gint |
| Hangul_J_Cieuc | gint |
| Hangul_J_Dikeud | gint |
| Hangul_J_Hieuh | gint |
| Hangul_J_Ieung | gint |
| Hangul_J_Jieuj | gint |
| Hangul_J_Khieuq | gint |
| Hangul_J_Kiyeog | gint |
| Hangul_J_KiyeogSios | gint |
| Hangul_J_KkogjiDalrinIeung | gint |
| Hangul_J_Mieum | gint |
| Hangul_J_Nieun | gint |
| Hangul_J_NieunHieuh | gint |
| Hangul_J_NieunJieuj | gint |
| Hangul_J_PanSios | gint |
| Hangul_J_Phieuf | gint |
| Hangul_J_Pieub | gint |
| Hangul_J_PieubSios | gint |
| Hangul_J_Rieul | gint |
| Hangul_J_RieulHieuh | gint |
| Hangul_J_RieulKiyeog | gint |
| Hangul_J_RieulMieum | gint |
| Hangul_J_RieulPhieuf | gint |
| Hangul_J_RieulPieub | gint |
| Hangul_J_RieulSios | gint |
| Hangul_J_RieulTieut | gint |
| Hangul_J_Sios | gint |
| Hangul_J_SsangKiyeog | gint |
| Hangul_J_SsangSios | gint |
| Hangul_J_Tieut | gint |
| Hangul_J_YeorinHieuh | gint |
| Hangul_Jamo | gint |
| Hangul_Jeonja | gint |
| Hangul_Jieuj | gint |
| Hangul_Khieuq | gint |
| Hangul_Kiyeog | gint |
| Hangul_KiyeogSios | gint |
| Hangul_KkogjiDalrinIeung | gint |
| Hangul_Mieum | gint |
| Hangul_MultipleCandidate | gint |
| Hangul_Nieun | gint |
| Hangul_NieunHieuh | gint |
| Hangul_NieunJieuj | gint |
| Hangul_O | gint |
| Hangul_OE | gint |
| Hangul_PanSios | gint |
| Hangul_Phieuf | gint |
| Hangul_Pieub | gint |
| Hangul_PieubSios | gint |
| Hangul_PostHanja | gint |
| Hangul_PreHanja | gint |
| Hangul_PreviousCandidate | gint |
| Hangul_Rieul | gint |
| Hangul_RieulHieuh | gint |
| Hangul_RieulKiyeog | gint |
| Hangul_RieulMieum | gint |
| Hangul_RieulPhieuf | gint |
| Hangul_RieulPieub | gint |
| Hangul_RieulSios | gint |
| Hangul_RieulTieut | gint |
| Hangul_RieulYeorinHieuh | gint |
| Hangul_Romaja | gint |
| Hangul_SingleCandidate | gint |
| Hangul_Sios | gint |
| Hangul_Special | gint |
| Hangul_SsangDikeud | gint |
| Hangul_SsangJieuj | gint |
| Hangul_SsangKiyeog | gint |
| Hangul_SsangPieub | gint |
| Hangul_SsangSios | gint |
| Hangul_Start | gint |
| Hangul_SunkyeongeumMieum | gint |
| Hangul_SunkyeongeumPhieuf | gint |
| Hangul_SunkyeongeumPieub | gint |
| Hangul_switch | gint |
| Hangul_Tieut | gint |
| Hangul_U | gint |
| Hangul_WA | gint |
| Hangul_WAE | gint |
| Hangul_WE | gint |
| Hangul_WEO | gint |
| Hangul_WI | gint |
| Hangul_YA | gint |
| Hangul_YAE | gint |
| Hangul_YE | gint |
| Hangul_YEO | gint |
| Hangul_YeorinHieuh | gint |
| Hangul_YI | gint |
| Hangul_YO | gint |
| Hangul_YU | gint |
| Hankaku | gint |
| hcircumflex | gint |
| Hcircumflex | gint |
| heart | gint |
| hebrew_aleph | gint |
| hebrew_ayin | gint |
| hebrew_bet | gint |
| hebrew_beth | gint |
| hebrew_chet | gint |
| hebrew_dalet | gint |
| hebrew_daleth | gint |
| hebrew_doublelowline | gint |
| hebrew_finalkaph | gint |
| hebrew_finalmem | gint |
| hebrew_finalnun | gint |
| hebrew_finalpe | gint |
| hebrew_finalzade | gint |
| hebrew_finalzadi | gint |
| hebrew_gimel | gint |
| hebrew_gimmel | gint |
| hebrew_he | gint |
| hebrew_het | gint |
| hebrew_kaph | gint |
| hebrew_kuf | gint |
| hebrew_lamed | gint |
| hebrew_mem | gint |
| hebrew_nun | gint |
| hebrew_pe | gint |
| hebrew_qoph | gint |
| hebrew_resh | gint |
| hebrew_samech | gint |
| hebrew_samekh | gint |
| hebrew_shin | gint |
| Hebrew_switch | gint |
| hebrew_taf | gint |
| hebrew_taw | gint |
| hebrew_tet | gint |
| hebrew_teth | gint |
| hebrew_waw | gint |
| hebrew_yod | gint |
| hebrew_zade | gint |
| hebrew_zadi | gint |
| hebrew_zain | gint |
| hebrew_zayin | gint |
| Help | gint |
| Henkan | gint |
| Henkan_Mode | gint |
| hexagram | gint |
| Hiragana | gint |
| Hiragana_Katakana | gint |
| Home | gint |
| horizconnector | gint |
| horizlinescan1 | gint |
| horizlinescan3 | gint |
| horizlinescan5 | gint |
| horizlinescan7 | gint |
| horizlinescan9 | gint |
| hstroke | gint |
| Hstroke | gint |
| ht | gint |
| Hyper_L | gint |
| Hyper_R | gint |
| hyphen | gint |
| I | gint |
| i | gint |
| Iabovedot | gint |
| iacute | gint |
| Iacute | gint |
| ibelowdot | gint |
| Ibelowdot | gint |
| ibreve | gint |
| Ibreve | gint |
| icircumflex | gint |
| Icircumflex | gint |
| identical | gint |
| idiaeresis | gint |
| Idiaeresis | gint |
| idotless | gint |
| ifonlyif | gint |
| Igrave | gint |
| igrave | gint |
| Ihook | gint |
| ihook | gint |
| Imacron | gint |
| imacron | gint |
| implies | gint |
| includedin | gint |
| includes | gint |
| infinity | gint |
| Insert | gint |
| integral | gint |
| INTERFACE_CONFIG | utf8 |
| INTERFACE_ENGINE | utf8 |
| INTERFACE_FACTORY | utf8 |
| INTERFACE_IBUS | utf8 |
| INTERFACE_INPUT_CONTEXT | utf8 |
| INTERFACE_NOTIFICATIONS | utf8 |
| INTERFACE_PANEL | utf8 |
| INTERFACE_PORTAL | utf8 |
| intersection | gint |
| Iogonek | gint |
| iogonek | gint |
| ISO_Center_Object | gint |
| ISO_Continuous_Underline | gint |
| ISO_Discontinuous_Underline | gint |
| ISO_Emphasize | gint |
| ISO_Enter | gint |
| ISO_Fast_Cursor_Down | gint |
| ISO_Fast_Cursor_Left | gint |
| ISO_Fast_Cursor_Right | gint |
| ISO_Fast_Cursor_Up | gint |
| ISO_First_Group | gint |
| ISO_First_Group_Lock | gint |
| ISO_Group_Latch | gint |
| ISO_Group_Lock | gint |
| ISO_Group_Shift | gint |
| ISO_Last_Group | gint |
| ISO_Last_Group_Lock | gint |
| ISO_Left_Tab | gint |
| ISO_Level2_Latch | gint |
| ISO_Level3_Latch | gint |
| ISO_Level3_Lock | gint |
| ISO_Level3_Shift | gint |
| ISO_Level5_Latch | gint |
| ISO_Level5_Lock | gint |
| ISO_Level5_Shift | gint |
| ISO_Lock | gint |
| ISO_Move_Line_Down | gint |
| ISO_Move_Line_Up | gint |
| ISO_Next_Group | gint |
| ISO_Next_Group_Lock | gint |
| ISO_Partial_Line_Down | gint |
| ISO_Partial_Line_Up | gint |
| ISO_Partial_Space_Left | gint |
| ISO_Partial_Space_Right | gint |
| ISO_Prev_Group | gint |
| ISO_Prev_Group_Lock | gint |
| ISO_Release_Both_Margins | gint |
| ISO_Release_Margin_Left | gint |
| ISO_Release_Margin_Right | gint |
| ISO_Set_Margin_Left | gint |
| ISO_Set_Margin_Right | gint |
| itilde | gint |
| Itilde | gint |
| J | gint |
| j | gint |
| jcircumflex | gint |
| Jcircumflex | gint |
| jot | gint |
| k | gint |
| K | gint |
| kana_a | gint |
| kana_A | gint |
| kana_CHI | gint |
| kana_closingbracket | gint |
| kana_comma | gint |
| kana_conjunctive | gint |
| kana_e | gint |
| kana_E | gint |
| kana_FU | gint |
| kana_fullstop | gint |
| kana_HA | gint |
| kana_HE | gint |
| kana_HI | gint |
| kana_HO | gint |
| kana_HU | gint |
| kana_I | gint |
| kana_i | gint |
| kana_KA | gint |
| kana_KE | gint |
| kana_KI | gint |
| kana_KO | gint |
| kana_KU | gint |
| Kana_Lock | gint |
| kana_MA | gint |
| kana_ME | gint |
| kana_MI | gint |
| kana_middledot | gint |
| kana_MO | gint |
| kana_MU | gint |
| kana_N | gint |
| kana_NA | gint |
| kana_NE | gint |
| kana_NI | gint |
| kana_NO | gint |
| kana_NU | gint |
| kana_o | gint |
| kana_O | gint |
| kana_openingbracket | gint |
| kana_RA | gint |
| kana_RE | gint |
| kana_RI | gint |
| kana_RO | gint |
| kana_RU | gint |
| kana_SA | gint |
| kana_SE | gint |
| kana_SHI | gint |
| Kana_Shift | gint |
| kana_SO | gint |
| kana_SU | gint |
| kana_switch | gint |
| kana_TA | gint |
| kana_TE | gint |
| kana_TI | gint |
| kana_TO | gint |
| kana_TSU | gint |
| kana_tsu | gint |
| kana_TU | gint |
| kana_tu | gint |
| kana_U | gint |
| kana_u | gint |
| kana_WA | gint |
| kana_WO | gint |
| kana_YA | gint |
| kana_ya | gint |
| kana_YO | gint |
| kana_yo | gint |
| kana_yu | gint |
| kana_YU | gint |
| Kanji | gint |
| Kanji_Bangou | gint |
| kappa | gint |
| Katakana | gint |
| Kcedilla | gint |
| kcedilla | gint |
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
| KEY_abelowdot | gint |
| KEY_Abelowdot | gint |
| KEY_abovedot | gint |
| KEY_abreve | gint |
| KEY_Abreve | gint |
| KEY_Abreveacute | gint |
| KEY_abreveacute | gint |
| KEY_abrevebelowdot | gint |
| KEY_Abrevebelowdot | gint |
| KEY_Abrevegrave | gint |
| KEY_abrevegrave | gint |
| KEY_abrevehook | gint |
| KEY_Abrevehook | gint |
| KEY_abrevetilde | gint |
| KEY_Abrevetilde | gint |
| KEY_AccessX_Enable | gint |
| KEY_AccessX_Feedback_Enable | gint |
| KEY_acircumflex | gint |
| KEY_Acircumflex | gint |
| KEY_acircumflexacute | gint |
| KEY_Acircumflexacute | gint |
| KEY_acircumflexbelowdot | gint |
| KEY_Acircumflexbelowdot | gint |
| KEY_acircumflexgrave | gint |
| KEY_Acircumflexgrave | gint |
| KEY_acircumflexhook | gint |
| KEY_Acircumflexhook | gint |
| KEY_acircumflextilde | gint |
| KEY_Acircumflextilde | gint |
| KEY_acute | gint |
| KEY_AddFavorite | gint |
| KEY_adiaeresis | gint |
| KEY_Adiaeresis | gint |
| KEY_ae | gint |
| KEY_AE | gint |
| KEY_agrave | gint |
| KEY_Agrave | gint |
| KEY_ahook | gint |
| KEY_Ahook | gint |
| KEY_Alt_L | gint |
| KEY_Alt_R | gint |
| KEY_amacron | gint |
| KEY_Amacron | gint |
| KEY_ampersand | gint |
| KEY_aogonek | gint |
| KEY_Aogonek | gint |
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
| KEY_Armenian_BEN | gint |
| KEY_Armenian_ben | gint |
| KEY_Armenian_but | gint |
| KEY_Armenian_CHA | gint |
| KEY_Armenian_cha | gint |
| KEY_Armenian_DA | gint |
| KEY_Armenian_da | gint |
| KEY_Armenian_DZA | gint |
| KEY_Armenian_dza | gint |
| KEY_Armenian_E | gint |
| KEY_Armenian_e | gint |
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
| KEY_Armenian_HO | gint |
| KEY_Armenian_ho | gint |
| KEY_Armenian_hyphen | gint |
| KEY_Armenian_INI | gint |
| KEY_Armenian_ini | gint |
| KEY_Armenian_JE | gint |
| KEY_Armenian_je | gint |
| KEY_Armenian_KE | gint |
| KEY_Armenian_ke | gint |
| KEY_Armenian_KEN | gint |
| KEY_Armenian_ken | gint |
| KEY_Armenian_KHE | gint |
| KEY_Armenian_khe | gint |
| KEY_Armenian_ligature_ew | gint |
| KEY_Armenian_LYUN | gint |
| KEY_Armenian_lyun | gint |
| KEY_Armenian_MEN | gint |
| KEY_Armenian_men | gint |
| KEY_Armenian_NU | gint |
| KEY_Armenian_nu | gint |
| KEY_Armenian_O | gint |
| KEY_Armenian_o | gint |
| KEY_Armenian_paruyk | gint |
| KEY_Armenian_PE | gint |
| KEY_Armenian_pe | gint |
| KEY_Armenian_PYUR | gint |
| KEY_Armenian_pyur | gint |
| KEY_Armenian_question | gint |
| KEY_Armenian_RA | gint |
| KEY_Armenian_ra | gint |
| KEY_Armenian_RE | gint |
| KEY_Armenian_re | gint |
| KEY_Armenian_SE | gint |
| KEY_Armenian_se | gint |
| KEY_Armenian_separation_mark | gint |
| KEY_Armenian_SHA | gint |
| KEY_Armenian_sha | gint |
| KEY_Armenian_shesht | gint |
| KEY_Armenian_TCHE | gint |
| KEY_Armenian_tche | gint |
| KEY_Armenian_TO | gint |
| KEY_Armenian_to | gint |
| KEY_Armenian_TSA | gint |
| KEY_Armenian_tsa | gint |
| KEY_Armenian_TSO | gint |
| KEY_Armenian_tso | gint |
| KEY_Armenian_TYUN | gint |
| KEY_Armenian_tyun | gint |
| KEY_Armenian_verjaket | gint |
| KEY_Armenian_VEV | gint |
| KEY_Armenian_vev | gint |
| KEY_Armenian_VO | gint |
| KEY_Armenian_vo | gint |
| KEY_Armenian_VYUN | gint |
| KEY_Armenian_vyun | gint |
| KEY_Armenian_YECH | gint |
| KEY_Armenian_yech | gint |
| KEY_Armenian_yentamna | gint |
| KEY_Armenian_ZA | gint |
| KEY_Armenian_za | gint |
| KEY_Armenian_ZHE | gint |
| KEY_Armenian_zhe | gint |
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
| KEY_Byelorussian_SHORTU | gint |
| KEY_Byelorussian_shortu | gint |
| KEY_c | gint |
| KEY_C | gint |
| KEY_c_h | gint |
| KEY_C_H | gint |
| KEY_C_h | gint |
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
| KEY_ch | gint |
| KEY_CH | gint |
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
| KEY_Cyrillic_a | gint |
| KEY_Cyrillic_A | gint |
| KEY_Cyrillic_BE | gint |
| KEY_Cyrillic_be | gint |
| KEY_Cyrillic_che | gint |
| KEY_Cyrillic_CHE | gint |
| KEY_Cyrillic_CHE_descender | gint |
| KEY_Cyrillic_che_descender | gint |
| KEY_Cyrillic_che_vertstroke | gint |
| KEY_Cyrillic_CHE_vertstroke | gint |
| KEY_Cyrillic_DE | gint |
| KEY_Cyrillic_de | gint |
| KEY_Cyrillic_DZHE | gint |
| KEY_Cyrillic_dzhe | gint |
| KEY_Cyrillic_e | gint |
| KEY_Cyrillic_E | gint |
| KEY_Cyrillic_EF | gint |
| KEY_Cyrillic_ef | gint |
| KEY_Cyrillic_EL | gint |
| KEY_Cyrillic_el | gint |
| KEY_Cyrillic_em | gint |
| KEY_Cyrillic_EM | gint |
| KEY_Cyrillic_en | gint |
| KEY_Cyrillic_EN | gint |
| KEY_Cyrillic_en_descender | gint |
| KEY_Cyrillic_EN_descender | gint |
| KEY_Cyrillic_ER | gint |
| KEY_Cyrillic_er | gint |
| KEY_Cyrillic_ES | gint |
| KEY_Cyrillic_es | gint |
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
| KEY_Cyrillic_I_macron | gint |
| KEY_Cyrillic_i_macron | gint |
| KEY_Cyrillic_IE | gint |
| KEY_Cyrillic_ie | gint |
| KEY_Cyrillic_IO | gint |
| KEY_Cyrillic_io | gint |
| KEY_Cyrillic_JE | gint |
| KEY_Cyrillic_je | gint |
| KEY_Cyrillic_KA | gint |
| KEY_Cyrillic_ka | gint |
| KEY_Cyrillic_KA_descender | gint |
| KEY_Cyrillic_ka_descender | gint |
| KEY_Cyrillic_KA_vertstroke | gint |
| KEY_Cyrillic_ka_vertstroke | gint |
| KEY_Cyrillic_LJE | gint |
| KEY_Cyrillic_lje | gint |
| KEY_Cyrillic_NJE | gint |
| KEY_Cyrillic_nje | gint |
| KEY_Cyrillic_O | gint |
| KEY_Cyrillic_o | gint |
| KEY_Cyrillic_O_bar | gint |
| KEY_Cyrillic_o_bar | gint |
| KEY_Cyrillic_PE | gint |
| KEY_Cyrillic_pe | gint |
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
| KEY_D | gint |
| KEY_d | gint |
| KEY_Dabovedot | gint |
| KEY_dabovedot | gint |
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
| KEY_dead_o | gint |
| KEY_dead_O | gint |
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
| KEY_Dstroke | gint |
| KEY_dstroke | gint |
| KEY_E | gint |
| KEY_e | gint |
| KEY_Eabovedot | gint |
| KEY_eabovedot | gint |
| KEY_Eacute | gint |
| KEY_eacute | gint |
| KEY_Ebelowdot | gint |
| KEY_ebelowdot | gint |
| KEY_Ecaron | gint |
| KEY_ecaron | gint |
| KEY_Ecircumflex | gint |
| KEY_ecircumflex | gint |
| KEY_Ecircumflexacute | gint |
| KEY_ecircumflexacute | gint |
| KEY_Ecircumflexbelowdot | gint |
| KEY_ecircumflexbelowdot | gint |
| KEY_Ecircumflexgrave | gint |
| KEY_ecircumflexgrave | gint |
| KEY_Ecircumflexhook | gint |
| KEY_ecircumflexhook | gint |
| KEY_Ecircumflextilde | gint |
| KEY_ecircumflextilde | gint |
| KEY_EcuSign | gint |
| KEY_Ediaeresis | gint |
| KEY_ediaeresis | gint |
| KEY_Egrave | gint |
| KEY_egrave | gint |
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
| KEY_Emacron | gint |
| KEY_emacron | gint |
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
| KEY_Eogonek | gint |
| KEY_eogonek | gint |
| KEY_equal | gint |
| KEY_Escape | gint |
| KEY_ETH | gint |
| KEY_Eth | gint |
| KEY_eth | gint |
| KEY_Etilde | gint |
| KEY_etilde | gint |
| KEY_EuroSign | gint |
| KEY_Excel | gint |
| KEY_exclam | gint |
| KEY_exclamdown | gint |
| KEY_Execute | gint |
| KEY_Explorer | gint |
| KEY_EZH | gint |
| KEY_ezh | gint |
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
| KEY_G | gint |
| KEY_g | gint |
| KEY_Gabovedot | gint |
| KEY_gabovedot | gint |
| KEY_Game | gint |
| KEY_Gbreve | gint |
| KEY_gbreve | gint |
| KEY_Gcaron | gint |
| KEY_gcaron | gint |
| KEY_Gcedilla | gint |
| KEY_gcedilla | gint |
| KEY_Gcircumflex | gint |
| KEY_gcircumflex | gint |
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
| KEY_Greek_ALPHA | gint |
| KEY_Greek_alpha | gint |
| KEY_Greek_ALPHAaccent | gint |
| KEY_Greek_alphaaccent | gint |
| KEY_Greek_BETA | gint |
| KEY_Greek_beta | gint |
| KEY_Greek_CHI | gint |
| KEY_Greek_chi | gint |
| KEY_Greek_DELTA | gint |
| KEY_Greek_delta | gint |
| KEY_Greek_EPSILON | gint |
| KEY_Greek_epsilon | gint |
| KEY_Greek_EPSILONaccent | gint |
| KEY_Greek_epsilonaccent | gint |
| KEY_Greek_ETA | gint |
| KEY_Greek_eta | gint |
| KEY_Greek_ETAaccent | gint |
| KEY_Greek_etaaccent | gint |
| KEY_Greek_finalsmallsigma | gint |
| KEY_Greek_GAMMA | gint |
| KEY_Greek_gamma | gint |
| KEY_Greek_horizbar | gint |
| KEY_Greek_IOTA | gint |
| KEY_Greek_iota | gint |
| KEY_Greek_iotaaccent | gint |
| KEY_Greek_IOTAaccent | gint |
| KEY_Greek_iotaaccentdieresis | gint |
| KEY_Greek_IOTAdiaeresis | gint |
| KEY_Greek_IOTAdieresis | gint |
| KEY_Greek_iotadieresis | gint |
| KEY_Greek_KAPPA | gint |
| KEY_Greek_kappa | gint |
| KEY_Greek_lambda | gint |
| KEY_Greek_LAMBDA | gint |
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
| KEY_Greek_omicronaccent | gint |
| KEY_Greek_OMICRONaccent | gint |
| KEY_Greek_PHI | gint |
| KEY_Greek_phi | gint |
| KEY_Greek_PI | gint |
| KEY_Greek_pi | gint |
| KEY_Greek_PSI | gint |
| KEY_Greek_psi | gint |
| KEY_Greek_rho | gint |
| KEY_Greek_RHO | gint |
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
| KEY_Greek_upsilondieresis | gint |
| KEY_Greek_UPSILONdieresis | gint |
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
| KEY_i | gint |
| KEY_I | gint |
| KEY_Iabovedot | gint |
| KEY_iacute | gint |
| KEY_Iacute | gint |
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
| KEY_igrave | gint |
| KEY_Igrave | gint |
| KEY_ihook | gint |
| KEY_Ihook | gint |
| KEY_imacron | gint |
| KEY_Imacron | gint |
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
| KEY_jcircumflex | gint |
| KEY_Jcircumflex | gint |
| KEY_jot | gint |
| KEY_k | gint |
| KEY_K | gint |
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
| KEY_kana_TSU | gint |
| KEY_kana_tsu | gint |
| KEY_kana_TU | gint |
| KEY_kana_tu | gint |
| KEY_kana_U | gint |
| KEY_kana_u | gint |
| KEY_kana_WA | gint |
| KEY_kana_WO | gint |
| KEY_kana_YA | gint |
| KEY_kana_ya | gint |
| KEY_kana_YO | gint |
| KEY_kana_yo | gint |
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
| KEY_lbelowdot | gint |
| KEY_Lbelowdot | gint |
| KEY_lcaron | gint |
| KEY_Lcaron | gint |
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
| KEY_q | gint |
| KEY_Q | gint |
| KEY_quad | gint |
| KEY_question | gint |
| KEY_questiondown | gint |
| KEY_quotedbl | gint |
| KEY_quoteleft | gint |
| KEY_quoteright | gint |
| KEY_r | gint |
| KEY_R | gint |
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
| KEY_racute | gint |
| KEY_Racute | gint |
| KEY_radical | gint |
| KEY_rcaron | gint |
| KEY_Rcaron | gint |
| KEY_rcedilla | gint |
| KEY_Rcedilla | gint |
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
| KEY_s | gint |
| KEY_S | gint |
| KEY_sabovedot | gint |
| KEY_Sabovedot | gint |
| KEY_sacute | gint |
| KEY_Sacute | gint |
| KEY_Save | gint |
| KEY_scaron | gint |
| KEY_Scaron | gint |
| KEY_scedilla | gint |
| KEY_Scedilla | gint |
| KEY_schwa | gint |
| KEY_SCHWA | gint |
| KEY_scircumflex | gint |
| KEY_Scircumflex | gint |
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
| KEY_Thorn | gint |
| KEY_THORN | gint |
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
| KEY_U | gint |
| KEY_u | gint |
| KEY_uacute | gint |
| KEY_Uacute | gint |
| KEY_ubelowdot | gint |
| KEY_Ubelowdot | gint |
| KEY_Ubreve | gint |
| KEY_ubreve | gint |
| KEY_ucircumflex | gint |
| KEY_Ucircumflex | gint |
| KEY_udiaeresis | gint |
| KEY_Udiaeresis | gint |
| KEY_udoubleacute | gint |
| KEY_Udoubleacute | gint |
| KEY_Ugrave | gint |
| KEY_ugrave | gint |
| KEY_uhook | gint |
| KEY_Uhook | gint |
| KEY_uhorn | gint |
| KEY_Uhorn | gint |
| KEY_Uhornacute | gint |
| KEY_uhornacute | gint |
| KEY_Uhornbelowdot | gint |
| KEY_uhornbelowdot | gint |
| KEY_uhorngrave | gint |
| KEY_Uhorngrave | gint |
| KEY_uhornhook | gint |
| KEY_Uhornhook | gint |
| KEY_uhorntilde | gint |
| KEY_Uhorntilde | gint |
| KEY_Ukrainian_GHE_WITH_UPTURN | gint |
| KEY_Ukrainian_ghe_with_upturn | gint |
| KEY_Ukrainian_I | gint |
| KEY_Ukrainian_i | gint |
| KEY_Ukrainian_ie | gint |
| KEY_Ukrainian_IE | gint |
| KEY_Ukrainian_YI | gint |
| KEY_Ukrainian_yi | gint |
| KEY_Ukranian_I | gint |
| KEY_Ukranian_i | gint |
| KEY_Ukranian_je | gint |
| KEY_Ukranian_JE | gint |
| KEY_Ukranian_yi | gint |
| KEY_Ukranian_YI | gint |
| KEY_umacron | gint |
| KEY_Umacron | gint |
| KEY_underbar | gint |
| KEY_underscore | gint |
| KEY_Undo | gint |
| KEY_Ungrab | gint |
| KEY_union | gint |
| KEY_Uogonek | gint |
| KEY_uogonek | gint |
| KEY_Up | gint |
| KEY_uparrow | gint |
| KEY_upcaret | gint |
| KEY_upleftcorner | gint |
| KEY_uprightcorner | gint |
| KEY_upshoe | gint |
| KEY_upstile | gint |
| KEY_uptack | gint |
| KEY_Uring | gint |
| KEY_uring | gint |
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
| KEY_Wdiaeresis | gint |
| KEY_wdiaeresis | gint |
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
| KEY_X | gint |
| KEY_x | gint |
| KEY_Xabovedot | gint |
| KEY_xabovedot | gint |
| KEY_Xfer | gint |
| KEY_y | gint |
| KEY_Y | gint |
| KEY_Yacute | gint |
| KEY_yacute | gint |
| KEY_Ybelowdot | gint |
| KEY_ybelowdot | gint |
| KEY_Ycircumflex | gint |
| KEY_ycircumflex | gint |
| KEY_Ydiaeresis | gint |
| KEY_ydiaeresis | gint |
| KEY_Yellow | gint |
| KEY_yen | gint |
| KEY_Ygrave | gint |
| KEY_ygrave | gint |
| KEY_yhook | gint |
| KEY_Yhook | gint |
| KEY_Ytilde | gint |
| KEY_ytilde | gint |
| KEY_Z | gint |
| KEY_z | gint |
| KEY_Zabovedot | gint |
| KEY_zabovedot | gint |
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
| KEY_Zstroke | gint |
| KEY_zstroke | gint |
| Korean_Won | gint |
| KP_0 | gint |
| KP_1 | gint |
| KP_2 | gint |
| KP_3 | gint |
| KP_4 | gint |
| KP_5 | gint |
| KP_6 | gint |
| KP_7 | gint |
| KP_8 | gint |
| KP_9 | gint |
| KP_Add | gint |
| KP_Begin | gint |
| KP_Decimal | gint |
| KP_Delete | gint |
| KP_Divide | gint |
| KP_Down | gint |
| KP_End | gint |
| KP_Enter | gint |
| KP_Equal | gint |
| KP_F1 | gint |
| KP_F2 | gint |
| KP_F3 | gint |
| KP_F4 | gint |
| KP_Home | gint |
| KP_Insert | gint |
| KP_Left | gint |
| KP_Multiply | gint |
| KP_Next | gint |
| KP_Page_Down | gint |
| KP_Page_Up | gint |
| KP_Prior | gint |
| KP_Right | gint |
| KP_Separator | gint |
| KP_Space | gint |
| KP_Subtract | gint |
| KP_Tab | gint |
| KP_Up | gint |
| kra | gint |
| l | gint |
| L | gint |
| L1 | gint |
| L10 | gint |
| L2 | gint |
| L3 | gint |
| L4 | gint |
| L5 | gint |
| L6 | gint |
| L7 | gint |
| L8 | gint |
| L9 | gint |
| Lacute | gint |
| lacute | gint |
| Last_Virtual_Screen | gint |
| latincross | gint |
| Lbelowdot | gint |
| lbelowdot | gint |
| lcaron | gint |
| Lcaron | gint |
| Lcedilla | gint |
| lcedilla | gint |
| Left | gint |
| leftanglebracket | gint |
| leftarrow | gint |
| leftcaret | gint |
| leftdoublequotemark | gint |
| leftmiddlecurlybrace | gint |
| leftopentriangle | gint |
| leftpointer | gint |
| leftradical | gint |
| leftshoe | gint |
| leftsinglequotemark | gint |
| leftt | gint |
| lefttack | gint |
| less | gint |
| lessthanequal | gint |
| lf | gint |
| Linefeed | gint |
| LiraSign | gint |
| logicaland | gint |
| logicalor | gint |
| lowleftcorner | gint |
| lowrightcorner | gint |
| Lstroke | gint |
| lstroke | gint |
| M | gint |
| m | gint |
| Mabovedot | gint |
| mabovedot | gint |
| Macedonia_DSE | gint |
| Macedonia_dse | gint |
| Macedonia_GJE | gint |
| Macedonia_gje | gint |
| Macedonia_KJE | gint |
| Macedonia_kje | gint |
| macron | gint |
| Mae_Koho | gint |
| MAJOR_VERSION | gint |
| malesymbol | gint |
| maltesecross | gint |
| marker | gint |
| masculine | gint |
| Massyo | gint |
| MAX_COMPOSE_LEN | gint |
| Menu | gint |
| Meta_L | gint |
| Meta_R | gint |
| MICRO_VERSION | gint |
| MillSign | gint |
| MINOR_VERSION | gint |
| minus | gint |
| minutes | gint |
| Mode_switch | gint |
| MouseKeys_Accel_Enable | gint |
| MouseKeys_Enable | gint |
| mu | gint |
| Muhenkan | gint |
| Multi_key | gint |
| MultipleCandidate | gint |
| multiply | gint |
| musicalflat | gint |
| musicalsharp | gint |
| N | gint |
| n | gint |
| nabla | gint |
| Nacute | gint |
| nacute | gint |
| NairaSign | gint |
| Ncaron | gint |
| ncaron | gint |
| Ncedilla | gint |
| ncedilla | gint |
| NewSheqelSign | gint |
| Next | gint |
| Next_Virtual_Screen | gint |
| ninesubscript | gint |
| ninesuperior | gint |
| nl | gint |
| nobreakspace | gint |
| notapproxeq | gint |
| notelementof | gint |
| notequal | gint |
| notidentical | gint |
| notsign | gint |
| Ntilde | gint |
| ntilde | gint |
| Num_Lock | gint |
| numbersign | gint |
| numerosign | gint |
| O | gint |
| o | gint |
| Oacute | gint |
| oacute | gint |
| Obarred | gint |
| obarred | gint |
| Obelowdot | gint |
| obelowdot | gint |
| Ocaron | gint |
| ocaron | gint |
| ocircumflex | gint |
| Ocircumflex | gint |
| ocircumflexacute | gint |
| Ocircumflexacute | gint |
| ocircumflexbelowdot | gint |
| Ocircumflexbelowdot | gint |
| Ocircumflexgrave | gint |
| ocircumflexgrave | gint |
| ocircumflexhook | gint |
| Ocircumflexhook | gint |
| ocircumflextilde | gint |
| Ocircumflextilde | gint |
| odiaeresis | gint |
| Odiaeresis | gint |
| Odoubleacute | gint |
| odoubleacute | gint |
| oe | gint |
| OE | gint |
| ogonek | gint |
| ograve | gint |
| Ograve | gint |
| ohook | gint |
| Ohook | gint |
| ohorn | gint |
| Ohorn | gint |
| ohornacute | gint |
| Ohornacute | gint |
| ohornbelowdot | gint |
| Ohornbelowdot | gint |
| Ohorngrave | gint |
| ohorngrave | gint |
| ohornhook | gint |
| Ohornhook | gint |
| ohorntilde | gint |
| Ohorntilde | gint |
| omacron | gint |
| Omacron | gint |
| oneeighth | gint |
| onefifth | gint |
| onehalf | gint |
| onequarter | gint |
| onesixth | gint |
| onesubscript | gint |
| onesuperior | gint |
| onethird | gint |
| ooblique | gint |
| Ooblique | gint |
| openrectbullet | gint |
| openstar | gint |
| opentribulletdown | gint |
| opentribulletup | gint |
| ordfeminine | gint |
| oslash | gint |
| Oslash | gint |
| otilde | gint |
| Otilde | gint |
| overbar | gint |
| Overlay1_Enable | gint |
| Overlay2_Enable | gint |
| overline | gint |
| p | gint |
| P | gint |
| pabovedot | gint |
| Pabovedot | gint |
| Page_Down | gint |
| Page_Up | gint |
| paragraph | gint |
| parenleft | gint |
| parenright | gint |
| partdifferential | gint |
| partialderivative | gint |
| PATH_CONFIG | utf8 |
| PATH_FACTORY | utf8 |
| PATH_IBUS | utf8 |
| PATH_INPUT_CONTEXT | utf8 |
| PATH_NOTIFICATIONS | utf8 |
| PATH_PANEL | utf8 |
| PATH_PANEL_EXTENSION_EMOJI | utf8 |
| Pause | gint |
| percent | gint |
| period | gint |
| periodcentered | gint |
| PesetaSign | gint |
| phonographcopyright | gint |
| plus | gint |
| plusminus | gint |
| Pointer_Accelerate | gint |
| Pointer_Button1 | gint |
| Pointer_Button2 | gint |
| Pointer_Button3 | gint |
| Pointer_Button4 | gint |
| Pointer_Button5 | gint |
| Pointer_Button_Dflt | gint |
| Pointer_DblClick1 | gint |
| Pointer_DblClick2 | gint |
| Pointer_DblClick3 | gint |
| Pointer_DblClick4 | gint |
| Pointer_DblClick5 | gint |
| Pointer_DblClick_Dflt | gint |
| Pointer_DfltBtnNext | gint |
| Pointer_DfltBtnPrev | gint |
| Pointer_Down | gint |
| Pointer_DownLeft | gint |
| Pointer_DownRight | gint |
| Pointer_Drag1 | gint |
| Pointer_Drag2 | gint |
| Pointer_Drag3 | gint |
| Pointer_Drag4 | gint |
| Pointer_Drag5 | gint |
| Pointer_Drag_Dflt | gint |
| Pointer_EnableKeys | gint |
| Pointer_Left | gint |
| Pointer_Right | gint |
| Pointer_Up | gint |
| Pointer_UpLeft | gint |
| Pointer_UpRight | gint |
| prescription | gint |
| Prev_Virtual_Screen | gint |
| PreviousCandidate | gint |
| Print | gint |
| Prior | gint |
| prolongedsound | gint |
| punctspace | gint |
| q | gint |
| Q | gint |
| quad | gint |
| question | gint |
| questiondown | gint |
| quotedbl | gint |
| quoteleft | gint |
| quoteright | gint |
| r | gint |
| R | gint |
| R1 | gint |
| R10 | gint |
| R11 | gint |
| R12 | gint |
| R13 | gint |
| R14 | gint |
| R15 | gint |
| R2 | gint |
| R3 | gint |
| R4 | gint |
| R5 | gint |
| R6 | gint |
| R7 | gint |
| R8 | gint |
| R9 | gint |
| racute | gint |
| Racute | gint |
| radical | gint |
| rcaron | gint |
| Rcaron | gint |
| rcedilla | gint |
| Rcedilla | gint |
| Redo | gint |
| registered | gint |
| RepeatKeys_Enable | gint |
| Return | gint |
| Right | gint |
| rightanglebracket | gint |
| rightarrow | gint |
| rightcaret | gint |
| rightdoublequotemark | gint |
| rightmiddlecurlybrace | gint |
| rightmiddlesummation | gint |
| rightopentriangle | gint |
| rightpointer | gint |
| rightshoe | gint |
| rightsinglequotemark | gint |
| rightt | gint |
| righttack | gint |
| Romaji | gint |
| RupeeSign | gint |
| s | gint |
| S | gint |
| sabovedot | gint |
| Sabovedot | gint |
| sacute | gint |
| Sacute | gint |
| scaron | gint |
| Scaron | gint |
| scedilla | gint |
| Scedilla | gint |
| schwa | gint |
| SCHWA | gint |
| scircumflex | gint |
| Scircumflex | gint |
| script_switch | gint |
| Scroll_Lock | gint |
| seconds | gint |
| section | gint |
| Select | gint |
| semicolon | gint |
| semivoicedsound | gint |
| Serbian_DJE | gint |
| Serbian_dje | gint |
| Serbian_DZE | gint |
| Serbian_dze | gint |
| Serbian_JE | gint |
| Serbian_je | gint |
| Serbian_LJE | gint |
| Serbian_lje | gint |
| Serbian_NJE | gint |
| Serbian_nje | gint |
| Serbian_TSHE | gint |
| Serbian_tshe | gint |
| SERVICE_CONFIG | utf8 |
| SERVICE_IBUS | utf8 |
| SERVICE_NOTIFICATIONS | utf8 |
| SERVICE_PANEL | utf8 |
| SERVICE_PANEL_EXTENSION | utf8 |
| SERVICE_PANEL_EXTENSION_EMOJI | utf8 |
| SERVICE_PORTAL | utf8 |
| seveneighths | gint |
| sevensubscript | gint |
| sevensuperior | gint |
| Shift_L | gint |
| Shift_Lock | gint |
| Shift_R | gint |
| signaturemark | gint |
| signifblank | gint |
| similarequal | gint |
| SingleCandidate | gint |
| singlelowquotemark | gint |
| sixsubscript | gint |
| sixsuperior | gint |
| slash | gint |
| SlowKeys_Enable | gint |
| soliddiamond | gint |
| space | gint |
| squareroot | gint |
| ssharp | gint |
| sterling | gint |
| StickyKeys_Enable | gint |
| stricteq | gint |
| Super_L | gint |
| Super_R | gint |
| Sys_Req | gint |
| t | gint |
| T | gint |
| Tab | gint |
| tabovedot | gint |
| Tabovedot | gint |
| tcaron | gint |
| Tcaron | gint |
| tcedilla | gint |
| Tcedilla | gint |
| telephone | gint |
| telephonerecorder | gint |
| Terminate_Server | gint |
| Thai_baht | gint |
| Thai_bobaimai | gint |
| Thai_chochan | gint |
| Thai_chochang | gint |
| Thai_choching | gint |
| Thai_chochoe | gint |
| Thai_dochada | gint |
| Thai_dodek | gint |
| Thai_fofa | gint |
| Thai_fofan | gint |
| Thai_hohip | gint |
| Thai_honokhuk | gint |
| Thai_khokhai | gint |
| Thai_khokhon | gint |
| Thai_khokhuat | gint |
| Thai_khokhwai | gint |
| Thai_khorakhang | gint |
| Thai_kokai | gint |
| Thai_lakkhangyao | gint |
| Thai_lekchet | gint |
| Thai_lekha | gint |
| Thai_lekhok | gint |
| Thai_lekkao | gint |
| Thai_leknung | gint |
| Thai_lekpaet | gint |
| Thai_leksam | gint |
| Thai_leksi | gint |
| Thai_leksong | gint |
| Thai_leksun | gint |
| Thai_lochula | gint |
| Thai_loling | gint |
| Thai_lu | gint |
| Thai_maichattawa | gint |
| Thai_maiek | gint |
| Thai_maihanakat | gint |
| Thai_maihanakat_maitho | gint |
| Thai_maitaikhu | gint |
| Thai_maitho | gint |
| Thai_maitri | gint |
| Thai_maiyamok | gint |
| Thai_moma | gint |
| Thai_ngongu | gint |
| Thai_nikhahit | gint |
| Thai_nonen | gint |
| Thai_nonu | gint |
| Thai_oang | gint |
| Thai_paiyannoi | gint |
| Thai_phinthu | gint |
| Thai_phophan | gint |
| Thai_phophung | gint |
| Thai_phosamphao | gint |
| Thai_popla | gint |
| Thai_rorua | gint |
| Thai_ru | gint |
| Thai_saraa | gint |
| Thai_saraaa | gint |
| Thai_saraae | gint |
| Thai_saraaimaimalai | gint |
| Thai_saraaimaimuan | gint |
| Thai_saraam | gint |
| Thai_sarae | gint |
| Thai_sarai | gint |
| Thai_saraii | gint |
| Thai_sarao | gint |
| Thai_sarau | gint |
| Thai_saraue | gint |
| Thai_sarauee | gint |
| Thai_sarauu | gint |
| Thai_sorusi | gint |
| Thai_sosala | gint |
| Thai_soso | gint |
| Thai_sosua | gint |
| Thai_thanthakhat | gint |
| Thai_thonangmontho | gint |
| Thai_thophuthao | gint |
| Thai_thothahan | gint |
| Thai_thothan | gint |
| Thai_thothong | gint |
| Thai_thothung | gint |
| Thai_topatak | gint |
| Thai_totao | gint |
| Thai_wowaen | gint |
| Thai_yoyak | gint |
| Thai_yoying | gint |
| therefore | gint |
| thinspace | gint |
| thorn | gint |
| THORN | gint |
| Thorn | gint |
| threeeighths | gint |
| threefifths | gint |
| threequarters | gint |
| threesubscript | gint |
| threesuperior | gint |
| tintegral | gint |
| topintegral | gint |
| topleftparens | gint |
| topleftradical | gint |
| topleftsqbracket | gint |
| topleftsummation | gint |
| toprightparens | gint |
| toprightsqbracket | gint |
| toprightsummation | gint |
| topt | gint |
| topvertsummationconnector | gint |
| Touroku | gint |
| trademark | gint |
| trademarkincircle | gint |
| tslash | gint |
| Tslash | gint |
| twofifths | gint |
| twosubscript | gint |
| twosuperior | gint |
| twothirds | gint |
| u | gint |
| U | gint |
| uacute | gint |
| Uacute | gint |
| ubelowdot | gint |
| Ubelowdot | gint |
| ubreve | gint |
| Ubreve | gint |
| ucircumflex | gint |
| Ucircumflex | gint |
| Udiaeresis | gint |
| udiaeresis | gint |
| udoubleacute | gint |
| Udoubleacute | gint |
| ugrave | gint |
| Ugrave | gint |
| uhook | gint |
| Uhook | gint |
| uhorn | gint |
| Uhorn | gint |
| uhornacute | gint |
| Uhornacute | gint |
| uhornbelowdot | gint |
| Uhornbelowdot | gint |
| uhorngrave | gint |
| Uhorngrave | gint |
| uhornhook | gint |
| Uhornhook | gint |
| uhorntilde | gint |
| Uhorntilde | gint |
| Ukrainian_GHE_WITH_UPTURN | gint |
| Ukrainian_ghe_with_upturn | gint |
| Ukrainian_I | gint |
| Ukrainian_i | gint |
| Ukrainian_IE | gint |
| Ukrainian_ie | gint |
| Ukrainian_YI | gint |
| Ukrainian_yi | gint |
| Ukranian_I | gint |
| Ukranian_i | gint |
| Ukranian_JE | gint |
| Ukranian_je | gint |
| Ukranian_YI | gint |
| Ukranian_yi | gint |
| umacron | gint |
| Umacron | gint |
| underbar | gint |
| underscore | gint |
| Undo | gint |
| union | gint |
| uogonek | gint |
| Uogonek | gint |
| Up | gint |
| uparrow | gint |
| upcaret | gint |
| upleftcorner | gint |
| uprightcorner | gint |
| upshoe | gint |
| upstile | gint |
| uptack | gint |
| uring | gint |
| Uring | gint |
| utilde | gint |
| Utilde | gint |
| V | gint |
| v | gint |
| variation | gint |
| vertbar | gint |
| vertconnector | gint |
| voicedsound | gint |
| VoidSymbol | gint |
| vt | gint |
| w | gint |
| W | gint |
| wacute | gint |
| Wacute | gint |
| wcircumflex | gint |
| Wcircumflex | gint |
| wdiaeresis | gint |
| Wdiaeresis | gint |
| wgrave | gint |
| Wgrave | gint |
| WonSign | gint |
| x | gint |
| X | gint |
| xabovedot | gint |
| Xabovedot | gint |
| y | gint |
| Y | gint |
| yacute | gint |
| Yacute | gint |
| ybelowdot | gint |
| Ybelowdot | gint |
| ycircumflex | gint |
| Ycircumflex | gint |
| ydiaeresis | gint |
| Ydiaeresis | gint |
| yen | gint |
| ygrave | gint |
| Ygrave | gint |
| yhook | gint |
| Yhook | gint |
| ytilde | gint |
| Ytilde | gint |
| z | gint |
| Z | gint |
| zabovedot | gint |
| Zabovedot | gint |
| zacute | gint |
| Zacute | gint |
| zcaron | gint |
| Zcaron | gint |
| Zen_Koho | gint |
| Zenkaku | gint |
| Zenkaku_Hankaku | gint |
| zerosubscript | gint |
| zerosuperior | gint |
| zstroke | gint |
| Zstroke | gint |

