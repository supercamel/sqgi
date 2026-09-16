# Native Entry Packaging Test

This project exercises `sqgipkg`'s native-entry mode.

Unlike the SQGI entrypoint examples, the packaged app launches a native C
executable directly:

```json
"entry": {
  "type": "native",
  "linux": ".sqgipkg/build/linux-x86_64/entry/sq-native-entry",
  "windows": ".sqgipkg/build/windows-x86_64/entry/sq-native-entry.exe"
}
```

The project still includes Squirrel payload files under `scripts/`. `sqgipkg`
compiles them to `.cnut` and stages them under `share/sqgi/app`, which is useful
for embedded SQGI apps where the native executable owns startup but still wants
packaged Squirrel modules.

Build and run the Linux AppImage:

```sh
cd tools/sqgipkg_tests/native_entry_project
sqgipkg --smoke-test "demo-arg"
```

From an uninstalled checkout:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_entry_project/sqgipkg.json \
  --smoke-test "demo-arg"
```

Build a Windows staging directory from an Ubuntu/MinGW host:

```sh
cd tools/sqgipkg_tests/native_entry_project
sqgipkg --target win-dir
```

`sqgipkg` will prepare the MSYS2 sysroot/cross files when Windows packages are
declared. This example has no external runtime packages, so it only needs the
MinGW compiler and generated Meson cross file.

The Linux manifest also has x86_64 and aarch64 arch entries. On a cross-arch
host, `sqgipkg` builds the native executable in an arch-specific Meson build
directory and can run the AppDir smoke test through QEMU user-mode when
`qemu-user-binfmt` is installed.

The version 2 `native` Meson recipe replaces the per-platform shell commands.
Only the executable entry paths vary by architecture. This demo does not build
or bundle SQGI, because the packaged entry is a standalone C executable.
Windows commands run from PowerShell/CMD; no MSYS2 shell is needed.
