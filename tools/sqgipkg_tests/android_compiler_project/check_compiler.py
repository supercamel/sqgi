"""Check real Android JIT execution, typed kernels and interpreter fallback."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time
import zipfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--adb', default='adb')
parser.add_argument('--serial', required=True)
parser.add_argument('--apk', required=True, type=Path)
parser.add_argument('--abi', required=True, choices=['x86_64', 'arm64-v8a'])
parser.add_argument('--output', required=True, type=Path)
mode = parser.add_mutually_exclusive_group()
mode.add_argument('--disable-jit', action='store_true')
mode.add_argument('--kernels-only', action='store_true',
                  help='Check a runtime built with runtime.jit=false, leaving the JIT environment enabled')
args = parser.parse_args()
app = 'org.sqgi.android.compilerqualification'
tests = ['test_jit_correctness.nut', 'test_jit_loop_regressions.nut', 'test_jit_math.nut',
         'test_jit_fastpath.nut', 'test_jit_perf_correctness.nut', 'test_kernel.nut',
         'test_kernel_locals.nut', 'test_kernel_small_calls.nut']
args.output.mkdir(parents=True, exist_ok=True)
result_path = args.output / 'validated.json'
result_path.unlink(missing_ok=True)


def adb(*command, check=True):
    return subprocess.run([args.adb, '-s', args.serial, *command], check=check,
                          capture_output=True, timeout=60)


def read_json(name):
    result = adb('exec-out', 'run-as', app, 'cat', 'files/' + name, check=False)
    if result.returncode:
        return None
    try:
        return json.loads(result.stdout)
    except json.JSONDecodeError:
        # A progress report can be observed while GIO is replacing its contents.
        # A persistently incomplete document still fails the completion deadline.
        return None


with zipfile.ZipFile(args.apk) as apk:
    provenance = json.loads(apk.read(f'assets/runtime/{args.abi}/provenance.json'))
    build = provenance['runtime_build']
    assert build['jit'] == (not args.kernels_only) and build['kernels'], build
    assert build['compiler']['descriptor']['version'] == '18.1.3'
    assert build['compiler']['modules']['modules_lock']['packages'] == ['compiler-llvm18']
    for name in ['libsqgi.so', 'libLLVM.so']:
        data = apk.read(f'lib/{args.abi}/{name}')
        assert hashlib.sha256(data).hexdigest() == provenance['libraries'][name]['sha256']
    assert all(name.split('/')[1] == args.abi for name in apk.namelist() if name.startswith('lib/'))

adb('install', '-r', str(args.apk.resolve()))
adb('shell', 'am', 'force-stop', app)
adb('shell', 'run-as', app, 'rm', '-rf', 'files/development')
adb('shell', 'run-as', app, 'rm', '-f', 'files/compiler-result.json',
    'files/data/compiler-trace.log', 'files/data/jit-disabled')
if args.disable_jit:
    adb('shell', 'run-as', app, 'mkdir', '-p', 'files/data')
    adb('shell', 'run-as', app, 'touch', 'files/data/jit-disabled')
adb('shell', 'am', 'start', '-W', '-n', app + '/org.sqgi.android.GtkActivity')
deadline = time.monotonic() + 240
report = None
while time.monotonic() < deadline:
    report = read_json('compiler-result.json')
    if report and report.get('complete'):
        break
    time.sleep(1)
logs = adb('logcat', '-d', '-b', 'all').stdout
(args.output / 'logcat.txt').write_bytes(logs)
trace = adb('exec-out', 'run-as', app, 'cat', 'files/data/compiler-trace.log').stdout.decode()
(args.output / 'compiler-trace.log').write_text(trace)
(args.output / 'compiler-result.json').write_text(json.dumps(report, indent=2) + '\n')
assert report and report.get('complete') and report['passed'] == tests and not report['failed'], report
assert report['backend'] == 'llvm' and report['available'], report
assert report['jit'] == ('0' if args.disable_jit else '1'), report
if args.disable_jit or args.kernels_only:
    assert 'executed native ' not in trace, trace
else:
    for text in ['compiled native loop', 'executed native loop', 'compiled native proto', 'executed native proto']:
        assert text in trace, text
session = read_json('runtime/session.json')
assert session and session['mode'] == 'packaged' and session['abi'] == args.abi, session
assert session['application_id'] == app and session['entry_type'] == 'native', session
assert adb('shell', 'pidof', app).stdout.decode().strip() == str(session['pid']), session
(args.output / 'screen.png').write_bytes(adb('exec-out', 'screencap', '-p').stdout)
result_path.write_text(json.dumps(dict(passed=True, abi=args.abi, session=session, report=report,
    disable_jit=args.disable_jit, kernels_only=args.kernels_only,
    apk_sha256=hashlib.sha256(args.apk.read_bytes()).hexdigest(),
    compiler_package_lock=build['compiler']['modules']['modules_lock']), indent=2) + '\n')
print('PASS Android kernels with JIT compiled out' if args.kernels_only else
      'PASS Android interpreter fallback/kernels' if args.disable_jit else 'PASS Android JIT/kernels')
