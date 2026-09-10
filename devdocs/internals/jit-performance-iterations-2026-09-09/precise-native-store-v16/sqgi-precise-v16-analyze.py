from pathlib import Path
import json,statistics,re
r=Path('/tmp/sqgi-precise-native-store-study')
result={'warmups4_speedup':{},'warmups5_speedup':{},'profitability':{},'profiles':{}}
for suite in ['owners','methods','members']:
 for w in [4,5]:
  d=json.loads((r/f'{suite}-v15-v16-w{w}.json').read_text());assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
  v={k:m['v15']/m['v16'] for k,m in d['medians'].items()}
  result[f'warmups{w}_speedup'][suite]={'geomean_v15_v16':statistics.geometric_mean(v.values()),'per_case':v}
for suite in ['owners','methods','roots']:
 d=json.loads((r/'results'/('profitability-'+suite+'.json')).read_text());assert d['completed_rounds']==5
 v={k:m['on']/m['off'] for k,m in d['medians'].items()}
 result['profitability'][suite]={'geomean_on_off':statistics.geometric_mean(v.values()),'per_case':v}
for suite in ['kernels','applications','roots','members','owners','methods','floats']:
 t=(r/'profiles'/(suite+'-flat.log')).read_text();lost=int(re.search(r'Total Lost Samples: (\d+)',t).group(1));assert lost==0
 result['profiles'][suite]={'lost_samples':lost,'top_self_lines':[l.strip() for l in t.splitlines() if re.match(r'\s+\d+\.\d+%',l)][:15]}
d=json.loads((r/'results/applications-seed83.json').read_text());assert d['completed_rounds']==5
v={k:m['sqgi_baseline']/m['sqgi'] for k,m in d['medians'].items()}
result['applications_seed83']={'speedup':statistics.geometric_mean(v.values()),'per_case':v,'regressions_over_5pct':[k for k,s in v.items() if 1/s>1.05]}
(r/'followup-summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
