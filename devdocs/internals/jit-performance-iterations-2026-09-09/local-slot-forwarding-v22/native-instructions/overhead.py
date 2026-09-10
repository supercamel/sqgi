from pathlib import Path
import os,time,subprocess,json,statistics,sys
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v22-native-profile');sys.path.insert(0,str(R/'tools'))
from run_member_benchmarks import parse
# Keep full unchanged suite and checksum reference. These wall-time controls are
# diagnostic instrumentation checks, not a substitute for accepted benchmark data.
base=dict(os.environ,SQGI_JIT='1',SQGI_JIT_THRESHOLD='1',SQGI_JIT_PRECISE_EXITS='1',SQGI_JIT_TRACE='0')
cmd=['taskset','-c','4',str(R/'build-jit-audit-20260909/local-slot-forwarding-v22/sqgi'),str(R/'test/bench_float_workloads.nut'),'--iterations=200000','--warmups=5']
rows=[];reference=None
for rnd in range(3):
 for mode in (['plain','capture'] if rnd%2==0 else ['capture','plain']):
  env=dict(base)
  if mode=='capture':
   folder=D/f'overhead-{rnd}';folder.mkdir();env.update(LD_PRELOAD=str(D/'capture.so'),SQGI_PROFILE_MAP_DIR=str(folder))
  start=time.perf_counter();p=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True,check=True);elapsed=time.perf_counter()-start
  parsed=parse(p.stdout);assert len(parsed)==7,parsed
  checks={k:v['checksum'] for k,v in parsed.items()}
  if reference is None:reference=checks
  assert checks==reference,(checks,reference)
  rows.append(dict(round=rnd,mode=mode,seconds=elapsed,stdout=p.stdout,stderr=p.stderr));print(rnd,mode,elapsed,flush=True)
# The profiling run must match this unchanged suite at its larger iteration count
# against a separate uninstrumented reference, not against the smaller control.
p=subprocess.run([x.replace('--iterations=200000','--iterations=2000000') for x in cmd],cwd=R,env=base,capture_output=True,text=True,check=True)
a=parse(p.stdout);b=parse((D/'floats/record.log').read_text());assert len(a)==len(b)==7
assert {k:v['checksum'] for k,v in a.items()}=={k:v['checksum'] for k,v in b.items()}
(D/'floats/plain-reference.log').write_text(p.stdout+p.stderr)
med={mode:statistics.median(r['seconds'] for r in rows if r['mode']==mode) for mode in ['plain','capture']}
(D/'overhead.json').write_text(json.dumps(dict(rows=rows,medians_seconds=med,capture_over_plain=med['capture']/med['plain'],larger_profile_checksums_match=True),indent=2)+'\n')
print(med,med['capture']/med['plain'])
