"""Check real OpenSL ES output selection and playback in an Android worker."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time
import zipfile

p = argparse.ArgumentParser()
p.add_argument('--adb', required=True)
p.add_argument('--serial', required=True)
p.add_argument('--apk', required=True, type=Path)
p.add_argument('--abi', required=True, choices=('x86_64', 'arm64-v8a'))
p.add_argument('--output', required=True, type=Path)
a = p.parse_args()
app = 'org.sqgi.android.audioqualification'
a.output.mkdir(parents=True, exist_ok=True)
(a.output / 'validated.json').unlink(missing_ok=True)

def adb(*args, check=True):
    return subprocess.run([a.adb, '-s', a.serial, *args], check=check, capture_output=True, timeout=60)

def read_json(name):
    r = adb('exec-out', 'run-as', app, 'cat', 'files/' + name, check=False)
    if r.returncode:
        return None
    try:
        return json.loads(r.stdout)
    except json.JSONDecodeError:
        return None

with zipfile.ZipFile(a.apk) as apk:
    for name in ('libgstopensles.so', 'libgstautodetect.so', 'libgstwavparse.so', 'libsqgi-worker.so'):
        assert f'lib/{a.abi}/{name}' in apk.namelist(), name
    assert f'lib/{a.abi}/libOpenSLES.so' not in apk.namelist(), 'Do not bundle NDK stubs'
adb('install', '-r', str(a.apk.resolve()))
adb('shell', 'am', 'force-stop', app)
adb('shell', 'run-as', app, 'rm', '-f', 'files/audio-result.json')
adb('shell', 'am', 'start', '-W', '-n', app + '/org.sqgi.android.GtkActivity')
deadline = time.monotonic() + 45
report = None
while time.monotonic() < deadline:
    report = read_json('audio-result.json')
    if report and (report.get('passed') or report.get('error')):
        break
    time.sleep(.25)
(a.output / 'result.json').write_text(json.dumps(report, indent=2) + '\n')
(a.output / 'logcat.txt').write_bytes(adb('logcat', '-d', '-b', 'all').stdout)
(a.output / 'audioflinger.txt').write_bytes(adb('shell', 'dumpsys', 'media.audio_flinger').stdout)
(a.output / 'screenshot.png').write_bytes(adb('exec-out', 'screencap', '-p').stdout)
assert report and report.get('passed') and not report.get('error'), report
assert len(report['cases']) == 3, report
for name in ('direct', 'worker'):
    assert report[name]['eos'] and report[name]['sink'] == 'openslessink', report
    assert 500 <= report[name]['elapsed_ms'] < 6000, report
session = read_json('runtime/session.json')
assert session['mode'] == 'packaged' and session['abi'] == a.abi, session
deadline = time.monotonic() + 15
while time.monotonic() < deadline:
    workers = [line for line in adb('shell', 'ps', '-A', '-o', 'PID,NAME').stdout.decode().splitlines()
               if app + ':sqgi_worker_' in line]
    if not workers:
        break
    time.sleep(.25)
assert not workers, workers
record = dict(passed=True, abi=a.abi, apk_sha256=hashlib.sha256(a.apk.read_bytes()).hexdigest(),
              report=report, session=session, worker_processes_remaining=workers)
(a.output / 'validated.json').write_text(json.dumps(record, indent=2) + '\n')
print('PASS Android audio:', a.abi)
