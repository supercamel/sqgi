# Product requirements

Version: 2. Status: manifest-authoring implementation baseline (2026-09-25).

The primary user wants to create, understand, edit, and save a useful sqgipkg
manifest without memorizing its schema. Experienced users need the full CLI's
configuration power and existing projects must retain their behavior.

| Requirement | Observable outcome |
| --- | --- |
| R-SCOPE-01 | A native SQGI/GTK 4 application under `tools` creates, opens, edits, checks and saves ordinary sqgipkg manifests. |
| R-SCOPE-02 | A short setup assistant and direct section navigation serve first-time and returning users using the same document. |
| R-SCOPE-03 | Every supported manifest field is editable and CLI options are documented; common settings remain a small, understandable first view. |
| R-SCOPE-04 | LLVM JIT and typed kernels are standard for new runtime builds; users do not need feature opt-in steps. |
| R-SCOPE-05 | Existing CLI behavior and headless use remain available without GTK. |
| R-SCOPE-06 | Requirements, contracts, code, and acceptance tests are traceable by stable IDs. Verified platform claims name actual evidence. |

## Requirement tree

- [Document integrity](document.md): authored data, raw JSON, undo, saves.
- [Editor and guidance](editor.md): first use, sections, search, full coverage.
- [Packaging integration](packaging.md): validation, plans, defaults, targets.
- [Jobs and artifacts](jobs.md): deferred optional packaging integration.
- [Delivery and quality](delivery.md): launchers, packaging, accessibility, tests.

The v1 scope excludes source-code editing, remote build servers, publishing,
and CI workflow authoring. Users can copy a CLI command for external automation.
No new project metadata fields are invented by the GUI.

## Scope clarification

The user clarified that producing manifest files is the priority. `sqgipkg`
remains the primary packaging tool. This delivery implements authoring, local
inspection through the CLI, and copying a command for use in a terminal.
Build/clean execution, artifact management, process-tree supervision and
self-packaging are deferred. If added later, package production MUST invoke
`sqgipkg`; the GUI must never implement packaging logic. Deferred requirements
retain their IDs in the traceability map and are not current acceptance claims.
