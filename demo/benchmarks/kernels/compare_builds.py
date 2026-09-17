#!/usr/bin/env python3
"""Benchmark existing build configurations with identical verified workloads.

Configs JSON is a list of {name, binary, jit} objects. Pin the runner to one CPU;
all children inherit affinity. Run after builds/training finish.
"""
import argparse
import json
import math
import os
from pathlib import Path
import platform
import statistics
import subprocess


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('configs',type=Path)
    parser.add_argument('--node',default='node')
    parser.add_argument('--output',required=True,type=Path)
    args=parser.parse_args()
    root=Path(__file__).resolve().parents[3]
    configs=json.loads(args.configs.read_text())
    if len({c['name'] for c in configs})!=len(configs):
        raise ValueError('duplicate configuration names')
    workloads={'workflow':('compiled_workflow',[('workflow',n) for n in [1,16,256,4096]]),
               'controller':('typed_objects',[('driver',1),('scalar',1),('driver',16),('driver',256),('driver',4096)])}
    runs={c['name']:{w:[] for w in workloads} for c in configs}
    runs['Node']={w:[] for w in workloads}
    metadata={}
    for c in configs:
        c['binary']=str(Path(c['binary']).resolve())
        cache=Path(c['binary']).parent/'CMakeCache.txt'
        if cache.exists():
            c['cmake']=[line for line in cache.read_text().splitlines() if
                        line.startswith(('CMAKE_BUILD_TYPE:', 'SQ_ENABLE_JIT:', 'SQGI_ENABLE_LTO:', 'SQGI_PGO_MODE:', 'CMAKE_CXX_COMPILER:'))]
    expected_results={}

    def accept(label,workload,data):
        expected=workloads[workload][1]
        if [(c['kind'],c['size']) for c in data['cases']]!=expected:
            raise ValueError(f'{label}: unexpected cases')
        for c in data['cases']:
            samples=c['timings_ns']
            if len(samples)!=9 or any(not math.isfinite(v) or v<=0 for v in samples):
                raise ValueError('invalid timings')
            payload={k:v for k,v in c.items() if k!='timings_ns'}
            key=(workload,c['kind'],c['size'])
            if expected_results.setdefault(key,payload)!=payload:
                raise ValueError(f'correctness mismatch {label}/{key}')
        runs[label][workload].append(data)

    for trial in range(2):
        # Reverse launch order on the second trial to reduce order bias.
        order=configs+[{'name':'Node'}]
        if trial:order=list(reversed(order))
        for c in order:
            for workload,(stem,cases) in workloads.items():
                env=dict(os.environ,SQGI_JIT=str(int(bool(c.get('jit',False)))),
                         SQGI_JIT_TRACE='0',SQGI_JIT_THRESHOLD='1000')
                env.pop('SQGI_KERNEL_DUMP_IR',None)
                if c['name']=='Node':
                    parts=[json.loads(subprocess.check_output(
                        [args.node,f'demo/benchmarks/kernels/node_{stem}.js',f'{kind}/{n}','array'],
                        cwd=root,env=env,text=True)) for kind,n in cases]
                    data=dict(parts[0]);data['cases']=[case for p in parts for case in p['cases']]
                    metadata={'node':data['node'],'v8':data['v8']}
                else:
                    data=json.loads(subprocess.check_output(
                        [c['binary'],f'demo/benchmarks/kernels/{stem}_node.nut'],cwd=root,env=env,text=True))
                accept(c['name'],workload,data)
                print(f"trial {trial+1}: {c['name']} / {workload} checked",flush=True)
    rows=[]
    for workload,(_,cases) in workloads.items():
        for i,(kind,n) in enumerate(cases):
            timings={label:[v for trial in groups[workload] for v in trial['cases'][i]['timings_ns']]
                     for label,groups in runs.items()}
            row={'workload':workload,'kind':kind,'size':n,
                 'median_ns':{label:statistics.median(v) for label,v in timings.items()},
                 'timings_ns':timings}
            rows.append(row)
            print(f'{workload}/{kind}/{n}: '+', '.join(f'{k}={v:.2f} ns' for k,v in row['median_ns'].items()))
    cpuinfo=Path('/proc/cpuinfo')
    cpu_model=next((s.split(':',1)[1].strip() for s in cpuinfo.read_text().splitlines()
                    if s.startswith('model name')),platform.processor()) if cpuinfo.exists() else platform.processor()
    report={'configs':configs,'node':metadata,'cpu_model':cpu_model,'platform':platform.platform(),
            'cpu_affinity':sorted(os.sched_getaffinity(0)) if hasattr(os,'sched_getaffinity') else None,
            'clock':'process CPU time','trials':2,'samples_per_trial':9,'jit_threshold':1000,
            'rows':rows,'runs':runs}
    args.output.write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':main()
