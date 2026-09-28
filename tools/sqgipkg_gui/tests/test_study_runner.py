#!/usr/bin/env python3
"""C-DEL-04: real thread teardown and rejection of false success markers."""
from pathlib import Path
import os
import json
import platform
import shutil
import subprocess
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent / 'study'))
from isolated_linux import dependencies
from runner_support import accepted, crash_diagnostics, host_unwind_file, utf8_locale_files


class StudyRunner(unittest.TestCase):
    def test_gui_capture_preserves_existing_evidence_before_session_access(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            shot = root / 'baseline.png'
            original = b'original screenshot evidence'
            shot.write_bytes(original)
            result = subprocess.run([sys.executable,
                str(Path(__file__).parent / 'study/control.py'),
                str(root / 'absent-session'), '--op', 'click', '--label', 'Build',
                '--shot', str(shot)], text=True, capture_output=True)
            self.assertEqual(result.returncode, 2)
            self.assertIn('Screenshot already exists', result.stderr)
            self.assertNotIn('FileNotFoundError', result.stderr)
            self.assertEqual(shot.read_bytes(), original)

    def test_actual_scene_rejects_unverified_display_before_execution(self):
        helper = Path(__file__).parent / 'study/run_appimage.py'
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); artifact = root / 'probe.AppImage'; marker = root / 'executed'
            artifact.write_text('#!/bin/sh\ntouch "' + str(marker) + '"\n'); artifact.chmod(0o755)
            for mode in ['--scene-checks', '--network-checks']:
                command = [sys.executable, str(helper), '--artifact', str(artifact), '--arch', 'aarch64',
                           '--logs', str(root / 'logs'), '--name', mode[2:], mode]
                missing = subprocess.run(command, capture_output=True, text=True)
                self.assertNotEqual(missing.returncode, 0)
                self.assertIn('verified private display', missing.stderr)
                session = root / mode[2:]; session.mkdir()
                (session / 'display.json').write_text(json.dumps({'supervisor_pid': os.getpid(),
                    'xvfb_pid': os.getpid(), 'display': ':0'}))
                forged = subprocess.run(command + ['--display-session', str(session)], capture_output=True, text=True)
                self.assertNotEqual(forged.returncode, 0)
                self.assertIn('Refusing unverified display', forged.stderr)
                self.assertFalse(marker.exists())

    @unittest.skipUnless(sys.platform == 'linux' and shutil.which('bwrap'), 'Linux Bubblewrap required')
    def test_scene_peer_requires_images_and_terrain(self):
        helper = Path(__file__).parent / 'study/scene_http_peer.py'
        with tempfile.TemporaryDirectory(prefix='study-scene-peer-') as directory:
            root = Path(directory)
            for name, paths, expected in [('complete', ['/tiles/0/0/0.png', '/terrain/N00E000.hgt'], 0),
                                           ('missing-images', ['/terrain/N00E000.hgt'], 1)]:
                evidence = root / name; evidence.mkdir()
                client = '''import os, urllib.request
from pathlib import Path
for path in %r:
    data = urllib.request.urlopen(os.environ['SQGI_STUDY_SCENE_BASE_URL'] + path.lstrip('/')).read()
    if path.startswith('/tiles/'):
        assert data.startswith(b'\\x89PNG\\r\\n\\x1a\\n')
    else:
        assert data == b'\\x00\\x64' * (1201 * 1201)
Path(os.environ['SQGI_STUDY_READY']).write_text('ready')
''' % paths
                result = subprocess.run(['bwrap', '--unshare-user', '--unshare-net',
                    '--die-with-parent', '--ro-bind', '/', '/', '--bind', str(root), str(root),
                    '--proc', '/proc', '--dev', '/dev', '--clearenv', '--setenv', 'PATH', '/usr/bin',
                    '--', '/usr/bin/python3', str(helper.resolve()), '--evidence', str(evidence),
                    '--', '/usr/bin/python3', '-c', client], capture_output=True, text=True, timeout=15)
                self.assertEqual(result.returncode, expected, result.stdout + result.stderr)
                record = json.loads((evidence / 'scene-peer.json').read_text())
                self.assertEqual(record['application_exit_status'], 0)
                self.assertEqual(record['peer_checks_pass'], expected == 0)

    @unittest.skipUnless(shutil.which('cc') and shutil.which('qemu-' + platform.machine()),
                         'Native compiler and matching QEMU user emulator required')
    def test_shell_zero_exit_cannot_hide_qemu_crash(self):
        with tempfile.TemporaryDirectory(prefix='study-hidden-crash-') as directory:
            root = Path(directory)
            source = root / 'crash.c'
            source.write_text('#include <signal.h>\n#include <stdio.h>\nint main(void) { puts("SCRIPT COMPLETE"); fflush(stdout); raise(SIGSEGV); }\n')
            executable = root / 'crash'
            subprocess.run(['cc', str(source), '-o', str(executable)], check=True)
            proc = subprocess.run(['bash', '-c', 'ulimit -c 0; "$1" "$2"; exit 0',
                'study', shutil.which('qemu-' + platform.machine()), str(executable)],
                capture_output=True, text=True, timeout=15)
            self.assertEqual(proc.returncode, 0)
            self.assertIn('SCRIPT COMPLETE', proc.stdout)
            output = proc.stdout + proc.stderr
            self.assertTrue(crash_diagnostics(output), output)
            self.assertFalse(accepted(proc.returncode, output, ['SCRIPT COMPLETE']))

    @unittest.skipUnless(sys.platform == 'linux' and shutil.which('bwrap') and platform.machine() in ['aarch64', 'x86_64'],
                         'Linux Bubblewrap on a supported study architecture required')
    def test_network_peer_checks_actual_bytes(self):
        with tempfile.TemporaryDirectory(prefix='study-network-') as directory:
            root = Path(directory); app = root / 'app'; app.mkdir()
            for name, message, expected_status in [('valid', 'line-test', 0), ('wrong', 'wrong-test', 1)]:
                (app / 'AppRun').write_text('''#!/bin/bash
exec /usr/bin/study-python - <<'PY'
import socket
s = socket.create_connection(('127.0.0.1', 18080), timeout=3)
payload = %r + b'\\r\\n' + bytes.fromhex('000141ff')
s.sendall(payload)
reply = b''
while len(reply) < len(payload):
    reply += s.recv(1024)
assert reply == payload
s.close()
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM); s.settimeout(3)
for payload in [b'udp-test\\n', bytes.fromhex('ff007f20')]:
    s.sendto(payload, ('127.0.0.1', 18081))
    assert s.recvfrom(1024)[0] == payload
s.close()
PY
''' % message.encode())
                runner = Path(__file__).parent / 'study/isolated_linux.py'
                result = subprocess.run([sys.executable, str(runner), '--appdir', str(app),
                    '--sysroot', '/', '--arch', platform.machine(), '--logs', str(root),
                    '--name', name, '--network-checks', '--timeout', '15'],
                    capture_output=True, text=True, timeout=25)
                self.assertEqual(result.returncode, expected_status, result.stdout[-2000:] + result.stderr[-2000:])
                peer = json.loads((root / (name + '-network') / 'network.json').read_text())
                self.assertEqual(peer['application_exit_status'], 0)
                self.assertEqual(peer['acceptance'], 'pass' if expected_status == 0 else 'fail')
                self.assertEqual(peer['received_udp_hex'], ['7564702d746573740a', 'ff007f20'])

    @unittest.skipUnless(sys.platform == 'linux' and shutil.which('bwrap') and shutil.which('cc'),
                         'Linux Bubblewrap and a native C compiler required')
    def test_private_runner_unicode_filename_conversion(self):
        with tempfile.TemporaryDirectory(prefix='study-unicode-') as directory:
            root = Path(directory)
            source = root / 'locale.c'
            source.write_text(r'''#include <locale.h>
#include <stdlib.h>
#include <stdio.h>
#include <wchar.h>
int main(void) {
    if (!setlocale(LC_ALL, "")) return 2;
    char path[128];
    if (wcstombs(path, L"/assets/caf\u00e9 photo.txt", sizeof path) == (size_t)-1) return 3;
    FILE *file = fopen(path, "rb");
    if (!file || fgetc(file) != 'U') return 4;
    fclose(file); puts("UNICODE FILE READ"); return 0;
}
''')
            executable = root / 'locale'
            subprocess.run(['cc', str(source), '-o', str(executable)], check=True)
            assets = root / 'assets'; assets.mkdir()
            (assets / 'café photo.txt').write_text('Unicode asset')
            argv = ['bwrap', '--unshare-all', '--die-with-parent', '--proc', '/proc',
                    '--dev', '/dev', '--tmpfs', '/tmp', '--clearenv', '--setenv', 'LANG', 'C.UTF-8',
                    '--ro-bind', str(executable), '/probe', '--ro-bind', str(assets), '/assets']
            for path in dependencies(executable):
                argv += ['--ro-bind', str(Path(path).resolve()), path]
            missing = subprocess.run([*argv, '--', '/probe'], capture_output=True, text=True, timeout=10)
            self.assertEqual(missing.returncode, 2, missing.stdout + missing.stderr)
            for destination, path in sorted(utf8_locale_files().items()):
                argv += ['--ro-bind', path, destination]
            corrected = subprocess.run([*argv, '--', '/probe'], capture_output=True, text=True, timeout=10)
            self.assertEqual(corrected.returncode, 0, corrected.stdout + corrected.stderr)
            self.assertIn('UNICODE FILE READ', corrected.stdout)

    def test_success_marker_requires_clean_exit(self):
        for ending in ['raise SystemExit(7)', 'os.kill(os.getpid(), signal.SIGTERM)']:
            proc = subprocess.run([sys.executable, '-c',
                'import os, signal; print("SCRIPT COMPLETE", flush=True); ' + ending],
                capture_output=True, text=True, timeout=10)
            self.assertIn('SCRIPT COMPLETE', proc.stdout)
            self.assertFalse(accepted(proc.returncode, proc.stdout, ['SCRIPT COMPLETE']))
        proc = subprocess.run([sys.executable, '-c', 'print("SCRIPT COMPLETE")'],
                              capture_output=True, text=True, timeout=10)
        self.assertTrue(accepted(proc.returncode, proc.stdout, ['SCRIPT COMPLETE']))
        self.assertFalse(accepted(proc.returncode, proc.stdout, ['DIFFERENT CHECK']))

    @unittest.skipUnless(sys.platform == 'linux' and shutil.which('bwrap') and shutil.which('cc'),
                         'Linux Bubblewrap and a native C compiler required')
    def test_private_runner_pthread_shutdown(self):
        with tempfile.TemporaryDirectory(prefix='study-thread-exit-') as directory:
            root = Path(directory)
            source = root / 'thread.c'
            source.write_text('''#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
static void *worker(void *value) { pthread_exit(value); }
int main(void) {
    pthread_t thread; void *result = NULL;
    if (pthread_create(&thread, NULL, worker, (void *)(intptr_t)42)) return 2;
    if (pthread_join(thread, &result) || (intptr_t)result != 42) return 3;
    puts("THREAD EXIT COMPLETE"); return 0;
}
''')
            executable = root / 'thread'
            subprocess.run(['cc', '-pthread', str(source), '-o', str(executable)], check=True)
            bindings = {path: str(Path(path).resolve()) for path in dependencies(executable)}
            unwind = host_unwind_file()
            bindings[str(unwind)] = str(unwind)
            argv = ['bwrap', '--unshare-all', '--die-with-parent', '--proc', '/proc',
                    '--dev', '/dev', '--tmpfs', '/tmp', '--clearenv',
                    '--ro-bind', str(executable), '/probe', '--chdir', '/tmp']
            for destination, path in sorted(bindings.items()):
                argv += ['--ro-bind', path, destination]
            proc = subprocess.run([*argv, '--', '/probe'], capture_output=True, text=True, timeout=10)
            self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
            self.assertIn('THREAD EXIT COMPLETE', proc.stdout)


if __name__ == '__main__':
    unittest.main()
