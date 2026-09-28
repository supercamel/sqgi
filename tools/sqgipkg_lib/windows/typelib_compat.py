#!/usr/bin/env python3
"""Bounded compatibility for legacy Ooblerg GLib library names in staged files."""
import argparse
import hashlib
import json
from pathlib import Path
import struct

OLD = b'libglib-2.0.dll,libgobject-2.0.dll'
NEW = b'libglib-2.0-0.dll,libgobject-2.0-0.dll'


def corrected(data):
    if (len(data) < 112 or data[:16] != b'GOBJ\nMETADATA\r\n\x1a'
            or data[16:18] != b'\x04\x00'
            or struct.unpack_from('<I', data, 40)[0] != len(data)):
        raise ValueError('Unsupported or malformed GLib typelib header')
    offset = struct.unpack_from('<I', data, 52)[0]
    if not 112 <= offset < len(data):
        raise ValueError('Invalid GLib typelib shared-library offset')
    end = data.find(b'\0', offset)
    if end < 0:
        raise ValueError('Unterminated GLib typelib shared-library names')
    if data[offset:end] != OLD:
        return data
    padding = b'\0' * (-len(data) % 4)
    result = bytearray(data + padding + NEW + b'\0')
    struct.pack_into('<I', result, 40, len(result))
    struct.pack_into('<I', result, 52, len(data) + len(padding))
    return bytes(result)


def require_x64_pe(path):
    with path.open('rb') as stream:
        header = stream.read(64)
        if len(header) != 64 or header[:2] != b'MZ':
            raise ValueError('Replacement is not a PE DLL: ' + str(path))
        offset = struct.unpack_from('<I', header, 60)[0]
        stream.seek(offset)
        pe = stream.read(24)
        if (len(pe) != 24 or pe[:4] != b'PE\0\0'
                or struct.unpack_from('<H', pe, 4)[0] != 0x8664
                or not struct.unpack_from('<H', pe, 22)[0] & 0x2000):
            raise ValueError('Replacement is not an x86_64 PE DLL: ' + str(path))


def stage(root):
    root = Path(root).resolve()
    path = root / 'lib/girepository-1.0/GLib-2.0.typelib'
    if not path.exists():
        return {'corrections': []}
    if not path.resolve().is_relative_to(root):
        raise ValueError('GLib typelib escapes staged payload')
    before = path.read_bytes()
    after = corrected(before)
    if after == before:
        return {'corrections': []}
    for name in NEW.decode().split(','):
        dll = root / 'bin' / name
        if not dll.resolve().is_relative_to(root):
            raise ValueError('Replacement DLL escapes staged payload')
        require_x64_pe(dll)
    record = {'path': str(path.relative_to(root)), 'old_libraries': OLD.decode(),
              'new_libraries': NEW.decode(), 'original_sha256': hashlib.sha256(before).hexdigest(),
              'modified_sha256': hashlib.sha256(after).hexdigest()}
    temporary = path.with_name(path.name + '.compat.tmp')
    with temporary.open('xb') as stream:
        stream.write(after)
    temporary.replace(path)
    return {'corrections': [record]}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', required=True, type=Path)
    parser.add_argument('--record', required=True, type=Path)
    args = parser.parse_args()
    result = stage(args.root)
    args.record.write_text(json.dumps(result, indent=2) + '\n')
    for item in result['corrections']:
        print('sqgipkg: corrected legacy Ooblerg GLib typelib library names: ' + item['path'])
