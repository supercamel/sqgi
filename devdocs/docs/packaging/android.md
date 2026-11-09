# Android application packaging

Android application builds, setup and deployment are part of the installed
`sqgipkg`. An app developer needs SQGI and the Android toolchain; neither a
SqgiAndroid checkout nor an Ooblerg checkout is required. It uses the Ubuntu
24.04-pinned Android libraries, API 31 minimum and NDK r28c. Native C GObject,
C++, Vala and Rust C-ABI recipes and prebuilt application modules work for both
ABIs. Multi-ABI AABs produce verified APK splits with ABI-specific GI metadata.
The same CLI provides desktop preview, deployment and source updates. Remaining
implementation history is tracked in the [integration plan](android-integration.md).

## First app on Ubuntu 24.04

Install a current SQGI build, including its packaging tools, using the
[normal installation instructions](../../../README.md#linux-build-from-source).
An installation under `~/.local` works when `~/.local/bin` is on PATH. Check
`sqgipkg --help`: it must list `setup` and `emulator`. These commands are
included with SQGI; there is no separate Android plugin.

Install the host prerequisites, then let SQGI prepare Google's tools:

```sh
sudo apt install openjdk-21-jdk curl unzip binutils libglib2.0-bin libxml2-utils
sqgipkg setup --platform android --emulator --accept-licenses
sqgipkg setup --platform android --check --emulator
sqgipkg emulator

mkdir MyApp
cd MyApp
sqgipkg init android-gtk4 --app-id org.example.myapp --name "My App"
sqgipkg deploy --platform android --arch x86_64 --serial emulator-5564
sqgipkg watch --platform android --arch x86_64 --serial emulator-5564
```

`--accept-licenses` authorizes acceptance of Google's
[Android SDK terms](https://developer.android.com/studio/terms) for the requested
tools. Setup downloads the pinned command-line tools and installs platform 35,
build-tools 35.0.0, platform-tools and NDK r28c. Gradle 8.9 is downloaded and
verified automatically. Setup uses an existing compatible toolchain when one
is available. JDK installation stays with the host package manager.

The optional `--emulator` setup flag adds the hash-pinned emulator 37.2.13 and
Android 16/API 36 Google APIs image. Its initial download is about 2.1 GiB;
first boot can take a few minutes. Linux hardware virtualization and access
to `/dev/kvm` are required. The AVD is named `SQGI_API_36`, retains its private
application data between starts, and uses port 5564 by default:

```sh
sqgipkg emulator --headless
sqgipkg emulator --stop
sqgipkg emulator --port 5566
```

Only one instance of this shared AVD runs at a time. A port belonging to another
AVD is rejected without stopping or changing it. Logs are in
`~/.local/share/sqgipkg/android/logs/`. Emulator deployment automatically selects
the bundled ANGLE driver for the application when available, preserving other
applications' settings. Physical-device driver settings are unchanged.

For a phone, omit `--emulator`, enable USB debugging and use the device serial
from `adb devices` with `--arch arm64-v8a`. A device or emulator is not needed
just to build an APK:

```sh
sqgipkg build --platform android --arch arm64-v8a --write-lock
sqgipkg build --target android-aab --write-lock
```

The starter selects both ABIs for an App Bundle. APKs go under `dist-android/`
when one ABI is selected. Apps include their SQGI runtime, native libraries
and GI metadata; Android does not need a separate SQGI installation.

## Setup locations and diagnostics

Setup saves paths in `~/.config/sqgipkg/android.json`. Subsequent commands use
them without needing repeated environment exports. `JAVA_HOME`,
`ANDROID_SDK_ROOT` / `ANDROID_HOME`, and `ANDROID_NDK_HOME` override saved paths.
The corresponding XDG config/data/cache variables are respected.

```sh
sqgipkg setup --platform android --java-home /path/to/jdk \
  --android-sdk-root /path/to/Android/Sdk --accept-licenses
sqgipkg setup --platform android --check --json
sqgipkg setup --platform android --check --native-tools
```

`--check` does not download, create directories, change configuration or need
an application manifest. JSON reports include each requirement and a suggested
fix; a missing requirement produces a nonzero exit status. `--native-tools`
also checks the Ubuntu 24.04 tools used to compile application-native modules.
Setup does not install those distribution packages. `--no-android-download`
allows reuse of prepared/cached tools and fails if an SDK component is missing.

For C/GObject and Vala modules on Ubuntu 24.04, install:

```sh
sudo apt install build-essential cmake ninja-build meson pkg-config valac \
  gobject-introspection libgirepository1.0-dev python3 e2fsprogs
```

Rust modules additionally need the Rust toolchain selected by their recipe.

`--android-sdk-root` selects **Google's** SDK. The existing `--android-sdk`
build option selects an exported **SQGI dependency SDK**, and is unnecessary
for normal app builds. GNOME libraries and prebuilt native modules download
from Ooblerg automatically. The `git-extras-r1` module set now publishes
GSceneGraph, GWorldScene, GSerial, GJoystick and their dependencies for both ABIs.

SQGI owns the application runtime, builder, setup and device commands.
SqgiAndroid contains maintainer library patches/recipes, demos and regression
tests. Ooblerg produces and serves the packages. Their build-time relationship
does not create a checkout dependency for application developers.

## Toolchain reference

Use a Linux x86-64 build host, `readelf`, a full JDK 17 or 21, Android SDK
platform/build-tools 35, and NDK `28.2.13676358`. Setup remembers the selected
paths; `JAVA_HOME` and `ANDROID_SDK_ROOT` can override them. `--android-ndk`
overrides the NDK directory; otherwise the backend uses `ANDROID_NDK_HOME`,
the saved selection or the Android SDK's `ndk` directory.
Gradle 8.9 is downloaded and checksum-verified, or can be selected
through `GRADLE_HOME` when already installed.

SDK/module downloads, locked offline replay, private SDK composition, APK/AAB
assembly, signing and split auditing now run in Squirrel/SQGI. Script apps and
apps using prebuilt native modules build with Python disabled. Native metadata
validation uses the native `xmllint` program from Ubuntu's `libxml2-utils`;
`SQGI_ANDROID_XMLLINT` may point to an extracted copy. Source native recipes,
their build hooks, QEMU/ADB adapters and inspection provisioning also run in
SQGI. Python 3.12 remains a requirement for upstream GI scanning and Meson;
the external acceptance harness is a separate Python user. The installed Android
backend contains no Python modules.

Set `platforms.android.permissions` to additional fully qualified permission
names, for example `["android.permission.INTERNET"]`. The wrapper retains its
`REORDER_TASKS` permission. These are [manifest declarations](https://developer.android.com/guide/topics/manifest/uses-permission-element);
permissions requiring a runtime request still need that request in application
code.

The shared `icon`/`desktop_icon` supplies the launcher image. An optional
`platforms.android.icon` overrides it with a path relative to the manifest.
GdkPixbuf on the build host decodes the image and converts it to a PNG bounded by
512 pixels, preserving its aspect ratio. SVG inputs require the host's SVG image
loader. The result is an Android [drawable resource](https://developer.android.com/guide/topics/resources/drawable-resource).
Manifest Studio exposes both permissions and the Android icon in Targets; blank
icon restores the shared choice. Permission changes and icon byte changes reject
`sync`/`watch` until the application is rebuilt and deployed. Icon inputs enter
the build lock, and bundled ABI inputs must share identical manifest/resources.

Start a GTK application in an empty project directory:

```sh
sqgipkg init android-gtk4 --app-id org.example.myapp --name 'My App'
sqgipkg preview --platform android
sqgipkg deploy --platform android --arch x86_64 --serial emulator-5554
```

This creates `sqgipkg.json`, `src/main.nut` and `src/message.txt`, with both
Android ABIs selected. Existing source files are preserved; an existing manifest
is never overwritten. The same entry and asset layout can be used with desktop
targets. Desktop preview uses the host's GTK libraries; Android uses the pinned
SDK. The default origin is `https://ooblerg.xyz`, with immutable release
`noble-android-r2` published for both ABIs. A local origin or exported SDK can
still be selected explicitly.

Convert a prototype Android project's `sqgi.json` in its original directory:

```sh
sqgipkg migrate
sqgipkg check --platform android
```

Migration preserves application identity, versions, GI namespaces, entry location
and source/assets. It writes only a new manifest, leaving `sqgi.json` and source
bytes untouched. Unknown legacy fields, symlinks, escaping paths or an existing
destination are rejected. Use `--from-sqgi path/to/sqgi.json` for another input,
or `--manifest converted.json` for an alternate output beside it. This is useful
when both old and new manifests already exist; select the intended output
explicitly instead of replacing a project configuration. Other build options
are rejected during migration.

The generated `entry.source_root` preserves the entry's path relative to the
source directory on Linux, Windows and Android, including nested scripts and
imports. Normal source directories use file rules that include later assets.
Legacy `source_dir: "."` uses an explicit inventory instead, so new manifests and
build outputs cannot enter the payload recursively; add subsequent assets to
`files` and `windows.files` yourself. Path rules preserve Unicode, `=` and literal
braces in filenames.

The producer checkout's `sqgi-android` launcher now delegates app commands to
sqgipkg's SQGI compatibility adapter. It retains `--project`, `--abi`, `bundle`,
the local SDK/dist defaults and legacy `deploy` (install existing APK, then run).
Direct `sqgipkg deploy` builds first. Set `SQGIPKG` to an installed executable to
select it; the producer otherwise prefers its built sibling SQGI checkout and
then PATH. Legacy-only projects require explicit migration. The bootstrap stays
Python-compatible for legacy callers, but only locates and execs
SQGI; application orchestration remains in Squirrel. Maintainer `sdk` commands
still use the producer tools.

For the local-SDK path, build the GUI SDK and metadata using SqgiAndroid,
then export its validated descriptor from that repository:

```sh
/usr/bin/python3 tools/export_sdk.py --abi x86_64
```

This adds `sdk/x86_64/sqgi-android-sdk.json`. It records the target, pinned sources,
runtime capabilities and file inventory. The consumer checks the installed
files without requiring the producer's host configuration. Select either the
ABI directory or its parent `sdk` directory with `--android-sdk`.
Older descriptors without a namespace catalog derive it from their validated
target GIR files using `xmllint`; prebuilt Ooblerg runtime packages already carry
the catalog and do not need GIR parsing for script-only apps.

## Selecting SQGI sources

Android normally uses the SQGI library supplied by the selected SDK. A shared
`"runtime": {"source": "/path/to/sqgi"}` or `runtime.sqgi` revision selects a
source build instead. The checkout must include the integrated Android
runtime-only CMake support. Android uses the SDK's pinned GNOME development
files and the NDK to build only SQGI, in a private SDK copy. CMake and Ninja are
required; GNOME libraries are not rebuilt.

An omitted `platforms.android.runtime` follows this shared selection. Set it to
`"package"` to use the Android SDK's SQGI while building SQGI from source for
desktop outputs, or `"source"` to require a shared source selector. Android
source builds disable JIT and typed kernels while preserving desktop defaults.
An explicitly authored `runtime.jit: true` is rejected for Android source
builds; remove the explicit setting or set it false.

The replacement must retain the SDK's public SQGI/Squirrel C function exports,
provide `libsqgi.so` with the correct ABI/SONAME and 16 KB alignment, and install
only SQGI's library, headers and pkg-config file. Its complete source inventory
is recorded in the lock and native-module provenance. Locked builds reject
source changes, and source updates require an APK rebuild if the runtime changes.
The public-export check is a compatibility check, not a proof of arbitrary
source-level or C-structure ABI compatibility; validate your selected runtime
with the application's native modules.

Manifest Studio exposes the shared selector in Runtime/native code and the
Android override in Targets. Resolve plan reports the selected mode and source
without fetching or compiling it.

## Android system information

The integrated runtime exposes Android through `import("system")`:

```squirrel
local system = import("system")
if (system.os.name == "android") {
    print(system.android.abi + " on API " + system.android.api_level + "\n")
}
```

`system.os` reports Android's release, and `system.android` distinguishes the
device API from the runtime's compiled minimum API. CPU/ABI describe the binary,
including ARM64 under native translation. `system.runtime.jit` and `.kernels`
are false. The shared app wrapper supplies private HOME, cache/config/data and
package resource paths before GTK starts, for both script and native entry and
for development snapshots. These runtime fields require the integrated sources
or `noble-android-r2`; the original local `noble-android-r1` runtime predates
this addition. See the [system module API](../../../docs/api/README.md#importsystem).

A minimal application manifest is:

```json
{
  "schema_version": 2,
  "name": "My App",
  "app_id": "org.example.myapp",
  "features": ["gtk4"],
  "compile_scripts": false,
  "platforms": {
    "android": {
      "architectures": ["x86_64"],
      "min_sdk": 31,
      "version_code": 1,
      "version_name": "0.1.0"
    }
  }
}
```

`main.nut` is the default entry. Existing script selection and file staging rules
apply. Resources go under `resources/` in the staged application; use an explicit
`files` destination under `usr/share/sqgi/app/` for assets that the script opens
directly from its working directory.

From the application directory:

```sh
sqgipkg explain --platform android --arch x86_64 --json
sqgipkg build --platform android --arch x86_64 --write-lock
sqgipkg build --platform android --arch x86_64 --locked --no-android-download
```

The repository origin must contain
`android/noble-android-r2/<target>/v1/index.json`. Public catalogs are available for
[ARM64](https://ooblerg.xyz/android/noble-android-r2/aarch64-linux-android/v1/index.json)
and [x86_64](https://ooblerg.xyz/android/noble-android-r2/x86_64-linux-android/v1/index.json),
alongside a [corresponding-source index](https://ooblerg.xyz/android/noble-android-r2/sources/index.json).
Ooblerg's
`tools/ooblerg.nut android-export --android-sdk DIR` stages that layout, and its
`server/main.nut --serve` command serves it on port 8787. Use
`--android-repository http://127.0.0.1:8787` for that local server; a `file://`
origin works for local exports too.

The earlier `noble-android-r1` catalogs were local acceptance builds. To migrate
one of those projects, set `platforms.android.sdk` to `noble-android-r2`, use the
public origin and rebuild with `--write-lock`. Existing r1 locks cannot identify
the new runtime or catalogs and are intentionally not silently upgraded.

`platforms.android.repository` and `download` persist the origin/download policy;
`sdk` selects the immutable release ID. `--refresh-android-packages` refreshes an
unlocked catalog. `--android-sdk /path/to/export` selects local files instead.
`check` and `explain` do not download packages. Builds without native recipes
select `sqgi-android-runtime`, which excludes headers, GIR and target executables.

The APK is `dist-android/org.example.myapp-x86_64-debug.apk`. Builds use private
application directories under `.sqgipkg/android/`; `sqgipkg-build.json` records
the artifact and SDK input. `--locked` pins the catalog and descriptor checksums,
which pin every selected archive, target identity and installed file. It rejects
a changed manifest, origin, profile or SDK descriptor. `--no-android-download`
requires cached packages and passes `--offline` to Gradle; a missing cached input
fails clearly. Locks also record content identities for the selected NDK, JDK,
Gradle distribution, Android platform/build-tools, installed backend and host
SQGI/GLib/GI runtime. Native builds additionally record the standard Ubuntu
build tools and their data, and the selected Rust sysroot for custom recipes
when Rust is installed. Identical tool trees can move without changing these
identities; changed bytes or executable permissions require a reviewed
`--write-lock` build. Older locks need this explicit migration once.

The Gradle template verifies SHA-256 checksums for its plugin, Maven metadata
and transitive artifacts in strict mode, including debug and release builds.
An offline build still needs the verified artifacts already cached. These
inputs are not a hermetic operating-system image: custom hooks remain responsible
for declaring and pinning any additional programs/services they use, and icon
decoding uses the host's GdkPixbuf loaders.

`platforms.android.profile` selects a minimum SDK profile: `auto` (default),
`runtime`, `sdk`, `tools` or `complete`. Automatic selection accounts for native
and runtime source recipes; an explicitly insufficient profile fails.
`platforms.android.packages` requests additional package names from the same
immutable catalog. The resolver selects the smallest published profile at or
above that minimum containing their full dependency closure, and locks that
selection. Unknown packages or a closure outside published profiles fail.
Application module catalogs remain selected with each recipe's `android_package`.
Manifest Studio exposes the profile and additional packages in Targets.

`--target android-aab` builds one debug bundle containing all declared Android
ABIs. `--arch x86_64` limits it to one ABI. APK builds still produce one APK per
ABI. The multi-ABI output is `dist-android/<app-id>-multi-debug.aab`; JSON
inspection reports one output with an explicit `architectures` array.
Explicit bytecode packaging fails until a portable producer/consumer bytecode
ABI is supported. Source-runtime overrides use the selected SQGI sources.

Build, install and run on an emulator or phone from the same project directory:

```sh
sqgipkg deploy --platform android --serial emulator-5554
sqgipkg sync --platform android --serial emulator-5554
sqgipkg watch --platform android --serial emulator-5554
sqgipkg run --platform android --serial emulator-5554
sqgipkg logs --platform android --serial emulator-5554 --logs-once
sqgipkg reset --platform android --serial emulator-5554
```

`deploy` builds, installs and starts the app; `install` installs an existing build.
Use the same target/output options as the build, or select an explicit artifact:

```sh
sqgipkg install --platform android --artifact dist-android/my-app-multi-debug.aab
sqgipkg preview --platform android
```

`--serial` aliases `--android-serial`; `ANDROID_SERIAL` is also supported. Without
a selection, exactly one connected device must support the project's API and
ABI requirements. Device-native ABI is preferred. `--arch` restricts the choice;
when installing an existing multi-ABI bundle with `--arch`, use `--artifact` to
retain its original filename. AAB installation queries the device's actual API,
density, locales and features, generates and audits matching splits, and requires
the bundle's signing identity. Installation records device/spec/artifact hashes
under `.sqgipkg/android/devices/`. `install` needs the Android SDK/JDK and cached
bundletool for AABs; it does not require the NDK.

`sync` stages the same scripts and resources as `build`, uploads a complete
snapshot (including deletions), and restarts the Android process. `watch` repeats
that after stable source changes and reloads the manifest. Private app data is
preserved. `reset` removes only source overrides and runs the packaged sources.
Native source/recipe, runtime, namespace and application configuration changes
require `deploy`. A build identity embedded in the APK enforces this boundary;
APKs built before this identity was added need one rebuild before using `sync`.
Release builds reject these commands and ignore source overrides. `logs` streams
the current process's logcat entries; `--logs-once` prints the current buffer.

Desktop `preview` uses host SQGI/GI and the same staged application, with private
data/config/cache directories under `.sqgipkg/preview/<app-id>/`. Native imports
need their desktop libraries/typelibs available on the host. Preview does not
load Android native libraries into the desktop process. Android application
`files` destinations must be under `usr/share/sqgi/app/`; unsupported destinations
fail instead of being silently omitted.

Both reference demo launchers now use installed `sqgipkg` and its shared
emulator. Their application manifests select public Ooblerg packages.

## Bundles and ABI selection

The backend prepares and seals each ABI's native/GI inputs independently, then
combines them into one Gradle project. App sources, GTK Java glue and wrapper
versions must match. A changed input after preparation fails before assembly.
Each runtime lives under `assets/runtime/<abi>/`, with an index pinning the
per-ABI provenance hashes. The Java wrapper loads a tiny NDK-built JNI helper
to identify the actual loaded library ABI before selecting typelibs. This also
selects ARM64 metadata correctly under Android native translation on an x86-64
emulator. App-private runtime paths remain `files/runtime/`; `session.json`
records the selected `abi`.

Every bundle build runs checksum-pinned
[bundletool 1.18.3](https://github.com/google/bundletool/releases/tag/1.18.3),
validates the AAB, generates device-specific APK sets for each ABI and checks
their selected native libraries, both metadata payloads, all app assets,
signatures and ZIP alignment. This follows Android's
[local bundle testing workflow](https://developer.android.com/tools/bundletool).
The representative verification specs use API 35, density 420 and English;
these checks do not claim coverage of every device configuration.

The initial bundletool download is about 33 MB. `BUNDLETOOL_JAR` may point to an
existing copy with the pinned checksum. Offline builds need it already cached.
The shared package lock works across APK and AAB builds because each ABI resolves
and records its own SDK/module/tool inputs.

Verified `.apks` sets, selected APK files and `verification.json` are stored under
`.sqgipkg/android/bundle/splits/`. `sqgipkg-build.json` records the final AAB hash,
per-ABI inputs and split hashes. To install a selected debug split set manually:

```sh
adb -s emulator-5554 install-multiple -r \
  .sqgipkg/android/bundle/splits/x86_64/*.apk
adb -s emulator-5554 shell am start -n org.example.myapp/org.sqgi.android.GtkActivity
```

Debug packages use the local Android debug keystore by default. Debug AABs
are explicitly JAR-signed because the pinned AGP skips signing debuggable
bundles. The artifact report includes the verified public certificate digest.

For a release, supply all four environment variables through your shell or CI
secret store, then select the release variant:

- `SQGI_ANDROID_KEYSTORE`: existing keystore file.
- `SQGI_ANDROID_KEY_ALIAS`: signing key alias.
- `SQGI_ANDROID_STORE_PASSWORD`: keystore password.
- `SQGI_ANDROID_KEY_PASSWORD`: key password.

```sh
sqgipkg build --target android-aab --android-variant release
```

`platforms.android.variant` can persist `debug` or `release`; credentials stay
outside the manifest. Missing/partial signing settings fail before building.
APKs, AABs and generated APK splits must match the selected certificate.
Release apps are non-debuggable and ignore development source snapshots. The
acceptance harness verifies this with an override targeting the release's exact
provenance, installed through a debug build signed by the same temporary key.
Its key is deleted after the test; it is not a distribution key.

The first release build also needs Gradle's pinned lint dependencies cached
before an offline build can succeed. Their artifacts and metadata are included
in strict dependency verification. Local signing tests do not claim
Play upload acceptance.

## Native recipes

The executable example is
[`tools/sqgipkg_tests/android_native_project`](../../../tools/sqgipkg_tests/android_native_project).
It combines a C GObject library, a C++ library with a C boundary, a Vala class
and a Rust `cdylib` with an explicit C ABI. All calls reach Squirrel through GI;
the C++/Rust implementations do not expose their language-specific ABIs.

```json
"native": [
  {
    "name": "base", "dir": "base", "build_system": "meson", "stage": false,
    "gi": {"strategy": "target", "namespace": "SqMobile", "version": "1.0", "library": "sqmobile-1.0"}
  },
  {"name": "cpp", "dir": "cpp", "build_system": "cmake", "depends_on": ["base"]},
  {"name": "vala", "dir": "vala", "build_system": "meson", "depends_on": ["base"]},
  {
    "name": "rust", "dir": "rust", "build_system": "custom", "depends_on": ["base"],
    "build": [{"argv": ["${SQGI}", "build.nut"]}]
  }
]
```

`depends_on` determines build order; unknown names, duplicates and cycles fail.
Every build starts with a clean private dependency SDK. A recipe's installed
headers, `.pc`, VAPI, GIR, typelib and library exports become available to later
recipes without changing the shared package installation. Conflicting exports
fail before copying. `stage: false` keeps a dependency's files out of the initial
APK roots; ELF/GI dependencies still include required runtime files transitively.
Install development files below `/usr`; use unversioned `.so` names and matching
SONAMEs. Meson and CMake installation is automatic. `install: false` Meson
libraries/GIR/typelibs are discovered, but headers, `.pc` and VAPI need install
rules. The final ELF audit enforces target architecture, dependencies and 16 KB
load alignment. Only build-directory RPATHs may be removed; host search paths
are rejected.

Source builds select the Ooblerg `tools` profile. Host tools include Meson,
CMake/Ninja, pkg-config and **g-ir-scanner 1.80.1**; the exercised Ubuntu versions
are Meson 1.3.2 and Vala 0.56.16. The Rust fixture uses the installed Rust/Cargo
1.81 toolchain and requires `x86_64-linux-android` and `aarch64-linux-android`
standard-library targets. These host versions are not all lock-enforced yet.

Portable hooks are `{ "argv": [...], "env": {...} }` objects; shell command
strings are rejected on Android. `${VARIABLE}` substitutions use the declared
build context without shell evaluation. The context supplies NDK `CC`, `CXX`,
`AR`, `NM`, `RANLIB`, `STRIP`, `CFLAGS`, `CXXFLAGS`, `LDFLAGS`, target pkg-config,
`ANDROID_ABI`, `ANDROID_API`, `SQGI_NATIVE_SDK`, `BUILD_DIR`, `SOURCE_DIR`,
`DESTDIR`, `MESON_CROSS_FILE`, `CMAKE_TOOLCHAIN_FILE`, `GI_SCANNER`,
`GI_COMPILER`, `GI_RUNNER` and the host `SQGI` executable. Custom recipes must
honor these target settings. The Rust fixture uses SQGI to invoke Cargo and the
GI adapters; its compiler arguments use Cargo's encoded flag list to preserve
paths containing spaces.
Native `files` rules currently fail explicitly; install development exports
and use top-level application `files` for app assets.

`gi.strategy: auto` and `target` both generate target metadata on Android.
`host` is rejected. The host scanner parses the headers, while compiled scanner
probes and the target `g-ir-compiler` run against Bionic under a pinned QEMU/user
inspection environment. GIR inputs must come from the private target SDK or
the recipe's source/build directories. Missing target GIR fails instead of
falling back to `/usr/share/gir-1.0`. The initial runner downloads a checksum-pinned
API-31 image and Ubuntu QEMU package for the requested ABI; it caches a verified
extracted environment. The application lock records the inspection runtime identity.
The initial image downloads are about 1.4–1.5 GB each. Cached offline builds do
not download them again.

Source-build locks created by the reference Python backend contain its older
inspection recipe identity. Migrating those locks requires an intentional
`--write-lock` run; `--locked` detects the difference. The SQGI-provisioned
userspace files match the reference byte for byte. Core SDK/library pins and
package catalog identities are unchanged by this implementation migration.

Use `platforms.android.native` for partial overrides of existing named recipes:

```json
"native": [{ "name": "helper", "options": { "enable_mobile": true } }]
```

Within the Android platform object, this merges `options` and `gi` by key;
other supplied fields replace their shared values. Paths resolve relative to
the manifest. Unknown/duplicate recipe names and competing source aliases fail.
The shared desktop recipe is preserved. Resolved overrides participate in source
provenance, dependency ordering and the development rebuild contract.

`--android-runner qemu` is the desktop default (`auto` selects it). To use an
attached device for GI generation, select `--android-runner adb
--android-serial SERIAL`; the backend uses the Android SDK's `platform-tools/adb`.
The device must have the requested native ABI: APK native translation does not
provide a shell runner for GI probes. Its fingerprint/ABI/native-bridge properties
are recorded in the input lock. Device execution has been tested on the x86-64 emulator. The generated
typelib was subsequently loaded and called successfully under QEMU/Bionic.

## Prebuilt application modules

Ooblerg application-module catalogs are separate from the immutable core SDK:

```text
android/modules/<sdk-id>/<module-set>/<target>/v1/index.json
```

Select a published recipe with `android_package`, retaining `depends_on` for
downstream source recipes. No source directory is required for the selected
prebuilt recipe:

```json
"native": [
  {"name": "base", "android_package": "sqmobile-base", "stage": false},
  {"name": "cpp", "dir": "cpp", "build_system": "cmake", "depends_on": ["base"]}
],
"platforms": {
  "android": {
    "architectures": ["x86_64", "arm64-v8a"],
    "module_set": "native-fixture-r5"
  }
}
```

The local acceptance catalog uses the package names `sqmobile-base`,
`sqmobile-cpp`, `sqmobile-vala` and `sqmobile-rust`; none are public yet. Package
dependencies install transitively. Each package includes its runtime and
development exports, with file hashes, source/recipe provenance, minimum API,
GI graph and exact SDK compatibility. Wrong ABI, SDK generation, source
baseline, NDK, missing dependencies or a newer required API fail before use.
The lock pins the module catalog and therefore each selected archive.

When every native recipe is prebuilt, `sqgipkg` selects the core `sdk` profile
and does not rebuild application modules or need a GI scanner, Meson/CMake, QEMU
or an inspection image. The normal JDK/Android SDK/NDK packaging tools remain
required; the NDK compiler builds the small JNI/entry glue used by the wrapper.
`--locked --no-android-download` replays cached module packages with the same
offline behavior as core SDK packages.

## Native application entry

An application can enter an exported C function in an Android shared library.
Keep a desktop executable selector and add an Android selector to the same
manifest:

```json
{
  "entry": {
    "type": "native", "project": "application", "executable": "my-app",
    "android": {
      "project": "application", "library": "libmy-app.so",
      "symbol": "sqgi_android_main", "shutdown": "sqgi_android_shutdown"
    }
  },
  "native": [{"name": "application", "dir": "native", "build_system": "meson"}]
}
```

The recipe must install the named unversioned library. The backend checks its
ownership, exported function symbols, target ELF and entry-interface identity.
`shutdown` is optional. `script`, `scripts` and resources retain their normal
staging rules; a script is optional for a native entry. The runnable
[`android_entry_project`](../../../tools/sqgipkg_tests/android_entry_project) builds
a desktop executable or Android library from the same C application, embeds
SQGI, calls a packaged script and renders GTK controls.

Include `sqgi_android_entry.h` and export these C signatures (use `extern "C"`
in C++):

```c
int sqgi_android_main(const SqgiAndroidEntryContext *context);
void sqgi_android_shutdown(const SqgiAndroidEntryContext *context, int exit_code);
```

The version-1 context supplies the application ID, source/script path, private
data/config/cache paths and GTK launch arguments. Check `abi_version` and
`struct_size`; all pointers are borrowed. The entry runs once per process on
GTK's thread after GDK Android initialization and must create/run its
`GtkApplication`. Activity recreation preserves that thread, the VM and native
state. The application owns its objects and VM; after it quits and returns, the
optional shutdown hook runs on the same thread and the GTK glue exits the
process. Android force-stop/process death does not guarantee a shutdown hook.
Libraries stay loaded through finalization so registered GTypes/callbacks remain
valid. Source updates still restart the process.

The header is installed with SQGI's public C headers and is supplied to Android
native recipes by the installed backend (`SQGI_ANDROID_ENTRY_INCLUDE` is also
available to custom hooks). Its checksum is recorded in native source provenance.
Prebuilt entry modules must carry the matching interface identity; republish them
after an interface change. The wrapper links the pinned SDK's GTK glue archive;
GNOME libraries and the packaged SQGI runtime keep their existing source pins.
Native-entry desktop preview requires a desktop build of the executable.

## Manifest Studio and shared output selection

Manifest Studio's Targets page selects Linux, Windows and Android outputs from
one manifest. Android offers per-ABI APKs or one App Bundle, plus minimum API,
application versions, SDK/repository/module release, namespaces and build variant.
Review resolves and builds through the installed CLI; its output list recognizes
Android formats and ABIs. Native-library forms offer an independent Android
Ooblerg replacement. The package picker reads the current unsaved manifest's
repository and module release without installing packages.

The setup dialog's Android GTK template configures an existing `src/` project
and initially selects both Android ABIs. It preserves `entry.source_root` when
you choose a nested entry script. For a new starter application, use the CLI
`init android-gtk4` command above and open its generated manifest in Studio.
Save As rebases the entry/source root and local Android SDK/inspection paths
together, leaving package release identifiers and native-entry symbols literal.

For example, include Linux and Android while retaining Windows settings:

```json
{
  "target": "all",
  "platforms": {
    "linux": {"enabled": true, "architectures": ["x86_64", "aarch64"]},
    "windows": {"enabled": false, "format": "installer"},
    "android": {"enabled": true, "architectures": ["arm64-v8a", "x86_64"], "format": "aab"}
  }
}
```

These `enabled` switches apply to `target: "all"`; explicit platform commands
still work. `sqgipkg deploy --platform android --serial SERIAL` selects Android
from that saved matrix, builds it and runs it. Conflicting explicit `--platform`
and `--target` flags remain errors. To install an artifact already produced by
Studio, use `sqgipkg install --platform android --artifact /path/to/app.aab`.
Android-specific native-entry and advanced fields remain available in the
structured editor and survive common target/settings edits.
