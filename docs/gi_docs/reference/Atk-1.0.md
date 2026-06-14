# Atk 1.0

SQGI import: `import("Atk", "1.0")`

Packages: `atk`
Includes: `GObject-2.0`
Libraries: `libatk-1.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 14 |
| Interfaces | 15 |
| Records | 37 |
| Unions | 0 |
| Enums | 13 |
| Flags | 1 |
| Functions | 37 |
| Callbacks | 6 |
| Constants | 6 |
| Aliases | 2 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| GObjectAccessible | Object | 0 | 0 | 2 | This object class is derived from AtkObject and can be used as a basis implementing accessible objects. This object class is derived from AtkObject... |
| Hyperlink | GObject.Object | 0 | 1 | 8 | An ATK object which encapsulates a link or set of links in a hypertext document. An ATK object which encapsulates a link or set of links (for insta... |
| Misc | GObject.Object | 0 | 0 | 3 | A set of ATK utility functions for thread locking A set of utility functions for thread locking. This interface and all his related methods are dep... |
| NoOpObject | Object | 0 | 0 | 1 | An AtkObject which purports to implement all ATK interfaces. An AtkNoOpObject is an AtkObject which purports to implement all ATK interfaces. It is... |
| NoOpObjectFactory | ObjectFactory | 0 | 0 | 1 | The AtkObjectFactory which creates an AtkNoOpObject. The AtkObjectFactory which creates an AtkNoOpObject. An instance of this is created by an AtkR... |
| Object | GObject.Object | 4 | 9 | 28 | The base object class for the Accessibility Toolkit API. This class is the primary class for accessibility support via the Accessibility ToolKit (A... |
| ObjectFactory | GObject.Object | 1 | 0 | 3 | The base object class for a factory used to create accessible objects for objects of a specific GType. This class is the base object class for a fa... |
| Plug | Object | 0 | 0 | 3 | Toplevel for embedding into other processes See [class@AtkSocket] |
| Registry | GObject.Object | 0 | 0 | 3 | An object used to store the GType of the factories used to create an accessible object for an object of a particular GType. The AtkRegistry is norm... |
| Relation | GObject.Object | 0 | 0 | 5 | An object used to describe a relation between a object and one or more other objects. An AtkRelation describes a relation between an object and one... |
| RelationSet | GObject.Object | 0 | 0 | 9 | A set of AtkRelations, normally the set of AtkRelations which an AtkObject has. The AtkRelationSet held by an object establishes its relationships ... |
| Socket | Object | 0 | 0 | 3 | Container for AtkPlug objects from other processes Together with #AtkPlug, #AtkSocket provides the ability to embed accessibles from one process in... |
| StateSet | GObject.Object | 0 | 0 | 11 | An AtkStateSet contains the states of an object. An AtkStateSet is a read-only representation of the full set of #AtkStates that apply to an object... |
| Util | GObject.Object | 0 | 0 | 0 | A set of ATK utility functions for event and toolkit support. A set of ATK utility functions which are used to support event registration of variou... |

### Atk.GObjectAccessible

Parent: `Object` ?? GType: `AtkGObjectAccessible` ?? C type: `AtkGObjectAccessible`

This object class is derived from AtkObject and can be used as a basis implementing accessible objects. This object class is derived from AtkObject...

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_object | `for_object(obj: GObject.Object) -> Object` | atk_gobject_accessible_for_object |  | Gets the accessible object for the specified @obj. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_object | `GObjectAccessible.get_object() -> GObject.Object` | atk_gobject_accessible_get_object |  | Gets the GObject for which @obj is the accessible object. |

### Atk.Hyperlink

Parent: `GObject.Object` ?? Implements: `Action` ?? GType: `AtkHyperlink` ?? C type: `AtkHyperlink`

An ATK object which encapsulates a link or set of links in a hypertext document. An ATK object which encapsulates a link or set of links (for insta...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_end_index | `Hyperlink.get_end_index() -> gint` | atk_hyperlink_get_end_index |  | Gets the index with the hypertext document at which this link ends. |
| get_n_anchors | `Hyperlink.get_n_anchors() -> gint` | atk_hyperlink_get_n_anchors |  | Gets the number of anchors associated with this hyperlink. |
| get_object | `Hyperlink.get_object(i: gint) -> Object` | atk_hyperlink_get_object |  | Returns the item associated with this hyperlinks nth anchor. For instance, the returned #AtkObject will implement #AtkText if @link_ is a text hype... |
| get_start_index | `Hyperlink.get_start_index() -> gint` | atk_hyperlink_get_start_index |  | Gets the index with the hypertext document at which this link begins. |
| get_uri | `Hyperlink.get_uri(i: gint) -> utf8` | atk_hyperlink_get_uri |  | Get a the URI associated with the anchor specified by @i of @link_. Multiple anchors are primarily used by client-side image maps. |
| is_inline | `Hyperlink.is_inline() -> gboolean` | atk_hyperlink_is_inline |  | Indicates whether the link currently displays some or all of its content inline. Ordinary HTML links will usually return %FALSE, but an inline &lt;... |
| is_selected_link | `Hyperlink.is_selected_link() -> gboolean` | atk_hyperlink_is_selected_link | 1.4 | Determines whether this AtkHyperlink is selected |
| is_valid | `Hyperlink.is_valid() -> gboolean` | atk_hyperlink_is_valid |  | Since the document that a link is associated with may have changed this method returns %TRUE if the link is still valid (with respect to the docume... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| end-index | gint | read |  |
| number-of-anchors | gint | read |  |
| selected-link | gboolean | read | Selected link |
| start-index | gint | read |  |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| link-activated | `` | none | last |  | The signal link-activated is emitted when a link is activated. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_end_index | `get_end_index() -> gint` |  |  | Gets the index with the hypertext document at which this link ends. |
| get_n_anchors | `get_n_anchors() -> gint` |  |  | Gets the number of anchors associated with this hyperlink. |
| get_object | `get_object(i: gint) -> Object` |  |  | Returns the item associated with this hyperlinks nth anchor. For instance, the returned #AtkObject will implement #AtkText if @link_ is a text hype... |
| get_start_index | `get_start_index() -> gint` |  |  | Gets the index with the hypertext document at which this link begins. |
| get_uri | `get_uri(i: gint) -> utf8` |  |  | Get a the URI associated with the anchor specified by @i of @link_. Multiple anchors are primarily used by client-side image maps. |
| is_selected_link | `is_selected_link() -> gboolean` |  | 1.4 | Determines whether this AtkHyperlink is selected |
| is_valid | `is_valid() -> gboolean` |  |  | Since the document that a link is associated with may have changed this method returns %TRUE if the link is still valid (with respect to the docume... |
| link_activated | `link_activated() -> none` |  |  |  |
| link_state | `link_state() -> guint` |  |  |  |

### Atk.Misc

Parent: `GObject.Object` ?? GType: `AtkMisc` ?? C type: `AtkMisc`

A set of ATK utility functions for thread locking A set of utility functions for thread locking. This interface and all his related methods are dep...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_instance | `get_instance() -> Misc` | atk_misc_get_instance | 1.13 | Obtain the singleton instance of AtkMisc for this application. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| threads_enter | `Misc.threads_enter() -> none` | atk_misc_threads_enter | 1.13 | Take the thread mutex for the GUI toolkit, if one exists. (This method is implemented by the toolkit ATK implementation layer; for instance, for GT... |
| threads_leave | `Misc.threads_leave() -> none` | atk_misc_threads_leave | 1.13 | Release the thread mutex for the GUI toolkit, if one exists. This method, and atk_misc_threads_enter, are needed in some situations by threaded app... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| threads_enter | `threads_enter() -> none` |  | 1.13 | Take the thread mutex for the GUI toolkit, if one exists. (This method is implemented by the toolkit ATK implementation layer; for instance, for GT... |
| threads_leave | `threads_leave() -> none` |  | 1.13 | Release the thread mutex for the GUI toolkit, if one exists. This method, and atk_misc_threads_enter, are needed in some situations by threaded app... |

### Atk.NoOpObject

Parent: `Object` ?? Implements: `Action`, `Component`, `Document`, `EditableText`, `Hypertext`, `Image`, `Selection`, `Table`, `TableCell`, `Text`, `Value`, `Window` ?? GType: `AtkNoOpObject` ?? C type: `AtkNoOpObject`

An AtkObject which purports to implement all ATK interfaces. An AtkNoOpObject is an AtkObject which purports to implement all ATK interfaces. It is...

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NoOpObject.new(obj: GObject.Object) -> Object` | atk_no_op_object_new |  | Provides a default (non-functioning stub) #AtkObject. Application maintainers should not use this method. |

### Atk.NoOpObjectFactory

Parent: `ObjectFactory` ?? GType: `AtkNoOpObjectFactory` ?? C type: `AtkNoOpObjectFactory`

The AtkObjectFactory which creates an AtkNoOpObject. The AtkObjectFactory which creates an AtkNoOpObject. An instance of this is created by an AtkR...

#### Fields

| Field | Type |
| --- | --- |
| parent | ObjectFactory |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `NoOpObjectFactory.new() -> ObjectFactory` | atk_no_op_object_factory_new |  | Creates an instance of an #AtkObjectFactory which generates primitive (non-functioning) #AtkObjects. |

### Atk.Object

Parent: `GObject.Object` ?? Subclasses: `GObjectAccessible`, `NoOpObject`, `Plug`, `Socket` ?? GType: `AtkObject` ?? C type: `AtkObject`

The base object class for the Accessibility Toolkit API. This class is the primary class for accessibility support via the Accessibility ToolKit (A...

#### Fields

| Field | Type |
| --- | --- |
| accessible_parent | Object |
| description | utf8 |
| layer | Layer |
| name | utf8 |
| parent | GObject.Object |
| relation_set | RelationSet |
| role | Role |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_relationship | `Object.add_relationship(relationship: RelationType, target: Object) -> gboolean` | atk_object_add_relationship |  | Adds a relationship of the specified type with the specified target. |
| connect_property_change_handler | `Object.connect_property_change_handler(handler: PropertyChangeHandler) -> guint` | atk_object_connect_property_change_handler |  | Calls @handler on property changes. |
| get_accessible_id | `Object.get_accessible_id() -> utf8` | atk_object_get_accessible_id | 2.34 | Gets the accessible id of the accessible. |
| get_attributes | `Object.get_attributes() -> AttributeSet` | atk_object_get_attributes | 1.12 | Get a list of properties applied to this object as a whole, as an #AtkAttributeSet consisting of name-value pairs. As such these attributes may be ... |
| get_description | `Object.get_description() -> utf8` | atk_object_get_description |  | Gets the accessible description of the accessible. |
| get_help_text | `Object.get_help_text() -> utf8` | atk_object_get_help_text | 2.52 | Gets the help text associated with the accessible. |
| get_index_in_parent | `Object.get_index_in_parent() -> gint` | atk_object_get_index_in_parent |  | Gets the 0-based index of this accessible in its parent; returns -1 if the accessible does not have an accessible parent. |
| get_layer | `Object.get_layer() -> Layer` | atk_object_get_layer |  | Gets the layer of the accessible. |
| get_mdi_zorder | `Object.get_mdi_zorder() -> gint` | atk_object_get_mdi_zorder |  | Gets the zorder of the accessible. The value G_MININT will be returned if the layer of the accessible is not ATK_LAYER_MDI. |
| get_n_accessible_children | `Object.get_n_accessible_children() -> gint` | atk_object_get_n_accessible_children |  | Gets the number of accessible children of the accessible. |
| get_name | `Object.get_name() -> utf8` | atk_object_get_name |  | Gets the accessible name of the accessible. |
| get_object_locale | `Object.get_object_locale() -> utf8` | atk_object_get_object_locale | 2.8 | Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale of @accessible. |
| get_parent | `Object.get_parent() -> Object` | atk_object_get_parent |  | Gets the accessible parent of the accessible. By default this is the one assigned with atk_object_set_parent(), but it is assumed that ATK implemen... |
| get_role | `Object.get_role() -> Role` | atk_object_get_role |  | Gets the role of the accessible. |
| initialize | `Object.initialize(data: gpointer?) -> none` | atk_object_initialize |  | This function is called when implementing subclasses of #AtkObject. It does initialization required for the new object. It is intended that this fu... |
| notify_state_change | `Object.notify_state_change(state: State, value: gboolean) -> none` | atk_object_notify_state_change |  | Emits a state-change signal for the specified state. Note that as a general rule when the state of an existing object changes, emitting a notificat... |
| peek_parent | `Object.peek_parent() -> Object` | atk_object_peek_parent |  | Gets the accessible parent of the accessible, if it has been manually assigned with atk_object_set_parent. Otherwise, this function returns %NULL. ... |
| ref_accessible_child | `Object.ref_accessible_child(i: gint) -> Object` | atk_object_ref_accessible_child |  | Gets a reference to the specified accessible child of the object. The accessible children are 0-based so the first accessible child is at index 0, ... |
| ref_relation_set | `Object.ref_relation_set() -> RelationSet` | atk_object_ref_relation_set |  | Gets the #AtkRelationSet associated with the object. |
| ref_state_set | `Object.ref_state_set() -> StateSet` | atk_object_ref_state_set |  | Gets a reference to the state set of the accessible; the caller must unreference it when it is no longer needed. |
| remove_property_change_handler | `Object.remove_property_change_handler(handler_id: guint) -> none` | atk_object_remove_property_change_handler |  | Removes a property change handler. |
| remove_relationship | `Object.remove_relationship(relationship: RelationType, target: Object) -> gboolean` | atk_object_remove_relationship |  | Removes a relationship of the specified type with the specified target. |
| set_accessible_id | `Object.set_accessible_id(id: utf8) -> none` | atk_object_set_accessible_id | 2.34 | Sets the accessible ID of the accessible. This is not meant to be presented to the user, but to be an ID which is stable over application developme... |
| set_description | `Object.set_description(description: utf8) -> none` | atk_object_set_description |  | Sets the accessible description of the accessible. You can't set the description to NULL. This is reserved for the initial value. In this aspect NU... |
| set_help_text | `Object.set_help_text(help_text: utf8) -> none` | atk_object_set_help_text | 2.52 | Sets the help text associated with the accessible. This can be used to expose context-sensitive information to help a user understand how to intera... |
| set_name | `Object.set_name(name: utf8) -> none` | atk_object_set_name |  | Sets the accessible name of the accessible. You can't set the name to NULL. This is reserved for the initial value. In this aspect NULL is similar ... |
| set_parent | `Object.set_parent(parent: Object) -> none` | atk_object_set_parent |  | Sets the accessible parent of the accessible. @parent can be NULL. |
| set_role | `Object.set_role(role: Role) -> none` | atk_object_set_role |  | Sets the role of the accessible. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| accessible-component-layer | gint | read |  |
| accessible-component-mdi-zorder | gint | read |  |
| accessible-description | utf8 | read, write |  |
| accessible-help-text | utf8 | read, write |  |
| accessible-hypertext-nlinks | gint | read |  |
| accessible-id | utf8 | read, write |  |
| accessible-name | utf8 | read, write |  |
| accessible-parent | Object | read, write |  |
| accessible-role | Role | read, write |  |
| accessible-table-caption | utf8 | read, write | Table caption. |
| accessible-table-caption-object | Object | read, write |  |
| accessible-table-column-description | utf8 | read, write | Accessible table column description. |
| accessible-table-column-header | Object | read, write | Accessible table column header. |
| accessible-table-row-description | utf8 | read, write | Accessible table row description. |
| accessible-table-row-header | Object | read, write | Accessible table row header. |
| accessible-table-summary | Object | read, write |  |
| accessible-value | gdouble | read, write | Numeric value of this object, in case being and AtkValue. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| active-descendant-changed | `arg1: Object` | none | last detailed |  | The "active-descendant-changed" signal is emitted by an object which has the state ATK_STATE_MANAGES_DESCENDANTS when the focus object in the objec... |
| announcement | `arg1: utf8` | none | last | 2.46 | The "announcement" signal can be emitted to pass an announcement on to be read by a screen reader. Depcrecated (2.50): Use AtkObject::notification ... |
| attribute-changed | `arg1: utf8, arg2: utf8` | none | last | 2.52 | The "attribute-changed" signal should be emitted when one of an object's attributes changes. |
| children-changed | `arg1: guint, arg2: Object` | none | last detailed |  | The signal "children-changed" is emitted when a child is added or removed from an object. It supports two details: "add" and "remove" |
| focus-event | `arg1: gboolean` | none | last |  | The signal "focus-event" is emitted when an object gained or lost focus. |
| notification | `arg1: utf8, arg2: gint` | none | last | 2.50 | The "notification" signal can be emitted to pass an announcement on to be read by a screen reader. |
| property-change | `arg1: PropertyValues` | none | last detailed |  | The signal "property-change" is emitted when an object's property value changes. @arg1 contains an #AtkPropertyValues with the name and the new val... |
| state-change | `arg1: utf8, arg2: gboolean` | none | last detailed |  | The "state-change" signal is emitted when an object's state changes. The detail value identifies the state type which has changed. |
| visible-data-changed | `` | none | last |  | The "visible-data-changed" signal is emitted when the visual appearance of the object changed. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| active_descendant_changed | `active_descendant_changed(child: gpointer?) -> none` |  |  |  |
| children_changed | `children_changed(change_index: guint, changed_child: gpointer?) -> none` |  |  |  |
| connect_property_change_handler | `connect_property_change_handler(handler: PropertyChangeHandler) -> guint` |  |  | Calls @handler on property changes. |
| focus_event | `focus_event(focus_in: gboolean) -> none` |  |  | The signal handler which is executed when there is a focus event for an object. This virtual function is deprecated since 2.9.4 and it should not b... |
| get_attributes | `get_attributes() -> AttributeSet` |  | 1.12 | Get a list of properties applied to this object as a whole, as an #AtkAttributeSet consisting of name-value pairs. As such these attributes may be ... |
| get_description | `get_description() -> utf8` |  |  | Gets the accessible description of the accessible. |
| get_index_in_parent | `get_index_in_parent() -> gint` |  |  | Gets the 0-based index of this accessible in its parent; returns -1 if the accessible does not have an accessible parent. |
| get_layer | `get_layer() -> Layer` |  |  | Gets the layer of the accessible. |
| get_mdi_zorder | `get_mdi_zorder() -> gint` |  |  | Gets the zorder of the accessible. The value G_MININT will be returned if the layer of the accessible is not ATK_LAYER_MDI. |
| get_n_children | `get_n_children() -> gint` |  |  |  |
| get_name | `get_name() -> utf8` |  |  | Gets the accessible name of the accessible. |
| get_object_locale | `get_object_locale() -> utf8` |  | 2.8 | Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale of @accessible. |
| get_parent | `get_parent() -> Object` |  |  | Gets the accessible parent of the accessible. By default this is the one assigned with atk_object_set_parent(), but it is assumed that ATK implemen... |
| get_role | `get_role() -> Role` |  |  | Gets the role of the accessible. |
| initialize | `initialize(data: gpointer?) -> none` |  |  | This function is called when implementing subclasses of #AtkObject. It does initialization required for the new object. It is intended that this fu... |
| property_change | `property_change(values: PropertyValues) -> none` |  |  |  |
| ref_child | `ref_child(i: gint) -> Object` |  |  |  |
| ref_relation_set | `ref_relation_set() -> RelationSet` |  |  | Gets the #AtkRelationSet associated with the object. |
| ref_state_set | `ref_state_set() -> StateSet` |  |  | Gets a reference to the state set of the accessible; the caller must unreference it when it is no longer needed. |
| remove_property_change_handler | `remove_property_change_handler(handler_id: guint) -> none` |  |  | Removes a property change handler. |
| set_description | `set_description(description: utf8) -> none` |  |  | Sets the accessible description of the accessible. You can't set the description to NULL. This is reserved for the initial value. In this aspect NU... |
| set_name | `set_name(name: utf8) -> none` |  |  | Sets the accessible name of the accessible. You can't set the name to NULL. This is reserved for the initial value. In this aspect NULL is similar ... |
| set_parent | `set_parent(parent: Object) -> none` |  |  | Sets the accessible parent of the accessible. @parent can be NULL. |
| set_role | `set_role(role: Role) -> none` |  |  | Sets the role of the accessible. |
| state_change | `state_change(name: utf8, state_set: gboolean) -> none` |  |  |  |
| visible_data_changed | `visible_data_changed() -> none` |  |  |  |

### Atk.ObjectFactory

Parent: `GObject.Object` ?? Subclasses: `NoOpObjectFactory` ?? GType: `AtkObjectFactory` ?? C type: `AtkObjectFactory`

The base object class for a factory used to create accessible objects for objects of a specific GType. This class is the base object class for a fa...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| create_accessible | `ObjectFactory.create_accessible(obj: GObject.Object) -> Object` | atk_object_factory_create_accessible |  | Provides an #AtkObject that implements an accessibility interface on behalf of @obj |
| get_accessible_type | `ObjectFactory.get_accessible_type() -> GType` | atk_object_factory_get_accessible_type |  | Gets the GType of the accessible which is created by the factory. |
| invalidate | `ObjectFactory.invalidate() -> none` | atk_object_factory_invalidate |  | Inform @factory that it is no longer being used to create accessibles. When called, @factory may need to inform #AtkObjects which it has created th... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| invalidate | `invalidate() -> none` |  |  | Inform @factory that it is no longer being used to create accessibles. When called, @factory may need to inform #AtkObjects which it has created th... |

### Atk.Plug

Parent: `Object` ?? Implements: `Component` ?? GType: `AtkPlug` ?? C type: `AtkPlug`

Toplevel for embedding into other processes See [class@AtkSocket]

#### Fields

| Field | Type |
| --- | --- |
| parent | Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Plug.new() -> Object` | atk_plug_new | 1.30 | Creates a new #AtkPlug instance. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_id | `Plug.get_id() -> utf8` | atk_plug_get_id | 1.30 | Gets the unique ID of an #AtkPlug object, which can be used to embed inside of an #AtkSocket using atk_socket_embed(). Internally, this calls a cla... |
| set_child | `Plug.set_child(child: Object) -> none` | atk_plug_set_child | 2.35.0 | Sets @child as accessible child of @plug and @plug as accessible parent of @child. @child can be NULL. In some cases, one can not use the AtkPlug t... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_object_id | `get_object_id() -> utf8` |  |  |  |

### Atk.Registry

Parent: `GObject.Object` ?? GType: `AtkRegistry` ?? C type: `AtkRegistry`

An object used to store the GType of the factories used to create an accessible object for an object of a particular GType. The AtkRegistry is norm...

#### Fields

| Field | Type |
| --- | --- |
| factory_singleton_cache | GLib.HashTable |
| factory_type_registry | GLib.HashTable |
| parent | GObject.Object |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_factory | `Registry.get_factory(type: GType) -> ObjectFactory` | atk_registry_get_factory |  | Gets an #AtkObjectFactory appropriate for creating #AtkObjects appropriate for @type. |
| get_factory_type | `Registry.get_factory_type(type: GType) -> GType` | atk_registry_get_factory_type |  | Provides a #GType indicating the #AtkObjectFactory subclass associated with @type. |
| set_factory_type | `Registry.set_factory_type(type: GType, factory_type: GType) -> none` | atk_registry_set_factory_type |  | Associate an #AtkObjectFactory subclass with a #GType. Note: The associated @factory_type will thereafter be responsible for the creation of new #A... |

### Atk.Relation

Parent: `GObject.Object` ?? GType: `AtkRelation` ?? C type: `AtkRelation`

An object used to describe a relation between a object and one or more other objects. An AtkRelation describes a relation between an object and one...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| relationship | RelationType |
| target | gpointer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Relation.new(targets: Object, n_targets: gint, relationship: RelationType) -> Relation` | atk_relation_new |  | Create a new relation for the specified key and the specified list of targets. See also atk_object_add_relationship(). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_target | `Relation.add_target(target: Object) -> none` | atk_relation_add_target | 1.9 | Adds the specified AtkObject to the target for the relation, if it is not already present. See also atk_object_add_relationship(). |
| get_relation_type | `Relation.get_relation_type() -> RelationType` | atk_relation_get_relation_type |  | Gets the type of @relation |
| get_target | `Relation.get_target() -> Object` | atk_relation_get_target |  | Gets the target list of @relation |
| remove_target | `Relation.remove_target(target: Object) -> gboolean` | atk_relation_remove_target |  | Remove the specified AtkObject from the target for the relation. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| relation-type | RelationType | read, write |  |
| target | GObject.ValueArray | read, write |  |

### Atk.RelationSet

Parent: `GObject.Object` ?? GType: `AtkRelationSet` ?? C type: `AtkRelationSet`

A set of AtkRelations, normally the set of AtkRelations which an AtkObject has. The AtkRelationSet held by an object establishes its relationships ...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| relations | gpointer |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `RelationSet.new() -> RelationSet` | atk_relation_set_new |  | Creates a new empty relation set. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add | `RelationSet.add(relation: Relation) -> none` | atk_relation_set_add |  | Add a new relation to the current relation set if it is not already present. This function ref's the AtkRelation so the caller of this function sho... |
| add_relation_by_type | `RelationSet.add_relation_by_type(relationship: RelationType, target: Object) -> none` | atk_relation_set_add_relation_by_type | 1.9 | Add a new relation of the specified type with the specified target to the current relation set if the relation set does not contain a relation of t... |
| contains | `RelationSet.contains(relationship: RelationType) -> gboolean` | atk_relation_set_contains |  | Determines whether the relation set contains a relation that matches the specified type. |
| contains_target | `RelationSet.contains_target(relationship: RelationType, target: Object) -> gboolean` | atk_relation_set_contains_target |  | Determines whether the relation set contains a relation that matches the specified pair formed by type @relationship and object @target. |
| get_n_relations | `RelationSet.get_n_relations() -> gint` | atk_relation_set_get_n_relations |  | Determines the number of relations in a relation set. |
| get_relation | `RelationSet.get_relation(i: gint) -> Relation` | atk_relation_set_get_relation |  | Determines the relation at the specified position in the relation set. |
| get_relation_by_type | `RelationSet.get_relation_by_type(relationship: RelationType) -> Relation` | atk_relation_set_get_relation_by_type |  | Finds a relation that matches the specified type. |
| remove | `RelationSet.remove(relation: Relation) -> none` | atk_relation_set_remove |  | Removes a relation from the relation set. This function unref's the #AtkRelation so it will be deleted unless there is another reference to it. |

### Atk.Socket

Parent: `Object` ?? Implements: `Component` ?? GType: `AtkSocket` ?? C type: `AtkSocket`

Container for AtkPlug objects from other processes Together with #AtkPlug, #AtkSocket provides the ability to embed accessibles from one process in...

#### Fields

| Field | Type |
| --- | --- |
| embedded_plug_id | utf8 |
| parent | Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Socket.new() -> Object` | atk_socket_new |  | Creates a new #AtkSocket. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| embed | `Socket.embed(plug_id: utf8) -> none` | atk_socket_embed | 1.30 | Embeds the children of an #AtkPlug as the children of the #AtkSocket. The plug may be in the same process or in a different process. The class item... |
| is_occupied | `Socket.is_occupied() -> gboolean` | atk_socket_is_occupied | 1.30 | Determines whether or not the socket has an embedded plug. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| embed | `embed(plug_id: utf8) -> none` |  | 1.30 | Embeds the children of an #AtkPlug as the children of the #AtkSocket. The plug may be in the same process or in a different process. The class item... |

### Atk.StateSet

Parent: `GObject.Object` ?? GType: `AtkStateSet` ?? C type: `AtkStateSet`

An AtkStateSet contains the states of an object. An AtkStateSet is a read-only representation of the full set of #AtkStates that apply to an object...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `StateSet.new() -> StateSet` | atk_state_set_new |  | Creates a new empty state set. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_state | `StateSet.add_state(type: StateType) -> gboolean` | atk_state_set_add_state |  | Adds the state of the specified type to the state set if it is not already present. Note that because an #AtkStateSet is a read-only object, this m... |
| add_states | `StateSet.add_states(types: StateType, n_types: gint) -> none` | atk_state_set_add_states |  | Adds the states of the specified types to the state set. Note that because an #AtkStateSet is a read-only object, this method should be used to add... |
| and_sets | `StateSet.and_sets(compare_set: StateSet) -> StateSet` | atk_state_set_and_sets |  | Constructs the intersection of the two sets, returning %NULL if the intersection is empty. |
| clear_states | `StateSet.clear_states() -> none` | atk_state_set_clear_states |  | Removes all states from the state set. |
| contains_state | `StateSet.contains_state(type: StateType) -> gboolean` | atk_state_set_contains_state |  | Checks whether the state for the specified type is in the specified set. |
| contains_states | `StateSet.contains_states(types: StateType, n_types: gint) -> gboolean` | atk_state_set_contains_states |  | Checks whether the states for all the specified types are in the specified set. |
| is_empty | `StateSet.is_empty() -> gboolean` | atk_state_set_is_empty |  | Checks whether the state set is empty, i.e. has no states set. |
| or_sets | `StateSet.or_sets(compare_set: StateSet) -> StateSet` | atk_state_set_or_sets |  | Constructs the union of the two sets. |
| remove_state | `StateSet.remove_state(type: StateType) -> gboolean` | atk_state_set_remove_state |  | Removes the state for the specified type from the state set. Note that because an #AtkStateSet is a read-only object, this method should be used to... |
| xor_sets | `StateSet.xor_sets(compare_set: StateSet) -> StateSet` | atk_state_set_xor_sets |  | Constructs the exclusive-or of the two sets, returning %NULL is empty. The set returned by this operation contains the states in exactly one of the... |

### Atk.Util

Parent: `GObject.Object` ?? GType: `AtkUtil` ?? C type: `AtkUtil`

A set of ATK utility functions for event and toolkit support. A set of ATK utility functions which are used to support event registration of variou...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Action |  | 0 | 0 | 7 | The ATK interface provided by UI components which the user can activate/interact with. #AtkAction should be implemented by instances of #AtkObject ... |
| Component |  | 0 | 1 | 16 | The ATK interface provided by UI components which occupy a physical area on the screen. which the user can activate/interact with. #AtkComponent sh... |
| Document |  | 0 | 5 | 10 | The ATK interface which represents the toplevel container for document content. The AtkDocument interface should be supported by any object whose c... |
| EditableText |  | 0 | 0 | 7 | The ATK interface implemented by components containing user-editable text content. #AtkEditableText should be implemented by UI components which co... |
| HyperlinkImpl |  | 0 | 0 | 1 | A queryable interface which allows AtkHyperlink instances associated with an AtkObject to be obtained. AtkHyperlinkImpl corresponds to AT-SPI's Hyp... |
| Hypertext |  | 0 | 1 | 3 | The ATK interface which provides standard mechanism for manipulating hyperlinks. An interface used for objects which implement linking between mult... |
| Image |  | 0 | 0 | 5 | The ATK Interface implemented by components which expose image or pixmap content on-screen. #AtkImage should be implemented by #AtkObject subtypes ... |
| ImplementorIface |  | 0 | 0 | 0 | The AtkImplementor interface is implemented by objects for which AtkObject peers may be obtained via calls to iface->(ref_accessible)(implementor); |
| Selection |  | 0 | 1 | 7 | The ATK interface implemented by container objects whose #AtkObject children can be selected. #AtkSelection should be implemented by UI components ... |
| StreamableContent |  | 0 | 0 | 4 | The ATK interface which provides access to streamable content. An interface whereby an object allows its backing content to be streamed to clients.... |
| Table |  | 0 | 7 | 29 | The ATK interface implemented for UI components which contain tabular or row/column information. #AtkTable should be implemented by components whic... |
| TableCell |  | 0 | 0 | 7 | The ATK interface implemented for a cell inside a two-dimentional #AtkTable Being #AtkTable a component which present elements ordered via rows and... |
| Text |  | 0 | 6 | 23 | The ATK interface implemented by components with text content. #AtkText should be implemented by #AtkObjects on behalf of widgets that have text co... |
| Value |  | 0 | 1 | 10 | The ATK interface implemented by valuators and components which display or select a value from a bounded range of values. #AtkValue should be imple... |
| Window |  | 0 | 9 | 0 | The ATK Interface provided by UI components that represent a top-level window. #AtkWindow should be implemented by the UI elements that represent a... |

### Atk.Action

GType: `AtkAction` ?? C type: `AtkAction`

The ATK interface provided by UI components which the user can activate/interact with. #AtkAction should be implemented by instances of #AtkObject ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| do_action | `Action.do_action(i: gint) -> gboolean` | atk_action_do_action |  | Perform the specified action on the object. |
| get_description | `Action.get_description(i: gint) -> utf8` | atk_action_get_description |  | Returns a description of the specified action of the object. |
| get_keybinding | `Action.get_keybinding(i: gint) -> utf8` | atk_action_get_keybinding |  | Gets the keybinding which can be used to activate this action, if one exists. The string returned should contain localized, human-readable, key seq... |
| get_localized_name | `Action.get_localized_name(i: gint) -> utf8` | atk_action_get_localized_name |  | Returns the localized name of the specified action of the object. |
| get_n_actions | `Action.get_n_actions() -> gint` | atk_action_get_n_actions |  | Gets the number of accessible actions available on the object. If there are more than one, the first one is considered the "default" action of the ... |
| get_name | `Action.get_name(i: gint) -> utf8` | atk_action_get_name |  | Returns a non-localized string naming the specified action of the object. This name is generally not descriptive of the end result of the action, b... |
| set_description | `Action.set_description(i: gint, desc: utf8) -> gboolean` | atk_action_set_description |  | Sets a description of the specified action of the object. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| do_action | `do_action(i: gint) -> gboolean` |  |  | Perform the specified action on the object. |
| get_description | `get_description(i: gint) -> utf8` |  |  | Returns a description of the specified action of the object. |
| get_keybinding | `get_keybinding(i: gint) -> utf8` |  |  | Gets the keybinding which can be used to activate this action, if one exists. The string returned should contain localized, human-readable, key seq... |
| get_localized_name | `get_localized_name(i: gint) -> utf8` |  |  | Returns the localized name of the specified action of the object. |
| get_n_actions | `get_n_actions() -> gint` |  |  | Gets the number of accessible actions available on the object. If there are more than one, the first one is considered the "default" action of the ... |
| get_name | `get_name(i: gint) -> utf8` |  |  | Returns a non-localized string naming the specified action of the object. This name is generally not descriptive of the end result of the action, b... |
| set_description | `set_description(i: gint, desc: utf8) -> gboolean` |  |  | Sets a description of the specified action of the object. |

### Atk.Component

GType: `AtkComponent` ?? C type: `AtkComponent`

The ATK interface provided by UI components which occupy a physical area on the screen. which the user can activate/interact with. #AtkComponent sh...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_focus_handler | `Component.add_focus_handler(handler: FocusHandler) -> guint` | atk_component_add_focus_handler |  | Add the specified handler to the set of functions to be called when this object receives focus events (in or out). If the handler is already added ... |
| contains | `Component.contains(x: gint, y: gint, coord_type: CoordType) -> gboolean` | atk_component_contains |  | Checks whether the specified point is within the extent of the @component. Toolkit implementor note: ATK provides a default implementation for this... |
| get_alpha | `Component.get_alpha() -> gdouble` | atk_component_get_alpha | 1.12 | Returns the alpha value (i.e. the opacity) for this @component, on a scale from 0 (fully transparent) to 1.0 (fully opaque). |
| get_extents | `Component.get_extents(x: out gint?, y: out gint?, width: out gint?, height: out gint?, coord_type: CoordType) -> none` | atk_component_get_extents |  | Gets the rectangle which gives the extent of the @component. If the extent can not be obtained (e.g. a non-embedded plug or missing support), all o... |
| get_layer | `Component.get_layer() -> Layer` | atk_component_get_layer |  | Gets the layer of the component. |
| get_mdi_zorder | `Component.get_mdi_zorder() -> gint` | atk_component_get_mdi_zorder |  | Gets the zorder of the component. The value G_MININT will be returned if the layer of the component is not ATK_LAYER_MDI or ATK_LAYER_WINDOW. |
| get_position | `Component.get_position(x: out gint?, y: out gint?, coord_type: CoordType) -> none` | atk_component_get_position |  | Gets the position of @component in the form of a point specifying @component's top-left corner. If the position can not be obtained (e.g. a non-emb... |
| get_size | `Component.get_size(width: out gint?, height: out gint?) -> none` | atk_component_get_size |  | Gets the size of the @component in terms of width and height. If the size can not be obtained (e.g. a non-embedded plug or missing support), width ... |
| grab_focus | `Component.grab_focus() -> gboolean` | atk_component_grab_focus |  | Grabs focus for this @component. |
| ref_accessible_at_point | `Component.ref_accessible_at_point(x: gint, y: gint, coord_type: CoordType) -> Object` | atk_component_ref_accessible_at_point |  | Gets a reference to the accessible child, if one exists, at the coordinate point specified by @x and @y. |
| remove_focus_handler | `Component.remove_focus_handler(handler_id: guint) -> none` | atk_component_remove_focus_handler |  | Remove the handler specified by @handler_id from the list of functions to be executed when this object receives focus events (in or out). |
| scroll_to | `Component.scroll_to(type: ScrollType) -> gboolean` | atk_component_scroll_to | 2.30 | Makes @component visible on the screen by scrolling all necessary parents. Contrary to atk_component_set_position, this does not actually move @com... |
| scroll_to_point | `Component.scroll_to_point(coords: CoordType, x: gint, y: gint) -> gboolean` | atk_component_scroll_to_point | 2.30 | Move the top-left of @component to a given position of the screen by scrolling all necessary parents. |
| set_extents | `Component.set_extents(x: gint, y: gint, width: gint, height: gint, coord_type: CoordType) -> gboolean` | atk_component_set_extents |  | Sets the extents of @component. |
| set_position | `Component.set_position(x: gint, y: gint, coord_type: CoordType) -> gboolean` | atk_component_set_position |  | Sets the position of @component. Contrary to atk_component_scroll_to, this does not trigger any scrolling, this just moves @component in its parent. |
| set_size | `Component.set_size(width: gint, height: gint) -> gboolean` | atk_component_set_size |  | Set the size of the @component in terms of width and height. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| bounds-changed | `arg1: Rectangle` | none | last |  | The 'bounds-changed" signal is emitted when the position or size of the component changes. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_focus_handler | `add_focus_handler(handler: FocusHandler) -> guint` |  |  | Add the specified handler to the set of functions to be called when this object receives focus events (in or out). If the handler is already added ... |
| bounds_changed | `bounds_changed(bounds: Rectangle) -> none` |  |  |  |
| contains | `contains(x: gint, y: gint, coord_type: CoordType) -> gboolean` |  |  | Checks whether the specified point is within the extent of the @component. Toolkit implementor note: ATK provides a default implementation for this... |
| get_alpha | `get_alpha() -> gdouble` |  | 1.12 | Returns the alpha value (i.e. the opacity) for this @component, on a scale from 0 (fully transparent) to 1.0 (fully opaque). |
| get_extents | `get_extents(x: out gint?, y: out gint?, width: out gint?, height: out gint?, coord_type: CoordType) -> none` |  |  | Gets the rectangle which gives the extent of the @component. If the extent can not be obtained (e.g. a non-embedded plug or missing support), all o... |
| get_layer | `get_layer() -> Layer` |  |  | Gets the layer of the component. |
| get_mdi_zorder | `get_mdi_zorder() -> gint` |  |  | Gets the zorder of the component. The value G_MININT will be returned if the layer of the component is not ATK_LAYER_MDI or ATK_LAYER_WINDOW. |
| get_position | `get_position(x: out gint?, y: out gint?, coord_type: CoordType) -> none` |  |  | Gets the position of @component in the form of a point specifying @component's top-left corner. If the position can not be obtained (e.g. a non-emb... |
| get_size | `get_size(width: out gint?, height: out gint?) -> none` |  |  | Gets the size of the @component in terms of width and height. If the size can not be obtained (e.g. a non-embedded plug or missing support), width ... |
| grab_focus | `grab_focus() -> gboolean` |  |  | Grabs focus for this @component. |
| ref_accessible_at_point | `ref_accessible_at_point(x: gint, y: gint, coord_type: CoordType) -> Object` |  |  | Gets a reference to the accessible child, if one exists, at the coordinate point specified by @x and @y. |
| remove_focus_handler | `remove_focus_handler(handler_id: guint) -> none` |  |  | Remove the handler specified by @handler_id from the list of functions to be executed when this object receives focus events (in or out). |
| scroll_to | `scroll_to(type: ScrollType) -> gboolean` |  | 2.30 | Makes @component visible on the screen by scrolling all necessary parents. Contrary to atk_component_set_position, this does not actually move @com... |
| scroll_to_point | `scroll_to_point(coords: CoordType, x: gint, y: gint) -> gboolean` |  | 2.30 | Move the top-left of @component to a given position of the screen by scrolling all necessary parents. |
| set_extents | `set_extents(x: gint, y: gint, width: gint, height: gint, coord_type: CoordType) -> gboolean` |  |  | Sets the extents of @component. |
| set_position | `set_position(x: gint, y: gint, coord_type: CoordType) -> gboolean` |  |  | Sets the position of @component. Contrary to atk_component_scroll_to, this does not trigger any scrolling, this just moves @component in its parent. |
| set_size | `set_size(width: gint, height: gint) -> gboolean` |  |  | Set the size of the @component in terms of width and height. |

### Atk.Document

GType: `AtkDocument` ?? C type: `AtkDocument`

The ATK interface which represents the toplevel container for document content. The AtkDocument interface should be supported by any object whose c...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_attribute_value | `Document.get_attribute_value(attribute_name: utf8) -> utf8` | atk_document_get_attribute_value | 1.12 | Retrieves the value of the given @attribute_name inside @document. |
| get_attributes | `Document.get_attributes() -> AttributeSet` | atk_document_get_attributes | 1.12 | Gets an AtkAttributeSet which describes document-wide attributes as name-value pairs. |
| get_current_page_number | `Document.get_current_page_number() -> gint` | atk_document_get_current_page_number | 2.12 | Retrieves the current page number inside @document. |
| get_document | `Document.get_document() -> gpointer` | atk_document_get_document |  | Gets a %gpointer that points to an instance of the DOM. It is up to the caller to check atk_document_get_type to determine how to cast this pointer. |
| get_document_type | `Document.get_document_type() -> utf8` | atk_document_get_document_type |  | Gets a string indicating the document type. |
| get_locale | `Document.get_locale() -> utf8` | atk_document_get_locale |  | Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale of the content of this document instance. Individual text substrings or images wi... |
| get_page_count | `Document.get_page_count() -> gint` | atk_document_get_page_count | 2.12 | Retrieves the total number of pages inside @document. |
| get_text_selections | `Document.get_text_selections() -> TextSelection` | atk_document_get_text_selections | 2.52 | Returns an array of AtkTextSelections within this document. |
| set_attribute_value | `Document.set_attribute_value(attribute_name: utf8, attribute_value: utf8) -> gboolean` | atk_document_set_attribute_value | 1.12 | Sets the value for the given @attribute_name inside @document. |
| set_text_selections | `Document.set_text_selections(selections: TextSelection) -> gboolean` | atk_document_set_text_selections | 2.52 | Makes 1 or more selections within this document denoted by the given array of AtkTextSelections. Any existing physical selection (inside or outside... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| document-attribute-changed | `arg1: utf8, arg2: utf8` | none | last | 2.52 | The "document-attribute-changed" signal should be emitted when there is a change to one of the document attributes returned by atk_document_get_att... |
| load-complete | `` | none | last |  | The 'load-complete' signal is emitted when a pending load of a static document has completed. This signal is to be expected by ATK clients if and w... |
| load-stopped | `` | none | last |  | The 'load-stopped' signal is emitted when a pending load of document contents is cancelled, paused, or otherwise interrupted by the user or applica... |
| page-changed | `page_number: gint` | none | last | 2.12 | The 'page-changed' signal is emitted when the current page of a document changes, e.g. pressing page up/down in a document viewer. |
| reload | `` | none | last |  | The 'reload' signal is emitted when the contents of a document is refreshed from its source. Once 'reload' has been emitted, a matching 'load-compl... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_page_number | `get_current_page_number() -> gint` |  | 2.12 | Retrieves the current page number inside @document. |
| get_document | `get_document() -> gpointer` |  |  | Gets a %gpointer that points to an instance of the DOM. It is up to the caller to check atk_document_get_type to determine how to cast this pointer. |
| get_document_attribute_value | `get_document_attribute_value(attribute_name: utf8) -> utf8` |  | 1.12 | Retrieves the value of the given @attribute_name inside @document. |
| get_document_attributes | `get_document_attributes() -> AttributeSet` |  | 1.12 | Gets an AtkAttributeSet which describes document-wide attributes as name-value pairs. |
| get_document_locale | `get_document_locale() -> utf8` |  |  | Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale of the content of this document instance. Individual text substrings or images wi... |
| get_document_type | `get_document_type() -> utf8` |  |  | Gets a string indicating the document type. |
| get_page_count | `get_page_count() -> gint` |  | 2.12 | Retrieves the total number of pages inside @document. |
| get_text_selections | `get_text_selections() -> TextSelection` |  | 2.52 | Returns an array of AtkTextSelections within this document. |
| set_document_attribute | `set_document_attribute(attribute_name: utf8, attribute_value: utf8) -> gboolean` |  | 1.12 | Sets the value for the given @attribute_name inside @document. |
| set_text_selections | `set_text_selections(selections: TextSelection) -> gboolean` |  | 2.52 | Makes 1 or more selections within this document denoted by the given array of AtkTextSelections. Any existing physical selection (inside or outside... |

### Atk.EditableText

GType: `AtkEditableText` ?? C type: `AtkEditableText`

The ATK interface implemented by components containing user-editable text content. #AtkEditableText should be implemented by UI components which co...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_text | `EditableText.copy_text(start_pos: gint, end_pos: gint) -> none` | atk_editable_text_copy_text |  | Copy text from @start_pos up to, but not including @end_pos to the clipboard. |
| cut_text | `EditableText.cut_text(start_pos: gint, end_pos: gint) -> none` | atk_editable_text_cut_text |  | Copy text from @start_pos up to, but not including @end_pos to the clipboard and then delete from the widget. |
| delete_text | `EditableText.delete_text(start_pos: gint, end_pos: gint) -> none` | atk_editable_text_delete_text |  | Delete text @start_pos up to, but not including @end_pos. |
| insert_text | `EditableText.insert_text(string: utf8, length: gint, position: gint) -> none` | atk_editable_text_insert_text |  | Insert text at a given position. |
| paste_text | `EditableText.paste_text(position: gint) -> none` | atk_editable_text_paste_text |  | Paste text from clipboard to specified @position. |
| set_run_attributes | `EditableText.set_run_attributes(attrib_set: AttributeSet, start_offset: gint, end_offset: gint) -> gboolean` | atk_editable_text_set_run_attributes |  | Sets the attributes for a specified range. See the ATK_ATTRIBUTE macros (such as #ATK_ATTRIBUTE_LEFT_MARGIN) for examples of attributes that can be... |
| set_text_contents | `EditableText.set_text_contents(string: utf8) -> none` | atk_editable_text_set_text_contents |  | Set text contents of @text. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy_text | `copy_text(start_pos: gint, end_pos: gint) -> none` |  |  | Copy text from @start_pos up to, but not including @end_pos to the clipboard. |
| cut_text | `cut_text(start_pos: gint, end_pos: gint) -> none` |  |  | Copy text from @start_pos up to, but not including @end_pos to the clipboard and then delete from the widget. |
| delete_text | `delete_text(start_pos: gint, end_pos: gint) -> none` |  |  | Delete text @start_pos up to, but not including @end_pos. |
| insert_text | `insert_text(string: utf8, length: gint, position: gint) -> none` |  |  | Insert text at a given position. |
| paste_text | `paste_text(position: gint) -> none` |  |  | Paste text from clipboard to specified @position. |
| set_run_attributes | `set_run_attributes(attrib_set: AttributeSet, start_offset: gint, end_offset: gint) -> gboolean` |  |  | Sets the attributes for a specified range. See the ATK_ATTRIBUTE macros (such as #ATK_ATTRIBUTE_LEFT_MARGIN) for examples of attributes that can be... |
| set_text_contents | `set_text_contents(string: utf8) -> none` |  |  | Set text contents of @text. |

### Atk.HyperlinkImpl

GType: `AtkHyperlinkImpl` ?? C type: `AtkHyperlinkImpl`

A queryable interface which allows AtkHyperlink instances associated with an AtkObject to be obtained. AtkHyperlinkImpl corresponds to AT-SPI's Hyp...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_hyperlink | `HyperlinkImpl.get_hyperlink() -> Hyperlink` | atk_hyperlink_impl_get_hyperlink | 1.12 | Gets the hyperlink associated with this object. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_hyperlink | `get_hyperlink() -> Hyperlink` |  | 1.12 | Gets the hyperlink associated with this object. |

### Atk.Hypertext

GType: `AtkHypertext` ?? C type: `AtkHypertext`

The ATK interface which provides standard mechanism for manipulating hyperlinks. An interface used for objects which implement linking between mult...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_link | `Hypertext.get_link(link_index: gint) -> Hyperlink` | atk_hypertext_get_link |  | Gets the link in this hypertext document at index @link_index |
| get_link_index | `Hypertext.get_link_index(char_index: gint) -> gint` | atk_hypertext_get_link_index |  | Gets the index into the array of hyperlinks that is associated with the character specified by @char_index. |
| get_n_links | `Hypertext.get_n_links() -> gint` | atk_hypertext_get_n_links |  | Gets the number of links within this hypertext document. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| link-selected | `arg1: gint` | none | last |  | The "link-selected" signal is emitted by an AtkHyperText object when one of the hyperlinks associated with the object is selected. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_link | `get_link(link_index: gint) -> Hyperlink` |  |  | Gets the link in this hypertext document at index @link_index |
| get_link_index | `get_link_index(char_index: gint) -> gint` |  |  | Gets the index into the array of hyperlinks that is associated with the character specified by @char_index. |
| get_n_links | `get_n_links() -> gint` |  |  | Gets the number of links within this hypertext document. |
| link_selected | `link_selected(link_index: gint) -> none` |  |  |  |

### Atk.Image

GType: `AtkImage` ?? C type: `AtkImage`

The ATK Interface implemented by components which expose image or pixmap content on-screen. #AtkImage should be implemented by #AtkObject subtypes ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_image_description | `Image.get_image_description() -> utf8` | atk_image_get_image_description |  | Get a textual description of this image. |
| get_image_locale | `Image.get_image_locale() -> utf8` | atk_image_get_image_locale | 1.12 | Retrieves the locale identifier associated to the #AtkImage. |
| get_image_position | `Image.get_image_position(x: out gint?, y: out gint?, coord_type: CoordType) -> none` | atk_image_get_image_position |  | Gets the position of the image in the form of a point specifying the images top-left corner. If the position can not be obtained (e.g. missing supp... |
| get_image_size | `Image.get_image_size(width: out gint?, height: out gint?) -> none` | atk_image_get_image_size |  | Get the width and height in pixels for the specified image. The values of @width and @height are returned as -1 if the values cannot be obtained (f... |
| set_image_description | `Image.set_image_description(description: utf8) -> gboolean` | atk_image_set_image_description |  | Sets the textual description for this image. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_image_description | `get_image_description() -> utf8` |  |  | Get a textual description of this image. |
| get_image_locale | `get_image_locale() -> utf8` |  | 1.12 | Retrieves the locale identifier associated to the #AtkImage. |
| get_image_position | `get_image_position(x: out gint?, y: out gint?, coord_type: CoordType) -> none` |  |  | Gets the position of the image in the form of a point specifying the images top-left corner. If the position can not be obtained (e.g. missing supp... |
| get_image_size | `get_image_size(width: out gint?, height: out gint?) -> none` |  |  | Get the width and height in pixels for the specified image. The values of @width and @height are returned as -1 if the values cannot be obtained (f... |
| set_image_description | `set_image_description(description: utf8) -> gboolean` |  |  | Sets the textual description for this image. |

### Atk.ImplementorIface

GType: `AtkImplementorIface` ?? C type: `AtkImplementorIface`

The AtkImplementor interface is implemented by objects for which AtkObject peers may be obtained via calls to iface->(ref_accessible)(implementor);

### Atk.Selection

GType: `AtkSelection` ?? C type: `AtkSelection`

The ATK interface implemented by container objects whose #AtkObject children can be selected. #AtkSelection should be implemented by UI components ...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_selection | `Selection.add_selection(i: gint) -> gboolean` | atk_selection_add_selection |  | Adds the specified accessible child of the object to the object's selection. |
| clear_selection | `Selection.clear_selection() -> gboolean` | atk_selection_clear_selection |  | Clears the selection in the object so that no children in the object are selected. |
| get_selection_count | `Selection.get_selection_count() -> gint` | atk_selection_get_selection_count |  | Gets the number of accessible children currently selected. Note: callers should not rely on %NULL or on a zero value for indication of whether AtkS... |
| is_child_selected | `Selection.is_child_selected(i: gint) -> gboolean` | atk_selection_is_child_selected |  | Determines if the current child of this object is selected Note: callers should not rely on %NULL or on a zero value for indication of whether AtkS... |
| ref_selection | `Selection.ref_selection(i: gint) -> Object` | atk_selection_ref_selection |  | Gets a reference to the accessible object representing the specified selected child of the object. Note: callers should not rely on %NULL or on a z... |
| remove_selection | `Selection.remove_selection(i: gint) -> gboolean` | atk_selection_remove_selection |  | Removes the specified child of the object from the object's selection. |
| select_all_selection | `Selection.select_all_selection() -> gboolean` | atk_selection_select_all_selection |  | Causes every child of the object to be selected if the object supports multiple selections. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| selection-changed | `` | none | last |  | The "selection-changed" signal is emitted by an object which implements AtkSelection interface when the selection changes. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_selection | `add_selection(i: gint) -> gboolean` |  |  | Adds the specified accessible child of the object to the object's selection. |
| clear_selection | `clear_selection() -> gboolean` |  |  | Clears the selection in the object so that no children in the object are selected. |
| get_selection_count | `get_selection_count() -> gint` |  |  | Gets the number of accessible children currently selected. Note: callers should not rely on %NULL or on a zero value for indication of whether AtkS... |
| is_child_selected | `is_child_selected(i: gint) -> gboolean` |  |  | Determines if the current child of this object is selected Note: callers should not rely on %NULL or on a zero value for indication of whether AtkS... |
| ref_selection | `ref_selection(i: gint) -> Object` |  |  | Gets a reference to the accessible object representing the specified selected child of the object. Note: callers should not rely on %NULL or on a z... |
| remove_selection | `remove_selection(i: gint) -> gboolean` |  |  | Removes the specified child of the object from the object's selection. |
| select_all_selection | `select_all_selection() -> gboolean` |  |  | Causes every child of the object to be selected if the object supports multiple selections. |
| selection_changed | `selection_changed() -> none` |  |  |  |

### Atk.StreamableContent

GType: `AtkStreamableContent` ?? C type: `AtkStreamableContent`

The ATK interface which provides access to streamable content. An interface whereby an object allows its backing content to be streamed to clients....

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_mime_type | `StreamableContent.get_mime_type(i: gint) -> utf8` | atk_streamable_content_get_mime_type |  | Gets the character string of the specified mime type. The first mime type is at position 0, the second at position 1, and so on. |
| get_n_mime_types | `StreamableContent.get_n_mime_types() -> gint` | atk_streamable_content_get_n_mime_types |  | Gets the number of mime types supported by this object. |
| get_stream | `StreamableContent.get_stream(mime_type: utf8) -> GLib.IOChannel` | atk_streamable_content_get_stream |  | Gets the content in the specified mime type. |
| get_uri | `StreamableContent.get_uri(mime_type: utf8) -> utf8` | atk_streamable_content_get_uri | 1.12 | Get a string representing a URI in IETF standard format (see http://www.ietf.org/rfc/rfc2396.txt) from which the object's content may be streamed i... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_mime_type | `get_mime_type(i: gint) -> utf8` |  |  | Gets the character string of the specified mime type. The first mime type is at position 0, the second at position 1, and so on. |
| get_n_mime_types | `get_n_mime_types() -> gint` |  |  | Gets the number of mime types supported by this object. |
| get_stream | `get_stream(mime_type: utf8) -> GLib.IOChannel` |  |  | Gets the content in the specified mime type. |
| get_uri | `get_uri(mime_type: utf8) -> utf8` |  | 1.12 | Get a string representing a URI in IETF standard format (see http://www.ietf.org/rfc/rfc2396.txt) from which the object's content may be streamed i... |

### Atk.Table

GType: `AtkTable` ?? C type: `AtkTable`

The ATK interface implemented for UI components which contain tabular or row/column information. #AtkTable should be implemented by components whic...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_column_selection | `Table.add_column_selection(column: gint) -> gboolean` | atk_table_add_column_selection |  | Adds the specified @column to the selection. |
| add_row_selection | `Table.add_row_selection(row: gint) -> gboolean` | atk_table_add_row_selection |  | Adds the specified @row to the selection. |
| get_caption | `Table.get_caption() -> Object` | atk_table_get_caption |  | Gets the caption for the @table. |
| get_column_at_index | `Table.get_column_at_index(index_: gint) -> gint` | atk_table_get_column_at_index |  | Gets a #gint representing the column at the specified @index_. |
| get_column_description | `Table.get_column_description(column: gint) -> utf8` | atk_table_get_column_description |  | Gets the description text of the specified @column in the table |
| get_column_extent_at | `Table.get_column_extent_at(row: gint, column: gint) -> gint` | atk_table_get_column_extent_at |  | Gets the number of columns occupied by the accessible object at the specified @row and @column in the @table. |
| get_column_header | `Table.get_column_header(column: gint) -> Object` | atk_table_get_column_header |  | Gets the column header of a specified column in an accessible table. |
| get_index_at | `Table.get_index_at(row: gint, column: gint) -> gint` | atk_table_get_index_at |  | Gets a #gint representing the index at the specified @row and @column. |
| get_n_columns | `Table.get_n_columns() -> gint` | atk_table_get_n_columns |  | Gets the number of columns in the table. |
| get_n_rows | `Table.get_n_rows() -> gint` | atk_table_get_n_rows |  | Gets the number of rows in the table. |
| get_row_at_index | `Table.get_row_at_index(index_: gint) -> gint` | atk_table_get_row_at_index |  | Gets a #gint representing the row at the specified @index_. |
| get_row_description | `Table.get_row_description(row: gint) -> utf8` | atk_table_get_row_description |  | Gets the description text of the specified row in the table |
| get_row_extent_at | `Table.get_row_extent_at(row: gint, column: gint) -> gint` | atk_table_get_row_extent_at |  | Gets the number of rows occupied by the accessible object at a specified @row and @column in the @table. |
| get_row_header | `Table.get_row_header(row: gint) -> Object` | atk_table_get_row_header |  | Gets the row header of a specified row in an accessible table. |
| get_selected_columns | `Table.get_selected_columns(selected: gint) -> gint` | atk_table_get_selected_columns |  | Gets the selected columns of the table by initializing **selected with the selected column numbers. This array should be freed by the caller. |
| get_selected_rows | `Table.get_selected_rows(selected: gint) -> gint` | atk_table_get_selected_rows |  | Gets the selected rows of the table by initializing **selected with the selected row numbers. This array should be freed by the caller. |
| get_summary | `Table.get_summary() -> Object` | atk_table_get_summary |  | Gets the summary description of the table. |
| is_column_selected | `Table.is_column_selected(column: gint) -> gboolean` | atk_table_is_column_selected |  | Gets a boolean value indicating whether the specified @column is selected |
| is_row_selected | `Table.is_row_selected(row: gint) -> gboolean` | atk_table_is_row_selected |  | Gets a boolean value indicating whether the specified @row is selected |
| is_selected | `Table.is_selected(row: gint, column: gint) -> gboolean` | atk_table_is_selected |  | Gets a boolean value indicating whether the accessible object at the specified @row and @column is selected |
| ref_at | `Table.ref_at(row: gint, column: gint) -> Object` | atk_table_ref_at |  | Get a reference to the table cell at @row, @column. This cell should implement the interface #AtkTableCell |
| remove_column_selection | `Table.remove_column_selection(column: gint) -> gboolean` | atk_table_remove_column_selection |  | Adds the specified @column to the selection. |
| remove_row_selection | `Table.remove_row_selection(row: gint) -> gboolean` | atk_table_remove_row_selection |  | Removes the specified @row from the selection. |
| set_caption | `Table.set_caption(caption: Object) -> none` | atk_table_set_caption |  | Sets the caption for the table. |
| set_column_description | `Table.set_column_description(column: gint, description: utf8) -> none` | atk_table_set_column_description |  | Sets the description text for the specified @column of the @table. |
| set_column_header | `Table.set_column_header(column: gint, header: Object) -> none` | atk_table_set_column_header |  | Sets the specified column header to @header. |
| set_row_description | `Table.set_row_description(row: gint, description: utf8) -> none` | atk_table_set_row_description |  | Sets the description text for the specified @row of @table. |
| set_row_header | `Table.set_row_header(row: gint, header: Object) -> none` | atk_table_set_row_header |  | Sets the specified row header to @header. |
| set_summary | `Table.set_summary(accessible: Object) -> none` | atk_table_set_summary |  | Sets the summary description of the table. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| column-deleted | `arg1: gint, arg2: gint` | none | last |  | The "column-deleted" signal is emitted by an object which implements the AtkTable interface when a column is deleted. |
| column-inserted | `arg1: gint, arg2: gint` | none | last |  | The "column-inserted" signal is emitted by an object which implements the AtkTable interface when a column is inserted. |
| column-reordered | `` | none | last |  | The "column-reordered" signal is emitted by an object which implements the AtkTable interface when the columns are reordered. |
| model-changed | `` | none | last |  | The "model-changed" signal is emitted by an object which implements the AtkTable interface when the model displayed by the table changes. |
| row-deleted | `arg1: gint, arg2: gint` | none | last |  | The "row-deleted" signal is emitted by an object which implements the AtkTable interface when a row is deleted. |
| row-inserted | `arg1: gint, arg2: gint` | none | last |  | The "row-inserted" signal is emitted by an object which implements the AtkTable interface when a row is inserted. |
| row-reordered | `` | none | last |  | The "row-reordered" signal is emitted by an object which implements the AtkTable interface when the rows are reordered. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_column_selection | `add_column_selection(column: gint) -> gboolean` |  |  | Adds the specified @column to the selection. |
| add_row_selection | `add_row_selection(row: gint) -> gboolean` |  |  | Adds the specified @row to the selection. |
| column_deleted | `column_deleted(column: gint, num_deleted: gint) -> none` |  |  |  |
| column_inserted | `column_inserted(column: gint, num_inserted: gint) -> none` |  |  |  |
| column_reordered | `column_reordered() -> none` |  |  |  |
| get_caption | `get_caption() -> Object` |  |  | Gets the caption for the @table. |
| get_column_at_index | `get_column_at_index(index_: gint) -> gint` |  |  | Gets a #gint representing the column at the specified @index_. |
| get_column_description | `get_column_description(column: gint) -> utf8` |  |  | Gets the description text of the specified @column in the table |
| get_column_extent_at | `get_column_extent_at(row: gint, column: gint) -> gint` |  |  | Gets the number of columns occupied by the accessible object at the specified @row and @column in the @table. |
| get_column_header | `get_column_header(column: gint) -> Object` |  |  | Gets the column header of a specified column in an accessible table. |
| get_index_at | `get_index_at(row: gint, column: gint) -> gint` |  |  | Gets a #gint representing the index at the specified @row and @column. |
| get_n_columns | `get_n_columns() -> gint` |  |  | Gets the number of columns in the table. |
| get_n_rows | `get_n_rows() -> gint` |  |  | Gets the number of rows in the table. |
| get_row_at_index | `get_row_at_index(index_: gint) -> gint` |  |  | Gets a #gint representing the row at the specified @index_. |
| get_row_description | `get_row_description(row: gint) -> utf8` |  |  | Gets the description text of the specified row in the table |
| get_row_extent_at | `get_row_extent_at(row: gint, column: gint) -> gint` |  |  | Gets the number of rows occupied by the accessible object at a specified @row and @column in the @table. |
| get_row_header | `get_row_header(row: gint) -> Object` |  |  | Gets the row header of a specified row in an accessible table. |
| get_selected_columns | `get_selected_columns(selected: gint) -> gint` |  |  | Gets the selected columns of the table by initializing **selected with the selected column numbers. This array should be freed by the caller. |
| get_selected_rows | `get_selected_rows(selected: gint) -> gint` |  |  | Gets the selected rows of the table by initializing **selected with the selected row numbers. This array should be freed by the caller. |
| get_summary | `get_summary() -> Object` |  |  | Gets the summary description of the table. |
| is_column_selected | `is_column_selected(column: gint) -> gboolean` |  |  | Gets a boolean value indicating whether the specified @column is selected |
| is_row_selected | `is_row_selected(row: gint) -> gboolean` |  |  | Gets a boolean value indicating whether the specified @row is selected |
| is_selected | `is_selected(row: gint, column: gint) -> gboolean` |  |  | Gets a boolean value indicating whether the accessible object at the specified @row and @column is selected |
| model_changed | `model_changed() -> none` |  |  |  |
| ref_at | `ref_at(row: gint, column: gint) -> Object` |  |  | Get a reference to the table cell at @row, @column. This cell should implement the interface #AtkTableCell |
| remove_column_selection | `remove_column_selection(column: gint) -> gboolean` |  |  | Adds the specified @column to the selection. |
| remove_row_selection | `remove_row_selection(row: gint) -> gboolean` |  |  | Removes the specified @row from the selection. |
| row_deleted | `row_deleted(row: gint, num_deleted: gint) -> none` |  |  |  |
| row_inserted | `row_inserted(row: gint, num_inserted: gint) -> none` |  |  |  |
| row_reordered | `row_reordered() -> none` |  |  |  |
| set_caption | `set_caption(caption: Object) -> none` |  |  | Sets the caption for the table. |
| set_column_description | `set_column_description(column: gint, description: utf8) -> none` |  |  | Sets the description text for the specified @column of the @table. |
| set_column_header | `set_column_header(column: gint, header: Object) -> none` |  |  | Sets the specified column header to @header. |
| set_row_description | `set_row_description(row: gint, description: utf8) -> none` |  |  | Sets the description text for the specified @row of @table. |
| set_row_header | `set_row_header(row: gint, header: Object) -> none` |  |  | Sets the specified row header to @header. |
| set_summary | `set_summary(accessible: Object) -> none` |  |  | Sets the summary description of the table. |

### Atk.TableCell

GType: `AtkTableCell` ?? C type: `AtkTableCell`

The ATK interface implemented for a cell inside a two-dimentional #AtkTable Being #AtkTable a component which present elements ordered via rows and...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_column_header_cells | `TableCell.get_column_header_cells() -> Object` | atk_table_cell_get_column_header_cells | 2.12 | Returns the column headers as an array of cell accessibles. |
| get_column_span | `TableCell.get_column_span() -> gint` | atk_table_cell_get_column_span | 2.12 | Returns the number of columns occupied by this cell accessible. |
| get_position | `TableCell.get_position(row: out gint, column: out gint) -> gboolean` | atk_table_cell_get_position | 2.12 | Retrieves the tabular position of this cell. |
| get_row_column_span | `TableCell.get_row_column_span(row: out gint, column: out gint, row_span: out gint, column_span: out gint) -> gboolean` | atk_table_cell_get_row_column_span | 2.12 | Gets the row and column indexes and span of this cell accessible. Note: If the object does not implement this function, then, by default, atk will ... |
| get_row_header_cells | `TableCell.get_row_header_cells() -> Object` | atk_table_cell_get_row_header_cells | 2.12 | Returns the row headers as an array of cell accessibles. |
| get_row_span | `TableCell.get_row_span() -> gint` | atk_table_cell_get_row_span | 2.12 | Returns the number of rows occupied by this cell accessible. |
| get_table | `TableCell.get_table() -> Object` | atk_table_cell_get_table | 2.12 | Returns a reference to the accessible of the containing table. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_column_header_cells | `get_column_header_cells() -> Object` |  | 2.12 | Returns the column headers as an array of cell accessibles. |
| get_column_span | `get_column_span() -> gint` |  | 2.12 | Returns the number of columns occupied by this cell accessible. |
| get_position | `get_position(row: out gint, column: out gint) -> gboolean` |  | 2.12 | Retrieves the tabular position of this cell. |
| get_row_column_span | `get_row_column_span(row: out gint, column: out gint, row_span: out gint, column_span: out gint) -> gboolean` |  | 2.12 | Gets the row and column indexes and span of this cell accessible. Note: If the object does not implement this function, then, by default, atk will ... |
| get_row_header_cells | `get_row_header_cells() -> Object` |  | 2.12 | Returns the row headers as an array of cell accessibles. |
| get_row_span | `get_row_span() -> gint` |  | 2.12 | Returns the number of rows occupied by this cell accessible. |
| get_table | `get_table() -> Object` |  | 2.12 | Returns a reference to the accessible of the containing table. |

### Atk.Text

GType: `AtkText` ?? C type: `AtkText`

The ATK interface implemented by components with text content. #AtkText should be implemented by #AtkObjects on behalf of widgets that have text co...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free_ranges | `free_ranges(ranges: TextRange) -> none` | atk_text_free_ranges | 1.3 | Frees the memory associated with an array of AtkTextRange. It is assumed that the array was returned by the function atk_text_get_bounded_ranges an... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_selection | `Text.add_selection(start_offset: gint, end_offset: gint) -> gboolean` | atk_text_add_selection |  | Adds a selection bounded by the specified offsets. |
| get_bounded_ranges | `Text.get_bounded_ranges(rect: TextRectangle, coord_type: CoordType, x_clip_type: TextClipType, y_clip_type: TextClipType) -> TextRange` | atk_text_get_bounded_ranges | 1.3 | Get the ranges of text in the specified bounding box. |
| get_caret_offset | `Text.get_caret_offset() -> gint` | atk_text_get_caret_offset |  | Gets the offset of the position of the caret (cursor). |
| get_character_at_offset | `Text.get_character_at_offset(offset: gint) -> gunichar` | atk_text_get_character_at_offset |  | Gets the specified text. |
| get_character_count | `Text.get_character_count() -> gint` | atk_text_get_character_count |  | Gets the character count. |
| get_character_extents | `Text.get_character_extents(offset: gint, x: out gint?, y: out gint?, width: out gint?, height: out gint?, coords: CoordType) -> none` | atk_text_get_character_extents |  | If the extent can not be obtained (e.g. missing support), all of x, y, width, height are set to -1. Get the bounding box containing the glyph repre... |
| get_default_attributes | `Text.get_default_attributes() -> AttributeSet` | atk_text_get_default_attributes |  | Creates an #AtkAttributeSet which consists of the default values of attributes for the text. See the enum AtkTextAttribute for types of text attrib... |
| get_n_selections | `Text.get_n_selections() -> gint` | atk_text_get_n_selections |  | Gets the number of selected regions. |
| get_offset_at_point | `Text.get_offset_at_point(x: gint, y: gint, coords: CoordType) -> gint` | atk_text_get_offset_at_point |  | Gets the offset of the character located at coordinates @x and @y. @x and @y are interpreted as being relative to the screen or this widget's windo... |
| get_range_extents | `Text.get_range_extents(start_offset: gint, end_offset: gint, coord_type: CoordType, rect: out TextRectangle) -> none` | atk_text_get_range_extents | 1.3 | Get the bounding box for text within the specified range. If the extents can not be obtained (e.g. or missing support), the rectangle fields are se... |
| get_run_attributes | `Text.get_run_attributes(offset: gint, start_offset: out gint, end_offset: out gint) -> AttributeSet` | atk_text_get_run_attributes |  | Creates an #AtkAttributeSet which consists of the attributes explicitly set at the position @offset in the text. @start_offset and @end_offset are ... |
| get_selection | `Text.get_selection(selection_num: gint, start_offset: out gint, end_offset: out gint) -> utf8` | atk_text_get_selection |  | Gets the text from the specified selection. |
| get_string_at_offset | `Text.get_string_at_offset(offset: gint, granularity: TextGranularity, start_offset: out gint, end_offset: out gint) -> utf8` | atk_text_get_string_at_offset | 2.10 | Gets a portion of the text exposed through an #AtkText according to a given @offset and a specific @granularity, along with the start and end offse... |
| get_text | `Text.get_text(start_offset: gint, end_offset: gint) -> utf8` | atk_text_get_text |  | Gets the specified text. |
| get_text_after_offset | `Text.get_text_after_offset(offset: gint, boundary_type: TextBoundary, start_offset: out gint, end_offset: out gint) -> utf8` | atk_text_get_text_after_offset |  | Gets the specified text. |
| get_text_at_offset | `Text.get_text_at_offset(offset: gint, boundary_type: TextBoundary, start_offset: out gint, end_offset: out gint) -> utf8` | atk_text_get_text_at_offset |  | Gets the specified text. If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the offset is returned. If the boundary_type is ATK_TEXT_B... |
| get_text_before_offset | `Text.get_text_before_offset(offset: gint, boundary_type: TextBoundary, start_offset: out gint, end_offset: out gint) -> utf8` | atk_text_get_text_before_offset |  | Gets the specified text. |
| remove_selection | `Text.remove_selection(selection_num: gint) -> gboolean` | atk_text_remove_selection |  | Removes the specified selection. |
| scroll_substring_to | `Text.scroll_substring_to(start_offset: gint, end_offset: gint, type: ScrollType) -> gboolean` | atk_text_scroll_substring_to | 2.32 | Makes a substring of @text visible on the screen by scrolling all necessary parents. |
| scroll_substring_to_point | `Text.scroll_substring_to_point(start_offset: gint, end_offset: gint, coords: CoordType, x: gint, y: gint) -> gboolean` | atk_text_scroll_substring_to_point | 2.32 | Move the top-left of a substring of @text to a given position of the screen by scrolling all necessary parents. |
| set_caret_offset | `Text.set_caret_offset(offset: gint) -> gboolean` | atk_text_set_caret_offset |  | Sets the caret (cursor) position to the specified @offset. In the case of rich-text content, this method should either grab focus or move the seque... |
| set_selection | `Text.set_selection(selection_num: gint, start_offset: gint, end_offset: gint) -> gboolean` | atk_text_set_selection |  | Changes the start and end offset of the specified selection. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| text-attributes-changed | `` | none | last |  | The "text-attributes-changed" signal is emitted when the text attributes of the text of an object which implements AtkText changes. |
| text-caret-moved | `arg1: gint` | none | last |  | The "text-caret-moved" signal is emitted when the caret position of the text of an object which implements AtkText changes. |
| text-changed | `arg1: gint, arg2: gint` | none | last detailed |  | The "text-changed" signal is emitted when the text of the object which implements the AtkText interface changes, This signal will have a detail whi... |
| text-insert | `arg1: gint, arg2: gint, arg3: utf8` | none | last detailed |  | The "text-insert" signal is emitted when a new text is inserted. If the signal was not triggered by the user (e.g. typing or pasting text), the "sy... |
| text-remove | `arg1: gint, arg2: gint, arg3: utf8` | none | last detailed |  | The "text-remove" signal is emitted when a new text is removed. If the signal was not triggered by the user (e.g. typing or pasting text), the "sys... |
| text-selection-changed | `` | none | last |  | The "text-selection-changed" signal is emitted when the selected text of an object which implements AtkText changes. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_selection | `add_selection(start_offset: gint, end_offset: gint) -> gboolean` |  |  | Adds a selection bounded by the specified offsets. |
| get_bounded_ranges | `get_bounded_ranges(rect: TextRectangle, coord_type: CoordType, x_clip_type: TextClipType, y_clip_type: TextClipType) -> TextRange` |  | 1.3 | Get the ranges of text in the specified bounding box. |
| get_caret_offset | `get_caret_offset() -> gint` |  |  | Gets the offset of the position of the caret (cursor). |
| get_character_at_offset | `get_character_at_offset(offset: gint) -> gunichar` |  |  | Gets the specified text. |
| get_character_count | `get_character_count() -> gint` |  |  | Gets the character count. |
| get_character_extents | `get_character_extents(offset: gint, x: out gint?, y: out gint?, width: out gint?, height: out gint?, coords: CoordType) -> none` |  |  | If the extent can not be obtained (e.g. missing support), all of x, y, width, height are set to -1. Get the bounding box containing the glyph repre... |
| get_default_attributes | `get_default_attributes() -> AttributeSet` |  |  | Creates an #AtkAttributeSet which consists of the default values of attributes for the text. See the enum AtkTextAttribute for types of text attrib... |
| get_n_selections | `get_n_selections() -> gint` |  |  | Gets the number of selected regions. |
| get_offset_at_point | `get_offset_at_point(x: gint, y: gint, coords: CoordType) -> gint` |  |  | Gets the offset of the character located at coordinates @x and @y. @x and @y are interpreted as being relative to the screen or this widget's windo... |
| get_range_extents | `get_range_extents(start_offset: gint, end_offset: gint, coord_type: CoordType, rect: out TextRectangle) -> none` |  | 1.3 | Get the bounding box for text within the specified range. If the extents can not be obtained (e.g. or missing support), the rectangle fields are se... |
| get_run_attributes | `get_run_attributes(offset: gint, start_offset: out gint, end_offset: out gint) -> AttributeSet` |  |  | Creates an #AtkAttributeSet which consists of the attributes explicitly set at the position @offset in the text. @start_offset and @end_offset are ... |
| get_selection | `get_selection(selection_num: gint, start_offset: out gint, end_offset: out gint) -> utf8` |  |  | Gets the text from the specified selection. |
| get_string_at_offset | `get_string_at_offset(offset: gint, granularity: TextGranularity, start_offset: out gint, end_offset: out gint) -> utf8` |  | 2.10 | Gets a portion of the text exposed through an #AtkText according to a given @offset and a specific @granularity, along with the start and end offse... |
| get_text | `get_text(start_offset: gint, end_offset: gint) -> utf8` |  |  | Gets the specified text. |
| get_text_after_offset | `get_text_after_offset(offset: gint, boundary_type: TextBoundary, start_offset: out gint, end_offset: out gint) -> utf8` |  |  | Gets the specified text. |
| get_text_at_offset | `get_text_at_offset(offset: gint, boundary_type: TextBoundary, start_offset: out gint, end_offset: out gint) -> utf8` |  |  | Gets the specified text. If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the offset is returned. If the boundary_type is ATK_TEXT_B... |
| get_text_before_offset | `get_text_before_offset(offset: gint, boundary_type: TextBoundary, start_offset: out gint, end_offset: out gint) -> utf8` |  |  | Gets the specified text. |
| remove_selection | `remove_selection(selection_num: gint) -> gboolean` |  |  | Removes the specified selection. |
| scroll_substring_to | `scroll_substring_to(start_offset: gint, end_offset: gint, type: ScrollType) -> gboolean` |  | 2.32 | Makes a substring of @text visible on the screen by scrolling all necessary parents. |
| scroll_substring_to_point | `scroll_substring_to_point(start_offset: gint, end_offset: gint, coords: CoordType, x: gint, y: gint) -> gboolean` |  | 2.32 | Move the top-left of a substring of @text to a given position of the screen by scrolling all necessary parents. |
| set_caret_offset | `set_caret_offset(offset: gint) -> gboolean` |  |  | Sets the caret (cursor) position to the specified @offset. In the case of rich-text content, this method should either grab focus or move the seque... |
| set_selection | `set_selection(selection_num: gint, start_offset: gint, end_offset: gint) -> gboolean` |  |  | Changes the start and end offset of the specified selection. |
| text_attributes_changed | `text_attributes_changed() -> none` |  |  |  |
| text_caret_moved | `text_caret_moved(location: gint) -> none` |  |  |  |
| text_changed | `text_changed(position: gint, length: gint) -> none` |  |  | the signal handler which is executed when there is a text change. This virtual function is deprecated sice 2.9.4 and it should not be overriden. |
| text_selection_changed | `text_selection_changed() -> none` |  |  |  |

### Atk.Value

GType: `AtkValue` ?? C type: `AtkValue`

The ATK interface implemented by valuators and components which display or select a value from a bounded range of values. #AtkValue should be imple...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_value | `Value.get_current_value(value: out GObject.Value) -> none` | atk_value_get_current_value |  | Gets the value of this object. |
| get_increment | `Value.get_increment() -> gdouble` | atk_value_get_increment | 2.12 | Gets the minimum increment by which the value of this object may be changed. If zero, the minimum increment is undefined, which may mean that it is... |
| get_maximum_value | `Value.get_maximum_value(value: out GObject.Value) -> none` | atk_value_get_maximum_value |  | Gets the maximum value of this object. |
| get_minimum_increment | `Value.get_minimum_increment(value: out GObject.Value) -> none` | atk_value_get_minimum_increment | 1.12 | Gets the minimum increment by which the value of this object may be changed. If zero, the minimum increment is undefined, which may mean that it is... |
| get_minimum_value | `Value.get_minimum_value(value: out GObject.Value) -> none` | atk_value_get_minimum_value |  | Gets the minimum value of this object. |
| get_range | `Value.get_range() -> Range` | atk_value_get_range | 2.12 | Gets the range of this object. |
| get_sub_ranges | `Value.get_sub_ranges() -> GLib.SList` | atk_value_get_sub_ranges | 2.12 | Gets the list of subranges defined for this object. See #AtkValue introduction for examples of subranges and when to expose them. |
| get_value_and_text | `Value.get_value_and_text(value: out gdouble, text: out utf8?) -> none` | atk_value_get_value_and_text | 2.12 | Gets the current value and the human readable text alternative of @obj. @text is a newly created string, that must be freed by the caller. Can be N... |
| set_current_value | `Value.set_current_value(value: GObject.Value) -> gboolean` | atk_value_set_current_value |  | Sets the value of this object. |
| set_value | `Value.set_value(new_value: gdouble) -> none` | atk_value_set_value | 2.12 | Sets the value of this object. This method is intended to provide a way to change the value of the object. In any case, it is possible that the val... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| value-changed | `value: gdouble, text: utf8` | none | last | 2.12 | The 'value-changed' signal is emitted when the current value that represent the object changes. @value is the numerical representation of this new ... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_value | `get_current_value(value: out GObject.Value) -> none` |  |  | Gets the value of this object. |
| get_increment | `get_increment() -> gdouble` |  | 2.12 | Gets the minimum increment by which the value of this object may be changed. If zero, the minimum increment is undefined, which may mean that it is... |
| get_maximum_value | `get_maximum_value(value: out GObject.Value) -> none` |  |  | Gets the maximum value of this object. |
| get_minimum_increment | `get_minimum_increment(value: out GObject.Value) -> none` |  | 1.12 | Gets the minimum increment by which the value of this object may be changed. If zero, the minimum increment is undefined, which may mean that it is... |
| get_minimum_value | `get_minimum_value(value: out GObject.Value) -> none` |  |  | Gets the minimum value of this object. |
| get_range | `get_range() -> Range` |  | 2.12 | Gets the range of this object. |
| get_sub_ranges | `get_sub_ranges() -> GLib.SList` |  | 2.12 | Gets the list of subranges defined for this object. See #AtkValue introduction for examples of subranges and when to expose them. |
| get_value_and_text | `get_value_and_text(value: out gdouble, text: out utf8?) -> none` |  | 2.12 | Gets the current value and the human readable text alternative of @obj. @text is a newly created string, that must be freed by the caller. Can be N... |
| set_current_value | `set_current_value(value: GObject.Value) -> gboolean` |  |  | Sets the value of this object. |
| set_value | `set_value(new_value: gdouble) -> none` |  | 2.12 | Sets the value of this object. This method is intended to provide a way to change the value of the object. In any case, it is possible that the val... |

### Atk.Window

GType: `AtkWindow` ?? C type: `AtkWindow`

The ATK Interface provided by UI components that represent a top-level window. #AtkWindow should be implemented by the UI elements that represent a...

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| activate | `` | none | last | 2.2 | The signal #AtkWindow::activate is emitted when a window becomes the active window of the application or session. |
| create | `` | none | last | 2.2 | The signal #AtkWindow::create is emitted when a new window is created. |
| deactivate | `` | none | last | 2.2 | The signal #AtkWindow::deactivate is emitted when a window is no longer the active window of the application or session. |
| destroy | `` | none | last | 2.2 | The signal #AtkWindow::destroy is emitted when a window is destroyed. |
| maximize | `` | none | last | 2.2 | The signal #AtkWindow::maximize is emitted when a window is maximized. |
| minimize | `` | none | last | 2.2 | The signal #AtkWindow::minimize is emitted when a window is minimized. |
| move | `` | none | last | 2.2 | The signal #AtkWindow::move is emitted when a window is moved. |
| resize | `` | none | last | 2.2 | The signal #AtkWindow::resize is emitted when a window is resized. |
| restore | `` | none | last | 2.2 | The signal #AtkWindow::restore is emitted when a window is restored. |

## Enums

### Atk.CoordType

GType: `AtkCoordType` ?? C type: `AtkCoordType`

Specifies how xy coordinates are to be interpreted. Used by functions such as atk_component_get_position() and atk_text_get_character_extents()

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| parent | 2 | parent | specifies xy coordinates relative to the widget's immediate parent. Since: 2.30 |
| screen | 0 | screen | specifies xy coordinates relative to the screen |
| window | 1 | window | specifies xy coordinates relative to the widget's top-level window |

### Atk.KeyEventType

GType: `AtkKeyEventType` ?? C type: `AtkKeyEventType`

Specifies the type of a keyboard evemt.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| last_defined | 2 | last-defined | Not a valid value; specifies end of enumeration |
| press | 0 | press | specifies a key press event |
| release | 1 | release | specifies a key release event |

### Atk.Layer

GType: `AtkLayer` ?? C type: `AtkLayer`

Describes the layer of a component These enumerated "layer values" are used when determining which UI rendering layer a component is drawn into, wh...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| background | 1 | background | This layer is reserved for the desktop background |
| canvas | 2 | canvas | This layer is used for Canvas components |
| invalid | 0 | invalid | The object does not have a layer |
| mdi | 4 | mdi | This layer is used for layered components |
| overlay | 6 | overlay | This layer is reserved for future use. |
| popup | 5 | popup | This layer is used for popup components, such as menus |
| widget | 3 | widget | This layer is normally used for components |
| window | 7 | window | This layer is used for toplevel windows. |

### Atk.Live

GType: `AtkLive` ?? C type: `AtkLive`

Enumeration used to indicate a type of live region and how assertive it should be in terms of speaking notifications. Currently, this is only used ...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| assertive | 2 | assertive | This live region should be considered assertive. |
| none | 0 | none | No live region. |
| polite | 1 | polite | This live region should be considered polite. |

### Atk.RelationType

GType: `AtkRelationType` ?? C type: `AtkRelationType`

Describes the type of the relation

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| controlled_by | 1 | controlled-by | Indicates an object controlled by one or more target objects. |
| controller_for | 2 | controller-for | Indicates an object is an controller for one or more target objects. |
| described_by | 14 | described-by | Reciprocal of %ATK_RELATION_DESCRIPTION_FOR. Indicates that one or more target objects provide descriptive information about this object. This rela... |
| description_for | 15 | description-for | Reciprocal of %ATK_RELATION_DESCRIBED_BY. Indicates that this object provides descriptive information about the target object(s). See also %ATK_REL... |
| details | 17 | details | Reciprocal of %ATK_RELATION_DETAILS_FOR. Indicates that this object has a detailed or extended description, the contents of which can be found in t... |
| details_for | 18 | details-for | Reciprocal of %ATK_RELATION_DETAILS. Indicates that this object provides a detailed or extended description about the target object(s). See also %A... |
| embedded_by | 11 | embedded-by | Reciprocal of %ATK_RELATION_EMBEDS, indicates that this object's content is visualy embedded in another object. |
| embeds | 10 | embeds | Indicates that the object visually embeds another object's content, i.e. this object's content flows around another's content. |
| error_for | 20 | error-for | Reciprocal of %ATK_RELATION_ERROR_MESSAGE. Indicates that this object contains an error message describing an invalid condition in the target objec... |
| error_message | 19 | error-message | Reciprocal of %ATK_RELATION_ERROR_FOR. Indicates that this object has one or more errors, the nature of which is described in the contents of the t... |
| flows_from | 8 | flows-from | Indicates that the object has content that flows logically from another AtkObject in a sequential way, (for instance text-flow). |
| flows_to | 7 | flows-to | Indicates that the object has content that flows logically to another AtkObject in a sequential way, (for instance text-flow). |
| label_for | 3 | label-for | Indicates an object is a label for one or more target objects. |
| labelled_by | 4 | labelled-by | Indicates an object is labelled by one or more target objects. |
| last_defined | 21 | last-defined | Not used, this value indicates the end of the enumeration. |
| member_of | 5 | member-of | Indicates an object is a member of a group of one or more target objects. |
| node_child_of | 6 | node-child-of | Indicates an object is a cell in a treetable which is displayed because a cell in the same column is expanded and identifies that cell. |
| node_parent_of | 16 | node-parent-of | Indicates an object is a cell in a treetable and is expanded to display other cells in the same column. |
| null | 0 | null | Not used, represens "no relationship" or an error condition. |
| parent_window_of | 13 | parent-window-of | Indicates that an object is a parent window of another object. |
| popup_for | 12 | popup-for | Indicates that an object is a popup for another object. |
| subwindow_of | 9 | subwindow-of | Indicates a subwindow attached to a component but otherwise has no connection in the UI heirarchy to that component. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_name | `for_name(name: utf8) -> RelationType` | atk_relation_type_for_name |  | Get the #AtkRelationType type corresponding to a relation name. |
| get_name | `get_name(type: RelationType) -> utf8` | atk_relation_type_get_name |  | Gets the description string describing the #AtkRelationType @type. |
| register | `register(name: utf8) -> RelationType` | atk_relation_type_register |  | Associate @name with a new #AtkRelationType |

### Atk.Role

GType: `AtkRole` ?? C type: `AtkRole`

Describes the role of an object These are the built-in enumerated roles that UI components can have in ATK. Other roles may be added at runtime, so...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accelerator_label | 1 | accelerator-label | A label which represents an accelerator |
| alert | 2 | alert | An object which is an alert to the user. Assistive Technologies typically respond to ATK_ROLE_ALERT by reading the entire onscreen contents of cont... |
| animation | 3 | animation | An object which is an animated image |
| application | 73 | application | The object is an application object, which may contain @ATK_ROLE_FRAME objects or other types of accessibles. The root accessible of any applicatio... |
| arrow | 4 | arrow | An arrow in one of the four cardinal directions |
| article | 107 | article | A section of a page that consists of a composition that forms an independent part of a document, page, or site. Examples: A blog entry, a news stor... |
| audio | 104 | audio | An object which represents an audio element. (Since: 2.12) |
| autocomplete | 74 | autocomplete | The object is a dialog or list containing items for insertion into an entry widget, for instance a list of words for completion of a text entry. (S... |
| block_quote | 103 | block-quote | An object which contains a text section that is quoted from another source. (Since: 2.12) |
| calendar | 5 | calendar | An object that displays a calendar and allows the user to select a date |
| canvas | 6 | canvas | An object that can be drawn into and is used to trap events |
| caption | 79 | caption | The object contains descriptive information, usually textual, about another user interface element such as a table, chart, or image. (Since: 1.11) |
| chart | 78 | chart | The object is a graphical depiction of quantitative data. It may contain multiple subelements whose attributes and/or description may be queried to... |
| check_box | 7 | check-box | A choice that can be checked or unchecked and provides a separate indicator for the current state |
| check_menu_item | 8 | check-menu-item | A menu item with a check box |
| color_chooser | 9 | color-chooser | A specialized dialog that lets the user choose a color |
| column_header | 10 | column-header | The header for a column of data |
| combo_box | 11 | combo-box | A collapsible list of choices the user can select from |
| comment | 95 | comment | An object found within a document and designed to present a comment, note, or other annotation. In some cases, this object might not be visible unt... |
| content_deletion | 123 | content-deletion | Content previously deleted or proposed to be deleted, e.g. in revision history or a content view providing suggestions from reviewers. (Since: 2.34) |
| content_insertion | 124 | content-insertion | Content previously inserted or proposed to be inserted, e.g. in revision history or a content view providing suggestions from reviewers. (Since: 2.34) |
| date_editor | 12 | date-editor | An object whose purpose is to allow a user to edit a date |
| definition | 106 | definition | A definition of a term or concept. (Since: 2.12) |
| description_list | 114 | description-list | An object that represents a list of term-value groups. A term-value group represents a individual description and consist of one or more names (ATK... |
| description_term | 115 | description-term | An object that represents a term or phrase with a corresponding definition. (Since: 2.12) |
| description_value | 116 | description-value | An object that represents the description, definition or value of a term. (Since: 2.12) |
| desktop_frame | 14 | desktop-frame | A pane that supports internal frames and iconified versions of those internal frames |
| desktop_icon | 13 | desktop-icon | An inconifed internal frame within a DESKTOP_PANE |
| dial | 15 | dial | An object whose purpose is to allow a user to set a value |
| dialog | 16 | dialog | A top level window with title bar and a border |
| directory_pane | 17 | directory-pane | A pane that allows the user to navigate through and select the contents of a directory |
| document_email | 94 | document-email | A document frame which contains email content to be displayed or composed either in plain text or HTML. (Since: 2.1.0) |
| document_frame | 80 | document-frame | The object is a visual frame or container which contains a view of document content. Document frames may occur within another Document instance, in... |
| document_presentation | 91 | document-presentation | A document frame which contains a presentation or slide content. (Since: 2.1.0) |
| document_spreadsheet | 90 | document-spreadsheet | A document frame which contains a spreadsheet. (Since: 2.1.0) |
| document_text | 92 | document-text | A document frame which contains textual content, such as found in a word processing application. (Since: 2.1.0) |
| document_web | 93 | document-web | A document frame which contains HTML or other markup suitable for display in a web browser. (Since: 2.1.0) |
| drawing_area | 18 | drawing-area | An object used for drawing custom user interface elements |
| edit_bar | 75 | edit-bar | The object is an editable text object in a toolbar. (Since: 1.5) |
| embedded | 76 | embedded | The object is an embedded container within a document or panel. This role is a grouping "hint" indicating that the contained objects share a contex... |
| entry | 77 | entry | The object is a component whose textual content may be entered or modified by the user, provided @ATK_STATE_EDITABLE is present. (Since: 1.11) |
| file_chooser | 19 | file-chooser | A specialized dialog that lets the user choose a file |
| filler | 20 | filler | A object that fills up space in a user interface |
| font_chooser | 21 | font-chooser | A specialized dialog that lets the user choose a font |
| footer | 70 | footer | An object that serves as a document footer. (Since: 1.1.1) |
| footnote | 122 | footnote | An object that contains the text of a footnote. (Since: 2.26) |
| form | 85 | form | The object is a container for form controls, for instance as part of a web form or user-input form within a document. This role is primarily a tag/... |
| frame | 22 | frame | A top level window with a title bar, border, menubar, etc. |
| glass_pane | 23 | glass-pane | A pane that is guaranteed to be painted on top of all panes beneath it |
| grouping | 97 | grouping | A group of related widgets. This group typically has a label. (Since: 2.1.0) |
| header | 69 | header | An object that serves as a document header. (Since: 1.1.1) |
| heading | 81 | heading | The object serves as a heading for content which follows it in a document. The 'heading level' of the heading, if availabe, may be obtained by quer... |
| html_container | 24 | html-container | A document container for HTML, whose children represent the document content |
| icon | 25 | icon | A small fixed size picture, typically used to decorate components |
| image | 26 | image | An object whose primary purpose is to display an image |
| image_map | 98 | image-map | An image map object. Usually a graphic with multiple hotspots, where each hotspot can be activated resulting in the loading of another document or ... |
| info_bar | 100 | info-bar | An object designed to present a message to the user within an existing window. (Since: 2.1.0) |
| input_method_window | 87 | input-method-window | The object is a window or similar viewport which is used to allow composition or input of a 'complex character', in other words it is an "input met... |
| internal_frame | 27 | internal-frame | A frame-like object that is clipped by a desktop pane |
| invalid | 0 | invalid | Invalid role |
| label | 28 | label | An object used to present an icon or short string in an interface |
| landmark | 108 | landmark | A region of a web page intended as a navigational landmark. This is designed to allow Assistive Technologies to provide quick navigation among key ... |
| last_defined | 128 | last-defined | not a valid role, used for finding end of the enumeration |
| layered_pane | 29 | layered-pane | A specialized pane that allows its children to be drawn in layers, providing a form of stacking order |
| level_bar | 101 | level-bar | A bar that serves as a level indicator to, for instance, show the strength of a password or the state of a battery. (Since: 2.7.3) |
| link | 86 | link | The object is a hypertext anchor, i.e. a "link" in a hypertext document. Such objects are distinct from 'inline' content which may also use the Hyp... |
| list | 30 | list | An object that presents a list of objects to the user and allows the user to select one or more of them |
| list_box | 96 | list-box | A non-collapsible list of choices the user can select from. (Since: 2.1.0) |
| list_item | 31 | list-item | An object that represents an element of a list |
| log | 109 | log | A text widget or container holding log content, such as chat history and error logs. In this role there is a relationship between the arrival of ne... |
| mark | 125 | mark | A run of content that is marked or highlighted, such as for reference purposes, or to call it out as having a special purpose. If the marked conten... |
| marquee | 110 | marquee | A container where non-essential information changes frequently. Common usages of marquee include stock tickers and ad banners. The primary differen... |
| math | 111 | math | A text widget or container that holds a mathematical expression. (Since: 2.12) |
| math_fraction | 118 | math-fraction | An object that represents a mathematical fraction. (Since: 2.16) |
| math_root | 119 | math-root | An object that represents a mathematical expression displayed with a radical. (Since: 2.16) |
| menu | 32 | menu | An object usually found inside a menu bar that contains a list of actions the user can choose from |
| menu_bar | 33 | menu-bar | An object usually drawn at the top of the primary dialog box of an application that contains a list of menus the user can choose from |
| menu_item | 34 | menu-item | An object usually contained in a menu that presents an action the user can choose |
| notification | 99 | notification | A transitory object designed to present a message to the user, typically at the desktop level rather than inside a particular application. (Since: ... |
| option_pane | 35 | option-pane | A specialized pane whose primary use is inside a DIALOG |
| page | 82 | page | The object is a containing instance which encapsulates a page of information. @ATK_ROLE_PAGE is used in documents and content which support a pagin... |
| page_tab | 36 | page-tab | An object that is a child of a page tab list |
| page_tab_list | 37 | page-tab-list | An object that presents a series of panels (or page tabs), one at a time, through some mechanism provided by the object |
| panel | 38 | panel | A generic container that is often used to group objects |
| paragraph | 71 | paragraph | An object which is contains a paragraph of text content. (Since: 1.1.1) |
| password_text | 39 | password-text | A text object uses for passwords, or other places where the text content is not shown visibly to the user |
| popup_menu | 40 | popup-menu | A temporary window that is usually used to offer the user a list of choices, and then hides when the user selects one of those choices |
| progress_bar | 41 | progress-bar | An object used to indicate how much of a task has been completed |
| push_button | 42 | push-button | An object the user can manipulate to tell the application to do something |
| push_button_menu | 127 | push-button-menu | A specialized push button to open a menu. (Since: 2.46) |
| radio_button | 43 | radio-button | A specialized check box that will cause other radio buttons in the same group to become unchecked when this one is checked |
| radio_menu_item | 44 | radio-menu-item | A check menu item which belongs to a group. At each instant exactly one of the radio menu items from a group is selected |
| rating | 112 | rating | A widget whose purpose is to display a rating, such as the number of stars associated with a song in a media player. Objects of this role should al... |
| redundant_object | 84 | redundant-object | The object is redundant with another object in the hierarchy, and is exposed for purely technical reasons. Objects of this role should normally be ... |
| root_pane | 45 | root-pane | A specialized pane that has a glass pane and a layered pane as its children |
| row_header | 46 | row-header | The header for a row of data |
| ruler | 72 | ruler | An object which describes margins and tab stops, etc. for text objects which it controls (should have CONTROLLER_FOR relation to such). (Since: 1.1.1) |
| scroll_bar | 47 | scroll-bar | An object usually used to allow a user to incrementally view a large amount of data. |
| scroll_pane | 48 | scroll-pane | An object that allows a user to incrementally view a large amount of information |
| section | 83 | section | The object is a containing instance of document content which constitutes a particular 'logical' section of the document. The type of content withi... |
| separator | 49 | separator | An object usually contained in a menu to provide a visible and logical separation of the contents in a menu |
| slider | 50 | slider | An object that allows the user to select from a bounded range |
| spin_button | 52 | spin-button | An object used to get an integer or floating point number from the user |
| split_pane | 51 | split-pane | A specialized panel that presents two other panels at the same time |
| static | 117 | static | A generic non-container object whose purpose is to display a brief amount of information to the user and whose role is known by the implementor but... |
| statusbar | 53 | statusbar | An object which reports messages of minor importance to the user |
| subscript | 120 | subscript | An object that contains text that is displayed as a subscript. (Since: 2.16) |
| suggestion | 126 | suggestion | A container for content that is called out as a proposed change from the current version of the document, such as by a reviewer of the content. Thi... |
| superscript | 121 | superscript | An object that contains text that is displayed as a superscript. (Since: 2.16) |
| table | 54 | table | An object used to represent information in terms of rows and columns |
| table_cell | 55 | table-cell | A cell in a table |
| table_column_header | 56 | table-column-header | The header for a column of a table |
| table_row | 88 | table-row | A row in a table. (Since: 2.1.0) |
| table_row_header | 57 | table-row-header | The header for a row of a table |
| tear_off_menu_item | 58 | tear-off-menu-item | A menu item used to tear off and reattach its menu |
| terminal | 59 | terminal | An object that represents an accessible terminal. (Since: 0.6) |
| text | 60 | text | An interactive widget that supports multiple lines of text and optionally accepts user input, but whose purpose is not to solicit user input. Thus ... |
| timer | 113 | timer | An object containing a numerical counter which indicates an amount of elapsed time from a start point, or the time remaining until an end point. (S... |
| title_bar | 102 | title-bar | A bar that serves as the title of a window or a dialog. (Since: 2.12) |
| toggle_button | 61 | toggle-button | A specialized push button that can be checked or unchecked, but does not provide a separate indicator for the current state |
| tool_bar | 62 | tool-bar | A bar or palette usually composed of push buttons or toggle buttons |
| tool_tip | 63 | tool-tip | An object that provides information about another object |
| tree | 64 | tree | An object used to represent hierarchical information to the user |
| tree_item | 89 | tree-item | An object that represents an element of a tree. (Since: 2.1.0) |
| tree_table | 65 | tree-table | An object capable of expanding and collapsing rows as well as showing multiple columns of data. (Since: 0.7) |
| unknown | 66 | unknown | The object contains some Accessible information, but its role is not known |
| video | 105 | video | An object which represents a video element. (Since: 2.12) |
| viewport | 67 | viewport | An object usually used in a scroll pane |
| window | 68 | window | A top level window with no title or border. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_name | `for_name(name: utf8) -> Role` | atk_role_for_name |  | Get the #AtkRole type corresponding to a rolew name. |
| get_localized_name | `get_localized_name(role: Role) -> utf8` | atk_role_get_localized_name |  | Gets the localized description string describing the #AtkRole @role. |
| get_name | `get_name(role: Role) -> utf8` | atk_role_get_name |  | Gets the description string describing the #AtkRole @role. |
| register | `register(name: utf8) -> Role` | atk_role_register |  | Registers the role specified by @name. @name must be a meaningful name. So it should not be empty, or consisting on whitespaces. |

### Atk.ScrollType

GType: `AtkScrollType` ?? C type: `AtkScrollType`

Specifies where an object should be placed on the screen when using scroll_to.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| anywhere | 6 | anywhere | Scroll the object vertically and horizontally so that as much as possible of the object becomes visible. The exact placement is determined by the a... |
| bottom_edge | 3 | bottom-edge | Scroll the object vertically to bring its bottom edge to the bottom edge of the window. |
| bottom_right | 1 | bottom-right | Scroll the object vertically and horizontally to bring its bottom right corner to the bottom right corner of the window. |
| left_edge | 4 | left-edge | Scroll the object vertically and horizontally to bring its left edge to the left edge of the window. |
| right_edge | 5 | right-edge | Scroll the object vertically and horizontally to bring its right edge to the right edge of the window. |
| top_edge | 2 | top-edge | Scroll the object vertically to bring its top edge to the top edge of the window. |
| top_left | 0 | top-left | Scroll the object vertically and horizontally to bring its top left corner to the top left corner of the window. |

### Atk.StateType

GType: `AtkStateType` ?? C type: `AtkStateType`

The possible types of states of an object

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| active | 1 | active | Indicates a window is currently the active window, or an object is the active subelement within a container or table. ATK_STATE_ACTIVE should not b... |
| animated | 37 | animated | Indicates that the object changes its appearance dynamically as an inherent part of its presentation. This state may come and go if an object is on... |
| armed | 2 | armed | Indicates that the object is 'armed', i.e. will be activated by if a pointer button-release event occurs within its bounds. Buttons often enter thi... |
| busy | 3 | busy | Indicates the current object is busy, i.e. onscreen representation is in the process of changing, or the object is temporarily unavailable for inte... |
| checkable | 39 | checkable | Indicates this object has the potential to be checked, such as a checkbox or toggle-able table cell. @Since: ATK-2.12 |
| checked | 4 | checked | Indicates this object is currently checked, for instance a checkbox is 'non-empty'. |
| collapsed | 43 | collapsed | Indicates this object is collapsed. @Since: ATK-2.38 |
| default | 36 | default | Indicates that the object is the "default" active component, i.e. the object which is activated by an end-user press of the "Enter" or "Return" key... |
| defunct | 5 | defunct | Indicates that this object no longer has a valid backing widget (for instance, if its peer object has been destroyed) |
| editable | 6 | editable | Indicates that this object can contain text, and that the user can change the textual contents of this object by editing those contents directly. F... |
| enabled | 7 | enabled | Indicates that this object is enabled, i.e. that it currently reflects some application state. Objects that are "greyed out" may lack this state, a... |
| expandable | 8 | expandable | Indicates this object allows progressive disclosure of its children |
| expanded | 9 | expanded | Indicates this object its expanded - see ATK_STATE_EXPANDABLE above |
| focusable | 10 | focusable | Indicates this object can accept keyboard focus, which means all events resulting from typing on the keyboard will normally be passed to it when it... |
| focused | 11 | focused | Indicates this object currently has the keyboard focus |
| has_popup | 40 | has-popup | Indicates that the object has a popup context menu or sub-level menu which may or may not be showing. This means that activation renders conditiona... |
| has_tooltip | 41 | has-tooltip | Indicates this object has a tooltip. @Since: ATK-2.16 |
| horizontal | 12 | horizontal | Indicates the orientation of this object is horizontal; used, for instance, by objects of ATK_ROLE_SCROLL_BAR. For objects where vertical/horizonta... |
| iconified | 13 | iconified | Indicates this object is minimized and is represented only by an icon |
| indeterminate | 30 | indeterminate | Indicates that the value, or some other quantifiable property, of this AtkObject cannot be fully determined. In the case of a large data set in whi... |
| invalid | 0 | invalid | Indicates an invalid state - probably an error condition. |
| invalid_entry | 33 | invalid-entry | Indicates that the object has encountered an error condition due to failure of input validation. For instance, a form control may acquire this stat... |
| last_defined | 44 | last-defined | Not a valid state, used for finding end of enumeration |
| manages_descendants | 29 | manages-descendants | Indicates that "active-descendant-changed" event is sent when children become 'active' (i.e. are selected or navigated to onscreen). Used to preven... |
| modal | 14 | modal | Indicates something must be done with this object before the user can interact with an object in a different window |
| multi_line | 15 | multi-line | Indicates this (text) object can contain multiple lines of text |
| multiselectable | 16 | multiselectable | Indicates this object allows more than one of its children to be selected at the same time, or in the case of text objects, that the object support... |
| opaque | 17 | opaque | Indicates this object paints every pixel within its rectangular region. |
| pressed | 18 | pressed | Indicates this object is currently pressed. |
| read_only | 42 | read-only | Indicates that a widget which is ENABLED and SENSITIVE has a value which can be read, but not modified, by the user. Note that this state should on... |
| required | 32 | required | Indicates that explicit user interaction with an object is required by the user interface, e.g. a required field in a "web-form" interface. |
| resizable | 19 | resizable | Indicates the size of this object is not fixed |
| selectable | 20 | selectable | Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that can be se... |
| selectable_text | 35 | selectable-text | Indicates that the object in question supports text selection. It should only be exposed on objects which implement the Text interface, in order to... |
| selected | 21 | selected | Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that has been ... |
| sensitive | 22 | sensitive | Indicates this object is sensitive, e.g. to user interaction. STATE_SENSITIVE usually accompanies STATE_ENABLED for user-actionable controls, but m... |
| showing | 23 | showing | Indicates this object, the object's parent, the object's parent's parent, and so on, are all 'shown' to the end-user, i.e. subject to "exposure" if... |
| single_line | 24 | single-line | Indicates this (text) object can contain only a single line of text |
| stale | 25 | stale | Indicates that the information returned for this object may no longer be synchronized with the application state. This is implied if the object has... |
| supports_autocompletion | 34 | supports-autocompletion | Indicates that the object in question implements some form of ??typeahead?? or pre-selection behavior whereby entering the first character of one o... |
| transient | 26 | transient | Indicates this object is transient, i.e. a snapshot which may not emit events when its state changes. Data from objects with ATK_STATE_TRANSIENT sh... |
| truncated | 31 | truncated | Indicates that an object is truncated, e.g. a text value in a speradsheet cell. |
| vertical | 27 | vertical | Indicates the orientation of this object is vertical |
| visible | 28 | visible | Indicates this object is visible, e.g. has been explicitly marked for exposure to the user. **note**: %ATK_STATE_VISIBLE is no guarantee that the o... |
| visited | 38 | visited | Indicates that the object (typically a hyperlink) has already been 'activated', and/or its backing data has already been downloaded, rendered, or o... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_name | `for_name(name: utf8) -> StateType` | atk_state_type_for_name |  | Gets the #AtkStateType corresponding to the description string @name. |
| get_name | `get_name(type: StateType) -> utf8` | atk_state_type_get_name |  | Gets the description string describing the #AtkStateType @type. |
| register | `register(name: utf8) -> StateType` | atk_state_type_register |  | Register a new object state. |

### Atk.TextAttribute

GType: `AtkTextAttribute` ?? C type: `AtkTextAttribute`

Describes the text attributes supported

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bg_color | 18 | bg-color | The background color. The value is an RGB value of the format "%u,%u,%u" |
| bg_full_height | 9 | bg-full-height | "true" or "false" whether to make the background color for each character the height of the highest font used on the current line, or the height of... |
| bg_stipple | 20 | bg-stipple | "true" if a #GdkBitmap is set for stippling the background color. |
| direction | 23 | direction | The direction of the text, if set. Values are "none", "ltr" or "rtl" |
| editable | 5 | editable | Either "true" or "false" indicating whether text is editable or not |
| family_name | 17 | family-name | The font family name |
| fg_color | 19 | fg-color | The foreground color. The value is an RGB value of the format "%u,%u,%u" |
| fg_stipple | 21 | fg-stipple | "true" if a #GdkBitmap is set for stippling the foreground color. |
| indent | 3 | indent | The number of pixels that the text is indented |
| invalid | 0 | invalid | Invalid attribute, like bad spelling or grammar. |
| invisible | 4 | invisible | Either "true" or "false" indicating whether text is visible or not |
| justification | 24 | justification | The justification of the text, if set. Values are "left", "right", "center" or "fill" |
| language | 16 | language | The language used |
| last_defined | 29 | last-defined | not a valid text attribute, used for finding end of enumeration |
| left_margin | 1 | left-margin | The pixel width of the left margin |
| pixels_above_lines | 6 | pixels-above-lines | Pixels of blank space to leave above each newline-terminated line. |
| pixels_below_lines | 7 | pixels-below-lines | Pixels of blank space to leave below each newline-terminated line. |
| pixels_inside_wrap | 8 | pixels-inside-wrap | Pixels of blank space to leave between wrapped lines inside the same newline-terminated line (paragraph). |
| right_margin | 2 | right-margin | The pixel width of the right margin |
| rise | 10 | rise | Number of pixels that the characters are risen above the baseline. See also ATK_TEXT_ATTR_TEXT_POSITION. |
| scale | 14 | scale | The scale of the characters. The value is a string representation of a double |
| size | 13 | size | The size of the characters in points. eg: 10 |
| stretch | 25 | stretch | The stretch of the text, if set. Values are "ultra_condensed", "extra_condensed", "condensed", "semi_condensed", "normal", "semi_expanded", "expand... |
| strikethrough | 12 | strikethrough | "true" or "false" whether the text is strikethrough |
| style | 27 | style | The slant style of the text, if set. Values are "normal", "oblique" or "italic" |
| text_position | 28 | text-position | The vertical position with respect to the baseline. Values are "baseline", "super", or "sub". Note that a super or sub text attribute refers to pos... |
| underline | 11 | underline | "none", "single", "double", "low", or "error" |
| variant | 26 | variant | The capitalization variant of the text, if set. Values are "normal" or "small_caps" |
| weight | 15 | weight | The weight of the characters. |
| wrap_mode | 22 | wrap-mode | The wrap mode of the text, if any. Values are "none", "char", "word", or "word_char". |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| for_name | `for_name(name: utf8) -> TextAttribute` | atk_text_attribute_for_name |  | Get the #AtkTextAttribute type corresponding to a text attribute name. |
| get_name | `get_name(attr: TextAttribute) -> utf8` | atk_text_attribute_get_name |  | Gets the name corresponding to the #AtkTextAttribute |
| get_value | `get_value(attr: TextAttribute, index_: gint) -> utf8` | atk_text_attribute_get_value |  | Gets the value for the index of the #AtkTextAttribute |
| register | `register(name: utf8) -> TextAttribute` | atk_text_attribute_register |  | Associate @name with a new #AtkTextAttribute |

### Atk.TextBoundary

GType: `AtkTextBoundary` ?? C type: `AtkTextBoundary`

Text boundary types used for specifying boundaries for regions of text. This enumeration is deprecated since 2.9.4 and should not be used. Use AtkT...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| char | 0 | char | Boundary is the boundary between characters (including non-printing characters) |
| line_end | 6 | line-end | Boundary is the linefeed, or return character. |
| line_start | 5 | line-start | Boundary is the initial character of the content or a character immediately following a newline, linefeed, or return character. |
| sentence_end | 4 | sentence-end | Boundary is the last (terminal) character in a sentence; in languages which use "sentence stop" punctuation such as English, the boundary is thus t... |
| sentence_start | 3 | sentence-start | Boundary is the first character in a sentence. |
| word_end | 2 | word-end | Boundary is the end (i.e. last character) of a word. |
| word_start | 1 | word-start | Boundary is the start (i.e. first character) of a word. |

### Atk.TextClipType

GType: `AtkTextClipType` ?? C type: `AtkTextClipType`

Describes the type of clipping required.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| both | 3 | both | Only text fully within mix/max bound is retained |
| max | 2 | max | Text clipped by max coordinate is omitted |
| min | 1 | min | Text clipped by min coordinate is omitted |
| none | 0 | none | No clipping to be done |

### Atk.TextGranularity

GType: `AtkTextGranularity` ?? C type: `AtkTextGranularity`

Text granularity types used for specifying the granularity of the region of text we are interested in.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| char | 0 | char | Granularity is defined by the boundaries between characters (including non-printing characters) |
| line | 3 | line | Granularity is defined by the boundaries of a line, starting at the beginning of the current line and finishing at the beginning of the following o... |
| paragraph | 4 | paragraph | Granularity is defined by the boundaries of a paragraph, starting at the beginning of the current paragraph and finishing at the beginning of the f... |
| sentence | 2 | sentence | Granularity is defined by the boundaries of a sentence, starting at the beginning of the current sentence and finishing at the beginning of the fol... |
| word | 1 | word | Granularity is defined by the boundaries of a word, starting at the beginning of the current word and finishing at the beginning of the following o... |

### Atk.ValueType

GType: `AtkValueType` ?? C type: `AtkValueType`

Default types for a given value. Those are defined in order to easily get localized strings to describe a given value or a given subrange, using at...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| acceptable | 2 | acceptable |  |
| bad | 11 | bad |  |
| best | 14 | best |  |
| good | 12 | good |  |
| high | 8 | high |  |
| last_defined | 15 | last-defined |  |
| low | 6 | low |  |
| medium | 7 | medium |  |
| strong | 3 | strong |  |
| very_bad | 10 | very-bad |  |
| very_good | 13 | very-good |  |
| very_high | 9 | very-high |  |
| very_low | 5 | very-low |  |
| very_strong | 4 | very-strong |  |
| very_weak | 0 | very-weak |  |
| weak | 1 | weak |  |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_localized_name | `get_localized_name(value_type: ValueType) -> utf8` | atk_value_type_get_localized_name |  | Gets the localized description string describing the #AtkValueType @value_type. |
| get_name | `get_name(value_type: ValueType) -> utf8` | atk_value_type_get_name |  | Gets the description string describing the #AtkValueType @value_type. |

## Flags

### Atk.HyperlinkStateFlags

GType: `AtkHyperlinkStateFlags` ?? C type: `AtkHyperlinkStateFlags`

Describes the type of link

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| inline | 1 | inline | Link is inline |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ActionIface |  | 0 | 0 | 0 | The #AtkAction interface should be supported by any object that can perform one or more actions. The interface provides the standard mechanism for ... |
| Attribute |  | 0 | 0 | 1 | AtkAttribute is a string name/value pair representing a generic attribute. This can be used to expose additional information from an accessible obj... |
| ComponentIface |  | 0 | 0 | 0 | The AtkComponent interface should be supported by any object that is rendered on the screen. The interface provides the standard mechanism for an a... |
| DocumentIface |  | 0 | 0 | 0 | gets a string indicating the document type. This virtual function is deprecated since 2.12 and it should not be overriden. |
| EditableTextIface |  | 0 | 0 | 0 | %TRUE if attributes successfully set for the specified range, otherwise %FALSE |
| GObjectAccessibleClass |  | 0 | 0 | 0 |  |
| HyperlinkClass |  | 0 | 0 | 0 | a string specifying the URI |
| HyperlinkImplIface |  | 0 | 0 | 0 | an AtkHyperlink object which points to this implementing AtkObject. |
| HypertextIface |  | 0 | 0 | 0 | the link in this hypertext document at index @link_index |
| ImageIface |  | 0 | 0 | 0 | a #GObject instance that implements AtkImageIface |
| Implementor |  | 0 | 0 | 1 | Gets a reference to an object's #AtkObject implementation, if the object implements #AtkObjectIface |
| KeyEventStruct |  | 0 | 0 | 0 | Encapsulates information about a key event. |
| MiscClass |  | 0 | 0 | 0 | Usage of AtkMisc is deprecated since 2.12 and heavily discouraged. |
| NoOpObjectClass |  | 0 | 0 | 0 |  |
| NoOpObjectFactoryClass |  | 0 | 0 | 0 |  |
| ObjectClass |  | 0 | 0 | 0 | a character string representing the accessible name of the object. |
| ObjectFactoryClass |  | 0 | 0 | 0 | an #AtkObjectFactory to invalidate |
| PlugClass |  | 0 | 0 | 0 |  |
| PropertyValues |  | 0 | 0 | 0 | Note: @old_value field of #AtkPropertyValues will not contain a valid value. This is a field defined with the purpose of contain the previous value... |
| Range |  | 0 | 0 | 6 | A given range or subrange, to be used with #AtkValue #AtkRange are used on #AtkValue, in order to represent the full range of a given component (fo... |
| Rectangle |  | 0 | 0 | 0 | A data structure for holding a rectangle. Those coordinates are relative to the component top-level parent. |
| RegistryClass |  | 0 | 0 | 0 |  |
| RelationClass |  | 0 | 0 | 0 |  |
| RelationSetClass |  | 0 | 0 | 0 |  |
| SelectionIface |  | 0 | 0 | 0 | TRUE if success, FALSE otherwise. |
| SocketClass |  | 0 | 0 | 0 | an #AtkSocket |
| StateSetClass |  | 0 | 0 | 0 |  |
| StreamableContentIface |  | 0 | 0 | 0 | a gint which is the number of mime types supported by the object. |
| TableCellIface |  | 0 | 0 | 0 | AtkTableCell is an interface for cells inside an #AtkTable. |
| TableIface |  | 0 | 0 | 0 | an #AtkObject representing the referred to accessible |
| TextIface |  | 0 | 0 | 0 | a newly allocated string containing the text from @start_offset up to, but not including @end_offset. Use g_free() to free the returned string. |
| TextRange |  | 0 | 0 | 0 | A structure used to describe a text range. |
| TextRectangle |  | 0 | 0 | 0 | A structure used to store a rectangle used by AtkText. |
| TextSelection |  | 0 | 0 | 0 | This structure represents a single text selection within a document. This selection is defined by two points in the content, where each one is defi... |
| UtilClass |  | 0 | 0 | 0 | adds the specified function to the list of functions to be called when an ATK event occurs. ATK implementors are discouraged from reimplementing th... |
| ValueIface |  | 0 | 0 | 0 | This virtual function is deprecated since 2.12 and it should not be overriden. |
| WindowIface |  | 0 | 0 | 0 |  |

### Atk.ActionIface

C type: `AtkActionIface`

The #AtkAction interface should be supported by any object that can perform one or more actions. The interface provides the standard mechanism for ...

#### Fields

| Field | Type |
| --- | --- |
| do_action | gboolean |
| get_description | utf8 |
| get_keybinding | utf8 |
| get_localized_name | utf8 |
| get_n_actions | gint |
| get_name | utf8 |
| parent | GObject.TypeInterface |
| set_description | gboolean |

### Atk.Attribute

C type: `AtkAttribute`

AtkAttribute is a string name/value pair representing a generic attribute. This can be used to expose additional information from an accessible obj...

#### Fields

| Field | Type |
| --- | --- |
| name | utf8 |
| value | utf8 |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| set_free | `set_free(attrib_set: AttributeSet) -> none` | atk_attribute_set_free |  | Frees the memory used by an #AtkAttributeSet, including all its #AtkAttributes. |

### Atk.ComponentIface

C type: `AtkComponentIface`

The AtkComponent interface should be supported by any object that is rendered on the screen. The interface provides the standard mechanism for an a...

#### Fields

| Field | Type |
| --- | --- |
| add_focus_handler | guint |
| bounds_changed | none |
| contains | gboolean |
| get_alpha | gdouble |
| get_extents | none |
| get_layer | Layer |
| get_mdi_zorder | gint |
| get_position | none |
| get_size | none |
| grab_focus | gboolean |
| parent | GObject.TypeInterface |
| ref_accessible_at_point | Object |
| remove_focus_handler | none |
| scroll_to | gboolean |
| scroll_to_point | gboolean |
| set_extents | gboolean |
| set_position | gboolean |
| set_size | gboolean |

### Atk.DocumentIface

C type: `AtkDocumentIface`

gets a string indicating the document type. This virtual function is deprecated since 2.12 and it should not be overriden.

#### Fields

| Field | Type |
| --- | --- |
| get_current_page_number | gint |
| get_document | gpointer |
| get_document_attribute_value | utf8 |
| get_document_attributes | AttributeSet |
| get_document_locale | utf8 |
| get_document_type | utf8 |
| get_page_count | gint |
| get_text_selections | TextSelection |
| parent | GObject.TypeInterface |
| set_document_attribute | gboolean |
| set_text_selections | gboolean |

### Atk.EditableTextIface

C type: `AtkEditableTextIface`

%TRUE if attributes successfully set for the specified range, otherwise %FALSE

#### Fields

| Field | Type |
| --- | --- |
| copy_text | none |
| cut_text | none |
| delete_text | none |
| insert_text | none |
| parent_interface | GObject.TypeInterface |
| paste_text | none |
| set_run_attributes | gboolean |
| set_text_contents | none |

### Atk.GObjectAccessibleClass

C type: `AtkGObjectAccessibleClass`

#### Fields

| Field | Type |
| --- | --- |
| pad1 | Function |
| pad2 | Function |
| parent_class | ObjectClass |

### Atk.HyperlinkClass

C type: `AtkHyperlinkClass`

a string specifying the URI

#### Fields

| Field | Type |
| --- | --- |
| get_end_index | gint |
| get_n_anchors | gint |
| get_object | Object |
| get_start_index | gint |
| get_uri | utf8 |
| is_selected_link | gboolean |
| is_valid | gboolean |
| link_activated | none |
| link_state | guint |
| pad1 | Function |
| parent | GObject.ObjectClass |

### Atk.HyperlinkImplIface

C type: `AtkHyperlinkImplIface`

an AtkHyperlink object which points to this implementing AtkObject.

#### Fields

| Field | Type |
| --- | --- |
| get_hyperlink | Hyperlink |
| parent | GObject.TypeInterface |

### Atk.HypertextIface

C type: `AtkHypertextIface`

the link in this hypertext document at index @link_index

#### Fields

| Field | Type |
| --- | --- |
| get_link | Hyperlink |
| get_link_index | gint |
| get_n_links | gint |
| link_selected | none |
| parent | GObject.TypeInterface |

### Atk.ImageIface

C type: `AtkImageIface`

a #GObject instance that implements AtkImageIface

#### Fields

| Field | Type |
| --- | --- |
| get_image_description | utf8 |
| get_image_locale | utf8 |
| get_image_position | none |
| get_image_size | none |
| parent | GObject.TypeInterface |
| set_image_description | gboolean |

### Atk.Implementor

C type: `AtkImplementor`

Gets a reference to an object's #AtkObject implementation, if the object implements #AtkObjectIface

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ref_accessible | `Implementor.ref_accessible() -> Object` | atk_implementor_ref_accessible |  | Gets a reference to an object's #AtkObject implementation, if the object implements #AtkObjectIface |

### Atk.KeyEventStruct

C type: `AtkKeyEventStruct`

Encapsulates information about a key event.

#### Fields

| Field | Type |
| --- | --- |
| keycode | guint16 |
| keyval | guint |
| length | gint |
| state | guint |
| string | utf8 |
| timestamp | guint32 |
| type | gint |

### Atk.MiscClass

C type: `AtkMiscClass`

Usage of AtkMisc is deprecated since 2.12 and heavily discouraged.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.ObjectClass |
| threads_enter | none |
| threads_leave | none |
| vfuncs | gpointer |

### Atk.NoOpObjectClass

C type: `AtkNoOpObjectClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | ObjectClass |

### Atk.NoOpObjectFactoryClass

C type: `AtkNoOpObjectFactoryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | ObjectFactoryClass |

### Atk.ObjectClass

C type: `AtkObjectClass`

a character string representing the accessible name of the object.

#### Fields

| Field | Type |
| --- | --- |
| active_descendant_changed | none |
| children_changed | none |
| connect_property_change_handler | guint |
| focus_event | none |
| get_attributes | AttributeSet |
| get_description | utf8 |
| get_index_in_parent | gint |
| get_layer | Layer |
| get_mdi_zorder | gint |
| get_n_children | gint |
| get_name | utf8 |
| get_object_locale | utf8 |
| get_parent | Object |
| get_role | Role |
| initialize | none |
| pad1 | Function |
| parent | GObject.ObjectClass |
| property_change | none |
| ref_child | Object |
| ref_relation_set | RelationSet |
| ref_state_set | StateSet |
| remove_property_change_handler | none |
| set_description | none |
| set_name | none |
| set_parent | none |
| set_role | none |
| state_change | none |
| visible_data_changed | none |

### Atk.ObjectFactoryClass

C type: `AtkObjectFactoryClass`

an #AtkObjectFactory to invalidate

#### Fields

| Field | Type |
| --- | --- |
| create_accessible | Object |
| get_accessible_type | GType |
| invalidate | none |
| pad1 | Function |
| pad2 | Function |
| parent_class | GObject.ObjectClass |

### Atk.PlugClass

C type: `AtkPlugClass`

#### Fields

| Field | Type |
| --- | --- |
| get_object_id | utf8 |
| parent_class | ObjectClass |

### Atk.PropertyValues

C type: `AtkPropertyValues`

Note: @old_value field of #AtkPropertyValues will not contain a valid value. This is a field defined with the purpose of contain the previous value...

#### Fields

| Field | Type |
| --- | --- |
| new_value | GObject.Value |
| old_value | GObject.Value |
| property_name | utf8 |

### Atk.Range

GType: `AtkRange` ?? C type: `AtkRange`

A given range or subrange, to be used with #AtkValue #AtkRange are used on #AtkValue, in order to represent the full range of a given component (fo...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Range.new(lower_limit: gdouble, upper_limit: gdouble, description: utf8) -> Range` | atk_range_new | 2.12 | Creates a new #AtkRange. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Range.copy() -> Range` | atk_range_copy | 2.12 | Returns a new #AtkRange that is a exact copy of @src |
| free | `Range.free() -> none` | atk_range_free | 2.12 | Free @range |
| get_description | `Range.get_description() -> utf8` | atk_range_get_description | 2.12 | Returns the human readable description of @range |
| get_lower_limit | `Range.get_lower_limit() -> gdouble` | atk_range_get_lower_limit | 2.12 | Returns the lower limit of @range |
| get_upper_limit | `Range.get_upper_limit() -> gdouble` | atk_range_get_upper_limit | 2.12 | Returns the upper limit of @range |

### Atk.Rectangle

GType: `AtkRectangle` ?? C type: `AtkRectangle`

A data structure for holding a rectangle. Those coordinates are relative to the component top-level parent.

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| width | gint |
| x | gint |
| y | gint |

### Atk.RegistryClass

C type: `AtkRegistryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent_class | GObject.ObjectClass |

### Atk.RelationClass

C type: `AtkRelationClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.ObjectClass |

### Atk.RelationSetClass

C type: `AtkRelationSetClass`

#### Fields

| Field | Type |
| --- | --- |
| pad1 | Function |
| pad2 | Function |
| parent | GObject.ObjectClass |

### Atk.SelectionIface

C type: `AtkSelectionIface`

TRUE if success, FALSE otherwise.

#### Fields

| Field | Type |
| --- | --- |
| add_selection | gboolean |
| clear_selection | gboolean |
| get_selection_count | gint |
| is_child_selected | gboolean |
| parent | GObject.TypeInterface |
| ref_selection | Object |
| remove_selection | gboolean |
| select_all_selection | gboolean |
| selection_changed | none |

### Atk.SocketClass

C type: `AtkSocketClass`

an #AtkSocket

#### Fields

| Field | Type |
| --- | --- |
| embed | none |
| parent_class | ObjectClass |

### Atk.StateSetClass

C type: `AtkStateSetClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.ObjectClass |

### Atk.StreamableContentIface

C type: `AtkStreamableContentIface`

a gint which is the number of mime types supported by the object.

#### Fields

| Field | Type |
| --- | --- |
| get_mime_type | utf8 |
| get_n_mime_types | gint |
| get_stream | GLib.IOChannel |
| get_uri | utf8 |
| pad1 | Function |
| pad2 | Function |
| pad3 | Function |
| parent | GObject.TypeInterface |

### Atk.TableCellIface

C type: `AtkTableCellIface`

AtkTableCell is an interface for cells inside an #AtkTable.

#### Fields

| Field | Type |
| --- | --- |
| get_column_header_cells | Object |
| get_column_span | gint |
| get_position | gboolean |
| get_row_column_span | gboolean |
| get_row_header_cells | Object |
| get_row_span | gint |
| get_table | Object |
| parent | GObject.TypeInterface |

### Atk.TableIface

C type: `AtkTableIface`

an #AtkObject representing the referred to accessible

#### Fields

| Field | Type |
| --- | --- |
| add_column_selection | gboolean |
| add_row_selection | gboolean |
| column_deleted | none |
| column_inserted | none |
| column_reordered | none |
| get_caption | Object |
| get_column_at_index | gint |
| get_column_description | utf8 |
| get_column_extent_at | gint |
| get_column_header | Object |
| get_index_at | gint |
| get_n_columns | gint |
| get_n_rows | gint |
| get_row_at_index | gint |
| get_row_description | utf8 |
| get_row_extent_at | gint |
| get_row_header | Object |
| get_selected_columns | gint |
| get_selected_rows | gint |
| get_summary | Object |
| is_column_selected | gboolean |
| is_row_selected | gboolean |
| is_selected | gboolean |
| model_changed | none |
| parent | GObject.TypeInterface |
| ref_at | Object |
| remove_column_selection | gboolean |
| remove_row_selection | gboolean |
| row_deleted | none |
| row_inserted | none |
| row_reordered | none |
| set_caption | none |
| set_column_description | none |
| set_column_header | none |
| set_row_description | none |
| set_row_header | none |
| set_summary | none |

### Atk.TextIface

C type: `AtkTextIface`

a newly allocated string containing the text from @start_offset up to, but not including @end_offset. Use g_free() to free the returned string.

#### Fields

| Field | Type |
| --- | --- |
| add_selection | gboolean |
| get_bounded_ranges | TextRange |
| get_caret_offset | gint |
| get_character_at_offset | gunichar |
| get_character_count | gint |
| get_character_extents | none |
| get_default_attributes | AttributeSet |
| get_n_selections | gint |
| get_offset_at_point | gint |
| get_range_extents | none |
| get_run_attributes | AttributeSet |
| get_selection | utf8 |
| get_string_at_offset | utf8 |
| get_text | utf8 |
| get_text_after_offset | utf8 |
| get_text_at_offset | utf8 |
| get_text_before_offset | utf8 |
| parent | GObject.TypeInterface |
| remove_selection | gboolean |
| scroll_substring_to | gboolean |
| scroll_substring_to_point | gboolean |
| set_caret_offset | gboolean |
| set_selection | gboolean |
| text_attributes_changed | none |
| text_caret_moved | none |
| text_changed | none |
| text_selection_changed | none |

### Atk.TextRange

GType: `AtkTextRange` ?? C type: `AtkTextRange`

A structure used to describe a text range.

#### Fields

| Field | Type |
| --- | --- |
| bounds | TextRectangle |
| content | utf8 |
| end_offset | gint |
| start_offset | gint |

### Atk.TextRectangle

C type: `AtkTextRectangle`

A structure used to store a rectangle used by AtkText.

#### Fields

| Field | Type |
| --- | --- |
| height | gint |
| width | gint |
| x | gint |
| y | gint |

### Atk.TextSelection

C type: `AtkTextSelection`

This structure represents a single text selection within a document. This selection is defined by two points in the content, where each one is defi...

#### Fields

| Field | Type |
| --- | --- |
| end_object | Object |
| end_offset | gint |
| start_is_active | gboolean |
| start_object | Object |
| start_offset | gint |

### Atk.UtilClass

C type: `AtkUtilClass`

adds the specified function to the list of functions to be called when an ATK event occurs. ATK implementors are discouraged from reimplementing th...

#### Fields

| Field | Type |
| --- | --- |
| add_global_event_listener | guint |
| add_key_event_listener | guint |
| get_root | Object |
| get_toolkit_name | utf8 |
| get_toolkit_version | utf8 |
| parent | GObject.ObjectClass |
| remove_global_event_listener | none |
| remove_key_event_listener | none |

### Atk.ValueIface

C type: `AtkValueIface`

This virtual function is deprecated since 2.12 and it should not be overriden.

#### Fields

| Field | Type |
| --- | --- |
| get_current_value | none |
| get_increment | gdouble |
| get_maximum_value | none |
| get_minimum_increment | none |
| get_minimum_value | none |
| get_range | Range |
| get_sub_ranges | GLib.SList |
| get_value_and_text | none |
| parent | GObject.TypeInterface |
| set_current_value | gboolean |
| set_value | none |

### Atk.WindowIface

C type: `AtkWindowIface`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.TypeInterface |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_focus_tracker | `add_focus_tracker(focus_tracker: EventListener) -> guint` | atk_add_focus_tracker |  | Adds the specified function to the list of functions to be called when an object receives focus. |
| add_global_event_listener | `add_global_event_listener(listener: GObject.SignalEmissionHook, event_type: utf8) -> guint` | atk_add_global_event_listener |  | Adds the specified function to the list of functions to be called when an ATK event of type event_type occurs. The format of event_type is the foll... |
| add_key_event_listener | `add_key_event_listener(listener: KeySnoopFunc, data: gpointer?) -> guint` | atk_add_key_event_listener |  | Adds the specified function to the list of functions to be called when a key event occurs. The @data element will be passed to the #AtkKeySnoopFunc... |
| attribute_set_free | `attribute_set_free(attrib_set: AttributeSet) -> none` | atk_attribute_set_free |  | Frees the memory used by an #AtkAttributeSet, including all its #AtkAttributes. |
| focus_tracker_init | `focus_tracker_init(init: EventListenerInit) -> none` | atk_focus_tracker_init |  | Specifies the function to be called for focus tracker initialization. This function should be called by an implementation of the ATK interface if a... |
| focus_tracker_notify | `focus_tracker_notify(object: Object) -> none` | atk_focus_tracker_notify |  | Cause the focus tracker functions which have been specified to be executed for the object. |
| get_binary_age | `get_binary_age() -> guint` | atk_get_binary_age | 2.8 | Returns the binary age as passed to libtool when building the ATK library the process is running against. |
| get_default_registry | `get_default_registry() -> Registry` | atk_get_default_registry |  | Gets a default implementation of the #AtkObjectFactory/type registry. Note: For most toolkit maintainers, this will be the correct registry for reg... |
| get_focus_object | `get_focus_object() -> Object` | atk_get_focus_object | 1.6 | Gets the currently focused object. |
| get_interface_age | `get_interface_age() -> guint` | atk_get_interface_age | 2.8 | Returns the interface age as passed to libtool when building the ATK library the process is running against. |
| get_major_version | `get_major_version() -> guint` | atk_get_major_version | 2.8 | Returns the major version number of the ATK library. (e.g. in ATK version 2.7.4 this is 2.) This function is in the library, so it represents the A... |
| get_micro_version | `get_micro_version() -> guint` | atk_get_micro_version | 2.8 | Returns the micro version number of the ATK library. (e.g. in ATK version 2.7.4 this is 4.) This function is in the library, so it represents the A... |
| get_minor_version | `get_minor_version() -> guint` | atk_get_minor_version | 2.8 | Returns the minor version number of the ATK library. (e.g. in ATK version 2.7.4 this is 7.) This function is in the library, so it represents the A... |
| get_root | `get_root() -> Object` | atk_get_root |  | Gets the root accessible container for the current application. |
| get_toolkit_name | `get_toolkit_name() -> utf8` | atk_get_toolkit_name |  | Gets name string for the GUI toolkit implementing ATK for this application. |
| get_toolkit_version | `get_toolkit_version() -> utf8` | atk_get_toolkit_version |  | Gets version string for the GUI toolkit implementing ATK for this application. |
| get_version | `get_version() -> utf8` | atk_get_version | 1.20 | Gets the current version for ATK. |
| relation_type_for_name | `relation_type_for_name(name: utf8) -> RelationType` | atk_relation_type_for_name |  | Get the #AtkRelationType type corresponding to a relation name. |
| relation_type_get_name | `relation_type_get_name(type: RelationType) -> utf8` | atk_relation_type_get_name |  | Gets the description string describing the #AtkRelationType @type. |
| relation_type_register | `relation_type_register(name: utf8) -> RelationType` | atk_relation_type_register |  | Associate @name with a new #AtkRelationType |
| remove_focus_tracker | `remove_focus_tracker(tracker_id: guint) -> none` | atk_remove_focus_tracker |  | Removes the specified focus tracker from the list of functions to be called when any object receives focus. |
| remove_global_event_listener | `remove_global_event_listener(listener_id: guint) -> none` | atk_remove_global_event_listener |  | @listener_id is the value returned by #atk_add_global_event_listener when you registered that event listener. Toolkit implementor note: ATK provide... |
| remove_key_event_listener | `remove_key_event_listener(listener_id: guint) -> none` | atk_remove_key_event_listener |  | @listener_id is the value returned by #atk_add_key_event_listener when you registered that event listener. Removes the specified event listener. |
| role_for_name | `role_for_name(name: utf8) -> Role` | atk_role_for_name |  | Get the #AtkRole type corresponding to a rolew name. |
| role_get_localized_name | `role_get_localized_name(role: Role) -> utf8` | atk_role_get_localized_name |  | Gets the localized description string describing the #AtkRole @role. |
| role_get_name | `role_get_name(role: Role) -> utf8` | atk_role_get_name |  | Gets the description string describing the #AtkRole @role. |
| role_register | `role_register(name: utf8) -> Role` | atk_role_register |  | Registers the role specified by @name. @name must be a meaningful name. So it should not be empty, or consisting on whitespaces. |
| state_type_for_name | `state_type_for_name(name: utf8) -> StateType` | atk_state_type_for_name |  | Gets the #AtkStateType corresponding to the description string @name. |
| state_type_get_name | `state_type_get_name(type: StateType) -> utf8` | atk_state_type_get_name |  | Gets the description string describing the #AtkStateType @type. |
| state_type_register | `state_type_register(name: utf8) -> StateType` | atk_state_type_register |  | Register a new object state. |
| text_attribute_for_name | `text_attribute_for_name(name: utf8) -> TextAttribute` | atk_text_attribute_for_name |  | Get the #AtkTextAttribute type corresponding to a text attribute name. |
| text_attribute_get_name | `text_attribute_get_name(attr: TextAttribute) -> utf8` | atk_text_attribute_get_name |  | Gets the name corresponding to the #AtkTextAttribute |
| text_attribute_get_value | `text_attribute_get_value(attr: TextAttribute, index_: gint) -> utf8` | atk_text_attribute_get_value |  | Gets the value for the index of the #AtkTextAttribute |
| text_attribute_register | `text_attribute_register(name: utf8) -> TextAttribute` | atk_text_attribute_register |  | Associate @name with a new #AtkTextAttribute |
| text_free_ranges | `text_free_ranges(ranges: TextRange) -> none` | atk_text_free_ranges | 1.3 | Frees the memory associated with an array of AtkTextRange. It is assumed that the array was returned by the function atk_text_get_bounded_ranges an... |
| value_type_get_localized_name | `value_type_get_localized_name(value_type: ValueType) -> utf8` | atk_value_type_get_localized_name |  | Gets the localized description string describing the #AtkValueType @value_type. |
| value_type_get_name | `value_type_get_name(value_type: ValueType) -> utf8` | atk_value_type_get_name |  | Gets the description string describing the #AtkValueType @value_type. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| EventListener | `EventListener(obj: Object) -> none` |  |  | A function which is called when an object emits a matching event, as used in #atk_add_focus_tracker. Currently the only events for which object-spe... |
| EventListenerInit | `EventListenerInit() -> none` |  |  | An #AtkEventListenerInit function is a special function that is called in order to initialize the per-object event registration system used by #Atk... |
| FocusHandler | `FocusHandler(object: Object, focus_in: gboolean) -> none` |  |  | The type of callback function used for atk_component_add_focus_handler() and atk_component_remove_focus_handler() |
| Function | `Function(user_data: gpointer?) -> gboolean` |  |  | An AtkFunction is a function definition used for padding which has been added to class and interface structures to allow for expansion in the future. |
| KeySnoopFunc | `KeySnoopFunc(event: KeyEventStruct, user_data: gpointer?) -> gint` |  |  | An #AtkKeySnoopFunc is a type of callback which is called whenever a key event occurs, if registered via atk_add_key_event_listener. It allows for ... |
| PropertyChangeHandler | `PropertyChangeHandler(obj: Object, vals: PropertyValues) -> none` |  |  | An AtkPropertyChangeHandler is a function which is executed when an AtkObject's property changes value. It is specified in a call to atk_object_con... |

## Constants

| Name | Type |
| --- | --- |
| BINARY_AGE | gint |
| INTERFACE_AGE | gint |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| VERSION_MIN_REQUIRED | gint |

## Aliases

| Name | Type |
| --- | --- |
| AttributeSet | GLib.SList |
| State | guint64 |

