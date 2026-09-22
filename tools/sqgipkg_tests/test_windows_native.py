#!/usr/bin/env python3
"""Windows acceptance: native launcher, staging, execution and NSIS compilation."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

if os.name != 'nt':
    raise SystemExit('Run this test on Windows (PowerShell or CMD).')
exe = Path(sys.argv[1]).resolve()
sysroot = Path(sys.argv[2]).resolve()
prefix = sys.argv[3]
with tempfile.TemporaryDirectory(prefix='sqgipkg é spaces-') as temp:
    project = Path(temp)
    (project / 'src').mkdir()
    (project / 'kernels').mkdir()
    (project / 'src/main.nut').write_text(
        'local p = import("helper.nut")\nassert(p.answer() == 42)\n'
        'print("Windows packaged kernel=42\\n")\n', encoding='utf8')
    (project / 'src/helper.nut').write_text(
        'return sqgi.kernel.load("kernels/math.sqk" /* ship this source */)\n', encoding='utf8')
    kernel = 'export i64 answer() { return 42; }\n'
    (project / 'kernels/math.sqk').write_text(kernel, encoding='utf8')
    manifest = {'schema_version': 2, 'name': 'NativeAcceptance', 'target': 'win-dir',
                'script': 'src/main.nut',
                'windows': {'build_dir': str(exe.parent), 'msys2_root': str(sysroot),
                            'msys2_prefix': prefix, 'download_packages': False, 'console': True}}
    (project / 'sqgipkg.json').write_text(json.dumps(manifest), encoding='utf8')
    def run(argv):
        result = subprocess.run(list(map(str, argv)), cwd=project, text=True, capture_output=True, timeout=300)
        if result.returncode:
            raise AssertionError(
                f'{argv}\nexit code: {result.returncode} (0x{result.returncode & 0xffffffff:08X})'
                f'\nstdout:\n{result.stdout}\nstderr:\n{result.stderr}')
        print(result.stdout, end='', flush=True)
        print(result.stderr, end='', file=sys.stderr, flush=True)
        return result.stdout
    run([exe, '--help'])
    run([exe, 'check'])
    run([exe, 'build'])
    app = project / 'dist-windows-x86_64/NativeAcceptance'
    relocated = project / 'relocated package with spaces'
    app.rename(relocated)
    app = relocated
    packaged_kernel = app / 'share/sqgi/app/kernels/math.sqk'
    assert packaged_kernel.read_text(encoding='utf8') == kernel
    # Remove compiler/developer paths before running the produced application.
    environment = dict(os.environ)
    environment['PATH'] = str(Path(os.environ['SystemRoot']) / 'System32')
    for name in ['GI_TYPELIB_PATH', 'SQGI_APP_SHARE', 'PKG_CONFIG_LIBDIR']:
        environment.pop(name, None)
    (project / 'kernels').rename(project / 'hidden kernels')
    try:
        result = subprocess.run(['cmd.exe', '/d', '/c', 'NativeAcceptance.bat'], cwd=app,
                                env=environment, text=True, capture_output=True, timeout=60)
        assert result.returncode == 0, (
            f'{result.args}\ncwd: {app}\n'
            f'exit code: {result.returncode} (0x{result.returncode & 0xffffffff:08X})\n'
            f'stdout:\n{result.stdout}\nstderr:\n{result.stderr}')
        assert 'Windows packaged kernel=42' in result.stdout, (
            f'{result.args}\nstdout:\n{result.stdout}\nstderr:\n{result.stderr}')
        packaged_kernel.unlink()
        result = subprocess.run(['cmd.exe', '/d', '/c', 'NativeAcceptance.bat'], cwd=app,
                                env=environment, text=True, capture_output=True, timeout=60)
        assert result.returncode != 0, result.stdout + result.stderr
        assert 'kernel: cannot open kernels/math.sqk' in result.stdout + result.stderr
    finally:
        (project / 'hidden kernels').rename(project / 'kernels')
    run([exe, 'build', '--target', 'win-nsis'])
    assert (project / 'dist-windows-x86_64/NativeAcceptance-Setup.exe').is_file()
    print('Native Windows kernel packaging, relocation and installer compilation passed')
