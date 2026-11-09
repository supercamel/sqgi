"""Verify prepared inputs, APK/AAB payloads and device-specific split sets."""
import json
from pathlib import Path
import zipfile

from common import atomic_json, digest, encoded, file_hash, relative
from sdk import TARGETS


def inventory(root):
    result = {}
    for path in sorted(root.rglob('*')):
        if path.name == '.prepared.json' and path.parent == root:
            continue
        if path.is_symlink():
            raise ValueError('Android prepared input contains a symlink: ' + str(path))
        if path.is_file():
            result[path.relative_to(root).as_posix()] = file_hash(path)
    return result


def seal(root, abi):
    atomic_json(root / '.prepared.json', {'schema': 1, 'abi': abi, 'files': inventory(root)})
    return file_hash(root / '.prepared.json')


def validate_prepared(root, checksum, abi):
    if file_hash(root / '.prepared.json') != checksum:
        raise ValueError('Prepared Android input descriptor changed')
    manifest = json.loads((root / '.prepared.json').read_text())
    if manifest.get('schema') != 1 or manifest.get('abi') != abi or manifest.get('files') != inventory(root):
        raise ValueError('Prepared Android input inventory/ABI changed')


def verify_payload(read, names, abis):
    """Paths are APK-relative; split manifests/resources are outside this audit."""
    index_path = 'assets/runtime/index.json'
    index_bytes = read(index_path)
    index = json.loads(index_bytes)
    if index.get('schema') != 2 or not index.get('abis') or set(index['abis']) - set(TARGETS):
        raise ValueError('Invalid Android runtime ABI index')
    if not abis or set(abis) - set(index['abis']):
        raise ValueError('Selected Android ABI lacks metadata')
    expected = {index_path: digest(index_bytes)}
    payloads = {}
    application = None
    for abi, checksum in index['abis'].items():
        prefix = 'assets/runtime/' + abi + '/'
        data = read(prefix + 'provenance.json')
        if digest(data) != checksum:
            raise ValueError('Runtime provenance checksum differs for ' + abi)
        provenance = json.loads(data)
        if provenance.get('schema') != 2 or provenance.get('abi') != abi:
            raise ValueError('Runtime provenance ABI/schema differs')
        expected[prefix + 'provenance.json'] = checksum
        for name, value in provenance['assets'].items():
            expected[prefix + str(relative(name))] = value
        if abi in abis:
            for name, record in provenance['libraries'].items():
                if Path(name).name != name or not name.endswith('.so'):
                    raise ValueError('Invalid packaged library path: ' + name)
                expected['lib/' + abi + '/' + name] = record['sha256']
        if application is not None and provenance['application'] != application:
            raise ValueError('Android ABI inputs contain different application snapshots')
        application = provenance['application']
        payloads[abi] = provenance
    expected['assets/application/project.json'] = digest(encoded(application))
    for name, checksum in application['files'].items():
        expected['assets/application/source/' + str(relative(name))] = checksum
    protected = {n for n in names if n.startswith(('lib/', 'assets/runtime/', 'assets/application/')) and not n.endswith('/')}
    if protected != set(expected):
        raise ValueError('Packaged Android payload differs from audited inventory: ' +
                         repr(sorted(protected.symmetric_difference(expected))))
    for name, checksum in expected.items():
        if digest(read(name)) != checksum:
            raise ValueError('Packaged bytes differ from provenance: ' + name)
    return {'abis': list(abis), 'metadata_abis': sorted(index['abis']), 'payloads': payloads}


def verify_artifact(path, abis):
    prefix = 'base/' if path.suffix == '.aab' else ''
    if isinstance(abis, str):
        abis = [abis]
    with zipfile.ZipFile(path) as archive:
        names = [n[len(prefix):] for n in archive.namelist() if n.startswith(prefix)]
        if len(names) != len(set(names)):
            raise ValueError('Duplicate archive members in Android artifact')
        return verify_payload(lambda name: archive.read(prefix + name), names, abis)


def verify_splits(paths, abi):
    owners, archives = {}, []
    try:
        for path in paths:
            archive = zipfile.ZipFile(path); archives.append(archive)
            for name in archive.namelist():
                if name.startswith(('lib/', 'assets/runtime/', 'assets/application/')) and not name.endswith('/'):
                    if name in owners:
                        raise ValueError('Duplicate payload across Android splits: ' + name)
                    owners[name] = archive
        return verify_payload(lambda name: owners[name].read(name), owners, [abi])
    finally:
        for archive in archives:
            archive.close()
