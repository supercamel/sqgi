from pathlib import Path
import json,shutil
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'precise-integer-compare-v18';d=json.loads((D/'regression-control-summary.json').read_text())
code={}
for rel in ['call-regression-captures','call-regression-captures/extra']:code.update(json.loads((D/rel/'code-comparison.json').read_text()))
t='''# Investigation of V18 call and float regressions

The original full56 score retains all five >5% audit regressions: direct_call,
float_call, channels_4, pressure_8 and retained_input. Nothing below replaces a
sample, changes a workload or changes its aggregation weight.

Forty timed SQGI processes execute the unchanged full 15-kernel script, using
five rotating audit/V17/V18/identical-V18 rounds in each of two warmup histories.
Per-case counts and integer/float checksums match independent interpreter
references. The full seven-case float script uses the same four SQGI labels plus
Node, with five rotating rounds in each history (50 timed processes). Benchmark
processes are pinned to CPU4; no build, debugger or profiler overlaps them.

| Case | Warmups | Audit ns | V17 ns | V18 ns | Identical V18 ns | V18 / V17 |
|---|---:|---:|---:|---:|---:|---:|
'''
for group,cases in [('kernel',['direct_call','branch_call','float_call']),('floats',['filter','channels_4','pressure_8','retained_input'])]:
 for k in cases:
  for w in [4,5]:
   v=d[f'{group}-w{w}']['per_case'][k];m=v['medians_ns'];t+=f"| {k} | {w} | {m['audit']:.3f} | {m['v17']:.3f} | {m['v18']:.3f} | {m['v18_repeat']:.3f} | {v['v18_over_v17']:.6f}x |\n"
t+='''
Direct calls are 5.4–5.6% slower than V17 and float calls 7.1–7.3% slower. Channels,
pressure and retained input also repeat the regression. The complete controls
expose branch_call (5.7–6.0%) and filter (5.7–6.8%) costs that did not exceed 5%
against audit in the original fixed-mix batch. These are retained and investigated,
not discarded for falling outside the initial list. Raw data includes every
other control case as well.

## Generated-code attribution

Both frozen binaries execute the unchanged kernel and float scripts in separate
debugger runs after timing. Captures cover the five initially flagged functions,
then branch_call, filter and the noisy array_append control. Each compiled
artifact's weak-reference metadata is saved alongside its bytes and disassembly.

| Native artifact | Added weak guard sites | Added instructions | Added code bytes |
|---|---:|---:|---:|
'''
for k,v in code.items():t+=f"| {k} | {len(v['weak_guard_sites'])} | {v['added_instructions']} | {v['added_instructions']*4} |\n"
t+='''
Each new guard loads the retained weak witness, loads and compares its type, and
branches to the existing failure path. It costs eight instructions per guarded
call. The decoder identifies the actual retained weak address and type before
removing that exact sequence. The remaining instruction streams match after
masking wide immediate values and branch displacements. This is structural
comparison, not a claim that arbitrary immediates are interchangeable. The
changed source, weak metadata, captures and repeated timings support attributing
these call costs to the necessary lifetime guard rather than the precise JCMP
optimization. Native mappings remain 4 KiB for these eight captured artifacts.

## Array-append variance remains open

| Warmups | Audit ns | V17 ns | V18 ns | Identical V18 ns |
|---|---:|---:|---:|---:|
'''
for w in [4,5]:
 m=d[f'kernel-w{w}']['per_case']['array_append']['medians_ns'];t+=f"| {w} | {m['audit']:.3f} | {m['v17']:.3f} | {m['v18']:.3f} | {m['v18_repeat']:.3f} |\n"
t+='''
The identical V18 labels differ by -5.77% and +8.13%, while the V18/V17 direction
changes between histories. Its captured entry adds no weak guard and has the
same normalized instruction stream and code size. Thus the call-guard finding
does not explain this older unstable case. Its cause remains unresolved; no
original full-mix sample is replaced. The first extra-capture postprocessor
incorrectly expected a new guard in every function and rejected this unchanged
entry. It was corrected to require zero added guards only for array_append; no
new timing or debugger capture was needed for that correction.

## Decision

Retain the closure-lifetime fix: the activated allocator-reuse contract exposed
incorrect execution without it. Preserve the comparison gain and the compact
large-function coverage repair, while recording the call regressions as real
costs to address next. The full aggregate is still only 1.610484881x audit speed.

First investigate folding the weak witness check into the already-required
closure guard helper, or a cheaper type-bit encoding at the same guard point.
Both must reject a dead witness before using the expected closure and must not
pin that closure. Do not hoist or remove the guard without its separate lifetime
and mutation proof. Keep the activated reuse/release/allocation/rollback tests.
Then pursue the broader native loop/call and guarded builtin coverage required
by the unchanged full56 goal; more owner-only gains cannot complete it.
'''
(D/'regression-investigation.md').write_text(t)
p=D/'README.md';s=p.read_text();needle='## Decision and next work';assert needle in s
s=s.replace(needle,'## Regression investigation\n\n[Full controls and code comparison](regression-investigation.md) preserve all\nfive fixed-mix regressions and the additional branch/filter costs. Repeated\ncontrols and exact added-guard sequences identify real call overhead. The\narray-append control remains noisy with an unchanged normalized entry.\n\n'+needle)
s=s.replace('Integer comparisons were\nan owner bottleneck; increments and double loads still need their actual release\nand multi-output proofs.', 'The comparison gain repeats at 14.6–14.7% for owners; the four comparison-related\nhelpers fall below the 0.5% owner profile threshold. PINCL is now 11.87% and DLOAD\n10.56% self time. First reduce the measured closure-guard cost without weakening\nthe lifetime fix. Increments and double loads still need their actual release\nand multi-output proofs.')
p.write_text(s)
p=D/'weak-guard-followup.md';s=p.read_text();s+='''
## Completed V18 controls

regression-investigation.md now records both warmup histories and eight native
captures. Seven artifacts add eight instructions per guarded call (one to eight
sites each); array_append's entry is structurally unchanged and still noisy.
Consider folding the weak check into the existing closure guard helper as well
as local type-bit encoding. This avoids a second emitted guard sequence while
preserving the same identity check point. No such change is implemented in V18.
''';p.write_text(s)
p=R/'devdocs/internals/jit-performance-iterations-2026-09-09.md';s=p.read_text();s+='''
V18's owner gain repeats at 14.6–14.7%, but direct/float calls and several float
workloads regress. [The full investigation](jit-performance-iterations-2026-09-09/precise-integer-compare-v18/regression-investigation.md)
uses 40 full-kernel and 50 full-float timed processes plus eight native captures.
It identifies eight added instructions per guarded call; the stale-closure fix
must remain while that overhead is reduced. Array-append's identical-binary
variance remains unresolved. No fixed-mix component or sample is replaced.
''';p.write_text(s)
p=A/'precise-next-steps.md';s=p.read_text();s+='''
V18 controls identify a concrete next cost: eight emitted instructions per
closure-lifetime guard. Fold the weak witness check into the already-required
closure guard helper or use a cheaper local type-bit encoding, preserving its
check point and weak lifetime. Activated address-reuse contracts must stay green.
See precise-integer-compare-v18/regression-investigation.md for both warmup
histories, extra branch/filter costs and unresolved array-append variance.
''';p.write_text(s)
print('V18 complete regression controls, code attribution and next action recorded')
