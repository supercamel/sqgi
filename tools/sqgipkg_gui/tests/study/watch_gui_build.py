#!/usr/bin/env python3
"""Observe an existing GUI build; never start/restart it or alter its manifest."""
import argparse
import json
from pathlib import Path
import subprocess
import sys
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--session', required=True, type=Path)
parser.add_argument('--result', required=True, type=Path)
parser.add_argument('--evidence', required=True, type=Path)
parser.add_argument('--pid', required=True, type=int)
args = parser.parse_args()
args.evidence.mkdir(parents=True, exist_ok=True)
identity = Path(f'/proc/{args.pid}/cmdline').read_bytes()
if str(args.result).encode() not in identity:
    raise SystemExit('PID is not the producer of the requested result')
previous = None
index = 0
while True:
    report = json.loads(args.result.read_text())
    signature = (report['status'], json.dumps(report.get('progress'), sort_keys=True))
    if signature != previous:
        # Allow the GUI's periodic reader to render this snapshot.
        time.sleep(0.5)
        shot = args.evidence / f'{index:02d}-{report["status"]}-{report.get("progress", {}).get("phase", "unknown")}.png'
        run = subprocess.run([sys.executable, str(Path(__file__).with_name('control.py')),
                              str(args.session), '--op', 'inspect', '--shot', str(shot)],
                             capture_output=True, text=True, timeout=25)
        record = {'observed_at': time.time(), 'report': report, 'screenshot': str(shot),
                  'control_exit': run.returncode, 'control_output': run.stdout, 'control_error': run.stderr}
        with (args.evidence / 'observations.jsonl').open('a') as stream:
            stream.write(json.dumps(record) + '\n')
        print(json.dumps({'status': report['status'], 'progress': report.get('progress'), 'screenshot': str(shot), 'capture_exit': run.returncode}), flush=True)
        if run.returncode:
            raise SystemExit('Capture failed; build remains untouched')
        index += 1
        previous = signature
    if report['status'] != 'running':
        break
    try:
        current = Path(f'/proc/{args.pid}/cmdline').read_bytes()
    except FileNotFoundError:
        current = None
    if current != identity:
        # A final atomic report can race process exit. Re-read before declaring a lost producer.
        final = json.loads(args.result.read_text())
        if final['status'] == 'running':
            raise SystemExit('Producer ended without a terminal report; inspect GUI and log')
        continue
    time.sleep(1)
