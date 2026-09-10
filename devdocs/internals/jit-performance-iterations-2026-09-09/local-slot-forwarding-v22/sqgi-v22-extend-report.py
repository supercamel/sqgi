from pathlib import Path
p=Path('/tmp/sqgi-v22-report.py');s=p.read_text();s=s.replace("rows='\\n'.join", "seed17=json.loads((D/'application-seed17-control-summary.json').read_text());ablation=json.loads((D/'filter-copy-ablation/summary.json').read_text())\nfilter_controls='\\n'.join(f\"| {seed} | {w} | {r['medians_ns']['audit']:.3f} | {r['medians_ns']['v21']:.3f} | {r['medians_ns']['v22']:.3f} | {r['medians_ns']['v22_repeat']:.3f} |\" for seed,rr in [(17,seed17),(83,app)] for w,allrows in rr.items() for r in [allrows['filter_stream']])\nablation_rows='\\n'.join(f\"| {k} | {v['medians_ns']['fp']:.3f} | {v['medians_ns']['gp']:.3f} | {v['medians_ns']['fp_repeat']:.3f} | {v['medians_ns']['gp_repeat']:.3f} | {v['gp_over_fp']:.6f} |\" for k,v in ablation.items())\nrows='\\n'.join",1)
s=s.replace('controls retain seed83/count400003 and both warmup histories (40 processes).','controls retain both seed17/count200000 and seed83/count400003, each with both\nwarmup histories (80 processes in total).')
s=s.replace('## Correctness and generated code','''## Filter-stream regression and isolated ablation

The full56 filter_stream result is 5.160% slower than audit; the second seed is
5.956% slower. The regression repeats in the matched controls below, with V22
about 2.5–3.1% slower than V21. It is not dismissed as variance.

| Seed | Warmups | Audit ns | V21 ns | V22 ns | Same V22 repeat ns |
|---|---:|---:|---:|---:|---:|
{filter_controls}

Paired native captures show ten changed instructions: five adjacent load/store
pairs now use D0 instead of X9. The entire remaining 1192-byte loop matches after
masking relocation constants. This loop does not meet the scalar-region proof,
so forwarding itself does not apply; the typed-copy change applies more broadly.

A separate diagnostic preload matches that complete normalized code signature
and restores only those ten captured V21 instructions. Both modes use the same
frozen V22 executable and preload, including the same permission transitions,
cache synchronization, matching and logging. Five rotating rounds include two
copies of each mode, all eight unchanged applications, both seeds/counts and
warmup histories. Every run must match exactly one generated mapping and all
interpreter checksums. This benchmark-specific diagnostic is not production code
or accepted performance; it tests a proposed cause without rebuilding the runtime.

| Seed/warmups | FP ns | Restored GP ns | FP repeat ns | GP repeat ns | GP/FP |
|---|---:|---:|---:|---:|---:|
{ablation_rows}

The raw ablation, source and matched instruction specification are retained in
`filter-copy-ablation`. Its results guide a general compiler fix; they do not
remove the regression from V22's full score or prove the remaining audit gap's
cause. The next candidate should restrict typed-copy changes to regions whose
forwarding succeeds, then rerun the uninstrumented gates and full benchmark mix.

## Correctness and generated code''',1)
s=s.replace('profiles, regressions and limits. Full targets','profiles, regressions and limits. The repeated filter_stream regression is\nexplicitly retained, with a same-executable ten-instruction ablation to guide the\nnext general fix. Full targets',1)
s=s.replace('Use the fresh full score and instruction profile to choose the next change.','First use the repeated filter_stream regression and same-executable float-copy\nablation to restrict typed copies to successfully forwarded regions. Preserve\nthe full score including this regression. Then use the fresh instruction profile\nto choose the next change.',1)
p.write_text(s)
p=Path('/tmp/sqgi-v22-verify.py');s=p.read_text();s=s.replace("native=json.loads",'''for w in [4,5]:
 d=json.loads((D/f'application-seed17-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
 assert len(d['samples'])==8 and d['metadata']['seed']==17 and d['metadata']['iterations']==200000
 assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
filter_code=json.loads((D/'filter-stream-captures/code-comparison.json').read_text())
assert filter_code['code_bytes']==1192 and filter_code['forwarding_scratch_moves']==0
assert len(filter_code['typed_float_copy_instruction_changes'])==10 and filter_code['remaining_code_matches_after_relocation_mask']
for seed,n in [(17,200000),(83,400003)]:
 for w in [4,5]:
  d=json.loads((D/f'filter-copy-ablation/seed{seed}-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['raw'])==21
  assert d['metadata']['seed']==seed and d['metadata']['iterations']==n and len(d['samples'])==8
  assert all(len(v)==5 for row in d['samples'].values() for v in row.values())
  for raw in d['raw'][1:]:assert raw['stderr'].count('[copy-ablation] exact code matched;')==1
native=json.loads''',1);p.write_text(s)
print('Extended report and verifier for both-seed controls and isolated ablation')
