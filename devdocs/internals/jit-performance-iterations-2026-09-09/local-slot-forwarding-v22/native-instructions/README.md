# Native instruction sampling in the measured process

The diagnostic Linux preload captured 7 executable mapping lifetimes
and their actual code bytes in the sampled SQGI process. Perf used CLOCK_MONOTONIC,
the same clock as load/unmap events. Of 1606 samples,
1576 (98.13%) match a live captured mapping.
There were zero lost samples and 0 reused load addresses.
Every captured mapping has the SQGI AArch64 prologue. Raw event records, binary
snapshots, sample IPs, and decoded instructions are retained.

Attribution uses PID, address and lifetime from this process. The two route-probe
mappings also match independently captured native code after masking relocation
constants. Optional function labels are structural matches to the V22 GDB code
captures; they are explicitly inferred, not an address join. Unmatched functions
remain unnamed. Instruction categories count sampled IPs, not exact instruction
cost; PMU skid applies.

This preload is diagnostic-only and was absent from accepted full56 timing and
the seven ordinary profiles. The same unmodified float benchmark ran at 2,000,000
iterations and five warmups; all seven checksums match a separate plain execution.
Three alternating instrumentation wall-time controls at 200,000 iterations have
capture/plain median ratio 1.004471. These small controls do not
establish performance improvement or guarantee zero profiling overhead. Snapshot
I/O and the profiler can alter timing.

442 native sampled IPs are stack load/store instructions.
FMOV samples are counted separately as register moves.
Sampled native instruction categories: register_move: 61.48%, store: 23.92%, load: 4.12%, other: 6.54%, branch: 1.97%, floating: 1.97%.

The instrumented native-intrinsic lifetime contracts also pass, recording
47 executable loads and 31 reused
load addresses. This exercises capture across real code mapping reuse. Seven
additional GDB float-loop signatures identify all sampled mappings structurally;
only same-process captured bytes and lifetimes determine sample offsets.

| Structural function match or mapping | Offset | Samples | Instruction |
|---|---:|---:|---|
| integration-loop | 0x1e4 | 92 | `fmov	d16, d0` |
| helper_control-loop | 0x164 | 92 | `str	d0, [sp, #48]` |
| pressure-loop | 0x690 | 87 | `fmov	d17, d0` |
| pressure-loop | 0x4e8 | 85 | `fmov	d17, d0` |
| pressure-loop | 0x838 | 78 | `fmov	d17, d0` |
| pressure-loop | 0x90c | 77 | `fmov	d17, d0` |
| pressure-loop | 0x414 | 76 | `fmov	d17, d0` |
| pressure-loop | 0x5bc | 75 | `fmov	d17, d0` |
| pressure-loop | 0x764 | 71 | `fmov	d17, d0` |
| filter-loop | 0x164 | 68 | `fmov	d16, d0` |
| branching-loop | 0x2a0 | 60 | `str	d0, [sp, #16]` |
| retained-loop | 0x198 | 57 | `str	d0, [sp, #48]` |
| channels-loop | 0x244 | 38 | `fmov	d17, x9` |
| retained-loop | 0x1ec | 36 | `fmov	d17, d0` |
| integration-loop | 0x2d8 | 19 | `fmov	d1, d20` |
| channels-loop | 0x53c | 16 | `ldr	x9, [sp, #48]` |
| retained-loop | 0x328 | 16 | `ldr	x9, [sp, #32]` |
| channels-loop | 0x464 | 15 | `str	d16, [sp, #80]` |
| branching-loop | 0x164 | 14 | `str	d0, [sp, #48]` |
| branching-loop | 0x1e0 | 14 | `str	d0, [sp, #88]` |

The wrapper uses the direct Linux mprotect/munmap syscalls and restores their errno.
This is limited to these single-threaded benchmark runs; it is not a production
concurrent JIT registry. The runtime source and frozen executable are unchanged.
Frozen SQGI SHA256: `2abb1226b184f7b0d12d1ff64e62852a9d3c911553021c3acd79fd0fdb8e1a7f`.

Build/run, analysis and overhead scripts are retained. They run after the ordinary
measurement job is terminal and never concurrently with accepted timing, other
profiles, builds or GDB. Raw perf data is in the matching build artifact's
`native-instructions` directory and its manifest identifies its hash.
