# JavaScriptCore 4.1

SQGI import: `import("JavaScriptCore", "4.1")`

Packages: `javascriptcoregtk-4.1`
Includes: `GObject-2.0`
Libraries: `libjavascriptcoregtk-4.1.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 6 |
| Interfaces | 0 |
| Records | 13 |
| Unions | 0 |
| Enums | 4 |
| Flags | 1 |
| Functions | 19 |
| Callbacks | 8 |
| Constants | 7 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Class | GObject.Object | 0 | 0 | 9 | A JSSClass represents a custom JavaScript class registered by the user in a #JSCContext. It allows to create new JavaScripts objects whose instance... |
| Context | GObject.Object | 0 | 0 | 21 | JSCContext represents a JavaScript execution context, where all operations take place and where the values will be associated. When a new context i... |
| Exception | GObject.Object | 0 | 0 | 14 | JSCException represents a JavaScript exception. |
| Value | GObject.Object | 0 | 0 | 60 | JSCValue represents a reference to a value in a #JSCContext. The JSCValue protects the referenced value from being garbage collected. |
| VirtualMachine | GObject.Object | 0 | 0 | 1 | JSCVirtualMachine represents a group of JSCContext<!-- -->s. It allows concurrent JavaScript execution by creating a different instance of JSCVirtu... |
| WeakValue | GObject.Object | 0 | 1 | 2 | JSCWeakValue represents a weak reference to a value in a #JSCContext. It can be used to keep a reference to a JavaScript value without protecting i... |

### JavaScriptCore.Class

Parent: `GObject.Object` ?? GType: `JSCClass` ?? C type: `JSCClass`

A JSSClass represents a custom JavaScript class registered by the user in a #JSCContext. It allows to create new JavaScripts objects whose instance...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ClassPrivate |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| add_constructor | `Class.add_constructor(name: utf8?, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType, n_params: guint, ...: void) -> Value` | jsc_class_add_constructor |  | Add a constructor to @jsc_class. If @name is %NULL, the class name will be used. When <function>new</function> is used with the constructor or jsc_... |
| add_constructor_variadic | `Class.add_constructor_variadic(name: utf8?, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType) -> Value` | jsc_class_add_constructor_variadic |  | Add a constructor to @jsc_class. If @name is %NULL, the class name will be used. When <function>new</function> is used with the constructor or jsc_... |
| add_constructorv | `Class.add_constructorv(name: utf8?, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType, n_parameters: guint, parameter_types: GType?) -> Value` | jsc_class_add_constructorv |  | Add a constructor to @jsc_class. If @name is %NULL, the class name will be used. When <function>new</function> is used with the constructor or jsc_... |
| add_method | `Class.add_method(name: utf8, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType, n_params: guint, ...: void) -> none` | jsc_class_add_method |  | Add method with @name to @jsc_class. When the method is called by JavaScript or jsc_value_object_invoke_method(), @callback is called receiving the... |
| add_method_variadic | `Class.add_method_variadic(name: utf8, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType) -> none` | jsc_class_add_method_variadic |  | Add method with @name to @jsc_class. When the method is called by JavaScript or jsc_value_object_invoke_method(), @callback is called receiving the... |
| add_methodv | `Class.add_methodv(name: utf8, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType, n_parameters: guint, parameter_types: GType?) -> none` | jsc_class_add_methodv |  | Add method with @name to @jsc_class. When the method is called by JavaScript or jsc_value_object_invoke_method(), @callback is called receiving the... |
| add_property | `Class.add_property(name: utf8, property_type: GType, getter: GObject.Callback?, setter: GObject.Callback?, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?) -> none` | jsc_class_add_property |  | Add a property with @name to @jsc_class. When the property value is read, @getter is called receiving the the class instance as first parameter and... |
| get_name | `Class.get_name() -> utf8` | jsc_class_get_name |  | Get the class name of @jsc_class |
| get_parent | `Class.get_parent() -> Class` | jsc_class_get_parent |  | Get the parent class of @jsc_class |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| context | Context | write, construct-only | The #JSCContext in which the class was registered. |
| name | utf8 | read, write, construct-only | The name of the class. |
| parent | Class | read, write, construct-only | The parent class or %NULL in case of final classes. |

### JavaScriptCore.Context

Parent: `GObject.Object` ?? GType: `JSCContext` ?? C type: `JSCContext`

JSCContext represents a JavaScript execution context, where all operations take place and where the values will be associated. When a new context i...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ContextPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Context.new() -> Context` | jsc_context_new |  | Create a new #JSCContext. The context is created in a new #JSCVirtualMachine. Use jsc_context_new_with_virtual_machine() to create a new #JSCContex... |
| new_with_virtual_machine | `Context.new_with_virtual_machine(vm: VirtualMachine) -> Context` | jsc_context_new_with_virtual_machine |  | Create a new #JSCContext in @virtual_machine. |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current | `get_current() -> Context` | jsc_context_get_current |  | Get the #JSCContext that is currently executing a function. This should only be called within a function or method callback, otherwise %NULL will b... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| check_syntax | `Context.check_syntax(code: utf8, length: gssize, mode: CheckSyntaxMode, uri: utf8, line_number: guint, exception: out Exception?) -> CheckSyntaxResult` | jsc_context_check_syntax |  | Check the given @code in @context for syntax errors. The @line_number is the starting line number in @uri; the value is one-based so the first line... |
| clear_exception | `Context.clear_exception() -> none` | jsc_context_clear_exception |  | Clear the uncaught exception in @context if any. |
| evaluate | `Context.evaluate(code: utf8, length: gssize) -> Value` | jsc_context_evaluate |  | Evaluate @code in @context. |
| evaluate_in_object | `Context.evaluate_in_object(code: utf8, length: gssize, object_instance: gpointer?, object_class: Class?, uri: utf8, line_number: guint, object: out Value) -> Value` | jsc_context_evaluate_in_object |  | Evaluate @code and create an new object where symbols defined in @code will be added as properties, instead of being added to @context global objec... |
| evaluate_with_source_uri | `Context.evaluate_with_source_uri(code: utf8, length: gssize, uri: utf8, line_number: guint) -> Value` | jsc_context_evaluate_with_source_uri |  | Evaluate @code in @context using @uri as the source URI. The @line_number is the starting line number in @uri; the value is one-based so the first ... |
| get_exception | `Context.get_exception() -> Exception` | jsc_context_get_exception |  | Get the last unhandled exception thrown in @context by API functions calls. |
| get_global_object | `Context.get_global_object() -> Value` | jsc_context_get_global_object |  | Get a #JSCValue referencing the @context global object |
| get_value | `Context.get_value(name: utf8) -> Value` | jsc_context_get_value |  | Get a property of @context global object with @name. |
| get_virtual_machine | `Context.get_virtual_machine() -> VirtualMachine` | jsc_context_get_virtual_machine |  | Get the #JSCVirtualMachine where @context was created. |
| pop_exception_handler | `Context.pop_exception_handler() -> none` | jsc_context_pop_exception_handler |  | Remove the last #JSCExceptionHandler previously pushed to @context with jsc_context_push_exception_handler(). |
| push_exception_handler | `Context.push_exception_handler(handler: ExceptionHandler, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?) -> none` | jsc_context_push_exception_handler |  | Push an exception handler in @context. Whenever a JavaScript exception happens in the #JSCContext, the given @handler will be called. The default #... |
| register_class | `Context.register_class(name: utf8, parent_class: Class?, vtable: ClassVTable?, destroy_notify: GLib.DestroyNotify?) -> Class` | jsc_context_register_class |  | Register a custom class in @context using the given @name. If the new class inherits from another #JSCClass, the parent should be passed as @parent... |
| set_value | `Context.set_value(name: utf8, value: Value) -> none` | jsc_context_set_value |  | Set a property of @context global object with @name and @value. |
| throw | `Context.throw(error_message: utf8) -> none` | jsc_context_throw |  | Throw an exception to @context using the given error message. The created #JSCException can be retrieved with jsc_context_get_exception(). |
| throw_exception | `Context.throw_exception(exception: Exception) -> none` | jsc_context_throw_exception |  | Throw @exception to @context. |
| throw_printf | `Context.throw_printf(format: utf8, ...: void) -> none` | jsc_context_throw_printf |  | Throw an exception to @context using the given formatted string as error message. The created #JSCException can be retrieved with jsc_context_get_e... |
| throw_with_name | `Context.throw_with_name(error_name: utf8, error_message: utf8) -> none` | jsc_context_throw_with_name |  | Throw an exception to @context using the given error name and message. The created #JSCException can be retrieved with jsc_context_get_exception(). |
| throw_with_name_printf | `Context.throw_with_name_printf(error_name: utf8, format: utf8, ...: void) -> none` | jsc_context_throw_with_name_printf |  | Throw an exception to @context using the given error name and the formatted string as error message. The created #JSCException can be retrieved wit... |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| virtual-machine | VirtualMachine | read, write, construct-only | The #JSCVirtualMachine in which the context was created. |

### JavaScriptCore.Exception

Parent: `GObject.Object` ?? GType: `JSCException` ?? C type: `JSCException`

JSCException represents a JavaScript exception.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ExceptionPrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `Exception.new(context: Context, message: utf8) -> Exception` | jsc_exception_new |  | Create a new #JSCException in @context with @message. |
| new_printf | `Exception.new_printf(context: Context, format: utf8, ...: void) -> Exception` | jsc_exception_new_printf |  | Create a new #JSCException in @context using a formatted string for the message. |
| new_vprintf | `Exception.new_vprintf(context: Context, format: utf8, args: va_list) -> Exception` | jsc_exception_new_vprintf |  | Create a new #JSCException in @context using a formatted string for the message. This is similar to jsc_exception_new_printf() except that the argu... |
| new_with_name | `Exception.new_with_name(context: Context, name: utf8, message: utf8) -> Exception` | jsc_exception_new_with_name |  | Create a new #JSCException in @context with @name and @message. |
| new_with_name_printf | `Exception.new_with_name_printf(context: Context, name: utf8, format: utf8, ...: void) -> Exception` | jsc_exception_new_with_name_printf |  | Create a new #JSCException in @context with @name and using a formatted string for the message. |
| new_with_name_vprintf | `Exception.new_with_name_vprintf(context: Context, name: utf8, format: utf8, args: va_list) -> Exception` | jsc_exception_new_with_name_vprintf |  | Create a new #JSCException in @context with @name and using a formatted string for the message. This is similar to jsc_exception_new_with_name_prin... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_backtrace_string | `Exception.get_backtrace_string() -> utf8` | jsc_exception_get_backtrace_string |  | Get a string with the exception backtrace. |
| get_column_number | `Exception.get_column_number() -> guint` | jsc_exception_get_column_number |  | Get the column number at which @exception happened. |
| get_line_number | `Exception.get_line_number() -> guint` | jsc_exception_get_line_number |  | Get the line number at which @exception happened. |
| get_message | `Exception.get_message() -> utf8` | jsc_exception_get_message |  | Get the error message of @exception. |
| get_name | `Exception.get_name() -> utf8` | jsc_exception_get_name |  | Get the error name of @exception |
| get_source_uri | `Exception.get_source_uri() -> utf8` | jsc_exception_get_source_uri |  | Get the source URI of @exception. |
| report | `Exception.report() -> utf8` | jsc_exception_report |  | Return a report message of @exception, containing all the possible details such us source URI, line, column and backtrace, and formatted to be prin... |
| to_string | `Exception.to_string() -> utf8` | jsc_exception_to_string |  | Get the string representation of @exception error. |

### JavaScriptCore.Value

Parent: `GObject.Object` ?? GType: `JSCValue` ?? C type: `JSCValue`

JSCValue represents a reference to a value in a #JSCContext. The JSCValue protects the referenced value from being garbage collected.

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | ValuePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_array | `Value.new_array(context: Context, first_item_type: GType, ...: void) -> Value` | jsc_value_new_array |  | Create a new #JSCValue referencing an array with the given items. If @first_item_type is %G_TYPE_NONE an empty array is created. |
| new_array_buffer | `Value.new_array_buffer(context: Context, data: gpointer?, size: gsize, destroy_notify: GLib.DestroyNotify?, user_data: gpointer?) -> Value` | jsc_value_new_array_buffer | 2.38 | Creates a new %ArrayBuffer from existing @data in memory. The @data is not copied: while this allows sharing data with JavaScript efficiently, the ... |
| new_array_from_garray | `Value.new_array_from_garray(context: Context, array: Value?) -> Value` | jsc_value_new_array_from_garray |  | Create a new #JSCValue referencing an array with the items from @array. If @array is %NULL or empty a new empty array will be created. Elements of ... |
| new_array_from_strv | `Value.new_array_from_strv(context: Context, strv: utf8) -> Value` | jsc_value_new_array_from_strv |  | Create a new #JSCValue referencing an array of strings with the items from @strv. If @array is %NULL or empty a new empty array will be created. |
| new_boolean | `Value.new_boolean(context: Context, value: gboolean) -> Value` | jsc_value_new_boolean |  | Create a new #JSCValue from @value |
| new_from_json | `Value.new_from_json(context: Context, json: utf8) -> Value` | jsc_value_new_from_json | 2.28 | Create a new #JSCValue referencing a new value created by parsing @json. |
| new_function | `Value.new_function(context: Context, name: utf8?, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType, n_params: guint, ...: void) -> Value` | jsc_value_new_function |  | Create a function in @context. If @name is %NULL an anonymous function will be created. When the function is called by JavaScript or jsc_value_func... |
| new_function_variadic | `Value.new_function_variadic(context: Context, name: utf8?, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType) -> Value` | jsc_value_new_function_variadic |  | Create a function in @context. If @name is %NULL an anonymous function will be created. When the function is called by JavaScript or jsc_value_func... |
| new_functionv | `Value.new_functionv(context: Context, name: utf8?, callback: GObject.Callback, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?, return_type: GType, n_parameters: guint, parameter_types: GType?) -> Value` | jsc_value_new_functionv |  | Create a function in @context. If @name is %NULL an anonymous function will be created. When the function is called by JavaScript or jsc_value_func... |
| new_null | `Value.new_null(context: Context) -> Value` | jsc_value_new_null |  | Create a new #JSCValue referencing <function>null</function> in @context. |
| new_number | `Value.new_number(context: Context, number: gdouble) -> Value` | jsc_value_new_number |  | Create a new #JSCValue from @number. |
| new_object | `Value.new_object(context: Context, instance: gpointer?, jsc_class: Class?) -> Value` | jsc_value_new_object |  | Create a new #JSCValue from @instance. If @instance is %NULL a new empty object is created. When @instance is provided, @jsc_class must be provided... |
| new_promise | `Value.new_promise(context: Context, executor: Executor, user_data: gpointer?) -> Value` | jsc_value_new_promise | 2.48 | Creates a new Promise. @executor will be invoked during promise initialization and it receives the @resolve and @reject objects than can be called ... |
| new_string | `Value.new_string(context: Context, string: utf8?) -> Value` | jsc_value_new_string |  | Create a new #JSCValue from @string. If you need to create a #JSCValue from a string containing null characters, use jsc_value_new_string_from_byte... |
| new_string_from_bytes | `Value.new_string_from_bytes(context: Context, bytes: GLib.Bytes?) -> Value` | jsc_value_new_string_from_bytes |  | Create a new #JSCValue from @bytes. |
| new_typed_array | `Value.new_typed_array(context: Context, type: TypedArrayType, length: gsize) -> Value` | jsc_value_new_typed_array | 2.38 | Create a new typed array containing a given amount of elements. Create a #JSCValue referencing a new typed array with space for @length elements of... |
| new_undefined | `Value.new_undefined(context: Context) -> Value` | jsc_value_new_undefined |  | Create a new #JSCValue referencing <function>undefined</function> in @context. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| array_buffer_get_data | `Value.array_buffer_get_data(size: out gsize?) -> guint8` | jsc_value_array_buffer_get_data | 2.38 | Gets a pointer to memory that contains the array buffer data. Obtains a pointer to the memory region that holds the contents of the %ArrayBuffer; m... |
| array_buffer_get_size | `Value.array_buffer_get_size() -> gsize` | jsc_value_array_buffer_get_size | 2.38 | Gets the size in bytes of the array buffer. Obtains the size in bytes of the memory region that holds the contents of an %ArrayBuffer. |
| constructor_call | `Value.constructor_call(first_parameter_type: GType, ...: void) -> Value` | jsc_value_constructor_call |  | Invoke <function>new</function> with constructor referenced by @value. If @first_parameter_type is %G_TYPE_NONE no parameters will be passed to the... |
| constructor_callv | `Value.constructor_callv(n_parameters: guint, parameters: Value?) -> Value` | jsc_value_constructor_callv |  | Invoke <function>new</function> with constructor referenced by @value. If @n_parameters is 0 no parameters will be passed to the constructor. |
| function_call | `Value.function_call(first_parameter_type: GType, ...: void) -> Value` | jsc_value_function_call |  | Call function referenced by @value, passing the given parameters. If @first_parameter_type is %G_TYPE_NONE no parameters will be passed to the func... |
| function_callv | `Value.function_callv(n_parameters: guint, parameters: Value?) -> Value` | jsc_value_function_callv |  | Call function referenced by @value, passing the given @parameters. If @n_parameters is 0 no parameters will be passed to the function. This functio... |
| get_context | `Value.get_context() -> Context` | jsc_value_get_context |  | Get the #JSCContext in which @value was created. |
| is_array | `Value.is_array() -> gboolean` | jsc_value_is_array |  | Get whether the value referenced by @value is an array. |
| is_array_buffer | `Value.is_array_buffer() -> gboolean` | jsc_value_is_array_buffer | 2.38 | Check whether the @value is an %ArrayBuffer. |
| is_boolean | `Value.is_boolean() -> gboolean` | jsc_value_is_boolean |  | Get whether the value referenced by @value is a boolean. |
| is_constructor | `Value.is_constructor() -> gboolean` | jsc_value_is_constructor |  | Get whether the value referenced by @value is a constructor. |
| is_function | `Value.is_function() -> gboolean` | jsc_value_is_function |  | Get whether the value referenced by @value is a function |
| is_null | `Value.is_null() -> gboolean` | jsc_value_is_null |  | Get whether the value referenced by @value is <function>null</function>. |
| is_number | `Value.is_number() -> gboolean` | jsc_value_is_number |  | Get whether the value referenced by @value is a number. |
| is_object | `Value.is_object() -> gboolean` | jsc_value_is_object |  | Get whether the value referenced by @value is an object. |
| is_string | `Value.is_string() -> gboolean` | jsc_value_is_string |  | Get whether the value referenced by @value is a string |
| is_typed_array | `Value.is_typed_array() -> gboolean` | jsc_value_is_typed_array | 2.38 | Determines whether a value is a typed array. |
| is_undefined | `Value.is_undefined() -> gboolean` | jsc_value_is_undefined |  | Get whether the value referenced by @value is <function>undefined</function>. |
| new_typed_array_with_buffer | `Value.new_typed_array_with_buffer(type: TypedArrayType, offset: gsize, length: gssize) -> Value` | jsc_value_new_typed_array_with_buffer | 2.38 | Create a new typed array value with elements from an array buffer. Create a #JSCValue referencing a new typed array value containing elements of th... |
| object_define_property_accessor | `Value.object_define_property_accessor(property_name: utf8, flags: ValuePropertyFlags, property_type: GType, getter: GObject.Callback?, setter: GObject.Callback?, user_data: gpointer?, destroy_notify: GLib.DestroyNotify?) -> none` | jsc_value_object_define_property_accessor |  | Define or modify a property with @property_name in object referenced by @value. When the property value is read or set, @getter and @setter callbac... |
| object_define_property_data | `Value.object_define_property_data(property_name: utf8, flags: ValuePropertyFlags, property_value: Value?) -> none` | jsc_value_object_define_property_data |  | Define or modify a property with @property_name in object referenced by @value. This is equivalent to JavaScript <function>Object.defineProperty()<... |
| object_delete_property | `Value.object_delete_property(name: utf8) -> gboolean` | jsc_value_object_delete_property |  | Try to delete property with @name from @value. This function will return %FALSE if the property was defined without %JSC_VALUE_PROPERTY_CONFIGURABL... |
| object_enumerate_properties | `Value.object_enumerate_properties() -> utf8` | jsc_value_object_enumerate_properties |  | Get the list of property names of @value. Only properties defined with %JSC_VALUE_PROPERTY_ENUMERABLE flag will be collected. |
| object_get_property | `Value.object_get_property(name: utf8) -> Value` | jsc_value_object_get_property |  | Get property with @name from @value. |
| object_get_property_at_index | `Value.object_get_property_at_index(index: guint) -> Value` | jsc_value_object_get_property_at_index |  | Get property at @index from @value. |
| object_has_property | `Value.object_has_property(name: utf8) -> gboolean` | jsc_value_object_has_property |  | Get whether @value has property with @name. |
| object_invoke_method | `Value.object_invoke_method(name: utf8, first_parameter_type: GType, ...: void) -> Value` | jsc_value_object_invoke_method |  | Invoke method with @name on object referenced by @value, passing the given parameters. If @first_parameter_type is %G_TYPE_NONE no parameters will ... |
| object_invoke_methodv | `Value.object_invoke_methodv(name: utf8, n_parameters: guint, parameters: Value?) -> Value` | jsc_value_object_invoke_methodv |  | Invoke method with @name on object referenced by @value, passing the given @parameters. If @n_parameters is 0 no parameters will be passed to the m... |
| object_is_instance_of | `Value.object_is_instance_of(name: utf8) -> gboolean` | jsc_value_object_is_instance_of |  | Get whether the value referenced by @value is an instance of class @name. |
| object_set_property | `Value.object_set_property(name: utf8, property: Value) -> none` | jsc_value_object_set_property |  | Set @property with @name on @value. |
| object_set_property_at_index | `Value.object_set_property_at_index(index: guint, property: Value) -> none` | jsc_value_object_set_property_at_index |  | Set @property at @index on @value. |
| to_boolean | `Value.to_boolean() -> gboolean` | jsc_value_to_boolean |  | Convert @value to a boolean. |
| to_double | `Value.to_double() -> gdouble` | jsc_value_to_double |  | Convert @value to a double. |
| to_int32 | `Value.to_int32() -> gint32` | jsc_value_to_int32 |  | Convert @value to a #gint32. |
| to_json | `Value.to_json(indent: guint) -> utf8` | jsc_value_to_json | 2.28 | Create a JSON string of @value serialization. If @indent is 0, the resulting JSON will not contain newlines. The size of the indent is clamped to 1... |
| to_string | `Value.to_string() -> utf8` | jsc_value_to_string |  | Convert @value to a string. Use jsc_value_to_string_as_bytes() instead, if you need to handle strings containing null characters. |
| to_string_as_bytes | `Value.to_string_as_bytes() -> GLib.Bytes` | jsc_value_to_string_as_bytes |  | Convert @value to a string and return the results as #GBytes. This is needed to handle strings with null characters. |
| typed_array_get_buffer | `Value.typed_array_get_buffer() -> Value` | jsc_value_typed_array_get_buffer | 2.38 | Obtain the %ArrayBuffer for the memory region of the typed array elements. |
| typed_array_get_data | `Value.typed_array_get_data(length: out gsize?) -> gpointer` | jsc_value_typed_array_get_data | 2.38 | Obtains a pointer to the memory region that holds the elements of the typed array; modifications done to them will be visible to JavaScript code. I... |
| typed_array_get_length | `Value.typed_array_get_length() -> gsize` | jsc_value_typed_array_get_length | 2.38 | Gets the number of elements in a typed array. |
| typed_array_get_offset | `Value.typed_array_get_offset() -> gsize` | jsc_value_typed_array_get_offset | 2.38 | Gets the offset over the underlying array buffer data. |
| typed_array_get_size | `Value.typed_array_get_size() -> gsize` | jsc_value_typed_array_get_size | 2.38 | Gets the size of a typed array. |
| typed_array_get_type | `Value.typed_array_get_type() -> TypedArrayType` | jsc_value_typed_array_get_type | 2.38 | Gets the type of elements contained in a typed array. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| context | Context | read, write, construct-only | The #JSCContext in which the value was created. |

### JavaScriptCore.VirtualMachine

Parent: `GObject.Object` ?? GType: `JSCVirtualMachine` ?? C type: `JSCVirtualMachine`

JSCVirtualMachine represents a group of JSCContext<!-- -->s. It allows concurrent JavaScript execution by creating a different instance of JSCVirtu...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | VirtualMachinePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `VirtualMachine.new() -> VirtualMachine` | jsc_virtual_machine_new |  | Create a new #JSCVirtualMachine. |

### JavaScriptCore.WeakValue

Parent: `GObject.Object` ?? GType: `JSCWeakValue` ?? C type: `JSCWeakValue`

JSCWeakValue represents a weak reference to a value in a #JSCContext. It can be used to keep a reference to a JavaScript value without protecting i...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | WeakValuePrivate |

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new | `WeakValue.new(value: Value) -> WeakValue` | jsc_weak_value_new |  | Create a new #JSCWeakValue for the JavaScript value referenced by @value. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_value | `WeakValue.get_value() -> Value` | jsc_weak_value_get_value |  | Get a #JSCValue referencing the JavaScript value of @weak_value. |

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| value | Value | write, construct-only | The #JSCValue referencing the JavaScript value. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| cleared | `` | none | last |  | This signal is emitted when the JavaScript value is destroyed. |

## Enums

### JavaScriptCore.CheckSyntaxMode

C type: `JSCCheckSyntaxMode`

Enum values to specify a mode to check for syntax errors in jsc_context_check_syntax().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| module | 1 |  | mode to check syntax of a module |
| script | 0 |  | mode to check syntax of a script |

### JavaScriptCore.CheckSyntaxResult

C type: `JSCCheckSyntaxResult`

Enum values to specify the result of jsc_context_check_syntax().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| irrecoverable_error | 2 |  | irrecoverable syntax error |
| out_of_memory_error | 4 |  | out of memory error |
| recoverable_error | 1 |  | recoverable syntax error |
| stack_overflow_error | 5 |  | stack overflow error |
| success | 0 |  | no errors |
| unterminated_literal_error | 3 |  | unterminated literal error |

### JavaScriptCore.OptionType

C type: `JSCOptionType`

Enum values for options types.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| boolean | 0 |  | A #gboolean option type. |
| double | 4 |  | A #gdouble options type. |
| int | 1 |  | A #gint option type. |
| range_string | 6 |  | A range string option type. |
| size | 3 |  | A #gsize options type. |
| string | 5 |  | A string option type. |
| uint | 2 |  | A #guint option type. |

### JavaScriptCore.TypedArrayType

C type: `JSCTypedArrayType`

Possible types of the elements contained in a typed array.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| float32 | 10 |  | Array elements are 32-bit floating point numbers (float). |
| float64 | 11 |  | Array elements are 64-bit floating point numbers (double). |
| int16 | 2 |  | Array elements are 16-bit signed integers (int16_t). |
| int32 | 3 |  | Array elements are 32-bit signed integers (int32_t). |
| int64 | 4 |  | Array elements are 64-bit signed integers (int64_t). |
| int8 | 1 |  | Array elements are 8-bit signed integers (int8_t). |
| none | 0 |  | Not a typed array, or type unsupported. |
| uint16 | 7 |  | Array elements are 16-bit unsigned integers (uint16_t). |
| uint32 | 8 |  | Array elements are 32-bit unsigned integers (uint32_t). |
| uint64 | 9 |  | Array elements are 64-bit unsigned integers (uint64_t). |
| uint8 | 5 |  | Array elements are 8-bit unsigned integers (uint8_t). |
| uint8_clamped | 6 |  | Array elements are 8-bit unsigned integers (uint8_t). |

## Flags

### JavaScriptCore.ValuePropertyFlags

C type: `JSCValuePropertyFlags`

Flags used when defining properties with jsc_value_object_define_property_data() and jsc_value_object_define_property_accessor().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| configurable | 1 |  | the type of the property descriptor may be changed and the property may be deleted from the corresponding object. |
| enumerable | 2 |  | the property shows up during enumeration of the properties on the corresponding object. |
| writable | 4 |  | the value associated with the property may be changed with an assignment operator. This doesn't have any effect when passed to jsc_value_object_def... |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| ClassClass |  | 0 | 0 | 0 |  |
| ClassPrivate |  | 0 | 0 | 0 |  |
| ClassVTable |  | 0 | 0 | 0 | Virtual table for a JSCClass. This can be optionally used when registering a #JSCClass in a #JSCContext to provide a custom implementation for the ... |
| ContextClass |  | 0 | 0 | 0 |  |
| ContextPrivate |  | 0 | 0 | 0 |  |
| ExceptionClass |  | 0 | 0 | 0 |  |
| ExceptionPrivate |  | 0 | 0 | 0 |  |
| ValueClass |  | 0 | 0 | 0 |  |
| ValuePrivate |  | 0 | 0 | 0 |  |
| VirtualMachineClass |  | 0 | 0 | 0 |  |
| VirtualMachinePrivate |  | 0 | 0 | 0 |  |
| WeakValueClass |  | 0 | 0 | 0 |  |
| WeakValuePrivate |  | 0 | 0 | 0 |  |

### JavaScriptCore.ClassClass

C type: `JSCClassClass`

### JavaScriptCore.ClassPrivate

C type: `JSCClassPrivate`

### JavaScriptCore.ClassVTable

C type: `JSCClassVTable`

Virtual table for a JSCClass. This can be optionally used when registering a #JSCClass in a #JSCContext to provide a custom implementation for the ...

#### Fields

| Field | Type |
| --- | --- |
| _jsc_reserved0 | none |
| _jsc_reserved1 | none |
| _jsc_reserved2 | none |
| _jsc_reserved3 | none |
| delete_property | ClassDeletePropertyFunction |
| enumerate_properties | ClassEnumeratePropertiesFunction |
| get_property | ClassGetPropertyFunction |
| has_property | ClassHasPropertyFunction |
| set_property | ClassSetPropertyFunction |

### JavaScriptCore.ContextClass

C type: `JSCContextClass`

#### Fields

| Field | Type |
| --- | --- |
| _jsc_reserved0 | none |
| _jsc_reserved1 | none |
| _jsc_reserved2 | none |
| _jsc_reserved3 | none |
| parent_class | GObject.ObjectClass |

### JavaScriptCore.ContextPrivate

C type: `JSCContextPrivate`

### JavaScriptCore.ExceptionClass

C type: `JSCExceptionClass`

#### Fields

| Field | Type |
| --- | --- |
| _jsc_reserved0 | none |
| _jsc_reserved1 | none |
| _jsc_reserved2 | none |
| _jsc_reserved3 | none |
| parent_class | GObject.ObjectClass |

### JavaScriptCore.ExceptionPrivate

C type: `JSCExceptionPrivate`

### JavaScriptCore.ValueClass

C type: `JSCValueClass`

#### Fields

| Field | Type |
| --- | --- |
| _jsc_reserved0 | none |
| _jsc_reserved1 | none |
| _jsc_reserved2 | none |
| _jsc_reserved3 | none |
| parent_class | GObject.ObjectClass |

### JavaScriptCore.ValuePrivate

C type: `JSCValuePrivate`

### JavaScriptCore.VirtualMachineClass

C type: `JSCVirtualMachineClass`

#### Fields

| Field | Type |
| --- | --- |
| _jsc_reserved0 | none |
| _jsc_reserved1 | none |
| _jsc_reserved2 | none |
| _jsc_reserved3 | none |
| parent_class | GObject.ObjectClass |

### JavaScriptCore.VirtualMachinePrivate

C type: `JSCVirtualMachinePrivate`

### JavaScriptCore.WeakValueClass

C type: `JSCWeakValueClass`

#### Fields

| Field | Type |
| --- | --- |
| _jsc_reserved0 | none |
| _jsc_reserved1 | none |
| _jsc_reserved2 | none |
| _jsc_reserved3 | none |
| parent_class | GObject.ObjectClass |

### JavaScriptCore.WeakValuePrivate

C type: `JSCWeakValuePrivate`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_major_version | `get_major_version() -> guint` | jsc_get_major_version |  | Returns the major version number of the JavaScriptCore library. (e.g. in JavaScriptCore version 1.8.3 this is 1.) This function is in the library, ... |
| get_micro_version | `get_micro_version() -> guint` | jsc_get_micro_version |  | Returns the micro version number of the JavaScriptCore library. (e.g. in JavaScriptCore version 1.8.3 this is 3.) This function is in the library, ... |
| get_minor_version | `get_minor_version() -> guint` | jsc_get_minor_version |  | Returns the minor version number of the JavaScriptCore library. (e.g. in JavaScriptCore version 1.8.3 this is 8.) This function is in the library, ... |
| options_foreach | `options_foreach(function: OptionsFunc, user_data: gpointer?) -> none` | jsc_options_foreach | 2.24 | Iterates all available options calling @function for each one. Iteration can stop early if @function returns %FALSE. |
| options_get_boolean | `options_get_boolean(option: utf8, value: out gboolean) -> gboolean` | jsc_options_get_boolean | 2.24 | Get @option as a #gboolean value. |
| options_get_double | `options_get_double(option: utf8, value: out gdouble) -> gboolean` | jsc_options_get_double | 2.24 | Get @option as a #gdouble value. |
| options_get_int | `options_get_int(option: utf8, value: out gint) -> gboolean` | jsc_options_get_int | 2.24 | Get @option as a #gint value. |
| options_get_option_group | `options_get_option_group() -> GLib.OptionGroup` | jsc_options_get_option_group | 2.24 | Create a #GOptionGroup to handle JSCOptions as command line arguments. The options will be exposed as command line arguments with the form <emphasi... |
| options_get_range_string | `options_get_range_string(option: utf8, value: out utf8) -> gboolean` | jsc_options_get_range_string | 2.24 | Get @option as a range string. The string must be in the format <emphasis>[!]&lt;low&gt;[:&lt;high&gt;]</emphasis> where low and high are #guint va... |
| options_get_size | `options_get_size(option: utf8, value: out gsize) -> gboolean` | jsc_options_get_size | 2.24 | Get @option as a #gsize value. |
| options_get_string | `options_get_string(option: utf8, value: out utf8) -> gboolean` | jsc_options_get_string | 2.24 | Get @option as a string. |
| options_get_uint | `options_get_uint(option: utf8, value: out guint) -> gboolean` | jsc_options_get_uint | 2.24 | Get @option as a #guint value. |
| options_set_boolean | `options_set_boolean(option: utf8, value: gboolean) -> gboolean` | jsc_options_set_boolean | 2.24 | Set @option as a #gboolean value. |
| options_set_double | `options_set_double(option: utf8, value: gdouble) -> gboolean` | jsc_options_set_double | 2.24 | Set @option as a #gdouble value. |
| options_set_int | `options_set_int(option: utf8, value: gint) -> gboolean` | jsc_options_set_int | 2.24 | Set @option as a #gint value. |
| options_set_range_string | `options_set_range_string(option: utf8, value: utf8) -> gboolean` | jsc_options_set_range_string | 2.24 | Set @option as a range string. The string must be in the format <emphasis>[!]&lt;low&gt;[:&lt;high&gt;]</emphasis> where low and high are #guint va... |
| options_set_size | `options_set_size(option: utf8, value: gsize) -> gboolean` | jsc_options_set_size | 2.24 | Set @option as a #gsize value. |
| options_set_string | `options_set_string(option: utf8, value: utf8) -> gboolean` | jsc_options_set_string | 2.24 | Set @option as a string. |
| options_set_uint | `options_set_uint(option: utf8, value: guint) -> gboolean` | jsc_options_set_uint | 2.24 | Set @option as a #guint value. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ClassDeletePropertyFunction | `ClassDeletePropertyFunction(jsc_class: Class, context: Context, instance: gpointer?, name: utf8) -> gboolean` |  |  | The type of delete_property in #JSCClassVTable. This is only required when you need to handle external properties not added to the prototype. |
| ClassEnumeratePropertiesFunction | `ClassEnumeratePropertiesFunction(jsc_class: Class, context: Context, instance: gpointer?) -> utf8` |  |  | The type of enumerate_properties in #JSCClassVTable. This is only required when you need to handle external properties not added to the prototype. |
| ClassGetPropertyFunction | `ClassGetPropertyFunction(jsc_class: Class, context: Context, instance: gpointer?, name: utf8) -> Value` |  |  | The type of get_property in #JSCClassVTable. This is only required when you need to handle external properties not added to the prototype. |
| ClassHasPropertyFunction | `ClassHasPropertyFunction(jsc_class: Class, context: Context, instance: gpointer?, name: utf8) -> gboolean` |  |  | The type of has_property in #JSCClassVTable. This is only required when you need to handle external properties not added to the prototype. |
| ClassSetPropertyFunction | `ClassSetPropertyFunction(jsc_class: Class, context: Context, instance: gpointer?, name: utf8, value: Value) -> gboolean` |  |  | The type of set_property in #JSCClassVTable. This is only required when you need to handle external properties not added to the prototype. |
| ExceptionHandler | `ExceptionHandler(context: Context, exception: Exception, user_data: gpointer?) -> none` |  |  | Function used to handle JavaScript exceptions in a #JSCContext. |
| Executor | `Executor(resolve: Value, reject: Value, user_data: gpointer?) -> none` |  | 2.48 | A function passed to @jsc_value_new_promise called during initialization It is called like a JavaScript function, so exceptions raised will not be ... |
| OptionsFunc | `OptionsFunc(option: utf8, type: OptionType, description: utf8?, user_data: gpointer?) -> gboolean` |  | 2.24 | Function used to iterate options. Not that @description string is not localized. |

## Constants

| Name | Type |
| --- | --- |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| OPTIONS_USE_DFG | utf8 |
| OPTIONS_USE_FTL | utf8 |
| OPTIONS_USE_JIT | utf8 |
| OPTIONS_USE_LLINT | utf8 |

