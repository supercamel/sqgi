#!/usr/bin/env python3
"""Private Ooblerg repository transport. Called by sqgipkg, never by the GUI.

Only index browsing and package preparation live here. Target selection, runtime
file selection, cross compilation and final packaging remain in sqgipkg.
"""
import argparse
import hashlib
import json
import os
import posixpath
from pathlib import Path, PurePosixPath
import re
import shutil
import sys
import tarfile
import tempfile
import urllib.parse
import urllib.request

TARGET = 'x86_64-w64-mingw32'
DEFAULT_REPOSITORY = 'https://ooblerg.xyz/v1'
MARKER = '.sqgipkg-ooblerg.json'
TARGETS = {TARGET: ('mingw64', None), 'x86_64-linux-gnu': ('usr', 62), 'aarch64-linux-gnu': ('usr', 183)}


def digest(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest() if hasattr(hashlib, 'file_digest') else hash_stream(stream)


def hash_stream(stream):
    value = hashlib.sha256()
    for data in iter(lambda: stream.read(1024 * 1024), b''):
        value.update(data)
    return value.hexdigest()


def relative_path(value, prefix=None):
    if not isinstance(value, str) or not value or '\\' in value or ':' in value or '\x00' in value:
        raise ValueError(f'Invalid repository path: {value!r}')
    path = PurePosixPath(value)
    if path.is_absolute() or '..' in path.parts or str(path) in ('', '.'):
        raise ValueError(f'Unsafe repository path: {value!r}')
    if prefix and path.parts[0] != prefix:
        raise ValueError(f'Package path is outside {prefix}: {value}')
    return path


def validate_entry(entry):
    if not isinstance(entry, dict) or not isinstance(entry.get('name'), str) or not re.fullmatch(r'[A-Za-z0-9][A-Za-z0-9+_.-]*', entry['name']):
        raise ValueError('Invalid Ooblerg package name')
    if not isinstance(entry.get('version'), str) or not entry['version']:
        raise ValueError(f'Missing version for {entry["name"]}')
    deps = entry.get('dependencies', [])
    if not isinstance(deps, list) or any(not isinstance(d, str) or not d for d in deps):
        raise ValueError(f'Invalid dependencies for {entry["name"]}')
    for key in ['summary', 'description']:
        if key in entry and not isinstance(entry[key], str):
            raise ValueError(f'Invalid {key} for {entry["name"]}')
    tags = entry.get('tags', [])
    if not isinstance(tags, list) or any(not isinstance(tag, str) for tag in tags):
        raise ValueError(f'Invalid tags for {entry["name"]}')
    if entry.get('kind') == 'meta':
        if entry.get('artifact'):
            raise ValueError('Meta package must not have an archive')
    else:
        relative_path(entry.get('artifact'))
        if not isinstance(entry.get('sha256'), str) or not re.fullmatch(r'[0-9a-f]{64}', entry['sha256']):
            raise ValueError(f'Missing SHA-256 for {entry["name"]}')
    return dict(entry, dependencies=deps, tags=tags)


class Repository:
    def __init__(self, url, cache, download=True, refresh=False, target=TARGET):
        if target not in TARGETS:
            raise ValueError(f"Unsupported Ooblerg target: {target}")
        self.target = target
        self.prefix = TARGETS[target][0]
        self.url = url.rstrip('/')
        if urllib.parse.urlsplit(self.url).scheme not in ('https', 'http', 'file'):
            raise ValueError('Ooblerg repository requires an https, http or file URL')
        self.cache = Path(cache) / hashlib.sha256(self.url.encode()).hexdigest()[:20]
        self.download = download
        self.refresh = refresh

    def fetch(self, relative, dest, expected=None):
        relative_path(relative)
        if dest.exists() and (not self.refresh or not self.download):
            if expected and digest(dest) != expected:
                raise ValueError(f'Ooblerg cached archive checksum mismatch: {dest}')
            return True
        if not self.download:
            raise ValueError(f'Ooblerg downloads disabled; missing cached input: {relative}')
        dest.parent.mkdir(parents=True, exist_ok=True)
        fd, name = tempfile.mkstemp(prefix=dest.name + '.', suffix='.download', dir=dest.parent)
        temporary = Path(name)
        try:
            url = self.url + '/' + urllib.parse.quote(relative, safe='/+.-_')
            print(f'sqgipkg: downloading {url}', file=sys.stderr, flush=True)
            with os.fdopen(fd, 'wb') as stream, urllib.request.urlopen(url, timeout=60) as response:
                shutil.copyfileobj(response, stream)
            if expected and digest(temporary) != expected:
                raise ValueError(f'Ooblerg archive checksum mismatch: {relative}')
            os.replace(temporary, dest)
        finally:
            temporary.unlink(missing_ok=True)
        return False

    def index(self):
        path = self.cache / 'index.json'
        cached = self.fetch('index.json', path)
        try:
            data = json.loads(path.read_text(encoding='utf8'))
        except (ValueError, UnicodeError) as error:
            origin = 'cached' if cached else 'downloaded'
            raise ValueError(f'The {origin} Ooblerg catalog cannot be read. Refresh the catalog to try again.') from error
        if not isinstance(data, dict) or not isinstance(data.get('packages'), list):
            raise ValueError('The Ooblerg catalog has no package list. Refresh the catalog to try again.')
        if data.get('target') != self.target or data.get('prefix') != '/' + self.prefix:
            raise ValueError(f'Ooblerg repository must target {self.target} with /{self.prefix} prefix')
        entries = {}
        for raw in data['packages']:
            entry = validate_entry(raw)
            if entry['name'] in entries:
                raise ValueError(f'Duplicate package: {entry["name"]}')
            entries[entry['name']] = entry
        return entries, cached


def closure(index, seeds):
    ordered, visited = [], set()

    def visit(name):
        if name in visited:
            return
        if name not in index:
            raise ValueError(f'Ooblerg dependency not found: {name}')
        visited.add(name)
        entry = validate_entry(index[name])
        for dependency in entry.get('dependencies', []):
            visit(dependency)
        ordered.append(entry)

    for name in seeds:
        visit(name)
    return ordered


def extract(archive, root, owners, package, target=TARGET):
    paths, links = [], {}
    with tarfile.open(archive, 'r:*') as tar:
        for member in tar:
            # Archives contain data only. Linux SONAME links are materialized below.
            if member.isdir() and member.name in ('.', './'):
                continue
            path = relative_path(member.name, TARGETS[target][0])
            if member.issym() and target != TARGET:
                link = member.linkname
                if not link or '\\' in link or ':' in link or '\x00' in link:
                    raise ValueError(f'Unsafe Linux archive link: {member.name}')
                resolved = posixpath.normpath(link.lstrip('/') if link.startswith('/') else str(path.parent / link))
                destination = relative_path(resolved, TARGETS[target][0])
                if str(path) in links and links[str(path)] != str(destination):
                    raise ValueError(f'Conflicting Linux archive links: {member.name}')
                links[str(path)] = str(destination)
                continue
            if not (member.isdir() or member.isfile()):
                raise ValueError(f'Unsupported archive entry in {package}: {member.name}')
            dest = root.joinpath(*path.parts)
            folded = str(path).casefold() if target == TARGET else str(path)
            if member.isdir():
                dest.mkdir(parents=True, exist_ok=True)
                continue
            if folded in owners:
                original = owners[folded]
                with tar.extractfile(member) as stream:
                    if digest(root / original) != hash_stream(stream):
                        raise ValueError(f'Conflicting Ooblerg package files: {package}: {member.name}')
                paths.append(original)
                continue
            dest.parent.mkdir(parents=True, exist_ok=True)
            with tar.extractfile(member) as source, dest.open('xb') as out:
                shutil.copyfileobj(source, out)
            dest.chmod(0o755 if member.mode & 0o111 else 0o644)
            if target != TARGET:
                with dest.open('rb') as binary:
                    header = binary.read(20)
                if header[:4] == b'\x7fELF' and (len(header) < 20 or header[4:6] != b'\x02\x01' or int.from_bytes(header[18:20], 'little') != TARGETS[target][1]):
                    raise ValueError(f'Wrong ELF architecture for {target}: {member.name}')
            owners[folded] = str(path)
            paths.append(str(path))
    # Resolve links after files, independent of tar member order. Never create
    # a filesystem symlink: directory traversal through one is impossible.
    pending = dict(links)
    while pending:
        progressed = False
        for path, destination in list(pending.items()):
            if destination in pending:
                continue
            if destination not in paths:
                raise ValueError(f'Linux archive link target is missing or outside this package: {path} -> {destination}')
            source, dest = root / destination, root / path
            if path in owners:
                if digest(dest) != digest(source):
                    raise ValueError(f'Conflicting Linux archive link: {path}')
            else:
                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source, dest)
                owners[path] = path
            if path not in paths:
                paths.append(path)
            del pending[path]
            progressed = True
        if not progressed:
            raise ValueError('Cyclic Linux archive links: ' + ', '.join(pending))
    return paths


def prepare(request):
    target = request.get('target', TARGET)
    repo = Repository(request['repository'], request['cache'], request['download'], request['refresh'], target)
    locked = request.get('locked')
    if locked is None:
        index, _ = repo.index()
    else:
        index = {}
        for item in locked:
            if item['repository'] != repo.url or item['target'] != target:
                raise ValueError('Ooblerg lock repository or target does not match')
            entry = validate_entry(item['metadata'])
            if item['sha256'] != entry.get('sha256'):
                raise ValueError('Ooblerg lock digest does not match metadata')
            index[entry['name']] = entry
    runtime = closure(index, request['packages'])
    entries = closure(index, request['build_packages'] + request['packages'])
    root = Path(request['root']).absolute()
    if root.is_symlink() or (root.exists() and not (root / MARKER).is_file()):
        raise ValueError(f'Refusing to replace a sysroot not owned by Ooblerg: {root}')
    root.parent.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=root.name + '.prepare-', dir=root.parent))
    prepared, owners = [], {}
    try:
        for entry in entries:
            paths = []
            if entry.get('kind') != 'meta':
                archive = repo.cache / 'packages' / (entry['sha256'] + '.tar.gz')
                repo.fetch(entry['artifact'], archive, entry['sha256'])
                # All cached archives were also verified before reaching here.
                print(f'sqgipkg: preparing Ooblerg {entry["name"]} {entry["version"]}', file=sys.stderr, flush=True)
                paths = extract(archive, staging, owners, entry['name'], target)
            prepared.append({'repository': repo.url, 'target': target, 'metadata': entry,
                             'sha256': entry.get('sha256'), 'files': paths})
        result = {'packages': prepared, 'runtime_packages': [e['name'] for e in runtime]}
        if target != TARGET:
            provided = {Path(path).stem for e in prepared for path in e['files'] if path.endswith('.pc')}
            required = set()
            for e in prepared:
                for path in e['files']:
                    if not path.endswith('.pc'):
                        continue
                    text = (staging / path).read_text()
                    for line in text.splitlines():
                        if line.startswith(('Requires:', 'Requires.private:')):
                            required.update(re.findall(r'(?:^|[,\s])([A-Za-z_][A-Za-z0-9_.+-]*)(?=\s|,|$)', line.split(':', 1)[1]))
                        if line.startswith('Libs.private:'):
                            required.update(re.findall(r'(?:^|\s)-l([A-Za-z_][A-Za-z0-9_.+-]*)', line))
            result['required_modules'] = sorted(required - provided - {'m', 'dl', 'pthread'})
        (staging / MARKER).write_text(json.dumps(result), encoding='utf8')
        backup = None
        if root.exists():
            backup = Path(tempfile.mkdtemp(prefix=root.name + '.previous-', dir=root.parent))
            backup.rmdir()
            os.replace(root, backup)
        try:
            os.replace(staging, root)
        except BaseException:
            if backup is not None:
                os.replace(backup, root)
            raise
        if backup is not None:
            shutil.rmtree(backup)
        return result
    finally:
        if staging.exists():
            shutil.rmtree(staging)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=('catalog', 'prepare'))
    parser.add_argument('--request')
    parser.add_argument('--result')
    parser.add_argument('--repository')
    parser.add_argument('--target', choices=TARGETS, default=TARGET)
    parser.add_argument('--cache', required=True)
    parser.add_argument('--refresh', action='store_true')
    args = parser.parse_args()
    if args.repository is None:
        args.repository = DEFAULT_REPOSITORY if args.target == TARGET else f"https://ooblerg.xyz/{args.target}/v1"
    try:
        if args.action == 'catalog':
            entries, cached = Repository(args.repository, args.cache, refresh=args.refresh, target=args.target).index()
            result = {'packages': sorted(entries.values(), key=lambda e: e['name'].casefold()),
                      'repository': args.repository, 'target': args.target, 'cached': cached}
        else:
            result = prepare(json.loads(Path(args.request).read_text(encoding='utf8')))
        result.update(protocol_version=1, ok=True, diagnostics=[])
    except (OSError, ValueError, KeyError, tarfile.TarError) as error:
        result = {'protocol_version': 1, 'ok': False, 'packages': [],
                  'diagnostics': [{'severity': 'error', 'code': 'ooblerg', 'path': [], 'message': str(error)}]}
    encoded = json.dumps(result, ensure_ascii=False)
    if args.result:
        Path(args.result).write_text(encoded, encoding='utf8')
    else:
        print(encoded)
    return 0 if result['ok'] else 1


if __name__ == '__main__':
    sys.exit(main())
