#!/usr/bin/env python3
import os
import json
import hashlib
from pathlib import Path
import subprocess
import sys
import tempfile
import re
import time
root = Path(__file__).resolve().parents[3]
runtime = Path(sys.argv[1]).resolve()
screenshots = Path(sys.argv[2]).resolve() if len(sys.argv) > 2 else None
with tempfile.TemporaryDirectory(prefix='sqgi GTK café ') as temp:
    directory = Path(temp)
    for code in ['fr', 'de', 'es']:
        catalogs = directory / 'locale' / code / 'LC_MESSAGES'
        catalogs.mkdir(parents=True)
        (catalogs / ('app.po' if code == 'es' else 'app.mo')).write_bytes(b'catalog fixture')
    (directory / 'sqgipkg.json').write_text(json.dumps({
        'gtk_theme': 'MyTheme', 'files': ['asset=usr/share/asset'],
        'windows': {'gtk_theme': 'WindowsTheme', 'files': ['asset=share/asset']}}))
    cache = directory / 'cache'
    env = dict(os.environ, SQGI_GUI_RUNTIME=str(runtime), GSK_RENDERER='cairo', XDG_CACHE_HOME=str(cache),
               XDG_CONFIG_HOME=str(directory / 'config'), XDG_DATA_HOME=str(directory / 'data'))
    argv = [str(runtime), str(root / 'tools/sqgipkg_gui/tests/appearance.nut'), str(directory)]
    if screenshots:
        screenshots.mkdir(parents=True, exist_ok=True)
        env['GDK_BACKEND'] = 'x11'
        argv.append('capture')
        with subprocess.Popen(argv, env=env, text=True, encoding='utf8', stdout=subprocess.PIPE, stderr=subprocess.PIPE) as child:
            try:
                deadline = time.monotonic() + 90
                while child.poll() is None:
                    if time.monotonic() > deadline:
                        raise TimeoutError('GTK capture timed out')
                    request = directory / 'capture-request'
                    if request.exists():
                        name = request.read_text()
                        title = 'Choose application languages' if name.startswith('language') else 'SQGI Manifest Studio'
                        time.sleep(0.15)  # Let the GTK frame settle while the test waits for acknowledgement.
                        tree = subprocess.check_output(['xwininfo', '-root', '-tree'], text=True)
                        matched = None
                        for line in tree.splitlines():
                            if f'"{title}"' not in line:
                                continue
                            window = re.search(r'0x[0-9a-f]+', line).group()
                            pid = subprocess.check_output(['xprop', '-id', window, '_NET_WM_PID'], text=True)
                            if pid.strip().endswith(f'= {child.pid}'):
                                matched = window
                                break
                        if matched is None:
                            raise RuntimeError('Cannot find the test-owned window for capture')
                        subprocess.run(['import', '-window', matched, str(screenshots / f'{name}.png')], check=True, timeout=10)
                        request.unlink()
                    time.sleep(0.05)
                stdout, stderr = child.communicate(timeout=5)
                result = subprocess.CompletedProcess(argv, child.returncode, stdout, stderr)
            finally:
                if child.poll() is None:
                    child.kill()
                    child.communicate()
    else:
        result = subprocess.run(argv, env=env, text=True, encoding='utf8', capture_output=True, timeout=90)
    print(result.stdout)
    print(result.stderr, file=sys.stderr)
    assert result.returncode == 0, 'GTK contract workflow failed'
    assert 'PASS EDIT-appearance-languages' in result.stdout
