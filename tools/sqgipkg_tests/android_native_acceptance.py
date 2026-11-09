#!/usr/bin/env python3
"""Exercise the native fixture on an explicit Android device and retain evidence."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shlex
import subprocess
import time
import uuid
import xml.etree.ElementTree as ET
import zipfile


def main():
    p = argparse.ArgumentParser(description=__doc__)
    package_input = p.add_mutually_exclusive_group(required=True)
    package_input.add_argument('--apk', type=Path)
    package_input.add_argument('--splits', type=Path, nargs='+')
    package_input.add_argument('--installed-bundle', type=Path,
                               help='Verify an AAB already installed through sqgipkg install')
    p.add_argument('--abi', choices=['x86_64', 'arm64-v8a'])
    p.add_argument('--serial', required=True)
    p.add_argument('--adb', default='adb')
    p.add_argument('--out', type=Path, required=True)
    a = p.parse_args()
    package = 'org.sqgi.android.nativefixture'
    adb = [a.adb, '-s', a.serial]

    def call(*args):
        return subprocess.check_output([*adb, *map(str, args)], stderr=subprocess.PIPE)

    def shell(*args):
        return call('shell', shlex.join(map(str, args))).decode().strip()

    def read(path):
        return call('exec-out', 'run-as', package, 'cat', path).decode()

    def wait(read_value, predicate=lambda value: bool(value), timeout=60):
        deadline = time.monotonic() + timeout
        last = None
        while time.monotonic() < deadline:
            try:
                last = read_value()
                if predicate(last):
                    return last
            except (subprocess.CalledProcessError, ValueError):
                pass
            time.sleep(0.25)
        raise RuntimeError('Android fixture timed out: ' + repr(last))

    artifacts = [a.apk or a.installed_bundle] if a.apk or a.installed_bundle else a.splits
    provenances = {}
    for artifact in artifacts:
        with zipfile.ZipFile(artifact) as archive:
            for name in archive.namelist():
                if name.endswith('/provenance.json'):
                    value = json.loads(archive.read(name)); provenances[value['abi']] = value
    selected_abi = a.abi or (next(iter(provenances)) if len(provenances) == 1 else None)
    if selected_abi not in provenances:
        raise ValueError('Select --abi when testing an APK split set with multiple metadata payloads')
    provenance = provenances[selected_abi]
    abi = provenance['abi']
    if not a.installed_bundle:
        call('install' if a.apk else 'install-multiple', '-r', *artifacts)
    shell('am', 'force-stop', package)
    # Only this fixture's telemetry is reset; app/runtime files are retained.
    source = 'files/application/source/'
    shell('run-as', package, 'rm', '-f', *[source + name for name in
          ['native-result.json', 'native-clicks.txt', 'native-controls.json']])
    shell('am', 'start', '-W', '-n', package + '/org.sqgi.android.GtkActivity')
    result = wait(lambda: json.loads(read(source + 'native-result.json')))
    if not result.get('passed') or result.get('abi') != abi or result.get('layout_size') != (32 if abi == 'arm64-v8a' else 24):
        raise RuntimeError('Native execution failed or used the wrong ABI: ' + repr(result))
    actual = json.loads(read('files/runtime/provenance.json'))
    if actual != provenance:
        raise RuntimeError('Installed runtime provenance differs from APK')
    session = json.loads(read('files/runtime/session.json'))
    if actual['schema'] >= 2 and session.get('abi') != abi:
        raise RuntimeError('Native ABI selector chose the wrong runtime metadata')
    point = wait(lambda: json.loads(read(source + 'native-controls.json')))
    remote = '/data/local/tmp/sqgi-native-ui-' + uuid.uuid4().hex + '.xml'
    try:
        shell('uiautomator', 'dump', remote)
        hierarchy = ET.fromstring(shell('cat', remote))
    finally:
        shell('rm', '-f', remote)
    containers = [node for node in hierarchy.iter('node') if node.get('package') == package
                  and node.get('resource-id') == 'android:id/content']
    if len(containers) != 1:
        raise RuntimeError('Native fixture is not the foreground app')
    surfaces = [tuple(map(int, re.findall(r'\d+', node.get('bounds', '')))) for node in containers[0].iter('node')
                if node.get('class') == 'android.view.View' and len(node) == 0]
    left, top, right, bottom = max(surfaces, key=lambda b: (b[2]-b[0])*(b[3]-b[1]))
    x, y = round(left + point['x']), round(top + point['y'])
    if not (left < x < right and top < y < bottom):
        raise RuntimeError('Native fixture button is outside its GTK surface')
    shell('input', 'tap', x, y)
    wait(lambda: read(source + 'native-clicks.txt').strip(), lambda value: value == '1')
    time.sleep(0.3)
    a.out.mkdir(parents=True, exist_ok=True)
    screenshot = a.out / 'native-modules.png'
    screenshot.write_bytes(call('exec-out', 'screencap', '-p'))
    properties = {key: shell('getprop', key) for key in
                  ['ro.build.fingerprint', 'ro.product.cpu.abilist', 'ro.dalvik.vm.native.bridge', 'ro.kernel.qemu']}
    primary = properties['ro.product.cpu.abilist'].split(',')[0]
    report = {'apk': str(a.apk.resolve()) if a.apk else None,
              'apk_sha256': hashlib.sha256(a.apk.read_bytes()).hexdigest() if a.apk else None,
              'artifacts': {str(path.resolve()): hashlib.sha256(path.read_bytes()).hexdigest() for path in artifacts},
              'serial': a.serial, 'device': properties, 'abi': abi, 'native_translation': abi != primary,
              'execution': result, 'gtk_clicks': 1, 'session': session, 'provenance': actual, 'screenshot': str(screenshot.resolve())}
    (a.out / 'result.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({key: report[key] for key in ['abi', 'native_translation', 'execution', 'gtk_clicks', 'screenshot']}, indent=2))


if __name__ == '__main__':
    main()
