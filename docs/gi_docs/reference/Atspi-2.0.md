# Atspi 2.0

SQGI import: `import("Atspi", "2.0")`

Packages: `atspi-2`
Includes: `DBus-1.0`, `GLib-2.0`, `GObject-2.0`
Libraries: `libatspi.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 12 |
| Interfaces | 12 |
| Records | 23 |
| Unions | 0 |
| Enums | 18 |
| Flags | 2 |
| Functions | 24 |
| Callbacks | 6 |
| Constants | 46 |
| Aliases | 5 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Accessible | Object | 0 | 2 | 50 | The base interface which is implemented by all accessible objects. All objects support interfaces for querying their contained 'children' and posit... |
| Application | GObject.Object | 0 | 0 | 0 | An interface identifying the root object associated with a running application. An interface identifying an object which is the root of the hierarc... |
| Device | GObject.Object | 2 | 0 | 13 | Creates a new #AtspiDevice with a specified callback function. |
| DeviceLegacy | Device | 0 | 0 | 1 | Creates a new #AtspiDeviceLegacy. |
| DeviceListener | GObject.Object | 0 | 0 | 4 | Creates a new #AtspiDeviceListener with a specified callback function. |
| DeviceX11 | Device | 0 | 0 | 1 | Creates a new #AtspiDeviceX11. |
| EventListener | GObject.Object | 0 | 0 | 12 | A generic interface implemented by objects for the receipt of event notifications. A generic interface implemented by objects for the receipt of ev... |
| Hyperlink | Object | 0 | 0 | 7 | Instances of atspi-hyperlink are the means by which end users and clients interact with linked content. Instances of atspi-hyperlink are returned b... |
| MatchRule | GObject.Object | 0 | 0 | 1 | An interface that allows the definition of match rules for accessible objects. |
| Object | GObject.Object | 2 | 0 | 0 |  |
| Relation | GObject.Object | 0 | 0 | 3 | An interface via which non-hierarchical relationships are indicated. An interface via which non-hierarchical relationships are indicated. An instan... |
| StateSet | GObject.Object | 0 | 0 | 9 | The atspi-stateset objects implement wrappers around a bitmap of accessible states. |

### Atspi.Accessible

Parent: `Object` ?? Implements: `Action`, `Collection`, `Component`, `Document`, `EditableText`, `Hypertext`, `Image`, `Selection`, `Table`, `TableCell`, `Text`, `Value` ?? GType: `AtspiAccessible` ?? C type: `AtspiAccessible`

The base interface which is implemented by all accessible objects. All objects support interfaces for querying their contained 'children' and posit...

#### Fields

| Field | Type |
| --- | --- |
| accessible_parent | Accessible |
| attributes | GLib.HashTable |
| cached_properties | guint |
| children | gpointer |
| description | utf8 |
| interfaces | gint |
| name | utf8 |
| parent | Object |
| priv | AccessiblePrivate |
| role | Role |
| states | StateSet |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_cache | `Accessible.clear_cache() -> none` | atspi_accessible_clear_cache |  | Clears the cached information for the given accessible and all of its descendants. |
| clear_cache_single | `Accessible.clear_cache_single() -> none` | atspi_accessible_clear_cache_single |  | Clears the cached information only for the given accessible. |
| get_accessible_id | `Accessible.get_accessible_id() -> utf8 throws` | atspi_accessible_get_accessible_id | 2.34 | Gets the accessible id of the accessible. This is not meant to be presented to the user, but to be an id which is stable over application developme... |
| get_action | `Accessible.get_action() -> Action` | atspi_accessible_get_action |  | Gets the #AtspiAction interface for an #AtspiAccessible. |
| get_action_iface | `Accessible.get_action_iface() -> Action` | atspi_accessible_get_action_iface |  | Gets the #AtspiAction interface for an #AtspiAccessible. |
| get_application | `Accessible.get_application() -> Accessible throws` | atspi_accessible_get_application |  | Gets the containing #AtspiApplication for an object. |
| get_atspi_version | `Accessible.get_atspi_version() -> utf8 throws` | atspi_accessible_get_atspi_version |  | Gets the AT-SPI IPC specification version supported by the application pointed to by the #AtspiAccessible object. Only works on application root ob... |
| get_attributes | `Accessible.get_attributes() -> GLib.HashTable throws` | atspi_accessible_get_attributes |  | Gets the #AttributeSet representing any assigned name-value pair attributes or annotations for this object. For typographic, textual, or textually-... |
| get_attributes_as_array | `Accessible.get_attributes_as_array() -> utf8 throws` | atspi_accessible_get_attributes_as_array |  | Gets a #GArray representing any assigned name-value pair attributes or annotations for this object. For typographic, textual, or textually-semantic... |
| get_child_at_index | `Accessible.get_child_at_index(child_index: gint) -> Accessible throws` | atspi_accessible_get_child_at_index |  | Gets the #AtspiAccessible child of an #AtspiAccessible object at a given index. |
| get_child_count | `Accessible.get_child_count() -> gint throws` | atspi_accessible_get_child_count |  | Gets the number of children contained by an #AtspiAccessible object. |
| get_collection | `Accessible.get_collection() -> Collection` | atspi_accessible_get_collection |  | Gets the #AtspiCollection interface for an #AtspiAccessible. |
| get_collection_iface | `Accessible.get_collection_iface() -> Collection` | atspi_accessible_get_collection_iface |  | Gets the #AtspiCollection interface for an #AtspiAccessible. |
| get_component | `Accessible.get_component() -> Component` | atspi_accessible_get_component |  | Gets the #AtspiComponent interface for an #AtspiAccessible. |
| get_component_iface | `Accessible.get_component_iface() -> Component` | atspi_accessible_get_component_iface |  | Gets the #AtspiComponent interface for an #AtspiAccessible. |
| get_description | `Accessible.get_description() -> utf8 throws` | atspi_accessible_get_description |  | Gets the description of an #AtspiAccessible object. |
| get_document | `Accessible.get_document() -> Document` | atspi_accessible_get_document |  | Gets the #AtspiDocument interface for an #AtspiAccessible. |
| get_document_iface | `Accessible.get_document_iface() -> Document` | atspi_accessible_get_document_iface |  | Gets the #AtspiDocument interface for an #AtspiAccessible. |
| get_editable_text | `Accessible.get_editable_text() -> EditableText` | atspi_accessible_get_editable_text |  | Gets the #AtspiEditableText interface for an #AtspiAccessible. |
| get_editable_text_iface | `Accessible.get_editable_text_iface() -> EditableText` | atspi_accessible_get_editable_text_iface |  | Gets the #AtspiEditableText interface for an #AtspiAccessible. |
| get_help_text | `Accessible.get_help_text() -> utf8 throws` | atspi_accessible_get_help_text | 2.52 | Gets the help text associated with the accessible, if set. When this is present, it provides information that a screen reader can relay to the user... |
| get_hyperlink | `Accessible.get_hyperlink() -> Hyperlink` | atspi_accessible_get_hyperlink |  | Gets the #AtspiHyperlink interface for an #AtspiAccessible. |
| get_hypertext | `Accessible.get_hypertext() -> Hypertext` | atspi_accessible_get_hypertext |  | Gets the #AtspiHypertext interface for an #AtspiAccessible. |
| get_hypertext_iface | `Accessible.get_hypertext_iface() -> Hypertext` | atspi_accessible_get_hypertext_iface |  | Gets the #AtspiHypertext interface for an #AtspiAccessible. |
| get_id | `Accessible.get_id() -> gint throws` | atspi_accessible_get_id |  | Gets the application id for a #AtspiAccessible object. Only works on application root objects. |
| get_image | `Accessible.get_image() -> Image` | atspi_accessible_get_image |  | Gets the #AtspiImage interface for an #AtspiAccessible. |
| get_image_iface | `Accessible.get_image_iface() -> Image` | atspi_accessible_get_image_iface |  | Gets the #AtspiImage interface for an #AtspiAccessible. |
| get_index_in_parent | `Accessible.get_index_in_parent() -> gint throws` | atspi_accessible_get_index_in_parent |  | Gets the index of an #AtspiAccessible object within its parent's #AtspiAccessible children list. |
| get_interfaces | `Accessible.get_interfaces() -> utf8` | atspi_accessible_get_interfaces |  | A set of pointers to all interfaces supported by an #AtspiAccessible. |
| get_localized_role_name | `Accessible.get_localized_role_name() -> utf8 throws` | atspi_accessible_get_localized_role_name |  | Gets a UTF-8 string corresponding to the name of the role played by an object, translated to the current locale. This method will return useful val... |
| get_name | `Accessible.get_name() -> utf8 throws` | atspi_accessible_get_name |  | Gets the name of an #AtspiAccessible object. |
| get_object_locale | `Accessible.get_object_locale() -> utf8 throws` | atspi_accessible_get_object_locale |  |  |
| get_parent | `Accessible.get_parent() -> Accessible throws` | atspi_accessible_get_parent |  | Gets an #AtspiAccessible object's parent container. |
| get_process_id | `Accessible.get_process_id() -> guint throws` | atspi_accessible_get_process_id |  | Returns the process id associated with the given accessible. Mainly added for debugging; it is a shortcut to explicitly querying the accessible's a... |
| get_relation_set | `Accessible.get_relation_set() -> Relation throws` | atspi_accessible_get_relation_set |  | Gets the set of #AtspiRelation objects which describes this #AtspiAccessible object's relationships with other #AtspiAccessible objects. |
| get_role | `Accessible.get_role() -> Role throws` | atspi_accessible_get_role |  | Gets the UI role played by an #AtspiAccessible object. This role's name can be obtained via atspi_accessible_get_role_name (). |
| get_role_name | `Accessible.get_role_name() -> utf8 throws` | atspi_accessible_get_role_name |  | Gets a UTF-8 string corresponding to the name of the role played by an object. This method will return useful values for roles that fall outside th... |
| get_selection | `Accessible.get_selection() -> Selection` | atspi_accessible_get_selection |  | Gets the #AtspiSelection interface for an #AtspiAccessible. |
| get_selection_iface | `Accessible.get_selection_iface() -> Selection` | atspi_accessible_get_selection_iface |  | Gets the #AtspiSelection interface for an #AtspiAccessible. |
| get_state_set | `Accessible.get_state_set() -> StateSet` | atspi_accessible_get_state_set |  | Gets the states currently held by an object. |
| get_table | `Accessible.get_table() -> Table` | atspi_accessible_get_table |  | Gets the #AtspiTable interface for an #AtspiAccessible. |
| get_table_cell | `Accessible.get_table_cell() -> TableCell` | atspi_accessible_get_table_cell |  | Gets the #AtspiTableCell interface for an #AtspiAccessible. |
| get_table_iface | `Accessible.get_table_iface() -> Table` | atspi_accessible_get_table_iface |  | Gets the #AtspiTable interface for an #AtspiAccessible. |
| get_text | `Accessible.get_text() -> Text` | atspi_accessible_get_text |  | Gets the #AtspiTable interface for an #AtspiAccessible. |
| get_text_iface | `Accessible.get_text_iface() -> Text` | atspi_accessible_get_text_iface |  | Gets the #AtspiTable interface for an #AtspiAccessible. |
| get_toolkit_name | `Accessible.get_toolkit_name() -> utf8 throws` | atspi_accessible_get_toolkit_name |  | Gets the toolkit name for an #AtspiAccessible object. Only works on application root objects. |
| get_toolkit_version | `Accessible.get_toolkit_version() -> utf8 throws` | atspi_accessible_get_toolkit_version |  | Gets the toolkit version for an #AtspiAccessible object. Only works on application root objects. |
| get_value | `Accessible.get_value() -> Value` | atspi_accessible_get_value |  | Gets the #AtspiTable interface for an #AtspiAccessible. |
| get_value_iface | `Accessible.get_value_iface() -> Value` | atspi_accessible_get_value_iface |  | Gets the #AtspiTable interface for an #AtspiAccessible. |
| set_cache_mask | `Accessible.set_cache_mask(mask: Cache) -> none` | atspi_accessible_set_cache_mask |  | Sets the type of data to cache for accessibles. If this is not set for an application or is reset to ATSPI_CACHE_UNDEFINED, then the desktop's cach... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| mode-changed | `arg1: gint, why: utf8` | none | last detailed |  | The signal "mode-changed" is emitted by a screen reader to indicate that its mode has changed. This signal supports the following details: focus-tr... |
| region-changed | `arg1: gint, arg2: gint` | none | last |  | The signal "region-changed" is emitted by a screen reader to indicate that it is now reading or tracking a new object, or, a new piece of text with... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| mode_changed | `mode_changed(enabled: gboolean) -> none` |  |  |  |
| region_changed | `region_changed(current_offset: gint, last_offset: gint) -> none` |  |  |  |

### Atspi.Application

Parent: `GObject.Object` ?? GType: `AtspiApplication` ?? C type: `AtspiApplication`

An interface identifying the root object associated with a running application. An interface identifying an object which is the root of the hierarc...

#### Fields

| Field | Type |
| --- | --- |
| atspi_version | utf8 |
| bus | DBus.Connection |
| bus_name | utf8 |
| cache | Cache |
| hash | GLib.HashTable |
| parent | GObject.Object |
| root | gpointer |
| time_added | gpointer |
| toolkit_name | utf8 |
| toolkit_version | utf8 |

### Atspi.Device

Parent: `GObject.Object` ?? Subclasses: `DeviceLegacy`, `DeviceX11` ?? GType: `AtspiDevice` ?? C type: `AtspiDevice`

Creates a new #AtspiDevice with a specified callback function.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Device.new() -> Device` | atspi_device_new |  | Creates a new #AtspiDevice with a specified callback function. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_key_grab | `Device.add_key_grab(kd: KeyDefinition, callback: KeyCallback?, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify) -> guint` | atspi_device_add_key_grab |  | an identifier that can be later used to remove the grab, or 0 if the key/modifier combination could not be grabbed. Add a key grab for the given ke... |
| add_key_watcher | `Device.add_key_watcher(callback: KeyCallback?, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify) -> none` | atspi_device_add_key_watcher |  | Add a callback that will receive a notification whenever a key is pressed or released. |
| generate_mouse_event | `Device.generate_mouse_event(obj: Accessible, x: gint, y: gint, name: utf8) -> none throws` | atspi_device_generate_mouse_event | 2.52 | Synthesizes a mouse event at a specific screen coordinate. Most AT clients should use the #AccessibleAction interface when tempted to generate mous... |
| get_grab_by_id | `Device.get_grab_by_id(id: guint) -> KeyDefinition` | atspi_device_get_grab_by_id |  |  |
| get_locked_modifiers | `Device.get_locked_modifiers() -> guint` | atspi_device_get_locked_modifiers |  | Returns the locked modifiers (ie, num lock, caps lock) associated with this keyboard. |
| get_modifier | `Device.get_modifier(keycode: gint) -> guint` | atspi_device_get_modifier |  | Gets the modifier for a given keycode, if one exists. Does not create a new mapping. This function should be used when the intention is to query a ... |
| grab_keyboard | `Device.grab_keyboard() -> gboolean` | atspi_device_grab_keyboard |  | Attempts to grab the entire keyboard. This should only be done temporarily, as it may conflict with other applications that also want to grab the k... |
| map_modifier | `Device.map_modifier(keycode: gint) -> guint` | atspi_device_map_modifier |  | Maps the specified key code to a modifier so that it can be used in conjunction with other keys to create a key grab. If the given keycode is alrea... |
| notify_key | `Device.notify_key(pressed: gboolean, keycode: gint, keysym: gint, state: gint, text: utf8) -> gboolean` | atspi_device_notify_key |  |  |
| remove_key_grab | `Device.remove_key_grab(id: guint) -> none` | atspi_device_remove_key_grab |  | Removes the key grab specified by @id. |
| ungrab_keyboard | `Device.ungrab_keyboard() -> none` | atspi_device_ungrab_keyboard |  | Removes a keyboard grab added via a call to atspi_device_add_keyboard. |
| unmap_modifier | `Device.unmap_modifier(keycode: gint) -> none` | atspi_device_unmap_modifier |  | Removes a mapped modifier from the given keycode. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_key_grab | `add_key_grab(kd: KeyDefinition) -> gboolean` |  |  |  |
| generate_mouse_event | `generate_mouse_event(obj: Accessible, x: gint, y: gint, name: utf8) -> none throws` |  | 2.52 | Synthesizes a mouse event at a specific screen coordinate. Most AT clients should use the #AccessibleAction interface when tempted to generate mous... |
| get_locked_modifiers | `get_locked_modifiers() -> guint` |  |  | Returns the locked modifiers (ie, num lock, caps lock) associated with this keyboard. |
| get_modifier | `get_modifier(keycode: gint) -> guint` |  |  | Gets the modifier for a given keycode, if one exists. Does not create a new mapping. This function should be used when the intention is to query a ... |
| grab_keyboard | `grab_keyboard() -> gboolean` |  |  | Attempts to grab the entire keyboard. This should only be done temporarily, as it may conflict with other applications that also want to grab the k... |
| map_modifier | `map_modifier(keycode: gint) -> guint` |  |  | Maps the specified key code to a modifier so that it can be used in conjunction with other keys to create a key grab. If the given keycode is alrea... |
| remove_key_grab | `remove_key_grab(id: guint) -> none` |  |  | Removes the key grab specified by @id. |
| ungrab_keyboard | `ungrab_keyboard() -> none` |  |  | Removes a keyboard grab added via a call to atspi_device_add_keyboard. |
| unmap_modifier | `unmap_modifier(keycode: gint) -> none` |  |  | Removes a mapped modifier from the given keycode. |

### Atspi.DeviceLegacy

Parent: `Device` ?? GType: `AtspiDeviceLegacy` ?? C type: `AtspiDeviceLegacy`

Creates a new #AtspiDeviceLegacy.

#### Fields

| Field | Type |
| --- | --- |
| parent | Device |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DeviceLegacy.new() -> DeviceLegacy` | atspi_device_legacy_new |  | Creates a new #AtspiDeviceLegacy. |

### Atspi.DeviceListener

Parent: `GObject.Object` ?? GType: `AtspiDeviceListener` ?? C type: `AtspiDeviceListener`

Creates a new #AtspiDeviceListener with a specified callback function.

#### Fields

| Field | Type |
| --- | --- |
| callbacks | GLib.List |
| id | guint |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DeviceListener.new(callback: DeviceListenerCB, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify) -> DeviceListener` | atspi_device_listener_new |  | Creates a new #AtspiDeviceListener with a specified callback function. |
| new_simple | `DeviceListener.new_simple(callback: DeviceListenerSimpleCB, callback_destroyed: GLib.DestroyNotify) -> DeviceListener` | atspi_device_listener_new_simple |  | Creates a new #AtspiDeviceListener with a specified callback function. This method is similar to #atspi_device_listener_new, but callback takes no ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_callback | `DeviceListener.add_callback(callback: DeviceListenerCB, callback_destroyed: GLib.DestroyNotify, user_data: gpointer?) -> none` | atspi_device_listener_add_callback |  | Adds an in-process callback function to an existing #AtspiDeviceListener. |
| remove_callback | `DeviceListener.remove_callback(callback: DeviceListenerCB) -> none` | atspi_device_listener_remove_callback |  | Removes an in-process callback function from an existing #AtspiDeviceListener. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| device_event | `device_event(event: DeviceEvent) -> gboolean` |  |  |  |

### Atspi.DeviceX11

Parent: `Device` ?? GType: `AtspiDeviceX11` ?? C type: `AtspiDeviceX11`

Creates a new #AtspiDeviceX11.

#### Fields

| Field | Type |
| --- | --- |
| parent | Device |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `DeviceX11.new() -> DeviceX11` | atspi_device_x11_new |  | Creates a new #AtspiDeviceX11. |

### Atspi.EventListener

Parent: `GObject.Object` ?? GType: `AtspiEventListener` ?? C type: `AtspiEventListener`

A generic interface implemented by objects for the receipt of event notifications. A generic interface implemented by objects for the receipt of ev...

#### Fields

| Field | Type |
| --- | --- |
| callback | EventListenerCB |
| cb_destroyed | GLib.DestroyNotify |
| parent | GObject.Object |
| user_data | gpointer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `EventListener.new(callback: EventListenerCB, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify) -> EventListener` | atspi_event_listener_new |  | Creates a new #AtspiEventListener associated with a specified @callback. |
| new_simple | `EventListener.new_simple(callback: EventListenerSimpleCB, callback_destroyed: GLib.DestroyNotify) -> EventListener` | atspi_event_listener_new_simple |  | Creates a new #AtspiEventListener associated with a specified @callback. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deregister_from_callback | `deregister_from_callback(callback: EventListenerCB, user_data: gpointer?, event_type: utf8) -> gboolean throws` | atspi_event_listener_deregister_from_callback |  | Deregisters an #AtspiEventListenerCB from the registry, for a specific event type. |
| deregister_no_data | `deregister_no_data(callback: EventListenerSimpleCB, event_type: utf8) -> gboolean throws` | atspi_event_listener_deregister_no_data |  | deregisters an #AtspiEventListenerSimpleCB from the registry, for a specific event type. |
| register_from_callback | `register_from_callback(callback: EventListenerCB, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify, event_type: utf8) -> gboolean throws` | atspi_event_listener_register_from_callback |  | Registers an #AtspiEventListenerCB against an @event_type. |
| register_from_callback_full | `register_from_callback_full(callback: EventListenerCB?, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify, event_type: utf8, properties: utf8) -> gboolean throws` | atspi_event_listener_register_from_callback_full |  | #TRUE if successful, otherwise #FALSE. |
| register_from_callback_with_app | `register_from_callback_with_app(callback: EventListenerCB?, user_data: gpointer?, callback_destroyed: GLib.DestroyNotify, event_type: utf8, properties: utf8, app: Accessible?) -> gboolean throws` | atspi_event_listener_register_from_callback_with_app |  | #TRUE if successful, otherwise #FALSE. |
| register_no_data | `register_no_data(callback: EventListenerSimpleCB, callback_destroyed: GLib.DestroyNotify, event_type: utf8) -> gboolean throws` | atspi_event_listener_register_no_data |  | Registers an #AtspiEventListenetSimpleCB. The method is similar to #atspi_event_listener_register, but @callback takes no user_data. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| deregister | `EventListener.deregister(event_type: utf8) -> gboolean throws` | atspi_event_listener_deregister |  | Deregisters an #AtspiEventListener from the registry, for a specific event type. |
| register | `EventListener.register(event_type: utf8) -> gboolean throws` | atspi_event_listener_register |  | Adds an in-process callback function to an existing #AtspiEventListener. Legal object event types: (property change events) object:property-change ... |
| register_full | `EventListener.register_full(event_type: utf8, properties: utf8?) -> gboolean throws` | atspi_event_listener_register_full |  | Adds an in-process callback function to an existing #AtspiEventListener. |
| register_with_app | `EventListener.register_with_app(event_type: utf8, properties: utf8?, app: Accessible?) -> gboolean throws` | atspi_event_listener_register_with_app |  | Adds an in-process callback function to an existing #AtspiEventListener. |

### Atspi.Hyperlink

Parent: `Object` ?? GType: `AtspiHyperlink` ?? C type: `AtspiHyperlink`

Instances of atspi-hyperlink are the means by which end users and clients interact with linked content. Instances of atspi-hyperlink are returned b...

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_end_index | `Hyperlink.get_end_index() -> gint throws` | atspi_hyperlink_get_end_index |  | Gets the ending character offset of the text range associated with an #AtspiHyperlink, in its originating #AtspiHypertext. |
| get_index_range | `Hyperlink.get_index_range() -> Range throws` | atspi_hyperlink_get_index_range |  | Gets the starting and ending character offsets of the text range associated with an #AtspiHyperlink, in its originating #AtspiHypertext. |
| get_n_anchors | `Hyperlink.get_n_anchors() -> gint throws` | atspi_hyperlink_get_n_anchors |  | Gets the total number of anchors which an #AtspiHyperlink implementor has. Though typical hyperlinks have only one anchor, client-side image maps a... |
| get_object | `Hyperlink.get_object(i: gint) -> Accessible throws` | atspi_hyperlink_get_object |  | Gets the object associated with a particular hyperlink anchor, as an #AtspiAccessible. |
| get_start_index | `Hyperlink.get_start_index() -> gint throws` | atspi_hyperlink_get_start_index |  | Gets the starting character offset of the text range associated with an #AtspiHyperlink, in its originating #AtspiHypertext. |
| get_uri | `Hyperlink.get_uri(i: gint) -> utf8 throws` | atspi_hyperlink_get_uri |  | Gets the URI associated with a particular hyperlink anchor. |
| is_valid | `Hyperlink.is_valid() -> gboolean throws` | atspi_hyperlink_is_valid |  | Tells whether an #AtspiHyperlink object is still valid with respect to its originating hypertext object. |

### Atspi.MatchRule

Parent: `GObject.Object` ?? GType: `AtspiMatchRule` ?? C type: `AtspiMatchRule`

An interface that allows the definition of match rules for accessible objects.

#### Fields

| Field | Type |
| --- | --- |
| attributematchtype | CollectionMatchType |
| attributes | GLib.HashTable |
| interfacematchtype | CollectionMatchType |
| interfaces | gpointer |
| invert | gboolean |
| parent | GObject.Object |
| rolematchtype | CollectionMatchType |
| roles | gint |
| statematchtype | CollectionMatchType |
| states | StateSet |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `MatchRule.new(states: StateSet, statematchtype: CollectionMatchType, attributes: GLib.HashTable, attributematchtype: CollectionMatchType, roles: Role, rolematchtype: CollectionMatchType, interfaces: utf8, interfacematchtype: CollectionMatchType, invert: gboolean) -> MatchRule` | atspi_match_rule_new |  | Creates a new #AtspiMatchRule with specified @states, @attributes, @interfaces, and @roles. |

### Atspi.Object

Parent: `GObject.Object` ?? Subclasses: `Accessible`, `Hyperlink` ?? GType: `AtspiObject` ?? C type: `AtspiObject`

#### Fields

| Field | Type |
| --- | --- |
| app | Application |
| parent | GObject.Object |
| path | utf8 |

### Atspi.Relation

Parent: `GObject.Object` ?? GType: `AtspiRelation` ?? C type: `AtspiRelation`

An interface via which non-hierarchical relationships are indicated. An interface via which non-hierarchical relationships are indicated. An instan...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| relation_type | RelationType |
| targets | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_n_targets | `Relation.get_n_targets() -> gint` | atspi_relation_get_n_targets |  | Gets the number of objects which this relationship has as its target objects (the subject is the #AtspiAccessible from which this #AtspiRelation or... |
| get_relation_type | `Relation.get_relation_type() -> RelationType` | atspi_relation_get_relation_type |  | Gets the type of relationship represented by an #AtspiRelation. |
| get_target | `Relation.get_target(i: gint) -> Accessible` | atspi_relation_get_target |  | Gets the @i-th target of a specified #AtspiRelation relationship. |

### Atspi.StateSet

Parent: `GObject.Object` ?? GType: `AtspiStateSet` ?? C type: `AtspiStateSet`

The atspi-stateset objects implement wrappers around a bitmap of accessible states.

#### Fields

| Field | Type |
| --- | --- |
| accessible | gpointer |
| parent | GObject.Object |
| states | gint64 |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StateSet.new(states: StateType) -> StateSet` | atspi_state_set_new |  | Generates an #AtspiStateSet with the given @states. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `StateSet.add(state: StateType) -> none` | atspi_state_set_add |  | Adds a particular #AtspiState to an #AtspiStateSet (i.e. sets the given state to #TRUE in the stateset). |
| compare | `StateSet.compare(set2: StateSet) -> StateSet` | atspi_state_set_compare |  | Determines the differences between two instances of #AtspiStateSet. @see #atspi_state_set_equals. |
| contains | `StateSet.contains(state: StateType) -> gboolean` | atspi_state_set_contains |  | Determines whether a given #AtspiStateSet includes a given state; that is, whether @state is true for the @set in question. |
| equals | `StateSet.equals(set2: StateSet) -> gboolean` | atspi_state_set_equals |  | Determines whether two instances of #AtspiStateSet are equivalent (i.e. consist of the same #AtspiStates). Useful for checking multiple state varia... |
| get_states | `StateSet.get_states() -> StateType` | atspi_state_set_get_states |  | Returns the states in an #AtspiStateSet as an array. |
| is_empty | `StateSet.is_empty() -> gboolean` | atspi_state_set_is_empty |  | #TRUE if the state set contains no states; #FALSE otherwise. |
| remove | `StateSet.remove(state: StateType) -> none` | atspi_state_set_remove |  | Removes a particular #AtspiState to an #AtspiStateSet (i.e. sets the given state to #FALSE in the stateset.) |
| set_by_name | `StateSet.set_by_name(name: utf8, enabled: gboolean) -> none` | atspi_state_set_set_by_name |  | Enables/disables a state in an #AtspiStateSet according to its @name. |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Action |  | 0 | 0 | 8 | Invoke the action indicated by #index. |
| Collection |  | 0 | 0 | 5 | An interface designed to allow accessibles which satisfy a set of criteria to be returned. An interface designed to allow accessibles which satisfy... |
| Component |  | 0 | 0 | 14 | An interface implemented by objects which have onscreen visual representations. The Component interface is implemented by objects which occupy on-s... |
| Document |  | 0 | 0 | 9 | Gets the value of a single attribute, if specified for the document as a whole. |
| EditableText |  | 0 | 0 | 6 | Copies text from an #AtspiEditableText object into the system clipboard. see: #atspi_editable_text_paste_text |
| Hypertext |  | 0 | 0 | 3 | An interface used for objects which implement linking between multiple resource locations. An interface used for objects which implement linking be... |
| Image |  | 0 | 0 | 5 | Gets the description of the image displayed in an #AtspiImage object. |
| Selection |  | 0 | 0 | 8 | An interface which indicates that an object exposes a 'selection' model, allowing the selection of one or more of its children. An interface which ... |
| Table |  | 0 | 0 | 26 | An interface used by containers whose data is arranged in a tabular form. An interface used by containers whose contained data is arranged in a tab... |
| TableCell |  | 0 | 0 | 8 | Returns the column headers as an array of cell accessibles. |
| Text |  | 0 | 0 | 26 | An interface implemented by objects which place textual information onscreen. The text interface should be implemented by objects which place textu... |
| Value |  | 0 | 0 | 6 | An interface supporting a one-dimensional scalar to be modified, or which reflects its value. An interface supporting a one-dimensional scalar to b... |

### Atspi.Action

GType: `AtspiAction` ?? C type: `AtspiAction`

Invoke the action indicated by #index.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| do_action | `Action.do_action(i: gint) -> gboolean throws` | atspi_action_do_action |  | Invoke the action indicated by #index. |
| get_action_description | `Action.get_action_description(i: gint) -> utf8 throws` | atspi_action_get_action_description |  | Get the description of '@i-th' action invocable on an object implementing #AtspiAction. |
| get_action_name | `Action.get_action_name(i: gint) -> utf8 throws` | atspi_action_get_action_name |  | Get the name of the '@i-th' action invocable on an object implementing #AtspiAction. |
| get_description | `Action.get_description(i: gint) -> utf8 throws` | atspi_action_get_description |  | Get the description of '@i-th' action invocable on an object implementing #AtspiAction. |
| get_key_binding | `Action.get_key_binding(i: gint) -> utf8 throws` | atspi_action_get_key_binding |  | Get the keybindings for the @i-th action invocable on an object implementing #AtspiAction, if any are defined. The keybindings string format is as ... |
| get_localized_name | `Action.get_localized_name(i: gint) -> utf8 throws` | atspi_action_get_localized_name |  | Get the name of the '@i-th' action invocable on an object implementing #AtspiAction. |
| get_n_actions | `Action.get_n_actions() -> gint throws` | atspi_action_get_n_actions |  | Get the number of actions invokable on an #AtspiAction implementor. |
| get_name | `Action.get_name(i: gint) -> utf8 throws` | atspi_action_get_name |  | Get the name of the '@i-th' action invocable on an object implementing #AtspiAction. |

### Atspi.Collection

GType: `AtspiCollection` ?? C type: `AtspiCollection`

An interface designed to allow accessibles which satisfy a set of criteria to be returned. An interface designed to allow accessibles which satisfy...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_active_descendant | `Collection.get_active_descendant() -> Accessible throws` | atspi_collection_get_active_descendant |  | The active descendant of the given object. Not yet implemented. |
| get_matches | `Collection.get_matches(rule: MatchRule, sortby: CollectionSortOrder, count: gint, traverse: gboolean) -> Accessible throws` | atspi_collection_get_matches |  | Gets all #AtspiAccessible objects from the @collection matching a given @rule. |
| get_matches_from | `Collection.get_matches_from(current_object: Accessible, rule: MatchRule, sortby: CollectionSortOrder, tree: CollectionTreeTraversalType, count: gint, traverse: gboolean) -> Accessible throws` | atspi_collection_get_matches_from |  | Gets all #AtspiAccessible objects from the @collection, before @current_object, matching a given @rule. |
| get_matches_to | `Collection.get_matches_to(current_object: Accessible, rule: MatchRule, sortby: CollectionSortOrder, tree: CollectionTreeTraversalType, limit_scope: gboolean, count: gint, traverse: gboolean) -> Accessible throws` | atspi_collection_get_matches_to |  | Gets all #AtspiAccessible objects from the @collection, after @current_object, matching a given @rule. |
| is_ancestor_of | `Collection.is_ancestor_of(test: Accessible) -> gboolean throws` | atspi_collection_is_ancestor_of |  | Not yet implemented. |

### Atspi.Component

GType: `AtspiComponent` ?? C type: `AtspiComponent`

An interface implemented by objects which have onscreen visual representations. The Component interface is implemented by objects which occupy on-s...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| contains | `Component.contains(x: gint, y: gint, ctype: CoordType) -> gboolean throws` | atspi_component_contains |  | Queries whether a given #AtspiComponent contains a particular point. |
| get_accessible_at_point | `Component.get_accessible_at_point(x: gint, y: gint, ctype: CoordType) -> Accessible throws` | atspi_component_get_accessible_at_point |  | Gets the accessible child at a given coordinate within an #AtspiComponent. |
| get_alpha | `Component.get_alpha() -> gdouble throws` | atspi_component_get_alpha |  | Gets the opacity/alpha value of a component, if alpha blending is in use. |
| get_extents | `Component.get_extents(ctype: CoordType) -> Rect throws` | atspi_component_get_extents |  | Gets the bounding box of the specified #AtspiComponent. The returned values are meaningful only if the Component has both STATE_VISIBLE and STATE_S... |
| get_layer | `Component.get_layer() -> ComponentLayer throws` | atspi_component_get_layer |  | Queries which layer the component is painted into, to help determine its visibility in terms of stacking order. |
| get_mdi_z_order | `Component.get_mdi_z_order() -> gshort throws` | atspi_component_get_mdi_z_order |  | Queries the z stacking order of a component which is in the MDI or window layer. (Bigger z-order numbers mean nearer the top) |
| get_position | `Component.get_position(ctype: CoordType) -> Point throws` | atspi_component_get_position |  | Gets the minimum x and y coordinates of the specified #AtspiComponent. The returned values are meaningful only if the Component has both STATE_VISI... |
| get_size | `Component.get_size() -> Point throws` | atspi_component_get_size |  | Gets the size of the specified #AtspiComponent. The returned values are meaningful only if the Component has both STATE_VISIBLE and STATE_SHOWING. |
| grab_focus | `Component.grab_focus() -> gboolean throws` | atspi_component_grab_focus |  | Attempts to set the keyboard input focus to the specified #AtspiComponent. |
| scroll_to | `Component.scroll_to(type: ScrollType) -> gboolean throws` | atspi_component_scroll_to |  | Scrolls whatever container of the #AtspiComponent object so it becomes visible on the screen. |
| scroll_to_point | `Component.scroll_to_point(coords: CoordType, x: gint, y: gint) -> gboolean throws` | atspi_component_scroll_to_point |  | Scrolls whatever container of the #AtspiComponent object so it becomes visible on the screen at a given position. |
| set_extents | `Component.set_extents(x: gint, y: gint, width: gint, height: gint, ctype: CoordType) -> gboolean throws` | atspi_component_set_extents |  | Moves and resizes the specified component. |
| set_position | `Component.set_position(x: gint, y: gint, ctype: CoordType) -> gboolean throws` | atspi_component_set_position |  | Moves the component to the specified position. |
| set_size | `Component.set_size(width: gint, height: gint) -> gboolean throws` | atspi_component_set_size |  | Resizes the specified component to the given pixel dimensions. |

### Atspi.Document

GType: `AtspiDocument` ?? C type: `AtspiDocument`

Gets the value of a single attribute, if specified for the document as a whole.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_attribute_value | `Document.get_attribute_value(attribute: utf8) -> utf8 throws` | atspi_document_get_attribute_value |  | Gets the value of a single attribute, if specified for the document as a whole. |
| get_attributes | `Document.get_attributes() -> GLib.HashTable throws` | atspi_document_get_attributes |  | Gets all constant attributes for the document as a whole. For attributes that change within the document content, see @atspi_text_get_attribute_run... |
| get_current_page_number | `Document.get_current_page_number() -> gint throws` | atspi_document_get_current_page_number |  | Gets the current page number of an #AccessibleDocument object. |
| get_document_attribute_value | `Document.get_document_attribute_value(attribute: utf8) -> utf8 throws` | atspi_document_get_document_attribute_value |  | Gets the value of a single attribute, if specified for the document as a whole. |
| get_document_attributes | `Document.get_document_attributes() -> GLib.HashTable throws` | atspi_document_get_document_attributes |  | Gets all constant attributes for the document as a whole. For attributes that change within the document content, see @atspi_text_get_attribute_run... |
| get_locale | `Document.get_locale() -> utf8 throws` | atspi_document_get_locale |  | Gets the locale associated with the document's content, e.g. the locale for LOCALE_TYPE_MESSAGES. |
| get_page_count | `Document.get_page_count() -> gint throws` | atspi_document_get_page_count |  | Gets the page count of an #AccessibleDocument object. |
| get_text_selections | `Document.get_text_selections() -> TextSelection throws` | atspi_document_get_text_selections | 2.52 | Returns an array of AtspiTextSelections within this document. |
| set_text_selections | `Document.set_text_selections(selections: TextSelection) -> gboolean throws` | atspi_document_set_text_selections | 2.52 | Makes 1 or more selections within this document denoted by the given array of AtspiTextSelections. Any existing physical selection (inside or outsi... |

### Atspi.EditableText

GType: `AtspiEditableText` ?? C type: `AtspiEditableText`

Copies text from an #AtspiEditableText object into the system clipboard. see: #atspi_editable_text_paste_text

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_text | `EditableText.copy_text(start_pos: gint, end_pos: gint) -> gboolean throws` | atspi_editable_text_copy_text |  | Copies text from an #AtspiEditableText object into the system clipboard. see: #atspi_editable_text_paste_text |
| cut_text | `EditableText.cut_text(start_pos: gint, end_pos: gint) -> gboolean throws` | atspi_editable_text_cut_text |  | Deletes text from an #AtspiEditableText object, copying the excised portion into the system clipboard. see: #atspi_editable_text_paste_text |
| delete_text | `EditableText.delete_text(start_pos: gint, end_pos: gint) -> gboolean throws` | atspi_editable_text_delete_text |  | Deletes text from an #AtspiEditableText object, without copying the excised portion into the system clipboard. see: #atspi_editable_text_cut_text |
| insert_text | `EditableText.insert_text(position: gint, text: utf8, length: gint) -> gboolean throws` | atspi_editable_text_insert_text |  | Inserts text into an #AtspiEditableText object. As with all character offsets, the specified @position may not be the same as the resulting byte of... |
| paste_text | `EditableText.paste_text(position: gint) -> gboolean throws` | atspi_editable_text_paste_text |  | Inserts text from the system clipboard into an #AtspiEditableText object. As with all character offsets, the specified @position may not be the sam... |
| set_text_contents | `EditableText.set_text_contents(new_contents: utf8) -> gboolean throws` | atspi_editable_text_set_text_contents |  | Replace the entire text contents of an #AtspiEditableText object. |

### Atspi.Hypertext

GType: `AtspiHypertext` ?? C type: `AtspiHypertext`

An interface used for objects which implement linking between multiple resource locations. An interface used for objects which implement linking be...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_link | `Hypertext.get_link(link_index: gint) -> Hyperlink throws` | atspi_hypertext_get_link |  | Gets the #AtspiHyperlink object at a specified index. |
| get_link_index | `Hypertext.get_link_index(character_offset: gint) -> gint throws` | atspi_hypertext_get_link_index |  | Gets the index of the #AtspiHyperlink object at a specified character offset. |
| get_n_links | `Hypertext.get_n_links() -> gint throws` | atspi_hypertext_get_n_links |  | Gets the total number of #AtspiHyperlink objects that an #AtspiHypertext implementor has. |

### Atspi.Image

GType: `AtspiImage` ?? C type: `AtspiImage`

Gets the description of the image displayed in an #AtspiImage object.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_image_description | `Image.get_image_description() -> utf8 throws` | atspi_image_get_image_description |  | Gets the description of the image displayed in an #AtspiImage object. |
| get_image_extents | `Image.get_image_extents(ctype: CoordType) -> Rect throws` | atspi_image_get_image_extents |  | Gets the bounding box of the image displayed in a specified #AtspiImage implementor. The returned values are meaningful only if the Image has both ... |
| get_image_locale | `Image.get_image_locale() -> utf8 throws` | atspi_image_get_image_locale |  | Gets the locale associated with an image and its textual representation. |
| get_image_position | `Image.get_image_position(ctype: CoordType) -> Point throws` | atspi_image_get_image_position |  | Gets the minimum x and y coordinates of the image displayed in a specified #AtspiImage implementor. The returned values are meaningful only if the ... |
| get_image_size | `Image.get_image_size() -> Point throws` | atspi_image_get_image_size |  | Gets the size of the image displayed in a specified #AtspiImage object. The returned values are meaningful only if the Image has both STATE_VISIBLE... |

### Atspi.Selection

GType: `AtspiSelection` ?? C type: `AtspiSelection`

An interface which indicates that an object exposes a 'selection' model, allowing the selection of one or more of its children. An interface which ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear_selection | `Selection.clear_selection() -> gboolean throws` | atspi_selection_clear_selection |  | Clears the current selection, removing all selected children from the specified #AtspiSelection implementor's selection list. |
| deselect_child | `Selection.deselect_child(child_index: gint) -> gboolean throws` | atspi_selection_deselect_child |  | Deselects a specific child of an #AtspiSelection. Note that @child_index is the index of the child in the parent container. See #atspi_selection_de... |
| deselect_selected_child | `Selection.deselect_selected_child(selected_child_index: gint) -> gboolean throws` | atspi_selection_deselect_selected_child |  | Removes a child from the selected children list of an #AtspiSelection. Note that @child_index is the index in the selected-children list, not the i... |
| get_n_selected_children | `Selection.get_n_selected_children() -> gint throws` | atspi_selection_get_n_selected_children |  | Gets the number of children of an #AtspiSelection implementor which are currently selected. |
| get_selected_child | `Selection.get_selected_child(selected_child_index: gint) -> Accessible throws` | atspi_selection_get_selected_child |  | Gets the i-th selected #AtspiAccessible child of an #AtspiSelection. Note that @selected_child_index refers to the index in the list of 'selected' ... |
| is_child_selected | `Selection.is_child_selected(child_index: gint) -> gboolean throws` | atspi_selection_is_child_selected |  | Determines whether a particular child of an #AtspiSelection implementor is currently selected. Note that @child_index is the index into the standar... |
| select_all | `Selection.select_all() -> gboolean throws` | atspi_selection_select_all |  | Attempts to select all of the children of an #AtspiSelection implementor. Not all #AtspiSelection implementors support this operation. |
| select_child | `Selection.select_child(child_index: gint) -> gboolean throws` | atspi_selection_select_child |  | Adds a child to the selected children list of an #AtspiSelection. For #AtspiSelection implementors that only allow single selections, this may repl... |

### Atspi.Table

GType: `AtspiTable` ?? C type: `AtspiTable`

An interface used by containers whose data is arranged in a tabular form. An interface used by containers whose contained data is arranged in a tab...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_column_selection | `Table.add_column_selection(column: gint) -> gboolean throws` | atspi_table_add_column_selection |  | Selects the specified column, adding it to the current column selection. Not all tables support column selection. |
| add_row_selection | `Table.add_row_selection(row: gint) -> gboolean throws` | atspi_table_add_row_selection |  | Selects the specified row, adding it to the current row selection. Not all tables support row selection. |
| get_accessible_at | `Table.get_accessible_at(row: gint, column: gint) -> Accessible throws` | atspi_table_get_accessible_at |  | Gets the table cell at the specified row and column indices. To get the accessible object at a particular (x, y) screen coordinate, use #atspi_comp... |
| get_caption | `Table.get_caption() -> Accessible throws` | atspi_table_get_caption |  | Gets an accessible representation of the caption for an #AtspiTable. |
| get_column_at_index | `Table.get_column_at_index(index: gint) -> gint throws` | atspi_table_get_column_at_index |  | Gets the table column index occupied by the child at a particular 1-D child index. @see #atspi_table_get_index_at, #atspi_table_get_row_at_index |
| get_column_description | `Table.get_column_description(column: gint) -> utf8 throws` | atspi_table_get_column_description |  | Gets a text description of a particular table column. This differs from #atspi_table_get_column_header, which returns an #Accessible. |
| get_column_extent_at | `Table.get_column_extent_at(row: gint, column: gint) -> gint throws` | atspi_table_get_column_extent_at |  | Gets the number of columns spanned by the table cell at the specific row and column (some tables can have cells which span multiple rows and/or col... |
| get_column_header | `Table.get_column_header(column: gint) -> Accessible throws` | atspi_table_get_column_header |  | Gets the header associated with a table column, if available. This differs from #atspi_table_get_column_description, which returns a string. |
| get_index_at | `Table.get_index_at(row: gint, column: gint) -> gint throws` | atspi_table_get_index_at |  | Gets the 1-D child index corresponding to the specified 2-D row and column indices. To get the accessible object at a particular (x, y) screen coor... |
| get_n_columns | `Table.get_n_columns() -> gint throws` | atspi_table_get_n_columns |  | Gets the number of columns in an #AtspiTable, exclusive of any columns that are programmatically hidden, but inclusive of columns that may be outsi... |
| get_n_rows | `Table.get_n_rows() -> gint throws` | atspi_table_get_n_rows |  | Gets the number of rows in an #AtspiTable, exclusive of any rows that are programmatically hidden, but inclusive of rows that may be outside of the... |
| get_n_selected_columns | `Table.get_n_selected_columns() -> gint throws` | atspi_table_get_n_selected_columns |  | Queries a table to find out how many columns are currently selected. Not all tables support column selection. |
| get_n_selected_rows | `Table.get_n_selected_rows() -> gint throws` | atspi_table_get_n_selected_rows |  | Query a table to find out how many rows are currently selected. Not all tables support row selection. |
| get_row_at_index | `Table.get_row_at_index(index: gint) -> gint throws` | atspi_table_get_row_at_index |  | Gets the table row index occupied by the child at a particular 1-D child index. @see #atspi_table_get_index_at, #atspi_table_get_column_at_index |
| get_row_column_extents_at_index | `Table.get_row_column_extents_at_index(index: gint, row: out gint, col: out gint, row_extents: out gint, col_extents: out gint, is_selected: out gboolean) -> gboolean throws` | atspi_table_get_row_column_extents_at_index |  | Given a child index, determines the row and column indices and extents, and whether the cell is currently selected. If the child at index is not a ... |
| get_row_description | `Table.get_row_description(row: gint) -> utf8 throws` | atspi_table_get_row_description |  | Gets a text description of a particular table row. This differs from #atspi_table_get_row_header, which returns an #AtspiAccessible. |
| get_row_extent_at | `Table.get_row_extent_at(row: gint, column: gint) -> gint throws` | atspi_table_get_row_extent_at |  | Gets the number of rows spanned by the table cell at the specific row and column. (some tables can have cells which span multiple rows and/or colum... |
| get_row_header | `Table.get_row_header(row: gint) -> Accessible throws` | atspi_table_get_row_header |  | Gets the header associated with a table row, if available. This differs from #atspi_table_get_row_description, which returns a string. |
| get_selected_columns | `Table.get_selected_columns() -> gint throws` | atspi_table_get_selected_columns |  | Queries a table for a list of indices of columns which are currently selected. |
| get_selected_rows | `Table.get_selected_rows() -> gint throws` | atspi_table_get_selected_rows |  | Queries a table for a list of indices of rows which are currently selected. |
| get_summary | `Table.get_summary() -> Accessible throws` | atspi_table_get_summary |  | Gets an accessible object which summarizes the contents of an #AtspiTable. |
| is_column_selected | `Table.is_column_selected(column: gint) -> gboolean throws` | atspi_table_is_column_selected |  | Determines whether specified table column is selected. Not all tables support column selection. |
| is_row_selected | `Table.is_row_selected(row: gint) -> gboolean throws` | atspi_table_is_row_selected |  | Determines whether a table row is selected. Not all tables support row selection. |
| is_selected | `Table.is_selected(row: gint, column: gint) -> gboolean throws` | atspi_table_is_selected |  | Determines whether the cell at a specific row and column is selected. |
| remove_column_selection | `Table.remove_column_selection(column: gint) -> gboolean throws` | atspi_table_remove_column_selection |  | De-selects the specified column, removing it from the current column selection. Not all tables support column selection. |
| remove_row_selection | `Table.remove_row_selection(row: gint) -> gboolean throws` | atspi_table_remove_row_selection |  | De-selects the specified row, removing it from the current row selection. Not all tables support row selection. |

### Atspi.TableCell

GType: `AtspiTableCell` ?? C type: `AtspiTableCell`

Returns the column headers as an array of cell accessibles.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_column_header_cells | `TableCell.get_column_header_cells() -> Accessible throws` | atspi_table_cell_get_column_header_cells |  | Returns the column headers as an array of cell accessibles. |
| get_column_index | `TableCell.get_column_index() -> gint throws` | atspi_table_cell_get_column_index |  |  |
| get_column_span | `TableCell.get_column_span() -> gint throws` | atspi_table_cell_get_column_span |  | Returns the number of columns occupied by this cell accessible. The returned values are meaningful only if the table cell has both STATE_VISIBLE an... |
| get_position | `TableCell.get_position(row: out gint, column: out gint) -> gint throws` | atspi_table_cell_get_position |  | Retrieves the tabular position of this cell. |
| get_row_column_span | `TableCell.get_row_column_span(row: out gint, column: out gint, row_span: out gint, column_span: out gint) -> none throws` | atspi_table_cell_get_row_column_span |  | Gets the row and column indexes and extents of this cell accessible. The returned values are meaningful only if the table cell has both STATE_VISIB... |
| get_row_header_cells | `TableCell.get_row_header_cells() -> Accessible throws` | atspi_table_cell_get_row_header_cells |  | Returns the row headers as an array of cell accessibles. |
| get_row_span | `TableCell.get_row_span() -> gint throws` | atspi_table_cell_get_row_span |  | Returns the number of rows occupied by this cell accessible. The returned values are meaningful only if the table cell has both STATE_VISIBLE and S... |
| get_table | `TableCell.get_table() -> Accessible throws` | atspi_table_cell_get_table |  | Returns a reference to the accessible of the containing table. |

### Atspi.Text

GType: `AtspiText` ?? C type: `AtspiText`

An interface implemented by objects which place textual information onscreen. The text interface should be implemented by objects which place textu...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_selection | `Text.add_selection(start_offset: gint, end_offset: gint) -> gboolean throws` | atspi_text_add_selection |  | Selects some text (adds a text selection) in an #AtspiText object. |
| get_attribute_run | `Text.get_attribute_run(offset: gint, include_defaults: gboolean, start_offset: out gint, end_offset: out gint) -> GLib.HashTable throws` | atspi_text_get_attribute_run |  | Gets a set of attributes applied to a range of text from an #AtspiText object, optionally including its 'default' attributes. |
| get_attribute_value | `Text.get_attribute_value(offset: gint, attribute_name: utf8) -> utf8 throws` | atspi_text_get_attribute_value |  | Gets the value of a named attribute at a given offset. |
| get_attributes | `Text.get_attributes(offset: gint, start_offset: out gint, end_offset: out gint) -> GLib.HashTable throws` | atspi_text_get_attributes |  | Gets the attributes applied to a range of text from an #AtspiText object. The text attributes correspond to CSS attributes where possible. |
| get_bounded_ranges | `Text.get_bounded_ranges(x: gint, y: gint, width: gint, height: gint, type: CoordType, clipTypeX: TextClipType, clipTypeY: TextClipType) -> TextRange throws` | atspi_text_get_bounded_ranges |  | Gets the ranges of text from an #AtspiText object which lie within the bounds defined by (@x, @y) and (@x+@width, @y+@height). |
| get_caret_offset | `Text.get_caret_offset() -> gint throws` | atspi_text_get_caret_offset |  | Gets the current offset of the text caret in an #AtspiText object. |
| get_character_at_offset | `Text.get_character_at_offset(offset: gint) -> guint throws` | atspi_text_get_character_at_offset |  | Gets the character at a given offset for an #AtspiText object. |
| get_character_count | `Text.get_character_count() -> gint throws` | atspi_text_get_character_count |  | Gets the character count of an #AccessibleText object. |
| get_character_extents | `Text.get_character_extents(offset: gint, type: CoordType) -> Rect throws` | atspi_text_get_character_extents |  | Gets a bounding box containing the glyph representing the character at a particular text offset. The returned values are meaningful only if the Tex... |
| get_default_attributes | `Text.get_default_attributes() -> GLib.HashTable throws` | atspi_text_get_default_attributes |  | Gets the default attributes applied to an #AtspiText object. The text attributes correspond to CSS attributes where possible. The combination of th... |
| get_n_selections | `Text.get_n_selections() -> gint throws` | atspi_text_get_n_selections |  | Gets the number of active non-contiguous selections for an #AtspiText object. |
| get_offset_at_point | `Text.get_offset_at_point(x: gint, y: gint, type: CoordType) -> gint throws` | atspi_text_get_offset_at_point |  | Gets the character offset into the text at a given point. |
| get_range_extents | `Text.get_range_extents(start_offset: gint, end_offset: gint, type: CoordType) -> Rect throws` | atspi_text_get_range_extents |  | Gets the bounding box for text within a range in an #AtspiText object. The returned values are meaningful only if the Text has both STATE_VISIBLE a... |
| get_selection | `Text.get_selection(selection_num: gint) -> Range throws` | atspi_text_get_selection |  | Gets the bounds of the @selection_num-th active text selection for an #AtspiText object. |
| get_string_at_offset | `Text.get_string_at_offset(offset: gint, granularity: TextGranularity) -> TextRange throws` | atspi_text_get_string_at_offset | 2.9.90 | Gets a portion of the text exposed through an #AtspiText according to a given @offset and a specific @granularity, along with the start and end off... |
| get_text | `Text.get_text(start_offset: gint, end_offset: gint) -> utf8 throws` | atspi_text_get_text |  | Gets a range of text from an #AtspiText object. The number of bytes in the returned string may exceed either end_offset or start_offset, since UTF-... |
| get_text_after_offset | `Text.get_text_after_offset(offset: gint, type: TextBoundaryType) -> TextRange throws` | atspi_text_get_text_after_offset |  | Gets delimited text from an #AtspiText object which follows a given text offset. |
| get_text_at_offset | `Text.get_text_at_offset(offset: gint, type: TextBoundaryType) -> TextRange throws` | atspi_text_get_text_at_offset |  | Gets delimited text from an #AtspiText object which includes a given text offset. |
| get_text_attribute_value | `Text.get_text_attribute_value(offset: gint, attribute_name: utf8) -> utf8 throws` | atspi_text_get_text_attribute_value |  | Gets the value of a named attribute at a given offset. |
| get_text_attributes | `Text.get_text_attributes(offset: gint, start_offset: out gint, end_offset: out gint) -> GLib.HashTable throws` | atspi_text_get_text_attributes |  | Gets the attributes applied to a range of text from an #AtspiText object. The text attributes correspond to CSS attributes where possible. |
| get_text_before_offset | `Text.get_text_before_offset(offset: gint, type: TextBoundaryType) -> TextRange throws` | atspi_text_get_text_before_offset |  | Gets delimited text from an #AtspiText object which precedes a given text offset. |
| remove_selection | `Text.remove_selection(selection_num: gint) -> gboolean throws` | atspi_text_remove_selection |  | De-selects a text selection. |
| scroll_substring_to | `Text.scroll_substring_to(start_offset: gint, end_offset: gint, type: ScrollType) -> gboolean throws` | atspi_text_scroll_substring_to |  | Scrolls whatever container of the #AtspiText text range so it becomes visible on the screen. |
| scroll_substring_to_point | `Text.scroll_substring_to_point(start_offset: gint, end_offset: gint, coords: CoordType, x: gint, y: gint) -> gboolean throws` | atspi_text_scroll_substring_to_point |  | Scrolls whatever container of the #AtspiText text range so it becomes visible on the screen at a given position. |
| set_caret_offset | `Text.set_caret_offset(new_offset: gint) -> gboolean throws` | atspi_text_set_caret_offset |  | Moves the text caret to a given position. |
| set_selection | `Text.set_selection(selection_num: gint, start_offset: gint, end_offset: gint) -> gboolean throws` | atspi_text_set_selection |  | Changes the bounds of an existing #AtspiText text selection. |

### Atspi.Value

GType: `AtspiValue` ?? C type: `AtspiValue`

An interface supporting a one-dimensional scalar to be modified, or which reflects its value. An interface supporting a one-dimensional scalar to b...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_value | `Value.get_current_value() -> gdouble throws` | atspi_value_get_current_value |  | Gets the current value for an #AtspiValue. |
| get_maximum_value | `Value.get_maximum_value() -> gdouble throws` | atspi_value_get_maximum_value |  | Gets the maximum allowed value for an #AtspiValue. |
| get_minimum_increment | `Value.get_minimum_increment() -> gdouble throws` | atspi_value_get_minimum_increment |  | Gets the minimum increment by which an #AtspiValue can be adjusted. |
| get_minimum_value | `Value.get_minimum_value() -> gdouble throws` | atspi_value_get_minimum_value |  | Gets the minimum allowed value for an #AtspiValue. |
| get_text | `Value.get_text() -> utf8 throws` | atspi_value_get_text | 2.46 | Gets the human readable text alternative associated with the value. @text is a newly created string, that must be freed by the caller. Can be NULL ... |
| set_current_value | `Value.set_current_value(new_value: gdouble) -> gboolean throws` | atspi_value_set_current_value |  | Sets the current value of an #AtspiValue. |

## Enums

### Atspi.CollectionMatchType

GType: `AtspiCollectionMatchType` ?? C type: `AtspiCollectionMatchType`

Enumeration used by #AtspiMatchRule to specify how to interpret #AtspiAccessible objects.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 1 | all | #TRUE if all of the criteria are met. |
| any | 2 | any | #TRUE if any of the criteria are met. |
| empty | 4 | empty | Same as @ATSPI_Collection_MATCH_ALL if the criteria is non-empty; for empty criteria this rule requires returned value to also have empty set. |
| invalid | 0 | invalid | Indicates an error condition or uninitialized value. |
| last_defined | 5 | last-defined | Used only to determine the end of the enumeration. |
| none | 3 | none | #TRUE if none of the criteria are met. |

### Atspi.CollectionSortOrder

GType: `AtspiCollectionSortOrder` ?? C type: `AtspiCollectionSortOrder`

Enumeration used by interface #AtspiCollection to specify the way #AtspiAccesible objects should be sorted.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| canonical | 1 | canonical | Canonical sort order |
| flow | 2 | flow | Flow sort order |
| invalid | 0 | invalid | Invalid sort order |
| last_defined | 7 | last-defined | Used only to determine the end of the enumeration. |
| reverse_canonical | 4 | reverse-canonical | Reverse canonical sort order |
| reverse_flow | 5 | reverse-flow | Reverse flow sort order |
| reverse_tab | 6 | reverse-tab | Reverse tab sort order |
| tab | 3 | tab | Tab sort order |

### Atspi.CollectionTreeTraversalType

GType: `AtspiCollectionTreeTraversalType` ?? C type: `AtspiCollectionTreeTraversalType`

Enumeration used by interface #AtspiCollection to specify restrictions on #AtspiAccesible objects to be traversed.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| inorder | 2 | inorder | In-order tree traversal. |
| last_defined | 3 | last-defined | Used only to determine the end of the enumeration. |
| restrict_children | 0 | restrict-children | Restrict children tree traveral |
| restrict_sibling | 1 | restrict-sibling | Restrict sibling tree traversal |

### Atspi.ComponentLayer

GType: `AtspiComponentLayer` ?? C type: `AtspiComponentLayer`

The #AtspiComponentLayer of an #AtspiComponent instance indicates its relative stacking order with respect to the onscreen visual representation of...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| background | 1 | background | The bottom-most layer, over which everything else is painted. The 'desktop background' is generally in this layer. |
| canvas | 2 | canvas | The 'background' layer for most content renderers and UI #AtspiComponent containers. |
| invalid | 0 | invalid | Indicates an error condition or uninitialized value. |
| last_defined | 8 | last-defined | Used only to determine the end of the enumeration. |
| mdi | 4 | mdi | A special layer between @ATSPI_LAYER_CANVAS and @ATSPI_LAYER_WIDGET, in which the 'pseudo windows' (e.g. the MDI frames) reside. See #atspi_compone... |
| overlay | 6 | overlay | The topmost layer. |
| popup | 5 | popup | A layer for popup window content, above @ATSPI_LAYER_WIDGET. |
| widget | 3 | widget | The layer in which the majority of ordinary 'foreground' widgets reside. |
| window | 7 | window | The layer in which a toplevel window background usually resides. |

### Atspi.CoordType

GType: `AtspiCoordType` ?? C type: `AtspiCoordType`

Enumeration used by #AtspiComponent, #AtspiImage, and #AtspiText interfaces to specify whether coordinates are relative to the window or the screen.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| parent | 2 | parent | Specifies xy coordinates relative to the widget's immediate parent. |
| screen | 0 | screen | Specifies xy coordinates relative to the screen. |
| window | 1 | window | Specifies xy coordinates relative to the widget's top-level window. |

### Atspi.EventType

GType: `AtspiEventType` ?? C type: `AtspiEventType`

Enumeration used to specify the event types of interest to an #AtspiEventListener, or to identify the type of an event for which notification has b...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| button_pressed_event | 2 | button-pressed-event | Indicates that a button on a non-keyboard human interface device (HID) was pressed. |
| button_released_event | 3 | button-released-event | Indicates that a button on a non-keyboard human interface device (HID) was released. |
| key_pressed_event | 0 | key-pressed-event | Indicates that a key on a keyboard device was pressed. |
| key_released_event | 1 | key-released-event | Indicates that a key on a keyboard device was released. |

### Atspi.KeyEventType

GType: `AtspiKeyEventType` ?? C type: `AtspiKeyEventType`

Deprecated. Should not be used.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| pressed | 0 | pressed | Key press event |
| released | 1 | released | Key release event |

### Atspi.KeySynthType

GType: `AtspiKeySynthType` ?? C type: `AtspiKeySynthType`

Enumeration used when synthesizing keyboard input via #atspi_generate_keyboard_event.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lockmodifiers | 5 | lockmodifiers | Emulates locking a set of modifiers. |
| press | 0 | press | Emulates the pressing of a hardware keyboard key. |
| pressrelease | 2 | pressrelease | Emulates the pressing and immediate releasing of a hardware keyboard key. |
| release | 1 | release | Emulates the release of a hardware keyboard key. |
| string | 4 | string | A string is converted to its equivalent keyboard events and emitted. If the string consists of complex characters or composed characters which are ... |
| sym | 3 | sym | A symbolic key event is generated, without specifying a hardware key. Note: if the keysym is not present in the current keyboard map, the #AtspiDev... |
| unlockmodifiers | 6 | unlockmodifiers | Emulates unlocking a set of modifiers. |

### Atspi.Live

GType: `AtspiLive` ?? C type: `AtspiLive`

Enumeration used to indicate a type of live region and how assertive it should be in terms of speaking notifications. Currently, this is only used ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| assertive | 2 | assertive | This live region should be considered assertive. |
| none | 0 | none | No live region. |
| polite | 1 | polite | This live region should be considered polite. |

### Atspi.LocaleType

GType: `AtspiLocaleType` ?? C type: `AtspiLocaleType`

Used by interfaces #AtspiText and #AtspiDocument, this enumeration corresponds to the POSIX 'setlocale' enum values.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| collate | 1 | collate | For regular expression matching and string collation. |
| ctype | 2 | ctype | For regular expression matching, character classification, conversion, case-sensitive comparison, and wide character functions. |
| messages | 0 | messages | For localizable natural-language messages. |
| monetary | 3 | monetary | For monetary formatting. |
| numeric | 4 | numeric | For number formatting (such as the decimal point and the thousands separator). |
| time | 5 | time | For time and date formatting. |

### Atspi.ModifierType

GType: `AtspiModifierType` ?? C type: `AtspiModifierType`

The left or right 'Shift' key.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| alt | 3 | alt | The Alt key (as opposed to AltGr). |
| control | 2 | control | 'Control'/'Ctrl'. |
| meta | 4 | meta | Depending on the platform, this may map to 'Window', 'Function', 'Meta', 'Menu', or 'NumLock'. Such 'Meta keys' will map to one of META, META2, MET... |
| meta2 | 5 | meta2 | See @ATSPI_MODIFIER_META. |
| meta3 | 6 | meta3 | See @ATSPI_MODIFIER_META. |
| numlock | 14 | numlock | A symbolic meta key name that is mapped by AT-SPI to the appropriate META value, for the convenience of the client. |
| shift | 0 | shift | The left or right 'Shift' key. |
| shiftlock | 1 | shiftlock | The ShiftLock or CapsLock key. |

### Atspi.RelationType

GType: `AtspiRelationType` ?? C type: `AtspiRelationType`

#AtspiRelationType specifies a relationship between objects (possibly one-to-many or many-to-one) outside of the normal parent/child hierarchical r...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| controlled_by | 4 | controlled-by | Object state, position, etc. is modified/controlled by user interaction with one or more other objects. For instance a viewport or scroll pane may ... |
| controller_for | 3 | controller-for | Object is an interactive object which modifies the state, onscreen location, or other attributes of one or more target objects. |
| described_by | 18 | described-by | Reciprocal of %ATSPI_RELATION_DESCRIPTION_FOR. Indicates that one or more target objects provide descriptive information about this object. This re... |
| description_for | 17 | description-for | Reciprocal of %ATSPI_RELATION_DESCRIBED_BY. Indicates that this object provides descriptive information about the target object(s). See also %ATSPI... |
| details | 19 | details | Reciprocal of %ATSPI_RELATION_DETAILS_FOR. Indicates that this object has a detailed or extended description, the contents of which can be found in... |
| details_for | 20 | details-for | Reciprocal of %ATSPI_RELATION_DETAILS. Indicates that this object provides a detailed or extended description about the target object(s). See also ... |
| embedded_by | 14 | embedded-by | Reciprocal of @ATSPI_RELATION_EMBEDS. Used to denote content rendered by embedded renderers that live in a separate process space from the embeddin... |
| embeds | 13 | embeds | Similar to @ATSPI_RELATION_SUBWINDOW_OF, but specifically used for cross-process embedding. |
| error_for | 22 | error-for | Reciprocal of %ATSPI_RELATION_ERROR_MESSAGE. Indicates that this object contains an error message describing an invalid condition in the target obj... |
| error_message | 21 | error-message | Reciprocal of %ATSPI_RELATION_ERROR_FOR. Indicates that this object has one or more errors, the nature of which is described in the contents of the... |
| extended | 9 | extended | Used to indicate that a relationship exists, but its type is not specified in the enumeration. |
| flows_from | 11 | flows-from | Reciprocal of @ATSPI_RELATION_FLOWS_TO. |
| flows_to | 10 | flows-to | Object renders content which flows logically to another object. For instance, text in a paragraph may flow to another object which is not the 'next... |
| label_for | 1 | label-for | Object is a label for one or more other objects. |
| labelled_by | 2 | labelled-by | Object is labelled by one or more other objects. |
| last_defined | 23 | last-defined | Do not use as a parameter value, used to determine the size of the enumeration. |
| member_of | 5 | member-of | Object has a grouping relationship (e.g. 'same group as') to one or more other objects. |
| node_child_of | 7 | node-child-of | Object is a child of the target. |
| node_parent_of | 8 | node-parent-of | Object is a parent of the target. |
| null | 0 | null | Not a meaningful relationship; clients should not normally encounter this #AtspiRelationType value. |
| parent_window_of | 16 | parent-window-of | This is the reciprocal relation to @ATSPI_RELATION_POPUP_FOR. |
| popup_for | 15 | popup-for | Denotes that the object is a transient window or frame associated with another onscreen object. Similar to @ATSPI_TOOLTIP_FOR, but more general. Us... |
| subwindow_of | 12 | subwindow-of | Object is visually and semantically considered a subwindow of another object, even though it is not the object's child. Useful when dealing with em... |
| tooltip_for | 6 | tooltip-for | Object is a tooltip associated with another object. |

### Atspi.Role

GType: `AtspiRole` ?? C type: `AtspiRole`

Enumeration used by interface #AtspiAccessible to specify the role of an #AtspiAccessible object.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accelerator_label | 1 | accelerator-label | Object is a label indicating the keyboard accelerators for the parent. |
| alert | 2 | alert | Object is used to alert the user about something. |
| animation | 3 | animation | Object contains a dynamic or moving image of some kind. |
| application | 75 | application | An object corresponding to the toplevel accessible of an application, which may contain @ATSPI_ROLE_FRAME objects or other accessible objects. Chil... |
| arrow | 4 | arrow | Object is a 2d directional indicator. |
| article | 109 | article | A section of a page that consists of a composition that forms an independent part of a document, page, or site. Examples: A blog entry, a news stor... |
| audio | 106 | audio | An object which represents an audio element. @Since: 2.12 |
| autocomplete | 76 | autocomplete | The object is a dialog or list containing items for insertion into an entry widget, for instance a list of words for completion of a text entry. |
| block_quote | 105 | block-quote | An object which contains a text section that is quoted from another source. @Since: 2.12 |
| calendar | 5 | calendar | Object contains one or more dates, usually arranged into a 2d list. |
| canvas | 6 | canvas | Object that can be drawn into and is used to trap events. |
| caption | 81 | caption | The object contains descriptive information, usually textual, about another user interface element such as a table, chart, or image. |
| chart | 80 | chart | The object is a graphical depiction of quantitative data. It may contain multiple subelements whose attributes and/or description may be queried to... |
| check_box | 7 | check-box | A choice that can be checked or unchecked and provides a separate indicator for the current state. |
| check_menu_item | 8 | check-menu-item | A menu item that behaves like a check box. See @ATSPI_ROLE_CHECK_BOX. |
| color_chooser | 9 | color-chooser | A specialized dialog that lets the user choose a color. |
| column_header | 10 | column-header | The header for a column of data. |
| combo_box | 11 | combo-box | A list of choices the user can select from. |
| comment | 97 | comment | An object found within a document and designed to present a comment, note, or other annotation. In some cases, this object might not be visible unt... |
| content_deletion | 125 | content-deletion | Content previously deleted or proposed to be deleted, e.g. in revision history or a content view providing suggestions from reviewers. @Since: 2.34. |
| content_insertion | 126 | content-insertion | Content previously inserted or proposed to be inserted, e.g. in revision history or a content view providing suggestions from reviewers. @Since: 2.34. |
| date_editor | 12 | date-editor | An object which allows entry of a date. |
| definition | 108 | definition | A definition of a term or concept. @Since: 2.12 |
| description_list | 121 | description-list | An object that represents a list of term-value groups. A term-value group represents an individual description and consist of one or more names (@A... |
| description_term | 122 | description-term | An object that represents a term or phrase with a corresponding definition. @Since: 2.26. |
| description_value | 123 | description-value | An object that represents the description, definition, or value of a term. @Since: 2.26. |
| desktop_frame | 14 | desktop-frame | A pane that supports internal frames and iconified versions of those internal frames. |
| desktop_icon | 13 | desktop-icon | An inconifed internal frame within a DESKTOP_FRAME. |
| dial | 15 | dial | An object that allows a value to be changed via rotating a visual element, or which displays a value via such a rotating element. |
| dialog | 16 | dialog | A top level window with title bar and a border. |
| directory_pane | 17 | directory-pane | A pane that allows the user to navigate through and select the contents of a directory. |
| document_email | 96 | document-email | A document frame which contains email content to be displayed or composed either in plain text or HTML. |
| document_frame | 82 | document-frame | The object is a visual frame or container which contains a view of document content. #AtspiDocument frames may occur within another #AtspiDocument ... |
| document_presentation | 93 | document-presentation | A document frame which contains a presentation or slide content. |
| document_spreadsheet | 92 | document-spreadsheet | A document frame which contains a spreadsheet. |
| document_text | 94 | document-text | A document frame which contains textual content, such as found in a word processing application. |
| document_web | 95 | document-web | A document frame which contains HTML or other markup suitable for display in a web browser. |
| drawing_area | 18 | drawing-area | An object used for drawing custom user interface elements. |
| editbar | 77 | editbar | The object is an editable text object in a toolbar. |
| embedded | 78 | embedded | The object is an embedded component container. This role is a "grouping" hint that the contained objects share a context which is different from th... |
| entry | 79 | entry | The object is a component whose textual content may be entered or modified by the user, provided @ATSPI_STATE_EDITABLE is present. A readonly @ATSP... |
| extended | 70 | extended | means that the role for this item is known, but not included in the core enumeration. Deprecated since 2.24. |
| file_chooser | 19 | file-chooser | A specialized dialog that displays the files in the directory and lets the user select a file, browse a different directory, or specify a filename. |
| filler | 20 | filler | A object that fills up space in a user interface. |
| focus_traversable | 21 | focus-traversable | Don't use, reserved for future use. |
| font_chooser | 22 | font-chooser | Allows selection of a display font. |
| footer | 72 | footer | An object that serves as a document footer. |
| footnote | 124 | footnote | An object that contains the text of a footnote. @Since: 2.26. |
| form | 87 | form | The object is a containing instance of document content which has within it components with which the user can interact in order to input informati... |
| frame | 23 | frame | A top level window with a title bar, border, menubar, etc. |
| glass_pane | 24 | glass-pane | A pane that is guaranteed to be painted on top of all panes beneath it. |
| grouping | 99 | grouping | A group of related widgets. This group typically has a label. |
| header | 71 | header | An object that serves as a document header. |
| heading | 83 | heading | The object serves as a heading for content which follows it in a document. The 'heading level' of the heading, if availabe, may be obtained by quer... |
| html_container | 25 | html-container | A document container for HTML, whose children represent the document content. |
| icon | 26 | icon | A small fixed size picture, typically used to decorate components. |
| image | 27 | image | An image, typically static. |
| image_map | 100 | image-map | An image map object. Usually a graphic with multiple hotspots, where each hotspot can be activated resulting in the loading of another document or ... |
| info_bar | 102 | info-bar | An object designed to present a message to the user within an existing window. |
| input_method_window | 89 | input-method-window | The object is a window or similar viewport which is used to allow composition or input of a 'complex character', in other words it is an "input met... |
| internal_frame | 28 | internal-frame | A frame-like object that is clipped by a desktop pane. |
| invalid | 0 | invalid | A role indicating an error condition, such as uninitialized Role data. |
| label | 29 | label | An object used to present an icon or short string in an interface. |
| landmark | 110 | landmark | A region of a web page intended as a navigational landmark. This is designed to allow Assistive Technologies to provide quick navigation among key ... |
| last_defined | 130 | last-defined | Not a valid role, used for finding end of enumeration. |
| layered_pane | 30 | layered-pane | A specialized pane that allows its children to be drawn in layers, providing a form of stacking order. |
| level_bar | 103 | level-bar | A bar that serves as a level indicator to, for instance, show the strength of a password or the state of a battery. @Since: 2.8 |
| link | 88 | link | The object is a hypertext anchor, i.e. a "link" in a hypertext document. Such objects are distinct from 'inline' content which may also use the #At... |
| list | 31 | list | An object that presents a list of objects to the user and allows the user to select one or more of them. |
| list_box | 98 | list-box | A non-collapsible list of choices the user can select from. |
| list_item | 32 | list-item | An object that represents an element of a list. |
| log | 111 | log | A text widget or container holding log content, such as chat history and error logs. In this role there is a relationship between the arrival of ne... |
| mark | 127 | mark | A run of content that is marked or highlighted, such as for reference purposes, or to call it out as having a special purpose. If the marked conten... |
| marquee | 112 | marquee | A container where non-essential information changes frequently. Common usages of marquee include stock tickers and ad banners. The primary differen... |
| math | 113 | math | A text widget or container that holds a mathematical expression. @Since: 2.12 |
| math_fraction | 117 | math-fraction | An object that represents a mathematical fraction. @Since: 2.16. |
| math_root | 118 | math-root | An object that represents a mathematical expression displayed with a radical. @Since: 2.16. |
| menu | 33 | menu | An object usually found inside a menu bar that contains a list of actions the user can choose from. |
| menu_bar | 34 | menu-bar | An object usually drawn at the top of the primary dialog box of an application that contains a list of menus the user can choose from. |
| menu_item | 35 | menu-item | An object usually contained in a menu that presents an action the user can choose. |
| notification | 101 | notification | A transitory object designed to present a message to the user, typically at the desktop level rather than inside a particular application. |
| option_pane | 36 | option-pane | A specialized pane whose primary use is inside a dialog. |
| page | 84 | page | The object is a containing instance which encapsulates a page of information. @ATSPI_ROLE_PAGE is used in documents and content which support a pag... |
| page_tab | 37 | page-tab | An object that is a child of a page tab list. |
| page_tab_list | 38 | page-tab-list | An object that presents a series of panels (or page tabs), one at a time,through some mechanism provided by the object. |
| panel | 39 | panel | A generic container that is often used to group objects. |
| paragraph | 73 | paragraph | An object which is contains a single paragraph of text content. See also @ATSPI_ROLE_TEXT. |
| password_text | 40 | password-text | A text object uses for passwords, or other places where the text content is not shown visibly to the user. |
| popup_menu | 41 | popup-menu | A temporary window that is usually used to offer the user a list of choices, and then hides when the user selects one of those choices. |
| progress_bar | 42 | progress-bar | An object used to indicate how much of a task has been completed. |
| push_button | 43 | push-button | An object the user can manipulate to tell the application to do something. |
| push_button_menu | 129 | push-button-menu | A specialized push button to open a menu. @Since 2.46 |
| radio_button | 44 | radio-button | A specialized check box that will cause other radio buttons in the same group to become unchecked when this one is checked. |
| radio_menu_item | 45 | radio-menu-item | Object is both a menu item and a "radio button" . See @ATSPI_ROLE_RADIO_BUTTON. |
| rating | 114 | rating | A widget whose purpose is to display a rating, such as the number of stars associated with a song in a media player. Objects of this role should al... |
| redundant_object | 86 | redundant-object | The object is redundant with another object in the hierarchy, and is exposed for purely technical reasons. Objects of this role should be ignored b... |
| root_pane | 46 | root-pane | A specialized pane that has a glass pane and a layered pane as its children. |
| row_header | 47 | row-header | The header for a row of data. |
| ruler | 74 | ruler | An object which describes margins and tab stops, etc. for text objects which it controls (should have @ATSPI_RELATION_CONTROLLER_FOR relation to su... |
| scroll_bar | 48 | scroll-bar | An object usually used to allow a user to incrementally view a large amount of data by moving the bounds of a viewport along a one-dimensional axis. |
| scroll_pane | 49 | scroll-pane | An object that allows a user to incrementally view a large amount of information. @ATSPI_ROLE_SCROLL_PANE objects are usually accompanied by @ATSPI... |
| section | 85 | section | The object is a containing instance of document content which constitutes a particular 'logical' section of the document. The type of content withi... |
| separator | 50 | separator | An object usually contained in a menu to provide a visible and logical separation of the contents in a menu. |
| slider | 51 | slider | An object that allows the user to select from a bounded range. Unlike @ATSPI_ROLE_SCROLL_BAR, @ATSPI_ROLE_SLIDER objects need not control 'viewport... |
| spin_button | 52 | spin-button | An object which allows one of a set of choices to be selected, and which displays the current choice. |
| split_pane | 53 | split-pane | A specialized panel that presents two other panels at the same time. |
| static | 116 | static | A generic non-container object whose purpose is to display a brief amount of information to the user and whose role is known by the implementor but... |
| status_bar | 54 | status-bar | Object displays non-quantitative status information (c.f. @ATSPI_ROLE_PROGRESS_BAR) |
| subscript | 119 | subscript | An object that contains text that is displayed as a subscript. @Since: 2.16. |
| suggestion | 128 | suggestion | A container for content that is called out as a proposed change from the current version of the document, such as by a reviewer of the content. An ... |
| superscript | 120 | superscript | An object that contains text that is displayed as a superscript. @Since: 2.16. |
| table | 55 | table | An object used to repesent information in terms of rows and columns. |
| table_cell | 56 | table-cell | A 'cell' or discrete child within a Table. Note: Table cells need not have @ATSPI_ROLE_TABLE_CELL, other #AtspiRoleType values are valid as well. |
| table_column_header | 57 | table-column-header | An object which labels a particular column in an #AtspiTable. |
| table_row | 90 | table-row | A row in a table. |
| table_row_header | 58 | table-row-header | An object which labels a particular row in a #AtspiTable. #AtspiTable rows and columns may also be labelled via the @ATSPI_RELATION_LABEL_FOR/@ATSP... |
| tearoff_menu_item | 59 | tearoff-menu-item | Object allows menu to be removed from menubar and shown in its own window. |
| terminal | 60 | terminal | An object that emulates a terminal. |
| text | 61 | text | An interactive widget that supports multiple lines of text and optionally accepts user input, but whose purpose is not to solicit user input. Thus ... |
| timer | 115 | timer | An object containing a numerical counter which indicates an amount of elapsed time from a start point, or the time remaining until an end point. @S... |
| title_bar | 104 | title-bar | A bar that serves as the title of a window or a dialog. @Since: 2.12 |
| toggle_button | 62 | toggle-button | A specialized push button that can be checked or unchecked, but does not procide a separate indicator for the current state. |
| tool_bar | 63 | tool-bar | A bar or palette usually composed of push buttons or toggle buttons. |
| tool_tip | 64 | tool-tip | An object that provides information about another object. |
| tree | 65 | tree | An object used to repsent hierarchical information to the user. |
| tree_item | 91 | tree-item | An object that represents an element of a tree. |
| tree_table | 66 | tree-table | An object that presents both tabular and hierarchical info to the user. |
| unknown | 67 | unknown | The object contains some #AtspiAccessible information, but its role is not known. |
| video | 107 | video | An object which represents a video element. @Since: 2.12 |
| viewport | 68 | viewport | An object usually used in a scroll pane, or to otherwise clip a larger object or content renderer to a specific onscreen viewport. |
| window | 69 | window | A top level window with no title or border. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_localized_name | `get_localized_name(role: Role) -> utf8` | atspi_role_get_localized_name |  | Gets the localized description string describing the #AtspiRole @role. |
| get_name | `get_name(role: Role) -> utf8` | atspi_role_get_name |  | Gets a localizable string that indicates the name of an #AtspiRole. |

### Atspi.ScrollType

GType: `AtspiScrollType` ?? C type: `AtspiScrollType`

Enumeration used by interface #AtspiAccessible to specify where an #AtspiAccessible object should be placed on the screen when using scroll_to.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| anywhere | 6 | anywhere | Scroll the object to application-dependent position on the window. |
| bottom_edge | 3 | bottom-edge | Scroll the object to the bottom edge of the window. |
| bottom_right | 1 | bottom-right | Scroll the object to the bottom right corner of the window. |
| left_edge | 4 | left-edge | Scroll the object to the left edge of the window. |
| right_edge | 5 | right-edge | Scroll the object to the right edge of the window. |
| top_edge | 2 | top-edge | Scroll the object to the top edge of the window. |
| top_left | 0 | top-left | Scroll the object to the top left corner of the window. |

### Atspi.StateType

GType: `AtspiStateType` ?? C type: `AtspiStateType`

Enumeration used by various interfaces indicating every possible state an #AtspiAccesible object can assume.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| active | 1 | active | Indicates a window is currently the active window, or an object is the active subelement within a container or table. @ATSPI_STATE_ACTIVE should no... |
| animated | 35 | animated | Indicates this object's visual representation is dynamic, not static. This state may be applied to an object during an animated 'effect' and be rem... |
| armed | 2 | armed | Indicates that the object is armed. |
| busy | 3 | busy | Indicates the current object is busy, i.e. onscreen representation is in the process of changing, or the object is temporarily unavailable for inte... |
| checkable | 41 | checkable | Indicates this object has the potential to be checked, such as a checkbox or toggle-able table cell. @Since: 2.12 |
| checked | 4 | checked | Indicates this object is currently checked. |
| collapsed | 5 | collapsed | Indicates this object is collapsed. |
| defunct | 6 | defunct | Indicates that this object no longer has a valid backing widget (for instance, if its peer object has been destroyed). |
| editable | 7 | editable | Indicates the user can change the contents of this object. |
| enabled | 8 | enabled | Indicates that this object is enabled, i.e. that it currently reflects some application state. Objects that are "greyed out" may lack this state, a... |
| expandable | 9 | expandable | Indicates this object allows progressive disclosure of its children. |
| expanded | 10 | expanded | Indicates this object is expanded. |
| focusable | 11 | focusable | Indicates this object can accept keyboard focus, which means all events resulting from typing on the keyboard will normally be passed to it when it... |
| focused | 12 | focused | Indicates this object currently has the keyboard focus. |
| has_popup | 42 | has-popup | Indicates that the object has a popup context menu or sub-level menu which may or may not be showing. This means that activation renders conditiona... |
| has_tooltip | 13 | has-tooltip | Indicates that the object has an associated tooltip. |
| horizontal | 14 | horizontal | Indicates the orientation of this object is horizontal. |
| iconified | 15 | iconified | Indicates this object is minimized and is represented only by an icon. |
| indeterminate | 32 | indeterminate | Indicates that a check box or other boolean indicator is in a state other than checked or not checked. This usually means that the boolean value re... |
| invalid | 0 | invalid | Indicates an invalid state - probably an error condition. |
| invalid_entry | 36 | invalid-entry | This object has indicated an error condition due to failure of input validation. For instance, a form control may acquire this state in response to... |
| is_default | 39 | is-default | This state indicates that the object in question is the 'default' interaction object in a dialog, i.e. the one that gets activated if the user pres... |
| last_defined | 44 | last-defined | This value of the enumeration should not be used as a parameter, it indicates the number of items in the #AtspiStateType enumeration. |
| manages_descendants | 31 | manages-descendants | Indicates that "active-descendant-changed" event is sent when children become 'active' (i.e. are selected or navigated to onscreen). Used to preven... |
| modal | 16 | modal | Indicates something must be done with this object before the user can interact with an object in a different window. |
| multi_line | 17 | multi-line | Indicates this (text) object can contain multiple lines of text. |
| multiselectable | 18 | multiselectable | Indicates this object allows more than one of its children to be selected at the same time, or in the case of text objects, that the object support... |
| opaque | 19 | opaque | Indicates this object paints every pixel within its rectangular region. It also indicates an alpha value of unity, if it supports alpha blending. |
| pressed | 20 | pressed | Indicates this object is currently pressed. |
| read_only | 43 | read-only | Indicates that an object which is ENABLED and SENSITIVE has a value which can be read, but not modified, by the user. @Since: 2.16 |
| required | 33 | required | Indicates that user interaction with this object is 'required' from the user, for instance before completing the processing of a form. |
| resizable | 21 | resizable | Indicates the size of this object's size is not fixed. |
| selectable | 22 | selectable | Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that can be se... |
| selectable_text | 38 | selectable-text | This state indicates that the object in question supports text selection. It should only be exposed on objects which implement the #AtspiText inter... |
| selected | 23 | selected | Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that has been ... |
| sensitive | 24 | sensitive | Indicates this object is sensitive, e.g. to user interaction. @ATSPI_STATE_SENSITIVE usually accompanies. @ATSPI_STATE_ENABLED for user-actionable ... |
| showing | 25 | showing | Indicates this object, the object's parent, the object's parent's parent, and so on, are all 'shown' to the end-user, i.e. subject to "exposure" if... |
| single_line | 26 | single-line | Indicates this (text) object can contain only a single line of text. |
| stale | 27 | stale | Indicates that the information returned for this object may no longer be synchronized with the application state. This can occur if the object has ... |
| supports_autocompletion | 37 | supports-autocompletion | This state indicates that the object in question implements some form of typeahead or pre-selection behavior whereby entering the first character o... |
| transient | 28 | transient | Indicates this object is transient. |
| truncated | 34 | truncated | Indicates that an object's onscreen content is truncated, e.g. a text value in a spreadsheet cell. |
| vertical | 29 | vertical | Indicates the orientation of this object is vertical; for example this state may appear on such objects as scrollbars, text objects (with vertical ... |
| visible | 30 | visible | Indicates this object is visible, e.g. has been explicitly marked for exposure to the user. @ATSPI_STATE_VISIBLE is no guarantee that the object is... |
| visited | 40 | visited | This state indicates that the object (typically a hyperlink) has already been activated or invoked, with the result that some backing data has been... |

### Atspi.TextBoundaryType

GType: `AtspiTextBoundaryType` ?? C type: `AtspiTextBoundaryType`

Specifies the boundary conditions determining a run of text as returned from #atspi_text_get_text_at_offset, #atspi_text_get_text_after_offset, and...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| char | 0 | char | An #AtspiText instance is bounded by this character only. Start and end offsets differ by one, by definition, for this value. |
| line_end | 6 | line-end | Boundary condition is the end of a line; i.e. range is from start of one line to the start of another. This generally means that an end-of-line cha... |
| line_start | 5 | line-start | Boundary condition is the start of a line; i.e. range is from start of one line to the start of another. This generally means that an end-of-line c... |
| sentence_end | 4 | sentence-end | Boundary condition is end of a sentence, as determined by the application, including the sentence-delimiting character, for instance '.' Some local... |
| sentence_start | 3 | sentence-start | Boundary condition is start of a sentence, as determined by the application. Some locales or character sets may not include explicit sentence delim... |
| word_end | 2 | word-end | Boundary condition is the end of a word; i.e. range is from the end of one word to the end of another. Some locales may not distinguish between wor... |
| word_start | 1 | word-start | Boundary condition is start of a word; i.e. range is from start of one word to the start of another word. |

### Atspi.TextClipType

GType: `AtspiTextClipType` ?? C type: `AtspiTextClipType`

Enumeration used by interface #AtspiText to indicate how to treat characters intersecting bounding boxes.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| both | 3 | both | Only glyphs falling entirely within the region bounded by min and max are retained. |
| max | 2 | max | Characters/glyphs which intersect the maximum coordinate are omitted. |
| min | 1 | min | Characters/glyphs clipped by the minimum coordinate are omitted. |
| none | 0 | none | No characters/glyphs are omitted. |

### Atspi.TextGranularity

GType: `AtspiTextGranularity` ?? C type: `AtspiTextGranularity`

Text granularity types used for specifying the granularity of the region of text we are interested in.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| char | 0 | char | Granularity is defined by the boundaries between characters (including non-printing characters) |
| line | 3 | line | Granularity is defined by the boundaries of a line, starting at the beginning of the current line and finishing at the beginning of the following o... |
| paragraph | 4 | paragraph | Granularity is defined by the boundaries of a paragraph, starting at the beginning of the current paragraph and finishing at the beginning of the f... |
| sentence | 2 | sentence | Granularity is defined by the boundaries of a sentence, starting at the beginning of the current sentence and finishing at the beginning of the fol... |
| word | 1 | word | Granularity is defined by the boundaries of a word, starting at the beginning of the current word and finishing at the beginning of the following o... |

## Flags

### Atspi.Cache

GType: `AtspiCache` ?? C type: `AtspiCache`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all | 1073741823 | all |  |
| attributes | 128 | attributes |  |
| children | 2 | children |  |
| default | 127 | default |  |
| description | 8 | description |  |
| interfaces | 64 | interfaces |  |
| name | 4 | name |  |
| none | 0 | none |  |
| parent | 1 | parent |  |
| role | 32 | role |  |
| states | 16 | states |  |
| undefined | 1073741824 | undefined |  |

### Atspi.KeyListenerSyncType

GType: `AtspiKeyListenerSyncType` ?? C type: `AtspiKeyListenerSyncType`

Specifies the type of a key listener event. The values above can and should be bitwise-'OR'-ed together, observing the compatibility limitations sp...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| all_windows | 4 | all-windows | Events are received not from the application toolkit layer, but from the device driver or windowing system subsystem; such notifications are 'globa... |
| canconsume | 2 | canconsume | Events may be consumed by the AT client. Presumes and requires #ATSPI_KEYLISTENER_SYNCHRONOUS, incompatible with #ATSPI_KEYLISTENER_NOSYNC. |
| nosync | 0 | nosync | Events may be delivered asynchronously, which means in some cases they may already have been delivered to the application before the AT client rece... |
| synchronous | 1 | synchronous | Events are delivered synchronously, before the currently focused application sees them. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AccessibleClass |  | 0 | 0 | 0 |  |
| AccessiblePrivate |  | 0 | 0 | 0 |  |
| ApplicationClass |  | 0 | 0 | 0 |  |
| DeviceClass |  | 0 | 0 | 0 | the device. |
| DeviceEvent |  | 0 | 0 | 0 |  |
| DeviceLegacyClass |  | 0 | 0 | 0 |  |
| DeviceListenerClass |  | 0 | 0 | 0 |  |
| DeviceX11Class |  | 0 | 0 | 0 |  |
| Event |  | 0 | 0 | 2 | Starts/enters the main event loop for the AT-SPI services. NOTE: This method does not return control; it is exited via a call to #atspi_event_quit ... |
| EventListenerClass |  | 0 | 0 | 0 |  |
| EventListenerMode |  | 0 | 0 | 0 |  |
| HyperlinkClass |  | 0 | 0 | 0 |  |
| KeyDefinition |  | 0 | 0 | 0 |  |
| KeySet |  | 0 | 0 | 0 | Structure containing identifying information about a set of keycode or keysyms. |
| MatchRuleClass |  | 0 | 0 | 0 |  |
| ObjectClass |  | 0 | 0 | 0 |  |
| Point |  | 0 | 0 | 1 |  |
| Range |  | 0 | 0 | 1 | Gets a copy of an #AtspiRange object. |
| Rect |  | 0 | 0 | 1 |  |
| RelationClass |  | 0 | 0 | 0 |  |
| StateSetClass |  | 0 | 0 | 0 |  |
| TextRange |  | 0 | 0 | 0 |  |
| TextSelection |  | 0 | 0 | 0 | This structure represents a single text selection within a document. This selection is defined by two points in the content, where each one is defi... |

### Atspi.AccessibleClass

C type: `AtspiAccessibleClass`

#### Fields

| Field | Type |
| --- | --- |
| mode_changed | none |
| parent_class | ObjectClass |
| region_changed | none |

### Atspi.AccessiblePrivate

C type: `AtspiAccessiblePrivate`

### Atspi.ApplicationClass

C type: `AtspiApplicationClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atspi.DeviceClass

C type: `AtspiDeviceClass`

the device.

#### Fields

| Field | Type |
| --- | --- |
| add_key_grab | gboolean |
| generate_mouse_event | none |
| get_locked_modifiers | guint |
| get_modifier | guint |
| grab_keyboard | gboolean |
| map_modifier | guint |
| parent_class | GObject.ObjectClass |
| remove_key_grab | none |
| ungrab_keyboard | none |
| unmap_modifier | none |

### Atspi.DeviceEvent

GType: `AtspiDeviceEvent` ?? C type: `AtspiDeviceEvent`

#### Fields

| Field | Type |
| --- | --- |
| event_string | utf8 |
| hw_code | gushort |
| id | guint |
| is_text | gboolean |
| modifiers | gushort |
| timestamp | guint |
| type | EventType |

### Atspi.DeviceLegacyClass

C type: `AtspiDeviceLegacyClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DeviceClass |

### Atspi.DeviceListenerClass

C type: `AtspiDeviceListenerClass`

#### Fields

| Field | Type |
| --- | --- |
| device_event | gboolean |
| parent_class | GObject.ObjectClass |

### Atspi.DeviceX11Class

C type: `AtspiDeviceX11Class`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | DeviceClass |

### Atspi.Event

GType: `AtspiEvent` ?? C type: `AtspiEvent`

Starts/enters the main event loop for the AT-SPI services. NOTE: This method does not return control; it is exited via a call to #atspi_event_quit ...

#### Fields

| Field | Type |
| --- | --- |
| any_data | GObject.Value |
| detail1 | gint |
| detail2 | gint |
| sender | Accessible |
| source | Accessible |
| type | utf8 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| main | `main() -> none` | atspi_event_main |  | Starts/enters the main event loop for the AT-SPI services. NOTE: This method does not return control; it is exited via a call to #atspi_event_quit ... |
| quit | `quit() -> none` | atspi_event_quit |  | Quits the last main event loop for the AT-SPI services, See: #atspi_event_main |

### Atspi.EventListenerClass

C type: `AtspiEventListenerClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atspi.EventListenerMode

C type: `AtspiEventListenerMode`

#### Fields

| Field | Type |
| --- | --- |
| global | gboolean |
| preemptive | gboolean |
| synchronous | gboolean |

### Atspi.HyperlinkClass

C type: `AtspiHyperlinkClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | ObjectClass |

### Atspi.KeyDefinition

GType: `AtspiKeyDefinition` ?? C type: `AtspiKeyDefinition`

#### Fields

| Field | Type |
| --- | --- |
| keycode | gint |
| keystring | utf8 |
| keysym | gint |
| modifiers | guint |

### Atspi.KeySet

C type: `AtspiKeySet`

Structure containing identifying information about a set of keycode or keysyms.

#### Fields

| Field | Type |
| --- | --- |
| keycodes | gushort |
| keystrings | utf8 |
| keysyms | guint |
| len | gshort |

### Atspi.MatchRuleClass

C type: `AtspiMatchRuleClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atspi.ObjectClass

C type: `AtspiObjectClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atspi.Point

GType: `AtspiPoint` ?? C type: `AtspiPoint`

#### Fields

| Field | Type |
| --- | --- |
| x | gint |
| y | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Point.copy() -> Point` | atspi_point_copy |  |  |

### Atspi.Range

GType: `AtspiRange` ?? C type: `AtspiRange`

Gets a copy of an #AtspiRange object.

#### Fields

| Field | Type |
| --- | --- |
| end_offset | gint |
| start_offset | gint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Range.copy() -> Range` | atspi_range_copy |  | Gets a copy of an #AtspiRange object. |

### Atspi.Rect

GType: `AtspiRect` ?? C type: `AtspiRect`

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
| copy | `Rect.copy() -> Rect` | atspi_rect_copy |  |  |

### Atspi.RelationClass

C type: `AtspiRelationClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atspi.StateSetClass

C type: `AtspiStateSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atspi.TextRange

GType: `AtspiTextRange` ?? C type: `AtspiTextRange`

#### Fields

| Field | Type |
| --- | --- |
| content | utf8 |
| end_offset | gint |
| start_offset | gint |

### Atspi.TextSelection

C type: `AtspiTextSelection`

This structure represents a single text selection within a document. This selection is defined by two points in the content, where each one is defi...

#### Fields

| Field | Type |
| --- | --- |
| end_object | Accessible |
| end_offset | gint |
| start_is_active | gboolean |
| start_object | Accessible |
| start_offset | gint |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dbus_connection_setup_with_g_main | `dbus_connection_setup_with_g_main(connection: DBus.Connection, context: GLib.MainContext) -> none` | atspi_dbus_connection_setup_with_g_main |  | Sets the watch and timeout functions of a #DBusConnection to integrate the connection with the GLib main loop. Pass in #NULL for the #GMainContext ... |
| dbus_server_setup_with_g_main | `dbus_server_setup_with_g_main(server: DBusServer*, context: GLib.MainContext) -> none` | atspi_dbus_server_setup_with_g_main |  | Sets the watch and timeout functions of a #DBusServer to integrate the server with the GLib main loop. In most cases the context argument should be... |
| deregister_device_event_listener | `deregister_device_event_listener(listener: DeviceListener, filter: gpointer?) -> gboolean throws` | atspi_deregister_device_event_listener |  | Removes a device event listener from the registry's listener queue, ceasing notification of events of the specified type. |
| deregister_keystroke_listener | `deregister_keystroke_listener(listener: DeviceListener, key_set: KeyDefinition?, modmask: KeyMaskType, event_types: KeyEventMask) -> gboolean throws` | atspi_deregister_keystroke_listener |  | Removes a keystroke event listener from the registry's listener queue, ceasing notification of events with modifiers matching @modmask. |
| event_main | `event_main() -> none` | atspi_event_main |  | Starts/enters the main event loop for the AT-SPI services. NOTE: This method does not return control; it is exited via a call to #atspi_event_quit ... |
| event_quit | `event_quit() -> none` | atspi_event_quit |  | Quits the last main event loop for the AT-SPI services, See: #atspi_event_main |
| exit | `exit() -> gint` | atspi_exit |  | Disconnects from #AtspiRegistry instances and releases any floating resources. Call only once at exit. |
| generate_keyboard_event | `generate_keyboard_event(keyval: glong, keystring: utf8?, synth_type: KeySynthType) -> gboolean throws` | atspi_generate_keyboard_event |  | Synthesizes a keyboard event (as if a hardware keyboard event occurred in the current UI context). |
| generate_mouse_event | `generate_mouse_event(x: glong, y: glong, name: utf8) -> gboolean throws` | atspi_generate_mouse_event |  | Synthesizes a mouse event at a specific screen coordinate. Most AT clients should use the #AccessibleAction interface when tempted to generate mous... |
| generate_mouse_event_async | `generate_mouse_event_async(x: glong, y: glong, name: utf8, callback: GenerateMouseEventCB?, callback_data: gpointer?) -> none throws` | atspi_generate_mouse_event_async |  | Like atspi_generate_mouse_event, but asynchronous. |
| get_a11y_bus | `get_a11y_bus() -> DBus.Connection` | atspi_get_a11y_bus |  |  |
| get_desktop | `get_desktop(i: gint) -> Accessible` | atspi_get_desktop |  | Gets the virtual desktop indicated by index @i. NOTE: currently multiple virtual desktops are not implemented; as a consequence, any @i value diffe... |
| get_desktop_count | `get_desktop_count() -> gint` | atspi_get_desktop_count |  | Gets the number of virtual desktops. NOTE: multiple virtual desktops are not implemented yet; as a consequence, this function always returns 1. |
| get_desktop_list | `get_desktop_list() -> Accessible` | atspi_get_desktop_list |  | Gets the list of virtual desktops. On return, @list will point to a newly-created, NULL terminated array of virtual desktop pointers. It is the res... |
| get_version | `get_version(major: out gint, minor: out gint, micro: out gint) -> none` | atspi_get_version | 2.50 | Returns the version of the AT-SPI library being used at runtime. |
| init | `init() -> gint` | atspi_init |  | Connects to the accessibility registry and initializes the SPI. |
| is_initialized | `is_initialized() -> gboolean` | atspi_is_initialized |  | Indicates whether AT-SPI has been initialized. |
| register_device_event_listener | `register_device_event_listener(listener: DeviceListener, event_types: DeviceEventMask, filter: gpointer?) -> gboolean throws` | atspi_register_device_event_listener |  | This function does nothing and should not be called. |
| register_keystroke_listener | `register_keystroke_listener(listener: DeviceListener, key_set: KeyDefinition?, modmask: KeyMaskType, event_types: KeyEventMask, sync_type: KeyListenerSyncType) -> gboolean throws` | atspi_register_keystroke_listener |  | Registers a listener for keystroke events, either pre-emptively for all windows (%ATSPI_KEYLISTENER_ALL_WINDOWS), non-preemptively (%ATSPI_KEYLISTE... |
| role_get_localized_name | `role_get_localized_name(role: Role) -> utf8` | atspi_role_get_localized_name |  | Gets the localized description string describing the #AtspiRole @role. |
| role_get_name | `role_get_name(role: Role) -> utf8` | atspi_role_get_name |  | Gets a localizable string that indicates the name of an #AtspiRole. |
| set_main_context | `set_main_context(cnx: GLib.MainContext) -> none` | atspi_set_main_context |  | Sets the main loop context that AT-SPI should assume is in use when setting an idle callback. This function should be called by application-side im... |
| set_reference_window | `set_reference_window(accessible: Accessible) -> none` | atspi_set_reference_window |  | Deprecated. This function no longer does anything and should not be used. |
| set_timeout | `set_timeout(val: gint, startup_time: gint) -> none` | atspi_set_timeout |  | Set the timeout used for method calls. If this is not set explicitly, a default of 800 ms is used. Note that at-spi2-registryd currently uses a tim... |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| DeviceListenerCB | `DeviceListenerCB(stroke: DeviceEvent, user_data: gpointer?) -> gboolean` |  |  | A callback function prototype via which clients receive device event notifications. |
| DeviceListenerSimpleCB | `DeviceListenerSimpleCB(stroke: DeviceEvent) -> gboolean` |  |  | Similar to #AtspiDeviceListenerCB, but with no user data. |
| EventListenerCB | `EventListenerCB(event: Event, user_data: gpointer?) -> none` |  |  | A function prototype for callbacks via which clients are notified of AT-SPI events. |
| EventListenerSimpleCB | `EventListenerSimpleCB(event: Event) -> none` |  |  | Like #AtspiEventlistenerCB, but with no user_data. |
| GenerateMouseEventCB | `GenerateMouseEventCB(user_data: gpointer?) -> none` |  |  |  |
| KeyCallback | `KeyCallback(device: Device, pressed: gboolean, keycode: guint, keysym: guint, modifiers: guint, keystring: utf8, user_data: gpointer?) -> none` |  |  | A callback that will be invoked when a key is pressed. |

## Constants

| Name | Type |
| --- | --- |
| COMPONENTLAYER_COUNT | gint |
| COORD_TYPE_COUNT | gint |
| DBUS_INTERFACE_ACCESSIBLE | utf8 |
| DBUS_INTERFACE_ACTION | utf8 |
| DBUS_INTERFACE_APPLICATION | utf8 |
| DBUS_INTERFACE_CACHE | utf8 |
| DBUS_INTERFACE_COLLECTION | utf8 |
| DBUS_INTERFACE_COMPONENT | utf8 |
| DBUS_INTERFACE_DEC | utf8 |
| DBUS_INTERFACE_DEVICE_EVENT_LISTENER | utf8 |
| DBUS_INTERFACE_DOCUMENT | utf8 |
| DBUS_INTERFACE_EDITABLE_TEXT | utf8 |
| DBUS_INTERFACE_EVENT_KEYBOARD | utf8 |
| DBUS_INTERFACE_EVENT_MOUSE | utf8 |
| DBUS_INTERFACE_EVENT_OBJECT | utf8 |
| DBUS_INTERFACE_EVENT_SCREEN_READER | utf8 |
| DBUS_INTERFACE_HYPERLINK | utf8 |
| DBUS_INTERFACE_HYPERTEXT | utf8 |
| DBUS_INTERFACE_IMAGE | utf8 |
| DBUS_INTERFACE_REGISTRY | utf8 |
| DBUS_INTERFACE_SELECTION | utf8 |
| DBUS_INTERFACE_SOCKET | utf8 |
| DBUS_INTERFACE_TABLE | utf8 |
| DBUS_INTERFACE_TABLE_CELL | utf8 |
| DBUS_INTERFACE_TEXT | utf8 |
| DBUS_INTERFACE_VALUE | utf8 |
| DBUS_NAME_REGISTRY | utf8 |
| DBUS_PATH_DEC | utf8 |
| DBUS_PATH_NULL | utf8 |
| DBUS_PATH_REGISTRY | utf8 |
| DBUS_PATH_ROOT | utf8 |
| DBUS_PATH_SCREEN_READER | utf8 |
| EVENTTYPE_COUNT | gint |
| KEYEVENTTYPE_COUNT | gint |
| KEYSYNTHTYPE_COUNT | gint |
| LOCALE_TYPE_COUNT | gint |
| MATCHTYPES_COUNT | gint |
| MODIFIERTYPE_COUNT | gint |
| RELATIONTYPE_COUNT | gint |
| ROLE_COUNT | gint |
| SCROLLTYPE_COUNT | gint |
| SORTORDER_COUNT | gint |
| STATETYPE_COUNT | gint |
| TEXT_BOUNDARY_TYPE_COUNT | gint |
| TEXT_CLIP_TYPE_COUNT | gint |
| TREETRAVERSALTYPE_COUNT | gint |

## Aliases

| Name | Type |
| --- | --- |
| ControllerEventMask | guint |
| DeviceEventMask | guint |
| KeyEventMask | guint |
| KeyMaskType | guint |
| KeystrokeListener | none |

