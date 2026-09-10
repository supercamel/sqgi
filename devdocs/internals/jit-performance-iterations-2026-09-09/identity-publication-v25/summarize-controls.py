from pathlib import Path
import json,statistics,math
s=Path('/tmp/sqgi-v25-self-publication-study');out={}
for w in [4,5]:
 for group,count in [('kernel',15),('floats',7),('application',8),('application-seed17',8)]:
  d=json.loads((s/f'{group}-control-w{w}.json').read_text());assert d.get('completed_rounds',d.get('metadata',{}).get('runs'))==5
  labels={'v23','v24','v25','v25_repeat'} if group=='kernel' else {'audit','v23','v25','v25_repeat'}
  assert len(d['medians'])==count
  rows={}
  for k,all_m in d['medians'].items():
   assert set(all_m)==(labels|{'node'} if group=='floats' else labels),(group,k,set(all_m))
   m={n:all_m[n] for n in sorted(labels)}
   samples={n:d['samples'][n][k] if group=='floats' else d['samples'][k][n] for n in m}
   assert all(len(v)==5 and all(math.isfinite(x) and x>0 for x in v) for v in samples.values())
   row={'medians_ns':{n:v*1000 for n,v in m.items()},'ranges_ns':{n:[min(v)*1000,max(v)*1000] for n,v in samples.items()},'v25_over_v23':m['v25']/m['v23'],'repeat_over_v23':m['v25_repeat']/m['v23'],'repeat_over_v25':m['v25_repeat']/m['v25']}
   for n in ['v24','audit']:
    if n in m:row['v25_over_'+n]=m['v25']/m[n]
   rows[k]=row
  out[f'{group}-w{w}']={'per_case':rows,'geomean_v25_over_v23':statistics.geometric_mean(v['v25_over_v23'] for v in rows.values()),'regressions_over_5pct_against_v23':[k for k,v in rows.items() if v['v25_over_v23']>1.05],'repeat_regressions_over_5pct_against_v23':[k for k,v in rows.items() if v['repeat_over_v23']>1.05]}
 for suite,count in [('owners',10),('methods',6),('members',6)]:
  d=json.loads((s/f'{suite}-v23-v25-w{w}.json').read_text());assert len(d['medians'])==count
  assert all(len(v)==5 for runtime in d['samples'].values() for v in runtime.values())
  rows={}
  for k,m in d['medians'].items():
   assert set(m)=={'v23','v25','node'},(suite,k,set(m))
   rows[k]={'medians_ns':{n:v*1000 for n,v in m.items()},'v25_over_v23':m['v25']/m['v23']}
  out[f'{suite}-w{w}']={'per_case':rows,'geomean_v25_over_v23':statistics.geometric_mean(v['v25_over_v23'] for v in rows.values()),'regressions_over_5pct_against_v23':[k for k,v in rows.items() if v['v25_over_v23']>1.05]}
(s/'regression-control-summary.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({n:{k:v for k,v in row.items() if k!='per_case'} for n,row in out.items()},indent=2))
