# Handling profiling data

Raw `perf` recordings were removed because DWARF stack samples captured process
environment memory, including a Google Maps API key. Text reports and benchmark
results remain available. Raw recordings are local artifacts and are ignored by
Git; do not force-add them or upload them as attachments.

The recording scripts now launch `perf` and its workload with a minimal
environment. When adding a recording command, explicitly allow only the
environment variables the workload needs. Do not pass the entire shell
environment. A clean environment reduces exposure, but recordings can still
contain other process memory and must remain private.

Removing files from the current tree does not remove their historical copies.
Rotate the exposed key and retire its old value in Google Cloud. If historical
removal is required, coordinate a Git history rewrite and replacement of affected
remote branches/tags; existing clones and GitHub cached references may retain
copies. Rotation is required independently of repository cleanup.
