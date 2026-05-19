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

Build an AppImage:

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

The manifest uses `script_dirs` so all project `.nut` scripts are discovered
and packaged without listing every module. By default `sqgipkg` compiles those
scripts to `.cnut` bytecode and leaves `.nut` compatibility links in place, so
existing `import(... "ball_state.nut")` paths still work without shipping the
original source text.

Build a Windows staging directory:

```sh
cd tools/sqgipkg_tests/gtk_gst_overlay_project
SQGI_WIN_CMAKE_TOOLCHAIN=/path/to/mingw-toolchain.cmake \
sqgipkg --target win-dir
```

The Windows manifest keeps only the project-specific addition,
`mingw-w64-x86_64-gst-plugin-gtk`. `sqgipkg` infers the base SQGI, GTK, and
GStreamer MSYS2 packages from imports.

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
