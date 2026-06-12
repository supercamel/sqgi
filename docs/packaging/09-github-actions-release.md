# 9. GitHub Actions Release Builds

`sqgipkg` can turn a native GI application into release artifacts from one
Ubuntu GitHub Actions runner:

- Linux x86_64 AppImage
- Linux aarch64 AppImage
- Windows x86_64 NSIS installer

The application does not have to be an SQGI script app. Use a native entry
manifest when your program is a Vala, C, C++, GTK, libadwaita, GStreamer, or
other GObject Introspection application with its own executable. `sqgipkg`
provides the packaging machinery: Linux sysroots, generated cross files, MSYS2
package staging, launchers, AppImage output, and NSIS output.

This pattern is used by native applications such as Verminal, RFDTool, and
OLLMchat. The important pieces are:

1. check out the application;
2. check out SQGI so the runner can build and install `sqgipkg`;
3. install host build tools, cross compilers, NSIS, and AppImage tools;
4. run `sqgipkg` once for each release target;
5. upload artifacts, and publish them on tag pushes.

## Native Entry Manifest

For a native app, declare the executable paths instead of a Squirrel script:

```json
{
  "name": "MyGtkApp",
  "entry": {
    "type": "native",
    "linux": "build-linux-x86_64/my-gtk-app",
    "windows": "build-windows-x86_64/my-gtk-app.exe"
  },
  "linux": {
    "deb": {
      "suite": "noble"
    },
    "arches": [
      {
        "arch": "x86_64",
        "build_dir": "build-linux-x86_64",
        "entry_linux": "build-linux-x86_64/my-gtk-app",
        "deb": {
          "download": true,
          "packages": [
            "libgtk-4-dev",
            "gir1.2-gtk-4.0",
            "libglib2.0-dev",
            "gobject-introspection"
          ]
        },
        "native_projects": [
          {
            "name": "my-gtk-app",
            "dir": ".",
            "build": [
              "meson setup \"$SQGI_LINUX_BUILD_DIR\" --wipe --prefix /usr --buildtype=release ${SQGI_LINUX_MESON_CROSS_FILE:+--cross-file \"$SQGI_LINUX_MESON_CROSS_FILE\"} || meson setup \"$SQGI_LINUX_BUILD_DIR\" --prefix /usr --buildtype=release ${SQGI_LINUX_MESON_CROSS_FILE:+--cross-file \"$SQGI_LINUX_MESON_CROSS_FILE\"}",
              "meson compile -C \"$SQGI_LINUX_BUILD_DIR\""
            ]
          }
        ]
      },
      {
        "arch": "aarch64",
        "build_dir": "build-linux-aarch64",
        "entry_linux": "build-linux-aarch64/my-gtk-app",
        "deb": {
          "download": true,
          "packages": [
            "libgtk-4-dev",
            "gir1.2-gtk-4.0",
            "libglib2.0-dev",
            "gobject-introspection"
          ]
        },
        "native_projects": [
          {
            "name": "my-gtk-app",
            "dir": ".",
            "build": [
              "meson setup \"$SQGI_LINUX_BUILD_DIR\" --wipe --prefix /usr --buildtype=release ${SQGI_LINUX_MESON_CROSS_FILE:+--cross-file \"$SQGI_LINUX_MESON_CROSS_FILE\"} || meson setup \"$SQGI_LINUX_BUILD_DIR\" --prefix /usr --buildtype=release ${SQGI_LINUX_MESON_CROSS_FILE:+--cross-file \"$SQGI_LINUX_MESON_CROSS_FILE\"}",
              "meson compile -C \"$SQGI_LINUX_BUILD_DIR\""
            ]
          }
        ]
      }
    ]
  },
  "windows": {
    "msys2_prefix": "mingw64",
    "gdk_backend": "win32",
    "build_dir": "build-windows-x86_64",
    "packages": [
      "mingw-w64-x86_64-gtk4"
    ],
    "native_projects": [
      {
        "name": "my-gtk-app",
        "dir": ".",
        "build": [
          "meson setup \"$SQGI_WINDOWS_BUILD_DIR\" --wipe --prefix \"$SQGI_WINDOWS_PREFIX\" --buildtype=release --cross-file \"$SQGI_MESON_CROSS_FILE\" || meson setup \"$SQGI_WINDOWS_BUILD_DIR\" --prefix \"$SQGI_WINDOWS_PREFIX\" --buildtype=release --cross-file \"$SQGI_MESON_CROSS_FILE\"",
          "meson compile -C \"$SQGI_WINDOWS_BUILD_DIR\""
        ]
      }
    ]
  }
}
```

Each Linux architecture entry can download its own Debian/Ubuntu packages into a
private sysroot. The Windows section downloads MSYS2 packages into a private
Windows sysroot. Build commands receive target-specific variables such as
`SQGI_LINUX_MESON_CROSS_FILE`, `SQGI_LINUX_SYSROOT`,
`SQGI_WINDOWS_PREFIX`, and `SQGI_MESON_CROSS_FILE`.

`linux.deb.suite` pins the Ubuntu package suite used for those private Linux
sysroots. The value is the Ubuntu codename, not the numeric version: for
example, use `noble` for Ubuntu 24.04. Pinning it in CI keeps package resolution
stable even if the workflow runner image changes later. Use
`linux.arches[].deb.suite` when one architecture needs a different suite, or
`--linux-deb-suite SUITE` for a temporary command-line override.

If your app builds helper libraries first, add them as `native_projects` or
`windows.native_dependencies` with `stage: false`, install them into the target
sysroot, and then build the final executable against that sysroot.

## Release Workflow

Put this in `.github/workflows/release.yml` and adjust names, packages, and
artifact paths for your app:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'
  workflow_dispatch:

permissions:
  contents: write

env:
  APPIMAGE_EXTRACT_AND_RUN: '1'

jobs:
  build:
    runs-on: ubuntu-24.04
    steps:
      - name: Checkout app
        uses: actions/checkout@v4
        with:
          path: MyGtkApp

      - name: Checkout sqgi
        uses: actions/checkout@v4
        with:
          repository: supercamel/sqgi
          path: sqgi

      - name: Install build dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y --no-install-recommends \
            build-essential cmake ninja-build pkg-config git file ca-certificates wget \
            meson valac gobject-introspection \
            libglib2.0-dev libgirepository1.0-dev libffi-dev libcairo2-dev libgtk-4-dev \
            gcc-aarch64-linux-gnu g++-aarch64-linux-gnu qemu-user-static binfmt-support \
            mingw-w64 nsis squashfs-tools

      - name: Build and install sqgi
        run: |
          cmake -S sqgi -B sqgi/build -G Ninja -DCMAKE_BUILD_TYPE=Release
          cmake --build sqgi/build
          sudo cmake --install sqgi/build --prefix /usr/local
          sudo ldconfig

      - name: Build Linux x86_64 AppImage
        working-directory: MyGtkApp
        run: sqgipkg --target appimage --appimage-arch x86_64 --sqgi-source-dir "$GITHUB_WORKSPACE/sqgi"

      - name: Build Linux aarch64 AppImage
        working-directory: MyGtkApp
        run: sqgipkg --target appimage --appimage-arch aarch64 --sqgi-source-dir "$GITHUB_WORKSPACE/sqgi"

      - name: Build Windows installer
        working-directory: MyGtkApp
        run: sqgipkg --target win-nsis --sqgi-source-dir "$GITHUB_WORKSPACE/sqgi"

      - name: Collect artifacts
        working-directory: MyGtkApp
        run: |
          mkdir -p artifacts
          cp dist-linux-x86_64/MyGtkApp.AppImage    artifacts/MyGtkApp-x86_64.AppImage
          cp dist-linux-aarch64/MyGtkApp.AppImage   artifacts/MyGtkApp-aarch64.AppImage
          cp dist-windows-x86_64/MyGtkApp-Setup.exe artifacts/MyGtkApp-Setup.exe
          ls -lh artifacts

      - name: Upload build artifacts
        uses: actions/upload-artifact@v4
        with:
          name: mygtkapp-builds
          path: MyGtkApp/artifacts/*

      - name: Publish release assets
        if: startsWith(github.ref, 'refs/tags/')
        working-directory: MyGtkApp
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          gh release create "$GITHUB_REF_NAME" artifacts/* \
            --repo "$GITHUB_REPOSITORY" \
            --title "$GITHUB_REF_NAME" \
            --generate-notes \
          || gh release upload "$GITHUB_REF_NAME" artifacts/* \
            --repo "$GITHUB_REPOSITORY" --clobber
```

Push a tag to cut a release:

```sh
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

For test builds without publishing a release, run the workflow manually from the
GitHub Actions tab. You can also add `branches: [main]` under `on.push` if you
want every main-branch push to produce downloadable artifacts.

## What To Customize

- Add the host development packages your build scripts need to the apt step.
- Add target runtime and development packages to `linux.arches[].deb.packages`.
- Pin `linux.deb.suite` to an Ubuntu codename such as `noble` when the package
  sysroot should come from a specific Ubuntu release instead of the runner host.
- Use `linux.arches[].deb.suite` for per-architecture package suites, or pass
  `--linux-deb-suite SUITE` to force every Linux architecture for one build.
- Add Windows runtime packages to `windows.packages` and build-only packages to
  `windows.build_packages`.
- Keep Linux build directories architecture-specific.
- Use `entry_linux` per architecture when cross builds produce different output
  paths.
- Add `--smoke-test "..."` once your package can run a quick noninteractive
  check.
- Keep `APPIMAGE_EXTRACT_AND_RUN=1` for GitHub-hosted runners, where FUSE may
  be unavailable.

## Why This Is Useful

Native GTK and Vala developers often have working source builds but no simple
release pipeline for Linux AppImages and Windows installers. With `sqgipkg`, the
same manifest that describes your app's native build can produce portable
desktop artifacts on GitHub-hosted Ubuntu runners. You get repeatable release
assets without maintaining separate Linux, Windows, AppImage, and NSIS build
systems.

For complete field reference, see `tools/README.md` in the source tree.
