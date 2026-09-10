# Native instruction sampling in the measured process

The diagnostic Linux preload captured 7 executable mapping lifetimes
and their actual code bytes in the sampled SQGI process. Perf used CLOCK_MONOTONIC,
the same clock as load/unmap events. Of 2142 samples,
2112 (98.60%) match a live captured mapping.
There were zero lost samples and 0 reused load addresses.
Every captured mapping has the SQGI AArch64 prologue. Raw event records, binary
snapshots, sample IPs, and decoded instructions are retained.

Attribution uses PID, address and lifetime from this process. The two route-probe
mappings also match independently captured native code after masking relocation
constants. Optional function labels are structural matches to the V21 GDB code
captures; they are explicitly inferred, not an address join. Unmatched functions
remain unnamed. Instruction categories count sampled IPs, not exact instruction
cost; PMU skid applies.

This preload is diagnostic-only and was absent from accepted full56 timing and
the seven ordinary profiles. The same unmodified float benchmark ran at 2,000,000
iterations and five warmups; all seven checksums match a separate plain execution.
Three alternating instrumentation wall-time controls at 200,000 iterations have
capture/plain median ratio 1.012215. These small controls do not
establish performance improvement or guarantee zero profiling overhead. Snapshot
I/O and the profiler can alter timing.

All 1389 native load/store samples address stack slots.
Sampled native instruction categories: load: 25.99%, floating: 27.32%, store: 39.77%, other: 5.87%, branch: 1.04%.

The instrumented native-intrinsic lifetime contracts also pass, recording
47 executable loads and 31 reused
load addresses. This exercises capture across real code mapping reuse. Seven
additional GDB float-loop signatures identify all sampled mappings structurally;
only same-process captured bytes and lifetimes determine sample offsets.

| Structural function match or mapping | Offset | Samples | Instruction |
|---|---:|---:|---|
| helper_control-loop | 0x244 | 43 | `ldr	d1, [sp, #96]` |
| channels-loop | 0x2a0 | 40 | `fadd	d0, d0, d1` |
| pressure-loop | 0x510 | 37 | `fadd	d0, d0, d1` |
| pressure-loop | 0x398 | 33 | `fadd	d0, d0, d1` |
| pressure-loop | 0x688 | 32 | `fadd	d0, d0, d1` |
| integration-loop | 0x2b4 | 32 | `fadd	d0, d0, d1` |
| pressure-loop | 0x80c | 31 | `str	x9, [sp, #88]` |
| pressure-loop | 0x744 | 29 | `fadd	d0, d0, d1` |
| integration-loop | 0x2a0 | 29 | `ldr	d1, [sp, #48]` |
| integration-loop | 0x2e0 | 29 | `fadd	d0, d0, d1` |
| helper_control-loop | 0x264 | 29 | `str	x9, [sp, #32]` |
| retained-loop | 0x1f0 | 28 | `str	x9, [sp, #80]` |
| pressure-loop | 0x460 | 27 | `str	x9, [sp, #88]` |
| integration-loop | 0x240 | 27 | `str	x9, [sp, #48]` |
| retained-loop | 0x250 | 27 | `fadd	d0, d0, d1` |
| pressure-loop | 0x5cc | 26 | `fadd	d0, d0, d1` |
| pressure-loop | 0x5d8 | 26 | `str	x9, [sp, #88]` |
| pressure-loop | 0x51c | 24 | `str	x9, [sp, #88]` |
| pressure-loop | 0x3a4 | 24 | `str	x9, [sp, #88]` |
| pressure-loop | 0x800 | 24 | `fadd	d0, d0, d1` |

The wrapper uses the direct Linux mprotect/munmap syscalls and restores their errno.
This is limited to these single-threaded benchmark runs; it is not a production
concurrent JIT registry. The runtime source and frozen executable are unchanged.
Frozen SQGI SHA256: `912387b0a917c851942909ad8b314c45847013632d247b84dac8488795c9bcf5`.

Build/run, analysis and overhead scripts are retained. They run after the ordinary
measurement job is terminal and never concurrently with accepted timing, other
profiles, builds or GDB. Raw perf data is in the matching build artifact's
`native-instructions` directory and its manifest identifies its hash.
