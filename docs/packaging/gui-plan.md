> Scope update (2026-09-25): manifest authoring is the current delivery.
> Package execution is deferred and, if implemented, must invoke `sqgipkg`.
> The [requirements tree](../../tools/sqgipkg_gui/requirements/README.md) supersedes
> the broader original plan below.

# sqgipkg GUI plan

Status: proposed implementation plan, 2026-09-25. This document does not add a GUI
or change the manifest format.

Build a native SQGI/GTK 4 application, provisionally named **SQGI Packager**,
launched as `sqgipkg-gui`. It helps someone create a useful `sqgipkg.json`, reopen
an existing project without losing settings, and build the same package as the
CLI. The manifest remains the portable project format.

## Product decisions

- A short new-project assistant opens into a persistent project editor. Returning
  users can go directly to any section without repeating the assistant.
- Common controls are visible first; advanced controls live with the feature
  they affect. Search finds both friendly labels and exact manifest keys.
- All supported manifest fields and CLI operations have a documented UI home.
  Aliases share a control rather than becoming duplicate switches. An editable
  JSON view is available throughout, but is not the entire advanced interface.
- Saving a useful manifest is a complete workflow. Building, downloading
  dependencies, and running the packaged application are separate actions.
- Use Squirrel, GTK 4, and GIO. Keep GTK out of the CLI dependency path. Start
  with GTK text widgets; GtkSourceView can enhance JSON editing if available.
- JIT and typed kernels are standard runtime capabilities. New projects assume
  the default LLVM-backed runtime; the assistant does not offer feature opt-in
  steps or ask users to choose execution backends.
- Support Linux and native Windows hosts. Cross-target availability follows
  the existing CLI: Linux can produce Linux and Windows packages; native
  Windows can produce Windows packages. Do not imply Windows-to-Linux support.

## Existing foundations and gaps

The current [schema](../../tools/sqgipkg.schema.json) has 16 object definitions
and 216 named properties across those definitions, including repeated concepts
and aliases. The [CLI option registry](../../tools/sqgipkg_lib/main.nut) has 95
registered options. These counts describe an inventory, not a proposed number
of visible controls.

Reuse:

- Version-2 `features`, `native`, `runtime`, and `platforms` declarations.
- Existing templates, import scanning, path rules, architecture overlays,
  native recipes, package selection, and lock/provenance handling.
- `check`, `explain`, `build`, `clean`, and existing test fixtures.

Required backend work:

- Validation and explain currently print human-readable text. Refactor their
  results into structured data with both text and JSON renderers.
- The JSON schema and Squirrel schema validator overlap but are separate.
  Audit their field/type/alias coverage and add parity checks before deriving
  editor controls from them. Backend validation remains authoritative.
- Builds use synchronous subprocess operations. Run the CLI in a child process
  so packaging never blocks GTK; add structured progress and process-tree
  cancellation support.
- `runtime` currently supports only `sqgi`, `source`, and `jit`. Its recipe
  explicitly sets `SQ_ENABLE_JIT`, while backend/kernel choices inherit CMake
  settings. Update the recipe to explicitly apply the default JIT and kernel
  settings so cached build settings cannot silently disable either capability.

## First-use journey

1. **Choose a project.** Select its directory, or open an existing manifest.
   Suggest `main.nut` when present. Recognize native entrypoints and let users
   choose among multiple manifests. Opening performs local inspection only.
2. **Describe the application.** Name, application ID, entrypoint, optional icon,
   and console/desktop intent. Offer simple, GTK 4, GTK 4 + GStreamer, native
   GObject, and Vala starting points using the existing templates. Show detected
   imports as suggestions with their source file; keep manual feature selection
   available for dynamic imports.
3. **Choose outputs.** Linux AppImage and/or Windows directory/installer, target
   architectures, and output directory. Default to the current host's supported
   output. Expose baseline, dependency, and runtime choices only when needed.
4. **Review and save.** Show what will launch, selected outputs, included files,
   runtime source, and outstanding issues. Save an ordinary version-2 manifest.
   Offer **Save & Build** as a separate action when preflight succeeds.

Use the same controls and document model in the assistant and project editor.
Allow navigation back, partial drafts, and skipping optional configuration.
Build-tool availability must not prevent creating or saving a manifest.

## Project editor

Header: project name and unsaved indicator; **Save**, **Check**, **Build**.
Left sidebar: the sections below. Main area: section controls. A collapsible
bottom panel contains Problems, Build log, and Artifacts. A selected-target
control changes effective previews without silently editing the manifest.

| Section | Common controls | Advanced controls |
| --- | --- | --- |
| Application | Name, app ID, entry script/native executable, features, icon | Per-platform entrypoints, desktop categories, console behavior, explicit script mappings |
| Files | Resources and script directories; detected import list; source/destination preview | Exact file rules, includes/excludes, glob/regex, optional files, libraries, typelibs, GSettings, GTK data, GIO modules, pixbuf loaders, GStreamer plugins |
| Targets | Linux/Windows outputs, architectures, output location, Windows format | Linux architecture overlays and inheritance, package suite/sysroot, dependency search/copy settings, MSYS2 root/prefix/repository, toolchains, dependency/build packages, AppImage and NSIS tool locations |
| Runtime & native code | Standard runtime version/source; reuse a build or build a revision; local/Git native projects; Meson/CMake | Runtime/source/build paths, ref/branch/tag/commit, caches/update/submodules, native options/targets/staging, host GI metadata, explicit outputs, ordered build/install hooks and environment; existing explicit runtime overrides |
| Appearance & installer | Icon, theme, fonts, dark preference; installer name, license, shortcuts | Per-platform GTK settings, GDK backend, Windows font registration, installer images/directory/privilege level, Start Menu folder, autostart and uninstall registration |
| Review & build | Target summary, readiness, package contents, Check, Build, artifacts | Per-run target overrides, dependency locking, refresh/cache options, retained AppDir, smoke-test arguments/isolation, sysroot-only builds, NSIS script-only output, clean |
| Manifest | Editable JSON, diagnostics, diff, copy CLI command | Legacy aliases, unsupported/future data inspection, explicit migration preview |

Details that keep the interface usable:

- Each section starts with a short summary and a small number of common fields.
  Advanced expanders show a count when they contain configured values.
- Search opens the matching section, expands its group, and focuses the field.
- Use file/folder selectors, ordered list editors, source/destination tables,
  package lists, and structured argument/environment editors as appropriate.
- Optional booleans need **Default / On / Off** when omission is meaningful.
  A default value is not automatically written into the manifest.
- Overrides show **Inherited** or **Set here**, their effective value, and
  **Reset to inherited**. Preserve the backend's actual list merge/replace rules.
- Generated outputs can be marked **Available after build** rather than reported
  as missing input files. Distinguish detected, explicitly included, and
  unresolved files; a static preview cannot discover arbitrary dynamic imports.
- Advanced fields have brief help and links to the corresponding reference.
  Package baseline selection describes dependency selection, not a compatibility
  certification.

## Complete option coverage

Create a catalog keyed by schema definition/property and CLI operation, with:
section, label, help, widget kind, common/advanced placement, aliases, applicable
targets, and whether the value belongs in the manifest or a single invocation.

Use hand-designed controls for the common workflow and nested recipes/file rules.
A schema-backed property editor covers less common scalar/list/object settings.
Search indexes both. Every current property must have a mapped control or an
explicit alias/metadata classification; a generic JSON tab alone does not count
as completing normal field coverage.

Canonical fields are used for newly created manifests. Existing aliases remain
unchanged unless the user explicitly migrates them. Per-run actions such as
`--locked`, `--write-lock`, smoke tests, and NSIS script-only generation remain
invocation settings; do not invent corresponding manifest keys. Persist local
UI preferences in the user configuration directory, separately from the project.

Maintain an automated coverage check against the schema and CLI registry so new
backend fields cannot quietly become inaccessible in the GUI. Reserved,
unimplemented targets `appdir` and `tarball` are not offered as build outputs.

## Document model and file behavior

Keep the authored JSON document separate from resolved packaging options. The
resolver expands paths/defaults/overlays for preview; saving uses the authored
document and must not serialize that expanded result back over the user's file.

- Preserve values, aliases, unknown fields, explicit false/null, array order,
  string-versus-object forms, and all settings outside the field being edited.
- A no-op save leaves the file untouched. Changed saves may normalize JSON
  whitespace; show a diff and use stable formatting. Semantic preservation is
  required; byte-for-byte formatting after arbitrary edits is not a v1 promise.
- Keep paths relative to the manifest where practical. Saving into a different
  directory must explicitly rebase references or retain their resolved meaning.
- Forms and JSON share one undo history. Apply parsed JSON atomically; invalid
  text remains in its buffer with line/column errors and does not replace the
  last valid model. Disable stale-form edits/builds until it is fixed or reverted.
- Preserve legacy/unrecognized fields when opening. Version-2 unknown fields
  still receive the CLI's validation error; retaining data does not mean it is
  accepted by the packager. Migration is explicit and previewed.
- Use atomic saves, detect external edits before replacement, and offer reload
  or reconciliation. Save drafts even when semantic validation has errors.
- Build a saved manifest revision. **Save & Build** makes that relationship
  explicit; record its digest so later edits cannot be mistaken for tested input.

## Backend interface

Add a versioned machine interface to the existing CLI. The command spellings
below are proposals, not currently available flags:

```text
sqgipkg describe --json
sqgipkg check --json --manifest sqgipkg.json
sqgipkg explain --json --manifest sqgipkg.json
sqgipkg build --manifest sqgipkg.json --events-file <temporary-jsonl-file>
```

`describe` returns protocol/schema version, supported fields/features/templates,
CLI actions, and host/target capabilities. Use the protocol version to reject
incompatible GUI/CLI combinations clearly.

`check` returns diagnostics with severity, stable code, JSON path, target,
message, and any relevant file/tool path. Split cheap schema validation from
explicit filesystem/compiler preflight. Neither mode fetches dependencies,
executes user build hooks, or starts packaging.

`explain` returns per-target effective settings, sources of defaults/overrides,
runtime selection, native recipes, commands, detected dependencies, outputs,
and a file preview. Mark unknown build-generated contents as unresolved. Preview
unsaved documents through a stdin/document API with an explicit base directory;
do not move the manifest to `/tmp` and change relative-path behavior.

Refactor `doctor`, `explain_one`, and their target iteration to produce these
objects once. Preserve existing text output for CLI users and existing callers.
Carry authored field paths through normalization so errors link to the right
control even when aliases and architecture overlays are involved.

For build progress, write JSONL events to a dedicated file or channel separate
from child stdout/stderr. Events include run ID, target, phase, message,
diagnostics, artifact, and final result. Use stages and actual download counts;
do not fabricate a percentage for compiler or arbitrary hook execution. Always
reconcile events with process exit status and verify the expected artifact.

The GUI launches argument arrays through GIO and streams both output pipes
asynchronously. Keep bounded visible logs and an on-disk complete log. Existing
shell hooks remain explicitly identified as shell commands; portable hooks use
argv/environment editors.

Cancellation must stop the entire build process tree and wait for cleanup,
including compilers/downloaders. Investigate POSIX process groups and Windows
Job Objects in the initial integration spike; add a small native process helper
if GIO alone cannot provide this contract. A cancelled run is never a success.
Serialize builds that share output/cache mutation paths.

## Runtime capabilities

JIT and typed kernels are part of the standard runtime. The common workflow
chooses a runtime version/source, not which execution features to enable. Use
the project's default LLVM backends and include their runtime dependencies in
the package automatically.

Make the default runtime recipe explicit about `SQ_ENABLE_JIT=ON`,
`SQGI_ENABLE_KERNELS=ON`, `SQGI_BYTECODE_JIT_BACKEND=LLVM`, and
`SQGI_KERNEL_BACKEND=LLVM`. Apply these settings when reconfiguring an existing
build directory as well as creating a new one. Preserve and identify an existing
manifest's explicit override, such as `runtime.jit=false`, in advanced settings;
do not silently rewrite it or use it as the default for new projects.

Show runtime identity and architecture in the normal summary. Put detailed
backend/build information in an expandable diagnostics panel. Missing LLVM
dependencies or a reused binary lacking standard capabilities are actionable
preflight issues, not reasons to silently produce a reduced-feature package.
Generated runtimes can remain pending verification until their build completes.

Add structured build information for SQGI binaries/builds as needed. The GUI's
own runtime is distinct from the runtime being packaged. Cross-target binaries
must be inspected through build metadata or a compatible execution environment;
do not launch Windows/AArch64 binaries blindly on Linux x64. Record requested
and verified build settings separately in build results.

## Proposed source layout

```text
tools/sqgipkg-gui                  GUI entrypoint
tools/sqgipkg_gui/
  app.nut                        GTK application and window
  document.nut                   authored document, edits, undo, saves
  catalog.nut                    labels, grouping, control metadata
  backend.nut                    protocol client and async jobs
  widgets/                       reusable list/path/recipe editors
  pages/                         editor sections and setup flow
  assets/                        app icon and optional styling
tools/sqgipkg_lib/                shared resolver/diagnostics/event changes
tools/sqgipkg_gui_tests/          document, protocol, and UI tests
```

Install the GUI launcher and resources through CMake alongside the existing
tools, with an opt-out installation setting. CLI installation/execution must
continue working without GTK. Provide a Linux desktop entry and Windows GUI
launcher/shortcut. Package the GUI itself using a checked-in sqgipkg manifest.

## Implementation stages and acceptance

| Stage | Deliverable | Completion condition |
| --- | --- | --- |
| 1. Backend contract | Field/alias inventory, structured describe/check/explain, runtime-capability probe, async/cancellation spike | GUI and CLI obtain identical effective plans; inspection has no fetch/build side effects; required GTK/GIO APIs work on both host platforms |
| 2. Useful manifest editor | New/open/save, four-step setup, common section controls, shared model, JSON/diff, diagnostics | A simple script and GTK application produce useful CLI-valid manifests; legacy fixtures survive open/edit/save with unrelated values preserved |
| 3. Full configuration | All catalog mappings, file rules, native recipes/hooks, target overlays, packages, appearance/NSIS | Schema/CLI coverage audit passes; representative RFDTool, FoamCutter, StlViewer, and RouteTastic manifests are editable without hand-rebuilding them |
| 4. Build workflow | Preflight, queued target jobs, progress/logs/cancel, lock controls, output verification, artifact actions | Real Linux AppImage and Windows directory/NSIS workflows work on supported hosts; failures/cancellation stay responsive and leave accurate results |
| 5. Distribution | Own packaging manifest, installed launchers, accessibility, help, integration CI | Packaged GUI can create/save/build a sample application; acceptance matrix below passes |

Stages 1 and 2 are the first useful increment. Stages 3 through 5 complete the
requested full tool. Estimates should follow the first integration spike; process
cancellation, binding coverage, and preserving legacy manifests are the main
uncertainties.

## Validation and release criteria

- Run corpus tests over every bundled template and example manifest: no-op save,
  a single-field change, aliases, unions, explicit defaults, unknown data, and
  architecture-specific overrides. Assert semantics and changed-field scope.
- Compare GUI-generated invocations/resolved plans with direct CLI calls. Cover
  paths containing spaces and Unicode, Windows drives, Save As, invalid JSON,
  external file changes, and lock invalidation after manifest edits.
- Integration-test structured error paths, missing LLVM/NSIS/runtime tools,
  nonexistent local inputs versus generated outputs, unsupported targets, failed
  downloads/build hooks, noisy stdout/stderr, and cancellation with grandchildren.
- Start a runtime-recipe test with stale cached native-JIT/kernel-disabled
  settings and verify that the standard recipe rebuilds with LLVM JIT and typed
  kernels enabled. Verify intentional legacy overrides remain explicit.
- Test process handling with deterministic fake CLI fixtures; additionally build
  real sample packages. A mock success event is not evidence of a working package.
- Linux GUI smoke tests use a virtual display. Run native Windows launch/save,
  process, Unicode path, directory packaging, and NSIS checks on Windows CI.
- Exercise keyboard-only operation, labelled controls, focus navigation to
  errors, high-DPI scaling, and long lists/logs. Status must not rely only on color.
- Demonstrate a minimal script, GTK app with assets, GTK/GStreamer app, native GI
  dependency, and multi-architecture project. Cross-architecture execution is
  recorded separately from successful package creation.
- Report the exact tested runtime/backends and package targets for every release.
  Only claim platforms and capabilities actually exercised.

## Scope boundaries

Keep v1 focused on manifest authoring and local package builds. Remote build
servers, publishing, CI workflow editing, project source editing, and a general
IDE are later features. Show or copy the CLI command so an authored project can
already be used from a terminal or CI without the GUI.

No new version/author/update-service fields are assumed: the current manifest
does not define them. Add product metadata only through an explicit CLI/schema
change if it becomes required.

## References

- [Simple manifests](10-simple-manifests.md)
- [Complete field reference](../../tools/README.md)
- [Manifest loading](../../tools/sqgipkg_lib/manifest.nut)
- [Schema validation](../../tools/sqgipkg_lib/schema.nut)
- [Current diagnostics](../../tools/sqgipkg_lib/doctor.nut)
- [Recipes and explain output](../../tools/sqgipkg_lib/recipes.nut)
- [Target selection](../../tools/sqgipkg_lib/build.nut)
- [Build provenance](../../tools/sqgipkg_lib/provenance.nut)
- [GTK 4 recipes](../recipes/gtk4.md)
