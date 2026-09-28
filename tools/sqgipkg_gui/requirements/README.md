# Product requirements

Version: 5. Status: guided manifest authoring and Linux CLI-backed builds (2026-09-27).

The primary user wants to create, understand, edit, and save a useful sqgipkg
manifest without memorizing its schema. Experienced users need the full CLI's
configuration power and existing projects must retain their behavior.

| Requirement | Observable outcome |
| --- | --- |
| R-SCOPE-01 | A native SQGI/GTK 4 application under `tools` creates, opens, edits, checks and saves ordinary sqgipkg manifests. |
| R-SCOPE-02 | A short setup assistant and direct section navigation serve first-time and returning users using the same document. |
| R-SCOPE-03 | Creating a useful manifest does not require JSON/schema knowledge. Task-specific common controls explain choices; every supported field remains reachable in an explicitly advanced editor, and CLI options remain documented. |
| R-SCOPE-04 | LLVM JIT and typed kernels are standard for new runtime builds; users do not need feature opt-in steps. |
| R-SCOPE-05 | Existing CLI behavior and headless use remain available without GTK. |
| R-SCOPE-06 | Requirements, contracts, code, and acceptance tests are traceable by stable IDs. Verified platform claims name actual evidence. |

## Requirement tree

- [Document integrity](document.md): authored data, raw JSON, undo, saves.
- [Editor and guidance](editor.md): first use, sections, search, full coverage.
- [Packaging integration](packaging.md): validation, plans, defaults, targets.
- [Jobs and artifacts](jobs.md): supervised builds, progress, cancellation and verified output paths.
- [Delivery and quality](delivery.md): launchers, packaging, accessibility, tests.

The v1 scope excludes source-code editing, remote build servers, publishing,
and CI workflow authoring. Users can copy a CLI command for external automation.
No new project metadata fields are invented by the GUI.

## Historical manifest-only scope

The user clarified that producing manifest files is the priority. `sqgipkg`
remains the primary packaging tool. This delivery implements authoring, local
inspection through the CLI, and copying a command for use in a terminal.
Build/clean execution, artifact management, process-tree supervision and
self-packaging are deferred. If added later, package production MUST invoke
`sqgipkg`; the GUI must never implement packaging logic. Deferred requirements
retain their IDs in the traceability map and are not current acceptance claims.

## Usability revision

The [usability study](../reports/usability-study-2026-09-25.md) found that schema
coverage had become the primary interaction. This revision makes understandable
decisions and truthful readiness states acceptance obligations. Manifest authoring
remains the scope; package execution is still deferred. Preserve the document
model and CLI authority while replacing the common editing workflow.

The multi-output follow-up makes both Linux architectures and Windows NSIS the
new-project default on Linux. Users can select any supported subset in the normal
setup and Targets workflow; advanced configuration is for unusual recipes and
overrides, not the ordinary choice to produce more than one package.

## GUI build follow-up (2026-09-27)

Activate the CLI-backed Build workflow to address the field-study handoff gap.
The earlier manifest-only delivery remains historical scope, not a prohibition
on this extension. Review must offer building the saved manifest, readable live
feedback, retained logs and safe cancellation. Implement Linux supervision first;
unsupported hosts must explain why Build is unavailable and retain command copy.
Windows supervision remains required follow-up work. Structured progress and
verified artifact presentation are specified in jobs.md and now have real
three-output acceptance evidence.

The Build follow-up now includes a versioned CLI final-output report and a GUI
list of checked output paths with Open folder actions. This supersedes the
initial unverified-command-only milestone. CLI reports identify the active output,
architecture and phase. Windows supervision remains outstanding; file checks do
not establish runtime correctness.
