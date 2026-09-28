#!/usr/bin/env python3
"""Compile and exercise exactly the native-module source shown in the GUI guide."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--runtime', type=Path, required=True)
p.add_argument('--report', type=Path, required=True)
a = p.parse_args()
assert not a.report.exists(), 'Preserve prior evidence'
runtime = a.runtime.resolve(strict=True)
steps = []
with tempfile.TemporaryDirectory(prefix='sqgi native guide ') as temporary:
    source = Path(temporary)
    def run(argv, env=None):
        result = subprocess.run([str(v) for v in argv], env=env, capture_output=True,
                                text=True, timeout=60)
        steps.append(dict(argv=[str(v) for v in argv], exit_status=result.returncode,
                          stdout=result.stdout, stderr=result.stderr))
        assert result.returncode == 0, steps[-1]
        return result.stdout
    try:
        run([runtime, Path(__file__).with_name('export_native_guide.nut'), source])
        hashes = {f.name: hashlib.sha256(f.read_bytes()).hexdigest() for f in source.iterdir()}
        run(['meson', 'setup', source / 'build', source])
        run(['meson', 'compile', '-C', source / 'build'])
        env = dict(os.environ, LD_LIBRARY_PATH=str(source / 'build'),
                   GI_TYPELIB_PATH=str(source / 'build'))
        output = run([runtime, source / 'main.nut'], env)
        assert 'Native counter passed' in output
        result = dict(acceptance='pass', source_sha256=hashes, steps=steps,
                      scope='Host source-example compilation and GI property/method/signal; not packaged cross-target execution')
    except Exception:
        a.report.write_text(json.dumps(dict(acceptance='fail', steps=steps), indent=2) + '\n')
        raise
    a.report.write_text(json.dumps(result, indent=2) + '\n')
    print('PASS native guide: compiled source, property, method and signal')
