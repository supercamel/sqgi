# sqgipkg TODO

This is the working roadmap for `sqgipkg`, the SQGI packaging tool. The goal is
to make packaging a SQGI/Squirrel app feel boring in the best way: one small
manifest, isolated target dependencies, repeatable outputs, and enough
diagnostics that users can fix problems without learning every detail of
AppImage, MSYS2, pkg-config, Debian package metadata, or cross compilation.

## Product Goals

- Keep manifests small and intention-focused.
- Avoid host pollution. Do not require users to install target runtime packages
  into the host root just to package an app.
- Support native and cross builds from one manifest.
- Make Linux and Windows packaging symmetric where possible: generated toolchain
  files, private sysroots, package caches, runtime closure scanning, and clear
  diagnostics.
- Make failures actionable. Error messages should say what was checked, what was
  missing, what cache/sysroot was used, and the likely next fix.
- Make test projects double as examples. Every sample manifest should be
  realistic enough to catch real user problems.

## Priority Legend

- `P0`: Blocks reliable use of current targets.
- `P1`: Important for day-to-day packaging quality.
- `P2`: Nice-to-have polish, broader platform reach, or performance work.

## Current Targets

- Linux AppImage from SQGI scripts.
- Linux AppImage from native entrypoints.
- Linux multi-arch AppImage matrix through `linux.arches`.
- Debian/Ubuntu package download into isolated Linux sysroots.
- Windows portable directory through MSYS2 packages.
- Windows NSIS installer.
- Windows MSYS2 sysroot preparation.
- Native GObject/Vala/C/C++ project builds and staging.

## P0 Functionality

- [ ] Finish and verify the GTK/GStreamer overlay `--target all` path.
  - Expected outputs: x86_64 Linux AppImage, aarch64 Linux AppImage, Windows
    NSIS installer.
  - Must use reusable Linux sysroots and must not require host target runtime
    packages.
  - Confirm stale CMake build directories cannot silently reuse the wrong
    compiler.
- [ ] Make Linux cross builds robust against stale CMake/Meson state.
  - Prefer generated build-dir environment variables in examples.
  - Add diagnostics when a build dir was configured with a compiler that does
    not match `SQGI_LINUX_TRIPLET`.
  - Consider an opt-in `clean_build_dir` field or `--clean-build-dir`.
- [ ] Harden Debian sysroot dependency resolution.
  - Keep support for virtual dependencies and provider groups.
  - Add coverage for alternative dependency chains such as `python3 | qemu-user`.
  - Add coverage for `:any`, `Architecture: all`, explicit target arch, and
    explicit non-target arch dependencies.
  - Cache `apt-cache depends` results in-memory during a run to reduce repeated
    resolver work.
- [ ] Keep Debian sysroot refresh safe.
  - Re-extract packages when apt metadata points at a new archive.
  - Provide a clear way to refresh one sysroot without deleting every cached
    sysroot.
  - Record enough metadata to debug stale packages: requested package, resolved
    archive basename, source apt filename, architecture, version, and timestamp.
- [ ] Improve Linux pkg-config preflight.
  - Report transitive missing modules from `pkg-config --print-errors`.
  - Include the exact `PKG_CONFIG_SYSROOT_DIR` and `PKG_CONFIG_LIBDIR`.
  - When Debian sysroot download is enabled, recommend fixing apt indexes or
    sysroot resolution before recommending host multiarch installs.
- [ ] Avoid target build-tool bloat where possible.
  - `gobject-introspection-1.0` and related dev packages can pull target Python,
    compilers, qemu, and build-essential into the sysroot.
  - Decide whether sqgipkg should install only metadata/headers for preflight, or
    accept full Debian dependency closure for correctness.
  - Document the tradeoff if full closure remains the policy.

## P1 Functionality

- [ ] Add a `linux-sysroot` target.
  - Similar to `win-sysroot`, prepare the Linux sysroot and generated cross
    files, print paths, and exit.
  - Useful for cache warming, CI setup, and debugging pkg-config issues.
- [ ] Add cache management commands.
  - Show cache locations and approximate sizes.
  - List Linux sysroot cache entries by distro/release/arch.
  - Prune sysroots by arch, age, or package set.
  - Prune orphaned `.deb` archives.
- [ ] Add a stable sysroot lock/manifest file.
  - Record seed packages, resolved closure, package archive names, and toolchain
    assumptions.
  - Make sysroot reuse explainable across projects.
  - Consider a hash of seed package set plus distro/release/arch for stricter
    project-specific sysroots when desired.
- [ ] Add manifest schema validation.
  - Catch misspelled fields early.
  - Validate expected types for all nested entries.
  - Warn when deprecated aliases are used.
  - Generate a machine-readable schema from the same field definitions if
    possible.
- [ ] Clarify recommended manifest shape.
  - Prefer `linux.arches[].deb.packages` for multi-arch examples.
  - Keep top-level `linux.deb.packages` as shared defaults and backcompat.
  - Document merge rules for top-level versus per-arch lists.
- [ ] Improve staging reports.
  - Show sysroot path and whether it was reused or changed.
  - Show package counts by manually requested, auto-added dev packages, and
    transitive dependencies.
  - Show skipped smoke tests and why.
- [ ] Improve AppImage runtime completeness.
  - Make GTK/GStreamer asset and plugin warnings more specific.
  - Add helpers for common GStreamer plugin subsets.
  - Consider optional auto-selection of GStreamer plugins used by the pipeline.
  - Include GI typelibs needed by detected imports when available.
- [ ] Improve native project integration.
  - Support clean configure/build/install phases without shell boilerplate.
  - Add standard environment variables for source dir, build dir, install prefix,
    target arch, and sysroot.
  - Better distinguish native dependencies installed into a sysroot from native
    project artifacts staged into the app.
- [ ] Improve Windows/MSYS2 parity.
  - Cache reporting and prune support for MSYS2 package caches/sysroots.
  - Better diagnostics for missing DLLs and missing typelibs.
  - Verify generated CMake/Meson cross files across `mingw64`, `ucrt64`, and
    `clang64`.
  - Add support for Windows architecture selection if needed later.
- [ ] Improve NSIS output quality.
  - Add optional version fields.
  - Add publisher and URL metadata.
  - Add optional per-machine install mode.
  - Add code-signing hooks for installer and executables.

## P2 Functionality

- [ ] Add non-Debian Linux sysroot providers.
  - Keep `linux.sysroot` as the generic abstraction.
  - Explore providers for Fedora/RPM, Arch/pacman, Alpine/apk, or OCI/container
    export.
  - Avoid hard-coding Debian assumptions outside `linux.deb.*`.
- [ ] Add optional container backend.
  - Useful for users who want full distro isolation instead of apt index setup.
  - Keep it optional; do not make Docker/Podman a requirement for normal use.
- [ ] Add reproducibility controls.
  - Stable timestamps where possible.
  - Manifest field for package version pins or apt snapshot source.
  - Record build tool versions in reports.
- [ ] Add license/reporting support.
  - Collect package licenses when metadata is available.
  - Emit a third-party notices skeleton.
  - Warn about large or risky runtime bundles.
- [ ] Add size analysis.
  - Show largest staged files and packages.
  - Identify duplicate libraries/assets.
  - Suggest optional plugin/theme trimming.
- [ ] Add installable completion/help output.
  - Shell completions for common options.
  - `sqgipkg help manifest` for manifest fields.
  - `sqgipkg help caches` for cache layout and pruning.

## Testing Strategy

The test suite should have three layers:

- Fast module tests that run in seconds and do not require network.
- Integration tests that build small real packages on the host.
- Slow cross-target tests that can run in CI jobs with prepared caches and
  target toolchains.

## P0 Tests

- [ ] Keep `tools/sqgipkg_tests/test_modules.nut` fast and deterministic.
  - Manifest parsing and merge rules.
  - Option parsing and aliases.
  - Debian dependency parser.
  - Virtual dependency provider selection.
  - `Architecture: all` package handling.
  - Sysroot cache key/path behavior.
  - Shell environment export behavior.
  - Windows package dependency parser.
  - NSIS escaping.
- [ ] Add fake apt resolver fixtures.
  - Fixture input from `apt-cache show`.
  - Fixture input from `apt-cache depends`.
  - Tests should run without host apt indexes.
  - Include virtual dependencies, alternatives, arch-qualified dependencies,
    epochs in versions, and architecture-all packages.
- [ ] Add real Linux sysroot smoke tests.
  - Use a tiny package such as `zlib1g`.
  - First run extracts packages.
  - Second run reuses sysroot metadata without re-extracting.
  - Refresh run re-extracts.
  - Explicit `linux.sysroot` bypasses the shared cache.
- [ ] Add pkg-config preflight tests.
  - Missing direct module.
  - Missing transitive module.
  - Correct sysroot env passed to pkg-config.
  - Error message differs when `linux.deb.download` is enabled.
- [ ] Add full GTK/GStreamer overlay verification.
  - x86_64 AppImage builds.
  - aarch64 AppImage builds with generated Linux cross files.
  - Windows NSIS builds with generated MinGW cross files.
  - Outputs are written under target-specific directories.
  - No host target multiarch install is required for Linux runtime/dev packages.

## P1 Tests

- [ ] Expand fixture projects.
  - Simple script app.
  - GTK app.
  - GTK + GStreamer app.
  - Native GObject library app.
  - Native Vala library app.
  - Native executable entrypoint app.
  - Theme/icon/data-heavy app.
- [ ] Add staging correctness tests.
  - Compiled `.cnut` files are present.
  - Compatibility `.nut` links/copies work.
  - Local imports are discovered recursively.
  - Resources land under expected directories.
  - Manual file destinations are honored.
  - Native libraries and typelibs land in expected runtime paths.
- [ ] Add Linux ELF dependency closure tests.
  - Copies non-system shared libraries.
  - Skips glibc/loader/system libraries.
  - Resolves from sysroot before host paths for target builds.
  - Handles symlinked sonames.
  - Warns but does not crash on unresolved optional libraries when appropriate.
- [ ] Add Windows DLL dependency closure tests.
  - Parses PE imports.
  - Resolves DLLs from the MSYS2 prefix.
  - Handles case-insensitive DLL names.
  - Reports unresolved DLLs clearly.
- [ ] Add generated cross-file tests.
  - Linux CMake toolchain contains target triplet and sysroot.
  - Linux Meson cross file contains target machine and pkg-config libdir.
  - Windows CMake toolchain contains MinGW compiler paths.
  - Windows Meson cross file contains prefix and pkg-config settings.
- [ ] Add doctor tests.
  - Missing script.
  - Missing build outputs.
  - Suspicious host paths.
  - AppImage arch/build_dir mismatch.
  - Missing package indexes for requested Debian arch.
  - Stale build dir compiler mismatch.
- [ ] Add docs/example tests.
  - Every `sqgipkg.json` under tests parses.
  - Every template parses.
  - README command snippets that are meant to run are smoke-tested where
    practical.
  - No stale top-level `linux.deb.packages` examples in multi-arch manifests
    unless explicitly documented as shared defaults.

## P2 Tests

- [ ] Add performance tests.
  - Measure resolver time for small and GTK/GStreamer package closures.
  - Measure cold sysroot extraction time.
  - Measure warm sysroot reuse time.
  - Track AppDir staging time and final AppImage size.
- [ ] Add cache stress tests.
  - Concurrent projects using the same sysroot cache.
  - Interrupted extraction and recovery.
  - Partially written metadata.
  - Changed apt metadata for an existing package.
  - Cache prune while another run is active should be prevented or safe.
- [ ] Add CI matrix.
  - Ubuntu host native x86_64 AppImage.
  - Ubuntu host aarch64 Linux cross build.
  - Ubuntu host Windows MinGW build.
  - Optional Windows host packaging smoke test.
  - Optional Fedora/Arch host test for non-Debian host behavior once supported.
- [ ] Add release smoke tests.
  - Installed `sqgipkg` launcher imports installed modules, not source-tree
    modules.
  - Source-tree `build/sqgi tools/sqgipkg` works without install.
  - `sqgipkg --help` lists every documented option.
  - `sqgipkg --init <template>` writes valid manifests.

## Documentation TODO

- [ ] Split `tools/README.md` when it becomes too large.
  - User quick start.
  - Manifest reference.
  - Linux sysroot/backend guide.
  - Windows/MSYS2 guide.
  - Native project guide.
  - Troubleshooting guide.
- [ ] Add troubleshooting pages.
  - Apt cannot see `arm64` packages.
  - pkg-config finds host modules.
  - AppImage runs on build host but not clean host.
  - GStreamer plugin missing.
  - GTK theme/icon/typelib missing.
  - CMake reused a stale compiler.
  - Windows DLL could not be resolved.
- [ ] Add cache documentation.
  - What lives under `~/.cache/sqgipkg`.
  - How to move caches.
  - How to safely delete caches.
  - What `refresh` does and does not do.
- [ ] Add example manifests for common app shapes.
  - Minimal script.
  - GTK-only.
  - GTK/GStreamer.
  - Native GObject library.
  - Native executable.
  - Linux multi-arch plus Windows all-target build.

## Quality Gates Before Calling sqgipkg Stable

- [ ] `sqgipkg --target all` works for at least one GTK app across x86_64 Linux,
  aarch64 Linux, and Windows from a single manifest.
- [ ] No required workflow asks users to install target GTK/GStreamer packages
  into the host root.
- [ ] Cold and warm sysroot behavior is tested.
- [ ] AppImage smoke tests work for native-arch outputs.
- [ ] Cross-arch outputs skip smoke tests with a clear reason.
- [ ] Windows NSIS output can install and uninstall on a clean Windows machine.
- [ ] All test manifests and templates are current with the documented manifest
  model.
- [ ] Main docs explain Debian-specific versus generic sysroot concepts.
- [ ] Error messages for the top five expected user failures are actionable.

## Known Design Questions

- Should Debian sysroots represent the full runtime/dev dependency closure, or a
  curated packaging closure that avoids target build tools?
- Should sysroot cache keys include only distro/release/arch, or also the seed
  package set for stronger isolation?
- Should `--target all` build Linux architectures sequentially forever, or allow
  parallel target builds once cache locking exists?
- Should GStreamer plugins be inferred from common pipeline strings, manually
  declared, or both?
- Should non-Debian package providers be first-class, or should external sysroot
  generation remain the recommended path for non-Debian hosts?
- How much reproducibility should sqgipkg own versus delegating to distro package
  snapshots and project build systems?
