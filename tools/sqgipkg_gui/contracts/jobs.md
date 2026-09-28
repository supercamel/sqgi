# C-JOB: asynchronous jobs and supervision

**In progress:** Linux CLI-backed Build integration. Windows Job Object support,
structured live phases and Clean remain outstanding.

Requirements: R-JOB-01 through R-JOB-09; R-DOC-08; R-PKG-08.

## Interface

`Job(argv, cwd, log_path, event_path)` has states idle, running, cancelling,
succeeded, failed, cancelled. `start(on_log, on_event, on_done)` is asynchronous.
`cancel()` is idempotent. Completion is delivered exactly once after the child
tree terminates and output pipes reach EOF. The backend constructs argv from
saved manifest plus selected action and invocation settings.

The native `sqgipkg-runner` helper takes a cancellation-file path and command
argv after `--`. It forwards stdout/stderr, owns a POSIX process group or Windows
Job Object, and monitors cancellation. Signals/helper termination also clean up
the child tree. Cancellation exit status is 130. Normal child exit is propagated.

**C-JOB-01 Isolation:** execute argv directly. Support spaces, Unicode, empty
arguments, and shell punctuation literally. Multiple output streams are drained
concurrently without blocking GTK, even under sustained output.

**C-JOB-02 Cancellation:** cancellation terminates descendants, escalates after a
bounded grace period, drains streams, and ends cancelled. Normal leader exit
must not leave background descendants silently running. A late cancellation
cannot turn a failed or cancelled result into success.

**C-JOB-03 Accounting:** the full log is stored locally; the visible tail has a
fixed size limit. JSONL partial lines are buffered. A success event alone is
insufficient: zero exit plus the required existing artifact are necessary for
build success. Check/explain/clean success does not require package artifacts.

**C-JOB-04 Lifecycle:** one active mutating job per editor/project. Open/new/save
actions cannot change active job inputs. Closing while running offers stay or
cancel-and-close and waits for cleanup. Results retain manifest digest and target.

**C-JOB-05 Actions:** reveal/open artifacts uses explicit user actions and native
URI/file operations. Clean previews existing engine-selected paths and requires
an explicit action. Locked and write-lock cannot be selected together.

Acceptance IDs: `JOB-argv`, `JOB-streams`, `JOB-cancel-tree`, `JOB-outcomes`,
`JOB-lifecycle`, `JOB-actions`. Tests use real child/grandchild processes and
also a real package artifact; synthetic events do not qualify packaging.

Initial Linux implementation: a native helper receives a cancellation-file path
and argv after `--`, runs the command in a new session, acts as a subreaper, and
terminates/reaps remaining descendants before returning. Cancellation or loss
of the GUI parent returns 130. Unexpected surviving descendants after normal
leader exit are cleaned up and reported as failure. GTK asynchronously consumes
merged stdout/stderr in bounded chunks, persists the full byte log, and retains
a bounded visible tail. Invocation is `[runtime, cli, build, --manifest, path]`.
The saved revision is revalidated immediately before launch. Editing, save,
open/new and inspection are blocked during a build; log viewing and cancellation
remain available. Close offers Stay or Cancel build and close, then waits for
completion. Zero exit means command completion with unverified artifacts.
Acceptance first covers literal argv, output pressure, child/grandchild cleanup,
parent death, failure, duplicate launch and real GTK failure/cancellation paths.
Real package and artifact acceptance remains separate and outstanding.

Parent-death acceptance must close the GUI's actual output-pipe readers, not
just a process with file-backed output. The supervisor must survive broken-pipe
diagnostics long enough to terminate and reap descendants. Child commands keep
their normal signal behaviour.

C-JOB-03 the Build dialog includes an initially active Follow new output
checkbox. While active, update the bounded text buffer and scroll to its end.
While inactive, preserve that buffer and its scroll position; continue recording
all bytes and updating status/actions. Re-enabling immediately displays the
latest tail. GTK acceptance uses delayed real child output to check pause,
resume, bounded display, full logging and final cancellation.

Build-result protocol v1: `sqgipkg build --build-result FILE` exclusively creates
a new result file; refuse existing files, including the manifest. It records
`protocol_version`, `status` (running/succeeded/failed), `manifest_sha256`,
`expected_outputs` and `artifacts`. Each completed artifact has `target`,
`architecture`, `kind` (appimage/windows-directory/nsis-installer/nsis-script),
absolute `path` and file `size` (null for a directory). Publish only after that
backend build step verifies its output. Update after each output and on final
success/failure. Inspection must reject this writing option. Logs remain text.
This result channel does not yet provide structured build phases.

The GUI uses a fresh result path for each job. After the child exits, validate
protocol, saved-manifest digest, expected count, artifact shape, absolute paths,
allowed target/kind/architecture combinations and actual type/size. Zero exit
plus a succeeded complete report is creation success, explicitly untested at
runtime. Nonzero exit/cancellation always wins over report success. Missing or
invalid reports leave completion unverified. Show verified partial outputs on
failure without claiming overall success. Folder reveal uses Gio's URI handler
only after a button press, rechecking the path first. Headless acceptance must
not launch a real desktop file manager.

When build-result reporting is enabled, snapshot the existing AppImage/installer
file identity and modification tag before invoking its producer. Refuse to
report an unchanged previous file as a newly built artifact. Keep that file
intact on failure. Directory staging already recreates its destination.

Folder-action acceptance registers a capture-only URI handler in private
XDG_CONFIG_HOME/XDG_DATA_HOME. GIO may deliver a local directory as its URI or
native path; both must resolve to the verified directory. No desktop file
manager is launched. `JOB-artifact-results` covers report/file invariants and
`JOB-gui-artifacts` covers actual result widgets and folder-action dispatch.

Artifact reveal rechecks the output before dispatch. Report missing/changed
outputs beside the build result, with raw errors in a collapsed detail section;
do not hide modal-action errors in the parent status bar. The GTK test removes
its own completed fixture, invokes Open folder, and verifies visible recovery
guidance without another URI-handler launch. Test one normal editor close
request using the window's close method and natural application exit, not
`app.quit()`; asynchronous save/cancel guards keep their existing semantics.

The existing atomic build-result snapshot gains optional `progress` with
`target`, `architecture`, `phase` and `completed` (completed output count).
`expected_outputs` supplies the total. Phases are preparing, building, collecting,
packaging, verifying and complete. Publish before real work at these boundaries;
completion count advances only when a verified output is recorded. The GUI polls
the small private report while a job is active, validates protocol/digest, known
phase/target/architecture and count bounds, and displays Output N of M plus
stage text. This is a latest-state snapshot, not a complete event history.
Stop polling on completion and fence callbacks by unique per-job result path.
Progress cannot override cancellation or final exit/report outcome. Missing or
malformed progress falls back to the log rather than fabricating a stage.
Acceptance covers progress with no stdout, invalid fields, matrix count advance,
and retaining cancellation/final outcomes.
