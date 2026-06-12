# 3. Add Resources And Exact Files

Most apps need data files: images, UI files, config defaults, CSS, test media, or
other payloads. `sqgipkg` has two common ways to stage them.

## Use resources For App Data

Project:

```text
image-demo/
  main.nut
  assets/logo.png
  data/defaults.json
  sqgipkg.json
```

Manifest:

```json
{
  "name": "ImageDemo",
  "script_dirs": [
    "."
  ],
  "resources": [
    "assets",
    "data/defaults.json"
  ]
}
```

Resources are copied under the packaged app resources directory:

```text
usr/share/sqgi/app/resources/
```

On Windows the matching path is:

```text
share/sqgi/app/resources/
```

At runtime, use `SQGI_APP_RESOURCES`:

```squirrel
local GLib = import("GLib")

local logo = GLib.build_filenamev([
    GLib.getenv("SQGI_APP_RESOURCES"),
    "assets",
    "logo.png"
])

print("logo path: " + logo + "\n")
```

This keeps resource lookup independent from the current working directory.

## Use files For Exact Destinations

Use `files` when a file must land at a specific package-relative path:

```json
{
  "name": "PipelineDemo",
  "script_dirs": [
    "."
  ],
  "files": [
    "data/pipeline.conf=usr/share/sqgi/app/pipeline.conf",
    {
      "path": "data/mime/example.xml",
      "dest": "usr/share/mime/packages/example.xml"
    }
  ]
}
```

Destinations are relative to the staged app root. Absolute destinations and
`..` path segments are rejected.

For Windows-specific destinations, use `windows.files`:

```json
{
  "windows": {
    "files": [
      "windows/readme.txt=share/sqgi/app/readme.txt"
    ]
  }
}
```

For Windows fonts, prefer `windows.fonts` instead of a plain file copy. It
stages the font into the bundle and lets `win-nsis` register it per-user:

```json
{
  "windows": {
    "fonts": [
      "data/fonts/RedactedScript-Regular.ttf=Redacted Script Regular (TrueType)"
    ]
  }
}
```

## Use includes For Mixed Extras

`includes` can copy non-script files or add optional scripts:

```json
{
  "includes": [
    "extra/readme.txt",
    "src/optional_plugin.nut=plugins/optional_plugin.nut"
  ]
}
```

If no destination is provided, non-script files go into the normal resources
area.

Command-line equivalent:

```sh
sqgipkg --include extra/readme.txt
```

## Check The Staged App

Keep the AppDir so you can inspect where things landed:

```sh
sqgipkg --keep-appdir --smoke-test ""
```

Then look under:

```text
dist-linux-x86_64/ImageDemo.AppDir/usr/share/sqgi/app/
```

The build report also counts scripts, resources, manual files, libraries,
typelibs, GTK data, schemas, plugins, and warnings.

Next: [bundle runtime libraries and GI data](04-runtime-libraries-and-gi-data.md).
