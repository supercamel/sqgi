#!/usr/bin/env python3
"""Exercise a source-selected runtime and reject changes requiring a rebuild.

The disposable Gallery project must already have a locked, two-ABI debug bundle
and write runtime-source.json with sqgi_version, jit and kernels from the VM.
This external harness is not part of the installed Android backend.
"""
import argparse
import json
import os
from pathlib import Path
import shlex
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prefix', type=Path, required=True)
    parser.add_argument('--project', type=Path, required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--adb', required=True)
    parser.add_argument('--version', required=True)
    parser.add_argument('--deny', type=Path, action='append', default=[])
    args = parser.parse_args()
    args.prefix = args.prefix.resolve()
    root = args.project.resolve(); output = root/'runtime-acceptance'; output.mkdir(exist_ok=True)
    config = json.loads((root/'sqgipkg.json').read_text()); package = config['app_id']
    source = root/config['runtime']['source']; cmake = source/'CMakeLists.txt'; original = cmake.read_bytes()
    artifact = root/'dist-android'/f'{package}-multi-debug.aab'
    adb = [args.adb, '-s', args.serial]
    command = [str(args.prefix/'bin/sqgipkg')]
    if args.deny:
        command = ['/usr/bin/python3', str(Path(__file__).with_name('android_isolated_run.py'))]
        for path in args.deny: command.extend(['--deny', str(path)])
        command.extend(['--', str(args.prefix/'bin/sqgipkg')])
    env = dict(os.environ, PATH=str(args.prefix/'bin')+':/usr/bin:/bin')
    report = {'passed': False, 'artifact': str(artifact), 'denied_inputs': list(map(str, args.deny)), 'abis': {}}
    def shell(*words): return subprocess.check_output(adb+['shell', shlex.join(words)], stderr=subprocess.PIPE).decode()
    def read(path): return json.loads(shell('run-as', package, 'cat', 'files/'+path))
    for abi in config['platforms']['android']['architectures']:
        logs = output/abi; logs.mkdir(exist_ok=True)
        target = ['--platform', 'android', '--arch', abi, '--serial', args.serial]
        actions = []
        def cli(action, *options, failure=None):
            process = subprocess.run(command+[action, *target, *options], cwd=root, env=env,
                                     capture_output=True, text=True, timeout=240)
            text = process.stdout+process.stderr; log = logs/(str(len(actions))+'-'+action+'.log'); log.write_text(text)
            if failure is None:
                if process.returncode: raise RuntimeError(text)
            elif not process.returncode or failure not in text: raise RuntimeError(text)
            actions.append({'action': action, 'status': process.returncode, 'log': str(log)})
        cli('install', '--artifact', str(artifact), '--no-android-download')
        # Remove old evidence so a stale report cannot satisfy a new launch.
        shell('run-as', package, 'rm', '-f', 'files/application/source/runtime-source.json')
        cli('run')
        deadline = time.monotonic()+45
        while True:
            try:
                runtime = read('application/source/runtime-source.json')
                if runtime['sqgi_version'] == args.version and not runtime['jit'] and not runtime['kernels']: break
            except (ValueError, subprocess.CalledProcessError): pass
            if time.monotonic() > deadline: raise RuntimeError('Selected runtime did not execute')
            time.sleep(.25)
        session = read('runtime/session.json'); assert session['abi'] == abi
        try:
            cmake.write_bytes(original+b'\n# Runtime source edit requires rebuilding the native app\n')
            cli('sync', failure='rebuild')
            cli('build', '--locked', '--no-android-download', failure='locked input changed: android-runtime-source')
            assert read('runtime/session.json')['pid'] == session['pid']
        finally: cmake.write_bytes(original)
        # Restore the source selection and exercise the normal development path.
        cli('sync'); assert read('runtime/session.json')['mode'] == 'development'
        cli('reset'); assert read('runtime/session.json')['mode'] == 'packaged'
        screenshot = logs/'runtime-gallery.png'
        screenshot.write_bytes(subprocess.check_output(adb+['exec-out', 'screencap', '-p']))
        report['abis'][abi] = {'runtime': runtime, 'session': session, 'commands': actions,
                              'runtime_change_rejected_without_restart': True, 'screenshot': str(screenshot)}
    report['passed'] = True
    (output/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
