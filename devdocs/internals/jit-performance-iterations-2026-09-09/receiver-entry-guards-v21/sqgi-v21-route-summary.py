from pathlib import Path
import json,re,collections
D=Path('/tmp/sqgi-receiver-entry-guard-study/route');result={}
for label in ['control','candidate']:
 d=json.loads((D/(label+'-entry.json')).read_text());log=(D/(label+'-entry.log')).read_text()
 totals=re.search(r'loops try=.*? exec=(\d+) exec_success=(\d+) guard_fail=(\d+)',log);assert totals
 result[label]={'instrumented_primary_entries':d['entries'],'primary_helper_calls':dict(collections.Counter(h['name'] for h in d['helpers'])),'total_loop_attempts':int(totals[1]),'total_loop_successes':int(totals[2]),'total_loop_guard_failures':int(totals[3])}
 assert all(h['result']==1 for h in d['helpers'])
 if label=='control':
  p=re.search(r'loop_guard .*?name=entry_parameter .*?guard_fail=(\d+) exec=(\d+) exec_ok=(\d+) compile=(\d+)',log);assert p
  result[label]['parameter_including_alternate']={'failures':int(p[1]),'attempts':int(p[2]),'successes':int(p[3]),'compiles':int(p[4])}
assert result['control']['primary_helper_calls']['entry_root']==126
assert result['candidate']['primary_helper_calls']=={'entry_root':3,'entry_parameter':3}
assert result['candidate']['instrumented_primary_entries']=={'entry_root':3,'entry_parameter':3}
assert result['candidate']['total_loop_attempts']==result['candidate']['total_loop_successes']==6
assert result['candidate']['total_loop_guard_failures']==0
assert result['control']['parameter_including_alternate']=={'failures':11,'attempts':12,'successes':1,'compiles':2}
(D/'entry-route-summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
