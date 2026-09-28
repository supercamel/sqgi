"""Explicit support files and exit-based acceptance for private study runners."""
from pathlib import Path
import re
import subprocess


def host_unwind_file():
    """glibc dlopens this at pthread_exit; ldd on QEMU need not list it."""
    value = subprocess.check_output(['cc', '-print-file-name=libgcc_s.so.1'], text=True).strip()
    path = Path(value)
    if not path.is_absolute() or not path.is_file():
        raise RuntimeError('Cannot locate host libgcc_s.so.1 for runner thread shutdown')
    return path.resolve()


def crash_diagnostics(output):
    return re.findall(r'^qemu: uncaught target signal [0-9]+[^\r\n]*', output, re.M)


def accepted(exit_status, output, markers):
    return exit_status == 0 and not crash_diagnostics(output) and all(marker in output for marker in markers)


def utf8_locale_files():
    """Wine uses the Unix locale when converting UTF-16 filenames to host paths."""
    directory = Path('/usr/lib/locale/C.utf8')
    if not (directory / 'LC_CTYPE').is_file():
        raise RuntimeError('Missing standard C.utf8 runner locale')
    return {str(path): str(path.resolve()) for path in directory.rglob('*') if path.is_file()}


def network_peer_files():
    """Explicit distro Python runner inputs, separate from target app libraries."""
    python = Path('/usr/bin/python3').resolve()
    stdlib = Path(subprocess.check_output([str(python), '-c',
        'import sysconfig; print(sysconfig.get_path("stdlib"))'], text=True).strip())
    files = {'/usr/bin/study-python': str(python)}
    # Exclude separately installed site packages and bytecode caches.
    for path in stdlib.rglob('*'):
        if any(part in ['site-packages', 'dist-packages', '__pycache__'] for part in path.relative_to(stdlib).parts):
            continue
        if path.is_file():
            files[str(path)] = str(path.resolve())
    files['/runner/network_peer.py'] = str(Path(__file__).with_name('network_peer.py').resolve())
    return files


def software_gl_files(sysroot, arch, appdir):
    """Explicit target Mesa closure; no blanket target-system mount."""
    import struct
    triplet = arch + '-linux-gnu'
    directory = Path(sysroot) / 'usr/lib' / triplet
    base = {'libc.so.6', 'libm.so.6', 'libdl.so.2', 'libpthread.so.0', 'librt.so.1',
            'libresolv.so.2', 'libutil.so.1', 'ld-linux-x86-64.so.2', 'ld-linux-aarch64.so.1'}
    seeds = ['libEGL.so.1', 'libEGL_mesa.so.0', 'libGLX.so.0', 'libGLX_mesa.so.0',
             'libGL.so.1', 'libGLESv2.so.2', 'libOpenGL.so.0', 'libGLdispatch.so.0', 'dri/swrast_dri.so']
    queue = [directory / name for name in seeds]
    files = {}
    visited = set()
    while queue:
        path = queue.pop()
        destination = '/usr/lib/' + triplet + '/' + str(path.relative_to(directory))
        if destination in visited:
            continue
        visited.add(destination)
        resolved = path.resolve(strict=True)
        with resolved.open('rb') as stream:
            header = stream.read(20)
        if header[:4] != b'\x7fELF' or header[5] != 1 or struct.unpack_from('<H', header, 18)[0] != {'x86_64': 62, 'aarch64': 183}[arch]:
            raise RuntimeError('Wrong target graphics ELF: ' + str(path))
        files[destination] = str(resolved)
        dynamic = subprocess.check_output(['readelf', '-d', str(resolved)], text=True)
        for name in re.findall(r'\(NEEDED\).*\[([^]]+)\]', dynamic):
            if name in base or (Path(appdir) / 'usr/lib' / name).is_file():
                continue
            queue.append(directory / name)
    vendor = Path(sysroot) / 'usr/share/glvnd/egl_vendor.d/50_mesa.json'
    if not vendor.is_file():
        raise RuntimeError('Missing target Mesa EGL vendor registration')
    files['/runner/50_mesa.json'] = str(vendor.resolve())
    return files
