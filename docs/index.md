# SQGI Documentation

SQGI is a small Squirrel runtime for building native cross-platform
applications. It connects Squirrel scripts to GLib/GObject libraries through
GObject Introspection, adds async/await, and includes `sqgipkg` for shipping
apps as AppImages, Windows directories, and NSIS installers. Built-in modules
such as `system` provide a small stable surface for runtime and environment
information.

## Start Here

* [Language tutorial](language/00-chapter-map.md): learn Squirrel as SQGI uses
  it, including async and GObject integration.
* [API reference](api/README.md): look up SQGI runtime helpers such as
  `import`, `sqgi.Task`, `sqgi.sleep`, JSON helpers, and GObject helpers.
* [GI reference](gi_docs/index.md): browse generated SQGI-facing maps for
  installed GObject Introspection namespaces and their import names.
* [Recipes](recipes/glib.md): practical cookbooks for GLib, Gio, GTK 4,
  GStreamer, libsoup, and GdkPixbuf.
* [Packaging tutorials](packaging/README.md): package scripts, resources,
  native modules, GTK data, AppImages, Windows installers, and cross builds.

## Quick Start On Windows

The easiest way to try SQGI on Windows is with Ooblerg.

1. Go to https://ooblerg.xyz/ and install the Ooblerg app.
2. Open Ooblerg and install `sqgi`.
3. Install any libraries your script needs, such as `gtk4`, `gstreamer`,
   `libsoup`, or `gdk-pixbuf`.
4. Open a new command prompt or PowerShell window.
5. Write a `.nut` script in any text editor, such as VS Code or Notepad.
6. Run it with `sqgi`.

Save this as `hello.nut`:

```squirrel
local GLib = import("GLib")

print("Hello from SQGI\n")
print("Home directory: " + GLib.get_home_dir() + "\n")
```

Run it:

```bat
sqgi hello.nut
```

For a GTK 4 script, install `gtk4` in Ooblerg and save this as `hello_gtk.nut`:

```squirrel
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

Run it:

```bat
sqgi hello_gtk.nut
```

That is the normal Windows workflow: install SQGI and the native libraries you
want, edit `.nut` files in a normal editor, and run them from a normal command
line.

## Build From Source On Linux

On Ubuntu/Debian-style systems, clone the repository and install the build
dependencies:

```sh
git clone https://github.com/supercamel/sqgi.git
cd sqgi

sudo apt install cmake build-essential pkg-config \
  libglib2.0-dev libgirepository1.0-dev libffi-dev libcairo2-dev
```

Build SQGI:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"$(nproc)"

build/sqgi --version
```

Run a script from the source checkout:

```sh
build/sqgi my_script.nut
```

Install system-wide:

```sh
sudo cmake --install build --prefix /usr/local
```

After installing, you can run scripts directly with:

```sh
sqgi my_script.nut
```

## Build From Source On MSYS2

On MSYS2, use a MinGW-style shell such as UCRT64 or MINGW64. Clone the
repository first:

```sh
git clone https://github.com/supercamel/sqgi.git
cd sqgi
```

The helper script installs the matching CMake, Ninja, compiler, and GLib/GI
dependencies:

```sh
./tools/install-msys2-prereqs.sh ucrt64
```

Then build and install:

```sh
cmake -S . -B build-ucrt64 -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/ucrt64

cmake --build build-ucrt64
cmake --install build-ucrt64
```

Check the installed interpreter:

```sh
sqgi --version
```

## Tiny Async Example

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local loop = GLib.MainLoop.new(null, false)

async function main() {
    local file = Gio.File.new_for_path("README.md")
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

Run it:

```sh
sqgi my_script.nut
```

That is ordinary Squirrel calling native Gio async APIs. No generated bindings,
no per-library glue, and no blocking file read.

## Package An App

From a project directory containing `main.nut`, run:

```sh
sqgipkg
```

Useful packaging targets:

```sh
sqgipkg --target appimage
sqgipkg --target win-dir
sqgipkg --target win-nsis
sqgipkg --target all
```

`sqgipkg --target all` builds the configured Linux and Windows outputs, such as
AppImages, Windows app directories, and NSIS installers.
