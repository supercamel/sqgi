from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-native-store-v16'
f=json.loads((D/'followup-summary.json').read_text());s=json.loads((D/'results/summary.json').read_text());control=json.loads((D/'kernel-control-summary.json').read_text());p=D/'README.md';txt=p.read_text()
assert '## Direct V15/V16 controls' not in txt
txt+='\n## Direct V15/V16 controls\n\nEach comparison has five rotating V15/V16/Node rounds. Values are V15 time\ndivided by V16 time; no case exceeds a 5% direct regression.\n\n| Suite | Four warmups | Five warmups |\n|---|---:|---:|\n'
for name in ['owners','methods','members']:
 a=f['warmups4_speedup'][name];b=f['warmups5_speedup'][name]
 assert max(1/v for v in a['per_case'].values())<1.05 and max(1/v for v in b['per_case'].values())<1.05
 txt+=f"| {name} | {a['geomean_v15_v16']:.6f}x | {b['geomean_v15_v16']:.6f}x |\n"
txt+='''
The owner gain repeats at 22.7–22.8%. Method gains are only 1.1–1.6%; publish_table
is 2.3–3.4% slower while transfers improve. Keep that individual regression
visible. The three straight-line publisher stores necessarily miss their empty
cache groups on first use, motivating cold-cache-followup.md. Their removal and
invariant-cache-followup.md remain unimplemented proposals, not credited gains.

## Array-append investigation

Forty independent timed processes cover two warmup histories and four rotating
labels: audit, V15, V16 and an identical V16 repeat. Each executes the unchanged
full 15-kernel script at the same nominal count, with per-case iteration and
checksum validation against JIT-off. All five rounds complete in both histories.

| Warmups | Audit ns | V15 ns | V16 ns | Identical V16 repeat ns |
|---|---:|---:|---:|---:|
'''
for w in [5,4]:
 m=control[f'warmups{w}']['array_append_medians_ns'];txt+=f"| {w} | {m['audit']:.3f} | {m['v15']:.3f} | {m['v16']:.3f} | {m['v16_repeat']:.3f} |\n"
txt+='\n'+(D/'append-control-interpretation.md').read_text()+'\n'
txt+='''
## Decision and next work

Retain the native store improvement with its code-size cost and measured
limitations. Owners gain substantially, while methods retain an interpreter
regression and some publisher cases worsen modestly. The full aggregate remains
below 2x audit speed and far from the Node/GJS completion thresholds.

Next evaluate the compiler-wide definitely-cold cache proof for reads/stores,
then proven invariant cache operands. The fresh owner profile also supports
native increments, double loads and comparisons, each with its actual ownership
and output-order proof. Broader guarded builtin or canonical-loop/call coverage
remains necessary. Do not enable legacy private-spill takeover for precise
functions, weaken lifetime witnesses, rewrite the fixed benchmark mix or omit
future matched PGO/LTO confirmation. No V17 code is implemented here.

All earlier frozen evidence is preserved. The x64 failures and older
records_4096/array_append variance remain open unless explicitly resolved by
new evidence; this iteration does not silently dismiss them.
''';p.write_text(txt)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';m=main.read_text();assert '## V16: native existing-slot stores' not in m
m+=f'''
## V16: native existing-slot stores

[Full V16 evidence](jit-performance-iterations-2026-09-09/precise-native-store-v16/README.md).
Frozen SHA256 `f99f3a6a2386bca4a09095ba8fc6c41695484fd33003688989c7e182475a7273`.
Native SET handles existing slots with no separate result write, sharing validated
addresses with GET and single-destination ownership checks with COPY. Weak values
are stored raw; sensitive releases and multi-output writes retain the helper.
Thirty ownership and twenty-four weak cases cover arrays/tables/instances and both
supported result forms, plus polymorphic and invalid-operand loops. Debugger
controls reduce 36 SET helper calls to eight cold resolutions with 12 native
successes and no guard/side exits. All 14 eligible stores are captured in five
functions; code grows 2704 bytes, including two member mappings returning to 8 KiB.

Full56 speedup is **{s['speedup']:.9f}x audit**; geometric time ratios are
**{s['totals']['sqgi']['node']['geomean']:.6f}x Node / {s['totals']['sqgi']['gjs']['geomean']:.6f}x GJS**,
and p90 **{s['totals']['sqgi']['node']['p90']:.6f}x / {s['totals']['sqgi']['gjs']['p90']:.6f}x**.
Owners gain 22.7–22.8% directly over V15, methods 1.1–1.6%, members 1.2–1.3%.
Publish_table is 2.3–3.4% slower. Array_append is 11.08% slower than audit in the
fixed mix and stays in the aggregate; separate unchanged-script controls and
interpretation are preserved in the V16 report. Neither application seed has a
>5% regression. Seed83 speed is {f['applications_seed83']['speedup']:.6f}x audit.

On/off time ratios are {f['profitability']['owners']['geomean_on_off']:.6f} owners,
{f['profitability']['methods']['geomean_on_off']:.6f} methods and
{f['profitability']['roots']['per_case']['root_integer']:.6f} root_integer; method
regression remains. Release and strict sanitizer builds each pass 100 tests
on/default and 41 holdouts. x64 retains its 32 known assertions; seven profiles
have zero lost samples. Owner SET helpers fall below 0.5%; PINCL/DLOAD/JCMP and
broader native coverage now matter. Next evaluate impossible cold cache probes
and provably invariant operands. Neither milestone nor full goal is complete.
''';main.write_text(m)
p=A/'precise-next-steps.md';t=p.read_text();assert '## V16 checkpoint and next implementation' not in t
t+='''
## V16 checkpoint and next implementation

V16's native existing-slot SET improves owners 22.7–22.8% over V15, bringing the
full mix to 1.571985665x audit speed. The method interpreter regression remains,
and publish_table worsens 2.3–3.4%. See precise-native-store-v16/README.md for the
full metrics, strict checks, native helper bypass and append-regression controls.
No baseline component or sample was replaced.

First evaluate cold-cache-followup.md: omit only statically impossible cache-hit
paths, keeping direct array paths, helper cache population, later same-group hits
and all loop-first sites. Consider both reads and stores. Then evaluate
invariant-cache-followup.md using complete bytecode write facts. Current owner
profiles put PINCL at 10.12%, DLOAD 9.78%, and JCMP plus comparison helpers above
10%; each native lowering needs its actual single/multiple-output and temporary
release proof. Broader guarded builtin and canonical-loop/call coverage, x64
repairs, timing-variance investigation and matched PGO/LTO remain open. No V17
code is implemented. Preserve the complete original goal.
''';p.write_text(t)
print('V16 report, README and next steps updated')
