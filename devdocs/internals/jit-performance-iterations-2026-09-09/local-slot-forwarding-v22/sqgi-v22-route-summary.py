from pathlib import Path
import json,re,collections
D=Path('/tmp/sqgi-local-slot-forwarding-study/route');result={}
for label in ['control','candidate']:
 d=json.loads((D/(label+'-entry.json')).read_text());log=(D/(label+'-entry.log')).read_text()
 m=re.search(r'loops try=.*? exec=(\d+) exec_success=(\d+) guard_fail=(\d+)',log);assert m
 calls=dict(collections.Counter(h['name'] for h in d['helpers']))
 assert d['entries']==calls=={'entry_root':3,'entry_parameter':3}
 assert tuple(map(int,m.groups()))==(6,6,0)
 assert all(h['result']==1 for h in d['helpers'])
 result[label]=dict(entries=d['entries'],helper_calls=calls,loop_attempts=6,loop_successes=6,guard_failures=0)
(D/'entry-route-summary.json').write_text(json.dumps(result,indent=2)+'\n');print(result)
