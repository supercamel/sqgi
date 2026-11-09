# Android integration with sqgipkg and Ooblerg

Implementation plan, 9 November 2026. All six milestones and the authorised
public-server deployment are complete; see the [final acceptance record](android-progress.md#completion-9-november-2026).

Scope additions authorised during implementation: update the built-in `system`
module to describe Android correctly, and use SSH to `ooblerg.xyz:9022` to add
server-side Android package builds and public publication alongside the existing
Windows/Linux updater. Preserve existing server changes and immutable releases;
validate staged Android outputs before promotion. This supersedes the original
local-publication-only acceptance boundary.

Make Android a supported `sqgipkg` target using the working SqgiAndroid runtime.
An application should have one `sqgipkg.json`, share its Squirrel sources and
native recipes across desktop and Android, and obtain pinned Android libraries
from Ooblerg. Application developers should build their own native code without
rebuilding GLib, GI, GTK, or SQGI on every machine.

Prebuilt Android packages belong in Ooblerg. They must be separate Android/Bionic
builds of the Ubuntu 24.04 source baseline, with an explicit ABI, Android API
floor, NDK revision, patch set, and SDK release identity. Ubuntu and Android
share source/API versions; they do not share binary libraries.

The commands, manifest additions, package names, and interfaces below describe
the full integration scope. See [current usage](../../../docs/packaging/android.md) and the
[implementation checkpoint](android-progress.md) for implemented paths and
remaining work; this design is not a claim that every interface is available.

## Existing foundations

| Component | Working implementation | Integration gap |
| --- | --- | --- |
| SQGI | Embeddable Squirrel/GI runtime and schema-v2 `sqgipkg` | Android runtime changes currently live as three SqgiAndroid patches |
| sqgipkg | Linux/Windows targets, Meson/CMake native recipes, private native SDK composition, package locks, structured diagnostics | Target selection and many recipe paths assume Linux or Windows |
| SqgiAndroid | ARM64/x86-64 GTK APKs/AABs, pinned dependency builds, GI runners, ELF audits, desktop preview, deployment and source updates | Separate `sqgi.json`; application packaging reads a repository-local SDK; no application-native recipe integration |
| Ooblerg producer | Ubuntu-pinned MinGW packages, archives, index generation, static repository serving | Local recipes and several metadata fields assume MinGW/x86-64 |
| sqgipkg Ooblerg consumer | Verified downloads, private installation, locking, Windows and Linux target catalogs | No Android target, compatibility descriptor, or Android runtime selection |

Relevant implementation locations are `tools/sqgipkg_lib/{schema,recipes,
native_sdk,provenance,protocol}` and `tools/sqgipkg_lib/windows/ooblerg.py` in
SQGI; `tools/{sdk,package,build_state,qemu_runtime}.py`, `tools/gi-*`, `native/`,
and `android/` in SqgiAndroid; and `tools/ooblerg.nut`, `manifest/packages.json`,
and `server/src/repo/builder.nut` in Ooblerg. The transport helper's Windows
directory name is historical: it already handles Linux catalogs too.

The starting runtime is GLib 2.80.0, GI 1.80.1, GTK 4.14.5 with the GTK 4.18
Android backend backported, NDK r28c (`28.2.13676358`), Android API 31 minimum,
and `arm64-v8a`/`x86_64`. Preserve exact Ubuntu source revisions from
`SqgiAndroid/sdk.lock.json`, not just upstream version numbers. Current Android
packaging uses Gradle 8.9, AGP 8.7.1 and compile/target SDK 35. Record these as
the initial tested packaging profile; future target-SDK updates are explicit
profile changes and do not silently upgrade the GNOME libraries.

## Ownership and architecture

| Repository | Responsibility after integration |
| --- | --- |
| SQGI | Runtime Android support; public `sqgipkg` CLI, manifest, recipes, development commands and installed Android packaging backend |
| SqgiAndroid | Maintainer SDK source builds, Ubuntu locks, dependency patches, reference applications and Android regression harnesses |
| Ooblerg | Android package export, target catalogs, immutable SDK releases, checksums, dependency metadata and repository delivery |

Move reusable application assembly and Android wrapper code into an installed
SQGI backend at `tools/sqgipkg_lib/android/`. Following the implementation
language review, implement our Android package consumer, SDK/native build
orchestration, audits, signing and device workflows in Squirrel using SQGI,
GLib and GIO. The initial Python implementation is a migration reference,
not the intended installed architecture. Keep the versioned JSON request/result
contract and its existing acceptance checks while moving components. External
NDK/Meson/CMake/Gradle/bundletool tools remain appropriate; upstream GI scanning
and Python acceptance harnesses do not require our backend to use Python.

`sqgipkg` owns manifest resolution, recipe ordering and package selection. The
Android modules own Android-specific assembly, audits and device operations.
Neither should reimplement the other's decisions. Install the helper, Java/C
wrapper sources, Gradle templates and required data with SQGI so ordinary app
builds do not require a sibling SqgiAndroid checkout.

The migration must also cover the shared Ooblerg transport and private SDK
composition used by Android, preserving their locks, ownership and validation
contracts. Unrelated Linux/Windows Python paths can remain while Android moves;
do not expand this into an unrequested rewrite of every existing desktop tool.
Retire the Python Android backend after the SQGI implementation passes the
installed, offline, relocation, native-module and device acceptance suite.

Merge the three SQGI runtime patches into SQGI with appropriate Android guards:
the runtime-only build/install path and SONAME handling, JSON number fallback,
and opcode enum fix. Preserve desktop defaults. Make the Android runtime's
JIT/typed-kernel capabilities explicit; both remain disabled in this SDK.
Retire patches only after equivalent integrated runtime builds pass.

Keep `sqgi-android` as a compatibility entry point during migration. It should
delegate application work to the installed backend while retaining maintainer
SDK commands. Keep the current demo runnable throughout the transition.

## Application manifest and commands

Extend schema version 2 with `platforms.android`, rather than introduce a third
application manifest. Reuse `app_id`, `name`, entry/scripts/resources,
`features`, `native`, and the existing runtime source-selection fields.

Illustrative proposed manifest:

```json
{
  "schema_version": 2,
  "name": "GTK Gallery",
  "app_id": "org.sqgi.android.widgets",
  "script": "src/main.nut",
  "script_dirs": ["src"],
  "resources": ["src/style.css"],
  "features": ["gtk4"],
  "native": [{
    "name": "gallery-helper",
    "dir": "native",
    "build_system": "meson",
    "gi": {
      "strategy": "auto",
      "namespace": "GalleryHelper",
      "version": "1.0",
      "library": "gallery-helper-1.0"
    }
  }],
  "platforms": {
    "linux": {
      "architectures": ["x86_64", "aarch64"],
      "baseline": "ubuntu-24.04"
    },
    "windows": {
      "architectures": ["x86_64"],
      "format": "installer"
    },
    "android": {
      "architectures": ["arm64-v8a", "x86_64"],
      "format": "apk",
      "min_sdk": 31,
      "version_code": 1,
      "version_name": "0.1.0",
      "sdk": "noble-android-r1",
      "runtime": "package"
    }
  }
}
```

`noble-android-r1` is a proposed release name; the resolver must map it to an
immutable, hashed SDK descriptor. The example also adds `gi.strategy: auto`.
Its target-specific behavior is specified below. Script and resource paths
must resolve to one staged payload preserving the entry's relative imports and
asset lookup; sharing a manifest must not change the working directory by target.

Proposed user commands:

```sh
sqgipkg check --platform android
sqgipkg explain --platform android --json
sqgipkg build --platform android --arch x86_64
sqgipkg build --platform android --arch arm64-v8a --write-lock
sqgipkg build --target android-aab --locked
sqgipkg deploy --platform android --serial emulator-5554
sqgipkg run --platform android --serial emulator-5554
sqgipkg logs --platform android --serial emulator-5554
sqgipkg sync --platform android --serial emulator-5554
sqgipkg watch --platform android --serial emulator-5554
sqgipkg reset --platform android --serial emulator-5554
```

Implementation rules:

- Separate platform selection, architecture selection and artifact format in the
  normalized options. Today `--arch` is rewritten to a Linux-only option. Accept
  Android ABI names, with documented `aarch64` to `arm64-v8a` normalization.
- Add `android-apk` and `android-aab` targets. Default APK builds produce one APK
  per requested ABI; AAB builds combine the selected ABIs in one bundle.
- Preserve existing defaults and `--target all` behavior for manifests without
  Android. Include Android when it is explicitly declared in the platform matrix.
- Let `platforms.android` select additional packages, GI namespaces, permissions,
  application icon, packaging profile and named native-recipe overrides. Merge
  overrides by recipe name; diagnose unknown names and ambiguous replacements.
- Omitted runtime selection uses the SDK's prebuilt SQGI runtime for Android.
  An explicit `runtime.sqgi`/`runtime.source` retains its existing source-build
  meaning unless a matching prebuilt runtime is explicitly selected. Never
  silently substitute another SQGI revision. Android feature overrides can disable
  JIT without disabling it for desktop; an explicit Android JIT request fails.
- Keep output and build state under the application: distinct directories for
  platform, ABI, SDK identity and build variant. Builds of unrelated apps must
  not share a mutable Gradle project or APK input tree.
- `check`/`explain` remain inspection operations. Report missing tools, unavailable
  package capabilities, planned downloads and generated outputs without executing
  builds or downloads. Errors include the authored manifest path.
- Add a non-destructive migration command for existing `sqgi.json` projects.
  It writes `sqgipkg.json`, preserves entry/assets and application identity, and
  refuses to overwrite an existing manifest. Resolve ambiguous dual manifests
  through an explicit command option rather than guessing.

Preserve source execution initially. If `compile_scripts` is requested, validate
the bytecode producer/consumer ABI, numeric configuration and runtime revision;
fail clearly until that combination is covered by a cross-target test. Do not
assume desktop `.cnut` is portable merely because both targets are 64-bit.

## Native modules and target SDKs

The first supported build host is Ubuntu 24.04 x86-64. Build target libraries for
both Android ABIs with the pinned NDK. Native Windows/macOS Android build hosts
can follow after the installed backend is portable; preserve existing desktop
packaging on those supported hosts.

| Native input | Android implementation and acceptance |
| --- | --- |
| C GObject module | Meson recipe, target GIR/typelib, properties/signals/errors and async callbacks exercised by Squirrel |
| C++ module | Meson or CMake, C/GObject public boundary, shared NDK libc++; exceptions contained at the language boundary |
| Vala module | Host `valac` with target VAPI/dependency files; generated C compiled with the NDK; target metadata compilation and async execution |
| Rust library | Explicit Cargo build hook and pinned Android target/linker; C ABI or GObject wrapper with declared GI metadata; a small working fixture |
| Prebuilt native module | Ooblerg Android package selected by the same recipe name/API, with matching ABI, SDK and metadata |
| Dependent native recipes | A helper library exports headers, `.pc`, GIR/VAPI and target libraries into a private SDK used by the next recipe |

Keep Meson/CMake as the automatic recipe backends. Extend portable argv hooks
for Cargo and other build systems rather than promise a general Rust bindings
generator. GI exposes annotated C/GObject APIs; arbitrary C++ or Rust classes
do not become introspectable by being compiled into a shared library.

Create a private SDK overlay per target/configuration, reusing the ownership and
conflict checks in `native_sdk.py`. Preserve authored recipe order for backward
compatibility. Add optional explicit `depends_on` recipe edges, with stable
topological ordering and cycle/missing-dependency errors. Export development
outputs after each recipe and include only its runtime dependency closure in the
app. Removing a recipe must remove its old exports on the next preparation.

Keep the NDK's Android headers and CRT as the compiler sysroot. The GNOME `/usr`
prefix is an additional target dependency root, not a replacement NDK sysroot.
Configure target-only pkg-config paths and library/include discovery; retain
host lookup only for programs such as Meson, Ninja, `valac` and the scanner.
Use the official NDK CMake toolchain with explicit ABI/API/STL arguments and a
generated Meson cross file. Isolate build directories per ABI, as required by
the [NDK CMake workflow](https://developer.android.com/ndk/guides/cmake).

Expose explicit build context to hooks: Android ABI, API, NDK directory,
dependency prefix, Meson cross file, CMake toolchain, build/install directories,
GI runner and target compiler/binutils. Use argv-based processes where possible.
Do not inherit host `PKG_CONFIG_PATH`, `LD_LIBRARY_PATH`, or compiler overrides
into the target build accidentally.

All C++ components in an app use the pinned shared `libc++_shared.so`; reject
different providers of that SONAME. Matching the NDK and C++ runtime across
prebuilt dependencies follows [Android's C++ runtime guidance](https://developer.android.com/ndk/guides/cpp-support).

For Android packaging, emit stable unversioned library filenames and matching
SONAMEs such as `libgallery-helper-1.0.so`. If an upstream recipe produces
`.so.1`, fix its Android build or use an explicit audited normalization stage
that updates the library, all dependent `DT_NEEDED` references and GI metadata
together. Renaming the file alone is insufficient. Diagnose collisions between
different modules with the same SONAME before invoking Gradle.

## GObject Introspection during cross builds

Extend GI strategies with `auto` and `target`, while preserving existing
desktop `host` declarations. On Android, `auto` selects `target`. An inherited
desktop `host` strategy must be overridden or produce a precise migration error;
it must not silently copy desktop metadata.

The target strategy runs the scanner on the host with Android headers and
compiler settings, executes its inspection binary with Android/Bionic libraries,
then compiles the typelib for that ABI. Reuse the existing SqgiAndroid wrappers,
but remove hard-coded repository/build paths. Pass an explicit permitted set of
recipe build roots, private SDK roots and target library directories so a module
outside the SqgiAndroid checkout can be inspected.

ARM64 already has a QEMU/Bionic runner; x86-64 currently uses an emulator through
ADB. Extend the desktop runner to x86-64 and prove it independently, or retain
ADB as an explicit temporary requirement until it works. Both ABIs must have a
desktop-only metadata route before declaring the prebuilt/native workflow done.
QEMU inspection does not validate Activity, Binder or Java behavior; Android
service-dependent inspection needs an explicit device/emulator runner.

Keep GIR, typelib and backing-library identities together. Include dependencies
discovered through GIR and typelibs in the runtime closure even when the library
is loaded only by GI and absent from the executable's `DT_NEEDED` list. Support
explicit roots for dynamically imported namespaces and plugins.

Treat typelibs as ABI-specific. For multi-ABI apps, stage metadata under
`assets/runtime/<abi>/...` and select it using the loaded native runtime's ABI.
Do not use the device's preferred CPU ABI, which can differ under native
translation. Deduplicate only bytes proven identical, while preserving logical
per-ABI identities. Include a fixture whose native layout distinguishes the
targets, so a wrong-ABI metadata selection cannot pass accidentally.

## Ooblerg Android packages

Use Ooblerg archives/catalogs as the delivery format and the working SqgiAndroid
recipes as the initial build producer. An Ooblerg Android adapter can invoke a
versioned SDK builder and export its validated receipts; a full recipe rewrite
is unnecessary. The producer must be pinned to an explicit builder revision,
source lock and patch set, not an arbitrary sibling checkout.

Start with the already working GLib/GI/GTK dependency closure and SQGI. Other
Ooblerg libraries, including GStreamer, libsoup, GDAL and libadwaita, require
their own Android recipes and tests. Catalog presence on Windows or Linux does
not imply Android availability; unsupported features fail during resolution.

Proposed target descriptors:

| Android ABI | Ooblerg target | Prefix | Additional identity |
| --- | --- | --- | --- |
| `arm64-v8a` | `aarch64-linux-android` | `/usr` | Bionic, API 31, NDK r28c, Ubuntu Noble source baseline, SDK revision |
| `x86_64` | `x86_64-linux-android` | `/usr` | Same fields, separate architecture and artifacts |

An illustrative immutable repository layout is
`<origin>/android/noble-android-r1/<target>/v1/`. The SDK descriptor pins the index
digest, package digests and compatibility fields. Existing Windows and Linux
URLs remain valid. API/NDK/SDK identity must participate in resolver and cache
keys, rather than be inferred from a directory name or ELF machine number.

Package metadata should include source package/revision/archive checksums,
patch hashes, recipe revision, dependency versions/digests, target descriptor,
SONAME and GI namespace providers, file ownership/hashes, source/license
attribution, and reproducible build inputs. Keep these fields available in
`sqgipkg-build.json`. A checksum fetched beside an index is integrity data, not
an independent authenticity proof; consume immutable index hashes from the
trusted SDK descriptor and preserve existing repository transport semantics.

Separate delivery needs:

| Package content | Consumer |
| --- | --- |
| Runtime libraries, typelibs, schemas, fonts/data and notices | Script-only application packaging |
| Headers, pkg-config files, GIR, VAPI and link inputs | Application native builds |
| Target inspection tools and GI runner configuration | Native builds that generate metadata |
| Host build tools | Build machine, always identified separately from Android packages |

Use runtime/development subpackages and small meta packages, provisionally
`sqgi-android-runtime` and `sqgi-android-sdk`. Keep GTK Java glue and native
runtime versions tied by a compatibility identifier. Match app-side wrapper
templates to that identifier; refuse mismatches before building an APK.
NDK compilers and emulator/Bionic inspection images remain pinned build tools;
they are not Android app payloads. Script-only builds must not download the
inspection image or run GI scanning.

Generate exports from validated per-package ownership records. The current
SDK is a cumulative prefix whose receipts record changed files, so reconcile
ownership explicitly and reject conflicting or unowned payloads. Verify every
requested runtime and development dependency exists in the exported catalog;
Android release export must not silently skip absent packages.

Replace producer-local validation at the consumer boundary: an app consuming
prebuilt packages validates the published descriptor, file hashes and compatible
target inputs. It must not need the producer's source tree, exact host packages
or recipe files merely to pass `BuildState.validate`. Keep the stricter existing
source-build receipt checks for maintainers.

Test extraction into an unrelated path and a clean host. Fix `.pc`, CMake,
GIR/VAPI and script references that embed producer paths. Rebuild only the app
module after relocation. Archive production should be deterministic; distinguish
reproducible package contents from whole-APK bytes affected by the signing key.

Prepare and consume a locally served repository first. The goal includes
publishable archives, complete indexes and a documented publication command;
deployment to the public Ooblerg service is a separate action once the artifacts
and destination are concrete. Do not couple runtime integration to a new GUI
for Ooblerg's Windows package manager.

## APK assembly and development workflow

Combine the prebuilt SDK and private native exports into one audited runtime
closure. Check architecture, Android target provenance, minimum API, SONAMEs,
`DT_NEEDED`, GI namespace dependencies and duplicate providers. A Linux ARM64
ELF must be rejected even though its machine number matches Android ARM64.
Use a versioned allowlist of public Android system libraries and retain the
existing private pinned zlib behavior. ELF headers alone cannot establish the
minimum API or Bionic compatibility; package/recipe provenance and symbol/link
validation are also required.

Audit every library for 16 KB ELF compatibility, including app-native modules
and libc++. Verify the actual APK/AAB and selected split payloads after Gradle.
Keep extracted native libraries initially because the current GI/runtime loader
uses their filesystem directory; changing to in-APK loading requires separate
loader validation. Android distinguishes ELF alignment from ZIP alignment and
runtime page-size assumptions in its [16 KB guidance](https://developer.android.com/guide/practices/page-sizes).

Preserve schemas, GTK data, fonts, resources and explicit dynamic plugins.
Resolve native modules by the same GI import names as desktop. An app must
install and run without a separately installed SQGI runtime or shared Android
package manager.

Retain desktop preview and device `install/deploy/run/logs/sync/watch/reset`.
An explicitly selected device wins; otherwise use the sole compatible device
or report the ambiguity. Source updates restart the entire Android process and
preserve private data. Native changes, namespace changes, Android permissions,
or runtime changes require rebuild/install; never claim to hot-reload a native
library or registered GType. Disable source overrides in release variants.

Add release packaging with externally supplied keystore settings and no secrets
in manifests or provenance. Test it with an ephemeral test key. Keep production
signing keys and Play submission outside automated fixture tests. A release
artifact is not a claim of Play acceptance or complete phone hardware coverage.

## Native entry applications

Support the existing native-entry concept through an explicit Android shared
library entry contract. A desktop executable cannot be copied into an APK and
used as an Activity. Keep Android/GTK initialization, storage and lifecycle in
the wrapper, then dispatch on the GTK thread to a declared C entry symbol in
the application's library. Define arguments, ownership, return behavior and
shutdown alongside the runtime ABI; the application can embed SQGI and run its
packaged scripts.

Add an Android-specific entry selector referencing a native recipe, library and
symbol. Preserve desktop executable selectors. Build a small GTK native-entry
fixture that uses the SQGI C API, then test startup, Activity recreation and
shutdown. Arbitrary JNI frameworks and general Gradle plugin integration are
later extensions rather than implicit parts of a GObject module recipe.

## Delivery milestones

| Milestone | Concrete changes | Acceptance gate |
| --- | --- | --- |
| 1. Runtime and target foundation | Merge guarded SQGI runtime fixes; add Android option/schema/JSON protocol support; extract installed backend interface and adapt current SDK input | Existing GTK Gallery builds and runs through `sqgipkg` for x86-64; existing demo launcher still works; desktop schema/runtime regressions pass |
| 2. Ooblerg package producer | Android target descriptors, SDK identity, ownership export, runtime/development packages, complete catalogs for both ABIs | Fresh private install from a local repository reproduces the required SDK files and rejects a wrong-target or modified archive |
| 3. Prebuilt consumer | Android package resolution, runtime choice, private SDK preparation, locks, relocated installation, installed templates/helpers | Gallery builds using downloaded prebuilt libraries with the producer checkout/source build directories unavailable; a cached locked rebuild succeeds offline with tool dependencies cached |
| 4. Native modules | Meson/CMake toolchains, target GI runners for both ABIs, native exports/order/edges, explicit prebuilt selection and Cargo hooks | C GObject, C++, Vala, Rust C-ABI and dependent-module fixtures build; GI calls/callbacks run; one module is also consumed as an Ooblerg prebuilt |
| 5. Android application parity | Multi-ABI AAB metadata selection, APK splits, device commands/source updates, release variant and native-entry selector | Both ABI payloads verify and run on available Android execution environments; split install, source update, lifecycle and native-entry tests pass; release test build disables overrides |
| 6. Product integration and regression | Manifest Studio capabilities/forms/jobs/artifacts, migration guide, examples, installed CLI smoke tests and reproducibility reports | Android can be selected and built from the GUI; one app manifest works for desktop and Android; all documented acceptance cases and existing relevant desktop tests pass |

Milestone 1 may temporarily use an explicitly selected local SDK. Milestone 3
removes that requirement for ordinary app users. Begin the C native fixture in
milestone 1 to test the backend request shape; complete its target SDK/GI support
in milestone 4. Each milestone produces a usable artifact and an execution
report, not just schema fields or mocked subprocess tests.

Update both the JSON Schema and Squirrel validator, CLI help/completion metadata,
`describe/check/explain --json`, package catalog target selection, lock/provenance
target identity, and installed-file rules together. Manifest Studio consumes
those capabilities; it must preserve Android fields when editing, display
Android-specific errors/artifacts, and not reinterpret Android as Linux merely
because its native output is ELF.

## Verification and completion criteria

Use the existing clean `SqgiAndroid/demo` as the visible acceptance app. Preserve
its controls/forms/collections screens and screenshots, then add a small native
module panel showing a property, signal, async result and error path. This
proves the GI extension as well as the existing GTK rendering.

Required checks cover:

- Manifest resolution, target aliases, existing defaults, overrides, migration,
  missing dependencies, unavailable features and structured error paths.
- Package download/extraction, target/API/SDK mismatch, corruption, duplicate
  SONAMEs, missing GI providers, conflicts, lock replay and offline cache use.
- Target compilation and GI generation for ARM64/x86-64, C/C++/Vala/Rust fixtures,
  and a dependency chain starting from an SDK without those app modules.
- Desktop/native version consistency and Android C++ runtime identity; deliberate
  injection of a host library or wrong metadata set must fail before packaging.
- Installation, actual GI calls, widgets, callbacks, async success/error,
  file picker/GIO access, process restarts, preserved app data and recreation.
- Multi-ABI bundle selection, packaged hashes, 4 KB and available 16 KB emulator
  coverage, release-variant override rejection and native-entry lifecycle.
- Relocated prebuilt SDK use, clean app builds, deterministic package export,
  and relevant SQGI/Linux/Windows/Ooblerg regressions.

Existing ARM64 APK validation uses emulator native translation; physical ARM64
hardware is not currently verified. Record native translation, QEMU and actual
device execution separately. Hardware availability, full IME/accessibility and
GPU renderer work are not completion gates for this packaging integration and
must not be presented as covered.

The integration is complete when a clean Ubuntu development environment can
consume the staged Ooblerg Android release, build the Gallery and native-module
fixtures through installed `sqgipkg`, produce/install APKs and an ABI-selectable
AAB, replay locked inputs, use development commands and Manifest Studio, and
retain working desktop targets. No ordinary app build may depend on the
maintainer's checkout layout or a pre-existing application module in the SDK.

## First implementation slice

Start with SQGI's guarded runtime changes and a normalized Android target model.
Define the backend request/result and SDK descriptor before moving packaging
code. Add the Gallery's migrated manifest and a C GObject fixture, exercise the
existing x86-64 SDK through the new backend, and capture the result. Then export
that same SDK as Ooblerg packages and switch the integration test to downloading
it. This establishes the full path before broadening native languages and ABI
coverage.
