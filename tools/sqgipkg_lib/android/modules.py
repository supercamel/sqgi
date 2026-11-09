"""Resolve application modules tied to one immutable Android SDK generation."""
import json
from pathlib import Path
import re
import tempfile
import xml.etree.ElementTree as ET

from common import file_hash
from elf import inspect, SYSTEM_LIBRARIES
from packages import transport


def compatibility(base, sdk_id):
    metadata = base.metadata
    return {'sdk_id': sdk_id, 'target': metadata['target'],
            'source_lock_sha256': metadata['source_lock_sha256'],
            'producer_descriptor_sha256': metadata.get('producer_descriptor_sha256', base.sha256)}


def validate_payload(root, prepared, base, abi, readelf):
    files, namespaces = {}, dict(base.metadata['namespaces'])
    for package in prepared['packages']:
        entry = package['metadata']
        module = entry['module']
        if set(package['files']) != set(module['files']):
            raise ValueError('Android module archive inventory differs: ' + entry['name'])
        for name, expected in module['files'].items():
            if name in files or name in base.metadata['files']:
                raise ValueError('Android module conflicts with another module/base SDK file: ' + name)
            path = root / transport.relative_path(name, 'usr')
            if path.is_symlink() or not path.is_file() or file_hash(path) != expected.get('sha256'):
                raise ValueError('Android module file hash differs: ' + name)
            if (('size' in expected and path.stat().st_size != expected['size']) or
                    ('mode' in expected and path.stat().st_mode & 0o777 != expected['mode'])):
                raise ValueError('Android module file size/mode differs: ' + name)
            files[name] = expected
        for name, definition in module['namespaces'].items():
            if name in namespaces or definition['typelib'] not in module['files']:
                raise ValueError('Duplicate or unowned Android module namespace: ' + name)
            gir = root / 'usr/share/gir-1.0' / (name + '.gir')
            if not gir.is_file() or file_hash(gir) != definition['gir_sha256']:
                raise ValueError('Android module GIR hash differs: ' + name)
            ns = '{http://www.gtk.org/introspection/core/1.0}'
            document = ET.parse(gir).getroot()
            node = document.find(ns + 'namespace')
            if (node is None or node.get('name') + '-' + node.get('version') != name or
                    sorted(filter(None, node.get('shared-library', '').split(','))) != sorted(definition['libraries']) or
                    sorted(i.get('name') + '-' + i.get('version') for i in document.findall(ns + 'include')) != sorted(definition['includes'])):
                raise ValueError('Android module GIR identity/dependencies differ: ' + name)
            namespaces[name] = definition
        actual_libraries = sorted(Path(n).name for n in module['files'] if n.startswith('usr/lib/') and n.endswith('.so'))
        actual_namespaces = sorted(Path(n).stem for n in module['files'] if n.startswith('usr/lib/girepository-1.0/') and n.endswith('.typelib'))
        if actual_libraries != sorted(module['libraries']) or actual_namespaces != sorted(module['namespaces']):
            raise ValueError('Android module native exports differ: ' + entry['name'])
    available = set(files) | set(base.metadata['files'])
    for name in files:
        path = root / name
        with path.open('rb') as stream:
            is_elf = stream.read(4) == b'\x7fELF'
        if not is_elf and name.startswith('usr/lib/') and '.so' in path.name:
            raise ValueError('Android module shared library is not ELF: ' + name)
        if not is_elf:
            continue
        elf = inspect(path, abi, readelf)
        if name.endswith('.so') and elf['soname'] != path.name:
            raise ValueError('Android module SONAME mismatch: ' + name)
        for dependency in elf['needed']:
            if dependency not in SYSTEM_LIBRARIES and (dependency == 'libz.so' or 'usr/lib/' + dependency not in available):
                raise ValueError('Missing/non-pinned Android module library: ' + dependency)
    for name, definition in namespaces.items():
        if any(d not in namespaces for d in definition['includes']):
            raise ValueError('Incomplete Android module GI closure: ' + name)
        if any('/' in library or 'usr/lib/' + library not in available for library in definition['libraries']):
            raise ValueError('Missing Android module GI backing library: ' + name)


def resolve(request, base, work, readelf):
    seeds = sorted({project['android_package'] for project in request['native'] if project.get('android_package')})
    if not seeds:
        return None
    release, sdk_id = request.get('module_set', 'applications-r1'), request['sdk_id']
    for name in [release, sdk_id, *seeds]:
        if not re.fullmatch(r'[A-Za-z0-9][A-Za-z0-9+_.-]*', name):
            raise ValueError('Invalid Android module/package identifier')
    target = base.metadata['target']['triplet']
    url = request['repository'].rstrip('/') + '/android/modules/' + sdk_id + '/' + release + '/' + target + '/v1'
    repo = transport.Repository(url, request['cache'], download=not request.get('offline', False),
                                refresh=request.get('refresh', False), target=target)
    locked = request.get('modules_lock')
    if locked:
        for key, value in [('repository', url), ('packages', seeds), ('target', target), ('release', release)]:
            if locked.get(key) != value:
                raise ValueError('Android module lock differs: ' + key)
        checksum = locked.get('sha256', '')
        if not re.fullmatch('[0-9a-f]{64}', checksum):
            raise ValueError('Invalid Android module catalog checksum')
        index_path = repo.cache / 'indexes' / (checksum + '.json')
        repo.refresh = False
        repo.fetch('index.json', index_path, checksum)
    else:
        repo.index()
        current = repo.cache / 'index.json'
        checksum = file_hash(current)
        index_path = repo.cache / 'indexes' / (checksum + '.json')
        index_path.parent.mkdir(parents=True, exist_ok=True)
        with tempfile.NamedTemporaryFile(dir=index_path.parent, delete=False) as stream:
            temporary = Path(stream.name)
            stream.write(current.read_bytes())
        try:
            temporary.replace(index_path)
        finally:
            temporary.unlink(missing_ok=True)
    if file_hash(index_path) != checksum:
        raise ValueError('Cached Android module catalog checksum mismatch')
    index = json.loads(index_path.read_text())
    identity = compatibility(base, sdk_id)
    if (index.get('schema') != 1 or index.get('target') != target or index.get('prefix') != '/usr' or
            index.get('release') != release or index.get('android_module') != identity):
        raise ValueError('Android module catalog is incompatible with selected SDK/ABI/NDK/baseline')
    catalog = {}
    for raw in index['packages']:
        entry = transport.validate_entry(raw)
        if entry.get('kind') == 'meta' or entry.get('android_module') != identity or entry['name'] in catalog:
            raise ValueError('Mixed SDK or duplicate Android module package')
        if not isinstance(entry.get('module', {}).get('files'), dict) or not entry['module']['files']:
            raise ValueError('Android module has no file inventory')
        catalog[entry['name']] = entry
    transport.closure(catalog, list(catalog))
    selection = transport.closure(catalog, seeds)
    for entry in selection:
        api = entry['module'].get('min_api')
        if type(api) is not int or api < base.metadata['target']['min_api'] or api > request['application']['min_sdk']:
            raise ValueError('Android module minimum API is missing or incompatible with application: ' + entry['name'])
    pin = {'repository': url, 'target': target, 'release': release, 'packages': seeds, 'sha256': checksum}
    if locked and locked != pin:
        raise ValueError('Android module catalog differs from locked input')
    root = work / 'module-packages'
    prepared = transport.prepare({'repository': url, 'cache': request['cache'], 'root': str(root),
        'target': target, 'download': not request.get('offline', False), 'refresh': False,
        'packages': seeds, 'build_packages': [],
        'locked': [{'repository': url, 'target': target, 'metadata': entry, 'sha256': entry['sha256']} for entry in selection]},
        validate=lambda directory, packages: validate_payload(directory, packages, base, request['abi'], readelf))
    return {'root': root, 'packages': {p['metadata']['name']: p for p in prepared['packages']},
            'catalog': catalog, 'lock': pin}
