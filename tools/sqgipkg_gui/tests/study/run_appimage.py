#!/usr/bin/env python3
"""Run an actual study AppImage; filesystem-isolated AppRun checks are separate."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import sys
from runner_support import accepted
import signal
import subprocess
import tempfile
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--artifact', type=Path, required=True)
parser.add_argument('--arch', choices=['x86_64', 'aarch64'], required=True)
parser.add_argument('--logs', type=Path, required=True)
parser.add_argument('--name', required=True)
parser.add_argument('--expected-revision', default='42')
parser.add_argument('--extract-and-run', action='store_true')
parser.add_argument('--runner-sysroot', type=Path, help='Explicit target base OS for QEMU child-process ELF loading; not an isolation test')
parser.add_argument('--display-session', type=Path)
parser.add_argument('--scene-checks', action='store_true')
parser.add_argument('--network-checks', action='store_true')
parser.add_argument('--timeout', type=int, default=90)
args = parser.parse_args()
if (args.scene_checks or args.network_checks) and not args.display_session: parser.error('Graphical checks require a verified private display')
if args.scene_checks and args.network_checks: parser.error('Choose scene or network checks, not both')
artifact = args.artifact.resolve()
args.logs.mkdir(parents=True, exist_ok=True)
record = args.logs / (args.name + '.json'); log = record.with_suffix('.txt')
if record.exists() or log.exists():
    raise SystemExit('Choose new evidence names')
argv = ([] if args.arch == platform.machine() else ['qemu-' + args.arch]) + [str(artifact)]
env = dict(os.environ)
for key in ['DISPLAY', 'WAYLAND_DISPLAY', 'DBUS_SESSION_BUS_ADDRESS', 'LD_LIBRARY_PATH',
            'GI_TYPELIB_PATH', 'GTK_PATH', 'APPIMAGE_EXTRACT_AND_RUN', 'QEMU_LD_PREFIX']:
    env.pop(key, None)
env.update(SQGI_STUDY_NO_WINDOW='1', SQGI_STUDY_EXPECT_REVISION=args.expected_revision)
display = None
if args.display_session:
    state = json.loads((args.display_session / 'display.json').read_text())
    for key in ['supervisor_pid', 'xvfb_pid']: os.kill(state[key], 0)
    display = state['display']
    if (not re.fullmatch(r':[0-9]+', display) or int(display[1:]) < 2
            or Path('/proc', str(state['xvfb_pid']), 'exe').resolve().name != 'Xvfb'
            or 'headless.py' not in Path('/proc', str(state['supervisor_pid']), 'cmdline').read_text()):
        raise SystemExit('Refusing unverified display')
    env.pop('SQGI_STUDY_NO_WINDOW', None)
    env.update(DISPLAY=display, GDK_BACKEND='x11', GTK_A11Y='none', LIBGL_ALWAYS_SOFTWARE='1')
peer_directory = None
if args.scene_checks:
    peer_directory = (args.logs / (args.name + '-scene')).resolve()
    peer_directory.mkdir(exist_ok=False)
    argv = [sys.executable, str(Path(__file__).with_name('scene_http_peer.py').resolve()),
            '--evidence', str(peer_directory), '--host-network', '--timeout', str(args.timeout - 5), '--', *argv]
network_record = None
if args.network_checks:
    network_record = (args.logs / (args.name + '-network.json')).resolve()
    if network_record.exists(): parser.error('Choose a new network evidence name')
    argv = [sys.executable, str(Path(__file__).with_name('network_peer.py').resolve()),
            '--report', str(network_record), '--tcp-expect', b'line-test\r\n'.hex(),
            '--tcp-expect', '000141ff', '--udp-expect', b'udp-test\n'.hex(),
            '--udp-expect', 'ff007f20', '--timeout', str(args.timeout - 5), '--', *argv]
if args.extract_and_run:
    env['APPIMAGE_EXTRACT_AND_RUN'] = '1'
if args.runner_sysroot:
    env['QEMU_LD_PREFIX'] = str(args.runner_sysroot.resolve())
metadata = {'argv': argv, 'artifact_sha256': hashlib.sha256(artifact.read_bytes()).hexdigest(),
            'started': time.time(), 'architecture': args.arch,
            'runner_sysroot': env.get('QEMU_LD_PREFIX'), 'display': display,
            'scene_peer': str(peer_directory) if peer_directory else None,
            'network_peer': str(network_record) if network_record else None,
            'network_scope': 'host loopback, not an isolated network namespace' if network_record else None,
            'fuse_helper': env.get('FUSERMOUNT_PROG'),
            'mode': 'extract-and-run' if args.extract_and_run else 'FUSE launcher',
            'scope': 'Actual AppImage execution with no desktop; host filesystem visible. Minimal payload isolation is a separate gate.'}
with tempfile.TemporaryDirectory(prefix='sqgipkg-artifact-run-') as directory:
    for key in ['XDG_CONFIG_HOME', 'XDG_CACHE_HOME', 'XDG_DATA_HOME']:
        path = Path(directory) / key; path.mkdir(); env[key] = str(path)
    with log.open('w') as output:
        child = subprocess.Popen(argv, cwd=directory, env=env, stdout=output,
                                 stderr=subprocess.STDOUT, start_new_session=True)
        try:
            status = child.wait(timeout=args.timeout)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait(); status = 124
output = log.read_text(errors='replace')
results = [json.loads(line.partition('STUDY_RESULT ')[2]) for line in output.splitlines()
           if line.startswith('STUDY_RESULT ')]
passed = accepted(status, output, []) and len(results) == 1 and results[0]['failures'] == 0 and bool(results[0]['checks'])
if args.network_checks:
    network = json.loads(network_record.read_text()) if network_record.exists() else {}
    passed = accepted(status, output, []) and network.get('acceptance') == 'pass'
if args.scene_checks:
    passed = passed and len(results[0]['checks']) == 6 and all(c.get('ok') is True for c in results[0]['checks'])
metadata.update(exit_status=status, finished=time.time(), acceptance='pass' if passed else 'fail', results=results)
record.write_text(json.dumps(metadata, indent=2) + '\n')
print(json.dumps(metadata)); print(output[-2500:])
raise SystemExit(0 if passed else (status or 1))
