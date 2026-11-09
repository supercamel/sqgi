#!/usr/bin/env python3
"""Exercise an installed Gallery, including its C/GObject panel, through adb."""
import argparse
import json
from pathlib import Path
import re
import shlex
import subprocess
import time
import uuid
import xml.etree.ElementTree as ET


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--abi', choices=['x86_64', 'arm64-v8a'], required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    package = 'org.sqgi.android.widgets'
    adb = [args.adb, '-s', args.serial]
    args.out.mkdir(parents=True, exist_ok=True)

    def shell(*words):
        return subprocess.check_output(adb + ['shell', shlex.join(map(str, words))], stderr=subprocess.PIPE).decode().strip()

    def read(path):
        return shell('run-as', package, 'cat', path)

    def wait(read_value, predicate, timeout=40):
        deadline = time.monotonic() + timeout
        last = None
        while time.monotonic() < deadline:
            try:
                last = read_value()
                if predicate(last):
                    return last
            except (subprocess.CalledProcessError, ValueError, KeyError):
                pass
            time.sleep(.2)
        raise RuntimeError('Gallery did not reach expected state: ' + repr(last))

    def session():
        return json.loads(read('files/runtime/session.json'))

    def source(name):
        return read('files/' + session()['source_path'] + '/' + name)

    def native():
        return json.loads(source('native-state.json'))

    def bounds():
        remote = '/data/local/tmp/sqgi-gallery-' + uuid.uuid4().hex + '.xml'
        try:
            shell('uiautomator', 'dump', remote)
            tree = ET.fromstring(shell('cat', remote))
        finally:
            shell('rm', '-f', remote)
        content = [n for n in tree.iter('node') if n.get('package') == package and n.get('resource-id') == 'android:id/content']
        assert len(content) == 1, 'Gallery must be the foreground activity'
        surfaces = [tuple(map(int, re.findall(r'\d+', n.get('bounds', '')))) for n in content[0].iter('node')
                    if n.get('class') in ('android.view.View', 'android.view.SurfaceView') and len(n) == 0]
        return max(surfaces, key=lambda b: (b[2]-b[0])*(b[3]-b[1]))

    def tap(name):
        left, top, right, bottom = bounds()
        for _ in range(5):
            points = dict(line.split('=', 1) for line in source('controls.txt').splitlines())
            x, y = map(float, points[name].split(',')); x += left; y += top
            # The fixed footer overlaps the last part of the GTK surface;
            # scroll a clipped button clear before tapping its centre.
            if left < x < right and top < y < bottom - 120:
                shell('input', 'tap', round(x), round(y)); time.sleep(.35)
                return
            shell('input', 'swipe', (left+right)//2, bottom-120, (left+right)//2, top+200, 300)
            time.sleep(.5)
        raise RuntimeError('Gallery control is outside viewport: ' + name)

    screenshots = []

    def capture(name):
        path = args.out / (name + '.png')
        path.write_bytes(subprocess.check_output(adb + ['exec-out', 'screencap', '-p']))
        screenshots.append(str(path.resolve()))

    shell('am', 'force-stop', package)
    shell('run-as', package, 'rm', '-f', 'files/application/source/native-state.json',
          'files/application/source/state.txt', 'files/application/source/controls.txt')
    shell('am', 'start', '-W', '-n', package + '/org.sqgi.android.GtkActivity')
    current = wait(session, lambda s: s['mode'] == 'packaged' and s['abi'] == args.abi and str(s['pid']) == shell('pidof', package))
    wait(lambda: source('state.txt'), lambda s: 'page=controls;count=0;' in s)
    wait(native, lambda s: s['abi'] == args.abi)
    time.sleep(.5); capture('01-controls')
    tap('count'); wait(lambda: source('state.txt'), lambda s: 'count=1;' in s)
    tap('tab_forms'); wait(lambda: source('state.txt'), lambda s: 'page=forms;' in s); capture('02-forms')
    tap('tab_collections'); wait(lambda: source('state.txt'), lambda s: 'page=collections;' in s)
    tap('family_1'); wait(lambda: source('state.txt'), lambda s: 'selected=Inputs;' in s); capture('03-collections')
    tap('tab_native'); wait(lambda: source('state.txt'), lambda s: 'page=native;' in s)
    tap('native_label'); shell('input', 'keyevent', 'KEYCODE_MOVE_END')
    for _ in 'Gallery worker':
        shell('input', 'keyevent', 'KEYCODE_DEL')
    shell('input', 'text', 'Native-GI'); shell('input', 'keyevent', 'KEYCODE_BACK')
    wait(native, lambda s: s['property'] == 'Native-GI')
    tap('native_signal'); wait(native, lambda s: s['signals'] == 1)
    tap('native_async'); wait(native, lambda s: s['result'] == 42 and s['signals'] == 2)
    tap('native_error'); final = wait(native, lambda s: s['error'] is not None and 'planned C error' in s['error'])
    capture('04-native')
    properties = {name: shell('getprop', name) for name in ['ro.build.fingerprint', 'ro.product.cpu.abilist', 'ro.dalvik.vm.native.bridge']}
    report = dict(passed=True, abi=args.abi, session=current, native=final, properties=properties,
                  native_translation=properties['ro.product.cpu.abilist'].split(',')[0] != args.abi,
                  screenshots=screenshots)
    (args.out/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
