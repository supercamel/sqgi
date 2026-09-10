from pathlib import Path
import json
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-integer-compare-v18'
s=json.loads((D/'results/summary.json').read_text());f=json.loads((D/'followup-summary.json').read_text());n=json.loads((D/'profiles/exit-code-verification.json').read_text());c=json.loads((D/'route/compact/verification.json').read_text())
sha=(D/'binary.sha256').read_text().strip();p=D/'README.md';t=p.read_text();assert '## Frozen build and full validation' not in t
t=t.replace('The earlier CLI comparison control reduced 40 helper calls to four mixed-float\ncalls with 40 native successes and no exits; final frozen verification follows.','The frozen CLI comparison control reduces 40 helper calls to four mixed-float\ncalls with 40 native successes and no exits. Its 42 attempts include two\nunsupported main prototypes; they are not native successes.')
t=t.replace('Full validation and measurement are in progress. No V18 speedup is claimed yet.','Final validation and measurements are recorded below.')
t+=f'''
## Frozen build and full validation

Frozen CLI: build-jit-audit-20260909/precise-integer-compare-v18/sqgi
SHA256: {sha}

Release and strict ASan/UBSan each pass 100 selected tests with precise exits
enabled and with the default disabled configuration, plus all 41 independent
script holdouts. The unchanged sqgipkg exclusion remains. Detailed CTest output
contains both activation markers in every configuration: ten AArch64 generated
code groups and the loop adaptation/lifetime contracts. The new host-architecture
assertions fail if these bodies are skipped. x64/QEMU still has the same 32 known
member_plan assertions; six of seven executables pass.

The combined 27-file audit patch reconstructs exactly. All 94 source hashes
and 88 original benchmark/test-script/driver hashes match. Five source files
change from V17. Historical evidence is preserved, with the validation correction
explicitly recorded. These current passes do not retroactively validate old
binaries against the formerly skipped tests.

## Frozen native evidence

All 87 exact-IP exits in the five benchmark-function captures still pass decoding.
The new integer JCMP appears in recycle; the other four precise functions have
no JCMP and retain their V17 code size. Frames and mapping sizes are unchanged.

| Function | V17 code bytes | V18 code bytes | Mapping bytes | Native JCMPs |
|---|---:|---:|---:|---:|
'''
for k,v in n.items():t+=f"| {k} | {v['decoded_code_bytes_before']} | {v['decoded_code_bytes_after']} | {v['mapped_bytes_after']} | {v['native_integer_comparisons']} |\n"
t+='\nThe two original large-function witnesses now use the compact fallback:\n\n| Function | Code bytes | Mapping bytes | Native helper calls | Exact exits |\n|---|---:|---:|---:|---:|\n'
for k,v in c.items():t+=f"| {k} | {v['code_bytes']} | {v['mapped_bytes']} | {v['helper_calls']} | {len(v['exact_guard_ips'])} |\n"
t+='''
Their decoder verifies every local BL target, the trampoline's 16-byte aligned
frame and saved return address, and each exact-IP exit branch. The original
functional tests cover all eight distinct division failures and all 70 member
sites; their coverage requirements and the 8 KiB buffer limit remain unchanged.

## Full-mix timing

Five rotating rounds use all 56 equally weighted components and the original
checksums. No case or sample is removed. Profiler/debugger/build activity is
separate from accepted timing.

'''
t+=f"**Audit / V18 time: {s['speedup']:.9f}x.**\n\n| Suite | Audit / V18 time |\n|---|---:|\n"
for k,v in s['groups'].items():t+=f"| {k} | {v['speedup']:.6f}x |\n"
t+='\n| Time ratio | Same-batch audit | V18 |\n|---|---:|---:|\n'
for engine in ['node','gjs']:
 for metric in ['geomean','p90']:t+=f"| {metric} / {engine} | {s['totals']['sqgi_baseline'][engine][metric]:.6f}x | {s['totals']['sqgi'][engine][metric]:.6f}x |\n"
t+='\nLargest remaining time ratios, retaining every full-mix case:\n\n| Engine | Suite / case | V18 / engine time |\n|---|---|---:|\n'
for engine in ['node','gjs']:
 for row in sorted(s['rows'],key=lambda r:r['ns']['sqgi']/r['ns'][engine],reverse=True)[:6]:
  t+=f"| {engine} | {row['suite']} / {row['name']} | {row['ns']['sqgi']/row['ns'][engine]:.6f}x |\n"
t+='\n| Fixed-mix regression | Audit ns | V18 ns | Slowdown |\n|---|---:|---:|---:|\n'
for row in s['regressions_over_5pct']:
 t+=f"| {row['suite']} / {row['name']} | {row['ns']['sqgi_baseline']:.3f} | {row['ns']['sqgi']:.3f} | {(1/row['speedup']-1)*100:.3f}% |\n"
if not s['regressions_over_5pct']:t+='\nNo fixed-mix case is more than 5% slower than audit.\n'

t+=f"\nSeed83/count400003 applications run at {f['applications_seed83']['speedup']:.6f}x audit speed. Their >5% regressions: {json.dumps(f['applications_seed83']['regressions_over_5pct'])}. Both application seeds remain validated.\n"
t+='\n## Direct V17/V18 controls\n\nEach comparison has five rotating V17/V18/Node rounds. Ratios are V17 time divided by V18 time.\n\n| Suite | Four warmups | Five warmups |\n|---|---:|---:|\n'
for name in ['owners','methods','members']:
 t+=f"| {name} | {f['warmups4_speedup'][name]['geomean_v17_v18']:.6f}x | {f['warmups5_speedup'][name]['geomean_v17_v18']:.6f}x |\n"
t+='\nPer-case direct regressions over 5%:\n\n'
for w in [4,5]:
 for name in ['owners','methods','members']:
  bad={k:1/v for k,v in f[f'warmups{w}_speedup'][name]['per_case'].items() if 1/v>1.05}
  t+=f"{name}, warmups={w}: {json.dumps(bad)}.\n"
t+='\n## Profitability and fresh profiles\n\n| Suite/case | JIT on / off time |\n|---|---:|\n'
for name in ['owners','methods','roots']:t+=f"| {name} | {f['profitability'][name]['geomean_on_off']:.9f} |\n"
t+=f"| root_integer | {f['profitability']['roots']['per_case']['root_integer']:.9f} |\n"
t+='\nAll seven profiles have zero lost samples. Raw data is retained with the frozen binary. Top owner self-time entries:\n\n```\n'+'\n'.join(f['profiles']['owners']['top_self_lines'][:10])+'\n```\n'
t+='''
## Decision and next work

Retain the correctness repairs and activated tests. Assess the comparison gain
using both direct warmup histories above; the full score includes all effects of
the weak lifetime guards and compact coverage fallback. The aggregate remains
below the first 2x milestone, and the Node/GJS completion thresholds remain unmet.
Prior array_append and records_4096 timing variance is not declared resolved by a
new batch. Current validation does not repair historical claims by implication.

Use the fresh profiles to select the next optimization. Integer comparisons were
an owner bottleneck; increments and double loads still need their actual release
and multi-output proofs. Broader canonical native loop/call and guarded builtin
coverage remains necessary for applications and the other suites. Preserve all
activated witnesses, the original 56-component goal, remaining x64 repairs and
matched fresh PGO/LTO with independent holdouts excluded from training.
'''
t=t.replace('Fixed-mix >5% regressions: [].','No fixed-mix case is more than 5% slower than audit.').replace('Their >5% regressions: [].','No case is more than 5% slower.')
t=t.replace('Read validation-correction.md first.','Read [the validation correction](validation-correction.md) first.')
t=t.replace('Retain the correctness repairs and activated tests. Assess the comparison gain\nusing both direct warmup histories above;','Retain the correctness repairs, activated tests, native comparison and compact\nfallback. Both direct warmup histories support the owner gain;')
t=t.replace('## Full-mix timing\n\n','## Full-mix timing\n\nMeasurements retain the audit configuration: RK3588S CPU4, GCC 13.3 Release\nwith -O3/-DNDEBUG/-g, int64/double values, JIT threshold 1, no PGO/LTO,\nNode 18.19.1 and GJS 1.80.2. Precise exits are enabled for this experiment.\n\n')
p.write_text(t)
p=D/'validation-correction.md';v=p.read_text().replace('The final gates and native evidence are\nreported in README.md when complete; no V18 timing is accepted before them.','All four current 100-test gates and both 41-holdout runs pass with activation\nevidence. The final native captures and performance measurements are reported\nin README.md; accepted timing began only after the corrected full gates.');p.write_text(v)
main=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';m=main.read_text();assert '## V18: activated validation' not in m
banner='''
> **Validation correction (V18):** several targeted AArch64 test bodies through
> V17 were skipped by an undefined architecture macro. Their earlier validation
> claims are withdrawn. V18 activates them and fixes the exposed defects.
> [Correction and current evidence](jit-performance-iterations-2026-09-09/precise-integer-compare-v18/validation-correction.md).
> Historical timings and raw artifacts remain preserved.
'''
first=m.index('\n');m=m[:first+1]+banner+m[first+1:]
m+=f'''
## V18: activated validation, lifetime repair and integer comparisons

[Full V18 evidence](jit-performance-iterations-2026-09-09/precise-integer-compare-v18/README.md).
Frozen SHA256 `{sha}`.

The corrected test guards expose and now cover stale closure-address reuse and
large-function native-coverage gaps. Weak lifetime guards protect specialized
closures without extending their lifetime. A compact helper-call fallback keeps
the original eight-exit and 70-member-site functions native within 8 KiB. Fixture
repairs preserve their intended release, weak, alias and multi-output contracts.
Integer JCMP now assigns the actual VM temporary natively; 76 debugger observations
verify its boolean before RETURN, while 24 exact failure sites preserve sensitive
releases and nonnumeric fallback. Frozen CLI helper calls fall from 40 to four
mixed-float cases, with 40 native successes and no exits.

Full56 speedup is **{s['speedup']:.9f}x audit**. Geometric time ratios are
**{s['totals']['sqgi']['node']['geomean']:.6f}x Node / {s['totals']['sqgi']['gjs']['geomean']:.6f}x GJS**;
p90 ratios are **{s['totals']['sqgi']['node']['p90']:.6f}x / {s['totals']['sqgi']['gjs']['p90']:.6f}x**.
Direct warmup controls, every per-case regression and profitability are retained
in the report. All four 100-test gates and both 41-case holdout runs pass with
explicit activation evidence. Seven profiles have zero lost samples. The same
32 x64 assertions remain. Neither milestone nor the full goal is complete.
''';main.write_text(m)
p=A/'precise-next-steps.md';t=p.read_text();t+=f'''
## V18 checkpoint and validation correction

See precise-integer-compare-v18/validation-correction.md before relying on earlier
targeted-test claims. The corrected guards execute ten AArch64 generated-code
groups and the loop lifetime/adaptation contracts; independent host checks catch
future skipped bodies. Preserve the new weak lifetime guards and compact fallback,
the original fixture coverage, and all strict gates. Full56 speed is now
{s['speedup']:.9f}x audit; the performance goal remains active.

Select further work from the fresh V18 profiles. Native PINCL and DLOAD require
combined output/release proofs; wider canonical loop/call and guarded builtin
coverage remains necessary. Do not substitute more owner-only wins for the full
56-component target. x64 repairs and matched fresh PGO/LTO remain open.
''';p.write_text(t)
print('V18 reports and explicit historical validation correction written')
