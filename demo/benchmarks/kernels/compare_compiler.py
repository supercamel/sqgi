#!/usr/bin/env python3
"""Compare two kernel compiler builds with alternating process order.

Each executable is sqgi_kernel_benchmark_suite. Full fixtures/checksums must
match. Reports regressions for investigation; it does not discard slow cases.
"""
import argparse
import hashlib
import json
from pathlib import Path
import platform
import statistics
import subprocess


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('before', type=Path)
    ap.add_argument('after', type=Path)
    ap.add_argument('--runs', type=int, default=5)
    ap.add_argument('--cpu', type=int, default=0)
    ap.add_argument('--output', type=Path, required=True)
    args = ap.parse_args()
    if args.runs < 3:
        ap.error('Use at least three rounds')
    root = Path(__file__).resolve().parents[3]
    binaries = {'before': args.before.resolve(), 'after': args.after.resolve()}
    report = dict(platform=platform.platform(), cpu=args.cpu, runs=args.runs,
                  binaries={k: dict(path=str(p), sha256=hashlib.sha256(p.read_bytes()).hexdigest())
                            for k, p in binaries.items()}, raw=[])
    samples = {}
    checksums = None
    for round_ in range(args.runs):
        for name in (['before', 'after'] if round_ % 2 == 0 else ['after', 'before']):
            command = ['taskset', '-c', str(args.cpu), str(binaries[name]), '--root', str(root)]
            result = json.loads(subprocess.check_output(command, cwd=root, text=True, timeout=300))
            current = {(c['workload'], c['size'], c['pattern']): c['checksum'] for c in result['cases']}
            if checksums is not None and current != checksums:
                raise ValueError('Workloads or checksums differ')
            checksums = current
            for c in result['cases']:
                key = (c['workload'], c['size'], c['pattern'])
                samples.setdefault(key, {'before': [], 'after': []})[name].append(c['kernel_ns'])
            report['raw'].append(dict(round=round_ + 1, build=name, command=command, result=result))
            args.output.write_text(json.dumps(report, indent=2) + '\n')
            print(f'Round {round_ + 1}/{args.runs}: {name}; {len(current)} checksums match', flush=True)
    report['cases'] = []
    for key, values in samples.items():
        before, after = [statistics.median(values[k]) for k in ['before', 'after']]
        report['cases'].append(dict(workload=key[0], size=key[1], pattern=key[2],
                                    before_ns=before, after_ns=after, after_over_before=after / before,
                                    samples=values, investigate=after > before * 1.05 and after - before > 1.0))
    report['median_ratio'] = statistics.median(c['after_over_before'] for c in report['cases'])
    report['investigate'] = [c for c in report['cases'] if c['investigate']]
    args.output.write_text(json.dumps(report, indent=2) + '\n')
    print(f"Median time ratio: {report['median_ratio']:.3f}; {len(report['investigate'])} cases to investigate")


if __name__ == '__main__':
    main()
