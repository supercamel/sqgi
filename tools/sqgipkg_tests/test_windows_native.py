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
    (project / 'main.nut').write_text('local p = import("helper.nut")\nprint(p.message + "\\n")\n', encoding='utf8')
    (project / 'helper.nut').write_text('return { message = "Windows packaged app ran" }\n', encoding='utf8')
    manifest = {'schema_version': 2, 'name': 'NativeAcceptance', 'target': 'win-dir',
                'windows': {'build_dir': str(exe.parent), 'msys2_root': str(sysroot),
                            'msys2_prefix': prefix, 'download_packages': False, 'console': True}}
    (project / 'sqgipkg.json').write_text(json.dumps(manifest), encoding='utf8')
    def run(argv):
        result = subprocess.run(list(map(str, argv)), cwd=project, text=True, capture_output=True, timeout=300)
        if result.returncode:
            raise AssertionError(f'{argv}\n{result.stdout}\n{result.stderr}')
        return result.stdout
    run([exe, '--help'])
    run([exe, 'check'])
    run([exe, 'build'])
    app = project / 'dist-windows-x86_64/NativeAcceptance'
    # Remove compiler/developer paths before running the produced application.
    environment = dict(os.environ)
    environment['PATH'] = str(Path(os.environ['SystemRoot']) / 'System32')
    for name in ['GI_TYPELIB_PATH', 'SQGI_APP_SHARE', 'PKG_CONFIG_LIBDIR']:
        environment.pop(name, None)
    result = subprocess.run(['cmd.exe', '/d', '/c', 'NativeAcceptance.bat'], cwd=app,
                            env=environment, text=True, capture_output=True, timeout=60)
    assert result.returncode == 0, result.stdout + result.stderr
    assert 'Windows packaged app ran' in result.stdout
    run([exe, 'build', '--target', 'win-nsis'])
    assert (project / 'dist-windows-x86_64/NativeAcceptance-Setup.exe').is_file()
    print('Native Windows staging, execution and installer compilation passed')
