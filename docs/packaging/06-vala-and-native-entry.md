# 6. Package Vala Modules And Native Entry Apps

Vala and native-entry apps use the same `sqgipkg` machinery as C GObject
modules: build native artifacts, stage the runtime outputs, and include any
Squirrel payloads the app needs.

## Package A Vala Module

Vala produces a shared library and GIR data. Compile the GIR to a `.typelib`,
then stage the library and the typelib.

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

The script imports the namespace just like any other GI library:

```squirrel
local MyVala = import("MyVala", "1.0")

local worker = MyVala.Worker.new()
print(worker.greet("SQGI") + "\n")
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

See `tools/sqgipkg_tests/native_vala_project/` for a full fixture with
properties, signals, async methods, and an async error path.

## Package A Native Entry App

Not every app starts by launching `sqgi main.nut`. A native executable can own
startup, embed SQGI, and still ship Squirrel payloads beside itself.

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

The Linux AppImage `AppRun` executes the native Linux binary. The Windows
launcher executes the Windows `.exe`. `script_dirs` still works, so embedded SQGI
apps can package compiled `.cnut` files under the app script directory.

See `tools/sqgipkg_tests/native_entry_project/` for a complete example.

## Per-Architecture Native Entry Paths

Cross builds often produce different binary paths per target. Override the entry
inside each arch entry:

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
  },
  "windows": {
    "entry_windows": "native/build-windows-x86_64/native-entry.exe"
  }
}
```

## Build-Only Native Dependencies

Some native projects are not app modules. They provide headers, pkg-config files,
typelibs, import libraries, or DLLs that another project needs during configure.
For Windows, use `windows.native_dependencies`:

```json
{
  "windows": {
    "native_dependencies": [
      {
        "name": "gserial",
        "repo": "https://github.com/example/gserial.git",
        "dir": ".sqgipkg/native/gserial",
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
    ]
  }
}
```

Use `stage: false` when the dependency is only needed in the build sysroot. Set
`stage: true` and declare files, typelibs, or libraries when it also contributes
runtime payloads directly.

Next: [package GTK themes and application settings](07-gtk-theming.md).
