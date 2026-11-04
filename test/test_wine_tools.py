#!/usr/bin/env python3
"""Exercise Wine runner lifetime/output behavior and CI failure annotations."""
import json
import os
from pathlib import Path
import select
import signal
import subprocess
import sys
import tempfile
import unittest

TOOLS = Path(__file__).resolve().parents[1] / 'tools'


@unittest.skipUnless(os.name == 'posix', 'Wine runs on the Unix CI host')
class WineRunner(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.env = dict(os.environ, PATH=str(self.root) + os.pathsep + os.environ['PATH'],
                        WINEPREFIX=str(self.root / 'prefix'))

    def fake_wine(self, code):
        program = self.root / 'wine'
        program.write_text('#!/usr/bin/env python3\n' + code)
        program.chmod(0o755)

    def test_output_is_visible_before_foreground_exit(self):
        self.fake_wine('import sys\nprint("started", flush=True)\nsys.stdin.read(1)\nprint("finished")\n')
        process = subprocess.Popen([sys.executable, str(TOOLS / 'run_wine_test.py'), 'app.exe'],
                                   env=self.env, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE, start_new_session=True)
        try:
            ready, _, _ = select.select([process.stdout], [], [], 3)
            self.assertTrue(ready, 'Test output was withheld until process exit')
            self.assertEqual(process.stdout.readline().strip(), b'started')
            self.assertIsNone(process.poll())
            output, error = process.communicate(b'x', timeout=3)
            self.assertEqual(process.returncode, 0, error)
            self.assertEqual(output.strip(), b'finished')
        finally:
            if process.poll() is None:
                os.killpg(process.pid, signal.SIGKILL)
                process.communicate()

    def test_background_child_cannot_hold_output_open(self):
        pidfile = self.root / 'child.pid'
        self.fake_wine('import subprocess, sys\nfrom pathlib import Path\n'
                       'child = subprocess.Popen([sys.executable, "-c", "import time; time.sleep(30)"])\n'
                       f'Path({str(pidfile)!r}).write_text(str(child.pid))\n'
                       'print("foreground complete")\n')
        try:
            result = subprocess.run([sys.executable, str(TOOLS / 'run_wine_test.py'), 'app.exe'],
                                    env=self.env, capture_output=True, text=True, timeout=3)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(result.stdout.strip(), 'foreground complete')
        finally:
            if pidfile.exists():
                try:
                    os.kill(int(pidfile.read_text()), signal.SIGKILL)
                except ProcessLookupError:
                    pass

    def test_paths_and_exit_status_are_preserved(self):
        self.fake_wine('import json, sys\nprint(json.dumps(sys.argv[1:]))\nsys.exit(23)\n')
        script = self.root / 'script with spaces.nut'
        script.touch()
        result = subprocess.run([sys.executable, str(TOOLS / 'run_wine_test.py'), str(script), 'argument with spaces'],
                                env=self.env, capture_output=True, text=True, timeout=3)
        self.assertEqual(result.returncode, 23)
        self.assertEqual(json.loads(result.stdout), ['start', '/exec', 'Z:' + str(script).replace('/', '\\'), 'argument with spaces'])
        self.assertIn('status 23', result.stderr)


class FailureAnnotations(unittest.TestCase):
    def report(self, name, contents):
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / name
            path.write_text(contents)
            return subprocess.check_output([sys.executable, str(TOOLS / 'report_ci_failure.py'), str(path)], text=True)

    def test_timeout_without_output_keeps_failure_reason(self):
        output = self.report('runtime-tests.xml', '<testsuite><testcase name="pixels"><failure message="Timeout"/><system-out/></testcase></testsuite>')
        self.assertIn('pixels: Timeout', output)

    def test_long_log_keeps_final_diagnostic_within_annotation_limit(self):
        output = self.report('build.log', ('earlier output ' * 3000) + '\nfinal error')
        self.assertIn('final error', output)
        self.assertLess(len(output), 4096)


if __name__ == '__main__':
    unittest.main()
