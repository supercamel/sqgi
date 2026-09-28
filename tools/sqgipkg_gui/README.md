# SQGI Packager

A native Squirrel/GTK 4 manifest authoring tool for `sqgipkg.json`.

## Design authority

1. [Requirements](requirements/README.md) define observable product behavior.
2. [Contracts](contracts/README.md) derive interfaces and invariants from those
   requirements. Contract IDs link implementation and acceptance tests.
3. `src/` contains implementation modules bounded by the contracts.
4. `tests/` verifies contract behavior, including failures and preservation.
5. [Verification](verification.md) records commands, configurations, and limits.

Change requirements first, update affected contracts, implement the smallest
affected modules, and run the corresponding contract tests. Keep behavioral
expectations in tests independent of implementation internals. Do not weaken a
contract simply to make a test pass. A genuine scope change must be recorded in
the requirement and its rationale.

The earlier [GUI plan](../../docs/packaging/gui-plan.md) is design context. This
requirements tree is the implementation authority. JIT and typed kernels are
standard runtime capabilities; the setup flow assumes them.

## Project layout

```text
requirements/     product requirements, organized by subsystem
contracts/        observable interfaces and acceptance obligations
src/              document, catalog, CLI inspection, GTK application
assets/           desktop integration and application icon
tests/            contract acceptance tests and fixtures
verification.md   actual validation evidence, never assumed results
```

Shared CLI changes belong in `../sqgipkg_lib/`; the GUI reuses that engine. The
manifest is the portable project file. UI preferences and transient job files
are not added to it.

Current scope: produce and edit manifests, inspect them through `sqgipkg`, and
build saved manifests through the same CLI on Linux. Review offers **Build
selected packages**, live output, a complete retained log and cancellation.
The installed `sqgipkg-runner` helper must sit beside the selected SQGI runtime;
without it, the GUI explains the limitation and retains Copy packaging command.
Build completion lists CLI-reported output formats, architectures and paths,
checks their presence/type/size, and offers Open folder. Runtime correctness is
still separate. Live progress names the output, architecture and build stage.
Windows supervision remains outstanding; logs and final output reporting work
on Linux.

## Run

Build SQGI normally (LLVM JIT and typed kernels are enabled by default), then:

```sh
tools/sqgipkg-gui [path/to/sqgipkg.json]
# Select another runtime when needed:
SQGI_GUI_RUNTIME=/absolute/path/to/sqgi tools/sqgipkg-gui
```

GTK 4 and its introspection typelib must be installed; on Ubuntu these are
provided by `gir1.2-gtk-4.0`. Installed builds provide `sqgipkg-gui` and a Linux
desktop entry. `-DSQGI_BUILD_PACKAGER_GUI=OFF` omits the editor installation.
The CLI does not load GTK.

Start with **Set up a project**, or **Open a manifest**. Setup explains the
application templates and package formats, starts with a plain Squirrel app,
and ends with a readable summary. Saving opens Review with **Check project** as
the next step.

Application, Files and Targets provide direct controls for names, scripts,
features, extra assets and package outputs, with explanations beside each choice.
**Apply** records text edits in the draft; **Save** writes the manifest. File and
folder pickers appear on path controls. Output choices follow the build host's
capabilities. Advanced configuration preserves custom values, aliases and target
overlays; nested objects also keep unset advanced settings collapsed. Search
matches labels, descriptions and schema keys and opens the matching field or
containing object. Full structured editing and JSON remain available. All edits
share Undo/Redo.

**Application → Use an existing desktop file…** previews your app's name,
desktop ID, description, categories, terminal choice and icon before applying
them. Choose a replacement image if the source icon is unavailable. Use a
project-local icon for portable builds. Only base metadata is imported;
localized entries and desktop actions are not copied. Apply is undoable; Save
writes the manifest.

**Appearance / languages** offers an application theme dropdown: automatic,
Adwaita light, Adwaita dark, or a custom theme name. Choose **Apply theme**, then
**Save**. Custom themes need to be bundled separately.
**Choose languages…** scans a locale folder for compiled gettext translations
and offers language checkboxes. **Apply languages** adds the selected catalogs
to the Linux and Windows package paths. The app must load those catalogs;
this does not translate the app or select the NSIS installer's language.
Existing resource folders are preserved, with a warning if they may already
include unchecked languages.

Setup and Targets offer independent output checkboxes. New projects on Linux
default to **x86_64 AppImage + aarch64 AppImage + Windows NSIS installer**. Choose
any nonempty subset, including both AppImages without Windows. Windows can also
use portable-folder format. Windows hosts default to their supported NSIS output.
The manifest records the selection; **Resolve plan** lists every output and its
folder. Existing automatic or complex legacy configurations are preserved in
Advanced instead of being replaced with new-project defaults.

**Review** runs **Check project** and **Resolve plan** on the current draft through
`sqgipkg`. Validation and plan resolution have independent results; a resolved
plan does not mean checks passed. Errors and warnings lead, with import evidence,
native recipe commands and the CLI reference available in details. Declared
features are distinct from import evidence. Results become stale when the draft
changes. **Copy packaging command** is enabled for a saved, unchanged manifest
and prepares a POSIX shell command on Linux or a PowerShell command on Windows.
Run it from the project directory. Drafts with semantic errors remain saveable;
neither saving nor checking proves the finished package will run elsewhere.

**Save As** previews known path changes for another directory. Opaque build hooks
and unknown fields require an explicit literal-copy choice. Existing destination
files and externally changed files are protected from overwriting.

## Verify

```sh
cmake --build build --target sqgipkg-gui-bin
ctest --test-dir build -R '^sqgi_test_manifest_' --output-on-failure
```

Python is needed for contract checks. On Linux, CMake registers the GTK workflow
test when `xvfb-run` is available. The [verification record](verification.md)
states which platforms and workflows were actually exercised.

In Runtime/native code, Windows package choices support Ooblerg and the existing
MSYS2 workflow. New projects use Ooblerg for Windows; opened manifests keep their
previous settings. Search Ooblerg packages opens a catalog with name/description/
tag filtering, versions and dependencies. Browsing fetches metadata only.
Add selects a dependency; it is downloaded when sqgipkg builds. Native library
forms offer the same picker for a prebuilt Windows alternative while keeping
the Linux source recipe. A separate Windows SQGI choice can use the prebuilt
runtime. Actual target execution remains necessary after building.

**Add native library… → New to native modules? See an example…** opens an
offline guide with a complete Vala GObject library, Meson build file, Squirrel
consumer and matching form values. It explains development dependencies and
the independent prebuilt Linux and Windows alternatives. Source text is selectable; the guide does
not create files or modify the manifest. Its exact example is compiled and
exercised by `tests/study/verify_native_guide.py`.


Linux prebuilt libraries are available under **Runtime/native code → Linux
packages**. Search either the x86_64 or aarch64 Ooblerg catalog; these optional
bundles use Ubuntu 24.04 (`noble`), alongside normal Ubuntu dependencies.
Each native library also has separate optional Linux and Windows prebuilt
choices. Leaving either blank keeps that platform's local/Git source build;
selecting a package preserves the source recipe for later use.
