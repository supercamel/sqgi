# C-DEL: delivery and acceptance evidence

Requirements: R-DEL-01 through R-DEL-07; R-SCOPE-01, R-SCOPE-05, R-SCOPE-06.

**C-DEL-01 Launch/install:** `tools/sqgipkg-gui` works with a selected SQGI runtime
from any working directory. CMake installs the launcher, modules, schema and
CLI templates, icon and desktop integration. A GUI install option defaults
ON; CLI remains usable without GTK installed. Windows uses a native GUI launcher.

**C-DEL-02 Self-package (deferred):** a checked-in manifest packages the GUI and runtime
dependencies, shared sqgipkg backend/data, and runner. Packaged resource lookup
uses application resource paths, never a developer checkout path.

**C-DEL-03 Traceability:** a machine-readable map covers each requirement ID,
contract clause, implementation module and acceptance test ID. Tests verify
references exist; semantic contract tests establish behavior independently.
Changing schema/CLI options fails coverage checks until classified.

**C-DEL-04 Evidence:** CTest runs document/protocol and virtual-display GTK
tests. Native Windows CI runs supported Windows tests. Verification records
exact commands/results and build configuration. Native Windows execution is
never claimed from cross-compilation or mocks. Existing packaging tests remain the packaging engine acceptance suite.

The [end-to-end field study](../reports/packaging-field-study-2026-09-25/plan.md)
extends C-DEL-04 evidence for the fixtures specified by R-DEL-05. Its execution
record has the following obligations:

- Use a private virtual display and session bus, with isolated user state.
  Clear inherited desktop display/session endpoints before launching test
  applications. If the virtual display or capture path fails, stop GUI work
  until it is repaired; never fall back to the user's display.
- Create manifests through rendered GUI controls and the GUI save action.
  Automation may operate visible widgets. Direct document mutation, injected
  manifest fixtures, or JSON written outside the GUI cannot count as successful
  GUI authoring. Record any advanced/raw editor workaround separately.
- Capture the current workflow before changing it. Keep a numbered action log,
  actual screenshots, saved manifests, exact build commands, and diagnostics.
  Record evidence for output selections, resources, native recipes, checks,
  plan resolution, save/reopen, and the CLI-backed Build workflow or explicit
  external command handoff. Retain the exact executed command in either case.
- For each application or native-library variant, request both Linux
  architectures and Windows x86_64 NSIS. Record per-output compiler/ABI,
  payload architecture, and the resolved library/typelib paths. Cross-built
  libraries must match their target; host GI generation must not stage host
  libraries or conceal target API incompatibilities.
- Use the GUI-authored manifest for actual sqgipkg builds. Inspect produced
  artifacts and run functional checks from a relocated package with isolated
  state. Report source execution, build, payload inspection, emulated runtime,
  and native runtime as separate stages with pass/fail/blocked/not-run results.
  A skipped kernel, plugin, renderer, or native-module check is not a pass.
- C1 exposes `StudyNative.Counter` through generated GIR/typelib metadata.
  Its initial value is 40; `add(2)` returns 42, changes the readable/writable
  `value` property, and emits `changed(42)` exactly once. The consumer also
  sets/reads the property and checks a compiled revision value (42 initially,
  43 after the rebuild variant). It emits machine-readable checks and a
  nonzero exit on any failure. Source and package runs remain separate evidence.
- Findings include a reproducible action, observed versus expected behavior,
  screenshot/log references, severity, workaround, and whether the failure is
  in GUI guidance, manifest generation, the backend, the application, or the
  available environment. Fixes update requirements, then contracts, then code
  and targeted tests; retain baseline evidence and capture the retest.
- Runtime probes require both their functional assertions and a zero process
  exit status. A completion marker followed by a signal, nonzero exit or timeout
  fails acceptance. For a crash, retain payload hashes, exact script/arguments,
  loader provenance and runner versions. Compare minimal startup, kernel-only,
  warm-loop-only and combined cases where relevant; record diagnostic runner
  changes separately. Do not infer a native Windows failure from Wine/QEMU.
  A confirmed SQGI shutdown defect needs an executable regression that waits
  for teardown and rejects a crash even if the script printed its marker.
  Native-library reductions use a standalone C executable calling LoadLibrary
  and optionally FreeLibrary, independent of SQGI and application code. Retain
  compiler/fixture/DLL hashes, required completion markers and process status.
  Check a working control DLL and the suspected library; keep the regression
  failing until both markers and clean teardown pass. Display and renderer
  changes must be recorded diagnostic variants, not implicit acceptance fixes.
- Private QEMU/Wine runners include host `libgcc_s.so.1` for pthread teardown,
  which is not necessarily present in QEMU's static `ldd` dependency list.
  Wine's auxiliary processes must resolve their zlib DLL from the private
  Windows system directory. Record origins and hashes of added runner files;
  never satisfy these paths from application DLLs or the user's Wine prefix.
  A native pthread-exit fixture in the same minimal mount pattern must exit
  cleanly; an intentional failure after a marker must remain a failed probe.
  Serial isolation mounts only the test-owned POSIX PTY endpoint at an explicit
  private device path. It never exposes real serial hardware or the host's full
  device directory. Record peer bytes separately from consumer assertions.

The field study is a planned acceptance exercise, separate from the existing
automated test inventory below. Its results must be linked from the verification
record when executed; this contract change does not assert completed runtime
validation or add an in-GUI build/source-editing requirement.

Current acceptance IDs: `DEL-launch`, `DEL-install`,
`DEL-traceability`, `DEL-platform-evidence`.

Deferred acceptance ID: `DEL-self-package`.

Windows serial field-study execution may expose only the PTY allocated by the
private serial peer. Verify the supplied path is a `/dev/pts/<number>` character
device, bind that endpoint into the runner namespace, and map only private Wine
COM1 to it. Require exact ping/pong bytes and clean process exit. No host serial
hardware or desktop is exposed. GUI-free functional runs may explicitly select
the fixture's no-window mode; graphical startup stays a separate gate.

Box64 replay supports the same explicit `--serial-from-env` endpoint validation
and COM1 mapping. Reject conflicting serial bindings inherited from a baseline;
record the fresh endpoint in replay metadata. Accept serial functionality only
with the complete consumer result and exact peer exchange, in addition to the
runner's exit and crash checks.

Private Wine display support accepts an explicit study session directory only,
verifies its supervisor/Xvfb PIDs and a display number greater than 1, and binds
only `/tmp/.X11-unix/X<number>` into Bubblewrap. Clear the inherited display first.
Installer bootstrap failures due to missing Wine WoW64 modules are runner
failures, not evidence of an application defect. Preserve that failure before
provisioning verified matching Wine PE modules in a separate private prefix.

Wine namespace execution with `LANG=C.UTF-8` includes the standard C.utf8 locale
data and hashes its files as runner inputs. Preserve a diagnostic omission mode.
Reduce Unicode file failures using both GLib/GIO and image loading before blaming
the payload; verify the unchanged payload against the corrected locale setup.
For private Wine GUI runs, expose the standard DejaVu fonts referenced by the
private prefix at their registered paths and record their hashes as runner
inputs. Preserve the missing-font baseline and repeat the unchanged application;
do not add those fonts to the application to conceal an incomplete runner.
Renderer overrides are explicit diagnostic arguments recorded in runner argv.
An override-assisted run is separate from the default renderer result; a Cairo
pass cannot establish OpenGL scene functionality.

The isolated Linux AppRun runner accepts an explicit owned Xvfb session, verifies
its supervisor and server, and binds only that socket. Graphical runs provide
standard DejaVu fonts and fontconfig configuration as individually hashed runner
inputs. Locale definitions are explicit runner inputs too. No host GI repository,
application development library or source tree is exposed. Preserve application
exit status and pair it with actual UI/peer assertions; closing an empty window
does not establish functional success.
The Playground's optional UI regression changes its real GtkDropDown through
French, German and English and independently checks the GtkLabel text after each
notification. Report these separately from the initial fifteen content checks;
a failed UI assertion makes the process fail after clean application shutdown.
The TCP/UDP peer helper runs inside the same isolated namespace as the unchanged
packaged app and binds loopback only. Its Python interpreter, standard library,
helper source and shared-library dependencies are explicit recorded runner
inputs; its evidence directory is the only additional writable host mount.
Record raw received bytes and exact expected sequences. A nonzero app exit,
missing exchange, unexpected bytes or timeout fails acceptance. UI actions and
screenshots verify the displayed receive data independently of the peer log.
Verminal's buffer-lifetime regression compiles its actual transport sources,
queues known bytes through the protected receive helper, changes the caller's
array before the main context runs, and asserts the original values are emitted.
Keep baseline failure and corrected pass; rebuild and repeat actual TCP/UDP UI
checks after a snapshot-only correction. Exact peer bytes alone do not pass a
corrupted application receive display.

The GLib forwarding-DLL diagnostic records original and modified typelib hashes,
the original and replacement shared-library lists, and the binary-format source.
Validate the format/version and declared size before appending a new library
string and updating only the size and shared-library offset header fields.
Round-trip both files through the GI metadata reader and require identical
metadata except for the shared-library attribute. Execute the same timeout
fixture against baseline and modified payloads, requiring its callback marker
and clean exit. Never mutate the cached provider SDK or baseline package.
Runner acceptance also rejects QEMU's explicit uncaught-target-signal diagnostic
in captured output. Test the zero-exit shell case with an actual crashing child;
retain raw exit status, record the crash diagnostic separately, and reclassify
earlier recorded passes if their logs contain that diagnostic.
The packaged scene runner starts a loopback-only HTTP fixture inside Bubblewrap,
records tile and terrain requests, and supplies a writable readiness marker in
its dedicated evidence directory. Its Python files are hashed runner inputs.
The external observer verifies the owned Xvfb session, captures after readiness,
and checks the same red-geometry/green-imagery thresholds as the source baseline.
Require all six application assertions, both HTTP request classes, the rendered
pixels, and clean exit. A renderer failure remains a failed packaged run; do not
mount source build libraries to make it pass.
An explicit software-GL option mounts only EGL/GLX dispatch, Mesa software driver,
vendor JSON and their ELF dependency closure from the target runner sysroot.
Resolve dependencies by ELF metadata, hash every mounted file, and keep bundled
application libraries authoritative. Do not expose a full sysroot, host GI,
development headers, native-module build outputs or hardware devices.
A Box64 comparison replays a recorded Wine command with a new private prefix,
records its complete argv and emulator hash/version, and replaces interpreter
bindings only inside Bubblewrap. Record fatal diagnostics and missing markers
alongside raw process exit. This is alternate emulation evidence, never native
Windows acceptance.

Box64 replay accepts an explicit replacement payload and private display session. Verify the owned Xvfb/supervisor, replace only the recorded X socket and DISPLAY, keep namespace isolation, and record the selected payload and emulator identity. Graphical acceptance still requires all markers and clean exit.

Graphical Box64 comparisons explicitly mount and hash native font-library
wrappers and their dependencies when required by Wine; these are runner inputs,
not Windows package dependencies. Preserve the incomplete-runner baseline.

NSIS uninstall probes must keep the isolated Wine namespace alive until its
spawned uninstaller finishes. An explicit `wineserver -w` wait may follow the
launcher; preserve its status and require removal postconditions independently.
NSIS documents its temporary-copy child behavior at
https://nsis.sourceforge.io/Docs/Chapter3.html#3.2.2 .

The actual AppImage runner accepts a verified owned Xvfb session and optional
scene peer. Reject scene runs without that session. Hash the artifact, record
FUSE versus extraction mode, require all six scene checks plus peer requests and
clean exit, and expose readiness for an independent screenshot observer. A peer
using the host loopback namespace must say so; do not label it network-isolated.

Box64 scene probes use the deterministic imagery/terrain peer inside the same
unshared network namespace, mount explicit hashed Python runner dependencies,
and require a verified private display. Keep constructor-only success distinct
from six scene assertions, HTTP requests and actual rendered pixels.

An opt-in Box64 native software-GL comparison mounts a validated host-architecture
Mesa dependency closure and its EGL vendor file; record each input hash and
private display. Never mount the whole host library directory for this purpose.

Box64 Verminal network probes reuse the isolated TCP/UDP exact-byte peer from
the Linux/Wine runner. Mount explicit Python dependencies, bind only its evidence
directory, require the complete exchange and clean app exit, and inspect received
data in the actual GUI separately from transmitted bytes.

Private-window capture checks X11 viewability before reading pixels. A transient
ImageMagick/X11 capture failure retries while the existing application runs; it
must not terminate that runtime attempt. Keep failed capture evidence and require
an actual image for visual acceptance, independently of functional exit/checks.
X11 viewability alone does not prove the application has painted. Reject uniform
capture frames and continue observing; retain the rejected baseline image rather
than accepting a black image as visual evidence.

C-DEL-04 run_appimage.py network mode requires a verified private display and is
exclusive with scene mode. Launch the actual artifact beside the network peer,
requiring both clean execution and the peer's complete exact-byte acceptance.
Native apps need not emit the Squirrel fixture's STUDY_RESULT marker. Record the
peer path, explicit FUSE helper and target base root; label host-loopback and
filesystem visibility. Reject missing/forged displays before invoking an artifact.

C-DEL-04 GUI inspection reads Gtk.Settings properties from the running editor,
its window scale factor, GTK version and display/renderer environment. Keep
requested renderer distinct from toolkit settings. These observations are
read-only and must not change document state or expose hidden controls.

C-DEL-04 checkpoint indexing records walkthrough file/line, command, note,
screenshot existence/hash and unique capture times. Repeated references to an
identical event are duplicates, not new captures. Multiple distinct capture
times for one filename are an ambiguity requiring review, not proof of preserved
historical pixels. The index alone does not certify visual quality or coverage.
control.py rejects an already-existing screenshot destination before reading the
session or dispatching any GUI input. Regression acceptance preserves original
bytes and proves the refusal precedes session access.
