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

Current scope: produce and edit manifest files, inspect them through `sqgipkg`,
and copy a CLI command. Package execution is optional future work and must call
`sqgipkg`. See the [scope clarification](requirements/README.md#scope-clarification).

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

Choose **New** for the four-step setup, or **Open** to edit an existing manifest.
Use the sections for common fields, **Show advanced fields** for the rest, and
search for a schema key to find its containing object. **Edit** opens typed
controls: optional fields start unset; choose a type to configure them. Lists
support add/edit/remove/reorder, and maps support named entries. **Reset** removes
an override. Changes and JSON editing share Undo/Redo.

**Review** runs Check/Explain on the current draft through `sqgipkg`. It shows
field diagnostics, effective targets, native recipe commands, and import evidence.
Detected features can be added explicitly. Results become stale when the draft
changes. **Copy packaging command** prepares a POSIX shell command on Linux or
a PowerShell command on Windows. Save first and run it from the project directory.

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
