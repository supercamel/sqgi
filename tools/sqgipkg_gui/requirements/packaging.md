# Packaging integration

Parent: [product requirements](README.md). Derived contract: [packaging](../contracts/packaging.md).

| ID | Requirement |
| --- | --- |
| R-PKG-01 | GUI and CLI use the same schema validation, normalization, target selection, recipes, and dependency resolution. |
| R-PKG-02 | A versioned machine interface exposes capabilities, diagnostics, and resolved plans without parsing human log text. Existing text CLI output remains supported. |
| R-PKG-03 | Inspection is local and does not execute application/hooks or fetch/build. Unsaved preview uses the manifest's base directory. |
| R-PKG-04 | Plans show selected targets, entrypoints, runtime source, packages, native build commands, outputs, and available file inclusion evidence. Plans are labelled as resolution, separately from validation. Declared feature flags are not presented as proof of detected imports. Unresolved/generated content and unavailable provenance are identified honestly. |
| R-PKG-05 | Linux supports AppImage and Windows outputs; Windows supports native Windows outputs. Sysroot targets are documented as advanced CLI operations. Reserved appdir/tarball targets are not build choices. |
| R-PKG-06 | Standard runtime recipes explicitly configure LLVM JIT and typed kernels even with an existing CMake cache. An authored runtime.jit override is preserved as an explicit exception. |
| R-PKG-07 | Runtime diagnostics distinguish the GUI's runtime from the packaged runtime. Missing required dependencies or nonstandard existing runtimes are identified without assuming binary capabilities from source defaults. |
| R-PKG-08 | Per-run flags, cache operations, locks and smoke tests stay out of the manifest unless the CLI already defines a corresponding field. |
| R-PKG-09 | Legacy manifests retain their accepted semantics. Strict version-2 errors do not cause unknown fields to be deleted. |
| R-PKG-10 | Manifest/schema/CLI catalogs remain consistent through automated coverage checks; aliases do not create contradictory effective settings. |

Baseline/package-suite selection describes dependency selection and is not an
OS compatibility certification. Cross-target build success does not establish
execution success on that target.

Native recipes used by a later native application must make their development
outputs available to that build: target libraries, headers, pkg-config metadata,
and generated Vala bindings where provided. Keep these outputs in a private
per-project, per-target SDK; never install into the host or mutate a shared
downloaded sysroot. An installed host copy must not conceal a missing export.
Cross builds must use target binaries with matching metadata; development files
must not enter the application payload merely because another recipe used them.

The multi-output selector must produce an ordinary manifest that `sqgipkg build`
can execute without GUI-specific command overrides. `all` selects the configured
Linux matrix plus the declared Windows format. A shared CLI `appimage-all` target
selects only the Linux matrix; Check, Explain, and Build use the same selection and
per-architecture output paths. Existing single-target and `all` behavior stays
compatible. This extension is needed for the two-AppImage-only choice.

R-PKG-06/R-PKG-07 runtime selection accepts either a local SQGI source checkout
or a fetched version/tag/commit. A local `runtime.source` alone is sufficient;
users must not invent a remote revision to build their current local sources.
An empty runtime selection is diagnosed with both supported ways to correct it.

R-PKG-08 cache refresh is a bounded per-run operation: refreshing dependency
metadata must not download the same repository index again for each package
lookup in one build. Report refresh progress so preparation does not appear hung.
After refreshed packages are extracted, cross-build readiness must recognize
them as installed in that private sysroot. A refresh request forces preparation;
it is not evidence that the newly prepared packages are missing.

R-PKG-06 source runtime and declarative native recipes prepare their Linux
development dependencies in the private sysroot by default, including plain
Squirrel applications without GTK/media feature declarations. Preserve explicit
manifest/CLI package-download overrides and existing legacy behavior.

R-PKG-06/R-PKG-07 Linux source-runtime preparation includes the LLVM 18
development dependency required by the default JIT and typed kernels, even
when JIT is explicitly disabled. Compilation must use headers and libraries
from the selected private sysroot, including when its architecture matches the
host. A previous CMake cache must not silently reuse host LLVM paths.
Automatically bundled SQGI runtime dependencies include the base GLib/GObject
GI metadata; a plain native-module consumer must run without borrowing that
metadata from its build machine or development sysroot.

R-PKG-01/R-PKG-04 a native entry may reference a declarative native project and
an executable relative to that project's build directory. Check, Explain and
Build resolve it independently for each selected target and architecture.
Existing explicit native paths remain compatible. A missing project, ambiguous
selector combination or path escaping the build directory is an actionable
manifest error. This removes hand-maintained architecture paths from ordinary
native application authoring.

R-PKG-01/R-PKG-07 when staging packages from a selected Linux sysroot, use its
files even if the host has the same absolute path. Host files must not silently
replace target package content. Reject irrelevant package paths before checking
their files; walking a dependency's documentation, keyboard data or development
files must not spawn a process for each discarded path.

R-PKG-07 Linux image loading must work without the host's MIME database.
When MIME source definitions are bundled, packaging must generate their runtime
database inside the payload and report a missing generator or failed generation.
Extracting Debian archives does not run package triggers; copying MIME XML alone
does not satisfy runtime image detection. Image/GTK dependency defaults include
the MIME definitions while preserving explicit package opt-outs.

R-PKG-01/R-PKG-04/R-PKG-06 Windows packaging supports Ooblerg as an explicit
package source. Existing manifests retain MSYS2 semantics. New GUI projects
recommend Ooblerg and explain its x86_64 scope. Prebuilt SQGI and native libraries
must be usable without compiling those projects; custom projects can still
cross-compile against the same provider's headers, import libraries and GI data.
Selecting a Windows package must not silently alter Linux source builds.

R-PKG-07 provider preparation uses a separate private sysroot, verifies repository
SHA-256 digests, resolves complete dependency closures, and records exact package
versions/artifacts in build provenance and locks. Do not mix providers in one
sysroot or silently accept missing dependencies. Inspection performs no downloads.
Disabled downloads permit verified cached artifacts; refresh is explicit. Stage
runtime files and licenses while excluding development files and unused tools.
Use the provider's LLVM 18 SDK for source runtime builds with kernels/JIT enabled;
do not bootstrap a separate Microsoft compiler/SDK. Resolve packaged DLL names
case-insensitively on Linux too. Build success and emulated/native runtime checks
remain separate acceptance gates.

Runtime staging must exclude development import archives even when package
archives install them beside loadable plugins. Retain actual DLLs, runtime caches,
metadata and support files in plugin/loader directories.

R-PKG-05 Windows x86_64 NSIS output uses an x86_64 Unicode installer bootstrap,
matching its application payload. It must not require a 32-bit compatibility
subsystem merely to install the supported 64-bit target.

R-PKG-06 Linux native recipe linking must resolve indirect shared-library
dependencies supplied by the selected sysroot, including Debian multiarch
BLAS/LAPACK implementation directories. This must not depend on host linker
configuration or embed private build paths in the packaged runtime search path.

R-PKG-01 Windows Ooblerg GI metadata must resolve the packaged implementation
DLLs, including GLib timeout callbacks. A bounded compatibility correction for
known legacy GLib metadata may operate on the staged payload only: retain ABI
records, leave downloaded archives/private SDK inputs unchanged, and record
before/after hashes. Unknown metadata must not be guessed or broadly rewritten.

R-PKG-06 Explicit native GI recipes require target GObject Introspection development
metadata even when the application's entry is native rather than SQGI. Dependency
preparation must seed that metadata for both Linux CPUs in a fresh sysroot; a
previous SQGI build or host installation must not conceal the requirement. Keep
host GI generation separate from target headers/libraries and preserve explicit
package-download opt-outs.

## Optional Linux Ooblerg packages

R-PKG-01/R-PKG-04/R-PKG-08: Linux uses Ubuntu for ordinary dependencies and may
explicitly add Ooblerg prebuilt libraries from the selected CPU's Linux catalog.
Never route Ubuntu package names to Ooblerg or Windows packages to Linux. Local
and pinned-Git native builds remain fully supported without Ooblerg. An explicit
per-library Linux package replacement may skip that library's source build on
Linux only; removing it restores the retained recipe. Never auto-replace recipes.

Include prebuilt development files in a private composed target SDK for downstream
C/C++/Vala builds, and only runtime files in AppImages. Verify repository target,
archive digest and ELF architecture. Resolve published Ooblerg dependencies within
that catalog; use Ubuntu for ordinary system dependencies. Preserve base sysroots,
keep CPU-specific caches/provenance and locked replay distinct, and diagnose
collisions or missing dependencies rather than silently falling back to host files.
Check/Explain must remain local and show Ubuntu and Ooblerg choices separately.

Linux Ooblerg bundles use the Ubuntu 24.04/noble version baseline, aligned with
Ooblerg Windows package versions. Selecting them defaults the Ubuntu suite to
noble; reject an explicitly different suite with an actionable message instead
of claiming ABI compatibility. This policy does not affect source-only recipes.

R-PKG-04: Linux prebuilt archives must support normal versioned shared-library
symlinks without allowing extraction outside the prepared prefix. Reject links
that escape, cycle or point to missing files, and preserve the previous root on
failure.

R-PKG-04: Published development metadata must work after relocation into the
private SDK. Preserve original archives and record any SDK-only path repairs;
do not expose source-build-relative include paths to downstream applications.
