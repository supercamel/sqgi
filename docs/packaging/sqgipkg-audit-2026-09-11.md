# sqgipkg usability and host portability review

> Implementation follow-up: the findings below describe the original audit
> snapshot. The task-oriented CLI, version 2 manifests, native build recipes,
> target-specific validation, native Windows launcher/host operations, strict
> installer completion, dependency locks and build reports are now implemented.
> See [the current interface](10-simple-manifests.md) and
> [migration candidates](examples/README.md). Native Windows usage is through
> PowerShell/CMD; an MSYS2 shell is not required.

Validation after implementation:

- Full Linux packaging suite passed, including native GI payloads, Windows
  staging/NSIS fixtures, viewer and GTK-theme AppImage smoke tests.
- Module/platform tests and 14 focused CLI, recipe, process, PE and lock
  regressions passed. Import/system runtime tests passed through CTest.
- All five templates and all four migration candidates validate against the
  JSON Schema. Each candidate resolves from its application directory.
- Windows SQGI and sqgipkg executables cross-compiled successfully. Under Wine,
  the native launcher packaged an application from a path containing spaces
  and non-ASCII characters; the packaged application ran through CMD.
- gserial, StlViewer's native extension and gscenegraph produced Windows DLLs
  and typelibs through the new recipes; host-GIR conversion was exercised for
  the first two.

Remaining acceptance work: execute the added PowerShell workflow on an actual
Windows runner, validate installer install/uninstall and GUI behavior there,
exercise another Linux host distribution, and compare full application releases
across all declared architectures. The application `sqgipkg.v2.json` files are
candidates; original release manifests have not been replaced. Windows-to-Linux
packaging remains a separate optional backend. Locks cover fetched source and
package inputs, not the complete build environment or bitwise reproducibility.


Reviewed 2026-09-11 at SQGI commit `51634e5`. Scope: the current packaging implementation, CLI, templates, documentation, tests, and local usage in RFDTool, FoamCutter, StlViewer, and RouteTastic. This is an audit and proposed direction, not an implementation or a certification of supported platforms.

The main simplification opportunity is to move standard runtime and native-library build recipes into sqgipkg. Reducing help text alone would leave most of the real work with application authors. Windows packaging already exists; running the packager on Windows needs a coherent host execution layer and native-host validation.

## Evidence from applications

Counts are from the local manifests as reviewed, including formatting. Build commands count every string in a `build` array recursively, including repeated target recipes.

| Application | Manifest lines | Build commands | Main burden |
| --- | ---: | ---: | --- |
| RFDTool | 164 | 25 | Repeated SQGI/gserial builds, architecture overlays, host GIR build and Windows library-name rewriting |
| FoamCutter | 231 | 29 | Two native libraries, duplicated architecture recipes, long Linux/Windows package lists, installer configuration |
| StlViewer | 153 | 17 | Local native-library wrapper, repeated runtime builds, host-generated typelibs and Windows GIR rewriting |
| RouteTastic | 147 | 1 | Custom launcher, prebuilt runtime and explicit payload/provenance layout; much of its build process lives outside the manifest |

RFDTool's release workflow uses Ubuntu 22.04; StlViewer's uses Ubuntu 24.04. Both cross-build Windows installers from Linux. These workflows do not demonstrate a Windows-host build. The first three manifests pin different SQGI revisions, so their workarounds are historical usage evidence: do not assume every workaround is still necessary at current master.

RouteTastic is a useful counterexample to a script-only design. Its `entry.type = native` is a Bash wrapper around SQGI and other application tooling. It deliberately stages runtime provenance, sources, Python helpers, MIME data and fonts. Preserve an explicit payload and custom-entry route when simplifying the common case.

## Prioritized findings

### 1. High: native Windows execution is incomplete at the shell boundary

Evidence:

- `tools/sqgipkg.sh.in` installs a POSIX shell launcher.
- `tools/sqgipkg_lib/core.nut:52` implements POSIX single-quote escaping; shell execution uses `system()`, `cd … && …`, shell assignments/exports, and `/dev/null`.
- `Squirrel3/sqstdlib/sqstdsystem.cpp:37` delegates Squirrel `system()` to the C runtime.
- Windows staging itself runs `rm -rf` (`windows/staging.nut:602`), and shared staging uses `cp`, `find`, and other Unix commands.
- `windows/env.nut:352` skips cross setup on Windows; `windows_env_prefix()` at line 483 returns an empty string. This also omits the build/source environment supplied on Linux, while the application manifests depend on it.
- `manifest.nut:20` defaults to AppImage regardless of host. `options.nut` defaults the MSYS2 prefix to `mingw64`, while the native prerequisite installer defaults to UCRT64 when no environment selects otherwise.

Microsoft documents that native Windows `system()` locates CMD.exe through COMSPEC/PATH. Launching the parent program from Bash does not establish that its internal `system()` calls use Bash. This is a source-based blocker assessment; no Windows machine was used to reproduce execution here. See [Microsoft's system documentation](https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/system-wsystem?view=msvc-170).

Recommendation: separate host OS, command interpreter, compiler environment, target OS and target architecture. Provide structured process execution with argv/cwd/environment, portable file operations, and explicit Bash execution for legacy shell recipes. A launcher change alone is insufficient.

### 2. High: application authors maintain infrastructure recipes

The three script applications repeatedly remove build directories, configure/build SQGI, select Meson cross files, list native output filenames, and repair GIR generation. `build.nut:34` and `windows/env.nut:511` execute these supplied commands; the tool provides environment plumbing but leaves routine recipes to users.

Recommendation: add built-in SQGI runtime and Meson/CMake project recipes, isolated build directories per target, and a supported GI generation strategy. Consume declared install outputs where possible. Preserve explicit custom build commands for projects that require them. Cross GIR generation needs explicit testing: simply renaming `.so` to `.dll` or reusing a host typelib is not a universal strategy.

### 3. High: validation can report success for unusable configurations

Reproduced with `build/sqgi tools/sqgipkg --manifest <temporary-file> --doctor`:

1. A manifest containing `"resoruces": ["missing-assets"]` exits 0. The misspelled key is silently ignored.
2. A `win-dir` manifest with a missing `windows.native_projects[].dir` and `build: ["false"]` exits 0. Doctor does not check that Windows project and instead warns about missing `libsqgi.so.1` and appimagetool.

The probes contained a valid minimal `main.nut`. They did not execute the deliberately failing build command. Doctor should validate its project configuration, not run arbitrary build hooks.

Evidence: field-by-field loading in `manifest.nut:58`; host/Linux-oriented checks in `doctor.nut:120`, especially its final runtime/tool checks. Architecture-specific native project payloads also need coverage in a target-aware validator.

Recommendation: introduce a versioned schema and precise key/type errors, plus validation against the resolved target configuration. Warn about unknown keys in legacy manifests; reject them in a new strict schema. Report a future generated output differently from a missing required source, and allow a missing checkout when a valid fetch declaration will create it.

### 4. High: Linux target distribution depends on the host distribution

`linux_deps.nut:679` reads the host's `/etc/os-release`. Even with an explicit target suite, `linux_deb_repo_targets()` only creates repository targets when host `ID` is `ubuntu`. Package extraction requires `dpkg-deb` (line 1701), and installed-package discovery uses apt/dpkg tools. Same-architecture builds can still use the host compiler/runtime; declaring a dependency suite alone does not guarantee the application's minimum glibc version.

This supports the Ubuntu-centric concern, but there is no inspected hard allowlist restricting all execution to exactly 22.04 and 24.04. Other paths can use supplied sysroots or host files. Those paths were not tested across distributions in this review.

Recommendation: explicitly model the target distribution/baseline independently of host detection. Keep Ubuntu as an initial target backend if desired, but make backend requirements explicit. A managed Linux build environment is a possible later route from Windows or other hosts; it should be an explicit backend, with its toolchain and baseline recorded.

### 5. Medium: help exposes the entire implementation surface

`main.nut` registers 91 application options, all visible in the default help. It mixes routine packaging with cache locations, sysroot preparation, cross-toolchain paths, runtime assets and NSIS presentation. It also advertises `appdir` and `tarball`, which dispatch rejects as unimplemented (lines 230–232).

The five starter templates and automatic script/import discovery are useful existing foundations. In particular, the GTK template is already small. However, a small starting file does not explain the jump to a multi-target native-extension release.

Recommendation: show a short task-oriented default help, move specialized switches into topic help, hide aliases from the main view, and remove unavailable targets from advertised choices. Generate option registration, parsing metadata and reference documentation from one definition where practical.

### 6. Medium: a successful installer command may produce no installer

`build.nut:191` stages the application and writes the NSIS script, then returns normally if makensis is unavailable. This behavior is documented, but `--target win-nsis` can therefore exit successfully without the requested `.exe` artifact.

Recommendation: make installer generation require its final artifact. Offer script-only generation explicitly, and check required tools before expensive staging. Include target, artifact path and completion status in machine-readable output.

### 7. Medium: reproducibility requires application-specific work

RFDTool, FoamCutter and StlViewer pin SQGI, but remote native projects may track branches with `update: true`. Package downloads resolve repository state, and no dependency lockfile mechanism was found in the packaging modules. RouteTastic independently stages provenance and runtime sources.

Recommendation: record resolved source commits, runtime/tool versions, target ABI, package versions and content hashes in a lockfile/build report. Keep updating dependencies explicit. A lock must also identify how pinned artifacts remain retrievable; recording versions alone cannot preserve a disappearing package archive.

## Proposed user interface

These examples describe a future interface; they are not accepted syntax today.

```text
sqgipkg init
sqgipkg check
sqgipkg build
sqgipkg build --platform windows
sqgipkg explain
```

`build` should select the host's normal artifact unless the project declares a default. `explain` should show the resolved runtime, native projects, packages, build commands, output and why each dependency was included, without building or fetching. Preserve existing command forms during migration.

An illustrative RFDTool common configuration could be:

```json
{
  "schema_version": 2,
  "name": "RFDTool",
  "app_id": "com.github.supercamel.rfdtool",
  "icon": "images/com.github.supercamel.rfdtool.png",
  "runtime": { "sqgi": "<pinned-version-or-commit>" },
  "features": ["gtk4"],
  "native": [
    {
      "name": "gserial",
      "source": "https://github.com/supercamel/gserial.git",
      "build_system": "meson"
    }
  ],
  "platforms": {
    "linux": { "architectures": ["x86_64", "aarch64"], "baseline": "ubuntu-22.04" },
    "windows": { "architectures": ["x86_64"], "format": "installer" }
  }
}
```

The lockfile would pin gserial's resolved source. Standard project recipes would own build commands and staging. This sketch is not a behavior-equivalent conversion: categories, Windows ICO, JIT preference and any required GI workaround must also be preserved or deliberately represented by defaults/overrides. Prove the model with a complete conversion before finalizing the schema.

Use feature declarations to select maintained platform package mappings, supplementing existing static import detection. Dynamic imports, plugins, themes and custom native libraries still need explicit declarations. Allow narrowly scoped platform overrides for unusual needs. Do not force RouteTastic's payload rules into the beginner configuration model.

## Windows rollout and acceptance criteria

1. **Establish Windows x64 → Windows packages using MSYS2.** Implement process/file/path handling, native runtime discovery, environment propagation and host-appropriate defaults. Detect and validate the MSYS2 toolchain/prefix; do not reuse the Linux MinGW cross profile for native UCRT64. MSYS2 identifies UCRT64 as its default environment and documents the distinct environments and runtimes: [MSYS2 environments](https://www.msys2.org/docs/environments/).
2. **Test on a real Windows runner.** Cover help/init/check, a plain script, GTK assets and DLL closure, one native GI library, and NSIS install/uninstall. Run the packaged application outside the build shell without developer paths. Include spaces, non-ASCII paths and Windows drive paths. The existing Bash test harness uses Linux tools and AppImages; retain it for Linux and add focused native Windows coverage.
3. **Make launch from PowerShell/CMD convenient.** Supply a Windows launcher that discovers the managed toolchain or reports actionable setup instructions. Users should not need to understand shell conversion merely to package a standard app.
4. **Add Windows → Linux separately if wanted.** Use a declared Linux execution backend and verify produced binaries against their target baseline. Keep unsupported host/target combinations explicit; a Windows installer milestone should not imply native AppImage production on Windows.

## Suggested implementation order

1. Fix misleading help, manifest diagnostics, target-aware doctor and installer completion semantics; add regression tests for the two reproduced doctor gaps.
2. Introduce the host process/file layer with Linux regression coverage and a Windows native packaging fixture.
3. Add runtime/Meson/CMake recipes and a resolved-plan representation. Use a complete RFDTool migration to demonstrate the reduction in configuration while preserving artifacts.
4. Convert FoamCutter and StlViewer; verify their GI and architecture-specific behavior. Use RouteTastic to test that custom payload/provenance workflows remain supported.
5. Add lock/build reports, broader Linux-host coverage and an optional managed Linux backend.

Avoid a wholesale rewrite. The existing dependency closure, staging, launchers and installer generation are substantial reusable work. The approximately 8,784 lines of packaging modules form a long inheritance chain across Linux and Windows concerns; gradually extracting host operations and target build plans provides useful boundaries without replacing everything at once.

## Validation limits

Executed the current source CLI with the existing local `build/sqgi` for help and two isolated doctor probes. Read all four local manifests, the two release workflows, representative application helpers, and the relevant packaging implementation and test harness. No app release builds, package downloads, full packaging suite, Windows execution or cross-distro compatibility tests were performed. No application code or manifests were changed. Findings distinguish observed probe results from source-based portability assessments and proposed behavior.
