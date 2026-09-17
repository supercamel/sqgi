#!/usr/bin/env python3
"""Fresh-process comparisons of ordinary loops and prepared stateful kernel calls."""
import argparse
import json
import os
from pathlib import Path
import statistics
import subprocess
import sys

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('sqgi', type=Path)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
root = Path(__file__).resolve().parents[3]
base = root / 'demo/benchmarks/kernels'
out = args.output.resolve()
out.mkdir(parents=True, exist_ok=True)
# Existing cross-runtime harnesses accept an empty numeric fixture list, leaving
# only their five ordinary workloads. No numeric results are cached or reused.
fixture = out / 'ordinary-only.json'
fixture.write_text('{"cases":[]}\n')
commands = {
    'sqgi': [args.sqgi.resolve(), base / 'boxed_squirrel.nut', '--json'],
    'node': ['node', base / 'runtime_workloads.js', fixture, base],
    'gjs': ['gjs', base / 'runtime_workloads.js', fixture, base],
    'python': [sys.executable, base / 'python_workloads.py', fixture],
}

def run(name, command):
    print('Running ' + name, flush=True)
    result = subprocess.run(list(map(str, command)), cwd=root, text=True,
                            capture_output=True, check=True)
    data = json.loads(result.stdout)
    (out / (name + '.json')).write_text(json.dumps(data, indent=2) + '\n')
    return data

ordinary = {name: [] for name in commands}
for trial, order in enumerate([list(commands), list(reversed(commands))]):
    for name in order:
        ordinary[name].append(run(f'{name}-ordinary-{trial}', commands[name]))
rows = ['# Hot-loop comparison', '',
        'Two fresh processes per runtime, reversed launch order. Times are median',
        'nanoseconds per iteration; compilation/promotion excluded. SQGI uses',
        'process CPU time; the ordinary Node/GJS/Python harnesses use monotonic',
        'wall time. Whole-loop throughput, not standalone call latency.', '',
        '| Workload | SQGI LLVM | Node | GJS | Python |',
        '|---|---:|---:|---:|---:|']
for reference in ordinary['sqgi'][0]['cases']:
    name = reference['name']
    values = {}
    for runtime, trials in ordinary.items():
        samples = []
        for trial in trials:
            case = next(c for c in trial['cases'] if
                        c.get('name', c.get('workload')) in [name, 'ordinary/' + name])
            if case['result'] != reference['result']:
                raise ValueError(f'{runtime}/{name}: checksum mismatch')
            if runtime == 'sqgi':
                if case['stats']['fused_entries'] == 0:
                    raise ValueError(f'{name}: region did not promote')
                samples.extend(case['samples_ns'][1])
            else:
                samples.extend(x / case['size'] for x in case['samples_ns'])
        values[runtime] = statistics.median(samples)
    rows.append('| ' + name + ' | ' + ' | '.join(f'{values[k]:.3f}' for k in commands) + ' |')

tiny = {'sqgi': [], 'node': []}
for trial, order in enumerate([['sqgi', 'node'], ['node', 'sqgi']]):
    for runtime in order:
        if runtime == 'sqgi':
            data = run(f'sqgi-tiny-{trial}', [args.sqgi.resolve(), base / 'tiny_calls.nut'])
        else:
            cases = [run(f'node-{name}-{trial}', ['node', base / 'node_tiny_calls.js', name])
                     for name in ['integer_export', 'scalar_method']]
            data = {'cases': cases}
        tiny[runtime].append(data)
rows += ['', 'Both tiny-call harnesses use process CPU time and 11 samples per process.', '',
         '| Tiny-call loop | SQGI LLVM | Node |', '|---|---:|---:|']
for name in ['integer_export', 'scalar_method']:
    times = {}
    reference = next(c for c in tiny['sqgi'][0]['cases'] if c['name'] == name)
    for runtime, trials in tiny.items():
        samples = []
        for trial in trials:
            case = next(c for c in trial['cases'] if c['name'] == name)
            if (case['n'], case['result']) != (reference['n'], reference['result']):
                raise ValueError('tiny-call checksum mismatch')
            if runtime == 'sqgi':
                counter = 'prepared_calls' if name == 'scalar_method' else 'inlined_calls'
                if case['stats'][counter] == 0:
                    raise ValueError(f'{name}: optimized calls did not execute')
                samples.extend(case['samples_ns'][1])
            else:
                samples.extend(case['samples_ns'])
        times[runtime] = statistics.median(samples)
    rows.append(f"| {name} | {times['sqgi']:.3f} | {times['node']:.3f} |")
metadata = {'cpu_affinity': sorted(os.sched_getaffinity(0)), 'sqgi': str(args.sqgi.resolve()),
            'ordinary': ordinary, 'tiny': tiny}
(out / 'results.json').write_text(json.dumps(metadata, indent=2) + '\n')
(out / 'report.md').write_text('\n'.join(rows) + '\n')
print('\n'.join(rows), flush=True)
