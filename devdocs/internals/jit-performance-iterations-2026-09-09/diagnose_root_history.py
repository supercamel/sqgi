#!/usr/bin/env python3
"""Diagnostic case-order control; never substitute these samples for the fixed mix."""
import argparse,hashlib,json,os,statistics,subprocess,sys
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
a=p.parse_args();source=Path(__file__).resolve().parents[3];out=a.output.resolve();out.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(source/'tools'))
from run_execution_benchmarks import parse,host_snapshot
binary=a.binary.resolve();original=source/'test/bench_root_workloads.nut';body=original.read_text()
needle='foreach(item in cases) {';assert body.count(needle)==1
scripts={'original':original,'reversed':out/'reversed-cases.nut'}
scripts['reversed'].write_text(body.replace(needle,'cases.reverse();\n'+needle))
env=dict(os.environ,SQGI_JIT='1',SQGI_JIT_PRECISE_EXITS='1',SQGI_JIT_THRESHOLD='1',SQGI_JIT_TRACE='0')
def run(script,warmups,jit=1,trace=False):
 command=['taskset','-c','4',str(binary),str(script),'--iterations=200000',f'--warmups={warmups}']
 start=host_snapshot(4)
 r=subprocess.run(command,cwd=source,env=dict(env,SQGI_JIT=str(jit),SQGI_JIT_TRACE='stats' if trace else '0'),capture_output=True,text=True,check=True,timeout=300)
 rows=parse(r.stdout)
 assert len(rows)==4
 return rows,dict(command=command,stdout=r.stdout,stderr=r.stderr,host_start=start,host_end=host_snapshot(4))
reference,refraw=run(original,0,0)
for warmups in [4,5]:
 samples={k:{name:[] for name in scripts} for k in reference};raw=[]
 for rnd in range(5):
  order=list(scripts) if rnd%2==0 else list(reversed(scripts))
  for name in order:
   rows,item=run(scripts[name],warmups)
   assert rows.keys()==reference.keys()
   for k,v in rows.items():
    assert v['iterations']==200000 and v['checksum']==reference[k]['checksum'],(name,k,v,reference[k])
    samples[k][name].append(v['us'])
   raw.append(dict(round=rnd+1,variant=name,**item))
   print(warmups,rnd+1,name,'all checksums match',flush=True)
 medians={k:{name:statistics.median(vals) for name,vals in row.items()} for k,row in samples.items()}
 d=dict(diagnostic='Only case iteration order changes; original algorithms/counts/warmups/checksums retained. Not part of the 56-component acceptance score.',warmups=warmups,reference=refraw,samples=samples,medians=medians,raw=raw,hashes={str(x):hashlib.sha256(x.read_bytes()).hexdigest() for x in [binary,*scripts.values()]})
 (out/f'warmups{warmups}.json').write_text(json.dumps(d,indent=2)+'\n')
for name,script in scripts.items():
 rows,raw=run(script,1,trace=True)
 assert all(v['checksum']==reference[k]['checksum'] for k,v in rows.items())
 (out/(name+'-trace.json')).write_text(json.dumps(raw,indent=2)+'\n')
