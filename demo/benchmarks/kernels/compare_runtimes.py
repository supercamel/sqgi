#!/usr/bin/env python3
"""Full local kernel/ordinary-Squirrel comparison against Node, GJS and CPython."""
import argparse,json,os,platform,re,statistics,subprocess,sys
from pathlib import Path

parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('build',type=Path)
parser.add_argument('--output',type=Path,required=True)
parser.add_argument('--resume',action='store_true',help='reuse completed files in the output directory after an interrupted run')
args=parser.parse_args();root=Path(__file__).resolve().parents[3];base=root/'demo/benchmarks/kernels'
build=args.build.resolve();out=args.output.resolve();out.mkdir(parents=True,exist_ok=True)
def run(name,command,json_output=True):
    path=out/(name+('.json' if json_output else '.txt'))
    if args.resume and path.exists():
        text=path.read_text();return json.loads(text) if json_output else text
    print('Running '+name,flush=True)
    result=subprocess.run(list(map(str,command)),cwd=root,text=True,capture_output=True)
    if result.returncode:
        raise RuntimeError(f'{name} failed ({result.returncode}):\n{result.stderr}\n{result.stdout}')
    (out/(name+('.json' if json_output else '.txt'))).write_text(result.stdout)
    return json.loads(result.stdout) if json_output else result.stdout

native=run('native',[build/'sqgi_kernel_benchmark_suite','--root',root])
fixtures=run('fixtures',[build/'sqgi_kernel_benchmark_suite','--root',root,'--fixtures'])
key=lambda c:(c['workload'],c['size'],c['pattern'])
reps={key(c):c['repetitions'] for c in native['cases']}
for c in fixtures['cases']:c['timing_repetitions']=reps[key(c)]
(out/'fixtures.json').write_text(json.dumps(fixtures))
boundary=run('squirrel-boundary',[build/'sqgi',base/'boundary.nut',out/'fixtures.json'])
ordinary=run('squirrel-ordinary',[build/'sqgi',base/'boxed_squirrel.nut'],False)
runtimes={}
for runtime,command in [('node',['node',base/'runtime_workloads.js']),('gjs',['gjs',base/'runtime_workloads.js']),('python',[sys.executable,base/'python_workloads.py'])]:
    runtimes[runtime]=run(runtime,command+[out/'fixtures.json',base])
    actual={key(c) for c in runtimes[runtime]['cases'] if not c['workload'].startswith('ordinary/')}
    if actual!=set(reps):raise ValueError(runtime+' case coverage mismatch')
objects={}
for stem in ['typed_objects','compiled_workflow']:
    objects[stem]={'kernel':run('kernel-'+stem,[build/'sqgi',base/(stem+'_node.nut')])}
    keys=[('workflow',n) for n in [1,16,256,4096]] if stem=='compiled_workflow' else [('driver',1),('scalar',1),('driver',16),('driver',256),('driver',4096)]
    for runtime,command in [('node',['node']),('gjs',['gjs',base/'gjs_compat.js'])]:
        parts=[]
        for kind,size in keys:
            extra=['array'] if stem=='compiled_workflow' else []
            parts.append(run(runtime+'-'+stem+'-'+kind+'-'+str(size),command+[base/('node_'+stem+'.js'),f'{kind}/{size}']+extra))
        objects[stem][runtime]={'cases':[c for p in parts for c in p['cases']]}
        for expected,actual in zip(objects[stem]['kernel']['cases'],objects[stem][runtime]['cases']):
            for field in expected.keys()-{'timings_ns'}:
                if expected[field]!=actual[field]:raise ValueError(f'{runtime}/{stem}/{field} mismatch')
python_objects=run('python-objects',[sys.executable,base/'python_objects.py'])
integer_runs={}
for name in ['node','gjs']:
    integer_runs[name]=run(name+'-int32',[name,base/'runtime_workloads.js',out/'fixtures.json',base,'int32'])
    wanted={k for k in reps if k[0] in ['image','histogram','routing','astar']}
    if {key(c) for c in integer_runs[name]['cases']}!=wanted:raise ValueError('integer case coverage')
cpu_model=platform.processor()
if Path('/proc/cpuinfo').exists():
    cpu_model=next((line.split(':',1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines() if line.startswith('model name')),cpu_model)
cmake=[line for line in (build/'CMakeCache.txt').read_text().splitlines() if line.startswith(('CMAKE_BUILD_TYPE:','SQ_ENABLE_JIT:','SQGI_ENABLE_LTO:','SQGI_PGO_MODE:','SQGI_KERNEL_BACKEND:'))]
report={'cpu_model':cpu_model,'cmake':cmake,'platform':platform.platform(),'cpu_affinity':sorted(os.sched_getaffinity(0)),
        'build':str(build),'native':native,'boundary':boundary,'ordinary':ordinary,'runtimes':runtimes,'objects':objects,'python_objects':python_objects,'integer_runs':integer_runs}
(out/'results.json').write_text(json.dumps(report,indent=2))
rows=['# Runtime benchmark comparison','',f"CPU: {cpu_model}; affinity: {report['cpu_affinity']}. Node {runtimes['node']['version']}; GJS {runtimes['gjs']['version']}; Python {runtimes['python']['version'].split()[0]}.",'','All times are medians; units are **nanoseconds**. Smaller is better. Native kernel entry excludes Squirrel dispatch; “Squirrel → kernel” includes it. Compilation/allocation of input fixtures are excluded.','','## All 85 numeric and A* cases','','| Workload | Size | Pattern | Native kernel | Squirrel → kernel | Node | GJS | Python |','|---|---:|---|---:|---:|---:|---:|---:|']
lookup={name:{key(c):c for c in data['cases']} for name,data in runtimes.items()};host={key(c):c for c in boundary['cases']}
for c in native['cases']:
    k=key(c);values=[c['kernel_ns'],host[k]['kernel_via_squirrel_ns']]+[lookup[n][k]['ns'] for n in ['node','gjs','python']]
    rows.append('| '+' | '.join(map(str,k))+' | '+' | '.join(f'{x:,.2f}' for x in values)+' |')
rows+=['','## Alternative 32-bit integer buffers','','Same cases with Int32Array where all active integer values fit; routing coordinates remain Float64Array. This is a smaller representation than kernel i64 cells. Python results for these cases are in the table above.','','| Workload | Size | Pattern | Squirrel → kernel | Node Int32 | GJS Int32 |','|---|---:|---|---:|---:|---:|']
ints={name:{key(c):c for c in run['cases']} for name,run in integer_runs.items()}
for c in integer_runs['node']['cases']:
    k=key(c);values=[host[k]['kernel_via_squirrel_ns'],ints['node'][k]['ns'],ints['gjs'][k]['ns']]
    rows.append('| '+' | '.join(map(str,k))+' | '+' | '.join(f'{x:,.2f}' for x in values)+' |')
rows+=['','## Ordinary Squirrel loops (per iteration)','','The last row calls a typed kernel from Squirrel; the LLVM caller can inline eligible pure integer exports after warmup. JavaScript/Python call an ordinary same-language function; JS engines can inline it. These are whole-loop throughput measurements.','','| Workload | Squirrel interpreter | Squirrel LLVM | Node | GJS | Python |','|---|---:|---:|---:|---:|---:|']
for line in ordinary.splitlines():
    name=line.split()[0];fields=dict(re.findall(r'(\w+)=([0-9.]+)',line));k=('ordinary/'+name,1000000,'')
    values=[float(fields['interpreter_ns']),float(fields['llvm_ns'])]+[lookup[n][k]['ns'] for n in ['node','gjs','python']]
    outputs=[lookup[n][k]['result'] for n in ['node','gjs','python']]
    if outputs.count(outputs[0])!=len(outputs):raise ValueError('ordinary cross-runtime result mismatch')
    rows.append('| '+name+' | '+' | '.join(f'{x:,.2f}' for x in values)+' |')
rows+=['','## Typed classes and compiled workflows (per call/batch)','','| Case | Size | Squirrel → kernel | Node | GJS | Python |','|---|---:|---:|---:|---:|---:|']
py={(c['kind'],c['size']):c for c in python_objects['cases']}
for stem,data in objects.items():
    for i,c in enumerate(data['kernel']['cases']):
        k=(c['kind'],c['size']);values=[statistics.median(data[n]['cases'][i]['timings_ns']) for n in ['kernel','node','gjs']]+[py[k]['ns']]
        if k[0]=='workflow' and c['output']!=py[k]['output']:raise ValueError('Python workflow output mismatch')
        rows.append('| '+' | '.join(map(str,k))+' | '+' | '.join(f'{x:,.2f}' for x in values)+' |')
rows+=['','## Method and limitations','','- Numeric cases use the same complete fixtures and validate one call plus 100 repeated calls, including unused output cells. All 85 cases are included. JS uses Float64Array; Python uses ordinary lists, floats and arbitrary-precision integers; no NumPy.','- Node/GJS execute identical numeric source. JS and Python calibrate independently toward 5 ms samples, warm for at least 100 ms, then take nine samples. Stateful particles can therefore evolve for different repetition counts.','- Kernel native and Squirrel boundaries use their existing seven-sample harnesses. Ordinary Squirrel uses 11 alternating-order samples; managed-language ordinary loops use nine samples.','- Runs are sequential on the recorded CPU affinity. This is one full trial, not a multi-process statistical study. Small differences should not be overinterpreted.','- Numeric Node/GJS/Python clocks are monotonic wall time; Squirrel uses process CPU time. Existing class Node/Squirrel scripts use CPU time; the GJS adapter uses monotonic wall time.','- Controller/workflow Node and GJS cases run in fresh processes and validate all outputs/state against the Squirrel kernel runner. Python controllers use analytic output/state checks; Python workflows match both reference outputs.','- The LLVM Squirrel tier optimizes ordinary scalar operations and can inline eligible pure integer exports in compiled caller loops. Numeric batch and typed-class tables use their separate kernel-boundary paths.','','See `results.json` for sample distributions, versions, compilation times and raw outputs.']
(out/'report.md').write_text('\n'.join(rows)+'\n');print('Wrote '+str(out/'report.md'),flush=True)
