#!/usr/bin/env python3
"""Fresh-process, reversed-order trials of inlined kernels versus Node calls."""
import argparse,json,os,statistics,subprocess
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__);p.add_argument('sqgi',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
root=Path(__file__).resolve().parents[3];base=root/'demo/benchmarks/kernels';runs={}
for name in ['twice','affine','square']:
    runs[name]={'sqgi':[],'node':[]}
    for order in [('sqgi','node'),('node','sqgi')]:
        for runtime in order:
            command=[str(a.sqgi.resolve()),str(base/'inline_calls.nut'),name] if runtime=='sqgi' else ['node',str(base/'node_inline_calls.js'),name]
            result=subprocess.run(command,cwd=root,capture_output=True,text=True)
            if result.returncode:raise RuntimeError(result.stdout+result.stderr)
            data=json.loads(result.stdout);runs[name][runtime].append(data)
    first=runs[name]['sqgi'][0]
    for values in runs[name].values():
        for run in values:
            for field in ['name','n','repeats','expected','checksums']:
                if run[field]!=first[field]:raise ValueError(f'{name}: {field} mismatch')
    times={runtime:statistics.median([v for run in values for v in run['samples_ns']]) for runtime,values in runs[name].items()}
    print(f"{name}: SQGI {times['sqgi']:.4f} ns/iteration, Node {times['node']:.4f} ns/iteration, Node/SQGI {times['node']/times['sqgi']:.2f}",flush=True)
a.output.write_text(json.dumps({'cpu_affinity':sorted(os.sched_getaffinity(0)),'clock':'process CPU','trials':2,'samples_per_trial':11,'runs':runs},indent=2)+'\n')
