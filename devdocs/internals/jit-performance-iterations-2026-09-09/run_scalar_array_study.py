#!/usr/bin/env python3
"""Sequential timing and profiling of the frozen SQGI working tree."""
from pathlib import Path
import os, subprocess, sys, json, hashlib, statistics, math, time

import argparse
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('mode',choices=['timings','profiles','profitability'])
parser.add_argument('--source',type=Path,default=Path(__file__).resolve().parents[3])
parser.add_argument('--baseline',type=Path,required=True)
parser.add_argument('--candidate',type=Path,required=True)
parser.add_argument('--output',type=Path,required=True)
args=parser.parse_args()
ROOT=args.output.resolve()
SOURCE=args.source.resolve()
BIN=args.candidate.resolve()
OLD=args.baseline.resolve()
for subdir in ['results','profiles']:
    (ROOT/subdir).mkdir(parents=True,exist_ok=True)
ENV = dict(os.environ, PYTHONDONTWRITEBYTECODE='1', SQGI_JIT='1', SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0')
sys.path.insert(0, str(SOURCE / 'tools'))
from run_execution_benchmarks import parse, host_snapshot

def run(name, command, env=ENV, timeout=1800):
    print('START', name, flush=True)
    with (ROOT / (name + '.log')).open('w') as log:
        p = subprocess.run(list(map(str, command)), cwd=SOURCE, env=env, stdout=log, stderr=subprocess.STDOUT, timeout=timeout)
    print('DONE', name, p.returncode, flush=True)
    if p.returncode: raise RuntimeError(name)

def timings():
    for suite, n, seed in [('kernels',160000,17), ('applications',200000,17), ('applications',400003,83), ('roots',200000,17)]:
        name=f'{suite}-seed{seed}'
        saved=ROOT/'results'/f'{name}.json'
        if saved.exists() and 'medians' in json.loads(saved.read_text()):
            print('PRESERVED', name, flush=True)
            continue
        run(name, [sys.executable, SOURCE/'tools/run_runtime_benchmarks.py', '--sqgi', BIN,
            '--sqgi-baseline', OLD, '--suite', suite, '--runs', '5', '--warmups', '5',
            '--iterations', n, '--seed', seed, '--cpu','4','--output',ROOT/'results'/f'{name}.json'])
    for suite, filename, count in [('members','member_workloads',6),('owners','member_owners',10),('methods','member_methods',6),('floats','float_workloads',7)]:
        # Only adapt the Node timer/arguments API; leave algorithm text intact.
        port=SOURCE/'demo/benchmarks'/f'node_{filename}.js'
        shim=ROOT/f'gjs_{filename}.mjs'
        shim.write_text("import GLib from 'gi://GLib';\nconst process = {argv: ['gjs', 'module', ...ARGV], hrtime: {bigint: () => BigInt(GLib.get_monotonic_time()) * 1000n}};\nconst console = {log: print};\n"+port.read_text())
        sq=SOURCE/'test'/f'bench_{filename}.nut'
        n=200000
        commands={'sqgi':[str(BIN),str(sq),f'--iterations={n}','--warmups=5'],
                  'sqgi_baseline':[str(OLD),str(sq),f'--iterations={n}','--warmups=5'],
                  'node':['node',str(port),str(n),'5'], 'gjs':['gjs','-m',str(shim),str(n),'5']}
        prefix=['taskset','-c','4']
        reference_cmd=[x if not x.startswith('--warmups=') else '--warmups=0' for x in commands['sqgi']]
        ref=subprocess.run(prefix+reference_cmd,cwd=SOURCE,env=dict(ENV,SQGI_JIT='0'),capture_output=True,text=True,check=True,timeout=300)
        reference=parse(ref.stdout)
        assert len(reference)==count
        raw=[dict(runtime='interpreter_reference',stdout=ref.stdout,stderr=ref.stderr)]
        samples={k:{name:[] for name in commands} for k in reference}
        metadata=dict(suite=suite,runs=5,warmups=5,iterations=n,cpu=4,commands=commands,
                      hashes={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [BIN,OLD,sq,port,shim]},
                      gjs_adapter='GLib monotonic microseconds exposed as process.hrtime.bigint nanoseconds; argv supplied from ARGV; unchanged algorithm source',
                      node_version=subprocess.check_output(['node','--version'],text=True).strip(),
                      gjs_version=subprocess.check_output(['gjs','--version'],text=True).strip())
        names=list(commands)
        for rnd in range(5):
            for name in names[rnd%4:]+names[:rnd%4]:
                start=host_snapshot(4)
                p=subprocess.run(prefix+commands[name],cwd=SOURCE,env=ENV,capture_output=True,text=True,check=True,timeout=300)
                finish=host_snapshot(4)
                assert not any(x in p.stderr+p.stdout for x in ['[FAIL]','AN ERROR HAS OCCURRED','SCRIPT ERROR'])
                rows=parse(p.stdout)
                assert rows.keys()==reference.keys()
                for k,v in rows.items():
                    assert v['iterations']==n and float(v['checksum'])==float(reference[k]['checksum']), (name,k,v,reference[k])
                    assert math.isfinite(v['us']) and v['us']>0
                    samples[k][name].append(v['us'])
                raw.append(dict(round=rnd+1,runtime=name,stdout=p.stdout,stderr=p.stderr,host_start=start,host_end=finish))
                print(f'{suite}: {rnd+1}/5 {name}; {count} checksums match',flush=True)
            out=dict(metadata=metadata,completed_rounds=rnd+1,samples=samples,raw=raw)
            if rnd==4:
                out['medians']={k:{r:statistics.median(v) for r,v in row.items()} for k,row in samples.items()}
            (ROOT/'results'/f'{suite}.json').write_text(json.dumps(out,indent=2)+'\n')

SCRIPTS={'kernels':'test_jit_perf_correctness.nut','applications':'bench_application_workloads.nut',
         'roots':'bench_root_workloads.nut','members':'bench_member_workloads.nut','owners':'bench_member_owners.nut',
         'methods':'bench_member_methods.nut','floats':'bench_float_workloads.nut'}

def profiles():
    for suite, filename in SCRIPTS.items():
        script=SOURCE/'test'/filename
        iterations=160000 if suite=='kernels' else 200000
        base=[str(BIN),str(script),'--bench',f'--iterations={iterations}','--warmups=5','--seed=17']
        run(f'profiles/{suite}-trace',[*base[:2],'--bench','--iterations=20003','--warmups=5','--seed=83'],dict(ENV,SQGI_JIT_TRACE='stats'))
        run(f'profiles/{suite}-record',['perf','record','-e','cycles:u','-F','499','--call-graph','dwarf,8192','-o',ROOT/'profiles'/f'{suite}.data','--','taskset','-c','4',*base])
        run(f'profiles/{suite}-flat',['perf','report','--stdio','-g','none','--no-children','--percent-limit','0.5','-i',ROOT/'profiles'/f'{suite}.data'])
        run(f'profiles/{suite}-stacks',['perf','report','--stdio','--children','--percent-limit','2','-i',ROOT/'profiles'/f'{suite}.data'])
        run(f'profiles/{suite}-stat',['perf','stat','-r','3','-x',';','-e','task-clock,cycles,instructions,branch-misses,cache-references,cache-misses,page-faults,context-switches','--','taskset','-c','4',*base])

def targeted():
    original=(SOURCE/'test/test_jit_perf_correctness.nut').read_text()
    for name in ['direct_call','float_call','vector','dynamic_member','object_member_write_fallback','math_intrinsic','matrix']:
        # Select at the timing driver only; retain correctness initialization,
        # original kernel bodies, and original per-kernel iteration multipliers.
        script=ROOT/'profiles'/f'only-{name}.nut'
        script.write_text(original.replace('function bench_one(name, iterations, fn) {',
            'function bench_one(name, iterations, fn) {\n    if (name != "'+name+'") return;'))
        base=[str(BIN),str(script),'--bench','--iterations=1000000','--warmups=5']
        run(f'profiles/only-{name}-record',['perf','record','-e','cycles:u','-F','499','--call-graph','dwarf,8192','-o',ROOT/'profiles'/f'only-{name}.data','--','taskset','-c','4',*base])
        run(f'profiles/only-{name}-flat',['perf','report','--stdio','-g','none','--no-children','--percent-limit','0.5','-i',ROOT/'profiles'/f'only-{name}.data'])
    for name in ['word_count','records_4096']:
        script=ROOT/'profiles'/f'only-{name}.nut'
        original=(SOURCE/'test/bench_application_workloads.nut').read_text()
        script.write_text(original.replace('foreach (item in cases) {','foreach (item in cases) {\n    if (item[0] != "'+name+'") continue;'))
        base=[str(BIN),str(script),'--iterations=2000000','--warmups=5','--seed=83']
        run(f'profiles/only-{name}-record',['perf','record','-e','cycles:u','-F','499','--call-graph','dwarf,8192','-o',ROOT/'profiles'/f'only-{name}.data','--','taskset','-c','4',*base])
        run(f'profiles/only-{name}-flat',['perf','report','--stdio','-g','none','--no-children','--percent-limit','0.5','-i',ROOT/'profiles'/f'only-{name}.data'])

def profitability():
    for suite,filename in [('owners','bench_member_owners.nut'),('methods','bench_member_methods.nut'),('roots','bench_root_workloads.nut')]:
        command=['taskset','-c','4',str(BIN),str(SOURCE/'test'/filename),'--iterations=200000','--warmups=5']
        samples={}; raw=[]; reference=None
        for rnd in range(5):
            for mode in ([0,1] if rnd%2==0 else [1,0]):
                start=host_snapshot(4)
                p=subprocess.run(command,cwd=SOURCE,env=dict(ENV,SQGI_JIT=str(mode)),text=True,capture_output=True,check=True,timeout=300)
                rows=parse(p.stdout)
                if reference is None: reference=rows
                assert rows.keys()==reference.keys()
                for k,v in rows.items():
                    assert v['iterations']==200000 and float(v['checksum'])==float(reference[k]['checksum'])
                    samples.setdefault(k,{'off':[],'on':[]})['on' if mode else 'off'].append(v['us'])
                raw.append(dict(round=rnd+1,jit=mode,stdout=p.stdout,stderr=p.stderr,host_start=start,host_end=host_snapshot(4)))
                print(suite,'profitability',rnd+1,'jit',mode,flush=True)
            result=dict(command=command,completed_rounds=rnd+1,samples=samples,raw=raw)
            if rnd==4: result['medians']={k:{n:statistics.median(v) for n,v in row.items()} for k,row in samples.items()}
            (ROOT/'results'/f'profitability-{suite}.json').write_text(json.dumps(result,indent=2)+'\n')

if __name__=='__main__':
    if args.mode=='timings': timings()
    elif args.mode=='profiles': profiles()
    elif args.mode=='targeted': targeted()
    elif args.mode=='profitability': profitability()
