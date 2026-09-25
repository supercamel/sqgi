#!/usr/bin/env python3
import os
from pathlib import Path
import subprocess
import sys
import tempfile
root = Path(__file__).resolve().parents[3]
runtime = Path(sys.argv[1]).resolve()
with tempfile.TemporaryDirectory(prefix='sqgi GTK café ') as temp:
    directory = Path(temp)
    (directory / 'main.nut').write_text('local Gtk = import("Gtk", "4.0")\n', encoding='utf8')
    env = dict(os.environ, SQGI_GUI_RUNTIME=str(runtime), GSK_RENDERER='cairo')
    result = subprocess.run([str(runtime), str(root / 'tools/sqgipkg_gui/tests/gtk.nut'), str(directory)],
                            env=env, text=True, encoding='utf8', capture_output=True, timeout=35)
    print(result.stdout)
    print(result.stderr, file=sys.stderr)
    assert result.returncode == 0, 'GTK contract workflow failed'
    for name in ['guidance', 'structured-values', 'navigation', 'actions', 'feedback']:
        assert 'PASS EDIT-' + name in result.stdout, name
