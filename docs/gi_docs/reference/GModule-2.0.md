# GModule 2.0

SQGI import: `import("GModule", "2.0")`

Packages: `gmodule-2.0`
Includes: `GLib-2.0`
Libraries: `libgmodule-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 1 |
| Unions | 0 |
| Enums | 1 |
| Flags | 1 |
| Functions | 4 |
| Callbacks | 2 |
| Constants | 4 |
| Aliases | 0 |

## Enums

### GModule.ModuleError

C type: `GModuleError`

Errors returned by g_module_open_full().

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| check_failed | 1 |  | a module returned an error from its `g_module_check_init()` function |
| failed | 0 |  | there was an error loading or opening a module file |

## Flags

### GModule.ModuleFlags

C type: `GModuleFlags`

Flags passed to g_module_open(). Note that these flags are not supported on all platforms.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| lazy | 1 |  | specifies that symbols are only resolved when needed. The default action is to bind all symbols when the module is loaded. |
| local | 2 |  | specifies that symbols in the module should not be added to the global name space. The default action on most platforms is to place symbols in the ... |
| mask | 3 |  | mask for all flags. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Module |  | 0 | 0 | 10 | The #GModule struct is an opaque data structure to represent a [dynamically-loaded module][glib-Dynamic-Loading-of-Modules]. It should only be acce... |

### GModule.Module

C type: `GModule`

The #GModule struct is an opaque data structure to represent a [dynamically-loaded module][glib-Dynamic-Loading-of-Modules]. It should only be acce...

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| build_path | `build_path(directory: utf8?, module_name: utf8) -> utf8` | g_module_build_path |  | A portable way to build the filename of a module. The platform-specific prefix and suffix are added to the filename, if needed, and the result is a... |
| error | `error() -> utf8` | g_module_error |  | Gets a string describing the last module error. |
| error_quark | `error_quark() -> GLib.Quark` | g_module_error_quark |  |  |
| open | `open(file_name: utf8?, flags: ModuleFlags) -> Module` | g_module_open |  | A thin wrapper function around g_module_open_full() |
| open_full | `open_full(file_name: utf8?, flags: ModuleFlags) -> Module throws` | g_module_open_full | 2.70 | Opens a module. If the module has already been opened, its reference count is incremented. If not, the module is searched using @file_name. Since 2... |
| supported | `supported() -> gboolean` | g_module_supported |  | Checks if modules are supported on the current platform. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| close | `Module.close() -> gboolean` | g_module_close |  | Closes a module. |
| make_resident | `Module.make_resident() -> none` | g_module_make_resident |  | Ensures that a module will never be unloaded. Any future g_module_close() calls on the module will be ignored. |
| name | `Module.name() -> utf8` | g_module_name |  | Returns the filename that the module was opened with. If @module refers to the application itself, "main" is returned. |
| symbol | `Module.symbol(symbol_name: utf8, symbol: out gpointer?) -> gboolean` | g_module_symbol |  | Gets a symbol pointer from a module, such as one exported by %G_MODULE_EXPORT. Note that a valid symbol can be %NULL. |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| module_build_path | `module_build_path(directory: utf8?, module_name: utf8) -> utf8` | g_module_build_path |  | A portable way to build the filename of a module. The platform-specific prefix and suffix are added to the filename, if needed, and the result is a... |
| module_error | `module_error() -> utf8` | g_module_error |  | Gets a string describing the last module error. |
| module_error_quark | `module_error_quark() -> GLib.Quark` | g_module_error_quark |  |  |
| module_supported | `module_supported() -> gboolean` | g_module_supported |  | Checks if modules are supported on the current platform. |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| ModuleCheckInit | `ModuleCheckInit(module: Module) -> utf8` |  |  | Specifies the type of the module initialization function. If a module contains a function named g_module_check_init() it is called automatically wh... |
| ModuleUnload | `ModuleUnload(module: Module) -> none` |  |  | Specifies the type of the module function called when it is unloaded. If a module contains a function named g_module_unload() it is called automati... |

## Constants

| Name | Type |
| --- | --- |
| MODULE_IMPL_AR | gint |
| MODULE_IMPL_DL | gint |
| MODULE_IMPL_NONE | gint |
| MODULE_IMPL_WIN32 | gint |

