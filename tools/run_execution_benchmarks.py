#!/usr/bin/env python3
"""Compare two SQGI builds using alternating, warmed, checksum-checked runs."""
import argparse
import json
import math
import os
from pathlib import Path
import statistics
import subprocess


def positive(value):
    number = int(value)
    if number <= 0:
        raise argparse.ArgumentTypeError('must be positive')
    return number


def parse(output):
    rows = {}
    for line in output.splitlines():
        fields = line.split('\t')
        if fields[0] != 'BENCH':
            continue
        _, name, count, elapsed, checksum = fields
        rows[name] = dict(iterations=int(count), us=float(elapsed), checksum=checksum)
    if not rows:
        raise ValueError('no benchmark rows returned')
    return rows


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--baseline', type=Path, required=True)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--suite', choices=['kernels', 'execution'], default='kernels')
    parser.add_argument('--runs', type=positive, default=5)
    parser.add_argument('--iterations', type=positive, default=80000)
    parser.add_argument('--cpu', type=int)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.suite == 'execution' and args.iterations % 4:
        parser.error('execution iterations must be a multiple of four')
    binaries = dict(baseline=args.baseline.resolve(), candidate=args.candidate.resolve())
    script = root / ('test/test_jit_perf_correctness.nut' if args.suite == 'kernels' else 'test/bench_execution.nut')
    flags = ['--bench', '--warmups=5'] if args.suite == 'kernels' else []
    prefix = ['taskset', '-c', str(args.cpu)] if args.cpu is not None else []
    samples = {name: {} for name in binaries}
    raw, reference = [], None
    for run in range(args.runs):
        for name in (['baseline', 'candidate'] if run % 2 == 0 else ['candidate', 'baseline']):
            binary = binaries[name]
            env = dict(os.environ, SQGI_JIT='1', SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0')
            env['LD_LIBRARY_PATH'] = str(binary.parent) + (':' + env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
            proc = subprocess.run(prefix + [str(binary), str(script), *flags, f'--iterations={args.iterations}'],
                                  cwd=root, env=env, capture_output=True, text=True, check=True, timeout=300)
            rows = parse(proc.stdout)
            expected_rows = 15 if args.suite == 'kernels' else 4
            if len(rows) != expected_rows:
                raise ValueError(f'expected {expected_rows} rows, got {len(rows)}')
            if reference is None:
                reference = rows
            if rows.keys() != reference.keys():
                raise ValueError('benchmark names changed between runs')
            for kernel, row in rows.items():
                expected = reference[kernel]
                a, b = row['checksum'], expected['checksum']
                # Preserve full-width integer comparisons; floats use the same
                # tolerance as the existing Node comparison runner.
                same = int(a) == int(b) if a.lstrip('-').isdigit() and b.lstrip('-').isdigit() else math.isclose(float(a), float(b), rel_tol=1e-10, abs_tol=1e-10)
                if row['iterations'] != expected['iterations'] or not same:
                    raise ValueError(f'{kernel}: checksum/iteration mismatch')
                if not math.isfinite(row['us']) or row['us'] <= 0:
                    raise ValueError(f'{kernel}: timing is too short; increase iterations')
                samples[name].setdefault(kernel, []).append(row['us'])
            raw.append(dict(run=run + 1, runtime=name, stdout=proc.stdout, stderr=proc.stderr))
        print(f'Completed pair {run + 1}/{args.runs}', flush=True)
    comparisons = {}
    for kernel in reference:
        old = statistics.median(samples['baseline'][kernel])
        new = statistics.median(samples['candidate'][kernel])
        comparisons[kernel] = dict(baseline_us=old, candidate_us=new, speedup=old / new)
        print(f'{kernel}: {old:.6f} -> {new:.6f} us; {old / new:.3f}x')
    args.output.write_text(json.dumps(dict(binaries={k: str(v) for k, v in binaries.items()},
        suite=args.suite, runs=args.runs, iterations=args.iterations, warmups=5, threshold=1,
        cpu=args.cpu, comparisons=comparisons, samples=samples, raw=raw), indent=2) + '\n')


if __name__ == '__main__':
    main()
