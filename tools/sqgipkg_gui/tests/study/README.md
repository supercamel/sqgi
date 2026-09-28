# Headless packaging study harness

The execution specification and current evidence live in
[`reports/packaging-field-study-2026-09-25`](../../reports/packaging-field-study-2026-09-25/plan.md).
These tools support that study; they are not a replacement for its runtime or
usability acceptance gates.

- `headless.py` owns an isolated Xvfb/Openbox/D-Bus session and cleans up its
  processes when the selected command exits. It never uses an existing desktop
  display as a fallback. Tools are supplied by a private extracted package root.
- `gui_driver.nut` loads the real GUI and accepts actions against mapped GTK
  controls. It does not call document mutation methods. Inventories expose the
  labels and controls actually present; unknown/unmapped controls are rejected.
  Responses also report that editor process's GTK font/theme/DPI settings,
  toolkit version and window scale. Requested renderer/backend variables are
  labelled separately from effective toolkit settings.
- `control.py` sends a control action, waits for the resulting GTK frame, and
  optionally captures the private display. `xkey` and `xtype` operate real
  keyboard input, including native file choosers. Actions and inventories are
  recorded in the session's `actions.jsonl`.
  An existing screenshot destination is rejected before any action is sent;
  use a fresh filename for retries and preserve the earlier frame.
- `prepare_playground.py` creates the sample sources, deterministic image/icon
  assets, compiled gettext catalogs, and hashes. It refuses to overwrite an
  existing project and does not generate a packaging manifest.
- `build.py` builds an existing GUI-authored manifest using this checkout's
  backend, retaining arguments, manifest hash, process ID, log, and exit status.
  Choose a new evidence name for every attempt. Extra flags are recorded as
  explicit diagnostic deviations from the GUI command.

Example, from `tools/sqgipkg_gui` (replace the workspace paths as appropriate):

```sh
python3 tests/study/prepare_playground.py /path/to/study/playground
python3 tests/study/headless.py \
  --tools /path/to/study/tools/root --session /path/to/study/session-a \
  -- ../../build/sqgi tests/study/gui_driver.nut /path/to/study/session-a
```

From another terminal, inspect/capture and then operate a visible control:

```sh
python3 tests/study/control.py /path/to/study/session-a --shot welcome.png
python3 tests/study/control.py /path/to/study/session-a \
  --op click --label 'Set up a project' --shot setup.png
```

Read the screenshot and inventory before choosing the next action. Recorded
widget keys are automation aids, not evidence that a human would discover the
control. Record raw editor use as expert assistance. The existing synthetic
GTK regression test sets fixture state directly in places; it must not be
substituted for this GUI-authoring walkthrough.

The Playground's gettext fixture reads singular entries from `.mo` catalogs;
it does not claim to test plural rules or process-global gettext domain binding.
Its source checks intentionally use host dependencies. Package tests must run
the same assertions with provenance/isolation checks before claiming success.


`isolated_linux.py` runs an extracted AppImage's original `AppRun` inside a
minimal Bubblewrap mount/user/network namespace. It mounts only the payload,
explicit host launcher tools and base target libc. No project sources, packaging
sysroots, host GI repositories, desktop or session bus are visible. For another
CPU it uses QEMU, binding the existing binfmt interpreter locations only inside
the namespace; it never changes host registrations. Runner file hashes, exact
argv, stdout and loader traces are saved under an immutable evidence name.
For graphical checks, `--display-session` permits only a verified owned Xvfb
socket, plus individually hashed standard font/fontconfig and locale inputs.
`--gtk-renderer` is an explicit diagnostic override; omit it to test the default.
`--ui-checks` runs the Playground's real dropdown-to-label language regression.
`--qemu-trace` enables the optional verbose syscall trace. Pair native-app exit
status with recorded UI actions and peer assertions before reporting a pass.
This tests extracted-launcher execution; actual AppImage mounting/extraction is
a separate gate. Example:

```sh
python3 tests/study/isolated_linux.py \
  --appdir /path/to/extracted/AppDir --sysroot /path/to/target/development-sysroot \
  --arch x86_64 --logs reports/packaging-field-study-2026-09-25/logs \
  --name unique-runtime-evidence
```

The `--sysroot` supplies only explicitly listed base libc files, never a whole
mounted sysroot. Baseline C1 and corrected C1 use identical isolation: the former
fails for absent GObject metadata; the latter passes all seven checks.

`extract_appimage.py` invokes an artifact's actual `--appimage-extract` path,
using QEMU for a different CPU, and retains its hash, exit status and file log.
`serial_peer.py` supplies a private pseudo-terminal and verifies exact serial
messages. `scene_peer.py` owns a private display and local HTTP fixture for
renderer, imagery and elevation checks; source and package runs stay separate.

`wine_probe.py` runs private Wine under QEMU with an isolated prefix and no
desktop. Linux runner libraries are distinct from Windows application DLLs.
The runner includes host libgcc for pthread teardown and its own zlib in Wine's
system directory, plus standard C.utf8 data for Unicode filename conversion,
recording their hashes. `--expect` requires a marker in
addition to clean exit; a marker followed by a crash is a failure. Diagnostic
omission flags exist only to reproduce the original incomplete-runner failures.
Installer process exit is only a process result: separately compare installed
files with the staged payload and run the installed app. Wine can return zero
after a child fails or after shortcut creation fails.
Both runtime runners reject QEMU uncaught-target-signal messages even when the
parent returns zero. `audit_wine_records.py --logs REPORT/logs --output NEW.json`
reclassifies historical Wine records without changing original evidence. Review
its affected list before reusing earlier process-pass claims.

For Verminal, `--network-checks` on either runtime runner starts `network_peer.py`
inside the private network namespace: TCP loopback port 18080 and UDP port 18081.
Use the GUI to send TCP ASCII `line-test` with CRLF, then HEX `00 01 41 FF` with
no ending; send UDP ASCII `udp-test` with LF, then HEX `FF 00 7F 20` with no ending.
Inspect received UI text independently, close the application, and check the
peer's exact-byte report. Correct echo bytes do not prove correct UI display.

`run_appimage.py --network-checks --display-session SESSION` instead invokes the
actual Verminal AppImage beside those peers. This mode uses **host loopback and
host-visible files**, not the isolated runtime namespace. Use an explicit
`FUSERMOUNT_PROG=/usr/bin/fusermount3` where needed, and `--runner-sysroot` for
QEMU's target loader. Its exact artifact hash, helper and runner root are recorded.
Never substitute this launcher check for the isolated extracted-AppRun check.

The report's `experiments/index-checkpoints.py` indexes screenshot references,
action lines and notes in archived walkthroughs. It records missing images and
distinct capture times sharing a filename. External runtime captures are outside
that index; link and inspect them separately. A complete index is not evidence
that every required decision or every variant was visually inspected.

For packaged gworldscene, `isolated_linux.py --scene-checks` runs the deterministic
HTTP server inside the app namespace. Wrap it with `scene_capture.py` under
`headless.py`; point `--ready` to `<logs>/<name>-scene/scene-ready` and provide
new screenshot/report paths. Six app assertions, tile/terrain requests, rendered
red/green pixels and clean exit are independent requirements. `--software-gl`
provides hashed target Mesa driver files and their ELF closure as runner inputs,
without exposing the full sysroot or source libraries. A driver-free minimal
namespace cannot establish whether a graphical package works on a desktop.

`windows_shutdown.py` repeats five shutdown cases against the manually assembled
SDK probe directory (which contains `sqgi.exe`, DLLs and `answer.sqk`). Supply
`--wine-root`, `--linux-sysroot`, `--prefix`, `--appdir`, `--logs`, and a new `--name`.
It is compatibility evidence, not proof of a built NSIS or native Windows run.
The [crash investigation](../../reports/packaging-field-study-2026-09-25/windows-shutdown-crash.md)
records the baseline, reduction and corrections. Run the independent regression
with `python3 tests/test_study_runner.py -v` or CTest `sqgi_test_study_runner`.

`dll_regression.py` compiles `dll_teardown.c` and tests load-only versus explicit
FreeLibrary teardown against a new copy of an actual Windows payload. It records
hashes and requires markers plus zero exit. The opt-in integration currently
exposes an unresolved GTK shutdown failure; see the [separate C3 report](../../reports/packaging-field-study-2026-09-25/windows-gtk-shutdown-crash.md).
