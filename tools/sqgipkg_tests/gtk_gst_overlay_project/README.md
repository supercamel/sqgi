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

Or from this directory:

```sh
../../../build/sqgi main.nut --timeout=5
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
APPIMAGE_EXTRACT_AND_RUN=1 tools/sqgipkg_tests/gtk_gst_overlay_project/dist/GtkGstOverlay.AppImage --timeout=5
```

If you build every supported target with `sqgipkg --target all`, the Linux
AppImage is written under `dist-linux/` and the Windows packaging output is
written under `dist-windows/`.

The manifest uses `script_dirs` so all project `.nut` scripts are discovered
and packaged without listing every module. By default `sqgipkg` compiles those
scripts to `.cnut` bytecode and leaves `.nut` compatibility links in place, so
existing `import(... "ball_state.nut")` paths still work without shipping the
original source text.

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
