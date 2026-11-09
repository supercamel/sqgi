"""Assemble an Android package from resolved inputs; no manifest resolution."""
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import urllib.request
import xml.etree.ElementTree as ET
import zipfile

from common import atomic_json, digest, encoded, file_hash
from elf import closure, inspect
from sdk import SDK, NDK_REVISION, TARGETS
from payload import seal, verify_artifact
import signing

HERE = Path(__file__).resolve().parent
GRADLE_VERSION = '8.9'
GRADLE_SHA256 = 'd725d707bfabd4dfdc958c624003b3c80accc03f7037b5122c4b1d0ef15cecab'


def toolchain(request):
    android_sdk = Path(os.environ.get('ANDROID_SDK_ROOT', os.environ.get('ANDROID_HOME',
                       Path.home() / 'Android/Sdk'))).resolve()
    ndk = Path(request.get('ndk') or os.environ.get('ANDROID_NDK_HOME') or
               android_sdk / 'ndk' / NDK_REVISION).resolve()
    properties = dict(line.split('=', 1) for line in (ndk / 'source.properties').read_text().splitlines()
                      if '=' in line)
    properties = {key.strip(): value.strip() for key, value in properties.items()}
    if properties.get('Pkg.Revision') != NDK_REVISION:
        raise ValueError('Android backend requires pinned NDK ' + NDK_REVISION)
    readelf = ndk / 'toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-readelf'
    if not readelf.is_file():
        raise ValueError('Android packaging currently requires a Linux x86-64 NDK host')
    java = Path(os.environ.get('JAVA_HOME', '/usr/lib/jvm/java-21-openjdk-amd64'))
    if not (java / 'bin/javac').is_file():
        raise ValueError('Set JAVA_HOME to a full JDK 17 or 21')
    return android_sdk, ndk, readelf, java


def gradle(offline=False):
    override = os.environ.get('GRADLE_HOME')
    if override:
        root = Path(override)
        if not (root / 'lib' / ('gradle-core-' + GRADLE_VERSION + '.jar')).is_file():
            raise ValueError('GRADLE_HOME must identify Gradle ' + GRADLE_VERSION)
        return root / 'bin/gradle'
    cache = Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache')) / 'sqgipkg/android'
    cache.mkdir(parents=True, exist_ok=True)
    with (cache / 'gradle.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        root = cache / ('gradle-' + GRADLE_VERSION)
        if (root / 'bin/gradle').is_file():
            return root / 'bin/gradle'
        archive = cache / (root.name + '-bin.zip')
        if not archive.is_file():
            if offline:
                raise ValueError('Offline Android build requires cached Gradle ' + GRADLE_VERSION)
            temporary = archive.with_suffix('.download')
            with urllib.request.urlopen('https://services.gradle.org/distributions/' + archive.name,
                                        timeout=120) as response, temporary.open('wb') as output:
                shutil.copyfileobj(response, output)
            temporary.replace(archive)
        if file_hash(archive) != GRADLE_SHA256:
            raise ValueError('Gradle archive checksum mismatch')
        with zipfile.ZipFile(archive) as bundle:
            for item in bundle.infolist():
                path = Path(item.filename)
                if path.is_absolute() or '..' in path.parts or path.parts[0] != root.name:
                    raise ValueError('Unexpected Gradle archive path')
            bundle.extractall(cache)
        (root / 'bin/gradle').chmod(0o755)
        return root / 'bin/gradle'


def metadata_closure(prefix, roots, catalog=None):
    pending, result, libraries = list(roots), set(), []
    while pending:
        name = pending.pop()
        if name in result:
            continue
        result.add(name)
        if catalog is not None:
            if name not in catalog:
                raise ValueError('SDK has no GI namespace: ' + name)
            pending.extend(catalog[name]['includes'])
            libraries.extend(catalog[name]['libraries'])
            continue
        document = ET.parse(prefix / 'share/gir-1.0' / (name + '.gir'))
        pending.extend(item.attrib['name'] + '-' + item.attrib['version'] for item in
                       document.getroot().findall('{http://www.gtk.org/introspection/core/1.0}include'))
        namespace = document.getroot().find('{http://www.gtk.org/introspection/core/1.0}namespace')
        libraries.extend(filter(None, namespace.attrib.get('shared-library', '').split(',')))
    return sorted(result), libraries


def prepare(request, sdk, work, readelf, ndk):
    abi = request['abi']
    config = request['application']
    namespaces, roots = metadata_closure(sdk.prefix, ['Gtk-4.0', *config['namespaces'], *request.get('native_namespaces', [])], sdk.metadata.get('namespaces'))
    libraries = closure(sdk.prefix, abi, ['libsqgi-gtk.so', *roots, *request.get('native_libraries', [])], readelf)
    destination = Path(request.get('prepared') or work / 'input')
    if destination.exists():
        shutil.rmtree(destination)
    native = destination / 'jniLibs' / abi
    assets = destination / 'assets/runtime' / abi
    native.mkdir(parents=True)
    (assets / 'typelib').mkdir(parents=True)
    for name in libraries:
        if 'usr/lib/' + name not in sdk.metadata['files']:
            raise ValueError('Untracked SDK library: ' + name)
        shutil.copy2(sdk.prefix / 'lib' / name, native)
    platform = native / 'libsqgi-platform.so'
    compiler = ndk / 'toolchains/llvm/prebuilt/linux-x86_64/bin' / (TARGETS[abi] + str(config['min_sdk']) + '-clang')
    subprocess.run([compiler, '-shared', '-fPIC', '-O2', '-Wl,-soname,libsqgi-platform.so',
                    '-Wl,-z,max-page-size=16384', '-Wl,-z,common-page-size=16384',
                    HERE / 'platform.c', '-o', platform], check=True)
    libraries[platform.name] = inspect(platform, abi, readelf)
    for namespace in namespaces:
        shutil.copy2(sdk.prefix / 'lib/girepository-1.0' / (namespace + '.typelib'), assets / 'typelib')
    application = destination / 'assets/application'
    source = Path(request['source'])
    files = {}
    for path in sorted(source.rglob('*')):
        if path.is_symlink():
            raise ValueError('Android application payload cannot contain symlinks: ' + str(path))
        if not path.is_file():
            continue
        name = path.relative_to(source).as_posix()
        files[name] = file_hash(path)
        target = application / 'source' / name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(path, target)
    if config['entry'] not in files:
        raise ValueError('Staged application entry is missing')
    snapshot = {'schema': 1, 'project': config, 'files': files}
    atomic_json(application / 'project.json', snapshot)
    atomic_json(destination / 'project.json', config)
    shutil.copy2(HERE / 'fonts.conf', assets)
    schemas = assets / 'share/glib-2.0/schemas'
    schemas.mkdir(parents=True)
    for path in (sdk.prefix / 'share/glib-2.0/schemas').glob('*.xml'):
        shutil.copy2(path, schemas)
    subprocess.run(['/usr/bin/glib-compile-schemas', '--strict', schemas], check=True)
    shutil.copytree(sdk.prefix / 'share/gtk4/android/java', destination / 'java')
    provenance = {'schema': 2, 'abi': abi, 'profile': 'gui', 'variant': request.get('variant', 'debug'),
                  'sdk_sha256': sdk.sha256, 'sdk_target': sdk.metadata['target'],
                  'base_sdk_sha256': sdk.metadata.get('base_sdk_sha256', sdk.sha256), 'native': request.get('native_evidence', {}),
                  'libraries': libraries, 'typelibs': namespaces, 'application': snapshot,
                  'assets': {p.relative_to(assets).as_posix(): file_hash(p)
                             for p in sorted(assets.rglob('*')) if p.is_file()},
                  'wrapper': {p.relative_to(HERE).as_posix(): file_hash(p)
                              for p in sorted((HERE / 'template').rglob('*')) if p.is_file()}}
    provenance['wrapper']['platform.c'] = file_hash(HERE / 'platform.c')
    atomic_json(assets / 'provenance.json', provenance)
    atomic_json(assets.parent / 'index.json', {'schema': 2, 'abis': {abi: file_hash(assets / 'provenance.json')}})
    return destination


def package(request, prepared, work, abis, toolchain_inputs=None):
    android_sdk, ndk, readelf, java = toolchain_inputs or toolchain(request)
    variant = request.get('variant', 'debug')
    signing.configured(variant)
    if variant == 'debug':
        signing.prepare_debug_key(java)
    expected_signer = signing.expected_certificate(java)
    project = work / 'gradle'
    if (project / 'app/src').exists():
        shutil.rmtree(project / 'app/src')
    shutil.copytree(HERE / 'template', project, dirs_exist_ok=True)
    env = signing.signing_environment(java)
    env.update(ANDROID_HOME=str(android_sdk), ANDROID_SDK_ROOT=str(android_sdk), PATH=str(java / 'bin') + ':/usr/bin:/bin')
    task = ('assemble' if request['format'] == 'apk' else 'bundle') + variant.capitalize()
    subprocess.run([gradle(request.get('offline', False)), '--no-daemon', '--console=plain',
                    '--no-configuration-cache',
                    *(['--offline'] if request.get('offline') else []), '-p', project,
                    '-PruntimeAbis=' + ','.join(abis), '-PruntimeInput=' + str(prepared),
                    ':app:' + task], env=env, check=True)
    suffix = request['format']
    output = project / 'app/build/outputs' / ('apk' if suffix == 'apk' else 'bundle') / variant / ('app-' + variant + '.' + suffix)
    if suffix == 'aab' and variant == 'debug':
        output = signing.sign_debug_bundle(output, work / 'app-debug-signed.aab', java)
    verification = verify_artifact(output, abis)
    splits = {}
    if suffix == 'aab':
        from bundle import verify_bundle
        signer = signing.verify_aab(output, java, expected_signer)
        splits = verify_bundle(output, abis, work, android_sdk, java, request.get('offline', False), signer)
    else:
        signer = signing.verify_apk(output, android_sdk, java, expected_signer)
    destination = Path(request['artifact'])
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary = destination.with_suffix(destination.suffix + '.tmp')
    shutil.copy2(output, temporary)
    temporary.replace(destination)
    return {'artifact': str(destination), 'sha256': file_hash(destination), 'abis': abis, 'splits': splits,
            'variant': variant, 'signer_sha256': signer,
            'verification': {k: v for k, v in verification.items() if k != 'payloads'}}


def build(request):
    android_sdk, ndk, readelf, java = toolchain(request)
    signing.configured(request.get('variant', 'debug'))
    request.setdefault('adb', str(android_sdk / 'platform-tools/adb'))
    sdk = SDK(request['sdk'], request['abi'], request['application']['min_sdk']).validate()
    if sdk.sha256 != request['sdk_sha256']:
        raise ValueError('Android SDK descriptor changed after input resolution')
    work = Path(request['work']).resolve()
    work.mkdir(parents=True, exist_ok=True)
    with (work / 'build.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        if request.get('native'):
            from native import build as build_native
            sdk, libraries, namespaces, evidence = build_native(request, sdk, work, ndk, readelf)
            request['native_libraries'] = libraries
            request['native_namespaces'] = namespaces
            request['native_evidence'] = evidence
        prepared = prepare(request, sdk, work, readelf, ndk)
        result = {'prepared': str(prepared), 'prepared_sha256': seal(prepared, request['abi']),
                  'sdk_sha256': sdk.sha256, 'runtime': sdk.metadata['runtime'], 'abi': request['abi'],
                  'native': request.get('native_evidence', {})}
        if request['operation'] != 'prepare':
            result.update(package(request, prepared, work, [request['abi']], (android_sdk, ndk, readelf, java)))
    return result
