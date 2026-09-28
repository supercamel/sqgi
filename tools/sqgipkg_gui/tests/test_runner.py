"""Real Linux process-tree acceptance for the GUI build supervisor."""
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest

RUNNER = str(Path(sys.argv.pop(1)).resolve())


class RunnerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='gui build café ')
        self.root = Path(self.temp.name)
        self.cancel = self.root / 'cancel'

    def tearDown(self):
        self.temp.cleanup()

    def command(self, code, *args):
        return [RUNNER, str(self.cancel), '--', sys.executable, '-c', code, *args]

    def test_literal_arguments_and_both_streams(self):
        args = ['café λ', '', 'a b', '$(touch nope);`false`']
        result = subprocess.run(self.command(
            'import sys,json;print(json.dumps(sys.argv[1:]));'
            'sys.stdout.write("x"*200000);sys.stderr.write("y"*200000)', *args),
            capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0)
        line, body = result.stdout.split(b'\n', 1)
        self.assertEqual(json.loads(line), args)
        self.assertEqual(body, b'x' * 200000)
        self.assertEqual(result.stderr, b'y' * 200000)

    def test_failure(self):
        self.assertEqual(subprocess.run(self.command('raise SystemExit(7)'), timeout=5).returncode, 7)

    def descendants(self, exit_parent=False):
        pidfile = self.root / 'pid'
        # Detached grandchild also ignores TERM, exercising adoption + escalation.
        grandchild = ('import os,signal,time;from pathlib import Path;'
                      'os.setsid();signal.signal(signal.SIGTERM,signal.SIG_IGN);'
                      f'Path({str(pidfile)!r}).write_text(str(os.getpid()));time.sleep(60)')
        code = ('import subprocess,sys,time;'
                f'subprocess.Popen([sys.executable,"-c",{grandchild!r}]);'
                'time.sleep(0.4);' + ('sys.exit(0)' if exit_parent else 'time.sleep(60)'))
        return pidfile, code

    def await_pid(self, path):
        deadline = time.monotonic() + 5
        while not path.exists() and time.monotonic() < deadline:
            time.sleep(.02)
        return int(path.read_text())

    def assert_gone(self, pid):
        self.assertFalse(Path(f'/proc/{pid}').exists(), f'descendant {pid} survived')

    def test_cancel_detached_grandchild(self):
        path, code = self.descendants()
        with subprocess.Popen(self.command(code), stdout=subprocess.PIPE, stderr=subprocess.PIPE) as child:
            pid = self.await_pid(path)
            self.cancel.touch()
            child.communicate(timeout=8)
            self.assertEqual(child.returncode, 130)
        self.assert_gone(pid)

    def test_normal_exit_cleans_unexpected_descendant(self):
        path, code = self.descendants(True)
        result = subprocess.run(self.command(code), capture_output=True, timeout=8)
        self.assertEqual(result.returncode, 125)
        self.assertIn(b'left child processes', result.stderr)
        self.assert_gone(int(path.read_text()))

    def test_owner_death(self):
        path, code = self.descendants()
        with (self.root / 'owner.log').open('w') as output:
            parent = subprocess.Popen([sys.executable, '-c',
                'import subprocess,sys,time;child=subprocess.Popen(sys.argv[1:],stdout=subprocess.PIPE,stderr=subprocess.STDOUT);time.sleep(60)',
                *self.command(code)], stdout=output, stderr=output)
            try:
                pid = self.await_pid(path)
                parent.kill(); parent.wait(timeout=5)
                deadline = time.monotonic() + 8
                while Path(f'/proc/{pid}').exists() and time.monotonic() < deadline:
                    time.sleep(.05)
                self.assert_gone(pid)
            finally:
                if path.exists():
                    try: os.kill(int(path.read_text()), signal.SIGKILL)
                    except ProcessLookupError: pass
                if parent.poll() is None:
                    parent.kill(); parent.wait()


if __name__ == '__main__':
    unittest.main()
