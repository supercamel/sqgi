# Packaging integration

Parent: [product requirements](README.md). Derived contract: [packaging](../contracts/packaging.md).

| ID | Requirement |
| --- | --- |
| R-PKG-01 | GUI and CLI use the same schema validation, normalization, target selection, recipes, and dependency resolution. |
| R-PKG-02 | A versioned machine interface exposes capabilities, diagnostics, and resolved plans without parsing human log text. Existing text CLI output remains supported. |
| R-PKG-03 | Inspection is local and does not execute application/hooks or fetch/build. Unsaved preview uses the manifest's base directory. |
| R-PKG-04 | Plans show selected targets, entrypoints, runtime source, packages, native build commands, outputs, and available file inclusion evidence. Unresolved generated content is identified honestly. |
| R-PKG-05 | Linux supports AppImage and Windows outputs; Windows supports native Windows outputs. Sysroot targets are documented as advanced CLI operations. Reserved appdir/tarball targets are not build choices. |
| R-PKG-06 | Standard runtime recipes explicitly configure LLVM JIT and typed kernels even with an existing CMake cache. An authored runtime.jit override is preserved as an explicit exception. |
| R-PKG-07 | Runtime diagnostics distinguish the GUI's runtime from the packaged runtime. Missing required dependencies or nonstandard existing runtimes are identified without assuming binary capabilities from source defaults. |
| R-PKG-08 | Per-run flags, cache operations, locks and smoke tests stay out of the manifest unless the CLI already defines a corresponding field. |
| R-PKG-09 | Legacy manifests retain their accepted semantics. Strict version-2 errors do not cause unknown fields to be deleted. |
| R-PKG-10 | Manifest/schema/CLI catalogs remain consistent through automated coverage checks; aliases do not create contradictory effective settings. |

Baseline/package-suite selection describes dependency selection and is not an
OS compatibility certification. Cross-target build success does not establish
execution success on that target.
