"""Execute SQGI-generated installers in an isolated Wine prefix."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

FIXTURES = Path(__file__).resolve().parent
SQGI = os.environ.get('SQGI', 'sqgi')


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def win(path):
    return 'Z:' + str(path.absolute()).replace('/', '\\')


@unittest.skipUnless(all(shutil.which(tool) for tool in
                        [SQGI, 'makensis', 'wine', 'x86_64-w64-mingw32-g++']),
                     'SQGI, NSIS, Wine and MinGW required')
class WindowsInstaller(unittest.TestCase):
    def test_install_upgrade_and_uninstall(self):
        with tempfile.TemporaryDirectory(prefix='sqgipkg-installer-') as temporary:
            base = Path(temporary)
            stage = base / 'stage 航 & $'; stage.mkdir()
            (stage / 'assets/empty').mkdir(parents=True)
            records = {}
            for name in ['Installer Test.bat', 'share/app/main.nut',
                         'share/app/$literal and space.txt', 'share/app/$INSTDIR.txt']:
                path = stage / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text('fixture ' + name)
                records[name] = digest(path)
            font = stage / 'share/fonts/InstallerTest.ttf'
            font.parent.mkdir(parents=True); font.write_bytes(b'font fixture')
            records[str(font.relative_to(stage))] = digest(font)
            output = base / 'output'; output.mkdir()
            config = dict(side_by_side=True, version='0.1.0.181', autostart=True,
                          installer_name='first.exe')

            def build(settings, source=stage, compile=True, expected=0):
                manifest = base / 'nsis.json'; manifest.write_text(json.dumps(settings))
                command = [SQGI, str(FIXTURES / 'windows_installer_build.nut'),
                           str(source), str(output), str(manifest)]
                if not compile:
                    command.append('--script-only')
                result = subprocess.run(command, capture_output=True, text=True, timeout=90)
                self.assertEqual(result.returncode, expected, result.stdout + result.stderr)
                return result

            build(config)
            first_script = (output / 'Installer Test.nsi').read_text()
            self.assertIn('0.1.0.181-', first_script)
            build(dict(config, version='0.1.0.182', installer_name='second.exe'))
            second_script = (output / 'Installer Test.nsi').read_text()
            self.assertNotEqual(first_script, second_script)

            # Unsafe or ambiguous Windows filenames fail before compilation.
            invalid = base / 'invalid'; invalid.mkdir()
            for name in ['CON.txt', 'bad?.txt', 'trailing.', 'Uninstall.exe']:
                bad = invalid / name; bad.write_text('not a Windows payload')
                build(config, invalid, compile=False, expected=1)
                bad.unlink()
            (invalid / 'Name.txt').write_text('one')
            (invalid / 'name.txt').write_text('two')
            build(config, invalid, compile=False, expected=1)
            build(dict(config, side_by_side='yes'), compile=False, expected=1)
            build(dict(config, version='../invalid'), compile=False, expected=1)

            env = {k: v for k, v in os.environ.items() if not k.startswith(
                ('WINE', 'GI_', 'GIO_', 'GTK_', 'GDK_', 'GST_', 'SQGI', 'LD_LIBRARY'))}
            env.update(WINEPREFIX=str(base / 'wine'), WINEARCH='win64', WINEDEBUG='-all',
                       WINEDLLOVERRIDES='mscoree,mshtml,winemenubuilder.exe=')
            runner = base / 'runner.exe'
            subprocess.run(['x86_64-w64-mingw32-g++', '-std=c++17', '-municode', '-static',
                            '-O2', str(FIXTURES / 'windows_installer_runner.cpp'), '-o', str(runner)],
                           check=True, timeout=30)
            log_path = base / 'wine.log'
            with log_path.open('w') as log:
                def run(arguments, expected=0):
                    result = subprocess.run(arguments, env=env, stdout=log,
                                            stderr=subprocess.STDOUT, timeout=75)
                    self.assertEqual(result.returncode, expected,
                                     str(arguments) + '\n' + log_path.read_text(errors='replace'))

                try:
                    run(['wineboot', '-i'])
                    # Wine can link Desktop to the host user's real desktop.
                    # Keep every shortcut inside this test's temporary prefix.
                    for user in (base / 'wine/drive_c/users').iterdir():
                        desktop = user / 'Desktop'
                        if desktop.is_symlink():
                            desktop.unlink()
                            desktop.mkdir()
                    occupied = base / 'occupied'; occupied.mkdir()
                    (occupied / 'user.txt').write_text('KEEP')
                    first = output / 'first.exe'; second = output / 'second.exe'
                    run(['wine', win(runner), win(first), 'install', win(occupied)], 2)
                    self.assertEqual([p.name for p in occupied.iterdir()], ['user.txt'])
                    a = base / 'Installed 航 & $ old'; b = base / 'Installed 航 & $ new'
                    run(['wine', win(runner), win(first), 'install', win(a)])
                    for name, expected in records.items():
                        self.assertEqual(digest(a / name), expected, name)
                    self.assertTrue((a / 'assets/empty').is_dir())
                    (a / 'user-extra.txt').write_text('KEEP EXTRA')
                    (a / 'share/app/user-data.txt').write_text('KEEP NESTED')
                    run(['wine', win(runner), win(second), 'install', win(b)])
                    installed_fonts = list((base / 'wine/drive_c/users').rglob('InstallerTest.ttf'))
                    self.assertEqual(len(installed_fonts), 1)
                    self.assertEqual(installed_fonts[0].read_bytes(), font.read_bytes())
                    shortcuts = {p: p.read_bytes() for p in (base / 'wine/drive_c/users').rglob('*.lnk')
                                 if 'Installer Test' in p.name}
                    self.assertEqual(len(shortcuts), 4, shortcuts.keys())
                    run(['wine', win(runner), win(a / 'Uninstall.exe'), 'uninstall', win(a)])
                    for path, data in shortcuts.items():
                        self.assertEqual(path.read_bytes(), data, path)
                    self.assertTrue((b / 'Installer Test.bat').is_file())
                    self.assertTrue(installed_fonts[0].is_file())
                    self.assertFalse((a / 'share/app/main.nut').exists())
                    self.assertEqual((a / 'user-extra.txt').read_text(), 'KEEP EXTRA')
                    self.assertEqual((a / 'share/app/user-data.txt').read_text(), 'KEEP NESTED')
                    registry = base / 'installed.reg'
                    run(['wine', 'reg', 'export',
                         r'HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall', win(registry), '/y'])
                    registered = registry.read_text(encoding='utf-16')
                    self.assertIn('0.1.0.182', registered)
                    self.assertNotIn('0.1.0.181', registered)
                    run(['wine', win(runner), win(b / 'Uninstall.exe'), 'uninstall', win(b)])
                    self.assertTrue(all(not p.exists() for p in shortcuts))
                    self.assertFalse(installed_fonts[0].exists())
                    self.assertFalse((b / 'share/app/main.nut').exists())
                    self.assertFalse((b / 'assets/empty').exists())
                    self.assertEqual((a / 'user-extra.txt').read_text(), 'KEEP EXTRA')
                    # Ordinary installs also preserve files added by the user.
                    build(dict(installer_name='ordinary.exe', autostart=True))
                    c = base / 'ordinary'
                    run(['wine', win(runner), win(output / 'ordinary.exe'), 'install', win(c)])
                    (c / 'user.txt').write_text('KEEP DEFAULT')
                    run(['wine', win(runner), win(c / 'Uninstall.exe'), 'uninstall', win(c)])
                    self.assertEqual((c / 'user.txt').read_text(), 'KEEP DEFAULT')
                    self.assertFalse((c / 'share/app/main.nut').exists())
                finally:
                    subprocess.run(['wineserver', '-k'], env=env, stdout=log,
                                   stderr=subprocess.STDOUT, timeout=15)


if __name__ == '__main__':
    unittest.main()
