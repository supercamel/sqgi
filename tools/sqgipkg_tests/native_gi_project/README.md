# Native GI Packaging Test

This project exercises packaging a GObject Introspection shared library with
`sqgipkg`.

The native library is written in C, built by Meson, scanned into
`SqHello-1.0.typelib`, and imported from `main.nut`:

```squirrel
local SqHello = import("SqHello", "1.0")
print(SqHello.greet("SQGI") + "\n")
```

Build and run:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_gi_project/sqgipkg.json \
  --smoke-test ""
```
