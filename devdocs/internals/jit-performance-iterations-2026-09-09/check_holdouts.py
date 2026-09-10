#!/usr/bin/env python3
"""Compare independent workloads with JIT disabled/enabled under sanitizers."""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import subprocess
import sys

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--source', type=Path, default=Path(__file__).resolve().parents[3])
parser.add_argument('--binary', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
sys.path.insert(0, str(args.source / 'tools'))
from run_execution_benchmarks import parse

args.output.mkdir(parents=True, exist_ok=True)
env = dict(os.environ, SQGI_JIT_THRESHOLD='1', SQGI_JIT_TRACE='0',
           ASAN_OPTIONS='detect_leaks=1:detect_stack_use_after_return=1:halt_on_error=1',
           UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
results = {'binary': str(args.binary.resolve()),
           'sha256': hashlib.sha256(args.binary.read_bytes()).hexdigest(), 'suites': {}}
for suite, count in [('application_workloads', 8), ('member_workloads', 6),
                     ('member_owners', 10), ('member_methods', 6),
                     ('float_workloads', 7), ('root_workloads', 4)]:
    script = args.source / 'test' / f'bench_{suite}.nut'
    reference = None
    records = []
    for enabled in [0, 1]:
        command = [str(args.binary.resolve()), str(script.resolve()),
                   '--iterations=20003', '--warmups=1', '--seed=83']
        p = subprocess.run(command, cwd=args.source, env=dict(env, SQGI_JIT=str(enabled)),
                           capture_output=True, text=True, check=True, timeout=300)
        (args.output / f'{suite}-jit{enabled}.log').write_text(p.stdout + p.stderr)
        assert not any(x in p.stdout + p.stderr for x in
                       ['FAIL', 'AN ERROR HAS OCCURRED', 'SCRIPT ERROR', 'runtime error:',
                        'ERROR: AddressSanitizer', 'ERROR: LeakSanitizer'])
        rows = parse(p.stdout)
        assert len(rows) == count
        if reference is None:
            reference = rows
        assert rows.keys() == reference.keys()
        for name, row in rows.items():
            assert row['iterations'] == 20003
            got, want = row['checksum'], reference[name]['checksum']
            try:
                equal = int(got) == int(want)
            except ValueError:
                equal = math.isclose(float(got), float(want), rel_tol=1e-10, abs_tol=1e-10)
            assert equal, (suite, name, got, want)
        records.append({'jit': enabled, 'command': command, 'rows': rows})
    results['suites'][suite] = records
    print(suite, count, 'checksums agree', flush=True)
(args.output / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
