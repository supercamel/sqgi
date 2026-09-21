#!/usr/bin/env python3
"""Offline kernel payload/launcher tests; requires a kernel-enabled SQGI build."""
from itertools import product
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
SQGI = Path(sys.argv.pop(1)).resolve()
BUILD_MODULE = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
KERNEL = 'export i64 answer() { return 42; }\n'
# Linux bytecode compatibility links require a POSIX shell. Native Windows
# exercises its own payload layout without depending on MSYS Unix tools.
TARGETS = ('win-dir',) if os.name == 'nt' else ('appimage', 'win-dir')


class KernelPackaging(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        result = subprocess.run([str(SQGI), '-e', 'assert(sqgi.kernel.available)'],
                                capture_output=True, text=True, timeout=30)
        if result.returncode:
            raise AssertionError('Kernel packaging tests require kernels enabled:\n' +
                                 result.stdout + result.stderr)

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='sqgipkg kernel spaces-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.project = self.root / 'project'
        self.project.mkdir()
        self.cwd = self.root / 'unrelated working directory'
        self.cwd.mkdir()

    def write(self, path, text):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def run_command(self, argv, *, env=None, succeeds=True):
        result = subprocess.run(list(map(str, argv)), cwd=self.cwd, env=env,
                                capture_output=True, text=True, timeout=90)
        output = result.stdout + result.stderr
        if succeeds:
            self.assertEqual(result.returncode, 0, output)
        else:
            self.assertNotEqual(result.returncode, 0, output)
        return output

    @staticmethod
    def app_root(stage, target):
        return stage / ('share/sqgi/app' if target == 'win-dir' else 'usr/share/sqgi/app')

    def stage(self, target, compiled, *, manifest=None, launcher=False, succeeds=True):
        stage = self.root / f'{target}-{compiled}'
        data = {'schema_version': 2, 'script': 'src/main.nut', 'target': target,
                'compile_scripts': compiled}
        data.update(manifest or {})
        self.write(self.project / 'sqgipkg.json', json.dumps(data))
        probe = self.root / 'stage.nut'
        self.write(probe, f'''
local p = import({BUILD_MODULE}).SqgiPkgBuild()
local opts = p.new_options()
opts.manifest = {json.dumps((self.project / 'sqgipkg.json').as_posix())}
p.apply_manifest(opts)
local stage = {json.dumps(stage.as_posix())}
local staged = {{}}
local entry = opts.target == "win-dir"
    ? p.stage_windows_scripts(opts, stage, staged)
    : p.stage_app_scripts(opts, stage, staged)
if (opts.target == "win-dir") p.stage_windows_extra_files(opts, stage, staged)
else p.stage_extra_files(opts, stage, staged)
if ({str(launcher).lower()}) p.write_apprun(opts, stage, entry)
print("kernel-resources=" + opts.report.resources + "\\n")
''')
        output = self.run_command([SQGI, probe], succeeds=succeeds)
        return stage, output

    def run_payload(self, stage, target, compiled, *, succeeds=True):
        app = self.app_root(stage, target)
        env = dict(os.environ, SQGI_APP_SHARE=str(app))
        entry = app / ('main.cnut' if compiled else 'main.nut')
        # Remove the original source tree for the duration of execution.
        hidden = self.root / 'hidden source'
        self.project.rename(hidden)
        try:
            return self.run_command([SQGI, entry], env=env, succeeds=succeeds)
        finally:
            hidden.rename(self.project)

    def test_computed_and_aliased_loads_with_explicit_files(self):
        source = self.project / 'kernel sources/math.sqk'
        source.parent.mkdir(parents=True)
        self.write(self.project / 'src/main.nut', '''
local filename = "kernel dir/" + "math.sqk"
local loader = sqgi.kernel.load
assert(loader(filename).answer() == 42)
print("mapped-kernel=42\\n")
''')
        for target, compiled, newline in product(TARGETS, (False, True), ('\n', '\r\n')):
            with self.subTest(target=target, compiled=compiled, newline=newline):
                # Bypass text-mode newline translation and verify both formats
                # are preserved byte-for-byte on every host platform.
                kernel_bytes = KERNEL.replace('\n', newline).encode('utf8')
                source.write_bytes(kernel_bytes)
                dest = ('share' if target == 'win-dir' else 'usr/share') + '/sqgi/app/kernel dir/math.sqk'
                files = {'files': ['kernel sources/math.sqk=' + dest]}
                manifest = {'windows': files} if target == 'win-dir' else files
                stage, _ = self.stage(target, compiled, manifest=manifest)
                packaged = self.app_root(stage, target) / 'kernel dir/math.sqk'
                self.assertEqual(packaged.read_bytes(), kernel_bytes)
                self.assertIn('mapped-kernel=42', self.run_payload(stage, target, compiled))
                packaged.unlink()
                output = self.run_payload(stage, target, compiled, succeeds=False)
                self.assertIn('kernel: cannot open kernel dir/math.sqk', output)
                self.assertNotIn('mapped-kernel=42', output)

    def test_dynamic_scripts_discover_and_deduplicate_kernels(self):
        self.write(self.project / 'kernels/math.sqk', KERNEL)
        self.write(self.project / 'src/main.nut', '''
foreach (name in ["first.nut", "second.nut"]) assert(import(name).answer() == 42)
print("dynamic-scripts=42\\n")
''')
        for name in ('first', 'second'):
            self.write(self.project / f'plugins/{name}.nut',
                       'return sqgi.kernel.load("kernels/math.sqk")\n')
        for target in TARGETS:
            for compiled in (False, True):
                with self.subTest(target=target, compiled=compiled):
                    stage, output = self.stage(target, compiled, manifest={'script_dirs': ['plugins']})
                    self.assertIn('kernel-resources=1\n', output)
                    app = self.app_root(stage, target)
                    self.assertEqual(list(app.rglob('*.sqk')), [app / 'kernels/math.sqk'])
                    self.assertFalse(list(app.rglob('*.sqk.cnut')))
                    self.assertIn('dynamic-scripts=42', self.run_payload(stage, target, compiled))

    def test_missing_transitive_kernel_fails_with_source_location(self):
        self.write(self.project / 'src/main.nut', 'import("engine/helper.nut")\n')
        helper = self.project / 'src/engine/helper.nut'
        self.write(helper, 'return sqgi.kernel.load("kernels/missing.sqk")\n')
        for target in TARGETS:
            for compiled in (False, True):
                with self.subTest(target=target, compiled=compiled):
                    _, output = self.stage(target, compiled, succeeds=False)
                    self.assertIn('kernel source not found: kernels/missing.sqk', output)
                    self.assertIn('src/engine/helper.nut', output.replace('\\', '/'))

    @unittest.skipUnless(sys.platform.startswith('linux'), 'AppRun is a Linux launcher')
    def test_relocated_apprun_loads_kernel_and_detects_missing_payload(self):
        self.write(self.project / 'kernels/math.sqk', KERNEL)
        self.write(self.project / 'src/main.nut', '''
assert(sqgi.kernel.load("kernels/math.sqk" /* packaged source */).answer() == 42)
print("apprun-kernel=42\\n")
''')
        for compiled in (False, True):
            with self.subTest(compiled=compiled):
                stage, _ = self.stage('appimage', compiled, launcher=True)
                # Exercise the generated launcher using the tested host runtime;
                # full runtime dependency bundling belongs to the acceptance suite.
                (stage / 'usr/bin').mkdir(parents=True)
                (stage / 'usr/bin/sqgi').symlink_to(SQGI)
                relocated = self.root / f'relocated app {compiled}'
                stage.rename(relocated)
                hidden = self.root / 'hidden source'
                self.project.rename(hidden)
                try:
                    env = dict(os.environ, SQGI_APP_SHARE=str(self.root / 'wrong share'),
                               XDG_CACHE_HOME=str(self.root / 'cache'))
                    env.pop('APPDIR', None)
                    output = self.run_command([relocated / 'AppRun'], env=env)
                    self.assertIn('apprun-kernel=42', output)
                    (relocated / 'usr/share/sqgi/app/kernels/math.sqk').unlink()
                    output = self.run_command([relocated / 'AppRun'], env=env, succeeds=False)
                    self.assertIn('kernel: cannot open kernels/math.sqk', output)
                    self.assertNotIn('apprun-kernel=42', output)
                finally:
                    hidden.rename(self.project)


if __name__ == '__main__':
    unittest.main()
