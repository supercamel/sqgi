from pathlib import Path
import json,statistics
S=Path('/tmp/sqgi-transactional-float-copies-study');result={}
for w in [4,5]:
 d=json.loads((S/f'application-seed17-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['samples'])==8 and len(d['raw'])==21
 rows={}
 for k,m in d['medians'].items():
  rows[k]=dict(medians_ns={label:v*1000 for label,v in m.items()},v23_over_audit=m['v23']/m['audit'],v23_over_v22=m['v23']/m['v22'],repeat_over_audit=m['v23_repeat']/m['audit'],repeat_over_candidate=m['v23_repeat']/m['v23'],ranges_ns={label:[min(v)*1000,max(v)*1000] for label,v in d['samples'][k].items()})
 result[f'w{w}']=rows
(S/'application-seed17-control-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({w:{k:v for k,v in rows.items() if k in ['filter_stream','records_4096']} for w,rows in result.items()},indent=2))
