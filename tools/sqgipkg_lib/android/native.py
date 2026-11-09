"""Build ordered application recipes against a private Android dependency SDK."""
import importlib.util
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET

from common import atomic_json, digest, encoded, file_hash
from elf import inspect, remove_build_rpath
from inspection import Inspection, inventory
from sdk import SDK, DESCRIPTOR, TARGETS

HERE = Path(__file__).resolve().parent
_spec = importlib.util.spec_from_file_location('sqgipkg_native_exports', HERE.parent / 'native_sdk.py')
exports = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(exports)
LINK_FLAGS = ['-Wl,-z,max-page-size=16384', '-Wl,-z,common-page-size=16384']


def ordered(projects):
    names, result, state = {}, [], {}
    for project in projects:
        name = project['name']
        if not re.fullmatch(r'[A-Za-z0-9_][A-Za-z0-9_.+-]*', name) or name in names or name == 'sqgi':
            raise ValueError('Invalid or duplicate native recipe name: ' + name)
        names[name] = project
    def visit(name):
        if name not in names:
            raise ValueError('Unknown native recipe dependency: ' + name)
        if state.get(name) == 'visiting':
            raise ValueError('Native recipe dependency cycle: ' + name)
        if state.get(name) == 'done':
            return
        state[name] = 'visiting'
        for dependency in names[name].get('depends_on', []):
            visit(dependency)
        result.append(names[name]); state[name] = 'done'
    for project in projects:
        visit(project['name'])
    return result


def clean_environment():
    env = dict(os.environ)
    from signing import VARIABLES as signing_variables
    for key in signing_variables:
        env.pop(key, None)
    for key in ['CC', 'CXX', 'CPP', 'AR', 'AS', 'LD', 'NM', 'RANLIB', 'STRIP', 'CFLAGS', 'CXXFLAGS',
                'CPPFLAGS', 'LDFLAGS', 'CPATH', 'C_INCLUDE_PATH', 'CPLUS_INCLUDE_PATH', 'LIBRARY_PATH',
                'LD_LIBRARY_PATH', 'LD_PRELOAD', 'PKG_CONFIG_PATH', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_SYSROOT_DIR',
                'GI_TYPELIB_PATH', 'GI_GIR_PATH', 'VALAFLAGS', 'PYTHONPATH', 'CONDA_PREFIX', 'CMAKE_PREFIX_PATH']:
        env.pop(key, None)
    env.update(PATH='/usr/bin:/bin', LC_ALL='C.UTF-8', TZ='UTC', PYTHONHASHSEED='0')
    return env


def run(argv, env, cwd=None):
    print('sqgipkg Android native: ' + shlex.join(map(str, argv)), flush=True)
    subprocess.run(list(map(str, argv)), env=env, cwd=cwd, check=True)


def hooks(commands, env, source):
    for command in commands:
        if isinstance(command, str):
            raise ValueError('Android native hooks require portable {argv: [...]} commands')
        # Expand only declared context variables, without shell evaluation.
        def expand(value, variables):
            def replace(match):
                if match[1] not in variables:
                    raise ValueError('Unknown native hook context variable: ' + match[1])
                return variables[match[1]]
            return re.sub(r'\$\{([A-Za-z_][A-Za-z0-9_]*)\}', replace, value)
        merged = dict(env, **{k: expand(v, env) for k, v in command.get('env', {}).items()})
        run([expand(a, merged) for a in command['argv']], merged, source)


def gir_catalog(prefix):
    ns = '{http://www.gtk.org/introspection/core/1.0}'
    result = {}
    for typelib in (prefix / 'lib/girepository-1.0').glob('*.typelib'):
        gir = prefix / 'share/gir-1.0' / (typelib.stem + '.gir')
        document = ET.parse(gir).getroot()
        definition = document.find(ns + 'namespace')
        if definition is None or definition.get('name') + '-' + definition.get('version') != typelib.stem:
            raise ValueError('Native GIR/typelib identity mismatch: ' + str(gir))
        result[typelib.stem] = {'includes': [i.get('name') + '-' + i.get('version') for i in document.findall(ns + 'include')],
            'libraries': list(filter(None, definition.get('shared-library', '').split(','))),
            'typelib': 'usr/lib/girepository-1.0/' + typelib.name, 'gir_sha256': file_hash(gir)}
    for name, record in result.items():
        if any(n not in result for n in record['includes']):
            raise ValueError('Incomplete native GI dependencies: ' + name)
        for library in record['libraries']:
            if '/' in library or not library.endswith('.so') or not (prefix / 'lib' / library).is_file():
                raise ValueError('Invalid/missing Android GI backing library: ' + name + ': ' + library)
    return result


def source_provenance(project, source):
    try:
        tracked = subprocess.check_output(['git', '-C', source, 'ls-files', '-co', '--exclude-standard', '-z', '--', '.'],
                                          stderr=subprocess.DEVNULL).decode().split('\0')
        paths = [source / name for name in tracked if name]
    except subprocess.CalledProcessError:
        paths = [p for p in source.rglob('*') if not any(part in {'.git', '.sqgipkg', 'build', '_build', 'target'}
                                                       for part in p.relative_to(source).parts)]
    files = {p.relative_to(source).as_posix(): file_hash(p) for p in sorted(paths) if p.is_file()}
    recipe = {key: project.get(key) for key in ['build_system', 'gi', 'options', 'targets', 'build', 'install', 'depends_on']}
    return {'files': files, 'recipe': recipe, 'sha256': digest(encoded({'files': files, 'recipe': recipe}))}


def build(request, base, work, ndk, readelf):
    projects = ordered(request.get('native', []))
    if not projects:
        return base, [], [], {}
    for project in projects:
        if project.get('files'):
            raise ValueError('Android native files rules are not yet supported; install SDK exports under /usr and use application files for assets: ' + project['name'])
        if (project.get('gi') or {}).get('strategy') == 'host':
            raise ValueError('Android requires gi.strategy auto or target; host metadata is not portable: ' + project['name'])
    from modules import resolve as resolve_modules
    modules = resolve_modules(request, base, work, readelf)
    sources = [p for p in projects if not p.get('android_package')]
    host = clean_environment()
    if sources:
        version = subprocess.check_output(['/usr/bin/g-ir-scanner', '--version'], env=host, text=True).strip()
        if version != 'g-ir-scanner 1.80.1':
            raise ValueError('Android native metadata requires pinned host g-ir-scanner 1.80.1')
    runner = request.get('runner', 'auto')
    if runner not in ('auto', 'qemu', 'adb'):
        raise ValueError('Android GI runner must be auto, qemu or adb')
    inspection = None
    if not sources:
        runner_metadata = {'method': 'prebuilt', 'abi': request['abi']}
    elif runner != 'adb':
        inspection = Inspection(request['abi'], request.get('inspection_root') or None)
        if request.get('inspection_root'):
            inspection.validate()
        else:
            inspection.prepare(request.get('offline', False))
        runner_metadata = {'method': 'qemu-user', 'abi': request['abi'],
                           'manifest_sha256': file_hash(inspection.manifest), 'inputs': inspection.identity}
    else:
        adb = [request.get('adb', 'adb')]
        if request.get('serial'):
            adb += ['-s', request['serial']]
        runner_metadata = {'method': 'adb', 'abi': request['abi'], 'properties': {}}
        for key in ['ro.build.fingerprint', 'ro.product.cpu.abilist', 'ro.dalvik.vm.native.bridge']:
            runner_metadata['properties'][key] = subprocess.check_output([*adb, 'shell', 'getprop', key], text=True).strip()
        if runner_metadata['properties']['ro.product.cpu.abilist'].split(',')[0] != request['abi']:
            raise ValueError('ADB GI probes require the device native ABI; use qemu for ' + request['abi'])
    inspection_sha256 = digest(encoded(runner_metadata))
    if request.get('inspection_sha256') and request['inspection_sha256'] != inspection_sha256:
        raise ValueError('Android inspection runtime differs from the locked input')
    root = work / 'native-sdk'
    exports.initialize(base.root, root)
    prefix = root / 'usr'
    if sources and not (prefix / 'bin/g-ir-compiler').is_file():
        raise ValueError('Android native recipes require the SDK tools profile')
    build_root = work / 'native'
    build_root.mkdir(parents=True, exist_ok=True)
    bin_dir = ndk / 'toolchains/llvm/prebuilt/linux-x86_64/bin'
    abi, api = request['abi'], request['application']['min_sdk']
    triple = TARGETS[abi]
    cc, cxx = bin_dir / (triple + str(api) + '-clang'), bin_dir / (triple + str(api) + '-clang++')
    shims = work / 'native-tools'
    shims.mkdir(parents=True, exist_ok=True)
    for name, action in [('g-ir-scanner', 'scan'), ('g-ir-compiler', 'compile'), ('gi-exec', 'exec'), ('gi-ldd', 'ldd')]:
        path = shims / name
        path.write_text('#!/bin/sh\nexec /usr/bin/python3 ' + shlex.quote(str(HERE / 'gi.py')) + ' ' + action + ' "$@"\n')
        path.chmod(0o755)
    results, roots, namespaces, exported_packages = [], [], [], set()
    for project in projects:
        name, system = project['name'], project.get('build_system') or 'custom'
        if project.get('android_package'):
            from packages import transport
            package = project['android_package']
            selected = modules['packages'][package]['metadata']['module']
            for entry in transport.closure(modules['catalog'], [package]):
                if entry['name'] in exported_packages:
                    continue
                exported_packages.add(entry['name'])
                installed = {str(modules['root'] / n): '/' + n for n in entry['module']['files']}
                exports.export_files(root, name if entry['name'] == package else 'ooblerg:' + entry['name'], installed)
            gi = project.get('gi')
            if gi and gi['namespace'] + '-' + gi['version'] not in selected['namespaces']:
                raise ValueError('Prebuilt Android package lacks the declared namespace: ' + name)
            if project.get('stage', True):
                roots.extend(selected['libraries']); namespaces.extend(selected['namespaces'])
            results.append({'name': name, 'build_system': 'package', 'package': package,
                            'min_api': selected['min_api'],
                            'depends_on': project.get('depends_on', []), 'source': selected['source'],
                            'libraries': selected['libraries'], 'namespaces': sorted(selected['namespaces'])})
            continue
        if system not in ('meson', 'cmake', 'custom'):
            raise ValueError('Unknown Android native build system: ' + system)
        source, directory = Path(project['dir']).resolve(), build_root / name
        if not source.is_dir():
            raise ValueError('Native source directory is missing: ' + str(source))
        source_inputs = source_provenance(project, source)
        directory.mkdir(exist_ok=True)
        install = directory / 'install'
        if install.exists():
            shutil.rmtree(install)
        install.mkdir()
        config = directory / 'android-context.json'
        atomic_json(config, {'schema': 1, 'abi': abi, 'sdk': str(root), 'allowed_roots': [str(directory), str(source)],
            'library_dirs': [str(directory)], 'readelf': str(readelf), 'runner': 'adb' if runner == 'adb' else 'qemu',
            'inspection_root': str(inspection.directory) if inspection else '', 'adb': request.get('adb', 'adb'),
            'serial': request.get('serial', ''), 'binary_wrapper': str(shims / 'gi-exec'), 'ldd_wrapper': str(shims / 'gi-ldd')})
        environment = dict(host, PATH=str(shims) + ':/usr/bin:/bin', CC=str(cc), CXX=str(cxx),
            AR=str(bin_dir / 'llvm-ar'), RANLIB=str(bin_dir / 'llvm-ranlib'), NM=str(bin_dir / 'llvm-nm'),
            STRIP=str(bin_dir / 'llvm-strip'), PKG_CONFIG='/usr/bin/pkg-config', PKG_CONFIG_PATH='',
            PKG_CONFIG_LIBDIR=str(prefix / 'lib/pkgconfig') + ':' + str(prefix / 'share/pkgconfig'),
            PKG_CONFIG_SYSROOT_DIR=str(root), GI_GIR_PATH=str(prefix / 'share/gir-1.0'),
            XDG_DATA_DIRS=str(prefix / 'share'), SQGI_ANDROID_CONTEXT=str(config),
            SQGI_ANDROID_ABI=abi, ANDROID_ABI=abi, ANDROID_API=str(api), ANDROID_NDK_HOME=str(ndk),
            ANDROID_NDK_ROOT=str(ndk), SQGI_NATIVE_SDK=str(root), BUILD_DIR=str(directory),
            SOURCE_DIR=str(source), DESTDIR=str(install), GI_SCANNER=str(shims / 'g-ir-scanner'),
            GI_COMPILER=str(shims / 'g-ir-compiler'), GI_RUNNER=str(shims / 'gi-exec'),
            SOURCE_DATE_EPOCH=str(base.metadata['source_lock']['build']['source_date_epoch']))
        # Compiler CRT/headers still come from the official NDK sysroot. Only
        # GNOME's dependency prefix is added through these include/link flags.
        cflags = ['-O2', '-fPIC', '-I' + str(prefix / 'include'), '-ffile-prefix-map=' + str(source) + '=/usr/src/' + name]
        ldflags = ['-L' + str(prefix / 'lib'), *LINK_FLAGS]
        environment.update(CFLAGS=shlex.join(cflags), CXXFLAGS=shlex.join(cflags), LDFLAGS=shlex.join(ldflags))
        environment['CARGO'] = shutil.which('cargo') or 'cargo'
        environment['RUSTC'] = shutil.which('rustc') or 'rustc'
        environment['VALAFLAGS'] = '--vapidir=' + str(prefix / 'share/vala/vapi')
        cross = directory / 'android.ini'
        cross.write_text('\n'.join(['[binaries]', 'c = ' + repr(str(cc)), 'cpp = ' + repr(str(cxx)),
            'ar = ' + repr(str(bin_dir / 'llvm-ar')), 'strip = ' + repr(str(bin_dir / 'llvm-strip')),
            "pkg-config = '/usr/bin/pkg-config'", "vala = '/usr/bin/valac'",
            'g-ir-scanner = ' + repr(str(shims / 'g-ir-scanner')), 'g-ir-compiler = ' + repr(str(shims / 'g-ir-compiler')),
            'exe_wrapper = ' + repr(str(shims / 'gi-exec')), '[host_machine]', "system = 'android'",
            'cpu_family = ' + repr('aarch64' if abi == 'arm64-v8a' else 'x86_64'),
            'cpu = ' + repr('armv8' if abi == 'arm64-v8a' else 'x86_64'), "endian = 'little'",
            '[properties]', 'needs_exe_wrapper = true', 'sys_root = ' + repr(str(root)),
            'pkg_config_libdir = ' + repr(environment['PKG_CONFIG_LIBDIR'].split(':')),
            '[built-in options]', 'c_args = ' + repr(cflags), 'cpp_args = ' + repr(cflags),
            'vala_args = ' + repr(['--vapidir=' + str(prefix / 'share/vala/vapi')]),
            'c_link_args = ' + repr(ldflags), 'cpp_link_args = ' + repr(ldflags), '']))
        toolchain = ndk / 'build/cmake/android.toolchain.cmake'
        environment.update(MESON_CROSS_FILE=str(cross), CMAKE_TOOLCHAIN_FILE=str(toolchain))
        options = project.get('options', {})
        settings = ['-D' + key + '=' + (str(value).lower() if isinstance(value, bool) else str(value)) for key, value in sorted(options.items())]
        if system == 'meson':
            configure = ['meson', 'setup', directory, source, '--cross-file', cross, '--prefix=/usr', '--libdir=lib',
                         '--buildtype=release', '--wrap-mode=nodownload', *settings]
            if (directory / 'meson-private/coredata.dat').exists():
                configure += ['--reconfigure', '--clearcache']
            run(configure, environment)
            run(['meson', 'compile', '-C', directory, *project.get('targets', [])], environment)
        elif system == 'cmake':
            run(['cmake', '-S', source, '-B', directory, '-G', 'Ninja', '-DCMAKE_BUILD_TYPE=Release',
                 '-DCMAKE_TOOLCHAIN_FILE=' + str(toolchain), '-DANDROID_ABI=' + abi, '-DANDROID_PLATFORM=android-' + str(api),
                 '-DANDROID_STL=c++_shared', '-DCMAKE_INSTALL_PREFIX=/usr', '-DCMAKE_INSTALL_LIBDIR=lib', '-DCMAKE_SKIP_RPATH=ON',
                 '-DCMAKE_FIND_ROOT_PATH=' + str(root), '-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER',
                 '-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY', '-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY',
                 '-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY', *settings], environment)
            targets = ['--target', *project['targets']] if project.get('targets') else []
            run(['cmake', '--build', directory, *targets], environment)
        hooks(project.get('build', []), environment, source)
        if system == 'meson':
            run(['meson', 'install', '-C', directory, '--no-rebuild', '--destdir', install], environment)
        elif system == 'cmake':
            run(['cmake', '--install', directory], environment)
        hooks(project.get('install', []), environment, source)
        installed = {str(p): '/' + p.relative_to(install).as_posix() for p in install.rglob('*') if p.is_file()}
        # install:false recipes remain useful. Export discovered libraries and
        # GI metadata, while headers/.pc/VAPI require explicit install rules.
        output_libraries = project.get('libraries') or ([] if any(re.search(r'\.so(?:\.[0-9]+)*$', p) for p in installed.values()) else [str(p) for p in directory.rglob('*.so*')
            if p.is_file() and re.search(r'\.so(?:\.[0-9]+)*$', p.name) and not p.is_relative_to(install) and 'CMakeFiles' not in p.parts]
        )
        output_typelibs = project.get('typelibs') or [str(p) for p in directory.rglob('*.typelib')
            if p.is_file() and not p.is_relative_to(install)]
        for path in output_libraries:
            path = Path(path)
            if '/usr/lib/' + path.name not in installed.values():
                installed[str(path)] = '/usr/lib/' + path.name
        for path in output_typelibs:
            path = Path(path)
            if '/usr/lib/girepository-1.0/' + path.name not in installed.values():
                installed[str(path)] = '/usr/lib/girepository-1.0/' + path.name
            candidates = [p for p in directory.rglob(path.stem + '.gir') if not p.is_relative_to(install)]
            if len(candidates) != 1:
                raise ValueError('Native typelib needs exactly one target GIR: ' + path.name)
            if '/usr/share/gir-1.0/' + candidates[0].name not in installed.values():
                installed[str(candidates[0])] = '/usr/share/gir-1.0/' + candidates[0].name
        native_libraries, native_namespaces, normalizations = set(), set(), {}
        for source_path, destination in list(installed.items()):
            path = Path(source_path)
            if '.so' in path.name:
                normalized = install / '.normalized' / path.name
                adjustment = remove_build_rpath(path, normalized, [directory, root], readelf)
                if adjustment:
                    del installed[source_path]
                    installed[str(normalized)] = destination
                    normalizations[path.name] = adjustment
                    path = normalized
                record = inspect(path, abi, readelf)
                if not path.name.endswith('.so') or record['soname'] != path.name:
                    raise ValueError('Android native libraries need unversioned .so names and matching SONAMEs: ' + str(path))
                native_libraries.add(path.name)
            elif path.suffix == '.typelib':
                native_namespaces.add(path.stem)
        exports.export_files(root, name, installed)
        gi = project.get('gi')
        if gi and gi['namespace'] + '-' + gi['version'] not in native_namespaces:
            raise ValueError('Native recipe did not produce its declared target typelib: ' + name)
        if project.get('stage', True):
            roots.extend(sorted(native_libraries)); namespaces.extend(sorted(native_namespaces))
        results.append({'name': name, 'build_system': system, 'libraries': sorted(native_libraries),
                        'min_api': api,
                        'namespaces': sorted(native_namespaces), 'build': str(directory), 'normalizations': normalizations,
                        'depends_on': project.get('depends_on', []), 'source': source_inputs})
    metadata = dict(base.metadata, base_sdk_sha256=base.sha256, native=results,
                    namespaces=gir_catalog(prefix), files={'usr/' + n: r for n, r in inventory(prefix).items()})
    atomic_json(root / DESCRIPTOR, metadata)
    composed = SDK(root, abi, request['application']['min_sdk']).validate()
    evidence = {'projects': results, 'base_sdk_sha256': base.sha256, 'sdk_sha256': composed.sha256,
                'runner': runner_metadata, 'inspection_sha256': inspection_sha256,
                'modules_lock': modules['lock'] if modules else None}
    return composed, roots, namespaces, evidence
