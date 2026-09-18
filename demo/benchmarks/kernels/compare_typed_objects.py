#!/usr/bin/env python3
"""Compare compiled typed-object workflows with a warmed Node.js class (CPU time)."""
import argparse
import json
import math
import os
from pathlib import Path
import platform
import statistics
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('sqgi', type=Path)
    parser.add_argument('--node', default='node')
    parser.add_argument('--workload', choices=['controller', 'workflow'], default='controller')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--node-storage', choices=['array', 'float64'], default='array',
                        help='Node scratch storage for the workflow benchmark')
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[3]
    stem = 'compiled_workflow' if args.workload == 'workflow' else 'typed_objects'
    commands = {
        'kernel': [str(args.sqgi.resolve()), f'demo/benchmarks/kernels/{stem}_node.nut'],
        'node': [args.node, f'demo/benchmarks/kernels/node_{stem}.js'],
    }
    runs = {'kernel': [], 'node': []}
    # Separate processes, alternating launch order; no competing benchmark jobs.
    for order in [('kernel', 'node'), ('node', 'kernel')]:
        for name in order:
            expected = [('driver', 1), ('scalar', 1), ('driver', 16), ('driver', 256), ('driver', 4096)]
            if args.workload == 'workflow':
                expected = [('workflow', size) for size in [1, 16, 256, 4096]]
            if name == 'node':
                # Isolate V8 feedback: an earlier case must not make a later
                # driver polymorphic or bias its inlining decisions.
                parts = [json.loads(subprocess.check_output(
                    commands[name]+[f'{kind}/{size}']+([args.node_storage] if args.workload == 'workflow' else []),
                    cwd=root, text=True))
                    for kind, size in expected]
                data = dict(parts[0])
                data['cases'] = [c for part in parts for c in part['cases']]
            else:
                data = json.loads(subprocess.check_output(commands[name], cwd=root, text=True))
            if [(c['kind'], c['size']) for c in data['cases']] != expected:
                raise ValueError('unexpected case list')
            for c in data['cases']:
                if len(c['timings_ns']) != 9 or any(not math.isfinite(t) or t <= 0 for t in c['timings_ns']):
                    raise ValueError('invalid timing samples')
            runs[name].append(data)
    rows = []
    for i, base in enumerate(runs['kernel'][0]['cases']):
        for results in runs.values():
            for run in results:
                other = run['cases'][i]
                if set(base) != set(other):
                    raise ValueError('cross-runtime schema mismatch')
                for key in set(base) - {'timings_ns'}:
                    if base[key] != other[key]:
                        raise ValueError(f"cross-runtime mismatch: {base['kind']}/{base['size']} {key}")
        timings = {name: [t for run in results for t in run['cases'][i]['timings_ns']]
                   for name, results in runs.items()}
        medians = {name: statistics.median(t) for name, t in timings.items()}
        row = {'kind': base['kind'], 'size': base['size'], 'repeats': base['repeats'],
               'kernel_ns': medians['kernel'], 'node_ns': medians['node'],
               'node_over_kernel': medians['node']/medians['kernel'],
               'timings_ns': timings}
        rows.append(row)
        print(f"{row['kind']:6}/{row['size']:4} kernel={row['kernel_ns']:9.2f} ns "
              f"node={row['node_ns']:9.2f} ns node/kernel={row['node_over_kernel']:.3f}")
    cpu_model = platform.processor()
    cpuinfo = Path('/proc/cpuinfo')
    if cpuinfo.exists():
        cpu_model = next((line.split(':', 1)[1].strip() for line in cpuinfo.read_text().splitlines()
                          if line.startswith('model name')), cpu_model)
    report = {'workload': args.workload, 'node_storage': runs['node'][0]['storage'], 'cpu_model': cpu_model, 'sqgi_binary': str(args.sqgi.resolve()),
              'platform': platform.platform(), 'node': runs['node'][0]['node'],
              'v8': runs['node'][0]['v8'], 'backend': runs['kernel'][0]['backend'],
              'cpu_affinity': sorted(os.sched_getaffinity(0)) if hasattr(os, 'sched_getaffinity') else None,
              'clock': 'process CPU time', 'trials': 2, 'node_process_per_case': True, 'samples_per_trial': 9,
              'cases': rows, 'runs': runs}
    if args.output:
        args.output.write_text(json.dumps(report, indent=2)+'\n')


if __name__ == '__main__':
    main()
