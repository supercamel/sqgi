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

`--target all` builds the configured Linux architecture matrix plus Windows:

- `dist-linux-x86_64/NativeVala.AppImage`
- `dist-linux-aarch64/NativeVala.AppImage`
- `dist-windows-x86_64/NativeVala-Setup.exe` when `makensis` is available

The manifest enables `linux.deb.download`, so Linux targets use private Debian
sysroots in the per-user `~/.cache/sqgipkg/linux-sysroots/` cache instead of
relying on GLib/GIO development packages installed into the host OS. Cross
AppImage paths still need the matching cross compiler, such as
`x86_64-linux-gnu-gcc`/`g++` on arm64 hosts or `aarch64-linux-gnu-gcc`/`g++` on
x86_64 hosts. The Debian backend downloads Ubuntu package indexes for each
target Debian architecture it resolves, for example `amd64` and `arm64`.

For Linux cross entries, `sqgipkg` generates the CMake toolchain and Meson cross
file under the target output directory and exports
`SQGI_LINUX_CMAKE_TOOLCHAIN` and `SQGI_LINUX_MESON_CROSS_FILE` to the build
commands. This keeps the Linux and Windows cross-build shapes the same: the
manifest names the target architecture and consumes sqgipkg-provided cross-file
paths.

When working from an uninstalled checkout, run from the repository root:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json \
  --target appimage \
  --smoke-test ""
```

Build a Windows NSIS installer from Ubuntu:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json \
  --target win-nsis
```

On non-Windows hosts, `sqgipkg` prepares the MSYS2 sysroot and generated
CMake/Meson cross files automatically. The generated paths are exported to the
native build as `SQGI_WIN_CMAKE_TOOLCHAIN` and `SQGI_MESON_CROSS_FILE`.

Build the same target from an MSYS2 MinGW shell:

```sh
sqgipkg --target win-nsis
```

The manifest keeps native build outputs explicit, because `sqgipkg` needs to
know which Vala-built `.so`/`.dll` and `.typelib` files to stage. The generic
SQGI runtime MSYS2 packages are inferred automatically for Windows targets.
When `makensis` is available, `win-nsis` writes
`dist-windows-x86_64/NativeVala-Setup.exe`; otherwise it leaves
`dist-windows-x86_64/NativeVala.nsi` beside the staged Windows directory.
For `--target all`, the Windows outputs are written under `dist-windows-x86_64/`.

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
