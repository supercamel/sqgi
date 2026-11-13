# Android application packaging

Use `sqgipkg` to build Android apps on your desktop, run them on an emulator or
phone, and update them as you work. It supports ARM64 and x86_64, with Android
12/API 31 as the minimum, and uses Ubuntu 24.04-pinned libraries from Ooblerg.
You can package Squirrel scripts, native modules, or applications with a native
entry point as APKs or App Bundles.

For a complete app, try [Alpine](https://github.com/supercamel/sqgi/tree/master/demo/gworldscene-android),
a GTK 4/GWorldScene demo with Mont Blanc terrain, live satellite imagery and
touch controls. Its `run.sh` builds and deploys the app to an emulator or phone.

## First app on Ubuntu 24.04

Install a current SQGI build, including its packaging tools, using the
[normal installation instructions](../index.md#build-from-source-on-linux).
An installation under `~/.local` works when `~/.local/bin` is on PATH.

Linux x86_64 and ARM64 hosts can package apps using prebuilt libraries. Install
the host prerequisites, then prepare the packaging tools:

```sh
sudo apt install openjdk-21-jdk curl unzip binutils libglib2.0-bin libxml2-utils adb
sqgipkg setup --platform android --accept-licenses
sqgipkg setup --platform android --check

mkdir MyApp
cd MyApp
sqgipkg init android-gtk4 --app-id org.example.myapp --name "My App"
sqgipkg build --platform android --arch arm64-v8a
```

`--accept-licenses` authorizes acceptance of Google's
[Android SDK terms](https://developer.android.com/studio/terms) for the requested
tools. Setup downloads the pinned command-line tools and installs platform 35,
build-tools 35.0.0 and platform-tools. ARM64 setup also downloads
checksum-pinned native AAPT2 and zipalign from Ooblerg; it uses Ubuntu's `adb`
for deployment. Gradle 8.9 is downloaded and verified automatically. Setup uses
an existing compatible toolchain when one is available. JDK installation stays
with the host package manager. Packaging scripts and prebuilt native libraries
does not require the NDK.

On an x86_64 host, the optional `--emulator` setup flag adds the hash-pinned emulator 37.2.13 and
Android 16/API 36 Google APIs image. Its initial download is about 2.1 GiB;
first boot can take a few minutes. Linux hardware virtualization and access
to `/dev/kvm` are required. The AVD is named `SQGI_API_36`, retains its private
application data between starts, and uses port 5564 by default:

```sh
sqgipkg setup --platform android --emulator --accept-licenses
sqgipkg emulator --headless
sqgipkg deploy --platform android --arch x86_64 --serial emulator-5564
sqgipkg watch --platform android --arch x86_64 --serial emulator-5564
sqgipkg emulator --stop
sqgipkg emulator --port 5566
```

Only one instance of this shared AVD runs at a time. A port belonging to another
AVD is rejected without stopping or changing it. Logs are in
`~/.local/share/sqgipkg/android/logs/`. Emulator deployment automatically selects
the bundled ANGLE driver for the application when available, preserving other
applications' settings. Physical-device driver settings are unchanged.

Graphics acceleration is selected automatically. For 3D apps, use
`sqgipkg emulator --gpu host` to select your computer's GPU. On machines without
a working graphics driver, `--gpu swangle` provides software rendering, which
can be much slower for terrain and large scenes. Stop the emulator before
changing graphics mode; both modes support `--headless`.

For a phone, omit `--emulator`, enable USB debugging and use the device serial
from `adb devices` with `--arch arm64-v8a`. A device or emulator is not needed
just to build an APK:

```sh
sqgipkg build --platform android --arch arm64-v8a --write-lock
sqgipkg build --target android-aab --write-lock
```

The starter creates `sqgipkg.json`, `src/main.nut` and `src/message.txt`, and
selects both ABIs for an App Bundle. APKs go under `dist-android/` when one ABI
is selected. Apps include their SQGI runtime, native libraries and GI metadata.
Use `sqgipkg preview --platform android` to run the app with your desktop's GTK
libraries before deploying it.

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
selects native source builds on Linux x86_64: setup installs NDK r28c and checks
the Ubuntu 24.04 tools used to compile application-native modules. Setup does
not install those distribution packages. `--no-android-download`
allows reuse of prepared/cached tools and fails if an SDK component is missing.

For C/GObject and Vala modules on Ubuntu 24.04, install:

```sh
sudo apt install build-essential cmake ninja-build meson pkg-config valac \
  gobject-introspection libgirepository1.0-dev python3 e2fsprogs
sqgipkg setup --platform android --native-tools --accept-licenses
```

Rust modules additionally need the Rust toolchain selected by their recipe.

`--android-sdk-root` selects Google's Android SDK. SQGI downloads GNOME
libraries and prebuilt native modules from Ooblerg automatically. To use a local
SQGI dependency SDK, pass `--android-sdk /path/to/sdk`; the directory must contain
its `sqgi-android-sdk.json` descriptor, or ABI subdirectories containing one.

## Toolchain reference

Use Linux x86_64 or ARM64, `readelf`, a full JDK 17 or 21, and Android SDK
platform/build-tools 35. Ubuntu 24.04 is the tested host baseline. On ARM64,
setup supplies native resource and alignment tools compatible with API 35.
`SQGI_ANDROID_AAPT2` and `SQGI_ANDROID_ZIPALIGN` can select custom tool executables;
their content identities are included in build locks.

Compiling C, Vala or Rust modules, rebuilding the SQGI runtime, and using an older
SDK without matching prebuilt application bridges requires Linux x86_64 and
NDK `28.2.13676358`. ARM64 hosts can consume prebuilt native modules from the
same Ooblerg catalog, including GStreamer and GWorldScene.

Setup remembers the selected paths; `JAVA_HOME` and `ANDROID_SDK_ROOT` can
override them. `--android-ndk`
overrides the NDK directory; otherwise `sqgipkg` uses `ANDROID_NDK_HOME`,
the saved selection or the Android SDK's `ndk` directory.
Gradle 8.9 is downloaded and checksum-verified, or can be selected
through `GRADLE_HOME` when already installed.

Building native modules from source requires Python 3.12 for GI scanning and
Meson. Native metadata checks use `xmllint` from Ubuntu's `libxml2-utils`;
`SQGI_ANDROID_XMLLINT` can select an alternate installation.

## Application manifest

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

`main.nut` is the default entry. The shared script selection and file staging rules
apply. Resources go under `resources/` in the staged application; use an explicit
`files` destination under `usr/share/sqgi/app/` for assets that the script opens
directly from its working directory.

## Application permissions and icon

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

## Building and locking dependencies

From the application directory:

```sh
sqgipkg explain --platform android --arch x86_64 --json
sqgipkg build --platform android --arch x86_64 --write-lock
sqgipkg build --platform android --arch x86_64 --locked --no-android-download
```

The default SDK release is `noble-android-r7` from `https://ooblerg.xyz`.
Its package catalogs are available for
[ARM64](https://ooblerg.xyz/android/noble-android-r7/aarch64-linux-android/v3/index.json)
and [x86_64](https://ooblerg.xyz/android/noble-android-r7/x86_64-linux-android/v3/index.json),
alongside a [corresponding-source index](https://ooblerg.xyz/android/noble-android-r7/sources/index.json).
For an application using an older SDK release, update `platforms.android.sdk`
and rebuild with `--write-lock`. Existing locks are not silently upgraded.
A `file://` repository origin is supported for locally supplied catalogs.

`platforms.android.repository` and `download` persist the origin/download policy;
`sdk` selects the immutable release ID. `--refresh-android-packages` refreshes an
unlocked catalog. `--android-sdk /path/to/export` selects local files instead.
`check` and `explain` do not download packages. Apps using only SDK runtime
libraries select `sqgi-android-runtime`, which excludes headers, GIR and target
executables. Prebuilt application libraries and native recipes select development
files as needed.

The APK is `dist-android/org.example.myapp-x86_64-debug.apk`. Builds use private
application directories under `.sqgipkg/android/`; `sqgipkg-build.json` records
the artifact and SDK input. `--locked` pins the catalog and descriptor checksums,
which pin every selected archive, target identity and installed file. It rejects
a changed manifest, origin, profile or SDK descriptor. `--no-android-download`
requires cached packages and passes `--offline` to Gradle; a missing cached input
fails clearly. Locks also record content identities for the NDK when used, JDK,
Gradle distribution, Android platform/build-tools, installed backend and host
SQGI/GLib/GI runtime. Native builds additionally record the standard Ubuntu
build tools and their data, and the selected Rust sysroot for custom recipes
when Rust is installed. Identical tool trees can move without changing these
identities; changed bytes or executable permissions require a reviewed
`--write-lock` build.

The Gradle template verifies SHA-256 checksums for its plugin, Maven metadata
and transitive artifacts in strict mode, including debug and release builds.
An offline build needs these artifacts cached. Pin any additional programs or
services used by custom hooks. Icon decoding uses the host's GdkPixbuf loaders.

`platforms.android.profile` selects a minimum SDK profile: `auto` (default),
`runtime`, `sdk`, `tools` or `complete`. Automatic selection accounts for native
and runtime source recipes; an explicitly insufficient profile fails.
`platforms.android.packages` requests additional package names from the same
immutable catalog, including prebuilt application libraries. The resolver selects
the smallest published SDK profile that supplies their base dependencies, then
installs the application libraries alongside it. Unknown packages or missing
dependencies fail before packaging. Named native recipes can also select a
prebuilt library with `android_package`.
Manifest Studio exposes the profile and additional packages in Targets.

`--target android-aab` builds one debug bundle containing all declared Android
ABIs. `--arch x86_64` limits it to one ABI. APK builds still produce one APK per
ABI. The multi-ABI output is `dist-android/<app-id>-multi-debug.aab`; JSON
inspection reports one output with an explicit `architectures` array.
Android packages contain Squirrel source files; set `compile_scripts` to `false`.

## Deploying and updating an app

Build, install and run on an emulator or phone from the same project directory:

```sh
sqgipkg deploy --platform android --serial emulator-5564
sqgipkg sync --platform android --serial emulator-5564
sqgipkg watch --platform android --serial emulator-5564
sqgipkg run --platform android --serial emulator-5564
sqgipkg logs --platform android --serial emulator-5564 --logs-once
sqgipkg reset --platform android --serial emulator-5564
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
require `deploy`. Source updates are available in debug builds only. `logs` streams
the current process's logcat entries; `--logs-once` prints the current buffer.

Desktop `preview` uses host SQGI/GI and the same staged application, with private
data/config/cache directories under `.sqgipkg/preview/<app-id>/`. Native imports
need their desktop libraries/typelibs available on the host. Android application
`files` destinations must be under `usr/share/sqgi/app/`.

## Android system information

Read Android version and ABI information through `import("system")`:

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
for development snapshots. See the [system module API](../api/README.md#importsystem).

## Bundles and ABI selection

An App Bundle contains the selected ABIs and their GI metadata. At startup,
the application loads metadata matching its native libraries, including when
Android translates an ARM64 application on an x86-64 emulator. Sources and
shared application resources must be the same for both ABIs.

Every bundle build runs checksum-pinned
[bundletool 1.18.3](https://github.com/google/bundletool/releases/tag/1.18.3),
validates the AAB, generates device-specific APK sets for each ABI and checks
their selected native libraries, both metadata payloads, all app assets,
signatures and ZIP alignment. This follows Android's
[local bundle testing workflow](https://developer.android.com/tools/bundletool).
Build-time checks use representative API-35 device specifications. Test the
result on your supported devices, densities and locales before distribution.

The initial bundletool download is about 33 MB. `BUNDLETOOL_JAR` may point to an
existing copy with the pinned checksum. Offline builds need it already cached.
The shared package lock works across APK and AAB builds because each ABI resolves
and records its own SDK/module/tool inputs.

Verified `.apks` sets, selected APK files and `verification.json` are stored under
`.sqgipkg/android/bundle/splits/`. `sqgipkg-build.json` records the final AAB hash,
per-ABI inputs and split hashes. To install a selected debug split set manually:

```sh
adb -s emulator-5564 install-multiple -r \
  .sqgipkg/android/bundle/splits/x86_64/*.apk
adb -s emulator-5564 shell am start -n org.example.myapp/org.sqgi.android.GtkActivity
```

Debug packages use the local Android debug keystore by default. The artifact
report includes the verified public certificate digest.

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
Release apps are non-debuggable and ignore development source snapshots.

The first release build also needs Gradle's pinned lint dependencies cached
before an offline build can succeed. Their artifacts and metadata are included
in strict dependency verification. Store submission is a separate step from
building and signing the application.

## Native recipes

The executable example is
[`tools/sqgipkg_tests/android_native_project`](https://github.com/supercamel/sqgi/tree/master/tools/sqgipkg_tests/android_native_project).
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
CMake/Ninja, pkg-config, **g-ir-scanner 1.80.1**, Meson 1.3.2 and Vala 0.56.16
from Ubuntu 24.04. Rust recipes also need their selected Rust/Cargo version and
the `x86_64-linux-android` and `aarch64-linux-android` standard-library targets.

Portable hooks are `{ "argv": [...], "env": {...} }` objects; shell command
strings are rejected on Android. `${VARIABLE}` substitutions use the declared
build context without shell evaluation. The context supplies NDK `CC`, `CXX`,
`AR`, `NM`, `RANLIB`, `STRIP`, `CFLAGS`, `CXXFLAGS`, `LDFLAGS`, target pkg-config,
`ANDROID_ABI`, `ANDROID_API`, `SQGI_NATIVE_SDK`, `BUILD_DIR`, `SOURCE_DIR`,
`DESTDIR`, `MESON_CROSS_FILE`, `CMAKE_TOOLCHAIN_FILE`, `GI_SCANNER`,
`GI_COMPILER`, `GI_RUNNER` and the host `SQGI` executable. Custom recipes must
honor these target settings. For Rust, pass target compiler arguments through
Cargo's encoded flag list so paths containing spaces remain intact.
Android native recipes use install rules for development exports and top-level
application `files` for app assets. Recipe-level `files` rules are unsupported.

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

Use `platforms.android.native` for partial overrides of existing named recipes:

```json
"native": [{ "name": "helper", "options": { "enable_mobile": true } }]
```

Within the Android platform object, this merges `options` and `gi` by key;
other supplied fields replace their shared values. Paths resolve relative to
the manifest. Unknown names in partial overrides, duplicate names, and competing
source aliases fail.
The shared desktop recipe is preserved. Resolved overrides participate in source
provenance, dependency ordering and the development rebuild contract.

To add a module used only on Android, put its complete recipe in the same
`platforms.android.native` array. Give it a unique `name` and a source (`dir`,
`git` or `repo`) or an `android_package`. Source recipes default to Meson.
These modules can depend on shared recipes through `depends_on`; they are
excluded from Linux and Windows builds.

`--android-runner qemu` is the desktop default (`auto` selects it). To use an
attached device for GI generation, select `--android-runner adb
--android-serial SERIAL`; `sqgipkg` uses the Android SDK's `platform-tools/adb`.
The device must have the requested native ABI: APK native translation does not
provide a shell runner for GI probes. Its fingerprint/ABI/native-bridge properties
are recorded in the input lock.

## Prebuilt application modules

Native packages can install Java sources under `usr/share/sqgi-android/java`
and a descriptor under `usr/share/sqgi-android/services/*.json`. For example:

```json
{
  "schema": 1,
  "services": [{"class": "org.example.Input$Service", "process": ""}],
  "initializers": ["org.example.Input"]
}
```

Every component must have inventoried Java source. Services are always private
(`exported=false`). An explicit empty `process` runs a service in the main
application process; named private processes must use `:sqgi_…`. Omitting the
process is an error. Initializer classes expose
`public static void initialize(android.app.Application application)`. They run
on the Android main thread before the first Activity, in sorted class-name order,
and are skipped in SQGI worker processes. Initialization failures stop startup.
This supports package-owned Android lifecycle hooks and services used by native
workers without adding library-specific code to the host Activity.

The Android catalog contains the SDK, GStreamer, GSceneGraph, GWorldScene,
GSerial, GJoystick and their dependencies. List the available packages with:

```sh
sqgipkg packages --package-target aarch64-linux-android
```

Add prebuilt libraries to `platforms.android.packages`. Packages from different
library families can be used together:

```json
{
  "platforms": {
    "android": {
      "architectures": ["x86_64", "arm64-v8a"],
      "sdk": "noble-android-r7",
      "packages": ["extras-gworldscene", "media-gst-plugins-bad"]
    }
  }
}
```

Dependencies install automatically. The build includes the selected libraries,
GI typelibs and Android callback classes. One catalog checksum pins the SDK and
native packages together. ABI, SDK generation, Ubuntu baseline, NDK, minimum API,
file ownership and GI dependencies are checked before installation.

For a shared native recipe, use `android_package` alongside its Linux and Windows
package selectors. Source recipes can depend on these named recipes through
`depends_on`:

```json
{
  "native": [
    {"name": "gscenegraph", "android_package": "extras-gscenegraph"},
    {"name": "viewer", "dir": "native/viewer", "build_system": "meson",
     "depends_on": ["gscenegraph"]}
  ]
}
```

`--locked --no-android-download` replays cached SDK and library packages offline.
Older manifests with `module_set` and their existing catalog locks remain
supported; new projects select packages from the combined catalog.
To migrate an older app, remove `module_set`, select `noble-android-r7`, and
rebuild with `--write-lock`.

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

The recipe must install the named unversioned library. `sqgipkg` checks its
ownership, exported function symbols, target ELF and entry-interface identity.
`shutdown` is optional. `script`, `scripts` and resources retain their normal
staging rules; a script is optional for a native entry. The runnable
[`android_entry_project`](https://github.com/supercamel/sqgi/tree/master/tools/sqgipkg_tests/android_entry_project) builds
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
native recipes by `sqgipkg` (`SQGI_ANDROID_ENTRY_INCLUDE` is also
available to custom hooks). Its checksum is recorded in native source provenance.
Prebuilt entry modules must carry the matching interface identity; republish them
after an interface change. The wrapper links the pinned SDK's GTK glue archive;
GNOME libraries and the packaged SQGI runtime keep their existing source pins.
Native-entry desktop preview requires a desktop build of the executable.

## GStreamer and the phone camera

Add the GStreamer package and camera permission to the Android settings:

```json
{
  "platforms": {
    "android": {
      "sdk": "noble-android-r7",
      "packages": ["media-gst-plugins-bad"],
      "permissions": ["android.permission.CAMERA"]
    }
  }
}
```

The packages use Ubuntu 24.04's GStreamer 1.24.2 sources and provide ARM64 and
x86_64 builds. `media-gstreamer` supplies the core; `media-gst-plugins-base` adds
appsink, video conversion, test sources and other base plugins;
`media-gst-plugins-bad` adds Android camera/media support and depends on both.
The package names follow GStreamer's upstream plugin collections.

For audio playback, select `media-gst-plugins-good` and
`media-gst-plugins-bad`. They provide WAV playback, `autoaudiosink` and Android's
`openslessink`. `media-gst-plugins-good` also supplies VP8/WebM support;
`media-gst-libav` adds software decoders, including H.264. Add `media-librsvg`
when the app needs SVG image loading.

`sqgipkg` includes the selected plugin libraries, GI typelibs and Android callback
classes in the app. Camera access also needs a runtime permission request.
The [Pocket Camera demo](https://github.com/supercamel/sqgi/tree/master/demo/gstreamer-camera-android) shows the
complete flow from `ahcsrc` through `appsink` to a GTK preview.

More runnable apps are listed in the [Android demos](https://github.com/supercamel/sqgi/tree/master/demo#android-apps),
including a widget gallery, native phone sensors and an asynchronous IP scanner.

## Selecting SQGI sources

Android normally uses the SQGI library supplied by the selected SDK. A shared
`"runtime": {"source": "/path/to/sqgi"}` or `runtime.sqgi` revision selects a
source build. This requires CMake and Ninja and uses the NDK and the selected
SDK's GNOME development files.

An omitted `platforms.android.runtime` follows this shared selection. Set it to
`"package"` to use the Android SDK's SQGI while building SQGI from source for
desktop outputs, or `"source"` to require a shared source selector. Android
source builds disable JIT and typed kernels by default while preserving desktop defaults.

To enable the experimental LLVM compiler for a source runtime, set
`platforms.android.compiler` to `"llvm"`. The `noble-android-r7` catalog provides
`compiler-llvm18` for ARM64 and x86_64. SQGI builds against that
package's Ubuntu 24.04 LLVM 18.1.3 headers and library and bundles the library in
the APK. Typed kernels are enabled; `runtime.jit` controls the bytecode JIT and
defaults to `true`. Setting `runtime.jit` to `false` keeps typed kernels available
with the Squirrel interpreter. The compiler package and runtime build options
are recorded in the build lock. The default `"none"` compiler setting disables
both features and avoids the LLVM dependency.
An explicitly authored `runtime.jit: true` requires the `"llvm"` compiler setting.

The replacement must retain the SDK's public SQGI/Squirrel C function exports,
provide `libsqgi.so` with the correct ABI/SONAME and 16 KB alignment, and install
only SQGI's library, headers and pkg-config file. Its complete source inventory
is recorded in the lock and native-module provenance. Locked builds reject
source changes, and source updates require an APK rebuild if the runtime changes.
Test a custom runtime with your application's native modules: matching exported
function names alone does not guarantee ABI compatibility.

Manifest Studio exposes the shared selector in Runtime/native code and the
Android override in Targets. Resolve plan reports the selected mode and source
without fetching or compiling it.

## Manifest Studio and shared output selection

Manifest Studio's Targets page selects Linux, Windows and Android outputs from
one manifest. Android offers per-ABI APKs or one App Bundle, plus minimum API,
application versions, SDK release, repository, namespaces and build variant.
Review resolves and builds through the installed CLI; its output list recognizes
Android formats and ABIs. Native-library forms offer an independent Android
Ooblerg replacement. The package picker reads the current unsaved manifest's
repository and SDK release without installing packages.

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

## Migrating a sqgi.json manifest

If your application uses `sqgi.json`, convert it in the project directory:

```sh
sqgipkg migrate
sqgipkg check --platform android
```

Migration creates `sqgipkg.json`, preserving application identity, versions, GI
namespaces, entry location and source/assets. It leaves `sqgi.json` and source
files untouched. Unknown fields, symlinks, escaping paths or an existing
destination are rejected. Use `--from-sqgi path/to/sqgi.json` for another input,
or `--manifest converted.json` for an alternate output beside it.

The generated `entry.source_root` preserves nested script paths and imports on
Linux, Windows and Android. Source directories use file rules that include later
assets. Projects with `source_dir: "."` get an explicit file inventory to exclude
new manifests and build outputs; add subsequent assets to `files` and
`windows.files` yourself.
