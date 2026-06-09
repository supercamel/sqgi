# Packaging With sqgipkg

This tutorial series teaches `sqgipkg` by building up one packaging problem at a
time. It starts with one Squirrel file and ends with native modules, GTK runtime
data, themes, AppImages, Windows staging, and multi-architecture builds.

Use these pages when you want a guided path. Use `tools/README.md` in the source
tree when you need the complete field reference.

## Tutorial Path

1. [Package one script](01-package-one-script.md)
2. [Use a manifest and package more scripts](02-manifest-and-scripts.md)
3. [Add resources and exact files](03-resources-and-files.md)
4. [Bundle runtime libraries and GI data](04-runtime-libraries-and-gi-data.md)
5. [Package a native GObject module](05-native-gobject-modules.md)
6. [Package Vala modules and native entry apps](06-vala-and-native-entry.md)
7. [Package GTK themes and application settings](07-gtk-theming.md)
8. [Build AppImages, Windows installers, and architecture matrices](08-targets-and-cross-builds.md)
9. [Build release artifacts with GitHub Actions](09-github-actions-release.md)

## What sqgipkg Produces

From a project directory like this:

```text
myapp/
  main.nut
  sqgipkg.json
  assets/
  native/
```

you can run:

```sh
sqgipkg --target all
```

and get target-specific output directories such as:

```text
dist-linux-x86_64/MyApp.AppImage
dist-linux-aarch64/MyApp.AppImage
dist-windows-x86_64/MyApp/
dist-windows-x86_64/MyApp-Setup.exe
```

The package contains the SQGI runtime, compiled `.cnut` payloads, compatibility
`.nut` paths, resources, native shared libraries, GI typelibs, GTK/GStreamer
runtime data, and launchers that set the expected runtime environment.

## Running From A Source Checkout

Installed examples use:

```sh
sqgipkg
```

When working inside an uninstalled SQGI checkout, run the packager through the
local runtime:

```sh
build/sqgi tools/sqgipkg
```

For a project outside the source tree, tell `sqgipkg` where the SQGI source is if
your manifest build commands need it:

```sh
sqgipkg --sqgi-source-dir /path/to/sqgi
```

or put a source checkout rule in the manifest:

```json
{
  "sqgi_source": {
    "repo": "https://github.com/supercamel/sqgi.git",
    "branch": "master"
  }
}
```

## Useful Examples In The Tree

- `tools/sqgipkg_tests/gtk_gst_overlay_project/` packages GTK 4, GStreamer, and
  local Squirrel imports.
- `tools/sqgipkg_tests/native_gi_project/` packages a C GObject library and its
  `.typelib`.
- `tools/sqgipkg_tests/native_vala_project/` packages a Vala library with
  properties, signals, async methods, and a Windows target.
- `tools/sqgipkg_tests/native_entry_project/` launches a native executable while
  still staging Squirrel payloads.
- `tools/sqgipkg_tests/gtk_themes/` stages GTK theme data and launcher settings.
