# 5. Package A Native GObject Module

Native modules are how an SQGI app ships custom C or C++ code with a GObject
Introspection API. The usual output is a shared library plus a `.typelib`.

## Project Shape

```text
native-demo/
  main.nut
  sqgipkg.json
  native/
    meson.build
    my-helper.c
    my-helper.h
```

The script imports the native namespace:

```squirrel
local MyHelper = import("MyHelper", "1.0")

print(MyHelper.greet("SQGI") + "\n")
```

## Manifest

```json
{
  "name": "NativeDemo",
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

Build commands run from `native`. The `libraries` and `typelibs` paths are also
relative to `native`.

Build and smoke-test:

```sh
sqgipkg --smoke-test ""
```

See `tools/sqgipkg_tests/native_gi_project/` for a complete C GObject fixture.

## Linux Architecture-Specific Builds

When building more than one Linux architecture, put native project outputs under
architecture-specific build directories:

```json
{
  "name": "NativeDemo",
  "linux": {
    "deb": {
      "download": true
    },
    "arches": [
      {
        "arch": "x86_64",
        "build_dir": "build-linux-x86_64",
        "inherit_native_projects": false,
        "native_projects": [
          {
            "dir": "native",
            "build": [
              "BUILD_DIR=build-linux-x86_64 MESON_CROSS_FILE=\"$SQGI_LINUX_MESON_CROSS_FILE\" ./build.sh"
            ],
            "libraries": [
              "build-linux-x86_64/libmyhelper-1.0.so"
            ],
            "typelibs": [
              "build-linux-x86_64/MyHelper-1.0.typelib"
            ]
          }
        ]
      },
      {
        "arch": "aarch64",
        "build_dir": "build-linux-aarch64",
        "inherit_native_projects": false,
        "native_projects": [
          {
            "dir": "native",
            "build": [
              "BUILD_DIR=build-linux-aarch64 MESON_CROSS_FILE=\"$SQGI_LINUX_MESON_CROSS_FILE\" ./build.sh"
            ],
            "libraries": [
              "build-linux-aarch64/libmyhelper-1.0.so"
            ],
            "typelibs": [
              "build-linux-aarch64/MyHelper-1.0.typelib"
            ]
          }
        ]
      }
    ]
  }
}
```

`inherit_native_projects: false` prevents the top-level native build from also
running for each arch entry.

## Windows Native Module Builds

Windows builds use DLLs:

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
          "build-windows-x86_64/libmyhelper-1.0.dll"
        ],
        "typelibs": [
          "build-windows-x86_64/MyHelper-1.0.typelib"
        ]
      }
    ]
  }
}
```

On non-Windows hosts, `sqgipkg` prepares an MSYS2 sysroot and generated Meson or
CMake cross files. Your build command consumes `SQGI_MESON_CROSS_FILE` or
`SQGI_WIN_CMAKE_TOOLCHAIN`.

## Native Projects From Git

Native project entries can clone or update a repository before building:

```json
{
  "native_projects": [
    {
      "name": "my-helper",
      "repo": "https://github.com/example/my-helper.git",
      "dir": ".sqgipkg/native/my-helper",
      "branch": "main",
      "update": true,
      "submodules": true,
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

Pin `tag`, `ref`, or `commit` when you need reproducible builds.

Next: [package Vala modules and native entry apps](06-vala-and-native-entry.md).

