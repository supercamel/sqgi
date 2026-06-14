# GObject 2.0

SQGI import: `import("GObject", "2.0")`

Packages: `gobject-2.0`
Includes: `GLib-2.0`
Libraries: `libgobject-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 30 |
| Interfaces | 1 |
| Records | 29 |
| Unions | 3 |
| Enums | 0 |
| Flags | 9 |
| Functions | 185 |
| Callbacks | 34 |
| Constants | 16 |
| Aliases | 3 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Binding | Object | 0 | 0 | 8 | `GObject` instance (or source) and another property on another `GObject` instance (or target). Whenever the source property changes, the same value... |
| BindingGroup | Object | 0 | 0 | 6 | `GBindingGroup` can be used to bind multiple properties from an object collectively. Use the various methods to bind properties from a single sourc... |
| InitiallyUnowned | Object | 0 | 0 | 0 | A type for objects that have an initially floating reference. All the fields in the `GInitiallyUnowned` structure are private to the implementation... |
| Object |  | 5 | 1 | 51 | The base object type. `GObject` is the fundamental type providing the common attributes and methods for all object types in GTK, Pango and other li... |
| ParamSpec |  | 23 | 0 | 16 | `GParamSpec` encapsulates the metadata required to specify parameters, such as `GObject` properties. ## Parameter names A property name consists of... |
| ParamSpecBoolean | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for boolean properties. |
| ParamSpecBoxed | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for boxed properties. |
| ParamSpecChar | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for character properties. |
| ParamSpecDouble | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for double properties. |
| ParamSpecEnum | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for enum properties. |
| ParamSpecFlags | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for flags properties. |
| ParamSpecFloat | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for float properties. |
| ParamSpecGType | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for #GType properties. |
| ParamSpecInt | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for integer properties. |
| ParamSpecInt64 | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for 64bit integer properties. |
| ParamSpecLong | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for long integer properties. |
| ParamSpecObject | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for object properties. |
| ParamSpecOverride | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that redirects operations to other types of #GParamSpec. All operations other than getting or setting the value are... |
| ParamSpecParam | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for %G_TYPE_PARAM properties. |
| ParamSpecPointer | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for pointer properties. |
| ParamSpecString | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for string properties. |
| ParamSpecUChar | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for unsigned character properties. |
| ParamSpecUInt | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for unsigned integer properties. |
| ParamSpecUInt64 | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties. |
| ParamSpecULong | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for unsigned long integer properties. |
| ParamSpecUnichar | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for unichar (unsigned integer) properties. |
| ParamSpecValueArray | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for #GValueArray properties. |
| ParamSpecVariant | ParamSpec | 0 | 0 | 0 | A #GParamSpec derived structure that contains the meta data for #GVariant properties. When comparing values with g_param_values_cmp(), scalar value... |
| SignalGroup | Object | 0 | 2 | 11 | `GSignalGroup` manages a collection of signals on a `GObject`. `GSignalGroup` simplifies the process of connecting many signals to a `GObject` as a... |
| TypeModule | Object | 0 | 0 | 7 | `GTypeModule` provides a simple implementation of the `GTypePlugin` interface. The model of `GTypeModule` is a dynamically loaded module which impl... |

### GObject.Binding

Parent: `Object` ?? GType: `GBinding` ?? C type: `GBinding`

`GObject` instance (or source) and another property on another `GObject` instance (or target). Whenever the source property changes, the same value...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dup_source | `Binding.dup_source() -> Object` | g_binding_dup_source | 2.68 | Retrieves the #GObject instance used as the source of the binding. A #GBinding can outlive the source #GObject as the binding does not hold a stron... |
| dup_target | `Binding.dup_target() -> Object` | g_binding_dup_target | 2.68 | Retrieves the #GObject instance used as the target of the binding. A #GBinding can outlive the target #GObject as the binding does not hold a stron... |
| get_flags | `Binding.get_flags() -> BindingFlags` | g_binding_get_flags | 2.26 | Retrieves the flags passed when constructing the #GBinding. |
| get_source | `Binding.get_source() -> Object` | g_binding_get_source | 2.26 | Retrieves the #GObject instance used as the source of the binding. A #GBinding can outlive the source #GObject as the binding does not hold a stron... |
| get_source_property | `Binding.get_source_property() -> utf8` | g_binding_get_source_property | 2.26 | Retrieves the name of the property of #GBinding:source used as the source of the binding. |
| get_target | `Binding.get_target() -> Object` | g_binding_get_target | 2.26 | Retrieves the #GObject instance used as the target of the binding. A #GBinding can outlive the target #GObject as the binding does not hold a stron... |
| get_target_property | `Binding.get_target_property() -> utf8` | g_binding_get_target_property | 2.26 | Retrieves the name of the property of #GBinding:target used as the target of the binding. |
| unbind | `Binding.unbind() -> none` | g_binding_unbind | 2.38 | Explicitly releases the binding between the source and the target property expressed by @binding. This function will release the reference that is ... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| flags | BindingFlags | read, write, construct-only | Flags to be used to control the #GBinding |
| source | Object | read, write, construct-only | The #GObject that should be used as the source of the binding |
| source-property | utf8 | read, write, construct-only | The name of the property of #GBinding:source that should be used as the source of the binding. This should be in [canonical form][canonical-paramet... |
| target | Object | read, write, construct-only | The #GObject that should be used as the target of the binding |
| target-property | utf8 | read, write, construct-only | The name of the property of #GBinding:target that should be used as the target of the binding. This should be in [canonical form][canonical-paramet... |

### GObject.BindingGroup

Parent: `Object` ?? GType: `GBindingGroup` ?? C type: `GBindingGroup`

`GBindingGroup` can be used to bind multiple properties from an object collectively. Use the various methods to bind properties from a single sourc...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `BindingGroup.new() -> BindingGroup` | g_binding_group_new | 2.72 | Creates a new #GBindingGroup. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| bind | `BindingGroup.bind(source_property: utf8, target: Object, target_property: utf8, flags: BindingFlags) -> none` | g_binding_group_bind | 2.72 | Creates a binding between @source_property on the source object and @target_property on @target. Whenever the @source_property is changed the @targ... |
| bind_full | `BindingGroup.bind_full(source_property: utf8, target: Object, target_property: utf8, flags: BindingFlags, transform_to: BindingTransformFunc?, transform_from: BindingTransformFunc?, user_data: gpointer?, user_data_destroy: GLib.DestroyNotify) -> none` | g_binding_group_bind_full | 2.72 | Creates a binding between @source_property on the source object and @target_property on @target, allowing you to set the transformation functions t... |
| bind_with_closures | `BindingGroup.bind_with_closures(source_property: utf8, target: Object, target_property: utf8, flags: BindingFlags, transform_to: Closure?, transform_from: Closure?) -> none` | g_binding_group_bind_with_closures | 2.72 | Creates a binding between @source_property on the source object and @target_property on @target, allowing you to set the transformation functions t... |
| dup_source | `BindingGroup.dup_source() -> Object` | g_binding_group_dup_source | 2.72 | Gets the source object used for binding properties. |
| set_source | `BindingGroup.set_source(source: Object?) -> none` | g_binding_group_set_source | 2.72 | Sets @source as the source object used for creating property bindings. If there is already a source object all bindings from it will be removed. No... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| source | Object | read, write | The source object used for binding properties. |

### GObject.InitiallyUnowned

Parent: `Object` ?? GType: `GInitiallyUnowned` ?? C type: `GInitiallyUnowned`

A type for objects that have an initially floating reference. All the fields in the `GInitiallyUnowned` structure are private to the implementation...

#### Fields

| Field | Type |
| --- | --- |
| g_type_instance | TypeInstance |
| qdata | GLib.Data |
| ref_count | guint |

### GObject.Object

Subclasses: `Binding`, `BindingGroup`, `InitiallyUnowned`, `SignalGroup`, `TypeModule` ?? GType: `GObject` ?? C type: `GObject`

The base object type. `GObject` is the fundamental type providing the common attributes and methods for all object types in GTK, Pango and other li...

#### Fields

| Field | Type |
| --- | --- |
| g_type_instance | TypeInstance |
| qdata | GLib.Data |
| ref_count | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Object.new(object_type: GType, first_property_name: utf8, ...: void) -> Object` | g_object_new |  | Creates a new instance of a #GObject subtype and sets its properties. Construction parameters (see %G_PARAM_CONSTRUCT, %G_PARAM_CONSTRUCT_ONLY) whi... |
| new_valist | `Object.new_valist(object_type: GType, first_property_name: utf8, var_args: va_list) -> Object` | g_object_new_valist |  | Creates a new instance of a #GObject subtype and sets its properties. Construction parameters (see %G_PARAM_CONSTRUCT, %G_PARAM_CONSTRUCT_ONLY) whi... |
| new_with_properties | `Object.new_with_properties(object_type: GType, n_properties: guint, names: utf8, values: Value) -> Object` | g_object_new_with_properties | 2.54 | Creates a new instance of a #GObject subtype and sets its properties using the provided arrays. Both arrays must have exactly @n_properties element... |
| newv | `Object.newv(object_type: GType, n_parameters: guint, parameters: Parameter) -> Object` | g_object_newv |  | Creates a new instance of a #GObject subtype and sets its properties. Construction parameters (see %G_PARAM_CONSTRUCT, %G_PARAM_CONSTRUCT_ONLY) whi... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| compat_control | `compat_control(what: gsize, data: gpointer?) -> gsize` | g_object_compat_control |  |  |
| interface_find_property | `interface_find_property(g_iface: TypeInterface, property_name: utf8) -> ParamSpec` | g_object_interface_find_property | 2.4 | Find the #GParamSpec with the given name for an interface. Generally, the interface vtable passed in as @g_iface will be the default vtable from g_... |
| interface_install_property | `interface_install_property(g_iface: TypeInterface, pspec: ParamSpec) -> none` | g_object_interface_install_property | 2.4 | Add a property to an interface; this is only useful for interfaces that are added to GObject-derived types. Adding a property to an interface force... |
| interface_list_properties | `interface_list_properties(g_iface: TypeInterface, n_properties_p: out guint) -> ParamSpec` | g_object_interface_list_properties | 2.4 | Lists the properties of an interface.Generally, the interface vtable passed in as @g_iface will be the default vtable from g_type_default_interface... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_toggle_ref | `Object.add_toggle_ref(notify: ToggleNotify, data: gpointer?) -> none` | g_object_add_toggle_ref | 2.8 | Increases the reference count of the object by one and sets a callback to be called when all other references to the object are dropped, or when th... |
| add_weak_pointer | `Object.add_weak_pointer(weak_pointer_location: inout gpointer) -> none` | g_object_add_weak_pointer |  | Adds a weak reference from weak_pointer to @object to indicate that the pointer located at @weak_pointer_location is only valid during the lifetime... |
| bind_property | `Object.bind_property(source_property: utf8, target: Object, target_property: utf8, flags: BindingFlags) -> Binding` | g_object_bind_property | 2.26 | Creates a binding between @source_property on @source and @target_property on @target. Whenever the @source_property is changed the @target_propert... |
| bind_property_full | `Object.bind_property_full(source_property: utf8, target: Object, target_property: utf8, flags: BindingFlags, transform_to: BindingTransformFunc?, transform_from: BindingTransformFunc?, user_data: gpointer?, notify: GLib.DestroyNotify?) -> Binding` | g_object_bind_property_full | 2.26 | Complete version of g_object_bind_property(). Creates a binding between @source_property on @source and @target_property on @target, allowing you t... |
| bind_property_with_closures | `Object.bind_property_with_closures(source_property: utf8, target: Object, target_property: utf8, flags: BindingFlags, transform_to: Closure, transform_from: Closure) -> Binding` | g_object_bind_property_with_closures | 2.26 | Creates a binding between @source_property on @source and @target_property on @target, allowing you to set the transformation functions to be used ... |
| connect | `Object.connect(signal_spec: utf8, ...: void) -> Object` | g_object_connect |  | A convenience function to connect multiple signals at once. The signal specs expected by this function have the form "modifier::signal_name", where... |
| disconnect | `Object.disconnect(signal_spec: utf8, ...: void) -> none` | g_object_disconnect |  | A convenience function to disconnect multiple signals at once. The signal specs expected by this function have the form "any_signal", which means t... |
| dup_data | `Object.dup_data(key: utf8, dup_func: GLib.DuplicateFunc?, user_data: gpointer?) -> gpointer` | g_object_dup_data | 2.34 | This is a variant of g_object_get_data() which returns a 'duplicate' of the value. @dup_func defines the meaning of 'duplicate' in this context, it... |
| dup_qdata | `Object.dup_qdata(quark: GLib.Quark, dup_func: GLib.DuplicateFunc?, user_data: gpointer?) -> gpointer` | g_object_dup_qdata | 2.34 | This is a variant of g_object_get_qdata() which returns a 'duplicate' of the value. @dup_func defines the meaning of 'duplicate' in this context, i... |
| force_floating | `Object.force_floating() -> none` | g_object_force_floating | 2.10 | This function is intended for #GObject implementations to re-enforce a [floating][floating-ref] object reference. Doing this is seldom required: al... |
| freeze_notify | `Object.freeze_notify() -> none` | g_object_freeze_notify |  | Increases the freeze count on @object. If the freeze count is non-zero, the emission of "notify" signals on @object is stopped. The signals are que... |
| get | `Object.get(first_property_name: utf8, ...: void) -> none` | g_object_get |  | Gets properties of an object. In general, a copy is made of the property contents and the caller is responsible for freeing the memory in the appro... |
| get_data | `Object.get_data(key: utf8) -> gpointer` | g_object_get_data |  | Gets a named field from the objects table of associations (see g_object_set_data()). |
| get_property | `Object.get_property(property_name: utf8, value: Value) -> none` | g_object_get_property |  | Gets a property of an object. The @value can be: - an empty #GValue initialized by %G_VALUE_INIT, which will be automatically initialized with the ... |
| get_qdata | `Object.get_qdata(quark: GLib.Quark) -> gpointer` | g_object_get_qdata |  | This function gets back user data pointers stored via g_object_set_qdata(). |
| get_valist | `Object.get_valist(first_property_name: utf8, var_args: va_list) -> none` | g_object_get_valist |  | Gets properties of an object. In general, a copy is made of the property contents and the caller is responsible for freeing the memory in the appro... |
| getv | `Object.getv(n_properties: guint, names: utf8, values: Value) -> none` | g_object_getv | 2.54 | Gets @n_properties properties for an @object. Obtained properties will be set to @values. All properties must be valid. Warnings will be emitted an... |
| is_floating | `Object.is_floating() -> gboolean` | g_object_is_floating | 2.10 | Checks whether @object has a [floating][floating-ref] reference. |
| notify | `Object.notify(property_name: utf8) -> none` | g_object_notify |  | Emits a "notify" signal for the property @property_name on @object. When possible, eg. when signaling a property change from within the class that ... |
| notify_by_pspec | `Object.notify_by_pspec(pspec: ParamSpec) -> none` | g_object_notify_by_pspec | 2.26 | Emits a "notify" signal for the property specified by @pspec on @object. This function omits the property name lookup, hence it is faster than g_ob... |
| ref | `Object.ref() -> Object` | g_object_ref |  | Increases the reference count of @object. Since GLib 2.56, if `GLIB_VERSION_MAX_ALLOWED` is 2.56 or greater, the type of @object will be propagated... |
| ref_sink | `Object.ref_sink() -> Object` | g_object_ref_sink | 2.10 | Increase the reference count of @object, and possibly remove the [floating][floating-ref] reference, if @object has a floating reference. In other ... |
| remove_toggle_ref | `Object.remove_toggle_ref(notify: ToggleNotify, data: gpointer?) -> none` | g_object_remove_toggle_ref | 2.8 | Removes a reference added with g_object_add_toggle_ref(). The reference count of the object is decreased by one. Note that if you unref the object ... |
| remove_weak_pointer | `Object.remove_weak_pointer(weak_pointer_location: inout gpointer) -> none` | g_object_remove_weak_pointer |  | Removes a weak reference from @object that was previously added using g_object_add_weak_pointer(). The @weak_pointer_location has to match the one ... |
| replace_data | `Object.replace_data(key: utf8, oldval: gpointer?, newval: gpointer?, destroy: GLib.DestroyNotify?, old_destroy: out GLib.DestroyNotify?) -> gboolean` | g_object_replace_data | 2.34 | Compares the user data for the key @key on @object with @oldval, and if they are the same, replaces @oldval with @newval. This is like a typical at... |
| replace_qdata | `Object.replace_qdata(quark: GLib.Quark, oldval: gpointer?, newval: gpointer?, destroy: GLib.DestroyNotify?, old_destroy: out GLib.DestroyNotify?) -> gboolean` | g_object_replace_qdata | 2.34 | Compares the user data for the key @quark on @object with @oldval, and if they are the same, replaces @oldval with @newval. This is like a typical ... |
| run_dispose | `Object.run_dispose() -> none` | g_object_run_dispose |  | Releases all references to other objects. This can be used to break reference cycles. This function should only be called from object system implem... |
| set | `Object.set(first_property_name: utf8, ...: void) -> none` | g_object_set |  | Sets properties on an object. The same caveats about passing integer literals as varargs apply as with g_object_new(). In particular, any integer l... |
| set_data | `Object.set_data(key: utf8, data: gpointer?) -> none` | g_object_set_data |  | Each object carries around a table of associations from strings to pointers. This function lets you set an association. If the object already had a... |
| set_data_full | `Object.set_data_full(key: utf8, data: gpointer?, destroy: GLib.DestroyNotify?) -> none` | g_object_set_data_full |  | Like g_object_set_data() except it adds notification for when the association is destroyed, either by setting it to a different value or when the o... |
| set_property | `Object.set_property(property_name: utf8, value: Value) -> none` | g_object_set_property |  | Sets a property on an object. |
| set_qdata | `Object.set_qdata(quark: GLib.Quark, data: gpointer?) -> none` | g_object_set_qdata |  | This sets an opaque, named pointer on an object. The name is specified through a #GQuark (retrieved e.g. via g_quark_from_static_string()), and the... |
| set_qdata_full | `Object.set_qdata_full(quark: GLib.Quark, data: gpointer?, destroy: GLib.DestroyNotify?) -> none` | g_object_set_qdata_full |  | This function works like g_object_set_qdata(), but in addition, a void (*destroy) (gpointer) function may be specified which is called with @data a... |
| set_valist | `Object.set_valist(first_property_name: utf8, var_args: va_list) -> none` | g_object_set_valist |  | Sets properties on an object. |
| setv | `Object.setv(n_properties: guint, names: utf8, values: Value) -> none` | g_object_setv | 2.54 | Sets @n_properties properties for an @object. Properties to be set will be taken from @values. All properties must be valid. Warnings will be emitt... |
| steal_data | `Object.steal_data(key: utf8) -> gpointer` | g_object_steal_data |  | Remove a specified datum from the object's data associations, without invoking the association's destroy handler. |
| steal_qdata | `Object.steal_qdata(quark: GLib.Quark) -> gpointer` | g_object_steal_qdata |  | This function gets back user data pointers stored via g_object_set_qdata() and removes the @data from object without invoking its destroy() functio... |
| take_ref | `Object.take_ref() -> Object` | g_object_take_ref | 2.70 | If @object is floating, sink it. Otherwise, do nothing. In other words, this function will convert a floating reference (if present) into a full re... |
| thaw_notify | `Object.thaw_notify() -> none` | g_object_thaw_notify |  | Reverts the effect of a previous call to g_object_freeze_notify(). The freeze count is decreased on @object and when it reaches zero, queued "notif... |
| unref | `Object.unref() -> none` | g_object_unref |  | Decreases the reference count of @object. When its reference count drops to 0, the object is finalized (i.e. its memory is freed). If the pointer t... |
| watch_closure | `Object.watch_closure(closure: Closure) -> none` | g_object_watch_closure |  | This function essentially limits the life time of the @closure to the life time of the object. That is, when the object is finalized, the @closure ... |
| weak_ref | `Object.weak_ref(notify: WeakNotify, data: gpointer?) -> none` | g_object_weak_ref |  | Adds a weak reference callback to an object. Weak references are used for notification when an object is disposed. They are called "weak references... |
| weak_unref | `Object.weak_unref(notify: WeakNotify, data: gpointer?) -> none` | g_object_weak_unref |  | Removes a weak reference callback to an object. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| notify | `pspec: ParamSpec` | none | first detailed |  | The notify signal is emitted on an object when one of its properties has its value set through g_object_set_property(), g_object_set(), et al. Note... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| constructed | `constructed() -> none` |  |  | the @constructed function is called by g_object_new() as the final step of the object creation process. At the point of the call, all construction ... |
| dispatch_properties_changed | `dispatch_properties_changed(n_pspecs: guint, pspecs: ParamSpec) -> none` |  |  | emits property change notification for a bunch of properties. Overriding @dispatch_properties_changed should be rarely needed. |
| dispose | `dispose() -> none` |  |  | the @dispose function is supposed to drop all references to other objects, but keep the instance otherwise intact, so that client method invocation... |
| finalize | `finalize() -> none` |  |  | instance finalization function, should finish the finalization of the instance begun in @dispose and chain up to the @finalize method of the parent... |
| get_property | `get_property(property_id: guint, value: Value, pspec: ParamSpec) -> none` |  |  | the generic getter for all properties of this type. Should be overridden for every type with properties. |
| notify | `notify(pspec: ParamSpec) -> none` |  |  | Emits a "notify" signal for the property @property_name on @object. When possible, eg. when signaling a property change from within the class that ... |
| set_property | `set_property(property_id: guint, value: Value, pspec: ParamSpec) -> none` |  |  | the generic setter for all properties of this type. Should be overridden for every type with properties. If implementations of @set_property don't ... |

### GObject.ParamSpec

Subclasses: `ParamSpecBoolean`, `ParamSpecBoxed`, `ParamSpecChar`, `ParamSpecDouble`, `ParamSpecEnum`, `ParamSpecFlags`, `ParamSpecFloat`, `ParamSpecGType`, `ParamSpecInt`, `ParamSpecInt64`, `ParamSpecLong`, `ParamSpecObject`, `ParamSpecOverride`, `ParamSpecParam`, `ParamSpecPointer`, `ParamSpecString`, `ParamSpecUChar`, `ParamSpecUInt`, `ParamSpecUInt64`, `ParamSpecULong`, `ParamSpecUnichar`, `ParamSpecValueArray`, `ParamSpecVariant` ?? GType: `GParam` ?? C type: `GParamSpec` ?? Abstract

`GParamSpec` encapsulates the metadata required to specify parameters, such as `GObject` properties. ## Parameter names A property name consists of...

#### Fields

| Field | Type |
| --- | --- |
| _blurb | utf8 |
| _nick | utf8 |
| flags | ParamFlags |
| g_type_instance | TypeInstance |
| name | utf8 |
| owner_type | GType |
| param_id | guint |
| qdata | GLib.Data |
| ref_count | guint |
| value_type | GType |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| internal | `internal(param_type: GType, name: utf8, nick: utf8?, blurb: utf8?, flags: ParamFlags) -> ParamSpec` | g_param_spec_internal |  | Creates a new #GParamSpec instance. See [canonical parameter names][canonical-parameter-names] for details of the rules for @name. Names which viol... |
| is_valid_name | `is_valid_name(name: utf8) -> gboolean` | g_param_spec_is_valid_name | 2.66 | Validate a property name for a #GParamSpec. This can be useful for dynamically-generated properties which need to be validated at run-time before a... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_blurb | `ParamSpec.get_blurb() -> utf8` | g_param_spec_get_blurb |  | Get the short description of a #GParamSpec. |
| get_default_value | `ParamSpec.get_default_value() -> Value` | g_param_spec_get_default_value | 2.38 | Gets the default value of @pspec as a pointer to a #GValue. The #GValue will remain valid for the life of @pspec. |
| get_name | `ParamSpec.get_name() -> utf8` | g_param_spec_get_name |  | Get the name of a #GParamSpec. The name is always an "interned" string (as per g_intern_string()). This allows for pointer-value comparisons. |
| get_name_quark | `ParamSpec.get_name_quark() -> GLib.Quark` | g_param_spec_get_name_quark | 2.46 | Gets the GQuark for the name. |
| get_nick | `ParamSpec.get_nick() -> utf8` | g_param_spec_get_nick |  | Get the nickname of a #GParamSpec. |
| get_qdata | `ParamSpec.get_qdata(quark: GLib.Quark) -> gpointer` | g_param_spec_get_qdata |  | Gets back user data pointers stored via g_param_spec_set_qdata(). |
| get_redirect_target | `ParamSpec.get_redirect_target() -> ParamSpec` | g_param_spec_get_redirect_target | 2.4 | If the paramspec redirects operations to another paramspec, returns that paramspec. Redirect is used typically for providing a new implementation o... |
| ref | `ParamSpec.ref() -> ParamSpec` | g_param_spec_ref |  | Increments the reference count of @pspec. |
| ref_sink | `ParamSpec.ref_sink() -> ParamSpec` | g_param_spec_ref_sink | 2.10 | Convenience function to ref and sink a #GParamSpec. |
| set_qdata | `ParamSpec.set_qdata(quark: GLib.Quark, data: gpointer?) -> none` | g_param_spec_set_qdata |  | Sets an opaque, named pointer on a #GParamSpec. The name is specified through a #GQuark (retrieved e.g. via g_quark_from_static_string()), and the ... |
| set_qdata_full | `ParamSpec.set_qdata_full(quark: GLib.Quark, data: gpointer?, destroy: GLib.DestroyNotify?) -> none` | g_param_spec_set_qdata_full |  | This function works like g_param_spec_set_qdata(), but in addition, a `void (*destroy) (gpointer)` function may be specified which is called with @... |
| sink | `ParamSpec.sink() -> none` | g_param_spec_sink |  | The initial reference count of a newly created #GParamSpec is 1, even though no one has explicitly called g_param_spec_ref() on it yet. So the init... |
| steal_qdata | `ParamSpec.steal_qdata(quark: GLib.Quark) -> gpointer` | g_param_spec_steal_qdata |  | Gets back user data pointers stored via g_param_spec_set_qdata() and removes the @data from @pspec without invoking its destroy() function (if any ... |
| unref | `ParamSpec.unref() -> none` | g_param_spec_unref |  | Decrements the reference count of a @pspec. |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| finalize | `finalize() -> none` |  |  | The instance finalization function (optional), should chain up to the finalize method of the parent class. |
| value_is_valid | `value_is_valid(value: Value) -> gboolean` |  |  | Checks if contents of @value comply with the specifications set out by this type, without modifying the value. This vfunc is optional. If it isn't ... |
| value_set_default | `value_set_default(value: Value) -> none` |  |  | Resets a @value to the default value for this type (recommended, the default is g_value_reset()), see g_param_value_set_default(). |
| value_validate | `value_validate(value: Value) -> gboolean` |  |  | Ensures that the contents of @value comply with the specifications set out by this type (optional), see g_param_value_validate(). |
| values_cmp | `values_cmp(value1: Value, value2: Value) -> gint` |  |  | Compares @value1 with @value2 according to this type (recommended, the default is memcmp()), see g_param_values_cmp(). |

### GObject.ParamSpecBoolean

Parent: `ParamSpec` ?? GType: `GParamBoolean` ?? C type: `GParamSpecBoolean`

A #GParamSpec derived structure that contains the meta data for boolean properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gboolean |
| parent_instance | ParamSpec |

### GObject.ParamSpecBoxed

Parent: `ParamSpec` ?? GType: `GParamBoxed` ?? C type: `GParamSpecBoxed`

A #GParamSpec derived structure that contains the meta data for boxed properties.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | ParamSpec |

### GObject.ParamSpecChar

Parent: `ParamSpec` ?? GType: `GParamChar` ?? C type: `GParamSpecChar`

A #GParamSpec derived structure that contains the meta data for character properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gint8 |
| maximum | gint8 |
| minimum | gint8 |
| parent_instance | ParamSpec |

### GObject.ParamSpecDouble

Parent: `ParamSpec` ?? GType: `GParamDouble` ?? C type: `GParamSpecDouble`

A #GParamSpec derived structure that contains the meta data for double properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gdouble |
| epsilon | gdouble |
| maximum | gdouble |
| minimum | gdouble |
| parent_instance | ParamSpec |

### GObject.ParamSpecEnum

Parent: `ParamSpec` ?? GType: `GParamEnum` ?? C type: `GParamSpecEnum`

A #GParamSpec derived structure that contains the meta data for enum properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gint |
| enum_class | EnumClass |
| parent_instance | ParamSpec |

### GObject.ParamSpecFlags

Parent: `ParamSpec` ?? GType: `GParamFlags` ?? C type: `GParamSpecFlags`

A #GParamSpec derived structure that contains the meta data for flags properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | guint |
| flags_class | FlagsClass |
| parent_instance | ParamSpec |

### GObject.ParamSpecFloat

Parent: `ParamSpec` ?? GType: `GParamFloat` ?? C type: `GParamSpecFloat`

A #GParamSpec derived structure that contains the meta data for float properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gfloat |
| epsilon | gfloat |
| maximum | gfloat |
| minimum | gfloat |
| parent_instance | ParamSpec |

### GObject.ParamSpecGType

Parent: `ParamSpec` ?? GType: `GParamGType` ?? C type: `GParamSpecGType`

A #GParamSpec derived structure that contains the meta data for #GType properties.

#### Fields

| Field | Type |
| --- | --- |
| is_a_type | GType |
| parent_instance | ParamSpec |

### GObject.ParamSpecInt

Parent: `ParamSpec` ?? GType: `GParamInt` ?? C type: `GParamSpecInt`

A #GParamSpec derived structure that contains the meta data for integer properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gint |
| maximum | gint |
| minimum | gint |
| parent_instance | ParamSpec |

### GObject.ParamSpecInt64

Parent: `ParamSpec` ?? GType: `GParamInt64` ?? C type: `GParamSpecInt64`

A #GParamSpec derived structure that contains the meta data for 64bit integer properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gint64 |
| maximum | gint64 |
| minimum | gint64 |
| parent_instance | ParamSpec |

### GObject.ParamSpecLong

Parent: `ParamSpec` ?? GType: `GParamLong` ?? C type: `GParamSpecLong`

A #GParamSpec derived structure that contains the meta data for long integer properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | glong |
| maximum | glong |
| minimum | glong |
| parent_instance | ParamSpec |

### GObject.ParamSpecObject

Parent: `ParamSpec` ?? GType: `GParamObject` ?? C type: `GParamSpecObject`

A #GParamSpec derived structure that contains the meta data for object properties.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | ParamSpec |

### GObject.ParamSpecOverride

Parent: `ParamSpec` ?? GType: `GParamOverride` ?? C type: `GParamSpecOverride`

A #GParamSpec derived structure that redirects operations to other types of #GParamSpec. All operations other than getting or setting the value are...

#### Fields

| Field | Type |
| --- | --- |
| overridden | ParamSpec |
| parent_instance | ParamSpec |

### GObject.ParamSpecParam

Parent: `ParamSpec` ?? GType: `GParamParam` ?? C type: `GParamSpecParam`

A #GParamSpec derived structure that contains the meta data for %G_TYPE_PARAM properties.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | ParamSpec |

### GObject.ParamSpecPointer

Parent: `ParamSpec` ?? GType: `GParamPointer` ?? C type: `GParamSpecPointer`

A #GParamSpec derived structure that contains the meta data for pointer properties.

#### Fields

| Field | Type |
| --- | --- |
| parent_instance | ParamSpec |

### GObject.ParamSpecString

Parent: `ParamSpec` ?? GType: `GParamString` ?? C type: `GParamSpecString`

A #GParamSpec derived structure that contains the meta data for string properties.

#### Fields

| Field | Type |
| --- | --- |
| cset_first | utf8 |
| cset_nth | utf8 |
| default_value | utf8 |
| ensure_non_null | guint |
| null_fold_if_empty | guint |
| parent_instance | ParamSpec |
| substitutor | gchar |

### GObject.ParamSpecUChar

Parent: `ParamSpec` ?? GType: `GParamUChar` ?? C type: `GParamSpecUChar`

A #GParamSpec derived structure that contains the meta data for unsigned character properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | guint8 |
| maximum | guint8 |
| minimum | guint8 |
| parent_instance | ParamSpec |

### GObject.ParamSpecUInt

Parent: `ParamSpec` ?? GType: `GParamUInt` ?? C type: `GParamSpecUInt`

A #GParamSpec derived structure that contains the meta data for unsigned integer properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | guint |
| maximum | guint |
| minimum | guint |
| parent_instance | ParamSpec |

### GObject.ParamSpecUInt64

Parent: `ParamSpec` ?? GType: `GParamUInt64` ?? C type: `GParamSpecUInt64`

A #GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | guint64 |
| maximum | guint64 |
| minimum | guint64 |
| parent_instance | ParamSpec |

### GObject.ParamSpecULong

Parent: `ParamSpec` ?? GType: `GParamULong` ?? C type: `GParamSpecULong`

A #GParamSpec derived structure that contains the meta data for unsigned long integer properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gulong |
| maximum | gulong |
| minimum | gulong |
| parent_instance | ParamSpec |

### GObject.ParamSpecUnichar

Parent: `ParamSpec` ?? GType: `GParamUnichar` ?? C type: `GParamSpecUnichar`

A #GParamSpec derived structure that contains the meta data for unichar (unsigned integer) properties.

#### Fields

| Field | Type |
| --- | --- |
| default_value | gunichar |
| parent_instance | ParamSpec |

### GObject.ParamSpecValueArray

Parent: `ParamSpec` ?? GType: `GParamValueArray` ?? C type: `GParamSpecValueArray`

A #GParamSpec derived structure that contains the meta data for #GValueArray properties.

#### Fields

| Field | Type |
| --- | --- |
| element_spec | ParamSpec |
| fixed_n_elements | guint |
| parent_instance | ParamSpec |

### GObject.ParamSpecVariant

Parent: `ParamSpec` ?? GType: `GParamVariant` ?? C type: `GParamSpecVariant`

A #GParamSpec derived structure that contains the meta data for #GVariant properties. When comparing values with g_param_values_cmp(), scalar value...

#### Fields

| Field | Type |
| --- | --- |
| default_value | GLib.Variant |
| padding | gpointer |
| parent_instance | ParamSpec |
| type | GLib.VariantType |

### GObject.SignalGroup

Parent: `Object` ?? GType: `GSignalGroup` ?? C type: `GSignalGroup`

`GSignalGroup` manages a collection of signals on a `GObject`. `GSignalGroup` simplifies the process of connecting many signals to a `GObject` as a...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `SignalGroup.new(target_type: GType) -> SignalGroup` | g_signal_group_new | 2.72 | Creates a new #GSignalGroup for target instances of @target_type. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| block | `SignalGroup.block() -> none` | g_signal_group_block | 2.72 | Blocks all signal handlers managed by @self so they will not be called during any signal emissions. Must be unblocked exactly the same number of ti... |
| connect | `SignalGroup.connect(detailed_signal: utf8, c_handler: Callback, data: gpointer?) -> none` | g_signal_group_connect | 2.72 | Connects @c_handler to the signal @detailed_signal on the target instance of @self. You cannot connect a signal handler after #GSignalGroup:target ... |
| connect_after | `SignalGroup.connect_after(detailed_signal: utf8, c_handler: Callback, data: gpointer?) -> none` | g_signal_group_connect_after | 2.72 | Connects @c_handler to the signal @detailed_signal on the target instance of @self. The @c_handler will be called after the default handler of the ... |
| connect_closure | `SignalGroup.connect_closure(detailed_signal: utf8, closure: Closure, after: gboolean) -> none` | g_signal_group_connect_closure | 2.74 | Connects @closure to the signal @detailed_signal on #GSignalGroup:target. You cannot connect a signal handler after #GSignalGroup:target has been set. |
| connect_data | `SignalGroup.connect_data(detailed_signal: utf8, c_handler: Callback, data: gpointer?, notify: ClosureNotify, flags: ConnectFlags) -> none` | g_signal_group_connect_data | 2.72 | Connects @c_handler to the signal @detailed_signal on the target instance of @self. You cannot connect a signal handler after #GSignalGroup:target ... |
| connect_object | `SignalGroup.connect_object(detailed_signal: utf8, c_handler: Callback, object: gpointer, flags: ConnectFlags) -> none` | g_signal_group_connect_object | 2.72 | Connects @c_handler to the signal @detailed_signal on #GSignalGroup:target. Ensures that the @object stays alive during the call to @c_handler by t... |
| connect_swapped | `SignalGroup.connect_swapped(detailed_signal: utf8, c_handler: Callback, data: gpointer?) -> none` | g_signal_group_connect_swapped | 2.72 | Connects @c_handler to the signal @detailed_signal on the target instance of @self. The instance on which the signal is emitted and @data will be s... |
| dup_target | `SignalGroup.dup_target() -> Object` | g_signal_group_dup_target | 2.72 | Gets the target instance used when connecting signals. |
| set_target | `SignalGroup.set_target(target: Object?) -> none` | g_signal_group_set_target | 2.72 | Sets the target instance used when connecting signals. Any signal that has been registered with g_signal_group_connect_object() or similar function... |
| unblock | `SignalGroup.unblock() -> none` | g_signal_group_unblock | 2.72 | Unblocks all signal handlers managed by @self so they will be called again during any signal emissions unless it is blocked again. Must be unblocke... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| target | Object | read, write | The target instance used when connecting signals. |
| target-type | GType | read, write, construct-only | The #GType of the target property. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| bind | `instance: Object` | none | last | 2.72 | This signal is emitted when #GSignalGroup:target is set to a new value other than %NULL. It is similar to #GObject::notify on `target` except it wi... |
| unbind | `` | none | last | 2.72 | This signal is emitted when the target instance of @self is set to a new #GObject. This signal will only be emitted if the previous target of @self... |

### GObject.TypeModule

Parent: `Object` ?? Implements: `TypePlugin` ?? GType: `GTypeModule` ?? C type: `GTypeModule` ?? Abstract

`GTypeModule` provides a simple implementation of the `GTypePlugin` interface. The model of `GTypeModule` is a dynamically loaded module which impl...

#### Fields

| Field | Type |
| --- | --- |
| interface_infos | GLib.SList |
| name | utf8 |
| parent_instance | Object |
| type_infos | GLib.SList |
| use_count | guint |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_interface | `TypeModule.add_interface(instance_type: GType, interface_type: GType, interface_info: InterfaceInfo) -> none` | g_type_module_add_interface |  | Registers an additional interface for a type, whose interface lives in the given type plugin. If the interface was already registered for the type ... |
| register_enum | `TypeModule.register_enum(name: utf8, const_static_values: EnumValue) -> GType` | g_type_module_register_enum | 2.6 | Looks up or registers an enumeration that is implemented with a particular type plugin. If a type with name @type_name was previously registered, t... |
| register_flags | `TypeModule.register_flags(name: utf8, const_static_values: FlagsValue) -> GType` | g_type_module_register_flags | 2.6 | Looks up or registers a flags type that is implemented with a particular type plugin. If a type with name @type_name was previously registered, the... |
| register_type | `TypeModule.register_type(parent_type: GType, type_name: utf8, type_info: TypeInfo, flags: TypeFlags) -> GType` | g_type_module_register_type |  | Looks up or registers a type that is implemented with a particular type plugin. If a type with name @type_name was previously registered, the #GTyp... |
| set_name | `TypeModule.set_name(name: utf8) -> none` | g_type_module_set_name |  | Sets the name for a #GTypeModule |
| unuse | `TypeModule.unuse() -> none` | g_type_module_unuse |  | Decreases the use count of a #GTypeModule by one. If the result is zero, the module will be unloaded. (However, the #GTypeModule will not be freed,... |
| use | `TypeModule.use() -> gboolean` | g_type_module_use |  | Increases the use count of a #GTypeModule by one. If the use count was zero before, the plugin will be loaded. If loading the plugin fails, the use... |

#### Virtual Methods

These are the names to use from `sqgi.register_class({ overrides = ... })` when SQGI can override them.

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| load | `load() -> gboolean` |  |  | loads the module and registers one or more types using g_type_module_register_type(). |
| unload | `unload() -> none` |  |  | unloads the module |

## Interfaces

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| TypePlugin |  | 0 | 0 | 4 | An interface that handles the lifecycle of dynamically loaded types. The GObject type system supports dynamic loading of types. It goes as follows:... |

### GObject.TypePlugin

GType: `GTypePlugin` ?? C type: `GTypePlugin`

An interface that handles the lifecycle of dynamically loaded types. The GObject type system supports dynamic loading of types. It goes as follows:...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| complete_interface_info | `TypePlugin.complete_interface_info(instance_type: GType, interface_type: GType, info: InterfaceInfo) -> none` | g_type_plugin_complete_interface_info |  | Calls the @complete_interface_info function from the #GTypePluginClass of @plugin. There should be no need to use this function outside of the GObj... |
| complete_type_info | `TypePlugin.complete_type_info(g_type: GType, info: TypeInfo, value_table: TypeValueTable) -> none` | g_type_plugin_complete_type_info |  | Calls the @complete_type_info function from the #GTypePluginClass of @plugin. There should be no need to use this function outside of the GObject t... |
| unuse | `TypePlugin.unuse() -> none` | g_type_plugin_unuse |  | Calls the @unuse_plugin function from the #GTypePluginClass of @plugin. There should be no need to use this function outside of the GObject type sy... |
| use | `TypePlugin.use() -> none` | g_type_plugin_use |  | Calls the @use_plugin function from the #GTypePluginClass of @plugin. There should be no need to use this function outside of the GObject type syst... |

## Flags

### GObject.BindingFlags

GType: `GBindingFlags` ?? C type: `GBindingFlags`

Flags to be passed to g_object_bind_property() or g_object_bind_property_full(). This enumeration can be extended at later date.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| bidirectional | 1 | bidirectional | Bidirectional binding; if either the property of the source or the property of the target changes, the other is updated. |
| default | 0 | default | The default binding; if the source property changes, the target property is updated with its value. |
| invert_boolean | 4 | invert-boolean | If the two properties being bound are booleans, setting one to %TRUE will result in the other being set to %FALSE and vice versa. This flag will on... |
| sync_create | 2 | sync-create | Synchronize the values of the source and target properties when creating the binding; the direction of the synchronization is always from the sourc... |

### GObject.ConnectFlags

C type: `GConnectFlags`

The connection flags are used to specify the behaviour of a signal's connection.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| after | 1 |  | If set, the handler should be called after the default handler of the signal. Normally, the handler is called before the default handler. |
| default | 0 |  | Default behaviour (no special flags). Since: 2.74 |
| swapped | 2 |  | If set, the instance and data should be swapped when calling the handler; see g_signal_connect_swapped() for an example. |

### GObject.IOCondition

GType: `GIOCondition` ?? C type: `GIOCondition`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| err | 8 | err |  |
| hup | 16 | hup |  |
| in | 1 | in |  |
| nval | 32 | nval |  |
| out | 4 | out |  |
| pri | 2 | pri |  |

### GObject.ParamFlags

C type: `GParamFlags`

Through the #GParamFlags flag values, certain aspects of parameters can be configured. See also: %G_PARAM_STATIC_STRINGS

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| construct | 4 |  | the parameter will be set upon object construction |
| construct_only | 8 |  | the parameter can only be set upon object construction |
| deprecated | 2147483648 |  | the parameter is deprecated and will be removed in a future version. A warning will be generated if it is used while running with G_ENABLE_DIAGNOST... |
| explicit_notify | 1073741824 |  | calls to g_object_set_property() for this property will not automatically result in a "notify" signal being emitted: the implementation must call g... |
| lax_validation | 16 |  | upon parameter conversion (see g_param_value_convert()) strict validation is not required |
| private | 32 |  | internal |
| readable | 1 |  | the parameter is readable |
| readwrite | 3 |  | alias for %G_PARAM_READABLE \| %G_PARAM_WRITABLE |
| static_blurb | 128 |  | the string used as blurb when constructing the parameter is guaranteed to remain valid and unmodified for the lifetime of the parameter. Since 2.8 |
| static_name | 32 |  | the string used as name when constructing the parameter is guaranteed to remain valid and unmodified for the lifetime of the parameter. Since 2.8 |
| static_nick | 64 |  | the string used as nick when constructing the parameter is guaranteed to remain valid and unmmodified for the lifetime of the parameter. Since 2.8 |
| writable | 2 |  | the parameter is writable |

### GObject.SignalFlags

C type: `GSignalFlags`

The signal flags are used to specify a signal's behaviour.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| accumulator_first_run | 131072 |  | Only used in #GSignalAccumulator accumulator functions for the #GSignalInvocationHint::run_type field to mark the first call to the accumulator fun... |
| action | 32 |  | Action signals are signals that may freely be emitted on alive objects from user code via g_signal_emit() and friends, without the need of being em... |
| deprecated | 256 |  | The signal is deprecated and will be removed in a future version. A warning will be generated if it is connected while running with G_ENABLE_DIAGNO... |
| detailed | 16 |  | This signal supports "::detail" appendices to the signal name upon handler connections and emissions. |
| must_collect | 128 |  | Varargs signal emission will always collect the arguments, even if there are no signal handlers connected. Since 2.30. |
| no_hooks | 64 |  | No emissions hooks are supported for this signal. |
| no_recurse | 8 |  | Signals being emitted for an object while currently being in emission for this very object will not be emitted recursively, but instead cause the f... |
| run_cleanup | 4 |  | Invoke the object method handler in the last emission stage. |
| run_first | 1 |  | Invoke the object method handler in the first emission stage. |
| run_last | 2 |  | Invoke the object method handler in the third emission stage. |

### GObject.SignalMatchType

C type: `GSignalMatchType`

The match types specify what g_signal_handlers_block_matched(), g_signal_handlers_unblock_matched() and g_signal_handlers_disconnect_matched() matc...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| closure | 4 |  | The closure must be the same. |
| data | 16 |  | The closure data must be the same. |
| detail | 2 |  | The signal detail must be equal. |
| func | 8 |  | The C closure callback must be the same. |
| id | 1 |  | The signal id must be equal. |
| unblocked | 32 |  | Only unblocked signals may be matched. |

### GObject.TypeDebugFlags

C type: `GTypeDebugFlags`

These flags used to be passed to g_type_init_with_debug_flags() which is now deprecated. If you need to enable debugging features, use the `GOBJECT...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| instance_count | 4 |  | Keep a count of instances of each type |
| mask | 7 |  | Mask covering all debug flags |
| none | 0 |  | Print no messages |
| objects | 1 |  | Print messages about object bookkeeping |
| signals | 2 |  | Print messages about signal emissions |

### GObject.TypeFlags

C type: `GTypeFlags`

Bit masks used to check or determine characteristics of a type.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| abstract | 16 |  | Indicates an abstract type. No instances can be created for an abstract type |
| deprecated | 128 |  | The type is deprecated and may be removed in a future version. A warning will be emitted if it is instantiated while running with `G_ENABLE_DIAGNOS... |
| final | 64 |  | Indicates a final type. A final type is a non-derivable leaf node in a deep derivable type hierarchy tree. Since: 2.70 |
| none | 0 |  | No special flags. Since: 2.74 |
| value_abstract | 32 |  | Indicates an abstract value type, i.e. a type that introduces a value table, but can't be used for g_value_init() |

### GObject.TypeFundamentalFlags

C type: `GTypeFundamentalFlags`

Bit masks used to check or determine specific characteristics of a fundamental type.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| classed | 1 |  | Indicates a classed type |
| deep_derivable | 8 |  | Indicates a deep derivable type (implies derivable) |
| derivable | 4 |  | Indicates a flat derivable type |
| instantiatable | 2 |  | Indicates an instantiatable type (implies classed) |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| CClosure |  | 0 | 0 | 50 | A #GCClosure is a specialization of #GClosure for C function callbacks. |
| Closure |  | 0 | 0 | 14 | A `GClosure` represents a callback supplied by the programmer. It will generally comprise a function of some kind and a marshaller used to call it.... |
| ClosureNotifyData |  | 0 | 0 | 0 |  |
| EnumClass |  | 0 | 0 | 0 | The class of an enumeration type holds information about its possible values. |
| EnumValue |  | 0 | 0 | 0 | A structure which contains a single enum value, its name, and its nickname. |
| FlagsClass |  | 0 | 0 | 0 | The class of a flags type holds information about its possible values. |
| FlagsValue |  | 0 | 0 | 0 | A structure which contains a single flags value, its name, and its nickname. |
| InitiallyUnownedClass |  | 0 | 0 | 0 | The class structure for the GInitiallyUnowned type. |
| InterfaceInfo |  | 0 | 0 | 0 | A structure that provides information to the type system which is used specifically for managing interface types. |
| ObjectClass |  | 0 | 0 | 5 | The class structure for the GObject type. \|[<!-- language="C" --> // Example of implementing a singleton using a constructor. static MySingleton *t... |
| ObjectConstructParam |  | 0 | 0 | 0 | The GObjectConstructParam struct is an auxiliary structure used to hand #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass. |
| Parameter |  | 0 | 0 | 0 | The GParameter struct is an auxiliary structure used to hand parameter name/value pairs to g_object_newv(). |
| ParamSpecClass |  | 0 | 0 | 0 | The class structure for the GParamSpec type. Normally, GParamSpec classes are filled by g_param_type_register_static(). |
| ParamSpecPool |  | 0 | 0 | 7 | A #GParamSpecPool maintains a collection of #GParamSpecs which can be quickly accessed by owner and name. The implementation of the #GObject proper... |
| ParamSpecTypeInfo |  | 0 | 0 | 0 | This structure is used to provide the type system with the information required to initialize and destruct (finalize) a parameter's class and insta... |
| SignalInvocationHint |  | 0 | 0 | 0 | The #GSignalInvocationHint structure is used to pass on additional information to callbacks during a signal emission. |
| SignalQuery |  | 0 | 0 | 0 | A structure holding in-depth information for a specific signal. See also: g_signal_query() |
| TypeClass |  | 0 | 0 | 10 | An opaque structure used as the base of all classes. |
| TypeFundamentalInfo |  | 0 | 0 | 0 | A structure that provides information to the type system which is used specifically for managing fundamental types. |
| TypeInfo |  | 0 | 0 | 0 | This structure is used to provide the type system with the information required to initialize and destruct (finalize) a type's class and its instan... |
| TypeInstance |  | 0 | 0 | 1 | An opaque structure used as the base of all type instances. |
| TypeInterface |  | 0 | 0 | 6 | An opaque structure used as the base of all interface types. |
| TypeModuleClass |  | 0 | 0 | 0 | In order to implement dynamic loading of types based on #GTypeModule, the @load and @unload functions in #GTypeModuleClass must be implemented. |
| TypePluginClass |  | 0 | 0 | 0 | The #GTypePlugin interface is used by the type system in order to handle the lifecycle of dynamically loaded types. |
| TypeQuery |  | 0 | 0 | 0 | A structure holding information for a specific type. See also: g_type_query() |
| TypeValueTable |  | 0 | 0 | 1 | The #GTypeValueTable provides the functions required by the #GValue implementation, to serve as a container for values of a type. |
| Value |  | 0 | 0 | 72 | An opaque structure used to hold different types of values. The data within the structure has protected scope: it is accessible only to functions w... |
| ValueArray |  | 0 | 0 | 10 | A `GValueArray` is a container structure to hold an array of generic values. The prime purpose of a `GValueArray` is for it to be used as an object... |
| WeakRef |  | 0 | 0 | 4 | A structure containing a weak reference to a #GObject. A `GWeakRef` can either be empty (i.e. point to %NULL), or point to an object for as long as... |

### GObject.CClosure

C type: `GCClosure`

A #GCClosure is a specialization of #GClosure for C function callbacks.

#### Fields

| Field | Type |
| --- | --- |
| callback | gpointer |
| closure | Closure |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| marshal_BOOLEAN__BOXED_BOXED | `marshal_BOOLEAN__BOXED_BOXED(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_BOOLEAN__BOXED_BOXED |  | A #GClosureMarshal function for use with signals with handlers that take two boxed pointers as arguments and return a boolean. If you have such a s... |
| marshal_BOOLEAN__BOXED_BOXEDv | `marshal_BOOLEAN__BOXED_BOXEDv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_BOOLEAN__BOXED_BOXEDv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_BOOLEAN__BOXED_BOXED(). |
| marshal_BOOLEAN__FLAGS | `marshal_BOOLEAN__FLAGS(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_BOOLEAN__FLAGS |  | A #GClosureMarshal function for use with signals with handlers that take a flags type as an argument and return a boolean. If you have such a signa... |
| marshal_BOOLEAN__FLAGSv | `marshal_BOOLEAN__FLAGSv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_BOOLEAN__FLAGSv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_BOOLEAN__FLAGS(). |
| marshal_generic | `marshal_generic(closure: Closure, return_gvalue: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_generic | 2.30 | A generic marshaller function implemented via libffi. Normally this function is not passed explicitly to g_signal_new(), but used automatically by ... |
| marshal_generic_va | `marshal_generic_va(closure: Closure, return_value: Value?, instance: TypeInstance, args_list: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_generic_va | 2.30 | A generic #GVaClosureMarshal function implemented via libffi. |
| marshal_STRING__OBJECT_POINTER | `marshal_STRING__OBJECT_POINTER(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_STRING__OBJECT_POINTER |  | A #GClosureMarshal function for use with signals with handlers that take a #GObject and a pointer and produce a string. It is highly unlikely that ... |
| marshal_STRING__OBJECT_POINTERv | `marshal_STRING__OBJECT_POINTERv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_STRING__OBJECT_POINTERv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_STRING__OBJECT_POINTER(). |
| marshal_VOID__BOOLEAN | `marshal_VOID__BOOLEAN(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__BOOLEAN |  | A #GClosureMarshal function for use with signals with a single boolean argument. |
| marshal_VOID__BOOLEANv | `marshal_VOID__BOOLEANv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__BOOLEANv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__BOOLEAN(). |
| marshal_VOID__BOXED | `marshal_VOID__BOXED(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__BOXED |  | A #GClosureMarshal function for use with signals with a single argument which is any boxed pointer type. |
| marshal_VOID__BOXEDv | `marshal_VOID__BOXEDv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__BOXEDv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__BOXED(). |
| marshal_VOID__CHAR | `marshal_VOID__CHAR(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__CHAR |  | A #GClosureMarshal function for use with signals with a single character argument. |
| marshal_VOID__CHARv | `marshal_VOID__CHARv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__CHARv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__CHAR(). |
| marshal_VOID__DOUBLE | `marshal_VOID__DOUBLE(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__DOUBLE |  | A #GClosureMarshal function for use with signals with one double-precision floating point argument. |
| marshal_VOID__DOUBLEv | `marshal_VOID__DOUBLEv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__DOUBLEv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__DOUBLE(). |
| marshal_VOID__ENUM | `marshal_VOID__ENUM(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__ENUM |  | A #GClosureMarshal function for use with signals with a single argument with an enumerated type. |
| marshal_VOID__ENUMv | `marshal_VOID__ENUMv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__ENUMv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__ENUM(). |
| marshal_VOID__FLAGS | `marshal_VOID__FLAGS(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__FLAGS |  | A #GClosureMarshal function for use with signals with a single argument with a flags types. |
| marshal_VOID__FLAGSv | `marshal_VOID__FLAGSv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__FLAGSv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__FLAGS(). |
| marshal_VOID__FLOAT | `marshal_VOID__FLOAT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__FLOAT |  | A #GClosureMarshal function for use with signals with one single-precision floating point argument. |
| marshal_VOID__FLOATv | `marshal_VOID__FLOATv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__FLOATv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__FLOAT(). |
| marshal_VOID__INT | `marshal_VOID__INT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__INT |  | A #GClosureMarshal function for use with signals with a single integer argument. |
| marshal_VOID__INTv | `marshal_VOID__INTv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__INTv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__INT(). |
| marshal_VOID__LONG | `marshal_VOID__LONG(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__LONG |  | A #GClosureMarshal function for use with signals with with a single long integer argument. |
| marshal_VOID__LONGv | `marshal_VOID__LONGv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__LONGv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__LONG(). |
| marshal_VOID__OBJECT | `marshal_VOID__OBJECT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__OBJECT |  | A #GClosureMarshal function for use with signals with a single #GObject argument. |
| marshal_VOID__OBJECTv | `marshal_VOID__OBJECTv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__OBJECTv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__OBJECT(). |
| marshal_VOID__PARAM | `marshal_VOID__PARAM(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__PARAM |  | A #GClosureMarshal function for use with signals with a single argument of type #GParamSpec. |
| marshal_VOID__PARAMv | `marshal_VOID__PARAMv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__PARAMv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__PARAM(). |
| marshal_VOID__POINTER | `marshal_VOID__POINTER(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__POINTER |  | A #GClosureMarshal function for use with signals with a single raw pointer argument type. If it is possible, it is better to use one of the more sp... |
| marshal_VOID__POINTERv | `marshal_VOID__POINTERv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__POINTERv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__POINTER(). |
| marshal_VOID__STRING | `marshal_VOID__STRING(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__STRING |  | A #GClosureMarshal function for use with signals with a single string argument. |
| marshal_VOID__STRINGv | `marshal_VOID__STRINGv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__STRINGv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__STRING(). |
| marshal_VOID__UCHAR | `marshal_VOID__UCHAR(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__UCHAR |  | A #GClosureMarshal function for use with signals with a single unsigned character argument. |
| marshal_VOID__UCHARv | `marshal_VOID__UCHARv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__UCHARv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__UCHAR(). |
| marshal_VOID__UINT | `marshal_VOID__UINT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__UINT |  | A #GClosureMarshal function for use with signals with with a single unsigned integer argument. |
| marshal_VOID__UINT_POINTER | `marshal_VOID__UINT_POINTER(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__UINT_POINTER |  | A #GClosureMarshal function for use with signals with an unsigned int and a pointer as arguments. |
| marshal_VOID__UINT_POINTERv | `marshal_VOID__UINT_POINTERv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__UINT_POINTERv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__UINT_POINTER(). |
| marshal_VOID__UINTv | `marshal_VOID__UINTv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__UINTv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__UINT(). |
| marshal_VOID__ULONG | `marshal_VOID__ULONG(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__ULONG |  | A #GClosureMarshal function for use with signals with a single unsigned long integer argument. |
| marshal_VOID__ULONGv | `marshal_VOID__ULONGv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__ULONGv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__ULONG(). |
| marshal_VOID__VARIANT | `marshal_VOID__VARIANT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__VARIANT |  | A #GClosureMarshal function for use with signals with a single #GVariant argument. |
| marshal_VOID__VARIANTv | `marshal_VOID__VARIANTv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__VARIANTv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__VARIANT(). |
| marshal_VOID__VOID | `marshal_VOID__VOID(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__VOID |  | A #GClosureMarshal function for use with signals with no arguments. |
| marshal_VOID__VOIDv | `marshal_VOID__VOIDv(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` | g_cclosure_marshal_VOID__VOIDv |  | The #GVaClosureMarshal equivalent to g_cclosure_marshal_VOID__VOID(). |
| new | `new(callback_func: Callback?, user_data: gpointer?, destroy_data: ClosureNotify) -> Closure` | g_cclosure_new |  | Creates a new closure which invokes @callback_func with @user_data as the last parameter. @destroy_data will be called as a finalize notifier on th... |
| new_object | `new_object(callback_func: Callback, object: Object) -> Closure` | g_cclosure_new_object |  | A variant of g_cclosure_new() which uses @object as @user_data and calls g_object_watch_closure() on @object and the created closure. This function... |
| new_object_swap | `new_object_swap(callback_func: Callback, object: Object) -> Closure` | g_cclosure_new_object_swap |  | A variant of g_cclosure_new_swap() which uses @object as @user_data and calls g_object_watch_closure() on @object and the created closure. This fun... |
| new_swap | `new_swap(callback_func: Callback?, user_data: gpointer?, destroy_data: ClosureNotify) -> Closure` | g_cclosure_new_swap |  | Creates a new closure which invokes @callback_func with @user_data as the first parameter. @destroy_data will be called as a finalize notifier on t... |

### GObject.Closure

GType: `GClosure` ?? C type: `GClosure`

A `GClosure` represents a callback supplied by the programmer. It will generally comprise a function of some kind and a marshaller used to call it....

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| derivative_flag | guint |
| floating | guint |
| in_inotify | guint |
| in_marshal | guint |
| is_invalid | guint |
| marshal | none |
| meta_marshal_nouse | guint |
| n_fnotifiers | guint |
| n_guards | guint |
| n_inotifiers | guint |
| notifiers | ClosureNotifyData |
| ref_count | guint |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_object | `Closure.new_object(sizeof_closure: guint, object: Object) -> Closure` | g_closure_new_object |  | A variant of g_closure_new_simple() which stores @object in the @data field of the closure and calls g_object_watch_closure() on @object and the cr... |
| new_simple | `Closure.new_simple(sizeof_closure: guint, data: gpointer?) -> Closure` | g_closure_new_simple |  | Allocates a struct of the given size and initializes the initial part as a #GClosure. This function is mainly useful when implementing new types of... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_finalize_notifier | `Closure.add_finalize_notifier(notify_data: gpointer?, notify_func: ClosureNotify?) -> none` | g_closure_add_finalize_notifier |  | Registers a finalization notifier which will be called when the reference count of @closure goes down to 0. Multiple finalization notifiers on a si... |
| add_invalidate_notifier | `Closure.add_invalidate_notifier(notify_data: gpointer?, notify_func: ClosureNotify?) -> none` | g_closure_add_invalidate_notifier |  | Registers an invalidation notifier which will be called when the @closure is invalidated with g_closure_invalidate(). Invalidation notifiers are in... |
| add_marshal_guards | `Closure.add_marshal_guards(pre_marshal_data: gpointer?, pre_marshal_notify: ClosureNotify?, post_marshal_data: gpointer?, post_marshal_notify: ClosureNotify?) -> none` | g_closure_add_marshal_guards |  | Adds a pair of notifiers which get invoked before and after the closure callback, respectively. This is typically used to protect the extra argumen... |
| invalidate | `Closure.invalidate() -> none` | g_closure_invalidate |  | Sets a flag on the closure to indicate that its calling environment has become invalid, and thus causes any future invocations of g_closure_invoke(... |
| invoke | `Closure.invoke(return_value: out Value?, n_param_values: guint, param_values: Value, invocation_hint: gpointer?) -> none` | g_closure_invoke |  | Invokes the closure, i.e. executes the callback represented by the @closure. |
| ref | `Closure.ref() -> Closure` | g_closure_ref |  | Increments the reference count on a closure to force it staying alive while the caller holds a pointer to it. |
| remove_finalize_notifier | `Closure.remove_finalize_notifier(notify_data: gpointer?, notify_func: ClosureNotify) -> none` | g_closure_remove_finalize_notifier |  | Removes a finalization notifier. Notice that notifiers are automatically removed after they are run. |
| remove_invalidate_notifier | `Closure.remove_invalidate_notifier(notify_data: gpointer?, notify_func: ClosureNotify) -> none` | g_closure_remove_invalidate_notifier |  | Removes an invalidation notifier. Notice that notifiers are automatically removed after they are run. |
| set_marshal | `Closure.set_marshal(marshal: ClosureMarshal) -> none` | g_closure_set_marshal |  | Sets the marshaller of @closure. The `marshal_data` of @marshal provides a way for a meta marshaller to provide additional information to the marsh... |
| set_meta_marshal | `Closure.set_meta_marshal(marshal_data: gpointer?, meta_marshal: ClosureMarshal?) -> none` | g_closure_set_meta_marshal |  | Sets the meta marshaller of @closure. A meta marshaller wraps the @closure's marshal and modifies the way it is called in some fashion. The most co... |
| sink | `Closure.sink() -> none` | g_closure_sink |  | Takes over the initial ownership of a closure. Each closure is initially created in a "floating" state, which means that the initial reference coun... |
| unref | `Closure.unref() -> none` | g_closure_unref |  | Decrements the reference count of a closure after it was previously incremented by the same caller. If no other callers are using the closure, then... |

### GObject.ClosureNotifyData

C type: `GClosureNotifyData`

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| notify | ClosureNotify |

### GObject.EnumClass

C type: `GEnumClass`

The class of an enumeration type holds information about its possible values.

#### Fields

| Field | Type |
| --- | --- |
| g_type_class | TypeClass |
| maximum | gint |
| minimum | gint |
| n_values | guint |
| values | EnumValue |

### GObject.EnumValue

C type: `GEnumValue`

A structure which contains a single enum value, its name, and its nickname.

#### Fields

| Field | Type |
| --- | --- |
| value | gint |
| value_name | utf8 |
| value_nick | utf8 |

### GObject.FlagsClass

C type: `GFlagsClass`

The class of a flags type holds information about its possible values.

#### Fields

| Field | Type |
| --- | --- |
| g_type_class | TypeClass |
| mask | guint |
| n_values | guint |
| values | FlagsValue |

### GObject.FlagsValue

C type: `GFlagsValue`

A structure which contains a single flags value, its name, and its nickname.

#### Fields

| Field | Type |
| --- | --- |
| value | guint |
| value_name | utf8 |
| value_nick | utf8 |

### GObject.InitiallyUnownedClass

C type: `GInitiallyUnownedClass`

The class structure for the GInitiallyUnowned type.

#### Fields

| Field | Type |
| --- | --- |
| construct_properties | GLib.SList |
| constructed | none |
| constructor | Object |
| dispatch_properties_changed | none |
| dispose | none |
| finalize | none |
| flags | gsize |
| g_type_class | TypeClass |
| get_property | none |
| n_construct_properties | gsize |
| n_pspecs | gsize |
| notify | none |
| pdummy | gpointer |
| pspecs | gpointer |
| set_property | none |

### GObject.InterfaceInfo

C type: `GInterfaceInfo`

A structure that provides information to the type system which is used specifically for managing interface types.

#### Fields

| Field | Type |
| --- | --- |
| interface_data | gpointer |
| interface_finalize | InterfaceFinalizeFunc |
| interface_init | InterfaceInitFunc |

### GObject.ObjectClass

C type: `GObjectClass`

The class structure for the GObject type. |[<!-- language="C" --> // Example of implementing a singleton using a constructor. static MySingleton *t...

#### Fields

| Field | Type |
| --- | --- |
| construct_properties | GLib.SList |
| constructed | none |
| constructor | Object |
| dispatch_properties_changed | none |
| dispose | none |
| finalize | none |
| flags | gsize |
| g_type_class | TypeClass |
| get_property | none |
| n_construct_properties | gsize |
| n_pspecs | gsize |
| notify | none |
| pdummy | gpointer |
| pspecs | gpointer |
| set_property | none |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| find_property | `ObjectClass.find_property(property_name: utf8) -> ParamSpec` | g_object_class_find_property |  | Looks up the #GParamSpec for a property of a class. |
| install_properties | `ObjectClass.install_properties(n_pspecs: guint, pspecs: ParamSpec) -> none` | g_object_class_install_properties | 2.26 | Installs new properties from an array of #GParamSpecs. All properties should be installed during the class initializer. It is possible to install p... |
| install_property | `ObjectClass.install_property(property_id: guint, pspec: ParamSpec) -> none` | g_object_class_install_property |  | Installs a new property. All properties should be installed during the class initializer. It is possible to install properties after that, but doin... |
| list_properties | `ObjectClass.list_properties(n_properties: out guint) -> ParamSpec` | g_object_class_list_properties |  | Get an array of #GParamSpec* for all properties of a class. |
| override_property | `ObjectClass.override_property(property_id: guint, name: utf8) -> none` | g_object_class_override_property | 2.4 | Registers @property_id as referring to a property with the name @name in a parent class or in an interface implemented by @oclass. This allows this... |

### GObject.ObjectConstructParam

C type: `GObjectConstructParam`

The GObjectConstructParam struct is an auxiliary structure used to hand #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.

#### Fields

| Field | Type |
| --- | --- |
| pspec | ParamSpec |
| value | Value |

### GObject.Parameter

C type: `GParameter`

The GParameter struct is an auxiliary structure used to hand parameter name/value pairs to g_object_newv().

#### Fields

| Field | Type |
| --- | --- |
| name | utf8 |
| value | Value |

### GObject.ParamSpecClass

C type: `GParamSpecClass`

The class structure for the GParamSpec type. Normally, GParamSpec classes are filled by g_param_type_register_static().

#### Fields

| Field | Type |
| --- | --- |
| dummy | gpointer |
| finalize | none |
| g_type_class | TypeClass |
| value_is_valid | gboolean |
| value_set_default | none |
| value_type | GType |
| value_validate | gboolean |
| values_cmp | gint |

### GObject.ParamSpecPool

C type: `GParamSpecPool`

A #GParamSpecPool maintains a collection of #GParamSpecs which can be quickly accessed by owner and name. The implementation of the #GObject proper...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `new(type_prefixing: gboolean) -> ParamSpecPool` | g_param_spec_pool_new |  | Creates a new #GParamSpecPool. If @type_prefixing is %TRUE, lookups in the newly created pool will allow to specify the owner as a colon-separated ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `ParamSpecPool.free() -> none` | g_param_spec_pool_free | 2.80 | Frees the resources allocated by a #GParamSpecPool. |
| insert | `ParamSpecPool.insert(pspec: ParamSpec, owner_type: GType) -> none` | g_param_spec_pool_insert |  | Inserts a #GParamSpec in the pool. |
| list | `ParamSpecPool.list(owner_type: GType, n_pspecs_p: out guint) -> ParamSpec` | g_param_spec_pool_list |  | Gets an array of all #GParamSpecs owned by @owner_type in the pool. |
| list_owned | `ParamSpecPool.list_owned(owner_type: GType) -> GLib.List` | g_param_spec_pool_list_owned |  | Gets an #GList of all #GParamSpecs owned by @owner_type in the pool. |
| lookup | `ParamSpecPool.lookup(param_name: utf8, owner_type: GType, walk_ancestors: gboolean) -> ParamSpec` | g_param_spec_pool_lookup |  | Looks up a #GParamSpec in the pool. |
| remove | `ParamSpecPool.remove(pspec: ParamSpec) -> none` | g_param_spec_pool_remove |  | Removes a #GParamSpec from the pool. |

### GObject.ParamSpecTypeInfo

C type: `GParamSpecTypeInfo`

This structure is used to provide the type system with the information required to initialize and destruct (finalize) a parameter's class and insta...

#### Fields

| Field | Type |
| --- | --- |
| finalize | none |
| instance_init | none |
| instance_size | guint16 |
| n_preallocs | guint16 |
| value_set_default | none |
| value_type | GType |
| value_validate | gboolean |
| values_cmp | gint |

### GObject.SignalInvocationHint

C type: `GSignalInvocationHint`

The #GSignalInvocationHint structure is used to pass on additional information to callbacks during a signal emission.

#### Fields

| Field | Type |
| --- | --- |
| detail | GLib.Quark |
| run_type | SignalFlags |
| signal_id | guint |

### GObject.SignalQuery

C type: `GSignalQuery`

A structure holding in-depth information for a specific signal. See also: g_signal_query()

#### Fields

| Field | Type |
| --- | --- |
| itype | GType |
| n_params | guint |
| param_types | GType |
| return_type | GType |
| signal_flags | SignalFlags |
| signal_id | guint |
| signal_name | utf8 |

### GObject.TypeClass

C type: `GTypeClass`

An opaque structure used as the base of all classes.

#### Fields

| Field | Type |
| --- | --- |
| g_type | GType |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| adjust_private_offset | `adjust_private_offset(g_class: gpointer?, private_size_or_offset: gint) -> none` | g_type_class_adjust_private_offset |  |  |
| peek | `peek(type: GType) -> TypeClass` | g_type_class_peek |  | This function is essentially the same as g_type_class_ref(), except that the classes reference count isn't incremented. As a consequence, this func... |
| peek_static | `peek_static(type: GType) -> TypeClass` | g_type_class_peek_static | 2.4 | A more efficient version of g_type_class_peek() which works only for static types. |
| ref | `ref(type: GType) -> TypeClass` | g_type_class_ref |  | Increments the reference count of the class structure belonging to @type. This function will demand-create the class if it doesn't exist already. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_private | `TypeClass.add_private(private_size: gsize) -> none` | g_type_class_add_private | 2.4 | Registers a private structure for an instantiatable type. When an object is allocated, the private structures for the type and all of its parent ty... |
| get_instance_private_offset | `TypeClass.get_instance_private_offset() -> gint` | g_type_class_get_instance_private_offset | 2.38 | Gets the offset of the private data for instances of @g_class. This is how many bytes you should add to the instance pointer of a class in order to... |
| get_private | `TypeClass.get_private(private_type: GType) -> gpointer` | g_type_class_get_private |  |  |
| peek_parent | `TypeClass.peek_parent() -> TypeClass` | g_type_class_peek_parent |  | This is a convenience function often needed in class initializers. It returns the class structure of the immediate parent type of the class passed ... |
| unref | `TypeClass.unref() -> none` | g_type_class_unref |  | Decrements the reference count of the class structure being passed in. Once the last reference count of a class has been released, classes may be f... |
| unref_uncached | `TypeClass.unref_uncached() -> none` | g_type_class_unref_uncached |  | A variant of g_type_class_unref() for use in #GTypeClassCacheFunc implementations. It unreferences a class without consulting the chain of #GTypeCl... |

### GObject.TypeFundamentalInfo

C type: `GTypeFundamentalInfo`

A structure that provides information to the type system which is used specifically for managing fundamental types.

#### Fields

| Field | Type |
| --- | --- |
| type_flags | TypeFundamentalFlags |

### GObject.TypeInfo

C type: `GTypeInfo`

This structure is used to provide the type system with the information required to initialize and destruct (finalize) a type's class and its instan...

#### Fields

| Field | Type |
| --- | --- |
| base_finalize | BaseFinalizeFunc |
| base_init | BaseInitFunc |
| class_data | gpointer |
| class_finalize | ClassFinalizeFunc |
| class_init | ClassInitFunc |
| class_size | guint16 |
| instance_init | InstanceInitFunc |
| instance_size | guint16 |
| n_preallocs | guint16 |
| value_table | TypeValueTable |

### GObject.TypeInstance

C type: `GTypeInstance`

An opaque structure used as the base of all type instances.

#### Fields

| Field | Type |
| --- | --- |
| g_class | TypeClass |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_private | `TypeInstance.get_private(private_type: GType) -> gpointer` | g_type_instance_get_private |  |  |

### GObject.TypeInterface

C type: `GTypeInterface`

An opaque structure used as the base of all interface types.

#### Fields

| Field | Type |
| --- | --- |
| g_instance_type | GType |
| g_type | GType |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_prerequisite | `add_prerequisite(interface_type: GType, prerequisite_type: GType) -> none` | g_type_interface_add_prerequisite |  | Adds @prerequisite_type to the list of prerequisites of @interface_type. This means that any type implementing @interface_type must also implement ... |
| get_plugin | `get_plugin(instance_type: GType, interface_type: GType) -> TypePlugin` | g_type_interface_get_plugin |  | Returns the #GTypePlugin structure for the dynamic interface @interface_type which has been added to @instance_type, or %NULL if @interface_type ha... |
| instantiatable_prerequisite | `instantiatable_prerequisite(interface_type: GType) -> GType` | g_type_interface_instantiatable_prerequisite | 2.68 | Returns the most specific instantiatable prerequisite of an interface type. If the interface type has no instantiatable prerequisite, %G_TYPE_INVAL... |
| peek | `peek(instance_class: TypeClass, iface_type: GType) -> TypeInterface` | g_type_interface_peek |  | Returns the #GTypeInterface structure of an interface to which the passed in class conforms. |
| prerequisites | `prerequisites(interface_type: GType, n_prerequisites: out guint?) -> GType` | g_type_interface_prerequisites | 2.2 | Returns the prerequisites of an interfaces type. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| peek_parent | `TypeInterface.peek_parent() -> TypeInterface` | g_type_interface_peek_parent |  | Returns the corresponding #GTypeInterface structure of the parent type of the instance type to which @g_iface belongs. This is useful when deriving... |

### GObject.TypeModuleClass

C type: `GTypeModuleClass`

In order to implement dynamic loading of types based on #GTypeModule, the @load and @unload functions in #GTypeModuleClass must be implemented.

#### Fields

| Field | Type |
| --- | --- |
| load | gboolean |
| parent_class | ObjectClass |
| reserved1 | none |
| reserved2 | none |
| reserved3 | none |
| reserved4 | none |
| unload | none |

### GObject.TypePluginClass

C type: `GTypePluginClass`

The #GTypePlugin interface is used by the type system in order to handle the lifecycle of dynamically loaded types.

#### Fields

| Field | Type |
| --- | --- |
| base_iface | TypeInterface |
| complete_interface_info | TypePluginCompleteInterfaceInfo |
| complete_type_info | TypePluginCompleteTypeInfo |
| unuse_plugin | TypePluginUnuse |
| use_plugin | TypePluginUse |

### GObject.TypeQuery

C type: `GTypeQuery`

A structure holding information for a specific type. See also: g_type_query()

#### Fields

| Field | Type |
| --- | --- |
| class_size | guint |
| instance_size | guint |
| type | GType |
| type_name | utf8 |

### GObject.TypeValueTable

C type: `GTypeValueTable`

The #GTypeValueTable provides the functions required by the #GValue implementation, to serve as a container for values of a type.

#### Fields

| Field | Type |
| --- | --- |
| collect_format | utf8 |
| collect_value | TypeValueCollectFunc |
| lcopy_format | utf8 |
| lcopy_value | TypeValueLCopyFunc |
| value_copy | TypeValueCopyFunc |
| value_free | TypeValueFreeFunc |
| value_init | TypeValueInitFunc |
| value_peek_pointer | TypeValuePeekPointerFunc |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| peek | `peek(type: GType) -> TypeValueTable` | g_type_value_table_peek |  | Returns the location of the #GTypeValueTable associated with @type. Note that this function should only be used from source code that implements or... |

### GObject.Value

GType: `GValue` ?? C type: `GValue`

An opaque structure used to hold different types of values. The data within the structure has protected scope: it is accessible only to functions w...

#### Fields

| Field | Type |
| --- | --- |
| data | _Value__data__union |
| g_type | GType |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| register_transform_func | `register_transform_func(src_type: GType, dest_type: GType, transform_func: ValueTransform) -> none` | g_value_register_transform_func |  | Registers a value transformation function for use in g_value_transform(). A previously registered transformation function for @src_type and @dest_t... |
| type_compatible | `type_compatible(src_type: GType, dest_type: GType) -> gboolean` | g_value_type_compatible |  | Returns whether a #GValue of type @src_type can be copied into a #GValue of type @dest_type. |
| type_transformable | `type_transformable(src_type: GType, dest_type: GType) -> gboolean` | g_value_type_transformable |  | Check whether g_value_transform() is able to transform values of type @src_type into values of type @dest_type. Note that for the types to be trans... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| copy | `Value.copy(dest_value: Value) -> none` | g_value_copy |  | Copies the value of @src_value into @dest_value. |
| dup_boxed | `Value.dup_boxed() -> gpointer` | g_value_dup_boxed |  | Get the contents of a %G_TYPE_BOXED derived #GValue. Upon getting, the boxed value is duplicated and needs to be later freed with g_boxed_free(), e... |
| dup_object | `Value.dup_object() -> Object` | g_value_dup_object |  | Get the contents of a %G_TYPE_OBJECT derived #GValue, increasing its reference count. If the contents of the #GValue are %NULL, then %NULL will be ... |
| dup_param | `Value.dup_param() -> ParamSpec` | g_value_dup_param |  | Get the contents of a %G_TYPE_PARAM #GValue, increasing its reference count. |
| dup_string | `Value.dup_string() -> utf8` | g_value_dup_string |  | Get a copy the contents of a %G_TYPE_STRING #GValue. |
| dup_variant | `Value.dup_variant() -> GLib.Variant` | g_value_dup_variant | 2.26 | Get the contents of a variant #GValue, increasing its refcount. The returned #GVariant is never floating. |
| fits_pointer | `Value.fits_pointer() -> gboolean` | g_value_fits_pointer |  | Determines if @value will fit inside the size of a pointer value. This is an internal function introduced mainly for C marshallers. |
| get_boolean | `Value.get_boolean() -> gboolean` | g_value_get_boolean |  | Get the contents of a %G_TYPE_BOOLEAN #GValue. |
| get_boxed | `Value.get_boxed() -> gpointer` | g_value_get_boxed |  | Get the contents of a %G_TYPE_BOXED derived #GValue. |
| get_char | `Value.get_char() -> gchar` | g_value_get_char |  | Do not use this function; it is broken on platforms where the %char type is unsigned, such as ARM and PowerPC. See g_value_get_schar(). Get the con... |
| get_double | `Value.get_double() -> gdouble` | g_value_get_double |  | Get the contents of a %G_TYPE_DOUBLE #GValue. |
| get_enum | `Value.get_enum() -> gint` | g_value_get_enum |  | Get the contents of a %G_TYPE_ENUM #GValue. |
| get_flags | `Value.get_flags() -> guint` | g_value_get_flags |  | Get the contents of a %G_TYPE_FLAGS #GValue. |
| get_float | `Value.get_float() -> gfloat` | g_value_get_float |  | Get the contents of a %G_TYPE_FLOAT #GValue. |
| get_gtype | `Value.get_gtype() -> GType` | g_value_get_gtype | 2.12 | Get the contents of a %G_TYPE_GTYPE #GValue. |
| get_int | `Value.get_int() -> gint` | g_value_get_int |  | Get the contents of a %G_TYPE_INT #GValue. |
| get_int64 | `Value.get_int64() -> gint64` | g_value_get_int64 |  | Get the contents of a %G_TYPE_INT64 #GValue. |
| get_long | `Value.get_long() -> glong` | g_value_get_long |  | Get the contents of a %G_TYPE_LONG #GValue. |
| get_object | `Value.get_object() -> Object` | g_value_get_object |  | Get the contents of a %G_TYPE_OBJECT derived #GValue. |
| get_param | `Value.get_param() -> ParamSpec` | g_value_get_param |  | Get the contents of a %G_TYPE_PARAM #GValue. |
| get_pointer | `Value.get_pointer() -> gpointer` | g_value_get_pointer |  | Get the contents of a pointer #GValue. |
| get_schar | `Value.get_schar() -> gint8` | g_value_get_schar | 2.32 | Get the contents of a %G_TYPE_CHAR #GValue. |
| get_string | `Value.get_string() -> utf8` | g_value_get_string |  | Get the contents of a %G_TYPE_STRING #GValue. |
| get_uchar | `Value.get_uchar() -> guint8` | g_value_get_uchar |  | Get the contents of a %G_TYPE_UCHAR #GValue. |
| get_uint | `Value.get_uint() -> guint` | g_value_get_uint |  | Get the contents of a %G_TYPE_UINT #GValue. |
| get_uint64 | `Value.get_uint64() -> guint64` | g_value_get_uint64 |  | Get the contents of a %G_TYPE_UINT64 #GValue. |
| get_ulong | `Value.get_ulong() -> gulong` | g_value_get_ulong |  | Get the contents of a %G_TYPE_ULONG #GValue. |
| get_variant | `Value.get_variant() -> GLib.Variant` | g_value_get_variant | 2.26 | Get the contents of a variant #GValue. |
| init | `Value.init(g_type: GType) -> Value` | g_value_init |  | Initializes @value with the default value of @type. |
| init_from_instance | `Value.init_from_instance(instance: TypeInstance) -> none` | g_value_init_from_instance | 2.42 | Initializes and sets @value from an instantiatable type via the value_table's collect_value() function. Note: The @value will be initialised with t... |
| peek_pointer | `Value.peek_pointer() -> gpointer` | g_value_peek_pointer |  | Returns the value contents as pointer. This function asserts that g_value_fits_pointer() returned %TRUE for the passed in value. This is an interna... |
| reset | `Value.reset() -> Value` | g_value_reset |  | Clears the current value in @value and resets it to the default value (as if the value had just been initialized). |
| set_boolean | `Value.set_boolean(v_boolean: gboolean) -> none` | g_value_set_boolean |  | Set the contents of a %G_TYPE_BOOLEAN #GValue to @v_boolean. |
| set_boxed | `Value.set_boxed(v_boxed: gpointer?) -> none` | g_value_set_boxed |  | Set the contents of a %G_TYPE_BOXED derived #GValue to @v_boxed. |
| set_boxed_take_ownership | `Value.set_boxed_take_ownership(v_boxed: gpointer?) -> none` | g_value_set_boxed_take_ownership |  | This is an internal function introduced mainly for C marshallers. |
| set_char | `Value.set_char(v_char: gchar) -> none` | g_value_set_char |  | Set the contents of a %G_TYPE_CHAR #GValue to @v_char. |
| set_double | `Value.set_double(v_double: gdouble) -> none` | g_value_set_double |  | Set the contents of a %G_TYPE_DOUBLE #GValue to @v_double. |
| set_enum | `Value.set_enum(v_enum: gint) -> none` | g_value_set_enum |  | Set the contents of a %G_TYPE_ENUM #GValue to @v_enum. |
| set_flags | `Value.set_flags(v_flags: guint) -> none` | g_value_set_flags |  | Set the contents of a %G_TYPE_FLAGS #GValue to @v_flags. |
| set_float | `Value.set_float(v_float: gfloat) -> none` | g_value_set_float |  | Set the contents of a %G_TYPE_FLOAT #GValue to @v_float. |
| set_gtype | `Value.set_gtype(v_gtype: GType) -> none` | g_value_set_gtype | 2.12 | Set the contents of a %G_TYPE_GTYPE #GValue to @v_gtype. |
| set_instance | `Value.set_instance(instance: gpointer?) -> none` | g_value_set_instance |  | Sets @value from an instantiatable type via the value_table's collect_value() function. |
| set_int | `Value.set_int(v_int: gint) -> none` | g_value_set_int |  | Set the contents of a %G_TYPE_INT #GValue to @v_int. |
| set_int64 | `Value.set_int64(v_int64: gint64) -> none` | g_value_set_int64 |  | Set the contents of a %G_TYPE_INT64 #GValue to @v_int64. |
| set_interned_string | `Value.set_interned_string(v_string: utf8?) -> none` | g_value_set_interned_string | 2.66 | Set the contents of a %G_TYPE_STRING #GValue to @v_string. The string is assumed to be static and interned (canonical, for example from g_intern_st... |
| set_long | `Value.set_long(v_long: glong) -> none` | g_value_set_long |  | Set the contents of a %G_TYPE_LONG #GValue to @v_long. |
| set_object | `Value.set_object(v_object: Object?) -> none` | g_value_set_object |  | Set the contents of a %G_TYPE_OBJECT derived #GValue to @v_object. g_value_set_object() increases the reference count of @v_object (the #GValue hol... |
| set_object_take_ownership | `Value.set_object_take_ownership(v_object: gpointer?) -> none` | g_value_set_object_take_ownership |  | This is an internal function introduced mainly for C marshallers. |
| set_param | `Value.set_param(param: ParamSpec?) -> none` | g_value_set_param |  | Set the contents of a %G_TYPE_PARAM #GValue to @param. |
| set_param_take_ownership | `Value.set_param_take_ownership(param: ParamSpec?) -> none` | g_value_set_param_take_ownership |  | This is an internal function introduced mainly for C marshallers. |
| set_pointer | `Value.set_pointer(v_pointer: gpointer?) -> none` | g_value_set_pointer |  | Set the contents of a pointer #GValue to @v_pointer. |
| set_schar | `Value.set_schar(v_char: gint8) -> none` | g_value_set_schar | 2.32 | Set the contents of a %G_TYPE_CHAR #GValue to @v_char. |
| set_static_boxed | `Value.set_static_boxed(v_boxed: gpointer?) -> none` | g_value_set_static_boxed |  | Set the contents of a %G_TYPE_BOXED derived #GValue to @v_boxed. The boxed value is assumed to be static, and is thus not duplicated when setting t... |
| set_static_string | `Value.set_static_string(v_string: utf8?) -> none` | g_value_set_static_string |  | Set the contents of a %G_TYPE_STRING #GValue to @v_string. The string is assumed to be static, and is thus not duplicated when setting the #GValue.... |
| set_string | `Value.set_string(v_string: utf8?) -> none` | g_value_set_string |  | Set the contents of a %G_TYPE_STRING #GValue to a copy of @v_string. |
| set_string_take_ownership | `Value.set_string_take_ownership(v_string: utf8?) -> none` | g_value_set_string_take_ownership |  | This is an internal function introduced mainly for C marshallers. |
| set_uchar | `Value.set_uchar(v_uchar: guint8) -> none` | g_value_set_uchar |  | Set the contents of a %G_TYPE_UCHAR #GValue to @v_uchar. |
| set_uint | `Value.set_uint(v_uint: guint) -> none` | g_value_set_uint |  | Set the contents of a %G_TYPE_UINT #GValue to @v_uint. |
| set_uint64 | `Value.set_uint64(v_uint64: guint64) -> none` | g_value_set_uint64 |  | Set the contents of a %G_TYPE_UINT64 #GValue to @v_uint64. |
| set_ulong | `Value.set_ulong(v_ulong: gulong) -> none` | g_value_set_ulong |  | Set the contents of a %G_TYPE_ULONG #GValue to @v_ulong. |
| set_variant | `Value.set_variant(variant: GLib.Variant?) -> none` | g_value_set_variant | 2.26 | Set the contents of a variant #GValue to @variant. If the variant is floating, it is consumed. |
| steal_string | `Value.steal_string() -> utf8` | g_value_steal_string | 2.80 | Steal ownership on contents of a %G_TYPE_STRING #GValue. As a result of this operation the value's contents will be reset to %NULL. The purpose of ... |
| take_boxed | `Value.take_boxed(v_boxed: gpointer?) -> none` | g_value_take_boxed | 2.4 | Sets the contents of a %G_TYPE_BOXED derived #GValue to @v_boxed and takes over the ownership of the caller???s reference to @v_boxed; the caller d... |
| take_object | `Value.take_object(v_object: gpointer?) -> none` | g_value_take_object | 2.4 | Sets the contents of a %G_TYPE_OBJECT derived #GValue to @v_object and takes over the ownership of the caller???s reference to @v_object; the calle... |
| take_param | `Value.take_param(param: ParamSpec?) -> none` | g_value_take_param | 2.4 | Sets the contents of a %G_TYPE_PARAM #GValue to @param and takes over the ownership of the caller???s reference to @param; the caller doesn???t hav... |
| take_string | `Value.take_string(v_string: utf8?) -> none` | g_value_take_string | 2.4 | Sets the contents of a %G_TYPE_STRING #GValue to @v_string. |
| take_variant | `Value.take_variant(variant: GLib.Variant?) -> none` | g_value_take_variant | 2.26 | Set the contents of a variant #GValue to @variant, and takes over the ownership of the caller's reference to @variant; the caller doesn't have to u... |
| transform | `Value.transform(dest_value: Value) -> gboolean` | g_value_transform |  | Tries to cast the contents of @src_value into a type appropriate to store in @dest_value, e.g. to transform a %G_TYPE_INT value into a %G_TYPE_FLOA... |
| unset | `Value.unset() -> none` | g_value_unset |  | Clears the current value in @value (if any) and "unsets" the type, this releases all resources associated with this GValue. An unset value is the s... |

### GObject.ValueArray

GType: `GValueArray` ?? C type: `GValueArray`

A `GValueArray` is a container structure to hold an array of generic values. The prime purpose of a `GValueArray` is for it to be used as an object...

#### Fields

| Field | Type |
| --- | --- |
| n_prealloced | guint |
| n_values | guint |
| values | Value |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `ValueArray.new(n_prealloced: guint) -> ValueArray` | g_value_array_new |  | Allocate and initialize a new #GValueArray, optionally preserve space for @n_prealloced elements. New arrays always contain 0 elements, regardless ... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| append | `ValueArray.append(value: Value?) -> ValueArray` | g_value_array_append |  | Insert a copy of @value as last element of @value_array. If @value is %NULL, an uninitialized value is appended. |
| copy | `ValueArray.copy() -> ValueArray` | g_value_array_copy |  | Construct an exact copy of a #GValueArray by duplicating all its contents. |
| free | `ValueArray.free() -> none` | g_value_array_free |  | Free a #GValueArray including its contents. |
| get_nth | `ValueArray.get_nth(index_: guint) -> Value` | g_value_array_get_nth |  | Return a pointer to the value at @index_ containd in @value_array. |
| insert | `ValueArray.insert(index_: guint, value: Value?) -> ValueArray` | g_value_array_insert |  | Insert a copy of @value at specified position into @value_array. If @value is %NULL, an uninitialized value is inserted. |
| prepend | `ValueArray.prepend(value: Value?) -> ValueArray` | g_value_array_prepend |  | Insert a copy of @value as first element of @value_array. If @value is %NULL, an uninitialized value is prepended. |
| remove | `ValueArray.remove(index_: guint) -> ValueArray` | g_value_array_remove |  | Remove the value at position @index_ from @value_array. |
| sort | `ValueArray.sort(compare_func: GLib.CompareFunc) -> ValueArray` | g_value_array_sort |  | Sort @value_array using @compare_func to compare the elements according to the semantics of #GCompareFunc. The current implementation uses the same... |
| sort_with_data | `ValueArray.sort_with_data(compare_func: GLib.CompareDataFunc, user_data: gpointer?) -> ValueArray` | g_value_array_sort_with_data |  | Sort @value_array using @compare_func to compare the elements according to the semantics of #GCompareDataFunc. The current implementation uses the ... |

### GObject.WeakRef

C type: `GWeakRef`

A structure containing a weak reference to a #GObject. A `GWeakRef` can either be empty (i.e. point to %NULL), or point to an object for as long as...

#### Fields

| Field | Type |
| --- | --- |
| p | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| clear | `WeakRef.clear() -> none` | g_weak_ref_clear | 2.32 | Frees resources associated with a non-statically-allocated #GWeakRef. After this call, the #GWeakRef is left in an undefined state. You should only... |
| get | `WeakRef.get() -> Object` | g_weak_ref_get | 2.32 | If @weak_ref is not empty, atomically acquire a strong reference to the object it points to, and return that reference. This function is needed bec... |
| init | `WeakRef.init(object: Object?) -> none` | g_weak_ref_init | 2.32 | Initialise a non-statically-allocated #GWeakRef. This function also calls g_weak_ref_set() with @object on the freshly-initialised weak reference. ... |
| set | `WeakRef.set(object: Object?) -> none` | g_weak_ref_set | 2.32 | Change the object to which @weak_ref points, or set it to %NULL. You must own a strong reference on @object while calling this function. |

## Unions

### GObject._Value__data__union

#### Fields

| Field | Type |
| --- | --- |
| v_double | gdouble |
| v_float | gfloat |
| v_int | gint |
| v_int64 | gint64 |
| v_long | glong |
| v_pointer | gpointer |
| v_uint | guint |
| v_uint64 | guint64 |
| v_ulong | gulong |

### GObject.priv

C type: `priv`

#### Fields

| Field | Type |
| --- | --- |
| p | gpointer |

### GObject.TypeCValue

C type: `GTypeCValue`

A union holding one collected value.

#### Fields

| Field | Type |
| --- | --- |
| v_double | gdouble |
| v_int | gint |
| v_int64 | gint64 |
| v_long | glong |
| v_pointer | gpointer |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| boxed_copy | `boxed_copy(boxed_type: GType, src_boxed: gpointer) -> gpointer` | g_boxed_copy |  | Provide a copy of a boxed structure @src_boxed which is of type @boxed_type. |
| boxed_free | `boxed_free(boxed_type: GType, boxed: gpointer) -> none` | g_boxed_free |  | Free the boxed structure @boxed which is of type @boxed_type. |
| boxed_type_register_static | `boxed_type_register_static(name: utf8, boxed_copy: BoxedCopyFunc, boxed_free: BoxedFreeFunc) -> GType` | g_boxed_type_register_static |  | This function creates a new %G_TYPE_BOXED derived type id for a new boxed type with name @name. Boxed type handling functions have to be provided t... |
| cclosure_marshal_BOOLEAN__BOXED_BOXED | `cclosure_marshal_BOOLEAN__BOXED_BOXED(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_BOOLEAN__BOXED_BOXED |  | A #GClosureMarshal function for use with signals with handlers that take two boxed pointers as arguments and return a boolean. If you have such a s... |
| cclosure_marshal_BOOLEAN__FLAGS | `cclosure_marshal_BOOLEAN__FLAGS(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_BOOLEAN__FLAGS |  | A #GClosureMarshal function for use with signals with handlers that take a flags type as an argument and return a boolean. If you have such a signa... |
| cclosure_marshal_generic | `cclosure_marshal_generic(closure: Closure, return_gvalue: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_generic | 2.30 | A generic marshaller function implemented via libffi. Normally this function is not passed explicitly to g_signal_new(), but used automatically by ... |
| cclosure_marshal_STRING__OBJECT_POINTER | `cclosure_marshal_STRING__OBJECT_POINTER(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_STRING__OBJECT_POINTER |  | A #GClosureMarshal function for use with signals with handlers that take a #GObject and a pointer and produce a string. It is highly unlikely that ... |
| cclosure_marshal_VOID__BOOLEAN | `cclosure_marshal_VOID__BOOLEAN(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__BOOLEAN |  | A #GClosureMarshal function for use with signals with a single boolean argument. |
| cclosure_marshal_VOID__BOXED | `cclosure_marshal_VOID__BOXED(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__BOXED |  | A #GClosureMarshal function for use with signals with a single argument which is any boxed pointer type. |
| cclosure_marshal_VOID__CHAR | `cclosure_marshal_VOID__CHAR(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__CHAR |  | A #GClosureMarshal function for use with signals with a single character argument. |
| cclosure_marshal_VOID__DOUBLE | `cclosure_marshal_VOID__DOUBLE(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__DOUBLE |  | A #GClosureMarshal function for use with signals with one double-precision floating point argument. |
| cclosure_marshal_VOID__ENUM | `cclosure_marshal_VOID__ENUM(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__ENUM |  | A #GClosureMarshal function for use with signals with a single argument with an enumerated type. |
| cclosure_marshal_VOID__FLAGS | `cclosure_marshal_VOID__FLAGS(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__FLAGS |  | A #GClosureMarshal function for use with signals with a single argument with a flags types. |
| cclosure_marshal_VOID__FLOAT | `cclosure_marshal_VOID__FLOAT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__FLOAT |  | A #GClosureMarshal function for use with signals with one single-precision floating point argument. |
| cclosure_marshal_VOID__INT | `cclosure_marshal_VOID__INT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__INT |  | A #GClosureMarshal function for use with signals with a single integer argument. |
| cclosure_marshal_VOID__LONG | `cclosure_marshal_VOID__LONG(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__LONG |  | A #GClosureMarshal function for use with signals with with a single long integer argument. |
| cclosure_marshal_VOID__OBJECT | `cclosure_marshal_VOID__OBJECT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__OBJECT |  | A #GClosureMarshal function for use with signals with a single #GObject argument. |
| cclosure_marshal_VOID__PARAM | `cclosure_marshal_VOID__PARAM(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__PARAM |  | A #GClosureMarshal function for use with signals with a single argument of type #GParamSpec. |
| cclosure_marshal_VOID__POINTER | `cclosure_marshal_VOID__POINTER(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__POINTER |  | A #GClosureMarshal function for use with signals with a single raw pointer argument type. If it is possible, it is better to use one of the more sp... |
| cclosure_marshal_VOID__STRING | `cclosure_marshal_VOID__STRING(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__STRING |  | A #GClosureMarshal function for use with signals with a single string argument. |
| cclosure_marshal_VOID__UCHAR | `cclosure_marshal_VOID__UCHAR(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__UCHAR |  | A #GClosureMarshal function for use with signals with a single unsigned character argument. |
| cclosure_marshal_VOID__UINT | `cclosure_marshal_VOID__UINT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__UINT |  | A #GClosureMarshal function for use with signals with with a single unsigned integer argument. |
| cclosure_marshal_VOID__UINT_POINTER | `cclosure_marshal_VOID__UINT_POINTER(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__UINT_POINTER |  | A #GClosureMarshal function for use with signals with an unsigned int and a pointer as arguments. |
| cclosure_marshal_VOID__ULONG | `cclosure_marshal_VOID__ULONG(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__ULONG |  | A #GClosureMarshal function for use with signals with a single unsigned long integer argument. |
| cclosure_marshal_VOID__VARIANT | `cclosure_marshal_VOID__VARIANT(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__VARIANT |  | A #GClosureMarshal function for use with signals with a single #GVariant argument. |
| cclosure_marshal_VOID__VOID | `cclosure_marshal_VOID__VOID(closure: Closure, return_value: Value, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | g_cclosure_marshal_VOID__VOID |  | A #GClosureMarshal function for use with signals with no arguments. |
| cclosure_new | `cclosure_new(callback_func: Callback?, user_data: gpointer?, destroy_data: ClosureNotify) -> Closure` | g_cclosure_new |  | Creates a new closure which invokes @callback_func with @user_data as the last parameter. @destroy_data will be called as a finalize notifier on th... |
| cclosure_new_object | `cclosure_new_object(callback_func: Callback, object: Object) -> Closure` | g_cclosure_new_object |  | A variant of g_cclosure_new() which uses @object as @user_data and calls g_object_watch_closure() on @object and the created closure. This function... |
| cclosure_new_object_swap | `cclosure_new_object_swap(callback_func: Callback, object: Object) -> Closure` | g_cclosure_new_object_swap |  | A variant of g_cclosure_new_swap() which uses @object as @user_data and calls g_object_watch_closure() on @object and the created closure. This fun... |
| cclosure_new_swap | `cclosure_new_swap(callback_func: Callback?, user_data: gpointer?, destroy_data: ClosureNotify) -> Closure` | g_cclosure_new_swap |  | Creates a new closure which invokes @callback_func with @user_data as the first parameter. @destroy_data will be called as a finalize notifier on t... |
| clear_object | `clear_object(object_ptr: Object) -> none` | g_clear_object | 2.28 | Clears a reference to a #GObject. @object_ptr must not be %NULL. If the reference is %NULL then this function does nothing. Otherwise, the referenc... |
| clear_signal_handler | `clear_signal_handler(handler_id_ptr: gulong, instance: Object) -> none` | g_clear_signal_handler | 2.62 | Disconnects a handler from @instance so it will not be called during any future or currently ongoing emissions of the signal it has been connected ... |
| enum_complete_type_info | `enum_complete_type_info(g_enum_type: GType, info: out TypeInfo, const_values: EnumValue) -> none` | g_enum_complete_type_info |  | This function is meant to be called from the `complete_type_info` function of a #GTypePlugin implementation, as in the following example: \|[<!-- la... |
| enum_get_value | `enum_get_value(enum_class: EnumClass, value: gint) -> EnumValue` | g_enum_get_value |  | Returns the #GEnumValue for a value. |
| enum_get_value_by_name | `enum_get_value_by_name(enum_class: EnumClass, name: utf8) -> EnumValue` | g_enum_get_value_by_name |  | Looks up a #GEnumValue by name. |
| enum_get_value_by_nick | `enum_get_value_by_nick(enum_class: EnumClass, nick: utf8) -> EnumValue` | g_enum_get_value_by_nick |  | Looks up a #GEnumValue by nickname. |
| enum_register_static | `enum_register_static(name: utf8, const_static_values: EnumValue) -> GType` | g_enum_register_static |  | Registers a new static enumeration type with the name @name. It is normally more convenient to let [glib-mkenums][glib-mkenums], generate a my_enum... |
| enum_to_string | `enum_to_string(g_enum_type: GType, value: gint) -> utf8` | g_enum_to_string | 2.54 | Pretty-prints @value in the form of the enum???s name. This is intended to be used for debugging purposes. The format of the output may change in t... |
| flags_complete_type_info | `flags_complete_type_info(g_flags_type: GType, info: out TypeInfo, const_values: FlagsValue) -> none` | g_flags_complete_type_info |  | This function is meant to be called from the complete_type_info() function of a #GTypePlugin implementation, see the example for g_enum_complete_ty... |
| flags_get_first_value | `flags_get_first_value(flags_class: FlagsClass, value: guint) -> FlagsValue` | g_flags_get_first_value |  | Returns the first #GFlagsValue which is set in @value. |
| flags_get_value_by_name | `flags_get_value_by_name(flags_class: FlagsClass, name: utf8) -> FlagsValue` | g_flags_get_value_by_name |  | Looks up a #GFlagsValue by name. |
| flags_get_value_by_nick | `flags_get_value_by_nick(flags_class: FlagsClass, nick: utf8) -> FlagsValue` | g_flags_get_value_by_nick |  | Looks up a #GFlagsValue by nickname. |
| flags_register_static | `flags_register_static(name: utf8, const_static_values: FlagsValue) -> GType` | g_flags_register_static |  | Registers a new static flags type with the name @name. It is normally more convenient to let [glib-mkenums][glib-mkenums] generate a my_flags_get_t... |
| flags_to_string | `flags_to_string(flags_type: GType, value: guint) -> utf8` | g_flags_to_string | 2.54 | Pretty-prints @value in the form of the flag names separated by ` \| ` and sorted. Any extra bits will be shown at the end as a hexadecimal number. ... |
| gtype_get_type | `gtype_get_type() -> GType` | g_gtype_get_type |  |  |
| param_spec_boolean | `param_spec_boolean(name: utf8, nick: utf8?, blurb: utf8?, default_value: gboolean, flags: ParamFlags) -> ParamSpec` | g_param_spec_boolean |  | Creates a new #GParamSpecBoolean instance specifying a %G_TYPE_BOOLEAN property. In many cases, it may be more appropriate to use an enum with g_pa... |
| param_spec_boxed | `param_spec_boxed(name: utf8, nick: utf8?, blurb: utf8?, boxed_type: GType, flags: ParamFlags) -> ParamSpec` | g_param_spec_boxed |  | Creates a new #GParamSpecBoxed instance specifying a %G_TYPE_BOXED derived property. See g_param_spec_internal() for details on property names. |
| param_spec_char | `param_spec_char(name: utf8, nick: utf8?, blurb: utf8?, minimum: gint8, maximum: gint8, default_value: gint8, flags: ParamFlags) -> ParamSpec` | g_param_spec_char |  | Creates a new #GParamSpecChar instance specifying a %G_TYPE_CHAR property. |
| param_spec_double | `param_spec_double(name: utf8, nick: utf8?, blurb: utf8?, minimum: gdouble, maximum: gdouble, default_value: gdouble, flags: ParamFlags) -> ParamSpec` | g_param_spec_double |  | Creates a new #GParamSpecDouble instance specifying a %G_TYPE_DOUBLE property. See g_param_spec_internal() for details on property names. |
| param_spec_enum | `param_spec_enum(name: utf8, nick: utf8?, blurb: utf8?, enum_type: GType, default_value: gint, flags: ParamFlags) -> ParamSpec` | g_param_spec_enum |  | Creates a new #GParamSpecEnum instance specifying a %G_TYPE_ENUM property. See g_param_spec_internal() for details on property names. |
| param_spec_flags | `param_spec_flags(name: utf8, nick: utf8?, blurb: utf8?, flags_type: GType, default_value: guint, flags: ParamFlags) -> ParamSpec` | g_param_spec_flags |  | Creates a new #GParamSpecFlags instance specifying a %G_TYPE_FLAGS property. See g_param_spec_internal() for details on property names. |
| param_spec_float | `param_spec_float(name: utf8, nick: utf8?, blurb: utf8?, minimum: gfloat, maximum: gfloat, default_value: gfloat, flags: ParamFlags) -> ParamSpec` | g_param_spec_float |  | Creates a new #GParamSpecFloat instance specifying a %G_TYPE_FLOAT property. See g_param_spec_internal() for details on property names. |
| param_spec_gtype | `param_spec_gtype(name: utf8, nick: utf8?, blurb: utf8?, is_a_type: GType, flags: ParamFlags) -> ParamSpec` | g_param_spec_gtype | 2.10 | Creates a new #GParamSpecGType instance specifying a %G_TYPE_GTYPE property. See g_param_spec_internal() for details on property names. |
| param_spec_int | `param_spec_int(name: utf8, nick: utf8?, blurb: utf8?, minimum: gint, maximum: gint, default_value: gint, flags: ParamFlags) -> ParamSpec` | g_param_spec_int |  | Creates a new #GParamSpecInt instance specifying a %G_TYPE_INT property. See g_param_spec_internal() for details on property names. |
| param_spec_int64 | `param_spec_int64(name: utf8, nick: utf8?, blurb: utf8?, minimum: gint64, maximum: gint64, default_value: gint64, flags: ParamFlags) -> ParamSpec` | g_param_spec_int64 |  | Creates a new #GParamSpecInt64 instance specifying a %G_TYPE_INT64 property. See g_param_spec_internal() for details on property names. |
| param_spec_long | `param_spec_long(name: utf8, nick: utf8?, blurb: utf8?, minimum: glong, maximum: glong, default_value: glong, flags: ParamFlags) -> ParamSpec` | g_param_spec_long |  | Creates a new #GParamSpecLong instance specifying a %G_TYPE_LONG property. See g_param_spec_internal() for details on property names. |
| param_spec_object | `param_spec_object(name: utf8, nick: utf8?, blurb: utf8?, object_type: GType, flags: ParamFlags) -> ParamSpec` | g_param_spec_object |  | Creates a new #GParamSpecBoxed instance specifying a %G_TYPE_OBJECT derived property. See g_param_spec_internal() for details on property names. |
| param_spec_override | `param_spec_override(name: utf8, overridden: ParamSpec) -> ParamSpec` | g_param_spec_override | 2.4 | Creates a new property of type #GParamSpecOverride. This is used to direct operations to another paramspec, and will not be directly useful unless ... |
| param_spec_param | `param_spec_param(name: utf8, nick: utf8?, blurb: utf8?, param_type: GType, flags: ParamFlags) -> ParamSpec` | g_param_spec_param |  | Creates a new #GParamSpecParam instance specifying a %G_TYPE_PARAM property. See g_param_spec_internal() for details on property names. |
| param_spec_pointer | `param_spec_pointer(name: utf8, nick: utf8?, blurb: utf8?, flags: ParamFlags) -> ParamSpec` | g_param_spec_pointer |  | Creates a new #GParamSpecPointer instance specifying a pointer property. Where possible, it is better to use g_param_spec_object() or g_param_spec_... |
| param_spec_string | `param_spec_string(name: utf8, nick: utf8?, blurb: utf8?, default_value: utf8?, flags: ParamFlags) -> ParamSpec` | g_param_spec_string |  | Creates a new #GParamSpecString instance. See g_param_spec_internal() for details on property names. |
| param_spec_uchar | `param_spec_uchar(name: utf8, nick: utf8?, blurb: utf8?, minimum: guint8, maximum: guint8, default_value: guint8, flags: ParamFlags) -> ParamSpec` | g_param_spec_uchar |  | Creates a new #GParamSpecUChar instance specifying a %G_TYPE_UCHAR property. |
| param_spec_uint | `param_spec_uint(name: utf8, nick: utf8?, blurb: utf8?, minimum: guint, maximum: guint, default_value: guint, flags: ParamFlags) -> ParamSpec` | g_param_spec_uint |  | Creates a new #GParamSpecUInt instance specifying a %G_TYPE_UINT property. See g_param_spec_internal() for details on property names. |
| param_spec_uint64 | `param_spec_uint64(name: utf8, nick: utf8?, blurb: utf8?, minimum: guint64, maximum: guint64, default_value: guint64, flags: ParamFlags) -> ParamSpec` | g_param_spec_uint64 |  | Creates a new #GParamSpecUInt64 instance specifying a %G_TYPE_UINT64 property. See g_param_spec_internal() for details on property names. |
| param_spec_ulong | `param_spec_ulong(name: utf8, nick: utf8?, blurb: utf8?, minimum: gulong, maximum: gulong, default_value: gulong, flags: ParamFlags) -> ParamSpec` | g_param_spec_ulong |  | Creates a new #GParamSpecULong instance specifying a %G_TYPE_ULONG property. See g_param_spec_internal() for details on property names. |
| param_spec_unichar | `param_spec_unichar(name: utf8, nick: utf8?, blurb: utf8?, default_value: gunichar, flags: ParamFlags) -> ParamSpec` | g_param_spec_unichar |  | Creates a new #GParamSpecUnichar instance specifying a %G_TYPE_UINT property. #GValue structures for this property can be accessed with g_value_set... |
| param_spec_value_array | `param_spec_value_array(name: utf8, nick: utf8?, blurb: utf8?, element_spec: ParamSpec, flags: ParamFlags) -> ParamSpec` | g_param_spec_value_array |  | Creates a new #GParamSpecValueArray instance specifying a %G_TYPE_VALUE_ARRAY property. %G_TYPE_VALUE_ARRAY is a %G_TYPE_BOXED type, as such, #GVal... |
| param_spec_variant | `param_spec_variant(name: utf8, nick: utf8?, blurb: utf8?, type: GLib.VariantType, default_value: GLib.Variant?, flags: ParamFlags) -> ParamSpec` | g_param_spec_variant | 2.26 | Creates a new #GParamSpecVariant instance specifying a #GVariant property. If @default_value is floating, it is consumed. See g_param_spec_internal... |
| param_type_register_static | `param_type_register_static(name: utf8, pspec_info: ParamSpecTypeInfo) -> GType` | g_param_type_register_static |  | Registers @name as the name of a new static type derived from %G_TYPE_PARAM. The type system uses the information contained in the #GParamSpecTypeI... |
| param_value_convert | `param_value_convert(pspec: ParamSpec, src_value: Value, dest_value: Value, strict_validation: gboolean) -> gboolean` | g_param_value_convert |  | Transforms @src_value into @dest_value if possible, and then validates @dest_value, in order for it to conform to @pspec. If @strict_validation is ... |
| param_value_defaults | `param_value_defaults(pspec: ParamSpec, value: Value) -> gboolean` | g_param_value_defaults |  | Checks whether @value contains the default value as specified in @pspec. |
| param_value_is_valid | `param_value_is_valid(pspec: ParamSpec, value: Value) -> gboolean` | g_param_value_is_valid | 2.74 | Return whether the contents of @value comply with the specifications set out by @pspec. |
| param_value_set_default | `param_value_set_default(pspec: ParamSpec, value: Value) -> none` | g_param_value_set_default |  | Sets @value to its default value as specified in @pspec. |
| param_value_validate | `param_value_validate(pspec: ParamSpec, value: Value) -> gboolean` | g_param_value_validate |  | Ensures that the contents of @value comply with the specifications set out by @pspec. For example, a #GParamSpecInt might require that integers sto... |
| param_values_cmp | `param_values_cmp(pspec: ParamSpec, value1: Value, value2: Value) -> gint` | g_param_values_cmp |  | Compares @value1 with @value2 according to @pspec, and return -1, 0 or +1, if @value1 is found to be less than, equal to or greater than @value2, r... |
| pointer_type_register_static | `pointer_type_register_static(name: utf8) -> GType` | g_pointer_type_register_static |  | Creates a new %G_TYPE_POINTER derived type id for a new pointer type with name @name. |
| set_closure | `set_closure(source: GLib.Source, closure: Closure) -> none` | g_source_set_closure |  | Set the callback for a source as a #GClosure. If the source is not one of the standard GLib types, the @closure_callback and @closure_marshal field... |
| set_dummy_callback | `set_dummy_callback(source: GLib.Source) -> none` | g_source_set_dummy_callback |  | Sets a dummy callback for @source. The callback will do nothing, and if the source expects a #gboolean return value, it will return %TRUE. (If the ... |
| signal_accumulator_first_wins | `signal_accumulator_first_wins(ihint: SignalInvocationHint, return_accu: Value, handler_return: Value, dummy: gpointer?) -> gboolean` | g_signal_accumulator_first_wins | 2.28 | A predefined #GSignalAccumulator for signals intended to be used as a hook for application code to provide a particular value. Usually only one suc... |
| signal_accumulator_true_handled | `signal_accumulator_true_handled(ihint: SignalInvocationHint, return_accu: Value, handler_return: Value, dummy: gpointer?) -> gboolean` | g_signal_accumulator_true_handled | 2.4 | A predefined #GSignalAccumulator for signals that return a boolean values. The behavior that this accumulator gives is that a return of %TRUE stops... |
| signal_add_emission_hook | `signal_add_emission_hook(signal_id: guint, detail: GLib.Quark, hook_func: SignalEmissionHook, hook_data: gpointer?, data_destroy: GLib.DestroyNotify?) -> gulong` | g_signal_add_emission_hook |  | Adds an emission hook for a signal, which will get called for any emission of that signal, independent of the instance. This is possible only for s... |
| signal_chain_from_overridden | `signal_chain_from_overridden(instance_and_params: Value, return_value: Value) -> none` | g_signal_chain_from_overridden |  | Calls the original class closure of a signal. This function should only be called from an overridden class closure; see g_signal_override_class_clo... |
| signal_chain_from_overridden_handler | `signal_chain_from_overridden_handler(instance: TypeInstance, ...: void) -> none` | g_signal_chain_from_overridden_handler | 2.18 | Calls the original class closure of a signal. This function should only be called from an overridden class closure; see g_signal_override_class_clo... |
| signal_connect_closure | `signal_connect_closure(instance: Object, detailed_signal: utf8, closure: Closure, after: gboolean) -> gulong` | g_signal_connect_closure |  | Connects a closure to a signal for a particular object. If @closure is a floating reference (see g_closure_sink()), this function takes ownership o... |
| signal_connect_closure_by_id | `signal_connect_closure_by_id(instance: Object, signal_id: guint, detail: GLib.Quark, closure: Closure, after: gboolean) -> gulong` | g_signal_connect_closure_by_id |  | Connects a closure to a signal for a particular object. If @closure is a floating reference (see g_closure_sink()), this function takes ownership o... |
| signal_connect_data | `signal_connect_data(instance: Object, detailed_signal: utf8, c_handler: Callback, data: gpointer?, destroy_data: ClosureNotify?, connect_flags: ConnectFlags) -> gulong` | g_signal_connect_data |  | Connects a #GCallback function to a signal for a particular object. Similar to g_signal_connect(), but allows to provide a #GClosureNotify for the ... |
| signal_connect_object | `signal_connect_object(instance: TypeInstance, detailed_signal: utf8, c_handler: Callback, gobject: Object?, connect_flags: ConnectFlags) -> gulong` | g_signal_connect_object |  | This is similar to g_signal_connect_data(), but uses a closure which ensures that the @gobject stays alive during the call to @c_handler by tempora... |
| signal_emit | `signal_emit(instance: Object, signal_id: guint, detail: GLib.Quark, ...: void) -> none` | g_signal_emit |  | Emits a signal. Signal emission is done synchronously. The method will only return control after all handlers are called or signal emission was sto... |
| signal_emit_by_name | `signal_emit_by_name(instance: Object, detailed_signal: utf8, ...: void) -> none` | g_signal_emit_by_name |  | Emits a signal. Signal emission is done synchronously. The method will only return control after all handlers are called or signal emission was sto... |
| signal_emit_valist | `signal_emit_valist(instance: TypeInstance, signal_id: guint, detail: GLib.Quark, var_args: va_list) -> none` | g_signal_emit_valist |  | Emits a signal. Signal emission is done synchronously. The method will only return control after all handlers are called or signal emission was sto... |
| signal_emitv | `signal_emitv(instance_and_params: Value, signal_id: guint, detail: GLib.Quark, return_value: inout Value?) -> none` | g_signal_emitv |  | Emits a signal. Signal emission is done synchronously. The method will only return control after all handlers are called or signal emission was sto... |
| signal_get_invocation_hint | `signal_get_invocation_hint(instance: Object) -> SignalInvocationHint` | g_signal_get_invocation_hint |  | Returns the invocation hint of the innermost signal emission of instance. |
| signal_handler_block | `signal_handler_block(instance: Object, handler_id: gulong) -> none` | g_signal_handler_block |  | Blocks a handler of an instance so it will not be called during any signal emissions unless it is unblocked again. Thus "blocking" a signal handler... |
| signal_handler_disconnect | `signal_handler_disconnect(instance: Object, handler_id: gulong) -> none` | g_signal_handler_disconnect |  | Disconnects a handler from an instance so it will not be called during any future or currently ongoing emissions of the signal it has been connecte... |
| signal_handler_find | `signal_handler_find(instance: Object, mask: SignalMatchType, signal_id: guint, detail: GLib.Quark, closure: Closure?, func: gpointer?, data: gpointer?) -> gulong` | g_signal_handler_find |  | Finds the first signal handler that matches certain selection criteria. The criteria mask is passed as an OR-ed combination of #GSignalMatchType fl... |
| signal_handler_is_connected | `signal_handler_is_connected(instance: Object, handler_id: gulong) -> gboolean` | g_signal_handler_is_connected |  | Returns whether @handler_id is the ID of a handler connected to @instance. |
| signal_handler_unblock | `signal_handler_unblock(instance: Object, handler_id: gulong) -> none` | g_signal_handler_unblock |  | Undoes the effect of a previous g_signal_handler_block() call. A blocked handler is skipped during signal emissions and will not be invoked, unbloc... |
| signal_handlers_block_matched | `signal_handlers_block_matched(instance: Object, mask: SignalMatchType, signal_id: guint, detail: GLib.Quark, closure: Closure?, func: gpointer?, data: gpointer?) -> guint` | g_signal_handlers_block_matched |  | Blocks all handlers on an instance that match a certain selection criteria. The criteria mask is passed as a combination of #GSignalMatchType flags... |
| signal_handlers_destroy | `signal_handlers_destroy(instance: Object) -> none` | g_signal_handlers_destroy |  | Destroy all signal handlers of a type instance. This function is an implementation detail of the #GObject dispose implementation, and should not be... |
| signal_handlers_disconnect_matched | `signal_handlers_disconnect_matched(instance: Object, mask: SignalMatchType, signal_id: guint, detail: GLib.Quark, closure: Closure?, func: gpointer?, data: gpointer?) -> guint` | g_signal_handlers_disconnect_matched |  | Disconnects all handlers on an instance that match a certain selection criteria. The criteria mask is passed as a combination of #GSignalMatchType ... |
| signal_handlers_unblock_matched | `signal_handlers_unblock_matched(instance: Object, mask: SignalMatchType, signal_id: guint, detail: GLib.Quark, closure: Closure?, func: gpointer?, data: gpointer?) -> guint` | g_signal_handlers_unblock_matched |  | Unblocks all handlers on an instance that match a certain selection criteria. The criteria mask is passed as a combination of #GSignalMatchType fla... |
| signal_has_handler_pending | `signal_has_handler_pending(instance: Object, signal_id: guint, detail: GLib.Quark, may_be_blocked: gboolean) -> gboolean` | g_signal_has_handler_pending |  | Returns whether there are any handlers connected to @instance for the given signal id and detail. If @detail is 0 then it will only match handlers ... |
| signal_is_valid_name | `signal_is_valid_name(name: utf8) -> gboolean` | g_signal_is_valid_name | 2.66 | Validate a signal name. This can be useful for dynamically-generated signals which need to be validated at run-time before actually trying to creat... |
| signal_list_ids | `signal_list_ids(itype: GType, n_ids: out guint) -> guint` | g_signal_list_ids |  | Lists the signals by id that a certain instance or interface type created. Further information about the signals can be acquired through g_signal_q... |
| signal_lookup | `signal_lookup(name: utf8, itype: GType) -> guint` | g_signal_lookup |  | Given the name of the signal and the type of object it connects to, gets the signal's identifying integer. Emitting the signal by number is somewha... |
| signal_name | `signal_name(signal_id: guint) -> utf8` | g_signal_name |  | Given the signal's identifier, finds its name. Two different signals may have the same name, if they have differing types. |
| signal_new | `signal_new(signal_name: utf8, itype: GType, signal_flags: SignalFlags, class_offset: guint, accumulator: SignalAccumulator?, accu_data: gpointer?, c_marshaller: SignalCMarshaller?, return_type: GType, n_params: guint, ...: void) -> guint` | g_signal_new |  | Creates a new signal. (This is usually done in the class initializer.) A signal name consists of segments consisting of ASCII letters and digits, s... |
| signal_new_class_handler | `signal_new_class_handler(signal_name: utf8, itype: GType, signal_flags: SignalFlags, class_handler: Callback?, accumulator: SignalAccumulator?, accu_data: gpointer?, c_marshaller: SignalCMarshaller?, return_type: GType, n_params: guint, ...: void) -> guint` | g_signal_new_class_handler | 2.18 | Creates a new signal. (This is usually done in the class initializer.) This is a variant of g_signal_new() that takes a C callback instead of a cla... |
| signal_new_valist | `signal_new_valist(signal_name: utf8, itype: GType, signal_flags: SignalFlags, class_closure: Closure?, accumulator: SignalAccumulator?, accu_data: gpointer?, c_marshaller: SignalCMarshaller?, return_type: GType, n_params: guint, args: va_list) -> guint` | g_signal_new_valist |  | Creates a new signal. (This is usually done in the class initializer.) See g_signal_new() for details on allowed signal names. If c_marshaller is %... |
| signal_newv | `signal_newv(signal_name: utf8, itype: GType, signal_flags: SignalFlags, class_closure: Closure?, accumulator: SignalAccumulator?, accu_data: gpointer?, c_marshaller: SignalCMarshaller?, return_type: GType, n_params: guint, param_types: GType?) -> guint` | g_signal_newv |  | Creates a new signal. (This is usually done in the class initializer.) See g_signal_new() for details on allowed signal names. If c_marshaller is %... |
| signal_override_class_closure | `signal_override_class_closure(signal_id: guint, instance_type: GType, class_closure: Closure) -> none` | g_signal_override_class_closure |  | Overrides the class closure (i.e. the default handler) for the given signal for emissions on instances of @instance_type. @instance_type must be de... |
| signal_override_class_handler | `signal_override_class_handler(signal_name: utf8, instance_type: GType, class_handler: Callback) -> none` | g_signal_override_class_handler | 2.18 | Overrides the class closure (i.e. the default handler) for the given signal for emissions on instances of @instance_type with callback @class_handl... |
| signal_parse_name | `signal_parse_name(detailed_signal: utf8, itype: GType, signal_id_p: out guint, detail_p: out GLib.Quark, force_detail_quark: gboolean) -> gboolean` | g_signal_parse_name |  | Internal function to parse a signal name into its @signal_id and @detail quark. |
| signal_query | `signal_query(signal_id: guint, query: out SignalQuery) -> none` | g_signal_query |  | Queries the signal system for in-depth information about a specific signal. This function will fill in a user-provided structure to hold signal-spe... |
| signal_remove_emission_hook | `signal_remove_emission_hook(signal_id: guint, hook_id: gulong) -> none` | g_signal_remove_emission_hook |  | Deletes an emission hook. |
| signal_set_va_marshaller | `signal_set_va_marshaller(signal_id: guint, instance_type: GType, va_marshaller: SignalCVaMarshaller) -> none` | g_signal_set_va_marshaller | 2.32 | Change the #GSignalCVaMarshaller used for a given signal. This is a specialised form of the marshaller that can often be used for the common case o... |
| signal_stop_emission | `signal_stop_emission(instance: Object, signal_id: guint, detail: GLib.Quark) -> none` | g_signal_stop_emission |  | Stops a signal's current emission. This will prevent the default method from running, if the signal was %G_SIGNAL_RUN_LAST and you connected normal... |
| signal_stop_emission_by_name | `signal_stop_emission_by_name(instance: Object, detailed_signal: utf8) -> none` | g_signal_stop_emission_by_name |  | Stops a signal's current emission. This is just like g_signal_stop_emission() except it will look up the signal id for you. |
| signal_type_cclosure_new | `signal_type_cclosure_new(itype: GType, struct_offset: guint) -> Closure` | g_signal_type_cclosure_new |  | Creates a new closure which invokes the function found at the offset @struct_offset in the class structure of the interface or classed type identif... |
| source_set_closure | `source_set_closure(source: GLib.Source, closure: Closure) -> none` | g_source_set_closure |  | Set the callback for a source as a #GClosure. If the source is not one of the standard GLib types, the @closure_callback and @closure_marshal field... |
| source_set_dummy_callback | `source_set_dummy_callback(source: GLib.Source) -> none` | g_source_set_dummy_callback |  | Sets a dummy callback for @source. The callback will do nothing, and if the source expects a #gboolean return value, it will return %TRUE. (If the ... |
| strdup_value_contents | `strdup_value_contents(value: Value) -> utf8` | g_strdup_value_contents |  | Return a newly allocated string, which describes the contents of a #GValue. The main purpose of this function is to describe #GValue contents for d... |
| type_add_class_cache_func | `type_add_class_cache_func(cache_data: gpointer?, cache_func: TypeClassCacheFunc) -> none` | g_type_add_class_cache_func |  | Adds a #GTypeClassCacheFunc to be called before the reference count of a class goes from one to zero. This can be used to prevent premature class d... |
| type_add_class_private | `type_add_class_private(class_type: GType, private_size: gsize) -> none` | g_type_add_class_private | 2.24 | Registers a private class structure for a classed type; when the class is allocated, the private structures for the class and all of its parent typ... |
| type_add_instance_private | `type_add_instance_private(class_type: GType, private_size: gsize) -> gint` | g_type_add_instance_private |  |  |
| type_add_interface_check | `type_add_interface_check(check_data: gpointer?, check_func: TypeInterfaceCheckFunc) -> none` | g_type_add_interface_check | 2.4 | Adds a function to be called after an interface vtable is initialized for any class (i.e. after the @interface_init member of #GInterfaceInfo has b... |
| type_add_interface_dynamic | `type_add_interface_dynamic(instance_type: GType, interface_type: GType, plugin: TypePlugin) -> none` | g_type_add_interface_dynamic |  | Adds @interface_type to the dynamic @instance_type. The information contained in the #GTypePlugin structure pointed to by @plugin is used to manage... |
| type_add_interface_static | `type_add_interface_static(instance_type: GType, interface_type: GType, info: InterfaceInfo) -> none` | g_type_add_interface_static |  | Adds @interface_type to the static @instance_type. The information contained in the #GInterfaceInfo structure pointed to by @info is used to manage... |
| type_check_class_cast | `type_check_class_cast(g_class: TypeClass, is_a_type: GType) -> TypeClass` | g_type_check_class_cast |  |  |
| type_check_class_is_a | `type_check_class_is_a(g_class: TypeClass, is_a_type: GType) -> gboolean` | g_type_check_class_is_a |  |  |
| type_check_instance | `type_check_instance(instance: TypeInstance) -> gboolean` | g_type_check_instance |  | Private helper function to aid implementation of the G_TYPE_CHECK_INSTANCE() macro. |
| type_check_instance_cast | `type_check_instance_cast(instance: TypeInstance, iface_type: GType) -> TypeInstance` | g_type_check_instance_cast |  |  |
| type_check_instance_is_a | `type_check_instance_is_a(instance: TypeInstance, iface_type: GType) -> gboolean` | g_type_check_instance_is_a |  |  |
| type_check_instance_is_fundamentally_a | `type_check_instance_is_fundamentally_a(instance: TypeInstance, fundamental_type: GType) -> gboolean` | g_type_check_instance_is_fundamentally_a |  |  |
| type_check_is_value_type | `type_check_is_value_type(type: GType) -> gboolean` | g_type_check_is_value_type |  |  |
| type_check_value | `type_check_value(value: Value) -> gboolean` | g_type_check_value |  |  |
| type_check_value_holds | `type_check_value_holds(value: Value, type: GType) -> gboolean` | g_type_check_value_holds |  |  |
| type_children | `type_children(type: GType, n_children: out guint?) -> GType` | g_type_children |  | Return a newly allocated and 0-terminated array of type IDs, listing the child types of @type. |
| type_class_adjust_private_offset | `type_class_adjust_private_offset(g_class: gpointer?, private_size_or_offset: gint) -> none` | g_type_class_adjust_private_offset |  |  |
| type_class_peek | `type_class_peek(type: GType) -> TypeClass` | g_type_class_peek |  | This function is essentially the same as g_type_class_ref(), except that the classes reference count isn't incremented. As a consequence, this func... |
| type_class_peek_static | `type_class_peek_static(type: GType) -> TypeClass` | g_type_class_peek_static | 2.4 | A more efficient version of g_type_class_peek() which works only for static types. |
| type_class_ref | `type_class_ref(type: GType) -> TypeClass` | g_type_class_ref |  | Increments the reference count of the class structure belonging to @type. This function will demand-create the class if it doesn't exist already. |
| type_create_instance | `type_create_instance(type: GType) -> TypeInstance` | g_type_create_instance |  | Creates and initializes an instance of @type if @type is valid and can be instantiated. The type system only performs basic allocation and structur... |
| type_default_interface_peek | `type_default_interface_peek(g_type: GType) -> TypeInterface` | g_type_default_interface_peek | 2.4 | If the interface type @g_type is currently in use, returns its default interface vtable. |
| type_default_interface_ref | `type_default_interface_ref(g_type: GType) -> TypeInterface` | g_type_default_interface_ref | 2.4 | Increments the reference count for the interface type @g_type, and returns the default interface vtable for the type. If the type is not currently ... |
| type_default_interface_unref | `type_default_interface_unref(g_iface: TypeInterface) -> none` | g_type_default_interface_unref | 2.4 | Decrements the reference count for the type corresponding to the interface default vtable @g_iface. If the type is dynamic, then when no one is usi... |
| type_depth | `type_depth(type: GType) -> guint` | g_type_depth |  | Returns the length of the ancestry of the passed in type. This includes the type itself, so that e.g. a fundamental type has depth 1. |
| type_ensure | `type_ensure(type: GType) -> none` | g_type_ensure | 2.34 | Ensures that the indicated @type has been registered with the type system, and its _class_init() method has been run. In theory, simply calling the... |
| type_free_instance | `type_free_instance(instance: TypeInstance) -> none` | g_type_free_instance |  | Frees an instance of a type, returning it to the instance pool for the type, if there is one. Like g_type_create_instance(), this function is reser... |
| type_from_name | `type_from_name(name: utf8) -> GType` | g_type_from_name |  | Look up the type ID from a given type name, returning 0 if no type has been registered under this name (this is the preferred method to find out by... |
| type_fundamental | `type_fundamental(type_id: GType) -> GType` | g_type_fundamental |  | Internal function, used to extract the fundamental type ID portion. Use G_TYPE_FUNDAMENTAL() instead. |
| type_fundamental_next | `type_fundamental_next() -> GType` | g_type_fundamental_next |  | Returns the next free fundamental type id which can be used to register a new fundamental type with g_type_register_fundamental(). The returned typ... |
| type_get_instance_count | `type_get_instance_count(type: GType) -> gint` | g_type_get_instance_count | 2.44 | Returns the number of instances allocated of the particular type; this is only available if GLib is built with debugging support and the `instance-... |
| type_get_plugin | `type_get_plugin(type: GType) -> TypePlugin` | g_type_get_plugin |  | Returns the #GTypePlugin structure for @type. |
| type_get_qdata | `type_get_qdata(type: GType, quark: GLib.Quark) -> gpointer` | g_type_get_qdata |  | Obtains data which has previously been attached to @type with g_type_set_qdata(). Note that this does not take subtyping into account; data attache... |
| type_get_type_registration_serial | `type_get_type_registration_serial() -> guint` | g_type_get_type_registration_serial | 2.36 | Returns an opaque serial number that represents the state of the set of registered types. Any time a type is registered this serial changes, which ... |
| type_init | `type_init() -> none` | g_type_init |  | This function used to initialise the type system. Since GLib 2.36, the type system is initialised automatically and this function does nothing. |
| type_init_with_debug_flags | `type_init_with_debug_flags(debug_flags: TypeDebugFlags) -> none` | g_type_init_with_debug_flags |  | This function used to initialise the type system with debugging flags. Since GLib 2.36, the type system is initialised automatically and this funct... |
| type_interface_add_prerequisite | `type_interface_add_prerequisite(interface_type: GType, prerequisite_type: GType) -> none` | g_type_interface_add_prerequisite |  | Adds @prerequisite_type to the list of prerequisites of @interface_type. This means that any type implementing @interface_type must also implement ... |
| type_interface_get_plugin | `type_interface_get_plugin(instance_type: GType, interface_type: GType) -> TypePlugin` | g_type_interface_get_plugin |  | Returns the #GTypePlugin structure for the dynamic interface @interface_type which has been added to @instance_type, or %NULL if @interface_type ha... |
| type_interface_instantiatable_prerequisite | `type_interface_instantiatable_prerequisite(interface_type: GType) -> GType` | g_type_interface_instantiatable_prerequisite | 2.68 | Returns the most specific instantiatable prerequisite of an interface type. If the interface type has no instantiatable prerequisite, %G_TYPE_INVAL... |
| type_interface_peek | `type_interface_peek(instance_class: TypeClass, iface_type: GType) -> TypeInterface` | g_type_interface_peek |  | Returns the #GTypeInterface structure of an interface to which the passed in class conforms. |
| type_interface_prerequisites | `type_interface_prerequisites(interface_type: GType, n_prerequisites: out guint?) -> GType` | g_type_interface_prerequisites | 2.2 | Returns the prerequisites of an interfaces type. |
| type_interfaces | `type_interfaces(type: GType, n_interfaces: out guint?) -> GType` | g_type_interfaces |  | Return a newly allocated and 0-terminated array of type IDs, listing the interface types that @type conforms to. |
| type_is_a | `type_is_a(type: GType, is_a_type: GType) -> gboolean` | g_type_is_a |  | If @is_a_type is a derivable type, check whether @type is a descendant of @is_a_type. If @is_a_type is an interface, check whether @type conforms t... |
| type_name | `type_name(type: GType) -> utf8` | g_type_name |  | Get the unique name that is assigned to a type ID. Note that this function (like all other GType API) cannot cope with invalid type IDs. %G_TYPE_IN... |
| type_name_from_class | `type_name_from_class(g_class: TypeClass) -> utf8` | g_type_name_from_class |  |  |
| type_name_from_instance | `type_name_from_instance(instance: TypeInstance) -> utf8` | g_type_name_from_instance |  |  |
| type_next_base | `type_next_base(leaf_type: GType, root_type: GType) -> GType` | g_type_next_base |  | Given a @leaf_type and a @root_type which is contained in its ancestry, return the type that @root_type is the immediate parent of. In other words,... |
| type_parent | `type_parent(type: GType) -> GType` | g_type_parent |  | Return the direct parent type of the passed in type. If the passed in type has no parent, i.e. is a fundamental type, 0 is returned. |
| type_qname | `type_qname(type: GType) -> GLib.Quark` | g_type_qname |  | Get the corresponding quark of the type IDs name. |
| type_query | `type_query(type: GType, query: out TypeQuery) -> none` | g_type_query |  | Queries the type system for information about a specific type. This function will fill in a user-provided structure to hold type-specific informati... |
| type_register_dynamic | `type_register_dynamic(parent_type: GType, type_name: utf8, plugin: TypePlugin, flags: TypeFlags) -> GType` | g_type_register_dynamic |  | Registers @type_name as the name of a new dynamic type derived from @parent_type. The type system uses the information contained in the #GTypePlugi... |
| type_register_fundamental | `type_register_fundamental(type_id: GType, type_name: utf8, info: TypeInfo, finfo: TypeFundamentalInfo, flags: TypeFlags) -> GType` | g_type_register_fundamental |  | Registers @type_id as the predefined identifier and @type_name as the name of a fundamental type. If @type_id is already registered, or a type name... |
| type_register_static | `type_register_static(parent_type: GType, type_name: utf8, info: TypeInfo, flags: TypeFlags) -> GType` | g_type_register_static |  | Registers @type_name as the name of a new static type derived from @parent_type. The type system uses the information contained in the #GTypeInfo s... |
| type_register_static_simple | `type_register_static_simple(parent_type: GType, type_name: utf8, class_size: guint, class_init: ClassInitFunc, instance_size: guint, instance_init: InstanceInitFunc, flags: TypeFlags) -> GType` | g_type_register_static_simple | 2.12 | Registers @type_name as the name of a new static type derived from @parent_type. The value of @flags determines the nature (e.g. abstract or not) o... |
| type_remove_class_cache_func | `type_remove_class_cache_func(cache_data: gpointer?, cache_func: TypeClassCacheFunc) -> none` | g_type_remove_class_cache_func |  | Removes a previously installed #GTypeClassCacheFunc. The cache maintained by @cache_func has to be empty when calling g_type_remove_class_cache_fun... |
| type_remove_interface_check | `type_remove_interface_check(check_data: gpointer?, check_func: TypeInterfaceCheckFunc) -> none` | g_type_remove_interface_check | 2.4 | Removes an interface check function added with g_type_add_interface_check(). |
| type_set_qdata | `type_set_qdata(type: GType, quark: GLib.Quark, data: gpointer?) -> none` | g_type_set_qdata |  | Attaches arbitrary data to a type. |
| type_test_flags | `type_test_flags(type: GType, flags: guint) -> gboolean` | g_type_test_flags |  |  |
| type_value_table_peek | `type_value_table_peek(type: GType) -> TypeValueTable` | g_type_value_table_peek |  | Returns the location of the #GTypeValueTable associated with @type. Note that this function should only be used from source code that implements or... |
| value_register_transform_func | `value_register_transform_func(src_type: GType, dest_type: GType, transform_func: ValueTransform) -> none` | g_value_register_transform_func |  | Registers a value transformation function for use in g_value_transform(). A previously registered transformation function for @src_type and @dest_t... |
| value_type_compatible | `value_type_compatible(src_type: GType, dest_type: GType) -> gboolean` | g_value_type_compatible |  | Returns whether a #GValue of type @src_type can be copied into a #GValue of type @dest_type. |
| value_type_transformable | `value_type_transformable(src_type: GType, dest_type: GType) -> gboolean` | g_value_type_transformable |  | Check whether g_value_transform() is able to transform values of type @src_type into values of type @dest_type. Note that for the types to be trans... |
| variant_get_gtype | `variant_get_gtype() -> GType` | g_variant_get_gtype |  |  |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| BaseFinalizeFunc | `BaseFinalizeFunc(g_class: TypeClass) -> none` |  |  | A callback function used by the type system to finalize those portions of a derived types class structure that were setup from the corresponding GB... |
| BaseInitFunc | `BaseInitFunc(g_class: TypeClass) -> none` |  |  | A callback function used by the type system to do base initialization of the class structures of derived types. This function is called as part of ... |
| BindingTransformFunc | `BindingTransformFunc(binding: Binding, from_value: Value, to_value: Value, user_data: gpointer?) -> gboolean` |  | 2.26 | A function to be called to transform @from_value to @to_value. If this is the @transform_to function of a binding, then @from_value is the @source_... |
| BoxedCopyFunc | `BoxedCopyFunc(boxed: gpointer) -> gpointer` |  |  | This function is provided by the user and should produce a copy of the passed in boxed structure. |
| BoxedFreeFunc | `BoxedFreeFunc(boxed: gpointer) -> none` |  |  | This function is provided by the user and should free the boxed structure passed. |
| Callback | `Callback() -> none` |  |  | The type used for callback functions in structure definitions and function signatures. This doesn't mean that all callback functions must take no p... |
| ClassFinalizeFunc | `ClassFinalizeFunc(g_class: TypeClass, class_data: gpointer?) -> none` |  |  | A callback function used by the type system to finalize a class. This function is rarely needed, as dynamically allocated class resources should be... |
| ClassInitFunc | `ClassInitFunc(g_class: TypeClass, class_data: gpointer?) -> none` |  |  | A callback function used by the type system to initialize the class of a specific type. This function should initialize all static class members. T... |
| ClosureMarshal | `ClosureMarshal(closure: Closure, return_value: Value?, n_param_values: guint, param_values: Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` |  |  | The type used for marshaller functions. |
| ClosureNotify | `ClosureNotify(data: gpointer?, closure: Closure) -> none` |  |  | The type used for the various notification callbacks which can be registered on closures. |
| InstanceInitFunc | `InstanceInitFunc(instance: TypeInstance, g_class: TypeClass) -> none` |  |  | A callback function used by the type system to initialize a new instance of a type. This function initializes all instance members and allocates an... |
| InterfaceFinalizeFunc | `InterfaceFinalizeFunc(g_iface: TypeInterface, iface_data: gpointer?) -> none` |  |  | A callback function used by the type system to finalize an interface. This function should destroy any internal data and release any resources allo... |
| InterfaceInitFunc | `InterfaceInitFunc(g_iface: TypeInterface, iface_data: gpointer?) -> none` |  |  | A callback function used by the type system to initialize a new interface. This function should initialize all internal data and* allocate any reso... |
| ObjectFinalizeFunc | `ObjectFinalizeFunc(object: Object) -> none` |  |  | The type of the @finalize function of #GObjectClass. |
| ObjectGetPropertyFunc | `ObjectGetPropertyFunc(object: Object, property_id: guint, value: Value, pspec: ParamSpec) -> none` |  |  | The type of the @get_property function of #GObjectClass. |
| ObjectSetPropertyFunc | `ObjectSetPropertyFunc(object: Object, property_id: guint, value: Value, pspec: ParamSpec) -> none` |  |  | The type of the @set_property function of #GObjectClass. |
| SignalAccumulator | `SignalAccumulator(ihint: SignalInvocationHint, return_accu: Value, handler_return: Value, data: gpointer?) -> gboolean` |  |  | The signal accumulator is a special callback function that can be used to collect return values of the various callbacks that are called during a s... |
| SignalEmissionHook | `SignalEmissionHook(ihint: SignalInvocationHint, n_param_values: guint, param_values: Value, data: gpointer?) -> gboolean` |  |  | A simple function pointer to get invoked when the signal is emitted. Emission hooks allow you to tie a hook to the signal type, so that it will tra... |
| ToggleNotify | `ToggleNotify(data: gpointer?, object: Object, is_last_ref: gboolean) -> none` |  |  | A callback function used for notification when the state of a toggle reference changes. See also: g_object_add_toggle_ref() |
| TypeClassCacheFunc | `TypeClassCacheFunc(cache_data: gpointer?, g_class: TypeClass) -> gboolean` |  |  | A callback function which is called when the reference count of a class drops to zero. It may use g_type_class_ref() to prevent the class from bein... |
| TypeInterfaceCheckFunc | `TypeInterfaceCheckFunc(check_data: gpointer?, g_iface: TypeInterface) -> none` |  | 2.4 | A callback called after an interface vtable is initialized. See g_type_add_interface_check(). |
| TypePluginCompleteInterfaceInfo | `TypePluginCompleteInterfaceInfo(plugin: TypePlugin, instance_type: GType, interface_type: GType, info: InterfaceInfo) -> none` |  |  | The type of the @complete_interface_info function of #GTypePluginClass. |
| TypePluginCompleteTypeInfo | `TypePluginCompleteTypeInfo(plugin: TypePlugin, g_type: GType, info: TypeInfo, value_table: TypeValueTable) -> none` |  |  | The type of the @complete_type_info function of #GTypePluginClass. |
| TypePluginUnuse | `TypePluginUnuse(plugin: TypePlugin) -> none` |  |  | The type of the @unuse_plugin function of #GTypePluginClass. |
| TypePluginUse | `TypePluginUse(plugin: TypePlugin) -> none` |  |  | The type of the @use_plugin function of #GTypePluginClass, which gets called to increase the use count of @plugin. |
| TypeValueCollectFunc | `TypeValueCollectFunc(value: Value, n_collect_values: guint, collect_values: TypeCValue, collect_flags: guint) -> utf8` |  | 2.78 | This function is responsible for converting the values collected from a variadic argument list into contents suitable for storage in a #GValue. Thi... |
| TypeValueCopyFunc | `TypeValueCopyFunc(src_value: Value, dest_value: out Value) -> none` |  | 2.78 | Copies the content of a #GValue into another. The @dest_value is a #GValue with zero-filled data section and @src_value is a properly initialized #... |
| TypeValueFreeFunc | `TypeValueFreeFunc(value: Value) -> none` |  | 2.78 | Frees any old contents that might be left in the `value->data` array of the given value. No resources may remain allocated through the #GValue cont... |
| TypeValueInitFunc | `TypeValueInitFunc(value: Value) -> none` |  | 2.78 | Initializes the value contents by setting the fields of the `value->data` array. The data array of the #GValue passed into this function was zero-f... |
| TypeValueLCopyFunc | `TypeValueLCopyFunc(value: Value, n_collect_values: guint, collect_values: TypeCValue, collect_flags: guint) -> utf8` |  | 2.78 | This function is responsible for storing the `value` contents into arguments passed through a variadic argument list which got collected into `coll... |
| TypeValuePeekPointerFunc | `TypeValuePeekPointerFunc(value: Value) -> gpointer` |  | 2.78 | If the value contents fit into a pointer, such as objects or strings, return this pointer, so the caller can peek at the current contents. To exten... |
| VaClosureMarshal | `VaClosureMarshal(closure: Closure, return_value: Value?, instance: TypeInstance, args: va_list, marshal_data: gpointer?, n_params: gint, param_types: GType) -> none` |  |  | This is the signature of va_list marshaller functions, an optional marshaller that can be used in some situations to avoid marshalling the signal a... |
| ValueTransform | `ValueTransform(src_value: Value, dest_value: Value) -> none` |  |  | The type of value transformation functions which can be registered with g_value_register_transform_func(). @dest_value will be initialized to the c... |
| WeakNotify | `WeakNotify(data: gpointer?, where_the_object_was: Object) -> none` |  |  | A #GWeakNotify function can be added to an object as a callback that gets triggered when the object is finalized. Since the object is already being... |

## Constants

| Name | Type |
| --- | --- |
| PARAM_MASK | gint |
| PARAM_STATIC_STRINGS | gint |
| PARAM_USER_SHIFT | gint |
| SIGNAL_FLAGS_MASK | gint |
| SIGNAL_MATCH_MASK | gint |
| TYPE_FLAG_RESERVED_ID_BIT | Type |
| TYPE_FUNDAMENTAL_MAX | gint |
| TYPE_FUNDAMENTAL_SHIFT | gint |
| TYPE_RESERVED_BSE_FIRST | gint |
| TYPE_RESERVED_BSE_LAST | gint |
| TYPE_RESERVED_GLIB_FIRST | gint |
| TYPE_RESERVED_GLIB_LAST | gint |
| TYPE_RESERVED_USER_FIRST | gint |
| VALUE_COLLECT_FORMAT_MAX_LENGTH | gint |
| VALUE_INTERNED_STRING | gint |
| VALUE_NOCOPY_CONTENTS | gint |

## Aliases

| Name | Type |
| --- | --- |
| SignalCMarshaller | ClosureMarshal |
| SignalCVaMarshaller | VaClosureMarshal |
| Type | gsize |

