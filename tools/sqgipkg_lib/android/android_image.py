"""Read the pinned emulator image's Android logical partition table.

Format: AOSP system/core, android-12.0.0_r1,
fs_mgr/liblp/include/liblp/metadata_format.h. Only single-device, linear/zero
extents are needed for the SDK emulator image; unsupported layouts fail closed.
"""
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess


def exact(stream, size):
    data = stream.read(size)
    if len(data) != size:
        raise ValueError('Truncated Android image')
    return data


def checksum(data, offset):
    expected = data[offset:offset + 32]
    actual = hashlib.sha256(data[:offset] + bytes(32) + data[offset + 32:]).digest()
    if actual != expected:
        raise ValueError('Android partition metadata checksum mismatch')


def partitions(stream, start, size):
    stream.seek(start + 4096)
    geometry = exact(stream, 52)
    magic, geometry_size = struct.unpack_from('<II', geometry)
    if magic != 0x616c4467 or geometry_size != 52:
        raise ValueError('Unsupported Android partition geometry')
    checksum(geometry, 8)
    maximum, slots, alignment = struct.unpack_from('<III', geometry, 40)
    if maximum > 4 * 1024 * 1024 or maximum < 128 or not slots or alignment % 512:
        raise ValueError('Invalid Android metadata geometry')
    stream.seek(start + 12288)
    header = exact(stream, 128)
    magic, major, minor, header_size = struct.unpack_from('<IHHI', header)
    if magic != 0x414c5030 or major != 10 or minor > 2 or header_size not in (128, 256):
        raise ValueError('Unsupported Android metadata version')
    header += exact(stream, header_size - 128)
    checksum(header, 12)
    table_size = struct.unpack_from('<I', header, 44)[0]
    if table_size + header_size > maximum or 12288 + maximum * slots * 2 > size:
        raise ValueError('Android metadata exceeds its partition')
    tables = exact(stream, table_size)
    if hashlib.sha256(tables).digest() != header[48:80]:
        raise ValueError('Android partition table checksum mismatch')

    def table(offset, expected_size):
        position, count, stride = struct.unpack_from('<III', header, offset)
        if stride != expected_size or position + count * stride > len(tables):
            raise ValueError('Android table descriptor exceeds metadata')
        return [tables[position + i * stride:position + (i + 1) * stride] for i in range(count)]

    devices = table(116, 64)
    if len(devices) != 1:
        raise ValueError('Only single-device Android images are supported')
    first_sector = struct.unpack_from('<Q', devices[0])[0]
    device_size = struct.unpack_from('<Q', devices[0], 16)[0]
    if device_size > size:
        raise ValueError('Android block device exceeds the image partition')
    extents = [struct.unpack('<QIQI', entry) for entry in table(92, 24)]
    result = {}
    for entry in table(80, 52):
        name = entry[:36].split(b'\0', 1)[0].decode('ascii')
        attributes, first, count, group = struct.unpack_from('<IIII', entry, 36)
        if not re.fullmatch(r'[A-Za-z0-9_]+', name) or name in result:
            raise ValueError('Invalid or duplicate Android partition name')
        if attributes & ~1 or first + count > len(extents):
            raise ValueError('Unsupported Android partition attributes or extent range')
        regions = []
        for sectors, kind, data, source in extents[first:first + count]:
            if kind == 0:
                if source != 0 or data < first_sector or (data + sectors) * 512 > device_size:
                    raise ValueError('Android extent exceeds the block device')
                regions.append((start + data * 512, sectors * 512))
            elif kind == 1 and data == 0 and source == 0:
                regions.append((None, sectors * 512))
            else:
                raise ValueError('Unsupported Android extent')
        result[name] = regions
    return result


def extract_system(image, destination):
    image, destination = Path(image), Path(destination)
    layout = json.loads(subprocess.check_output(['/usr/sbin/sfdisk', '--json', image], text=True))['partitiontable']
    if layout['label'] != 'gpt' or layout['sectorsize'] != 512:
        raise ValueError('Expected the pinned emulator GPT image')
    supers = [p for p in layout['partitions'] if p.get('name') == 'super']
    if len(supers) != 1:
        raise ValueError('Expected one Android super partition')
    start, size = supers[0]['start'] * 512, supers[0]['size'] * 512
    if start < 0 or size <= 0 or start + size > image.stat().st_size:
        raise ValueError('GPT partition exceeds image')
    with image.open('rb') as source:
        regions = partitions(source, start, size)
        if 'system' not in regions:
            raise ValueError('Expected Android system partition')
        with destination.open('wb') as output:
            length = 0
            for offset, count in regions['system']:
                length += count
                if offset is None:
                    output.seek(count, 1)
                    continue
                source.seek(offset)
                while count:
                    block = exact(source, min(count, 1024 * 1024))
                    output.write(block)
                    count -= len(block)
            output.truncate(length)
