#!/usr/bin/env python3
"""Observe a packaged scene on its verified private display; no library injection."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import time
from PIL import Image
from runner_support import accepted

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--session', type=Path, required=True)
p.add_argument('--ready', type=Path, required=True)
p.add_argument('--screenshot', type=Path, required=True)
p.add_argument('--report', type=Path, required=True)
p.add_argument('--runtime-log', type=Path, required=True)
p.add_argument('--timeout', type=int, default=110)
p.add_argument('command', nargs=argparse.REMAINDER)
a = p.parse_args()
state = json.loads((a.session / 'display.json').read_text())
assert os.environ.get('DISPLAY') == state['display'] and int(state['display'][1:]) > 1
assert Path('/proc', str(state['xvfb_pid']), 'exe').resolve().name == 'Xvfb'
assert 'headless.py' in Path('/proc', str(state['supervisor_pid']), 'cmdline').read_text()
assert not a.screenshot.exists() and not a.report.exists()
a.screenshot.parent.mkdir(parents=True, exist_ok=True)
command = a.command[1:] if a.command[:1] == ['--'] else a.command
captured = False
started = time.time()
with subprocess.Popen(command) as child:
    while child.poll() is None:
        if time.time() - started > a.timeout:
            child.kill(); child.wait(); break
        if a.ready.exists() and not captured:
            subprocess.run(['import', '-window', 'root', str(a.screenshot)], check=True, timeout=10)
            captured = True
        time.sleep(.05)
    status = child.returncode
pixels = {}
if captured:
    with Image.open(a.screenshot) as image:
        data = list(image.convert('RGB').getdata())
    pixels = dict(red_scene_pixels=sum(r > 120 and r > g*2 and r > b*2 for r,g,b in data),
                  green_imagery_pixels=sum(g > 60 and g > r*1.5 and g > b*1.5 for r,g,b in data))
output = a.runtime_log.read_text(errors='replace') if a.runtime_log.exists() else ''
results = []
for line in output.splitlines():
    if line.startswith('STUDY_RESULT '):
        results.append(json.loads(line.removeprefix('STUDY_RESULT ')))
checks_ok = len(results)==1 and results[0].get('failures')==0 and len(results[0].get('checks',[]))==6 and all(c.get('ok') is True for c in results[0]['checks'])
passed = accepted(status, output, []) and checks_ok and pixels.get('red_scene_pixels',0)>10000 and pixels.get('green_imagery_pixels',0)>10000
a.report.write_text(json.dumps(dict(argv=command, exit_status=status, started=started, finished=time.time(),
    captured=captured, screenshot=str(a.screenshot), pixel_checks=pixels, application_checks=results,
    acceptance='pass' if passed else 'fail', scope='packaged scene on verified private software-GL display; see runner record for filesystem isolation'), indent=2)+'\n')
raise SystemExit(0 if passed else (status or 1))
