# sqgipkg

`sqgipkg` packages SQGI/Squirrel applications for distribution.

The main target today is AppImage. The tool bundles the SQGI runtime, compiles
your Squirrel scripts to `.cnut` bytecode, stages app resources, writes an
`AppRun`, and optionally runs diagnostics or a smoke test.

It is intentionally not a full Linux dependency solver. For GTK, GStreamer, and
other plugin-heavy stacks, `sqgipkg` gives you clear manifest hooks and warnings
instead of guessing what your app needs.

## Quick Start

From a project directory with a `main.nut`:

```sh
build/sqgi tools/sqgipkg main.nut --name MyApp --target appimage
```

This writes:

```text
dist/MyApp.AppImage
```

For real projects, prefer a manifest:

```sh
build/sqgi tools/sqgipkg --init simple
build/sqgi tools/sqgipkg --manifest sqgipkg.json --doctor
build/sqgi tools/sqgipkg --manifest sqgipkg.json --smoke-test "--timeout=2"
```

Run the result:

```sh
APPIMAGE_EXTRACT_AND_RUN=1 dist/MyApp.AppImage
```

`APPIMAGE_EXTRACT_AND_RUN=1` is useful during development because it avoids
requiring FUSE support on the host.

## What sqgipkg Promises

`sqgipkg` is designed to handle the SQGI-owned parts of your app:

- copies the `sqgi` binary and `libsqgi.so`
- compiles `.nut` scripts to `.cnut` bytecode by default
- keeps `.nut` compatibility links so existing imports still work
- stages project resources
- stages exact manual payload files
- can run declared native builds and stage their `.so`/`.typelib` outputs
- stages declared plugin/type data buckets
- writes AppImage metadata, icon, desktop file, and `AppRun`
- reports what was bundled
- can run a post-build smoke test

`sqgipkg` does not automatically discover every GTK/GStreamer/system library
dependency. If your app needs extra files, declare them in the manifest.

## Starter Manifests

Create a starter manifest:

```sh
build/sqgi tools/sqgipkg --init simple
build/sqgi tools/sqgipkg --init gtk4
build/sqgi tools/sqgipkg --init gtk4-gstreamer
build/sqgi tools/sqgipkg --init native-gobject
build/sqgi tools/sqgipkg --init native-vala
```

The templates are also checked into:

```text
tools/sqgipkg_templates/
```

## Basic Manifest

```json
{
  "script": "main.nut",
  "name": "MyApp",
  "target": "appimage",
  "script_dirs": [
    "."
  ],
  "resources": [
    "assets"
  ]
}
```

Build it:

```sh
build/sqgi tools/sqgipkg --manifest sqgipkg.json
```

## Script Packaging

By default, scripts are compiled to `.cnut` bytecode.

If your manifest has:

```json
{
  "script": "main.nut",
  "script_dirs": [
    "."
  ]
}
```

the AppDir will contain files like:

```text
usr/share/sqgi/app/main.cnut
usr/share/sqgi/app/main.nut -> main.cnut
usr/share/sqgi/app/module.cnut
usr/share/sqgi/app/module.nut -> module.cnut
```

`AppRun` executes `main.cnut` directly. The `.nut` paths are symlinks so code
that imports a module by its `.nut` path continues to work:

```squirrel
local module = import("module.nut")
```

For development/debug source packages, disable compilation:

```sh
build/sqgi tools/sqgipkg --manifest sqgipkg.json --no-compile-scripts
```

or:

```json
{
  "compile_scripts": false
}
```

## Manifest Reference

### Core Fields

`script`

The entrypoint Squirrel script.

```json
"script": "main.nut"
```

`name`

The application name. This is used for the output filename and desktop metadata.

```json
"name": "Squrl"
```

`target`

The package target. Currently `appimage` is implemented. `appdir` and `tarball`
are reserved placeholders.

```json
"target": "appimage"
```

`script_dirs`

Directories to recursively scan for `.nut` scripts. Paths are relative to the
manifest file. Generated/build directories such as `dist`, `build`, `.git`, and
`*.AppDir` are skipped.

```json
"script_dirs": [
  ".",
  "src"
]
```

`scripts`

Individual script modules to package. Use this when you do not want to include a
whole directory.

```json
"scripts": [
  "src/config.nut",
  {
    "path": "src/ui/window.nut",
    "dest": "ui/window.nut"
  }
]
```

Script destinations are placed under:

```text
usr/share/sqgi/app/
```

`resources`

Project-owned data copied under:

```text
usr/share/sqgi/app/resources/
```

Example:

```json
"resources": [
  "assets",
  "data/defaults.json"
]
```

At runtime, `AppRun` exports:

```sh
SQGI_APP_RESOURCES="${APPDIR}/usr/share/sqgi/app/resources"
```

`files`

Exact manual file copies. This is the escape hatch for anything that does not
fit a convenience bucket.

```json
"files": [
  {
    "path": "data/pipeline.conf",
    "dest": "usr/share/sqgi/app/pipeline.conf"
  },
  "themes/custom.css=usr/share/sqgi/app/themes/custom.css"
]
```

The destination is always relative to the AppDir root. Absolute destinations and
`..` path segments are rejected.

`libraries`

Shared libraries copied under:

```text
usr/lib/
```

Example:

```json
"libraries": [
  "native/build/libmyapp-1.0.so"
]
```

At runtime, `AppRun` adds `usr/lib` to `LD_LIBRARY_PATH`, so libraries staged
here can be loaded by GI, plugins, or your app.

`native_projects`

Native build projects that `sqgipkg` should build before staging files. This is
the recommended shape for C/C++ GObject or Vala libraries that produce a shared
library and a GObject Introspection typelib.

```json
"native_projects": [
  {
    "dir": "native",
    "build": [
      "meson setup build --wipe || meson setup build",
      "meson compile -C build"
    ],
    "libraries": [
      "build/libmyapp-1.0.so"
    ],
    "typelibs": [
      "build/MyApp-1.0.typelib"
    ],
    "files": [
      {
        "path": "build/extra.dat",
        "dest": "usr/share/sqgi/app/extra.dat"
      }
    ]
  }
]
```

Paths inside a `native_projects` entry are relative to that entry's `dir`.
Build commands run from that directory.

`libraries` are copied to:

```text
usr/lib/
```

`typelibs` are copied to:

```text
usr/lib/girepository-1.0/
```

Native project `files` use exact AppDir destinations, just like top-level
`files`.

### Convenience Payload Buckets

These are shortcuts for common runtime locations:

```json
{
  "gstreamer_plugins": [
    "/usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgstcoreelements.so"
  ],
  "typelibs": [
    "/usr/lib/x86_64-linux-gnu/girepository-1.0/Gtk-4.0.typelib"
  ],
  "gsettings_schemas": [
    "schemas/org.example.myapp.gschema.xml"
  ],
  "gtk_data": [
    "share"
  ],
  "gio_modules": [
    "/usr/lib/x86_64-linux-gnu/gio/modules"
  ],
  "gdk_pixbuf_loaders": [
    "/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders"
  ]
}
```

They stage files into:

```text
gstreamer_plugins  -> usr/lib/gstreamer-1.0
typelibs           -> usr/lib/girepository-1.0
gsettings_schemas  -> usr/share/glib-2.0/schemas
gtk_data           -> usr/share
gio_modules        -> usr/lib/gio/modules
gdk_pixbuf_loaders -> usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
```

When relevant tools are available, `sqgipkg` also tries to generate supporting
caches:

- `glib-compile-schemas`
- `gio-querymodules`
- `gdk-pixbuf-query-loaders`

### Tooling Fields

`build_dir`

Where to find `sqgi` and `libsqgi.so.0`.

```json
"build_dir": "../../build"
```

The default is:

```text
build
```

`output`

Where to write the AppDir/AppImage.

```json
"output": "dist"
```

`appimagetool`

Path to an `appimagetool` executable.

```json
"appimagetool": "/opt/appimagetool-x86_64.AppImage"
```

If not found, `sqgipkg` downloads the latest continuous `appimagetool` release
for the current architecture.

`appimagetool_cache`

Where downloaded `appimagetool` binaries are cached.

```json
"appimagetool_cache": ".cache/sqgipkg"
```

`refresh_appimagetool`

Force a fresh `appimagetool` download.

```json
"refresh_appimagetool": true
```

`keep_appdir`

Keep the staged AppDir after the AppImage is built.

```json
"keep_appdir": true
```

This is useful for inspecting exactly what was bundled.

## Command-Line Options

Most manifest fields have command-line equivalents:

```sh
build/sqgi tools/sqgipkg main.nut \
  --name MyApp \
  --target appimage \
  --script-dir . \
  --resource assets \
  --file data/config.json=usr/share/sqgi/app/config.json \
  --keep-appdir
```

Useful options:

```text
--manifest FILE
--name NAME
--target appimage
--build-dir DIR
--output DIR
--appimagetool PATH
--appimagetool-cache DIR
--refresh-appimagetool
--keep-appdir
--no-compile-scripts
--script SPEC
--script-dir DIR
--file PATH=DEST
--library PATH
--resource PATH
--gstreamer-plugin PATH
--typelib PATH
--gsettings-schema PATH
--gtk-data PATH
--gio-module PATH
--gdk-pixbuf-loader PATH
```

Run:

```sh
build/sqgi tools/sqgipkg --help
```

for the current full list.

## Diagnostics

### Doctor

`--doctor` checks the manifest before building:

```sh
build/sqgi tools/sqgipkg --manifest sqgipkg.json --doctor
```

It checks:

- entry script exists
- scripts compile
- script directories exist
- resources/files exist
- destination paths are valid
- SQGI build outputs are present
- `appimagetool` availability
- simple GTK/GStreamer import hints

For example, a GTK/GStreamer project without bundled plugins may report:

```text
WARN: GStreamer import detected; package may rely on host GStreamer plugins
WARN: GTK import detected; package may rely on host GTK assets and typelibs
```

That is not a build failure. It is a portability hint.

### Build Report

After a successful AppImage build, `sqgipkg` prints a report:

```text
sqgipkg report
  appdir: dist/MyApp.AppDir
  appimage: dist/MyApp.AppImage
  scripts: 2 compiled, 0 copied, 2 compatibility links
  resources: 1
  manual files: 0
  gstreamer plugins: 0
  warnings:
    - GStreamer import detected, but no gstreamer_plugins entries were bundled
```

The report tells you what was actually staged. It is especially useful when
building GUI/media apps, where host dependencies can hide missing manifest
entries.

### Smoke Tests

Run the AppImage immediately after building:

```sh
build/sqgi tools/sqgipkg --manifest sqgipkg.json --smoke-test "--timeout=2"
```

For scripts that need arguments:

```sh
build/sqgi tools/sqgipkg --manifest sqgipkg.json --smoke-test "alpha beta"
```

For GStreamer apps, test without host GStreamer plugin discovery:

```sh
build/sqgi tools/sqgipkg \
  --manifest sqgipkg.json \
  --smoke-test "--timeout=2" \
  --smoke-test-isolated
```

This sets:

```sh
GST_PLUGIN_SYSTEM_PATH_1_0=
GST_PLUGIN_SYSTEM_PATH=
```

If isolated smoke testing fails but normal smoke testing passes, your AppImage
is probably relying on host GStreamer plugins.

## Runtime Environment

`AppRun` exports:

```sh
SQGI_APPDIR
SQGI_APP_SHARE
SQGI_APP_RESOURCES
LD_LIBRARY_PATH
XDG_DATA_DIRS
GI_TYPELIB_PATH
GSETTINGS_SCHEMA_DIR
GIO_EXTRA_MODULES
GDK_PIXBUF_MODULEDIR
GDK_PIXBUF_MODULE_FILE
GST_PLUGIN_PATH
GST_REGISTRY
```

Typical Squirrel code can locate packaged resources like this:

```squirrel
local GLib = import("GLib")
local image = GLib.build_filenamev([
    GLib.getenv("SQGI_APP_RESOURCES"),
    "assets",
    "logo.png"
])
```

Or packaged modules:

```squirrel
local mod = import("my_module.nut")
```

When importing `.nut` files, SQGI checks the requested path first, then checks
inside `SQGI_APP_SHARE`. The `.nut` module path works even in bytecode packages
because it points to a `.cnut` symlink.

## Native GI Libraries

SQGI can import any library that provides a GObject Introspection typelib. For
application-specific native code, the usual pieces are:

1. A shared library, for example `libmyapp-1.0.so`.
2. A `.gir` file generated by `g-ir-scanner`.
3. A `.typelib` generated by `g-ir-compiler`.
4. A manifest that stages the `.so` and `.typelib`.

You can build those pieces with Meson, CMake, Make, Vala, or any project-local
script. `sqgipkg` only needs to know how to run the build and which outputs to
copy.

Example manifest:

```json
{
  "script": "main.nut",
  "name": "NativeGI",
  "target": "appimage",
  "native_projects": [
    {
      "dir": "native",
      "build": [
        "./build.sh"
      ],
      "libraries": [
        "build/libsqhello-1.0.so"
      ],
      "typelibs": [
        "build/SqHello-1.0.typelib"
      ]
    }
  ]
}
```

Then from Squirrel:

```squirrel
local SqHello = import("SqHello", "1.0")
print(SqHello.greet("SQGI") + "\n")
```

At runtime, `AppRun` sets both:

```sh
LD_LIBRARY_PATH="${APPDIR}/usr/lib..."
GI_TYPELIB_PATH="${APPDIR}/usr/lib/girepository-1.0..."
```

so GI can find the typelib and the dynamic linker can find the shared library.

For working examples, see:

```text
tools/sqgipkg_tests/native_gi_project/
tools/sqgipkg_tests/native_vala_project/
```

The same packaging shape works for Vala if your Vala build emits a shared
library and a typelib. A typical Vala-oriented `native_projects` entry still
looks the same from `sqgipkg`'s point of view: run the build, copy the `.so`,
copy the `.typelib`.

## GTK And GStreamer Apps

GTK and GStreamer are plugin/data-heavy. A simple AppImage can run on your
machine while still relying on host files.

That is acceptable for many early builds, but for broader distribution you
should:

1. Run `--doctor`.
2. Run a normal smoke test.
3. Run `--smoke-test-isolated` for GStreamer apps.
4. Inspect the report.
5. Add explicit `files`, `gstreamer_plugins`, `typelibs`, or `gtk_data` entries
   when portability gaps appear.

Example:

```json
{
  "script": "main.nut",
  "name": "VideoApp",
  "target": "appimage",
  "script_dirs": [
    "."
  ],
  "resources": [
    "assets"
  ],
  "gstreamer_plugins": [
    "/usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgstcoreelements.so",
    "/usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgstvideotestsrc.so"
  ],
  "files": [
    {
      "path": "data/pipeline.conf",
      "dest": "usr/share/sqgi/app/pipeline.conf"
    }
  ]
}
```

Avoid bundling entire system directories unless you have checked the size and
license implications. Prefer the smallest set of files that your app actually
needs.

## AppImage Notes

`sqgipkg` downloads `appimagetool` automatically when it cannot find one. You
can control this with:

```sh
--appimagetool /path/to/appimagetool
--appimagetool-cache .cache/sqgipkg
--refresh-appimagetool
```

`appimagetool` may print AppStream metadata warnings. Those are useful polish
warnings, not necessarily build failures.

## Example Project

The GTK/GStreamer packaging test project lives at:

```text
tools/sqgipkg_tests/gtk_gst_overlay_project/
```

Try:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/gtk_gst_overlay_project/sqgipkg.json \
  --doctor

OUT_DIR=/tmp/sqgipkg-gtk-smoke \
tools/sqgipkg_tests/gtk_gst_overlay_project/dist.sh \
  --keep-appdir \
  --smoke-test "--analyse --timeout=2"
```

## Testing sqgipkg

The test suite builds real AppImages:

```sh
bash tools/sqgipkg_tests/run_tests.sh build/sqgi
```

It exercises:

- help output
- manifest initialization
- real AppImage builds
- compiled `.cnut` scripts
- module imports
- manual files
- resources
- convenience payload buckets
- native GI shared libraries
- doctor mode
- smoke tests

## Current Limitations

- `appimage` is implemented.
- `appdir` and `tarball` are reserved but not implemented yet.
- Dependency discovery is manual.
- Native shared libraries are supported when your build emits explicit `.so`
  and `.typelib` outputs.
- GTK/GStreamer portability depends on declared files/plugins and testing.
- Bytecode protects source text from casual inspection, but it should not be
  treated as strong code secrecy.

The goal is a small, predictable packaging tool that makes the common path easy
and tells you the truth when your app needs more runtime files.
