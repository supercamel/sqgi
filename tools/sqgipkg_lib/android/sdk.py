"""Validate an Android SDK independently of its producer checkout or host."""
import json
from pathlib import Path

from common import file_hash, relative
from elf import inspect, SYSTEM_LIBRARIES

DESCRIPTOR = 'sqgi-android-sdk.json'
NDK_REVISION = '28.2.13676358'
TARGETS = {'arm64-v8a': 'aarch64-linux-android', 'x86_64': 'x86_64-linux-android'}


class SDK:
    def __init__(self, location, abi, min_api):
        root = Path(location).resolve()
        if not (root / DESCRIPTOR).is_file():
            root = root / abi
        self.root = root
        path = root / DESCRIPTOR
        self.metadata = json.loads(path.read_text())
        self.sha256 = file_hash(path)
        m = self.metadata
        if not isinstance(m, dict) or m.get('schema') != 1 or m.get('prefix') != 'usr':
            raise ValueError('Unsupported Android SDK descriptor')
        target = m.get('target', {})
        if (not isinstance(target, dict) or abi not in TARGETS or target.get('abi') != abi or
                target.get('triplet') != TARGETS[abi] or target.get('libc') != 'bionic' or
                target.get('baseline') != 'ubuntu-24.04' or target.get('ndk') != NDK_REVISION):
            raise ValueError('Android SDK target/baseline/NDK mismatch for ' + str(abi))
        if type(target.get('min_api')) is not int or target['min_api'] < 31:
            raise ValueError('Invalid Android SDK minimum API')
        if type(min_api) is not int or min_api < target['min_api']:
            raise ValueError('Application minimum API is below the SDK minimum')
        if m.get('wrapper_abi') != 1:
            raise ValueError('Android SDK requires another application wrapper ABI')
        runtime = m.get('runtime', {})
        if not isinstance(runtime, dict) or runtime.get('jit') is not False or runtime.get('kernels') is not False:
            raise ValueError('Unsupported Android SQGI runtime capabilities')
        self.prefix = root / 'usr'
        self.abi = abi

    def validate(self):
        files = self.metadata.get('files')
        if not isinstance(files, dict) or not files:
            raise ValueError('Android SDK has no file inventory')
        actual = {p.relative_to(self.root).as_posix() for p in self.prefix.rglob('*')
                  if p.is_file() or p.is_symlink()}
        if actual != set(files):
            raise ValueError('Android SDK file inventory differs from its descriptor')
        for name, record in files.items():
            if not isinstance(record, dict):
                raise ValueError('Invalid Android SDK file record: ' + name)
            path = self.root / relative(name)
            if not name.startswith('usr/') or not path.resolve().is_relative_to(self.prefix.resolve()):
                raise ValueError('SDK file escapes the target prefix: ' + name)
            if 'link' in record:
                if not path.is_symlink() or str(path.readlink()) != record['link'] or not path.is_file():
                    raise ValueError('SDK link differs from its descriptor: ' + name)
            elif path.is_symlink() or not path.is_file() or file_hash(path) != record.get('sha256'):
                raise ValueError('SDK file differs from its descriptor: ' + name)
            with path.open('rb') as stream:
                is_elf = stream.read(4) == b'\x7fELF'
            if is_elf:
                elf = inspect(path, self.abi, 'readelf')
                for library in elf['needed']:
                    if library not in SYSTEM_LIBRARIES and (library == 'libz.so' or 'usr/lib/' + library not in files):
                        raise ValueError('Missing/non-pinned Android ELF dependency: ' + name + ': ' + library)
        for name in ['lib/libsqgi.so', 'lib/libsqgi-gtk.so', 'lib/libc++_shared.so',
                     'lib/girepository-1.0/Gtk-4.0.typelib']:
            if 'usr/' + name not in files:
                raise ValueError('Android GTK SDK lacks ' + name)
        return self
