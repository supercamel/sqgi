#!/usr/bin/env python3
"""Compare equivalent warmed SQGI, Node, GJS and pure-Python kernels."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import shutil
import statistics
import subprocess
import sys
from run_sqgi_node_benchmarks import FLOAT_KERNELS, parse, positive


def cache_settings(binary):
    path = binary.parent / 'CMakeCache.txt'
    wanted = {'CMAKE_BUILD_TYPE', 'CMAKE_CXX_COMPILER', 'SQ_ENABLE_JIT',
              'SQGI_ENABLE_LTO', 'SQGI_PGO_MODE', 'SQGI_PGO_DIRECTORY', 'SQGI_ENABLE_ASAN'}
    result = {}
    if path.exists():
        for line in path.read_text().splitlines():
            if ':' in line and '=' in line:
                key, value = line.split('=', 1)
                key = key.split(':', 1)[0]
                if key in wanted:
                    result[key] = value
    return result


def profile_identity(build):
    if build.get('SQGI_PGO_MODE') != 'USE':
        return None
    directory = Path(build['SQGI_PGO_DIRECTORY'])
    profiles = sorted(directory.rglob('*.gcda'))
    digest = hashlib.sha256()
    for profile in profiles:
        digest.update(str(profile.relative_to(directory)).encode() + b'\0')
        digest.update(hashlib.sha256(profile.read_bytes()).digest())
    return dict(files=len(profiles), sha256=digest.hexdigest())


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sqgi', type=Path, required=True)
    parser.add_argument('--sqgi-pgo', type=Path, help='also show a separately trained SQGI build')
    parser.add_argument('--sqgi-baseline', type=Path, help='also compare an earlier build with matching options')
    parser.add_argument('--suite', choices=['kernels', 'applications', 'roots'], default='kernels')
    parser.add_argument('--seed', type=positive, default=17, help='input seed for the applications suite')
    parser.add_argument('--node', default=shutil.which('node') or 'node')
    parser.add_argument('--gjs', default=shutil.which('gjs') or 'gjs')
    parser.add_argument('--gjs-mode', choices=['module', 'script'], default='module')
    parser.add_argument('--python', default=sys.executable)
    parser.add_argument('--runs', type=positive, default=5)
    parser.add_argument('--iterations', type=positive, default=80000)
    parser.add_argument('--warmups', type=positive, default=5)
    parser.add_argument('--threshold', type=positive, default=1)
    parser.add_argument('--cpu', type=int)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    binaries = {'sqgi': args.sqgi.resolve()}
    if args.sqgi_pgo:
        binaries['sqgi_pgo'] = args.sqgi_pgo.resolve()
    if args.sqgi_baseline:
        binaries['sqgi_baseline'] = args.sqgi_baseline.resolve()
    sq_name, port_name, expected_count, float_kernels = {
        'kernels': ('test_jit_perf_correctness.nut', 'jit_kernels', 15, FLOAT_KERNELS),
        'applications': ('bench_application_workloads.nut', 'application_workloads', 8, {'filter_stream'}),
        'roots': ('bench_root_workloads.nut', 'root_workloads', 4, set()),
    }[args.suite]
    sq_script = root / 'test' / sq_name
    js_script = f'node_{port_name}.js'
    py_script = f'python_{port_name}.py'
    envs, commands, runtime_metadata = {}, {}, {}
    for name, binary in binaries.items():
        env = dict(os.environ, SQGI_JIT='1', SQGI_JIT_THRESHOLD=str(args.threshold), SQGI_JIT_TRACE='0')
        env['LD_LIBRARY_PATH'] = str(binary.parent) + (':' + env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
        widths = subprocess.check_output([str(binary), '-e', 'print(_intsize_ + " " + _floatsize_)'], env=env, text=True).split()
        if widths != ['8', '8']:
            parser.error(f'{name} must use int64 and double')
        envs[name] = env
        commands[name] = [str(binary), str(sq_script), '--bench',
                          f'--iterations={args.iterations}', f'--warmups={args.warmups}',
                          f'--seed={args.seed}']
        runtime_metadata[name] = dict(binary=str(binary), sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                                      integer_bytes=8, float_bytes=8, build=cache_settings(binary))
        runtime_metadata[name]['profile_identity'] = profile_identity(runtime_metadata[name]['build'])
    for name, binary, script in [('node', args.node, js_script),
                                 ('gjs', args.gjs, js_script),
                                 ('python', args.python, py_script)]:
        resolved = shutil.which(binary)
        if not resolved:
            parser.error(f'{name} executable unavailable: {binary}')
        runtime_metadata[name] = dict(binary=resolved, version=subprocess.check_output([resolved, '--version'], text=True).strip())
        envs[name] = os.environ.copy()
        mode = ['-m'] if name == 'gjs' and args.gjs_mode == 'module' else []
        if name == 'gjs':
            runtime_metadata[name]['mode'] = args.gjs_mode
        commands[name] = [resolved, *mode, str(root / 'demo/benchmarks' / script),
                          str(args.iterations), str(args.warmups), str(args.seed)]
    names = list(commands)
    prefix = ['taskset', '-c', str(args.cpu)] if args.cpu is not None else []
    metadata = dict(runtimes=runtime_metadata, platform=platform.platform(), runs=args.runs,
                    iterations=args.iterations, warmups=args.warmups, threshold=args.threshold,
                    cpu=args.cpu, suite=args.suite, seed=args.seed,
                    started_utc=datetime.now(timezone.utc).isoformat(),
                    load_average_start=os.getloadavg() if hasattr(os, 'getloadavg') else None,
                    source_hashes={str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
                                   for p in (sq_script, root / 'demo/benchmarks' / js_script,
                                             root / 'demo/benchmarks' / py_script)},
                    order='rotating runtime order, one fresh process per runtime per round')
    if args.cpu is not None:
        cpufreq = Path(f'/sys/devices/system/cpu/cpu{args.cpu}/cpufreq')
        metadata['cpu_frequency'] = {key: (cpufreq / key).read_text().strip()
                                     for key in ('cpuinfo_max_freq', 'scaling_governor')
                                     if (cpufreq / key).exists()}
    if Path('/proc/cpuinfo').exists():
        metadata['cpu_model'] = next((line.split(':', 1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines()
                                      if line.startswith('model name')), 'unknown')
    samples, raw = {}, []
    # Establish semantics independently of all native compilers before timing.
    reference_command = [arg if not arg.startswith('--warmups=') else '--warmups=0'
                         for arg in commands['sqgi']]
    reference_proc = subprocess.run(prefix + reference_command, cwd=root,
        env=dict(envs['sqgi'], SQGI_JIT='0'), text=True, capture_output=True, check=True, timeout=300)
    reference = parse(reference_proc.stdout, expected_count, float_kernels)
    raw.append(dict(runtime='interpreter_reference', command=reference_command,
                    stdout=reference_proc.stdout, stderr=reference_proc.stderr))
    for run in range(args.runs):
        order = names[run % len(names):] + names[:run % len(names)]
        for name in order:
            proc = subprocess.run(prefix + commands[name], cwd=root, env=envs[name], text=True,
                                  capture_output=True, check=True, timeout=300)
            rows = parse(proc.stdout, expected_count, float_kernels)
            if rows.keys() != reference.keys():
                raise ValueError(f'{name}: kernel names differ')
            for kernel, row in rows.items():
                expected = reference[kernel]
                equal = (math.isfinite(row['checksum']) and
                         math.isclose(row['checksum'], expected['checksum'], rel_tol=1e-10, abs_tol=1e-10)
                         if kernel in float_kernels else row['checksum'] == expected['checksum'])
                if row['iterations'] != expected['iterations'] or not equal:
                    raise ValueError(f'{name}/{kernel}: checksum or iteration mismatch: {row} vs {expected}')
                if not math.isfinite(row['us']) or row['us'] <= 0:
                    raise ValueError(f'{name}/{kernel}: invalid timing; increase iterations')
                samples.setdefault(kernel, {runtime: [] for runtime in names})[name].append(row['us'])
            raw.append(dict(round=run + 1, runtime=name, command=commands[name], stdout=proc.stdout, stderr=proc.stderr))
            print(f'Round {run + 1}/{args.runs}: {name}; all {expected_count} checksums match', file=sys.stderr, flush=True)
        # Preserve completed rounds if a later runtime fails or is interrupted.
        args.output.write_text(json.dumps(dict(metadata=metadata, completed_rounds=run + 1, samples=samples, raw=raw), indent=2) + '\n')
    medians = {kernel: {name: statistics.median(values) for name, values in row.items()} for kernel, row in samples.items()}
    spread = {kernel: {name: dict(min=min(values), max=max(values),
                                relative_range=(max(values) - min(values)) / statistics.median(values))
                       for name, values in row.items()} for kernel, row in samples.items()}
    ratios = {kernel: {name: row['sqgi'] / row[name] for name in names if name != 'sqgi'} for kernel, row in medians.items()}
    print('Microseconds per iteration; lower is faster')
    print('kernel\t' + '\t'.join(names))
    for kernel, row in medians.items():
        print(kernel + '\t' + '\t'.join(f'{row[name]:.9f}' for name in names))
    metadata['finished_utc'] = datetime.now(timezone.utc).isoformat()
    metadata['load_average_end'] = os.getloadavg() if hasattr(os, 'getloadavg') else None
    args.output.write_text(json.dumps(dict(metadata=metadata, completed_rounds=args.runs, medians=medians,
        sqgi_over_other_time=ratios, spread=spread, samples=samples, raw=raw), indent=2) + '\n')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
