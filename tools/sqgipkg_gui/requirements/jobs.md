# Jobs and artifacts

**In progress:** CLI-backed Build is now part of the GUI follow-up. Clean, structured live phases and Windows-host
supervision remain unimplemented. Never reimplement packaging in the GUI.

Parent: [product requirements](README.md). Derived contract: [jobs](../contracts/jobs.md).

| ID | Requirement |
| --- | --- |
| R-JOB-01 | Check, explain, build, and clean run outside GTK's event thread with a responsive UI. Process arguments are passed as arrays without implicit shell evaluation. |
| R-JOB-02 | stdout and stderr are consumed concurrently. The visible log is bounded and a complete local log is retained. |
| R-JOB-03 | Build events use a separate structured channel with target, phase, message, artifacts, and final outcome. Progress does not fabricate compiler percentages. |
| R-JOB-04 | Cancellation terminates the whole process tree, waits for termination, and reports cancellation rather than success. Closing the GUI cannot orphan an active build silently. |
| R-JOB-05 | Jobs sharing mutable project outputs are serialized. The UI prevents conflicting actions while allowing log inspection and cancellation. |
| R-JOB-06 | Success requires a successful child exit and verified expected outputs. Script-only NSIS output is never labelled an installer. |
| R-JOB-07 | Artifacts show paths and target provenance; users can reveal them or deliberately run a compatible result. Build logs remain available after failure. |
| R-JOB-08 | Locked/write-lock are mutually exclusive. Failures explain missing tools, missing inputs, stale locks, and native build failures with original diagnostic details. |
| R-JOB-09 | Clean is explicit, shows the affected paths, and uses the existing project's cleanup rules. Opening/editing never triggers clean. |

The first Build control uses a saved, unchanged manifest and prevents changing
its inputs through this editor while it runs. Opening/closing cannot silently
orphan it. Logs expose original CLI diagnostics without inventing percentages.
Until structured events and artifact verification exist, zero exit is labelled
“Build command completed — package verification still required”, never package
or runtime success. This interim state does not satisfy R-JOB-03/06/07 fully.

R-JOB-02 live output follows the newest messages by default. A visible Follow
new output control lets users pause updates to read the current log without
interrupting the build or complete log retention. Resuming shows the current
tail. Build state and cancellation remain live while log following is paused.

R-JOB-06/R-JOB-07 Build completion lists outputs reported by the CLI with
format, architecture and absolute path. Verify reported paths and file sizes
before saying the packages were created; a missing or malformed report cannot
be success. Keep creation distinct from target runtime testing. A partial matrix
failure may show completed outputs but remains a failure. NSIS scripts are
labelled scripts, never installers. Open folder is an explicit user action.

A successful tool exit must not turn an unchanged artifact left by an earlier
build into a newly produced output. Preserve that earlier file on failure and
report that the tool did not replace it.

R-JOB-07 artifact-action failures appear in the active Build window with an
ordinary explanation and optional diagnostic details. If an output disappeared,
explain that it may have been moved/deleted and that rebuilding restores it.
Keep Close available. R-JOB-04 a single close request on a clean, idle editor
exits normally; finishing a build must not require closing the editor twice.

R-JOB-03 multi-output builds show the current package format, CPU architecture,
position in the selected output set and an ordinary stage description. Report
real stage boundaries from sqgipkg, not guessed percentages or parsed log text.
The GUI must update during quiet commands and retain cancellation responsiveness.
Late progress from a previous job must never replace the current job's state.
