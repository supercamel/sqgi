# C-JOB: asynchronous jobs and supervision

**Deferred:** optional future CLI-backed package execution, outside the current
manifest-authoring delivery. Never reimplement packaging in the GUI.

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
