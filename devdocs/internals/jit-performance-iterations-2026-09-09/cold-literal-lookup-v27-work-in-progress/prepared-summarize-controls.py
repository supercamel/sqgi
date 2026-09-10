from pathlib import Path
import json,math,statistics,hashlib
S=Path('/tmp/sqgi-cold-literal-lookup-study');R=Path('/home/sam/Programming/sqgi');out={}
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
candidate_hash=h(R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi')
for w in [4,5]:
 for group,count in [('kernel',15),('floats',7),('application',8),('application-seed17',8),('owners',10),('members',6),('methods',6)]:
  pilot=group in ['owners','members','methods'];member=group in ['floats','owners','members','methods']
  d=json.loads((S/f'{group}-{"pilot" if pilot else "control"}-w{w}.json').read_text())
  assert d.get('completed_rounds',d.get('metadata',{}).get('runs'))==5
  assert candidate_hash in d['metadata']['hashes'].values()
  labels={'v26','v27','v27_repeat'}| (set() if pilot else {'audit'})
  assert len(d['medians'])==count
  rows={}
  for k,all_m in d['medians'].items():
   assert set(all_m)==(labels|{'node'} if member else labels),(group,k,set(all_m))
   m={n:all_m[n] for n in sorted(labels)}
   samples={n:d['samples'][n][k] if member else d['samples'][k][n] for n in m}
   assert all(len(v)==5 and all(math.isfinite(x) and x>0 for x in v) for v in samples.values())
   assert all(statistics.median(samples[n])==m[n] for n in m)
   row={'medians_ns':{n:v*1000 for n,v in m.items()},'ranges_ns':{n:[min(v)*1000,max(v)*1000] for n,v in samples.items()},'v27_over_v26':m['v27']/m['v26'],'repeat_over_v26':m['v27_repeat']/m['v26'],'repeat_over_v27':m['v27_repeat']/m['v27']}
   if 'audit' in m:row['v27_over_audit']=m['v27']/m['audit']
   rows[k]=row
  out[f'{group}-w{w}']={'per_case':rows,'geomean_v27_over_v26':statistics.geometric_mean(v['v27_over_v26'] for v in rows.values()),'regressions_over_5pct_against_v26':[k for k,v in rows.items() if v['v27_over_v26']>1.05],'repeat_regressions_over_5pct_against_v26':[k for k,v in rows.items() if v['repeat_over_v26']>1.05]}
(S/'regression-control-summary.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({n:{k:v for k,v in row.items() if k!='per_case'} for n,row in out.items()},indent=2))
