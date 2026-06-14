# GIRepository 2.0

SQGI import: `import("GIRepository", "2.0")`

Packages: `gobject-introspection-1.0`
Includes: `GObject-2.0`
Libraries: `libgirepository-1.0.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 1 |
| Interfaces | 0 |
| Records | 6 |
| Unions | 1 |
| Enums | 8 |
| Flags | 4 |
| Functions | 160 |
| Callbacks | 4 |
| Constants | 4 |
| Aliases | 17 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Repository | GObject.Object | 0 | 0 | 25 | #GIRepository is used to manage repositories of namespaces. Namespaces are represented on disk by type libraries (.typelib files). ### Discovery of... |

### GIRepository.Repository

Parent: `GObject.Object` ?? GType: `GIRepository` ?? C type: `GIRepository`

#GIRepository is used to manage repositories of namespaces. Namespaces are represented on disk by type libraries (.typelib files). ### Discovery of...

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.Object |
| priv | RepositoryPrivate |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| dump | `dump(arg: utf8) -> gboolean throws` | g_irepository_dump |  |  |
| error_quark | `error_quark() -> GLib.Quark` | g_irepository_error_quark |  |  |
| get_default | `get_default() -> Repository` | g_irepository_get_default |  | Returns the singleton process-global default #GIRepository. It is not currently supported to have multiple repositories in a particular process, bu... |
| get_option_group | `get_option_group() -> GLib.OptionGroup` | g_irepository_get_option_group |  | Obtain the option group for girepository, it's used by the dumper and for programs that wants to provide introspection information |
| get_search_path | `get_search_path() -> GLib.SList` | g_irepository_get_search_path |  | Returns the current search path #GIRepository will use when loading typelib files. The list is internal to #GIRepository and should not be freed, n... |
| prepend_library_path | `prepend_library_path(directory: utf8) -> none` | g_irepository_prepend_library_path |  |  |
| prepend_search_path | `prepend_search_path(directory: filename) -> none` | g_irepository_prepend_search_path |  | Prepends @directory to the typelib search path. See also: g_irepository_get_search_path(). |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| enumerate_versions | `Repository.enumerate_versions(namespace_: utf8) -> GLib.List` | g_irepository_enumerate_versions |  | Obtain an unordered list of versions (either currently loaded or available) for @namespace_ in this @repository. |
| find_by_error_domain | `Repository.find_by_error_domain(domain: GLib.Quark) -> EnumInfo` | g_irepository_find_by_error_domain | 1.30 | Searches for the enum type corresponding to the given #GError domain. Before calling this function for a particular namespace, you must call g_irep... |
| find_by_gtype | `Repository.find_by_gtype(gtype: GType) -> BaseInfo` | g_irepository_find_by_gtype |  | Searches all loaded namespaces for a particular #GType. Note that in order to locate the metadata, the namespace corresponding to the type must fir... |
| find_by_name | `Repository.find_by_name(namespace_: utf8, name: utf8) -> BaseInfo` | g_irepository_find_by_name |  | Searches for a particular entry in a namespace. Before calling this function for a particular namespace, you must call g_irepository_require() once... |
| get_c_prefix | `Repository.get_c_prefix(namespace_: utf8) -> utf8` | g_irepository_get_c_prefix |  | This function returns the "C prefix", or the C level namespace associated with the given introspection namespace. Each C symbol starts with this pr... |
| get_dependencies | `Repository.get_dependencies(namespace_: utf8) -> utf8` | g_irepository_get_dependencies |  | Retrieves all (transitive) versioned dependencies for @namespace_. The strings are of the form `namespace-version`. Note: @namespace_ must have alr... |
| get_immediate_dependencies | `Repository.get_immediate_dependencies(namespace_: utf8) -> utf8` | g_irepository_get_immediate_dependencies | 1.44 | Return an array of the immediate versioned dependencies for @namespace_. Returned strings are of the form `namespace-version`. Note: @namespace_ mu... |
| get_info | `Repository.get_info(namespace_: utf8, index: gint) -> BaseInfo` | g_irepository_get_info |  | This function returns a particular metadata entry in the given namespace @namespace_. The namespace must have already been loaded before calling th... |
| get_loaded_namespaces | `Repository.get_loaded_namespaces() -> utf8` | g_irepository_get_loaded_namespaces |  | Return the list of currently loaded namespaces. |
| get_n_infos | `Repository.get_n_infos(namespace_: utf8) -> gint` | g_irepository_get_n_infos |  | This function returns the number of metadata entries in given namespace @namespace_. The namespace must have already been loaded before calling thi... |
| get_object_gtype_interfaces | `Repository.get_object_gtype_interfaces(gtype: GType, n_interfaces_out: out guint, interfaces_out: out InterfaceInfo) -> none` | g_irepository_get_object_gtype_interfaces | 1.62 | Look up the implemented interfaces for @gtype. This function cannot fail per se; but for a totally "unknown" #GType, it may return 0 implemented in... |
| get_shared_library | `Repository.get_shared_library(namespace_: utf8) -> utf8` | g_irepository_get_shared_library |  | This function returns a comma-separated list of paths to the shared C libraries associated with the given namespace @namespace_. There may be no sh... |
| get_typelib_path | `Repository.get_typelib_path(namespace_: utf8) -> utf8` | g_irepository_get_typelib_path |  | If namespace @namespace_ is loaded, return the full path to the .typelib file it was loaded from. If the typelib for namespace @namespace_ was incl... |
| get_version | `Repository.get_version(namespace_: utf8) -> utf8` | g_irepository_get_version |  | This function returns the loaded version associated with the given namespace @namespace_. Note: The namespace must have already been loaded using a... |
| is_registered | `Repository.is_registered(namespace_: utf8, version: utf8?) -> gboolean` | g_irepository_is_registered |  | Check whether a particular namespace (and optionally, a specific version thereof) is currently loaded. This function is likely to only be useful in... |
| load_typelib | `Repository.load_typelib(typelib: Typelib, flags: RepositoryLoadFlags) -> utf8 throws` | g_irepository_load_typelib |  | TODO |
| require | `Repository.require(namespace_: utf8, version: utf8?, flags: RepositoryLoadFlags) -> Typelib throws` | g_irepository_require |  | Force the namespace @namespace_ to be loaded if it isn't already. If @namespace_ is not loaded, this function will search for a ".typelib" file usi... |
| require_private | `Repository.require_private(typelib_dir: utf8, namespace_: utf8, version: utf8?, flags: RepositoryLoadFlags) -> Typelib throws` | g_irepository_require_private |  | Force the namespace @namespace_ to be loaded if it isn't already. If @namespace_ is not loaded, this function will search for a ".typelib" file wit... |

## Enums

### GIRepository.ArrayType

C type: `GIArrayType`

The type of array in a #GITypeInfo.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| array | 1 |  | a @GArray array |
| byte_array | 3 |  | a #GByteArray array |
| c | 0 |  | a C array, char[] for instance |
| ptr_array | 2 |  | a #GPtrArray array |

### GIRepository.Direction

C type: `GIDirection`

The direction of a #GIArgInfo.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| in | 0 |  | in argument. |
| inout | 2 |  | in and out argument. |
| out | 1 |  | out argument. |

### GIRepository.InfoType

C type: `GIInfoType`

The type of a GIBaseInfo struct.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| arg | 17 |  | argument of a function or callback, see #GIArgInfo |
| boxed | 4 |  | boxed, see #GIStructInfo or #GIUnionInfo |
| callback | 2 |  | callback, see #GIFunctionInfo |
| constant | 9 |  | contant, see #GIConstantInfo |
| enum | 5 |  | enum, see #GIEnumInfo |
| field | 16 |  | struct or union field, see #GIFieldInfo |
| flags | 6 |  | flags, see #GIEnumInfo |
| function | 1 |  | function, see #GIFunctionInfo |
| interface | 8 |  | interface, see #GIInterfaceInfo |
| invalid | 0 |  | invalid type |
| invalid_0 | 10 |  | deleted, used to be GI_INFO_TYPE_ERROR_DOMAIN. |
| object | 7 |  | object, see #GIObjectInfo |
| property | 15 |  | GObject property, see #GIPropertyInfo |
| signal | 13 |  | signal, see #GISignalInfo |
| struct | 3 |  | struct, see #GIStructInfo |
| type | 18 |  | type information, see #GITypeInfo |
| union | 11 |  | union, see #GIUnionInfo |
| unresolved | 19 |  | unresolved type, a type which is not present in the typelib, or any of its dependencies. |
| value | 12 |  | enum value, see #GIValueInfo |
| vfunc | 14 |  | virtual function, see #GIVFuncInfo |

### GIRepository.nvokeError

C type: `GInvokeError`

An error occuring while invoking a function via g_function_info_invoke().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| argument_mismatch | 2 |  | the arguments provided didn't match the expected arguments for the functions type signature. |
| failed | 0 |  | invokation failed, unknown error. |
| symbol_not_found | 1 |  | symbol couldn't be found in any of the libraries associated with the typelib of the function. |

### GIRepository.RepositoryError

C type: `GIRepositoryError`

An error code used with #G_IREPOSITORY_ERROR in a #GError returned from a #GIRepository routine.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| library_not_found | 3 |  | the library used by the typelib could not be found. |
| namespace_mismatch | 1 |  | the namespace does not match the requested namespace. |
| namespace_version_conflict | 2 |  | the version of the typelib does not match the requested version. |
| typelib_not_found | 0 |  | the typelib could not be found. |

### GIRepository.ScopeType

C type: `GIScopeType`

Scope type of a #GIArgInfo representing callback, determines how the callback is invoked and is used to decided when the invoke structs can be freed.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| async | 2 |  | The callback and associated user_data is only used until the callback is invoked, and the callback. is invoked always exactly once. |
| call | 1 |  | The callback and associated user_data is only used during the call to this function. |
| forever | 4 |  | The callback and associated user_data is used until the process terminates |
| invalid | 0 |  | The argument is not of callback type. |
| notified | 3 |  | The callback and associated user_data is used until the caller is notfied via the destroy_notify. |

### GIRepository.Transfer

C type: `GITransfer`

The transfer is the exchange of data between two parts, from the callee to the caller. The callee is either a function/method/signal or an object/i...

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| container | 1 |  | transfer the container (list, array, hash table) from the callee to the caller. The callee retains the ownership of the individual items in the con... |
| everything | 2 |  | transfer everything, eg the container and its contents from the callee to the caller. This is the case when the callee creates a copy of all the da... |
| nothing | 0 |  | transfer nothing from the callee (function or the type instance the property belongs to) to the caller. The callee retains the ownership of the tra... |

### GIRepository.TypeTag

C type: `GITypeTag`

The type tag of a #GITypeInfo.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| array | 15 |  | an array |
| boolean | 1 |  | boolean |
| double | 11 |  | double floating point |
| error | 20 |  | a #GError |
| filename | 14 |  | a filename, encoded in the same encoding as the native filesystem is using. |
| float | 10 |  | float |
| ghash | 19 |  | a #GHashTable |
| glist | 17 |  | a #GList |
| gslist | 18 |  | a #GSList |
| gtype | 12 |  | a #GType |
| int16 | 4 |  | 16-bit signed integer |
| int32 | 6 |  | 32-bit signed integer |
| int64 | 8 |  | 64-bit signed integer |
| int8 | 2 |  | 8-bit signed integer |
| interface | 16 |  | an extended interface object |
| uint16 | 5 |  | 16-bit unsigned integer |
| uint32 | 7 |  | 32-bit unsigned integer |
| uint64 | 9 |  | 64-bit unsigned integer |
| uint8 | 3 |  | 8-bit unsigned integer |
| unichar | 21 |  | Unicode character |
| utf8 | 13 |  | a UTF-8 encoded string |
| void | 0 |  | void |

## Flags

### GIRepository.FieldInfoFlags

C type: `GIFieldInfoFlags`

Flags for a #GIFieldInfo.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| readable | 1 |  | field is readable. |
| writable | 2 |  | field is writable. |

### GIRepository.FunctionInfoFlags

C type: `GIFunctionInfoFlags`

Flags for a #GIFunctionInfo struct.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| is_constructor | 2 |  | is a constructor. |
| is_getter | 4 |  | is a getter of a #GIPropertyInfo. |
| is_method | 1 |  | is a method. |
| is_setter | 8 |  | is a setter of a #GIPropertyInfo. |
| throws | 32 |  | the function may throw an error. |
| wraps_vfunc | 16 |  | represents a virtual function. |

### GIRepository.RepositoryLoadFlags

C type: `GIRepositoryLoadFlags`

Flags that control how a typelib is loaded.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| irepository_load_flag_lazy | 1 |  | Lazily load the typelib. |

### GIRepository.VFuncInfoFlags

C type: `GIVFuncInfoFlags`

Flags of a #GIVFuncInfo struct.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| must_chain_up | 1 |  | chains up to the parent type |
| must_not_override | 4 |  | does not override |
| must_override | 2 |  | overrides |
| throws | 8 |  | Includes a #GError |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| AttributeIter |  | 0 | 0 | 0 | An opaque structure used to iterate over attributes in a #GIBaseInfo struct. |
| BaseInfo |  | 0 | 0 | 11 | GIBaseInfo is the common base struct of all other Info structs accessible through the #GIRepository API. All info structures can be cast to a #GIBa... |
| RepositoryClass |  | 0 | 0 | 0 |  |
| RepositoryPrivate |  | 0 | 0 | 0 |  |
| Typelib |  | 0 | 0 | 6 | TODO |
| UnresolvedInfo |  | 0 | 0 | 0 | Represents a unresolved type in a typelib. |

### GIRepository.AttributeIter

C type: `GIAttributeIter`

An opaque structure used to iterate over attributes in a #GIBaseInfo struct.

#### Fields

| Field | Type |
| --- | --- |
| data | gpointer |
| data2 | gpointer |
| data3 | gpointer |
| data4 | gpointer |

### GIRepository.BaseInfo

GType: `GIBaseInfo` ?? C type: `GIBaseInfo`

GIBaseInfo is the common base struct of all other Info structs accessible through the #GIRepository API. All info structures can be cast to a #GIBa...

#### Fields

| Field | Type |
| --- | --- |
| dummy1 | gint32 |
| dummy2 | gint32 |
| dummy3 | gpointer |
| dummy4 | gpointer |
| dummy5 | gpointer |
| dummy6 | guint32 |
| dummy7 | guint32 |
| padding | gpointer |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| equal | `BaseInfo.equal(info2: BaseInfo) -> gboolean` | g_base_info_equal |  | Compare two #GIBaseInfo. Using pointer comparison is not practical since many functions return different instances of #GIBaseInfo that refers to th... |
| get_attribute | `BaseInfo.get_attribute(name: utf8) -> utf8` | g_base_info_get_attribute |  | Retrieve an arbitrary attribute associated with this node. |
| get_container | `BaseInfo.get_container() -> BaseInfo` | g_base_info_get_container |  | Obtain the container of the @info. The container is the parent GIBaseInfo. For instance, the parent of a #GIFunctionInfo is an #GIObjectInfo or #GI... |
| get_name | `BaseInfo.get_name() -> utf8` | g_base_info_get_name |  | Obtain the name of the @info. What the name represents depends on the #GIInfoType of the @info. For instance for #GIFunctionInfo it is the name of ... |
| get_namespace | `BaseInfo.get_namespace() -> utf8` | g_base_info_get_namespace |  | Obtain the namespace of @info. |
| get_type | `BaseInfo.get_type() -> InfoType` | g_base_info_get_type |  | Obtain the info type of the GIBaseInfo. |
| get_typelib | `BaseInfo.get_typelib() -> Typelib` | g_base_info_get_typelib |  | Obtain the typelib this @info belongs to |
| is_deprecated | `BaseInfo.is_deprecated() -> gboolean` | g_base_info_is_deprecated |  | Obtain whether the @info is represents a metadata which is deprecated or not. |
| iterate_attributes | `BaseInfo.iterate_attributes(iterator: inout AttributeIter, name: out utf8, value: out utf8) -> gboolean` | g_base_info_iterate_attributes |  | Iterate over all attributes associated with this node. The iterator structure is typically stack allocated, and must have its first member initiali... |
| ref | `BaseInfo.ref() -> BaseInfo` | g_base_info_ref |  | Increases the reference count of @info. |
| unref | `BaseInfo.unref() -> none` | g_base_info_unref |  | Decreases the reference count of @info. When its reference count drops to 0, the info is freed. |

### GIRepository.RepositoryClass

C type: `GIRepositoryClass`

#### Fields

| Field | Type |
| --- | --- |
| parent | GObject.ObjectClass |

### GIRepository.RepositoryPrivate

C type: `GIRepositoryPrivate`

### GIRepository.Typelib

C type: `GITypelib`

TODO

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| new_from_const_memory | `new_from_const_memory(memory: guint8, len: gsize) -> Typelib throws` | g_typelib_new_from_const_memory |  |  |
| new_from_mapped_file | `new_from_mapped_file(mfile: GLib.MappedFile) -> Typelib throws` | g_typelib_new_from_mapped_file |  |  |
| new_from_memory | `new_from_memory(memory: guint8, len: gsize) -> Typelib throws` | g_typelib_new_from_memory |  |  |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| free | `Typelib.free() -> none` | g_typelib_free |  |  |
| get_namespace | `Typelib.get_namespace() -> utf8` | g_typelib_get_namespace |  |  |
| symbol | `Typelib.symbol(symbol_name: utf8, symbol: gpointer?) -> gboolean` | g_typelib_symbol |  |  |

### GIRepository.UnresolvedInfo

C type: `GIUnresolvedInfo`

Represents a unresolved type in a typelib.

## Unions

### GIRepository.Argument

C type: `GIArgument`

Stores an argument of varying type

#### Fields

| Field | Type |
| --- | --- |
| v_boolean | gboolean |
| v_double | gdouble |
| v_float | gfloat |
| v_int | gint |
| v_int16 | gint16 |
| v_int32 | gint32 |
| v_int64 | gint64 |
| v_int8 | gint8 |
| v_long | glong |
| v_pointer | gpointer |
| v_short | gshort |
| v_size | gsize |
| v_ssize | gssize |
| v_string | utf8 |
| v_uint | guint |
| v_uint16 | guint16 |
| v_uint32 | guint32 |
| v_uint64 | guint64 |
| v_uint8 | guint8 |
| v_ulong | gulong |
| v_ushort | gushort |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| arg_info_get_closure | `arg_info_get_closure(info: ArgInfo) -> gint` | g_arg_info_get_closure |  | Obtain the index of the user data argument. This is only valid for arguments which are callbacks. |
| arg_info_get_destroy | `arg_info_get_destroy(info: ArgInfo) -> gint` | g_arg_info_get_destroy |  | Obtains the index of the #GDestroyNotify argument. This is only valid for arguments which are callbacks. |
| arg_info_get_direction | `arg_info_get_direction(info: ArgInfo) -> Direction` | g_arg_info_get_direction |  | Obtain the direction of the argument. Check #GIDirection for possible direction values. |
| arg_info_get_ownership_transfer | `arg_info_get_ownership_transfer(info: ArgInfo) -> Transfer` | g_arg_info_get_ownership_transfer |  | Obtain the ownership transfer for this argument. #GITransfer contains a list of possible values. |
| arg_info_get_scope | `arg_info_get_scope(info: ArgInfo) -> ScopeType` | g_arg_info_get_scope |  | Obtain the scope type for this argument. The scope type explains how a callback is going to be invoked, most importantly when the resources require... |
| arg_info_get_type | `arg_info_get_type(info: ArgInfo) -> TypeInfo` | g_arg_info_get_type |  | Obtain the type information for @info. |
| arg_info_is_caller_allocates | `arg_info_is_caller_allocates(info: ArgInfo) -> gboolean` | g_arg_info_is_caller_allocates |  | Obtain if the argument is a pointer to a struct or object that will receive an output of a function. The default assumption for %GI_DIRECTION_OUT a... |
| arg_info_is_optional | `arg_info_is_optional(info: ArgInfo) -> gboolean` | g_arg_info_is_optional |  | Obtain if the argument is optional. For 'out' arguments this means that you can pass %NULL in order to ignore the result. |
| arg_info_is_return_value | `arg_info_is_return_value(info: ArgInfo) -> gboolean` | g_arg_info_is_return_value |  | Obtain if the argument is a return value. It can either be a parameter or a return value. |
| arg_info_is_skip | `arg_info_is_skip(info: ArgInfo) -> gboolean` | g_arg_info_is_skip | 1.30 | Obtain if an argument is only useful in C. |
| arg_info_load_type | `arg_info_load_type(info: ArgInfo, type: out TypeInfo) -> none` | g_arg_info_load_type |  | Obtain information about a the type of given argument @info; this function is a variant of g_arg_info_get_type() designed for stack allocation. The... |
| arg_info_may_be_null | `arg_info_may_be_null(info: ArgInfo) -> gboolean` | g_arg_info_may_be_null |  | Obtain if the type of the argument includes the possibility of %NULL. For 'in' values this means that %NULL is a valid value. For 'out' values, thi... |
| callable_info_can_throw_gerror | `callable_info_can_throw_gerror(info: CallableInfo) -> gboolean` | g_callable_info_can_throw_gerror | 1.34 | TODO |
| callable_info_get_arg | `callable_info_get_arg(info: CallableInfo, n: gint) -> ArgInfo` | g_callable_info_get_arg |  | Obtain information about a particular argument of this callable. |
| callable_info_get_caller_owns | `callable_info_get_caller_owns(info: CallableInfo) -> Transfer` | g_callable_info_get_caller_owns |  | See whether the caller owns the return value of this callable. #GITransfer contains a list of possible transfer values. |
| callable_info_get_instance_ownership_transfer | `callable_info_get_instance_ownership_transfer(info: CallableInfo) -> Transfer` | g_callable_info_get_instance_ownership_transfer | 1.42 | Obtains the ownership transfer for the instance argument. #GITransfer contains a list of possible transfer values. |
| callable_info_get_n_args | `callable_info_get_n_args(info: CallableInfo) -> gint` | g_callable_info_get_n_args |  | Obtain the number of arguments (both IN and OUT) for this callable. |
| callable_info_get_return_attribute | `callable_info_get_return_attribute(info: CallableInfo, name: utf8) -> utf8` | g_callable_info_get_return_attribute |  | Retrieve an arbitrary attribute associated with the return value. |
| callable_info_get_return_type | `callable_info_get_return_type(info: CallableInfo) -> TypeInfo` | g_callable_info_get_return_type |  | Obtain the return type of a callable item as a #GITypeInfo. |
| callable_info_invoke | `callable_info_invoke(info: CallableInfo, function: gpointer?, in_args: Argument, n_in_args: gint, out_args: Argument, n_out_args: gint, return_value: Argument, is_method: gboolean, throws: gboolean) -> gboolean throws` | g_callable_info_invoke |  | TODO |
| callable_info_is_method | `callable_info_is_method(info: CallableInfo) -> gboolean` | g_callable_info_is_method | 1.34 | Determines if the callable info is a method. For #GIVFuncInfo<!-- -->s, #GICallbackInfo<!-- -->s, and #GISignalInfo<!-- -->s, this is always true. ... |
| callable_info_iterate_return_attributes | `callable_info_iterate_return_attributes(info: CallableInfo, iterator: inout AttributeIter, name: out utf8, value: out utf8) -> gboolean` | g_callable_info_iterate_return_attributes |  | Iterate over all attributes associated with the return value. The iterator structure is typically stack allocated, and must have its first member i... |
| callable_info_load_arg | `callable_info_load_arg(info: CallableInfo, n: gint, arg: out ArgInfo) -> none` | g_callable_info_load_arg |  | Obtain information about a particular argument of this callable; this function is a variant of g_callable_info_get_arg() designed for stack allocat... |
| callable_info_load_return_type | `callable_info_load_return_type(info: CallableInfo, type: out TypeInfo) -> none` | g_callable_info_load_return_type |  | Obtain information about a return value of callable; this function is a variant of g_callable_info_get_return_type() designed for stack allocation.... |
| callable_info_may_return_null | `callable_info_may_return_null(info: CallableInfo) -> gboolean` | g_callable_info_may_return_null |  | See if a callable could return %NULL. |
| callable_info_skip_return | `callable_info_skip_return(info: CallableInfo) -> gboolean` | g_callable_info_skip_return |  | See if a callable's return value is only useful in C. |
| cclosure_marshal_generic | `cclosure_marshal_generic(closure: GObject.Closure, return_gvalue: GObject.Value, n_param_values: guint, param_values: GObject.Value, invocation_hint: gpointer?, marshal_data: gpointer?) -> none` | gi_cclosure_marshal_generic |  |  |
| constant_info_free_value | `constant_info_free_value(info: ConstantInfo, value: Argument) -> none` | g_constant_info_free_value | 1.32 | Free the value returned from g_constant_info_get_value(). |
| constant_info_get_type | `constant_info_get_type(info: ConstantInfo) -> TypeInfo` | g_constant_info_get_type |  | Obtain the type of the constant as a #GITypeInfo. |
| constant_info_get_value | `constant_info_get_value(info: ConstantInfo, value: out Argument) -> gint` | g_constant_info_get_value |  | Obtain the value associated with the #GIConstantInfo and store it in the @value parameter. @argument needs to be allocated before passing it in. Th... |
| enum_info_get_error_domain | `enum_info_get_error_domain(info: EnumInfo) -> utf8` | g_enum_info_get_error_domain | 1.30 | Obtain the string form of the quark for the error domain associated with this enum, if any. |
| enum_info_get_method | `enum_info_get_method(info: EnumInfo, n: gint) -> FunctionInfo` | g_enum_info_get_method | 1.30 | Obtain an enum type method at index @n. |
| enum_info_get_n_methods | `enum_info_get_n_methods(info: EnumInfo) -> gint` | g_enum_info_get_n_methods | 1.30 | Obtain the number of methods that this enum type has. |
| enum_info_get_n_values | `enum_info_get_n_values(info: EnumInfo) -> gint` | g_enum_info_get_n_values |  | Obtain the number of values this enumeration contains. |
| enum_info_get_storage_type | `enum_info_get_storage_type(info: EnumInfo) -> TypeTag` | g_enum_info_get_storage_type |  | Obtain the tag of the type used for the enum in the C ABI. This will will be a signed or unsigned integral type. Note that in the current implement... |
| enum_info_get_value | `enum_info_get_value(info: EnumInfo, n: gint) -> ValueInfo` | g_enum_info_get_value |  | Obtain a value for this enumeration. |
| field_info_get_field | `field_info_get_field(field_info: FieldInfo, mem: gpointer?, value: Argument) -> gboolean` | g_field_info_get_field |  | Reads a field identified by a #GIFieldInfo from a C structure or union. This only handles fields of simple C types. It will fail for a field of a c... |
| field_info_get_flags | `field_info_get_flags(info: FieldInfo) -> FieldInfoFlags` | g_field_info_get_flags |  | Obtain the flags for this #GIFieldInfo. See #GIFieldInfoFlags for possible flag values. |
| field_info_get_offset | `field_info_get_offset(info: FieldInfo) -> gint` | g_field_info_get_offset |  | Obtain the offset in bytes of the field member, this is relative to the beginning of the struct or union. |
| field_info_get_size | `field_info_get_size(info: FieldInfo) -> gint` | g_field_info_get_size |  | Obtain the size in bits of the field member, this is how much space you need to allocate to store the field. |
| field_info_get_type | `field_info_get_type(info: FieldInfo) -> TypeInfo` | g_field_info_get_type |  | Obtain the type of a field as a #GITypeInfo. |
| field_info_set_field | `field_info_set_field(field_info: FieldInfo, mem: gpointer?, value: Argument) -> gboolean` | g_field_info_set_field |  | Writes a field identified by a #GIFieldInfo to a C structure or union. This only handles fields of simple C types. It will fail for a field of a co... |
| function_info_get_flags | `function_info_get_flags(info: FunctionInfo) -> FunctionInfoFlags` | g_function_info_get_flags |  | Obtain the #GIFunctionInfoFlags for the @info. |
| function_info_get_property | `function_info_get_property(info: FunctionInfo) -> PropertyInfo` | g_function_info_get_property |  | Obtain the property associated with this #GIFunctionInfo. Only #GIFunctionInfo with the flag %GI_FUNCTION_IS_GETTER or %GI_FUNCTION_IS_SETTER have ... |
| function_info_get_symbol | `function_info_get_symbol(info: FunctionInfo) -> utf8` | g_function_info_get_symbol |  | Obtain the symbol of the function. The symbol is the name of the exported function, suitable to be used as an argument to g_module_symbol(). |
| function_info_get_vfunc | `function_info_get_vfunc(info: FunctionInfo) -> VFuncInfo` | g_function_info_get_vfunc |  | Obtain the virtual function associated with this #GIFunctionInfo. Only #GIFunctionInfo with the flag %GI_FUNCTION_WRAPS_VFUNC has a virtual functio... |
| function_info_invoke | `function_info_invoke(info: FunctionInfo, in_args: Argument, n_in_args: gint, out_args: Argument, n_out_args: gint, return_value: Argument) -> gboolean throws` | g_function_info_invoke |  | Invokes the function described in @info with the given arguments. Note that inout parameters must appear in both argument lists. This function uses... |
| get_major_version | `get_major_version() -> guint` | gi_get_major_version | 1.60 | Returns the major version number of the girepository library. (e.g. in version 1.58.2 this is 1.) |
| get_micro_version | `get_micro_version() -> guint` | gi_get_micro_version | 1.60 | Returns the micro version number of the girepository library. (e.g. in version 1.58.2 this is 2.) |
| get_minor_version | `get_minor_version() -> guint` | gi_get_minor_version | 1.60 | Returns the minor version number of the girepository library. (e.g. in version 1.58.2 this is 58.) |
| info_new | `info_new(type: InfoType, container: BaseInfo, typelib: Typelib, offset: guint32) -> BaseInfo` | g_info_new |  | TODO |
| info_type_to_string | `info_type_to_string(type: InfoType) -> utf8` | g_info_type_to_string |  | Obtain a string representation of @type |
| interface_info_find_method | `interface_info_find_method(info: InterfaceInfo, name: utf8) -> FunctionInfo` | g_interface_info_find_method |  | Obtain a method of the interface type given a @name. %NULL will be returned if there's no method available with that name. |
| interface_info_find_signal | `interface_info_find_signal(info: InterfaceInfo, name: utf8) -> SignalInfo` | g_interface_info_find_signal | 1.34 | TODO |
| interface_info_find_vfunc | `interface_info_find_vfunc(info: InterfaceInfo, name: utf8) -> VFuncInfo` | g_interface_info_find_vfunc |  | Locate a virtual function slot with name @name. See the documentation for g_object_info_find_vfunc() for more information on virtuals. |
| interface_info_get_constant | `interface_info_get_constant(info: InterfaceInfo, n: gint) -> ConstantInfo` | g_interface_info_get_constant |  | Obtain an interface type constant at index @n. |
| interface_info_get_iface_struct | `interface_info_get_iface_struct(info: InterfaceInfo) -> StructInfo` | g_interface_info_get_iface_struct |  | Returns the layout C structure associated with this #GInterface. |
| interface_info_get_method | `interface_info_get_method(info: InterfaceInfo, n: gint) -> FunctionInfo` | g_interface_info_get_method |  | Obtain an interface type method at index @n. |
| interface_info_get_n_constants | `interface_info_get_n_constants(info: InterfaceInfo) -> gint` | g_interface_info_get_n_constants |  | Obtain the number of constants that this interface type has. |
| interface_info_get_n_methods | `interface_info_get_n_methods(info: InterfaceInfo) -> gint` | g_interface_info_get_n_methods |  | Obtain the number of methods that this interface type has. |
| interface_info_get_n_prerequisites | `interface_info_get_n_prerequisites(info: InterfaceInfo) -> gint` | g_interface_info_get_n_prerequisites |  | Obtain the number of prerequisites for this interface type. A prerequisites is another interface that needs to be implemented for interface, simila... |
| interface_info_get_n_properties | `interface_info_get_n_properties(info: InterfaceInfo) -> gint` | g_interface_info_get_n_properties |  | Obtain the number of properties that this interface type has. |
| interface_info_get_n_signals | `interface_info_get_n_signals(info: InterfaceInfo) -> gint` | g_interface_info_get_n_signals |  | Obtain the number of signals that this interface type has. |
| interface_info_get_n_vfuncs | `interface_info_get_n_vfuncs(info: InterfaceInfo) -> gint` | g_interface_info_get_n_vfuncs |  | Obtain the number of virtual functions that this interface type has. |
| interface_info_get_prerequisite | `interface_info_get_prerequisite(info: InterfaceInfo, n: gint) -> BaseInfo` | g_interface_info_get_prerequisite |  | Obtain an interface type prerequisites index @n. |
| interface_info_get_property | `interface_info_get_property(info: InterfaceInfo, n: gint) -> PropertyInfo` | g_interface_info_get_property |  | Obtain an interface type property at index @n. |
| interface_info_get_signal | `interface_info_get_signal(info: InterfaceInfo, n: gint) -> SignalInfo` | g_interface_info_get_signal |  | Obtain an interface type signal at index @n. |
| interface_info_get_vfunc | `interface_info_get_vfunc(info: InterfaceInfo, n: gint) -> VFuncInfo` | g_interface_info_get_vfunc |  | Obtain an interface type virtual function at index @n. |
| invoke_error_quark | `invoke_error_quark() -> GLib.Quark` | g_invoke_error_quark |  | TODO |
| object_info_find_method | `object_info_find_method(info: ObjectInfo, name: utf8) -> FunctionInfo` | g_object_info_find_method |  | Obtain a method of the object type given a @name. %NULL will be returned if there's no method available with that name. |
| object_info_find_method_using_interfaces | `object_info_find_method_using_interfaces(info: ObjectInfo, name: utf8, implementor: out ObjectInfo) -> FunctionInfo` | g_object_info_find_method_using_interfaces |  | Obtain a method of the object given a @name, searching both the object @info and any interfaces it implements. %NULL will be returned if there's no... |
| object_info_find_signal | `object_info_find_signal(info: ObjectInfo, name: utf8) -> SignalInfo` | g_object_info_find_signal |  | TODO |
| object_info_find_vfunc | `object_info_find_vfunc(info: ObjectInfo, name: utf8) -> VFuncInfo` | g_object_info_find_vfunc |  | Locate a virtual function slot with name @name. Note that the namespace for virtuals is distinct from that of methods; there may or may not be a co... |
| object_info_find_vfunc_using_interfaces | `object_info_find_vfunc_using_interfaces(info: ObjectInfo, name: utf8, implementor: out ObjectInfo) -> VFuncInfo` | g_object_info_find_vfunc_using_interfaces |  | Locate a virtual function slot with name @name, searching both the object @info and any interfaces it implements. Note that the namespace for virtu... |
| object_info_get_abstract | `object_info_get_abstract(info: ObjectInfo) -> gboolean` | g_object_info_get_abstract |  | Obtain if the object type is an abstract type, eg if it cannot be instantiated |
| object_info_get_class_struct | `object_info_get_class_struct(info: ObjectInfo) -> StructInfo` | g_object_info_get_class_struct |  | Every #GObject has two structures; an instance structure and a class structure. This function returns the metadata for the class structure. |
| object_info_get_constant | `object_info_get_constant(info: ObjectInfo, n: gint) -> ConstantInfo` | g_object_info_get_constant |  | Obtain an object type constant at index @n. |
| object_info_get_field | `object_info_get_field(info: ObjectInfo, n: gint) -> FieldInfo` | g_object_info_get_field |  | Obtain an object type field at index @n. |
| object_info_get_final | `object_info_get_final(info: ObjectInfo) -> gboolean` | g_object_info_get_final | 1.70 | Checks whether the object type is a final type, i.e. if it cannot be derived |
| object_info_get_fundamental | `object_info_get_fundamental(info: ObjectInfo) -> gboolean` | g_object_info_get_fundamental |  | Obtain if the object type is of a fundamental type which is not G_TYPE_OBJECT. This is mostly for supporting GstMiniObject. |
| object_info_get_get_value_function | `object_info_get_get_value_function(info: ObjectInfo) -> utf8` | g_object_info_get_get_value_function |  | Obtain the symbol name of the function that should be called to convert an object instance pointer of this object type to a GValue. I's mainly used... |
| object_info_get_get_value_function_pointer | `object_info_get_get_value_function_pointer(info: ObjectInfo) -> ObjectInfoGetValueFunction` | g_object_info_get_get_value_function_pointer |  | Obtain a pointer to a function which can be used to extract an instance of this object type out of a GValue. This takes derivation into account and... |
| object_info_get_interface | `object_info_get_interface(info: ObjectInfo, n: gint) -> InterfaceInfo` | g_object_info_get_interface |  | Obtain an object type interface at index @n. |
| object_info_get_method | `object_info_get_method(info: ObjectInfo, n: gint) -> FunctionInfo` | g_object_info_get_method |  | Obtain an object type method at index @n. |
| object_info_get_n_constants | `object_info_get_n_constants(info: ObjectInfo) -> gint` | g_object_info_get_n_constants |  | Obtain the number of constants that this object type has. |
| object_info_get_n_fields | `object_info_get_n_fields(info: ObjectInfo) -> gint` | g_object_info_get_n_fields |  | Obtain the number of fields that this object type has. |
| object_info_get_n_interfaces | `object_info_get_n_interfaces(info: ObjectInfo) -> gint` | g_object_info_get_n_interfaces |  | Obtain the number of interfaces that this object type has. |
| object_info_get_n_methods | `object_info_get_n_methods(info: ObjectInfo) -> gint` | g_object_info_get_n_methods |  | Obtain the number of methods that this object type has. |
| object_info_get_n_properties | `object_info_get_n_properties(info: ObjectInfo) -> gint` | g_object_info_get_n_properties |  | Obtain the number of properties that this object type has. |
| object_info_get_n_signals | `object_info_get_n_signals(info: ObjectInfo) -> gint` | g_object_info_get_n_signals |  | Obtain the number of signals that this object type has. |
| object_info_get_n_vfuncs | `object_info_get_n_vfuncs(info: ObjectInfo) -> gint` | g_object_info_get_n_vfuncs |  | Obtain the number of virtual functions that this object type has. |
| object_info_get_parent | `object_info_get_parent(info: ObjectInfo) -> ObjectInfo` | g_object_info_get_parent |  | Obtain the parent of the object type. |
| object_info_get_property | `object_info_get_property(info: ObjectInfo, n: gint) -> PropertyInfo` | g_object_info_get_property |  | Obtain an object type property at index @n. |
| object_info_get_ref_function | `object_info_get_ref_function(info: ObjectInfo) -> utf8` | g_object_info_get_ref_function |  | Obtain the symbol name of the function that should be called to ref this object type. It's mainly used fundamental types. The type signature for th... |
| object_info_get_ref_function_pointer | `object_info_get_ref_function_pointer(info: ObjectInfo) -> ObjectInfoRefFunction` | g_object_info_get_ref_function_pointer |  | Obtain a pointer to a function which can be used to increase the reference count an instance of this object type. This takes derivation into accoun... |
| object_info_get_set_value_function | `object_info_get_set_value_function(info: ObjectInfo) -> utf8` | g_object_info_get_set_value_function |  | Obtain the symbol name of the function that should be called to convert set a GValue giving an object instance pointer of this object type. I's mai... |
| object_info_get_set_value_function_pointer | `object_info_get_set_value_function_pointer(info: ObjectInfo) -> ObjectInfoSetValueFunction` | g_object_info_get_set_value_function_pointer |  | Obtain a pointer to a function which can be used to set a GValue given an instance of this object type. This takes derivation into account and will... |
| object_info_get_signal | `object_info_get_signal(info: ObjectInfo, n: gint) -> SignalInfo` | g_object_info_get_signal |  | Obtain an object type signal at index @n. |
| object_info_get_type_init | `object_info_get_type_init(info: ObjectInfo) -> utf8` | g_object_info_get_type_init |  | Obtain the function which when called will return the GType function for which this object type is registered. |
| object_info_get_type_name | `object_info_get_type_name(info: ObjectInfo) -> utf8` | g_object_info_get_type_name |  | Obtain the name of the objects class/type. |
| object_info_get_unref_function | `object_info_get_unref_function(info: ObjectInfo) -> utf8` | g_object_info_get_unref_function |  | Obtain the symbol name of the function that should be called to unref this object type. It's mainly used fundamental types. The type signature for ... |
| object_info_get_unref_function_pointer | `object_info_get_unref_function_pointer(info: ObjectInfo) -> ObjectInfoUnrefFunction` | g_object_info_get_unref_function_pointer |  | Obtain a pointer to a function which can be used to decrease the reference count an instance of this object type. This takes derivation into accoun... |
| object_info_get_vfunc | `object_info_get_vfunc(info: ObjectInfo, n: gint) -> VFuncInfo` | g_object_info_get_vfunc |  | Obtain an object type virtual function at index @n. |
| property_info_get_flags | `property_info_get_flags(info: PropertyInfo) -> GObject.ParamFlags` | g_property_info_get_flags |  | Obtain the flags for this property info. See #GParamFlags for more information about possible flag values. |
| property_info_get_getter | `property_info_get_getter(info: PropertyInfo) -> FunctionInfo` | g_property_info_get_getter |  | Obtains the getter function associated with this #GIPropertyInfo. The setter is only available for %G_PARAM_READABLE properties. |
| property_info_get_ownership_transfer | `property_info_get_ownership_transfer(info: PropertyInfo) -> Transfer` | g_property_info_get_ownership_transfer |  | Obtain the ownership transfer for this property. See #GITransfer for more information about transfer values. |
| property_info_get_setter | `property_info_get_setter(info: PropertyInfo) -> FunctionInfo` | g_property_info_get_setter |  | Obtains the setter function associated with this #GIPropertyInfo. The setter is only available for %G_PARAM_WRITABLE properties that are also not %... |
| property_info_get_type | `property_info_get_type(info: PropertyInfo) -> TypeInfo` | g_property_info_get_type |  | Obtain the type information for the property @info. |
| registered_type_info_get_g_type | `registered_type_info_get_g_type(info: RegisteredTypeInfo) -> GType` | g_registered_type_info_get_g_type |  | Obtain the #GType for this registered type or G_TYPE_NONE which a special meaning. It means that either there is no type information associated wit... |
| registered_type_info_get_type_init | `registered_type_info_get_type_init(info: RegisteredTypeInfo) -> utf8` | g_registered_type_info_get_type_init |  | Obtain the type init function for @info. The type init function is the function which will register the GType within the GObject type system. Usual... |
| registered_type_info_get_type_name | `registered_type_info_get_type_name(info: RegisteredTypeInfo) -> utf8` | g_registered_type_info_get_type_name |  | Obtain the type name of the struct within the GObject type system. This type can be passed to g_type_name() to get a #GType. |
| signal_info_get_class_closure | `signal_info_get_class_closure(info: SignalInfo) -> VFuncInfo` | g_signal_info_get_class_closure |  | Obtain the class closure for this signal if one is set. The class closure is a virtual function on the type that the signal belongs to. If the sign... |
| signal_info_get_flags | `signal_info_get_flags(info: SignalInfo) -> GObject.SignalFlags` | g_signal_info_get_flags |  | Obtain the flags for this signal info. See #GSignalFlags for more information about possible flag values. |
| signal_info_true_stops_emit | `signal_info_true_stops_emit(info: SignalInfo) -> gboolean` | g_signal_info_true_stops_emit |  | Obtain if the returning true in the signal handler will stop the emission of the signal. |
| struct_info_find_field | `struct_info_find_field(info: StructInfo, name: utf8) -> FieldInfo` | g_struct_info_find_field | 1.46 | Obtain the type information for field named @name. |
| struct_info_find_method | `struct_info_find_method(info: StructInfo, name: utf8) -> FunctionInfo` | g_struct_info_find_method |  | Obtain the type information for method named @name. |
| struct_info_get_alignment | `struct_info_get_alignment(info: StructInfo) -> gsize` | g_struct_info_get_alignment |  | Obtain the required alignment of the structure. |
| struct_info_get_copy_function | `struct_info_get_copy_function(info: StructInfo) -> utf8` | g_struct_info_get_copy_function | 1.76 | Retrieves the name of the copy function for @info, if any is set. |
| struct_info_get_field | `struct_info_get_field(info: StructInfo, n: gint) -> FieldInfo` | g_struct_info_get_field |  | Obtain the type information for field with specified index. |
| struct_info_get_free_function | `struct_info_get_free_function(info: StructInfo) -> utf8` | g_struct_info_get_free_function | 1.76 | Retrieves the name of the free function for @info, if any is set. |
| struct_info_get_method | `struct_info_get_method(info: StructInfo, n: gint) -> FunctionInfo` | g_struct_info_get_method |  | Obtain the type information for method with specified index. |
| struct_info_get_n_fields | `struct_info_get_n_fields(info: StructInfo) -> gint` | g_struct_info_get_n_fields |  | Obtain the number of fields this structure has. |
| struct_info_get_n_methods | `struct_info_get_n_methods(info: StructInfo) -> gint` | g_struct_info_get_n_methods |  | Obtain the number of methods this structure has. |
| struct_info_get_size | `struct_info_get_size(info: StructInfo) -> gsize` | g_struct_info_get_size |  | Obtain the total size of the structure. |
| struct_info_is_foreign | `struct_info_is_foreign(info: StructInfo) -> gboolean` | g_struct_info_is_foreign |  | TODO |
| struct_info_is_gtype_struct | `struct_info_is_gtype_struct(info: StructInfo) -> gboolean` | g_struct_info_is_gtype_struct |  | Return true if this structure represents the "class structure" for some #GObject or #GInterface. This function is mainly useful to hide this kind o... |
| type_info_argument_from_hash_pointer | `type_info_argument_from_hash_pointer(info: TypeInfo, hash_pointer: gpointer?, arg: Argument) -> none` | g_type_info_argument_from_hash_pointer | 1.66 | GLib data structures, such as #GList, #GSList, and #GHashTable, all store data pointers. In the case where the list or hash table is storing single... |
| type_info_get_array_fixed_size | `type_info_get_array_fixed_size(info: TypeInfo) -> gint` | g_type_info_get_array_fixed_size |  | Obtain the fixed array size of the type. The type tag must be a #GI_TYPE_TAG_ARRAY or -1 will be returned. |
| type_info_get_array_length | `type_info_get_array_length(info: TypeInfo) -> gint` | g_type_info_get_array_length |  | Obtain the position of the argument which gives the array length of the type. The type tag must be a #GI_TYPE_TAG_ARRAY or -1 will be returned. |
| type_info_get_array_type | `type_info_get_array_type(info: TypeInfo) -> ArrayType` | g_type_info_get_array_type |  | Obtain the array type for this type. See #GIArrayType for a list of possible values. If the type tag of this type is not array, -1 will be returned. |
| type_info_get_interface | `type_info_get_interface(info: TypeInfo) -> BaseInfo` | g_type_info_get_interface |  | For types which have #GI_TYPE_TAG_INTERFACE such as GObjects and boxed values, this function returns full information about the referenced type. Yo... |
| type_info_get_param_type | `type_info_get_param_type(info: TypeInfo, n: gint) -> TypeInfo` | g_type_info_get_param_type |  | Obtain the parameter type @n. |
| type_info_get_storage_type | `type_info_get_storage_type(info: TypeInfo) -> TypeTag` | g_type_info_get_storage_type | 1.66 | Obtain the type tag corresponding to the underlying storage type in C for the type. See #GITypeTag for a list of type tags. |
| type_info_get_tag | `type_info_get_tag(info: TypeInfo) -> TypeTag` | g_type_info_get_tag |  | Obtain the type tag for the type. See #GITypeTag for a list of type tags. |
| type_info_hash_pointer_from_argument | `type_info_hash_pointer_from_argument(info: TypeInfo, arg: Argument) -> gpointer` | g_type_info_hash_pointer_from_argument | 1.66 | GLib data structures, such as #GList, #GSList, and #GHashTable, all store data pointers. In the case where the list or hash table is storing single... |
| type_info_is_pointer | `type_info_is_pointer(info: TypeInfo) -> gboolean` | g_type_info_is_pointer |  | Obtain if the type is passed as a reference. Note that the types of %GI_DIRECTION_OUT and %GI_DIRECTION_INOUT parameters will only be pointers if t... |
| type_info_is_zero_terminated | `type_info_is_zero_terminated(info: TypeInfo) -> gboolean` | g_type_info_is_zero_terminated |  | Obtain if the last element of the array is %NULL. The type tag must be a #GI_TYPE_TAG_ARRAY or %FALSE will be returned. |
| type_tag_argument_from_hash_pointer | `type_tag_argument_from_hash_pointer(storage_type: TypeTag, hash_pointer: gpointer?, arg: Argument) -> none` | gi_type_tag_argument_from_hash_pointer | 1.72 | GLib data structures, such as #GList, #GSList, and #GHashTable, all store data pointers. In the case where the list or hash table is storing single... |
| type_tag_hash_pointer_from_argument | `type_tag_hash_pointer_from_argument(storage_type: TypeTag, arg: Argument) -> gpointer` | gi_type_tag_hash_pointer_from_argument | 1.72 | GLib data structures, such as #GList, #GSList, and #GHashTable, all store data pointers. In the case where the list or hash table is storing single... |
| type_tag_to_string | `type_tag_to_string(type: TypeTag) -> utf8` | g_type_tag_to_string |  | Obtain a string representation of @type |
| union_info_find_method | `union_info_find_method(info: UnionInfo, name: utf8) -> FunctionInfo` | g_union_info_find_method |  | Obtain the type information for method named @name. |
| union_info_get_alignment | `union_info_get_alignment(info: UnionInfo) -> gsize` | g_union_info_get_alignment |  | Obtain the required alignment of the union. |
| union_info_get_copy_function | `union_info_get_copy_function(info: UnionInfo) -> utf8` | g_union_info_get_copy_function | 1.76 | Retrieves the name of the copy function for @info, if any is set. |
| union_info_get_discriminator | `union_info_get_discriminator(info: UnionInfo, n: gint) -> ConstantInfo` | g_union_info_get_discriminator |  | Obtain discriminator value assigned for n-th union field, i.e. n-th union field is the active one if discriminator contains this constant. |
| union_info_get_discriminator_offset | `union_info_get_discriminator_offset(info: UnionInfo) -> gint` | g_union_info_get_discriminator_offset |  | Returns offset of the discriminator field in the structure. |
| union_info_get_discriminator_type | `union_info_get_discriminator_type(info: UnionInfo) -> TypeInfo` | g_union_info_get_discriminator_type |  | Obtain the type information of the union discriminator. |
| union_info_get_field | `union_info_get_field(info: UnionInfo, n: gint) -> FieldInfo` | g_union_info_get_field |  | Obtain the type information for field with specified index. |
| union_info_get_free_function | `union_info_get_free_function(info: UnionInfo) -> utf8` | g_union_info_get_free_function | 1.76 | Retrieves the name of the free function for @info, if any is set. |
| union_info_get_method | `union_info_get_method(info: UnionInfo, n: gint) -> FunctionInfo` | g_union_info_get_method |  | Obtain the type information for method with specified index. |
| union_info_get_n_fields | `union_info_get_n_fields(info: UnionInfo) -> gint` | g_union_info_get_n_fields |  | Obtain the number of fields this union has. |
| union_info_get_n_methods | `union_info_get_n_methods(info: UnionInfo) -> gint` | g_union_info_get_n_methods |  | Obtain the number of methods this union has. |
| union_info_get_size | `union_info_get_size(info: UnionInfo) -> gsize` | g_union_info_get_size |  | Obtain the total size of the union. |
| union_info_is_discriminated | `union_info_is_discriminated(info: UnionInfo) -> gboolean` | g_union_info_is_discriminated |  | Return true if this union contains discriminator field. |
| value_info_get_value | `value_info_get_value(info: ValueInfo) -> gint64` | g_value_info_get_value |  | Obtain the enumeration value of the #GIValueInfo. |
| vfunc_info_get_address | `vfunc_info_get_address(info: VFuncInfo, implementor_gtype: GType) -> gpointer throws` | g_vfunc_info_get_address |  | This method will look up where inside the type struct of @implementor_gtype is the implementation for @info. |
| vfunc_info_get_flags | `vfunc_info_get_flags(info: VFuncInfo) -> VFuncInfoFlags` | g_vfunc_info_get_flags |  | Obtain the flags for this virtual function info. See #GIVFuncInfoFlags for more information about possible flag values. |
| vfunc_info_get_invoker | `vfunc_info_get_invoker(info: VFuncInfo) -> FunctionInfo` | g_vfunc_info_get_invoker |  | If this virtual function has an associated invoker method, this method will return it. An invoker method is a C entry point. Not all virtuals will ... |
| vfunc_info_get_offset | `vfunc_info_get_offset(info: VFuncInfo) -> gint` | g_vfunc_info_get_offset |  | Obtain the offset of the function pointer in the class struct. The value 0xFFFF indicates that the struct offset is unknown. |
| vfunc_info_get_signal | `vfunc_info_get_signal(info: VFuncInfo) -> SignalInfo` | g_vfunc_info_get_signal |  | Obtain the signal for the virtual function if one is set. The signal comes from the object or interface to which this virtual function belongs. |
| vfunc_info_invoke | `vfunc_info_invoke(info: VFuncInfo, implementor: GType, in_args: Argument, n_in_args: gint, out_args: Argument, n_out_args: gint, return_value: Argument) -> gboolean throws` | g_vfunc_info_invoke |  | Invokes the function described in @info with the given arguments. Note that inout parameters must appear in both argument lists. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ObjectInfoGetValueFunction | `ObjectInfoGetValueFunction(value: GObject.Value) -> gpointer` |  |  | Extract an object instance out of @value |
| ObjectInfoRefFunction | `ObjectInfoRefFunction(object: gpointer?) -> gpointer` |  |  | Increases the reference count of an object instance. |
| ObjectInfoSetValueFunction | `ObjectInfoSetValueFunction(value: GObject.Value, object: gpointer?) -> none` |  |  | Update @value and attach the object instance pointer @object to it. |
| ObjectInfoUnrefFunction | `ObjectInfoUnrefFunction(object: gpointer?) -> none` |  |  | Decreases the reference count of an object instance. |

## Constants

| Name | Type |
| --- | --- |
| MAJOR_VERSION | gint |
| MICRO_VERSION | gint |
| MINOR_VERSION | gint |
| TYPE_TAG_N_TYPES | gint |

## Aliases

| Name | Type |
| --- | --- |
| ArgInfo | BaseInfo |
| CallableInfo | BaseInfo |
| CallbackInfo | BaseInfo |
| ConstantInfo | BaseInfo |
| EnumInfo | BaseInfo |
| FieldInfo | BaseInfo |
| FunctionInfo | BaseInfo |
| InterfaceInfo | BaseInfo |
| ObjectInfo | BaseInfo |
| PropertyInfo | BaseInfo |
| RegisteredTypeInfo | BaseInfo |
| SignalInfo | BaseInfo |
| StructInfo | BaseInfo |
| TypeInfo | BaseInfo |
| UnionInfo | BaseInfo |
| ValueInfo | BaseInfo |
| VFuncInfo | BaseInfo |

