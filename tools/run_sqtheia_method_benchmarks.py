#!/usr/bin/env python3
"""Measure unchanged SQTheia vector/quaternion methods in fresh processes."""
import argparse
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess

from run_sqtheia_benchmarks import compare, inputs, sha


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, required=True)
    parser.add_argument('--sqgi', type=Path, required=True)
    parser.add_argument('--baseline', type=Path, required=True)
    parser.add_argument('--runs', type=int, default=3)
    parser.add_argument('--cpu', type=int)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.runs < 1:
        parser.error('runs must be positive')
    if args.cpu is not None:
        os.sched_setaffinity(0, {args.cpu})
    repo = args.repo.resolve(strict=True)
    harness = Path(__file__).with_name('bench_sqtheia_methods.nut').resolve()
    current, baseline = args.sqgi.resolve(strict=True), args.baseline.resolve(strict=True)
    modes = [('interpreter', current, '0'), ('before_jit', baseline, '1'), ('jit', current, '1')]
    source_before = inputs(repo)
    report = {'metadata': {'repo': str(repo), 'platform': platform.platform(), 'cpu': args.cpu,
                          'runs': args.runs, 'warmup_passes': 1, 'threshold': 1000,
                          'binaries': {str(binary): sha(binary) for _, binary, _ in modes},
                          'harness_sha256': sha(harness), 'runner_sha256': sha(Path(__file__)),
                          'source_inputs': source_before}, 'samples': [], 'max_absolute_difference': 0}
    reference = None
    for round_number in range(args.runs):
        offset = round_number % len(modes)
        for mode, binary, jit in modes[offset:] + modes[:offset]:
            env = dict(os.environ, SQTHEIA_ROOT=str(repo), SQGI_JIT=jit, SQGI_JIT_THRESHOLD='1000',
                       SQGI_JIT_PRECISE_EXITS='0', SQTHEIA_DYNAMICS_KERNELS='0')
            env.pop('SQGI_JIT_TRACE', None)
            result = subprocess.run([str(binary), str(harness)], cwd=repo, env=env,
                                    capture_output=True, text=True, timeout=120, check=True)
            data = json.loads(next(line.removeprefix('SQTHEIA_METHOD_BENCH ') for line in result.stdout.splitlines()
                                   if line.startswith('SQTHEIA_METHOD_BENCH ')))
            for sample in data['passes']:
                if reference is None:
                    reference = sample['checksums']
                report['max_absolute_difference'] = max(report['max_absolute_difference'],
                                                        compare(sample['checksums'], reference))
            report['samples'].append({'mode': mode, 'round': round_number, 'result': data})
            print(mode, data['passes'][-1]['seconds'], flush=True)
    report['medians_seconds'] = {
        mode: {method: statistics.median(sample['seconds'][method] for process in report['samples']
                                        if process['mode'] == mode for sample in process['result']['passes'][1:])
               for method in reference} for mode, _, _ in modes}
    report['sources_unchanged'] = inputs(repo) == source_before
    assert report['sources_unchanged'], 'SQTheia inputs changed during measurement'
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report['medians_seconds'], indent=2))


if __name__ == '__main__':
    main()
