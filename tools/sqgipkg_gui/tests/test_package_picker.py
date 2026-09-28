#!/usr/bin/env python3
"""GUI subprocess failure/retry acceptance; use a private headless display."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

runtime = Path(sys.argv[1]).resolve()
test = Path(__file__).with_name('package_picker.nut')
with tempfile.TemporaryDirectory(prefix='sqgipkg-picker-') as directory:
    root = Path(directory)
    wrapper = root / 'catalog-response'
    wrapper.write_text('''#!/usr/bin/env python3
import json, pathlib, sys, time
root = pathlib.Path(__file__).parent
with (root / 'requests.jsonl').open('a') as log:
    log.write(json.dumps(sys.argv[1:]) + '\\n')
assert sys.argv[2:4] == ['packages', '--json'], sys.argv
mode = (root / 'mode').read_text()
if mode == 'error':
    print(json.dumps({'protocol_version': 1, 'ok': False, 'diagnostics': [{'message': 'Fixture catalog connection failed'}]}))
    sys.exit(1)
if mode == 'slow': time.sleep(3)
print(json.dumps({'protocol_version': 1, 'ok': True, 'cached': False, 'packages': [
    {'name': 'gserial', 'version': 'test-1', 'summary': 'Serial ports', 'dependencies': ['glib']},
    {'name': 'gworldscene', 'version': 'test-2', 'summary': 'World scenes', 'dependencies': ['gtk4']}
]}))
''')
    wrapper.chmod(0o700)
    env = dict(os.environ, SQGI_GUI_RUNTIME=str(wrapper), GSK_RENDERER='cairo')
    result = subprocess.run([str(runtime), str(test), directory], env=env,
                            capture_output=True, text=True, timeout=35)
    print(result.stdout)
    print(result.stderr, file=sys.stderr)
    assert result.returncode == 0, 'package picker failure/retry workflow failed'
    assert 'PASS EDIT-package-search-retry' in result.stdout
    assert 'PASS EDIT-package-search-cancel-fetch' in result.stdout
    requests = [json.loads(line) for line in (root / 'requests.jsonl').read_text().splitlines()]
    assert len(requests) == 4, requests
    assert '--refresh-packages' in requests[1], requests
    print('PASS explicit refresh crossed the subprocess boundary')
