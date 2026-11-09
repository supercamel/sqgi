#!/usr/bin/env python3
"""Exercise installed SQGI device commands against a disposable Gallery project.

The application must first be built/deployed with that project's sqgipkg.json.
This is an external acceptance harness, not part of the installed backend.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shlex
import signal
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prefix', type=Path, required=True)
    parser.add_argument('--project', type=Path, required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--adb', required=True)
    parser.add_argument('--abi', choices=['x86_64', 'arm64-v8a'])
    parser.add_argument('--deny', type=Path, action='append', default=[])
    args = parser.parse_args()
    root = args.project.resolve(); output = root/'acceptance'
    if args.abi: output /= args.abi
    output.mkdir(parents=True, exist_ok=True)
    manifest = root/'sqgipkg.json'; original_manifest = manifest.read_bytes()
    config = json.loads(original_manifest); package = config['app_id']
    entry = config.get('script', config.get('entry', 'main.nut'))
    if isinstance(entry, dict): entry = entry.get('script', entry.get('path'))
    main_script = root/entry; original_source = main_script.read_bytes()
    icon_name = config.get('platforms',{}).get('android',{}).get('icon',config.get('desktop_icon',config.get('icon')))
    icon = root/icon_name if icon_name else None
    original_icon = icon.read_bytes() if icon else None
    extra = main_script.parent/'workflow-extra.nut'
    if extra.exists(): raise ValueError('Acceptance file already exists')
    adb = [args.adb, '-s', args.serial]
    env = dict(os.environ, PATH=str(args.prefix/'bin')+':/usr/bin:/bin')
    command = [str(args.prefix/'bin/sqgipkg')]
    target = ['--platform','android','--serial',args.serial]
    if args.abi: target.extend(['--arch',args.abi])
    if args.deny:
        command = ['/usr/bin/python3', str(Path(__file__).with_name('android_isolated_run.py'))]
        for path in args.deny: command.extend(['--deny', str(path)])
        command.extend(['--', str(args.prefix/'bin/sqgipkg')])
    report = {'serial':args.serial, 'commands':[], 'denied_inputs':[str(p) for p in args.deny]}
    def shell(*words): return subprocess.check_output(adb+['shell', shlex.join(words)], stderr=subprocess.PIPE).decode()
    def read(path): return shell('run-as', package, 'cat', 'files/'+path)
    def session(): return json.loads(read('runtime/session.json'))
    def cli(action, *options, failure=None):
        log = output/(str(len(report['commands']))+'-'+action+'.log')
        result = subprocess.run(command+[action, *target, *options],
                                cwd=root, env=env, capture_output=True, text=True, timeout=240)
        log.write_text(result.stdout+result.stderr)
        if failure is None and result.returncode: raise RuntimeError(log.read_text())
        if failure is not None and (result.returncode == 0 or failure not in log.read_text()): raise RuntimeError(log.read_text())
        report['commands'].append({'action':action,'status':result.returncode,'log':str(log)})
    def wait(predicate):
        deadline = time.monotonic()+45
        while time.monotonic()<deadline:
            try:
                value = session()
                if predicate(value): return value
            except (ValueError, subprocess.CalledProcessError): pass
            time.sleep(.3)
        raise RuntimeError('Source update did not arrive')
    process = None
    try:
        cli('reset'); initial = session(); assert initial['mode']=='packaged'
        package_paths = shell('pm', 'path', package)
        shell('run-as', package, 'sh', '-c', 'printf retained > files/workflow-private-data')
        main_script.write_bytes(original_source+b'\n// SQGI source update acceptance\n')
        extra.write_text('return { value = 42 }\n')
        cli('sync'); changed = session()
        assert changed['mode']=='development' and changed['pid']!=initial['pid']
        assert 'workflow-extra.nut' in json.loads(read(changed['source_path'].removeprefix('files/')+'/../project.json'))['files']
        assert read(changed['source_path']+'/'+changed['entry']).encode()==main_script.read_bytes()
        extra.unlink(); cli('sync'); deleted = session()
        metadata=json.loads(read(deleted['source_path']+'/../project.json'))
        assert 'workflow-extra.nut' not in metadata['files']
        assert shell('pm','path',package)==package_paths
        for field, value in [('namespaces',['Gtk-4.0','Gio-2.0']), ('sdk','incompatible-r1'),
                             ('permissions',['android.permission.CAMERA'])]:
            modified=json.loads(original_manifest); modified['platforms']['android'][field]=value
            manifest.write_text(json.dumps(modified)); cli('sync',failure='rebuild')
            assert session()['pid']==deleted['pid']
        manifest.write_bytes(original_manifest)
        if icon:
            icon.write_bytes(original_icon+b'\n')
            cli('sync',failure='rebuild')
            assert session()['pid']==deleted['pid']
            icon.write_bytes(original_icon)
        cli('sync','--android-variant','release',failure='requires a debug')
        cli('run'); assert session()['pid']!=deleted['pid']
        cli('logs','--logs-once')
        watch_log=(output/'watch.log').open('w')
        process=subprocess.Popen(command+['watch',*target], cwd=root,env=env,
                                 stdout=watch_log,stderr=subprocess.STDOUT,start_new_session=True)
        before=session(); wait(lambda s:s['pid']!=before['pid'])
        main_script.write_bytes(original_source+b'\n// Watched source update\n')
        watched=wait(lambda s:read(s['source_path']+'/'+s['entry']).endswith('// Watched source update\n'))
        assert watched['mode']=='development'
        os.killpg(process.pid,signal.SIGINT); process.wait(timeout=10); process=None; watch_log.close()
        cli('reset'); restored=session(); assert restored['mode']=='packaged'
        assert read(restored['source_path']+'/'+restored['entry']).encode()==original_source
        assert read('workflow-private-data')=='retained'
        assert shell('pm','path',package)==package_paths
        report.update(passed=True,initial=initial,synced=changed,deleted=deleted,watched=watched,reset=restored,
                      private_data_preserved=True,apk_paths_unchanged=True)
        (output/'gallery.png').write_bytes(subprocess.check_output(adb+['exec-out','screencap','-p']))
        report['screenshot']=str(output/'gallery.png')
        (output/'report.json').write_text(json.dumps(report,indent=2)+'\n')
        print(json.dumps(report,indent=2))
    finally:
        if process is not None:
            os.killpg(process.pid,signal.SIGTERM); process.wait(timeout=10)
        manifest.write_bytes(original_manifest); main_script.write_bytes(original_source); extra.unlink(missing_ok=True)
        if icon: icon.write_bytes(original_icon)


if __name__=='__main__': main()
