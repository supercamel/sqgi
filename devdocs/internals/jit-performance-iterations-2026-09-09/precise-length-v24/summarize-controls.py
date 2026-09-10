from pathlib import Path
import json,statistics,math
S=Path('/tmp/sqgi-precise-length-study');result={}
for w in [4,5]:
 for group,count in [('kernel',15),('floats',7),('application',8),('application-seed17',8)]:
  d=json.loads((S/f'{group}-control-w{w}.json').read_text())
  assert d.get('completed_rounds',d.get('metadata',{}).get('runs'))==5
  assert len(d['medians'])==count
  expected={'audit','v23','v24','v24_repeat'}
  samples=d['samples'] if group!='floats' else {k:{label:d['samples'][label][k] for label in expected} for k in d['medians']}
  per={}
  for name,m in d['medians'].items():
   assert set(m)==(expected|{'node'} if group=='floats' else expected)
   m={label:m[label] for label in expected}
   assert all(len(samples[name][label])==5 for label in expected)
   assert all(math.isfinite(v) and v>0 for label in expected for v in samples[name][label])
   per[name]={'medians_ns':{label:v*1000 for label,v in m.items()},'ranges_ns':{label:[min(v)*1000,max(v)*1000] for label,v in samples[name].items()},'v24_over_audit':m['v24']/m['audit'],'v24_over_v23':m['v24']/m['v23'],'repeat_over_v24':m['v24_repeat']/m['v24'],'repeat_over_v23':m['v24_repeat']/m['v23']}
  result[f'{group}-w{w}']={'per_case':per,'regressions_over_5pct_against_v23':[k for k,v in per.items() if v['v24_over_v23']>1.05],'repeat_regressions_over_5pct_against_v23':[k for k,v in per.items() if v['repeat_over_v23']>1.05],'geomean_v24_over_v23':statistics.geometric_mean(v['v24_over_v23'] for v in per.values())}
 for suite,count in [('members',6),('owners',10),('methods',6)]:
  d=json.loads((S/f'{suite}-v23-v24-w{w}.json').read_text());assert len(d['medians'])==count
  assert all(len(values)==5 for runtime in d['samples'].values() for values in runtime.values())
  per={name:{'medians_ns':{label:v*1000 for label,v in m.items()},'v24_over_v23':m['v24']/m['v23']} for name,m in d['medians'].items()}
  result[f'{suite}-w{w}']={'per_case':per,'geomean_v24_over_v23':statistics.geometric_mean(v['v24_over_v23'] for v in per.values()),'regressions_over_5pct_against_v23':[k for k,v in per.items() if v['v24_over_v23']>1.05]}
(S/'regression-control-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({name:{k:v for k,v in row.items() if k!='per_case'} for name,row in result.items()},indent=2))
