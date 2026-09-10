from pathlib import Path
import sys,os,json,subprocess,hashlib,statistics,math
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v22-filter-ablation');sys.path.insert(0,str(R/'tools'))
from run_execution_benchmarks import parse,host_snapshot
binary=R/'build-jit-audit-20260909/local-slot-forwarding-v22/sqgi';script=R/'test/bench_application_workloads.nut';lib=D/'patch.so'
base=dict(os.environ,SQGI_JIT='1',SQGI_JIT_THRESHOLD='1',SQGI_JIT_PRECISE_EXITS='1',SQGI_JIT_TRACE='0');base.pop('LD_PRELOAD',None)
configs={'fp':'fp','gp':'gp','fp_repeat':'fp','gp_repeat':'gp'}
summary={}
for seed,n in [(17,200000),(83,400003)]:
 for w in [5,4]:
  out=D/f'seed{seed}-w{w}.json';assert not out.exists()
  def command(warmups=w):return ['taskset','-c','4',str(binary),str(script),'--bench',f'--iterations={n}',f'--warmups={warmups}',f'--seed={seed}']
  p=subprocess.run(command(0),cwd=R,env=dict(base,SQGI_JIT='0'),capture_output=True,text=True,check=True,timeout=300);ref=parse(p.stdout);assert len(ref)==8
  raw=[dict(runtime='interpreter_reference',stdout=p.stdout,stderr=p.stderr)];samples={k:{name:[] for name in configs} for k in ref};names=list(configs)
  metadata=dict(seed=seed,iterations=n,warmups=w,runs=5,cpu=4,hashes={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [binary,script,lib]},purpose='Diagnostic same-executable float-copy ablation; exact full-code normalized match and ten captured V21 instructions only. All four modes use the same preload with identical mapping transitions. This does not replace accepted uninstrumented timing.')
  for rnd in range(5):
   for name in names[rnd%4:]+names[:rnd%4]:
    start=host_snapshot(4);p=subprocess.run(command(),cwd=R,env=dict(base,LD_PRELOAD=str(lib),SQGI_DIAG_COPY_MODE=configs[name]),capture_output=True,text=True,check=True,timeout=300);end=host_snapshot(4)
    lines=[s for s in p.stderr.splitlines() if '[copy-ablation]' in s];assert len(lines)==1,(name,p.stderr)
    assert f'mode={configs[name]}; changed='+('10' if configs[name]=='gp' else '0') in lines[0]
    rows=parse(p.stdout);assert rows.keys()==ref.keys()
    for k,v in rows.items():
     assert v['checksum']==ref[k]['checksum'] and v['iterations']==ref[k]['iterations'],(name,k,v,ref[k]);assert math.isfinite(v['us']) and v['us']>0
     samples[k][name].append(v['us'])
    raw.append(dict(round=rnd+1,runtime=name,mode=configs[name],command=command(),stdout=p.stdout,stderr=p.stderr,host_start=start,host_end=end));print(seed,w,rnd+1,name,rows['filter_stream']['us']*1000,flush=True)
   data=dict(metadata=metadata,completed_rounds=rnd+1,samples=samples,raw=raw);out.write_text(json.dumps(data,indent=2)+'\n')
  med={k:{name:statistics.median(v)*1000 for name,v in row.items()} for k,row in samples.items()}
  summary[f'seed{seed}-w{w}']=dict(medians_ns=med['filter_stream'],gp_over_fp=med['filter_stream']['gp']/med['filter_stream']['fp'],gp_repeat_over_fp_repeat=med['filter_stream']['gp_repeat']/med['filter_stream']['fp_repeat'],all_cases_ns=med)
  (D/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print('ABLATION COMPLETE',json.dumps(summary),flush=True)
