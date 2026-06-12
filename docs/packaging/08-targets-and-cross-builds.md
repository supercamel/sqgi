# 8. Build AppImages, Windows Installers, And Architecture Matrices

`sqgipkg` can build a single host AppImage, prepare Linux sysroots, stage a
Windows app directory, write an NSIS installer, or run a combined target that
does Linux and Windows outputs from one manifest.

## Common Targets

```sh
sqgipkg --target appimage
sqgipkg --target linux-sysroot
sqgipkg --target win-dir
sqgipkg --target win-nsis
sqgipkg --target win-sysroot
sqgipkg --target all
```

`appimage` is the default Linux target.

`win-dir` creates a portable Windows directory. `win-nsis` stages the same
directory, writes an NSIS script, and runs `makensis` when it is available.

`all` builds Linux output first, then Windows NSIS output.

## Output Layout

Default target-aware outputs look like this:

```text
dist-linux-x86_64/MyApp.AppImage
dist-linux-aarch64/MyApp.AppImage
dist-windows-x86_64/MyApp/
dist-windows-x86_64/MyApp.nsi
dist-windows-x86_64/MyApp-Setup.exe
```

Clean project-local outputs:

```sh
sqgipkg --clean
```

## Linux Architecture Matrix

Use `linux.arches` to build repeatable x86_64 and aarch64 AppImages from one
manifest:

```json
{
  "name": "MultiArchDemo",
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

## Ubuntu Suite Selection

When `linux.deb.download` is enabled, `sqgipkg` downloads packages from an
Ubuntu suite. A suite is the Ubuntu codename, not the numeric version: use
`noble` for Ubuntu 24.04, `jammy` for Ubuntu 22.04, and so on.

By default, private Debian/Ubuntu sysroots use the host Ubuntu suite. Pin a
shared suite for all Linux architectures with `linux.deb.suite`:

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
mixes suites per architecture. The selected suite is part of the generated
repository-index and sysroot cache keys, so changing it creates a separate
private sysroot instead of silently reusing packages from another Ubuntu
release.

This option selects the Debian/Ubuntu package source for the Linux sysroot. It
does not change the host runner, host build tools, cross compiler, or Windows
MSYS2 packages.

When a target is not the host architecture, `sqgipkg` writes generated cross
files under the target output directory and exports paths such as:

```text
SQGI_LINUX_CMAKE_TOOLCHAIN
SQGI_LINUX_MESON_CROSS_FILE
SQGI_LINUX_BUILD_DIR
SQGI_LINUX_SYSROOT
SQGI_LINUX_ARCH
```

The host still needs the matching cross compiler. On an x86_64 Ubuntu host,
aarch64 builds typically need:

```sh
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
```

## Windows From Linux

For Windows targets, `sqgipkg` can prepare an MSYS2-style sysroot, generate
CMake and Meson cross files, build SQGI for Windows, stage DLLs, and write the
launcher.

Minimal Windows section:

```json
{
  "windows": {
    "msys2_prefix": "mingw64",
    "gdk_backend": "win32"
  }
}
```

Add explicit packages when inference is not enough:

```json
{
  "windows": {
    "packages": [
      "mingw-w64-x86_64-gtk4",
      "mingw-w64-x86_64-gstreamer",
      "mingw-w64-x86_64-gst-plugins-good"
    ]
  }
}
```

Build a portable directory:

```sh
sqgipkg --target win-dir
```

Build an NSIS installer:

```sh
sqgipkg --target win-nsis
```

If the app uses bundled fonts by family name, add `windows.fonts` so the NSIS
installer registers them with Windows for the current user:

```json
{
  "windows": {
    "fonts": [
      {
        "path": "data/fonts/RedactedScript-Regular.ttf",
        "registry_name": "Redacted Script Regular (TrueType)"
      }
    ]
  }
}
```

The portable `win-dir` output stages these files under `share/fonts/`. The
`win-nsis` target additionally installs them under
`%LOCALAPPDATA%\Microsoft\Windows\Fonts`, writes the `HKCU` Fonts registry
entry, and refreshes the Windows font list.

## NSIS Customization

```json
{
  "windows": {
    "nsis_options": {
      "installer_name": "MyApp-Setup.exe",
      "install_dir": "$LOCALAPPDATA\\MyApp",
      "header_image": "assets/nsis-header.bmp",
      "welcome_image": "assets/nsis-welcome.bmp",
      "desktop_shortcut": true,
      "start_menu_shortcut": true,
      "start_menu_folder": "MyApp",
      "request_execution_level": "user"
    }
  }
}
```

When `makensis` is not available, `sqgipkg` still writes the `.nsi` script beside
the staged Windows directory.

`win-nsis` uses NSIS Modern UI 2 by default. `header_image` sets the wizard
header bitmap and `welcome_image` sets the welcome/finish bitmap.

## Smoke Tests And Reports

Use `--doctor` before the expensive targets:

```sh
sqgipkg --doctor
```

Run the packaged app after building:

```sh
sqgipkg --smoke-test "--timeout=2"
```

For GStreamer apps:

```sh
sqgipkg --smoke-test-isolated --smoke-test "--timeout=2"
```

For cross-architecture Linux AppImages, `sqgipkg` can run the staged AppDir
through QEMU user mode when the target sysroot and `qemu-user-binfmt` are
available.

After staging, read the `sqgipkg report`. It tells you how many scripts,
resources, native projects, shared libraries, typelibs, GTK data files, schemas,
GIO modules, pixbuf loaders, and warnings were included.

## A Good Release Loop

1. Run `sqgipkg --doctor`.
2. Build the default AppImage.
3. Run `sqgipkg --smoke-test "...quick app args..."`.
4. For media apps, run an isolated smoke test.
5. Inspect the build report.
6. Build `win-dir` before `win-nsis`.
7. Build `--target all` after individual targets work.
8. Keep target-specific native build directories separate.

Next: [build release artifacts with GitHub Actions](09-github-actions-release.md).

For every manifest field, see `tools/README.md` in the source tree.
