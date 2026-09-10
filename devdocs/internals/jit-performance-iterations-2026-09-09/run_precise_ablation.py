#!/usr/bin/env python3
"""Compare precise exits on/off in the same frozen binary; unchanged workloads."""
import argparse, hashlib, json, os, statistics, subprocess, sys
from pathlib import Path

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--warmups', type=int, default=5)
p.add_argument('--suites', nargs='+', default=['kernels', 'applications'])
a = p.parse_args()
root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(root / 'tools'))
from run_execution_benchmarks import parse, host_snapshot
binary = a.binary.resolve()
a.output.mkdir(parents=True, exist_ok=True)
suites = {'kernels': ('test_jit_perf_correctness.nut', 160000, 15),
          'applications': ('bench_application_workloads.nut', 400003, 8),
          'owners': ('bench_member_owners.nut', 200000, 10),
          'members': ('bench_member_workloads.nut', 200000, 6),
          'methods': ('bench_member_methods.nut', 200000, 6),
          'roots': ('bench_root_workloads.nut', 200000, 4)}
for suite in a.suites:
    filename, n, count = suites[suite]
    script = root / 'test' / filename
    cmd = ['taskset', '-c', '4', str(binary), str(script), '--bench',
           f'--iterations={n}', f'--warmups={a.warmups}', '--seed=83']
    env = dict(os.environ, SQGI_JIT='1', SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0')
    reference = subprocess.run(cmd, cwd=root, env=dict(env, SQGI_JIT='0'),
                               capture_output=True, text=True, check=True, timeout=600)
    expected = parse(reference.stdout)
    assert len(expected) == count
    samples = {name: {'off': [], 'on': []} for name in expected}
    raw = [{'runtime': 'interpreter_reference', 'stdout': reference.stdout, 'stderr': reference.stderr}]
    for rnd in range(5):
        for mode in ([0, 1] if rnd % 2 == 0 else [1, 0]):
            start = host_snapshot(4)
            r = subprocess.run(cmd, cwd=root, env=dict(env, SQGI_JIT_PRECISE_EXITS=str(mode)),
                               capture_output=True, text=True, check=True, timeout=600)
            end = host_snapshot(4)
            rows = parse(r.stdout)
            assert rows.keys() == expected.keys()
            for name, row in rows.items():
                assert row['iterations'] == expected[name]['iterations']
                assert float(row['checksum']) == float(expected[name]['checksum'])
                assert row['us'] > 0
                samples[name]['on' if mode else 'off'].append(row['us'])
            raw.append(dict(round=rnd+1, precise=mode, stdout=r.stdout, stderr=r.stderr,
                            host_start=start, host_end=end))
            print(suite, rnd+1, mode, 'checksums agree', flush=True)
    medians = {name: {mode: statistics.median(v) for mode, v in row.items()}
               for name, row in samples.items()}
    result = dict(command=cmd, binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                  script_sha256=hashlib.sha256(script.read_bytes()).hexdigest(),
                  completed_rounds=5, samples=samples, medians=medians, raw=raw)
    (a.output / (suite + '.json')).write_text(json.dumps(result, indent=2) + '\n')
