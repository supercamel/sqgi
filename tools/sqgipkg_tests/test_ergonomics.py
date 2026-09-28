#!/usr/bin/env python3
"""Offline CLI/recipe regressions, runnable from PowerShell or a POSIX terminal."""
import ctypes
import json
import lzma
import os
from pathlib import Path
import shutil
import shlex
import subprocess
import struct
import tarfile
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
SQGI = Path(sys.argv.pop(1)).resolve()
TOOL = ROOT / 'tools/sqgipkg'


class Ergonomics(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='sqgipkg spaces-')
        self.root = Path(self.tmp.name).resolve()
        (self.root / 'main.nut').write_text('print("hello\\n")\n', encoding='utf8')

    def tearDown(self):
        self.tmp.cleanup()

    def run_pkg(self, *args, ok=True):
        result = subprocess.run([str(SQGI), str(TOOL), *args], cwd=self.root,
                                text=True, capture_output=True, timeout=90)
        if ok:
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        return result.stdout + result.stderr

    def manifest(self, data):
        (self.root / 'sqgipkg.json').write_text(json.dumps(data), encoding='utf8')

    @unittest.skipUnless(sys.platform.startswith('linux') and shutil.which('cc') and shutil.which('readelf'), 'Linux ELF compiler required')
    def test_native_sysroot_indirect_library_link(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        triplet = subprocess.check_output(['cc', '-dumpmachine'], text=True).strip()
        sysroot = self.root / 'private SDK'
        libdir = sysroot / 'usr/lib' / triplet
        nested = libdir / 'blas'
        nested.mkdir(parents=True)
        leaf = self.root / 'leaf.c'
        leaf.write_text('int study_leaf(void) { return 43; }')
        middle = self.root / 'middle.c'
        middle.write_text('extern int study_leaf(void); int study_middle(void) { return study_leaf(); }')
        main = self.root / 'main.c'
        main.write_text('extern int study_middle(void); int main(void) { return study_middle(); }')
        def cc(*args):
            return subprocess.run(['cc', *map(str, args)], capture_output=True, text=True)
        for args in [
            ['-nostdlib', '-shared', '-fPIC', leaf, '-Wl,-soname,libstudy_leaf.so', '-o', nested / 'libstudy_leaf.so'],
            ['-nostdlib', '-shared', '-fPIC', middle, '-L' + str(nested), '-lstudy_leaf', '-o', libdir / 'libstudy_middle.so']]:
            result = cc(*args)
            self.assertEqual(result.returncode, 0, result.stderr)
        link = ['-nostdlib', '-Wl,-e,main', main, '-L' + str(libdir), '-lstudy_middle', '-o', self.root / 'consumer']
        baseline = cc(*link)
        self.assertNotEqual(baseline.returncode, 0, 'Fixture must require indirect dependency discovery')
        self.assertIn('study_leaf', baseline.stderr)
        flags = self.run_script(f'''local B = import({module}), p = B.SqgiPkgBuild(), opts = p.new_options()
opts.linux.sysroot = {json.dumps(str(sysroot))}
opts.appimage_arch = p.normalize_appimage_arch(p.machine_arch())
print(p.linux_native_sysroot_ldflags(opts))
''')
        result = cc(*shlex.split(flags), *link)
        self.assertEqual(result.returncode, 0, result.stderr)
        dynamic = subprocess.check_output(['readelf', '-d', str(self.root / 'consumer')], text=True)
        self.assertNotIn('(RPATH)', dynamic)
        self.assertNotIn('(RUNPATH)', dynamic)

    def test_ooblerg_target_resolution_and_inspection(self):
        value = {'schema_version': 2, 'entry': 'main.nut', 'target': 'all',
                 'platforms': {'linux': {'architectures': ['x86_64', 'aarch64']}},
                 'runtime': {'source': '.'}, 'windows': {'package_source': 'ooblerg', 'runtime': 'package'},
                 'native': [{'name': 'serial', 'dir': 'native', 'build_system': 'meson', 'windows_package': 'gserial'}]}
        self.manifest(value)
        before = sorted(p.relative_to(self.root) for p in self.root.rglob('*'))
        result = json.loads(self.run_pkg('explain', '--json'))
        self.assertEqual(before, sorted(p.relative_to(self.root) for p in self.root.rglob('*')))
        windows = result['configurations'][-1]
        self.assertEqual(windows['package_source'], 'ooblerg')
        self.assertEqual(windows['runtime']['package'], 'sqgi')
        self.assertFalse(windows['runtime']['recipe'])
        self.assertEqual(windows['runtime']['commands'], [])
        self.assertIn('gserial', windows['packages'])
        self.assertEqual(windows['native'][0]['commands'], [])
        for linux in result['configurations'][:-1]:
            self.assertTrue(linux['runtime']['recipe'])
            self.assertGreater(len(linux['native'][0]['commands']), 0)
        value['native'][0]['stage'] = False
        self.manifest(value)
        dev = json.loads(self.run_pkg('explain', '--json'))['configurations'][-1]
        self.assertIn('gserial', dev['build_packages'])
        self.assertNotIn('gserial', dev['packages'])
        value['windows']['runtime'] = 'inherit'
        self.manifest(value)
        plan = json.loads(self.run_pkg('explain', '--json'))['configurations'][-1]
        configure = plan['runtime']['commands'][0]
        self.assertTrue(any('_ooblerg-x86_64/mingw64/lib/LLVM-C.lib' in a.replace('\\', '/') for a in configure))
        self.assertIn('llvm18', plan['packages'])
        value['windows']['package_source'] = 'msys2'
        self.manifest(value)
        self.assertIn('requires the Ooblerg', self.run_pkg('explain', '--json', ok=False))

    def test_linux_ooblerg_development_seeds_do_not_become_runtime_packages(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local Core = import({module})
local p = Core.SqgiPkgBuild(), opts = p.new_options()
opts.target = "appimage"; opts.appimage_arch = "aarch64"; opts.entry_type = "native"
opts.linux_ooblerg <- {{ build_packages = ["libglib2.0-dev", "libgdal-dev"] }}
local seeds = p.linux_deb_sysroot_seed_packages(opts)
if (seeds.find("libglib2.0-dev:arm64") == null || seeds.find("libgdal-dev:arm64") == null) throw "development inputs missing"
if (opts.linux.deb.packages.len()) throw "development seeds leaked into runtime package list"
opts.native_projects = [{{ linux_package = "gserial", gi = {{ strategy = "host" }} }}]
if (p.linux_required_pkg_config_modules(opts).find("gobject-introspection-1.0") != null) throw "prebuilt replacement requires source GI tools"
opts.native_projects[0].linux_package = ""
if (p.linux_required_pkg_config_modules(opts).find("gobject-introspection-1.0") == null) throw "source GI requirement lost"
foreach (path in ["/usr/share/pkgconfig/shared-mime-info.pc", "/usr/lib/aarch64-linux-gnu/glib-2.0/include/glibconfig.h", "/usr/share/vala/vapi/serial.vapi", "/usr/share/gir-1.0/Serial.gir"])
    if (p.linux_package_dest_for_staging(opts, path, false, false) != null) throw "development file staged: " + path
if (p.linux_package_dest_for_staging(opts, "/usr/share/mime/mime.cache", false, false) == null) throw "runtime data lost"
if (p.linux_package_dest_for_staging(opts, "/usr/lib/aarch64-linux-gnu/libserial.so.1", false, false) == null) throw "runtime library lost"
''')

    def test_linux_ooblerg_preserves_source_and_windows(self):
        value = {'schema_version': 2, 'entry': 'main.nut', 'target': 'all',
                 'platforms': {'linux': {'architectures': ['x86_64', 'aarch64']}},
                 'linux': {'ooblerg_packages': ['gworldscene']},
                 'windows': {'package_source': 'ooblerg'},
                 'native': [{'name': 'serial', 'repo': 'https://invalid.example/gserial', 'ref': 'a'*40,
                             'build_system': 'meson', 'linux_package': 'gserial', 'windows_package': 'gserial'}]}
        self.manifest(value)
        before = sorted(p.relative_to(self.root) for p in self.root.rglob('*'))
        plans = json.loads(self.run_pkg('explain', '--json'))['configurations']
        self.assertEqual(before, sorted(p.relative_to(self.root) for p in self.root.rglob('*')))
        for linux in plans[:-1]:
            self.assertEqual(linux['linux_suite'], 'noble')
            self.assertEqual(linux['package_source'], 'ubuntu')
            self.assertEqual(linux['ooblerg_packages'], ['gworldscene', 'gserial'])
            self.assertEqual(linux['native'][0]['commands'], [])
        self.assertIn('gserial', plans[-1]['packages'])
        value['native'][0]['stage'] = False
        self.manifest(value)
        build_only = json.loads(self.run_pkg('explain', '--json'))['configurations'][0]
        self.assertIn('gserial', build_only['ooblerg_build_packages'])
        self.assertNotIn('gserial', build_only['ooblerg_packages'])
        del value['native'][0]['stage']
        del value['native'][0]['linux_package']
        self.manifest(value)
        plans = json.loads(self.run_pkg('explain', '--json'))['configurations']
        self.assertTrue(plans[0]['native'][0]['commands'])
        self.assertFalse(plans[-1]['native'][0]['commands'])
        value['linux']['suite'] = 'jammy'
        self.manifest(value)
        self.assertIn('Ubuntu 24.04/noble', self.run_pkg('explain', '--json', ok=False))
        del value['linux']['ooblerg_packages']
        self.manifest(value)
        self.assertEqual(json.loads(self.run_pkg('explain', '--json'))['configurations'][0]['linux_suite'], 'jammy')

    @unittest.skipUnless(shutil.which('makensis'), 'NSIS required')
    def test_nsis_bootstrap_supports_x86_64_payload(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local Core = import({module})
local p = Core.SqgiPkgBuild(), opts = p.new_options()
opts.name = "Installer Probe"; opts.target = "win-nsis"; opts.output_dir = "dist"
p.mkdir_p("dist/Installer Probe")
p.write_file("dist/Installer Probe/Installer Probe.bat", "@echo off\\r\\n")
p.write_nsis_script(opts, "dist/Installer Probe")
''')
        compiled = subprocess.run(['makensis', 'Installer Probe.nsi'], cwd=self.root / 'dist', text=True, capture_output=True)
        self.assertEqual(compiled.returncode, 0, compiled.stdout + compiled.stderr)
        data = (self.root / 'dist/Installer Probe-Setup.exe').read_bytes()
        offset = struct.unpack_from('<I', data, 0x3c)[0]
        self.assertEqual(data[offset:offset+4], b'PE\0\0')
        self.assertIn(struct.unpack_from('<H', data, offset+4)[0], (0x8664, 0x14c))
        script = (self.root / 'dist/Installer Probe.nsi').read_text()
        self.assertIn('${IfNot} ${RunningX64}', script)
        self.assertIn('SetRegView 64', script)
        # Exercise the stock-Windows-NSIS fallback even on Linux installations
        # which also ship amd64 stubs. Verify the generated PE, not just text.
        fallback = script.replace('!if /FileExists "${NSISDIR}/Stubs/zlib-amd64-unicode"', '!if 0', 1)
        self.assertNotEqual(fallback, script)
        (self.root / 'dist/Installer Probe.nsi').write_text(fallback)
        compiled = subprocess.run(['makensis', 'Installer Probe.nsi'], cwd=self.root / 'dist', text=True, capture_output=True)
        self.assertEqual(compiled.returncode, 0, compiled.stdout + compiled.stderr)
        data = (self.root / 'dist/Installer Probe-Setup.exe').read_bytes()
        offset = struct.unpack_from('<I', data, 0x3c)[0]
        self.assertEqual(struct.unpack_from('<H', data, offset+4)[0], 0x14c)


    def test_windows_package_runtime_dll_selection(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local Core = import({module})
local p = Core.SqgiPkgBuild()
if (p.windows_package_dest("mingw64/lib/libscene.dll", "mingw64") != "bin/libscene.dll") throw "lib-directory DLL omitted"
if (p.windows_package_dest("mingw64/bin/BASE.DLL", "mingw64") != "bin/BASE.DLL") throw "case-sensitive DLL selection"
if (p.windows_package_dest("mingw64/lib/libscene.dll.a", "mingw64") != null) throw "development import library staged"
if (p.windows_package_dest("mingw64/lib/gstreamer-1.0/libgstcore.dll.a", "mingw64") != null) throw "plugin import archive staged"
if (p.windows_package_dest("mingw64/lib/gdk-pixbuf-2.0/loaders/image.dll.a", "mingw64") != null) throw "loader import archive staged"
if (p.windows_package_dest("mingw64/lib/gstreamer-1.0/libgstcore.dll", "mingw64") == null) throw "runtime plugin lost"
p.mkdir_p("payload/bin")
p.write_file("payload/bin/LLVM-C.dll", "test")
if (p.windows_dll_in_bundle("payload", "llvm-c.DLL") == null) throw "case-sensitive import lookup"
''')

    def test_ooblerg_runtime_conflicts(self):
        for extra, error in [({'msys2_root': 'existing'}, 'private sysroot'),
                             ({'package_source': 'invalid'}, 'must be msys2 or ooblerg'),
                             ({'runtime': 'invalid'}, 'must be inherit or package')]:
            self.manifest({'schema_version': 2, 'target': 'win-dir', 'entry': 'main.nut',
                           'windows': dict({'package_source': 'ooblerg'}, **extra)})
            self.assertIn(error, self.run_pkg('explain', '--json', ok=False))
        self.manifest({'schema_version': 2, 'target': 'win-dir', 'entry': 'main.nut',
                       'runtime': {'source': '.', 'jit': False},
                       'windows': {'package_source': 'ooblerg', 'runtime': 'package'}})
        self.assertIn('cannot honor', self.run_pkg('explain', '--json', ok=False))

    def test_short_help_and_full_reference(self):
        help_text = self.run_pkg('--help')
        self.assertLess(len(help_text.splitlines()), 32)
        self.assertNotIn('--msys2-package-cache', help_text)
        reference = self.run_pkg('--help-all')
        self.assertIn('--msys2-package-cache', reference)
        self.assertNotIn('all, appdir, tarball', reference)

    def test_templates_follow_imports_without_unrelated_scripts(self):
        (self.root / 'main.nut').write_text('local value = import("needed.nut")\n')
        (self.root / 'needed.nut').write_text('local Gst = import("Gst", "1.0"); return { answer = 42 }\n')
        examples = self.root / 'native/examples'
        examples.mkdir(parents=True)
        (examples / 'unrelated.nut').write_text('local Gtk = import("Gtk", "4.0")\n')
        for name in ['simple', 'gtk4', 'gtk4-gstreamer', 'native-gobject', 'native-vala']:
            with self.subTest(template=name):
                manifest = self.root / 'sqgipkg.json'
                manifest.unlink(missing_ok=True)
                self.run_pkg('--init', name)
                value = json.loads(manifest.read_text())
                self.assertNotIn('script_dirs', value)
                self.assertEqual(value, json.loads((ROOT / 'tools/sqgipkg_templates' / (name + '.sqgipkg.json')).read_text()))
        self.manifest({'schema_version': 2, 'entry': 'main.nut', 'target': 'appimage'})
        plan = json.loads(self.run_pkg('explain', '--json'))['configurations'][0]
        evidence = plan['discovery']['import_evidence']
        self.assertTrue(any(item['file'].endswith('needed.nut') for item in evidence), evidence)
        self.assertFalse(any(item['file'].endswith('unrelated.nut') for item in evidence))
        self.manifest({'schema_version': 2, 'entry': 'main.nut', 'target': 'appimage', 'script_dirs': ['native/examples']})
        plan = json.loads(self.run_pkg('explain', '--json'))['configurations'][0]
        evidence = plan['discovery']['import_evidence']
        self.assertTrue(any(item['file'].endswith('unrelated.nut') for item in evidence), evidence)

    def test_help_with_lf_and_crlf_sources(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/main.nut').as_posix())
        source = TOOL.read_text(encoding='utf8').replace(
            'import("sqgipkg_lib/main.nut")', f'import({module})')
        launcher = self.root / 'sqgipkg.nut'
        for option in ('--help', '-h', 'help', '--help-all'):
            expected = self.run_pkg(option)
            for newline in ('\n', '\r\n'):
                with self.subTest(option=option, newline=newline):
                    launcher.write_bytes(source.replace('\n', newline).encode('utf8'))
                    result = subprocess.run([str(SQGI), str(launcher), option],
                                            cwd=self.root, capture_output=True, timeout=90)
                    output = result.stdout + result.stderr
                    self.assertEqual(result.returncode, 0, output)
                    # Expect exactly one host newline per logical line, without
                    # text-mode decoding hiding CRLF or CRCRLF regressions.
                    self.assertEqual(output, expected.replace('\n', os.linesep).encode('utf8'))

    def test_unknown_keys_and_types(self):
        self.manifest({'schema_version': 2, 'resoruces': ['assets']})
        self.assertIn('manifest.resoruces', self.run_pkg('check', ok=False))
        self.manifest({'resoruces': ['assets']})
        self.assertIn('WARN: unknown field: manifest.resoruces', self.run_pkg('check'))
        self.manifest({'schema_version': 2, 'windows': {'native_projects': [{'dir': '.', 'optons': {}}]}})
        self.assertIn('native_projects[0].optons', self.run_pkg('check', ok=False))
        self.manifest({'schema_version': 2, 'features': 'gtk4'})
        self.assertIn('features must be an array', self.run_pkg('check', ok=False))

    def test_cli_uses_supplied_arguments(self):
        # The OS command line contains only probe.nut. GApplication.run on
        # Windows would ignore this supplied argv and accidentally start a build.
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/main.nut').as_posix())
        output = self.run_script(f'''
local Main = import({module})
local args = ["--explain", "--name", "Supplied arguments", "--target", "win-dir"]
local pkg = Main.SqgiPkg(args)
if (pkg.run(args) != 0) throw "explain failed"
''')
        self.assertIn('Supplied arguments', output)
        self.assertIn('win-dir', output)
        self.assertFalse((self.root / '.sqgipkg').exists())
        self.assertFalse(any(self.root.glob('dist*')))

    def test_cli_option_forms(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/main.nut').as_posix())
        self.run_script(f'''
local Main = import({module})
local pkg = Main.SqgiPkg([])
local parsed = pkg.parse_cli_options([
    "--doctor", "-nApp with spaces", "-t", "win-dir", "--output=dist space",
    "--script", "one.nut", "--script=two.nut", "--gtk-theme=",
    "--smoke-test", "--literal-value", "--", "--platform=windows"
])
local o = parsed.options
if (!o.doctor || o.name != "App with spaces" || o.target != "win-dir") throw "flags or short options"
if (o.output != "dist space" || o["gtk-theme"] != "") throw "equals values"
if (o.script.len() != 2 || o.script[0] != "one.nut" || o.script[1] != "two.nut") throw "repeated options"
if (o["smoke-test"] != "--literal-value") throw "literal option value"
if (pkg.extract_script_arg(parsed.positional) != "--platform=windows") throw "separator"
''')
        for args, error in [
            (('--unknown-option',), 'unknown option'),
            (('--name',), 'requires a value'),
            (('--doctor=true',), 'does not take a value'),
        ]:
            with self.subTest(args=args):
                self.assertIn(error, self.run_pkg(*args, ok=False))

    def test_cli_separator_preserves_alias_like_filename(self):
        (self.root / '--platform=windows').write_text('print("hello\\n")\n', encoding='utf8')
        output = self.run_pkg('check', '--target', 'win-dir', '--', '--platform=windows')
        self.assertIn('--platform=windows', output)
        self.assertFalse(any(self.root.glob('dist*')))

    def test_windows_doctor(self):
        self.manifest({'target': 'win-dir', 'windows': {'native_projects': [{'dir': 'missing', 'build': ['false']}]}})
        output = self.run_pkg('check', ok=False)
        self.assertIn('missing native project directory', output)
        self.assertNotIn('libsqgi.so', output)
        self.assertNotIn('appimagetool', output)

    def test_installer_requires_compiler_before_staging(self):
        self.manifest({'target': 'win-nsis', 'windows': {'nsis': 'sqgipkg-nonexistent-makensis'}})
        self.assertIn('requires makensis', self.run_pkg('build', ok=False))
        self.assertFalse(any(self.root.glob('dist*')))

    @unittest.skipUnless(shutil.which('makensis'), 'NSIS required')
    def test_nsis_compiles_payload_with_spaces(self):
        output_dir = self.root / 'installer output'
        payload = output_dir / 'App with spaces'
        (payload / 'nested directory').mkdir(parents=True)
        (payload / 'App with spaces.bat').write_text('@echo hello\n')
        (payload / 'nested directory/data.txt').write_text('packaged data\n')
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/windows/nsis.nut').as_posix())
        self.run_script(f'''
local Nsis = import({module})
local n = Nsis.SqgiPkgWindowsNsis()
local opts = n.new_options()
opts.name = "App with spaces"
opts.output_dir = "installer output"
opts.windows.console = true
n.write_nsis_script(opts, "installer output/App with spaces")
''')
        script = output_dir / 'App with spaces.nsi'
        self.assertIn(f'File /r "App with spaces{os.sep}*"', script.read_text(encoding='utf8'))
        result = subprocess.run([shutil.which('makensis'), script.name], cwd=output_dir,
                                text=True, capture_output=True, timeout=90)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertTrue((output_dir / 'App with spaces-Setup.exe').is_file())

    def test_duplicate_recipe_names(self):
        self.manifest({"schema_version": 2, "native": [{"dir": "one", "name": "same"}, {"dir": "two", "name": "same"}]})
        self.assertIn("duplicate native recipe name", self.run_pkg("explain", ok=False))

    def test_platform_respects_directory_format(self):
        self.manifest({'schema_version': 2, 'platforms': {'windows': {'format': 'directory'}}})
        for option in [('\u002d\u002dplatform', 'windows'), ('--platform=windows',)]:
            self.assertIn('win-dir', self.run_pkg('explain', *option))
        self.assertIn('win-nsis', self.run_pkg('explain', '--target', 'win-nsis'))

    def test_clean_refuses_project_root(self):
        self.manifest({'output': '.'})
        self.assertIn('refusing to clean the project root', self.run_pkg('clean', ok=False))
        self.assertTrue((self.root / 'main.nut').is_file())

    @unittest.skipUnless(shutil.which('git'), 'Git required')
    def test_source_lock_pins_advancing_branch(self):
        repo = self.root / 'upstream'
        repo.mkdir()
        def git(*args):
            return subprocess.check_output(['git', '-C', str(repo), *args], text=True).strip()
        git('init', '-q')
        git('config', 'user.email', 'test@example.invalid')
        git('config', 'user.name', 'Test')
        (repo / 'source').write_text('first')
        git('add', '.')
        git('commit', '-qm', 'first')
        first = git('rev-parse', 'HEAD')
        self.manifest({'schema_version': 2, 'native': [{'name': 'dep', 'repo': str(repo)}]})
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        setup = f'''local Build = import({module})
local b = Build.SqgiPkgBuild()
local opts = b.new_options()
opts.manifest = "sqgipkg.json"
b.apply_manifest(opts)
b.apply_project_defaults(opts)
b.mkdir_p(opts.output_dir)
b.write_file("artifact", "package")
'''
        self.run_script(setup + '''
opts.write_lock = true
b.begin_inputs(opts)
b.ensure_git_native_project(opts.native_projects[0], "dependency")
b.finish_inputs(opts, "artifact")
''')
        (repo / 'source').write_text('second')
        git('commit', '-qam', 'second')
        shutil.rmtree(self.root / '.sqgipkg/native/dep', onerror=lambda fn, path, exc: (os.chmod(path, 0o777), fn(path)))
        self.run_script(setup + '''
opts.locked = true
b.begin_inputs(opts)
b.ensure_git_native_project(opts.native_projects[0], "dependency")
b.finish_inputs(opts, "artifact")
''')
        checked_out = subprocess.check_output(['git', '-C', str(self.root / '.sqgipkg/native/dep'), 'rev-parse', 'HEAD'], text=True).strip()
        self.assertEqual(checked_out, first)

    def test_explain_is_read_only(self):
        self.manifest({'schema_version': 2, 'runtime': {'sqgi': 'test-ref'}, 'features': ['gtk4'],
                       'native': [{'name': 'example', 'repo': 'https://invalid.example/library.git'}]})
        output = self.run_pkg('explain')
        self.assertIn('CMake recipe', output)
        self.assertIn('example (meson)', output)
        self.assertFalse((self.root / '.sqgipkg').exists())
        self.assertFalse(any(self.root.glob('dist*')))

    def test_local_runtime_source_without_revision(self):
        # Keep the source fixture on the same volume as the manifest. Windows
        # CI checks out on D: while TemporaryDirectory commonly lives on C:.
        source = self.root / 'local runtime source'
        source.mkdir()
        shutil.copyfile(ROOT / 'CMakeLists.txt', source / 'CMakeLists.txt')
        self.check_local_runtime_source(os.path.relpath(source, self.root), source)

    def check_local_runtime_source(self, declared_source, source):
        self.manifest({'schema_version': 2, 'runtime': {'source': declared_source},
                       'target': 'win-dir' if os.name == 'nt' else 'appimage'})
        plan = json.loads(self.run_pkg('explain', '--json'))
        self.assertTrue(plan['ok'])
        runtime = plan['configurations'][0]['runtime']
        self.assertTrue(runtime['recipe'])
        configure = runtime['commands'][0]
        # Windows TEMP can contain RUNNER~1 while Python/GLib return the long
        # spelling. Compare identity, not one normalized and one raw string.
        actual = Path(configure[configure.index('-S') + 1])
        self.assertTrue(actual.samefile(source), f'{actual} does not identify {source}')
        self.assertIn('-DSQGI_ENABLE_KERNELS=ON', configure)
        self.assertIn('-DSQ_ENABLE_JIT=ON', configure)
        self.run_pkg('check')

    def test_local_runtime_source_alias(self):
        source = self.root / 'runtime source with a long name'
        source.mkdir()
        shutil.copyfile(ROOT / 'CMakeLists.txt', source / 'CMakeLists.txt')
        if os.name == 'nt':
            from ctypes import wintypes
            short_path = ctypes.WinDLL('kernel32', use_last_error=True).GetShortPathNameW
            short_path.argtypes = [wintypes.LPCWSTR, wintypes.LPWSTR, wintypes.DWORD]
            short_path.restype = wintypes.DWORD
            size = short_path(str(source), None, 0)
            if not size:
                raise ctypes.WinError(ctypes.get_last_error())
            buffer = ctypes.create_unicode_buffer(size)
            length = short_path(str(source), buffer, size)
            if not length or length >= size:
                raise ctypes.WinError(ctypes.get_last_error())
            alias = Path(buffer.value)
            if alias == source:
                self.skipTest('This Windows volume does not create 8.3 aliases')
        else:
            alias = self.root / 'source alias'
            alias.symlink_to(source, target_is_directory=True)
        self.assertNotEqual(str(alias), str(source))
        self.assertTrue(alias.samefile(source))
        self.check_local_runtime_source(str(alias), source)
        # A different directory must not be accepted simply because its leaf
        # name matches. Exercise the identity assertion's negative case too.
        other = self.root / 'other' / source.name
        other.mkdir(parents=True)
        with self.assertRaises(AssertionError):
            self.check_local_runtime_source(str(alias), other)
        self.assertFalse((self.root / '.sqgipkg').exists())

    def test_runtime_requires_a_usable_source_selection(self):
        for runtime in [{}, {'jit': True}, {'source': ''}, {'sqgi': ''}]:
            with self.subTest(runtime=runtime):
                self.manifest({'schema_version': 2, 'runtime': runtime})
                self.assertIn('runtime', self.run_pkg('explain', ok=False))

    @unittest.skipIf(os.name == 'nt', 'Linux repository preparation uses POSIX tools')
    @unittest.skipUnless(shutil.which('xz') and shutil.which('gzip'), 'index decompressors required')
    def test_repository_refresh_downloads_each_index_once(self):
        archive = self.root / 'fixture.xz'
        archive.write_bytes(lzma.compress(b'Package: fixture\nArchitecture: amd64\n\n'))
        fetcher = self.root / 'fetch.py'
        fetcher.write_text('''import pathlib, shutil, sys
root = pathlib.Path(__file__).parent
with (root / 'downloads.txt').open('a') as log:
    log.write(sys.argv[1] + '\\n')
if 'missing' in sys.argv[1]:
    raise SystemExit(1)
shutil.copyfile(root / 'fixture.xz', sys.argv[2])
''')
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/linux_deps.nut').as_posix())
        self.run_script(f'''
local Linux = import({module})
class Fixture extends Linux.SqgiPkgLinuxDeps {{
    function linux_repo_index_cache(opts) {{ return {json.dumps(str(self.root / 'indexes'))} }}
    function downloader_command(url, output) {{
        return this.shell_quote({json.dumps(sys.executable)}) + " " +
            this.shell_quote({json.dumps(str(fetcher))}) + " " + this.shell_quote(url) + " " + this.shell_quote(output)
    }}
}}
local fixture = Fixture(), opts = fixture.new_options()
opts.linux.deb.refresh = true
local target = {{ uri = "https://fixture.invalid", suite = "test", component = "main", arch = "amd64" }}
local first = fixture.linux_repo_index_file(opts, target)
if (first == null) throw "index was not downloaded"
for (local i = 0; i < 4; i++)
    if (fixture.linux_repo_index_file(opts, target) != first) throw "index cache changed"
opts.linux.deb.refresh = false
if (fixture.linux_repo_index_file(opts, target) != first) throw "disk cache changed"
opts.linux.deb.refresh = true
target.arch = "arm64"
if (fixture.linux_repo_index_file(opts, target) == first) throw "architecture indexes mixed"
target.component = "missing"
for (local i = 0; i < 3; i++)
    if (fixture.linux_repo_index_file(opts, target) != null) throw "missing index returned a path"
local next_run = Fixture()
target.component = "main"; target.arch = "amd64"
if (next_run.linux_repo_index_file(opts, target) == null) throw "new run did not refresh"
''')
        downloads = (self.root / 'downloads.txt').read_text().splitlines()
        self.assertEqual(len(downloads), 5, downloads)
        self.assertEqual(sum('/main/binary-amd64/' in u for u in downloads), 2)
        self.assertEqual(sum('/main/binary-arm64/' in u for u in downloads), 1)
        self.assertEqual(sum('/missing/' in u for u in downloads), 2)

    def test_recipe_private_sysroot_defaults(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/manifest.nut').as_posix())
        self.run_script(f'''
local M = import({module}), pkg = M.SqgiPkgManifest()
local project_dir = {json.dumps(self.root.as_posix())}
foreach (recipe in [{{ runtime = {{ source = "sqgi" }} }}, {{ native = [{{ dir = "native", build_system = "meson" }}] }}]) {{
    local opts = pkg.new_options()
    pkg.apply_manifest_data(opts, recipe, project_dir)
    if (!opts.linux.deb.download || opts.linux.deb.suite != "noble") throw "recipe lacks private sysroot default"
    local explicit = clone recipe; explicit.linux <- {{ deb = {{ download = false, suite = "jammy" }} }}
    opts = pkg.new_options(); pkg.apply_manifest_data(opts, explicit, project_dir)
    if (opts.linux.deb.download || opts.linux.deb.suite != "jammy") throw "manifest opt-out lost"
    opts = pkg.new_options(); opts.linux.deb.download_forced = false
    pkg.apply_manifest_data(opts, recipe, project_dir)
    if (opts.linux.deb.download) throw "CLI opt-out lost"
}}
local legacy = pkg.new_options(); pkg.apply_manifest_data(legacy, {{ entry = "main.nut" }}, project_dir)
if (legacy.linux.deb.download) throw "legacy default changed"
''')

    @unittest.skipIf(os.name == 'nt', 'Linux sysroot preparation uses POSIX tools')
    def test_refreshed_sysroot_packages_are_installed(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/linux_deps.nut').as_posix())
        self.run_script(f'''
local Linux = import({module}), GLib = import("GLib")
class Fixture extends Linux.SqgiPkgLinuxDeps {{
    extracted = 0
    selected = "fixture_1_amd64.deb"
    function linux_deb_archive_metadata(opts, name) {{ return {{ basename = selected }} }}
    function linux_deb_sysroot_seed_packages(opts) {{ return ["fixture:amd64"] }}
    function resolve_linux_deb_packages(opts, seeds) {{ return seeds }}
    function ensure_linux_sysroot_compat_links(opts) {{}}
    function extract_linux_deb_to_sysroot(opts, name) {{
        extracted++
        local dir = this.linux_deb_sysroot_package_metadata(opts, name)
        this.mkdir_p(dir)
        this.write_file(GLib.build_filenamev([dir, "files"]), "/usr/lib/libfixture.so\\n")
        this.write_file(GLib.build_filenamev([dir, "archive"]), selected + "\\n")
    }}
}}
local pkg = Fixture(), opts = pkg.new_options()
opts.linux.sysroot = {json.dumps((self.root / 'sysroot').as_posix())}
opts.linux.deb.download = true; opts.linux.deb.refresh = true; opts.appimage_arch = "x86_64"
if (pkg.linux_deb_sysroot_package_installed(opts, "fixture:amd64")) throw "missing package accepted"
pkg.ensure_linux_deb_sysroot_packages(opts)
if (!pkg.linux_deb_sysroot_package_installed(opts, "fixture:amd64")) throw "refreshed package still missing"
if (pkg.extracted != 1) throw "initial extraction missing"
opts.linux.deb.refresh = false; pkg.ensure_linux_deb_sysroot_packages(opts)
if (pkg.extracted != 1) throw "current extraction not reused"
opts.linux.deb.refresh = true; pkg.ensure_linux_deb_sysroot_packages(opts)
if (pkg.extracted != 2) throw "refresh did not force extraction"
opts.linux.deb.refresh = false; opts.locked = true; pkg.ensure_linux_deb_sysroot_packages(opts)
if (pkg.extracted != 3) throw "locked preparation did not re-extract"
opts.locked = false; pkg.selected = "fixture_2_amd64.deb"
if (pkg.linux_deb_sysroot_package_installed(opts, "fixture:amd64")) throw "old archive accepted"
pkg.ensure_linux_deb_sysroot_packages(opts)
if (pkg.extracted != 4 || !pkg.linux_deb_sysroot_package_installed(opts, "fixture:amd64")) throw "new archive not recognized"
''')

    def test_native_entry_gi_development_dependencies(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local R = import({module})
class Fixture extends R.SqgiPkgBuild {{
    function linux_deb_package_available(opts, name) {{ return true }}
}}
local pkg = Fixture()
foreach (arch in ["x86_64", "aarch64"]) {{
    local opts = pkg.new_options()
    pkg.apply_manifest_data(opts, {{schema_version=2, entry={{type="native", project="app", executable="app"}},
        native=[{{name="dep", dir=".", build_system="meson", gi={{namespace="GSerial", version="1.0", library="gserial-1.0", strategy="host"}}}},
                {{name="app", dir=".", build_system="meson"}}]}}, {json.dumps(self.root.as_posix())})
    opts.target = "appimage"; opts.appimage_arch = arch
    local expected = "libgirepository1.0-dev:" + (arch == "aarch64" ? "arm64" : "amd64")
    if (pkg.linux_deb_sysroot_seed_packages(opts).find(expected) == null) throw "native GI target development seed missing"
    opts.native_projects[0].gi = null
    if (pkg.linux_required_pkg_config_modules(opts).find("gobject-introspection-1.0") != null) throw "non-GI native entry acquired introspection"
}}
''')

    def test_source_runtime_llvm_and_base_gi_dependencies(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local R = import({module}), GLib = import("GLib")
class Fixture extends R.SqgiPkgBuild {{
    function linux_deb_package_available(opts, name) {{ return true }}
}}
local pkg = Fixture()
foreach (arch in ["x86_64", "aarch64"]) {{
    local opts = pkg.new_options()
    opts.target = "appimage"; opts.appimage_arch = arch
    opts.linux.sysroot = {json.dumps((self.root / 'sysroot').as_posix())}
    opts.linux.deb.download = true; opts.runtime_recipe = true
    foreach (jit in [true, false]) {{
        opts.runtime_jit = jit
        local seeds = pkg.linux_deb_sysroot_seed_packages(opts)
        local expected = "llvm-18-dev:" + (arch == "aarch64" ? "arm64" : "amd64")
        if (seeds.find(expected) == null) throw "target LLVM seed missing"
        local project = pkg.runtime_project(opts), options = project.options
        if (options.SQGI_LLVM_INCLUDE_DIR != GLib.build_filenamev([opts.linux.sysroot, "usr", "lib", "llvm-18", "include"])) throw "host LLVM headers selected"
        if (options.SQGI_LLVM_LIBRARY != GLib.build_filenamev([opts.linux.sysroot, "usr", "lib", pkg.linux_current_triplet(opts), "libLLVM-18.so"])) throw "host LLVM library selected"
        if (options.SQGI_ENABLE_KERNELS != "ON") throw "kernels disabled"
        local command = pkg.recipe_commands(opts, project, "source")[0]
        if (command.find("-DSQGI_LLVM_INCLUDE_DIR=" + options.SQGI_LLVM_INCLUDE_DIR) == null) throw "cache override missing"
    }}
    pkg.apply_linux_package_defaults(opts); pkg.apply_linux_package_defaults(opts)
    if (opts.linux.deb.packages.len() != 1 || opts.linux.deb.packages[0] != "gir1.2-glib-2.0") throw "base GI missing or duplicated"
    opts.runtime_recipe = false
    if (pkg.linux_deb_sysroot_seed_packages(opts).find("llvm-18-dev:" + pkg.linux_current_deb_arch(opts)) != null) throw "existing runtime needs LLVM development package"
    opts.entry_type = "native"; opts.runtime_recipe = true
    if (pkg.linux_deb_sysroot_seed_packages(opts).find("llvm-18-dev:" + pkg.linux_current_deb_arch(opts)) != null) throw "native entry needs SQGI LLVM"
}}
local explicit = pkg.new_options()
pkg.apply_linux_package_defaults(explicit)
if (explicit.linux.deb.packages.len()) throw "automatic package opt-out ignored"
''')

    @unittest.skipIf(os.name == 'nt', 'Linux executable staging test')
    @unittest.skipUnless(shutil.which('meson') and shutil.which('cc'), 'Meson and C compiler required')
    def test_native_recipe_builds_and_stages_entry(self):
        (self.root / 'meson.build').write_text("project('entry-test', 'c')\nexecutable('hello', 'hello.c')\n")
        (self.root / 'hello.c').write_text('#include <stdio.h>\nint main(void) { puts("native-entry=42"); return 0; }\n')
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''local B = import({module}), pkg = B.SqgiPkgBuild()
local opts = pkg.new_options()
pkg.apply_manifest_data(opts, {{ schema_version = 2, target = "appimage",
    entry = {{ type = "native", project = "app", executable = "hello" }},
    native = [{{ name = "app", dir = ".", build_system = "meson" }}],
    linux = {{ deb = {{ download = false }} }} }}, {json.dumps(self.root.as_posix())})
pkg.apply_project_defaults(opts)
local selected = pkg.selected_configurations(opts)[0]
pkg.run_native_recipe(selected, selected.native_projects[0])
local staged = pkg.copy_linux_native_entry(selected, "payload")
if (staged != "usr/bin/hello") throw "wrong staged entry"
''')
        result = subprocess.run([str(self.root / 'payload/usr/bin/hello')], text=True, capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout.strip(), 'native-entry=42')

    @unittest.skipIf(os.name == 'nt', 'Linux MIME postprocessing')
    @unittest.skipUnless(shutil.which('update-mime-database'), 'MIME generator required')
    def test_packaged_mime_database_generation(self):
        payload = self.root / 'payload'
        source = payload / 'usr/share/mime/packages/study.xml'
        source.parent.mkdir(parents=True)
        source.write_text('''<?xml version="1.0"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
<mime-type type="application/x-sqgi-packaging-study"><comment>Study file</comment>
<magic priority="80"><match type="string" value="SQGI-MIME-STUDY" offset="0"/></magic>
<glob pattern="*.sqgistudy"/></mime-type></mime-info>''')
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''local B = import({module}), pkg = B.SqgiPkgBuild()
pkg.postprocess_extra_files({json.dumps(payload.as_posix())})
class Missing extends B.SqgiPkgBuild {{
    function executable_available(name) {{ return name == "update-mime-database" ? false : base.executable_available(name) }}
}}
local failed = false
try {{ Missing().postprocess_extra_files({json.dumps(payload.as_posix())}) }}
catch (e) {{ failed = e.tostring().find("update-mime-database") != null }}
if (!failed) throw "missing MIME generator was accepted"
foreach (feature in ["gtk", "gdk_pixbuf"]) {{
    local opts = pkg.new_options(); opts.linux.deb.download = true
    opts.report["used_" + feature] = true
    pkg.apply_linux_package_defaults(opts); pkg.apply_linux_package_defaults(opts)
    local count = 0; foreach (name in opts.linux.deb.packages) if (name == "shared-mime-info") count++
    if (count != 1) throw "MIME dependency missing or duplicated"
}}
''')
        self.assertTrue((payload / 'usr/share/mime/mime.cache').is_file())
        probe = self.root / 'mime-probe.nut'
        probe.write_text('local Gio = import("Gio")\nprint(sqgi.json.stringify(Gio.content_type_guess("file.sqgistudy", null)) + "\\n")\n')
        env = dict(os.environ, XDG_DATA_HOME=str(self.root / 'empty'), XDG_DATA_DIRS=str(payload / 'usr/share'))
        result = subprocess.run([str(SQGI), str(probe)], env=env, capture_output=True, text=True, timeout=10)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn('application/x-sqgi-packaging-study', result.stdout)

    @unittest.skipIf(os.name == 'nt', 'Linux package staging')
    def test_package_staging_uses_selected_sysroot_without_shell_probes(self):
        sysroot = self.root / 'sysroot'
        (sysroot / 'etc').mkdir(parents=True)
        (sysroot / 'etc/os-release').write_text('TARGET_ONLY=1\n')
        (sysroot / 'etc/study link').symlink_to('os-release')
        (sysroot / 'etc/directory').mkdir()
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/linux_deps.nut').as_posix())
        self.run_script(f'''
local L = import({module})
class Fixture extends L.SqgiPkgLinuxDeps {{
    function linux_deb_sysroot_package_files(opts, name) {{
        return ["/etc/os-release", "/etc/study link", "/etc/directory", "/etc/hostname", "/usr/share/doc/irrelevant", "/usr/include/irrelevant.h"]
    }}
    function run_shell_status(command) {{
        if (this.starts_with(command, "[ -f ")) throw "per-file shell probe"
        return base.run_shell_status(command)
    }}
}}
local pkg = Fixture(), opts = pkg.new_options()
opts.linux.sysroot = {json.dumps(sysroot.as_posix())}
opts.appimage_arch = "x86_64"
pkg.stage_linux_package(opts, "payload", "fixture")
if (pkg.read_file("payload/usr/etc/os-release") != "TARGET_ONLY=1\\n") throw "host content substituted"
if (pkg.read_file("payload/usr/etc/study link") != "TARGET_ONLY=1\\n") throw "file symlink was not followed"
if (pkg.path_exists("payload/usr/etc/hostname")) throw "missing target file fell back to host"
if (pkg.path_exists("payload/usr/etc/directory")) throw "directory copied as file"
pkg.stage_linux_package(opts, "dependency-payload", "fixture", true)
if (pkg.path_exists("dependency-payload")) throw "unselected dependency paths copied"
''')

    def run_script(self, source):
        path = self.root / 'probe.nut'
        path.write_text(source, encoding='utf8')
        result = subprocess.run([str(SQGI), str(path)], cwd=self.root, text=True, capture_output=True, timeout=90)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        return result.stdout

    def test_kernel_literal_discovery(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/scripts.nut').as_posix())
        fixture = self.root / 'calls.nut'
        fixture.write_text(r'''// sqgi.kernel.load("comment.sqk")
/* sqgi.kernel.load("block.sqk") */
# sqgi.kernel.load("hash.sqk")
local text = "sqgi.kernel.load(\"string.sqk\")"
local verbatim = @"""sqgi.kernel.load(""verbatim.sqk"")"""
sqgi.kernel.load("src/engine/spatial.sqk")
::sqgi . kernel . load ( @"kernels/other.sqk" )
sqgi.kernel.load("src/engine/spatial.sqk")
sqgi.kernel.load("dynamic/" + name)
sqgi.kernel.load(path)
sqgi /* callee */ . kernel . /* member */ load /* call */ (
    /* argument */ "kernels/commented.sqk" /* keep source */ )
sqgi.kernel.load("kernels/line.sqk" // keep source
)
sqgi.kernel.load("kernels/hash.sqk" # keep source
)
sqgi.kernel.load("dynamic/" /* still computed */ + name)
other_sqgi.kernel.load("unrelated.sqk")
other.sqgi.kernel.load("member.sqk")
import("module.nut")
''', encoding='utf8')
        self.run_script(f'''
local p = import({module}).SqgiPkgScripts()
local paths = p.script_kernel_literals({json.dumps(fixture.as_posix())})
assert(paths.len() == 5)
assert(paths[0] == "src/engine/spatial.sqk")
assert(paths[1] == "kernels/other.sqk")
assert(paths[2] == "kernels/commented.sqk")
assert(paths[3] == "kernels/line.sqk")
assert(paths[4] == "kernels/hash.sqk")
local imports = p.script_import_literals({json.dumps(fixture.as_posix())})
assert(imports.len() == 1 && imports[0] == "module.nut")
''')

    def test_packaged_kernel_from_imported_script(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        project = self.root / 'project'
        engine = project / 'src/engine'
        engine.mkdir(parents=True)
        (project / 'sqgipkg.json').write_text(json.dumps({'script': 'src/main.nut'}), encoding='utf8')
        (project / 'src/main.nut').write_text(
            'if (!sqgi.kernel.available) { print("kernel backend unavailable\\n"); return }\n'
            'local m = import("engine/spatial.nut")\n'
            'assert(m.answer() == 42)\nprint("kernel-package=42\\n")\n', encoding='utf8')
        (engine / 'spatial.nut').write_text(
            'return sqgi /* callee */ . kernel . load ( /* argument */\n'
            '    "src/engine/spatial.sqk" /* keep source */ )\n', encoding='utf8')
        kernel = 'export i64 answer() { return 42; }\n'
        (engine / 'spatial.sqk').write_text(kernel, encoding='utf8')
        targets = ('win-dir',) if os.name == 'nt' else ('appimage', 'win-dir')
        for target in targets:
            for compile_scripts in (False, True):
                with self.subTest(target=target, compile_scripts=compile_scripts):
                    stage = self.root / f'{target}-{compile_scripts}'
                    self.run_script(f'''
local p = import({module}).SqgiPkgBuild()
local opts = p.new_options()
opts.manifest = {json.dumps((project / 'sqgipkg.json').as_posix())}
p.apply_manifest(opts)
opts.target = "{target}"
opts.compile_scripts = {str(compile_scripts).lower()}
p.stage_app_scripts(opts, {json.dumps(stage.as_posix())}, {{}})
''')
                    app = stage / ('usr/share/sqgi/app' if target == 'appimage' else 'share/sqgi/app')
                    self.assertEqual((app / 'src/engine/spatial.sqk').read_text(), kernel)
                    self.assertFalse((app / 'src/engine/spatial.sqk.cnut').exists())
                    # Neither the current directory nor the original source tree
                    # can satisfy a load from this relocated payload.
                    hidden = self.root / 'hidden-source'
                    project.rename(hidden)
                    try:
                        env = dict(os.environ, SQGI_APP_SHARE=str(app))
                        result = subprocess.run([str(SQGI), str(app / 'main.nut')],
                                                cwd=self.root, env=env, text=True,
                                                capture_output=True, timeout=90)
                        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                        self.assertTrue('kernel-package=42' in result.stdout or
                                        'kernel backend unavailable' in result.stdout, result.stdout)
                    finally:
                        hidden.rename(project)

    def test_kernel_without_manifest_uses_working_directory(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        target = 'win-dir' if os.name == 'nt' else 'appimage'
        (self.root / 'src').mkdir()
        (self.root / 'kernels').mkdir()
        kernel = 'export i64 answer() { return 42; }\n'
        (self.root / 'kernels/math.sqk').write_text(kernel, encoding='utf8')
        (self.root / 'src/main.nut').write_text(
            'sqgi.kernel.load("kernels/math.sqk" // source in project root\n)\n', encoding='utf8')
        self.run_script(f'''
local p = import({module}).SqgiPkgBuild()
local opts = p.new_options()
opts.script = "src/main.nut"
opts.target = "{target}"
p.stage_app_scripts(opts, "stage", {{}})
''')
        app = 'share/sqgi/app' if target == 'win-dir' else 'usr/share/sqgi/app'
        self.assertEqual((self.root / 'stage' / app / 'kernels/math.sqk').read_text(), kernel)

    def test_missing_kernel_fails_staging(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        (self.root / 'main.nut').write_text('sqgi.kernel.load("missing.sqk")\n', encoding='utf8')
        self.run_script(f'''
local p = import({module}).SqgiPkgBuild()
local opts = p.new_options()
opts.script = {json.dumps((self.root / 'main.nut').as_posix())}
opts.target = "{'win-dir' if os.name == 'nt' else 'appimage'}"
local message = ""
try {{ p.stage_app_scripts(opts, "stage", {{}}) }} catch (e) {{ message = e.tostring() }}
assert(message.find("kernel source not found: missing.sqk") != null, message)
''')

    def test_process_and_files_do_not_require_a_shell(self):
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/core.nut').as_posix())
        # Child arguments contain shell syntax intentionally. It must remain data.
        child = self.root / 'arguments.py'
        child.write_text('import json,sys; print(json.dumps(sys.argv[1:]))', encoding='utf8')
        argv = [sys.executable, str(child), 'a b', '$HOME', '`uname`', "a'b", 'é']
        output = self.run_script(f'''
local Core = import({module})
class NativeHost extends Core.SqgiPkgCore {{ function host_windows() {{ return true }} }}
local c = NativeHost()
local argv = sqgi.json.parse({json.dumps(json.dumps(argv))})
local result = c.process(argv, null, null, true)
if (result.status != 0) throw result.stderr
print(result.stdout)
c.mkdir_p("files")
c.write_file("files/a.txt", "payload")
try {{ c.copy_path("files", "files/nested"); throw "accepted recursive copy" }} catch(e) {{
    if (("" + e).find("cannot copy a directory into itself") == null) throw e
}}
c.copy_path("files", "copied")
if (c.read_file("copied/a.txt") != "payload") throw "copy failed"
if (c.find_files("copied", "*.txt").len() != 1) throw "enumeration failed"
c.remove_tree("copied")
if (c.path_exists("copied")) throw "removal failed"
try {{ c.relative_dest("..\\\\escape"); throw "accepted traversal" }} catch(e) {{
    if (("" + e).find("escapes package root") == null) throw e
}}
''')
        self.assertEqual(json.loads(output), argv[2:])

    def test_unicode_script_path_import_and_argument(self):
        directory = self.root / 'unicode \u00e9 \u4e2d spaces'
        directory.mkdir()
        message = 'argument \u00e9 \u4e2d'
        (directory / 'helper.nut').write_text(
            f'return {{ message = "{message}" }}\n', encoding='utf8')
        script = directory / 'main.nut'
        script.write_text(
            'local helper = import("helper.nut")\n'
            'if (vargv[0] != helper.message) throw "argument encoding mismatch"\n'
            'print("Unicode script and import ran\\n")\n', encoding='utf8')
        result = subprocess.run([str(SQGI), str(script), message], cwd=self.root,
                                text=True, capture_output=True, timeout=90)
        self.assertEqual(result.returncode, 0,
                         f'exit code: {result.returncode}\n{result.stdout}{result.stderr}')
        self.assertIn('Unicode script and import ran', result.stdout)

    def test_missing_script_reports_load_failure(self):
        script = self.root / 'missing.nut'
        result = subprocess.run([str(SQGI), str(script)], cwd=self.root,
                                text=True, capture_output=True, timeout=90)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('sqgi: failed to load script:', result.stderr)
        self.assertIn('missing.nut', result.stderr)

    def test_pe_imports_and_malformed_offsets(self):
        data = bytearray(1024)
        data[:2] = b'MZ'
        def put(offset, value, fmt='<I'):
            struct.pack_into(fmt, data, offset, value)
        put(60, 64)
        data[64:68] = b'PE\0\0'
        put(68, 0x8664, '<H')
        put(70, 1, '<H')
        put(84, 240, '<H')
        put(88, 0x20b, '<H')
        put(148, 512)
        put(196, 16)
        put(208, 0x1000)
        put(212, 40)
        put(340, 0x1000)
        put(344, 512)
        put(348, 512)
        put(524, 0x1080)
        data[640:653] = b'KERNEL32.dll\0'
        (self.root / 'valid.exe').write_bytes(data)
        put(524, 0xfffffff0)
        (self.root / 'broken.exe').write_bytes(data)
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/windows/pe.nut').as_posix())
        core = json.dumps((ROOT / 'tools/sqgipkg_lib/core.nut').as_posix())
        self.run_script(f'''
local pe = import({module})
local c = import({core}).SqgiPkgCore()
local result = pe.inspect(c.read_file("valid.exe"))
if (result.arch != "x86_64" || result.dlls.len() != 1 || result.dlls[0] != "KERNEL32.dll") throw "wrong imports"
try {{ pe.inspect(c.read_file("broken.exe")); throw "accepted bad offset" }}
catch(e) {{ if (("" + e).find("PE RVA") == null) throw e }}
''')

    @unittest.skipUnless(shutil.which('tar'), 'tar required')
    def test_locked_package_replays_archive_and_rejects_corruption(self):
        self.manifest({'schema_version': 2, 'target': 'win-dir'})
        cached = self.root / 'cache/mingw64/packages'
        cached.mkdir(parents=True)
        payload = self.root / 'payload'
        payload.write_text('original')
        with tarfile.open(cached / 'fixture-1.pkg.tar', 'w') as archive:
            archive.add(payload, arcname='mingw64/bin/fixture.dll')
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local Build = import({module})
local b = Build.SqgiPkgBuild()
local opts = b.new_options()
opts.manifest = "sqgipkg.json"
b.apply_manifest(opts)
b.apply_project_defaults(opts)
opts.windows.msys2_root = "sysroot"
opts.windows.package_cache = "cache"
opts.windows.repo_url = "https://invalid.example/mingw64"
opts.windows.download_packages = true
opts.write_lock = true
b.mkdir_p(opts.output_dir)
b.write_file("artifact", "package")
b.begin_inputs(opts)
local entry = {{name="fixture", filename="fixture-1.pkg.tar", depends=[]}}
b.extract_msys2_package(opts, opts.windows.repo_url, entry)
b.finish_inputs(opts, "artifact")
b.write_file("sysroot/mingw64/bin/fixture.dll", "modified extraction")
opts.write_lock = false
opts.locked = true
b.begin_inputs(opts)
b.ensure_msys2_package_list(opts, ["fixture"], false)
if (b.read_file("sysroot/mingw64/bin/fixture.dll") != "original") throw "lock did not restore archive"
b.finish_inputs(opts, "artifact")
b.write_file("cache/mingw64/packages/fixture-1.pkg.tar", "corrupt")
try {{ b.ensure_msys2_package_list(opts, ["fixture"], false); throw "accepted corrupt archive" }}
catch(e) {{ if (("" + e).find("locked input changed") == null) throw e }}
try {{ b.resolve_linux_deb_packages(opts, ["unlocked"]); throw "accepted unlocked package" }}
catch(e) {{ if (("" + e).find("Linux package absent from lock") == null) throw e }}
''')

    def test_lockfile_detects_changed_inputs(self):
        self.manifest({'schema_version': 2, 'target': 'win-dir'})
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local Build = import({module})
local b = Build.SqgiPkgBuild()
local opts = b.new_options()
opts.manifest = "sqgipkg.json"
b.apply_manifest(opts)
b.apply_project_defaults(opts)
opts.write_lock = true
b.mkdir_p(opts.output_dir)
b.write_file("dependency", "original")
b.write_file("artifact", "package")
b.begin_inputs(opts)
b.record_input("dependency", {{sha256 = b.file_sha256("dependency")}})
b.finish_inputs(opts, "artifact")
opts.write_lock = false
opts.locked = true
b.begin_inputs(opts)
b.record_input("dependency", {{sha256 = b.file_sha256("dependency")}})
b.finish_inputs(opts, "artifact")
b.write_file("dependency", "changed")
try {{ b.record_input("dependency", {{sha256 = b.file_sha256("dependency")}}); throw "change accepted" }}
catch(e) {{ if (("" + e).find("locked input changed") == null) throw e }}
''')
        self.assertTrue((self.root / 'sqgipkg.lock.json').is_file())

    @unittest.skipUnless(shutil.which('cmake') and shutil.which('ninja'), 'CMake/Ninja required')
    def test_native_cmake_recipe_builds_a_loadable_library(self):
        native = self.root / 'native'
        native.mkdir()
        (native / 'CMakeLists.txt').write_text('cmake_minimum_required(VERSION 3.16)\nproject(recipe C)\n'
                                            'add_library(answer SHARED answer.c)\n'
                                            'set_target_properties(answer PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS ON)\n')
        (native / 'answer.c').write_text('int answer(void) { return 42; }\n')
        self.manifest({'schema_version': 2, 'native': [{'dir': 'native', 'build_system': 'cmake'}]})
        module = json.dumps((ROOT / 'tools/sqgipkg_lib/build.nut').as_posix())
        self.run_script(f'''
local Build = import({module})
local b = Build.SqgiPkgBuild()
local opts = b.new_options()
opts.manifest = "sqgipkg.json"
b.apply_manifest(opts)
b.apply_project_defaults(opts)
local project = b.host_windows() ? opts.windows.native_projects[0] : opts.native_projects[0]
b.run_native_recipe(opts, project)
if (project.libraries.len() != 1) throw "expected one built library"
''')
        # MinGW uses libanswer.dll; MSVC uses answer.dll.
        matches = list((self.root / '.sqgipkg/build').rglob('*answer.dll' if os.name == 'nt' else 'libanswer.so'))
        self.assertEqual(len(matches), 1, matches)
        library = ctypes.CDLL(str(matches[0]))
        self.assertEqual(library.answer(), 42)
        # Windows locks loaded DLLs; release before TemporaryDirectory cleanup.
        if os.name == 'nt':
            import _ctypes
            _ctypes.FreeLibrary(library._handle)


if __name__ == '__main__':
    unittest.main()
