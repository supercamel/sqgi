#!/usr/bin/env python3
"""Compare independent member or float workloads with Node and an interpreter reference."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import statistics
import subprocess

from run_execution_benchmarks import parse, positive


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sqgi', action='append', required=True, metavar='NAME=PATH')
    parser.add_argument('--node', type=Path, default=Path('/usr/bin/node'))
    parser.add_argument('--runs', type=positive, default=5)
    parser.add_argument('--iterations', type=positive, default=200000)
    parser.add_argument('--cpu', type=int, default=0)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--suite', choices=['members', 'owners', 'methods', 'floats'], default='members')
    args = parser.parse_args()
    binaries = {}
    for value in args.sqgi:
        name, path = value.split('=', 1)
        if not name or name in binaries or name == 'node':
            parser.error('SQGI names must be unique and cannot be node')
        binaries[name] = Path(path).resolve()
    suite_name, expected_cases = {
        'members': ('member_workloads', 6),
        'owners': ('member_owners', 10),
        'methods': ('member_methods', 6),
        'floats': ('float_workloads', 7),
    }[args.suite]
    script = root / f'test/bench_{suite_name}.nut'
    port = root / f'demo/benchmarks/node_{suite_name}.js'
    commands = {name: [str(binary), str(script), f'--iterations={args.iterations}', '--warmups=5']
                for name, binary in binaries.items()}
    binaries['node'] = args.node.resolve()
    commands['node'] = [str(binaries['node']), str(port), str(args.iterations), '5']
    envs = {name: dict(os.environ, SQGI_JIT='1', SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0',
                       LD_LIBRARY_PATH=str(binary.parent)) for name, binary in binaries.items()}
    prefix = ['taskset', '-c', str(args.cpu)]
    first = next(iter(commands))
    reference_run = subprocess.run(prefix + commands[first], cwd=root,
        env=dict(envs[first], SQGI_JIT='0'), capture_output=True, text=True, check=True, timeout=300)
    reference = parse(reference_run.stdout)
    if len(reference) != expected_cases:
        raise ValueError(f'expected {expected_cases} interpreter reference workloads')
    samples = {name: {} for name in commands}
    raw = [dict(runtime='interpreter_reference', stdout=reference_run.stdout, stderr=reference_run.stderr)]
    names = list(commands)
    for run in range(args.runs):
        for name in names[run % len(names):] + names[:run % len(names)]:
            proc = subprocess.run(prefix + commands[name], cwd=root, env=envs[name],
                                  capture_output=True, text=True, check=True, timeout=300)
            rows = parse(proc.stdout)
            if rows.keys() != reference.keys():
                raise ValueError(f'{name}: workload names differ')
            for kernel, row in rows.items():
                # Matching operation order must produce the same final value;
                # compare floating checksums exactly as well.
                if row['iterations'] != args.iterations or float(row['checksum']) != float(reference[kernel]['checksum']):
                    raise ValueError(f'{name}/{kernel}: checksum mismatch')
                if not math.isfinite(row['us']) or row['us'] <= 0:
                    raise ValueError(f'{name}/{kernel}: invalid timing')
                samples[name].setdefault(kernel, []).append(row['us'])
            raw.append(dict(round=run + 1, runtime=name, stdout=proc.stdout, stderr=proc.stderr))
            print(f'Round {run + 1}/{args.runs}: {name}; {expected_cases} checksums match', flush=True)
    medians = {kernel: {name: statistics.median(samples[name][kernel]) for name in names} for kernel in reference}
    metadata = dict(suite=args.suite, iterations=args.iterations, warmups=5, runs=args.runs, cpu=args.cpu,
                    commands=commands, node_version=subprocess.check_output([str(args.node), '--version'], text=True).strip(),
                    hashes={str(path): hashlib.sha256(path.read_bytes()).hexdigest()
                            for path in [script, port, *binaries.values()]})
    args.output.write_text(json.dumps(dict(metadata=metadata, medians=medians, samples=samples, raw=raw), indent=2) + '\n')
    for kernel, values in medians.items():
        print(kernel + ': ' + ', '.join(f'{name} {value*1000:.2f} ns' for name, value in values.items()))


if __name__ == '__main__':
    main()
