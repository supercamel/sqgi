"""Create an offline Ooblerg repository for the packaging integration suite.

The PE fixtures exercise inspection/staging only; they are not executable tests.
"""
import argparse
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import struct
import tarfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('project', type=Path)
    parser.add_argument('--cold', action='store_true')
    args = parser.parse_args()
    project = args.project.resolve()
    repository = project / 'repository'
    repository.mkdir(parents=True)
    build = project / 'build-windows-x86_64'
    build.mkdir(exist_ok=True)
    pe = bytearray(256)
    pe[:2] = b'MZ'
    struct.pack_into('<I', pe, 60, 64)
    pe[64:68] = b'PE\0\0'
    struct.pack_into('<H', pe, 68, 0x8664)
    struct.pack_into('<H', pe, 84, 112)
    struct.pack_into('<H', pe, 88, 0x20b)
    for name in ['sqgi.exe', 'libsqgi-0.dll', 'native-entry.exe']:
        (build / name).write_bytes(pe)
    packages = []

    def package(name, files, dependencies=()):
        archive = repository / (name + '.tar.gz')
        with tarfile.open(archive, 'w:gz') as tar:
            for path, content in files.items():
                if isinstance(content, str):
                    content = content.encode()
                entry = tarfile.TarInfo('mingw64/' + path)
                entry.size = len(content)
                tar.addfile(entry, io.BytesIO(content))
        packages.append({'name': name, 'version': '1', 'kind': 'package',
                         'artifact': archive.name, 'dependencies': list(dependencies),
                         'sha256': hashlib.sha256(archive.read_bytes()).hexdigest()})

    package('faketype', {'lib/girepository-1.0/FakeType-1.0.typelib': 'transitive typelib'})
    package('glib', {'bin/libglib-2.0-0.dll': pe,
                    'lib/girepository-1.0/Gio-2.0.typelib': 'gio typelib',
                    'share/glib-2.0/schemas/org.example.gschema.xml': '<schemalist/>'}, ['faketype'])
    package('pango', {'lib/girepository-1.0/Pango-1.0.typelib': 'pango typelib',
                     'lib/girepository-1.0/PangoCairo-1.0.typelib': 'pangocairo typelib'})
    package('gtk4', {'lib/girepository-1.0/Gtk-4.0.typelib': 'gtk typelib'}, ['glib', 'pango'])
    package('fakeglib', {'bin/libfakeglib-0.dll': pe})
    package('fakegtk', {'bin/libfakegtk-0.dll': pe,
                        'share/gtk-4.0/settings.ini': '[Settings]\n'}, ['fakeglib'])
    (repository / 'index.json').write_text(json.dumps({
        'target': 'x86_64-w64-mingw32', 'prefix': '/mingw64', 'packages': packages}))
    if not args.cold:
        module = Path(__file__).resolve().parents[1] / 'sqgipkg_lib/windows/ooblerg.py'
        spec = importlib.util.spec_from_file_location('ooblerg', module)
        provider = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(provider)
        provider.prepare({'repository': repository.as_uri(), 'cache': str(project / 'cache'),
                          'root': str(project / 'ooblerg-sdk'), 'download': True,
                          'refresh': False, 'packages': ['gtk4'], 'build_packages': []})


if __name__ == '__main__':
    main()
