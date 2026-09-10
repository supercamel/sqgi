from pathlib import Path
import json,shutil,hashlib
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09/receiver-entry-guards-v21';B=R/'build-jit-audit-20260909/receiver-entry-guards-v21';D=Path('/tmp/sqgi-v21-native-profile')
lifetime=json.loads((D/'lifetime/summary.json').read_text());assert lifetime['native_lifetime_contract_passed'] and lifetime['reused_load_addresses']>0
s=json.loads((D/'summary.json').read_text());o=json.loads((D/'overhead.json').read_text());assert o['larger_profile_checksums_match'] and s['lost_samples']==0
binary=B/'sqgi';h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
table='\n'.join(f"| {', '.join(r['matching_gdb_functions']) or r['mapping']} | 0x{r['offset']:x} | {r['samples']} | `{r['instruction']}` |" for r in s['top_sampled_instructions'][:20])
categories=', '.join(f"{k}: {v/s['native_samples']:.2%}" for k,v in s['instruction_sample_categories'].items())
(D/'README.md').write_text(f'''# Native instruction sampling in the measured process

The diagnostic Linux preload captured {s['loads']} executable mapping lifetimes
and their actual code bytes in the sampled SQGI process. Perf used CLOCK_MONOTONIC,
the same clock as load/unmap events. Of {s['total_samples']} samples,
{s['native_samples']} ({s['native_sample_fraction']:.2%}) match a live captured mapping.
There were zero lost samples and {s['reused_load_addresses']} reused load addresses.
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
capture/plain median ratio {o['capture_over_plain']:.6f}. These small controls do not
establish performance improvement or guarantee zero profiling overhead. Snapshot
I/O and the profiler can alter timing.

All {s['stack_load_store_samples']} native load/store samples address stack slots.
Sampled native instruction categories: {categories}.

The instrumented native-intrinsic lifetime contracts also pass, recording
{lifetime['loads']} executable loads and {lifetime['reused_load_addresses']} reused
load addresses. This exercises capture across real code mapping reuse. Seven
additional GDB float-loop signatures identify all sampled mappings structurally;
only same-process captured bytes and lifetimes determine sample offsets.

| Structural function match or mapping | Offset | Samples | Instruction |
|---|---:|---:|---|
{table}

The wrapper uses the direct Linux mprotect/munmap syscalls and restores their errno.
This is limited to these single-threaded benchmark runs; it is not a production
concurrent JIT registry. The runtime source and frozen executable are unchanged.
Frozen SQGI SHA256: `{h(binary)}`.

Build/run, analysis and overhead scripts are retained. They run after the ordinary
measurement job is terminal and never concurrently with accepted timing, other
profiles, builds or GDB. Raw perf data is in the matching build artifact's
`native-instructions` directory and its manifest identifies its hash.
''')
shutil.copytree(D,A/'native-instructions',ignore=shutil.ignore_patterns('*.data','*.data.old'))
(B/'native-instructions').mkdir();q=B/'native-instructions/floats.data';shutil.copy2(D/'floats.data',q)
(A/'native-instructions/perf-manifest.json').write_text(json.dumps({str(q.relative_to(R)):h(q)},indent=2)+'\n')
print('Archived diagnostic instruction samples',s['native_samples'],'of',s['total_samples'])
