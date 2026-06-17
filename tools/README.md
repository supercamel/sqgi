# sqgipkg

`sqgipkg` packages SQGI/Squirrel applications for distribution.

It takes a Squirrel entry script, any supporting modules/resources/native GObject
libraries, and the SQGI runtime, then stages a runnable application for Linux or
Windows. On Linux the primary target is AppImage. On Windows it can create a
portable directory, an NSIS installer, or just prepare a Windows MSYS2 sysroot for
cross-build/debug workflows.

The design goal is simple: keep the developer-facing manifest small, while
putting the ugly platform work inside `sqgipkg`.

If you are learning `sqgipkg` from scratch, start with the tutorial-style
[sqgipkg User Manual](MANUAL.md). This file is the broader reference.

## Highlights

- Linux AppImage packaging.
- Linux Debian/sysroot preparation with `linux-sysroot`.
- Windows directory packaging with `win-dir`.
- Windows NSIS installer generation with `win-nsis`.
- Windows MSYS2 sysroot bootstrap with `win-sysroot`.
- Combined Linux + Windows builds with `all`.
- Squirrel `.nut` script discovery, recursive local import staging, and optional bytecode compilation to `.cnut`.
- Compatibility `.nut` links/copies so `import("module.nut")` keeps working.
- Resource staging under `share/sqgi/app/resources`.
- Exact manual file staging.
- Native GObject extension builds and staging.
- Git-managed native projects: clone/fetch/checkout private dependencies before building.
- Git-managed script/data dependencies for vendoring shared Squirrel modules, themes, schemas, assets, or other payloads.
- Native executable entrypoints for C/C++/Vala apps that do not launch through SQGI.
- Vala/C/C++ native module support, including `.dll`/`.so` plus `.typelib`.
- Windows native dependency builds that install private libraries into the generated MSYS2 sysroot before the app is configured.
- GObject Introspection typelib staging.
- GStreamer plugin staging.
- GSettings schema staging and optional schema compilation.
- GIO module staging and optional module cache generation.
- gdk-pixbuf loader staging and optional loader cache generation.
- GTK data/theme/icon staging.
- GTK theme/settings selection for AppImage and Windows launchers.
- Windows MSYS2 package downloading, dependency resolution, extraction, and local package database writing.
- Windows recursive DLL dependency closure using PE imports.
- Generated CMake and Meson cross files for Ubuntu/MinGW Windows builds.
- Automatic `PKG_CONFIG_*` isolation for Windows cross-builds.
- Windows GTK runtime settings/launcher environment support.
- NSIS installer customization: installer name, install directory, icon, license page, shortcuts, Start Menu folder, autostart, execution level, and uninstall registry entry.
- Doctor mode for manifest/path/portability checks.
- AppImage smoke tests, including isolated GStreamer plugin tests and QEMU-backed
  cross-architecture Linux smoke tests when a target sysroot is available.
- Build reports showing exactly what was staged.

## Quick start

From a project directory containing `main.nut`:

```sh
sqgipkg
```

By default this builds:

```text
dist-linux-<arch>/<project-name>.AppImage
```

During in-tree development you can run the tool through the local SQGI binary:

```sh
build/sqgi tools/sqgipkg
```

Create a starter manifest:

```sh
sqgipkg --init simple
```

Check it:

```sh
sqgipkg --doctor
```

Build and smoke-test it:

```sh
sqgipkg --smoke-test "--timeout=2"
```

Run an AppImage without relying on host FUSE:

```sh
APPIMAGE_EXTRACT_AND_RUN=1 dist-linux-x86_64/MyApp.AppImage
```

## Package targets

### `appimage`

The default target. Stages an AppDir and produces:

```text
dist-linux-<arch>/<name>.AppImage
```

By default, the AppImage is tagged for the build host architecture. To package
an arm64/aarch64 AppImage, pass `--appimage-arch aarch64` or set
`"appimage_arch": "aarch64"` in the manifest, and point `build_dir` at an
arm64 SQGI build.

### `linux-sysroot`

Downloads/extracts configured Debian/Ubuntu packages into the Linux sysroot,
writes generated CMake/Meson cross files for cross targets, prints the paths,
and exits. It does not require a script.

```sh
sqgipkg --target linux-sysroot --appimage-arch x86_64 --linux-deb-download
```

Typical output layout for a cross target:

```text
dist-linux-x86_64/_cross/x86_64/
  toolchain-x86_64.cmake
  x86_64.ini

~/.cache/sqgipkg/linux-sysroots/<distro>-<release>-<deb-arch>/
  usr/
  var/lib/sqgipkg/deb/
```

### `win-dir`

Stages a Windows application directory:

```text
dist-windows-x86_64/<name>/
  <name>.bat
  bin/sqgi.exe
  bin/*.dll
  share/sqgi/app/main.cnut
  share/sqgi/app/*.nut
  share/sqgi/app/resources/
  lib/girepository-1.0/*.typelib
```

### `win-nsis`

Stages the same Windows directory, writes an NSIS script, and runs `makensis` if
available:

```text
dist-windows-x86_64/<name>/
dist-windows-x86_64/<name>.nsi
dist-windows-x86_64/<name>-Setup.exe
```

### `win-sysroot`

Downloads/extracts MSYS2 packages, prepares a Windows sysroot, writes generated
CMake/Meson cross files, prints the paths, and exits. It does not require a
script.

```sh
sqgipkg --target win-sysroot --msys2-prefix mingw64
```

Typical output layout:

```text
dist-windows-x86_64/_msys2-mingw64/
  mingw64/
    bin/
    include/
    lib/
    share/

dist-windows-x86_64/_cross/mingw64/
  toolchain-mingw64.cmake
  mingw64.ini
```

This is useful for testing small C probes, debugging GI/runtime issues, or
preparing a cache for CI.

### `all`

Builds Linux AppImage output, then `win-nsis`. To keep platform artifacts from
overwriting or confusing each other, `all` writes Linux output to
`<output>-linux-<arch>` and Windows output to `<output>-windows-x86_64` by
default. With the default output base, that means `dist-linux-x86_64` and
`dist-windows-x86_64`.

When `linux.arches` is configured, `all` builds every listed Linux AppImage
architecture and writes each one to `<output>-linux-<arch>` unless the arch entry
sets its own `output`.

```sh
sqgipkg --target all
```

### Cleaning outputs

Removes project-local sqgipkg build and distribution directories for the current
manifest/default target layout. This includes the current target-aware defaults
such as `dist-linux-x86_64`, `dist-windows-x86_64`, `build-linux-x86_64`, and
`build-windows-x86_64`, plus legacy `dist`, `dist-linux`, `dist-windows`,
`build`, and `build-win` directories when they are inside the project.

```sh
sqgipkg --clean
```

`sqgipkg --target clean` is accepted as a compatibility alias, but `--clean` is
the preferred command.

### Reserved targets

`appdir` and `tarball` are reserved but not implemented.

## Starter manifests

```sh
sqgipkg --init simple
sqgipkg --init gtk4
sqgipkg --init gtk4-gstreamer
sqgipkg --init native-gobject
sqgipkg --init native-vala
```

Templates live in the source tree under `tools/sqgipkg_templates/` and are
installed under `${datadir}/sqgi/sqgipkg_templates/` for reference.

```text
tools/sqgipkg_templates/
```

## Minimal manifest

```json
{
  "script_dirs": ["."]
}
```

If `script` is omitted and `main.nut` exists beside the manifest, `main.nut` is
used automatically.

## Manifest reference

### Top-level fields

#### `entry`

Application entrypoint. If omitted, `sqgipkg` uses SQGI mode and looks for
`script` or `main.nut`.

SQGI shorthand:

```json
"entry": "main.nut"
```

Explicit SQGI form:

```json
"entry": {
  "type": "sqgi",
  "path": "main.nut"
}
```

Native form for C/C++/Vala apps:

```json
"entry": {
  "type": "native",
  "linux": "build/myapp",
  "windows": "build-windows-x86_64/myapp.exe"
}
```

Native entries skip bundling/launching `sqgi`. The generated AppImage `AppRun`
executes the Linux binary directly, and the Windows `.bat` launches the Windows
`.exe` directly. `scripts`, `script_dirs`, `includes`, resources, native
libraries, typelibs, GTK data, GStreamer plugins, and Windows MSYS2 packages
still work, so embedded-SQGI native apps can ship compiled `.cnut` payloads
beside the native executable.

#### `script`

Entrypoint Squirrel script.

```json
"script": "main.nut"
```

#### `name`

Application name. Used for output names, launcher names, desktop metadata, and
installer defaults.

```json
"name": "Squrl"
```

#### `target`

Package target.

```json
"target": "appimage"
```

Implemented values:

```text
appimage
linux-sysroot
win-dir
win-nsis
win-sysroot
all
```

Reserved values:

```text
appdir
tarball
```

#### `build_dir`

SQGI build directory. On Linux this is where `sqgi` and `libsqgi.so.0` are
looked up when you are packaging against an already-built SQGI runtime. Default:

```text
build-linux-<arch>
```

Example:

```json
"build_dir": "../../build"
```

#### `sqgi_source`

SQGI source checkout used by build commands. When a build command references
`$SQGI_SOURCE_DIR`, `sqgipkg` exports it before running the command. Resolution
order is:

1. `sqgi_source.dir` or `--sqgi-source`.
2. `SQGI_SOURCE_DIR` from the environment.
3. A cached Git checkout cloned from `sqgi_source.repo`.

Default repo/cache:

```text
https://github.com/supercamel/sqgi.git
~/.cache/sqgipkg/sources/
```

Example:

```json
"sqgi_source": {
  "repo": "https://github.com/supercamel/sqgi.git",
  "branch": "master"
}
```

You can pin a release or commit with `ref`, `tag`, or `commit`. This is useful
for installed `sqgipkg` workflows where the application project is not nested
inside the SQGI source checkout.

#### `output`

Output directory. Default:

```text
dist-linux-<arch> for AppImage targets
dist-windows-x86_64 for Windows targets
```

Example:

```json
"output": "dist"
```

#### `compile_scripts`

Whether `.nut` scripts are compiled to `.cnut` bytecode. Default:

```json
"compile_scripts": true
```

Disable it for source/debug packages:

```json
"compile_scripts": false
```

Or on the command line:

```sh
sqgipkg --no-compile-scripts
```

## Script packaging

At runtime, `import("module.nut")` resolves relative to the importing module
first, then falls back to the app script root/current lookup. `sqgipkg` follows
literal local `.nut` imports recursively using the same rule. For example,
packaging `main.nut` also stages `lib/telemetry.nut` when the source contains:

```squirrel
local T = import("lib/telemetry.nut")
```

Use `script_dirs` for scripts that are loaded dynamically or are not reachable
through literal local imports.

### `script_dirs`

Recursively stage `.nut` scripts from directories. Paths are relative to the
manifest.

```json
"script_dirs": [
  ".",
  "src"
]
```

Ignored directories include:

```text
.git
build
dist
AppDir
*.AppDir
```

On Linux, scripts go under:

```text
usr/share/sqgi/app/
```

On Windows, scripts go under:

```text
share/sqgi/app/
```

### `scripts`

Stage individual scripts. A string keeps the basename. An object or `PATH=DEST`
sets a relative destination inside the app script area.

```json
"scripts": [
  "src/config.nut",
  "src/ui/window.nut=ui/window.nut",
  {
    "path": "src/http/client.nut",
    "dest": "http/client.nut"
  }
]
```

### Bytecode compatibility paths

By default, `sqgipkg` writes `.cnut` bytecode and also preserves `.nut` import
paths.

Linux AppDir example:

```text
usr/share/sqgi/app/main.cnut
usr/share/sqgi/app/main.nut -> main.cnut
usr/share/sqgi/app/module.cnut
usr/share/sqgi/app/module.nut -> module.cnut
```

Windows uses copied compatibility files rather than symlinks.

This means code like this keeps working in packaged apps:

```squirrel
local util = import("util.nut")
```

## Resources and files

### `resources`

Project-owned runtime resources. Linux destination:

```text
usr/share/sqgi/app/resources/
```

Windows destination:

```text
share/sqgi/app/resources/
```

Example:

```json
"resources": [
  "assets",
  "data/defaults.json"
]
```

At runtime:

```squirrel
local GLib = import("GLib")
local path = GLib.build_filenamev([
    GLib.getenv("SQGI_APP_RESOURCES"),
    "assets",
    "logo.png"
])
```

### `files`

Exact manual copies. Destinations are relative to the staged app root.

```json
"files": [
  "data/config.json=usr/share/sqgi/app/config.json",
  {
    "path": "data/pipeline.conf",
    "dest": "usr/share/sqgi/app/pipeline.conf"
  }
]
```

Absolute destinations and `..` path segments are rejected.

### `includes`

Copy a path into the package, or compile/copy an additional script. If no
destination is provided, non-script files go into SQGI resources.

```json
"includes": [
  "extra/readme.txt",
  "src/optional_plugin.nut=plugins/optional_plugin.nut"
]
```

Command-line equivalent:

```sh
sqgipkg --include extra/readme.txt
```

## Native libraries and GI typelibs

### `libraries`

Linux shared libraries copied under:

```text
usr/lib/
```

Example:

```json
"libraries": [
  "native/build/libmyapp-1.0.so"
]
```

### `typelibs`

GI typelibs copied under:

```text
usr/lib/girepository-1.0/
```

Example:

```json
"typelibs": [
  "native/build/MyApp-1.0.typelib"
]
```

### `native_projects`

Build native projects before staging their outputs. This is the usual pattern
for C/C++/Vala GObject libraries.

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
      "build/extra.dat=usr/share/sqgi/app/extra.dat"
    ]
  }
]
```

Build commands run from `dir`. Paths inside the entry are relative to `dir`.

Native project entries can also fetch their source from Git before building. This
works for top-level `native_projects`, `windows.native_projects`, and
`windows.native_dependencies`:

```json
{
  "name": "my-lib",
  "repo": "https://github.com/example/my-lib.git",
  "dir": ".sqgipkg/native/my-lib",
  "branch": "main",
  "update": true,
  "submodules": true,
  "build": [
    "meson setup build --wipe || meson setup build",
    "ninja -C build"
  ],
  "libraries": [
    "build/libmy-lib-1.0.so"
  ],
  "typelibs": [
    "build/MyLib-1.0.typelib"
  ]
}
```

Supported Git fields are:

| Field | Purpose |
|---|---|
| `repo` / `git` | Repository URL to clone. |
| `dir` | Checkout directory. Defaults to `.sqgipkg/native/<repo-name>`. |
| `branch` | Branch to clone/checkout and fast-forward pull. |
| `tag` | Tag to checkout. |
| `ref` | Arbitrary ref to checkout. |
| `commit` | Commit to checkout. |
| `update` | Fetch/pull existing checkouts. Defaults to `true`. |
| `shallow` | Clone with `--depth 1`. |
| `submodules` | Run `git submodule update --init --recursive`. |

If `dir` does not exist, `sqgipkg` clones the repo. If it exists and is a Git
checkout, `sqgipkg` updates/checks out the requested branch/ref. If it exists but
is not a Git checkout, the build fails loudly instead of silently using the wrong
source tree.

#### Git-managed script/data dependencies

Git-backed project entries are not limited to compiled native code. A project can
leave `build` and `install` empty and simply stage files from the checkout. This
provides a lightweight way to vendor shared Squirrel modules, GTK themes,
GSettings schemas, icons, sample data, or other project assets without copying
them into every application repository.

For Linux/AppImage packages, stage files into the normal AppDir layout. For
example, a shared Squirrel module repo can be placed under the packaged app
module tree:

```json
{
  "native_projects": [
    {
      "name": "sqgi-http-utils",
      "repo": "https://github.com/example/sqgi-http-utils.git",
      "dir": ".sqgipkg/deps/sqgi-http-utils",
      "branch": "main",
      "update": true,
      "build": [],
      "install": [],
      "stage": true,
      "files": [
        {
          "path": "src",
          "dest": "usr/share/sqgi/app/vendor/http-utils"
        }
      ]
    }
  ]
}
```

Packaged code can then import the vendored module by its staged path:

```squirrel
local http = import("vendor/http-utils/client.nut")
```

For Windows, use the Windows staging layout instead:

```json
{
  "windows": {
    "native_dependencies": [
      {
        "name": "sqgi-http-utils",
        "repo": "https://github.com/example/sqgi-http-utils.git",
        "dir": ".sqgipkg/deps/sqgi-http-utils",
        "branch": "main",
        "update": true,
        "build": [],
        "install": [],
        "stage": true,
        "files": [
          {
            "path": "src",
            "dest": "share/sqgi/app/vendor/http-utils"
          }
        ]
      }
    ]
  }
}
```

For cross-platform script/data dependencies, declare the same repo in both places
with platform-specific destinations:

```json
{
  "native_projects": [
    {
      "name": "sqgi-http-utils",
      "repo": "https://github.com/example/sqgi-http-utils.git",
      "dir": ".sqgipkg/deps/sqgi-http-utils",
      "build": [],
      "install": [],
      "stage": true,
      "files": [
        {
          "path": "src",
          "dest": "usr/share/sqgi/app/vendor/http-utils"
        }
      ]
    }
  ],
  "windows": {
    "native_dependencies": [
      {
        "name": "sqgi-http-utils",
        "repo": "https://github.com/example/sqgi-http-utils.git",
        "dir": ".sqgipkg/deps/sqgi-http-utils",
        "build": [],
        "install": [],
        "stage": true,
        "files": [
          {
            "path": "src",
            "dest": "share/sqgi/app/vendor/http-utils"
          }
        ]
      }
    ]
  }
}
```

This is intentionally simple. `sqgipkg` does not resolve semantic versions, lock
files, or transitive dependency graphs. It clones or updates exactly the repos
you declare, checks out the requested branch/tag/ref/commit, runs any declared
commands, and stages the files you specify. Pin `tag`, `ref`, or `commit` when
you need reproducible builds.

For a fully native app, pair `native_projects` with `entry.type = "native"`:

```json
{
  "name": "MyValaApp",
  "entry": {
    "type": "native",
    "linux": "native/build/my-vala-app",
    "windows": "native/build-windows-x86_64/my-vala-app.exe"
  },
  "script_dirs": [
    "scripts"
  ],
  "native_projects": [
    {
      "dir": "native",
      "build": [
        "meson setup build --wipe || meson setup build",
        "meson compile -C build"
      ]
    }
  ],
  "windows": {
    "native_projects": [
      {
        "dir": "native",
        "build": [
          "BUILD_DIR=build-windows-x86_64 MESON_CROSS_FILE=\"$SQGI_MESON_CROSS_FILE\" ./build.sh"
        ]
      }
    ]
  }
}
```

From Squirrel:

```squirrel
local MyApp = import("MyApp", "1.0")
print(MyApp.greet("SQGI") + "\n")
```

## Convenience payload buckets

These fields stage common GLib/GTK/GStreamer runtime data.

```json
{
  "gstreamer_plugins": [
    "/usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgstcoreelements.so"
  ],
  "gsettings_schemas": [
    "schemas/org.example.app.gschema.xml"
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

Destination map:

```text
gstreamer_plugins  -> usr/lib/gstreamer-1.0
typelibs           -> usr/lib/girepository-1.0
gsettings_schemas  -> usr/share/glib-2.0/schemas
gtk_data           -> usr/share
gio_modules        -> usr/lib/gio/modules
gdk_pixbuf_loaders -> usr/lib/gdk-pixbuf-2.0/2.10.0/loaders
```

When tools are available, `sqgipkg` also tries to run:

```text
glib-compile-schemas
gio-querymodules
gdk-pixbuf-query-loaders
```

## AppImage details

`sqgipkg` writes an AppDir with:

```text
AppRun
<name>.desktop
usr/bin/sqgi
usr/lib/
usr/share/sqgi/app/
usr/share/sqgi/app/resources/
```

Then it runs `appimagetool`.

### AppImage tool fields

#### `appimagetool`

Path to `appimagetool`.

```json
"appimagetool": "/opt/appimagetool-x86_64.AppImage"
```

If not found, `sqgipkg` downloads the latest continuous AppImageTool build for
the host architecture. This is the architecture of the tool that runs on the
build machine, not necessarily the architecture of the AppImage being produced.

#### `appimage_arch`

Target architecture written into the AppImage. Common values are `x86_64` and
`aarch64`; `amd64` and `arm64` are accepted as aliases.

```json
"appimage_arch": "aarch64"
```

Command-line equivalent:

```sh
sqgipkg --target appimage --appimage-arch aarch64 --build-dir build-linux-aarch64
```

This selects the AppImage target architecture only. The staged runtime still
needs to match that architecture, so `build-linux-aarch64/sqgi`, native entries,
shared libraries, plugins, and manually bundled files must already be built for
arm64.

#### `appimagetool_cache`

Download cache directory.

```json
"appimagetool_cache": ".cache/sqgipkg/tools"
```

Default:

```text
~/.cache/sqgipkg/tools
```

#### `refresh_appimagetool`

Force a fresh download.

```json
"refresh_appimagetool": true
```

#### `keep_appdir`

Do not delete the staged AppDir after building.

```json
"keep_appdir": true
```

### Linux architecture matrix

For a single AppImage, `appimage_arch` and `build_dir` are enough:

```json
{
  "appimage_arch": "aarch64",
  "build_dir": "build-linux-aarch64"
}
```

For `--target all`, use `linux.arches` to build multiple Linux AppImages from
one manifest:

```json
{
  "linux": {
    "arches": [
      {
        "arch": "x86_64",
        "build_dir": "build-linux-x86_64",
        "deb": {
          "download": true,
          "packages": [
            "libgtk-4-1",
            "libgstreamer1.0-0",
            "gstreamer1.0-plugins-base"
          ]
        }
      },
      {
        "arch": "aarch64",
        "build_dir": "build-linux-aarch64",
        "deb": {
          "download": true,
          "packages": [
            "libgtk-4-1",
            "libgstreamer1.0-0",
            "gstreamer1.0-plugins-base"
          ]
        },
        "inherit_native_projects": false,
        "build": [
          "cmake -E rm -rf \"$SQGI_LINUX_BUILD_DIR\"",
          "cmake -S . -B \"$SQGI_LINUX_BUILD_DIR\" -DCMAKE_TOOLCHAIN_FILE=\"$SQGI_LINUX_CMAKE_TOOLCHAIN\"",
          "cmake --build \"$SQGI_LINUX_BUILD_DIR\""
        ]
      }
    ]
  }
}
```

`arch` accepts `x86_64`, `aarch64`, and the common aliases `amd64`, `x64`, and
`arm64`. `sqgipkg` maps these to Debian package arches when staging packages
from Debian/Ubuntu packages: `x86_64` becomes `amd64`, and `aarch64` becomes
`arm64`.

For isolated Linux builds, the least invasive setup is a private sysroot. The
Debian/Ubuntu backend is explicit: when `linux.deb.download` or an arch entry
`deb.download` is enabled, `sqgipkg` downloads Ubuntu `Packages` indexes into
its own cache, downloads `.deb` archives directly from the matching repository,
and uses `dpkg-deb` to extract target packages into
`~/.cache/sqgipkg/linux-sysroots/<distro>-<release>-<deb-arch>/` by default
unless `linux.sysroot` or an arch `sysroot` is set. This keeps the sysroot
isolated from the host and does not require `dpkg --add-architecture` or target
runtime/dev packages installed into the host root. `.deb` archives are cached
separately under `~/.cache/sqgipkg/linux-debs/<deb-arch>/`, and repository
indexes are cached under `~/.cache/sqgipkg/linux-repo-indexes/`.

### Ubuntu package suite selection

When `linux.deb.download` is enabled, `sqgipkg` downloads target packages from
an Ubuntu suite. A suite is the Ubuntu codename, not the numeric version: use
`noble` for Ubuntu 24.04, `jammy` for Ubuntu 22.04, and so on.

By default, private Debian/Ubuntu sysroots use the host Ubuntu suite. Pin a
shared suite for all Linux builds with `linux.deb.suite`:

```json
{
  "linux": {
    "deb": {
      "download": true,
      "suite": "noble",
      "packages": [
        "libgtk-4-1",
        "gir1.2-gtk-4.0"
      ]
    }
  }
}
```

Override it per architecture with `linux.arches[].deb.suite`:

```json
{
  "linux": {
    "arches": [
      {
        "arch": "x86_64",
        "deb": {
          "download": true,
          "suite": "noble",
          "packages": ["libgtk-4-1"]
        }
      },
      {
        "arch": "aarch64",
        "deb": {
          "download": true,
          "suite": "noble",
          "packages": ["libgtk-4-1"]
        }
      }
    ]
  }
}
```

Force a suite for one build from the command line:

```sh
sqgipkg --target linux-sysroot --appimage-arch aarch64 \
  --linux-deb-download --linux-deb-suite noble
```

`--linux-deb-suite` overrides manifest suite settings for every Linux
architecture in that invocation. Leave it out when a manifest intentionally
mixes suites per architecture. The preferred manifest spelling is
`linux.deb.suite` or `linux.arches[].deb.suite`; `deb_suite` and `suite` are
accepted as compatibility aliases in the Linux object and Linux arch entries.

The selected suite is part of the generated repository-index and sysroot cache
keys, so changing it creates a separate private sysroot instead of silently
reusing packages from another Ubuntu release. This option selects the
Debian/Ubuntu package source for Linux sysroots; it does not change the host
runner, host build tools, cross compiler, or Windows MSYS2 packages.

This works for native and cross target architectures, so an x86_64 package can
use an x86_64 sysroot instead of the host `/usr`, and an aarch64 package can use
an aarch64 sysroot from the same manifest. The generated CMake/Meson files then
point pkg-config at that sysroot for cross builds. `sqgipkg` records the archive
basename for each installed sysroot package and re-extracts it if the apt
repository metadata points at a different package archive later.

Set `linux.deb.sysroot_cache`, an arch entry `deb.sysroot_cache`, or
`--linux-deb-sysroot-cache DIR` to move the reusable extracted sysroots somewhere
else. Set `linux.sysroot` or an arch `sysroot` when you want to provide one exact
sysroot yourself instead of using sqgipkg's Debian cache.

The sysroot itself is generic: you can also populate `linux.sysroot` with any
external tool and skip the Debian backend. Only `linux.deb.*` and package names
like `libgtk-4-1` are Debian/Ubuntu-specific.

The host still needs the cross compiler tools:

```sh
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
```

Avoid adding target runtime architectures to host apt unless you truly want a
host multiarch setup. The older host-multiarch Debian workflow still works when
Debian downloading is disabled and the arch entry points at `/`, but it gives
the host package resolver permission to mix target packages into system
transactions:

```sh
sudo dpkg --add-architecture arm64
sudo apt update
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
  libglib2.0-dev:arm64 libgtk-4-dev:arm64 libgstreamer1.0-dev:arm64
```

Then let the aarch64 arch entry build SQGI and any native projects through the
generated cross files:

```sh
sqgipkg --target all
```

Each Linux arch entry may also set:

```text
output
build
sysroot
deb
deb_download
deb_refresh
deb_package_cache
deb_sysroot_cache
deb_suite
deb_packages
cmake_toolchain
meson_cross_file
package_arch
library_dirs
copy_dependencies
libraries
typelibs
files
resources
gstreamer_plugins
gsettings_schemas
gtk_data
gio_modules
gdk_pixbuf_loaders
native_projects
inherit_native_projects
entry_linux
```

`inherit_native_projects` defaults to `true`. Set it to `false` when a
cross-architecture entry needs to replace the top-level native builds with
architecture-specific native build commands and output paths.

`build` commands run before staging with these environment variables:

```text
SQGI_LINUX_ARCH
SQGI_LINUX_DEB_ARCH
SQGI_LINUX_TRIPLET
SQGI_LINUX_BUILD_DIR
SQGI_LINUX_SYSROOT
SQGI_LINUX_PREFIX             # /usr
SQGI_LINUX_PREFIX_DIR         # <sysroot>/usr, or /usr for host-root builds
SQGI_LINUX_INSTALL_PREFIX     # /usr
SQGI_LINUX_CMAKE_TOOLCHAIN
SQGI_LINUX_MESON_CROSS_FILE
SQGI_SOURCE_DIR              # only when a command references it
```

For cross-architecture Linux entries, `sqgipkg` writes generated CMake and
Meson cross files under `<output>-linux-<arch>/_cross/<arch>/` and points
`SQGI_LINUX_CMAKE_TOOLCHAIN` and `SQGI_LINUX_MESON_CROSS_FILE` at those files.
This mirrors the Windows cross environment, where manifests consume generated
toolchain paths instead of carrying project-local cross files. `cmake_toolchain`
and `meson_cross_file` are only needed when you want to override the generated
files.

Before running cross build commands, `sqgipkg` validates the obvious target
requirements and stops with an explicit error if they are missing. For an
aarch64 SQGI app this includes `aarch64-linux-gnu-*` compiler tools and target
pkg-config metadata for SQGI's core GLib/GI/Cairo dependencies. GTK and
GStreamer pkg-config modules are added to that preflight automatically when
project scripts import `Gtk` or `Gst`. The error includes the exact
`PKG_CONFIG_LIBDIR` being searched and a suggested Ubuntu install command.

### Linux dependency staging

For Linux AppImages, `sqgipkg` now does two kinds of runtime staging:

- It can copy selected runtime files from installed Debian/Ubuntu packages with
  `linux.deb.packages`, per-arch `deb.packages`, or `--linux-deb-package`.
- It recursively scans bundled ELF files with `readelf`, resolves `DT_NEEDED`
  shared libraries from the target arch library paths, and copies non-system
  libraries into `usr/lib`.

Core glibc/loader libraries such as `libc.so.6`, `libm.so.6`, `libpthread.so.0`,
and `ld-linux*` are intentionally not bundled. Everything else needed by SQGI,
GTK, GStreamer, native entries, native libraries, and plugins should either be
found through package staging, `library_dirs`, `sysroot`, or explicit file
entries.

When `sysroot` is set, package file lists are still read with `dpkg-query`, but
files are copied from `sysroot + package-path` when that path exists. This lets
you use either installed Ubuntu multiarch packages or a sysroot populated from
extracted `.deb` packages.

To disable ELF dependency copying:

```json
{
  "linux": {
    "copy_dependencies": false
  }
}
```

or:

```sh
sqgipkg --no-linux-deps
```

Smoke tests are skipped automatically for AppImages whose target architecture
does not match the build host.

## Linux runtime environment

`AppRun` exports:

```text
SQGI_APPDIR
SQGI_APP_SHARE
SQGI_APP_RESOURCES
LD_LIBRARY_PATH
XDG_DATA_DIRS
XDG_CONFIG_DIRS
GTK_DATA_PREFIX
GTK_EXE_PREFIX
GTK_PATH
GTK_THEME
GDK_BACKEND
GI_TYPELIB_PATH
GSETTINGS_SCHEMA_DIR
GIO_EXTRA_MODULES
GDK_PIXBUF_MODULEDIR
GDK_PIXBUF_MODULE_FILE
GST_PLUGIN_PATH
GST_REGISTRY
```

This lets SQGI, GIRepository, GSettings, GIO modules, gdk-pixbuf, and GStreamer
find bundled app files.

## GTK theme/settings support

GTK themes and icon themes are data files plus runtime settings. Bundle the
files with `files`, `includes`, or `gtk_data`, then select them with top-level
manifest fields:

```json
{
  "gtk_theme": "Adwaita",
  "gtk_icon_theme": "Adwaita",
  "gtk_font_name": "Cantarell 11",
  "gtk_prefer_dark": true,
  "gdk_backend": "x11"
}
```

For AppImage builds, `sqgipkg` writes:

```text
usr/etc/gtk-4.0/settings.ini
usr/etc/gtk-3.0/settings.ini
usr/share/gtk-4.0/settings.ini
usr/share/gtk-3.0/settings.ini
```

`AppRun` exports the matching GTK discovery variables so GTK can find and select
the bundled theme.

Example with a manually bundled theme:

```json
{
  "name": "ThemeDemo",
  "gtk_theme": "MyTheme",
  "gtk_icon_theme": "Adwaita",
  "files": [
    {
      "path": "themes/MyTheme",
      "dest": "usr/share/themes/MyTheme"
    }
  ]
}
```

## Windows packaging overview

Windows packaging has three separable jobs:

1. Build or locate a Windows `sqgi.exe` runtime.
2. Stage app scripts/resources/native modules.
3. Stage MSYS2 runtime packages and recursively resolve DLL imports.

`sqgipkg` supports both native MSYS2 builds and Linux-hosted MinGW cross-builds.

### Recommended CRT/package rule

For the current Ubuntu stock MinGW cross compiler:

```text
x86_64-w64-mingw32-gcc/g++ -> MSYS2 mingw64 packages
```

For native MSYS2 UCRT64 builds:

```text
MSYS2 UCRT64 gcc/clang -> MSYS2 ucrt64 packages
```

Do not mix compiler CRT families and dependency package families.

### Basic Windows manifest

```json
{
  "name": "NativeVala",
  "script_dirs": ["."],
  "windows": {
    "msys2_prefix": "mingw64",
    "build": [
      "cmake -E rm -rf \"$SQGI_WINDOWS_BUILD_DIR\"",
      "cmake -S \"$SQGI_SOURCE_DIR\" -B \"$SQGI_WINDOWS_BUILD_DIR\" -G Ninja -DCMAKE_TOOLCHAIN_FILE=\"$SQGI_WIN_CMAKE_TOOLCHAIN\" -DCMAKE_BUILD_TYPE=Release",
      "cmake --build \"$SQGI_WINDOWS_BUILD_DIR\""
    ],
    "build_dir": "build-windows-x86_64",
    "native_projects": [
      {
        "dir": "native",
        "build": [
          "BUILD_DIR=build-windows-x86_64 MESON_CROSS_FILE=\"$SQGI_MESON_CROSS_FILE\" ./build.sh"
        ],
        "libraries": [
          "build-windows-x86_64/libsqvala-1.0.dll"
        ],
        "typelibs": [
          "build-windows-x86_64/SqVala-1.0.typelib"
        ]
      }
    ]
  }
}
```

With the generated cross files and `PKG_CONFIG_*` environment, the manifest can
stay focused on intent instead of carrying sysroot boilerplate.

## Windows manifest reference

All Windows-specific fields live under `windows`.

### `windows.build`

Commands run before staging. Use this to build Windows SQGI or your app runtime.
Commands run from the manifest directory.

```json
"build": [
  "cmake -S \"$SQGI_SOURCE_DIR\" -B \"$SQGI_WINDOWS_BUILD_DIR\" -G Ninja -DCMAKE_TOOLCHAIN_FILE=\"$SQGI_WIN_CMAKE_TOOLCHAIN\" -DCMAKE_BUILD_TYPE=Release",
  "cmake --build \"$SQGI_WINDOWS_BUILD_DIR\""
]
```

The generated `SQGI_WIN_CMAKE_TOOLCHAIN` also sets the CMake cache option
`SQGI_WINDOWS_GUI` from `windows.console`. For GTK-looking GUI apps this is
`ON` by default, so the cross-built `sqgi.exe` uses the Windows GUI subsystem
instead of opening a console window.

### `windows.build_dir`

Directory containing `sqgi.exe` and SQGI DLLs.

```json
"build_dir": "build-windows-x86_64"
```

For script-only apps using a prebuilt SDK, this can point at that SDK/build
directory and `windows.build` can be empty. If `sqgi.exe` is not present there
or on `PATH`, `win-dir`/`win-nsis` fails instead of falling back to the host
Linux `sqgi` executable.

### `windows.msys2_prefix`

MSYS2 environment prefix.

Common values:

```text
mingw64
ucrt64
clang64
clangarm64
mingw32
```

Default:

```json
"msys2_prefix": "mingw64"
```

Package name prefixes are inferred from this value:

```text
mingw64    -> mingw-w64-x86_64-
ucrt64     -> mingw-w64-ucrt-x86_64-
clang64    -> mingw-w64-clang-x86_64-
clangarm64 -> mingw-w64-clang-aarch64-
mingw32    -> mingw-w64-i686-
```

### `windows.msys2_root`

MSYS2 root/sysroot directory. If omitted, `sqgipkg` creates a target-specific
sysroot under `dist`, for example:

```text
dist-windows-x86_64/_msys2-mingw64
```

### `windows.repo_url`

MSYS2 repository URL. If omitted:

```text
https://repo.msys2.org/mingw/<msys2_prefix>
```

### `windows.package_cache`

MSYS2 repository/package archive cache. Default:

```text
~/.cache/sqgipkg/msys2
```

### `windows.download_packages`

Download and extract missing MSYS2 packages. Default:

```json
"download_packages": true
```

Disable for an already-prepared sysroot:

```json
"download_packages": false
```

CLI:

```sh
--no-msys2-download
```

### `windows.refresh_packages`

Refresh cached repo DBs and package archives.

```json
"refresh_packages": true
```

CLI:

```sh
--refresh-msys2-packages
```

### `windows.auto_packages`

Add inferred base packages automatically. Default:

```json
"auto_packages": true
```

The base set includes GLib, GObject Introspection, GI runtime, libffi, and Cairo.
GTK/GStreamer packages are inferred when imports are detected in scripts.

Disable exact-control mode:

```json
"auto_packages": false
```

CLI:

```sh
--no-windows-auto-packages
```

### `windows.console`

Control whether the packaged Windows app is built/launched as a console app or
a GUI app. The default is automatic:

- console on for command-line-style apps
- console off for GTK-looking GUI apps

GTK-looking means a GTK import was detected, GTK settings were configured, or a
GTK MSYS2 package was selected.

When the console is off, the generated Windows CMake toolchain sets:

```cmake
set(SQGI_WINDOWS_GUI ON CACHE BOOL "Build sqgi.exe with the Windows GUI subsystem" FORCE)
```

`sqgipkg` writes `<name>.bat` as the Windows environment launcher. NSIS
shortcuts point directly at `bin\sqgi.exe` for script apps because the Windows
SQGI runtime detects the packaged layout, sets the same GI/GTK/GIO environment
that the batch launcher sets, and runs `share\sqgi\app\main.cnut` or `main.nut`
when launched without arguments. Native-entry app shortcuts point at
`<name>.bat` so the native executable receives the bundled resource and runtime
environment too.

Force console output:

```json
"windows": {
  "console": true
}
```

Force no console:

```json
"windows": {
  "console": false
}
```

CLI:

```sh
--windows-console
--no-windows-console
```

### `windows.build_packages`

MSYS2 packages installed into the Windows sysroot for build-time use, but not
staged as runtime package payload.

```json
"build_packages": [
  "mingw-w64-x86_64-gettext-tools"
]
```

Vala is always installed as a build package for Windows targets, so Vala
projects usually do not need to list `mingw-w64-x86_64-vala` themselves.

CLI:

```sh
--windows-build-package mingw-w64-x86_64-gettext-tools
```

### `windows.packages`

Additional MSYS2 packages to install/stage.

```json
"packages": [
  "mingw-w64-x86_64-gtk4",
  "mingw-w64-x86_64-gstreamer",
  "mingw-w64-x86_64-gst-plugins-good",
  "mingw-w64-x86_64-gst-plugins-bad",
  "mingw-w64-x86_64-gst-libav"
]
```

When downloading is enabled, `sqgipkg` fetches the repository database,
recursively resolves package dependencies from that repository, downloads
archives, extracts them into `msys2_root`, and records local metadata under:

```text
var/lib/pacman/local/
```

### `windows.libraries`

Windows DLLs copied into:

```text
bin/
```

```json
"libraries": [
  "native/build-windows-x86_64/libmyapp-1.0.dll"
]
```

### `windows.typelibs`

Windows typelibs copied into:

```text
lib/girepository-1.0/
```

```json
"typelibs": [
  "native/build-windows-x86_64/MyApp-1.0.typelib"
]
```

### `windows.files`

Exact manual copies for Windows staging.

```json
"files": [
  "windows/readme.txt=share/sqgi/app/readme.txt"
]
```

### `windows.fonts`

Fonts that should be bundled and registered by the generated NSIS installer.
Each font is staged into `share/fonts/`; `win-nsis` then installs it per-user
under `%LOCALAPPDATA%\Microsoft\Windows\Fonts`, writes the matching `HKCU`
Windows font registry value, calls `AddFontResourceW`, and broadcasts a font
change message.

```json
"fonts": [
  {
    "path": "data/fonts/RedactedScript-Regular.ttf",
    "registry_name": "Redacted Script Regular (TrueType)"
  },
  "data/fonts/InterVariable.ttf=Inter Variable (TrueType)"
]
```

The registry name must match the Windows Fonts registry value for the face, for
example `Family Regular (TrueType)` or `Family Variable (TrueType)`. The CLI
form is:

```sh
--windows-font "data/fonts/RedactedScript-Regular.ttf=Redacted Script Regular (TrueType)"
```

### `windows.native_dependencies` / `windows.build_dependencies`

Private Windows build dependencies that must be available before the main Windows
app is configured. These projects run after the MSYS2 sysroot and cross files are
prepared, but before `windows.build` and `windows.native_projects`.

Use this for project-local libraries that provide headers, `.pc` files, DLLs, or
typelibs that the main application needs during Meson/CMake configuration, such
as private Vala/GObject libraries.

A dependency usually installs into the generated MSYS2-style sysroot:

```json
"windows": {
  "native_dependencies": [
    {
      "name": "gserial",
      "repo": "https://github.com/example/gserial.git",
      "dir": ".sqgipkg/native/gserial",
      "branch": "main",
      "update": true,
      "submodules": true,
      "build": [
        "meson setup build-windows-x86_64 --cross-file \"$SQGI_MESON_CROSS_FILE\" --prefix \"$SQGI_WINDOWS_PREFIX\" --wipe || meson setup build-windows-x86_64 --cross-file \"$SQGI_MESON_CROSS_FILE\" --prefix \"$SQGI_WINDOWS_PREFIX\"",
        "ninja -C build-windows-x86_64"
      ],
      "install": [
        "meson install -C build-windows-x86_64 --destdir \"$SQGI_WINDOWS_SYSROOT\""
      ],
      "stage": false
    }
  ]
}
```

The `install` commands are optional. They run after `build` commands and are the
recommended way to place headers, pkg-config files, typelibs, import libraries,
and DLLs into the temporary sysroot. Once installed there, the main app can use
normal Meson declarations such as:

```meson
dependency('gserial-1.0')
```

`stage` controls whether declared `libraries`, `typelibs`, and `files` from that
project are copied directly into the final package. For build-only dependencies
that install into the sysroot and are linked by the app, `stage: false` is often
fine because recursive DLL resolution will copy linked DLLs from the sysroot. If
the dependency provides typelibs or extra runtime files that are not discovered
through DLL imports, set `stage: true` and declare them explicitly.

`windows.build_dependencies` is accepted as an alias for
`windows.native_dependencies`.

Although the name says "native", these entries can also be used as Git-managed
script/data dependencies. Leave `build` and `install` empty, set `stage: true`,
and copy files from the checkout into Windows destinations such as
`share/sqgi/app/vendor/...`, `share/themes/...`, or `share/glib-2.0/schemas/...`.

### `windows.native_projects`

Windows-specific native builds for the application itself or runtime modules.
These run after `windows.native_dependencies`. This keeps Linux `.so` builds and
Windows `.dll` builds separate.

```json
"native_projects": [
  {
    "dir": "native",
    "build": [
      "BUILD_DIR=build-windows-x86_64 MESON_CROSS_FILE=\"$SQGI_MESON_CROSS_FILE\" ./build.sh"
    ],
    "libraries": [
      "build-windows-x86_64/libmyapp-1.0.dll"
    ],
    "typelibs": [
      "build-windows-x86_64/MyApp-1.0.typelib"
    ]
  }
]
```

`windows.native_projects` entries support the same fields as other native project
entries, including `repo`, `branch`, `ref`, `submodules`, `install`, and `stage`.
Use `windows.native_dependencies` when the project must be installed before the
main app is configured; use `windows.native_projects` when it is part of the app
build/staging phase.

## Windows cross-build support

On non-Windows hosts, `sqgipkg` prepares a clean cross-build environment for
Windows targets.

It generates or resolves:

```text
SQGI_WIN_CMAKE_TOOLCHAIN
SQGI_MESON_CROSS_FILE
```

and exports:

```text
PKG_CONFIG_PATH=
PKG_CONFIG_SYSROOT_DIR=<absolute MSYS2 sysroot>
PKG_CONFIG_LIBDIR=<prefix>/lib/pkgconfig:<prefix>/share/pkgconfig
SQGI_WINDOWS_SYSROOT=<absolute MSYS2 sysroot>
SQGI_WINDOWS_BUILD_DIR=<configured Windows build_dir>
SQGI_WINDOWS_PREFIX=/mingw64                 # or /ucrt64, /clang64, ...
SQGI_WINDOWS_PREFIX_DIR=<absolute prefix dir>
SQGI_WINDOWS_SYSROOT_PREFIX=<absolute prefix dir>
SQGI_SOURCE_DIR=<resolved SQGI source checkout> # only when a command references it
```

This prevents host `/usr/include` and host `pkg-config` paths from leaking into
MinGW builds, and gives native dependency builds stable paths for Meson/CMake
install steps.

For Meson projects that generate GObject Introspection data, the generated
cross file also pins `g-ir-scanner` and `g-ir-compiler` to build-host tools.
That avoids the common Linux cross-build failure where Meson discovers the
MSYS2 `g-ir-scanner.exe` from the Windows sysroot and then tries to execute it
directly on Linux. When Wine is available, `sqgipkg` also writes a small
`exe_wrapper` plus scanner/ldd wrappers so `g-ir-scanner` can run the temporary
MinGW introspection binary while keeping the Windows DLL search path pointed at
the staged MSYS2 prefix.

### `windows.cmake_toolchain` / `--win-cmake-toolchain`

Use a specific CMake toolchain file, or let `sqgipkg` generate one.

### `windows.meson_cross_file` / `--win-meson-cross-file`

Use a specific Meson cross file, or let `sqgipkg` generate one.

## Windows DLL dependency resolution

After staging the Windows app, `sqgipkg` scans every bundled `.exe` and `.dll`
using MinGW `objdump`, parses imported DLL names, skips known Windows system
DLLs, copies missing DLLs from the MSYS2 sysroot, then scans the copied DLLs as
well.

This means declaring `gtk4`, `cairo`, `gstreamer`, or a native Vala DLL usually
pulls the transitive DLL closure into `bin/` without hand-copying files.

If a DLL cannot be found in the sysroot, it is reported as a warning.

## Windows launcher environment

The generated `<name>.bat` sets a runtime environment before launching SQGI:

```bat
SQGI_APPDIR
SQGI_APP_SHARE
SQGI_APP_RESOURCES
PATH
GI_TYPELIB_PATH
GST_PLUGIN_PATH
GST_PLUGIN_SYSTEM_PATH_1_0
GST_PLUGIN_SYSTEM_PATH
GST_PLUGIN_SCANNER
GST_REGISTRY
GIO_EXTRA_MODULES
GDK_PIXBUF_MODULEDIR
```

With GTK support enabled/configured, the launcher also sets GTK discovery values
such as:

```bat
XDG_DATA_DIRS
XDG_CONFIG_DIRS
GTK_DATA_PREFIX
GTK_EXE_PREFIX
GTK_PATH
GTK_THEME
GDK_BACKEND
```

The launcher executes:

```bat
%HERE%\bin\sqgi.exe %HERE%\share\sqgi\app\main.cnut %*
```

or the source `.nut` entry if script compilation is disabled.

For GUI apps with `windows.console` disabled, NSIS-created shortcuts target the
GUI-subsystem executable directly instead of this batch file. The batch file is
kept in the package as a visible-console debugging launcher.

## Windows GTK theme/settings support

Windows packaging uses the top-level GTK settings by default. If the Windows
bundle needs different values, override them under `windows`:

```json
"windows": {
  "gtk_theme": "Adwaita",
  "gtk_icon_theme": "Adwaita",
  "gtk_font_name": "Segoe UI 10",
  "gtk_prefer_dark": true,
  "gdk_backend": "win32"
}
```

`sqgipkg` writes GTK settings files into bundled config/data locations and sets
the launcher environment so GTK can find bundled themes, icons, settings, and
backends.

Typical settings files:

```text
etc/gtk-4.0/settings.ini
etc/gtk-3.0/settings.ini
share/gtk-4.0/settings.ini
share/gtk-3.0/settings.ini
```

`gtk_prefer_dark` maps to:

```ini
gtk-application-prefer-dark-theme=true
```

Use `windows.packages` or `windows.auto_packages` to ensure the relevant GTK,
icon, and theme packages are present in the MSYS2 sysroot.

## NSIS installer support

Set the NSIS executable with:

```json
"windows": {
  "nsis": "makensis"
}
```

or:

```sh
--nsis /path/to/makensis
```

If `makensis` is not found, `sqgipkg` still writes the `.nsi` file and tells you
how to build it later.

### `windows.nsis_options`

Installer customization lives here:

```json
"windows": {
  "nsis_options": {
    "installer_name": "NativeVala-Setup.exe",
    "install_dir": "$LOCALAPPDATA\\NativeVala",
    "request_execution_level": "user",
    "license": "LICENSE.txt",
    "icon": "assets/app.ico",
    "header_image": "assets/nsis-header.bmp",
    "welcome_image": "assets/nsis-welcome.bmp",
    "desktop_shortcut": true,
    "start_menu_shortcut": true,
    "start_menu_folder": "NativeVala",
    "uninstall_registry": true
  }
}
```

Supported options:

| Field | Purpose |
|---|---|
| `installer_name` | Output installer filename. |
| `install_dir` | Default install directory. |
| `request_execution_level` | NSIS execution level, usually `user` or `admin`. |
| `license` | License file shown during install. |
| `icon` | Installer/shortcut icon file, typically `.ico`. |
| `header_image` | Modern UI 2 header bitmap used on wizard pages, typically `.bmp`. |
| `welcome_image` | Modern UI 2 welcome/finish bitmap, typically `.bmp`. |
| `desktop_shortcut` | Create a desktop shortcut. |
| `start_menu_shortcut` | Create Start Menu shortcuts. |
| `start_menu_folder` | Start Menu folder name. |
| `uninstall_registry` | Write HKCU uninstall registry metadata. |

`win-nsis` uses NSIS Modern UI 2 by default. The image fields are passed to
`makensis` at compile time; they are not installed into the application
directory.

Matching CLI flags:

```text
--nsis-installer-name NAME
--nsis-install-dir DIR
--nsis-request-execution-level LEVEL
--nsis-license FILE
--nsis-icon FILE
--nsis-header-image FILE
--nsis-welcome-image FILE
--nsis-no-desktop-shortcut
--nsis-no-start-menu-shortcut
--nsis-start-menu-folder NAME
```

## Native extensions on Windows

The working Windows native extension shape is:

1. Build a `.dll` with the same CRT/package family as the rest of the bundle.
2. Generate `.gir` and `.typelib`.
3. Stage the `.dll` under `bin/`.
4. Stage the `.typelib` under `lib/girepository-1.0/`.
5. Let recursive DLL resolution copy transitive dependencies.

A Vala package normally needs Vala vapis in the MSYS2 sysroot. `sqgipkg`
installs the Vala package automatically as a Windows build package, so it does
not need to be listed in `windows.packages`.

```json
"windows": {
  "msys2_prefix": "mingw64"
}
```

For Ubuntu cross-builds, use `mingw64` unless you also have a matching UCRT
compiler/toolchain.

### Private dependency build order

For a native Windows app with private libraries, the normal order is:

```text
1. prepare MSYS2 sysroot and package dependencies
2. clone/update native dependency repos
3. build/install native dependencies into the sysroot
4. configure/build the main app against that sysroot
5. stage the app executable, scripts, resources, typelibs, and extra files
6. recursively resolve DLL dependencies from the sysroot
7. write the portable directory or NSIS installer
```

That is what `windows.native_dependencies` is for. It lets app manifests stay
small while still supporting private libraries that have to exist at build time.

## Diagnostics

### `--doctor`

Checks manifest and build assumptions before packaging.

```sh
sqgipkg --manifest sqgipkg.json --doctor
```

It checks:

- entry script existence
- script compilation
- script directory existence
- resource/file existence
- destination path validity
- native project paths
- SQGI build output presence
- AppImage tool availability
- GTK/GStreamer import hints

### Build report

After staging, `sqgipkg` prints a report:

```text
sqgipkg report
  appdir: dist-linux-x86_64/MyApp.AppDir
  appimage: dist-linux-x86_64/MyApp.AppImage
  appimage arch: x86_64
  scripts: 2 compiled, 0 copied, 2 compatibility links
  resources: 1
  manual files: 0
  includes: 0
  native projects: 1
  shared libraries: 1
  gstreamer plugins: 0
  typelibs: 1
  gtk data: 0
  gsettings schemas: 0
  gio modules: 0
  gdk-pixbuf loaders: 0
  warnings:
    - GStreamer import detected, but no gstreamer_plugins entries were bundled
```

### Smoke tests

Run the built AppImage immediately:

```sh
sqgipkg --smoke-test "--timeout=2"
```

For GStreamer apps, isolate plugin discovery:

```sh
sqgipkg --smoke-test "--timeout=2" --smoke-test-isolated
```

This clears:

```text
GST_PLUGIN_SYSTEM_PATH_1_0
GST_PLUGIN_SYSTEM_PATH
```

If the isolated smoke test fails but a normal test passes, the app is probably
using host GStreamer plugins.

## Command-line reference

Core options:

```text
--manifest FILE
--name NAME
--target TARGET
--build-dir DIR
--output DIR
--init TEMPLATE
--clean
--doctor
--keep-appdir
--no-compile-scripts
```

Script/resource options:

```text
--script SPEC
--script-dir DIR
--file PATH=DEST
--include SPEC
--resource PATH
--library PATH
--typelib PATH
--gstreamer-plugin PATH
--gsettings-schema PATH
--gtk-data PATH
--gio-module PATH
--gdk-pixbuf-loader PATH
```

AppImage options:

```text
--appimagetool PATH
--appimagetool-cache DIR
--refresh-appimagetool
--appimage-arch ARCH
--linux-arch ARCH
--linux-deb-package PACKAGE
--linux-deb-download
--linux-deb-package-cache DIR
--linux-deb-sysroot-cache DIR
--linux-deb-suite SUITE
--refresh-linux-deb-packages
--no-linux-deb-download
--linux-package PACKAGE
--linux-sysroot DIR
--linux-download-packages
--linux-package-cache DIR
--linux-sysroot-cache DIR
--refresh-linux-packages
--no-linux-download
--linux-library-dir DIR
--no-linux-deps
--smoke-test ARGS
--smoke-test-isolated
```

Windows/MSYS2 options:

```text
--msys2-root DIR
--msys2-prefix PREFIX
--windows-package PACKAGE
--msys2-repo-url URL
--msys2-package-cache DIR
--refresh-msys2-packages
--no-msys2-download
--no-windows-auto-packages
--windows-console
--no-windows-console
--win-cmake-toolchain FILE
--win-meson-cross-file FILE
```

Manifest-only Windows build fields include:

```text
windows.console
windows.native_dependencies
windows.build_dependencies     # alias
windows.native_projects
```

NSIS options:

```text
--nsis PATH
--nsis-installer-name NAME
--nsis-install-dir DIR
--nsis-request-execution-level LEVEL
--nsis-license FILE
--nsis-icon FILE
--nsis-header-image FILE
--nsis-welcome-image FILE
--nsis-no-desktop-shortcut
--nsis-no-start-menu-shortcut
--nsis-start-menu-folder NAME
```

Run the installed Gio.Application help for the exact current list:

```sh
sqgipkg --help
```

## Complete example: Linux AppImage

```json
{
  "name": "VideoApp",
  "script": "main.nut",
  "target": "appimage",
  "script_dirs": ["."],
  "resources": ["assets"],
  "gstreamer_plugins": [
    "/usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgstcoreelements.so"
  ],
  "native_projects": [
    {
      "dir": "native",
      "build": ["./build.sh"],
      "libraries": ["build/libvideoapp-1.0.so"],
      "typelibs": ["build/VideoApp-1.0.typelib"]
    }
  ]
}
```

Build:

```sh
sqgipkg --manifest sqgipkg.json --smoke-test "--analyse --timeout=2"
```

## Complete example: Ubuntu cross-build to Windows NSIS

```json
{
  "name": "NativeVala",
  "script": "main.nut",
  "target": "win-nsis",
  "script_dirs": ["."],
  "resources": ["assets"],
  "windows": {
    "msys2_prefix": "mingw64",
    "packages": [
      "mingw-w64-x86_64-gtk4"
    ],
    "build": [
      "cmake -E rm -rf \"$SQGI_WINDOWS_BUILD_DIR\"",
      "cmake -S \"$SQGI_SOURCE_DIR\" -B \"$SQGI_WINDOWS_BUILD_DIR\" -G Ninja -DCMAKE_TOOLCHAIN_FILE=\"$SQGI_WIN_CMAKE_TOOLCHAIN\" -DCMAKE_BUILD_TYPE=Release",
      "cmake --build \"$SQGI_WINDOWS_BUILD_DIR\""
    ],
    "build_dir": "build-windows-x86_64",
    "native_dependencies": [
      {
        "name": "my-private-lib",
        "repo": "https://github.com/example/my-private-lib.git",
        "dir": ".sqgipkg/native/my-private-lib",
        "branch": "main",
        "build": [
          "meson setup build-windows-x86_64 --cross-file \"$SQGI_MESON_CROSS_FILE\" --prefix \"$SQGI_WINDOWS_PREFIX\" --wipe || meson setup build-windows-x86_64 --cross-file \"$SQGI_MESON_CROSS_FILE\" --prefix \"$SQGI_WINDOWS_PREFIX\"",
          "ninja -C build-windows-x86_64"
        ],
        "install": [
          "meson install -C build-windows-x86_64 --destdir \"$SQGI_WINDOWS_SYSROOT\""
        ],
        "stage": false
      }
    ],
    "gtk_theme": "Adwaita",
    "gtk_icon_theme": "Adwaita",
    "gtk_font_name": "Segoe UI 10",
    "gtk_prefer_dark": false,
    "gdk_backend": "win32",
    "native_projects": [
      {
        "dir": "native",
        "build": [
          "BUILD_DIR=build-windows-x86_64 MESON_CROSS_FILE=\"$SQGI_MESON_CROSS_FILE\" ./build.sh"
        ],
        "libraries": ["build-windows-x86_64/libsqvala-1.0.dll"],
        "typelibs": ["build-windows-x86_64/SqVala-1.0.typelib"]
      }
    ],
    "nsis_options": {
      "installer_name": "NativeVala-Setup.exe",
      "install_dir": "$LOCALAPPDATA\\NativeVala",
      "request_execution_level": "user",
      "icon": "assets/app.ico",
      "header_image": "assets/nsis-header.bmp",
      "welcome_image": "assets/nsis-welcome.bmp",
      "desktop_shortcut": true,
      "start_menu_shortcut": true,
      "start_menu_folder": "NativeVala",
      "uninstall_registry": true
    }
  }
}
```

Build:

```sh
sqgipkg --manifest sqgipkg.json
```

## GTK and GStreamer portability notes

GTK and GStreamer are plugin/data-heavy. A package can work on your development
machine while still depending on host files.

Recommended workflow:

1. Run `--doctor`.
2. Build with `--keep-appdir` while debugging.
3. Run smoke tests.
4. For GStreamer, run `--smoke-test-isolated`.
5. Inspect the build report.
6. Add explicit plugins, typelibs, GTK data, GSettings schemas, GIO modules, or
   gdk-pixbuf loaders as needed.

Avoid bundling entire system directories unless you have checked size and
license implications. Prefer the smallest runtime set your app actually needs.

For cross-architecture Linux AppImages, `sqgipkg` runs smoke tests from the
staged AppDir through QEMU user-mode/binfmt when the target sysroot and matching
emulator are available, for example `qemu-x86_64` on an arm64 host or
`qemu-aarch64` on an x86_64 host. Install Ubuntu's `qemu-user-binfmt` package to
enable the usual binfmt registrations.

## Testing sqgipkg

`sqgipkg` is implemented as a small launcher plus Squirrel modules. In the
source tree they live under `tools/sqgipkg_lib/`; `make install` places the
launcher in `bin/` and the Squirrel entry/modules under
`share/sqgi/sqgipkg.nut` and `share/sqgi/sqgipkg_lib/`. The installed launcher
sets `SQGI_APP_SHARE` to the SQGI share directory when it is otherwise unset, so
the support modules are loaded from the shared data location instead of `bin/`.

The modules are split by responsibility: command-line options, manifests,
script staging, Linux dependency closure, AppImage staging, Windows/MSYS2 setup,
NSIS generation, templates, doctor checks, and final build orchestration.

The test suite builds real packages:

```sh
bash tools/sqgipkg_tests/run_tests.sh build/sqgi
```

It covers:

- module-level helper tests
- help output
- manifest initialization
- AppImage builds
- compiled `.cnut` scripts
- source script packaging
- module imports
- manual files
- resources
- convenience payload buckets
- native GI libraries
- native Vala projects
- doctor mode
- smoke tests
- Windows sysroot preparation
- Windows native dependency build/install ordering
- Git-managed native project checkout/update paths
- Git-managed script/data dependency staging
- Windows directory/NSIS staging paths

## Current limitations

- Implemented targets: `appimage`, `linux-sysroot`, `win-dir`, `win-nsis`, `win-sysroot`, `all`.
- Reserved targets: `appdir`, `tarball`.
- Linux dependency discovery is intentionally not a full distro dependency solver.
- Windows package downloading resolves normal dependencies from one MSYS2 repo; virtual `provides` and cross-repo resolution are limited.
- Native modules must declare explicit library and typelib outputs when they need to be staged directly.
- Git-managed native projects and script/data dependencies are updated from the declared repo/ref; pin `tag`, `ref`, or `commit` for reproducible builds.
- GTK/GStreamer portability still depends on declared runtime data and testing.
- Bytecode is useful for packaging and casual source hiding, but it is not strong code secrecy.
- Ubuntu stock MinGW cross-builds should use `mingw64`; UCRT64 is a good future/native MSYS2 target, but only with a matching UCRT toolchain.

## Philosophy

`sqgipkg` is not trying to be Flatpak, pacman, apt, or a universal Linux
dependency solver.

It is a small, predictable packaging tool for SQGI apps. It handles the runtime,
scripts, resources, GI typelibs, native extension outputs, Windows sysroots,
DLL closure, launchers, and installers. When your app needs extra GTK,
GStreamer, or platform files, it gives you explicit manifest hooks and reports
what it did.

The common path should be one command. The complicated parts should be visible,
repeatable, and owned by the tool instead of copied into every project manifest.
