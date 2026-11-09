#!/usr/bin/env python3
"""Run the optional real Android Studio build on a private X display.

Use xvfb-run. The project must contain the Gallery, cached SDK/tool inputs and
the native-entry-r1 catalog. This harness does not implement packaging.
"""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import time
from PIL import ImageGrab

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--prefix', type=Path, required=True)
p.add_argument('--project', type=Path, required=True)
p.add_argument('--deny', type=Path, action='append', default=[])
a = p.parse_args(); project = a.project.resolve(); prefix = a.prefix.resolve()
environment = dict(os.environ, SQGI_GUI_RUNTIME=str(prefix/'bin/sqgi'), GDK_BACKEND='x11', GSK_RENDERER='cairo',
                   SQGI_GUI_TEST_ROOT=str(prefix/'share/sqgi/sqgipkg_gui'))
captures = project/'screenshots'; captures.mkdir(exist_ok=True)
command = [prefix/'bin/sqgi', Path(__file__).with_name('android.nut'), project]
if a.deny:
    isolated = Path(__file__).resolve().parents[2]/'sqgipkg_tests/android_isolated_run.py'
    command = ['/usr/bin/python3', isolated, *[arg for path in a.deny for arg in ['--deny', path]], '--', *command]
with subprocess.Popen(list(map(str, command)), env=environment, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True) as child:
    try:
        deadline = time.monotonic() + 320
        while child.poll() is None:
            if time.monotonic() > deadline: raise TimeoutError('Studio Android workflow timed out')
            request = project/'capture-request.json'
            if request.exists():
                capture = json.loads(request.read_text()); time.sleep(.25)
                tree = subprocess.check_output(['xwininfo', '-root', '-tree'], text=True)
                for line in tree.splitlines():
                    if '"'+capture['title']+'"' not in line: continue
                    window = re.search(r'0x[0-9a-f]+', line).group()
                    pid = subprocess.check_output(['xprop', '-id', window, '_NET_WM_PID'], text=True)
                    if not pid.strip().endswith('= '+str(child.pid)): continue
                    geometry = subprocess.check_output(['xwininfo', '-id', window], text=True)
                    def number(label): return int(re.search(re.escape(label)+r':\s*(-?\d+)', geometry).group(1))
                    x, y, width, height = map(number, ['Absolute upper-left X', 'Absolute upper-left Y', 'Width', 'Height'])
                    ImageGrab.grab(bbox=(x,y,x+width,y+height), xdisplay=os.environ['DISPLAY']).save(captures/(capture['name']+'.png'))
                    break
                else: raise RuntimeError('Cannot find test-owned window '+capture['title'])
                request.unlink()
            time.sleep(.05)
        stdout, stderr = child.communicate(timeout=5)
        print(stdout); print(stderr)
        if child.returncode: raise RuntimeError('Studio Android acceptance failed')
        assert json.loads((project/'studio-report.json').read_text())['passed']
    finally:
        if child.poll() is None: child.kill(); child.communicate()
