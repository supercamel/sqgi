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

The manifest keeps native build outputs explicit, because `sqgipkg` needs to
know which `.so`/`.dll` and `.typelib` files to stage. The generic SQGI runtime
MSYS2 packages are inferred automatically for Windows targets.

On non-Windows hosts, `sqgipkg` prepares the MSYS2 sysroot and generated
CMake/Meson cross files automatically. This manifest currently selects the
`ucrt64` MSYS2 prefix, so Ubuntu cross-build hosts need a matching UCRT MinGW
toolchain available; native MSYS2 UCRT64 shells can use the manifest as-is.
