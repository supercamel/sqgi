#!/usr/bin/env python3
"""Private Linux native-recipe SDK composition; never modify its base sysroot."""
import argparse
import hashlib
import json
import os
import re
from pathlib import Path, PurePosixPath
import shutil
import subprocess
import sys
import tempfile

MARKER = '.sqgipkg-native-sdk.json'


def digest(path):
    with path.open('rb') as stream:
        value = hashlib.sha256()
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            value.update(chunk)
        return value.hexdigest()


def save(root, data):
    temporary = root / (MARKER + '.tmp')
    temporary.write_text(json.dumps(data, indent=2)+'\n')
    temporary.replace(root / MARKER)


def initialize(base, root):
    base = base.resolve(strict=True)
    root = root.absolute()
    if root.is_symlink() or root == base or root.is_relative_to(base) or base.is_relative_to(root):
        raise ValueError('Native SDK must be separate from its base sysroot')
    if root.exists() and not (root / MARKER).is_file():
        raise ValueError('Refusing to replace an unowned native SDK directory')
    root.parent.mkdir(parents=True, exist_ok=True)
    temporary = Path(tempfile.mkdtemp(prefix=root.name+'.new-', dir=root.parent))
    try:
        # Reflinks provide copy-on-write where supported; otherwise copy bytes.
        # Hard links would allow a build tool to mutate the shared base in place.
        subprocess.run(['cp', '-a', '--reflink=auto', str(base) + '/.', str(temporary)], check=True)
        (temporary / MARKER).unlink(missing_ok=True)
        save(temporary, {'base': str(base), 'exports': {}})
        if root.exists():
            shutil.rmtree(root)
        temporary.replace(root)
    finally:
        if temporary.exists():
            shutil.rmtree(temporary)


def export_files(root, owner, installed, fallback=None):
    root = root.resolve(strict=True)
    data = json.loads((root / MARKER).read_text())
    prepared = []
    for source, destination in installed.items():
        source = Path(source)
        target = PurePosixPath(destination)
        if not target.is_absolute() or '..' in target.parts:
            raise ValueError('Invalid native install destination: '+str(target))
        relative = Path(*target.parts[1:])
        if relative.parts[0] != 'usr':
            raise ValueError('Native development exports must install below /usr: '+str(target))
        if not source.is_file() and fallback and source.suffix in ('.vapi', '.deps'):
            matches = list(Path(fallback).rglob(source.name))
            if len(matches) == 1:
                source = matches[0]
        if not source.is_file():
            raise ValueError('Native install output is missing: '+str(source))
        destination = root / relative
        if not destination.parent.resolve().is_relative_to(root):
            raise ValueError('Native export escapes SDK through a directory symlink: '+str(relative))
        checksum = digest(source)
        if destination.exists() or destination.is_symlink():
            if not destination.is_file() or digest(destination) != checksum:
                raise ValueError('Conflicting native SDK export: '+str(relative))
        prepared.append((source, destination, relative, checksum))
    for source, destination, relative, checksum in prepared:
        if not destination.exists():
            destination.parent.mkdir(parents=True, exist_ok=True)
            # Copy to a new inode: never truncate a file hard-linked from the base.
            shutil.copy2(source, destination)
        data['exports'][str(relative)] = {'recipe': owner, 'sha256': checksum}
    save(root, data)
    print(f'sqgipkg: exported {len(prepared)} native development files for {owner}')


def overlay_packages(root, package_root):
    marker = json.loads((package_root / '.sqgipkg-ooblerg.json').read_text())
    installed, adjustments = {}, {}
    with tempfile.TemporaryDirectory(prefix='sqgipkg-ooblerg-pc-') as temporary:
        for entry in marker['packages']:
            for path in entry['files']:
                source = package_root / path
                if source.suffix == '.pc':
                    original = source.read_text()
                    includedir = '${includedir}' if re.search(r'^includedir=', original, re.M) else '${prefix}/include'
                    lines = [re.sub(r'(?<!\S)-Iinclude(?=/|\s|$)', '-I'+includedir, line) if line.startswith('Cflags:') else line
                             for line in original.splitlines(keepends=True)]
                    normalized = ''.join(lines)
                    if normalized != original:
                        destination = Path(temporary) / path
                        destination.parent.mkdir(parents=True, exist_ok=True)
                        destination.write_text(normalized)
                        adjustments[path] = {'source_sha256': digest(source), 'normalized_sha256': digest(destination),
                                             'reason': 'relocate source-relative pkg-config include directory'}
                        source = destination
                installed[str(source)] = '/' + path
        export_files(root, 'ooblerg', installed)
    data = json.loads((root / MARKER).read_text())
    data['ooblerg_adjustments'] = adjustments
    save(root, data)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('action', choices=['init', 'export', 'overlay'])
    p.add_argument('--root', type=Path, required=True)
    p.add_argument('--base', type=Path)
    p.add_argument('--build', type=Path)
    p.add_argument('--system', choices=['meson', 'cmake'])
    p.add_argument('--owner')
    p.add_argument('--host-gi', type=Path)
    p.add_argument('--package-root', type=Path)
    a = p.parse_args()
    if a.action == 'init':
        initialize(a.base, a.root)
    elif a.action == 'overlay':
        overlay_packages(a.root, a.package_root)
    elif a.system == 'meson':
        installed = json.loads(subprocess.check_output(['meson', 'introspect', '--installed', str(a.build)], text=True))
        export_files(a.root, a.owner, installed, a.host_gi)
    else:
        with tempfile.TemporaryDirectory(prefix='sqgipkg-native-install-') as directory:
            env = dict(os.environ, DESTDIR=directory)
            subprocess.run(['cmake', '--install', str(a.build)], env=env, check=True)
            installed = {str(path): '/'+str(path.relative_to(directory)) for path in Path(directory).rglob('*') if path.is_file()}
            export_files(a.root, a.owner, installed)

if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        print('sqgipkg: ' + str(error), file=sys.stderr)
        if 'Conflicting native SDK export' in str(error):
            print('Use a clean Ubuntu SDK (linux.deb_sysroot_cache) or remove the conflicting provider/source selection.', file=sys.stderr)
        raise SystemExit(1)
