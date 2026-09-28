#!/usr/bin/env python3
"""Compare a self-extracted AppImage's desktop metadata with its saved manifest."""
import argparse
import configparser
import hashlib
import json
from pathlib import Path
import re


def digest(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def desktop_string(value):
    return re.sub(r'\\([sntr\\])', lambda match: {
        's': ' ', 'n': '\n', 't': '\t', 'r': '\r', '\\': '\\'
    }[match[1]], value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest', type=Path, required=True)
    parser.add_argument('--artifact', type=Path, required=True)
    parser.add_argument('--extraction-record', type=Path, required=True)
    parser.add_argument('--report', type=Path, required=True)
    args = parser.parse_args()
    if args.report.exists():
        parser.error('Choose a new evidence filename')
    manifest = args.manifest.resolve()
    value = json.loads(manifest.read_text())
    extraction = json.loads(args.extraction_record.read_text())
    artifact = args.artifact.resolve()
    root = Path(extraction['destination']) / 'squashfs-root'
    checks = []

    def check(name, ok, observed):
        checks.append({'name': name, 'ok': bool(ok), 'observed': observed})

    artifact_hash = digest(artifact)
    check('successful extraction of this artifact',
          extraction.get('exit_status') == 0 and extraction.get('sha256') == artifact_hash
          and Path(extraction['artifact']).resolve() == artifact, extraction)
    desktop_path = root / (value['app_id'] + '.desktop')
    check('desktop ID filename', desktop_path.is_file(), str(desktop_path))
    if desktop_path.is_file():
        desktop = configparser.ConfigParser(interpolation=None, strict=True)
        desktop.optionxform = str
        desktop.read_string(desktop_path.read_text())
        group = desktop['Desktop Entry']
        categories = value['desktop_categories']
        if isinstance(categories, list):
            categories = ';'.join(categories)
        if not categories.endswith(';'):
            categories += ';'
        expected = {'Type': 'Application', 'Name': value['name'],
                    'Comment': value['desktop_comment'], 'Categories': categories,
                    'Icon': value['app_id'], 'Exec': 'AppRun',
                    'Terminal': 'true' if value['desktop_terminal'] else 'false'}
        for key, wanted in expected.items():
            observed = desktop_string(group.get(key, ''))
            check(key, observed == wanted, observed)
    source_icon = (manifest.parent / value['desktop_icon']).resolve()
    packaged_icon = root / (value['app_id'] + source_icon.suffix.lower())
    check('icon payload matches selected asset', packaged_icon.is_file()
          and digest(packaged_icon) == digest(source_icon), {
              'source': str(source_icon), 'source_sha256': digest(source_icon),
              'packaged': str(packaged_icon),
              'packaged_sha256': digest(packaged_icon) if packaged_icon.is_file() else None})
    passed = all(item['ok'] for item in checks)
    result = {'scope': 'Manifest-to-self-extracted payload metadata comparison; no runtime or FUSE acceptance',
              'manifest': str(manifest), 'manifest_sha256': digest(manifest),
              'artifact': str(artifact), 'artifact_sha256': artifact_hash,
              'extraction_record': str(args.extraction_record.resolve()),
              'checks': checks, 'status': 'pass' if passed else 'fail'}
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())
