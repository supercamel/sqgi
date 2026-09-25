#!/usr/bin/env python3
"""Acceptance checks for C-DOC, C-PKG and catalog coverage; no GTK dependency."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[3]
SQGI = Path(sys.argv.pop(1)).resolve()
GUI = ROOT / 'tools/sqgipkg_gui'
CLI = ROOT / 'tools/sqgipkg'

class Contracts(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='sqgi manifest café-')
        self.directory = Path(self.tmp.name)
        (self.directory / 'main.nut').write_text('local Gtk = import("Gtk", "4.0")\n', encoding='utf8')
        self.value = {'schema_version': 2, 'name': 'Café λ', 'entry': 'main.nut', 'runtime': {'sqgi': 'v0.1.7-alpha'}, 'native': [], 'target': 'win-dir' if os.name == 'nt' else 'appimage'}
        self.manifest = self.directory / 'sqgipkg.json'
        self.manifest.write_text(json.dumps(self.value), encoding='utf8')

    def tearDown(self):
        self.tmp.cleanup()

    def run_cli(self, *args, text=None):
        return subprocess.run([str(SQGI), str(CLI), *args], cwd=self.directory,
                              input=text, text=True, encoding='utf8', capture_output=True, timeout=30)

    def inspect(self, action='explain', stdin=False, value=None):
        args = [action, '--json', '--manifest', '-' if stdin else str(self.manifest)]
        if stdin:
            args += ['--base-dir', str(self.directory)]
        proc = self.run_cli(*args, text=json.dumps(self.value if value is None else value) if stdin else None)
        data = json.loads(proc.stdout)
        self.assertEqual(data['protocol_version'], 1)
        self.assertEqual(proc.returncode == 0, data['ok'], proc.stdout + proc.stderr)
        return data

    def test_document_contracts(self):
        corpus = []
        for directory in ['demo', 'tools', 'test']:
            for path in (ROOT / directory).rglob('*.json'):
                if '.git' in path.parts or path.name == 'sqgipkg.schema.json':
                    continue
                if path.name == 'sqgipkg.json' or path.name.endswith('.sqgipkg.json'):
                    corpus.append(path.read_text(encoding='utf8'))
        self.assertGreater(len(corpus), 3)
        (self.directory / 'corpus.json').write_text(json.dumps(corpus), encoding='utf8')
        proc = subprocess.run([str(SQGI), str(GUI / 'tests/document.nut'), str(self.directory)],
                              text=True, encoding='utf8', capture_output=True, timeout=30)
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        for name in ['preservation', 'history', 'atomic-save', 'relocation', 'build-revision', 'corpus']:
            self.assertIn('PASS DOC-' + name, proc.stdout)

    def test_protocol_and_equivalence(self):
        file_result = self.inspect()
        stdin_result = self.inspect(stdin=True)
        self.assertTrue(file_result['ok'], file_result)
        self.assertEqual(file_result, stdin_result)
        plan = file_result['configurations'][0]
        text = self.run_cli('explain', '--manifest', str(self.manifest))
        self.assertEqual(text.returncode, 0, text.stderr)
        self.assertIn('target: ' + plan['target'], text.stdout)
        for command in plan['runtime']['commands']:
            self.assertIn(json.dumps(command, separators=(',', ':'), ensure_ascii=False), text.stdout)
        self.assertEqual(Path(plan['discovery']['import_evidence'][0]['file']), self.directory / 'main.nut')

    def test_inspection_no_side_effects_and_diagnostics(self):
        marker = self.directory / 'should not exist'
        self.value['linux'] = {'build': ['touch "' + str(marker) + '"']}
        before = sorted(p.name for p in self.directory.iterdir())
        result = self.inspect(stdin=True)
        self.assertTrue(result['ok'], result)
        self.assertEqual(before, sorted(p.name for p in self.directory.iterdir()))
        invalid = self.inspect(stdin=True, value={'schema_version': 2, 'unknown': 1})
        self.assertFalse(invalid['ok'])
        self.assertEqual(invalid['diagnostics'][0]['path'], ['unknown'])
        unusual = self.inspect(stdin=True, value={'schema_version': 2, '123.dot': 1})
        self.assertEqual(unusual['diagnostics'][0]['path'], ['123.dot'])
        bad = self.run_cli('explain', '--json', '--manifest', '-', '--base-dir', str(self.directory), text='{broken')
        self.assertFalse(json.loads(bad.stdout)['ok'])
        unknown = self.run_cli('check', '--json', '--unknown')
        self.assertFalse(json.loads(unknown.stdout)['ok'])
        platform = self.run_cli('explain', '--json', '--platform', 'invalid')
        self.assertFalse(json.loads(platform.stdout)['ok'])
        check = self.inspect('check', stdin=True)
        self.assertTrue(check['ok'], check)
        (self.directory / 'main.nut').write_text('this is not valid Squirrel !!!', encoding='utf8')
        check = self.inspect('check', stdin=True)
        self.assertFalse(check['ok'])
        self.assertTrue(any(d['code'] == 'script_syntax' for d in check['diagnostics']))
        build = self.run_cli('build', '--json', '--manifest', '-', '--base-dir', str(self.directory), text='{}')
        self.assertNotEqual(build.returncode, 0)
        self.assertFalse(marker.exists())

    def test_runtime_defaults_and_overrides(self):
        plan = self.inspect()['configurations'][0]
        command = plan['runtime']['commands'][0]
        for flag in ['-DSQ_ENABLE_JIT=ON', '-DSQGI_ENABLE_KERNELS=ON', '-DSQGI_BYTECODE_JIT_BACKEND=LLVM', '-DSQGI_KERNEL_BACKEND=LLVM']:
            self.assertIn(flag, command)
        self.value['runtime']['jit'] = False
        command = self.inspect(stdin=True)['configurations'][0]['runtime']['commands'][0]
        self.assertIn('-DSQ_ENABLE_JIT=OFF', command)
        self.assertIn('-DSQGI_ENABLE_KERNELS=ON', command)

    def test_legacy_compatibility(self):
        self.value = {'name': 'Old', 'script': 'main.nut', 'future': {'value': False}}
        result = self.inspect(stdin=True)
        self.assertTrue(result['ok'], result)
        self.assertTrue(any(d['code'] == 'unknown_field' and d['path'] == ['future'] for d in result['diagnostics']))

    def test_catalog_and_cli_coverage(self):
        described = json.loads(self.run_cli('describe', '--json').stdout)
        catalog = json.loads((GUI / 'catalog.json').read_text())
        schema = described['schema']
        fields = {definition + '.' + key for definition, spec in schema['$defs'].items() for key in spec.get('properties', {})}
        self.assertEqual(fields, set(catalog['fields']))
        self.assertEqual({o['name'] for o in described['options']}, set(catalog['cli']))
        self.assertTrue(all(v['classification'] in {'field', 'invocation', 'action', 'alias'} for v in catalog['cli'].values()))
        self.assertFalse(catalog['fields']['runtime.jit']['common'])
        self.assertTrue(described['runtime']['jit'])
        self.assertTrue(described['runtime']['kernels'])
        self.assertEqual(described['runtime']['kernel_backend'], 'llvm')
        for name, template in described['templates'].items():
            self.assertEqual(template['schema_version'], 2, name)
            self.assertNotIn('runtime', template)

    def test_async_inspection_and_cancellation(self):
        env = dict(os.environ, SQGI_GUI_RUNTIME=str(SQGI))
        proc = subprocess.run([str(SQGI), str(GUI / 'tests/backend.nut'), str(self.directory)],
                              env=env, text=True, encoding='utf8', capture_output=True, timeout=15)
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertIn('PASS PKG-async-inspection', proc.stdout)

    def test_cli_boundary(self):
        backend = (GUI / 'src/backend.nut').read_text()
        self.assertNotIn('import("../../sqgipkg_lib', backend)
        for source in (GUI / 'src').glob('*.nut'):
            self.assertNotIn('import("../../sqgipkg_lib/', source.read_text())
        # CLI rejects mutating options in the inspection channel.
        proc = self.run_cli('explain', '--json', '--write-lock', '--manifest', str(self.manifest))
        self.assertFalse(json.loads(proc.stdout)['ok'])
        self.assertFalse((self.directory / 'sqgipkg.lock.json').exists())

if __name__ == '__main__':
    unittest.main()
