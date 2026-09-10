from pathlib import Path
import ast
p=Path('/tmp/sqgi-v28-verify-study.py');s=p.read_text();old='# No old iteration\'s regression-resolution exception applies here.\nunresolved=dict(regressions);resolution=None\n';assert old in s
new='''# Preserve every original flag. Only this iteration's fixed, both-seed
# investigation may resolve its records_4096 findings.
unresolved=dict(regressions);resolution=None
if regressions and (S/'records-replication/analysis.json').exists():
 investigation=S/'records-replication/analysis.json';evidence=json.loads(investigation.read_text())
 policy=json.loads((S/'records-replication/policy.json').read_text())
 assert evidence['verified'] and evidence['policy']==policy
 assert evidence['all_blocks_retained'] and evidence['original_flagged_controls_retained'] and evidence['full56_unchanged']
 assert policy['blocks']==4 and policy['runs_per_block']==5 and policy['no_optional_stopping']
 assert policy['seeds_counts']=={'17':200000,'83':400003} and policy['warmups']==[5,4]
 assert len(evidence['result_hashes'])==16 and len(evidence['original_control_hashes'])==4
 for name,want in evidence['result_hashes'].items():assert h(S/'records-replication'/name)==want,name
 for name,want in evidence['original_control_hashes'].items():assert h(S/name)==want,name
 if evidence['all_eight_cases_material_regression_excluded']:
  for group,fields in list(unresolved.items()):
   if group not in ['application-w5','application-seed17-w5']:continue
   if any(names!=['records_4096'] for names in fields.values()):continue
   key='17-w5' if group=='application-seed17-w5' else '83-w5'
   row=evidence['warmups'][key]['records_4096']
   assert row['new_samples_per_version']==40 and row['new']['paired_rounds']==20 and row['original_plus_new']['paired_rounds']==25
   assert row['new']['paired_bootstrap_95_interval'][1]<=1.05 and row['original_plus_new']['paired_bootstrap_95_interval'][1]<=1.05
   del unresolved[group]
  resolution={'report':'records-replication/analysis.json','sha256':h(investigation),'original_flags_retained':True,'criterion':'Both new-only and original-plus-new paired-bootstrap 95% upper bounds <=1.05 for every application case, seed and warmup under a fixed four-block replication','records_4096':{key:rows['records_4096'] for key,rows in evidence['warmups'].items()}}
'''
s=s.replace(old,new);ast.parse(s);p.write_text(s)
p=Path('/tmp/sqgi-v28-archive.py');s=p.read_text();s=s.replace("'shared-helper-fit-refined']", "'shared-helper-fit-refined','records-probe','buffer-pc-profile']")
s=s.replace("r=v['runtime_ratios'];p=v['profitability'];speed=v['full56_speedup_over_audit']",'''r=v['runtime_ratios'];p=v['profitability'];speed=v['full56_speedup_over_audit']
control_note='All fourteen paired controls have no greater-than-5% flag against V27.'
if v['control_regressions_over_5pct']:
 assert v['control_regression_resolution'] and not v['unresolved_control_regressions']
 control_note=('Initial records_4096 controls flagged +6.79% in the seed83 repeat and '
  '+8.59%/+8.82% in both seed17 copies with five warmups. A fixed four-block '
  'replication retains all eight cases, both seeds/counts, both warmup histories '
  'and identical repeats of both versions (40 new samples per version/history/seed). '
  'For every case/seed/history, both new-only and original-plus-new 95% paired '
  'bootstrap upper bounds are <=1.05. Original flags and raw data remain in '
  '[controls](study/regression-control-summary.json) and '
  '[replication](study/records-replication/analysis.json). This resolves the flags '
  'under the predeclared measured criterion; it does not rule out every host or runtime effect.')''')
s=s.replace('by more than 5% versus the audit, and none of fourteen paired control groups\nflags a greater-than-5% regression against V27. Application seed83 remains', 'by more than 5% versus the audit. Application seed83 remains')
s=s.replace('[Full results](results/summary.json) retain all56cases.', '[Full results](results/summary.json) retain all 56 cases.\n\n{control_note}')
s=s.replace('improvement; all fourteen paired controls and semantic/native gates pass.', 'improvement. All control flags have been investigated and resolved under the\npredeclared fixed-replication criterion; original results are retained.\nSemantic and native gates pass.')
# Record additional same-process evidence without treating it as a speedup.
s=s.replace('JIT-on/off geometric runtime ratios are owners', '''An additional diagnostic captures code and PC samples in the same process.
Across four successful buffer native calls it records 2801 samples, with 172
(6.14%) in the shared helper block. These samples can skid and are not causal
speedup estimates. Boundary debugger stops and zero warmups make this separate
from accepted timings. Setup failures and their fixes remain archived.

JIT-on/off geometric runtime ratios are owners''')
for a,b in [('the existing8192-byte','the existing 8192-byte'),('tier3 at7408bytes','tier 3 at 7408 bytes'),('tier2 at7884bytes','tier 2 at 7884 bytes'),('fall1772→1244','fall 1772→1244'),('GETK464→8; GET76→4','GETK 464→8; GET 76→4'),('all16previous','all 16 previous'),('All24tail-budget','All 24 tail-budget'),('natively;20observed','natively; 20 observed'),('The8192/8196-byte','The 8192/8196-byte'),('verify137exact','verify 137 exact'),('four100-test','four 100-test'),('both41-case','both 41-case'),('pass;15native','pass; 15 native'),('same32known','same 32 known'),('All96source and88unchanged','All 96 source and 88 unchanged'),('retains tier3','retains tier 3'),('shrinking\n7884→7408bytes','shrinking\n7884→7408 bytes')]:s=s.replace(a,b)
ast.parse(s);p.write_text(s)
print('Resolution/acceptance scripts now require this fixed BOTH-seed investigation; not executed')
