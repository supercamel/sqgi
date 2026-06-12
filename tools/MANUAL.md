# sqgipkg User Manual

This manual teaches `sqgipkg` by building up one packaging problem at a time.
It is not a complete field reference. For every knob and manifest field, see
[README.md](README.md). This guide is the path you take when you want to ship an
app and understand why each new manifest field exists.

The short version:

1. Start with a script app and package it for the host.
2. Add resources and extra scripts.
3. Bundle native runtime dependencies such as GTK, GStreamer, libsoup, GI
   typelibs, schemas, plugins, and loaders.
4. Add Windows output.
5. Add native modules.
6. Move to native entrypoints and cross builds.

## Before You Start

Build and install SQGI, or run `sqgipkg` from the source tree:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"$(nproc)"

build/sqgi tools/sqgipkg --help
```

If `sqgipkg` is installed, the examples use:

```sh
sqgipkg
```

During source-tree development, substitute:

```sh
build/sqgi tools/sqgipkg
```

An SQGI project usually starts like this:

```text
myapp/
  main.nut
  sqgipkg.json
```

The manifest is optional for the smallest apps, but this guide uses one as soon
as the package needs a name or extra files.

## 1. Package One Script For The Host

Create a tiny app:

```squirrel
// main.nut
print("hello from packaged SQGI\n")
```

From that directory, run:

```sh
sqgipkg
```

On Linux, the default target is an AppImage:

```text
dist-linux-x86_64/myapp.AppImage
```

Run it without requiring host FUSE support:

```sh
APPIMAGE_EXTRACT_AND_RUN=1 dist-linux-x86_64/myapp.AppImage
```

This first package contains the SQGI runtime, your compiled script payload, and
a launcher. It does not try to solve GTK, GStreamer, Windows, or cross
compilation yet.

## 2. Add A Manifest

Now add a manifest:

```json
{
  "name": "HelloSqgi",
  "script": "main.nut",
  "script_dirs": [
    "."
  ]
}
```

Build again:

```sh
sqgipkg --doctor
sqgipkg --smoke-test ""
```

`--doctor` checks the manifest and common paths. `--smoke-test ""` runs the
package with no extra arguments after it is built.

The output is now:

```text
dist-linux-x86_64/HelloSqgi.AppImage
```

If `script` is omitted and `main.nut` exists beside the manifest, `sqgipkg`
uses `main.nut`.

## 3. Add More Scripts

Suppose the app grows:

```text
myapp/
  main.nut
  ui/window.nut
  lib/config.nut
```

If `main.nut` imports scripts literally, `sqgipkg` follows those imports:

```squirrel
local Window = import("ui/window.nut")
local Config = import("lib/config.nut")
```

For scripts loaded dynamically, keep `script_dirs`:

```json
{
  "name": "HelloSqgi",
  "script_dirs": [
    "."
  ]
}
```

By default, `.nut` scripts are compiled to `.cnut` bytecode, and compatibility
`.nut` paths are kept so existing `import("module.nut")` calls continue to work.

Use this only for debugging/source packages:

```json
{
  "compile_scripts": false,
  "script_dirs": [
    "."
  ]
}
```

or:

```sh
sqgipkg --no-compile-scripts
```

## 4. Add App Resources

Put app-owned data under `resources`:

```text
myapp/
  assets/logo.png
  data/defaults.json
  main.nut
  sqgipkg.json
```

Manifest:

```json
{
  "name": "ResourceDemo",
  "script_dirs": [
    "."
  ],
  "resources": [
    "assets",
    "data/defaults.json"
  ]
}
```

At runtime, use `SQGI_APP_RESOURCES`:

```squirrel
local GLib = import("GLib")

local logo = GLib.build_filenamev([
    GLib.getenv("SQGI_APP_RESOURCES"),
    "assets",
    "logo.png"
])
```

Use `files` when you need a precise destination:

```json
{
  "files": [
    "data/pipeline.conf=usr/share/sqgi/app/pipeline.conf"
  ]
}
```

`resources` is for application data. `files` is for exact staged paths.

## 5. Package A GTK App

A GTK app can start with the GTK template:

```sh
sqgipkg --init gtk4
```

The starter manifest is intentionally small:

```json
{
  "script_dirs": [
    "."
  ],
  "windows": {
    "gdk_backend": "win32"
  }
}
```

On your development machine this may be enough, because GTK is installed on the
host. For a portable AppImage, ask `sqgipkg` to download the Linux runtime
packages into a private sysroot and stage them:

```json
{
  "name": "GtkDemo",
  "script_dirs": [
    "."
  ],
  "linux": {
    "deb": {
      "download": true,
      "packages": [
        "libgtk-4-1",
        "gir1.2-gtk-4.0"
      ]
    }
  },
  "windows": {
    "gdk_backend": "win32"
  }
}
```

Build and keep the AppDir while learning:

```sh
sqgipkg --keep-appdir --smoke-test ""
```

Look inside:

```text
dist-linux-x86_64/GtkDemo.AppDir/
  usr/lib/
  usr/lib/girepository-1.0/
  usr/share/glib-2.0/schemas/
  usr/share/gtk-4.0/
```

The generated AppRun sets GTK/GI/GSettings/GIO/gdk-pixbuf paths so the app
prefers the bundled runtime over whatever the user has installed.

## 6. Add GStreamer

GStreamer needs libraries, plugins, and usually the plugin scanner. A small GTK
plus GStreamer manifest can look like this:

```json
{
  "name": "GtkGstDemo",
  "script_dirs": [
    "."
  ],
  "linux": {
    "deb": {
      "download": true,
      "packages": [
        "libgtk-4-1",
        "gir1.2-gtk-4.0",
        "libgstreamer1.0-0",
        "gir1.2-gstreamer-1.0",
        "gir1.2-gst-plugins-base-1.0",
        "gstreamer1.0-plugins-base",
        "gstreamer1.0-plugins-good"
      ]
    }
  },
  "windows": {
    "msys2_prefix": "mingw64",
    "gdk_backend": "win32",
    "packages": [
      "mingw-w64-x86_64-gstreamer",
      "mingw-w64-x86_64-gst-plugins-base",
      "mingw-w64-x86_64-gst-plugins-good",
      "mingw-w64-x86_64-gst-plugin-gtk"
    ]
  }
}
```

`sqgipkg` stages Debian package files into AppImage-friendly paths. For example:

```text
/usr/lib/x86_64-linux-gnu/gstreamer-1.0/libgstcoreelements.so
```

becomes:

```text
usr/lib/gstreamer-1.0/libgstcoreelements.so
```

The AppImage launcher sets:

```text
GST_PLUGIN_PATH
GST_PLUGIN_SYSTEM_PATH_1_0
GST_PLUGIN_SYSTEM_PATH
GST_PLUGIN_SCANNER
GST_REGISTRY
```

Use an isolated smoke test to catch accidental host-plugin usage:

```sh
sqgipkg --smoke-test-isolated --smoke-test ""
```

## 7. Manually Stage Runtime Pieces

Most portable GTK/GStreamer/libsoup apps should prefer `linux.deb.download` and
`windows.packages`. Manual staging is useful for custom plugins, private
libraries, and hand-built runtime files.

Linux manual runtime buckets:

```json
{
  "libraries": [
    "native/build/libmyhelper.so"
  ],
  "typelibs": [
    "native/build/MyHelper-1.0.typelib"
  ],
  "gstreamer_plugins": [
    "plugins/gstreamer-1.0"
  ],
  "gsettings_schemas": [
    "schemas"
  ],
  "gio_modules": [
    "gio-modules"
  ],
  "gdk_pixbuf_loaders": [
    "pixbuf-loaders"
  ],
  "gtk_data": [
    "themes/MyTheme"
  ]
}
```

Directories in these runtime buckets are copied as bucket contents. That means a
directory named `schemas` lands in:

```text
usr/share/glib-2.0/schemas/
```

not:

```text
usr/share/glib-2.0/schemas/schemas/
```

Windows equivalents live under `windows`:

```json
{
  "windows": {
    "libraries": [
      "native/build-windows-x86_64/myhelper.dll"
    ],
    "typelibs": [
      "native/build-windows-x86_64/MyHelper-1.0.typelib"
    ],
    "files": [
      "data/windows.conf=share/sqgi/app/windows.conf"
    ]
  }
}
```

For libsoup, the usual portable path is package-based:

```json
{
  "linux": {
    "deb": {
      "download": true,
      "packages": [
        "libsoup-3.0-0",
        "gir1.2-soup-3.0"
      ]
    }
  },
  "windows": {
    "packages": [
      "mingw-w64-x86_64-libsoup"
    ]
  }
}
```

## 8. Build A Windows Package

From Linux, `sqgipkg` can build Windows output with an MSYS2 sysroot.

Portable directory:

```sh
sqgipkg --target win-dir
```

NSIS installer:

```sh
sqgipkg --target win-nsis
```

Useful Windows manifest fields:

```json
{
  "name": "WindowsDemo",
  "script_dirs": [
    "."
  ],
  "windows": {
    "msys2_prefix": "mingw64",
    "gdk_backend": "win32",
    "packages": [
      "mingw-w64-x86_64-gtk4"
    ],
    "fonts": [
      {
        "path": "data/fonts/RedactedScript-Regular.ttf",
        "registry_name": "Redacted Script Regular (TrueType)"
      }
    ],
    "nsis_options": {
      "installer_name": "WindowsDemo-Setup.exe",
      "install_dir": "$LOCALAPPDATA\\WindowsDemo",
      "header_image": "assets/nsis-header.bmp",
      "welcome_image": "assets/nsis-welcome.bmp",
      "desktop_shortcut": true,
      "start_menu_shortcut": true,
      "start_menu_folder": "SQGI"
    }
  }
}
```

The Windows package shape is:

```text
dist-windows-x86_64/WindowsDemo/
  WindowsDemo.bat
  bin/sqgi.exe
  bin/*.dll
  share/sqgi/app/main.cnut
  lib/girepository-1.0/*.typelib
```

The `.bat` launcher sets DLL, GI, GTK, GIO, gdk-pixbuf, and GStreamer paths
before launching the app. For GTK-looking GUI apps, `sqgipkg` sets
`SQGI_WINDOWS_GUI=ON` in the generated CMake toolchain by default, so the
cross-built `sqgi.exe` uses the Windows GUI subsystem. NSIS shortcuts then
point directly at `bin\sqgi.exe` instead of the batch file. The SQGI runtime
detects the packaged layout, sets the same runtime paths, and starts
`share\sqgi\app\main.cnut` when launched without arguments.

Use `windows.fonts` for bundled fonts that must be visible to Windows and GTK by
font family name. `sqgipkg` stages each listed font into `share/fonts/`, and
`win-nsis` installs it per-user under `%LOCALAPPDATA%\Microsoft\Windows\Fonts`,
registers the `HKCU` Windows font value, and refreshes the Windows font list.
The string form is also supported:

```json
"fonts": [
  "data/fonts/InterVariable.ttf=Inter Variable (TrueType)"
]
```

`win-nsis` uses NSIS Modern UI 2 by default. Use
`windows.nsis_options.header_image` for the wizard header bitmap and
`windows.nsis_options.welcome_image` for the welcome/finish bitmap.

Console behavior is automatic by default. Force a visible console for debugging:

```json
{
  "windows": {
    "console": true
  }
}
```

Force no console for a native GUI app that `sqgipkg` cannot infer:

```json
{
  "windows": {
    "console": false
  }
}
```

If you only want to warm or inspect the sysroot:

```sh
sqgipkg --target win-sysroot
```

## 9. Build A Native GObject Module

Native modules are the bridge between Squirrel scripts and custom C/C++/Vala
code. The usual shape is:

```text
myapp/
  main.nut
  native/
    meson.build
    myhelper.c
  sqgipkg.json
```

Your script imports the typelib:

```squirrel
local MyHelper = import("MyHelper", "1.0")

local worker = MyHelper.Worker.new()
print(worker.do_work("hello") + "\n")
```

Manifest:

```json
{
  "name": "NativeModuleDemo",
  "script_dirs": [
    "."
  ],
  "native_projects": [
    {
      "dir": "native",
      "build": [
        "meson setup build --wipe || meson setup build",
        "meson compile -C build"
      ],
      "libraries": [
        "build/libmyhelper-1.0.so"
      ],
      "typelibs": [
        "build/MyHelper-1.0.typelib"
      ]
    }
  ]
}
```

Build commands run inside `native`. Staged paths are also relative to `native`.

If a project has an install step:

```json
{
  "native_projects": [
    {
      "dir": "native",
      "build": [
        "meson setup \"$SQGI_LINUX_BUILD_DIR\" --prefix \"$SQGI_LINUX_INSTALL_PREFIX\" --wipe || meson setup \"$SQGI_LINUX_BUILD_DIR\" --prefix \"$SQGI_LINUX_INSTALL_PREFIX\"",
        "meson compile -C \"$SQGI_LINUX_BUILD_DIR\""
      ],
      "install": [
        "meson install -C \"$SQGI_LINUX_BUILD_DIR\" --destdir \"$SQGI_LINUX_SYSROOT\""
      ],
      "stage": false
    }
  ]
}
```

Use `stage: false` for dependency projects that install into the sysroot but do
not directly place app artifacts into the final package.

Linux build commands can use:

```text
SQGI_LINUX_ARCH
SQGI_LINUX_DEB_ARCH
SQGI_LINUX_TRIPLET
SQGI_LINUX_BUILD_DIR
SQGI_LINUX_SYSROOT
SQGI_LINUX_PREFIX
SQGI_LINUX_PREFIX_DIR
SQGI_LINUX_INSTALL_PREFIX
SQGI_LINUX_CMAKE_TOOLCHAIN
SQGI_LINUX_MESON_CROSS_FILE
SQGI_SOURCE_DIR
```

`SQGI_SOURCE_DIR` is only exported for commands that mention it. Configure it
with:

```json
{
  "sqgi_source": {
    "repo": "https://github.com/supercamel/sqgi.git",
    "branch": "master"
  }
}
```

or:

```sh
sqgipkg --sqgi-source-dir /path/to/sqgi
```

## 10. Build A Vala Module

Vala is the same packaging story as C GObject code: build a shared library and a
typelib, then stage both.

```json
{
  "name": "ValaModuleDemo",
  "script_dirs": [
    "."
  ],
  "native_projects": [
    {
      "dir": "native",
      "build": [
        "meson setup build --wipe || meson setup build",
        "meson compile -C build",
        "g-ir-compiler build/MyVala-1.0.gir --output build/MyVala-1.0.typelib"
      ],
      "libraries": [
        "build/libmyvala-1.0.so"
      ],
      "typelibs": [
        "build/MyVala-1.0.typelib"
      ]
    }
  ]
}
```

For Windows cross builds, `sqgipkg` installs Vala automatically as a build
package. It does not need to be listed in `windows.packages`.

```json
{
  "windows": {
    "msys2_prefix": "mingw64"
  }
}
```

## 11. Package A Native Entry App

Not every packaged app launches through `sqgi`. You can build a native
executable that embeds SQGI or uses SQGI as a support library, then make that
binary the launcher entry.

Manifest:

```json
{
  "name": "NativeEntryDemo",
  "entry": {
    "type": "native",
    "linux": "native/build/native-entry",
    "windows": "native/build-windows-x86_64/native-entry.exe"
  },
  "script_dirs": [
    "scripts"
  ],
  "native_projects": [
    {
      "dir": "native",
      "build": [
        "./build.sh"
      ]
    }
  ]
}
```

The AppImage `AppRun` executes the native Linux binary. The Windows launcher
executes the native Windows `.exe`. `script_dirs` still works, so embedded
runtime apps can ship compiled `.cnut` payloads beside the executable.

Use `entry_linux` and `entry_windows` in per-target sections when cross builds
produce different output paths:

```json
{
  "linux": {
    "arches": [
      {
        "arch": "x86_64",
        "entry_linux": "native/build-linux-x86_64/native-entry"
      },
      {
        "arch": "aarch64",
        "entry_linux": "native/build-linux-aarch64/native-entry"
      }
    ]
  }
}
```

## 12. Cross-Build Linux AppImages

For one Linux architecture:

```sh
sqgipkg --appimage-arch aarch64
```

For a repeatable multi-arch manifest, use `linux.arches`:

```json
{
  "name": "MultiLinuxDemo",
  "script_dirs": [
    "."
  ],
  "linux": {
    "arches": [
      {
        "arch": "x86_64",
        "build_dir": "build-linux-x86_64",
        "deb": {
          "download": true,
          "packages": [
            "libgtk-4-1",
            "gir1.2-gtk-4.0"
          ]
        },
        "build": [
          "cmake -E rm -rf \"$SQGI_LINUX_BUILD_DIR\"",
          "cmake -S \"$SQGI_SOURCE_DIR\" -B \"$SQGI_LINUX_BUILD_DIR\" -G Ninja ${SQGI_LINUX_CMAKE_TOOLCHAIN:+-DCMAKE_TOOLCHAIN_FILE=\"$SQGI_LINUX_CMAKE_TOOLCHAIN\"} -DCMAKE_BUILD_TYPE=Release",
          "cmake --build \"$SQGI_LINUX_BUILD_DIR\""
        ]
      },
      {
        "arch": "aarch64",
        "build_dir": "build-linux-aarch64",
        "deb": {
          "download": true,
          "packages": [
            "libgtk-4-1",
            "gir1.2-gtk-4.0"
          ]
        },
        "build": [
          "cmake -E rm -rf \"$SQGI_LINUX_BUILD_DIR\"",
          "cmake -S \"$SQGI_SOURCE_DIR\" -B \"$SQGI_LINUX_BUILD_DIR\" -G Ninja ${SQGI_LINUX_CMAKE_TOOLCHAIN:+-DCMAKE_TOOLCHAIN_FILE=\"$SQGI_LINUX_CMAKE_TOOLCHAIN\"} -DCMAKE_BUILD_TYPE=Release",
          "cmake --build \"$SQGI_LINUX_BUILD_DIR\""
        ]
      }
    ]
  }
}
```

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

Use `linux.arches[].deb.suite` when a matrix entry needs its own suite:

```json
{
  "linux": {
    "arches": [
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

For a one-off test, force the suite from the command line:

```sh
sqgipkg --target linux-sysroot --appimage-arch aarch64 \
  --linux-deb-download --linux-deb-suite noble
```

`--linux-deb-suite` overrides manifest suite settings for every Linux
architecture in that invocation. Leave it out when the manifest intentionally
mixes suites per architecture. Changing the suite creates a separate cached
repository/sysroot, so `jammy`, `noble`, and future suites do not silently share
downloaded package state.

Prepare only the Linux sysroot and generated cross files:

```sh
sqgipkg --target linux-sysroot --appimage-arch aarch64 --linux-deb-download
```

For cross targets, `sqgipkg` writes:

```text
dist-linux-<arch>/_cross/<arch>/toolchain-<arch>.cmake
dist-linux-<arch>/_cross/<arch>/<arch>.ini
```

and points:

```text
SQGI_LINUX_CMAKE_TOOLCHAIN
SQGI_LINUX_MESON_CROSS_FILE
PKG_CONFIG_SYSROOT_DIR
PKG_CONFIG_LIBDIR
QEMU_LD_PREFIX
```

at the target sysroot. Smoke tests for non-host Linux architectures run through
QEMU user-mode when the matching emulator and target sysroot are available.

## 13. Cross-Build Windows Output

A script app can often use the default Windows SQGI build plus MSYS2 packages:

```json
{
  "name": "CrossWindowsDemo",
  "script_dirs": [
    "."
  ],
  "windows": {
    "msys2_prefix": "mingw64",
    "gdk_backend": "win32",
    "packages": [
      "mingw-w64-x86_64-gtk4"
    ],
    "build": [
      "cmake -E rm -rf \"$SQGI_WINDOWS_BUILD_DIR\"",
      "cmake -S \"$SQGI_SOURCE_DIR\" -B \"$SQGI_WINDOWS_BUILD_DIR\" -G Ninja -DCMAKE_TOOLCHAIN_FILE=\"$SQGI_WIN_CMAKE_TOOLCHAIN\" -DCMAKE_BUILD_TYPE=Release",
      "cmake --build \"$SQGI_WINDOWS_BUILD_DIR\""
    ],
    "build_dir": "build-windows-x86_64"
  }
}
```

The generated CMake toolchain sets `SQGI_WINDOWS_GUI` automatically from
`windows.console`. Leave it alone for the usual behavior: GTK-looking apps are
GUI-subsystem builds, while command-line apps are console-subsystem builds.

For native Windows modules:

```json
{
  "windows": {
    "msys2_prefix": "mingw64",
    "native_projects": [
      {
        "dir": "native",
        "build": [
          "BUILD_DIR=build-windows-x86_64 MESON_CROSS_FILE=\"$SQGI_MESON_CROSS_FILE\" ./build.sh"
        ],
        "libraries": [
          "build-windows-x86_64/myhelper.dll"
        ],
        "typelibs": [
          "build-windows-x86_64/MyHelper-1.0.typelib"
        ]
      }
    ]
  }
}
```

For dependency projects that should install into the Windows sysroot before your
app builds, use `windows.native_dependencies`:

```json
{
  "windows": {
    "native_dependencies": [
      {
        "name": "private-lib",
        "dir": "deps/private-lib",
        "build": [
          "meson setup build-windows-x86_64 --cross-file \"$SQGI_MESON_CROSS_FILE\" --prefix \"$SQGI_WINDOWS_PREFIX\" --wipe || meson setup build-windows-x86_64 --cross-file \"$SQGI_MESON_CROSS_FILE\" --prefix \"$SQGI_WINDOWS_PREFIX\"",
          "meson compile -C build-windows-x86_64"
        ],
        "install": [
          "meson install -C build-windows-x86_64 --destdir \"$SQGI_WINDOWS_SYSROOT\""
        ],
        "stage": false
      }
    ]
  }
}
```

Windows build commands can use:

```text
SQGI_WIN_CMAKE_TOOLCHAIN
SQGI_MESON_CROSS_FILE
SQGI_WINDOWS_BUILD_DIR
SQGI_WINDOWS_SYSROOT
SQGI_WINDOWS_PREFIX
SQGI_WINDOWS_PREFIX_DIR
SQGI_WINDOWS_SYSROOT_PREFIX
SQGI_SOURCE_DIR
```

## 14. Build Everything

When the manifest is ready:

```sh
sqgipkg --target all
```

With no `linux.arches`, `all` builds:

```text
dist-linux-x86_64/<name>.AppImage
dist-windows-x86_64/<name>/
dist-windows-x86_64/<name>.nsi
dist-windows-x86_64/<name>-Setup.exe
```

With `linux.arches`, Linux outputs are split by architecture:

```text
dist-linux-x86_64/<name>.AppImage
dist-linux-aarch64/<name>.AppImage
dist-windows-x86_64/<name>-Setup.exe
```

Clean generated project-local outputs when you want to reset the packaging
workspace:

```sh
sqgipkg --clean
```

This removes target-aware defaults such as `dist-linux-x86_64`,
`dist-windows-x86_64`, `build-linux-x86_64`, and `build-windows-x86_64`, along
with legacy `dist`, `dist-linux`, `dist-windows`, `build`, and `build-win`
directories when they are inside the project.

`sqgipkg --target clean` is still accepted as a compatibility alias, but
`--clean` is the intended command.

This is the shape to aim for once the host-only build, runtime bundling, and
native modules are all working independently.

## 15. A Practical Build Order

For a new app, do this in order:

1. Package scripts only with `sqgipkg --smoke-test ""`.
2. Add resources and `script_dirs`.
3. Add `--doctor` to your normal build loop.
4. Add Linux runtime packages with `linux.deb.download`.
5. Use `--keep-appdir` and inspect `dist-linux-<arch>/<name>.AppDir`.
6. Add `--smoke-test-isolated` for GStreamer apps.
7. Add Windows package lists and build `--target win-dir`.
8. Add NSIS only after `win-dir` works.
9. Add native modules for the host.
10. Add Linux `linux.arches`.
11. Add Windows native module builds.
12. Finish with `--target all`.

## Troubleshooting By Symptom

`import("Gtk", "4.0")` works on the host but fails in the package:

Check that the package includes GTK libraries and `Gtk-4.0.typelib`. Prefer:

```json
"linux": {
  "deb": {
    "download": true,
    "packages": ["libgtk-4-1", "gir1.2-gtk-4.0"]
  }
}
```

GStreamer pipelines work on the host but not in the AppImage:

Use `--smoke-test-isolated` and make sure the needed plugin packages are listed.
For common playback/capture work, start with `gstreamer1.0-plugins-base` and
`gstreamer1.0-plugins-good`.

An image format works on the host but not in the AppImage:

Make sure gdk-pixbuf loaders are packaged. The AppImage launcher can regenerate
a relocatable gdk-pixbuf loader cache when the query helper is bundled.

The wrong compiler is reused during cross builds:

Run `sqgipkg --clean`, or use per-arch build directories such as
`build-linux-x86_64`, `build-linux-aarch64`, and `build-windows-x86_64`. The
examples remove the build directory before configuring to avoid stale CMake
state.

The package works only when run from the source tree:

Look for absolute paths in your script and in native module configuration. Use:

```text
SQGI_APP_SHARE
SQGI_APP_RESOURCES
SQGI_APPDIR
```

for packaged runtime paths.

Windows builds cannot find `sqgi.exe`:

Set `windows.build` and `windows.build_dir`, or provide a Windows SQGI runtime
in the configured build directory. Cross builds use `SQGI_WIN_CMAKE_TOOLCHAIN`
and `SQGI_MESON_CROSS_FILE`.

## Where To Look Next

Working example projects:

```text
tools/sqgipkg_tests/native_gi_project/
tools/sqgipkg_tests/native_vala_project/
tools/sqgipkg_tests/native_entry_project/
tools/sqgipkg_tests/gtk_gst_overlay_project/
tools/sqgipkg_tests/gtk_themes/
```

Reference documentation:

```text
tools/README.md
```

Starter templates:

```text
tools/sqgipkg_templates/
```
