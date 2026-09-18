#!/usr/bin/env python3
"""Compare unchanged RouteTastic application code across SQGI execution modes."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import statistics
import subprocess
import time

ROOT = Path(__file__).resolve().parents[1]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def fingerprint(root):
    files = sorted([*root.glob('src/*.nut'), *root.glob('scripts/benchmark*.nut'),
                    *root.glob('native/build/*.so'), *root.glob('native/build/*.typelib')])
    return {str(p.relative_to(root)): digest(p) for p in files}


def equivalent(a, b):
    if isinstance(a, dict) and isinstance(b, dict):
        return a.keys() == b.keys() and all(equivalent(a[k], b[k]) for k in a)
    if isinstance(a, list) and isinstance(b, list):
        return len(a) == len(b) and all(equivalent(x, y) for x, y in zip(a, b))
    if isinstance(a, (int, float)) and isinstance(b, (int, float)):
        return math.isfinite(a) and math.isfinite(b) and math.isclose(a, b, rel_tol=1e-10, abs_tol=1e-10)
    return a == b


def parse(stdout):
    for line in reversed(stdout.splitlines()):
        if line.startswith('RESULT '):
            return json.loads(line[7:])
        if line.startswith('{'):
            return json.loads(line)
    raise ValueError('No JSON benchmark result')


def summaries(records):
    groups = {}
    for item in records:
        if 'error' in item or item.get('diagnostic'):
            continue
        result = item['result']
        group = groups.setdefault((item['task'], item['mode']), {})
        def add(name, value):
            group.setdefault(name, []).append(value)
        add('process_wall_s', item['wall_s'])
        if 'rows' in result:
            add('first_pass_with_imports_s', result['module_import_s'] + result['rows'][0]['total_s'])
            add('module_import_s', result['module_import_s'])
            for row in result['rows'][1:]:
                for name in ['total_s', 'import_s', 'connectivity_s', 'drc_s', 'route_s']:
                    if name in row:
                        add('warm_' + name, row[name])
        else:
            if 'build_seconds' in result:
                add('build_s', result['build_seconds'])
            if 'compile_seconds' in result:
                add('kernel_compile_s', result['compile_seconds'])
            # Discard each path's first internal sample as warmup.
            seen = set()
            for row in result['runs']:
                name = (('kernel' if row['kernel'] else 'squirrel') if 'kernel' in row
                        else row['operation'] + '_' + row['geometry_backend'])
                if name in seen:
                    add(name + '_s', row['seconds'])
                seen.add(name)
    return [dict(task=t, mode=m, medians={k: statistics.median(v) for k, v in g.items()}, samples=g)
            for (t, m), g in groups.items()]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo', type=Path, required=True)
    ap.add_argument('--sqgi', type=Path, required=True)
    ap.add_argument('--baseline', type=Path)
    ap.add_argument('--board', type=Path, required=True)
    ap.add_argument('--output', type=Path, required=True)
    ap.add_argument('--rounds', type=int, default=3)
    ap.add_argument('--repeats', type=int, default=2)
    ap.add_argument('--cpu', type=int, default=0)
    ap.add_argument('--threshold', type=int, default=1000)
    ap.add_argument('--timeout', type=float, default=180)
    ap.add_argument('--tasks', nargs='+', default=['board_small', 'board', 'search', 'spatial', 'geometry'])
    ap.add_argument('--modes', nargs='+', help='defaults to all modes available with the supplied binaries')
    ap.add_argument('--diagnostics', action='store_true', help='additional untimed JIT statistics runs')
    args = ap.parse_args()
    if args.rounds < 1 or args.repeats < 2:
        ap.error('Use positive rounds and at least two repetitions (first and warm)')
    repo, binary, board = args.repo.resolve(), args.sqgi.resolve(), args.board.resolve()
    modes = {
        'interpreter': (binary, '0', 'squirrel', '1'),
        'jit': (binary, '1', 'squirrel', '1'),
        'kernels_interpreter': (binary, '0', 'kernels', '0'),
        'kernels_jit': (binary, '1', 'kernels', '0'),
        'native_interpreter': (binary, '0', 'native', '0'),
        'native_jit': (binary, '1', 'native', '0'),
    }
    if args.baseline:
        modes['before_jit'] = (args.baseline.resolve(), '1', 'squirrel', '1')
    tasks = {
        'board_small': [str(ROOT / 'demo/benchmarks/routetastic/board.nut'), str(repo / 'examples/two-nets.kicad_pcb'), str(args.repeats)],
        'board': [str(ROOT / 'demo/benchmarks/routetastic/board.nut'), str(board), str(args.repeats)],
        'search': [str(ROOT / 'demo/benchmarks/routetastic/search.nut'), str(args.repeats)],
        'autoroute': [str(ROOT / 'demo/benchmarks/routetastic/autoroute.nut'), str(repo / 'examples/two-nets.kicad_pcb'), str(args.repeats)],
        'spatial': ['scripts/benchmark-spatial.nut'],
        'geometry': ['scripts/benchmark-native-geometry.nut'],
    }
    if args.modes is None:
        args.modes = [m for m in ['interpreter', 'before_jit', 'jit', 'kernels_interpreter', 'kernels_jit', 'native_interpreter', 'native_jit'] if m in modes]
    if set(args.tasks) - tasks.keys() or set(args.modes) - modes.keys():
        ap.error('Unknown task/mode or missing --baseline for before_jit')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    inputs = [board, repo / 'examples/two-nets.kicad_pcb']
    inputs += [p.with_suffix(s) for p in list(inputs) for s in ['.kicad_pro', '.kicad_dru'] if p.with_suffix(s).exists()]
    sources = fingerprint(repo)
    report = dict(metadata=dict(repo=str(repo), platform=platform.platform(), cpu=args.cpu,
        cpu_model=next((s.split(':', 1)[1].strip() for s in Path('/proc/cpuinfo').read_text().splitlines() if s.startswith('model name')), ''),
        rounds=args.rounds, repeats=args.repeats, threshold=args.threshold, sources=sources,
        inputs={str(p): digest(p) for p in inputs}, binaries={m: digest(v[0]) for m, v in modes.items()},
        drivers={str(p.relative_to(ROOT)): digest(p) for p in (ROOT / 'demo/benchmarks/routetastic').glob('*.nut')}), records=[])
    expected, failures = {}, []
    def save():
        report['summaries'] = summaries(report['records'])
        report['failures'] = failures
        args.output.write_text(json.dumps(report, indent=2) + '\n')
    def execute(task, mode, round_index, diagnostic=False):
        executable, jit, backend, disable_kernels = modes[mode]
        if task in ['spatial', 'geometry']:
            disable_kernels = '0'  # Existing scripts explicitly compare both paths.
        env = dict(os.environ, SQGI_JIT=jit, SQGI_JIT_THRESHOLD=str(args.threshold),
            SQGI_JIT_TRACE='stats' if diagnostic else '0', SQGI_JIT_PRECISE_EXITS='0',
            ROUTETASTIC_ROOT=str(repo), ROUTETASTIC_GEOMETRY_BACKEND=backend,
            ROUTETASTIC_DISABLE_KERNELS=disable_kernels, ROUTETASTIC_DISABLE_NATIVE='0',
            LD_LIBRARY_PATH=str(executable.parent) + ':' + os.environ.get('LD_LIBRARY_PATH', ''))
        command = ['taskset', '-c', str(args.cpu), str(executable), *tasks[task]]
        entry = dict(task=task, mode=mode, round=round_index, diagnostic=diagnostic, command=command,
                     environment={k: v for k, v in env.items() if k.startswith(('SQGI_', 'ROUTETASTIC_'))})
        before = time.perf_counter()
        try:
            result = subprocess.run(command, cwd=repo, env=env, capture_output=True, text=True, timeout=args.timeout)
            entry.update(wall_s=time.perf_counter()-before, stdout=result.stdout, stderr=result.stderr, returncode=result.returncode)
            if result.returncode:
                raise ValueError(f'exit {result.returncode}: {result.stderr[-500:]} {result.stdout[-500:]}')
            data = parse(result.stdout)
            entry['result'] = data
            if 'rows' in data:
                if data['backend'] != backend:
                    raise ValueError(f'requested {backend}, got {data["backend"]}')
                for row in data['rows']:
                    expected.setdefault(task, row['result'])
                    if not equivalent(expected[task], row['result']):
                        raise ValueError('application outputs differ across modes/repetitions')
            else:
                for row in data['runs']:
                    key = task + ':' + row.get('operation', '')
                    signature = [row['checksum'], row.get('matches')]
                    expected.setdefault(key, signature)
                    if not equivalent(expected[key], signature):
                        raise ValueError('component checksums differ across modes/repetitions')
            entry['validated'] = True
        except (ValueError, subprocess.TimeoutExpired) as error:
            entry['error'] = str(error)
            failures.append(dict(task=task, mode=mode, error=str(error)))
        report['records'].append(entry)
        save()
        print(f'{task} {mode} round {round_index}: ' + (entry.get('error') or f'{entry["wall_s"]:.3f}s; outputs match'), flush=True)
    for task in args.tasks:
        selected = [m for m in args.modes if task not in ['spatial', 'geometry'] or m in ['interpreter', 'jit', 'before_jit']]
        for i in range(args.rounds):
            for mode in selected[i % len(selected):] + selected[:i % len(selected)]:
                execute(task, mode, i+1)
    if args.diagnostics:
        for task in args.tasks:
            for mode in ['jit', 'kernels_jit']:
                if mode in args.modes and (task not in ['spatial', 'geometry'] or mode == 'jit'):
                    execute(task, mode, 0, diagnostic=True)
    report['metadata']['sources_unchanged'] = sources == fingerprint(repo)
    if not report['metadata']['sources_unchanged']:
        failures.append(dict(error='RouteTastic source changed during measurement'))
    save()
    raise SystemExit(bool(failures))


if __name__ == '__main__':
    main()
