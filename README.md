# SQGI

<p align="center">
  <img src="images/sqgi_logo.png" alt="SQGI logo" width="180">
</p>

**SQGI is one of the fastest ways to build and deploy small native
cross-platform GTK/GI apps: write the app, push a tag, get Linux AppImages and
a Windows installer from CI.**

It gives you a compact Squirrel runtime with direct access to real platform
libraries through GObject Introspection. That means you can write desktop,
media, network, and system tools using GTK, Gio, GStreamer, libsoup,
GdkPixbuf, Cairo, and other native libraries without hand-written bindings for
every API.

The result is a practical middle path between heavyweight app platforms and
low-level native code:

- lighter than Electron
- friendlier than writing everything in C or C++
- more portable than GJS for Windows-oriented projects
- easier to extend than a sealed scripting sandbox
- practical to package as AppImages, Windows directories, or NSIS installers

SQGI's goal is simple: **keep scripting pleasant, stay close to the native
platform, and make shipping feel like part of the workflow.**

Read the docs: https://sqgi.readthedocs.io/en/latest/

Join the community on Discord: https://discord.gg/krVe8U9wGm


## What You Can Build

SQGI is useful for:

- GTK 4 desktop applications
- Gio filesystem, networking, process, and application utilities
- GStreamer media tools, overlays, capture utilities, and experiments
- libsoup HTTP clients, API tools, and local services
- GdkPixbuf and Cairo image/graphics utilities
- automation tools that need native OS integration
- scriptable native apps with a C/C++/Vala core
- AppImage and Windows desktop utilities distributed outside a package manager

## Features

- **Squirrel scripting**: closures, classes, exceptions, modules, and compact
  JavaScript-like syntax, with signed 64-bit integers and double-precision floats.
- **Modern async**: `async` / `await`, `Task`, `sqgi.sleep`, `sqgi.all`,
  `sqgi.race`, and `.then()` / `.catch()` chaining.
- **GObject Introspection**: import introspected libraries directly with
  `import("Gtk", "4.0")`, `import("Gio")`, `import("Gst")`, and friends.
- **Native API coverage**: constructors, methods, properties, signals,
  callbacks, `GError`, `GValue`, `GVariant`, byte arrays, boxed values, and
  ownership handling.
- **Native extensions**: call your own C, C++, or Vala GObject libraries through
  normal shared libraries and `.typelib` files.
- **Embeddable runtime**: use SQGI as a standalone interpreter or embed it in a
  native application.
- **Portable packaging**: `sqgipkg` can bundle scripts, resources, typelibs,
  plugins, native libraries, private Linux/Windows dependency sysroots,
  AppImages, Windows app directories, and NSIS installers.
- **Static analysis**: `sqgicheck` catches syntax errors and definite GI API,
  arity, property, signal, and local-import mistakes without running the app.
- **AI-friendly workflow**: the runtime is small, the language is familiar, and
  the underlying libraries are well-documented, which makes SQGI practical for
  AI-assisted development.

## LLVM JIT and Typed Kernels

SQGI offers two complementary ways to speed up hot code:

- **LLVM bytecode JIT** compiles eligible hot ordinary Squirrel code, including
  numeric loops and object operations. Guards preserve dynamic behavior, with
  interpreter fallback when an optimization does not apply.
- **Typed kernels** let you write hot sections in a small, explicitly typed
  C-like language with functions, structs, typed classes, arrays, and math
  intrinsics. LLVM compiles them into native code at runtime, and Squirrel calls
  them through `sqgi.kernel`. Kernels can run independently of the bytecode JIT.

Both are experimental and **opt-in**. With the normal build dependencies plus
LLVM 18 development headers and its matching library installed:

```sh
cmake -S . -B build-llvm -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DSQ_ENABLE_JIT=ON -DSQGI_BYTECODE_JIT_BACKEND=LLVM \
  -DSQGI_THREADED_DISPATCH=ON \
  -DSQGI_ENABLE_KERNELS=ON -DSQGI_KERNEL_BACKEND=LLVM
cmake --build build-llvm -j"$(nproc)"
build-llvm/sqgi demo/kernels/geometry.nut
```

### Selected performance results

Measured on Linux x86-64, Intel i7-12700, against **Node.js 26.9.0** on
2026-09-18. Times are **nanoseconds per loop iteration**, medians of five rounds;
lower is better. Runs use one pinned CPU, five warmups, a JIT threshold of one,
and no LTO/PGO. Compilation is excluded; checksums matched across runtimes.

| SQGI execution | Workload | SQGI | Node.js | Native C++ |
|---|---|---:|---:|---:|
| Ordinary Squirrel JIT | Direct function call | 3.156 | 4.003 | 3.776 |
| Ordinary Squirrel JIT | Branching function call | 3.223 | 3.022 | 2.703 |
| Ordinary Squirrel JIT | Dynamic member operations | 6.025 | 28.056 | 26.930 |
| Typed kernel | Vector recurrence | 8.425 | 112.542 | 8.485 |
| Typed kernel | Matrix recurrence | 7.025 | 8.615 | 5.670 |

These are selected warm microbenchmarks, not application-wide speed guarantees.
Kernel SQGI/Node timings come from separate dedicated comparisons, with a
complete loop per Squirrel-to-kernel call; C++ timings come from the refreshed
runtime comparison. The vector kernel uses fixed storage, while the Node
version uses objects; it is not an allocation-free JavaScript comparison.
Batching work also amortizes call overhead, so a tiny individual kernel call can
have a different performance profile.

Native C++ uses GCC 13.3.0 with `-O3 -march=native`,
`-fno-fast-math`, and `-ffp-contract=off`. Its ports use typed fields and fixed arrays, with
`std::unordered_map` for dynamic string keys. Data representation and compiler
specialization affect the comparison. The vector kernel roughly matches native
C++ here; the matrix kernel remains slower.

See the [JIT/C++ results and raw samples](docs/benchmark-results/readme-native-comparison-2026-09-18.json),
[kernel vector comparison](docs/benchmark-results/llvm-kernel-vector-2026-09-18.json),
and [kernel matrix comparison](docs/benchmark-results/llvm-kernel-matrix-2026-09-18.json).
The [kernel guide](docs/kernels/README.md) covers the language, Squirrel API,
platform support, and deployment requirements; the
[benchmark suite](demo/benchmarks/kernels/README.md) includes more workloads and
reproduction commands.

## A Tiny Demo

```squirrel
#!/usr/bin/env sqgi

local GLib = import("GLib")
local Gio  = import("Gio")

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
no per-library glue, and no blocking file read.

## GTK Example

```squirrel
#!/usr/bin/env sqgi

local Gtk = import("Gtk", "4.0")

local app = Gtk.Application.new("org.example.sqgi.demo", 0)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.title = "SQGI"
    win.set_default_size(360, 180)

    local button = Gtk.Button.new_with_label("Hello from SQGI")
    button.connect("clicked", function() {
        print("clicked\n")
    })

    win.set_child(button)
    win.present()
})

app.run(0, null)
```

## Quick Start

### Windows with Ooblerg

The easiest way to try SQGI on Windows is through Ooblerg.

1. Go to https://ooblerg.xyz/ and install the Ooblerg app.
2. Open Ooblerg and install `sqgi`.
3. Install any native libraries your script needs, such as `gtk4`, `gstreamer`,
   `libsoup`, or `gdk-pixbuf`.
4. Open a terminal after Ooblerg has updated your `PATH`.
5. Write a `.nut` file in any text editor, such as VS Code or Notepad.
6. Run it with `sqgi`.

For example, save this as `hello.nut`:

```squirrel
#!/usr/bin/env sqgi

local Gtk = import("Gtk", "4.0")

local app = Gtk.Application.new("org.example.sqgi.hello", 0)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.title = "Hello SQGI"
    win.set_default_size(360, 180)

    local button = Gtk.Button.new_with_label("Hello from SQGI")
    win.set_child(button)
    win.present()
})

app.run(0, null)
```

Then run:

```bat
sqgi hello.nut
```

That is it: install SQGI and the libraries you want, edit `.nut` files in a
normal editor, and run them from a normal Windows command line.

### Build from source on Linux

On Ubuntu/Debian-style systems:

```sh
git clone https://github.com/supercamel/sqgi.git
cd sqgi

sudo apt install cmake build-essential pkg-config \
  libglib2.0-dev libgirepository1.0-dev libffi-dev libcairo2-dev

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"$(nproc)"

build/sqgi --version
build/sqgi demo/gio/file_read.nut README.md
build/sqgicheck demo/gio/file_read.nut
```

Install:

```sh
sudo cmake --install build --prefix /usr/local
```

### Build from source on MSYS2

On MSYS2, use a MinGW-style shell such as UCRT64 or MINGW64. The helper script
installs the matching CMake, Ninja, compiler, and GLib/GI dependencies:

```sh
./tools/install-msys2-prereqs.sh ucrt64

cmake -S . -B build-ucrt64 -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/ucrt64
cmake --build build-ucrt64
cmake --install build-ucrt64
```

This installs:

- `sqgi`
- `sqgipkg`
- `sqgicheck`
- `libsqgi.so`
- public headers under `include/sqgi/`
- `sqgi.pc` for `pkg-config`
- `sqgipkg` runtime modules under `share/sqgi/sqgipkg_lib/`
- `sqgipkg` starter templates under `share/sqgi/sqgipkg_templates/`

## Import Native Libraries

Any available introspected namespace can be imported:

```squirrel
local GLib   = import("GLib")
local Gio    = import("Gio")
local Gtk    = import("Gtk", "4.0")
local Gst    = import("Gst")
local Soup   = import("Soup")
local Pixbuf = import("GdkPixbuf")
```

SQGI uses GI metadata at runtime, so broad native APIs become available without
binding generation. The runtime handles common GI shapes including methods,
constructors, properties, signals, callbacks, out parameters, errors, and native
ownership conventions.

## Check Source Without Running It

`sqgicheck` compiles source with SQGI's bundled Squirrel compiler, then
abstractly interprets its bytecode against the same GI metadata used by the
runtime. It does not execute the checked program. For example, it catches a
misspelled method and suggests the real API:

```text
main.nut:8:6: error SQGI102: Gio.File has no method 'get_paht'
  help: did you mean 'get_path'?
```

```sh
sqgicheck main.nut
sqgicheck --format=json main.nut
sqgicheck --summary main.nut
sqgicheck --no-recursive main.nut
```

Literal local imports such as `import("lib/helpers.nut")` are checked
recursively by default, and statically known exported tables, functions, and
classes flow into their importers. `--summary` reports checked files and
operations skipped because a value was unknown. A clean check exits with
status 0; diagnostics exit with status 1; invalid command-line usage exits
with status 2, so the same command works as a local check or CI gate. See the
[complete sqgicheck guide](docs/sqgicheck.md) for installation, diagnostic
codes, JSON output, project/import behavior, CI integration, troubleshooting,
and limitations.

## Async / Await

Gio-style `_async` / `_finish` pairs are exposed as awaitable methods:

```squirrel
local Gio = import("Gio")

async function read_text(path) {
    local file = Gio.File.new_for_path(path)
    local result = await file.load_contents_async(null)
    return result[0]
}
```

SQGI also provides task helpers:

```squirrel
local results = await sqgi.all([
    read_text("README.md"),
    read_text("LICENSE")
])
```

## Native Extensions

If your native code exposes GObject Introspection metadata, SQGI can call it.
The usual extension shape is:

```text
native/build/libmyapp-1.0.so
native/build/MyApp-1.0.typelib
```

Then from Squirrel:

```squirrel
local MyApp = import("MyApp", "1.0")
local worker = MyApp.Worker.new()
print(worker.do_native_work("hello") + "\n")
```

This works with hand-written C/C++ GObject libraries and with Vala libraries.
Vala async methods can be awaited directly when exposed through GI.

Working examples live in:

```text
tools/sqgipkg_tests/native_gi_project/
tools/sqgipkg_tests/native_vala_project/
```

## Packaging Apps

`sqgipkg` packages SQGI applications for distribution. Start with the
[simple manifest guide](docs/packaging/10-simple-manifests.md) for built-in runtime
and native-library recipes, or run `sqgipkg --help` for the common workflow.

From a directory containing `main.nut`:

```sh
sqgipkg
```

On Linux, this builds an AppImage (on Windows, the default is an NSIS installer):

```text
dist-linux-<arch>/<project-name>.AppImage
```

Add a manifest when the defaults are not enough:

```sh
sqgipkg --init gtk4
sqgipkg --doctor
sqgipkg --smoke-test ""
```

Starter manifests are intentionally small. For portable GTK/GStreamer packages,
add the runtime packages or enable `linux.deb.download` / `--linux-deb-download`
so `sqgipkg` can prepare a private Debian/Ubuntu sysroot instead of relying on
whatever happens to be installed on the host.

Useful targets:

```sh
sqgipkg --target appimage
sqgipkg --target linux-sysroot
sqgipkg --target win-dir
sqgipkg --target win-nsis
sqgipkg --target win-sysroot
sqgipkg --target all
```

`linux-sysroot` prepares Linux target dependencies and generated CMake/Meson
cross files without building the app. `all` builds Linux AppImage output and a
Windows NSIS package; when `linux.arches` is configured it builds each listed
Linux architecture.

Clean generated package output and build directories with:

```sh
sqgipkg --clean
```

`sqgipkg` can stage:

- `.nut` scripts compiled to `.cnut` bytecode
- compatibility `.nut` paths for script imports
- resources and exact files
- native `.so` / `.dll` libraries
- GObject Introspection typelibs
- GStreamer plugins
- GTK themes, icons, settings, and runtime data
- GSettings schemas
- GIO modules
- gdk-pixbuf loaders
- Debian/Ubuntu packages into isolated Linux sysroots
- generated Linux CMake/Meson cross files with `pkg-config` isolation
- Windows MSYS2 packages
- Windows recursive DLL dependency closure
- generated AppImage and Windows launchers
- NSIS installers with icon/license/shortcut options

For AppImages, smoke tests can run the built package immediately, and
cross-architecture smoke tests use QEMU user-mode/binfmt when the matching
emulator and target sysroot are available.

For guided packaging tutorials, see [docs/packaging/](docs/packaging/). For the
broader packaging reference, see [tools/README.md](tools/README.md).

## Windows Packaging

SQGI includes a serious Windows packaging path.

For script apps and native-extension apps, `sqgipkg` can create:

```text
dist-windows-x86_64/MyApp/
  MyApp.bat
  bin/sqgi.exe
  bin/*.dll
  share/sqgi/app/main.cnut
  share/sqgi/app/resources/
  lib/girepository-1.0/*.typelib
```

It can also generate an NSIS installer:

```text
dist-windows-x86_64/MyApp-Setup.exe
```

On Linux hosts, `sqgipkg` can prepare an MSYS2-style sysroot, download packages,
resolve dependencies, generate CMake/Meson cross files, isolate `pkg-config`,
and recursively copy DLL dependencies.

GUI apps do not need to carry a visible Windows console. `sqgipkg` supports a
Windows manifest option:

```json
"windows": {
  "console": false
}
```

By default this is inferred for GTK-looking apps. During Windows cross builds,
the generated CMake toolchain sets `SQGI_WINDOWS_GUI=ON`, so the packaged
`sqgi.exe` is built with the Windows GUI subsystem. Use `"console": true` or
`--windows-console` when you want a visible console for debugging.

For current Ubuntu stock MinGW cross-builds, pair the stock
`x86_64-w64-mingw32-*` toolchain with MSYS2 `mingw64` packages:

```text
x86_64-w64-mingw32-gcc/g++ -> MSYS2 mingw64 packages
```

For native MSYS2 UCRT64 builds, use a matching UCRT64 compiler and matching
UCRT64 packages:

```text
MSYS2 UCRT64 gcc/clang -> MSYS2 ucrt64 packages
```

Do not mix compiler CRT families and dependency package families.

## Native Executable Entrypoints

`sqgipkg` can also package native applications that do not launch through the
SQGI interpreter directly. This is useful for C/C++/Vala apps that embed SQGI or
ship SQGI scripts as an internal payload.

```json
{
  "name": "MyNativeApp",
  "entry": {
    "type": "native",
    "linux": "native/build/myapp",
    "windows": "native/build-windows-x86_64/myapp.exe"
  },
  "script_dirs": ["scripts"]
}
```

The native executable becomes the launcher entrypoint, while scripts, resources,
typelibs, GTK data, and Windows dependencies can still be bundled.

## Embed SQGI

SQGI can be embedded in a native application:

```sh
gcc myapp.c $(pkg-config --cflags --libs sqgi)
```

The public C entry point is [src/sqgi_vm.h](src/sqgi_vm.h). Installed headers
are placed under `include/sqgi/`.

## Examples And Documentation

| You want to... | Go here |
|---|---|
| Learn the language as SQGI uses it | [docs/language/](docs/language/) |
| Look up SQGI runtime APIs | [docs/api/README.md](docs/api/README.md) |
| Follow library-specific recipes | [docs/recipes/](docs/recipes/) |
| Browse runnable examples | [demo/](demo/) |
| Learn app packaging step by step | [docs/packaging/](docs/packaging/) |
| Look up packaging fields and targets | [tools/README.md](tools/README.md) |

The demos cover GLib, Gio, GTK 4, GStreamer, libsoup, GdkPixbuf, Cairo,
AppImage packaging, Windows staging, GTK theme packaging, native executable
entries, and native GI extension projects.

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
  sqgi_cairo.c       Cairo Context / Surface / Pattern bridge
  sqgi_json.c        dependency-free JSON codec
```

The runtime uses GObject Introspection metadata plus libffi closures, so it can
call broad native API surfaces without generating bindings for each library.

## Development

Run the main script/runtime tests:

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

Run packaging tests:

```sh
bash tools/sqgipkg_tests/run_tests.sh build/sqgi
```

Run static-analysis tests:

```sh
ctest --test-dir build -R sqgicheck --output-on-failure
```

## Status

SQGI is a working technology preview.

It has broad test coverage across marshalling, async, signals, GObject
properties, subclassing, GVariant/GValue, JSON, Cairo, and real library demos.
The project is still young, and unusual GI metadata shapes may expose bugs.
Small, focused bug reports and reproducible demos are welcome.

## License

SQGI is released under the MIT license. See [LICENSE](LICENSE).

The Squirrel sources under `Squirrel3/` retain their upstream copyright.
