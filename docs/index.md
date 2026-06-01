# SQGI Documentation

SQGI is a small Squirrel runtime for building native cross-platform
applications. It connects Squirrel scripts to GLib/GObject libraries through
GObject Introspection, adds async/await, and includes `sqgipkg` for shipping
apps as AppImages, Windows directories, and NSIS installers. Built-in modules
such as `system` provide a small stable surface for runtime and environment
information.

## Start Here

- [Language tutorial](language/00-chapter-map.md): learn Squirrel as SQGI uses
  it, including async and GObject integration.
- [API reference](api/README.md): look up SQGI runtime helpers such as
  `import`, `sqgi.Task`, `sqgi.sleep`, JSON helpers, and GObject helpers.
- [Recipes](recipes/glib.md): practical cookbooks for GLib, Gio, GTK 4,
  GStreamer, libsoup, and GdkPixbuf.
- [Packaging tutorials](packaging/README.md): package scripts, resources,
  native modules, GTK data, AppImages, Windows installers, and cross builds.

## Tiny Example

```squirrel
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

Run a script from a source checkout:

```sh
./build/sqgi my_script.nut
```

Package an app:

```sh
sqgipkg --target all
```

## Build SQGI

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"$(nproc)"
build/sqgi --version
```

Install:

```sh
sudo cmake --install build --prefix /usr/local
```
