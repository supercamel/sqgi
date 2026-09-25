#!/usr/bin/env python3
"""C-DEL launch, staged install, and traceability acceptance."""
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[3]
SQGI = Path(sys.argv.pop(1)).resolve()
GUI = ROOT / 'tools/sqgipkg_gui'

class Delivery(unittest.TestCase):
    def test_launch_from_unrelated_directory(self):
        with tempfile.TemporaryDirectory(prefix='sqgi launch ') as directory:
            env = dict(os.environ, SQGI_GUI_RUNTIME=str(SQGI))
            argv = [str(SQGI), str(GUI / 'main.nut'), '--help'] if os.name == 'nt' else [str(ROOT / 'tools/sqgipkg-gui'), '--help']
            proc = subprocess.run(argv, cwd=directory, env=env, capture_output=True, text=True, timeout=15)
            self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
            self.assertIn('Create and edit manifests', proc.stdout)

    def test_traceability(self):
        mapping = json.loads((GUI / 'contracts/traceability.json').read_text())
        expected = set()
        for path in (GUI / 'requirements').glob('*.md'):
            expected.update(re.findall(r'\| (R-[A-Z]+-\d+) \|', path.read_text()))
        self.assertEqual(expected, set(mapping['requirements']))
        contracts = '\n'.join(p.read_text() for p in (GUI / 'contracts').glob('*.md'))
        clauses = set(re.findall(r'\*\*(C-[A-Z]+-\d+) ', contracts))
        self.assertEqual(clauses, set(mapping['contracts']))
        for kind in ['requirements', 'contracts']:
            for identifier, entry in mapping[kind].items():
                if entry['status'] == 'deferred':
                    self.assertTrue(entry['reason'], identifier)
                    continue
                self.assertTrue(entry['tests'], identifier)
                for source in entry['modules']:
                    self.assertTrue((ROOT / source).is_file(), source)
                for test in entry['tests']:
                    self.assertIn(test, mapping['tests'], test)
        for identifier, test in mapping['tests'].items():
            path = ROOT / test['file']
            self.assertTrue(path.is_file(), identifier)
            self.assertIn(test['anchor'], path.read_text(), identifier)
        for entry in mapping['requirements'].values():
            for clause in entry.get('contracts', []):
                self.assertIn(clause, clauses)

    @unittest.skipIf(os.name == 'nt', 'native Windows installation is exercised by the packaging workflow')
    def test_staged_install(self):
        with tempfile.TemporaryDirectory(prefix='sqgi installed café ') as temp:
            prefix = Path(temp) / 'prefix with spaces'
            proc = subprocess.run(['cmake', '--install', str(SQGI.parent), '--prefix', str(prefix)], capture_output=True, text=True, timeout=60)
            self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
            launcher = prefix / 'bin/sqgipkg-gui'
            self.assertTrue(launcher.is_file())
            proc = subprocess.run([str(launcher), '--help'], cwd=temp, capture_output=True, text=True, timeout=15)
            self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
            self.assertIn('Create and edit manifests', proc.stdout)
            proc = subprocess.run([str(prefix / 'bin/sqgi'), str(prefix / 'share/sqgi/sqgipkg.nut'), 'describe', '--json'],
                                  cwd=temp, capture_output=True, text=True, timeout=15)
            self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
            self.assertEqual(json.loads(proc.stdout)['protocol_version'], 1)
            self.assertTrue((prefix / 'share/applications/org.sqgi.ManifestStudio.desktop').is_file())
            self.assertTrue((prefix / 'share/icons/hicolor/scalable/apps/org.sqgi.ManifestStudio.svg').is_file())

if __name__ == '__main__':
    unittest.main()
