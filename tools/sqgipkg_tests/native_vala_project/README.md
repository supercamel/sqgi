# Native Vala Packaging Test

This project exercises packaging a Vala library with GObject Introspection.

The native library provides:

- a namespace function
- a `GObject.Object` subclass
- a property
- a signal
- async methods
- an async method that raises a `GError`

`main.nut` imports the generated `SqVala-1.0.typelib`, calls the sync API,
connects the signal, awaits Vala async methods directly, and checks the
expected async error path.

Build and run:

```sh
cd tools/sqgipkg_tests/native_vala_project
sqgipkg --smoke-test ""
```

Build the AppImage, the Windows NSIS installer, or both:

```sh
sqgipkg --target appimage --smoke-test ""
sqgipkg --target win-nsis
sqgipkg --target all --smoke-test ""
```

When working from an uninstalled checkout, run from the repository root:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json \
  --target appimage \
  --smoke-test ""
```

Build a Windows NSIS installer from Ubuntu with MinGW cross files:

```sh
SQGI_WIN_CMAKE_TOOLCHAIN=/path/to/mingw-toolchain.cmake \
SQGI_MESON_CROSS_FILE=/path/to/mingw64.ini \
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json \
  --target win-nsis
```

Build the same target from an MSYS2 MinGW shell:

```sh
sqgipkg --target win-nsis
```

The manifest keeps native build outputs explicit, because `sqgipkg` needs to
know which Vala-built `.so`/`.dll` and `.typelib` files to stage. The generic
SQGI runtime MSYS2 packages are inferred automatically for Windows targets.
When `makensis` is available, `win-nsis` writes `dist/NativeVala-Setup.exe`;
otherwise it leaves `dist/NativeVala.nsi` beside the staged Windows directory.

Most SQGI async code should use plain `await`. That works for SQGI tasks, GIO
async APIs, and Vala async methods that expose callback/user-data finish pairs:

```squirrel
local packaged_main = Gio.File.new_for_path(path)
local result = await packaged_main.load_contents_async(null)

await sqgi.sleep(1)

local greeting = await worker.greet_async("SQGI")
local sum = await worker.delayed_sum_async(19, 23)
```

The raw GI methods are still available as `greet_async_raw`,
`delayed_sum_async_raw`, and `fail_async_raw` for low-level tests or unusual
manual callback wiring.
