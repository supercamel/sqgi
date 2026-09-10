#!/usr/bin/env python3
"""Diagnostic warmup/route probe; not part of the accepted 56-component timing."""
import argparse, hashlib, json, os, re, subprocess, sys
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary', action='append', required=True, help='NAME=PATH')
p.add_argument('--output', type=Path, required=True)
a=p.parse_args()
root=Path(__file__).resolve().parents[3]
sys.path.insert(0,str(root/'tools'))
from run_execution_benchmarks import parse, host_snapshot
binaries={name:Path(path).resolve() for name,path in (v.split('=',1) for v in a.binary)}
a.output.mkdir(parents=True,exist_ok=True)
original=(root/'test/test_jit_perf_correctness.nut').read_text()
needle='function bench_one(name, iterations, fn) {'
assert original.count(needle)==1
script=a.output.resolve()/'only-array-append.nut'
script.write_text(original.replace(needle,needle+'\n    if(name != "array_append") return;'))
env=dict(os.environ,SQGI_JIT='1',SQGI_JIT_PRECISE_EXITS='1',SQGI_JIT_THRESHOLD='1',SQGI_JIT_TRACE='stats')
def run(binary,warmups,environment):
    cmd=['taskset','-c','4',str(binary),str(script),'--bench','--iterations=160000',f'--warmups={warmups}']
    before=host_snapshot(4)
    r=subprocess.run(cmd,cwd=root,env=environment,capture_output=True,text=True,check=True,timeout=180)
    after=host_snapshot(4)
    rows=parse(r.stdout)
    assert list(rows)==['array_append']
    assert not any(x in r.stdout+r.stderr for x in ['[FAIL]','AN ERROR HAS OCCURRED','SCRIPT ERROR'])
    return rows['array_append'],dict(command=cmd,stdout=r.stdout,stderr=r.stderr,host_start=before,host_end=after)
reference,refraw=run(next(iter(binaries.values())),0,dict(env,SQGI_JIT='0'))
raw=[dict(runtime='interpreter_reference',**refraw)];rows=[]
names=list(binaries)
for warmups in [4,5]:
    for rnd in range(5):
        for name in names[rnd%len(names):]+names[:rnd%len(names)]:
            row,details=run(binaries[name],warmups,env)
            assert row['iterations']==reference['iterations'] and float(row['checksum'])==float(reference['checksum'])
            stats=[line for line in (details['stdout']+details['stderr']).splitlines()
                   if line.startswith('[sqjit:stats]') and any(x in line for x in ['proto enters=','proto exec attempts=','proto side_exits=','direct calls attempts=','loops try='])]
            rows.append(dict(runtime=name,warmups=warmups,round=rnd+1,us=row['us'],stats=stats))
            raw.append(dict(runtime=name,warmups=warmups,round=rnd+1,**details))
            print(name,warmups,rnd+1,row['us'],flush=True)
result=dict(purpose=__doc__,binaries={n:dict(path=str(p),sha256=hashlib.sha256(p.read_bytes()).hexdigest()) for n,p in binaries.items()},
            script_sha256=hashlib.sha256(script.read_bytes()).hexdigest(),rows=rows,raw=raw)
(a.output/'diagnostic.json').write_text(json.dumps(result,indent=2)+'\n')
