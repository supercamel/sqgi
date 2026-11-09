"""Audit native library architecture, dependency closure and load alignment."""
import hashlib
from pathlib import Path
import re
import struct
import subprocess
import shutil

SYSTEM_LIBRARIES = {"libc.so", "libm.so", "libdl.so", "liblog.so", "libandroid.so",
                    "libEGL.so", "libGLESv2.so", "libvulkan.so", "libjnigraphics.so", "libnativewindow.so"}


def remove_build_rpath(source, destination, allowed_roots, readelf):
    """Remove only audited build-directory search paths from a copied ELF.

    Compact PT_DYNAMIC entries in place; no ELF segment, address, SONAME or
    DT_NEEDED is changed. This preserves the NDK's 16 KB layout and avoids an
    additional ELF-rewriter toolchain dependency.
    """
    dynamic = subprocess.check_output([readelf, '-d', source], text=True)
    paths = re.findall(r'\((?:RPATH|RUNPATH)\).*\[(.*?)\]', dynamic)
    if not paths:
        return None
    roots = [Path(p).resolve() for p in allowed_roots]
    for value in paths:
        for part in filter(None, value.split(':')):
            part = part.replace('${ORIGIN}', str(source.parent)).replace('$ORIGIN', str(source.parent))
            path = Path(part).resolve()
            if not any(path.is_relative_to(root) for root in roots):
                raise ValueError('Refusing non-target native runtime search path: ' + part)
    data = bytearray(source.read_bytes())
    if len(data) < 64 or data[:6] != b'\x7fELF\x02\x01':
        raise ValueError('Expected ELF64 while normalizing native library')
    offset = struct.unpack_from('<Q', data, 32)[0]
    stride, count = struct.unpack_from('<HH', data, 54)
    if stride < 56 or offset + stride * count > len(data):
        raise ValueError('Invalid ELF headers while normalizing native library')
    changed = False
    for index in range(count):
        header = offset + index * stride
        if struct.unpack_from('<I', data, header)[0] != 2:
            continue
        start, size = struct.unpack_from('<Q', data, header + 8)[0], struct.unpack_from('<Q', data, header + 32)[0]
        if size % 16 or start + size > len(data):
            raise ValueError('Invalid ELF dynamic section')
        entries = []
        for position in range(start, start + size, 16):
            tag = struct.unpack_from('<Q', data, position)[0]
            if tag == 0:
                break
            if tag in (15, 29):
                changed = True
            else:
                entries.append(data[position:position + 16])
        contents = b''.join(entries)
        data[start:start + size] = contents + bytes(size - len(contents))
    if not changed:
        raise ValueError('Cannot find native library runtime search path tags')
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)
    destination.write_bytes(data)
    return {'original_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
            'sha256': hashlib.sha256(data).hexdigest(), 'removed_build_search_paths': paths}


def inspect(path, abi, readelf):
    path = Path(path)
    data = path.read_bytes()
    if len(data) < 64 or data[:6] != b"\x7fELF\x02\x01":
        raise ValueError(f"Expected a 64-bit little-endian ELF: {path}")
    machine = struct.unpack_from("<H", data, 18)[0]
    if machine != {"arm64-v8a": 183, "x86_64": 62}[abi]:
        raise ValueError(f"Wrong ELF architecture for {abi}: {path}")
    offset = struct.unpack_from("<Q", data, 32)[0]
    stride, count = struct.unpack_from("<HH", data, 54)
    if stride < 56 or offset + count * stride > len(data):
        raise ValueError('Invalid ELF program headers: ' + str(path))
    alignments = []
    for index in range(count):
        header = offset + index * stride
        if struct.unpack_from("<I", data, header)[0] == 1:
            alignments.append(struct.unpack_from("<Q", data, header + 48)[0])
        if struct.unpack_from("<I", data, header)[0] == 3:
            start = struct.unpack_from("<Q", data, header + 8)[0]
            size = struct.unpack_from("<Q", data, header + 32)[0]
            if data[start:start + size].rstrip(b'\0') != b'/system/bin/linker64':
                raise ValueError('Non-Bionic ELF interpreter: ' + str(path))
    if not alignments or min(alignments) < 16384:
        raise ValueError(f"ELF LOAD segments are not aligned for 16 KB pages: {path}: {alignments}")
    dynamic = subprocess.check_output([readelf, "-d", path], text=True)
    if re.search(r'\((?:RPATH|RUNPATH)\)', dynamic):
        raise ValueError('Android ELF contains a runtime search path: ' + str(path))
    needed = re.findall(r"\(NEEDED\).*\[(.*?)\]", dynamic)
    names = re.findall(r"\(SONAME\).*\[(.*?)\]", dynamic)
    return {"soname": names[0] if names else None, "needed": needed, "load_alignments": alignments,
            "sha256": hashlib.sha256(data).hexdigest(), "size": len(data)}


def closure(prefix, abi, roots, readelf):
    pending = list(roots)
    result = {}
    while pending:
        name = pending.pop()
        if name in result or name in SYSTEM_LIBRARIES:
            continue
        if name == "libz.so":
            raise ValueError("Runtime links Android's public libz; rebuild against the private pinned zlib")
        path = prefix / "lib" / name
        if not path.is_file():
            raise ValueError("Missing runtime dependency: " + str(path))
        record = inspect(path, abi, readelf)
        if record["soname"] != name:
            raise ValueError(f"SONAME mismatch: {name}: {record['soname']}")
        result[name] = record
        pending.extend(record["needed"])
    return dict(sorted(result.items()))
