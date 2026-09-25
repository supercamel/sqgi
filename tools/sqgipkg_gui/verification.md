# Verification record

Validated 2026-09-25 on Ubuntu 24.04, x86_64, GTK 4.14.5, LLVM 18.1.3.
SQGI is a Release build reporting 0.1.7-alpha; LLVM bytecode JIT and LLVM typed
kernels are enabled. The editor changes follow release commit `860c7ee` and
are excluded from the pushed `v0.1.7-alpha` tag.

## Scope and evidence

The delivered application authors manifests. Check/Explain invoke the real
`sqgipkg` CLI with argv and the exact unsaved JSON on stdin. Package execution,
clean/artifact management, process-tree build supervision, and self-packaging
are deferred after the user's manifest-first clarification. Future package
execution must invoke `sqgipkg`, never duplicate its packaging implementation.

| Check | Result | Contracts |
| --- | --- | --- |
| `cmake --build build --target sqgipkg-gui-bin --parallel 4` | Passed; native launcher built | C-DEL-01 |
| `ctest --test-dir build -R '^sqgi_test_manifest_' --output-on-failure --parallel 2` | 3/3 CTest groups passed | C-DOC, C-EDIT, C-PKG, C-DEL |
| `python3 tools/sqgipkg_gui/tests/test_contracts.py build/sqgi` | 8 tests passed, including the Squirrel document and async backend suites | C-DOC, C-PKG, C-EDIT-01 |
| Document corpus | All 12 checked-in application manifests preserve bytes on no-op save and semantics after an isolated edit/revert | C-DOC-01 |
| Catalog audit | All 216 schema properties and 98 CLI options classified | C-EDIT-01, C-PKG-04 |
| GTK workflow under Xvfb | New wizard via button activation; template/save; typed string/nested boolean; save/reopen; undo/redo; invalid JSON; nested-key search; real CLI inspection; stale results | C-EDIT-02–05, C-PKG-06–07 |
| Staged install | Native launcher and CLI description work from another directory with spaces/Unicode in the installation prefix; desktop entry/icon installed | C-DEL-01 |
| Traceability audit | Every requirement and contract clause mapped, including explicit deferred work; all active module/test references exist | C-DEL-03 |
| Existing sqgipkg, ergonomics and kernel-packaging CTest groups | 3/3 passed; full packaging suite completed in 151 seconds, including real package builds | C-PKG-05 |
| `build/sqgi tools/sqgipkg_tests/test_modules.nut` and `python3 tools/sqgipkg_tests/test_ergonomics.py build/sqgi` | 211 module assertions and 25 ergonomics tests passed after final diagnostic-path changes | C-PKG-01, C-PKG-05 |
| Visual inspection | Opened the image-viewer manifest under Xvfb and inspected the GTK layout | C-EDIT-05 |
| `git diff --check` | Passed | Delivery hygiene |

The document checks cover false/null/unknown data, arrays, invalid drafts,
external modification, failed saves, protected destinations, conservative
relocation, and saved-byte digests. The async backend checks use a real child
process for inspection and cancellation; mutating requests are rejected.

## Platform limits

Linux is the locally verified platform. Native Windows launcher/install and
portable document/protocol checks are wired into
`.github/workflows/windows-packaging.yml`; that workflow was **not executed in
this local session**. Native Windows GTK interaction and non-x86_64 execution
remain unverified. Cross-target plans and Linux packaging tests do not establish
Windows GUI execution success.

An existing packaged runtime is reported with `verified_binary: null` unless
there is actual binary evidence. The GUI's runtime identity and requested
runtime recipe flags are separate. No compatibility certification is inferred
from a chosen Ubuntu baseline.

## Work sequence

1. Hierarchical requirements written.
2. Contracts derived from those requirements.
3. Scope updated to prioritise manifest authoring at the user's request.
4. Implementation written within document, editor, CLI and delivery boundaries.
5. Contract acceptance tests written, run and used to fix identified failures.
6. Existing packaging regressions run; final requirement/contract mapping checked.

For future changes, update the requirement and affected contract first. Update
code and independent acceptance cases together; preserve deferred IDs rather
than representing unimplemented capabilities as passing tests.
