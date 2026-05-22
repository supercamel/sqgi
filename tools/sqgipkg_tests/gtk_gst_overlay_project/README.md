# GTK + GStreamer Overlay Packaging Test

This is a small SQGI project used to exercise `sqgipkg` with:

- more than one Squirrel script
- `import()` of a project-local module
- GTK 4 controls
- GStreamer `videotestsrc`
- GStreamer `cairooverlay` drawing a bouncing ball over the test video

Run from the repository root:

```sh
build/sqgi tools/sqgipkg_tests/gtk_gst_overlay_project/main.nut --timeout=5
```

Or from this directory, using Git to find the checkout root:

```sh
"$(git rev-parse --show-toplevel)/build/sqgi" main.nut --timeout=5
```

Build the default Linux AppImage:

```sh
cd tools/sqgipkg_tests/gtk_gst_overlay_project
sqgipkg --refresh-appimagetool
```

When working from an uninstalled checkout, run from the repository root:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/gtk_gst_overlay_project/sqgipkg.json \
  --refresh-appimagetool
```

Check the manifest without building:

```sh
cd tools/sqgipkg_tests/gtk_gst_overlay_project
sqgipkg --doctor
```

Build and run a short smoke test:

```sh
cd tools/sqgipkg_tests/gtk_gst_overlay_project
sqgipkg --smoke-test "--analyse --timeout=2"
```

Run the AppImage:

```sh
APPIMAGE_EXTRACT_AND_RUN=1 tools/sqgipkg_tests/gtk_gst_overlay_project/dist-linux-x86_64/GtkGstOverlay.AppImage --timeout=5
```

If you build every supported target with `sqgipkg --target all`, the Linux
AppImages are written under `dist-linux-x86_64/` and `dist-linux-aarch64/`,
and the Windows packaging output is written under `dist-windows-x86_64/`.

Each Linux arch entry uses sqgipkg's generated Linux CMake toolchain path via
`SQGI_LINUX_CMAKE_TOOLCHAIN` when the target is not the host architecture, so
the manifest does not need checked-in cross files and works from either arm64 or
x86_64 hosts. Each Linux arch entry enables `deb.download` and lists its Debian
runtime packages, so both x86_64 and aarch64 builds populate private sysroots
in the per-user `~/.cache/sqgipkg/linux-sysroots/` cache instead of requiring
GTK/GStreamer target packages to be installed on the host or re-extracted for
every project. The host still needs any compiler toolchain required to build a
non-native target, such as `x86_64-linux-gnu-gcc`/`g++` from an arm64 host or
`aarch64-linux-gnu-gcc`/`g++` from an x86_64 host.

When `--smoke-test` is used for a non-native Linux arch, sqgipkg runs the
staged AppDir through QEMU user-mode/binfmt with the matching private sysroot.
Install `qemu-user-binfmt` to smoke-test x86_64 outputs on arm64 hosts or
aarch64 outputs on x86_64 hosts.

The manifest relies on sqgipkg's import scanner, so `main.nut` and its
project-local `ball_state.nut` import are packaged without listing every module.
By default `sqgipkg` compiles those scripts to `.cnut` bytecode and leaves
`.nut` compatibility links in place, so existing `import("ball_state.nut")`
paths still work without shipping the original source text.

Build a Windows staging directory:

```sh
cd tools/sqgipkg_tests/gtk_gst_overlay_project
sqgipkg --target win-dir
```

On non-Windows hosts, `sqgipkg` prepares the target-local MSYS2 sysroot and
generated CMake/Meson cross files automatically. The manifest is intentionally
small; `sqgipkg` infers the base SQGI, GTK, and GStreamer MSYS2 packages from
imports. If a Windows package must guarantee embedded `gtk4paintablesink`
instead of using the demo's GTK fallback renderer, add
`mingw-w64-x86_64-gst-plugin-gtk` to `windows.packages`.

Depending on the target machine, a fully portable Linux GStreamer bundle may
also need plugin directories or other runtime assets. Add those manually to
`sqgipkg.json` with either a convenience bucket or exact `files` entries, for
example:

```json
{
  "gstreamer_plugins": [
    "/usr/lib/x86_64-linux-gnu/gstreamer-1.0"
  ],
  "files": [
    {
      "path": "data/pipeline.conf",
      "dest": "usr/share/sqgi/app/pipeline.conf"
    }
  ]
}
```
