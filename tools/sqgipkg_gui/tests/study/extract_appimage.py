#!/usr/bin/env python3
"""Exercise the AppImage's own extraction runtime and record immutable evidence."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--artifact', type=Path, required=True)
parser.add_argument('--arch', choices=['x86_64', 'aarch64'], required=True)
parser.add_argument('--destination', type=Path, required=True)
parser.add_argument('--logs', type=Path, required=True)
parser.add_argument('--name', required=True)
args = parser.parse_args()
artifact = args.artifact.resolve()
destination = args.destination.resolve()
logs = args.logs.resolve()
record = logs / (args.name + '.json')
log = logs / (args.name + '.txt')
if destination.exists() or record.exists() or log.exists():
    raise SystemExit('Destination and evidence names must be new')
destination.mkdir(parents=True)
logs.mkdir(parents=True, exist_ok=True)
argv = ([] if args.arch == platform.machine() else ['qemu-' + args.arch]) + [str(artifact), '--appimage-extract']
env = dict(os.environ)
for key in ['DISPLAY', 'WAYLAND_DISPLAY', 'DBUS_SESSION_BUS_ADDRESS']:
    env.pop(key, None)
metadata = {'artifact': str(artifact), 'sha256': hashlib.sha256(artifact.read_bytes()).hexdigest(),
            'argv': argv, 'destination': str(destination), 'started': time.time(),
            'scope': 'actual AppImage self-extraction; application launch remains separate'}
with log.open('w') as output:
    result = subprocess.run(argv, cwd=destination, env=env, stdout=output, stderr=subprocess.STDOUT, timeout=180)
metadata.update(finished=time.time(), exit_status=result.returncode)
record.write_text(json.dumps(metadata, indent=2) + '\n')
print(json.dumps(metadata))
raise SystemExit(result.returncode)
