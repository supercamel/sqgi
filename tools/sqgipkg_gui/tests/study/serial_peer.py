#!/usr/bin/env python3
"""Run a study consumer against a private POSIX PTY, without touching hardware."""
import argparse
import json
import os
from pathlib import Path
import pty
import select
import subprocess
import threading
import time
import tty


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--logs', type=Path, required=True)
    p.add_argument('--name', required=True)
    p.add_argument('--library-dir', type=Path)
    p.add_argument('--timeout', type=int, default=20)
    p.add_argument('command', nargs=argparse.REMAINDER)
    args = p.parse_args()
    command = args.command[1:] if args.command[:1] == ['--'] else args.command
    args.logs.mkdir(parents=True, exist_ok=True)
    record = args.logs / (args.name + '.json')
    log = args.logs / (args.name + '.txt')
    if record.exists() or log.exists():
        raise SystemExit('Use a new evidence name')
    master, slave = pty.openpty()
    tty.setraw(slave)
    env = dict(os.environ, SQGI_STUDY_SERIAL_DEVICE=os.ttyname(slave))
    for key in ['DISPLAY', 'WAYLAND_DISPLAY', 'DBUS_SESSION_BUS_ADDRESS']:
        env.pop(key, None)
    if args.library_dir:
        env.update(LD_LIBRARY_PATH=str(args.library_dir.resolve()), GI_TYPELIB_PATH=str(args.library_dir.resolve()))
    peer = {'received': '', 'responded': False, 'error': None}
    stop = threading.Event()

    def serve():
        try:
            data = b''
            while not stop.is_set():
                if not select.select([master], [], [], 0.1)[0]:
                    continue
                data += os.read(master, 4096)
                peer['received'] = data.decode('utf-8', 'replace')
                if b'sqgi-ping\n' in data:
                    os.write(master, b'peer-pong\n')
                    peer['responded'] = True
                    return
        except Exception as e:
            peer['error'] = repr(e)

    thread = threading.Thread(target=serve, daemon=True)
    started = time.time()
    thread.start()
    try:
        result = subprocess.run(command, env=env, text=True, capture_output=True, timeout=args.timeout)
    finally:
        stop.set(); thread.join(timeout=2)
        os.close(master); os.close(slave)
    log.write_text(result.stdout + result.stderr)
    metadata = {'argv': command, 'started': started, 'finished': time.time(),
                'exit_status': result.returncode, 'device': env['SQGI_STUDY_SERIAL_DEVICE'],
                'scope': 'private PTY functional execution; source mode when library-dir is supplied',
                'library_dir': str(args.library_dir) if args.library_dir else None, 'peer': peer,
                'stdout': result.stdout, 'stderr': result.stderr}
    record.write_text(json.dumps(metadata, indent=2) + '\n')
    print(result.stdout + result.stderr)
    return result.returncode or (0 if peer['received'] == 'sqgi-ping\n' and peer['responded'] and peer['error'] is None else 1)


if __name__ == '__main__':
    raise SystemExit(main())
