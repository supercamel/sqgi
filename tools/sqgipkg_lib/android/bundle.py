"""Assemble multiple ABI inputs and validate bundletool's device APK splits."""
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import urllib.request

from common import atomic_json, file_hash
from payload import inventory, validate_prepared, verify_splits
from sdk import TARGETS
import signing

BUNDLETOOL_VERSION = '1.18.3'
BUNDLETOOL_SHA256 = 'a099cfa1543f55593bc2ed16a70a7c67fe54b1747bb7301f37fdfd6d91028e29'
BUNDLETOOL_URL = 'https://github.com/google/bundletool/releases/download/1.18.3/bundletool-all-1.18.3.jar'


def bundletool(offline=False):
    override = os.environ.get('BUNDLETOOL_JAR')
    if override:
        path = Path(override).resolve()
        if file_hash(path) != BUNDLETOOL_SHA256:
            raise ValueError('BUNDLETOOL_JAR differs from pinned bundletool ' + BUNDLETOOL_VERSION)
        return path
    cache = Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache')) / 'sqgipkg/android'
    cache.mkdir(parents=True, exist_ok=True)
    path = cache / ('bundletool-all-' + BUNDLETOOL_VERSION + '.jar')
    with (cache / 'bundletool.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        if not path.is_file():
            if offline:
                raise ValueError('Offline bundle verification needs cached bundletool ' + BUNDLETOOL_VERSION)
            with tempfile.NamedTemporaryFile(dir=cache, delete=False) as stream:
                temporary = Path(stream.name)
                try:
                    with urllib.request.urlopen(BUNDLETOOL_URL, timeout=60) as response:
                        shutil.copyfileobj(response, stream)
                    stream.flush()
                    if file_hash(temporary) != BUNDLETOOL_SHA256:
                        raise ValueError('Downloaded bundletool checksum mismatch')
                    temporary.replace(path)
                finally:
                    temporary.unlink(missing_ok=True)
        if file_hash(path) != BUNDLETOOL_SHA256:
            raise ValueError('Cached bundletool checksum mismatch')
    return path


def verify_bundle(path, abis, work, android_sdk, java, offline=False, signer=None):
    jar = bundletool(offline)
    command = [str(java / 'bin/java'), '-jar', str(jar)]
    env = dict(os.environ, JAVA_HOME=str(java))
    def run(*args):
        subprocess.run([*command, *map(str, args)], check=True, env=env)
    run('validate', '--bundle=' + str(path))
    root = work / 'splits'; root.mkdir(parents=True, exist_ok=True)
    reports = {}
    for abi in abis:
        spec = root / (abi + '.json')
        atomic_json(spec, {'supportedAbis': [abi], 'supportedLocales': ['en'], 'screenDensity': 420, 'sdkVersion': 35})
        apks = root / (abi + '.apks')
        with signing.bundle_arguments(java) as arguments:
            run('build-apks', '--bundle=' + str(path), '--output=' + str(apks), '--overwrite',
                '--device-spec=' + str(spec), '--aapt2=' + str(android_sdk / 'build-tools/35.0.0/aapt2'), *arguments)
        selected = root / abi
        if selected.exists():
            shutil.rmtree(selected)
        run('extract-apks', '--apks=' + str(apks), '--device-spec=' + str(spec), '--output-dir=' + str(selected))
        files = sorted(selected.rglob('*.apk'))
        if not files:
            raise ValueError('bundletool produced no device APK splits: ' + abi)
        verified = verify_splits(files, abi)
        for apk in files:
            signing.verify_apk(apk, android_sdk, java, signer)
        reports[abi] = {'apks': str(apks), 'sha256': file_hash(apks), 'files': {str(p): file_hash(p) for p in files},
                        'metadata_abis': verified['metadata_abis'], 'native_abis': verified['abis']}
    atomic_json(root / 'verification.json', {'bundle_sha256': file_hash(path), 'bundletool_version': BUNDLETOOL_VERSION,
                                           'bundletool_sha256': BUNDLETOOL_SHA256, 'splits': reports})
    return reports


def combine(inputs, destination):
    if not inputs or len({item['abi'] for item in inputs}) != len(inputs) or any(item['abi'] not in TARGETS for item in inputs):
        raise ValueError('Bundle needs unique supported ABI inputs')
    if destination.exists():
        shutil.rmtree(destination)
    destination.mkdir(parents=True)
    common = None
    wrappers = None
    index = {'schema': 2, 'abis': {}}
    for item in inputs:
        root, abi = Path(item['prepared']), item['abi']
        validate_prepared(root, item['prepared_sha256'], abi)
        files = inventory(root)
        shared = {n: value for n, value in files.items() if n == 'project.json' or n.startswith(('java/', 'assets/application/'))}
        provenance = json.loads((root / 'assets/runtime' / abi / 'provenance.json').read_text())
        if (common is not None and shared != common) or (wrappers is not None and provenance['wrapper'] != wrappers):
            raise ValueError('Bundle ABI inputs must share application sources, GTK Java glue and wrapper version')
        if common is None:
            for name in shared:
                path = destination / name; path.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(root / name, path)
            common, wrappers = shared, provenance['wrapper']
        shutil.copytree(root / 'jniLibs' / abi, destination / 'jniLibs' / abi)
        shutil.copytree(root / 'assets/runtime' / abi, destination / 'assets/runtime' / abi)
        index['abis'][abi] = file_hash(root / 'assets/runtime' / abi / 'provenance.json')
    atomic_json(destination / 'assets/runtime/index.json', index)
    return destination


def build(request):
    from assemble import package
    work = Path(request['work']).resolve(); work.mkdir(parents=True, exist_ok=True)
    with (work / 'build.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        prepared = combine(request['inputs'], work / 'input')
        return package(dict(request, format='aab'), prepared, work, [item['abi'] for item in request['inputs']])
