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
    (directory / 'main.nut').write_text('print("Hello from the test project\\n")\n', encoding='utf8')
    (directory / 'native-app').mkdir()
    (directory / 'native-app/meson.build').write_text("project('native-app', 'c')\n")
    (directory / 'reveal.py').write_text('import pathlib,sys\npathlib.Path(sys.argv[1]).write_text(sys.argv[2])\n')
    cache = directory / 'cache'
    repo = cache / 'sqgipkg/ooblerg' / hashlib.sha256(b'https://ooblerg.xyz/v1').hexdigest()[:20]
    repo.mkdir(parents=True)
    (repo / 'index.json').write_text(json.dumps({'target': 'x86_64-w64-mingw32', 'prefix': '/mingw64', 'packages': [
        {'name': 'gserial', 'version': 'test-1', 'kind': 'meta', 'dependencies': [], 'summary': 'Serial port library', 'description': 'GObject serial port library', 'tags': ['hardware']},
        {'name': 'gworldscene', 'version': 'test-2', 'kind': 'meta', 'dependencies': [], 'summary': '3D world scenes', 'description': 'Render terrain', 'tags': ['graphics']}
    ]}))
    for target in ['x86_64-linux-gnu', 'aarch64-linux-gnu']:
        linux_repo = cache / 'sqgipkg/ooblerg' / hashlib.sha256(('https://ooblerg.xyz/' + target + '/v1').encode()).hexdigest()[:20]
        linux_repo.mkdir(parents=True)
        index = json.loads((repo / 'index.json').read_text())
        index.update(target=target, prefix='/usr')
        (linux_repo / 'index.json').write_text(json.dumps(index))
    env = dict(os.environ, SQGI_GUI_RUNTIME=str(runtime), GSK_RENDERER='cairo', XDG_CACHE_HOME=str(cache),
               XDG_CONFIG_HOME=str(directory / 'config'), XDG_DATA_HOME=str(directory / 'data'))
    argv = [str(runtime), str(root / 'tools/sqgipkg_gui/tests/gtk.nut'), str(directory)]
    if screenshots:
        screenshots.mkdir(parents=True, exist_ok=True)
        env['GDK_BACKEND'] = 'x11'
        argv.append('capture')
        with subprocess.Popen(argv, env=env, text=True, encoding='utf8', stdout=subprocess.PIPE, stderr=subprocess.PIPE) as child:
            try:
                deadline = time.monotonic() + 140
                while child.poll() is None:
                    if time.monotonic() > deadline:
                        raise TimeoutError('GTK capture timed out')
                    request = directory / 'capture-request'
                    if request.exists():
                        name = request.read_text()
                        title = ('Set up your application' if name.startswith('setup-') else
                                 'Create a native module' if name.startswith('native-guide') else
                                 'Build selected packages' if name.startswith('build-') else
                                 'Edit native library' if name.startswith('library-') else
                                 'Find Ooblerg packages' if name.startswith('linux-picker') else 'SQGI Manifest Studio')
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
        result = subprocess.run(argv, env=env, text=True, encoding='utf8', capture_output=True, timeout=140)
    print(result.stdout)
    print(result.stderr, file=sys.stderr)
    assert result.returncode == 0, 'GTK contract workflow failed'
    for name in ['guidance', 'structured-values', 'navigation', 'actions', 'feedback', 'common-tasks', 'review-states', 'runtime-choice', 'native-application', 'native-library', 'script-folders', 'windows-provider', 'package-search', 'linux-package-search']:
        assert 'PASS EDIT-' + name in result.stdout, name

    if (runtime.parent / 'sqgipkg-runner').is_file():
        assert 'PASS JOB-gui-failure-cancel' in result.stdout, 'GUI Build workflow missing'
        assert 'PASS JOB-gui-artifacts' in result.stdout, 'GUI artifact workflow missing'
