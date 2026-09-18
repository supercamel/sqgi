#!/usr/bin/env python3
"""Compare the evolving 3x3 matrix kernel with ordinary Squirrel, Node, GJS and Python."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import statistics
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / 'tools'))
from run_sqgi_node_benchmarks import parse, positive
from run_runtime_benchmarks import cache_settings


def main(workload="matrix"):
    parser = argparse.ArgumentParser(description=f"Compare the {workload} kernel with ordinary Squirrel, Node, GJS and Python.")
    parser.add_argument('--sqgi', type=Path, required=True)
    parser.add_argument('--node', default='node', help='Node.js executable to benchmark')
    parser.add_argument('--runs', type=positive, default=5)
    parser.add_argument('--iterations', type=positive, default=80000)
    parser.add_argument('--warmups', type=positive, default=5)
    parser.add_argument('--cpu', type=int)
    parser.add_argument('--jit', type=int, choices=[0, 1], default=1)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    binary = args.sqgi.resolve()
    prefix = ['taskset', '-c', str(args.cpu)] if args.cpu is not None else []
    env = dict(os.environ, SQGI_JIT=str(args.jit), SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0')
    env['LD_LIBRARY_PATH'] = str(binary.parent) + (':' + env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
    widths = subprocess.check_output([str(binary), '-e', 'print(_intsize_+" "+_floatsize_)'], env=env, text=True).split()
    if widths != ['8', '8']:
        parser.error('comparison requires int64/double')
    script = ROOT / f'demo/benchmarks/kernels/{workload}_recurrence.nut'
    common = [str(args.iterations), str(args.warmups)]
    commands = {
        'sqgi': [str(binary), str(script), '--bench', f'--iterations={args.iterations}', f'--warmups={args.warmups}'],
        'node': [args.node, str(ROOT / 'demo/benchmarks/node_jit_kernels.js'), *common],
        'gjs': ['gjs', '-m', str(ROOT / 'demo/benchmarks/node_jit_kernels.js'), *common],
        'python': [sys.executable, str(ROOT / 'demo/benchmarks/python_jit_kernels.py'), *common],
    }
    cases = ['math_intrinsic', 'math_variable'] if workload == 'math' else [workload]
    def key(case, runtime):
        return f'{case}_{runtime}' if runtime in ('squirrel', 'kernel') or len(cases)>1 else runtime
    owners = {key(case,runtime): case for case in cases for runtime in ('squirrel','kernel','node','gjs','python')}
    samples = {name: [] for name in owners}
    raw, expected = [], {}
    names = list(commands)
    for run in range(args.runs):
        for name in names[run % len(names):] + names[:run % len(names)]:
            command = commands[name] + (['--reverse'] if name == 'sqgi' and run % 2 else [])
            proc = subprocess.run(prefix + command, cwd=ROOT, env=env, text=True, capture_output=True, check=True, timeout=300)
            sq_names={key(case,runtime) for case in cases for runtime in ('squirrel','kernel')}
            rows = parse(proc.stdout, len(sq_names), sq_names) if name == 'sqgi' else parse(proc.stdout)
            selected = rows if name == 'sqgi' else {key(case,name): rows[case] for case in cases}
            # The first SQGI run establishes independent Squirrel references.
            if not expected:
                expected = {case: rows[key(case,'squirrel')]['checksum'] for case in cases}
            for label, row in selected.items():
                case=owners[label]
                if row['iterations'] != args.iterations or not math.isfinite(row['checksum']) or not math.isclose(row['checksum'], expected[case], rel_tol=1e-12, abs_tol=1e-12):
                    raise ValueError(f'{case}: checksum/iteration mismatch: {row}')
                if not math.isfinite(row['us']) or row['us'] <= 0:
                    raise ValueError(f'{case}: timing too short; increase iterations')
                samples[label].append(row['us'] * 1000)
            raw.append(dict(round=run + 1, runtime=name, command=command, stdout=proc.stdout, stderr=proc.stderr))
        print(f'Round {run+1}/{args.runs}: all {workload} checksums match', file=sys.stderr, flush=True)
    medians = {name: statistics.median(values) for name, values in samples.items()}
    metadata = dict(workload=workload, runs=args.runs, iterations=args.iterations, warmups=args.warmups, cpu=args.cpu, jit=args.jit,
                    binary=str(binary), binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(), build=cache_settings(binary),
                    versions={name: subprocess.check_output([command[0], '--version'], text=True).strip()
                              for name, command in commands.items() if name != 'sqgi'})
    args.output.write_text(json.dumps(dict(metadata=metadata, checksum=expected[cases[0]] if len(cases)==1 else expected, medians_ns=medians, samples_ns=samples, raw=raw), indent=2) + '\n')
    print(f'Nanoseconds per {workload} iteration; compilation excluded; kernel includes one host call per complete loop')
    for name, value in medians.items():
        print(f'{name}\t{value:.3f}\t{value/medians[key(owners[name],"kernel")]:.2f}x kernel time')


if __name__ == '__main__':
    main()
