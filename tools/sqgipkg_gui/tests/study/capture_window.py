#!/usr/bin/env python3
"""Capture a named application window on an existing verified private display."""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import time
from PIL import Image

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--session', required=True, type=Path)
p.add_argument('--title', required=True)
p.add_argument('--screenshot', required=True, type=Path)
p.add_argument('command', nargs=argparse.REMAINDER)
a = p.parse_args()
state = json.loads((a.session / 'display.json').read_text())
assert os.environ.get('DISPLAY') == state['display'] and int(state['display'][1:]) > 1
assert Path(f'/proc/{state["xvfb_pid"]}/exe').resolve().name == 'Xvfb'
assert 'headless.py' in Path(f'/proc/{state["supervisor_pid"]}/cmdline').read_text()
assert not a.screenshot.exists()
a.screenshot.parent.mkdir(parents=True, exist_ok=True)
command = a.command[1:] if a.command[:1] == ['--'] else a.command
captured = False
with subprocess.Popen(command) as child:
    try:
        while child.poll() is None:
            if not captured:
                tree = subprocess.check_output(['xwininfo', '-root', '-tree'], text=True)
                matches = [line for line in tree.splitlines() if f'"{a.title}"' in line]
                if len(matches) == 1:
                    window = re.search(r'0x[0-9a-f]+', matches[0]).group()
                    info = subprocess.run(['xwininfo', '-id', window], capture_output=True, text=True)
                    if info.returncode == 0 and 'Map State: IsViewable' in info.stdout:
                        attempt = subprocess.run(['import', '-window', window, str(a.screenshot)], capture_output=True, text=True, timeout=10)
                        captured = attempt.returncode == 0 and a.screenshot.is_file()
                        if captured:
                            with Image.open(a.screenshot) as frame:
                                captured = any(high - low > 32 for low, high in frame.convert('RGB').getextrema())
                        if not captured:
                            print(json.dumps({'capture_retry': attempt.stderr}), flush=True)
            time.sleep(0.1)
    except BaseException:
        child.terminate(); child.wait(timeout=10)
        raise
print(json.dumps({'command_exit': child.returncode, 'captured': captured, 'screenshot': str(a.screenshot)}))
raise SystemExit(child.returncode or (0 if captured else 1))
