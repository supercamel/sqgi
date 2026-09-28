# Verification record

## Multiple outputs and default set — 2026-09-25

Requirements version 4 and the updated editor/packaging contracts precede this
change. New projects on Linux now select x86_64 AppImage, aarch64 AppImage and
Windows NSIS together. Setup and Targets expose independent checkboxes and a
Windows installer/folder choice. Existing manifests are not changed on opening.

The shared CLI now supports `appimage-all` for Linux-only matrices. The existing
`all` target still includes Windows. Build dispatch shares the configuration
selection used by Check and Explain, with separate architecture output paths.

| Check | Result |
| --- | --- |
| `python3 tests/test_contracts.py ../../build/sqgi` | 10 passed, including all seven nonempty output subsets and the Windows-folder variant, exact Check/Explain target/CPU sets, distinct output folders, and recording-builder dispatch |
| `python3 tests/test_gtk.py ../../build/sqgi reports/usability-rewrite-2026-09-25` | Passed; default triple selection/save/reopen, two-AppImage-only resolution, empty-selection recovery, undo, preservation and existing editing/review checks |
| `python3 tests/test_delivery.py ../../build/sqgi` | 3 passed; staged install includes the output adapter and updated CLI |
| `python3 ../sqgipkg_tests/test_ergonomics.py ../../build/sqgi` | 25 passed |
| `../../build/sqgi ../sqgipkg_tests/test_modules.nut` | Passed |
| Visual review and whitespace | Inspected the updated setup output selector and summary; `git diff --check` passed |

The backend patch was first exercised in a temporary copy, then applied to the
shared CLI after workspace permissions changed. Matrix build tests record the
builders invoked rather than producing cross-platform packages. Native Windows
GUI execution and finished x86_64/AArch64/Windows package execution are not claims
of this validation. Complex legacy recipe matrices remain preserved in Advanced.
The single-architecture UI described in the earlier follow-up below is superseded
by the multi-output checkboxes.

## Guided-authoring revision — 2026-09-25

Implemented after requirements version 3 and the derived C-EDIT-06/07 contracts.
The [baseline study](reports/usability-study-2026-09-25.md) records the reasons.
This session used Ubuntu 24.04 on AArch64 (RK3588S), the repository `build/sqgi`
reporting 0.1.0/debug with JIT enabled and LLVM kernels. This is a different
environment from the earlier release-build record below.

| Check | Result |
| --- | --- |
| `python3 tests/test_contracts.py ../../build/sqgi` | 9 passed after the architecture follow-up; document preservation, catalog coverage, AppImage architecture resolution and real CLI/backend behavior |
| `cmake -S ../.. -B ../../build` then `cmake --build ../../build --target sqgipkg-gui-bin --parallel 2` | Passed; refreshed the stale local build configuration and built the launcher |
| `python3 tests/test_delivery.py ../../build/sqgi` | 3 passed; launch, staged installation including the new modules, and traceability |
| `python3 tests/test_gtk.py ../../build/sqgi reports/usability-rewrite-2026-09-25` | Passed all seven EDIT categories and the CLI-boundary check on the local X11 display |
| Visual review | Inspected captured welcome, setup review, application, files, targets and review screens; final welcome/application/review captures re-inspected after visual cleanup |
| `git diff --check` | Passed |

The GTK workflow covers a plain-script setup, human-readable review, explicit GTK
selection, direct text controls, assets, Windows installer choice, host capability
filtering, nested advanced disclosure through union schemas, legacy script and
complex-value preservation, undo/redo, invalid JSON, and search. It calls the real
CLI to establish that a missing native directory can resolve as a plan while
failing Check. It also verifies independent/stale results, warning-aware success,
transport failure replacing earlier success, and saved-command availability.

Architecture follow-up: R-EDIT-13 and C-EDIT-06 were revised before implementation
to make single-AppImage CPU selection a common control. The GTK run now selects
AArch64 during setup, checks its readable summary and saved/reopened value, then
switches to x86_64 in Targets and verifies undo and real CLI resolution. A backend
case resolves both architectures against a two-architecture overlay and checks
the existing `arm64` alias. Windows selections hide the Linux CPU control and
preserve its saved value. Setup output and summary screenshots were inspected.
The updated traceability test and `git diff --check` also passed. No cross-CPU
package build or execution is implied by these inspection checks.

Screenshots are in [the capture directory](reports/usability-rewrite-2026-09-25/).
The optional capture argument requires X11, `xwininfo`, `xprop`, and ImageMagick;
the harness captures only windows whose PID belongs to its test process. Normal
GTK tests require none of those capture utilities.

Initial GTK runs exposed callback receiver errors and a test activating an
unmapped button; these were corrected before the passing final run. The first
delivery run could not write CMake's install record under the sandbox, and the
existing CMake configuration omitted the GUI. The approved rerun and refreshed
configuration resolved those failures.

Limits: no package builds, native Windows GUI execution, human usability sessions,
full keyboard-only audit, or high-DPI validation were performed for this revision.
Windows target filtering was exercised against the capability list, not a native
Windows desktop. Expert editing remains schema-based; 174 advanced/catalog
descriptions still use the earlier boilerplate, while common tasks have dedicated
inline explanations and 36 catalog descriptions were rewritten. Deep search
opens the containing object rather than focusing its exact nested control.

## Earlier manifest-authoring delivery record

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
# Headless packaging field study — 2026-09-25 (in progress)

Plan: [end-to-end study](reports/packaging-field-study-2026-09-25/plan.md).
Current evidence: [environment](reports/packaging-field-study-2026-09-25/environment.md)
and [findings](reports/packaging-field-study-2026-09-25/findings.md).

The source Playground application passes its asset, locale, import, kernel and
GStreamer checks, and has been rendered on a private Xvfb display. Its manifest
was created, edited, saved and reopened through the real GUI; screenshots and
action logs are retained. Verminal builds in an isolated source snapshot.

The walkthrough found and corrected an unavailable clipboard convenience method
and rejection of a local runtime source without a revision. Requirements and
contracts were updated before code. The private-display GTK workflow passes,
including actual clipboard readback; two targeted runtime-source CLI regressions
pass. The full CLI ergonomics suite subsequently passed 28 tests after the index
refresh fix. The GUI document/protocol suite now passes 11 tests after the
runtime-choice change. Screenshots retain failures and corrected behavior.

The cache-refresh retry exposed repeated repository-index downloads per package.
After requirements/contract updates, per-run index caching and progress reporting
were added. Its targeted offline downloader-count regression passes; the real
package retry remains in progress.

The first real package build failed on a dependency archive HTTP 404; a refreshed
build is in progress. Cross-target package production, packaged execution,
packaged native-module studies, and the rest of the plan remain outstanding. This is
not a claim that the requested packages work. Earlier records below describe
their own narrower verification scope.

The C1 GObject module now has a passing aarch64 source build and GI consumer:
construction, read/write property, method result, signal count/payload, compiled
revision, exported symbols and generated metadata. Its manifest was authored
through the GUI for all three outputs, with GI setup explicitly recorded as
expert assistance. Its actual package build is queued behind the Playground
build to avoid concurrent shared-sysroot writes.

Further documented fixes replace runtime source JSON dialogs with common
controls and refresh nested parent editors after child changes. All 11 GUI
contract tests, the private-display GTK workflow (including both new behaviors),
and traceability pass. Real retest screenshots and action logs are retained.
The C1 screenshot sequence has been visually inspected; schema-heavy native GI
configuration remains an open usability finding. No packaged runtime result is
inferred from these source, authoring or regression checks.

The refreshed Playground build subsequently extracted 500 target packages and
failed at a readiness check that treated refresh as unconditionally missing.
C1's first package build failed because its plain source recipes did not enable
a private sysroot. Both defects are now specified, fixed and covered by targeted
regressions. Full suites pass: 30 backend ergonomics tests and 11 GUI contract
tests. C1's unchanged GUI manifest is being rebuilt; Playground's normal cached
retry follows. These remain failed/pending builds in the results ledger until
actual artifact production succeeds.


Field-study follow-up: C1 now produces both Linux AppImages. All 48 ELF files in
each extracted payload match the selected architecture; module exports and base
GI metadata are present. Seven native-module checks pass through the original
extracted AppRun in an isolated filesystem on aarch64 natively and x86_64 under
QEMU. The old x86_64 payload fails in the same isolation for missing GObject
metadata. This is extracted-launcher evidence, not AppImage mounting evidence.
See [target ledger](reports/packaging-field-study-2026-09-25/results.json),
[isolation runner](tests/study/isolated_linux.py) and [findings FS-12 through FS-14](reports/packaging-field-study-2026-09-25/findings.md).
The Windows build still fails at its missing LLVM 18 SDK; no Windows success is
claimed. Playground's corrected build and Verminal's dependency integration are
still in progress.

The native-application correction (FS-04) adds a shared Meson/CMake template,
per-target executable resolution, guided wizard and common Application controls.
Verminal's isolated copy now has a GUI-saved native manifest with all three
outputs and GTK explicitly selected. Baseline and corrected screenshots are in
[the walkthrough report](reports/packaging-field-study-2026-09-25/findings.md).
The 12 document/protocol tests, 32 backend ergonomics tests, targeted real native
Meson build/staging execution, full private GTK workflow and traceability passed.
A further GTK retest covers the subsequent native Review wording correction.

Field-study continuation: native library common controls are implemented after
requirements/contracts and exercised with gserial and gworldscene. Evidence is
in [the study findings](reports/packaging-field-study-2026-09-25/findings.md).
13 document/protocol tests, 34 backend ergonomics tests, traceability and the
private GTK diagnostic rerun pass. The first GTK library run failed an earlier
Check assertion; its log is retained. Playground builds both Linux AppImages
with correct ELF architecture, and both self-extract using their real runtimes.
Both original payloads fail isolated image checks because MIME caches were
missing (FS-17); a diagnostic x86_64 copy with only that cache generated passes
all 15 checks. Product correction is tested, but artifact rebuild remains due.
Windows LLVM18 SDK compatibility compilation passes; no Windows package/runtime
pass is claimed. Verminal's initial Linux build uses gserial already present in
cached sysroots, so fresh dependency preparation remains a required gate.

Windows probe shutdown investigation (FS-18): the unchanged manually assembled
SQGI/LLVM18 payload now passes version, empty-script, kernel, loop and combined
execution under private Wine/QEMU after repairing host unwind support and Wine
zlib. This establishes a runner defect; no SQGI runtime defect was demonstrated.
The original crashes remain recorded. Two automated runner regressions pass,
including real pthread teardown and rejection of success markers followed by
failure/signals; traceability passes. See the [crash report](reports/packaging-field-study-2026-09-25/windows-shutdown-crash.md)
and [five-case result](reports/packaging-field-study-2026-09-25/logs/windows-shutdown-regression.json).
NSIS installation and native Windows execution are still unverified.

FS-16 template/Files correction: all 35 backend ergonomics and 13
document/protocol tests pass, along with the full private GTK workflow including
dynamic-script add/remove/undo. Both gserial AppImages self-extract and pass all
10 serial state/call/signal checks through their original launchers in isolated
filesystems with a private PTY. All 48 ELF files in each payload match its target.
The x86_64 execution is emulated; aarch64 is native. Windows remains a failed
build pending LLVM18 provisioning. gworldscene's baseline reaches Meson and
fails for missing target glm; further dependency configuration remains due.

Ooblerg provider/search work follows the updated R-PKG/R-EDIT requirements and
contracts. Six offline provider regressions, 37 backend ergonomics, 13 protocol/
document checks and private GTK acceptance pass. The real C2 manifest uses the
searchable library picker, with wrapped descriptions visually inspected. The
Playground's MIME-corrected x86_64 and aarch64 AppImages self-extract and pass all
15 isolated functional checks. Ooblerg artifact builds and remaining study gates
are still in progress; see the study ledger and FS-19.

Latest Ooblerg checkpoint: seven provider regressions, all 39 backend ergonomics,
the existing 13 protocol/document checks, full GTK workflow, focused catalog
retry/cancel tests, three independent runner regressions and traceability pass.
The [search walkthrough](reports/packaging-field-study-2026-09-25/ooblerg-search.md)
includes inspected 1024×768 screenshots and actual keyboard selection. Controlled
private-cache corruption recovers through the real repository Refresh action.

Windows installers now build for all five study fixtures. Under private Wine/QEMU,
the packaged Playground passes 15 resource/locale/kernel/media checks, the newly
cross-compiled C1 module passes seven, and C2 gserial passes ten plus exact serial
bytes in both staged and installed apps. C2's 293 installed files match the
payload. A fresh Wine prefix creates all three C2 shortcuts, but activation exits
3 before app output, keeping installation integration partial. C1 has now been
rebuilt with the corrected x64 bootstrap; changing compiled revision 42 to 43
reaches all three targets and passes all seven checks. A/C1/C2 also pass actual
aarch64 FUSE launches and x86_64 extract-and-run under QEMU; x86_64 FUSE and
graphical startup are separate unresolved gates. B's Windows serial interaction
passes with explicit Cairo but its default UI is blank and Cairo text is poor
(FS-24). C3's minimal import crashes on shutdown; an independent C GTK loader
reproduces it, and its integration regression remains failing (FS-23). Remaining
Linux dependency/GUI gates and native Windows execution are outstanding.
Earlier failures above are preserved baseline checkpoints;
the [ledger](reports/packaging-field-study-2026-09-25/results.json) records current
status and separates each acceptance gate.

Further graphical acceptance: both Verminal Linux payloads render clearly and
pass exact serial exchange, disconnect, invalid-port feedback and clean exit in
minimal namespaces (aarch64 native; x86_64 QEMU). Their fresh build-dependency
gate remains unresolved. The Playground's aarch64 GUI exposes FS-25: language
selection did not update the greeting despite fifteen successful startup checks.
The fixture signature and live-widget regression are corrected; package rebuild
and graphical retest remain separate gates. The new independent C DLL teardown
regression for FS-23 remains failing, preserving completion-marker/exit distinction.

The rebuilt Playground Linux payloads now pass all fifteen content and three
live-language checks. FS-27 isolates the Windows timeout failure to a GLib
forwarding-DLL metadata reference: a separate diagnostic payload restores the
callback/UI assertions but still crashes at shutdown. No product metadata fix
is claimed. FS-28 found that a zero-exit batch wrapper can conceal QEMU fatal
signals. Both emulated runners now reject those diagnostics; an actual crashing
child regression passes. The [retrospective audit](reports/packaging-field-study-2026-09-25/logs/windows-hidden-crash-audit.json)
invalidates 23 earlier Wine clean-execution claims, including some DLL controls
and installer runs. Raw evidence remains unchanged. See the current ledger and
FS-26 for the independent Verminal receive-buffer defect and snapshot-only fix.

C3 fresh x86_64 AppImage now builds and self-extracts; all 214 ELF binaries have
the expected architecture. Its unchanged extracted AppRun passes the complete
six-assertion scene test in isolation with target Mesa supplied explicitly as
runner graphics support. Local imagery/100 m terrain requests, red geometry and
green imagery pixels, and clean exit pass; the screenshot was inspected. The
135-second QEMU/software-rendering result is not native performance evidence.
See [FS-29](reports/packaging-field-study-2026-09-25/findings.md#fs-29--scene-runtime-needs-an-explicit-graphics-capable-runner)
for preserved absent-driver and shorter-timeout baselines. Arm64 fresh build and
actual artifact/FUSE launch remain separate gates. Six runner regressions and
updated traceability pass.

Verminal's guided source-dependency manifest is saved with gserial before the
application and an Ooblerg Windows alternative. The fresh x86_64 build proves
FS-30: gserial builds, but its development files do not reach downstream
pkg-config, so Verminal fails to configure. Requirements/contracts now specify
private per-target SDK export. Linux managed/explicit-sysroot implementation now
passes the fresh gserial + Verminal rebuild, three SDK regressions and 39 backend
regressions. The base sysroot remains gserial-free and the exported library has
the target architecture. See [FS-30](reports/packaging-field-study-2026-09-25/findings.md#fs-30--built-native-libraries-are-unavailable-to-downstream-native-recipes).
Packaged network retests remain due.
The GI checkbox now explains Vala use as well as Squirrel; existing real GTK
workflow tests pass (`logs/vala-gi-wording-gtk.txt` in the study report).

A private current Box64 build now passes the Wine 11 GLib-import control that
failed under QEMU. This narrows one runner failure; Windows graphical and
installer gates remain outstanding. The [crash report](reports/packaging-field-study-2026-09-25/windows-gtk-shutdown-crash.md)
links both controls. The proposed [Linux Ooblerg extension](reports/packaging-field-study-2026-09-25/ooblerg-linux-proposal.md)
is recorded separately from implemented provider support.

[FS-31](reports/packaging-field-study-2026-09-25/findings.md#fs-31--native-sysroot-link-omits-indirect-blaslapack-search-paths)
corrects native sysroot indirect-library linking. All 40 backend regressions pass.
The fresh aarch64 gworldscene AppImage builds and self-extracts; native isolated
AppRun passes six scene checks, local HTTP terrain/imagery, inspected screenshot
pixels and clean exit with explicit Mesa support. FUSE launch remains separate.

Fresh Verminal x86_64 package network retest passes: real GUI TCP/UDP controls,
ASCII/HEX, line endings, exact echoed bytes visibly intact and clean exit under
isolated QEMU. The [peer record](reports/packaging-field-study-2026-09-25/logs/b-fresh-sdk-network-runtime-network/network.json)
and [inspected screenshot](reports/packaging-field-study-2026-09-25/screenshots/b/linux/fresh-sdk-network-udp-37.png)
verify the snapshot-only receive ownership correction. Payload inspection finds
67 matching ELF files and no exported development files. Aarch64 fresh rebuild
is underway; original application repositories remain untouched.

Fresh Verminal aarch64 now also builds from the gserial-free base SDK and passes
native isolated TCP/UDP GUI acceptance with exact text/binary echoes and clean
exit. The [inspected screenshot](reports/packaging-field-study-2026-09-25/screenshots/b/linux/arm64-sdk-network-37.png)
and [peer report](reports/packaging-field-study-2026-09-25/logs/b-arm64-sdk-network-runtime-network/network.json)
record the result. All 67 payload ELF files match aarch64 and no exported
development files are staged. Fresh serial/FUSE tests remain outstanding.

Modern private Box64 further separates Windows failures: original GLib timeout
metadata exits 1 with a missing export; the retargeted diagnostic invokes the
callback and exits cleanly. Both controls are linked from the
[crash report](reports/packaging-field-study-2026-09-25/windows-gtk-shutdown-crash.md).
This is diagnostic evidence, not full Windows package acceptance.

FS-27 now has a bounded Ooblerg staging correction, specified in requirements
and contracts before implementation. Ten provider/compatibility tests pass,
including real GI roundtrip metadata equivalence and rejecting invalid replacement
DLLs before writing. A normal Playground Windows build is underway in a separate
output directory; product-package runtime acceptance remains pending.

The normal Windows Playground rebuild now passes 15 content checks and three
live-widget language checks with clean exit under private Box64/Wine 11 and
explicit Cairo. The [functional record](reports/packaging-field-study-2026-09-25/logs/a-box64-product-functional.json)
links the runner evidence. SDK metadata remains unchanged. The progress capture
predates window mapping, so visual inspection and native Windows/installer
acceptance remain outstanding.

Windows visual inspection now has a correctly timed
[screenshot](reports/packaging-field-study-2026-09-25/screenshots/a/box64-product-language-marker.png):
images render, but text is clipped throughout. Functional checks and clean exit
still pass in that run; visual acceptance fails. Adding native font wrappers is
an unsuccessful runner experiment (exit137, blank capture), preserved separately.
No full Windows GUI acceptance is claimed.

Playground NSIS installation and removal now pass under private Wine11/Box64:
876 installed files match, three shortcuts are created, and the generated
uninstaller removes the directory and shortcuts with clean child completion.
[FS-32](reports/packaging-field-study-2026-09-25/findings.md#fs-32--uninstaller-launcher-exit-does-not-establish-removal)
documents why the runner must wait beyond the NSIS launcher's exit and preserves
the failed direct-wait baseline. Installed-app launch and native Windows remain
separate gates.

The installed Playground batch launcher passes all 15 content and three widget
checks with clean exit while the original package is unavailable; logs resolve
resources and plugins inside the installed directory. Desktop shortcut activation
opens the [installed window](reports/packaging-field-study-2026-09-25/screenshots/a/box64-installed-shortcut.png),
but Wine returns3 and text remains clipped, so shortcut/visual acceptance remains
failed. All 40 backend regressions pass after the typelib staging correction.

Both fresh Verminal Linux artifacts now also pass isolated serial ping/pong,
disconnect, invalid-port handling and clean exit, with inspected screenshots.
Together with the fresh TCP/UDP runs this covers the corrected payloads' transport
checks. Actual AppImage/FUSE launch remains separate. The first gworldscene FUSE
probe reached its packaged script but omitted the required scene server; preserve
`logs/c3-arm64-actual-appimage.json` as an incomplete harness invocation, not a
package defect or passing scene test. A full graphical artifact probe is due.

The actual aarch64 gworldscene AppImage now passes the complete six-check scene
through FUSE, with local terrain/imagery, inspected screenshot pixels and clean
exit. [Runtime evidence](reports/packaging-field-study-2026-09-25/logs/c3-arm64-fuse-scene-runtime.json)
and [screenshot](reports/packaging-field-study-2026-09-25/screenshots/c3/linux-arm64-fuse-scene.png)
are separate from minimal-filesystem isolation: this launch sees the host
filesystem and loopback namespace. Six existing runner regressions and the new
unverified-display rejection test pass.

C3's previously crashing Windows import/provider-construction reduction now
passes under modern Box64 with clean exit. The full-scene Windows NSIS rebuild
succeeds; 927 files are hashed and all116 PE files match x86_64. Full scene
execution remains pending; its runner reports missing native graphics libraries.
Constructor-only success is not counted as rendered-scene acceptance.

Windows C3 full-scene testing now renders expected geometry and passes all six
assertions plus terrain/imagery requests when explicit native Mesa runner files
are supplied. The [screenshot](reports/packaging-field-study-2026-09-25/screenshots/c3/windows-box64-native-gl.png)
is inspected. The process then receives SIGKILL, so overall runtime acceptance
remains failed; signal provenance is under investigation. Windows Verminal's
corrected NSIS rebuild also completes; its fresh runtime retest remains due.

User steering on 2026-09-27 refocuses work on sqgipkg_gui. Further packaged-app
and emulator investigations are deferred, with failures preserved (FS-33 records
Verminal's Windows TCP disconnect abort; UDP remains untested in that run).
Review's FS-05 layout now keeps the packaging action before long results and
collapses per-output evidence. Requirements → contracts → implementation were
followed. The actual GTK regression covers output labels, collapsed defaults
and action ordering; see [inspected Review screenshot](reports/packaging-field-study-2026-09-25/screenshots/gui-review-final/compact-review.png).
This remains a command handoff; an integrated graphical build workflow is not
implemented by this change.

### Initial GUI Build integration (2026-09-27)

Review now starts the saved manifest through the real CLI on Linux when the
installed supervisor is available, with live output, full retained logs,
cancellation and a last-log action. This supersedes the previous terminal-only
handoff limitation. Requirements and contracts were updated before code.
Five native-supervisor tests pass (including detached-child cancellation and
parent-death cleanup), as do staged-install and traceability checks.
See [FS-34](reports/packaging-field-study-2026-09-25/findings.md#fs-34--review-required-a-terminal-to-build).
Structured events, verified artifacts, Windows supervision and actual successful
packaging through the new GUI action remain outstanding; no package acceptance
is inferred from the transport tests.

The complete private GTK workflow passes, including the new real-CLI failure
and fixture cancellation checks: [log](reports/packaging-field-study-2026-09-25/logs/gui-build-gtk.txt).
Both final Build screenshots are inspected. A strengthened pipe-closure
regression exposed SIGPIPE interrupting supervisor cleanup; that baseline is
preserved and the corrected five-test supervisor suite passes.

The new GUI Build action has now produced a real Playground Windows NSIS
installer through ordinary controls, preserving the original manifest and
using a separate output directory. [Artifact evidence](reports/packaging-field-study-2026-09-25/logs/a-gui-build-artifacts.json):
103,791,304-byte installer, 876 payload files, 203 x86_64 PE binaries. The fresh
payload passes 15 content and 3 widget checks with clean exit under isolated
Wine/Box64 ([functional evidence](reports/packaging-field-study-2026-09-25/logs/a-gui-build-functional.json)).
This supersedes the earlier pending single-target GUI-build acceptance;
full-matrix GUI build, native Windows and this installer's installation remain
separate gates. The live walkthrough exposed FS-35: the log did not follow new
output, now covered by a pause/resume and actual-scroll-position regression.

FS-35's corrected GTK workflow passes; the inspected final log screenshot shows
the newest messages. Default follow, pause, continued full logging, resume and
actual scrollbar position are asserted in the real subprocess/GTK test.
Evidence: [GTK log](reports/packaging-field-study-2026-09-25/logs/gui-follow-gtk-corrected.txt).

### GUI build outputs (2026-09-27)

The CLI now supplies a versioned final-output report, and the GUI displays
checked output format, architecture and path with Open folder. A fresh real
Playground rebuild is shown in the [inspected result screenshot](reports/packaging-field-study-2026-09-25/screenshots/gui-real-build/07-verified-installer.png).
The generated installer is 103,791,288 bytes. The fresh payload separately
passes 15+3 checks under isolated Wine/Box64; native Windows/installer execution
remain separate. Protocol/file regressions, all 13 contract tests and the full
private GTK workflow pass. Folder dispatch is tested with a private capture
handler, not a desktop file manager. See FS-36 for evidence and remaining edges.

### Build recovery and normal editor close (2026-09-27)

FS-37 reproduces a single-close failure and fixes the nested close request by
deferring the guarded close until the original event finishes. The focused
baseline fails; the corrected test and full private GTK workflow exit normally.
Artifact-action errors now appear inside the Build window, with recovery help
and expandable diagnostics. Deleting the test artifact prevents folder dispatch
and leaves Close usable. [Inspected screenshot](reports/packaging-field-study-2026-09-25/screenshots/gui-build-recovery/build-output-missing.png),
[full GTK evidence](reports/packaging-field-study-2026-09-25/logs/gui-build-recovery-gtk.txt).

### Theme and language controls (2026-09-27)

FS-38 adds visible theme choices and a compiled-gettext language picker after
updating requirements/contracts. Dedicated headless GTK acceptance passes, including
actual Linux/Windows file-rule staging, preservation, undo and reopening. Both
screenshots inspected; [appearance](reports/packaging-field-study-2026-09-25/screenshots/appearance/appearance.png)
and [languages](reports/packaging-field-study-2026-09-25/screenshots/appearance/languages.png).
This verifies catalog placement, not runtime translation or third-party theme styling.
The existing full headless GTK workflow also completes successfully after the
navigation change (`logs/gui-appearance-regression.txt` in the field-study report).
It emits GTK layout criticals during other workflow steps; this is not a clean
visual acceptance of every page. Dedicated appearance screenshots show no clipping.
Traceability and `git diff --check` pass.

### Real language walkthrough and regression (2026-09-27)

FS-39 records a failing Find languages action under the actual private GUI bridge,
then a module-scope fix and passing regression. A real Playground manifest was
saved through visible controls with French and Adwaita dark. Its selected catalogs
stage correctly in both layouts and decode to the expected French text; original
manifest unchanged. This is not a new package/runtime acceptance.

The picker now explains when existing resource folders may still bundle unchecked
languages. [Inspected overlap notice](reports/packaging-field-study-2026-09-25/screenshots/appearance-overlap/language-overlap.png).
See FS-39 for baseline/fixed logs, GUI actions, saved manifest and staging evidence.
Traceability and whitespace checks pass.

### Build progress during quiet work (2026-09-27)

FS-40 implements the previously documented structured stage/target/architecture
progress. Three artifact/progress tests pass, including a quiet real subprocess,
three-output count advance, failure and cancellation. Full private GTK workflow
passes; [inspected Build screenshot](reports/packaging-field-study-2026-09-25/screenshots/build-progress/build-progress.png)
shows output 2/3 and ARM AppImage packaging before any log output. The producer in
that screenshot is a fixture; real matrix progress acceptance remains outstanding.

### Real matrix progress walkthrough started (2026-09-27)

FS-41 records an actual GUI-saved three-output Playground variant and Build action.
Real preparation/build/collection stages match the visible x86_64 AppImage progress;
private screenshots inspected. The build is ongoing, so no package/runtime pass is
claimed. Handles and evidence paths are recorded in execution-state.json; resume
observation of this producer rather than restarting it.

FS-41 now has fresh x86_64 artifact evidence: self-extraction,333 correctly targeted
ELF files, real French catalog, dark GTK settings, and15 content plus3 live UI checks
passing under isolated emulation with clean exit. [Inspected dark-theme screenshot](reports/packaging-field-study-2026-09-25/screenshots/gui-real-matrix/x86_64-dark-runtime-painted.png).
Capture-race and black-frame baselines are retained separately. The aarch64/Windows
matrix build remains active; this is not whole-matrix acceptance.

FS-41 completed all3 outputs through the actual GUI. Both fresh AppImages pass
self-extraction, isolated15+3 functional/UI checks and inspected dark-theme display;
ARM runs natively, x86_64 under emulation. Both actual FUSE launchers pass with an
explicit installed helper (default x86_64 discovery failure retained). Windows
payload/direct and batch launcher functional checks pass under Wine11/Box64,
including visibly applied dark styling, but clipped text remains a visual failure.
New-installer installation and native Windows execution are still outstanding.
The [three-output result screen](reports/packaging-field-study-2026-09-25/screenshots/gui-real-matrix/progress-resumed/06-succeeded-complete.png)
was inspected and the GUI closed normally. See results.json and FS-41 for evidence
and exact distinctions between builds, payloads, launchers and target runners.

### Fresh GUI-built installer lifecycle (2026-09-27)

FS-42 verifies the new NSIS artifact in private Wine11/Box64:889 installed files
match hashes,3 shortcuts and uninstall registry entry exist; the installed batch
passes15 content+3 live language checks with the source payload hidden. Uninstall
removes the app directory, shortcuts and registry entry after waiting for children.
[Lifecycle postconditions](reports/packaging-field-study-2026-09-25/logs/a-gui-matrix-uninstall-postconditions.json).
Native Windows and the recorded Windows visual failure remain distinct outstanding
items. No host installation or original application repository was modified.

### Guided pinned-Git native libraries (2026-09-27)

FS-43 adds Local folder / Git repository authoring after requirements/contracts.
A real GUI-saved gserial recipe clones to the exact commit without modifying the
original repository. Model preservation and full private GTK tests pass. The real
walkthrough caught an unmapped-field bug missed by direct test writes; corrected
signal signatures and visibility assertions now cover Git and custom-theme fields.
[Inspected Git controls](reports/packaging-field-study-2026-09-25/screenshots/native-git-fixed/real-pinned-source.png).
This is authoring/checkout acceptance; new Git-backed cross-build/runtime testing
remains outstanding. Long GI forms and source-creation guidance remain open.

### Pinned-Git library build comparison (2026-09-27)

FS-44 builds the GUI-saved gserial Git recipe for both Linux CPUs and Windows NSIS.
Both Linux payloads use the pinned source and correct ELF/GI metadata, and pass10
isolated serial checks with real private-PTY traffic and clean exits. Meson logs
confirm the target/host builds used the Git checkout rather than old local sources.
Windows retains its prebuilt Ooblerg override: build/50-PE inspection pass, fresh
runtime remains outstanding. [Inspected three-output GUI result](reports/packaging-field-study-2026-09-25/screenshots/c2-git-build/progress/11-succeeded-complete.png).

### Theme and language discoverability recheck (2026-09-27)

Re-ran `tests/test_appearance.py` with the built SQGI runtime under the study's
private Xvfb harness: `PASS EDIT-appearance-languages`, exit 0. Visually inspected
the [Appearance / languages page](reports/packaging-field-study-2026-09-25/screenshots/appearance-current/appearance.png)
and [language picker](reports/packaging-field-study-2026-09-25/screenshots/appearance-current/languages.png).
Theme selection and Choose languages are visible without expanding Advanced;
the picker shows language names/codes and explains the compiled-catalog requirement.
The session log is in the study cache at `session-appearance-current/application.log`.
README now describes these controls and their limits. No desktop windows were opened.


### Fresh Windows native-library serial acceptance (2026-09-27)

FS-45 verifies the FS-44 GUI-built C2 payload under Wine11/Box64. Both direct SQGI
and generated batch launch pass10 serial checks, exact private-PTY bytes, packaged
DLL loading, and clean exit. [Structured evidence](reports/packaging-field-study-2026-09-25/logs/c2-gui-git-windows-functional.json).
The replay harness supports explicitly validated fresh COM1 endpoints; requirements
and contracts were updated before code. Delivery traceability and whitespace
checks pass. Fresh NSIS lifecycle and native Windows remain unverified.


### Native module source guide (2026-09-27)

FS-46 adds a read-only example from Add native library after requirements/contracts.
The exact displayed Vala/Meson/Squirrel files compile and pass GI property, method
and signal assertions on aarch64. [Source evidence](reports/packaging-field-study-2026-09-25/logs/native-guide-source.json).
Full headless GTK acceptance passes opening, scrolling, closing and document
preservation. [Inspected guide](reports/packaging-field-study-2026-09-25/screenshots/native-guide-final/native-guide.png)
and [form instructions](reports/packaging-field-study-2026-09-25/screenshots/native-guide-final/native-guide-fields.png).
Native-library model preservation, delivery traceability and whitespace checks pass.
Cross-target packaging of this new example and advanced dependency usability remain
separate from the source-guide acceptance.


### GUI-authored native guide matrix (2026-09-27)

FS-47 followed the displayed source example through actual setup/library/runtime
controls and GUI Build. All3 outputs succeed; isolated extracted Linux packages
and the Windows batch under Wine11/Box64 pass constructor/property/method/signal
assertions. Library architectures and GI names match their targets.
[Evidence](reports/packaging-field-study-2026-09-25/logs/native-guide-matrix-verification.json)
and [inspected GUI result](reports/packaging-field-study-2026-09-25/screenshots/native-guide-package/progress/14-succeeded-complete.png).
The guide now explains separate SQGI runtime configuration after the walkthrough
exposed that missing step. Delivery traceability and whitespace checks pass.
Fresh installer lifecycle, FUSE launch and native Windows are not claimed.


### Field-study completion audit and current report (2026-09-27)

[Current usability report](reports/packaging-field-study-2026-09-25/report.md) now
summarizes evidence and priorities; [completion audit](reports/packaging-field-study-2026-09-25/completion-audit.md)
records outstanding gates. Corrected stale ledger/scope summaries, retained
historical failures, rechecked C1's clean revision43 log, and recorded current
original-repository state without edits. Report links, delivery traceability and
whitespace checks pass. This audit explicitly does not establish full completion.


### Guided native-library error recovery (2026-09-27)

FS-49 reproduces a missing source directory through real GUI controls. Fix setting
now opens Edit library for its supported fields, retaining Advanced for custom
options/recipes. [Corrected recovery](reports/packaging-field-study-2026-09-25/screenshots/native-recovery/03-guided-fix.png).
The actual correction invalidates the old check, saves a separate manifest and
clears all3 directory errors. [Manifest comparison](reports/packaging-field-study-2026-09-25/logs/native-recovery-manifests.json)
proves the corrected file exactly matches the previously built FS-47 manifest.
Full GTK (including custom-field fallback), model preservation, traceability and
whitespace checks pass. Unrelated runtime/tool warnings remain explicitly recorded.


### Playground missing-resource negative case (2026-09-27)

FS-50 uses a GUI-saved omission variant and a real successful AppImage build.
Its isolated packaged runtime fails exit1 on the missing images path while other
content and language-widget assertions pass. [Inspected failure](reports/packaging-field-study-2026-09-25/screenshots/playground-recovery/04-missing-images-runtime.png).
A separate correction was saved through Files and rechecked; its fresh GUI build
is active, so corrected runtime acceptance is not yet claimed. Original source,
three-target manifest and known-good output folders are preserved.


### Resource recovery completed and plugin fault isolated (2026-09-27)

FS-50's fresh corrected AppImage passes15 content+3 live-widget assertions and
clean exit under native isolated AppRun. [Restored images](reports/packaging-field-study-2026-09-25/screenshots/playground-recovery/11-restored-images-runtime.png).
FS-51 removes exactly one plugin from a disposable payload copy and observes a
specific missing-element failure with exit1; other content/UI checks pass.
[Fault evidence](reports/packaging-field-study-2026-09-25/logs/a-plugin-omission-functional.json).
This is runtime fault injection, not GUI plugin configuration recovery. Original
artifacts/manifests remain preserved. The observer's143 exit did not stop the build;
final producer success and the GUI completion screen were independently verified.


### Explicit plugin-file recovery (2026-09-27)

FS-52 preserves GUI-authored failing and corrected plugin-file manifests. Better
help and file-only scalar/list pickers follow requirements and contracts updates.
Full headless GTK and traceability checks pass. Actual Choose file recovery clears
the missing-file error and retains three unrelated warnings.
[Completed check](reports/packaging-field-study-2026-09-25/screenshots/plugin-files/07-corrected-result.png).
No fresh build/runtime acceptance is claimed for this corrected variant.


### Theme and language discoverability recheck (2026-09-27)

The current Appearance / languages page exposes a theme dropdown and a named
language picker without Advanced. Re-ran the focused GTK regression in private
Xvfb: PASS EDIT-appearance-languages, exit 0. Inspected the new
[page screenshot](reports/packaging-field-study-2026-09-25/screenshots/appearance-recheck/appearance.png).
The controls bundle existing compiled translations; they do not translate the app.
Requirements R-EDIT-16 and contract C-EDIT-08 cover this behavior.
Log: reports/packaging-field-study-2026-09-25/logs/appearance-recheck.txt.


### Compact current-form keyboard inspection (2026-09-27)

FS-53 inspects theme/language and native-library/guide controls at 1024×768 in a
private display. Physical keyboard input reaches language choices, the custom
theme entry and scrolled GI/code controls; dialog actions remain reachable.
The bridge records focus in its inventory. Original matrix manifest hash is
unchanged and normal close exits 0. This is scoped reachability evidence, not a
new build or a human satisfaction claim.
[Inspection record](reports/packaging-field-study-2026-09-25/logs/compact-current-verification.json),
[custom theme input](reports/packaging-field-study-2026-09-25/screenshots/compact-current/12-custom-theme-input.png).


### Verminal manifest and source audit (2026-09-27)

FS-54 compares the original reference, final GUI manifest and tracked source
objects. gserial's14 tracked files match the recorded commit; Verminal differs
only in the manifest and documented receive-buffer correction. Existing Linux
launchers lose source identity/category/comment/icon metadata, so preservation
remains incomplete. The local dependency recipe is not an authored Git pin.
[Detailed comparison](reports/packaging-field-study-2026-09-25/verminal-manifest-comparison.md).
No package or original source was changed; Windows runtime remains failed.


### Guided desktop metadata and pinned Verminal variant (2026-09-27)

FS-55 implements R-EDIT-17/C-EDIT-09: Application previews metadata from an existing
desktop file and applies it atomically. Description serialization rejects key
injection through KeyFile escaping. Focused GTK, full GTK,40 backend regressions,
catalog coverage and traceability pass. The icon-warning correction has a final
focused regression. [Inspected preview](reports/packaging-field-study-2026-09-25/screenshots/desktop-status-test/desktop-preview.png).
Actual GUI saved a separate Verminal variant with metadata, a local icon and a
fixed gserial Git revision, then started all3 builds. Artifact and fresh runtime
acceptance remain pending; execution-state.json records the live producer/job.


FS-55 follow-up: the new artifact metadata verifier rejects the historical ARM
payload against the corrected manifest (expected missing ID/icon). Literal
results-ledger evidence link audit finds345 paths and zero missing. The actual
GUI build remains live in fresh dependency preparation; no output pass is claimed.


### Fresh gserial installer lifecycle (2026-09-27)

FS-56 verifies installation of293 exact files and3 shortcuts, installed C-drive
batch execution with10 assertions/private PTY exchange and empty /app, and removal
of directory/shortcuts/registry. All pass under private Wine11/Box64. Desktop
shortcut activation remains failed: serial bytes observed, exit3, no captured
assertion result. Historical failed/withdrawn records remain preserved.
[Lifecycle evidence](reports/packaging-field-study-2026-09-25/logs/c2-gui-git-installer-lifecycle.json).


### Native-entry GI SDK regression and original C installer (2026-09-27)

FS-57 preserves the real fresh-SDK Verminal failure. Requirements/contracts now
cover target introspection development metadata for explicit native GI recipes;
all41 backend regressions pass and the unchanged manifest is rebuilding via GUI.
[Failure screenshot](reports/packaging-field-study-2026-09-25/screenshots/desktop-actual/progress/02-failed-building.png).
FS-58 verifies original C1 revision43 installation (293 exact files), installed
C-drive batch7 assertions and clean removal under private Wine11/Box64.
[Installed assertions](reports/packaging-field-study-2026-09-25/logs/c1-revision43-installed-functional.json).
Native Windows and C1 shortcut execution are not claimed.


### Corrected Verminal x86_64 artifact and native guide installer (2026-09-27)

The FS-55/57 corrected x86_64 artifact passes real self-extraction, GUI-authored
desktop metadata/icon verification,127 ELF architecture checks, isolated network
and private-PTY GUI tasks, inspected receive/error screenshots and clean exits.
[Exact-artifact results](reports/packaging-field-study-2026-09-25/logs/b-desktop-pinned-x86_64-functional.json).
The same matrix build is still preparing ARM; fresh FUSE/native x86_64 are not
claimed. FS-59 additionally verifies the native guide's installer (293 exact
files), installed example assertions and full removal under Wine11/Box64.
[Uninstall postconditions](reports/packaging-field-study-2026-09-25/logs/native-guide-uninstall-postconditions.json).

Theme/language discoverability recheck (2026-09-27): R-EDIT-16 / C-EDIT-08
passes the focused GTK workflow on a private 1024×768 Xvfb display.
Inspected the captured Appearance / languages page: the theme dropdown and
Choose languages action are both visible without scrolling or opening Advanced.
The language dialog shows named locale checkboxes, destinations and Apply languages.
[GTK log](reports/packaging-field-study-2026-09-25/logs/theme-language-recheck.txt),
[page screenshot](reports/packaging-field-study-2026-09-25/screenshots/theme-language-recheck/appearance.png),
[language picker](reports/packaging-field-study-2026-09-25/screenshots/theme-language-recheck/languages.png).

FS-60 adds actual x86_64 Verminal FUSE launch acceptance: exact TCP/UDP GUI bytes,
inspected receive screenshots, mounted payload library mappings and clean exit.
The failed fast-input baseline is preserved and remains failed. Requirements and
C-DEL-04 precede the network-mode runner implementation; all seven runner tests pass.
[FUSE result](reports/packaging-field-study-2026-09-25/logs/b-desktop-pinned-x86_64-fuse-recheck.json),
[runner regressions](reports/packaging-field-study-2026-09-25/logs/actual-network-runner-regressions.txt).

FS-61: the corrected Verminal GUI matrix completes all three outputs. Fresh ARM
metadata/icon,127 ELF architecture checks and isolated native GUI TCP/UDP checks
pass with inspected screenshots and clean exit. Windows build-folder payload has
587 hashed files and79 AMD64 PE files; runtime/installer remain pending.
[Matrix artifacts](reports/packaging-field-study-2026-09-25/logs/b-desktop-pinned-matrix.json),
[ARM network](reports/packaging-field-study-2026-09-25/logs/b-desktop-pinned-aarch64-network.json),
[completed GUI screenshot](reports/packaging-field-study-2026-09-25/screenshots/desktop-actual/gi-retry-progress/12-succeeded-complete.png).

FS-62 completes fresh ARM serial/error/clean-close and actual native FUSE network
acceptance. Windows installation matches587 files,3 shortcuts and HKCU registry;
uninstallation removes them. Installed GUI functional/visual acceptance fails
under Wine11/Box64: clipped text, failed keyboard-layout translation, ineffective
port edits and no peer bytes. Normal close exits0; this remains a failed test.
[ARM launcher](reports/packaging-field-study-2026-09-25/logs/b-desktop-pinned-aarch64-fuse.json),
[installed runtime failure](reports/packaging-field-study-2026-09-25/logs/b-desktop-installed-runtime.json),
[removal checks](reports/packaging-field-study-2026-09-25/logs/b-desktop-uninstall-postconditions.json).

FS-63: actual FUSE launch passes C1 revision43's7 assertions under QEMU and both
GUI pinned-Git gserial artifacts'10 assertions plus exact private serial exchange.
Explicit host fusermount3 resolves the historical helper issue; isolation remains
a separate test. FS-64 verifies fresh gworldscene installation927 files/3shortcuts/
HKCU entry and complete removal under Wine11/Box64; scene runtime failures remain.
[C1 launcher](reports/packaging-field-study-2026-09-25/logs/c1-revision43-explicit-helper-fuse.json),
[C2 launcher](reports/packaging-field-study-2026-09-25/logs/c2-gui-git-x86_64-fuse.json),
[C3 installed files](reports/packaging-field-study-2026-09-25/logs/c3-installed-files.json),
[C3 removal](reports/packaging-field-study-2026-09-25/logs/c3-uninstall-postconditions.json).

FS-65 directly records the current compact GUI's GTK settings (Sans10,96DPI,
scale1), unchanged manifest and normal close. FS-66 indexes237 action-linked
images, exposes one historical filename reuse and prevents future overwrite
before any GUI input. All8 study-runner regressions pass.
[GUI settings](reports/packaging-field-study-2026-09-25/logs/gui-environment-inspection.json),
[checkpoint index](reports/packaging-field-study-2026-09-25/checkpoint-index.md),
[regressions](reports/packaging-field-study-2026-09-25/logs/checkpoint-preservation-regressions.txt).

FS-67 installed gworldscene batch passes all6 scene assertions, private HTTP
terrain/imagery, inspected red/green pixels and clean application/wrapper exit.
/app is empty; loader traces use installed C-drive SQGI/GTK/gworldscene DLLs.
Scope is Wine11/Box64 plus explicit hashed Mesa, not native Windows. Title text
remains clipped, and earlier direct-probe failures are preserved.
[Installed scene](reports/packaging-field-study-2026-09-25/logs/c3-installed-scene-visual.json),
[decision coverage](reports/packaging-field-study-2026-09-25/walkthrough-coverage.md).

FS-68 closes actual x86_64 gworldscene AppImage FUSE launch: the hash matches the
previously isolated-tested artifact;6 assertions,HTTP terrain/imagery,inspected
pixels and clean exit pass under QEMU with explicit target Mesa. Runner inputs
are hashed and scope remains host-visible, not minimal-root isolation.
[Actual launcher scene](reports/packaging-field-study-2026-09-25/logs/c3-x86-fuse-visual.json).

C1 provenance follow-up archives retained Meson compiler/machine metadata for
both Linux architectures and Windows, plus separate host-GI stages and generated
cross files. All three current artifact hashes match their build reports.
This supplements original runtime/build evidence rather than reconstructing
historical timestamps: [retained provenance](reports/packaging-field-study-2026-09-25/logs/c1-retained-build-provenance.json).

FS-69 starts a real GUI build of the corrected explicit-plugin manifest, with
only its output folder changed to preserve earlier artifacts. Check passes;
fresh build/runtime acceptance remains pending in the active job.

FS-69 completion supersedes that pending checkpoint: the GUI build succeeds,
selected plugin bytes match the payload, isolated native ARM execution passes15
content+3 language-widget checks, and actual FUSE passes15 checks with clean exit.
Runtime and final build screenshots were inspected. The libpxbackend warning is
retained without claiming proxy-feature acceptance; all new sessions closed normally.
[Functional checks](reports/packaging-field-study-2026-09-25/logs/a-plugin-corrected-functional.json),
[launcher](reports/packaging-field-study-2026-09-25/logs/a-plugin-corrected-fuse.json).

FS-70 archives retained target/host-GI compiler and GIR metadata with9 matching
artifact hashes, and reopens6 primary manifests with identity,exact output/NSIS
selections and unchanged files. FS-71 follows requirements→contracts→code to
explain the automatic Git checkout in the library summary; a fresh GUI inspection
and full GTK regression workflow pass without authoring a dir key.
[Reopen evidence](reports/packaging-field-study-2026-09-25/logs/manifest-reopen-inspection.json),
[native provenance](reports/packaging-field-study-2026-09-25/logs/retained-native-build-provenance.json),
[GTK regression](reports/packaging-field-study-2026-09-25/logs/git-summary-gtk-regression.txt).

Field-study evidence reconciliation: regenerated action and ledger indexes using
`experiments/index-checkpoints.py` and `experiments/index-evidence.py`. There are
289 action-linked captures (260 unique images), 431 literal ledger references,
and no missing referenced files. One historical reused screenshot path remains
explicitly ambiguous. These counts prove reference integrity only. The C3 audit
now reflects FS-67 installed scene success with remaining text clipping. The
installed Verminal serial timeout is classified incomplete because no GUI actions
were recorded and no peer bytes arrived; it does not establish an app defect.

FS-72: fresh installed Verminal serial GUI test under private Wine11/Box64
passes exact peer request/reply, visible RX activity, disconnect, COM99 error and
clean shutdown (exit0, no fatal diagnostics). Text clipping still fails visual
acceptance and prevents independent exact receive-text inspection. See
[assessment](reports/packaging-field-study-2026-09-25/logs/b-installed-serial-observed-assessment.json).

Final-study current-state checks: `tests/test_contracts.py` passes13 tests and
`tests/test_delivery.py` passes3 tests, including traceability and staged install.
[Contract result](reports/packaging-field-study-2026-09-25/logs/final-contract-regressions.json),
[delivery log](reports/packaging-field-study-2026-09-25/logs/final-delivery-regressions.txt).

FS-73: real installed Verminal TCP and UDP GUI exchanges reached their exact
expected peer bytes; both Disconnect actions abort exit3 with the GLib
`g_socket_finalize` assertion. The assessment keeps exact transmit subchecks,
clipped receive text, and failed shutdown separate.
[Runtime assessment](reports/packaging-field-study-2026-09-25/logs/b-installed-network-observed-assessment.json).

Study delivery audit verifies18 retained primary/guide artifacts and6 primary
GUI-saved manifests against recorded SHA-256 values.
[Package files](reports/packaging-field-study-2026-09-25/package-files.md),
[identity check](reports/packaging-field-study-2026-09-25/logs/current-delivery-files.json),
[native Windows obligations](reports/packaging-field-study-2026-09-25/windows-validation-handoff.md).
Two saved idle study GUI sessions were explicitly cleaned up; no package runtime
success is inferred from that teardown.

The field-study [draft transition audit](reports/packaging-field-study-2026-09-25/draft-transitions.md)
checks ten archived intermediate/negative manifests against their follow-ups and
recorded GUI action ranges. Current native Windows availability was checked:
Linux ARM host, no running system VM and no provided remote Windows runner.
Native Windows acceptance remains outstanding; Wine results stay separate.

Field-study goal blocked on unavailable native Windows acceptance after three
consecutive runner-availability audits. Local artifact/manifest and draft audits
are recorded; Linux and Wine outcomes retain their exact scopes.
[Outstanding Windows work](reports/packaging-field-study-2026-09-25/windows-validation-handoff.md).


Linux Ooblerg integration (2026-09-27): requirements/contracts updated before
implementation. Optional Ubuntu 24.04/noble bundles, CPU-specific catalog search,
source-preserving alternatives and private SDK composition are verified by
14 provider, 5 SDK, 43 backend, 13 contract and 3 delivery tests, native-library
model checks and the private GTK workflow. Final targeted source-GI/runtime-filter
regressions passed. Four GSerial/GWorldScene Vala AppImages pass FUSE and isolated
runtime checks (aarch64 native, x86_64 QEMU). All ELF CPUs match and no development
files remain in final runtime payloads. See
[the report](reports/linux-ooblerg-2026-09-27/README.md) and
[artifact hashes](reports/linux-ooblerg-2026-09-27/logs/final-artifacts.json).
