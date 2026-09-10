#!/usr/bin/env python3
"""Compare two SQGI builds using alternating, warmed, checksum-checked runs."""
import argparse
from datetime import datetime, timezone
import hashlib
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


def host_snapshot(cpu=None):
    """Record conditions around each process; never include them in its timing."""
    snapshot = {'utc': datetime.now(timezone.utc).isoformat(),
                'load_average': os.getloadavg()}
    if cpu is not None:
        frequency = {}
        for name in ('scaling_governor', 'scaling_cur_freq', 'cpuinfo_max_freq'):
            path = Path(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/{name}')
            try:
                frequency[name] = path.read_text().strip()
            except OSError:
                pass
        snapshot['cpu_frequency'] = frequency
    return snapshot


def parse(output):
    rows = {}
    for line in output.splitlines():
        fields = line.split('\t')
        if fields[0] != 'BENCH':
            continue
        _, name, count, elapsed, checksum = fields
        if name in rows:
            raise ValueError(f'duplicate benchmark row: {name}')
        rows[name] = dict(iterations=int(count), us=float(elapsed), checksum=checksum)
    if not rows:
        raise ValueError('no benchmark rows returned')
    return rows


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--baseline', type=Path, required=True)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--suite', choices=['kernels', 'execution', 'applications'], default='kernels')
    parser.add_argument('--seed', type=positive, default=17, help='input seed for the applications suite')
    parser.add_argument('--jit', type=int, choices=[0, 1], default=1,
                        help='enable JIT (default), or measure shared interpreter paths with 0')
    parser.add_argument('--runs', type=positive, default=5)
    parser.add_argument('--iterations', type=positive, default=80000)
    parser.add_argument('--cpu', type=int)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.suite == 'execution' and args.iterations % 4:
        parser.error('execution iterations must be a multiple of four')
    binaries = dict(baseline=args.baseline.resolve(), candidate=args.candidate.resolve())
    script = root / {'kernels': 'test/test_jit_perf_correctness.nut',
                     'execution': 'test/bench_execution.nut',
                     'applications': 'test/bench_application_workloads.nut'}[args.suite]
    flags = [] if args.suite == 'execution' else ['--bench', '--warmups=5', f'--seed={args.seed}']
    prefix = ['taskset', '-c', str(args.cpu)] if args.cpu is not None else []
    samples = {name: {} for name in binaries}
    raw, reference = [], None
    for run in range(args.runs):
        for name in (['baseline', 'candidate'] if run % 2 == 0 else ['candidate', 'baseline']):
            binary = binaries[name]
            env = dict(os.environ, SQGI_JIT=str(args.jit), SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0')
            env['LD_LIBRARY_PATH'] = str(binary.parent) + (':' + env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
            host_start = host_snapshot(args.cpu)
            proc = subprocess.run(prefix + [str(binary), str(script), *flags, f'--iterations={args.iterations}'],
                                  cwd=root, env=env, capture_output=True, text=True, check=True, timeout=300)
            host_end = host_snapshot(args.cpu)
            rows = parse(proc.stdout)
            expected_rows = {'kernels': 15, 'execution': 4, 'applications': 8}[args.suite]
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
            raw.append(dict(run=run + 1, runtime=name, stdout=proc.stdout, stderr=proc.stderr,
                            host_start=host_start, host_end=host_end))
        print(f'Completed pair {run + 1}/{args.runs}', flush=True)
    comparisons = {}
    for kernel in reference:
        old = statistics.median(samples['baseline'][kernel])
        new = statistics.median(samples['candidate'][kernel])
        comparisons[kernel] = dict(baseline_us=old, candidate_us=new, speedup=old / new)
        print(f'{kernel}: {old:.6f} -> {new:.6f} us; {old / new:.3f}x')
    args.output.write_text(json.dumps(dict(binaries={k: str(v) for k, v in binaries.items()},
        suite=args.suite, runs=args.runs, iterations=args.iterations, warmups=5, threshold=1,
        cpu=args.cpu, seed=args.seed, jit=args.jit,
        binary_sha256={name: hashlib.sha256(binary.read_bytes()).hexdigest()
                       for name, binary in binaries.items()},
        script_sha256=hashlib.sha256(script.read_bytes()).hexdigest(),
        comparisons=comparisons, samples=samples, raw=raw), indent=2) + '\n')


if __name__ == '__main__':
    main()
