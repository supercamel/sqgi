# 7. Package GTK Themes And Application Settings

GTK apps often need more than libraries. A portable package may need theme data,
icon themes, settings files, and launcher environment variables.

`sqgipkg` can stage theme payloads and write the runtime settings used by the
generated AppImage and Windows launchers.

## Basic Theme Selection

Manifest:

```json
{
  "name": "GtkWidgetThemes",
  "gtk_theme": "SQGI-Violet-Dark",
  "gtk_icon_theme": "Adwaita",
  "gtk_prefer_dark": true,
  "files": [
    {
      "path": "themes/SQGI-Violet-Dark",
      "dest": "usr/share/themes/SQGI-Violet-Dark"
    }
  ],
  "linux": {
    "deb": {
      "download": true,
      "packages": [
        "libgtk-4-1"
      ]
    }
  },
  "windows": {
    "gdk_backend": "win32",
    "gtk_theme": "SQGI-Violet-Dark",
    "gtk_icon_theme": "Adwaita",
    "gtk_prefer_dark": true,
    "gtk_font_name": "Segoe UI 10",
    "files": [
      {
        "path": "themes/SQGI-Violet-Dark",
        "dest": "share/themes/SQGI-Violet-Dark"
      }
    ]
  }
}
```

For Linux AppImages, `sqgipkg` stages the theme under:

```text
usr/share/themes/SQGI-Violet-Dark
```

For Windows packages, the matching destination is:

```text
share/themes/SQGI-Violet-Dark
```

The generated launchers export the GTK theme environment and write GTK settings
files for the packaged runtime.

See `tools/sqgipkg_tests/gtk_themes/` for the complete fixture.

## Icons, Fonts, And Other GTK Data

Use `gtk_data` when you want to stage a larger GTK data tree under `usr/share`:

```json
{
  "gtk_data": [
    "share"
  ]
}
```

Use exact `files` entries when you want the package layout to be obvious in the
manifest:

```json
{
  "files": [
    {
      "path": "icons/hicolor",
      "dest": "usr/share/icons/hicolor"
    },
    {
      "path": "themes/MyTheme",
      "dest": "usr/share/themes/MyTheme"
    }
  ]
}
```

Windows destinations should use the Windows package layout:

```json
{
  "windows": {
    "files": [
      {
        "path": "icons/hicolor",
        "dest": "share/icons/hicolor"
      },
      {
        "path": "themes/MyTheme",
        "dest": "share/themes/MyTheme"
      }
    ]
  }
}
```

## GTK And GSettings Together

If your app uses GSettings schemas, stage them too:

```json
{
  "gsettings_schemas": [
    "schemas/org.example.MyApp.gschema.xml"
  ]
}
```

When `glib-compile-schemas` is available, `sqgipkg` compiles the staged schema
cache.

## Theme Smoke Tests

For GUI fixtures that can run briefly and exit automatically, add an app flag and
smoke-test it:

```sh
sqgipkg --smoke-test "--auto"
```

For `--target all`, Linux outputs are written under architecture-specific
directories and Windows output under the Windows target directory:

```text
dist-linux-x86_64/GtkWidgetThemes.AppImage
dist-linux-aarch64/GtkWidgetThemes.AppImage
dist-windows-x86_64/GtkWidgetThemes-Setup.exe
```

Next: [build AppImages, Windows installers, and architecture matrices](08-targets-and-cross-builds.md).

