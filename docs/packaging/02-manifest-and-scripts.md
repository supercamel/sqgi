# 2. Use A Manifest And Package More Scripts

A manifest gives the package a stable name and tells `sqgipkg` what extra script
paths to include.

## Add sqgipkg.json

Project:

```text
hello-sqgi/
  main.nut
  sqgipkg.json
```

`sqgipkg.json`:

```json
{
  "name": "HelloSqgi",
  "script": "main.nut",
  "script_dirs": [
    "."
  ]
}
```

Build and check it:

```sh
sqgipkg --doctor
sqgipkg --smoke-test ""
```

The output is now named from the manifest:

```text
dist-linux-x86_64/HelloSqgi.AppImage
```

If `script` is omitted and `main.nut` exists beside the manifest, `sqgipkg` uses
`main.nut` automatically.

## Local Imports Are Followed

Suppose the app grows:

```text
hello-sqgi/
  main.nut
  ui/window.nut
  lib/config.nut
  sqgipkg.json
```

If `main.nut` imports local files with literal paths, `sqgipkg` follows them:

```squirrel
local Window = import("ui/window.nut")
local Config = import("lib/config.nut")
```

That is enough for normal static imports. Keep `script_dirs` when your app loads
scripts dynamically, when scripts are selected by config, or when you want to
stage a whole source tree.

## Add Individual Scripts

Use `scripts` for exact script files:

```json
{
  "name": "HelloSqgi",
  "script": "main.nut",
  "scripts": [
    "src/config.nut",
    "src/ui/window.nut=ui/window.nut",
    {
      "path": "plugins/about.nut",
      "dest": "plugins/about.nut"
    }
  ]
}
```

The destination is relative to the packaged SQGI app script directory.

## Bytecode And Compatibility Paths

By default, scripts are compiled to `.cnut` bytecode:

```text
usr/share/sqgi/app/main.cnut
usr/share/sqgi/app/main.nut -> main.cnut
usr/share/sqgi/app/ui/window.cnut
usr/share/sqgi/app/ui/window.nut -> window.cnut
```

Windows packages copy compatibility files instead of symlinking them.

Disable bytecode compilation only when you specifically want source packages or
easier debugging:

```json
{
  "compile_scripts": false,
  "script_dirs": [
    "."
  ]
}
```

or:

```sh
sqgipkg --no-compile-scripts
```

## Start From A Template

Create a starter manifest:

```sh
sqgipkg --init simple
```

Other templates are available:

```sh
sqgipkg --init gtk4
sqgipkg --init gtk4-gstreamer
sqgipkg --init native-gobject
sqgipkg --init native-vala
```

Next: [add resources and exact files](03-resources-and-files.md).

