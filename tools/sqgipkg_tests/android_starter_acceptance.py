#!/usr/bin/env python3
"""Exercise the generated GTK starter through installed sqgipkg and a real device.

External acceptance only. The default tap position is for the API34 phone fixture
in portrait orientation; pass --button-y for other display/font configurations.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shlex
import struct
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prefix', type=Path, required=True)
    parser.add_argument('--project', type=Path, required=True)
    parser.add_argument('--artifact', type=Path, required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--adb', required=True)
    parser.add_argument('--abi', choices=['x86_64', 'arm64-v8a'], required=True)
    parser.add_argument('--button-y', type=float, default=.198)
    parser.add_argument('--deny', type=Path, action='append', default=[])
    args = parser.parse_args()
    args.prefix = args.prefix.resolve()
    root = args.project.resolve(); artifact = (root/args.artifact).resolve()
    output = root/'acceptance'/args.abi; output.mkdir(parents=True, exist_ok=True)
    package = json.loads((root/'sqgipkg.json').read_text())['app_id']
    adb = [args.adb, '-s', args.serial]
    environment = dict(os.environ, PATH=str(args.prefix/'bin')+':/usr/bin:/bin')
    command = [str(args.prefix/'bin/sqgipkg')]
    if args.deny:
        command = ['/usr/bin/python3', str(Path(__file__).with_name('android_isolated_run.py')),
                   *[item for path in args.deny for item in ['--deny', str(path)]], '--', *command]
    report = dict(serial=args.serial, abi=args.abi, artifact=str(artifact),
                  artifact_sha256=hashlib.sha256(artifact.read_bytes()).hexdigest(),
                  denied_inputs=list(map(str, args.deny)), commands=[])

    def cli(action, *options):
        result = subprocess.run(command+[action, '--platform', 'android', '--serial', args.serial,
                                        '--arch', args.abi, *options], cwd=root, env=environment,
                                capture_output=True, text=True, timeout=240)
        log = output/(action+'.log'); log.write_text(result.stdout+result.stderr)
        if result.returncode: raise RuntimeError(log.read_text())
        report['commands'].append(dict(action=action, log=str(log), status=0))
        return result.stdout+result.stderr

    def shell(*words): return subprocess.check_output(adb+['shell', shlex.join(words)], text=True)

    cli('install', '--artifact', str(artifact)); cli('run')
    session = json.loads(shell('run-as', package, 'cat', 'files/runtime/session.json'))
    assert session['abi'] == args.abi and session['mode'] == 'packaged', session
    deadline = time.monotonic()+30
    while True:
        logs = subprocess.check_output(adb+['logcat', '-d', '--pid='+str(session['pid'])], text=True)
        if 'SQGI application ready' in logs: break
        if time.monotonic() > deadline: raise RuntimeError('Starter did not reach GTK activation')
        time.sleep(.2)
    # Use the actual framebuffer orientation rather than the panel's natural size.
    time.sleep(.5)
    before = subprocess.check_output(adb+['exec-out', 'screencap', '-p'])
    width, height = struct.unpack('>II', before[16:24])
    (output/'before.png').write_bytes(before)
    shell('input', 'tap', str(width//2), str(round(height*args.button_y)))
    deadline = time.monotonic()+20
    while True:
        logs = subprocess.check_output(adb+['logcat', '-d', '--pid='+str(session['pid'])], text=True)
        if 'SQGI GTK callback completed' in logs: break
        if time.monotonic() > deadline: raise RuntimeError('GTK button callback did not arrive')
        time.sleep(.2)
    assert 'AN ERROR HAS OCCURRED' not in logs, logs
    time.sleep(.3)
    (output/'callback.png').write_bytes(subprocess.check_output(adb+['exec-out', 'screencap', '-p']))
    logs = cli('logs', '--logs-once')
    assert 'SQGI application ready' in logs and 'SQGI GTK callback completed' in logs
    report.update(passed=True, session=session, gtk_callback=True,
                  screenshot=str(output/'callback.png'), framebuffer=[width, height],
                  native_abi=shell('getprop', 'ro.product.cpu.abi').strip(),
                  page_size=int(shell('getconf', 'PAGE_SIZE')))
    (output/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
