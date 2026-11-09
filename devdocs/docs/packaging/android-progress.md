# Android integration progress

All six milestones in the [integration goal](android-integration.md), including
the subsequently authorised server publication, are complete. This file records
successive checkpoints from 9 November 2026; later sections supersede earlier
test counts and remaining-work lists. The latest work covers the public r2
release, Android system metadata, native Gallery, manifest parity and input locks.

## Working implementation

- SQGI's CMake/source tree contains the runtime-only install, Android SONAME,
  JSON-number fallback and opcode enum fixes. Android defaults disable JIT and
  typed kernels; explicit enablement fails clearly. Desktop defaults are intact.
- `sqgipkg` resolves Android APK/AAB targets, ABI selection and schema-v2
  `platforms.android`. JSON inspection and build-result reporting include Android.
  Existing Linux/Windows CLI regression tests pass.
- An installed SQGI/Gradle backend assembles GTK apps from exported SDKs or
  Ooblerg packages, audits native/metadata dependencies and verifies packaged
  file hashes. Source recipes and prebuilt native modules run through SQGI.
  Python is used by upstream Meson/GI scanning and the external test harness;
  the installed Android backend contains no Python modules.
- SqgiAndroid's new `tools/export_sdk.py` validates source-build receipts and
  exports a consumer descriptor for either ABI. The consumer validates target,
  API, NDK, runtime capabilities and the complete file inventory independently
  of the producer's host configuration.
- The Gallery has an additional `demo/sqgipkg.json`; its existing `sqgi.json` and
  `run.sh` remain usable. The integrated APK lives in `demo/dist-android/`.
- SDK input locking/replay works. A full packaging-tool/Maven lock is still
  required before claiming the broader reproducibility milestone.

## Verification

| Evidence | Result |
| --- | --- |
| `tools/sqgipkg_tests/test_android.py` | 10 tests pass: resolution, matrix/aliases, unsupported input rejection, SDK integrity and relocation |
| Existing `test_ergonomics.py` | 46 tests pass |
| Desktop JSON/numeric/VM lifecycle/GI-library CTests | 12 tests pass |
| NDK builds of integrated `libsqgi.so` | x86-64 and ARM64 pass; fresh ARM64 configuration verifies interpreter-only defaults |
| Integrated runtime numeric and lifecycle execution | Four cases per ABI pass: x86-64 Android emulator and ARM64 QEMU/Bionic |
| Gallery packaging | Source-checkout CLI and installed CLI both build the APK; `--write-lock` followed by `--locked` succeeds |
| Installed Gallery | Provenance matches the selected APK; button signal, forms/collections navigation and list selection pass |

Runtime execution evidence is in
`SqgiAndroid/build/sqgipkg-integration/runtime.json`. Repeatable Gallery validation
is `tools/test_sqgipkg.py --apk demo/dist-android/org.sqgi.android.widgets-x86_64-debug.apk
--serial emulator-5554` from SqgiAndroid; its report and portrait screenshot are
under `build/sqgipkg-integration/x86_64/`. The validated APK SHA-256 is
`a59172ba3f67a827ffd341a017c4e76ae6926e5d7da80ad2ab460b38f0c3b05d`.

The private installed-tooling check is under
`sqgi/.sqgipkg/validation/installed`; runtime build directories are adjacent.
The full JDK was extracted from Ubuntu's
`openjdk-21-{jdk,jre}-headless=21.0.12.1+1-1~24.04.4` packages into
`SqgiAndroid/.cache/tools/jdk/usr/lib/jvm/java-21-openjdk-amd64`. Build invocations
used that `JAVA_HOME`, the existing Gradle 8.9 directory through `GRADLE_HOME`,
and the existing r28c NDK through `--android-ndk`.

## Remaining work

The exported SDK still describes the original locked SQGI commit plus Android
patches. Keep that source-build path valid until its runtime pin/patch retirement
is migrated deliberately; the integrated runtime was separately built and run.

The Ooblerg producer/consumer implementation and acceptance results are below.
Application-native recipe and module-catalog results are recorded below.

Source-runtime selection, integrated device commands, native-entry applications,
Manifest Studio and the full acceptance matrix remain outstanding. Multi-ABI
bundles and release signing are now exercised, as recorded below. The current
source-runtime pin still needs deliberate migration, and a full packaging-tool/
Maven lock remains outstanding.

## Ooblerg checkpoint

Ooblerg now has `tools/android_packages.py` and
`sqgi tools/ooblerg.nut android-export --android-sdk DIR`. The exporter consumes
the validated descriptor and prefix without importing the producer checkout. It
checks receipt/source-lock integrity, unique file ownership, Bionic ELF/16 KB
alignment, library/GI closure, and complete profile dependencies. Archives have
deterministic metadata; immutable release directories reject different bytes.
The two actual SDK exports each contain 64 payload packages and four
metapackages, with all 1,821 files accounted for. A runtime install contains 422
files; a development SDK contains 1,483. Target tools and docs are separate.

Local catalogs are staged under
`ooblerg/out/repo/android/noble-android-r1/<target>/v1/`. Exporting twice produced
identical archives, manifests, descriptors and catalogs. Catalog SHA-256 values:

| Target | Catalog SHA-256 |
| --- | --- |
| x86_64-linux-android | `e04687731546269e430695685ec5f0e7441033f513552b00e8434c89ac0ba89d` |
| aarch64-linux-android | `4706be377798d49d5863d2b0d1668454c18100ce523bd99230bcffd9cd27680a` |

SQGI's Android consumer reuses the existing Ooblerg download/extraction transport.
It checks all catalog/package identities, descriptor hashes, complete dependency
closure, file hashes and ownership before promoting the private install. SDK
validation independently checks ELF architecture, Bionic interpreter, runtime
search paths and dependencies. Script-only builds use namespace dependency
metadata from the descriptor, without downloading GIR, headers or target tools.

`--android-repository ORIGIN`, `--refresh-android-packages` and
`--no-android-download` are implemented, along with manifest `repository` and
`download` fields. Locks pin the catalog, descriptor and transitively all selected
archives. Cached locked replay works without a server; Gradle receives
`--offline`. Check/explain remain read-only. The existing Ooblerg server serves
both Android catalogs and their archives correctly; its self-tests pass.

### Actual consumer acceptance

- Installed `sqgipkg` built the x86-64 Gallery from a locally served HTTP catalog
  in a fresh project under `sqgi/.sqgipkg/validation/android-gallery`.
- A second fresh project, `android-gallery-offline`, rebuilt with `--locked
  --no-android-download`, with the server stopped. Linux Landlock made both
  SqgiAndroid and Ooblerg producer trees unreadable to the build and all children.
  Host JDK/NDK/Gradle were staged outside those trees. Gradle reported 36 actionable tasks executed;
  no previous APK/build tree was reused. The reusable isolation helper is
  `tools/sqgipkg_tests/android_isolated_run.py`.
- The offline APK passed actual x86-64 emulator checks for installed provenance,
  button signal, forms/collections navigation and list selection. Its SHA-256 is
  `1427e1f4ee3b364efe9c6118fe6a42cfae809b51e33ff1874f5365289edeeca3`.
  Screenshot: `SqgiAndroid/demo/screenshots/06-ooblerg-offline-controls.png`.
  The report remains `SqgiAndroid/build/sqgipkg-integration/x86_64/gallery.json`.
- ARM64 Gallery packaging also passed using prebuilt packages. This checkpoint
  does not claim a new ARM64 GUI execution test.
- Development SDKs for both ABIs installed privately from packages and passed
  complete inventory/ELF validation. `pkg-config gtk4 sqgi` resolves all flags
  inside the relocated SDK with explicit sysroot/libdir variables. Application
  native compilation and generated-GI acceptance are the next milestone.
- Tests: 16 Android CLI/SDK/package tests, four Ooblerg exporter tests, existing
  Ooblerg transport and 46 CLI ergonomics tests pass. Coverage includes corrupt
  archives/cache, SDK identity, duplicate/missing packages, bad ownership, host
  ELF rejection, offline lock replay and immutable export.

Durable local evidence is collected in
`sqgi/.sqgipkg/validation/android-ooblerg-report.json`. Both catalogs remain local;
no packages have been uploaded to the public origin. Publishing instructions
and the initial-origin trust/lock model are in `ooblerg/docs/android.md`.

## Native-module checkpoint

Android native recipes now build through the installed backend. Meson, CMake
and portable custom argv hooks receive NDK compilers, target pkg-config and a
clean private SDK. `depends_on` is stable and rejects unknown names/cycles.
Installed headers, `.pc`, VAPI, GIR, typelibs and libraries are exported between
recipes. Base SDK files and earlier recipe ownership are preserved; conflicting
exports, including conflicts within one install batch, fail before copying.
Only build-directory RPATHs may be removed, preserving ELF segment layout and
dependencies. Host RPATHs and versioned Android SONAMEs are rejected.

`gi.strategy: auto` and `target` use the host 1.80.1 scanner with target probes
and target `g-ir-compiler`; `host` fails explicitly. The installed inspection
backend provisions checksum-pinned QEMU and Android API-31 Bionic images for
both ABIs, validates the cached environment and records its identity in the
lock. It needs no producer checkout. All GIR lookup and library execution paths
are confined to the target SDK and current source/build directories. The ADB
fallback also works for a device's native ABI. ARM64 APK translation on an x86-64
emulator is not treated as a native shell runner for GI probes.

Ooblerg adds `tools/android_modules.py` and `android-module-export`. Application
module catalogs are independent of the core SDK catalog, with exact SDK/source
baseline/NDK/ABI identity, source/recipe hashes, build API, normalized file modes,
complete inventory and ELF/GI dependencies. `native[].android_package` selects
them; `platforms.android.module_set` chooses the immutable module release.
The consumer verifies the catalog, dependencies, archive hashes, ownership and
payload before promoting a private install, then records the catalog checksum
in the application lock. Source recipes can consume these prebuilt exports.
An application using only prebuilt modules selects the core `sdk` profile and
skips GI scanner/target-tool/inspection provisioning entirely.

The local acceptance catalog is `native-fixture-r3`, containing `sqmobile-base`,
`sqmobile-cpp`, `sqmobile-vala` and `sqmobile-rust` for both ABIs. Re-exporting each
catalog produced identical bytes. Earlier local test releases remain immutable.

| Target | Module catalog SHA-256 |
| --- | --- |
| x86_64-linux-android | `3620ce1b030b459550b6ba94904bc64c7e3af16be825b1fb9707ba409a249eb8` |
| aarch64-linux-android | `2a4070ccef61d581767a8459df0e909111b0b69bbcc0461671410941ee600efd` |

### Executed acceptance

- The new `tools/sqgipkg_tests/android_native_project` fixture builds C GObject,
  C++, Vala and Rust C-ABI modules from source for both ABIs using the prebuilt
  Ooblerg development/tool SDK. No GNOME source rebuild is involved.
- Its suite runs under QEMU/Bionic on both ABIs. It verifies C and Vala
  properties/signals, async results and errors, C object finalization, C++
  standard-library use and exception containment, Rust calls into the C
  dependency and ABI-specific record layout: 24 bytes on x86-64, 32 on ARM64.
- Installed `sqgipkg` also built both ABIs in a fresh mixed project with the C
  source directory absent: the prebuilt C module supplies headers, pkg-config,
  VAPI and GI to newly compiled C++, Vala and Rust recipes. The same native suite
  passes under QEMU for both results.
- Installed `sqgipkg` built a second fresh app containing only the scripts and
  three package selectors; the C module arrived transitively. It then rebuilt
  both ABIs in another fresh directory with `--locked --no-android-download`
  and the HTTP server stopped. Landlock denied reads from both producer trees,
  the native source fixture, QEMU inspection cache, GI scanner, Meson and CMake.
  Both Gradle builds executed all 36 tasks.
- Those final offline APKs passed actual GTK app execution on `emulator-5554`.
  Installed provenance matched the APK; every native check passed; tapping the
  GTK button invoked C++ and recorded one callback. x86-64 ran natively in the
  emulator. ARM64 used `libndk_translation.so`; this is not physical ARM64
  coverage. The independent ARM64 QEMU/Bionic result is recorded separately.
- The ADB GI fallback generated the `SqHello` GIR/typelib using scanner and
  compiler execution on the x86-64 emulator. The resulting target typelib was
  subsequently loaded by SQGI under QEMU/Bionic and returned 42. An ARM64 GI
  request against this x86-64 device is rejected before building.
- Tests pass: 25 Android CLI/native/package tests, six Ooblerg exporter tests,
  existing shared Ooblerg/native-SDK suites, 46 CLI ergonomics cases and Ooblerg
  server self-tests. New contracts cover dependency ordering/cycles, host-GIR
  rejection, RPATH normalization with real ELF execution, atomic export
  collisions, module lock/offline replay, wrong SDK/ABI/API, corrupted hashes,
  inventory/ownership and canonical package permissions.

Final offline APK SHA-256 values:

| ABI | APK SHA-256 |
| --- | --- |
| x86_64 | `b55e3b3cccba0a86d1b7bcdc9cdf993940dd650371c4b23d9e541ef7e53beef8` |
| arm64-v8a | `23f20be020b571457f3acfd72650b571acae85f169e0ca0fc817a37c10970d19` |

Combined evidence is `sqgi/.sqgipkg/validation/android-native-report.json`,
with logs under `android-evidence/`. The final projects are
`android-native-mixed-r3`, `android-native-prebuilt-r3` and
`android-native-prebuilt-r3-offline` in that validation directory. Screenshots
are `SqgiAndroid/demo/screenshots/07-ooblerg-native-x86_64.png` and
`08-ooblerg-native-arm64-v8a.png`. The reusable UI check is
`tools/sqgipkg_tests/android_native_acceptance.py`. The original Gallery remains
installed under its separate application ID.

The native scanner emits parsing warnings for NDK `siginfo.h`; they did not
prevent the generated modules from building or passing target-layout and
execution checks. This is not a claim that every arbitrary native API is
automatically introspectable. Native `files` rules currently fail explicitly;
install development exports and use application file rules for app assets.

Remaining goal work includes source-runtime selection and deliberate runtime
pin migration; multi-ABI AAB/metadata/split validation; integrated device and
preview workflows; release signing; native-entry lifecycle support; Manifest
Studio, migration/templates; full host-tool/Maven locking and final acceptance.
The goal remains active. No catalog has been published publicly.

## Multi-ABI bundle and implementation-language checkpoint

The installed CLI now emits one AAB for a declared ABI matrix, with sealed
per-ABI native/GI inputs and a shared application snapshot. A small JNI helper
identifies the ABI of the loaded code, including ARM64 under Android's native
bridge; the Java wrapper installs the matching typelibs and provenance. APK
payloads retain the same private application/runtime paths. Bundletool 1.18.3
is checksum-pinned and its generated split sets undergo full payload,
certificate and 16 KB ZIP-alignment verification.

The pinned AGP 8.7.1 intentionally omits JAR signing for debuggable bundles.
The backend signs a separate copy with the same identity as the APK splits,
then verifies the bundle signature. Release signing uses external environment
settings and verifies the selected identity on APKs, AABs and generated splits.

Executed acceptance:

- Installed `sqgipkg` built one multi-ABI native-fixture AAB with
  `--locked --no-android-download`. SHA-256:
  `72596e4fde166e6a9c9badf848bbbfe2bf24049364e21b639db6ba55e6051a14`.
- Both signed split sets ran the C/C++/Vala/Rust suite and GTK callback on the
  emulator. x86-64 was native; ARM64 used `libndk_translation.so`. Session ABI
  selection and the 24-/32-byte target record layouts were correct.
- The Gallery rebuilt with the new ABI-aware wrapper and passed its controls,
  forms and collections interactions. Its original `demo/run.sh` remains intact.
- The release harness built a debug APK, release APK and multi-ABI release AAB
  with one ephemeral key. The release APK and both split sets launched actual
  GTK packaged source; `run-as` was rejected. A valid source override targeting
  the exact release provenance was seeded through the debug build and survived
  installation, but was ignored by the release. The generated tree contained
  no test password and the test key was deleted. All builds ran offline after
  explicitly caching the previously missing pinned Gradle lint dependency.
  Evidence: `sqgi/.sqgipkg/validation/android-release/report.json` and its logs.
  The acceptance harness is `tools/sqgipkg_tests/android_release_acceptance.py`.
- Evidence: `sqgi/.sqgipkg/validation/android-bundle-report.json` and
  `android-native-signed-split-ui/`. New demo screenshots are
  `09-sqgipkg-bundle-x86_64.png`, `10-sqgipkg-bundle-arm64-v8a.png` and
  `11-sqgipkg-gallery-v2.png`.

Following the implementation-language review, the architecture now calls for
our Android backend to run in Squirrel/SQGI. Python remains appropriate for
the external acceptance harness and upstream GI tools. The original Python
backend is retained temporarily as a behavioral reference during migration.

Implemented SQGI modules: filesystem/canonical JSON primitives, ELF auditing
and build-RPATH removal, SDK validation, toolchain selection, ZIP/deflate
reading and prepared/APK/AAB/split payload auditing. `sqgipkg check` now uses
the SQGI SDK/toolchain modules directly. The actual signed AAB produces exactly
the same payload audit result in SQGI as in the original implementation.

Installed preflight passed for both real SDKs under Landlock denying both
Python executables, the installed Python backend and both producer repositories.
Evidence is `sqgi/.sqgipkg/validation/android-squirrel-migration-report.json`.
All 41 Android tests pass, including both implementations of the SDK/payload
contracts, native ELF execution after identical RPATH rewriting, malformed
ZIPs, ABI relabeling, corrupted bytes and prepared-input mutation. Existing
CLI ergonomics, shared Ooblerg and native-SDK CTest suites also pass.

### SQGI build and package-consumer checkpoint

The build orchestrator, SDK and application-module package transport, private
native SDK composition, signing and bundletool integration now run in SQGI.
The remaining Python backend boundary is source-native recipe orchestration
and its GI runners. Native XML validation uses Ubuntu's native `xmllint`;
the acceptance host uses extracted `libxml2-utils=2.9.14+dfsg-1.3ubuntu3.10`.
This is separate from the Android source/library pins, which have not changed.

- Installed `sqgipkg` built a multi-ABI Gallery AAB from a fresh HTTP catalog
  cache. A second fresh project replayed its lock with the HTTP server stopped,
  `--no-android-download`, and Gradle extracted from the checksum-pinned ZIP.
  Landlock denied both Python executables, the reference backend and both
  producer checkouts throughout the builds and their children.
- Both final offline Gallery split sets passed installed provenance, selected
  ABI, button signal, tab navigation and list-selection checks on the emulator.
  Screenshots are `SqgiAndroid/demo/screenshots/13-sqgi-offline-gallery-x86_64.png`
  and `14-sqgi-offline-gallery-arm64-v8a.png`.
- The four-language native fixture also built a multi-ABI AAB entirely through
  SQGI using the existing locked Ooblerg module catalogs, offline and under the
  same Python/producer restrictions. Transitive C GObject exports are shared
  by the C++, Vala and Rust packages. Both ABI split sets passed the native
  checks and GTK click test. Reports are in `android-squirrel-native-prebuilt-ui/`;
  screenshots 15 and 16 in the Gallery demo show the results.
- SQGI release acceptance passed: debug APK, release APK and release AAB,
  external signing credentials, both split sets, packaged-source execution
  despite a valid debug override, non-debuggable release behavior and credential
  cleanup. Evidence: `android-squirrel-release/report.json` under validation.
- All 56 Android tests pass, including SQGI module compatibility, locked offline
  relocation, GIR identity/dependency checks, hostile archives, and private
  SDK ownership/collision/reset checks. SDK/package/payload contracts also run
  against the reference implementation. Existing Ooblerg transport (20 tests),
  private native SDK (7 tests) and CLI ergonomics (46 tests) also pass.
- SQGI now provisions the pinned QEMU/Bionic inspection environments, including
  streamed Android partition extraction and metadata checksum/bounds checks.
  Fresh installed-tool runs prepared both userspaces and executed the native
  fixture with Python and producer trees unreadable. Their userspace inventories
  and QEMU bytes exactly match the reference implementation. Evidence is
  `android-squirrel-inspection-isolated/report.json`; the reusable SQGI harness
  is `tools/sqgipkg_tests/android_inspection_acceptance.nut`. This new runner is
  tested independently; connecting the source build/scanner adapters remains.

Durable evidence is `sqgi/.sqgipkg/validation/android-squirrel-build-report.json`.
The emulator's primary ABI is x86-64; ARM64 app execution uses Android native
translation. Runtime pages are 4 KB; ELF and APK 16 KB alignment is audited,
but this checkpoint does not claim physical ARM64 or a 16 KB runtime test.

### SQGI source-recipe checkpoint

Source recipe orchestration is now SQGI too: stable dependency ordering, clean
compiler environments, Meson/CMake cross files, portable hooks, private export
ownership, build-RPATH normalization, source provenance, host scanning and target
metadata compilation. The Rust fixture's custom build script is now `build.nut`.
GI adapters preserve target library paths separately while starting the host
SQGI executable, preventing Android libraries from entering its dynamic loader.
The old Python backend remains in the source tree as a regression reference;
there is no CLI fallback to it, and it is excluded from installation.

- The complete C/C++/Vala/Rust fixture builds an audited multi-ABI AAB from
  Ooblerg tools SDKs offline. All Python backend files and both producer trees
  were unreadable during the build. Upstream Meson and `g-ir-scanner` remain
  allowed Python programs.
- A fresh installation containing no Android Python modules rebuilt the same
  fixture from a relocated project using `--locked --no-android-download`.
  Landlock also denied the original project, old installation and source-tree
  Android backend, proving that neither native build products nor modules were
  imported from them.
- Both builds' split sets passed C/C++/Vala/Rust calls, properties, signals,
  async success/error, finalization, target-specific record layout and a GTK
  button callback on both emulator ABIs. Reports are under
  `android-squirrel-native-source-ui/` and
  `android-squirrel-native-source-offline-ui/` in the validation directory.
- The SQGI ADB adapters generated C GIR and typelib on the emulator's native
  x86-64 ABI. Execution of that metadata under QEMU checks C calls, properties,
  async completion and record layout. Evidence is
  `android-squirrel-native-adb/{report,execution}.json`.
- All 61 Android contracts and the three existing regression groups pass.
  Added checks cover missing/host GIR, literal hook arguments, complete Git
  inventories with spaces/newlines/Unicode names, canonical Unicode key order,
  and starting host adapters with incompatible target libraries on the search
  path. The pinned GI scanner emits diagnostics for some transitive NDK system
  header declarations; the fixture's declared API and target layouts pass.

The source-built SDKs have also been exported as immutable local Ooblerg
`native-fixture-r4` catalogs; repeated exports produce identical bytes for both
ABIs. This records the new Rust recipe and SQGI build provenance without
changing the existing `native-fixture-r3` release or the core SDK baseline.

The r4 all-prebuilt and mixed source/prebuilt consumers build successfully. A
fresh installed consumer replays the prebuilt lock with the repository server
stopped and Python, producer trees and the original project unreadable. Both
ABI split sets pass native calls and GTK callbacks for the mixed and offline
consumers. The GI execution guard also rejects host ELF copied into a permitted
build directory; target compilers still reproduce identical typelibs on both
ABIs. Durable evidence: `android-squirrel-source-report.json` in validation.

Integrated device workflows, native-entry lifecycle, source-runtime selection,
Manifest Studio/migration/templates, full tool locking and final acceptance
remain. The goal is active.


### Integrated device workflow checkpoint

The installed SQGI CLI now implements Android `preview`, `install`, `deploy`,
`run`, `logs`, `sync`, `watch` and `reset`. Device selection honors an explicit
serial or the sole compatible connected device, checks API/ABI, and prefers
the native ABI. AAB installation uses the actual device specification, audits
its selected splits and signing identity, and records the installation.

- Gallery APK and multi-ABI AAB deployment passed. Both ABI source-update cycles
  passed changed sources, deleted files, watch mode, run/logs/reset, unchanged
  APK paths and preserved private data. Python executables, producer checkouts
  and the source-tree Android backend were denied for the installed workflow
  checks. Desktop preview also opened the Gallery under Xvfb.
- Native/runtime/application identities are embedded in newly built APKs.
  Incompatible namespace/runtime inputs and native C edits reject `sync`; the
  native edit check leaves the running process unchanged. Restoring the source
  permits updates. Release variants reject source updates.
- Native provenance now handles a project beneath an ancestor's ignored
  directory: successful-but-empty Git output falls back to a source inventory.
  Earlier r4 fixture catalogs could contain empty source inventories in this
  layout; their artifact hashes remain valid. Fresh four-language builds record
  all 4 C, 3 C++, 2 Vala and 5 Rust input files on both ABIs.
- These builds produced immutable `native-fixture-r5` module catalogs, with
  identical repeat exports. A fresh installed consumer built them over HTTP,
  then a relocated consumer replayed its lock with the server stopped and
  Python, producer trees and the original consumer unreadable. Both ABI AAB
  installations through `sqgipkg install` passed native calls and GTK callbacks.
- All 66 Android tests and the existing Ooblerg/native-SDK/CLI regression groups
  pass. Payload tests include Unicode asset names as well as hostile inventories.

Evidence: `sqgi/.sqgipkg/validation/android-device-workflow-report.json`. Gallery
workflow and r5 native screenshots are demo captures 19–22. Coverage remains an
x86-64 emulator with ARM64 native translation, plus the earlier target QEMU/ADB
GI checks; no physical ARM64 or 16 KB runtime test is claimed.

Native-entry lifecycle, source-runtime selection/pin migration, Manifest Studio,
migration/templates, remaining manifest parity, full tool locking and the final
acceptance pass remain. The goal is active.

### Native-entry lifecycle checkpoint

An `entry.android` selector now dispatches to a shared library on the GTK thread.
The installed `sqgi_android_entry.h` defines a versioned, borrowed context with
application/private-storage paths, optional script path and arguments. The entry
owns its VM and GObjects. An optional shutdown hook runs after it returns; OS
process death does not guarantee that hook. Activity recreation preserves the
entry and VM, and the wrapper retains the library through process exit.

- The C fixture embeds SQGI, imports GLib through GI, creates GTK controls and
  calls back into its VM. Source builds pass on both emulator ABIs: one entry per
  process, real Activity recreation with a live VM, callback value 42 → 43, VM
  cleanup and same-thread shutdown before process exit.
- A scriptless x86-64 variant passes the same lifecycle checks. The shared
  desktop/native manifest also builds and runs under desktop GTK with clean
  shutdown. Native-entry desktop preview requires that desktop executable build.
- Both ABI libraries are exported as immutable `native-entry-r1` Ooblerg catalogs;
  repeat exports are byte-identical. A consumer with no application C source
  builds over HTTP. A fresh relocated consumer replays its lock with the server
  stopped and both producers, original consumers, source Android backend and
  Python executables unreadable. Both offline ABI split sets pass the full
  lifecycle checks through installed `sqgipkg install`/`run`.
- Entry symbols, owning recipe, ELF and public interface checksum are checked
  before packaging. All 69 Android tests pass (four environment-dependent skips).

Evidence: `sqgi/.sqgipkg/validation/android-native-entry-report.json`. Demo
captures 23–24 show the offline prebuilt entry fixture. ARM64 uses native
translation on the x86-64 emulator; runtime pages are 4 KB. Physical ARM64 and
a 16 KB runtime remain unverified. Source-runtime selection/pin migration,
Manifest Studio, migration/templates, remaining manifest parity, full tool
locking and final acceptance remain; the goal is active.

### Manifest Studio Android checkpoint

The installed GUI now selects Android APK/App Bundle outputs, edits common
Android application/SDK settings, browses application module catalogs using the
current draft, and reports Android build progress/artifacts. Its shared output
model covers all 31 nonempty platform/CPU combinations. Optional platform
`enabled` switches restrict `target: "all"` while preserving saved settings;
explicit `--platform android` can select Android from that saved matrix.

- The actual GTK editor changed a Gallery project to a two-ABI App Bundle,
  edited Android settings, browsed `native-entry-r1` from the unsaved draft,
  resolved it and built the real bundle through its normal build supervisor.
  Cached packages were used with the repository stopped; producer trees,
  source GUI/backend and Python executables were unreadable to the installed app.
- That exact bundle passed installed CLI install/run and the complete source
  update/watch/logs/reset workflow on both emulator ABIs, including deleted
  assets, preserved app data and unchanged APK paths. This also exercises the
  script-entry Java branch after native-entry support was added.
- All 72 Android tests pass with four environment-dependent skips. The 14 GUI
  contract tests cover typed Android edits, preservation and every output
  combination; artifact tests, existing GTK workflows and Ooblerg/native-SDK/CLI
  regressions pass. GUI settings and job labels were inspected in screenshots.

Evidence: `sqgi/.sqgipkg/validation/android-studio-report.json`; demo captures
25–29 show Studio and the resulting Gallery. Source-runtime selection/pin
migration, project migration/templates, remaining manifest parity, complete
host/Maven tool locking and final acceptance remain. The goal is active.

### Project migration and starter checkpoint

`sqgipkg migrate` converts legacy Android `sqgi.json` projects without changing
their source bytes or existing configuration. It preserves nested entry paths,
assets, identity and versions, and rejects unknown legacy settings and unsafe
paths. `init android-gtk4` creates a portable GTK starter. The shared
`entry.source_root` retains source layout on Linux, Windows and Android.

- The installed CLI migrated a copy of the original Gallery and built it as a
  two-ABI bundle with both producers, source backend and Python executables
  unreadable. Both ABI installations passed the full source update/watch/reset
  cycle. Original demo scripts and its `run.sh` were preserved.
- The generated starter built under the same restrictions. Both emulator ABIs
  opened GTK and completed its button callback; the installed desktop preview
  also completed the callback, using test-only activation/quit timers.
- All 79 Android tests pass with four environment-dependent skips. Migration
  checks compare source/asset bytes across all three platform staging layouts,
  including Unicode, `=` and literal braces. This exposed and fixed a shared
  file-rule flattening bug for `=` filenames.
- The 14 GUI contracts and real GTK workflow pass, including Android setup with
  a nested entry. Save As rebases source roots and SDK paths. The full existing
  Linux/Windows packager regression passes after updating stale help assertions
  and its isolated Debian package fixture to include required GLib metadata.

Evidence: `sqgi/.sqgipkg/validation/android-project-report.json`; demo captures
30–33 show the migrated Gallery and generated starter. ARM64 still uses native
translation; runtime pages are 4 KB. Source-runtime selection/pin migration,
compatibility launcher routing, remaining manifest parity, complete tool locking
and final acceptance remain. The goal is active.


### Prototype launcher compatibility checkpoint

The producer's `sqgi-android` application commands now enter a SQGI adapter in
sqgipkg and use its normal manifest/build/device implementation. `--project`,
`--abi`, `bundle`, the producer-local SDK/output defaults and the historical
install-then-run meaning of `deploy` are preserved. `demo/run.sh` is unchanged.
The Python-compatible bootstrap only locates and execs SQGI; the maintainer
`sdk` command retains its producer implementation. The default GTK example now
has an explicitly migrated shared manifest alongside its preserved legacy file.

Older local SDK descriptors exposed a missing GI-catalog path in the SQGI
consumer. It now derives the namespace closure from validated, inventoried
target GIR using native libxml2 tooling. Ooblerg runtime packages continue to
use their embedded catalogs. No dependency versions or runtime pins changed.

- Both ABI APKs built through the installed compatibility adapter with producer
  tools, Ooblerg, source Android backend and Python executables unreadable.
  Actual legacy deploy calls installed and started them without requiring an
  NDK. All Gallery controls/forms/collections interaction checks passed.
- All 86 Android tests and 14 GUI contracts pass with the extracted native XML
  tool available. The compatibility tests cover explicit migration, shared
  starter/resolver behavior, SDK overrides, bundle selection and preserving
  install-then-run deployment. Maintainer SDK command help still works.
- The exact unchanged `demo/run.sh` command shapes are exercised against the
  headless emulator. Its visible-emulator startup was not rerun. Captures 34–35
  show the resulting Gallery; ARM64 uses native translation on x86-64.

Acceptance is recorded in `android-compat-report.json` in the SQGI validation
directory. Runtime source selection and deliberate pin migration, remaining
manifest parity, complete packaging-tool locking, the Gallery native panel and
final audit remain. The goal is active.

### Current source-runtime and publication work

Explicit runtime sources now compile against a private copy of the pinned SDK.
Both Android ABIs built the Gallery bundle, including a relocated locked build
with downloads disabled and producer/backend source trees and Python executables
unreadable. Both emulator ABI installations report the selected runtime version
and disabled JIT/kernels. Editing runtime sources rejects source updates without
restarting the app and rejects locked builds before compilation. Evidence:
`.sqgipkg/validation/android-runtime-source-offline/runtime-acceptance/report.json`.

Native recipes record the selected runtime source identity; consuming their
prebuilt packages with another source runtime is rejected. Native-entry execution
with a source-selected runtime passes on both emulator ABIs, including callbacks,
Activity recreation, VM shutdown and the complete Android system-module test.
Prebuilt modules compiled for that runtime also pass both ABI device checks after
a relocated locked build with the repository stopped and original source trees
and Python executables unreadable. Pinned Git-revision acquisition and cached
locked replay pass with the original Git repository unavailable. The new runtime
controls pass the real GTK workflow and all 14 GUI contracts; 90 Android tests
and the desktop system-module regression pass. Consolidated evidence is
`.sqgipkg/validation/android-runtime-source-report.json`.

The user additionally authorised public server builds/publication over SSH and
requested Android support in `system`. SSH access is verified. Existing Windows
and Linux updates run from `/root/CrossBuild/ooblerg`; the public repository is
`/opt/ooblerg/out/repo`, served by `ooblerg-server.service` behind HTTPS nginx.
The server has one CPU and about 1 GB RAM, requiring serial native builds. Its
existing working trees contain unrelated changes and must not be overwritten.
The isolated source snapshot and pinned Noble host are installed under
`/opt/ooblerg-build/android`. The new daily service shares the desktop updater
lock, builds serially, runs both ABI QEMU suites and publishes both catalogs with
one directory rename only after successful validation. The first
`noble-android-r2` build is in progress; public package URLs are not yet ready.
The SQGI runtime integration patch is explicitly checksum-pinned; all original
GNOME source revisions and the NDK remain unchanged. Full goal work remains
active.

### Android manifest resources checkpoint

`platforms.android.permissions` declares additional permissions, and
`platforms.android.icon` overrides the shared application icon. Launcher images
are decoded by host GdkPixbuf and converted to PNG. Generated manifests and
resources are sealed with each prepared ABI input and must match across a bundle.
Icon content is locked; permissions and icon hashes enter the source-update
compatibility contract. Manifest Studio exposes both settings and preserves
them through save and path relocation.

All 94 Android tests, 14 GUI contracts and the actual GTK editor workflow pass.
An installed, isolated consumer built the two-ABI Gallery bundle with an SVG icon
and INTERNET permission. Both APK split manifests contain those resources. Both
emulator ABIs pass source sync/watch/reset, preserving private data and refusing
permission/icon changes without rebuilding. ARM64 uses native translation.
Evidence: `.sqgipkg/validation/android-resources-report.json`. This checkpoint
uses the local r1 SDK; public r2 consumer acceptance still awaits the server build.

## Native Gallery, manifest selection and tool-lock checkpoint (9 November 2026)

The original Gallery now has a fourth Native page backed by a C/GObject Meson
recipe in its clean demo folder. Both emulator ABIs pass property editing,
signals, async success and native-error handling; their existing widget pages
still respond. Screenshots and reports are recorded in
`.sqgipkg/validation/android-gallery-native-report.json`. The original visible
emulator launcher remains unchanged.

Named `platforms.android.native` overrides merge into shared recipes without
changing desktop selections. A CMake fixture requires the overridden flag, and
its four-language bundle passes both ABI device tests. Evidence is
`.sqgipkg/validation/android-native-overrides-report.json`.

`platforms.android.packages` and `profile` now select a published SDK profile
containing the requested package closure. Selection, descriptor and package
identities are locked; missing packages and invalid profiles fail. Manifest
Studio edits both fields and preserves them through save/reopen. The Android
suite passes 102 tests; 14 GUI contracts and the actual GTK editor workflow pass.

Gradle uses strict SHA-256 verification for 376 artifacts across 216 components,
including debug and release APK/AAB dependencies. All four variants build
offline after caching, and a deliberately altered checksum is rejected.
Evidence is `.sqgipkg/validation/android-maven-report.json`.

App locks now record content identities for the selected JDK, NDK, Gradle,
Android platform/build-tools, SQGI backend/runtime and standard native build
tools. Local native source identities are also checked before compilation and
afterward; declared output directories and the generated lockfile are excluded.
This records selected tools rather than claiming a hermetic host environment;
custom-hook tools/services and host image loaders remain application/host inputs.
The installed script-only consumer has built a two-ABI bundle with strict Maven
verification offline while Python and producer checkouts were unreadable.
A relocated two-ABI native Gallery rebuild also passes with the original project
and producer trees unreadable and downloads disabled. Deliberate native-source
and Gradle-tree changes fail before compilation. Evidence is
`.sqgipkg/validation/android-host-source-lock-report.json`.

Desktop system/host-GI/package regressions pass, plus 20 Ooblerg transport tests,
46 CLI contract tests and the private native-SDK export suite. Ooblerg's own
Android package, module and corresponding-source suites pass 4, 3 and 3 tests.

On Ooblerg, the first isolated Noble build has validated ARM64 and is compiling
x86_64. The staged corresponding-source archive was independently reproduced
on both machines with SHA-256
`267d67385ad727c22ded00770e1bca36f605dca2a7012f1baac5dc088db3b387`.
The daily Android timer is enabled. Public publication and fresh HTTPS consumer
acceptance are still pending this build; no public release is claimed yet.

## Public release checkpoint (9 November 2026, 07:28 UTC)

Ooblerg published `noble-android-r2` from the isolated Ubuntu 24.04 producer.
Both ABI SDKs pass all 14 server QEMU cases. Each public catalog contains 64
payload packages and four profile metapackages. HTTPS downloads verify both
catalogs, all eight profile descriptors, both SQGI runtime archives, and the
136,368,866-byte corresponding-source archive. The existing Windows catalog
retains SHA-256 `2cea810c23cf701dacc84f9ddd70cb7165ffe2038c71cda0cddbecb04d410150`.

Catalog SHA-256:

- ARM64: `f88a1b969160cd14ee35832fc88f016504f913b042f029aea6c10e654ea0edae`
- x86_64: `7a5ae0b4217b10f4a60a755ca4bb5a8f86da768be93247bae9832be03c3e63c2`

A second complete producer run passed at 07:32 UTC, including independent source
export and byte-for-byte comparison against the immutable published release.
The daily Android timer runs at 06:00 UTC plus up to 15 minutes of randomized
delay; the existing Windows/Linux timer remains enabled.

CLI, starter, migration, GUI and producer defaults now select r2. Historical r1
fixtures select it explicitly. The defaults migration passes all 102 Android
tests, 14 GUI contracts and both Ooblerg package/module suites.

Evidence is under `.sqgipkg/validation/android-public-release/`. Fresh public
consumer acceptance is ongoing: the script-only Gallery has built without
Python/producer access and passed both ABI development workflows. The original
demo APK has been rebuilt from the public packages, including its Native tab;
`demo/run.sh` remains the launcher.

## Completion (9 November 2026)

The fresh public-release consumer gate passes for four apps on both emulator
ABIs: script-only Gallery, Gallery with its C/GObject panel, native entry with
embedded SQGI/system/lifecycle checks, and the dependent C/C++/Vala/Rust fixture.
The installed consumer uses HTTPS packages with producer checkouts unavailable;
the script-only case also denies Python. Its relocated locked rebuild passes
with downloads disabled and the original project unavailable.

The four application-native modules were then exported twice against r2 with
identical results. A separate consumer built their prebuilt packages without
Python or module sources and passed both ABI execution/GTK callback tests.
Those example module catalogs remain local acceptance artifacts; the public
server release contains the 68 core toolkit/profile packages per ABI.

The original demo's APK was rebuilt from the public release and its compatibility
deploy path passed all four Gallery pages and native interactions. The unchanged
`demo/run.sh` selects that APK. Native-panel screenshots in the demo now show
the public r2 runtime.

Final evidence: `.sqgipkg/validation/android-integration-completion.json`,
with detailed public consumer, offline, prebuilt, server and regression reports
linked from it. No main-repository commits were created. ARM64 emulator coverage
uses Android native translation; both ABIs also pass API-31 QEMU/Bionic runtime
tests. Physical ARM64 and store submission are not claimed.

## Git extras checkpoint (9 November 2026)

The Ubuntu 24.04 Android module set `git-extras-r1` now builds locally for
ARM64 and x86_64 against the unchanged public `noble-android-r2` SDK. Its 20
recipes provide GSceneGraph, GWorldScene, GSerial and GJoystick, plus Assimp,
GDAL, PROJ, SQLite, libsoup 3, OpenSSL, glib-networking and their pinned
support libraries. GAutostart and GAutoGUI are excluded at the user's request.
The exact source/patch/recipe pins live in Ooblerg's
`manifest/android-extras.lock.json`.

Both native SDKs pass Bionic/API-31 QEMU probes for Assimp OBJ loading, a PROJ
coordinate transformation, a GDAL raster round trip, GSerial/GJoystick
construction and all five GI namespaces. The Android packager now stages
transitive plugin libraries and reserved module runtime data, sets PROJ/GDAL
paths inside the loaded ABI, and registers packaged GIO modules before script
startup. The OpenSSL GIO module uses Android's system CA roots. Actual APKs
accept Ooblerg's HTTPS certificate and reject the local untrusted/wrong-name
certificate on both ABIs, including ARM64 native translation on 16 KB pages.

`SqgiAndroid/demo-extras` contains the clean scene/terrain/native-API demo,
a private pinned Android 16 emulator launcher and a SQGI screenshot/acceptance
script. Both widgets render through the images' bundled ANGLE driver; the
emulator's default EGL emulation driver lacks the required surfaceless-context
extension. The existing GTK SDK needs no changes. Actual scene animation,
Assimp models, terrain imagery, native API calls and HTTPS pass on x86_64/API36
and translated ARM64/API35 with 16 KB pages. Rotation also passes. GSerial and
GJoystick retain raw device-file APIs; Android USB/gamepad backends and physical
hardware have not been validated.

The installed consumer builds both APKs from the local module catalogs. Its
relocated, locked rebuild passes with downloads disabled, both Python
executables blocked, producer trees and the original consumer inaccessible.
The first replay correctly rejected a changed Ninja binary selected by PATH;
replaying with the original tool identities passes. Evidence is in
`.sqgipkg/validation/android-extras-consumer{,-offline}` and the demo's
`validation/` directory. The Android suite passes 104 tests (five skips),
module exporter five, SDK exporter four and source publisher three. Three new
HTTPS-fixture tests cover the public verification gate.

The isolated Ooblerg producer is currently building the module set from source.
Its daily service/timer and post-publication HTTPS checksum gate are installed;
publication is queued after the staging build. This checkpoint does not yet
claim a public extras release. The core SDK and Windows release remain separate.

The scene demo now uses real Ooblerg SRTM elevation (`N45E006.hgt.zip`,
1201-square samples) and live Esri World Imagery, following Sqtheia's terrain
and application-owned XYZ provider examples. Google's simulation endpoint
returned HTTP 403 to the emulator; Esri requests succeed through the packaged
libsoup/OpenSSL stack. The Mont Blanc sample is 4779.784 metres and all 217
requested imagery tiles loaded successfully with the Ooblerg-built ARM64
libraries on Android 16. Direct screenshots and source/hash metadata are in
`SqgiAndroid/demo-extras/screenshots/gworldscene` and `assets/terrain`.
Both demo APKs have been rebuilt with the real data and satellite provider.
The rebuilt x86_64 APK also passes scene/native/HTTPS checks and all 217
satellite tiles. Portrait rotation and the second Chamonix camera preset were
captured directly from the emulator; `captures.json` records ABI, source mode
and PNG hashes. `demo-extras/run.sh` launches the rebuilt APK, and the visible
emulator is left on the real terrain scene. The server's staging x86_64 build
is still progressing through GDAL; public extras verification remains pending.

## Installed Android onboarding (10 November 2026)

Android setup now belongs to installed SQGI. `sqgipkg setup --platform android`
checks or installs the Google SDK components, remembers JDK/SDK/NDK paths, and
can provision a checksum-pinned emulator with explicit SDK licence acceptance.
The read-only `--check --json` works outside an application directory.
`--native-tools` reports the Ubuntu 24.04 source-build prerequisites.

`sqgipkg emulator` manages the shared `SQGI_API_36` AVD on port 5564, supports
headless operation and stop/restart, and preserves installed apps and private
data. It refuses to stop or reuse unrelated AVDs. Application launch selects
the emulator's bundled ANGLE per package while preserving other applications'
driver settings. Both demo launchers now use installed SQGI commands, without
sibling checkout or producer-cache paths.

The current tools are installed under `~/.local`. A fresh Google SDK installation
and an app created outside all producer repositories passed deploy, a GTK button
callback, source sync and emulator restart. Native source builds preserve the
selected XML validator through their restricted PATH and discard stale compiler
caches when the NDK or other build context changes.

Ooblerg's `git-extras-r1` publication has also completed: both public ABI catalogs
contain 20 packages, and the server's full HTTPS verification passed for all 69
release files. An installed consumer built a two-ABI Scenes App Bundle directly
from these public catalogs while all three producer repositories and both Python
executables were inaccessible. Its offline rebuild also passes and matches the
installed backend. Both ABI splits passed scene animation, Assimp, native APIs,
HTTPS, real SRTM elevation and all 217 satellite tiles. ARM64 uses Android's
native translation; physical ARM hardware is not claimed.

The Gallery launcher rebuilt its C/GObject module with the newly selected NDK
and passed property, signal, async-success and async-error interactions. The
Scenes launcher installed and ran the public x86_64 APK. Automated regression
results are 157 passes and five skips across the Android, onboarding and CLI
ergonomics suites. Public demo reports and screenshots are also copied to
`SqgiAndroid/demo-extras/validation/public-onboarding/`.

Current onboarding evidence is outside the repositories at
`~/.local/state/sqgipkg/validation/android-onboarding/`. The first-app instructions
are in [the Android guide](../../../docs/packaging/android.md#first-app-on-ubuntu-2404).
