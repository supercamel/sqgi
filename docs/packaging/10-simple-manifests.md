# Simple manifests and native Windows packaging

Start with the task-oriented commands:

```text
sqgipkg init gtk4
sqgipkg check
sqgipkg explain
sqgipkg build
sqgipkg build --platform windows
```

`--help` shows the common workflow. `--help-all` contains the complete reference,
including legacy switches, cache settings and installer presentation. Existing
commands such as `--doctor`, `--init gtk4` and `--target win-dir` still work.
`appdir` and `tarball` are unavailable targets and are not advertised.

## Describe the application

```json
{
  "schema_version": 2,
  "name": "MyApp",
  "app_id": "org.example.MyApp",
  "features": ["gtk4"],
  "native": [{ "dir": "native", "build_system": "meson" }]
}
```

`main.nut` is the default entry. Literal local imports are followed automatically;
use `script_dirs` for dynamically imported scripts and `resources` for assets.
The `gtk4` feature selects GUI defaults and the platform's GTK dependencies.
Other features are `gstreamer`, `gdk-pixbuf` and `soup3`. Feature declarations
supplement static import discovery; they are useful for dynamically loaded code.
On Linux, features enable a private Ubuntu 24.04 dependency sysroot by default.
Explicit legacy package/download settings still override these defaults.

The `native` list is shared by Linux and Windows. A native recipe can use a local
`dir`, or a Git `repo` with an optional `ref`. Its default build system is Meson;
CMake is also supported. Builds live under `.sqgipkg/build/<platform>/<name>`.
The tool configures the cross files, builds, and discovers shared libraries and
typelibs. `options` passes build-system options and `targets` restricts the build.
Explicit `libraries`, `typelibs` and `files` remain available for unusual layouts.
Use unique native project names; `sqgi` is reserved for the runtime recipe.

To build SQGI itself, declare its revision:

```json
{
  "schema_version": 2,
  "runtime": { "sqgi": "<tag-or-commit>", "jit": true },
  "features": ["gtk4"],
  "platforms": {
    "linux": {
      "architectures": ["x86_64", "aarch64"],
      "baseline": "ubuntu-22.04"
    },
    "windows": { "architectures": ["x86_64"], "format": "installer" }
  }
}
```

Replace `<tag-or-commit>` with an actual SQGI revision. `runtime.source` or the
existing `--sqgi-source-dir` override can select a local source checkout. Without
`runtime`, packaging continues to use an existing build or installed runtime.
The Linux baseline chooses the dependency suite (`ubuntu-22.04` or
`ubuntu-24.04`) independently of the host distribution. Producing compatible
binaries also requires an appropriate compiler/runtime; choosing a package
suite alone does not certify compatibility with that distribution.

`--platform windows` uses the declared Windows format; `--target win-dir` or
`--target win-nsis` overrides it. `--target all` builds the Linux architecture
matrix and the declared Windows format (installer by default).
`explain` and `check` resolve the selected architecture overlays too. `explain`
prints the chosen runtime, native recipes, commands and packages without
fetching or building. `check` validates Windows payloads for Windows targets,
and treats fetchable repositories/generated outputs differently from missing
required local sources. Schema version 2 rejects unknown keys and invalid
field types; unversioned legacy manifests warn about unknown keys.

## GI metadata when cross-compiling

Some C GI libraries need a host build to generate their metadata. Instead of
copying Meson commands and `sed` expressions into each architecture, declare:

```json
{
  "native": [{
    "name": "gserial",
    "repo": "https://github.com/supercamel/gserial.git",
    "gi": {
      "strategy": "host",
      "namespace": "GSerial",
      "version": "1.0",
      "library": "gserial-1.0"
    }
  }]
}
```

For cross builds, this builds the target library, builds host metadata in a
separate directory, sets the GIR's target shared-library name, and compiles the
target typelib. It does not patch the project's source files. The declaration
is explicit because the host metadata must describe the same API on the target.
Native Windows builds generate their GI metadata natively. The host strategy
currently supports Meson projects.

## Windows with Ooblerg

Windows installs provide a native `sqgipkg.exe`, usable from PowerShell or CMD.
Windows dependency packages come exclusively from Ooblerg. Both native Windows
and Ubuntu 24.04 cross builds use its `x86_64-w64-mingw32` catalog and `/mingw64`
prefix. Source runtime recipes use the published LLVM 18 SDK.

Python 3 downloads, verifies, and extracts the Ooblerg archives into an owned
private sysroot. Standard native recipes prepare Ooblerg's `native-sdk` build
tools on Windows; Ubuntu uses its MinGW cross compiler. No MSYS2 installation
is used. Old MSYS2 settings must be migrated as described below.

```powershell
sqgipkg check
sqgipkg build --target win-dir
sqgipkg build --target win-nsis
```

Installer builds require NSIS (`makensis`) and fail before staging if it is
missing. To intentionally generate only the script, use
`--target win-nsis --nsis-script-only`. Normal installer success requires the
actual installer file to exist.

Legacy shell-string build hooks are supported on Linux. They are not implicitly
translated on Windows. Prefer recipes, or a portable process hook:

```json
{ "build": [{ "argv": ["cmake", "--build", "build"], "env": { "MODE": "release" } }] }
```

`argv` is passed directly to the process; shell quoting and variable expansion
do not occur. A native Windows CI workflow runs the CLI, native recipe tests,
package execution and installer compilation from PowerShell. Windows-to-Linux
AppImage production is not a native Windows backend; use a Linux build host.

## Record build inputs

```text
sqgipkg build --write-lock
sqgipkg build --locked
```

`--write-lock` writes a target-specific `sqgipkg.lock.json` after a successful
build, recording fetched source commits and downloaded package archives with
checksums. `--locked` requires the same manifest, pins fetched Git sources to
those commits, and uses the recorded package metadata/checksums. Keep the
package cache or retain the archives: a lockfile cannot make a removed remote
archive available. Private package downloads are required for package locking;
external unowned sysroots cannot be used as Ooblerg preparation roots.

The lock covers these dependency inputs, not the host compiler, local application
source, arbitrary build hooks, or the entire operating system. It is not a
promise of bit-for-bit reproducibility. `sqgipkg-build.json` records the completed
artifact and captured inputs. A file artifact also receives a SHA-256 digest.

## Application migration examples

The [examples directory](examples/README.md) contains compact candidates derived
from RFDTool, FoamCutter and StlViewer. They preserve explicit package/payload
choices while replacing runtime and native build command arrays. RouteTastic's
custom launcher, file rules and provenance remain explicit. These are migration
candidates, not claims of release-artifact equivalence.

## Migrating old MSYS2 manifests

Windows packaging now uses Ooblerg exclusively. Omit `windows.package_source`
or set it to `"ooblerg"`. Remove `windows.msys2_prefix`; the target prefix is
fixed at `/mingw64`. Remove `windows.msys2_root`, or replace it with
`windows.sysroot` pointing to a new private Ooblerg directory. Existing unrelated
roots are never overwritten. Regenerate package lockfiles with `--write-lock`
after migrating; old MSYS2 provenance cannot replay against Ooblerg.

Select actual Ooblerg catalog names rather than stripping prefixes blindly:

| Old package | Ooblerg package |
| --- | --- |
| `mingw-w64-x86_64-glib2` | `glib` |
| `mingw-w64-x86_64-gobject-introspection-runtime` | `libgirepository-1.0` |
| `mingw-w64-x86_64-gdk-pixbuf2` | `gdk-pixbuf` |
| `mingw-w64-x86_64-gtk4` | `gtk4` |

Use `sqgipkg packages --json` or the GUI package search to inspect available
packages. Packages absent from that catalog need an explicit source recipe or
runtime resources. Linux Ubuntu package lists retain their existing meaning.

CLI replacements are `--windows-sysroot`, `--windows-repo-url`,
`--windows-package-cache`, `--refresh-windows-packages`, and
`--no-windows-download`. The old `--msys2-*` flags are rejected.
Disabled downloads require verified package archives in cache, not just files
in an installed SDK.
