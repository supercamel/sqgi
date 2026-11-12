"""Run the packaged worker fixture on an explicitly selected Android device."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time
import uuid
import zipfile

parser = argparse.ArgumentParser()
parser.add_argument('--adb', default='adb')
parser.add_argument('--serial', required=True)
parser.add_argument('--apk', type=Path, required=True)
parser.add_argument('--abi', choices=('x86_64', 'arm64-v8a'), required=True)
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--lifecycle', action='store_true',
                    help='Also crash a worker and kill only the parent process')
args = parser.parse_args()
app = 'org.sqgi.android.workerqualification'
args.output.mkdir(parents=True, exist_ok=True)
result_path = args.output / 'validated.json'
result_path.unlink(missing_ok=True)
(args.output / 'lifecycle.json').unlink(missing_ok=True)


def adb(*command, check=True, input=None):
    return subprocess.run([args.adb, '-s', args.serial, *command],
                          capture_output=True, text=True, input=input, timeout=60, check=check)


def read_json(name):
    result = adb('shell', 'run-as', app, 'cat', 'files/' + name, check=False)
    if result.returncode:
        return None
    return json.loads(result.stdout)


with zipfile.ZipFile(args.apk) as apk:
    native = {name for name in apk.namelist() if name.startswith('lib/')}
    assert f'lib/{args.abi}/libsqgi-worker.so' in native
    assert all(name.split('/')[1] == args.abi for name in native), native
adb('install', '-r', str(args.apk.resolve()))
adb('shell', 'am', 'force-stop', app)
adb('shell', 'run-as', app, 'rm', '-f', 'files/worker-result.json',
    'files/worker-request.json', 'files/worker-lifecycle.json', 'files/worker-live.json')
adb('shell', 'am', 'start', '-W', '-n', app + '/org.sqgi.android.GtkActivity')
deadline = time.monotonic() + 180
report = None
while time.monotonic() < deadline:
    report = read_json('worker-result.json')
    if report and (report.get('passed') or report.get('error')):
        break
    time.sleep(1)
assert report is not None, 'Worker fixture produced no report'
(args.output / 'worker-result.json').write_text(json.dumps(report, indent=2) + '\n')
(args.output / 'logcat.txt').write_text(adb('logcat', '-b', 'all', '-d', '-v', 'threadtime').stdout)
assert report.get('passed') and not report.get('error'), report
assert len(report['cases']) == 17, report
assert report['parent'] != report['last_child']['pid'], report
session = read_json('runtime/session.json')
assert session and session['mode'] == 'packaged' and session['abi'] == args.abi, session
assert session['application_id'] == app and session['entry'] == 'main.nut', session
assert str(session['pid']) == str(report['parent']), (session, report)
assert adb('shell', 'pidof', app).stdout.strip() == str(report['parent'])

# A completed wait must eventually release the service process and its slot.
deadline = time.monotonic() + 20
workers = []
while time.monotonic() < deadline:
    workers = [line for line in adb('shell', 'ps', '-A', '-o', 'PID,NAME').stdout.splitlines()
               if app + ':sqgi_worker_' in line]
    if not workers:
        break
    time.sleep(0.5)
assert not workers, workers
lifecycle = []
if args.lifecycle:
    def poll_json(name, predicate, timeout=30):
        deadline = time.monotonic() + timeout
        value = None
        while time.monotonic() < deadline:
            value = read_json(name)
            assert not value or not value.get('error'), value
            if value and predicate(value):
                return value
            time.sleep(.2)
        raise AssertionError(f'Timed out waiting for {name}: {value}')

    def processes():
        return {int(line.split()[0]): line.split()[1]
                for line in adb('shell', 'ps', '-A', '-o', 'PID,NAME').stdout.splitlines()[1:]
                if len(line.split()) == 2}

    def wait_gone(pids):
        deadline = time.monotonic() + 30
        while time.monotonic() < deadline:
            remaining = set(pids) & processes().keys()
            if not remaining:
                return
            time.sleep(.2)
        raise AssertionError(f'Processes survived: {remaining}')

    for action in ('native-crash', 'parent-death'):
        token = uuid.uuid4().hex
        adb('shell', 'run-as', app, 'tee', 'files/worker-request.tmp',
            input=json.dumps(dict(action=action, token=token)))
        adb('shell', 'run-as', app, 'mv', 'files/worker-request.tmp', 'files/worker-request.json')
        state = poll_json('worker-lifecycle.json', lambda v: v.get('token') == token)
        live = poll_json('worker-live.json', lambda v: v.get('token') == token)
        # Require the worker to execute independently before injecting a fault.
        live = poll_json('worker-live.json', lambda v: v.get('token') == token
                         and v['heartbeat'] > live['heartbeat'])
        parent_pid, child_pid = int(state['parent']), int(live['pid'])
        current = processes()
        assert parent_pid == session['pid'] and current[parent_pid] == app, (state, current)
        assert child_pid != parent_pid and re.fullmatch(
            re.escape(app) + r':sqgi_worker_[0-7]', current[child_pid]), current
        evidence = dict(action=action, token=token, parent_pid=parent_pid, child_pid=child_pid,
                        heartbeat=live['heartbeat'])
        # run-as targets one validated test PID. am force-stop would kill both
        # processes and therefore cannot demonstrate parent-death cleanup.
        adb('shell', 'run-as', app, 'kill', '-6' if action == 'native-crash' else '-9',
            str(child_pid if action == 'native-crash' else parent_pid))
        if action == 'native-crash':
            recovered = poll_json('worker-lifecycle.json',
                                  lambda v: v.get('token') == token and v.get('phase') == 'recovered')
            assert recovered['exit_status'] == -1 and recovered['term_sig'] == 0, recovered
            assert int(recovered['replacement_pid']) not in (parent_pid, child_pid), recovered
            assert processes().get(parent_pid) == app, 'Worker crash killed the application'
            wait_gone((child_pid, int(recovered['replacement_pid'])))
            logs = adb('logcat', '-b', 'all', '-d', '-v', 'threadtime').stdout
            assert re.search(rf'Fatal signal 6 .*pid {child_pid}\b', logs), 'Missing native SIGABRT evidence'
            evidence['recovered'] = recovered
            (args.output / 'native-crash-logcat.txt').write_text(logs)
        else:
            wait_gone((parent_pid, child_pid))
            # Ensure Android does not restart an orphaned worker service.
            time.sleep(3)
            survivors = {pid: name for pid, name in processes().items()
                         if name == app or name.startswith(app + ':sqgi_worker_')}
            assert not survivors, survivors
            evidence['all_processes_reaped'] = True
        lifecycle.append(evidence)
        (args.output / 'lifecycle.json').write_text(json.dumps(lifecycle, indent=2) + '\n')

device = {key: adb('shell', 'getprop', key).stdout.strip() for key in (
    'ro.product.cpu.abilist', 'ro.dalvik.vm.native.bridge', 'ro.build.version.sdk')}
result_path.write_text(json.dumps({'passed': True, 'session': session, 'device': device,
                                  'apk_sha256': hashlib.sha256(args.apk.read_bytes()).hexdigest(),
                                  'cases': report['cases'], 'lifecycle': lifecycle,
                                  'worker_processes_reaped': True}, indent=2) + '\n')
print(f'PASS: {args.abi} packaged workers, 17 cases, {len(lifecycle)} lifecycle cases, all service processes reaped')
