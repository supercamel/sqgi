#!/usr/bin/env python3
"""Run an extracted study AppImage with only payload, runner tools and base libc.

Uses a private mount/user/network namespace. No source/development tree, host GI
repository or session bus is mounted. An explicit verified private display can
be supplied for graphical checks. Cross execution uses QEMU and a
minimal target libc directory, never the full packaging sysroot. This exercises
the original AppRun from extracted contents, not AppImage mounting itself.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import stat
import subprocess
import time
from runner_support import accepted, crash_diagnostics, host_unwind_file, utf8_locale_files, network_peer_files, software_gl_files


def dependencies(executable):
    result = subprocess.run(['ldd', str(executable)], text=True, capture_output=True, check=True)
    return re.findall(r'(?:=>\s+|^\s*)(/\S+)', result.stdout, re.M)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--appdir', type=Path, required=True)
    parser.add_argument('--sysroot', type=Path, required=True)
    parser.add_argument('--arch', choices=['x86_64', 'aarch64'], required=True)
    parser.add_argument('--logs', type=Path, required=True)
    parser.add_argument('--name', required=True)
    parser.add_argument('--expected-revision', default='42')
    parser.add_argument('--no-window', action='store_true', help='Run functional checks without opening an application window')
    parser.add_argument('--serial-from-env', action='store_true', help='Bind the private PTY allocated by serial_peer.py')
    parser.add_argument('--display-session', type=Path, help='Verified owned Xvfb session only')
    parser.add_argument('--gtk-renderer', choices=['cairo', 'gl', 'ngl', 'vulkan'], help='Explicit diagnostic override')
    parser.add_argument('--timeout', type=int, default=90)
    parser.add_argument('--ui-checks', action='store_true', help='Exercise actual Playground language widgets and exit')
    parser.add_argument('--network-checks', action='store_true', help='Run local Verminal TCP/UDP echo peers in the same network namespace')
    parser.add_argument('--scene-checks', action='store_true', help='Run local scene imagery/terrain peer in the same network namespace')
    parser.add_argument('--software-gl', action='store_true', help='Explicit target Mesa driver closure as hashed runner inputs')
    parser.add_argument('--qemu-trace', action='store_true', help='Diagnostic syscall trace; can produce large logs')
    args = parser.parse_args()
    if args.ui_checks and (not args.display_session or args.no_window):
        parser.error('--ui-checks requires a private display and a visible fixture window')
    if args.scene_checks and (not args.display_session or args.no_window or args.network_checks):
        parser.error('--scene-checks requires its own private graphical peer run')
    if args.software_gl and not args.display_session:
        parser.error('--software-gl requires a private display')
    appdir = args.appdir.resolve()
    logs = args.logs.resolve()
    logs.mkdir(parents=True, exist_ok=True)
    record = logs / (args.name + '.json')
    log = logs / (args.name + '.txt')
    if record.exists() or log.exists():
        raise SystemExit('Evidence names are immutable; choose another name')
    cross = args.arch != platform.machine()
    argv = ['bwrap', '--unshare-user', '--unshare-pid', '--unshare-net', '--die-with-parent',
            '--proc', '/proc', '--dev', '/dev', '--tmpfs', '/tmp', '--dir', '/home/study',
            '--ro-bind', str(appdir), '/app', '--clearenv', '--setenv', 'PATH', '/usr/bin',
            '--setenv', 'HOME', '/home/study', '--setenv', 'LANG', 'C.UTF-8',
            '--setenv', 'SQGI_STUDY_EXPECT_REVISION', args.expected_revision,
            '--setenv', 'LD_DEBUG', 'libs,files', '--chdir', '/tmp']
    if args.no_window:
        argv += ['--setenv', 'SQGI_STUDY_NO_WINDOW', '1']
    if args.ui_checks:
        argv += ['--setenv', 'SQGI_STUDY_UI_CHECKS', '1']
    display = None
    if args.display_session:
        state = json.loads((args.display_session.resolve() / 'display.json').read_text())
        for key in ['supervisor_pid', 'xvfb_pid']:
            os.kill(state[key], 0)
        display = state['display']
        match = re.fullmatch(r':([0-9]+)', display)
        if not match or int(match.group(1)) < 2 or Path(f"/proc/{state['xvfb_pid']}/exe").resolve().name != 'Xvfb':
            raise RuntimeError('Refusing a display that is not the private study Xvfb')
        if 'headless.py' not in Path(f"/proc/{state['supervisor_pid']}/cmdline").read_text():
            raise RuntimeError('Unverified private display supervisor')
        socket = '/tmp/.X11-unix/X' + match.group(1)
        argv += ['--ro-bind', socket, socket, '--setenv', 'DISPLAY', display,
                 '--setenv', 'GDK_BACKEND', 'x11', '--setenv', 'GTK_A11Y', 'none',
                 '--setenv', 'LIBGL_ALWAYS_SOFTWARE', '1', '--setenv', 'GIO_USE_VFS', 'local',
                 '--setenv', 'GSETTINGS_BACKEND', 'memory']
    if args.gtk_renderer:
        argv += ['--setenv', 'GSK_RENDERER', args.gtk_renderer]
    serial_device = None
    if args.serial_from_env:
        serial_device = os.environ.get('SQGI_STUDY_SERIAL_DEVICE', '')
        if not re.fullmatch(r'/dev/pts/[0-9]+', serial_device) or not stat.S_ISCHR(os.stat(serial_device).st_mode):
            raise RuntimeError('The serial runner requires a private POSIX PTY endpoint')
        argv += ['--dev-bind', serial_device, '/dev/study-serial',
                 '--setenv', 'SQGI_STUDY_SERIAL_DEVICE', '/dev/study-serial']
    # Utilities called by AppRun and, for cross runs, the host QEMU interpreter.
    bindings = utf8_locale_files()
    if args.software_gl:
        bindings.update(software_gl_files(args.sysroot, args.arch, appdir))
        argv += ['--setenv', '__EGL_VENDOR_LIBRARY_FILENAMES', '/runner/50_mesa.json',
                 '--setenv', 'LIBGL_DRIVERS_PATH', '/usr/lib/' + args.arch + '-linux-gnu/dri']
    if args.network_checks or args.scene_checks:
        network_inputs = network_peer_files()
        bindings.update(network_inputs)
        if args.scene_checks:
            bindings['/runner/scene_http_peer.py'] = str(Path(__file__).with_name('scene_http_peer.py').resolve())
        for path in [Path('/usr/bin/python3').resolve(), *[Path(value) for value in network_inputs.values() if value.endswith('.so')]]:
            for dependency in dependencies(path):
                bindings[dependency] = str(Path(dependency).resolve())
    if args.display_session:
        for directory in [Path('/etc/fonts'), Path('/usr/share/fontconfig'), Path('/usr/share/fonts/truetype/dejavu')]:
            for path in directory.rglob('*'):
                if path.is_file():
                    bindings[str(path)] = str(path.resolve())
    for name in ['bash', 'env', 'dirname', 'readlink', 'mkdir'] + (['qemu-' + args.arch] if cross else []):
        executable = Path(shutil.which(name)).resolve()
        bindings['/usr/bin/' + name] = str(executable)
        for dependency in dependencies(executable):
            bindings[dependency] = str(Path(dependency).resolve())
    if cross:
        unwind = host_unwind_file()
        bindings[str(unwind)] = str(unwind)
        qemu = bindings['/usr/bin/qemu-' + args.arch]
        # Host binfmt registrations stay unchanged. Bind QEMU at the registered
        # interpreter locations inside this namespace only, so AppRun's exec
        # uses the explicitly selected runner even when Box64 is also installed.
        for registration in Path('/proc/sys/fs/binfmt_misc').iterdir():
            if registration.name not in ['qemu-' + args.arch, args.arch]:
                continue
            text = registration.read_text()
            match = re.search(r'^interpreter (.+)$', text, re.M)
            if match:
                bindings[match.group(1)] = qemu
        argv += ['--setenv', 'QEMU_LD_PREFIX', '/target']
        if args.qemu_trace:
            argv += ['--setenv', 'QEMU_STRACE', '1']
    prefix = '/target' if cross else ''
    triplet = args.arch + '-linux-gnu'
    for name in ['libc.so.6', 'libm.so.6', 'libdl.so.2', 'libpthread.so.0', 'librt.so.1', 'libresolv.so.2', 'libutil.so.1']:
        source = args.sysroot / 'usr/lib' / triplet / name
        if source.is_file():
            bindings[prefix + '/lib/' + triplet + '/' + name] = str(source.resolve())
    loader = 'ld-linux-x86-64.so.2' if args.arch == 'x86_64' else 'ld-linux-aarch64.so.1'
    source = args.sysroot / 'usr/lib' / triplet / loader
    bindings[prefix + '/' + ('lib64/' if args.arch == 'x86_64' else 'lib/') + loader] = str(source.resolve())
    for destination, source in sorted(bindings.items()):
        if not Path(source).is_file():
            raise RuntimeError('Missing runner file: ' + source)
        argv += ['--ro-bind', source, destination]
    command = ['/usr/bin/bash', '/app/AppRun']
    if args.network_checks:
        peer_directory = logs / (args.name + '-network')
        peer_directory.mkdir(exist_ok=False)
        argv += ['--bind', str(peer_directory), '/evidence']
        command = ['/usr/bin/study-python', '/runner/network_peer.py', '--report', '/evidence/network.json',
                   '--tcp-expect', b'line-test\r\n'.hex(), '--tcp-expect', '000141ff',
                   '--udp-expect', b'udp-test\n'.hex(), '--udp-expect', 'ff007f20',
                   '--timeout', str(args.timeout - 5), '--', *command]
    if args.scene_checks:
        scene_directory = logs / (args.name + '-scene')
        scene_directory.mkdir(exist_ok=False)
        argv += ['--bind', str(scene_directory), '/evidence']
        command = ['/usr/bin/study-python', '/runner/scene_http_peer.py', '--evidence', '/evidence',
                   '--timeout', str(args.timeout - 5), '--', *command]
    argv += ['--', *command]
    metadata = {'argv': argv, 'appdir': str(appdir), 'architecture': args.arch,
                'private_serial_endpoint': serial_device, 'display': display,
                'network_peer': str(peer_directory / 'network.json') if args.network_checks else None,
                'scene_peer': str(scene_directory / 'scene-peer.json') if args.scene_checks else None,
                'software_gl': args.software_gl,
                'mode': 'emulated extracted AppRun' if cross else 'native extracted AppRun',
                'isolation': 'private filesystem with explicit runner/base-libc files; no development trees or GI repositories',
                'runner_files': {dest: {'source': src, 'sha256': hashlib.sha256(Path(src).read_bytes()).hexdigest()}
                                 for dest, src in bindings.items()}, 'started': time.time()}
    result = subprocess.run(argv, text=True, capture_output=True, timeout=args.timeout)
    log.write_text(result.stdout + result.stderr)
    passed = accepted(result.returncode, result.stdout + result.stderr, [])
    metadata.update(finished=time.time(), exit_status=result.returncode, stdout=result.stdout,
                    acceptance='pass' if passed else 'fail',
                    crash_diagnostics=crash_diagnostics(result.stdout + result.stderr),
                    stderr_tail=result.stderr[-3000:])
    record.write_text(json.dumps(metadata, indent=2) + '\n')
    print(json.dumps({key: metadata[key] for key in ['mode', 'exit_status', 'stdout']}, indent=2))
    return 0 if passed else (result.returncode or 1)


if __name__ == '__main__':
    raise SystemExit(main())
