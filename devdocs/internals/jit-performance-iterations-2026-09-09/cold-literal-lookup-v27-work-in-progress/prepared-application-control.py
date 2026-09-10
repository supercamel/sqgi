from pathlib import Path
import sys,os,json,subprocess,hashlib,statistics,math
R=Path('/home/sam/Programming/sqgi');S=Path('/tmp/sqgi-cold-literal-lookup-study');sys.path.insert(0,str(R/'tools'))
from run_execution_benchmarks import parse
FLOAT_KERNELS=set()
from run_execution_benchmarks import host_snapshot
bins={'audit':R/'build-jit-audit-20260909/baseline/sqgi','v26':R/'build-jit-audit-20260909/owning-postincrement-v26/sqgi','v27':R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi','v27_repeat':R/'build-jit-audit-20260909/cold-literal-lookup-v27/sqgi'}
script=R/'test/bench_application_workloads.nut';env=dict(os.environ,SQGI_JIT='1',SQGI_JIT_THRESHOLD='1',SQGI_JIT_PRECISE_EXITS='1',SQGI_JIT_TRACE='0')
for w in [5,4]:
 n=400003;out=S/f'application-control-w{w}.json';assert not out.exists(),out
 def command(binary,warmups=w):return ['taskset','-c','4',str(binary),str(script),'--bench',f'--iterations={n}',f'--warmups={warmups}','--seed=83']
 p=subprocess.run(command(bins['v26'],0),cwd=R,env=dict(env,SQGI_JIT='0'),capture_output=True,text=True,check=True,timeout=300);reference=parse(p.stdout);assert len(reference)==8
 raw=[{'runtime':'interpreter_reference','stdout':p.stdout,'stderr':p.stderr}];samples={k:{name:[] for name in bins} for k in reference};names=list(bins)
 metadata={'seed':83,'iterations':n,'warmups':w,'runs':5,'cpu':4,'hashes':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [script,*set(bins.values())]},'binaries':{k:str(v) for k,v in bins.items()},'purpose':'Five rotating rounds against the audit and accepted V26, with both warmup histories, interpreter references and an identical V27 repeat. Controls retain unchanged benchmark sources and do not reweight full56.'}
 for rnd in range(5):
  for name in names[rnd%4:]+names[:rnd%4]:
   start=host_snapshot(4);p=subprocess.run(command(bins[name]),cwd=R,env=env,capture_output=True,text=True,check=True,timeout=300);end=host_snapshot(4);rows=parse(p.stdout);assert rows.keys()==reference.keys()
   assert not any(s in p.stdout+p.stderr for s in ['SCRIPT ERROR','AN ERROR HAS OCCURRED','FAIL:','[FAIL]'])
   for k,v in rows.items():
    want=reference[k]['checksum'];got=v['checksum'];equal=math.isfinite(got) and math.isclose(got,want,rel_tol=1e-10,abs_tol=1e-10) if k in FLOAT_KERNELS else got==want
    assert v['iterations']==reference[k]['iterations'] and equal,(name,k,v,reference[k]);assert v['us']>0 and math.isfinite(v['us']);samples[k][name].append(v['us'])
   raw.append({'round':rnd+1,'runtime':name,'command':command(bins[name]),'stdout':p.stdout,'stderr':p.stderr,'host_start':start,'host_end':end});print(w,rnd+1,name,'8 checksums match',flush=True)
  result={'metadata':metadata,'completed_rounds':rnd+1,'samples':samples,'raw':raw}
  if rnd==4:result['medians']={k:{name:statistics.median(v) for name,v in row.items()} for k,row in samples.items()}
  out.write_text(json.dumps(result,indent=2)+'\n')
 print('CONTROL_RECORDS',w,json.dumps({k:result['medians'][k] for k in ['records_64','records_4096']}),flush=True)
