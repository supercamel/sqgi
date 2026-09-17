#!/usr/bin/env python3
"""Compare unchanged legacy JIT workloads with explicit LLVM compilation and fallbacks."""
import argparse
from decimal import Decimal
import hashlib
import json
import os
from pathlib import Path
import re
import statistics
import subprocess
import sys
from run_runtime_benchmarks import cache_settings

ROOT = Path(__file__).resolve().parents[1]
FLOATS = {'float_call', 'array_float', 'vector', 'matrix', 'math_intrinsic', 'math_variable'}
# source, insertion point after definitions, port suffix, count, floating results, extra ports
SUITES = {
    'kernels': ('test_jit_perf_correctness.nut', '\nrun_correctness()\n', 'jit_kernels', 15, FLOATS, True),
    'applications': ('bench_application_workloads.nut', 'foreach (item in cases)', 'application_workloads', 8, {'filter_stream'}, True),
    'roots': ('bench_root_workloads.nut', 'foreach(item in cases)', 'root_workloads', 4, set(), True),
    'execution': ('bench_execution.nut', 'if(iterations<=0', None, 4, {'temporary_arrays'}, False),
    'floats': ('bench_float_workloads.nut', 'foreach(item in cases)', 'float_workloads', 7, None, False),
    'members': ('bench_member_workloads.nut', 'foreach(item in cases)', 'member_workloads', 6, {'calibrate_17', 'calibrate_67'}, False),
    'methods': ('bench_member_methods.nut', 'foreach(updates in', 'member_methods', 6, set(), False),
    'owners': ('bench_member_owners.nut', 'foreach(classes in', 'member_owners', 10, None, False),
}
EXCLUDE = {'check_eq', 'absf', 'approx', 'parse_arg_int', 'has_arg', 'run_correctness',
           'bench_one', 'option_int', 'make_inputs'}


def instrument(source, marker):
    names = [n for n in re.findall(r'^function\s+(\w+)\s*\(', source, re.M) if n not in EXCLUDE]
    classes = re.findall(r'^class\s+(\w+)\s*\{', source, re.M)
    lines = ['\nlocal __llvm_profiles=[],__llvm_seen={};',
             'local __llvm_add=function(name,fn){if(fn in __llvm_seen)return;__llvm_seen[fn]<-true;sqgi.llvm.compile(fn);__llvm_profiles.append([name,fn]);};']
    for name in names:
        lines.append(f'__llvm_add("{name}",{name});')
    for name in classes:
        lines.append(f'foreach(key,value in {name})if(typeof value=="function"){{__llvm_add("{name}."+key,value);}}')
    # Compile anonymous case wrappers as well as the named helpers they invoke.
    if 'local cases=' in source or 'local cases =' in source:
        lines.append('foreach(item in cases){__llvm_add("case/"+item[0],item[1]);}')
    if source.count(marker) != 1:
        raise ValueError('ambiguous instrumentation point')
    source = source.replace(marker, '\n'.join(lines) + '\n' + marker)
    return source + '\nforeach(item in __llvm_profiles)print("LLVM_STATS\\t"+item[0]+"\\t"+sqgi.json.stringify(sqgi.llvm.info(item[1]))+"\\n");\n'


def parse(text, count):
    rows, profiles = {}, {}
    for line in text.splitlines():
        fields = line.split('\t')
        if fields[0] == 'BENCH':
            _, name, iterations, elapsed, checksum = fields
            rows[name] = {'iterations': int(iterations), 'us': float(elapsed), 'checksum': checksum}
        elif fields[0] == 'LLVM_STATS':
            profiles[fields[1]] = json.loads(fields[2])
    if len(rows) != count:
        raise ValueError(f'expected {count} rows, got {len(rows)}')
    return rows, profiles


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--llvm', type=Path, required=True)
    p.add_argument('--legacy', type=Path, required=True)
    p.add_argument('--output', type=Path, required=True)
    p.add_argument('--suite', action='append', choices=SUITES)
    p.add_argument('--runs', type=int, default=3)
    p.add_argument('--iterations', type=int, default=40000)
    p.add_argument('--warmups', type=int, default=5)
    p.add_argument('--seed', type=int, default=17)
    args = p.parse_args()
    if min(args.runs, args.iterations, args.warmups) < 1 or args.iterations % 4:
        p.error('positive settings and iterations divisible by four required')
    out = args.output.resolve(); out.mkdir(parents=True, exist_ok=True)
    llvm, legacy = args.llvm.resolve(), args.legacy.resolve()
    metadata = {'cpu_affinity': sorted(os.sched_getaffinity(0)), 'runs': args.runs,
                'iterations': args.iterations, 'warmups': args.warmups, 'seed': args.seed,
                'binaries': {name: {'path': str(path), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                                    'build': cache_settings(path)} for name, path in [('llvm', llvm), ('legacy', legacy)]}}
    metadata['versions'] = {name: subprocess.check_output(command, text=True).strip() for name, command in [('node', ['node', '--version']), ('gjs', ['gjs', '--version']), ('python', [sys.executable, '--version'])]}
    results = {'metadata': metadata, 'suites': {}}
    for suite in args.suite or SUITES:
        filename, marker, suffix, count, floating, extra = SUITES[suite]
        source_path = ROOT / 'test' / filename
        source = source_path.read_text()
        instrumented = out / ('llvm-' + filename)
        instrumented.write_text(instrument(source, marker))
        options = ['--bench', f'--iterations={args.iterations}', f'--warmups={args.warmups}', f'--seed={args.seed}']
        commands = {'interpreter': [str(llvm), str(source_path), *options],
                    'llvm': [str(llvm), str(instrumented), *options],
                    'legacy': [str(legacy), str(source_path), *options]}
        if suffix:
            commands['node'] = ['node', str(ROOT / 'demo/benchmarks' / ('node_' + suffix + '.js')),
                                str(args.iterations), str(args.warmups), str(args.seed)]
            if extra:
                commands['gjs'] = ['gjs', '-m', *commands['node'][1:]]
                commands['python'] = [sys.executable, str(ROOT / 'demo/benchmarks' / ('python_' + suffix + '.py')),
                                      str(args.iterations), str(args.warmups), str(args.seed)]
        data = {'source_sha256': hashlib.sha256(source.encode()).hexdigest(), 'runs': [], 'invalid': {}}
        reference = None
        for trial in range(args.runs):
            names = list(commands)
            if trial % 2: names.reverse()
            for runtime in names:
                print(f'{suite}: {runtime} {trial+1}/{args.runs}', flush=True)
                env = dict(os.environ, SQGI_JIT='1' if runtime == 'legacy' else '0',
                           SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0')
                if runtime in ['interpreter', 'llvm', 'legacy']:
                    env['LD_LIBRARY_PATH'] = str(Path(commands[runtime][0]).parent) + ':' + env.get('LD_LIBRARY_PATH', '')
                proc = subprocess.run(commands[runtime], cwd=ROOT, env=env, text=True,
                                      capture_output=True, timeout=300)
                (out / f'{suite}-{runtime}-{trial}.txt').write_text(proc.stdout + proc.stderr)
                try:
                    if proc.returncode: raise ValueError(f'exit {proc.returncode}: {proc.stderr[-500:]}')
                    rows, profiles = parse(proc.stdout, count)
                    if reference is None: reference = rows
                    if rows.keys() != reference.keys(): raise ValueError('case coverage mismatch')
                    for name, row in rows.items():
                        expected = reference[name]
                        x, y = Decimal(row['checksum']), Decimal(expected['checksum'])
                        tolerance = max(Decimal('1e-10'), abs(y) * Decimal('1e-10')) if floating is None or name in floating else Decimal(0)
                        if not x.is_finite() or abs(x-y) > tolerance or row['iterations'] != expected['iterations']:
                            raise ValueError(f'{name}: {row["checksum"]} != {expected["checksum"]}')
                    data['runs'].append({'runtime': runtime, 'trial': trial, 'rows': rows, 'profiles': profiles, 'command': commands[runtime]})
                except ValueError as error:
                    data['invalid'].setdefault(runtime, []).append(str(error))
                    print(f'INVALID {suite}/{runtime}: {error}', flush=True)
                    if runtime in ['interpreter', 'llvm']: raise
        data['medians_us'] = {name: {runtime: statistics.median(run['rows'][name]['us'] for run in data['runs'] if run['runtime'] == runtime)
                            for runtime in commands if runtime not in data['invalid']} for name in reference}
        results['suites'][suite] = data
        (out / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
    lines = ['# Legacy workloads on the LLVM Squirrel tier', '',
             'Unchanged algorithm bodies; LLVM compilation added to declared functions, class methods and case wrappers.',
             'All times are median **ns/iteration**. Lower is better. Three SQGI paths use matching RelWithDebInfo builds, LTO/PGO off.',
             f'{args.runs} fresh processes per runtime, alternating order; {args.warmups} full warmups; CPU affinity {metadata["cpu_affinity"]}.',
             'Checksums are validated against the current interpreter. Invalid runtimes are excluded from timing comparisons.', '']
    for suite, data in results['suites'].items():
        runtimes = list(next(iter(data['medians_us'].values())))
        lines += ['## ' + suite, '', '| Case | ' + ' | '.join(runtimes) + ' |', '|---|' + '---:|' * len(runtimes)]
        for name, values in data['medians_us'].items():
            lines.append('| ' + name + ' | ' + ' | '.join(f'{values[r]*1000:.2f}' for r in runtimes) + ' |')
        for runtime, errors in data['invalid'].items(): lines += ['', f'Excluded {runtime}: ' + '; '.join(errors)]
        profiles = [p for run in data['runs'] if run['runtime'] == 'llvm' for p in run['profiles'].values()]
        lines += ['', 'LLVM counters across timed processes: ' + ', '.join(f'{key}={sum(p.get(key,0) for p in profiles)}'
                    for key in ['entries', 'direct_operations', 'fused_entries', 'inlined_calls', 'prepared_calls']) + '.', '']
    lines += ['Compilation is outside timed regions. Unsupported operations repeatedly hand off to the interpreter.',
              'These are ordinary Squirrel objects and calls, not rewritten typed kernels. Per-function counters and raw output are retained alongside this report.']
    (out / 'report.md').write_text('\n'.join(lines) + '\n')
    print('Wrote ' + str(out / 'report.md'))

if __name__ == '__main__': main()
