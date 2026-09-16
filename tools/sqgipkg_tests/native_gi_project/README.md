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
cd tools/sqgipkg_tests/native_gi_project
sqgipkg --smoke-test ""
```

When working from an uninstalled checkout, run from the repository root:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_gi_project/sqgipkg.json \
  --smoke-test ""
```

Build a Windows staging directory:

```sh
cd tools/sqgipkg_tests/native_gi_project
sqgipkg --target win-dir
```


The version 2 manifest builds SQGI from this checkout with `runtime.source`,
and declares Linux architectures and the Ubuntu 24.04 dependency baseline once.
Native recipes use generated cross files automatically. Build products live in
`.sqgipkg/build/<platform>/<name>`; library and typelib outputs are discovered.
For release projects, replace the local `HEAD` runtime recipe with a pinned
SQGI revision. For a fast host-only test using installed development libraries,
add `--no-linux-deb-download`.

Use `sqgipkg check` to validate and `sqgipkg explain` to inspect the resolved
recipes. Windows builds run from PowerShell/CMD without an MSYS2 shell; these
examples explicitly retain the MinGW64 package ABI. `win-nsis` requires NSIS.
Use `--target win-dir` to produce a directory without an installer compiler.

The C library declares `gi.strategy: host` for cross builds. Native Windows
builds compile the checked-in Windows GIR through a Meson target.
