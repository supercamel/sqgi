# Chapter 7 - GI Imports and GObject Basics

SQGI's superpower is that it can talk to **the entire GNOME platform** — GLib, GIO, GTK, GStreamer, libsoup, and any other library that ships a GObject Introspection typelib. This chapter introduces the bridge.

## 7.1 What is GObject Introspection?

Most C libraries are *opaque* to scripting languages. To call them, you'd need to write binding code by hand.

GObject Introspection (GI) solves this once. Library authors annotate their C source; the build system emits a binary description called a **typelib**. Any GI-aware runtime can load a typelib and expose the library to scripts automatically — function names, argument types, signal lists, property metadata, the lot.

SQGI is a GI-aware runtime. When you call `import("Gio")`, SQGI:

1. Locates `Gio-2.0.typelib` on disk.
2. Reads every type, function, and constant.
3. Exposes them as Squirrel values reachable from a single namespace table.

## 7.2 `import`

```squirrel
local Gio = import("Gio")
local GLib = import("GLib")
local Gtk = import("Gtk", "4.0")
local system = import("system")
```

- `import("Name")` loads the namespace's default version.
- `import("Name", "Version")` pins a specific version.
- `import("system")` loads SQGI's built-in system information module.

It returns a **namespace table** — a Squirrel table whose keys are the public symbols of that library.
For `system`, the table contains OS, CPU, runtime, path, package, and environment
helpers:

```squirrel
print(system.os.name + " on " + system.cpu.arch + "\n")
print(system.env.get("HOME") + "\n")
```

## 7.3 Calling functions

Module-level functions live directly on the namespace table:

```squirrel
local GLib = import("GLib")
GLib.usleep(100000)               // 0.1 second
local out = GLib.spawn_command_line_sync("echo hi")
```

Methods on objects look exactly the same as Squirrel methods:

```squirrel
local f = Gio.File.new_for_path("/tmp/x.txt")
local data = f.load_contents(null)
```

Some constructors are *named* (`new_for_path`, `new_for_uri`, ...) rather than the default `new`. GI exposes whichever the library declares.

## 7.4 Multi-return values

Many GIO functions return *more than one value* in C, using out-parameters. In SQGI these come back as Squirrel arrays.

```squirrel
local result = f.load_contents(null)
// result is something like: [ true, "contents...", "etag..." ]
local ok       = result[0]
local contents = result[1]
local etag     = result[2]
```

If you don't care about the success flag (a `GError` would have been thrown on failure), index directly:

```squirrel
local contents = f.load_contents(null)[1]
```

The exact shape is documented per call; the rule of thumb is "every C out-parameter becomes an additional array slot, after the C return value".

## 7.5 Properties

GObject types have **properties**: typed key/value slots with change notifications. SQGI exposes them through bracket syntax with the property name as the key.

```squirrel
local Gio = import("Gio")
local app = sqgi.new_object(Gio.Application, { "application-id" = "org.x" })

print(app["application-id"] + "\n")       // read
app["flags"] = Gio.ApplicationFlags.FLAGS_NONE  // write
```

Property names use `-` (hyphen), not `_`. That's the GObject convention.

## 7.6 Enums and flags

Enums become **tables of constants** under the namespace:

```squirrel
local Gio = import("Gio")
print(Gio.FileType.REGULAR + "\n")
print(Gio.ApplicationFlags.FLAGS_NONE + "\n")
```

Flags are integers you OR together:

```squirrel
local mask = Gio.FileQueryInfoFlags.NONE
local mask2 = Gio.FileQueryInfoFlags.NOFOLLOW_SYMLINKS
                | Gio.FileQueryInfoFlags.NONE   // bitwise OR with |
```

Enum names mirror their C names with the prefix stripped. For example, `G_FILE_TYPE_REGULAR` becomes `Gio.FileType.REGULAR`.

## 7.7 Constants

Top-level `#define`s and constants live directly on the namespace:

```squirrel
local GLib = import("GLib")
print(GLib.PRIORITY_DEFAULT + "\n")
```

## 7.8 Reading a directory: a worked example

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local dir = Gio.File.new_for_path(GLib.get_current_dir())
local enumerator = dir.enumerate_children(
    "standard::name,standard::size,standard::type",
    Gio.FileQueryInfoFlags.NONE,
    null
)

while (true) {
    local info = enumerator.next_file(null)
    if (info == null) break
    print(format("%-20s %d bytes  type=%d\n",
        info.get_name(),
        info.get_size(),
        info.get_file_type()
    ))
}
```

What this demonstrates:

- Namespace import.
- Constructor (`new_for_path`).
- Method that returns a complex object (`enumerate_children` → `Gio.FileEnumerator`).
- Looping until a method returns `null` to indicate "no more items".
- Calling methods on the yielded info objects.

## 7.9 Discovering an API

When you don't know what a namespace contains, three approaches work:

1. **Use the GNOME developer docs**. Search for the C symbol name and translate: `g_file_load_contents` → `f.load_contents` (with `Gio.File f`).
2. **List the keys**: `foreach (k in Gio) print(k + "\n")` (works because namespaces are tables).
3. **Read the demos**. The `demo/` directory contains worked examples for `gio`, `glib`, `gstreamer`, `gtk4`, and `soup`.

## 7.10 Naming conventions cheat sheet

| C name | SQGI form |
|---|---|
| `GFile` (type) | `Gio.File` |
| `g_file_new_for_path` (constructor) | `Gio.File.new_for_path` |
| `g_file_load_contents` (method) | `file.load_contents` |
| `G_FILE_TYPE_REGULAR` (enum value) | `Gio.FileType.REGULAR` |
| `g-file-error` (error domain) | `e.domain == "g-file-error"` |
| Property `application-id` | `obj["application-id"]` |
| Signal `notify::application-id` | `"notify::application-id"` in `connect` |

## 7.11 Exercises

1. List the contents of `/etc` using `Gio.File` and print each file's size.
2. Use `GLib.get_user_data_dir()` and pretty-print the result.
3. Use `Gio.File.new_for_path` plus `monitor_file` to print "changed" when a file is modified (signal handling is in chapter 8).
4. Open `demo/gio/run.nut` and identify every GI call by what it returns.

## 7.12 What's next

Chapter 8 covers GObject properties in depth, connecting to signals, and writing your own GObject subclasses in pure Squirrel.
