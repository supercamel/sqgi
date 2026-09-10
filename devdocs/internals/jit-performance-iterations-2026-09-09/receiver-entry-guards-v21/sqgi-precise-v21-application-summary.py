from pathlib import Path
import json,statistics
S=Path('/tmp/sqgi-receiver-entry-guard-study');result={}
for w in [4,5]:
 d=json.loads((S/f'application-control-w{w}.json').read_text());assert d['completed_rounds']==5 and len(d['samples'])==8 and len(d['raw'])==21
 rows={}
 for k,m in d['medians'].items():
  rows[k]=dict(medians_ns={label:v*1000 for label,v in m.items()},v21_over_audit=m['v21']/m['audit'],v21_over_v19=m['v21']/m['v19'],repeat_over_audit=m['v21_repeat']/m['audit'],repeat_over_candidate=m['v21_repeat']/m['v21'],ranges_ns={label:[min(v)*1000,max(v)*1000] for label,v in d['samples'][k].items()})
 result[f'w{w}']=rows
(S/'application-control-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({w:{k:v for k,v in rows.items() if k in ['records_64','records_4096']} for w,rows in result.items()},indent=2))
