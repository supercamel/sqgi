"""CLI result side effects and shared reporter/GUI output validation."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

RUNTIME = str(Path(sys.argv.pop(1)).resolve())
GUI = Path(__file__).resolve().parents[1]
CLI = GUI.parent / 'sqgipkg'


class Artifacts(unittest.TestCase):
    def test_reporter_and_gui_validation(self):
        with tempfile.TemporaryDirectory(prefix='build result café ') as tmp:
            run = subprocess.run([RUNTIME, str(GUI / 'tests/artifacts.nut'), tmp],
                                 capture_output=True, text=True, timeout=20)
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
            self.assertIn('PASS JOB-artifact-results', run.stdout)

    def test_quiet_progress(self):
        with tempfile.TemporaryDirectory(prefix='quiet build ') as tmp:
            run = subprocess.run([RUNTIME, str(GUI / 'tests/jobs_progress.nut'), tmp],
                                 env=dict(os.environ, SQGI_GUI_RUNTIME=RUNTIME),
                                 capture_output=True, text=True, timeout=15)
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
            self.assertIn('PASS JOB-quiet-progress', run.stdout)

    def test_inspection_cannot_write_results(self):
        with tempfile.TemporaryDirectory(prefix='build result ') as tmp:
            output = Path(tmp) / 'result.json'
            run = subprocess.run([RUNTIME, str(CLI), 'describe', '--json', '--build-result', str(output)],
                                 capture_output=True, text=True, timeout=20)
            self.assertNotEqual(run.returncode, 0)
            self.assertFalse(json.loads(run.stdout)['ok'])
            self.assertFalse(output.exists())


if __name__ == '__main__':
    unittest.main()
