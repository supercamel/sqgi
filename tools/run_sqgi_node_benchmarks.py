#!/usr/bin/env python3
"""Compare warmed SQGI JIT kernels with equivalent Node.js algorithms."""
import argparse
import json
import math
import os
from pathlib import Path
import shutil
import statistics
import subprocess
import sys

FLOAT_KERNELS = {'float_call', 'array_float', 'vector', 'matrix',
                 'math_intrinsic', 'math_variable'}


def positive(value):
    result = int(value)
    if result <= 0:
        raise argparse.ArgumentTypeError('must be positive')
    return result


def parse(output, expected_count=15, float_kernels=FLOAT_KERNELS):
    rows = {}
    for line in output.splitlines():
        fields = line.split('\t')
        if fields[0] != 'BENCH':
            continue
        _, name, count, elapsed, checksum = fields
        if name in rows:
            raise ValueError(f'duplicate benchmark row: {name}')
        rows[name] = {'iterations': int(count), 'us': float(elapsed),
                      'checksum': float(checksum) if name in float_kernels else int(checksum)}
    if len(rows) != expected_count:
        raise ValueError(f'expected {expected_count} benchmark rows, got {len(rows)}')
    return rows


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sqgi', type=Path, default=root / 'build-jit-release/sqgi')
    parser.add_argument('--node', default=shutil.which('node') or 'node')
    parser.add_argument('--runs', type=positive, default=5)
    parser.add_argument('--iterations', type=positive, default=80000)
    parser.add_argument('--warmups', type=positive, default=5)
    parser.add_argument('--threshold', type=positive, default=1)
    parser.add_argument('--cpu', type=int, help='pin each process with Linux taskset')
    parser.add_argument('--output', type=Path, help='save metadata, raw output and samples as JSON')
    args = parser.parse_args()
    sqgi = args.sqgi.resolve()
    env = dict(os.environ, SQGI_JIT='1', SQGI_JIT_THRESHOLD=str(args.threshold), SQGI_JIT_TRACE='0')
    env['LD_LIBRARY_PATH'] = str(sqgi.parent) + (':' + env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
    prefix = ['taskset', '-c', str(args.cpu)] if args.cpu is not None else []
    commands = {
        'sqgi': [str(sqgi), str(root / 'test/test_jit_perf_correctness.nut'), '--bench',
                 f'--iterations={args.iterations}', f'--warmups={args.warmups}'],
        'node': [args.node, str(root / 'demo/benchmarks/node_jit_kernels.js'),
                 str(args.iterations), str(args.warmups)],
    }
    widths = subprocess.check_output(
        [str(sqgi), '-e', 'print(_intsize_ + " " + _floatsize_)'], env=env, text=True).split()
    if widths != ['8', '8']:
        parser.error('comparison requires a SQGI build with int64 and double')
    metadata = {'node': subprocess.check_output([args.node, '--version'], text=True).strip(),
                'sqgi': str(sqgi), 'runs': args.runs, 'iterations': args.iterations,
                'warmups': args.warmups, 'threshold': args.threshold, 'cpu': args.cpu,
                'sqgi_integer_bytes': 8, 'sqgi_float_bytes': 8}
    samples, raw = {}, []
    for run in range(args.runs):
        pair = {}
        for runtime in (['sqgi', 'node'] if run % 2 == 0 else ['node', 'sqgi']):
            output = subprocess.check_output(prefix + commands[runtime], cwd=root, env=env, text=True)
            pair[runtime] = parse(output)
            raw.append({'run': run + 1, 'runtime': runtime, 'output': output})
            for name, row in pair[runtime].items():
                samples.setdefault(name, {'sqgi': [], 'node': []})[runtime].append(row['us'])
        if pair['sqgi'].keys() != pair['node'].keys():
            raise ValueError('benchmark names differ between runtimes')
        for name, row in pair['sqgi'].items():
            other = pair['node'][name]
            if row['iterations'] != other['iterations']:
                raise ValueError(f'{name}: iteration counts differ')
            equal = (math.isfinite(row['checksum']) and math.isfinite(other['checksum']) and
                     math.isclose(row['checksum'], other['checksum'], rel_tol=1e-10, abs_tol=1e-10)
                     if name in FLOAT_KERNELS else row['checksum'] == other['checksum'])
            if not equal:
                raise ValueError(f'{name}: checksums differ: {row["checksum"]} vs {other["checksum"]}')
        print(f'completed {run+1}/{args.runs}; all checksums match', file=sys.stderr)
    medians = {}
    print(f'Node {metadata["node"]}; {args.runs} alternating pairs; {args.warmups} full warmups per kernel')
    print('kernel\tsqgi_us\tnode_us\tsqgi/node_time')
    for name, rows in samples.items():
        sq = statistics.median(rows['sqgi'])
        node = statistics.median(rows['node'])
        medians[name] = {'sqgi_us': sq, 'node_us': node, 'sqgi_over_node': sq / node}
        print(f'{name}\t{sq:.9f}\t{node:.9f}\t{sq/node:.3f}x')
    if args.output:
        args.output.write_text(json.dumps({'metadata': metadata, 'medians': medians,
                                          'samples': samples, 'raw': raw}, indent=2) + '\n')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
