#!/usr/bin/env python3
"""Compile and run an independent DLL teardown acceptance matrix in private Wine.

Requires an already provisioned study runner and a packaged application folder.
Copies the payload to a new diagnostic directory; never edits the artifact.
This is an opt-in integration regression, not a native Windows result.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['wine-root', 'linux-sysroot', 'prefix', 'appdir', 'diagnostic-dir', 'logs']:
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--name', required=True)
    parser.add_argument('--library', action='append', required=True)
    parser.add_argument('--display-session', type=Path)
    parser.add_argument('--compiler', default='x86_64-w64-mingw32-gcc')
    args = parser.parse_args()
    diagnostic = args.diagnostic_dir.resolve()
    logs = args.logs.resolve()
    logs.mkdir(parents=True, exist_ok=True)
    report = logs / (args.name + '.json')
    if report.exists() or diagnostic.exists():
        parser.error('Choose new diagnostic directory and evidence name')
    for library in args.library:
        if Path(library).name != library or not (args.appdir / 'bin' / library).is_file():
            parser.error('Library must name a DLL in the original payload bin directory')
    compiler = shutil.which(args.compiler)
    if not compiler:
        parser.error('MinGW cross compiler is required')
    fixture = Path(__file__).with_name('dll_teardown.c')
    shutil.copytree(args.appdir.resolve(), diagnostic)
    executable = diagnostic / 'bin' / 'study_dll_teardown.exe'
    if executable.exists():
        parser.error('Probe executable would replace a payload file')
    compile_argv = [compiler, '-Wall', '-Wextra', '-O0', str(fixture), '-o', str(executable)]
    subprocess.run(compile_argv, check=True)
    record = {
        'scope': 'Independent C DLL loading in a diagnostic payload copy under private Wine/QEMU',
        'original_appdir': str(args.appdir.resolve()), 'diagnostic_directory': str(diagnostic),
        'compiler_argv': compile_argv,
        'compiler_version': subprocess.check_output([compiler, '--version'], text=True).splitlines()[0],
        'source_sha256': digest(fixture), 'executable_sha256': digest(executable),
        'library_sha256': {lib: digest(args.appdir / 'bin' / lib) for lib in args.library},
        'cases': [], 'acceptance': 'in_progress',
    }
    report.write_text(json.dumps(record, indent=2) + '\n')
    for index, library in enumerate(args.library):
        for mode in ['exit', 'free']:
            name = f'{args.name}-{index}-{mode}'
            argv = [sys.executable, str(Path(__file__).with_name('wine_probe.py'))]
            for key in ['wine_root', 'linux_sysroot', 'prefix', 'logs']:
                argv += ['--' + key.replace('_', '-'), str(getattr(args, key).resolve())]
            argv += ['--appdir', str(diagnostic), '--name', name, '--native-crt',
                     '--expect', 'DLL LOAD COMPLETE']
            if mode == 'free':
                argv += ['--expect', 'DLL FREE COMPLETE']
            if args.display_session:
                argv += ['--display-session', str(args.display_session.resolve())]
            argv += ['--', r'Z:\app\bin\study_dll_teardown.exe', library]
            if mode == 'free':
                argv += ['free']
            with (logs / (name + '-harness.txt')).open('w') as output:
                result = subprocess.run(argv, stdout=output, stderr=subprocess.STDOUT)
            case = json.loads((logs / (name + '.json')).read_text())
            record['cases'].append({'library': library, 'mode': mode,
                                    'evidence': name + '.json', 'exit_status': case['exit_status'],
                                    'acceptance': case['acceptance'], 'harness_status': result.returncode})
            report.write_text(json.dumps(record, indent=2) + '\n')
            print(library, mode, case['acceptance'], case['exit_status'], flush=True)
    passed = all(case['acceptance'] == 'pass' and case['harness_status'] == 0 for case in record['cases'])
    record['acceptance'] = 'pass' if passed else 'fail'
    report.write_text(json.dumps(record, indent=2) + '\n')
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())
