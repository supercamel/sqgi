#!/usr/bin/env python3
"""Regression matrix for the manually assembled Windows SDK runtime probe.

Requires the probe app directory's original sqgi.exe, DLLs and answer.sqk.
Runs on a private Wine prefix without a desktop. All cases require clean exit.
This does not assert successful NSIS packaging or native Windows execution.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys

parser = argparse.ArgumentParser(description=__doc__)
for argument in ['wine-root', 'linux-sysroot', 'prefix', 'appdir', 'logs']:
    parser.add_argument('--' + argument, type=Path, required=True)
parser.add_argument('--name', required=True)
args = parser.parse_args()
args.logs.mkdir(parents=True, exist_ok=True)
record = args.logs / (args.name + '.json')
if record.exists():
    raise SystemExit('Choose a new evidence name')
fixtures = Path(__file__).parent / 'fixtures/windows-shutdown'
kernel = (fixtures / 'kernel.nut').read_text()
loop = (fixtures / 'warm-loop.nut').read_text()
cases = [('version', ['--version'], 'sqgi '),
         ('empty', ['-e', (fixtures / 'empty.nut').read_text()], 'SCRIPT COMPLETE empty'),
         ('kernel', ['-e', kernel], 'SCRIPT COMPLETE kernel'),
         ('warm-loop', ['-e', loop], 'SCRIPT COMPLETE warm-loop'),
         ('combined', ['-e', kernel + '\n' + loop], 'SCRIPT COMPLETE warm-loop')]
results = []
for name, command, marker in cases:
    argv = [sys.executable, str(Path(__file__).with_name('wine_probe.py'))]
    for key in ['wine_root', 'linux_sysroot', 'prefix', 'appdir', 'logs']:
        argv += ['--' + key.replace('_', '-'), str(getattr(args, key))]
    argv += ['--name', args.name + '-' + name, '--native-crt', '--expect', marker,
             '--', 'Z:\\app\\sqgi.exe', *command]
    process = subprocess.run(argv, capture_output=True, text=True, timeout=75)
    metadata = args.logs / (args.name + '-' + name + '.json')
    result = json.loads(metadata.read_text()) if metadata.exists() else {}
    results.append({'case': name, 'status': 'pass' if process.returncode == 0 else 'fail',
                    'exit_status': result.get('exit_status'), 'evidence': metadata.name,
                    'harness_output': process.stdout + process.stderr if process.returncode else ''})
    print(name + ': ' + results[-1]['status'], flush=True)
    record.write_text(json.dumps({'scope': __doc__, 'cases': results,
        'fixture_sha256': {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in fixtures.iterdir() if p.is_file()}}, indent=2) + '\n')
raise SystemExit(0 if all(result['status'] == 'pass' for result in results) else 1)
