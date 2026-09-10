from pathlib import Path
import json,statistics
r=Path('/tmp/sqgi-precise-native-store-study/array-diagnostic');d=json.loads((r/'diagnostic.json').read_text());result={}
assert len(d['rows'])==30
for w in [4,5]:
 groups={n:[x for x in d['rows'] if x['runtime']==n and x['warmups']==w] for n in ['audit','v15','v16']}
 assert all(len(x)==5 for x in groups.values())
 m={n:statistics.median(x['us'] for x in rows) for n,rows in groups.items()}
 stats={n:sorted({tuple(x['stats']) for x in rows}) for n,rows in groups.items()}
 assert all(len(v)==1 for v in stats.values())
 normalized={n:tuple(x for x in v[0] if 'proto side_exits=' not in x) for n,v in stats.items()}
 assert len(set(normalized.values()))==1
 assert all('[sqjit:stats] proto side_exits=0' in stats[n][0] for n in ['v15','v16'])
 result[str(w)]={'median_ns':{k:v*1000 for k,v in m.items()},'v16_over_audit':m['v16']/m['audit'],'v16_over_v15':m['v16']/m['v15'],'route_stats':stats}
(r/'summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
