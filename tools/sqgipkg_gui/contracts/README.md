# Implementation contracts

Version: 2 (manifest-authoring scope). These contracts derive from the [requirements](../requirements/README.md).

| Contract | Boundary | Implementation |
| --- | --- | --- |
| C-DOC | Authored manifest and file transactions | `src/document.nut` |
| C-EDIT | Catalog and GTK controls/workflow | `src/catalog.nut`, `src/fields.nut`, `src/application.nut` |
| C-PKG | Machine protocol over the existing CLI | `../sqgipkg_lib/protocol.nut` and shared CLI modules |
| C-JOB | Deferred package execution/supervision | No current implementation obligation |
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
