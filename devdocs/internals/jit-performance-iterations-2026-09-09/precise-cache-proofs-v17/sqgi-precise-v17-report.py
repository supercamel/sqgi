from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi'); A=R/'devdocs/internals/jit-performance-iterations-2026-09-09'; D=A/'precise-cache-proofs-v17'
f=json.loads((D/'followup-summary.json').read_text());s=json.loads((D/'results/summary.json').read_text());n=json.loads((D/'profiles/exit-code-verification.json').read_text())
p=D/'README.md';t=p.read_text();assert '## Frozen build' not in t
t=t.replace('Frozen captures, full gates and measurements follow.','Frozen validation and measurements are recorded below.')
t+='''
## Frozen build and gates

Frozen CLI: build-jit-audit-20260909/precise-cache-proofs-v17/sqgi
SHA256: 63de3d98bca2856a0ce2589ae1615fa80f0c11218bc1010d1cbc787363692d4e

Release and strict ASan/UBSan each pass 100 selected tests with precise exits
enabled and with the default disabled configuration, plus all 41 independent
holdouts against interpreter checksums. The existing sqgipkg exclusion is
unchanged. x64/QEMU retains the same 32 known member_plan assertions; six of
seven executables pass. Those failures remain open.

The audit patch reconstructs all 27 changed runtime/test files. All 94 source
hashes and 88 original benchmark/test-script/driver hashes match. The binary was
frozen before accepted timing; no build, test or profiler overlaps timing.

## Frozen native captures

All 87 helper exit sites retain their exact bytecode IP and common SIDE_EXIT
publication. The decoder checks emitted code length separately from mappings.
Local frame sizes stay 208/176/144/144/144 bytes. Direct array guards, source pins
and floating operations remain; definitely cold cache paths are omitted.

| Function | Code bytes V16 | Code bytes V17 | Mapping V17 | Native stores |
|---|---:|---:|---:|---:|
'''
for k,v in n.items():t+=f"| {k} | {v['decoded_code_bytes_before']} | {v['decoded_code_bytes_after']} | {v['mapped_bytes_after']} | {v['native_heap_stores']} |\n"
t+='\nThe five functions save 3,056 emitted bytes and 8,192 mapped bytes.\n'
t+=f'''\n## Full-mix timing

Five rotating rounds on the unchanged 56 equally weighted components give
**{s['speedup']:.9f}x speedup against the frozen audit**. Integer checksums match
exactly; floating checksums use the existing tolerance. No case or sample is
removed from the aggregate.

| Suite | Audit / V17 time |
|---|---:|
'''
for k,v in s['groups'].items():
 t+=f"| {k} | {v['speedup']:.6f}x |\n"
t+='\n| Time ratio | Same-batch audit | V17 |\n|---|---:|---:|\n'
for engine in ['node','gjs']:
 for metric in ['geomean','p90']:
  t+=f"| {metric} / {engine} | {s['totals']['sqgi_baseline'][engine][metric]:.6f}x | {s['totals']['sqgi'][engine][metric]:.6f}x |\n"
t+='\nFixed-mix cases slower than audit by more than 5%: '+json.dumps(s['regressions_over_5pct'])+'.\n'
t+=f"\nThe separate seed83/count400003 application suite runs at {f['applications_seed83']['speedup']:.6f}x audit speed; >5% regressions: {json.dumps(f['applications_seed83']['regressions_over_5pct'])}. Both application seeds remain validated.\n"
t+='''
## Direct V16/V17 controls

Five rotating V16/V17/Node rounds in each warmup history. Values are V16 time
divided by V17 time; per-case medians and raw samples remain in the JSON files.

| Suite | Four warmups | Five warmups |
|---|---:|---:|
'''
for name in ['owners','methods','members']:
 a=f['warmups4_speedup'][name];b=f['warmups5_speedup'][name]
 t+=f"| {name} | {a['geomean_v16_v17']:.6f}x | {b['geomean_v16_v17']:.6f}x |\n"
assert all(1/v < 1.05 for w in [4,5] for suite in ['owners','methods','members'] for v in f[f'warmups{w}_speedup'][suite]['per_case'].values())
t+='\n| Method case | Four warmups | Five warmups |\n|---|---:|---:|\n'
for name,a in f['warmups4_speedup']['methods']['per_case'].items():t+=f"| {name} | {a:.6f}x | {f['warmups5_speedup']['methods']['per_case'][name]:.6f}x |\n"
t+='\n## Profitability and profiles\n\n'
for name in ['owners','methods','roots']:
 v=f['profitability'][name];t+=f"{name} geometric mean on/off time ratio: {v['geomean_on_off']:.9f}.\n"
t+=f"root_integer on/off time ratio: {f['profitability']['roots']['per_case']['root_integer']:.9f}.\n"
t+='\nSeven separate fresh profiles have zero lost samples; raw perf data is kept with the frozen binary. Top owner self-time entries:\n\n```\n'+'\n'.join(f['profiles']['owners']['top_self_lines'][:10])+'\n```\n'
t+='''
## Decision and remaining work

Retain the source-level proofs. Owners gain 1.3% in both warmup histories; methods
gain 1.8–2.1%. The table publisher improves 2.9–3.2% directly over V16, whose
report recorded a modest publisher regression. No direct case regresses by more
than 5%. Member-suite change remains small. These gains accompany smaller code
without altering helper or release semantics.
The full aggregate remains below the 2x first milestone and far from the final
Node/GJS thresholds; method profitability and x64 failures remain open. Older
array_append and records_4096 timing variance is not declared resolved by a new
batch. No old sample is replaced.

comparison-followup.md records the next bounded native integer comparison
proposal, including the canonical temporary release proof. No comparison code
is implemented in V17. Broader guarded builtin and canonical loop/call coverage,
x64 repairs, and matched fresh PGO/LTO excluding holdouts remain necessary.
Preserve the full goal and every lifetime, alias, weak, rollback and exit gate.
'''
t=t.replace('Fixed-mix cases slower than audit by more than 5%: [].','No fixed-mix case is more than 5% slower than audit.').replace('; >5% regressions: []. Both application seeds remain validated.','; no case is more than 5% slower. Both application seeds remain validated.')
t=t.replace('## Decision and remaining work','The owner profile places PINCL at 10.28%, DLOAD at 9.17%, and JCMP plus\nObjCmp/CMP_OP/IsFalse at 15.25% combined self time. These sampled proportions\nidentify candidates; they are not predicted speedups. Method execution still\nspends 46.59% self time in SQVM::Execute, supporting the need for broader native\ncoverage alongside helper reductions.\n\n## Decision and remaining work')
p.write_text(t)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';m=main.read_text();assert '## V17: proofs for cache checks' not in m
m+=f'''
## V17: proofs for cache checks

[Full V17 evidence](jit-performance-iterations-2026-09-09/precise-cache-proofs-v17/README.md).
Frozen SHA256 `63de3d98bca2856a0ce2589ae1615fa80f0c11218bc1010d1cbc787363692d4e`.
First-use cache probes are omitted only outside every backward-branch span;
unchanged parameter receivers/keys omit redundant identity checks after a
nonnull cache hit. Complete write facts cover conditional and multi-output
writes. Array guards, helper cache population and ownership semantics remain.
New tests cover cold/loop/conditional uses, mutable parameters, key tag collisions,
second-DLOAD writes and exact invalid-operand exits. Debugger controls each make
14 necessary SET helper calls and 20 native returns without guard/side exits.
Five native captures save 3056 code bytes and 8192 mapped bytes; all 87 exact-IP
exit sites pass decoding.

Full56 speedup is **{s['speedup']:.9f}x audit**. Geometric time ratios are
**{s['totals']['sqgi']['node']['geomean']:.6f}x Node / {s['totals']['sqgi']['gjs']['geomean']:.6f}x GJS**;
p90 ratios are **{s['totals']['sqgi']['node']['p90']:.6f}x / {s['totals']['sqgi']['gjs']['p90']:.6f}x**.
Direct controls and every >5% regression are recorded in the report.
On/off time ratios are {f['profitability']['owners']['geomean_on_off']:.6f} owners,
{f['profitability']['methods']['geomean_on_off']:.6f} methods and
{f['profitability']['roots']['per_case']['root_integer']:.6f} root_integer.
All four 100-test gates and both 41-holdout runs pass; x64 retains the same 32
assertions. Seven profiles have zero lost samples. Neither milestone nor full
goal is complete; next evaluate integer JCMP with its real temporary assignment.
'''; main.write_text(m)
p=A/'precise-next-steps.md';t=p.read_text();assert '## V17 checkpoint' not in t
t+=f'''
## V17 checkpoint

V17 implements the cold-cache and fixed-parameter proofs, with full56 speedup
{s['speedup']:.9f}x audit. See precise-cache-proofs-v17/README.md for both warmup
histories, per-case limits, profiles and strict validation. No baseline component
was changed. The full performance goal remains active.

Next evaluate comparison-followup.md against the fresh owner profile: integer
JCMP must assign the actual VM temporary and preserve final-release side exits.
Do not enable legacy private-spill loop takeover for precise functions. Broader
native call/builtin coverage, x64 repairs and matched fresh PGO/LTO remain open.
''';p.write_text(t)
print('V17 report written; inspect all metric fields and decision against results')
