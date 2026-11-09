"""Resolve immutable Android SDK catalogs through the shared Ooblerg transport."""
import fcntl
import importlib.util
import json
from pathlib import Path
import re
import tempfile

from common import digest, file_hash
from sdk import SDK, DESCRIPTOR, TARGETS, NDK_REVISION

_spec = importlib.util.spec_from_file_location('sqgipkg_ooblerg_transport', Path(__file__).resolve().parent.parent / 'windows/ooblerg.py')
transport = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(transport)


def resolve(request):
    abi, sdk_id = request['abi'], request['sdk_id']
    if abi not in TARGETS or not re.fullmatch(r'[a-z0-9][a-z0-9.-]*', sdk_id):
        raise ValueError('Invalid Android ABI or SDK release')
    target = TARGETS[abi]
    profile = request.get('profile', 'runtime')
    if profile not in ('runtime', 'sdk', 'tools', 'complete'):
        raise ValueError('Unsupported Android SDK profile')
    url = request['repository'].rstrip('/') + '/android/' + sdk_id + '/' + target + '/v1'
    repo = transport.Repository(url, request['cache'], download=request.get('download', True),
                                refresh=request.get('refresh', False), target=target)
    locked = request.get('locked')
    if locked is not None:
        for key, expected in [('repository', url), ('target', target), ('sdk_id', sdk_id), ('profile', profile)]:
            if locked.get(key) != expected:
                raise ValueError('Android package lock differs: ' + key)
        checksum = locked.get('sha256', '')
        if not re.fullmatch('[0-9a-f]{64}', checksum):
            raise ValueError('Invalid locked Android catalog checksum')
        index_path = repo.cache / 'indexes' / (checksum + '.json')
        # A lock selects immutable cached bytes, even if refresh was requested.
        repo.refresh = False
        repo.fetch('index.json', index_path, checksum)
    else:
        # Validate transport-level target and package schema before retaining it.
        repo.index()
        path = repo.cache / 'index.json'
        snapshot = path.read_bytes()
        checksum = digest(snapshot)
        index_path = repo.cache / 'indexes' / (checksum + '.json')
        index_path.parent.mkdir(parents=True, exist_ok=True)
        if not index_path.exists():
            with tempfile.NamedTemporaryFile(dir=index_path.parent, delete=False) as stream:
                temporary = Path(stream.name)
                stream.write(snapshot)
            try:
                temporary.replace(index_path)
            finally:
                temporary.unlink(missing_ok=True)
        if file_hash(index_path) != checksum:
            raise ValueError('Cached Android catalog checksum mismatch')
    index = json.loads(index_path.read_text())
    if index.get('schema') != 1 or index.get('target') != target or index.get('prefix') != '/usr':
        raise ValueError('Android catalog target/prefix mismatch')
    identity = index.get('android', {})
    expected = {'abi': abi, 'triplet': target, 'libc': 'bionic', 'ndk': NDK_REVISION,
                'baseline': 'ubuntu-24.04', 'min_api': 31, 'sdk_id': sdk_id}
    if any(identity.get(k) != v for k, v in expected.items()):
        raise ValueError('Incompatible Android catalog baseline/NDK/API/ABI')
    catalog = {}
    for raw in index['packages']:
        entry = transport.validate_entry(raw)
        if entry['name'] in catalog or entry.get('android') != identity:
            raise ValueError('Mixed target/release or duplicate Android package: ' + entry['name'])
        catalog[entry['name']] = entry
    transport.closure(catalog, list(catalog))
    descriptor = index['sdk_profiles'][profile]
    if not re.fullmatch('[0-9a-f]{64}', descriptor.get('sha256', '')):
        raise ValueError('Missing Android SDK descriptor checksum')
    descriptor_path = repo.cache / 'descriptors' / (descriptor['sha256'] + '.json')
    repo.fetch(descriptor['artifact'], descriptor_path, descriptor['sha256'])
    metadata = json.loads(descriptor_path.read_text())
    if (metadata.get('sdk_id') != sdk_id or metadata.get('profile') != profile or
            metadata.get('target') != {k: identity[k] for k in expected if k != 'sdk_id'} or
            metadata.get('source_lock_sha256') != identity.get('source_lock_sha256')):
        raise ValueError('Android descriptor differs from catalog identity')
    selection = transport.closure(catalog, [descriptor['package']])
    pin = {'sha256': checksum, 'repository': url, 'target': target, 'sdk_id': sdk_id,
           'profile': profile, 'descriptor_sha256': descriptor['sha256']}
    if locked is not None and pin != locked:
        raise ValueError('Android SDK descriptor differs from locked catalog')

    def validate(root, prepared):
        (root / DESCRIPTOR).write_bytes(descriptor_path.read_bytes())
        sdk = SDK(root, abi, request['min_api']).validate()
        actual_owners = {}
        for package in prepared['packages']:
            for name in package['files']:
                if name in actual_owners:
                    raise ValueError('Overlapping Android package ownership: ' + name)
                actual_owners[name] = package['metadata']['name']
        if actual_owners != sdk.metadata.get('file_owners'):
            raise ValueError('Android package ownership differs from SDK descriptor')

    root = Path(request['root']).absolute()
    root.parent.mkdir(parents=True, exist_ok=True)
    with root.with_suffix('.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        prepared = transport.prepare({'repository': url, 'cache': request['cache'], 'target': target,
            'download': request.get('download', True), 'refresh': False,
            'root': str(root), 'packages': [descriptor['package']], 'build_packages': [],
            'locked': [{'repository': url, 'target': target, 'metadata': e, 'sha256': e.get('sha256')}
                       for e in selection]}, validate=validate)
    return {'sdk': str(root), 'sdk_sha256': descriptor['sha256'], 'lock': pin,
            'packages': [p['metadata']['name'] for p in prepared['packages']]}
