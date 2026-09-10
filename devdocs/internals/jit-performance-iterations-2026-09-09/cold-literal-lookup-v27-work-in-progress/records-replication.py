from pathlib import Path
import sys,os,json,subprocess,hashlib,statistics,math
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-cold-literal-lookup-study/records-replication');S.mkdir(exist_ok=True);sys.path.insert(0,str(R/'tools'))
from run_execution_benchmarks import parse,host_snapshot
bins={'v26':R/'build-jit-audit-20260909/owning-postincrement-v26/sqgi','v27':R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi','v26_repeat':R/'build-jit-audit-20260909/owning-postincrement-v26/sqgi','v27_repeat':R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi'}
script=R/'test/bench_application_workloads.nut';env=dict(os.environ,SQGI_JIT='1',SQGI_JIT_THRESHOLD='1',SQGI_JIT_PRECISE_EXITS='1',SQGI_JIT_TRACE='0');n=400003
policy={'blocks':4,'runs_per_block':5,'warmups':[5,4],'seed':83,'iterations':n,'cpu':4,'unchanged_all_eight_application_cases':True,'identical_repeats_for_both_versions':True,'preserve_original_flagged_controls':True,'no_optional_stopping':True,'analysis':'Paired per-round geometric time ratios, pooled medians and 95% paired bootstrap intervals, separately by warmup. Retain every block and original control. Exclude a >5% regression only if both new-data and combined original/new upper bounds are <=1.05; otherwise keep it unresolved. No full56 reweighting.'}
assert not (S/'policy.json').exists();(S/'policy.json').write_text(json.dumps(policy,indent=2)+'\n')
for block in range(4):
 for w in ([5,4] if block%2==0 else [4,5]):
  out=S/f'block{block+1}-w{w}.json';assert not out.exists()
  def command(binary,warmups=w):return ['taskset','-c','4',str(binary),str(script),'--bench',f'--iterations={n}',f'--warmups={warmups}','--seed=83']
  p=subprocess.run(command(bins['v26'],0),cwd=R,env=dict(env,SQGI_JIT='0'),capture_output=True,text=True,check=True,timeout=300);reference=parse(p.stdout);assert len(reference)==8
  raw=[{'runtime':'interpreter_reference','stdout':p.stdout,'stderr':p.stderr}];samples={k:{label:[] for label in bins} for k in reference};names=list(bins)
  metadata={'block':block+1,'seed':83,'iterations':n,'warmups':w,'runs':5,'cpu':4,'hashes':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [script,*set(bins.values())]},'binaries':{k:str(v) for k,v in bins.items()},'rotation_offset':block%4}
  for rnd in range(5):
   offset=(rnd+block)%4
   for name in names[offset:]+names[:offset]:
    start=host_snapshot(4);p=subprocess.run(command(bins[name]),cwd=R,env=env,capture_output=True,text=True,check=True,timeout=300);end=host_snapshot(4);rows=parse(p.stdout);assert rows.keys()==reference.keys()
    assert not any(s in p.stdout+p.stderr for s in ['SCRIPT ERROR','AN ERROR HAS OCCURRED','FAIL:','[FAIL]'])
    for k,v in rows.items():
     assert v['iterations']==reference[k]['iterations'] and v['checksum']==reference[k]['checksum'],(name,k,v,reference[k]);assert v['us']>0 and math.isfinite(v['us']);samples[k][name].append(v['us'])
    raw.append({'round':rnd+1,'runtime':name,'command':command(bins[name]),'stdout':p.stdout,'stderr':p.stderr,'host_start':start,'host_end':end});print(block+1,w,rnd+1,name,'8 checksums match',flush=True)
   result={'metadata':metadata,'completed_rounds':rnd+1,'samples':samples,'raw':raw}
   if rnd==4:result['medians']={k:{label:statistics.median(v) for label,v in row.items()} for k,row in samples.items()}
   out.write_text(json.dumps(result,indent=2)+'\n')
  print('RECORDS_MEDIANS',block+1,w,json.dumps(result['medians']['records_4096']),flush=True)
