#!/usr/bin/env python3
"""Record a real build of an existing GUI-authored manifest."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--project', type=Path, required=True)
parser.add_argument('--logs', type=Path, required=True)
parser.add_argument('--name', required=True)
parser.add_argument('--note', default='')
parser.add_argument('flags', nargs=argparse.REMAINDER)
args = parser.parse_args()
root = Path(__file__).resolve().parents[4]
project = args.project.resolve()
logs = args.logs.resolve()
logs.mkdir(parents=True, exist_ok=True)
flags = args.flags[1:] if args.flags[:1] == ['--'] else args.flags
manifest = project / 'sqgipkg.json'
argv = ['sqgipkg', 'build', '--manifest', str(manifest), *flags]
env = dict(os.environ, PATH=str(root / 'tools') + ':' + str(root / 'build') + ':' + os.environ['PATH'],
           CMAKE_BUILD_PARALLEL_LEVEL='2')
for key in ['DISPLAY', 'WAYLAND_DISPLAY', 'DBUS_SESSION_BUS_ADDRESS']:
    env.pop(key, None)
metadata = {'argv': argv, 'cwd': str(project), 'note': args.note,
            'executable': shutil.which('sqgipkg', path=env['PATH']),
            'runtime': str(root / 'build/sqgi'), 'started': time.time(),
            'manifest_sha256': hashlib.sha256(manifest.read_bytes()).hexdigest()}
record = logs / (args.name + '.json')
log_path = logs / (args.name + '.txt')
if record.exists() or log_path.exists():
    raise SystemExit('Choose a new evidence name; existing build logs are immutable')
record.write_text(json.dumps(metadata, indent=2) + '\n')
with log_path.open('w') as log:
    child = subprocess.Popen(argv, cwd=project, env=env, stdout=log, stderr=subprocess.STDOUT)
    metadata['pid'] = child.pid
    record.write_text(json.dumps(metadata, indent=2) + '\n')
    print(json.dumps(metadata), flush=True)
    status = child.wait()
metadata.update(exit_status=status, finished=time.time())
record.write_text(json.dumps(metadata, indent=2) + '\n')
print(f'Build exit status: {status}; log: {log_path}', flush=True)
print(log_path.read_text(errors='replace')[-5000:])
raise SystemExit(status)
