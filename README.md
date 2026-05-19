# SQGI

**A lightweight Squirrel runtime for native cross-platform applications.**

SQGI combines a small, embeddable scripting runtime with direct access to
native desktop, multimedia, networking, and system libraries. Build GTK apps,
media tools, HTTP clients, local services, automation utilities, and native
desktop software using a familiar scripting language with `async` / `await`,
native extensions, and portable packaging.

Under the hood, SQGI uses GObject Introspection to expose mature native
libraries like GTK, Gio, GStreamer, libsoup, WebKit, GdkPixbuf, and many
others without generating bindings by hand.

The goal is simple: keep the scripting experience pleasant while staying close
to the native platform.

- **Familiar scripting**: Squirrel syntax, closures, classes, exceptions,
  modules, and `async` / `await`.
- **Small runtime**: a compact C runtime designed to stay lightweight,
  understandable, and embeddable.
- **Native capabilities**: build GUIs, network tools, multimedia apps,
  image pipelines, and system utilities with direct access to native APIs.
- **Native extensions**: call your own C/C++/Vala libraries through `.so`
  + `.typelib` files.
- **Portable packaging**: `sqgipkg` bundles scripts, resources, typelibs,
  plugins, native libraries, AppImages, Windows directories, and NSIS
  installers.
- **AI-friendly workflows**: coherent APIs and a compact runtime make SQGI
  practical for modern AI-assisted development workflows.

## A Tiny Demo

```squirrel
#!/usr/bin/env sqgi

local GLib = import("GLib")
local Gio = import("Gio")

local loop = GLib.MainLoop.new(null, false)

async function main() {
    local file = Gio.File.new_for_path("/etc/os-release")
    local result = await file.load_contents_async(null)
    print(result[0])
    loop.quit()
}

main().catch(function(e) {
    print("error: " + e + "\n")
    loop.quit()
})

loop.run()
```

That is ordinary Squirrel calling native Gio async APIs. No generated bindings,
no per-library glue.

## Quick Start

```sh
git clone https://github.com/supercamel/sqgi.git
cd sqgi

sudo apt install cmake build-essential pkg-config \
  libglib2.0-dev libgirepository1.0-dev libffi-dev libcairo2-dev

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"$(nproc)"

build/sqgi --version
build/sqgi demo/gio/file_read.nut README.md
```

Install:

```sh
sudo cmake --install build --prefix /usr/local
```

This installs:

- `sqgi`
- `sqgipkg`
- `libsqgi.so`
- public headers under `include/sqgi/`
- `sqgi.pc` for `pkg-config`
- sqgipkg starter templates under `share/sqgi/sqgipkg_templates/`

## What You Can Build

SQGI is useful anywhere you want native desktop and system capabilities with
scripting speed:

- GTK 4 apps and internal tools
- Gio filesystem/network/process utilities
- GStreamer media tools and visual experiments
- libsoup HTTP clients and local services
- image processing pipelines with GdkPixbuf
- scriptable native apps that expose their own C API
- small AppImage or Windows installer distributed desktop utilities

## Import Native Libraries

Any introspected library can be imported by namespace:

```squirrel
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local Gst = import("Gst")
local Soup = import("Soup")
local Pixbuf = import("GdkPixbuf")
```

Constructors, methods, properties, signals, out parameters, `GError`, `GValue`,
`GVariant`, byte arrays, and boxed/object ownership are handled by the runtime.

```squirrel
local app = Gtk.Application.new("org.example.demo", 0)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.title = "SQGI"
    win.set_default_size(320, 160)
    win.present()
})

app.run(0, null)
```

## Async That Feels Like Scripting

Gio-style `_async` / `_finish` pairs become awaitable methods:

```squirrel
local Gio = import("Gio")

async function read_text(path) {
    local file = Gio.File.new_for_path(path)
    local result = await file.load_contents_async(null)
    return result[0]
}
```

SQGI also provides `Task`, `Task.cancel()`, `sqgi.sleep`, `sqgi.all`,
`sqgi.race`, and JS-style `.then()` / `.catch()` chaining.

## Extend With C, C++, Or Vala

If your native code exposes GObject Introspection metadata, SQGI can call it.
The usual shape is:

```text
native/build/libmyapp-1.0.so
native/build/MyApp-1.0.typelib
```

Then:

```squirrel
local MyApp = import("MyApp", "1.0")
local worker = MyApp.Worker.new()
print(worker.do_native_work("hello") + "\n")
```

This works for hand-written C/C++ GObject libraries and Vala libraries. Vala
async methods can be awaited directly when exposed through GI.

There are working packaging tests for both styles:

```text
tools/sqgipkg_tests/native_gi_project/
tools/sqgipkg_tests/native_vala_project/
```

## Package Apps

`sqgipkg` packages SQGI projects for distribution. From a directory containing
`main.nut`, the default command discovers project scripts, compiles `.nut` files
to `.cnut` bytecode, bundles resources, stages the SQGI runtime, and builds a
Linux AppImage:

```sh
sqgipkg
```

Add a manifest only when the defaults are not enough:

```sh
sqgipkg --init gtk4
sqgipkg --doctor
sqgipkg --smoke-test ""
```

Useful targets:

```sh
sqgipkg --target appimage
sqgipkg --target win-dir
sqgipkg --target win-nsis
sqgipkg --target all
```

`--target all` writes Linux output to `dist-linux/` and Windows output to
`dist-windows/`, so platform artifacts do not overwrite each other.

Manifests can include:

- Squirrel scripts compiled to `.cnut`
- images and project resources
- native shared libraries
- GObject Introspection typelibs
- GStreamer plugins
- GTK/GSettings/Gio/GdkPixbuf data and modules
- GTK theme/settings selection
- Windows MSYS2 packages, DLL closure, and NSIS installer options

For native C/C++/Vala apps, `sqgipkg` can also package a native executable
entrypoint directly while still bundling SQGI payload scripts and resources.

See [tools/README.md](tools/README.md) for the full packaging guide.

## Embed SQGI

SQGI can also be embedded into a native application.

```sh
gcc myapp.c $(pkg-config --cflags --libs sqgi)
```

The public C entry point is [src/sqgi_vm.h](src/sqgi_vm.h). Installed headers
are placed under `include/sqgi/`.

## Development

Run the main test suite:

```sh
./test/run_tests.sh
```

Run CTest directly:

```sh
ctest --test-dir build --output-on-failure
```

AddressSanitizer build:

```sh
cmake -S . -B build-asan -DSQGI_ENABLE_ASAN=ON
cmake --build build-asan -j"$(nproc)"
```

## Examples And Docs

| You want to... | Go here |
|----------------|---------|
| Learn the language as SQGI uses it | [docs/language/](docs/language/) |
| Look up SQGI runtime APIs | [docs/api/README.md](docs/api/README.md) |
| Follow library-specific recipes | [docs/recipes/](docs/recipes/) |
| Browse runnable examples | [demo/](demo/) |
| Package Linux/Windows apps | [tools/README.md](tools/README.md) |

The demos cover GLib, Gio, libsoup, GStreamer, GdkPixbuf, GTK 4, AppImage
packaging, Windows staging, GTK theme packaging, native executable entries, and
native GI extension projects.

## Under The Hood

SQGI is built from a small set of C modules:

```text
src/
  main.c             CLI entry point and REPL
  sqgi_vm.c          VM setup and standard library wiring
  sqgi_import.c      import("Module") for typelibs and .nut files
  sqgi_gi.c          GIRepository function dispatch
  sqgi_gi_object.c   object wrappers, properties, async wrappers
  sqgi_marshal.c     GIArgument / GValue / GVariant conversion
  sqgi_signal.c      GObject signals with cross-thread dispatch
  sqgi_async.c       Task runtime and async/await support
  sqgi_subclass.c    GType registration and vfunc overrides
  sqgi_cairo.c       cairo Context / Surface / Pattern bridge
  sqgi_json.c        dependency-free JSON codec
```

The runtime uses GObject Introspection metadata plus libffi closures, so it can
call broad native API surfaces without generating bindings for each library.

## Status

SQGI is a working technology preview. It has broad test coverage across
marshalling, async, signals, GObject properties, subclassing, GVariant/GValue,
JSON, Cairo, and real library recipes. The project is still young, so unusual
GI metadata shapes may expose bugs. Small, focused bug reports are very welcome.

## License

SQGI is released under the MIT license. See [LICENSE](LICENSE). The Squirrel
sources under `Squirrel3/` retain their upstream copyright.
