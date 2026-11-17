#!/usr/bin/env python3
"""Distribution payloads must contain executable bytecode, never .nut source."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
SQGI = Path(sys.argv.pop(1)).resolve()
MODULE = json.dumps(str(ROOT / 'tools/sqgipkg_lib/build.nut'))
TARGETS = ('win-dir', 'win-nsis') if os.name == 'nt' else (
    'appimage', 'win-dir', 'win-nsis', 'android-apk', 'android-aab')


class BytecodePackaging(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='sqgipkg bytecode ')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.project = self.root / 'project'
        self.project.mkdir()

    def write(self, name, content):
        path = self.project / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content)
        return path

    def run_script(self, code, success=True):
        probe = self.root / 'probe.nut'
        probe.write_text(code)
        result = subprocess.run([SQGI, probe], cwd=self.project,
                                capture_output=True, text=True, timeout=60)
        self.assertEqual(result.returncode == 0, success, result.stdout + result.stderr)
        return result.stdout + result.stderr

    def test_source_mode_rejected_for_every_target_and_matrix(self):
        self.write('main.nut', 'print("hello")')
        for target in (*TARGETS, 'all'):
            for flag in (False, True):
                with self.subTest(target=target, flag=flag):
                    manifest = {'schema_version': 2, 'app_id': 'org.sqgi.bytecode', 'target': target}
                    if not flag:
                        manifest['compile_scripts'] = False
                    self.write('sqgipkg.json', json.dumps(manifest))
                    args = ['--no-compile-scripts'] if flag else []
                    result = subprocess.run([SQGI, ROOT / 'tools/sqgipkg', 'explain', '--json', *args],
                                            cwd=self.project, capture_output=True, text=True, timeout=30)
                    self.assertNotEqual(result.returncode, 0)
                    self.assertIn('compiled Squirrel bytecode', result.stdout + result.stderr)

    def test_all_script_routes_are_bytecode_and_relocatable(self):
        # Comments must disappear; compiling must never execute the entry.
        self.write('src/main.nut', '''// SOURCE_ONLY_SENTINEL
local child = import("lib/child.nut")
assert(child == 42)
local dynamic = "dynamic.nut"
assert(import(dynamic) == 7)
local resource = "resources/asset.nut"
assert(import(resource) == 9)
local included = "included.nut"
assert(import(included) == 13)
assert(loadfile("renamed.data")() == 11)
print("bytecode-payload-ok\\n")
''')
        self.write('src/lib/child.nut', '// SOURCE_ONLY_SENTINEL\nreturn 42')
        self.write('src/dynamic.nut', '// SOURCE_ONLY_SENTINEL\nreturn 7')
        self.write('assets/asset.nut', '// SOURCE_ONLY_SENTINEL\nreturn 9')
        self.write('renamed.nut', '// SOURCE_ONLY_SENTINEL\nreturn 11')
        self.write('included.nut', '// SOURCE_ONLY_SENTINEL\nreturn 13')
        self.write('assets/data.txt', 'ordinary resource')
        for target in TARGETS:
            with self.subTest(target=target):
                stage = self.root / target
                app_rel = 'share/sqgi/app' if target.startswith('win-') else 'usr/share/sqgi/app'
                manifest = {'schema_version': 2, 'target': target, 'app_id': 'org.sqgi.bytecode',
                            'entry': {'type': 'sqgi', 'script': 'src/main.nut', 'source_root': 'src'},
                            'script_dirs': ['src'], 'resources': ['assets/asset.nut', 'assets/data.txt'],
                            'includes': ['included.nut=' + app_rel + '/included.nut']}
                files = [{'from': 'src', 'to': app_rel}, 'renamed.nut=' + app_rel + '/renamed.data',
                         'src=' + app_rel + '/raw']
                if target.startswith('win-'):
                    manifest['windows'] = {'files': files}
                else:
                    manifest['files'] = files
                self.write('sqgipkg.json', json.dumps(manifest))
                output = self.run_script(f'''
local p = import({MODULE}).SqgiPkgBuild(), opts = p.new_options()
opts.manifest = "sqgipkg.json"
p.apply_manifest(opts); p.apply_project_defaults(opts)
local stage = {json.dumps(str(stage))}
if (p.is_android(opts)) p.android_stage_application(opts, stage)
else {{
    local scripts = {{}}
    p.stage_app_scripts(opts, stage, scripts)
    if (opts.target.slice(0, 4) == "win-") p.stage_windows_extra_files(opts, stage, scripts)
    else p.stage_extra_files(opts, stage, scripts)
    // Exercise the final sweep for late/native directory copies as well.
    p.copy_into_appdir("assets", stage, "{app_rel}/late", "late assets")
    p.finalize_packaged_scripts(opts, stage)
}}
''')
                self.assertNotIn('bytecode-payload-ok', output)
                app = stage / app_rel
                scripts = [p for p in stage.rglob('*') if p.suffix in ('.nut', '.cnut')]
                self.assertGreaterEqual(len(scripts), 7)
                for path in scripts + [app / 'renamed.data']:
                    self.assertTrue(path.read_bytes().startswith(b'\xfa\xfa'), path)
                    self.assertNotIn(b'SOURCE_ONLY_SENTINEL', path.read_bytes(), path)
                    if target.startswith(('android-', 'win-')):
                        self.assertFalse(path.is_symlink(), path)
                self.assertEqual((app / 'resources/data.txt').read_text(), 'ordinary resource')
                hidden = self.root / 'hidden'
                self.project.rename(hidden)
                try:
                    result = subprocess.run([SQGI, app / 'main.cnut'], cwd=app,
                                            capture_output=True, text=True, timeout=30)
                    self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                    self.assertIn('bytecode-payload-ok', result.stdout)
                finally:
                    hidden.rename(self.project)

    def test_late_invalid_source_and_fake_bytecode_fail(self):
        for content in ('this is not a valid squirrel program !', '\xfa\xfaNOT_BYTECODE'):
            with self.subTest(content=content):
                source = self.write('stage/broken.nut', '')
                source.write_bytes(content.encode('latin1'))
                self.run_script(f'''
local p = import({MODULE}).SqgiPkgBuild()
p.finalize_packaged_scripts(p.new_options(), "stage")
''', success=False)

    def test_cnut_input_keeps_its_name(self):
        self.write('input.nut', 'return 123')
        self.run_script(f'''
local p = import({MODULE}).SqgiPkgBuild(), opts = p.new_options()
p.compile_script_to("input.nut", "input.cnut")
assert(p.stage_script_file(opts, "stage", "input.cnut", "module.cnut", "precompiled", {{}}) == "module.cnut")
assert(loadfile("stage/module.cnut")() == 123)
''')
        self.assertFalse((self.project / 'stage/module.cnut.cnut').exists())

    def test_finalized_assets_are_identical_across_abi_staging_directories(self):
        for abi in ('x86_64', 'arm64-v8a'):
            self.write(abi + '/assets/helper.nut', 'return { answer = 42 }')
            self.run_script(f'''
local p = import({MODULE}).SqgiPkgBuild()
p.finalize_packaged_scripts(p.new_options(), "{abi}")
''')
        self.assertEqual((self.project / 'x86_64/assets/helper.nut').read_bytes(),
                         (self.project / 'arm64-v8a/assets/helper.nut').read_bytes())


if __name__ == '__main__':
    unittest.main()
