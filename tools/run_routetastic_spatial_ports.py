#!/usr/bin/env python3
"""Validate and compare RouteTastic spatial traversal on an identical exported tree."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo', type=Path, required=True)
    ap.add_argument('--sqgi', type=Path, required=True)
    ap.add_argument('--node', required=True)
    ap.add_argument('--output', type=Path, required=True)
    ap.add_argument('--runs', type=int, default=5)
    ap.add_argument('--cpu', type=int, default=0)
    args = ap.parse_args()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    repo, binary = args.repo.resolve(), args.sqgi.resolve()
    fixture_path = args.output.with_suffix('.fixture.json')
    env = dict(os.environ, ROUTETASTIC_ROOT=str(repo), ROUTETASTIC_GEOMETRY_BACKEND='squirrel',
               ROUTETASTIC_DISABLE_KERNELS='1', SQGI_JIT='0', SQGI_JIT_TRACE='0', SQGI_JIT_THRESHOLD='1')
    fixture_text = subprocess.check_output([str(binary), str(ROOT / 'demo/benchmarks/routetastic/export_spatial.nut')],
                                          cwd=repo, env=env, text=True, timeout=60)
    fixture = json.loads(fixture_text)
    fixture_path.write_text(fixture_text)
    records, samples = [], {}
    commands = {
        'sqgi_interpreter': [str(binary), 'scripts/benchmark-spatial.nut'],
        'sqgi_jit': [str(binary), 'scripts/benchmark-spatial.nut'],
        'node': [args.node, str(ROOT / 'demo/benchmarks/routetastic/spatial.mjs'), str(fixture_path.resolve())],
        'gjs': ['gjs', '-m', str(ROOT / 'demo/benchmarks/routetastic/spatial.mjs'), str(fixture_path.resolve())],
        'python': [sys.executable, str(ROOT / 'demo/benchmarks/routetastic/spatial.py'), str(fixture_path.resolve())],
    }
    for repeat in range(args.runs):
        order = list(commands)
        order = order[repeat % len(order):] + order[:repeat % len(order)]
        for name in order:
            current = dict(env, ROUTETASTIC_DISABLE_KERNELS='0', SQGI_JIT='1' if name == 'sqgi_jit' else '0')
            cmd = ['taskset', '-c', str(args.cpu), *commands[name]]
            start = time.perf_counter()
            p = subprocess.run(cmd, cwd=repo, env=current, capture_output=True, text=True, timeout=120, check=True)
            wall = time.perf_counter()-start
            result = json.loads(p.stdout)
            grouped = {}
            for i, row in enumerate(result['runs']):
                if row['checksum'] != fixture['checksum'] or row['matches'] != fixture['matches']:
                    raise ValueError(f'{name}: ordered query results differ')
                if name.startswith('sqgi'):
                    label = name + ('_kernel' if row['kernel'] else '_objects')
                    warmup = i < 2
                else:
                    label, warmup = name, i < 3
                if not warmup:
                    grouped.setdefault(label, []).append(row['seconds'])
            for label, values in grouped.items():
                samples.setdefault(label, []).append(statistics.median(values))
            records.append(dict(round=repeat+1, runtime=name, command=cmd, wall_s=wall, result=result, stderr=p.stderr))
            print(f'{repeat+1}/{args.runs} {name}: all ordered results match', flush=True)
    sources = [*sorted((repo/'src').glob('*.nut')), repo/'scripts/benchmark-spatial.nut',
               *sorted((ROOT/'demo/benchmarks/routetastic').glob('spatial.*')), ROOT/'demo/benchmarks/routetastic/export_spatial.nut']
    report = dict(queries=len(fixture['queries']), matches=fixture['matches'], checksum=fixture['checksum'],
        runs=args.runs, cpu=args.cpu, versions={name: subprocess.check_output([cmd[0], '--version'], text=True).strip()
                                             for name, cmd in commands.items() if not name.startswith('sqgi')},
        sources={str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources},
        binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
        fixture_sha256=hashlib.sha256(fixture_text.encode()).hexdigest(),
        medians_s={k: statistics.median(v) for k, v in samples.items()}, samples_s=samples, records=records)
    args.output.write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report['medians_s'], indent=2))


if __name__ == '__main__':
    main()
