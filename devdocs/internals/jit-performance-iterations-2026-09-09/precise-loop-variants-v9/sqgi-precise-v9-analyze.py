from pathlib import Path
import json,statistics,re
r=Path('/tmp/sqgi-precise-loop-variants-study')
result={'warmups4_speedup':{},'profitability':{},'profiles':{}}
for suite in ['owners','methods','members']:
 d=json.loads((r/(suite+'-v8-v9-w4.json')).read_text());assert all(len(v)==5 for x in d['samples'].values() for v in x.values())
 v={k:m['v8']/m['v9'] for k,m in d['medians'].items()}
 result['warmups4_speedup'][suite]={'geomean_v8_v9':statistics.geometric_mean(v.values()),'per_case':v}
for suite in ['owners','methods','roots']:
 d=json.loads((r/'results'/('profitability-'+suite+'.json')).read_text());assert d['completed_rounds']==5
 v={k:m['on']/m['off'] for k,m in d['medians'].items()}
 result['profitability'][suite]={'geomean_on_off':statistics.geometric_mean(v.values()),'per_case':v}
for suite in ['kernels','applications','roots','members','owners','methods','floats']:
 t=(r/'profiles'/(suite+'-flat.log')).read_text();lost=int(re.search(r'Total Lost Samples: (\d+)',t).group(1));assert lost==0
 result['profiles'][suite]={'lost_samples':lost,'top_self_lines':[l.strip() for l in t.splitlines() if re.match(r'\s+\d+\.\d+%',l)][:12]}
(r/'followup-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
