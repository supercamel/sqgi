# Jobs and artifacts

**Deferred:** optional future CLI-backed package execution, outside the current
manifest-authoring delivery. Never reimplement packaging in the GUI.

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
