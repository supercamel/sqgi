from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-shared-exit-v15'
f=json.loads((D/'followup-summary.json').read_text());s=json.loads((D/'results/summary.json').read_text());p=D/'README.md';txt=p.read_text()
assert '## Direct controls and profiles' not in txt
txt+='\n## Direct controls and profiles\n\nFive rotating rounds for each warmup history compare frozen V14/V15 directly.\nValues below are V14 time divided by V15 time; differences stay below 0.5%\nat the suite level. No direct-control case exceeds a 5% regression.\n\n| Suite | Four warmups | Five warmups |\n|---|---:|---:|\n'
for name in ['owners','methods','members']:
 a=f['warmups4_speedup'][name];b=f['warmups5_speedup'][name]
 assert max(1/v for v in a['per_case'].values())<1.05 and max(1/v for v in b['per_case'].values())<1.05
 txt+=f"| {name} | {a['geomean_v14_v15']:.6f}x | {b['geomean_v14_v15']:.6f}x |\n"
off=f['profitability'];owners=off['owners']['geomean_on_off'];methods=off['methods']['geomean_on_off'];root=off['roots']['per_case']['root_integer']
txt+=f'''
Five alternating on/off rounds give owner time **{owners:.6f}x**, method time
**{methods:.6f}x**, and root_integer time **{root:.6f}x** interpreter time.
Methods remain {(methods-1)*100:.2f}% slower. The >=2x aggregate first milestone and
its no-method-regression requirement remain unmet.

All seven fresh profiles have zero lost samples. Detailed self shares and trace
counts are preserved in followup-summary.json and profiles/. Native stores,
DLOAD, increments and interpreter coverage remain the next costs to address.
The decoder script and native-summary.json verify retained fast operations,
unchanged frames and exact shared exits in all five sampled functions.

## Decision and remaining work

Retain this bounded code-size improvement: the five captures save 2932 emitted
bytes and 8192 mapped bytes, with approximately flat direct throughput. Do not
claim an incremental speedup. Source/test changes and frozen results are fully
reproducible from the attached delta and combined audit patches.

Next implement and measure native existing-slot SET with no separate result
write, following next-native-store.md. The restored code headroom is useful for
that experiment but is not proof that its full lowering will fit. Broader native
coverage is still required; intrinsic-coverage-followup.md records a bounded
builtin option alongside the earlier canonical-loop-region design. Neither SET
lowering, intrinsic extension nor new loop-region support is implemented here.
Keep all lifetime and weakref witnesses, the old private-loop exclusion, the
unchanged 56-component mix, both seeds, holdouts, and future matched PGO/LTO
confirmation. The known x64 failures and records_4096 variance remain open.
'''
p.write_text(txt)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';m=main.read_text();assert '## V15: shared precise side-exit returns' not in m
m+=f'''
## V15: shared precise side-exit returns

[Full V15 evidence](jit-performance-iterations-2026-09-09/precise-shared-exit-v15/README.md).
Frozen SHA256 `2d487564d42242918bbd145c3c24deec01f9e94417787a48c74f1dba5cfb2fe1`.
Every failing helper retains its exact IP stub but shares one result publication
and frame restoration per function. Eight new late-error witnesses pass without
replaying prefixes. The native decoder verifies all 87 guard/IP stubs across five
functions. Recycle shrinks 7924→6740 emitted bytes; table_apply/apply each shrink
4176→3676 and return from 8 KiB to 4 KiB mappings. All hot lowering and local
frames remain unchanged in those captures. The five functions save 2932 emitted
bytes and 8192 mapped bytes.

Full56 audit speedup is **{s['speedup']:.9f}x**; geometric time ratios are
**{s['totals']['sqgi']['node']['geomean']:.6f}x Node / {s['totals']['sqgi']['gjs']['geomean']:.6f}x GJS**,
and p90 **{s['totals']['sqgi']['node']['p90']:.6f}x / {s['totals']['sqgi']['gjs']['p90']:.6f}x**.
No >5% case regression occurs in the fixed mix or seed83. Seed83 application
speed is {f['applications_seed83']['speedup']:.6f}x audit. Direct V14/V15 suite
comparisons remain within 0.5% under both warmup histories: retain for code space,
not an incremental throughput claim. On/off time ratios are {owners:.6f} owners,
{methods:.6f} methods and {root:.6f} integer root; the method regression remains.

Release and strict sanitizer builds each pass 100 tests enabled/default and all
41 holdouts. x64 retains the same 32 known assertions (six of seven executables
pass). Seven profiles have zero lost samples. No old evidence or benchmark is
replaced. Records_4096 variance remains unresolved. Next: guarded native
single-output existing-slot stores, then broader loop/intrinsic/call coverage.
Neither the first milestone nor the full goal is complete.
''';main.write_text(m)
p=A/'precise-next-steps.md';t=p.read_text();assert '## V15 checkpoint and next implementation' not in t
t+='''
## V15 checkpoint and next implementation

V15 shares the cold precise-exit return without changing hot lowering. Its five
captured functions save 2932 emitted bytes; the two member callees return to
4 KiB mappings. Eight distinct error continuations and all retained witnesses
pass. Direct V14/V15 throughput is approximately flat, and no case regression
above 5% appears in full56, the second seed or either warmup control.

Implement native single-output existing-slot SET next; see
precise-shared-exit-v15/next-native-store.md. Recycle has four eligible SET sites
and 1452 bytes of buffer headroom, but actual emitted fit and helper bypass must
be checked. Retain multi-output helpers and release/alias/weak/ancestor proofs.
See intrinsic-coverage-followup.md for guarded builtin coverage as another
bounded option before or alongside general canonical regions. No V16 code is
implemented. The full target, method regression, x64 failures, timing variance
and matched PGO/LTO confirmation remain open.
''';p.write_text(t)
print('V15 README, main report and next steps updated')
