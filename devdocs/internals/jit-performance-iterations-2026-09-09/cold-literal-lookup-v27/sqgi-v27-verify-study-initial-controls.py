from pathlib import Path
import json,hashlib,math,statistics
R=Path('/home/sam/Programming/sqgi');A=R/'devdocs/internals/jit-performance-iterations-2026-09-09';D=A/'cold-literal-lookup-v27';S=Path('/tmp/sqgi-cold-literal-lookup-study')
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
binary=R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi';sha=h(binary)
assert sha=='368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa'
for manifest in ['source-manifest.json','unchanged-benchmarks-and-scripts.json']:
 for p,want in json.loads((D/manifest).read_text()).items():assert h(R/p)==want,p
for name,count in [('kernels-seed17',15),('applications-seed17',8),('applications-seed83',8),('roots-seed17',4),('members',6),('owners',10),('methods',6),('floats',7)]:
 d=json.loads((S/'results'/(name+'.json')).read_text());assert d['completed_rounds']==5 and len(d['medians'])==count
 if 'runtimes' in d['metadata']:
  assert d['metadata']['runtimes']['sqgi']['sha256']==sha,name
  assert d['metadata']['runtimes']['sqgi_baseline']['sha256']=='d8f47927295731c40bd5fd5e6a5eefed310b924de205d1fb4d310ca54b82f52e'
  for path,want in d['metadata']['source_hashes'].items():assert h(R/path)==want,path
 else:
  assert sha in d['metadata']['hashes'].values(),name
 assert d['metadata']['warmups']==5 and d['metadata']['cpu']==4
 for k,m in d['medians'].items():
  for runtime,value in m.items():
   samples=d['samples'][k][runtime];assert len(samples)==5 and all(math.isfinite(x) and x>0 for x in samples)
   assert statistics.median(samples)==value,(name,k,runtime)
profiles={}
for suite in ['kernels','applications','roots','members','owners','methods','floats']:
 text=(S/'profiles'/(suite+'-flat.log')).read_text();assert '# Total Lost Samples: 0' in text,suite
 assert (S/'profiles'/(suite+'.data')).stat().st_size>0
 profiles[suite]={'lost_samples':0,'data_bytes':(S/'profiles'/(suite+'.data')).stat().st_size}
controls=json.loads((S/'regression-control-summary.json').read_text());assert len(controls)==14
regressions={k:{field:v for field,v in row.items() if 'regressions_' in field and v} for k,row in controls.items()}
regressions={k:v for k,v in regressions.items() if v}
summary=json.loads((S/'results/summary.json').read_text());assert len(summary['rows'])==56
fullreg=[{'suite':r['suite'],'name':r['name'],'time_over_audit':1/r['speedup']} for r in summary['rows'] if 1/r['speedup']>1.05]
profit={}
for suite,count in [('owners',10),('methods',6),('roots',4)]:
 d=json.loads((S/'results'/('profitability-'+suite+'.json')).read_text());assert d['completed_rounds']==5 and len(d['medians'])==count
 assert all(len(values)==5 for row in d['samples'].values() for values in row.values())
 per={k:v['on']/v['off'] for k,v in d['medians'].items()}
 profit[suite]={'geomean_on_over_off':statistics.geometric_mean(per.values()),'per_case_on_over_off':per}
exit_code=json.loads((S/'profiles/exit-code-verification.json').read_text());assert len(exit_code)==6 and sum(r['guard_count'] for r in exit_code.values())==137
code=json.loads((S/'native-code-comparison.json').read_text());assert code['recycle']['after_bytes']==7344 and code['recycle']['before_bytes']==7344
assert all(v['normalized_equal'] for k,v in code.items() if k not in ['transfer','publish','table_apply','apply'])
assert all(code[k]['after_bytes']>code[k]['before_bytes'] for k in ['transfer','publish'])
assert all(code[k]['normalized_equal'] or code[k]['after_bytes']>code[k]['before_bytes'] for k in ['table_apply','apply'])
result={'binary_sha256':sha,'full56_speedup_over_audit':summary['speedup'],'runtime_ratios':summary['totals']['sqgi'],'full56_regressions_over_5pct':fullreg,'control_regressions_over_5pct':regressions,'profitability':profit,'profiles':profiles,'performance_acceptance_checks_pass':not fullreg and not regressions,'goal_targets_met':all(v['geomean']<=3 and v['p90']<=10 for v in summary['totals']['sqgi'].values()),'first_milestone_met':summary['speedup']>=2 and profit['owners']['geomean_on_over_off']<=1 and profit['methods']['geomean_on_over_off']<=1 and profit['roots']['per_case_on_over_off']['root_integer']<=1}
(S/'study-verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
