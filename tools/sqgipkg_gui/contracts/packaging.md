# C-PKG: packaging protocol

Requirements: R-PKG-01 through R-PKG-10; R-SCOPE-03 through R-SCOPE-05.

## Interface version 1

`sqgipkg describe --json` emits capabilities, field schema/templates, CLI option
metadata, host targets, and `protocol_version: 1`.

`sqgipkg check|explain --json --manifest FILE` emits exactly one JSON object to
stdout: `{protocol_version, ok, diagnostics, configurations}`. Failures also
produce this envelope and a nonzero exit code. Diagnostics have `severity`,
`code`, `path` (JSON path array), `message`, and optional file/target. Normal
human-readable modes keep their established text interface.

`--manifest - --base-dir DIR` consumes object JSON from stdin for local inspection
only. It resolves relative paths exactly as a file at DIR/sqgipkg.json would.
It cannot build/clean/write locks. Diagnostic paths use authored keys where known;
unmapped resolution errors point to the document root without guessing.

**C-PKG-01 Shared resolution:** both renderers use the same normalized options,
selected target configurations, diagnostics, and recipe/plan functions. Structured
output is not produced by parsing terminal messages. A plan includes target,
architecture, name, entry, output, runtime selection, native commands, packages,
file inclusion evidence, and unresolved generated outputs.

Native dependency export (FS-30 correction): preserve authored recipe order and
prepare a private target SDK for downstream Meson/CMake recipes. Export installed
development outputs from each completed library recipe and use that SDK for
pkg-config, compiler/linker lookup and Vala binding lookup. When explicit host-GI
generation supplies Vala bindings, pair those metadata files with the compiled
target library, never the host library. Do not rewrite or install into the base
sysroot; reject conflicting exports rather than silently replacing dependencies.
Rebuilds must not retain removed recipes' exports. Runtime payload selection
remains separate. Acceptance starts with a sysroot containing no gserial and
requires both gserial and Verminal to compile, then tests the packaged app;
an already-installed gserial cannot pass this gate. Linux managed/explicit-sysroot builds now implement this export for Meson and
CMake recipes. Host-only legacy builds and Windows source dependency chains are
not covered by this implementation. Fresh Verminal build acceptance passes;
packaged runtime acceptance remains tracked under FS-30.
The GUI labels resolution independently from Check results. Discovery `used_*`
flags may reflect declarations and must not be labelled as import evidence;
actual evidence is displayed separately. Missing provenance remains unknown.

A native entry can use `project` plus `executable` instead of explicit platform
paths. Both are nonempty strings; the project names a declarative Meson/CMake
recipe available to that selected target. The executable is relative to its
generated `.sqgipkg/build/<platform-architecture>/<project>` directory. Append
`.exe` for Windows unless already present. Reject absolute/traversing executable
paths and combinations with `path`, `linux`, `windows` or `script`; reject these
selectors on SQGI entries. Resolve after target selection and before checking,
explaining or staging. Missing generated executables remain identified as build
outputs before compilation; Build must produce and stage the actual file.
Legacy explicit paths and overrides retain their previous meaning. Test actual
target path resolution and native recipe entry staging independently of GUI
controls, including invalid project references and old path-based entries.

**C-PKG-02 No side effects:** describe/check/explain do not fetch/build/execute
application hooks. Check may compile Squirrel for syntax without executing it.
File scanning stays within declared inputs and existing scanning semantics.
Local schema-invalid input yields diagnostics while preserving authored data.

**C-PKG-03 Runtime defaults:** runtime_recipe configure commands explicitly set
JIT ON, kernels ON, bytecode backend LLVM, kernel backend LLVM. An explicit
runtime.jit=false sets JIT OFF only. These options appear on reconfiguration too.
Expose requested runtime settings separately from verified binary/build metadata.
Existing runtime metadata cannot be inferred solely from source defaults.
Accept `runtime.source` without `runtime.sqgi` and build that local checkout
without fetching or changing its Git revision. With only `runtime.sqgi`, retain
the fetched-revision workflow. Explicit source/revision values must be nonempty
strings, and a runtime declaration with neither is rejected with an actionable
diagnostic. Check/Explain must accept the same selection as Build and expose the
local source in its configure command. Test relative local paths and omission
of the revision, as well as empty/invalid selections.

Runtime source recipes and nonempty declarative `native` recipes enable private
Linux dependency downloads and the existing default suite when not explicitly
overridden. This does not depend on GUI/media feature declarations. Later
manifest Linux overrides, per-architecture overrides and forced CLI flags keep
their existing precedence; manifests without these recipes retain their prior
defaults. Test ordinary no-feature source recipes and explicit opt-outs.

Linux source-runtime sysroot seeds include target-qualified `llvm-18-dev`.
This is required with `runtime.jit=false` too because kernels remain enabled.
When a private Linux sysroot is selected, runtime CMake options explicitly point
`SQGI_LLVM_INCLUDE_DIR` to its `usr/lib/llvm-18/include` and
`SQGI_LLVM_LIBRARY` to its target-triplet `libLLVM-18.so`. Reconfiguration
overrides stale host cache values. Existing-runtime and native-only recipes do
not gain this build dependency. Automatic Linux runtime package selection for
SQGI entries includes `gir1.2-glib-2.0` so both GLib and GObject typelibs are
staged through the ordinary package path. Preserve explicit automatic-package
opt-outs. Test both Linux architectures, JIT-disabled recipes, no-source
recipes and idempotent base metadata selection; field-study execution must
check which metadata files were actually loaded.

**C-PKG-04 Operations:** classify each current CLI option as a field, invocation,
action, or alias. Invocation arguments stay separate from the manifest. Per-run settings are documented for terminal use. Describe available target/host combinations clearly.

Windows `package_source` is `msys2` (the compatibility default) or `ooblerg`.
Ooblerg uses https://ooblerg.xyz/v1 and its x86_64-w64-mingw32 `/mingw64`
repository. `windows.repo_url` can select a compatible mirror; package names are
provider-native (for example `gserial`, not MSYS2-prefixed names). `packages`
selects runtime packages, `build_packages` selects development-only seeds.
`windows.runtime` is `inherit` by default or `package`: the latter explicitly
selects Ooblerg's `sqgi` package for SQGI entries only, overriding the global
source recipe for Windows while preserving its Linux meaning. Reject package
runtime with MSYS2, native entries, or explicit runtime.jit overrides that the
prebuilt binary cannot honor. Inspection names the provider and runtime package;
it does not claim verified binary capabilities.

A declarative library recipe may name `windows_package`. For Ooblerg Windows
configurations, replace that recipe's source build with the named package and
its complete dependencies. `stage:false` selects development-only seeds.
Linux retains the original recipe. Reject this field
for MSYS2 or the native application's entry recipe. Explicit package choices
work with automatic package selection disabled. Source runtime builds add
`llvm18` to development/runtime preparation and configure its include and
LLVM-C.lib paths on every build. Prebuilt runtime builds copy SQGI from the
provider and execute no source-runtime recipe.

Use a distinct `_ooblerg-x86_64` private output sysroot, provider-specific
cross-file directory and `windows-x86_64-ooblerg` recipe build directory, so
changing providers cannot reuse Meson/CMake caches from the other provider. Do not accept explicit MSYS2 roots/prefixes with Ooblerg.
Resolve index dependencies in deterministic dependency-first order, including
meta packages and cycles, with missing dependencies fatal. Verify archive hashes
before extraction, reject traversal, links and special archive entries, detect
conflicting file contents, and atomically publish a complete sysroot after
preparation succeeds. A provider ownership marker protects other directories.
Cache downloads atomically and reuse only digest-verified archives. No-download
mode uses cached index/archives, failing clearly for missing inputs. Locks store
repository, exact package metadata and digest; locked builds resolve from those
entries, without a fresh index. Record every selected package in build provenance.
Stage the runtime closure through the existing file filters plus license notices;
resolve imported DLLs and verify PE architecture through the existing verifier.
Check/Explain never invoke preparation. Offline tests use a local repository to
exercise closure, corrupt archives, absent dependencies, no-download, locks,
provider isolation, extraction rejection and runtime-file selection. Real field
study builds/runs test prebuilt SQGI, gserial/gworldscene, and a source-built
custom module against the Ooblerg development files.

The shared backend memoizes each resolved repository index (including an
unavailable index) within one packager instance. A refresh bypasses the disk
cache once per index, not once per package; subsequent lookups reuse that run's
result. Distinct repository/suite/component/architecture and refresh modes do
not share entries. Emit index preparation progress. Regression coverage counts
actual downloader invocations against local fixture indexes without networking.

Installed-package checks compare sysroot extraction metadata with the selected
archive regardless of refresh mode. Refresh and locked modes force extraction
at the preparation boundary; readiness checks must accept the resulting current
extraction and still reject missing or mismatched metadata. Test refresh,
ordinary reuse, locked re-extraction and changed archive identities.

Linux package staging applies destination/dependency filtering before file
lookups. Use Gio file type metadata (following symlinks), not a shell `test`
subprocess per file. A nonempty selected sysroot is the authoritative source for
package file paths; missing target files cannot fall back to the host. Preserve
the existing selection and symlink-copy semantics. Regression coverage uses
conflicting host/target paths, missing target content, excluded paths, directories
and a symlink to a selected file, and observes that discarded paths launch no
shell probes.

For Linux GTK or GdkPixbuf features, automatic runtime package selection includes
`shared-mime-info`. If `usr/share/mime/packages/*.xml` is staged, postprocessing
requires host `update-mime-database`, runs it on the payload's `usr/share/mime`,
and verifies `mime.cache` exists. Its data is architecture-independent; never
substitute the host's MIME definitions. Missing tools and unsuccessful generation
are build failures with the tool named. Existing launchers select the packaged
data through XDG_DATA_DIRS. Regressions generate a real cache from a fixture MIME
definition, query it in a fresh process without host data paths, and test the
missing-tool error. Field-study PNG/JPEG checks run in dependency isolation.

For Linux hosts, capabilities also advertise `appimage-all`. It selects every
configured Linux architecture (or the existing host default if no matrix is
configured), with the same per-architecture output suffixes as `all`, and never
adds a Windows configuration. Build dispatch invokes the existing Linux builders;
no packaging logic moves into the GUI. Single `appimage` and existing `all`
selection retain their semantics. Native-entry validation treats `appimage-all`
as a Linux target. Acceptance compares Check/Explain configuration selection and
uses recording builders to verify Build dispatch without producing packages.

**C-PKG-05 Compatibility:** schema and Squirrel validation agree on supported
fields/types. Unknown legacy data is retained with warnings; strict v2 invalid
data is rejected for check/build. Existing CLI tests must pass.

**C-PKG-06 CLI boundary:** the GUI launches the `sqgipkg` entry point for
check/explain, passing argv directly and JSON through stdin. It cannot call
packaging/build methods. Future Build actions must likewise invoke the CLI
against a saved manifest; no GUI packaging implementation is permitted.

**C-PKG-07 Asynchronous inspection:** check/explain receive exact draft bytes and
base directory through argv/stdin. GTK stays responsive. Cancel terminates and
reaps the inspection process, which executes no application/hooks. Results
retain their draft identity; later edits are visibly stale. Process errors,
invalid output, and unsupported protocol versions are surfaced as errors.

Acceptance IDs: `PKG-native-entry`, `PKG-native-entry-build`, `PKG-protocol`, `PKG-equivalence`, `PKG-inspection`,
`PKG-runtime-defaults`, `PKG-runtime-dependencies`, `PKG-local-runtime-source`, `PKG-index-refresh`, `PKG-sysroot-preparation`, `PKG-operations`, `PKG-compatibility`, `PKG-cli-boundary`, `PKG-async-inspection`, `PKG-matrix-build`.

`sqgipkg packages --json` exposes the Ooblerg catalog in a protocol-version-1
object with `ok`, `packages`, `repository`, `target`, `cached`, and diagnostics.
This explicit network action fetches only index metadata; it never extracts,
builds, or executes package content. `--refresh-packages` refreshes this catalog.
Default repeated browsing uses the cached index and reports that fact. Index
validation and cache handling are shared with Build, outside the GUI. JSON errors
retain the envelope and nonzero exit status. Check/Explain remain strictly local.

The Windows runtime file filter rejects `.dll.a`, `.a`, `.lib`, `.la`, `.pc` and
header files beneath `lib/` plugin/loader directories before directory inclusion
rules. DLLs stored directly in `lib/` are staged in `bin/` for dynamic loading.
Case-insensitive `.DLL` selection and import lookup also apply on Linux hosts.
Regression tests cover nested GStreamer/GdkPixbuf import archives alongside DLLs.

NSIS scripts explicitly declare `Target amd64-unicode` before loading UI/plugin
macros. Require NSIS's matching 64-bit stubs/plugins rather than silently emitting
an x86 bootstrap. Test a real generated/compiled installer and inspect its PE
machine field; installer execution requires verified installed files in addition
to the launcher process exit. A 32-bit Wine child can crash even when its 64-bit
launcher exits zero; never count that as successful installation.

C-PKG-01 native Linux sysroot linker flags include link-time-only `rpath-link`
searches for existing target library directories, including multiarch `blas`,
`lapack` and `openblas-pthread`. These paths must derive from the selected
sysroot, never the host library search fallback. Paths containing spaces must
remain single arguments. An executable depending indirectly on a library in
these subdirectories must link without adding runtime RPATH/RUNPATH entries.

C-PKG-01 FS-27 staging compatibility: for Ooblerg only, after all explicit files
and package files are staged, recognize GLib-2.0 typelib format 4.0 whose library
list is exactly `libglib-2.0.dll,libgobject-2.0.dll`. Replace that list with the
corresponding `-0.dll` implementations only when both target x86_64 PE files
are present. Preserve every original byte except total size and library-list
offset; append the new string. Already corrected and other valid lists remain
unchanged. Malformed headers and missing/wrong-target replacement DLLs fail
before writing. Publish the correction's before/after SHA-256 and library names
in an adjacent build record, outside the application payload. Preserve original
SDK files. Regression acceptance includes GI-generated XML equivalence except
for shared-library names and a real callback under the recorded Windows runner.

The Build-only `--build-result FILE` option implements the versioned final-output
protocol in C-JOB. It is invocation state, never a manifest property. Inspection
rejects it before writing. Producers report outputs through the shared backend;
the GUI does not construct artifact filenames or parse human logs.

C-PKG-03 When an effective Linux native project has non-null GI metadata,
linux_required_pkg_config_modules includes gobject-introspection-1.0 independently
of entry_type. Existing candidate resolution chooses the target architecture's
GI development package; native entries without GI do not acquire this requirement.
The same modules feed preparation/readiness checks. Regression acceptance covers
fresh x86_64 and aarch64 native entries with/without GI and no SQGI runtime; real
Verminal's previously failing clean-cache build must be retried separately.

C-PKG-01/C-PKG-03 Linux Ooblerg integration: `linux.ooblerg_packages` adds explicit
runtime/development package seeds; `native[].linux_package` is an opt-in Linux-only
replacement, mirroring the separate Windows choice. Omitted replacement leaves
all local/Git build behavior intact. Application entry recipes cannot be replaced.
`linux.ooblerg_repository` is an optional repository origin; append the effective
`x86_64-linux-gnu/v1` or `aarch64-linux-gnu/v1` target path. Ubuntu package lists
and resolution remain separate. `packages --package-target TARGET --json` browses
the selected catalog; default remains the existing Windows target.

Validate `/usr` Linux versus `/mingw64` Windows prefixes and repository target,
verify archive hashes and target ELF machine before accepting a Linux package,
and reject unsafe paths/collisions. Prepare Ooblerg in a dedicated owned root,
then compose its development files into a copy of the Ubuntu SDK. Stage runtime
libraries/typelibs/data, not headers/static archives/pkg-config/VAPI/GIR, and run
normal ELF dependency collection. Record target-qualified lock keys and package
provenance. Inspection does not fetch. A missing prebuilt package is a diagnostic,
not permission to silently build or switch targets. Tests cover both CPU catalogs,
wrong-target/checksum rejection, source-recipe preservation, private SDK exports,
GUI authoring and actual packaged GI/native-entry use.

Linux Ooblerg bundles use the Ubuntu 24.04/noble version baseline, aligned with
Ooblerg Windows package versions. Selecting them defaults the Ubuntu suite to
noble; reject an explicitly different suite with an actionable message instead
of claiming ABI compatibility. This policy does not affect source-only recipes.

C-PKG-03: Linux archive symlinks are resolved only against verified files within
that package's `/usr` prefix, including forward/chained SONAME links. Materialize
them as regular copies for the private SDK and runtime staging. Never follow
host filesystem links. Reject escaping, cyclic, missing or conflicting links;
Windows archives retain their existing no-links rule. Regression fixtures cover
GWorldScene-style versioned shared libraries and failure atomicity.

C-PKG-03: Ooblerg SDK overlay normalizes pkg-config `Cflags` entries of the form
`-Iinclude/<subdir>` to `-I${includedir}/<subdir>` (or the declared prefix/include).
The shipped GWorldScene metadata uses this source-relative form. Original
archives/prepared roots stay unchanged. Record source and normalized digests
and the reason in the private SDK marker. Other flags are preserved.
