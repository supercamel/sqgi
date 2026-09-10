from pathlib import Path
import json,statistics,re
r=Path('/tmp/sqgi-precise-native-release-study')
result={'warmups4_speedup':{},'warmups5_speedup':{},'profitability':{},'profiles':{}}
for suite in ['owners','methods','members']:
 for old,new,w in [('v9','v11',4),('v10','v11',5)]:
  d=json.loads((r/f'{suite}-{old}-{new}-w{w}.json').read_text());assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
  v={k:m[old]/m[new] for k,m in d['medians'].items()}
  result[f'warmups{w}_speedup'][suite]={f'geomean_{old}_{new}':statistics.geometric_mean(v.values()),'per_case':v}
for suite in ['owners','methods','roots']:
 d=json.loads((r/'results'/('profitability-'+suite+'.json')).read_text());assert d['completed_rounds']==5
 v={k:m['on']/m['off'] for k,m in d['medians'].items()}
 result['profitability'][suite]={'geomean_on_off':statistics.geometric_mean(v.values()),'per_case':v}
for suite in ['kernels','applications','roots','members','owners','methods','floats']:
 t=(r/'profiles'/(suite+'-flat.log')).read_text();lost=int(re.search(r'Total Lost Samples: (\d+)',t).group(1));assert lost==0
 result['profiles'][suite]={'lost_samples':lost,'top_self_lines':[l.strip() for l in t.splitlines() if re.match(r'\s+\d+\.\d+%',l)][:12]}
(r/'followup-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
