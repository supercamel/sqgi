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
- `dist-windows-x86_64/NativeVala-Setup.exe` (requires NSIS)


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

Meson generates both the Vala GIR and the typelib, including cross builds.
No manifest shell hook or explicit library output list is required.

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
