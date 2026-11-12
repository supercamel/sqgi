"""Offline provider acceptance, using real archives and a private file repository."""
import hashlib
import importlib.util
import io
import json
import os
import struct
import shutil
import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path
import tarfile
import tempfile
import unittest

spec = importlib.util.spec_from_file_location('ooblerg', Path(__file__).resolve().parents[1] / 'sqgipkg_lib/windows/ooblerg.py')
provider = importlib.util.module_from_spec(spec)
spec.loader.exec_module(provider)

compat_spec = importlib.util.spec_from_file_location('typelib_compat', Path(__file__).resolve().parents[1] / 'sqgipkg_lib/windows/typelib_compat.py')
compat = importlib.util.module_from_spec(compat_spec)
compat_spec.loader.exec_module(compat)


class TypelibCompatibility(unittest.TestCase):
    @unittest.skipUnless(shutil.which('g-ir-compiler'), 'GI compiler required')
    def test_bundled_typelibs_match_checked_in_declarations(self):
        source = Path(provider.__file__).parent
        with tempfile.TemporaryDirectory() as temporary:
            for name in ['freetype2-2.0', 'cairo-1.0']:
                output = Path(temporary) / (name + '.typelib')
                subprocess.run(['g-ir-compiler', str(source / (name + '.gir')), '-o', str(output)],
                               check=True, capture_output=True)
                self.assertEqual(output.read_bytes(), (source / output.name).read_bytes())

    def fixture(self):
        data = bytearray(128)
        data[:16] = b'GOBJ\nMETADATA\r\n\x1a'
        data[16:18] = b'\x04\x00'
        data += compat.OLD + b'\0'
        struct.pack_into('<I', data, 40, len(data))
        struct.pack_into('<I', data, 52, 128)
        return bytes(data)

    def test_preserves_records_and_is_idempotent(self):
        before = self.fixture(); after = compat.corrected(before)
        self.assertEqual(before[:40], after[:40])
        self.assertEqual(before[44:52], after[44:52])
        self.assertEqual(before[56:], after[56:len(before)])
        self.assertEqual(compat.corrected(after), after)
        for bad in [b'', before[:-1], b'bad' + before[3:]]:
            with self.assertRaises(ValueError): compat.corrected(bad)

    def test_rejects_missing_and_wrong_arch_before_writing(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); path = root / 'lib/girepository-1.0/GLib-2.0.typelib'
            path.parent.mkdir(parents=True); before = self.fixture(); path.write_bytes(before)
            with self.assertRaises(FileNotFoundError): compat.stage(root)
            self.assertEqual(path.read_bytes(), before)
            (root / 'bin').mkdir()
            for name in compat.NEW.decode().split(','):
                (root / 'bin' / name).write_bytes(b'MZ' + bytes(62))
            with self.assertRaises(ValueError): compat.stage(root)
            self.assertEqual(path.read_bytes(), before)

    @unittest.skipUnless(shutil.which('g-ir-compiler') and shutil.which('g-ir-generate'), 'GI tools required')
    def test_gi_roundtrip_preserves_metadata(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary); gir = root / 'GLib-2.0.gir'; original = root / 'original.typelib'; changed = root / 'changed.typelib'
            gir.write_text('''<?xml version="1.0"?>
<repository version="1.2" xmlns="http://www.gtk.org/introspection/core/1.0" xmlns:c="http://www.gtk.org/introspection/c/1.0">
<namespace name="GLib" version="2.0" shared-library="libglib-2.0.dll,libgobject-2.0.dll" c:identifier-prefixes="G" c:symbol-prefixes="g">
<constant name="STUDY_VALUE" value="43" c:type="GStudyValue"><type name="gint" c:type="gint"/></constant>
</namespace></repository>''')
            subprocess.run(['g-ir-compiler', str(gir), '-o', str(original)], check=True, capture_output=True)
            changed.write_bytes(compat.corrected(original.read_bytes()))
            trees=[]; names=[]
            for path in [original, changed]:
                tree=ET.fromstring(subprocess.check_output(['g-ir-generate', str(path)]))
                namespace=tree.find('{http://www.gtk.org/introspection/core/1.0}namespace')
                names.append(namespace.attrib.pop('shared-library')); trees.append(ET.tostring(tree))
            self.assertEqual(names, [compat.OLD.decode(), compat.NEW.decode()])
            self.assertEqual(trees[0], trees[1])


class Provider(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.directory = Path(self.tmp.name)
        self.repo = self.directory / 'repository'
        self.repo.mkdir()
        self.entries = []
        self.package('base', {'mingw64/bin/BASE.DLL': b'base', 'mingw64/include/base.h': b'header'})
        self.package('gserial', {'mingw64/bin/gserial.dll': b'serial', 'mingw64/lib/girepository-1.0/GSerial-1.0.typelib': b'gi'}, ['base'])
        self.entries.append({'name': 'all', 'version': '1', 'kind': 'meta', 'dependencies': ['gserial']})
        self.index()
        self.request = {'repository': self.repo.as_uri(), 'cache': str(self.directory / 'cache'),
                        'root': str(self.directory / 'root'), 'download': True, 'refresh': False,
                        'packages': ['all'], 'build_packages': [], 'locked': None}

    def package(self, name, files, dependencies=(), link=None):
        archive = self.repo / (name + '.tar.gz')
        with tarfile.open(archive, 'w:gz') as tar:
            directory = tarfile.TarInfo('.')
            directory.type = tarfile.DIRTYPE
            tar.addfile(directory)
            for path, content in files.items():
                info = tarfile.TarInfo(path)
                info.size = len(content)
                tar.addfile(info, io.BytesIO(content))
            if link:
                info = tarfile.TarInfo('mingw64/link')
                info.type = tarfile.SYMTYPE
                info.linkname = link
                tar.addfile(info)
        self.entries.append({'name': name, 'version': '1', 'kind': 'package', 'artifact': archive.name,
                             'sha256': provider.digest(archive), 'dependencies': list(dependencies)})

    def index(self):
        (self.repo / 'index.json').write_text(json.dumps({'target': provider.TARGET, 'prefix': '/mingw64', 'packages': self.entries}))

    def prepare(self):
        return provider.prepare(self.request)

    def test_dependency_closure_cache_and_lock(self):
        result = self.prepare()
        self.assertEqual(result['runtime_packages'], ['base', 'gserial', 'all'])
        self.assertTrue((Path(self.request['root']) / 'mingw64/include/base.h').is_file())
        self.request['download'] = False
        self.assertEqual(self.prepare(), result)
        self.request['locked'] = result['packages']
        for index in (self.directory / 'cache').rglob('index.json'):
            index.unlink()
        self.assertEqual(self.prepare(), result)

    def test_missing_dependency_and_no_download(self):
        self.request['download'] = False
        with self.assertRaisesRegex(ValueError, 'downloads disabled'):
            self.prepare()
        self.request['download'] = True
        self.request['packages'] = ['absent']
        with self.assertRaisesRegex(ValueError, 'dependency not found: absent'):
            self.prepare()
        self.assertFalse(Path(self.request['root']).exists())

    def test_harfbuzz_missing_freetype_metadata_is_staged_and_locked(self):
        typelib = 'mingw64/lib/girepository-1.0/freetype2-2.0.typelib'
        self.package('harfbuzz', {'mingw64/lib/girepository-1.0/HarfBuzz-0.0.typelib': b'harfbuzz'})
        self.index()
        self.request['packages'] = ['harfbuzz']
        result = self.prepare()
        record = result['packages'][0]
        self.assertIn(typelib, record['files'])
        self.assertEqual(record['compatibility_files'][typelib], provider.digest(Path(self.request['root']) / typelib))
        self.request.update(locked=result['packages'], download=False)
        self.assertEqual(self.prepare(), result)
        self.package('freetype-metadata', {typelib: b'repository-provided'})
        self.index()
        self.request.update(packages=['harfbuzz', 'freetype-metadata'], locked=None, download=True, refresh=True)
        result = self.prepare()
        self.assertEqual((Path(self.request['root']) / typelib).read_bytes(), b'repository-provided')
        self.assertNotIn('compatibility_files', result['packages'][0])

    def test_cairo_opaque_metadata_gets_enums_but_rich_metadata_is_preserved(self):
        gir = 'mingw64/share/gir-1.0/cairo-1.0.gir'
        typelib = 'mingw64/lib/girepository-1.0/cairo-1.0.typelib'
        self.package('cairo', {gir: b'<repository xmlns="http://www.gtk.org/introspection/core/1.0"><namespace name="cairo"><record name="Context"/></namespace></repository>', typelib: b'opaque'})
        self.index()
        self.request['packages'] = ['cairo']
        result = self.prepare()
        root = Path(self.request['root'])
        node = ET.parse(root / gir).find('.//{*}enumeration[@name="Format"]/{*}member[@name="argb32"]')
        self.assertEqual(node.attrib['value'], '0')
        namespace = ET.parse(root / gir).find('{*}namespace')
        self.assertEqual(namespace.attrib['shared-library'], 'libcairo-gobject-2.dll')
        for name in ('Context', 'Surface', 'Pattern', 'Region', 'FontOptions'):
            self.assertEqual(namespace.find('{*}record[@name="' + name + '"]').attrib['foreign'], '1')
        self.assertEqual(result['packages'][0]['compatibility_originals'][typelib], hashlib.sha256(b'opaque').hexdigest())
        self.request.update(locked=result['packages'], download=False)
        self.assertEqual(self.prepare(), result)
        self.entries = []
        self.package('cairo', {gir: (root / gir).read_bytes(), typelib: b'richer repository metadata'})
        self.index()
        self.request.update(locked=None, download=True, refresh=True)
        result = self.prepare()
        self.assertEqual((root / typelib).read_bytes(), b'richer repository metadata')
        self.assertNotIn('compatibility_files', result['packages'][0])

    def test_cairo_missing_metadata_is_staged_and_locked(self):
        gir = 'mingw64/share/gir-1.0/cairo-1.0.gir'
        typelib = 'mingw64/lib/girepository-1.0/cairo-1.0.typelib'
        self.package('cairo', {'mingw64/bin/libcairo-2.dll': b'cairo'})
        self.index()
        self.request['packages'] = ['cairo']
        result = self.prepare()
        root = Path(self.request['root'])
        record = result['packages'][0]
        for relative in [gir, typelib]:
            self.assertIn(relative, record['files'])
            self.assertEqual(record['compatibility_files'][relative], provider.digest(root / relative))
        self.assertEqual(record['compatibility_originals'], {})
        self.request.update(locked=result['packages'], download=False)
        self.assertEqual(self.prepare(), result)
        self.package('cairo-metadata', {typelib: b'repository-provided'})
        self.index()
        self.request.update(packages=['cairo', 'cairo-metadata'], locked=None, download=True, refresh=True)
        result = self.prepare()
        self.assertEqual((root / typelib).read_bytes(), b'repository-provided')
        self.assertNotIn('compatibility_files', result['packages'][0])

    def test_bundled_git_uses_real_executable_instead_of_argument_losing_shim(self):
        shim = 'mingw64/bin/git.exe'
        real = 'mingw64/opt/git/cmd/git.exe'
        self.package('git', {shim: b'shim', real: b'git'})
        self.index()
        self.request['packages'] = ['git']
        result = self.prepare()
        root = Path(self.request['root'])
        self.assertFalse((root / shim).exists())
        self.assertEqual((root / real).read_bytes(), b'git')
        self.assertNotIn(shim, result['packages'][0]['files'])
        self.assertEqual(result['packages'][0]['compatibility_omissions'][shim], hashlib.sha256(b'shim').hexdigest())
        self.request.update(locked=result['packages'], download=False)
        self.assertEqual(self.prepare(), result)

    @unittest.skipUnless(shutil.which('pkg-config'), 'pkg-config required')
    def test_absolute_pkgconfig_paths_relocate_and_replay(self):
        self.package('reloc', {'mingw64/share/pkgconfig/reloc.pc': b'''prefix=/mingw64
exec_prefix=/mingw64
libdir=/mingw64/lib
includedir=/mingw64/include
Name: reloc
Description: absolute prefix regression
Version: 1
Libs: -L${libdir} -lreloc
Cflags: -I${includedir}
'''})
        self.index()
        self.request['packages'] = ['reloc']
        result = self.prepare()
        root = Path(self.request['root'])
        pc = root / 'mingw64/share/pkgconfig/reloc.pc'
        before = pc.read_bytes()
        env = dict(os.environ, PKG_CONFIG_PATH='', PKG_CONFIG_SYSROOT_DIR='',
                   PKG_CONFIG_LIBDIR=str(pc.parent), PKG_CONFIG_ALLOW_SYSTEM_CFLAGS='1')
        output = subprocess.check_output(['pkg-config', '--define-prefix', '--cflags', '--libs', 'reloc'],
                                         env=env, text=True).replace('\\', '/')
        prefix = (root / 'mingw64').as_posix()
        self.assertIn('-I' + prefix + '/include', output)
        self.assertIn('-L' + prefix + '/lib', output)
        self.assertNotIn('-I/mingw64', output)
        self.request.update(locked=result['packages'], download=False)
        self.assertEqual(self.prepare(), result)
        self.assertEqual(pc.read_bytes(), before)

    def test_corrupt_cache_keeps_previous_sysroot(self):
        self.prepare()
        for archive in (self.directory / 'cache').rglob('*.tar.gz'):
            archive.write_bytes(b'corrupt')
        with self.assertRaisesRegex(ValueError, 'checksum mismatch'):
            self.prepare()
        self.assertEqual((Path(self.request['root']) / 'mingw64/bin/BASE.DLL').read_bytes(), b'base')

    def test_foreign_sysroot_is_not_overwritten(self):
        root = Path(self.request['root'])
        root.mkdir()
        (root / 'user-data').write_text('keep')
        with self.assertRaisesRegex(ValueError, 'not owned'):
            self.prepare()
        self.assertEqual((root / 'user-data').read_text(), 'keep')

    def test_unsafe_archives_and_conflicts(self):
        for name, files, link, error in [
            ('traversal', {'mingw64/../../escaped': b'bad'}, None, 'Unsafe'),
            ('linked', {}, '../../outside', 'Unsupported archive'),
            ('collision', {'mingw64/bin/base.dll': b'wrong'}, None, 'Conflicting')]:
            with self.subTest(package=name):
                self.package(name, files, ['base'], link=link)
                self.index()
                self.request.update(packages=[name], refresh=True)
                with self.assertRaisesRegex(ValueError, error):
                    self.prepare()
                self.assertFalse((self.directory / 'escaped').exists())

    def test_catalog_is_metadata_only(self):
        repo = provider.Repository(self.repo.as_uri(), self.directory / 'cache')
        index, cached = repo.index()
        self.assertFalse(cached)
        self.assertIn('gserial', index)
        self.assertTrue(repo.index()[1])
        self.assertFalse(list((self.directory / 'cache').rglob('*.tar.gz')))
        self.assertFalse(Path(self.request['root']).exists())

    def test_malformed_catalog_and_refresh_recovery(self):
        repo = provider.Repository(self.repo.as_uri(), self.directory / 'cache')
        repo.index()
        (repo.cache / 'index.json').write_text('{invalid')
        with self.assertRaisesRegex(ValueError, 'cached Ooblerg catalog cannot be read.*Refresh'):
            repo.index()
        repo.refresh = True
        entries, cached = repo.index()
        self.assertFalse(cached)
        self.assertIn('gserial', entries)
        self.assertFalse(list((self.directory / 'cache').rglob('*.tar.gz')))
        minimal = {'name': 'optional', 'version': '1', 'kind': 'meta'}
        normalized = provider.validate_entry(minimal)
        self.assertEqual(normalized['dependencies'], [])
        self.assertEqual(normalized['tags'], [])
        for patch in [{'name': 42}, {'summary': []}, {'description': {}}, {'tags': 'serial'},
                      {'tags': [False]}, {'dependencies': 'glib'}, {'sha256': 42, 'artifact': 'bad.tar.gz', 'kind': 'package'}]:
            with self.subTest(patch=patch), self.assertRaises(ValueError):
                provider.validate_entry(dict(minimal, **patch))



class LinuxProvider(unittest.TestCase):
    """Reuse the archive fixtures, with explicit Linux target and prefix."""
    package = Provider.package
    prepare = Provider.prepare
    index = Provider.index

    def setUp(self):
        Provider.setUp(self)
        self.entries = []
        self.target = 'aarch64-linux-gnu'
        self.request.update(target=self.target, packages=['gserial'])

    def linux_index(self):
        (self.repo / 'index.json').write_text(json.dumps({'target': self.target, 'prefix': '/usr', 'packages': self.entries}))

    def elf(self, machine=183):
        header = bytearray(64); header[:6] = b'\x7fELF\x02\x01'
        header[18:20] = machine.to_bytes(2, 'little')
        return bytes(header)

    def test_linux_both_targets_and_locked_replay(self):
        for target, machine in [('aarch64-linux-gnu',183),('x86_64-linux-gnu',62)]:
            with self.subTest(target=target):
                self.target = target; self.entries = []
                self.package('gserial', {'usr/lib/libserial.so': self.elf(machine),
                    'usr/lib/pkgconfig/serial.pc': b'Name: serial\nRequires: glib-2.0 >= 2.80, gio-2.0\nRequires.private: epoxy\nLibs.private: -lassimp -lm\n',
                    'usr/share/vala/vapi/serial.vapi': b'namespace Serial {}'})
                self.linux_index()
                self.request.update(target=target, refresh=True, locked=None, download=True)
                result=self.prepare()
                self.assertEqual(result['required_modules'], ['assimp','epoxy','gio-2.0','glib-2.0'])
                self.assertEqual(result['packages'][0]['target'], target)
                self.request.update(locked=result['packages'], download=False, refresh=False)
                self.assertEqual(self.prepare(), result)
                self.request['target'] = 'x86_64-linux-gnu' if machine == 183 else 'aarch64-linux-gnu'
                with self.assertRaisesRegex(ValueError, 'target does not match'): self.prepare()

    def test_linux_wrong_catalog_and_elf_are_rejected(self):
        self.package('gserial', {'usr/lib/libserial.so': self.elf(62)})
        self.linux_index()
        with self.assertRaisesRegex(ValueError, 'Wrong ELF architecture'): self.prepare()
        self.assertFalse(Path(self.request['root']).exists())
        self.request['target']='x86_64-linux-gnu'
        with self.assertRaisesRegex(ValueError, 'repository must target'): self.prepare()

    def test_linux_soname_links_are_materialized_and_unsafe_links_fail(self):
        for link, error in [('libserial.so.1', None), ('../../../../escaped', 'Unsafe'), ('missing.so', 'missing'), ('libserial.so', 'Cyclic')]:
            with self.subTest(link=link):
                self.entries=[]
                self.package('gserial', {'usr/lib/libserial.so.1': self.elf()})
                archive=self.repo/'gserial.tar.gz'
                with tarfile.open(archive,'w:gz') as tar:
                    info=tarfile.TarInfo('usr/lib/libserial.so');info.type=tarfile.SYMTYPE;info.linkname=link;tar.addfile(info)
                    info=tarfile.TarInfo('usr/lib/libserial.so.1');info.size=64;tar.addfile(info,io.BytesIO(self.elf()))
                self.entries[0]['sha256']=provider.digest(archive);self.linux_index();self.request['refresh']=True
                if error:
                    with self.assertRaisesRegex(ValueError,error): self.prepare()
                    self.assertEqual((Path(self.request['root'])/'usr/lib/libserial.so').read_bytes(),self.elf())
                else:
                    self.prepare();path=Path(self.request['root'])/'usr/lib/libserial.so'
                    self.assertTrue(path.is_file());self.assertFalse(path.is_symlink());self.assertEqual(path.read_bytes(),self.elf())

    def test_linux_checksum_and_prefix_are_rejected(self):
        self.package('gserial', {'mingw64/bin/serial.dll': b'MZ'})
        self.linux_index()
        with self.assertRaisesRegex(ValueError, 'outside usr'): self.prepare()
        (self.repo/'gserial.tar.gz').write_bytes(b'corrupt')
        self.request['cache']=str(self.directory/'other-cache')
        with self.assertRaisesRegex(ValueError, 'checksum mismatch'): self.prepare()

if __name__ == '__main__':
    unittest.main()
