#!/usr/bin/env python3
"""Offline CLI/recipe regressions, runnable from PowerShell or a POSIX terminal."""
import ctypes
import json
import os
from pathlib import Path
import shutil
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
        self.root = Path(self.tmp.name)
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

    def test_short_help_and_full_reference(self):
        help_text = self.run_pkg('--help')
        self.assertLess(len(help_text.splitlines()), 32)
        self.assertNotIn('--msys2-package-cache', help_text)
        reference = self.run_pkg('--help-all')
        self.assertIn('--msys2-package-cache', reference)
        self.assertNotIn('all, appdir, tarball', reference)

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
