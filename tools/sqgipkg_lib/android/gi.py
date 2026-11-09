#!/usr/bin/env python3
"""Host scanner and target execution adapters for installed Android recipes."""
import json
import os
from pathlib import Path
import re
import shlex
import struct
import subprocess
import sys
import uuid
import xml.etree.ElementTree as ET

from elf import SYSTEM_LIBRARIES
from inspection import Inspection


class Context:
    def __init__(self):
        self.data = json.loads(Path(os.environ['SQGI_ANDROID_CONTEXT']).read_text())
        if self.data.get('schema') != 1:
            raise ValueError('Unsupported Android GI build context')
        self.abi = self.data['abi']
        self.sdk = Path(self.data['sdk']).resolve()
        self.roots = [self.sdk, *[Path(p).resolve() for p in self.data['allowed_roots']]]
        self.readelf = self.data['readelf']
        self.libraries = []
        # Meson/scanner supplies temporary build-tree directories in this var.
        for path in [*filter(None, os.environ.get('LD_LIBRARY_PATH', '').split(os.pathsep)),
                     *self.data['library_dirs'], self.sdk / 'usr/lib']:
            path = self.allowed(path)
            if path not in self.libraries:
                self.libraries.append(path)
        self.gir = self.sdk / 'usr/share/gir-1.0'

    def allowed(self, path):
        path = Path(path).resolve()
        if not any(path.is_relative_to(root) for root in self.roots):
            raise ValueError('Android GI path is outside the permitted target roots: ' + str(path))
        return path

    def elf(self, path):
        path = self.allowed(path)
        with path.open('rb') as stream:
            header = stream.read(20)
        if (len(header) < 20 or header[:6] != b'\x7fELF\x02\x01' or
                struct.unpack_from('<H', header, 18)[0] != {'x86_64': 62, 'arm64-v8a': 183}[self.abi]):
            raise ValueError('Android GI execution requires target ELF: ' + str(path))
        return path

    def include_directory(self, value):
        path = Path(value)
        # Target .pc data variables are /usr paths, unlike sysrooted Cflags.
        if str(path).startswith('/usr/'):
            path = self.sdk / str(path).lstrip('/')
        return self.allowed(path)

    def target_arguments(self, args, option):
        result, directories = [], [self.gir]
        source = iter(args)
        for arg in source:
            if arg == option or arg.startswith(option + '='):
                value = next(source) if arg == option else arg.split('=', 1)[1]
                path = self.include_directory(value)
                result.append(option + '=' + str(path))
                directories.append(path)
            else:
                result.append(arg)
        return result, directories

    def validate_gir_includes(self, args, directories):
        pending, paths = [], []
        source = iter(args)
        for arg in source:
            if arg == '--include' or arg.startswith('--include='):
                pending.append(next(source) if arg == '--include' else arg.split('=', 1)[1])
            elif arg == '--include-uninstalled' or arg.startswith('--include-uninstalled='):
                paths.append(self.allowed(next(source) if arg == '--include-uninstalled' else arg.split('=', 1)[1]))
        seen = set()
        while paths or pending:
            if paths:
                path = paths.pop()
            else:
                name = pending.pop()
                if name in seen:
                    continue
                if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*-[0-9]+(?:\.[0-9]+)*', name):
                    raise ValueError('Invalid GI include identity: ' + name)
                seen.add(name)
                path = next((d / (name + '.gir') for d in directories if (d / (name + '.gir')).is_file()), None)
                if path is None:
                    raise ValueError('Target SDK lacks GIR dependency: ' + name)
            document = ET.parse(self.allowed(path)).getroot()
            pending.extend(i.get('name') + '-' + i.get('version') for i in
                           document.findall('{http://www.gtk.org/introspection/core/1.0}include'))

    def execute(self, binary, arguments):
        binary = self.elf(binary)
        if self.data['runner'] == 'adb':
            return self.execute_adb(binary, arguments)
        runtime = Inspection(self.abi, self.data['inspection_root']).validate()
        runtime.execute(binary, arguments, self.libraries, [self.sdk / 'usr/lib/girepository-1.0'])

    def execute_adb(self, binary, arguments):
        adb = [self.data['adb']]
        if self.data.get('serial'):
            adb += ['-s', self.data['serial']]
        def call(*args, capture=True):
            return subprocess.run([*adb, *map(str, args)], check=True, capture_output=capture, text=True)
        def shell(*args, capture=True):
            return call('shell', shlex.join(map(str, args)), capture=capture)
        abis = shell('getprop', 'ro.product.cpu.abilist').stdout.strip().split(',')
        if not abis or self.abi != abis[0]:
            raise ValueError('ADB GI probes require the device native ABI; APK native translation is not a shell runner. Use qemu for ' + self.abi)
        remote = '/data/local/tmp/sqgipkg-gi-' + uuid.uuid4().hex
        shell('mkdir', '-p', remote + '/lib', remote + '/gir', remote + '/typelib')
        try:
            call('push', binary, remote + '/program')
            shell('chmod', '700', remote + '/program')
            staged = set()
            for directory in self.libraries:
                for library in sorted(directory.glob('*.so*')):
                    if library.is_file() and library.name not in staged:
                        self.elf(library)
                        call('push', library.resolve(), remote + '/lib/' + library.name)
                        staged.add(library.name)
            for typelib in (self.sdk / 'usr/lib/girepository-1.0').glob('*.typelib'):
                call('push', typelib, remote + '/typelib/' + typelib.name)
            translated, output, directories = [], None, [self.gir]
            source = iter(arguments)
            for arg in source:
                if arg in ('--includedir', '--output', '-o'):
                    arg = ('--output' if arg == '-o' else arg) + '=' + next(source)
                if arg.startswith('--includedir='):
                    directories.append(self.include_directory(arg.split('=', 1)[1]))
                    translated.append('--includedir=' + remote + '/gir')
                elif arg.startswith('--introspect-dump='):
                    path, output = arg.split('=', 1)[1].split(',', 1)
                    call('push', self.allowed(path), remote + '/input')
                    self.allowed(output)
                    translated.append('--introspect-dump=' + remote + '/input,' + remote + '/output')
                elif arg.startswith('--output='):
                    output = str(self.allowed(arg.split('=', 1)[1]))
                    translated.append('--output=' + remote + '/output')
                elif arg.endswith('.gir') and Path(arg).is_file():
                    path = self.allowed(arg)
                    call('push', path, remote + '/gir/' + path.name)
                    translated.append(remote + '/gir/' + path.name)
                else:
                    translated.append(arg)
            for directory in reversed(directories):
                for path in directory.glob('*.gir'):
                    call('push', self.allowed(path), remote + '/gir/' + path.name)
            shell('env', 'LD_LIBRARY_PATH=' + remote + '/lib', 'GI_TYPELIB_PATH=' + remote + '/typelib',
                  remote + '/program', *translated, capture=False)
            if output is not None:
                call('pull', remote + '/output', output)
        finally:
            shell('rm', '-rf', remote)


def main():
    context = Context()
    action, args = sys.argv[1], sys.argv[2:]
    if action == 'scan':
        args, directories = context.target_arguments(args, '--add-include-path')
        context.validate_gir_includes(args, directories)
        env = dict(os.environ)
        env.pop('LD_LIBRARY_PATH', None)
        subprocess.run(['/usr/bin/g-ir-scanner', '--use-binary-wrapper=' + context.data['binary_wrapper'],
                        '--use-ldd-wrapper=' + context.data['ldd_wrapper'],
                        '--add-include-path=' + str(context.gir), *args], env=env, check=True)
    elif action == 'compile':
        args, directories = context.target_arguments(args, '--includedir')
        for arg in args:
            if arg.endswith('.gir') and Path(arg).is_file():
                context.validate_gir_includes(['--include-uninstalled=' + arg], directories)
        context.execute(context.sdk / 'usr/bin/g-ir-compiler', ['--includedir=' + str(context.gir), *args])
    elif action == 'exec':
        context.execute(args[0], args[1:])
    elif action == 'ldd':
        pending, seen = [context.elf(args[0])], set()
        while pending:
            path = pending.pop()
            dynamic = subprocess.check_output([context.readelf, '-d', path], text=True)
            for name in re.findall(r'\(NEEDED\).*\[(.*?)\]', dynamic):
                if name in seen:
                    continue
                seen.add(name); print(name)
                if name in SYSTEM_LIBRARIES:
                    continue
                library = next((d / name for d in context.libraries if (d / name).is_file()), None)
                if library is None or name == 'libz.so':
                    raise ValueError('Missing/non-pinned Android GI library: ' + name)
                pending.append(context.elf(library))
    else:
        raise ValueError('Unknown Android GI adapter action')


if __name__ == '__main__':
    try:
        main()
    except (OSError, ValueError, KeyError, ET.ParseError, subprocess.SubprocessError) as error:
        print('sqgipkg Android GI: ' + str(error), file=sys.stderr)
        sys.exit(1)
