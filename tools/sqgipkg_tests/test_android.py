"""Android target resolution and standalone SDK integrity contracts."""
import copy
import ctypes
import gzip
import io
import json
import os
from pathlib import Path
import subprocess
import shutil
import struct
import sys
import tempfile
import tarfile
import zipfile
import zlib
import xml.etree.ElementTree as ET
from types import SimpleNamespace
import unittest
from unittest import mock

ROOT = Path(__file__).resolve().parents[2]
SQGI = Path(sys.argv.pop(1)).resolve() if len(sys.argv) > 1 else ROOT / 'build/sqgi'
sys.path.insert(0, str(ROOT / 'tools/sqgipkg_lib/android'))
from common import file_hash
from sdk import DESCRIPTOR, NDK_REVISION, SDK
from common import encoded
from packages import resolve
from native import ordered, source_provenance
from elf import remove_build_rpath, inspect
from gi import Context
import modules
from bundle import combine
from payload import seal, verify_artifact, verify_splits
from common import digest, atomic_json


def squirrel_backend(operation, **values):
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json') as request:
        json.dump(dict(operation=operation, **values), request); request.flush()
        process = subprocess.run([SQGI, ROOT / 'tools/sqgipkg_tests/android_backend_test.nut', request.name],
                                 capture_output=True, text=True)
    try:
        result = json.loads(process.stdout)
    except ValueError:
        raise AssertionError(process.stdout + process.stderr)
    if not result['ok']:
        raise ValueError(result['error'])
    if process.returncode:
        raise AssertionError(process.stderr)
    return result['result']


class SquirrelSDK:
    def __init__(self, root, abi, min_api):
        self.arguments = dict(root=str(root), abi=abi, min_api=min_api)
        squirrel_backend('sdk', **self.arguments, validate=False)

    def validate(self):
        squirrel_backend('sdk', **self.arguments, validate=True)
        return self


class SquirrelGIContext:
    def __init__(self):
        self.request = dict(context=json.loads(Path(os.environ['SQGI_ANDROID_CONTEXT']).read_text()),
                            dynamic_paths=os.environ.get('LD_LIBRARY_PATH', ''))
        squirrel_backend('gi-check', **self.request)

    def validate_gir_includes(self, args, directories):
        squirrel_backend('gi-check', **self.request, args=args, directories=list(map(str, directories)))


class AndroidCLI(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / 'main.nut').write_text('print("hello\\n")\n')
        self.manifest = {'schema_version': 2, 'name': 'Android Test',
                         'app_id': 'org.sqgi.test', 'features': ['gtk4'],
                         'platforms': {'android': {'architectures': ['arm64-v8a', 'x86_64']}}}
        self.save()

    def save(self):
        (self.root / 'sqgipkg.json').write_text(json.dumps(self.manifest))

    def run_pkg(self, *args, success=True):
        result = subprocess.run([str(SQGI), str(ROOT / 'tools/sqgipkg'), *args],
                                cwd=self.root, capture_output=True, text=True)
        self.assertEqual(result.returncode == 0, success, result.stdout + result.stderr)
        return json.loads(result.stdout)

    def test_matrix_and_aliases_are_read_only(self):
        before = sorted(self.root.rglob('*'))
        result = self.run_pkg('explain', '--platform', 'android', '--json')
        self.assertEqual([c['architecture'] for c in result['configurations']], ['arm64-v8a', 'x86_64'])
        self.assertTrue(all(c['target'] == 'android-apk' for c in result['configurations']))
        alias = self.run_pkg('explain', '--platform=android', '--arch=aarch64', '--json')
        self.assertEqual(alias['configurations'][0]['architecture'], 'arm64-v8a')
        self.assertEqual(before, sorted(self.root.rglob('*')))

    def test_all_preserves_desktop_and_adds_declared_android(self):
        result = self.run_pkg('explain', '--target', 'all', '--json')
        targets = [c['target'] for c in result['configurations']]
        self.assertEqual(targets.count('android-apk'), 2)
        self.assertIn('appimage', targets)
        self.assertIn('win-nsis', targets)

    def test_enabled_platforms_control_all_but_not_explicit_targets(self):
        self.manifest['platforms'].update(linux={'enabled': False}, windows={'enabled': False})
        self.save()
        result = self.run_pkg('explain', '--target', 'all', '--json')
        self.assertEqual([p['target'] for p in result['configurations']], ['android-apk', 'android-apk'])
        self.manifest['platforms']['android']['enabled'] = False
        self.save()
        result = self.run_pkg('explain', '--target', 'all', '--json', success=False)
        self.assertIn('No platforms', result['diagnostics'][0]['message'])
        self.assertTrue(self.run_pkg('explain', '--platform', 'android', '--json')['ok'])
        self.manifest['platforms']['android']['enabled'] = 'yes'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertEqual(result['diagnostics'][0]['path'], ['platforms', 'android', 'enabled'])

    def test_platform_command_overrides_saved_output_matrix(self):
        self.manifest['target'] = 'all'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json')
        self.assertEqual([p['target'] for p in result['configurations']], ['android-apk', 'android-apk'])
        result = self.run_pkg('explain', '--platform', 'linux', '--arch', 'x86_64', '--json')
        self.assertEqual([p['target'] for p in result['configurations']], ['appimage'])
        result = self.run_pkg('explain', '--platform', 'android', '--target', 'win-dir', '--json', success=False)
        self.assertIn('different platforms', result['diagnostics'][0]['message'])

    def test_android_package_browser_uses_manifest_and_rejects_catalog_mismatch(self):
        repository = self.root/'repository'
        target = 'x86_64-linux-android'
        folder = repository/'android/modules/noble-android-r1/browser-r1'/target/'v1'
        folder.mkdir(parents=True)
        catalog = {'schema': 1, 'target': target, 'prefix': '/usr', 'release': 'browser-r1',
                   'android_module': {'sdk_id': 'noble-android-r1'},
                   'packages': [{'name': 'demo-module', 'version': '1', 'artifact': 'demo.tar.gz', 'sha256': '1'*64}]}
        (folder/'index.json').write_text(json.dumps(catalog))
        self.manifest['platforms']['android'].update(repository=repository.as_uri(), module_set='browser-r1', sdk='noble-android-r1')
        self.save()
        result = self.run_pkg('packages', '--package-target', target, '--json')
        self.assertEqual(result['packages'][0]['name'], 'demo-module')
        self.assertEqual(result['module_set'], 'browser-r1')
        self.assertFalse((self.root/'.sqgipkg').exists())
        self.assertFalse((self.root/'dist-android').exists())
        catalog['release'] = 'wrong-release'
        (folder/'index.json').write_text(json.dumps(catalog))
        result = self.run_pkg('packages', '--package-target', target, '--refresh-packages', '--json', success=False)
        self.assertIn('selected SDK and module release', result['diagnostics'][0]['message'])

    def test_bundle_is_one_output_with_explicit_abi_list(self):
        result = self.run_pkg('explain', '--target', 'android-aab', '--json')
        self.assertEqual(len(result['configurations']), 1)
        config = result['configurations'][0]
        self.assertEqual(config['architecture'], 'multi')
        self.assertEqual(config['architectures'], ['arm64-v8a', 'x86_64'])
        single = self.run_pkg('explain', '--target', 'android-aab', '--arch', 'x86_64', '--json')['configurations'][0]
        self.assertEqual(single['architectures'], ['x86_64'])
        self.assertEqual(single['architecture'], 'x86_64')

    def test_platform_and_format_conflict_is_explicit(self):
        result = self.run_pkg('explain', '--platform', 'android', '--target', 'win-dir', '--json', success=False)
        self.assertIn('different platforms', result['diagnostics'][0]['message'])
        result = self.run_pkg('explain', '--target', 'android-unknown', '--json', success=False)
        self.assertIn('unknown Android target', result['diagnostics'][0]['message'])

    def test_bad_android_fields_fail_before_building(self):
        original = copy.deepcopy(self.manifest)
        for key, value in [('min_sdk', 30), ('min_sdk', '31'), ('architectures', ['x86']),
                           ('architectures', ['aarch64', 'arm64-v8a']),
                           ('namespaces', ['../../secret']), ('version_code', 2100000001),
                           ('format', 'appimage'), ('surprise', True), ('permissions', 'INTERNET'),
                           ('permissions', ['android.permission.INTERNET', 'android.permission.INTERNET']),
                           ('permissions', ['android.permission.INTERNET"/>']), ('icon', '')]:
            with self.subTest(key=key, value=value):
                self.manifest = copy.deepcopy(original)
                self.manifest['platforms']['android'][key] = value
                self.save()
                result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
                self.assertFalse(result['ok'])

    def test_android_icon_override_and_permissions_enter_the_deployment_contract(self):
        common = self.root/'shared.png'; common.write_bytes(b'shared input')
        android = self.root/'android.png'; android.write_bytes(b'android input')
        self.manifest['icon'] = 'shared.png'
        self.manifest['platforms']['android'].update(permissions=['android.permission.INTERNET'])
        self.save()
        def stage():
            return squirrel_backend('project-stage', manifest=str(self.root/'sqgipkg.json'),
                                    target='android-apk', destination=str(self.root/'staged'))['project']
        inherited = stage()
        self.assertEqual(inherited['icon_sha256'], file_hash(common))
        self.assertEqual(inherited['permissions'], ['android.permission.INTERNET', 'android.permission.REORDER_TASKS'])
        self.manifest['platforms']['android']['icon'] = 'android.png'; self.save()
        selected = stage()
        self.assertEqual(selected['icon_sha256'], file_hash(android))
        with self.assertRaisesRegex(ValueError, 'rebuild'):
            squirrel_backend('development-compatible', installed=inherited, current=selected)
        android.write_bytes(b'edited icon')
        with self.assertRaisesRegex(ValueError, 'rebuild'):
            squirrel_backend('development-compatible', installed=selected, current=stage())

    def test_named_android_native_overrides_preserve_shared_desktop_recipes(self):
        self.manifest['native'] = [
            {'name':'library','dir':'native','build_system':'cmake',
             'options':{'SHARED_OPTION':True,'PLATFORM_OPTION':'desktop'},
             'gi':{'namespace':'Fixture','version':'1.0','library':'fixture','strategy':'auto'}},
            {'name':'app','dir':'app','build_system':'cmake','depends_on':['library']}]
        self.manifest['platforms']['android']['native'] = [
            {'name':'library','dir':'android-native','options':{'PLATFORM_OPTION':'android'},'gi':{'strategy':'target'}}]
        self.save()
        plans = self.run_pkg('explain','--target','all','--json')['configurations']
        for plan in plans:
            library = next(p for p in plan['native'] if p['name']=='library')
            if plan['target'].startswith('android-'):
                self.assertEqual(library['dir'],str(self.root/'android-native'))
                self.assertEqual(library['options'],{'SHARED_OPTION':True,'PLATFORM_OPTION':'android'})
                self.assertEqual(library['gi'],{'namespace':'Fixture','version':'1.0','library':'fixture','strategy':'target'})
                self.assertEqual([p['name'] for p in plan['native']],['library','app'])
            else:
                self.assertIn('-DPLATFORM_OPTION=desktop',library['commands'][0])
        self.assertEqual(self.manifest['native'][0]['options']['PLATFORM_OPTION'],'desktop')

    def test_android_only_native_recipe_does_not_enter_desktop_plans(self):
        self.manifest['native'] = [{'name': 'shared', 'dir': 'shared', 'build_system': 'cmake'}]
        self.manifest['platforms']['android']['native'] = [
            {'name': 'worker', 'dir': 'worker', 'depends_on': ['shared'],
             'gi': {'namespace': 'SqWorker', 'version': '1.0', 'library': 'sqgi-worker', 'strategy': 'target'}}]
        self.save()
        plans = self.run_pkg('explain', '--target', 'all', '--json')['configurations']
        for plan in plans:
            names = [p['name'] for p in plan['native']]
            if plan['target'].startswith('android-'):
                self.assertEqual(names, ['shared', 'worker'])
                self.assertEqual(plan['native'][1]['dir'], str(self.root / 'worker'))
                self.assertEqual(plan['native'][1]['build_system'], 'meson')
            else:
                self.assertEqual(names, ['shared'])
        self.manifest['platforms']['android']['native'][0]['depends_on'] = ['missing']
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertIn('missing', result['diagnostics'][0]['message'])

    def test_android_native_override_names_cycles_and_source_aliases(self):
        self.manifest['native'] = [{'name':'module','repo':'https://example.invalid/shared.git','commit':'old','build_system':'cmake'}]
        self.manifest['platforms']['android']['native'] = [{'name':'module','git':'https://example.invalid/android.git','tag':'android-r1'}]
        self.save()
        plan = self.run_pkg('explain','--platform','android','--json')['configurations'][0]
        self.assertEqual(plan['native'][0]['repo'],'https://example.invalid/android.git')
        self.assertEqual(plan['native'][0]['ref'],'android-r1')
        for values,message in [([{'name':'missing'}],'Unknown Android native override'),
                               ([{'name':'module'},{'name':'module'}],'Duplicate Android native override'),
                               ([{'name':'module','commit':'one','tag':'two'}],'Ambiguous Android native source override'),
                               ([{'name':'module','depends_on':['module']}],'cycle'),
                               ([{'options':{}}],'existing recipe name'),
                               ([{'name':'module','future':True}],'unknown field')]:
            with self.subTest(values=values):
                self.manifest['platforms']['android']['native']=values; self.save()
                result=self.run_pkg('explain','--platform','android','--json',success=False)
                self.assertIn(message,result['diagnostics'][0]['message'])


    def test_android_bytecode_is_not_silently_ignored(self):
        self.manifest['compile_scripts'] = True
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertIn('bytecode', result['diagnostics'][0]['message'])

    def test_gstreamer_can_be_provided_by_an_android_module(self):
        (self.root / 'main.nut').write_text('local Gst = import("Gst", "1.0")\n')
        self.manifest['native'] = [{'name': 'gstreamer', 'android_package': 'media-gst-plugins-bad'}]
        self.manifest['platforms']['android']['module_set'] = 'media-r1'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json')
        self.assertTrue(result['ok'])
        for config in result['configurations']:
            self.assertIn('Gst-1.0', config['android']['namespaces'])
            self.assertEqual(config['native'][0]['package'], 'media-gst-plugins-bad')

    def test_libsoup_can_be_provided_by_an_android_module(self):
        (self.root / 'main.nut').write_text('local Soup = import("Soup", "3.0")\n')
        self.manifest['native'] = [{'name': 'soup', 'android_package': 'extras-libsoup3'}]
        self.manifest['platforms']['android']['module_set'] = 'git-extras-r1'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json')
        self.assertTrue(result['ok'])
        self.assertTrue(all(c['target'] == 'android-apk' for c in result['configurations']))

    def test_describe_advertises_android_schema(self):
        result = self.run_pkg('describe', '--json')
        self.assertIn('android-apk', result['targets'])
        self.assertIn('platform_android', result['schema']['$defs'])

    def test_android_source_runtime_selection_is_explicit_and_read_only(self):
        self.manifest['runtime'] = {'source':'runtime-src'}
        self.save(); before = sorted(self.root.rglob('*'))
        result = self.run_pkg('explain', '--platform', 'android', '--json')
        for plan in result['configurations']:
            self.assertTrue(plan['runtime']['recipe'])
            self.assertEqual(plan['runtime']['source'], str(self.root/'runtime-src'))
            self.assertEqual(plan['runtime']['requested'], {'jit':False,'kernels':False})
            self.assertEqual(plan['packages'], ['sqgi-android-sdk'])
        self.assertEqual(before, sorted(self.root.rglob('*')))
        self.manifest['runtime']['jit'] = True; self.save()
        result = self.run_pkg('explain','--platform','android','--json',success=False)
        self.assertEqual(result['diagnostics'][0]['path'], ['runtime','jit'])
        self.manifest['platforms']['android']['runtime']='package'; self.save()
        result=self.run_pkg('explain','--platform','android','--json')
        self.assertFalse(result['configurations'][0]['runtime']['recipe'])
        self.assertIsNone(result['configurations'][0]['runtime']['requested'])
        self.assertEqual(result['configurations'][0]['packages'], ['sqgi-android-runtime'])

    def test_android_source_requires_a_source_selector_and_does_not_change_desktop_defaults(self):
        self.manifest['platforms']['android']['runtime']='source'; self.save()
        result=self.run_pkg('explain','--platform','android','--json',success=False)
        self.assertIn('runtime.source or runtime.sqgi',result['diagnostics'][0]['message'])
        self.manifest['runtime']={'source':'runtime-src'}; self.save()
        plans=self.run_pkg('explain','--target','all','--json')['configurations']
        for plan in plans:
            self.assertTrue(plan['runtime']['recipe'])
            self.assertEqual(plan['runtime']['requested']['jit'], not plan['target'].startswith('android-'))

    def test_device_selection_alias_and_readonly_command_conflicts(self):
        result=self.run_pkg('explain','--platform','android','--serial','emulator-test','--json')
        self.assertTrue(all(c['android']['serial']=='emulator-test' for c in result['configurations']))
        for args, message in [(['explain','--serial','one','--android-serial','two'],'disagree'),
                              (['sync','--platform','android'],'cannot use --json')]:
            result=self.run_pkg(*args,'--json',success=False)
            self.assertIn(message,result['diagnostics'][0]['message'])

    def test_compiler_selection_preserves_platform_defaults(self):
        self.manifest['runtime'] = {'source': 'runtime-src'}
        self.manifest['platforms']['android']['compiler'] = 'llvm'
        self.save()
        before = sorted(self.root.rglob('*'))
        plans = self.run_pkg('explain', '--target', 'all', '--json')['configurations']
        for plan in plans:
            self.assertTrue(plan['runtime']['requested']['jit'])
            self.assertTrue(plan['runtime']['requested']['kernels'])
            if plan['target'].startswith('android-'):
                self.assertIn('compiler-llvm18', plan['packages'])
        self.assertEqual(before, sorted(self.root.rglob('*')))
        self.manifest['runtime']['jit'] = False
        self.save()
        plans = self.run_pkg('explain', '--target', 'all', '--json')['configurations']
        for plan in plans:
            self.assertFalse(plan['runtime']['requested']['jit'])
            self.assertTrue(plan['runtime']['requested']['kernels'])

    def test_compiler_requires_source_and_unified_catalog(self):
        self.manifest['platforms']['android']['compiler'] = 'llvm'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertEqual(result['diagnostics'][0]['path'], ['platforms', 'android', 'compiler'])
        self.manifest['runtime'] = {'source': 'runtime-src'}
        self.manifest['platforms']['android']['module_set'] = 'legacy'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertIn('unified', result['diagnostics'][0]['message'])

    def test_compiler_is_automatically_selected(self):
        self.manifest['runtime'] = {'source': 'runtime-src'}
        self.manifest['platforms']['android'].update(compiler='llvm', packages=['compiler-llvm18'])
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertIn('automatically', result['diagnostics'][0]['message'])

    def test_compiler_enum_and_schema(self):
        schema = self.run_pkg('describe', '--json')['schema']['$defs']['platform_android']
        self.assertEqual(schema['properties']['compiler']['enum'], ['none', 'llvm'])
        self.manifest['platforms']['android']['compiler'] = 'unknown'
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertEqual(result['diagnostics'][0]['path'], ['platforms', 'android', 'compiler'])

    def test_android_native_entry_preserves_desktop_selector(self):
        self.manifest['entry']={'type':'native','project':'application','executable':'desktop-app',
            'android':{'project':'application','library':'libapp.so','symbol':'app_main'}}
        self.manifest['native']=[{'name':'application','dir':'.','build_system':'cmake'}];self.save()
        result=self.run_pkg('explain','--platform','android','--json')
        self.assertTrue(all(c['entry']['symbol']=='app_main' and c['entry_type']=='native' for c in result['configurations']))
        result=self.run_pkg('explain','--platform','linux','--json')
        self.assertTrue(result['configurations'][0]['entry'].endswith('/desktop-app'))
        self.manifest['entry']['android']['project']='missing';self.save()
        result=self.run_pkg('explain','--platform','android','--json',success=False)
        self.assertIn('must name a native recipe',result['diagnostics'][0]['message'])

    def test_cli_repository_and_offline_override_manifest(self):
        self.manifest['platforms']['android'].update(repository='https://example.invalid', download=True)
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--android-repository',
                              'http://127.0.0.1:8787', '--no-android-download', '--json')
        for config in result['configurations']:
            self.assertEqual(config['android']['repository'], 'http://127.0.0.1:8787')
            self.assertFalse(config['android']['download'])

    def test_native_order_and_prebuilt_profile(self):
        self.manifest['native'] = [{'name': 'consumer', 'depends_on': ['base'], 'android_package': 'fixture-consumer'},
                                   {'name': 'base', 'android_package': 'fixture-base'}]
        self.manifest['platforms']['android']['module_set'] = 'fixture-r1'
        self.save()
        config = self.run_pkg('explain', '--platform', 'android', '--arch', 'x86_64', '--json')['configurations'][0]
        self.assertEqual([n['name'] for n in config['native']], ['base', 'consumer'])
        self.assertEqual(config['packages'], ['sqgi-android-sdk'])
        self.assertEqual(config['native'][1]['package'], 'fixture-consumer')
        self.manifest['native'][1]['depends_on'] = ['consumer']
        self.save()
        failed = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertIn('cycle', failed['diagnostics'][0]['message'])

    def test_host_gi_is_rejected_for_android(self):
        self.manifest['native'] = [{'name': 'module', 'gi': {'strategy': 'host', 'namespace': 'Study',
                                                          'version': '1.0', 'library': 'study'}}]
        self.save()
        failed = self.run_pkg('explain', '--platform', 'android', '--json', success=False)
        self.assertIn('host metadata is not portable', failed['diagnostics'][0]['message'])


    def test_sdk_profile_and_additional_packages_are_visible_and_validated(self):
        android = self.manifest['platforms']['android']
        android.update(profile='complete', packages=['gobject-introspection-tools'])
        self.save()
        result = self.run_pkg('explain', '--platform', 'android', '--arch', 'x86_64', '--json')
        plan = result['configurations'][0]
        self.assertEqual(plan['packages'], ['sqgi-android-complete', 'gobject-introspection-tools'])
        for change in [dict(profile='unknown'), dict(packages=['bad/package']), dict(packages=['same', 'same'])]:
            saved = copy.deepcopy(android)
            android.update(change); self.save()
            self.run_pkg('explain', '--platform', 'android', '--json', success=False)
            android.clear(); android.update(saved)


class AndroidJavaExports(unittest.TestCase):
    def test_only_inventoried_sources_are_copied_and_collisions_are_rejected(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary) / 'sdk'
            destination = Path(temporary) / 'java'
            prefix = 'usr/share/sqgi-android/java/'
            relative = 'org/example/Callback.java'
            source = root / prefix / relative
            source.parent.mkdir(parents=True)
            source.write_text('package org.example; public class Callback {}\n')
            (source.parent / 'Untracked.java').write_text('not inventoried')
            sdk = {'root': str(root), 'metadata': {'files': {prefix + relative: {}}}}
            squirrel_backend('native-java', sdk=sdk, destination=str(destination))
            self.assertEqual((destination / relative).read_bytes(), source.read_bytes())
            self.assertFalse((destination / 'org/example/Untracked.java').exists())
            with self.assertRaisesRegex(ValueError, 'conflicts'):
                squirrel_backend('native-java', sdk=sdk, destination=str(destination))
            for invalid in ['org/gtk/Override.java', 'org/sqgi/android/GtkApplication.java', 'org/example/Bytecode.class']:
                with self.subTest(path=invalid):
                    sdk['metadata']['files'] = {prefix + invalid: {}}
                    with self.assertRaisesRegex(ValueError, 'reserved'):
                        squirrel_backend('native-java', sdk=sdk, destination=str(destination))


class AndroidHostInputs(unittest.TestCase):
    def test_relocation_content_symlink_and_mode_identity(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary) / 'tools'
            root.mkdir()
            (root / 'compiler').write_bytes(b'first compiler')
            (root / 'alias').symlink_to('compiler')
            initial = squirrel_backend('host-inputs', roots={'compiler': str(root)})
            relocated = Path(temporary) / 'relocated'
            shutil.copytree(root, relocated, symlinks=True)
            self.assertEqual(initial, squirrel_backend('host-inputs', roots={'compiler': str(relocated)}))
            (relocated / '__pycache__').mkdir()
            (relocated / '__pycache__/generated.pyc').write_bytes(b'cache')
            self.assertEqual(initial, squirrel_backend('host-inputs', roots={'compiler': str(relocated)}))
            (relocated / 'compiler').write_bytes(b'other compiler')
            changed = squirrel_backend('host-inputs', roots={'compiler': str(relocated)})
            self.assertNotEqual(initial['sha256'], changed['sha256'])
            (relocated / 'compiler').chmod(0o755)
            self.assertNotEqual(changed['sha256'], squirrel_backend('host-inputs', roots={'compiler': str(relocated)})['sha256'])

    def test_directory_link_cycle_is_rejected(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / 'loop').symlink_to(root, target_is_directory=True)
            with self.assertRaisesRegex(ValueError, 'Cycle'):
                squirrel_backend('host-inputs', roots={'tools': str(root)})


class AndroidResources(unittest.TestCase):
    def test_native_services_are_private_and_owned(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            declaration = 'usr/share/sqgi-android/services/worker.json'
            java = 'usr/share/sqgi-android/java/org/example/Worker.java'
            path = root / declaration
            path.parent.mkdir(parents=True)
            metadata = {'schema': 1, 'services': [{'class': 'org.example.Worker$Slot0', 'process': ':sqgi_worker_0'}]}
            path.write_text(json.dumps(metadata))
            sdk = {'root': str(root), 'metadata': {'files': {declaration: {}, java: {}}}}
            destination = root / 'prepared'
            squirrel_backend('android-resources', destination=str(destination), project={}, sdk=sdk)
            service = ET.parse(destination / 'AndroidManifest.xml').getroot().find('application/service')
            android = '{http://schemas.android.com/apk/res/android}'
            self.assertEqual(service.attrib[android + 'exported'], 'false')
            self.assertEqual(service.attrib[android + 'process'], ':sqgi_worker_0')
            for invalid in ['external', ':sqgi_worker_0" android:exported="true', ':']:
                metadata['services'][0]['process'] = invalid
                path.write_text(json.dumps(metadata))
                with self.assertRaisesRegex(ValueError, 'private service'):
                    squirrel_backend('android-resources', destination=str(destination), project={}, sdk=sdk)
            metadata['services'][0]['process'] = ':sqgi_worker_0'
            path.write_text(json.dumps(metadata))
            del sdk['metadata']['files'][java]
            with self.assertRaisesRegex(ValueError, 'inventoried Java'):
                squirrel_backend('android-resources', destination=str(destination), project={}, sdk=sdk)

    def test_manifest_permissions_and_icon_render_and_reject_stale_inputs(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); icon = root/'icon.png'; destination = root/'input'
            def chunk(name, data):
                return struct.pack('>I',len(data)) + name + data + struct.pack('>I',zlib.crc32(name+data))
            icon.write_bytes(b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB',32,16,8,6,0,0,0)) +
                chunk(b'IDAT', zlib.compress((b'\0' + b'\xff\x80\x00\xff'*32)*16)) + chunk(b'IEND',b''))
            project = {'permissions':['android.permission.INTERNET'],'icon_sha256':file_hash(icon)}
            squirrel_backend('android-resources', destination=str(destination), project=project, icon=str(icon))
            document = ET.parse(destination/'AndroidManifest.xml').getroot()
            android = '{http://schemas.android.com/apk/res/android}'
            self.assertEqual([p.attrib[android+'name'] for p in document.findall('uses-permission')],
                             ['android.permission.INTERNET','android.permission.REORDER_TASKS'])
            self.assertEqual(document.find('application').attrib[android+'icon'],'@drawable/sqgi_app_icon')
            image = (destination/'res/drawable-nodpi/sqgi_app_icon.png').read_bytes()
            self.assertEqual(struct.unpack_from('>II',image,16),(512,256))
            with self.assertRaisesRegex(ValueError,'icon changed'):
                squirrel_backend('android-resources', destination=str(destination),
                                 project=dict(project,icon_sha256='0'*64), icon=str(icon))
            with self.assertRaisesRegex(ValueError,'icon input is missing'):
                squirrel_backend('android-resources',destination=str(destination),project=project)

    def test_default_manifest_needs_no_image_loader_or_icon(self):
        with tempfile.TemporaryDirectory() as directory:
            squirrel_backend('android-resources',destination=directory,project={})
            document = ET.parse(Path(directory)/'AndroidManifest.xml').getroot()
            android = '{http://schemas.android.com/apk/res/android}'
            self.assertNotIn(android+'icon',document.find('application').attrib)
            self.assertEqual(len(document.findall('uses-permission')),1)


class NativeContracts(unittest.TestCase):
    context = Context
    def test_dependency_dag_rejects_missing_duplicate_and_cycle(self):
        for implementation in [ordered, lambda projects: squirrel_backend('native-order', projects=projects)]:
            self.assertEqual([p['name'] for p in implementation([{'name': 'app', 'depends_on': ['base']}, {'name': 'base'}])], ['base', 'app'])
            for projects in [[{'name': 'app', 'depends_on': ['missing']}], [{'name': 'app'}, {'name': 'app'}],
                             [{'name': 'a', 'depends_on': ['b']}, {'name': 'b', 'depends_on': ['a']}]]:
                with self.subTest(projects=projects), self.assertRaises(ValueError):
                    implementation(projects)

    def test_scanner_rejects_missing_target_gir_and_host_paths(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); sdk = root / 'sdk'; build = root / 'build'; build.mkdir()
            gir = sdk / 'usr/share/gir-1.0'; gir.mkdir(parents=True)
            context = root / 'context.json'
            context.write_text(json.dumps({'schema': 1, 'abi': 'x86_64', 'sdk': str(sdk),
                'allowed_roots': [str(build)], 'readelf': 'readelf', 'library_dirs': []}))
            with mock.patch.dict(os.environ, SQGI_ANDROID_CONTEXT=str(context), LD_LIBRARY_PATH=''):
                adapter = self.context()
                with self.assertRaisesRegex(ValueError, 'lacks GIR'):
                    adapter.validate_gir_includes(['--include=GObject-2.0'], [gir])
                (gir / 'Study-1.0.gir').write_text('<repository xmlns="http://www.gtk.org/introspection/core/1.0"><include name="GObject" version="2.0"/><namespace name="Study" version="1.0"/></repository>')
                with self.assertRaisesRegex(ValueError, 'lacks GIR'):
                    adapter.validate_gir_includes(['--include=Study-1.0'], [gir])
                host = root / 'Host-1.0.gir'; host.write_text('<repository/>')
                (gir / host.name).symlink_to(host)
                with self.assertRaisesRegex(ValueError, 'outside'):
                    adapter.validate_gir_includes(['--include=Host-1.0'], [gir])
            with mock.patch.dict(os.environ, SQGI_ANDROID_CONTEXT=str(context), LD_LIBRARY_PATH='/usr/lib'):
                with self.assertRaisesRegex(ValueError, 'outside'):
                    self.context()

    @unittest.skipUnless(shutil.which('cc') and shutil.which('readelf'), 'ELF compiler tools required')
    def test_rpath_normalization_preserves_elf_layout_and_execution(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); source = root / 'module.c'; before = root / 'libfixture.so'; after = root / 'clean/libfixture.so'
            source.write_text('extern int abs(int); int answer(int n) {return abs(n);}\n')
            subprocess.run(['cc', '-fno-builtin', '-shared', '-fPIC', source, '-o', before,
                            '-Wl,-soname,libfixture.so', '-Wl,-z,max-page-size=16384', '-Wl,-rpath,' + str(root)], check=True)
            original = before.read_bytes()
            record = remove_build_rpath(before, after, [root], 'readelf')
            self.assertEqual(original, before.read_bytes())
            self.assertNotEqual(record['original_sha256'], record['sha256'])
            data = after.read_bytes(); offset = struct.unpack_from('<Q', original, 32)[0]
            stride, count = struct.unpack_from('<HH', original, 54)
            self.assertEqual(original[offset:offset+stride*count], data[offset:offset+stride*count])
            audited = inspect(after, 'x86_64', 'readelf')
            self.assertEqual(audited['soname'], 'libfixture.so')
            self.assertIn('libc.so.6', audited['needed'])
            self.assertEqual(ctypes.CDLL(str(after)).answer(-42), 42)
            self.assertIsNone(remove_build_rpath(after, root / 'unused', [root], 'readelf'))
            with self.assertRaisesRegex(ValueError, 'non-target'):
                remove_build_rpath(before, root / 'rejected', [root / 'elsewhere'], 'readelf')


class SDKIntegrity(unittest.TestCase):
    sdk_factory = SDK
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        files = {}
        for name in ['lib/libsqgi.so', 'lib/libsqgi-gtk.so', 'lib/libc++_shared.so',
                     'lib/girepository-1.0/Gtk-4.0.typelib']:
            path = self.root / 'usr' / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(b'integrity fixture: ' + name.encode())
            files['usr/' + name] = {'sha256': file_hash(path)}
        self.metadata = {'schema': 1, 'prefix': 'usr', 'wrapper_abi': 1,
                         'runtime': {'jit': False, 'kernels': False}, 'files': files,
                         'target': {'abi': 'x86_64', 'triplet': 'x86_64-linux-android',
                                    'libc': 'bionic', 'baseline': 'ubuntu-24.04',
                                    'ndk': NDK_REVISION, 'min_api': 31}}
        self.save()

    def save(self):
        (self.root / DESCRIPTOR).write_text(json.dumps(self.metadata))

    def test_consumer_requires_no_producer_paths(self):
        self.sdk_factory(self.root, 'x86_64', 31).validate()
        moved = self.root / 'relocated'
        moved.mkdir()
        (self.root / 'usr').rename(moved / 'usr')
        (self.root / DESCRIPTOR).rename(moved / DESCRIPTOR)
        self.sdk_factory(moved, 'x86_64', 31).validate()

    def test_corruption_and_untracked_files_fail(self):
        path = self.root / 'usr/lib/libsqgi.so'
        original = path.read_bytes()
        path.write_bytes(b'changed')
        with self.assertRaisesRegex(ValueError, 'differs'):
            self.sdk_factory(self.root, 'x86_64', 31).validate()
        path.write_bytes(original)
        (self.root / 'usr/lib/injected.so').write_bytes(b'host library')
        with self.assertRaisesRegex(ValueError, 'inventory'):
            self.sdk_factory(self.root, 'x86_64', 31).validate()

    def test_wrong_platform_abi_api_and_runtime_are_rejected(self):
        for abi, api in [('arm64-v8a', 31), ('x86_64', 30)]:
            with self.assertRaises(ValueError):
                self.sdk_factory(self.root, abi, api)
        self.metadata['target']['triplet'] = 'x86_64-linux-gnu'
        self.save()
        with self.assertRaisesRegex(ValueError, 'target'):
            self.sdk_factory(self.root, 'x86_64', 31)
        self.metadata['target']['triplet'] = 'x86_64-linux-android'
        self.metadata['runtime']['jit'] = True
        self.save()
        with self.assertRaisesRegex(ValueError, 'capabilities'):
            self.sdk_factory(self.root, 'x86_64', 31)

    def test_sdk_link_cannot_escape_prefix(self):
        path = self.root / 'usr/lib/libsqgi.so'
        path.unlink()
        outside = self.root / 'host.so'
        outside.write_bytes(b'outside')
        path.symlink_to(outside)
        self.metadata['files']['usr/lib/libsqgi.so'] = {'link': str(outside)}
        self.save()
        with self.assertRaisesRegex(ValueError, 'escapes'):
            self.sdk_factory(self.root, 'x86_64', 31).validate()


class SquirrelSDKIntegrity(SDKIntegrity):
    sdk_factory = SquirrelSDK

    @unittest.skipUnless(shutil.which('cc') and shutil.which('readelf'), 'ELF compiler tools required')
    def test_media_ndk_dependencies_are_system_libraries_but_private_libraries_are_not(self):
        source = self.root / 'media.c'
        source.write_text('void media_fixture(void) {}\n')
        stubs = []
        for name in ['libcamera2ndk.so', 'libmediandk.so', 'libOpenSLES.so', 'libbinder.so', 'libz.so']:
            stub = self.root / name
            subprocess.run(['cc', '-nostdlib', '-shared', '-fPIC', source,
                            '-Wl,-soname,' + name, '-o', stub], check=True)
            stubs.append(stub)
        target = self.root / 'usr/lib/libmedia-fixture.so'

        def install(dependencies):
            subprocess.run(['cc', '-nostdlib', '-shared', '-fPIC', source,
                            '-Wl,-soname,libmedia-fixture.so', '-Wl,-z,max-page-size=16384',
                            '-Wl,--no-as-needed', *dependencies, '-o', target], check=True)
            self.metadata['files']['usr/lib/libmedia-fixture.so'] = {'sha256': file_hash(target)}
            self.save()

        install(stubs[:3])
        self.sdk_factory(self.root, 'x86_64', 31).validate()
        for dependency in stubs[3:]:
            install([dependency])
            with self.subTest(dependency=dependency.name), self.assertRaisesRegex(ValueError, 'non-pinned'):
                self.sdk_factory(self.root, 'x86_64', 31).validate()

    def test_compiler_runtime_requires_pinned_inventoried_llvm(self):
        self.metadata['runtime'].update(jit=True, kernels=True,
            compiler={'name': 'LLVM', 'version': '18.1.3', 'library': 'libLLVM.so'})
        self.save()
        with self.assertRaisesRegex(ValueError, 'inventoried'):
            self.sdk_factory(self.root, 'x86_64', 31)
        library = self.root / 'usr/lib/libLLVM.so'
        library.write_bytes(b'compiler inventory fixture')
        self.metadata['files']['usr/lib/libLLVM.so'] = {'sha256': file_hash(library)}
        self.save()
        self.sdk_factory(self.root, 'x86_64', 31).validate()
        library.write_bytes(b'changed compiler')
        with self.assertRaisesRegex(ValueError, 'differs'):
            self.sdk_factory(self.root, 'x86_64', 31).validate()
        self.metadata['runtime']['compiler']['version'] = '19.0.0'
        self.save()
        with self.assertRaisesRegex(ValueError, 'LLVM 18.1.3'):
            self.sdk_factory(self.root, 'x86_64', 31)

    @unittest.skipUnless(Path(os.environ.get('SQGI_ANDROID_XMLLINT', '/usr/bin/xmllint')).is_file(), 'xmllint required')
    def test_local_sdk_derives_catalog_from_inventoried_target_gir(self):
        gir = self.root/'usr/share/gir-1.0/Gtk-4.0.gir'
        gir.parent.mkdir(parents=True)
        gir.write_text('<repository xmlns="http://www.gtk.org/introspection/core/1.0"><namespace name="Gtk" version="4.0" shared-library="libsqgi-gtk.so"/></repository>')
        self.metadata['files']['usr/share/gir-1.0/Gtk-4.0.gir'] = {'sha256':file_hash(gir)}
        self.save()
        result = squirrel_backend('sdk', root=str(self.root), abi='x86_64', min_api=31, validate=True, namespaces=True)
        self.assertEqual(result['namespaces']['Gtk-4.0']['libraries'], ['libsqgi-gtk.so'])
        self.assertEqual(result['namespaces']['Gtk-4.0']['gir_sha256'], file_hash(gir))
        # Inventory validation remains mandatory before catalog derivation.
        gir.write_text(gir.read_text().replace('Gtk', 'Wrong'))
        with self.assertRaisesRegex(ValueError, 'differs'):
            squirrel_backend('sdk', root=str(self.root), abi='x86_64', min_api=31, validate=True, namespaces=True)


class SquirrelBackendContracts(unittest.TestCase):
    def test_canonical_metadata_is_compatible_with_existing_snapshots(self):
        value = {'unicode': 'GTK · héllo 🎉', 'quoted': 'a"b\\c\n', 'z': [None, True, False, 42], 'a': {}, 'λ': 'unicode key', '🦔': 'emoji key'}
        self.assertEqual(squirrel_backend('encode', value=value).encode(), encoded(value))
        for path in ['../host', 'lib/../../host', '/usr/lib', 'lib\\host', 'nul\0byte', '.', '']:
            with self.subTest(path=path), self.assertRaises(ValueError):
                squirrel_backend('relative', value=path)
        self.assertEqual(squirrel_backend('relative', value='usr/./lib//module.so'), 'usr/lib/module.so')

    @unittest.skipUnless(shutil.which('cc') and shutil.which('readelf'), 'ELF compiler tools required')
    def test_elf_audit_and_rpath_rewrite_match_and_execute(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); source = root / 'module.c'; before = root / 'libfixture.so'
            source.write_text('extern int abs(int); int answer(int n) {return abs(n);}\n')
            subprocess.run(['cc', '-fno-builtin', '-shared', '-fPIC', source, '-o', before,
                            '-Wl,-soname,libfixture.so', '-Wl,-z,max-page-size=16384', '-Wl,-rpath,' + str(root)], check=True)
            py_after, sq_after = root / 'python.so', root / 'squirrel.so'
            expected = remove_build_rpath(before, py_after, [root], 'readelf')
            actual = squirrel_backend('rpath', source=str(before), destination=str(sq_after), roots=[str(root)])
            self.assertEqual(actual, expected)
            self.assertEqual(sq_after.read_bytes(), py_after.read_bytes())
            self.assertEqual(squirrel_backend('elf', path=str(sq_after), abi='x86_64'), inspect(py_after, 'x86_64', 'readelf'))
            self.assertEqual(ctypes.CDLL(str(sq_after)).answer(-42), 42)
            with self.assertRaisesRegex(ValueError, 'non-target'):
                squirrel_backend('rpath', source=str(before), destination=str(root / 'bad.so'), roots=[str(root / 'elsewhere')])
            with self.assertRaisesRegex(ValueError, 'architecture'):
                squirrel_backend('elf', path=str(sq_after), abi='arm64-v8a')
            with self.assertRaisesRegex(ValueError, 'search path'):
                squirrel_backend('elf', path=str(before), abi='x86_64')


class AndroidPackages(unittest.TestCase):
    resolver = staticmethod(resolve)
    save = SDKIntegrity.save

    def setUp(self):
        SDKIntegrity.setUp(self)
        self.origin = self.root / 'repository'
        self.catalog = self.origin / 'android/noble-android-r1/x86_64-linux-android/v1'
        self.catalog.mkdir(parents=True)
        self.metadata.update(sdk_id='noble-android-r1', profile='runtime', source_lock_sha256='a' * 64,
                             file_owners={n: 'fixture-runtime' for n in self.metadata['files']})
        self.identity = dict(self.metadata['target'], sdk_id='noble-android-r1', source_lock_sha256='a' * 64)
        self.request = {'abi': 'x86_64', 'sdk_id': 'noble-android-r1', 'profile': 'runtime',
                        'repository': self.origin.as_uri(), 'root': str(self.root / 'installed'),
                        'cache': str(self.root / 'cache'), 'min_api': 31}
        self.publish()

    def publish(self):
        artifact = self.catalog / 'fixture.tar.gz'
        with tarfile.open(artifact, 'w:gz') as tar:
            for name in self.metadata['files']:
                tar.add(self.root / name, arcname=name)
        descriptor = self.catalog / 'runtime.json'
        descriptor.write_bytes(encoded(self.metadata))
        self.index = {'schema': 1, 'target': 'x86_64-linux-android', 'prefix': '/usr', 'android': self.identity,
                      'sdk_profiles': {'runtime': {'artifact': 'runtime.json', 'sha256': file_hash(descriptor),
                                                    'package': 'sqgi-android-runtime'}},
                      'packages': [{'name': 'fixture-runtime', 'version': '1', 'artifact': 'fixture.tar.gz',
                                    'sha256': file_hash(artifact), 'dependencies': [], 'android': self.identity},
                                   {'name': 'sqgi-android-runtime', 'version': '1', 'kind': 'meta',
                                    'dependencies': ['fixture-runtime'], 'android': self.identity}]}
        self.save_index()

    def save_index(self):
        (self.catalog / 'index.json').write_bytes(encoded(self.index))

    def test_locked_offline_replay_and_relocated_install(self):
        result = self.resolver(self.request)
        self.origin.rename(self.origin.with_name('unavailable-repository'))
        request = dict(self.request, download=False, locked=result['lock'], root=str(self.root / 'elsewhere'))
        replay = self.resolver(request)
        self.assertEqual(result['sdk_sha256'], replay['sdk_sha256'])
        SDK(replay['sdk'], 'x86_64', 31).validate()
        self.assertEqual(replay['packages'], ['fixture-runtime', 'sqgi-android-runtime'])
        changed = dict(result['lock'], sdk_id='different')
        with self.assertRaisesRegex(ValueError, 'lock differs'):
            self.resolver(dict(request, locked=changed))

    def test_corrupt_download_and_cache_are_rejected(self):
        artifact = self.catalog / 'fixture.tar.gz'
        original = artifact.read_bytes()
        artifact.write_bytes(b'corrupt')
        with self.assertRaisesRegex(ValueError, 'checksum mismatch'):
            self.resolver(self.request)
        self.assertFalse(Path(self.request['root']).exists())
        artifact.write_bytes(original)
        result = self.resolver(self.request)
        cached = next(Path(self.request['cache']).glob('*/packages/*.tar.gz'))
        cached.write_bytes(b'corrupt')
        with self.assertRaisesRegex(ValueError, 'checksum mismatch'):
            self.resolver(dict(self.request, download=False, locked=result['lock']))
        SDK(result['sdk'], 'x86_64', 31).validate()

    def test_incompatible_catalogs_and_incomplete_closures_are_rejected(self):
        original = copy.deepcopy(self.index)
        for mutation in ['libc', 'abi', 'ndk', 'min_api', 'prefix', 'mixed', 'missing', 'duplicate']:
            with self.subTest(mutation=mutation):
                self.index = copy.deepcopy(original)
                if mutation == 'prefix':
                    self.index['prefix'] = '/mingw64'
                elif mutation == 'mixed':
                    self.index['packages'][0]['android'] = dict(self.identity, sdk_id='other')
                elif mutation == 'missing':
                    self.index['packages'][0]['dependencies'] = ['missing']
                elif mutation == 'duplicate':
                    self.index['packages'].append(self.index['packages'][0])
                else:
                    self.index['android'][mutation] = {'libc': 'glibc', 'abi': 'arm64-v8a',
                                                      'ndk': '27', 'min_api': 35}[mutation]
                self.save_index()
                with self.assertRaises(ValueError):
                    self.resolver(dict(self.request, cache=str(self.root / ('cache-' + mutation))))

    def test_descriptor_identity_and_ownership_are_verified_before_promotion(self):
        original = copy.deepcopy(self.metadata)
        for mutation in ['profile', 'owner', 'inventory']:
            with self.subTest(mutation=mutation):
                self.metadata = copy.deepcopy(original)
                if mutation == 'profile':
                    self.metadata['profile'] = 'sdk'
                elif mutation == 'owner':
                    self.metadata['file_owners']['usr/lib/libsqgi.so'] = 'someone-else'
                else:
                    self.metadata['files']['usr/lib/libsqgi.so']['sha256'] = '0' * 64
                self.publish()
                with self.assertRaises(ValueError):
                    self.resolver(dict(self.request, cache=str(self.root / ('cache-' + mutation))))
                self.assertFalse(Path(self.request['root']).exists())

    def test_host_elf_cannot_be_disguised_by_an_android_catalog(self):
        name = 'usr/lib/libsqgi.so'
        (self.root / name).write_bytes(Path('/bin/true').read_bytes())
        self.metadata['files'][name] = {'sha256': file_hash(self.root / name)}
        self.publish()
        with self.assertRaisesRegex(ValueError, 'Non-Bionic|16 KB'):
            self.resolver(self.request)
        self.assertFalse(Path(self.request['root']).exists())


class SquirrelAndroidPackages(AndroidPackages):
    resolver = staticmethod(lambda request: squirrel_backend('resolve-sdk', request=request))

    def test_additional_packages_choose_and_lock_a_containing_profile(self):
        # A second immutable profile can contain a metapackage without changing
        # the fixture's runtime files. Exercise selection and offline replay.
        metadata = dict(self.metadata, profile='sdk')
        descriptor = self.catalog / 'sdk.json'
        descriptor.write_bytes(encoded(metadata))
        self.index['packages'].extend([
            dict(name='extra-sdk', version='1', kind='meta', dependencies=[], android=self.identity),
            dict(name='sqgi-android-sdk', version='1', kind='meta', dependencies=['fixture-runtime', 'extra-sdk'], android=self.identity)])
        self.index['sdk_profiles']['sdk'] = dict(artifact='sdk.json', sha256=file_hash(descriptor), package='sqgi-android-sdk')
        self.save_index()
        request = dict(self.request, packages=['extra-sdk'])
        result = self.resolver(request)
        self.assertEqual(result['lock']['profile'], 'sdk')
        self.assertEqual(result['lock']['minimum_profile'], 'runtime')
        self.assertIn('extra-sdk', result['packages'])
        self.origin.rename(self.origin.with_name('unavailable'))
        replay = self.resolver(dict(request, locked=result['lock'], download=False, root=str(self.root / 'replay')))
        self.assertEqual(result['lock'], replay['lock'])
        with self.assertRaisesRegex(ValueError, 'locked catalog'):
            self.resolver(dict(request, locked=result['lock'], download=False, packages=[]))

    def test_unknown_additional_package_fails_before_install(self):
        with self.assertRaises(ValueError):
            self.resolver(dict(self.request, packages=['missing-android-package']))
        self.assertFalse(Path(self.request['root']).exists())

    def test_unsafe_tar_members_and_bad_headers_preserve_previous_sdk(self):
        result = self.resolver(self.request)
        artifact = self.catalog / 'fixture.tar.gz'
        original = artifact.read_bytes()
        cases = [('usr/../../escape', None), ('/usr/absolute', None), ('mingw64/host', None),
                 ('usr/lib/escape', '../../../outside'), ('usr/lib/loop', 'loop')]
        for name, link in cases:
            with self.subTest(name=name):
                with tarfile.open(artifact, 'w:gz') as tar:
                    for path in self.metadata['files']:
                        tar.add(self.root / path, arcname=path)
                    info = tarfile.TarInfo(name)
                    if link:
                        info.type = tarfile.SYMTYPE; info.linkname = link; tar.addfile(info)
                    else:
                        info.size = 3; tar.addfile(info, io.BytesIO(b'bad'))
                self.index['packages'][0]['sha256'] = file_hash(artifact); self.save_index()
                with self.assertRaises(ValueError):
                    self.resolver(dict(self.request, refresh=True))
                SDK(result['sdk'], 'x86_64', 31).validate()
                self.assertFalse(list(self.root.glob('installed.prepare-*')))
        raw = bytearray(gzip.decompress(original)); raw[0] ^= 1
        artifact.write_bytes(gzip.compress(raw))
        self.index['packages'][0]['sha256'] = file_hash(artifact); self.save_index()
        with self.assertRaisesRegex(ValueError, 'header checksum'):
            self.resolver(dict(self.request, refresh=True))
        artifact.write_bytes(original[:-5])
        self.index['packages'][0]['sha256'] = file_hash(artifact); self.save_index()
        with self.assertRaises(ValueError):
            self.resolver(dict(self.request, refresh=True))
        SDK(result['sdk'], 'x86_64', 31).validate()

    def test_pax_names_and_in_package_links_are_materialized(self):
        name = 'usr/share/' + 'long-path-' * 15 + 'café.dat'
        path = self.root / name; path.parent.mkdir(parents=True); path.write_bytes(b'long UTF-8 path')
        self.metadata['files'][name] = {'sha256': file_hash(path)}
        self.metadata['file_owners'][name] = 'fixture-runtime'
        alias = 'usr/lib/alias.so'
        self.metadata['files'][alias] = self.metadata['files']['usr/lib/libsqgi.so']
        self.metadata['file_owners'][alias] = 'fixture-runtime'
        (self.root / alias).write_bytes((self.root / 'usr/lib/libsqgi.so').read_bytes())
        self.publish()
        artifact = self.catalog / 'fixture.tar.gz'
        with tarfile.open(artifact, 'w:gz', format=tarfile.PAX_FORMAT) as tar:
            info = tarfile.TarInfo(alias); info.type = tarfile.SYMTYPE; info.linkname = 'libsqgi.so'; tar.addfile(info)
            for path in self.metadata['files']:
                if path != alias:
                    tar.add(self.root / path, arcname=path)
        self.index['packages'][0]['sha256'] = file_hash(artifact); self.save_index()
        result = self.resolver(self.request)
        self.assertEqual((Path(result['sdk']) / name).read_bytes(), b'long UTF-8 path')
        self.assertFalse((Path(result['sdk']) / alias).is_symlink())
        SDK(result['sdk'], 'x86_64', 31).validate()


class BundlePayloads(unittest.TestCase):
    combine = staticmethod(combine)
    verify_artifact = staticmethod(verify_artifact)
    verify_splits = staticmethod(verify_splits)
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(); self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name); self.inputs = []
        for abi in ['x86_64', 'arm64-v8a']:
            root = self.root / abi
            files = {'project.json': encoded({'application_id': 'org.sqgi.fixture'}),
                     'java/Glue.java': b'common Java glue', 'assets/application/source/main.nut': b'print("test")',
                     'assets/application/source/λ.txt': b'unicode asset', 'assets/application/source/z.txt': b'ascii asset',
                     'jniLibs/' + abi + '/libfixture.so': ('binary-' + abi).encode(),
                     'assets/runtime/' + abi + '/typelib/Fixture-1.0.typelib': ('target-record-' + abi).encode()}
            snapshot = {'project': {'application_id': 'org.sqgi.fixture'},
                        'files': {name.removeprefix('assets/application/source/'):digest(data) for name,data in files.items()
                                  if name.startswith('assets/application/source/')}}
            files['assets/application/project.json'] = encoded(snapshot)
            provenance = {'schema': 2, 'abi': abi, 'application': snapshot, 'wrapper': {'source.c': 'same'},
                'libraries': {'libfixture.so': {'sha256': digest(files['jniLibs/' + abi + '/libfixture.so'])}},
                'assets': {'typelib/Fixture-1.0.typelib': digest(files['assets/runtime/' + abi + '/typelib/Fixture-1.0.typelib'])}}
            files['assets/runtime/' + abi + '/provenance.json'] = encoded(provenance)
            files['assets/runtime/index.json'] = encoded({'schema': 2, 'abis': {abi: digest(encoded(provenance))}})
            for name, data in files.items():
                path = root / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_bytes(data)
            self.inputs.append({'abi': abi, 'prepared': str(root), 'prepared_sha256': seal(root, abi)})

    def archive(self, directory, output, select=lambda name: True, bundle=False):
        with zipfile.ZipFile(output, 'w', compression=zipfile.ZIP_DEFLATED) as archive:
            for path in directory.rglob('*'):
                if not path.is_file():
                    continue
                name = path.relative_to(directory).as_posix()
                if name.startswith('jniLibs/'):
                    name = 'lib/' + name[len('jniLibs/'):]
                if name.startswith(('lib/', 'assets/')) and select(name):
                    archive.writestr(('base/' if bundle else '') + name, path.read_bytes())

    def test_multi_abi_bundle_and_device_split_closures(self):
        combined = self.combine(self.inputs, self.root / 'combined')
        bundle = self.root / 'app.aab'; self.archive(combined, bundle, bundle=True)
        self.assertEqual(self.verify_artifact(bundle, ['x86_64', 'arm64-v8a'])['metadata_abis'], ['arm64-v8a', 'x86_64'])
        master = self.root / 'base.apk'; self.archive(combined, master, lambda name: name.startswith('assets/'))
        native = self.root / 'x86.apk'; self.archive(combined, native, lambda name: name.startswith('lib/x86_64/'))
        self.assertEqual(self.verify_splits([master, native], 'x86_64')['abis'], ['x86_64'])
        with self.assertRaisesRegex(ValueError, 'inventory'):
            self.verify_splits([master, native], 'arm64-v8a')
        with self.assertRaisesRegex(ValueError, 'Duplicate'):
            self.verify_splits([master, native, native], 'x86_64')

    def test_sealed_inputs_cannot_change_between_abi_prepare_and_bundle(self):
        root = Path(self.inputs[0]['prepared'])
        squirrel_backend('prepared', root=str(root), sha256=self.inputs[0]['prepared_sha256'], abi='x86_64')
        (root / 'java/Glue.java').write_text('changed after seal')
        with self.assertRaisesRegex(ValueError, 'inventory'):
            squirrel_backend('prepared', root=str(root), sha256=self.inputs[0]['prepared_sha256'], abi='x86_64')
        with self.assertRaisesRegex(ValueError, 'inventory'):
            self.combine(self.inputs, self.root / 'combined')

    def test_different_application_or_java_inputs_cannot_be_combined(self):
        root = Path(self.inputs[0]['prepared'])
        (root / 'assets/application/source/main.nut').write_text('a different app')
        self.inputs[0]['prepared_sha256'] = seal(root, 'x86_64')
        with self.assertRaisesRegex(ValueError, 'share application'):
            self.combine(self.inputs, self.root / 'combined')

    def test_corrupt_typelib_or_relabelled_abi_is_rejected(self):
        combined = self.combine(self.inputs, self.root / 'combined')
        typelib = combined / 'assets/runtime/arm64-v8a/typelib/Fixture-1.0.typelib'
        typelib.write_bytes(b'wrong target metadata')
        bundle = self.root / 'app.aab'; self.archive(combined, bundle, bundle=True)
        with self.assertRaisesRegex(ValueError, 'bytes differ'):
            self.verify_artifact(bundle, ['x86_64', 'arm64-v8a'])
        combined = self.combine(self.inputs, self.root / 'combined')
        path = combined / 'assets/runtime/x86_64/provenance.json'; metadata = json.loads(path.read_text())
        metadata['abi'] = 'arm64-v8a'; atomic_json(path, metadata)
        index_path = combined / 'assets/runtime/index.json'; index = json.loads(index_path.read_text())
        index['abis']['x86_64'] = file_hash(path); atomic_json(index_path, index)
        self.archive(combined, bundle, bundle=True)
        with self.assertRaisesRegex(ValueError, 'ABI/schema'):
            self.verify_artifact(bundle, ['x86_64', 'arm64-v8a'])


class SquirrelBundlePayloads(BundlePayloads):
    combine = staticmethod(lambda inputs, destination: Path(squirrel_backend('combine', inputs=inputs, destination=str(destination))))
    verify_artifact = staticmethod(lambda path, abis: squirrel_backend('artifact', path=str(path), abis=abis))
    verify_splits = staticmethod(lambda paths, abi: squirrel_backend('splits', paths=list(map(str, paths)), abi=abi))

    def test_manifest_and_resources_must_match_across_abis(self):
        for item in self.inputs:
            root = Path(item['prepared']); (root/'res/drawable-nodpi').mkdir(parents=True)
            (root/'AndroidManifest.xml').write_text('<manifest/>')
            (root/'res/drawable-nodpi/icon.png').write_bytes(b'identical image')
            item['prepared_sha256'] = seal(root,item['abi'])
        combined = self.combine(self.inputs,self.root/'combined')
        self.assertEqual((combined/'AndroidManifest.xml').read_text(),'<manifest/>')
        self.assertEqual((combined/'res/drawable-nodpi/icon.png').read_bytes(),b'identical image')
        item = self.inputs[1]; root = Path(item['prepared'])
        for path in ['AndroidManifest.xml','res/drawable-nodpi/icon.png']:
            original = (root/path).read_bytes(); (root/path).write_bytes(b'changed')
            item['prepared_sha256'] = seal(root,item['abi'])
            with self.assertRaisesRegex(ValueError,'must share'):
                self.combine(self.inputs,self.root/'combined')
            (root/path).write_bytes(original)
            item['prepared_sha256'] = seal(root,item['abi'])

    def test_duplicate_and_truncated_zip_metadata_rejected(self):
        combined = self.combine(self.inputs, self.root / 'combined')
        bundle = self.root / 'app.aab'; self.archive(combined, bundle, bundle=True)
        original = bundle.read_bytes()
        bundle.write_bytes(original[:-1])
        with self.assertRaisesRegex(ValueError, 'ZIP'):
            self.verify_artifact(bundle, ['x86_64', 'arm64-v8a'])
        bundle.write_bytes(original)
        import warnings
        with warnings.catch_warnings():
            warnings.simplefilter('ignore', UserWarning)
            with zipfile.ZipFile(bundle, 'a') as archive:
                archive.writestr('base/assets/runtime/index.json', b'{}')
        with self.assertRaisesRegex(ValueError, 'Duplicate'):
            self.verify_artifact(bundle, ['x86_64', 'arm64-v8a'])


@unittest.skipUnless(shutil.which('cc') and shutil.which('readelf'), 'ELF build tools required')
class ApplicationModules(unittest.TestCase):
    @staticmethod
    def resolver(request, sdk_base, work, readelf):
        return modules.resolve(request, sdk_base, work, readelf)

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(); self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        target = {'abi': 'x86_64', 'triplet': 'x86_64-linux-android', 'libc': 'bionic',
                  'baseline': 'ubuntu-24.04', 'ndk': NDK_REVISION, 'min_api': 31}
        self.base = SimpleNamespace(sha256='b' * 64, metadata={'files': {}, 'namespaces': {}, 'target': target,
            'source_lock_sha256': 'a' * 64, 'producer_descriptor_sha256': 'c' * 64})
        self.origin = self.root / 'repo'
        self.catalog = self.origin / 'android/modules/noble-android-r1/test-r1/x86_64-linux-android/v1'
        self.catalog.mkdir(parents=True)
        self.payload = self.root / 'payload'; (self.payload / 'usr/lib').mkdir(parents=True)
        source = self.root / 'module.c'; source.write_text('int answer(void) {return 42;}\n')
        subprocess.run(['cc', '-shared', '-fPIC', '-nostdlib', source, '-o', self.payload / 'usr/lib/libtest.so',
                        '-Wl,-soname,libtest.so', '-Wl,-z,max-page-size=16384'], check=True)
        self.identity = modules.compatibility(self.base, 'noble-android-r1')
        self.entry = {'name': 'test-module', 'version': '1', 'kind': 'package', 'dependencies': [],
            'artifact': 'test.tar.gz', 'android_module': self.identity,
            'module': {'files': {}, 'libraries': ['libtest.so'], 'namespaces': {}, 'source': {}, 'min_api': 31}}
        self.request = {'native': [{'name': 'test', 'android_package': 'test-module'}], 'sdk_id': 'noble-android-r1',
            'abi': 'x86_64', 'module_set': 'test-r1', 'repository': self.origin.as_uri(), 'cache': str(self.root / 'cache'),
            'application': {'min_sdk': 31}}
        self.work = self.root / 'work'; self.work.mkdir()
        self.publish()

    def publish(self):
        files = {p.relative_to(self.payload).as_posix(): {'sha256': file_hash(p)}
                 for p in self.payload.rglob('*') if p.is_file()}
        self.entry['module']['files'] = files
        archive = self.catalog / 'test.tar.gz'
        with tarfile.open(archive, 'w:gz') as tar:
            for name in sorted(files):
                tar.add(self.payload / name, arcname=name)
        self.entry['sha256'] = file_hash(archive)
        self.save_index()

    def save_index(self):
        self.index = {'schema': 1, 'target': 'x86_64-linux-android', 'prefix': '/usr', 'release': 'test-r1',
                      'android_module': self.identity, 'packages': [self.entry]}
        (self.catalog / 'index.json').write_bytes(encoded(self.index))

    def resolve(self, **changes):
        return self.resolver(dict(self.request, **changes), self.base, self.work, 'readelf')

    def test_locked_offline_relocation_and_corrupt_archive(self):
        first = self.resolve()
        self.assertEqual(ctypes.CDLL(str(first['root'] / 'usr/lib/libtest.so')).answer(), 42)
        moved = self.root / 'offline'; moved.mkdir()
        self.origin.rename(self.root / 'unavailable')
        replay = self.resolver(dict(self.request, offline=True, modules_lock=first['lock']), self.base, moved, 'readelf')
        self.assertEqual(replay['lock'], first['lock'])
        cached = next(Path(self.request['cache']).glob('*/packages/*.tar.gz')); cached.write_bytes(b'corrupt')
        with self.assertRaisesRegex(ValueError, 'checksum'):
            self.resolve(offline=True, modules_lock=first['lock'])
        self.assertEqual(file_hash(first['root'] / 'usr/lib/libtest.so'), self.entry['module']['files']['usr/lib/libtest.so']['sha256'])

    def test_other_sdk_and_module_identity_rejected(self):
        original = copy.deepcopy(self.identity)
        for key in ['source_lock_sha256', 'producer_descriptor_sha256', 'sdk_id']:
            with self.subTest(key=key):
                self.identity = dict(original, **{key: 'different'}); self.save_index()
                with self.assertRaisesRegex(ValueError, 'incompatible'):
                    self.resolve(cache=str(self.root / ('cache-' + key)))
        self.identity = original; self.entry['android_module'] = dict(original, sdk_id='different'); self.save_index()
        with self.assertRaisesRegex(ValueError, 'Mixed SDK'):
            self.resolve(cache=str(self.root / 'mixed'))

    def test_module_built_for_newer_api_is_rejected(self):
        self.entry['module']['min_api'] = 35; self.save_index()
        with self.assertRaisesRegex(ValueError, 'minimum API'):
            self.resolve()

    def test_base_collision_hash_and_wrong_elf_rejected_before_promotion(self):
        self.base.metadata['files']['usr/lib/libtest.so'] = self.entry['module']['files']['usr/lib/libtest.so']
        with self.assertRaisesRegex(ValueError, 'conflicts'):
            self.resolve()
        self.base.metadata['files'] = {}
        original = (self.payload / 'usr/lib/libtest.so').read_bytes()
        for key in ['hash', 'abi', 'host', 'text']:
            with self.subTest(key=key):
                data = original
                if key == 'abi':
                    data = bytearray(original); struct.pack_into('<H', data, 18, 183)
                elif key == 'host':
                    data = Path('/bin/true').read_bytes()
                elif key == 'text':
                    data = b'not an ELF'
                (self.payload / 'usr/lib/libtest.so').write_bytes(data)
                self.publish()
                if key == 'hash':
                    self.entry['module']['files']['usr/lib/libtest.so']['sha256'] = '0' * 64; self.save_index()
                with self.assertRaises(ValueError):
                    self.resolve(cache=str(self.root / ('invalid-' + key)))
                self.assertFalse((self.work / 'module-packages').exists())

    @unittest.skipUnless(Path(os.environ.get('SQGI_ANDROID_XMLLINT', '/usr/bin/xmllint')).is_file(), 'libxml2-utils required for SQGI GIR validation')
    def test_gir_identity_dependencies_and_ownership_match_catalog(self):
        gir = self.payload / 'usr/share/gir-1.0/Test-1.0.gir'; gir.parent.mkdir(parents=True)
        typelib = self.payload / 'usr/lib/girepository-1.0/Test-1.0.typelib'; typelib.parent.mkdir(parents=True)
        typelib.write_bytes(b'target metadata fixture')
        original = '<repository xmlns="http://www.gtk.org/introspection/core/1.0"><include name="Base" version="1.0"/><namespace name="Test" version="1.0" shared-library="libtest.so"/></repository>'
        self.base.metadata['namespaces']['Base-1.0'] = {'libraries': [], 'includes': []}
        definition = {'typelib': 'usr/lib/girepository-1.0/Test-1.0.typelib', 'libraries': ['libtest.so'], 'includes': ['Base-1.0']}
        self.entry['module']['namespaces'] = {'Test-1.0': definition}
        gir.write_text(original); definition['gir_sha256'] = file_hash(gir); self.publish()
        first = self.resolve(); marker = first['root'] / '.sqgipkg-ooblerg.json'; previous = marker.read_bytes()
        for key, text in [('name', original.replace('name="Test"', 'name="Other"')),
                          ('dependency', original.replace('name="Base"', 'name="Missing"')),
                          ('library', original.replace('libtest.so', 'libother.so')),
                          ('namespace_uri', original.replace('/core/1.0', '/wrong/1.0')),
                          ('malformed', original[:-15])]:
            with self.subTest(key=key):
                gir.write_text(text); definition['gir_sha256'] = file_hash(gir); self.publish()
                with self.assertRaisesRegex((ValueError, ET.ParseError), 'GIR|xmllint|unclosed|no element found|mismatched tag'):
                    self.resolve(cache=str(self.root / ('gir-' + key)))
                self.assertEqual(marker.read_bytes(), previous)


class SquirrelApplicationModules(ApplicationModules):
    @staticmethod
    def resolver(request, sdk_base, work, readelf):
        result = squirrel_backend('resolve-modules', request=request, sdk_base=vars(sdk_base), work=str(work))
        result['root'] = Path(result['root'])
        return result

    def test_source_runtime_module_requires_identical_runtime_sources(self):
        self.entry['module']['source'] = {'recipe': {'android_runtime_source': 'd' * 64}}
        self.save_index()
        for runtime in [None, {'source': {'sha256': 'e' * 64}}]:
            with self.subTest(runtime=runtime):
                self.base.metadata['runtime'] = runtime
                with self.assertRaisesRegex(ValueError, 'different SQGI runtime source'):
                    self.resolve()
                self.assertFalse((self.work / 'module-packages').exists())
        self.base.metadata['runtime'] = {'source': {'sha256': 'd' * 64}}
        result = self.resolve()
        self.assertTrue((result['root'] / 'usr/lib/libtest.so').is_file())

    def test_baseline_module_can_use_compatible_source_runtime(self):
        self.base.metadata['runtime'] = {'source': {'sha256': 'd' * 64}}
        result = self.resolve()
        self.assertTrue((result['root'] / 'usr/lib/libtest.so').is_file())


class UnifiedAndroidCatalog(unittest.TestCase):
    publish = AndroidPackages.publish
    def setUp(self):
        AndroidPackages.setUp(self)
        self.catalog = self.catalog.with_name('v2')
        self.catalog.mkdir()
        self.metadata.update(producer_descriptor_sha256='c'*64, namespaces={})
        AndroidPackages.publish(self)
        self.index.update(schema=2, android_module=dict(sdk_id='noble-android-r1',
            target=self.metadata['target'], source_lock_sha256='a'*64, producer_descriptor_sha256='c'*64))
        descriptor = self.catalog/'sdk.json'
        descriptor.write_bytes(encoded(dict(self.metadata,profile='sdk')))
        self.index['sdk_profiles']['sdk'] = dict(artifact='sdk.json',sha256=file_hash(descriptor),package='sqgi-android-sdk')
        self.index['packages'].append(dict(name='sqgi-android-sdk',version='1',kind='meta',dependencies=['fixture-runtime'],android=self.identity))
        self.add_module('media-fixture', 'media', ['sqgi-android-runtime'])
        self.add_module('extras-fixture', 'extras', ['media-fixture'])
        self.save_index()
        self.base = SimpleNamespace(metadata=self.metadata, sha256=file_hash(self.catalog/'runtime.json'))
        self.module_request = dict(abi='x86_64', sdk_id='noble-android-r1', repository=self.origin.as_uri(),
            cache=self.request['cache'], application={'min_sdk':31}, native=[{'name':'extra','android_package':'extras-fixture'}])

    save = SDKIntegrity.save
    save_index = AndroidPackages.save_index

    def add_module(self, name, library, dependencies):
        source = self.root/(library+'.c'); source.write_text('int answer(void) {return 42;}')
        binary = self.root/('lib'+library+'.so')
        subprocess.run(['cc','-shared','-fPIC','-nostdlib',str(source),'-o',str(binary),
            '-Wl,-soname,'+binary.name,'-Wl,-z,max-page-size=16384'], check=True)
        archive = self.catalog/(name+'.tar.gz')
        filename = 'usr/lib/'+binary.name
        with tarfile.open(archive,'w:gz') as tar: tar.add(binary,arcname=filename)
        self.index['packages'].append(dict(name=name,version='1',kind='package',artifact=archive.name,
            sha256=file_hash(archive),dependencies=dependencies,android=self.identity,
            android_module=self.index['android_module'],module=dict(files={filename:{'sha256':file_hash(binary)}},
                libraries=[binary.name],namespaces={},source={},min_api=31)))

    def resolve_sdk(self, **changes):
        return squirrel_backend('resolve-sdk',request=dict(self.request,**changes))

    def resolve_modules(self, **changes):
        return squirrel_backend('resolve-modules',request=dict(self.module_request,**changes),
            sdk_base=vars(self.base),work=str(self.root/'work'))

    def test_sdk_media_and_extras_share_one_catalog_and_offline_pin(self):
        sdk = self.resolve_sdk(packages=['extras-fixture'])
        self.assertEqual(sdk['module_packages'],['extras-fixture'])
        self.assertNotIn('extras-fixture',sdk['packages'])
        modules = self.resolve_modules(catalog_lock=sdk['lock'])
        self.assertEqual(set(modules['packages']),{'media-fixture','extras-fixture'})
        self.assertEqual(modules['lock']['repository'],sdk['lock']['repository'])
        self.assertEqual(modules['lock']['sha256'],sdk['lock']['sha256'])
        self.assertEqual(ctypes.CDLL(str(Path(modules['root'])/'usr/lib/libextras.so')).answer(),42)
        self.origin.rename(self.root/'unavailable')
        self.resolve_sdk(packages=['extras-fixture'],locked=sdk['lock'],download=False)
        replay = self.resolve_modules(catalog_lock=sdk['lock'],modules_lock=modules['lock'],offline=True)
        self.assertEqual(replay['lock'],modules['lock'])

    def test_explicit_legacy_module_release_keeps_its_sdk_catalog(self):
        sdk = self.resolve_sdk(module_set='custom-legacy-r1')
        self.assertTrue(sdk['lock']['repository'].endswith('/v1'))
        self.assertEqual(sdk['module_packages'],[])

    def test_catalog_browser_lists_sdk_and_both_module_families(self):
        manifest = self.root/'sqgipkg.json'
        manifest.write_text(json.dumps({'schema_version':2,'name':'Mixed catalog','app_id':'org.sqgi.test',
            'platforms':{'android':{'sdk':'noble-android-r1','repository':self.origin.as_uri()}}}))
        result = subprocess.run([SQGI,ROOT/'tools/sqgipkg','packages','--manifest',manifest,
            '--package-target','x86_64-linux-android','--json'],capture_output=True,text=True)
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
        names = {p['name'] for p in json.loads(result.stdout)['packages']}
        self.assertTrue({'fixture-runtime','media-fixture','extras-fixture'} <= names)

    def test_bad_unified_catalog_never_falls_back_to_valid_legacy(self):
        (self.catalog/'index.json').write_text('{broken')
        with self.assertRaises(ValueError): self.resolve_sdk()
        self.assertFalse(Path(self.request['root']).exists())

    def test_different_sdk_and_module_locks_are_rejected(self):
        sdk = self.resolve_sdk()
        modules = self.resolve_modules(catalog_lock=sdk['lock'])
        pin = dict(modules['lock'],sha256='f'*64)
        with self.assertRaisesRegex(ValueError,'same locked catalog'):
            self.resolve_modules(catalog_lock=sdk['lock'],modules_lock=pin)

    def test_mixed_sdk_and_missing_cross_family_dependency_are_rejected(self):
        self.index['packages'][-1]['android_module'] = dict(self.index['android_module'],sdk_id='wrong')
        self.save_index()
        with self.assertRaisesRegex(ValueError,'Mixed SDK'): self.resolve_sdk()
        self.index['packages'][-1]['android_module'] = self.index['android_module']
        self.index['packages'][-1]['dependencies'] = ['missing-family']
        self.save_index()
        with self.assertRaisesRegex(ValueError,'dependency not found'):
            self.resolve_sdk(refresh=True)

    def test_cross_family_file_collision_preserves_previous_install(self):
        first = self.resolve_modules()
        marker = Path(first['root'])/'.sqgipkg-ooblerg.json'; before = marker.read_bytes()
        self.index['packages'][-1]['module']['files'] = self.index['packages'][-2]['module']['files']
        self.save_index()
        with self.assertRaisesRegex(ValueError,'inventory differs|conflicts'):
            self.resolve_modules(refresh=True)
        self.assertEqual(marker.read_bytes(),before)


class PrebuiltAndroidWrapper(unittest.TestCase):
    save = SDKIntegrity.save
    publish = AndroidPackages.publish
    save_index = AndroidPackages.save_index
    add_module = UnifiedAndroidCatalog.add_module
    resolve_sdk = UnifiedAndroidCatalog.resolve_sdk

    def setUp(self):
        UnifiedAndroidCatalog.setUp(self)
        self.legacy_lock = self.resolve_sdk()['lock']
        self.catalog = self.catalog.with_name('v3')
        shutil.copytree(self.catalog.with_name('v2'), self.catalog)
        self.wrapper = dict(schema=1, package='sqgi-android-wrapper', sources={
            name: file_hash(ROOT/'tools/sqgipkg_lib/android'/name)
            for name in ['platform.c', 'native_entry.c', 'sqgi_android_entry.h']})
        files = {}
        archive = self.catalog/'wrapper.tar.gz'
        with tarfile.open(archive, 'w:gz') as tar:
            for kind in ['platform', 'entry']:
                path = self.root/f'usr/lib/libsqgi-{kind}.so'
                # Use the fixture's valid, dependency-free Android ELF.
                shutil.copyfile(self.root/'usr/lib/libsqgi.so', path)
                name = str(path.relative_to(self.root))
                files[name] = dict(sha256=file_hash(path))
                tar.add(path, arcname=name)
        for profile in self.index['sdk_profiles'].values():
            descriptor = self.catalog/profile['artifact']
            metadata = json.loads(descriptor.read_text())
            metadata.update(application_wrapper=self.wrapper)
            metadata['files'].update(files)
            metadata['file_owners'].update({name: self.wrapper['package'] for name in files})
            descriptor.write_bytes(encoded(metadata))
            profile['sha256'] = file_hash(descriptor)
            for package in self.index['packages']:
                if package['name'] == profile['package']:
                    package['dependencies'].append(self.wrapper['package'])
        self.index['packages'].append(dict(name=self.wrapper['package'],version='1',
            artifact=archive.name,sha256=file_hash(archive),dependencies=[],android=self.identity))
        self.index.update(schema=3, application_wrapper=self.wrapper)
        self.save_index()

    def test_selects_wrapper_catalog_and_preserves_older_locked_catalog(self):
        sdk = self.resolve_sdk()
        self.assertTrue(sdk['lock']['repository'].endswith('/v3'))
        self.assertIn('sqgi-android-wrapper', sdk['packages'])
        self.assertEqual(self.resolve_sdk(locked=self.legacy_lock)['lock'], self.legacy_lock)
        self.origin.rename(self.root/'unavailable')
        self.assertEqual(self.resolve_sdk(locked=sdk['lock'],download=False)['lock'], sdk['lock'])

    def test_wrapper_contract_is_verified_and_never_falls_back(self):
        self.index['application_wrapper'] = dict(self.wrapper, sources={})
        self.save_index()
        with self.assertRaisesRegex(ValueError, 'source identity'):
            self.resolve_sdk()
        self.assertEqual(self.resolve_sdk(locked=self.legacy_lock)['lock'], self.legacy_lock)

    def test_missing_wrapper_dependency_is_rejected(self):
        for package in self.index['packages']:
            if package['name'] == 'sqgi-android-runtime':
                package['dependencies'].remove(self.wrapper['package'])
        self.save_index()
        with self.assertRaisesRegex(ValueError, 'missing the application wrapper'):
            self.resolve_sdk()

    def test_descriptor_wrapper_mismatch_is_rejected(self):
        descriptor = self.catalog/'runtime.json'
        metadata = json.loads(descriptor.read_text())
        metadata['application_wrapper']['sources']['platform.c'] = 'f'*64
        descriptor.write_bytes(encoded(metadata))
        self.index['sdk_profiles']['runtime']['sha256'] = file_hash(descriptor)
        self.save_index()
        with self.assertRaisesRegex(ValueError, 'wrapper contract'):
            self.resolve_sdk()

    def test_source_identity_controls_ndk_fallback(self):
        sdk = self.resolve_sdk()
        metadata = json.loads((Path(sdk['sdk'])/DESCRIPTOR).read_text())
        self.assertEqual(squirrel_backend('wrapper',metadata=metadata), dict(platform=True,entry=True))
        metadata['application_wrapper']['sources']['platform.c'] = 'f'*64
        self.assertEqual(squirrel_backend('wrapper',metadata=metadata), dict(platform=False,entry=True))
        metadata.pop('application_wrapper')
        self.assertEqual(squirrel_backend('wrapper',metadata=metadata), dict(platform=False,entry=False))


class SquirrelNativeExports(unittest.TestCase):
    def test_private_copy_batch_validation_ownership_and_reset(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); sdk_base = root / 'base'; header = sdk_base / 'usr/include/base.h'
            header.parent.mkdir(parents=True); header.write_text('original')
            private = root / 'private'
            squirrel_backend('exports-init', sdk_base=str(sdk_base), root=str(private))
            (private / 'usr/include/base.h').write_text('private')
            self.assertEqual(header.read_text(), 'original')
            squirrel_backend('exports-init', sdk_base=str(sdk_base), root=str(private))
            a = root / 'a'; b = root / 'b'; a.write_text('first'); b.write_text('second')
            def export(owner, installed):
                return squirrel_backend('exports-files', root=str(private), owner=owner, installed=installed)
            with self.assertRaisesRegex(ValueError, 'Conflicting'):
                export('broken', {str(a): '/usr/include/new.h', str(b): '/usr/include/new.h'})
            self.assertFalse((private / 'usr/include/new.h').exists())
            export('first', {str(a): '/usr/include/new.h', str(header): '/usr/include/base.h'})
            export('second', {str(a): '/usr/include/new.h'})
            owners = json.loads((private / '.sqgipkg-native-sdk.json').read_text())['exports']
            self.assertNotIn('usr/include/base.h', owners)
            self.assertEqual(owners['usr/include/new.h']['recipe'], 'first')
            outside = root / 'outside'; outside.mkdir(); (private / 'usr/escape').symlink_to(outside)
            with self.assertRaisesRegex(ValueError, 'escapes'):
                export('escape', {str(a): '/usr/escape/file'})
            with self.assertRaises(ValueError):
                export('escape', {str(a): '/usr/../escape'})
            self.assertFalse((outside / 'file').exists())
            squirrel_backend('exports-init', sdk_base=str(sdk_base), root=str(private))
            self.assertFalse((private / 'usr/include/new.h').exists())
            self.assertNotEqual(header.stat().st_ino, (private / 'usr/include/base.h').stat().st_ino)


@unittest.skipUnless(Path(os.environ.get('SQGI_ANDROID_XMLLINT', '/usr/bin/xmllint')).is_file(), 'libxml2-utils required for SQGI GIR validation')
class SquirrelGIContracts(unittest.TestCase):
    context = SquirrelGIContext
    test_scanner_rejects_missing_target_gir_and_host_paths = NativeContracts.test_scanner_rejects_missing_target_gir_and_host_paths

    def test_host_executable_inside_build_root_is_not_a_target_probe(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); sdk = root / 'sdk'; sdk.mkdir(); build = root / 'build'; build.mkdir()
            binary = build / 'probe'; shutil.copy2('/bin/true', binary)
            context = {'schema': 1, 'abi': 'x86_64', 'sdk': str(sdk), 'allowed_roots': [str(build)], 'readelf': 'readelf', 'library_dirs': []}
            with self.assertRaisesRegex(ValueError, 'Non-Bionic'):
                squirrel_backend('gi-check', context=context, dynamic_paths='', elf=str(binary))
            context['abi'] = 'arm64-v8a'
            with self.assertRaisesRegex(ValueError, 'target ELF'):
                squirrel_backend('gi-check', context=context, dynamic_paths='', elf=str(binary))


class SquirrelSourceContracts(unittest.TestCase):
    def test_git_source_inventory_ignores_sqgipkg_outputs_without_gitignore(self):
        with tempfile.TemporaryDirectory() as temporary:
            source = Path(temporary)
            subprocess.run(['git', 'init', '-q', source], check=True)
            (source / 'main.c').write_text('int main(void) { return 0; }\n')
            def identity():
                return squirrel_backend('native-source-provenance', source=str(source), project={'build_system': 'cmake'})
            initial = identity()
            output = source / 'nested/.sqgipkg/android'
            output.mkdir(parents=True)
            (output / 'libexample.so').write_bytes(b'generated binary')
            self.assertEqual(initial, identity())
            (source / 'main.c').write_text('int main(void) { return 1; }\n')
            self.assertNotEqual(initial['sha256'], identity()['sha256'])

    def test_runtime_compiler_features_change_the_source_lock(self):
        with tempfile.TemporaryDirectory() as temporary:
            source = Path(temporary) / 'source'
            source.mkdir()
            (source / 'CMakeLists.txt').write_text('project(runtime)\n')
            def identity(configuration=None):
                return squirrel_backend('runtime-source-provenance', source=str(source), configuration=configuration)
            default = identity()
            kernel = identity(dict(compiler='llvm', jit=False, kernels=True))
            jit = identity(dict(compiler='llvm', jit=True, kernels=True))
            self.assertEqual(len({default['sha256'], kernel['sha256'], jit['sha256']}), 3)
            self.assertEqual(default['files'], jit['files'])
            for configuration in [dict(compiler='none', jit=True, kernels=False),
                                  dict(compiler='none', jit=False, kernels=True),
                                  dict(compiler='llvm', jit=True, kernels=False)]:
                with self.assertRaises(ValueError):
                    identity(configuration)

    @unittest.skipUnless(shutil.which('cmake') and shutil.which('cc'), 'CMake and C compiler required')
    def test_cmake_flags_survive_cache_parsing_and_spaced_sdk_paths(self):
        with tempfile.TemporaryDirectory(prefix='android flags ') as temp:
            root = Path(temp); sdk = root / 'private sdk'; sdk.mkdir()
            (sdk / 'answer.h').write_text('#define ANSWER 42\n')
            (root / 'main.c').write_text('#include <answer.h>\nint main(void) { return ANSWER != 42; }\n')
            (root / 'CMakeLists.txt').write_text('cmake_minimum_required(VERSION 3.16)\nproject(flags C)\nadd_executable(check main.c)\n')
            flags = squirrel_backend('native-cmake-flags', values=['-O2', '-I' + str(sdk)])
            subprocess.run(['cmake', '-S', str(root), '-B', str(root / 'build'), '-DCMAKE_C_FLAGS=' + flags],
                           check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
            subprocess.run(['cmake', '--build', str(root / 'build')], check=True,
                           stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
            subprocess.run([str(root / 'build/check')], check=True)

    def test_native_source_lock_omits_declared_output_and_lockfile(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); output = root/'custom-output'; output.mkdir()
            (root/'module.c').write_text('source')
            (output/'app.aab').write_text('first build')
            lock = root/'sqgipkg.lock.json'; lock.write_text('first lock')
            args = dict(project={'build_system':'cmake'}, source=str(root), excludes=[str(output),str(lock)])
            before = squirrel_backend('native-source-provenance', **args)
            self.assertEqual(set(before['files']), {'module.c'})
            (output/'app.aab').write_text('second build'); lock.write_text('second lock')
            self.assertEqual(before, squirrel_backend('native-source-provenance', **args))
            with self.assertRaisesRegex(ValueError, 'must not contain native sources'):
                squirrel_backend('native-source-provenance', **dict(args, excludes=[str(root)]))

    def test_source_inventory_inside_ignored_parent_tracks_native_edits(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); subprocess.run(['git','init','-q',str(root)],check=True)
            (root/'.gitignore').write_text('scratch/\n')
            source=root/'scratch/native'; source.mkdir(parents=True)
            (source/'module.c').write_text('original'); (source/'build').mkdir(); (source/'build/generated.o').write_text('output')
            def inventory(): return squirrel_backend('native-source-provenance', project={'build_system':'meson'}, source=str(source))
            before=inventory(); self.assertEqual(set(before['files']),{'module.c'})
            (source/'module.c').write_text('changed'); self.assertNotEqual(before['sha256'],inventory()['sha256'])

    def test_host_adapter_does_not_load_android_libraries(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); sdk = root / 'sdk'; sdk.mkdir(); build = root / 'build'; build.mkdir()
            (build / 'libsqgi.so').write_bytes(b'incompatible target library')
            context = root / 'context.json'
            context.write_text(json.dumps({'schema': 1, 'abi': 'x86_64', 'sdk': str(sdk),
                'allowed_roots': [str(build)], 'readelf': 'readelf', 'library_dirs': []}))
            result = squirrel_backend('native-shims', work=str(root))
            self.assertEqual(Path(result['sqgi']).resolve(), SQGI.resolve())
            env = dict(os.environ, SQGI_ANDROID_CONTEXT=str(context), LD_LIBRARY_PATH=str(build))
            process = subprocess.run([str(Path(result['directory']) / 'gi-ldd'), '/bin/true'], env=env, text=True, capture_output=True)
            self.assertEqual(process.returncode, 1)
            self.assertIn('outside the permitted target roots', process.stderr)

    def test_source_inventory_handles_multiple_and_unusual_git_paths(self):
        with tempfile.TemporaryDirectory() as directory:
            source = Path(directory)
            subprocess.run(['git', 'init', '-q', str(source)], check=True)
            (source / '.gitignore').write_text('ignored/\n')
            for name in ['first.c', 'with spaces.c', 'with\nnewline.c', 'λ.c']:
                (source / name).write_text(name)
            (source / 'ignored').mkdir(); (source / 'ignored/cache').write_text('not a source')
            subprocess.run(['git', '-C', str(source), 'add', 'first.c'], check=True)
            project = {'name': 'fixture', 'build_system': 'custom', 'build': [{'argv': ['${SQGI}', 'build.nut']}]}
            result = squirrel_backend('native-source-provenance', project=project, source=str(source))
            self.assertEqual(result, source_provenance(project, source))
            self.assertEqual(set(result['files']), {'.gitignore', 'first.c', 'with spaces.c', 'with\nnewline.c', 'λ.c'})

    def test_hook_substitution_preserves_literal_shell_text(self):
        value = 'prefix ${INPUT} ${INPUT} $(literal) `literal`'
        result = squirrel_backend('native-expand', value=value, variables={'INPUT': 'a b;$(never) $HOME'})
        self.assertEqual(result, 'prefix a b;$(never) $HOME a b;$(never) $HOME $(literal) `literal`')
        with self.assertRaisesRegex(ValueError, 'Unknown'):
            squirrel_backend('native-expand', value='${MISSING}', variables={})


class SquirrelAndroidImage(unittest.TestCase):
    def test_partition_checksums_extent_bounds_and_unsupported_layouts(self):
        import hashlib
        def checksum(data, start, length, field):
            data[start + field:start + field + 32] = bytes(32)
            data[start + field:start + field + 32] = hashlib.sha256(data[start:start + length]).digest()
        image = bytearray(131072)
        struct.pack_into('<II', image, 4096, 0x616c4467, 52)
        struct.pack_into('<III', image, 4096 + 40, 4096, 1, 512)
        checksum(image, 4096, 52, 8)
        header, tables = 12288, 12416
        struct.pack_into('<IHHI', image, header, 0x414c5030, 10, 0, 128)
        struct.pack_into('<I', image, header + 44, 164)
        struct.pack_into('<III', image, header + 80, 0, 1, 52)
        struct.pack_into('<III', image, header + 92, 52, 2, 24)
        struct.pack_into('<III', image, header + 116, 100, 1, 64)
        struct.pack_into('<36sIIII', image, tables, b'system', 1, 0, 2, 0)
        struct.pack_into('<QIQI', image, tables + 52, 1, 0, 128, 0)
        struct.pack_into('<QIQI', image, tables + 76, 1, 1, 0, 0)
        struct.pack_into('<Q', image, tables + 100, 128)
        struct.pack_into('<Q', image, tables + 116, len(image))
        def seal(data):
            data[header + 48:header + 80] = hashlib.sha256(data[tables:tables + 164]).digest()
            checksum(data, header, 128, 12)
        seal(image)
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'image'
            def parse(data):
                path.write_bytes(data)
                return squirrel_backend('image-partitions', path=str(path), start=0, size=len(image))
            self.assertEqual(parse(image), {'system': [[65536, 512], [None, 512]]})
            corrupt = bytearray(image); corrupt[4104] ^= 1
            with self.assertRaisesRegex(ValueError, 'checksum'): parse(corrupt)
            corrupt = bytearray(image); corrupt[tables + 160] ^= 1
            with self.assertRaisesRegex(ValueError, 'checksum'): parse(corrupt)
            for name, offset, fmt, value in [('extent-kind', tables + 60, '<I', 2),
                ('extent-bounds', tables + 64, '<Q', 256), ('device-count', header + 120, '<I', 2),
                ('table-bounds', header + 84, '<I', 20), ('version', header + 4, '<H', 11)]:
                corrupt = bytearray(image); struct.pack_into(fmt, corrupt, offset, value); seal(corrupt)
                with self.subTest(name=name), self.assertRaises(ValueError): parse(corrupt)
            with self.assertRaisesRegex(ValueError, 'Truncated'): parse(image[:4110])


class SquirrelDeviceContracts(unittest.TestCase):
    def test_device_selection_prefers_native_abi_and_rejects_ambiguity(self):
        devices = [dict(serial='phone', state='device', api=31, abis=['arm64-v8a']),
                   dict(serial='emulator', state='device', api=34, abis=['x86_64', 'arm64-v8a'])]
        def select(serial='', minimum=31, abis=None, candidates=None):
            return squirrel_backend('device-select', devices=devices if candidates is None else candidates,
                                    serial=serial, minimum=minimum, abis=abis or ['arm64-v8a', 'x86_64'])
        self.assertEqual(select('emulator')['abi'], 'x86_64')
        self.assertEqual(select('emulator', abis=['arm64-v8a'])['abi'], 'arm64-v8a')
        self.assertEqual(select(minimum=33)['serial'], 'emulator')
        with self.assertRaisesRegex(ValueError, 'More than one'): select()
        with self.assertRaisesRegex(ValueError, 'No compatible'): select('missing')
        with self.assertRaisesRegex(ValueError, 'incompatible'): select('phone', minimum=33)
        with self.assertRaisesRegex(ValueError, 'incompatible'):
            select('phone', candidates=[dict(devices[0], state='unauthorized')])

    def test_source_updates_allow_entry_changes_but_reject_native_and_runtime_changes(self):
        project = dict(application_id='org.example.App', entry='main.nut', namespaces=['Gtk-4.0'],
                       development=dict(sdk='noble-android-r1', native=[dict(source='abc')]))
        def check(current, installed=project):
            return squirrel_backend('development-compatible', installed=installed, current=current)
        self.assertTrue(check(dict(project, entry='new.nut')))
        for change in [dict(namespaces=['Gst-1.0']), dict(application_id='org.example.Other'),
                       dict(development=dict(sdk='other', native=[])),
                       dict(development=dict(sdk='noble-android-r1', native=[dict(source='changed')]))]:
            with self.subTest(change=change), self.assertRaisesRegex(ValueError, 'rebuild'):
                check(dict(project, **change))
        with self.assertRaisesRegex(ValueError, 'predates'):
            check(project, installed={k:v for k,v in project.items() if k != 'development'})

    def test_snapshots_are_complete_and_reject_native_payloads_and_symlinks(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); (root/'main.nut').write_text('print("hello")')
            (root/'deleted.txt').write_text('old')
            def snapshot():
                return squirrel_backend('development-snapshot', source=str(root),
                                        project={'entry':'main.nut'}, base_id='base-hash')
            first = snapshot(); self.assertEqual(first['base_id'], 'base-hash')
            (root/'deleted.txt').unlink(); self.assertNotIn('deleted.txt', snapshot()['files'])
            (root/'library').write_bytes(b'\x7fELFextra')
            with self.assertRaisesRegex(ValueError, 'Native/runtime'): snapshot()
            (root/'library').unlink(); (root/'link').symlink_to(root/'main.nut')
            with self.assertRaisesRegex(ValueError, 'regular files'): snapshot()


class SquirrelNativeEntryContracts(unittest.TestCase):
    def test_entry_ownership_and_interface_identity_are_checked(self):
        entry={'project':'application','library':'libapp.so','symbol':'app_main'}
        project={'name':'application','libraries':['libapp.so'],
                 'source':{'recipe':{'android_entry_header':file_hash(ROOT/'tools/sqgipkg_lib/android/sqgi_android_entry.h')}}}
        self.assertTrue(squirrel_backend('native-entry',entry=entry,projects=[project]))
        with self.assertRaisesRegex(ValueError,'declared native recipe'):
            squirrel_backend('native-entry',entry=entry,projects=[dict(project,name='other')])
        with self.assertRaisesRegex(ValueError,'interface identity'):
            squirrel_backend('native-entry',entry=entry,projects=[dict(project,source={})])

    def test_selector_and_exports_fail_before_packaging(self):
        entry={'project':'application','library':'libapp.so','symbol':'app_main','shutdown':'app_shutdown'}
        self.assertTrue(squirrel_backend('native-entry',entry=entry))
        for changed in [dict(library='../libapp.so'),dict(library='app.exe'),dict(symbol='C++::main'),
                        dict(abi_version=2),dict(library='libsqgi.so'),dict(unexpected=True)]:
            with self.subTest(changed=changed),self.assertRaises(ValueError):
                squirrel_backend('native-entry',entry=dict(entry,**changed))
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);source=root/'entry.c';library=root/'libapp.so'
            source.write_text('int app_main(void) { return 0; }\nvoid app_shutdown(void) {}\n')
            subprocess.run(['/usr/bin/cc','-shared','-fPIC',str(source),'-o',str(library)],check=True)
            self.assertTrue(squirrel_backend('native-entry',entry=entry,library=str(library)))
            with self.assertRaisesRegex(ValueError,'no exported C function'):
                squirrel_backend('native-entry',entry=dict(entry,symbol='missing'),library=str(library))


class AndroidProjectMigration(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='sqgi project = café ')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.source = self.root/'src'
        (self.source/'app').mkdir(parents=True)
        (self.source/'lib').mkdir()
        (self.source/'app/start.nut').write_text('local module = import("../lib/tool.nut"); print(module.message)\n')
        (self.source/'lib/tool.nut').write_text('return { message = "hello" }\n')
        (self.source/'a=b {literal}.txt').write_text('asset bytes λ\n')
        self.legacy = {'schema': 1, 'application_id': 'org.sqgi.migration', 'name': 'Migration λ',
                       'source_dir': 'src', 'entry': 'app/start.nut', 'version_code': 7,
                       'version_name': '0.7', 'namespaces': ['Gtk-4.0']}
        self.save()

    def save(self):
        (self.root/'sqgi.json').write_text(json.dumps(self.legacy))

    def cli(self, *args, success=True):
        result = subprocess.run([SQGI, ROOT/'tools/sqgipkg', *args], cwd=self.root, capture_output=True, text=True)
        self.assertEqual(result.returncode == 0, success, result.stdout+result.stderr)
        return result

    def inventory(self, root):
        return {p.relative_to(root).as_posix(): p.read_bytes() for p in root.rglob('*') if p.is_file()}

    def test_migration_preserves_nested_entry_and_assets_on_all_platforms(self):
        before = self.inventory(self.root)
        self.cli('migrate')
        manifest = self.root/'sqgipkg.json'
        value = json.loads(manifest.read_text())
        self.assertEqual(value['app_id'], self.legacy['application_id'])
        self.assertEqual(value['platforms']['android']['version_code'], 7)
        self.assertEqual(value['entry']['source_root'], 'src')
        for path, data in before.items(): self.assertEqual((self.root/path).read_bytes(), data)
        expected = self.inventory(self.source)
        for target in ['android-apk', 'appimage', 'win-dir']:
            staged = self.root/('staged-'+target)
            result = squirrel_backend('project-stage', manifest=str(manifest), target=target, destination=str(staged))
            source = staged/('share/sqgi/app' if target=='win-dir' else 'usr/share/sqgi/app')
            self.assertEqual(self.inventory(source), expected, target)
            entry = result['project']['entry'] if target=='android-apk' else result['entry'].split('sqgi/app/',1)[1]
            self.assertEqual(entry, 'app/start.nut')

    def test_existing_destinations_and_sources_are_never_overwritten(self):
        self.cli('migrate')
        before = self.inventory(self.root)
        self.cli('migrate', success=False)
        self.assertEqual(self.inventory(self.root), before)
        self.cli('migrate', '--from-sqgi', 'sqgi.json', '--manifest', 'converted.json')
        self.assertEqual((self.root/'sqgipkg.json').read_bytes(), before['sqgipkg.json'])
        link = self.root/'link.json'; link.symlink_to(self.root/'missing')
        self.cli('migrate', '--manifest', str(link), success=False)
        self.assertTrue(link.is_symlink()); self.assertFalse((self.root/'missing').exists())

    def test_invalid_legacy_inputs_do_not_create_output(self):
        original = copy.deepcopy(self.legacy)
        for field, value in [('future', 1), ('schema', True), ('version_code', False), ('entry', '../escape.nut'), ('namespaces', ['../Gtk-4.0'])]:
            self.legacy = copy.deepcopy(original); self.legacy[field] = value; self.save()
            self.cli('migrate', success=False)
            self.assertFalse((self.root/'sqgipkg.json').exists())
        self.legacy = original; self.save()
        (self.source/'link.txt').symlink_to(self.source/'lib/tool.nut')
        self.cli('migrate', success=False)
        self.assertFalse((self.root/'sqgipkg.json').exists())

    def test_migration_rejects_unapplied_options(self):
        for options in [('--name', 'Ignored'), ('--app-id', 'org.ignored'), ('--platform', 'linux'), ('--locked',)]:
            result = self.cli('migrate', *options, success=False)
            self.assertIn('migrate cannot use '+options[0], result.stdout+result.stderr)
            self.assertFalse((self.root/'sqgipkg.json').exists())
        result = self.cli('migrate', 'ignored.json', success=False)
        self.assertIn('positional arguments are not accepted', result.stdout+result.stderr)
        self.assertFalse((self.root/'sqgipkg.json').exists())

    def test_root_source_inventory_excludes_new_manifest_and_later_outputs(self):
        self.legacy['source_dir']='.'; self.legacy['entry']='src/app/start.nut'; self.save()
        before = self.inventory(self.root); before.pop('sqgi.json')
        self.cli('migrate')
        staged = self.root/'stage'
        result = squirrel_backend('project-stage', manifest=str(self.root/'sqgipkg.json'), target='android-apk', destination=str(staged))
        self.assertEqual(result['project']['entry'], 'src/app/start.nut')
        self.assertEqual(self.inventory(staged/'usr/share/sqgi/app'), before)

    def test_android_starter_keeps_existing_sources_and_refuses_reinitialization(self):
        self.cli('init', 'android-gtk4', '--app-id', 'org.sqgi.starter', '--name', 'Hello "λ"')
        value = json.loads((self.root/'sqgipkg.json').read_text())
        self.assertEqual(value['app_id'], 'org.sqgi.starter')
        self.assertIn('org.sqgi.starter', (self.source/'main.nut').read_text())
        self.assertTrue((self.source/'app/start.nut').is_file())
        self.assertTrue((self.source/'message.txt').is_file())
        before = self.inventory(self.root)
        self.cli('init', 'android-gtk4', success=False)
        self.assertEqual(self.inventory(self.root), before)
        self.cli('explain', '--platform', 'android', '--json')

    def test_source_root_must_contain_the_entry(self):
        (self.root/'sqgipkg.json').write_text(json.dumps({'schema_version':2,'entry':{'type':'sqgi','script':'src/app/start.nut','source_root':'other'}}))
        result = self.cli('explain', '--json', success=False)
        self.assertEqual(json.loads(result.stdout)['diagnostics'][0]['path'], ['entry','source_root'])


class AndroidCompatibility(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='sqgi compat = café ')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def cli(self, *args, success=True):
        result = subprocess.run([SQGI, ROOT/'tools/sqgipkg', 'android-compat', *args], cwd=self.root, capture_output=True, text=True)
        self.assertEqual(result.returncode == 0, success, result.stdout+result.stderr)
        return result

    def create(self):
        self.cli('init', 'app', '--id', 'org.sqgi.compat', '--name', 'Compatibility λ')
        return self.root/'app'

    def test_init_and_explain_use_the_shared_template_and_resolver(self):
        project = self.create()
        self.assertTrue((project/'src/message.txt').is_file())
        manifest = json.loads((project/'sqgipkg.json').read_text())
        self.assertEqual(manifest['app_id'], 'org.sqgi.compat')
        result = json.loads(self.cli('explain', '--project', str(project), '--abi', 'arm64-v8a', '--json').stdout)
        self.assertTrue(result['ok'])
        self.assertEqual(result['configurations'][0]['architecture'], 'arm64-v8a')
        self.cli('init', 'app', '--id', 'org.changed', success=False)
        self.assertEqual(json.loads((project/'sqgipkg.json').read_text()), manifest)

    def test_legacy_only_project_requires_explicit_migration(self):
        (self.root/'src').mkdir(); (self.root/'src/main.nut').write_text('print("hello")\n')
        (self.root/'sqgi.json').write_text(json.dumps({'schema':1,'application_id':'org.sqgi.legacy','name':'Legacy'}))
        result = self.cli('check', '--project', str(self.root), success=False)
        self.assertIn('sqgipkg migrate', result.stdout)
        self.assertFalse((self.root/'sqgipkg.json').exists())
        self.cli('migrate', '--project', str(self.root))
        result = json.loads(self.cli('explain', '--project', str(self.root), '--json').stdout)
        self.assertTrue(result['ok'])

    def test_producer_defaults_preserve_explicit_sdk_and_output_choices(self):
        project = self.create(); producer = self.root/'producer'
        (producer/'sdk').mkdir(parents=True)
        (producer/'.cache/tools/android-ndk-r28c').mkdir(parents=True)
        (producer/'.cache/tools/android-ndk-r28c/source.properties').write_text('fixture')
        args = ['build','--producer-root',str(producer),'--project',str(project)]
        with mock.patch.dict(os.environ):
            os.environ.pop('ANDROID_NDK_HOME', None)
            result = squirrel_backend('compat', args=args)['args']
        self.assertIn(str(producer/'sdk'), result); self.assertIn(str(producer/'dist'), result)
        self.assertIn(str(producer/'.cache/tools/android-ndk-r28c'), result)
        result = squirrel_backend('compat', args=args+['--android-sdk','selected-sdk','--output','selected-output'])['args']
        self.assertIn('selected-sdk', result); self.assertNotIn(str(producer/'sdk'), result)
        self.assertNotIn(str(producer/'dist'), result)
        config = json.loads((project/'sqgipkg.json').read_text()); config['platforms']['android']['repository']='https://example.invalid'
        (project/'sqgipkg.json').write_text(json.dumps(config))
        result = squirrel_backend('compat', args=args)['args']
        self.assertNotIn('--android-sdk', result)

    def test_bundle_alias_resolves_aab_without_building(self):
        project = self.create()
        result = squirrel_backend('compat', args=['bundle','--project',str(project),'--abi=arm64-v8a'])
        self.assertEqual(result['args'][0], 'build')
        self.assertIn('android-aab', result['args']); self.assertIn('arm64-v8a', result['args'])

    def test_legacy_deploy_preserves_install_then_run_without_rebuilding(self):
        project = self.create()
        result = squirrel_backend('compat', args=['deploy','--project',str(project),'--artifact','chosen.apk'])
        self.assertEqual(result['args'][0], 'install')
        self.assertIn('chosen.apk', result['args'])
        self.assertEqual(result['next_args'][0], 'run')
        self.assertNotIn('--artifact', result['next_args'])

    def test_conflicting_or_unsupported_arguments_fail(self):
        project = self.create()
        for args in [['--project',str(project),'--manifest','sqgipkg.json'], ['--abi','x86_64','--arch','arm64-v8a'], ['--unknown'], ['unexpected']]:
            self.cli('build', *args, success=False)


if __name__ == '__main__':
    unittest.main()
