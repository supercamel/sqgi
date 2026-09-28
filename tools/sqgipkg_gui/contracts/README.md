# Implementation contracts

Version: 4 (guided manifest authoring and multiple outputs). These contracts derive from the [requirements](../requirements/README.md).

| Contract | Boundary | Implementation |
| --- | --- | --- |
| C-DOC | Authored manifest and file transactions | `src/document.nut` |
| C-EDIT | Catalog, common tasks and GTK workflow | `src/catalog.nut`, `src/fields.nut`, `src/common.nut`, `src/outputs.nut`, `src/application.nut` |
| C-PKG | Machine protocol over the existing CLI | `../sqgipkg_lib/protocol.nut` and shared CLI modules |
| C-JOB | CLI-backed Build, checked outputs and Linux supervision | `src/jobs.nut`, `runner.c`, `src/application.nut` |
| C-DEL | Launch/install/package/traceability | launcher, CMake, assets, tests (self-packaging deferred) |

Each leaf contract includes inputs, outputs, invariants, failures, and required
acceptance cases. Acceptance tests assert observable behavior, not the layout
of generated implementation code. `traceability.json` maps each requirement to
contract obligations, modules, and test IDs; the test inventory validates that
those IDs exist.

- [Document contract](document.md)
- [Editor contract](editor.md)
- [Packaging contract](packaging.md)
- [Job contract](jobs.md)
- [Delivery contract](delivery.md)

The implementation may add helpers within these boundaries. Public interface or
behavior changes require a contract update first. Implementation limitations
must appear in the verification record until resolved.
