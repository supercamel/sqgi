# Delivery and quality

Parent: [product requirements](README.md). Derived contract: [delivery](../contracts/delivery.md).

| ID | Requirement |
| --- | --- |
| R-DEL-01 | A source-tree launcher and installed sqgipkg-gui launcher work independently of the caller's working directory. |
| R-DEL-02 | CMake installs GUI modules/assets and a Linux desktop entry or native Windows GUI launcher. CLI-only use has no GTK requirement. |
| R-DEL-03 | The tool has its own sqgipkg manifest and can package itself with its backend, schema, templates, dependencies (deferred self-packaging). |
| R-DEL-04 | Contract tests cover document preservation, schema/CLI coverage, backend equivalence, inspection failure/cancellation, and actual GTK workflows. |
| R-DEL-05 | Test fixtures include bundled templates, existing application examples, spaces/Unicode paths, missing dependencies, stale defaults, and cancelled inspection. End-to-end studies also exercise a resource-rich Squirrel application, a native Vala application, and creation/integration of native libraries across x86_64 Linux, aarch64 Linux, and x86_64 Windows outputs. |
| R-DEL-06 | Runtime evidence names JIT/kernel configuration and platform. Native Windows CI runs the portable document/protocol tests; Windows GUI execution is reported separately. |
| R-DEL-07 | The requirement-to-contract-to-module-to-test map is checked for missing references. Verification records distinguish passed, failed, and not-executed checks. |

Automated GUI smoke tests run on a virtual display on Linux. Native Windows
validation is a separate acceptance obligation, not inferred from Linux tests.

Windows acceptance must tolerate equivalent long and 8.3 filesystem names,
spaces, Unicode, and source/temporary directories on different drives. Tests
compare existing files by identity and keep rejection of genuinely wrong paths.
Portable CLI and manifest regressions run before the expensive LLVM bootstrap;
the normal LLVM-enabled build must still pass its complete acceptance checks.
After a successful build, an independent suite failure must not hide other
suites. CI retains per-suite diagnostics and reports failures without turning
them into successful or skipped acceptance. Packaging changes are validated on
a candidate branch with native Windows CI before promotion to master.
A local push guard rejects master updates without a successful native Windows
run for the exact proposed commit, including missing, pending or failed runs.

## End-to-end packaging study

The [field-study plan](../reports/packaging-field-study-2026-09-25/plan.md)
defines the next manual and automated evidence for R-DEL-04 through R-DEL-07.
These are planned checks, not claims that real packages have already passed.

GUI inspections and packaged GUI runs use a private headless display/session;
they must not open windows, steal focus, or use the clipboard on the user's
desktop. Screenshots must show actual rendered application states.

Study manifests are created and saved through visible GUI controls. Record
where authoring needs advanced fields, raw JSON, CLI knowledge, or external
documentation. On supported Linux hosts, build through Review's CLI-backed Build
workflow and record its progress, logs and verified artifact results. Command
copy remains available for external automation and unsupported host supervision.

The Squirrel fixture exercises icons, translated strings, image resources,
typed `.sqk` kernels, and GStreamer plugins. The native application study uses
an isolated copy of Verminal. The native-library study covers a small new
module plus real dependencies such as gserial and gworldscene, including
cross-compilation, shared libraries, and GI metadata. Creating module source
is a separate task from authoring its packaging recipe; this study does not
silently add source-code editing to the GUI's scope.

Fresh Windows native-library payloads must be exercised against a newly allocated
private serial peer when serial behavior is claimed, including alternate-emulator
comparisons. Earlier payload or emulator results do not prove the new build works.

Translated-string acceptance includes changing the visible language selector
and observing the greeting update. Successful catalog reads at startup alone
do not prove the language control works. Fixture defects receive corrected
source, an actual widget-signal regression, and rebuilt-package verification.

The new-module fixture must exercise calls across GI rather than merely import
its namespace: construct an object, read/write a property, call a deterministic
method, and receive a signal carrying the method's result. Its source baseline
and packaged executions use the same assertions. A build-time source revision
changes the expected result so rebuild checks can detect stale native outputs.

Package success requires functional checks of bundled content, with evidence
against accidental use of source-tree files or host-installed modules.
Build, payload inspection, emulated execution, and native execution have
separate results. Failed or unavailable execution cannot be reported as a pass.
Usability findings cite screenshots and observed steps; an agent walkthrough
does not establish measured first-time human usability.

R-DEL-06/R-DEL-07 runtime acceptance includes clean process shutdown. A success
message printed by the application before a crash is not a passing execution.
Preserve the failing binaries, inputs, runner configuration and exit status;
reduce suspected crashes before assigning them to the application, runtime or
emulator. Confirmed product defects receive a regression that checks process
exit as well as functional assertions, on the affected target when available.
Isolated emulation runners include their own dynamically loaded shutdown
dependencies and keep those separate from the application's target libraries.
Runner regressions exercise actual thread teardown, not only process startup.
If importing a native library crashes, reduce it to an independent DLL loader
before assigning the failure to SQGI. Preserve load-only and explicit-unload
cases, control libraries, and the distinction between display-free and private
display execution. A diagnostic completion marker never replaces clean exit.

Field-study Windows runners may need their own private display even for silent
installer or media initialization. Validate the study-owned Xvfb process/session
before exposing its single Unix socket to the isolated runner. Never inherit the
user's display or bind all display sockets. Record 32-bit installer bootstrap
support separately from the architecture of the installed application.

An emulated Windows runner must supply the Unix locale data it requests. Missing
UTF-8 locale definitions must not be mistaken for missing Unicode application
assets. Keep runner locale data separate from packaged application dependencies.
Graphical emulation also supplies its ordinary system fonts. Missing registered
runner fonts must be investigated before classifying blank or unreadable windows
as packaging failures; custom application font requirements remain separate.
Packaged Linux graphical checks use the same verified private-display discipline.
Allow only explicit base-system font/locale inputs and the owned X socket beyond
the isolated payload and runner libraries. Record renderer overrides separately
from default-renderer acceptance and retain the absence of host GI/source trees.
Verminal TCP/UDP acceptance uses local peers in the application's private network
namespace. Verify exact ASCII/HEX and line-ending bytes at those peers, alongside
visible received data and clean shutdown. Do not expose the host network or
replace GUI interactions with direct calls into application methods.
Application defects discovered by the study remain distinct from packaging
defects. Preserve the original application repository, retain failing packaged
evidence, and correct only the isolated snapshot with a reviewable patch. For
deferred network receive callbacks, payload bytes must remain valid and unchanged
until the callback consumes them, independently of the caller's buffer lifetime.

When packaged GI metadata names a forwarding DLL with incomplete exports, isolate
metadata lookup from implementation availability. Diagnostic metadata changes
must use a separate payload copy and preserve all type/ABI records. A successful
diagnostic is evidence for a correction, not acceptance of an unchanged package.
Emulated acceptance must reject a recorded fatal target signal even when a
parent shell returns zero. A launcher must not hide an application or required
helper crash behind successful output markers.
Packaged scene acceptance must serve deterministic imagery and elevation inside
the isolated application's network namespace. It must render actual scene pixels
on the private display without borrowing source-tree libraries or host GI data.
OpenGL acceptance provides an explicit target-architecture software graphics
driver as a runner input, separate from application dependencies. Preserve the
driver-free baseline; do not interpret a stripped runner's absent EGL as proof
that an AppImage should bundle a machine's graphics drivers.
An alternate emulator diagnostic must preserve the baseline payload and use a
separate private prefix. Do not change host executable-format registrations or
silently substitute its results for the original runner.

Alternate-emulator GUI comparisons must use a newly verified private display and explicitly identify replacement application payloads; recorded desktop/socket values must never be blindly reused.

Actual AppImage scene acceptance must provide the same deterministic terrain and
imagery fixture as extracted-package acceptance, with a verified private display.
Distinguish host-visible FUSE execution from minimal-filesystem isolation.

Graphics-capable emulated Windows runners must distinguish missing runner GL
implementations from missing Windows payload DLLs; explicit host Mesa additions
are diagnostic runner inputs and must be hashed, not bundled into the app.

Field-study screenshot observers must wait for a viewable window and tolerate
transient capture failures without stopping the application under test. Record
capture failure separately from application runtime acceptance.

Actual Verminal AppImage launch checks use deterministic TCP/UDP peers and real
GUI interaction on a verified private display. Require exact ASCII/HEX bytes,
clean exit and inspected receive text. Clearly label the host-visible filesystem
and host-loopback scope; this does not replace isolated extracted-AppRun checks.

GUI study inspection records the active process's GTK font/theme settings,
window scale, toolkit version and requested renderer alongside screenshots.
Environment variables alone must not be presented as effective GTK settings.

The study evidence inventory links screenshot checkpoints to their recorded
actions and notes. Report missing images and reused capture filenames; a current
image cannot establish what an earlier overwritten capture showed.
New GUI capture requests must preserve existing screenshots and require a fresh filename.
