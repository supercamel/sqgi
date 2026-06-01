# 4. Bundle Runtime Libraries And GI Data

Scripts that import GLib, Gio, GTK, GStreamer, libsoup, or your own GI namespace
need more than `.nut` files. The packaged app must be able to find shared
libraries, typelibs, plugins, schemas, loaders, and data files at runtime.

`sqgipkg` gives you convenience fields for common runtime payloads, plus exact
fields when you know what to stage.

## Package A GTK App

Start from the GTK template:

```sh
sqgipkg --init gtk4
```

The small starter manifest is:

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

For a portable Linux AppImage, add Linux runtime packages. This keeps the app
from relying on the host GTK install:

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

When Debian downloading is enabled, packages are extracted into a private cache
under `~/.cache/sqgipkg/linux-sysroots/`. This avoids installing target runtime
packages into the host OS.

Run:

```sh
sqgipkg --doctor
sqgipkg --smoke-test "--auto"
```

## Add GStreamer

Start from:

```sh
sqgipkg --init gtk4-gstreamer
```

For Linux, list the runtime packages you need:

```json
{
  "name": "VideoDemo",
  "script_dirs": [
    "."
  ],
  "linux": {
    "deb": {
      "download": true,
      "packages": [
        "libgtk-4-1",
        "libgstreamer1.0-0",
        "gstreamer1.0-plugins-base"
      ]
    }
  },
  "windows": {
    "gdk_backend": "win32",
    "packages": [
      "mingw-w64-x86_64-gst-plugin-gtk"
    ]
  }
}
```

For GStreamer apps, use the isolated smoke test to catch accidental host plugin
usage:

```sh
sqgipkg --smoke-test-isolated --smoke-test "--timeout=2"
```

See `tools/sqgipkg_tests/gtk_gst_overlay_project/` for a complete GTK +
GStreamer fixture.

## Stage Exact Libraries And Typelibs

Use `libraries` for shared libraries:

```json
{
  "libraries": [
    "native/build/libmyapp-1.0.so"
  ]
}
```

Linux destination:

```text
usr/lib/
```

Use `typelibs` for GI metadata:

```json
{
  "typelibs": [
    "native/build/MyApp-1.0.typelib"
  ]
}
```

Linux destination:

```text
usr/lib/girepository-1.0/
```

Windows-specific equivalents are:

```json
{
  "windows": {
    "libraries": [
      "native/build-windows-x86_64/libmyapp-1.0.dll"
    ],
    "typelibs": [
      "native/build-windows-x86_64/MyApp-1.0.typelib"
    ]
  }
}
```

Windows destinations:

```text
bin/
lib/girepository-1.0/
```

The generated launchers set `GI_TYPELIB_PATH` so packaged typelibs are found
before host typelibs.

## Use Convenience Runtime Buckets

These fields stage common runtime directories and run cache tools when available:

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

Next: [package a native GObject module](05-native-gobject-modules.md).

