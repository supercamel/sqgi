#!/usr/bin/env python3
"""Compare unchanged SQTheia dynamics with interpreter, JIT and typed kernels."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import statistics
import subprocess


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inputs(repo):
    paths = list((repo / 'src').glob('dynamics_*.nut'))
    paths += [repo / 'src/flight_dynamics.nut', repo / 'resources/kernels/flight-dynamics.sqk']
    paths += list((repo / 'resources/simulation').glob('*.json'))
    return {str(p.relative_to(repo)): sha(p) for p in sorted(paths)}


def compare(actual, expected, path='state'):
    if isinstance(expected, dict):
        assert actual.keys() == expected.keys(), path
        return max(compare(actual[k], v, path+'.'+k) for k, v in expected.items())
    if isinstance(expected, list):
        assert len(actual) == len(expected), path
        return max((compare(a, b, path+f'[{i}]') for i, (a, b) in enumerate(zip(actual, expected))), default=0)
    assert math.isfinite(actual) and math.isclose(actual, expected, abs_tol=2e-7, rel_tol=2e-7), (path, actual, expected)
    return abs(actual - expected)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, required=True)
    parser.add_argument('--sqgi', type=Path, required=True)
    parser.add_argument('--baseline', type=Path)
    parser.add_argument('--runs', type=int, default=3)
    parser.add_argument('--steps', type=int, default=1000)
    parser.add_argument('--threshold', type=int, default=1000)
    parser.add_argument('--cpu', type=int)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.runs < 1 or args.steps < 1 or args.threshold < 0:
        parser.error('runs/steps must be positive and threshold nonnegative')
    if args.cpu is not None:
        os.sched_setaffinity(0, {args.cpu})
    repo, binary = args.repo.resolve(strict=True), args.sqgi.resolve(strict=True)
    harness = Path(__file__).with_name('bench_sqtheia_dynamics.nut').resolve()
    modes = [('interpreter', binary, '0', '0'), ('jit', binary, '1', '0'),
             ('kernels_interpreter', binary, '0', '1'), ('kernels_jit', binary, '1', '1')]
    if args.baseline:
        before = args.baseline.resolve(strict=True)
        modes += [('before_jit', before, '1', '0'), ('before_kernels_jit', before, '1', '1')]
    source_before = inputs(repo)
    report = {'metadata': {'repo': str(repo), 'platform': platform.platform(), 'cpu': args.cpu,
                          'steps_per_aircraft': args.steps, 'threshold': args.threshold,
                          'runs': args.runs, 'passes_per_process': 3, 'warmup_passes': 1,
                          'binaries': {str(m[1]): sha(m[1]) for m in modes},
                          'harness_sha256': sha(harness), 'runner_sha256': sha(Path(__file__)),
                          'source_inputs': source_before}, 'samples': [], 'max_absolute_difference': 0}
    reference = None
    for round_number in range(args.runs):
        # Rotate process order. No statistics collection in timed processes.
        order = modes[round_number % len(modes):] + modes[:round_number % len(modes)]
        for name, executable, jit, kernels in order:
            env = dict(os.environ, SQTHEIA_ROOT=str(repo), SQGI_JIT=jit,
                       SQTHEIA_DYNAMICS_KERNELS=kernels, SQGI_JIT_THRESHOLD=str(args.threshold),
                       SQGI_JIT_PRECISE_EXITS='0', SQTHEIA_AUDIT_STEPS=str(args.steps))
            env.pop('SQGI_JIT_TRACE', None)
            command = [str(executable), str(harness)]
            result = subprocess.run(command, cwd=repo, env=env, text=True, capture_output=True, timeout=180)
            if result.returncode:
                raise RuntimeError(f'{name}: {result.stdout}\n{result.stderr}')
            data = json.loads(next(line.removeprefix('SQTHEIA_BENCH ') for line in result.stdout.splitlines()
                                   if line.startswith('SQTHEIA_BENCH ')))
            for p in data['passes']:
                if reference is None:
                    reference = p['states']
                error = compare(p['states'], reference)
                report['max_absolute_difference'] = max(report['max_absolute_difference'], error)
            report['samples'].append({'mode': name, 'round': round_number, 'command': command, 'result': data})
            print(name, [round(sum(p['seconds'].values()), 6) for p in data['passes']], flush=True)
    report['medians_seconds'] = {
        name: statistics.median(sum(p['seconds'].values()) for sample in report['samples'] if sample['mode'] == name
                                for p in sample['result']['passes'][1:]) for name, *_ in modes}
    report['sources_unchanged'] = inputs(repo) == source_before
    assert report['sources_unchanged'], 'SQTheia inputs changed during measurement'
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report['medians_seconds'], indent=2))


if __name__ == '__main__':
    main()
