#!/usr/bin/env python3
"""Build with an ephemeral test key and prove releases ignore a valid override."""
import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import secrets
import shlex
import subprocess
import sys
import tarfile
import tempfile
import time
import zipfile


def encoded(value):
    return (json.dumps(value, sort_keys=True, ensure_ascii=False, indent=2) + '\n').encode()


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sqgipkg', type=Path, required=True)
    parser.add_argument('--ndk', type=Path, required=True)
    parser.add_argument('--repository', required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--adb', default='adb')
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--deny-build-read', action='append', type=Path, default=[])
    args = parser.parse_args()
    root = args.out.resolve(); root.mkdir(parents=True, exist_ok=True)
    package = 'org.sqgi.android.releasefixture'
    java = Path(os.environ['JAVA_HOME'])
    adb = [args.adb, '-s', args.serial]

    def device(*command):
        return subprocess.check_output([*adb, *map(str, command)], stderr=subprocess.PIPE)

    def shell(*command):
        return device('shell', shlex.join(map(str, command))).decode().strip()

    def launch_release(abi, label):
        shell('am', 'force-stop', package)
        shell('am', 'start', '-W', '-n', package + '/org.sqgi.android.GtkActivity')
        deadline = time.monotonic() + 30
        logs = ''
        while time.monotonic() < deadline:
            pid = shell('pidof', package)
            if pid:
                logs = device('logcat', '-d', '--pid=' + pid, '-s', 'SqgiAndroid:I', '*:S').decode()
                if 'RELEASE_PACKAGED' in logs:
                    break
            time.sleep(0.25)
        assert 'RELEASE_PACKAGED' in logs and 'Starting packaged source' in logs, logs
        assert 'RELEASE_OVERRIDE_EXECUTED' not in logs, logs
        denied = subprocess.run([*adb, 'shell', 'run-as', package, 'id'], capture_output=True, text=True)
        assert denied.returncode and 'not debuggable' in denied.stdout + denied.stderr
        details = shell('dumpsys', 'package', package)
        assert 'primaryCpuAbi=' + abi in details, 'Installed ABI differs'
        (root / (label + '.log')).write_text(logs)
        (root / (label + '.png')).write_bytes(device('exec-out', 'screencap', '-p'))
        return {'abi': abi, 'packaged_source_executed': True, 'run_as_rejected': True,
                'override_executed': False, 'log': str(root / (label + '.log'))}

    manifest = {'schema_version': 2, 'name': 'SQGI release signing', 'app_id': package,
                'compile_scripts': False, 'features': ['gtk4'],
                'platforms': {'android': {'architectures': ['x86_64', 'arm64-v8a']}}}
    (root / 'sqgipkg.json').write_bytes(encoded(manifest))
    (root / 'main.nut').write_text('''local Gtk = import("Gtk", "4.0"), Gio = import("Gio", "2.0")
local app = Gtk.Application.new("org.sqgi.android.releasefixture", Gio.ApplicationFlags.non_unique)
app.connect("activate", function() {
    local window = Gtk.ApplicationWindow.new(app)
    window.set_title("Release signing verified")
    local label = Gtk.Label.new("Signed SQGI release\\nPackaged source is running")
    label.set_wrap(true); window.set_child(label); window.present()
    print("RELEASE_PACKAGED\\n")
})
app.run(0, null)
''')
    report = {'package': package, 'serial': args.serial, 'signing_key': 'ephemeral local acceptance key',
              'denied_build_inputs': [str(path.resolve()) for path in args.deny_build_read],
              'device_abis': shell('getprop', 'ro.product.cpu.abilist'),
              'native_bridge': shell('getprop', 'ro.dalvik.vm.native.bridge'), 'execution': {}}
    # This fixed application ID belongs only to this acceptance fixture.
    installed = subprocess.run([*adb, 'shell', 'pm', 'path', package], capture_output=True, text=True)
    if installed.returncode == 0 and installed.stdout.strip():
        device('uninstall', package)
    with tempfile.TemporaryDirectory(prefix='sqgi-release-test-') as key_directory:
        password = secrets.token_hex(24)
        env = dict(os.environ, SQGI_ANDROID_KEYSTORE=str(Path(key_directory) / 'test.p12'),
                   SQGI_ANDROID_KEY_ALIAS='sqgi-acceptance', SQGI_ANDROID_STORE_PASSWORD=password,
                   SQGI_ANDROID_KEY_PASSWORD=password)
        subprocess.run([java / 'bin/keytool', '-genkeypair', '-keystore', env['SQGI_ANDROID_KEYSTORE'],
            '-alias', env['SQGI_ANDROID_KEY_ALIAS'], '-storepass:env', 'SQGI_ANDROID_STORE_PASSWORD',
            '-keypass:env', 'SQGI_ANDROID_KEY_PASSWORD', '-keyalg', 'RSA', '-keysize', '2048',
            '-validity', '30', '-dname', 'CN=Local SQGI Acceptance'], env=env, check=True)
        artifacts = {}
        for variant, target, arch in [('debug', 'android-apk', 'x86_64'),
                                      ('release', 'android-apk', 'x86_64'), ('release', 'android-aab', None)]:
            label = variant + '-' + target
            command = [args.sqgipkg.resolve(), 'build', '--target', target, '--android-variant', variant,
                       '--android-ndk', args.ndk.resolve(), '--android-repository', args.repository,
                       '--no-android-download', '--write-lock', '--output', str(root / label)]
            if arch:
                command.extend(['--arch', arch])
            if args.deny_build_read:
                isolated = [sys.executable, Path(__file__).resolve().with_name('android_isolated_run.py')]
                for path in args.deny_build_read:
                    isolated.extend(['--deny', path.resolve()])
                command = [*isolated, '--', *command]
            with (root / (label + '-build.log')).open('w') as log:
                subprocess.run(command, cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT, check=True)
            output = root / label
            artifact = next(output.glob('*.aab' if target.endswith('aab') else '*.apk'))
            build = json.loads((output / 'sqgipkg-build.json').read_text())
            artifacts[label] = artifact
            report[label] = {'artifact': str(artifact), 'sha256': digest(artifact.read_bytes()),
                             'signer_sha256': build['signer_sha256']}
        assert len({report[label]['signer_sha256'] for label in artifacts}) == 1
        with zipfile.ZipFile(artifacts['release-android-apk']) as apk:
            provenance = apk.read('assets/runtime/x86_64/provenance.json')
            snapshot = json.loads(apk.read('assets/application/project.json'))
        override = b'print("RELEASE_OVERRIDE_EXECUTED\\n")\n'
        snapshot['base_id'] = digest(provenance)
        snapshot['files'] = {snapshot['project']['entry']: digest(override)}
        metadata = encoded(snapshot); identity = digest(metadata)
        device('install', '-r', artifacts['debug-android-apk'])
        archive = io.BytesIO()
        with tarfile.open(fileobj=archive, mode='w') as tar:
            for name, data in [('project.json', metadata), ('source/' + snapshot['project']['entry'], override)]:
                info = tarfile.TarInfo(name); info.size = len(data); info.mode = 0o600
                tar.addfile(info, io.BytesIO(data))
        destination = 'files/development/snapshots/' + identity
        script = 'set -eu; mkdir -p ' + destination + '; tar -xf - -C ' + destination
        subprocess.run([*adb, 'shell', '-T', shlex.join(['run-as', package, 'sh', '-c', script])],
                       input=archive.getvalue(), check=True)
        shell('run-as', package, 'sh', '-c', "printf '%s\\n' " + identity + ' > files/development/active')
        assert device('exec-out', 'run-as', package, 'cat', destination + '/project.json') == metadata
        # The snapshot deliberately targets the RELEASE provenance. It cannot
        # be rejected merely because its base_id belongs to the debug build.
        device('install', '-r', artifacts['release-android-apk'])
        report['execution']['release-apk'] = launch_release('x86_64', 'release-apk')
        report['override_base_id'] = snapshot['base_id']
        report['override_snapshot'] = identity
        for abi in ['x86_64', 'arm64-v8a']:
            paths = sorted((root / '.sqgipkg/android/bundle/splits' / abi).glob('*.apk'))
            device('install-multiple', '-r', *paths)
            report['execution'][abi + '-splits'] = launch_release(abi, abi + '-splits')
        # Check generated project/build artifacts for the test credential;
        # report names only if a leak is found, never the credential itself.
        leaks = [str(path.relative_to(root)) for path in root.rglob('*')
                 if path.is_file() and password.encode() in path.read_bytes()]
        assert not leaks, 'Signing credential persisted in: ' + repr(leaks)
        report['credential_scan_passed'] = True
    report['ephemeral_key_removed'] = not Path(key_directory).exists()
    (root / 'report.json').write_bytes(encoded(report))
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
