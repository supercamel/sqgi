#!/usr/bin/env python3
"""Run Windows compatibility probes with private Wine, QEMU and a private prefix.

The Linux sysroot supplies the emulated Wine runner's OS libraries. Windows
application DLLs must come from the supplied app folder or Wine's own prefix.
This is emulation evidence, not a native Windows result.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import stat
import subprocess
import time

from isolated_linux import dependencies
from runner_support import accepted, crash_diagnostics, host_unwind_file, utf8_locale_files, network_peer_files

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--wine-root', type=Path, required=True)
parser.add_argument('--linux-sysroot', type=Path, required=True)
parser.add_argument('--prefix', type=Path, required=True)
parser.add_argument('--appdir', type=Path, required=True)
parser.add_argument('--logs', type=Path, required=True)
parser.add_argument('--name', required=True)
parser.add_argument('--timeout', type=int, default=60)
parser.add_argument('--omit-utf8-locale', action='store_true', help='Diagnostic only: omit required Unix UTF-8 locale data')
parser.add_argument('--omit-runner-fonts', action='store_true', help='Diagnostic only: omit private Wine system-font inputs')
parser.add_argument('--display-session', type=Path, help='Explicit verified private Xvfb session; never the desktop')
parser.add_argument('--gtk-renderer', choices=['cairo', 'gl', 'ngl', 'vulkan'], help='Explicit diagnostic renderer override; default behavior remains a separate gate')
parser.add_argument('--serial-from-env', action='store_true', help='Map only the peer-owned PTY to private Wine COM1')
parser.add_argument('--no-window', action='store_true', help='Run fixture checks without its graphical window')
parser.add_argument('--ui-checks', action='store_true', help='Run the Playground live language-widget assertions')
parser.add_argument('--network-checks', action='store_true', help='Run local Verminal echo peers in the same network namespace')
parser.add_argument('--expected-revision', help='Expected compiled revision for the native-counter fixture')
parser.add_argument('--native-crt', action='store_true', help='Require the supplied Microsoft C++ runtime DLLs instead of Wine replacements')
parser.add_argument('--system-linux-libraries', action='store_true', help='Diagnostic: expose the runner sysroot libraries at standard x86_64 Linux loader paths')
parser.add_argument('--loader-trace', action='store_true', help='Record ELF loader searches as well as Windows DLL searches')
parser.add_argument('--host-unwind', action='store_true', default=True, help=argparse.SUPPRESS)
parser.add_argument('--omit-host-unwind', action='store_false', dest='host_unwind', help='Diagnostic only: reproduce the original incomplete runner')
parser.add_argument('--omit-wine-zlib', action='store_true', help='Diagnostic only: omit the Wine auxiliary-process DLL repair')
parser.add_argument('--expect', action='append', default=[], help='Required output marker, in addition to clean process exit')
parser.add_argument('command', nargs=argparse.REMAINDER)
args = parser.parse_args()
if args.ui_checks and (not args.display_session or args.no_window):
    parser.error('--ui-checks requires a private display and a visible fixture window')
command = args.command[1:] if args.command[:1] == ['--'] else args.command
logs = args.logs.resolve(); logs.mkdir(parents=True, exist_ok=True)
record = logs / (args.name + '.json'); logfile = logs / (args.name + '.txt')
if record.exists() or logfile.exists():
    raise SystemExit('Choose new evidence names')
prefix = args.prefix.resolve(); prefix.mkdir(parents=True, exist_ok=True)
wine = args.wine_root.resolve(); sysroot = args.linux_sysroot.resolve()
hq_layout = (wine / 'opt/wine-stable/bin/wine').is_file()
wine_command = '/opt/wine-stable/bin/wine' if hq_layout else '/usr/lib/wine/wine64'
wine_server = '/opt/wine-stable/bin/wineserver' if hq_layout else '/usr/lib/wine/wineserver64'
wine_bindings = (['--ro-bind', str(wine / 'opt/wine-stable'), '/opt/wine-stable'] if hq_layout else [
    '--ro-bind', str(wine / 'usr/lib/wine'), '/usr/lib/wine',
    '--ro-bind', str(wine / 'usr/lib/x86_64-linux-gnu/wine'), '/usr/lib/x86_64-linux-gnu/wine',
    '--ro-bind', str(wine / 'usr/share/wine'), '/usr/share/wine'])
argv = ['bwrap', '--unshare-user', '--unshare-pid', '--unshare-net', '--die-with-parent',
        '--proc', '/proc', '--dev', '/dev', '--tmpfs', '/tmp', '--dir', '/home/study',
        '--ro-bind', str(sysroot), '/target', '--bind', str(prefix), '/prefix',
        '--ro-bind', str(args.appdir.resolve()), '/app',
        *wine_bindings,
        '--clearenv', '--setenv', 'HOME', '/home/study', '--setenv', 'PATH', '/usr/bin:' + str(Path(wine_command).parent),
        '--setenv', 'LANG', 'C.UTF-8', '--setenv', 'WINEPREFIX', '/prefix',
        '--setenv', 'WINEARCH', 'win64', '--setenv', 'WINESERVER', wine_server,
        '--setenv', 'WINEDEBUG', '+timestamp,+pid,+loaddll',
        '--setenv', 'WINEDLLOVERRIDES', ('msvcp140,vcruntime140,vcruntime140_1,concrt140=n;' if args.native_crt else '') + 'mscoree,mshtml=',
        '--setenv', 'QEMU_LD_PREFIX', '/target', '--setenv', 'LD_LIBRARY_PATH', '/target/usr/lib/x86_64-linux-gnu',
        '--chdir', '/app']
display = None
if args.display_session:
    session = args.display_session.resolve()
    state = json.loads((session / 'display.json').read_text())
    for key in ['supervisor_pid', 'xvfb_pid']:
        os.kill(state[key], 0)
    display = state['display']
    match = re.fullmatch(r':([0-9]+)', display)
    if not match or int(match.group(1)) < 2 or Path(f"/proc/{state['xvfb_pid']}/exe").resolve().name != 'Xvfb':
        raise SystemExit('Refusing a display that is not the private study Xvfb')
    if 'headless.py' not in Path(f"/proc/{state['supervisor_pid']}/cmdline").read_text():
        raise SystemExit('Unverified display supervisor')
    socket = '/tmp/.X11-unix/X' + match.group(1)
    argv += ['--ro-bind', socket, socket, '--setenv', 'DISPLAY', display,
             '--setenv', 'LIBGL_ALWAYS_SOFTWARE', '1']
serial_device = None
if args.serial_from_env:
    serial_device = os.environ.get('SQGI_STUDY_SERIAL_DEVICE', '')
    if not re.fullmatch(r'/dev/pts/[0-9]+', serial_device) or not stat.S_ISCHR(os.stat(serial_device).st_mode):
        raise SystemExit('Expected the private serial peer PTY')
    com = prefix / 'dosdevices/com1'
    com.parent.mkdir(parents=True, exist_ok=True)
    if com.is_symlink():
        if os.readlink(com) != '/dev/study-serial':
            raise SystemExit('Refusing to change an existing Wine COM1 mapping')
    elif com.exists():
        raise SystemExit('Refusing to replace an existing Wine COM1 file')
    else:
        com.symlink_to('/dev/study-serial')
    argv += ['--dev-bind', serial_device, '/dev/study-serial', '--setenv', 'SQGI_STUDY_SERIAL_DEVICE', 'COM1']
if args.no_window:
    argv += ['--setenv', 'SQGI_STUDY_NO_WINDOW', '1']
if args.ui_checks:
    argv += ['--setenv', 'SQGI_STUDY_UI_CHECKS', '1']
if args.expected_revision is not None:
    argv += ['--setenv', 'SQGI_STUDY_EXPECT_REVISION', args.expected_revision]
if args.gtk_renderer:
    argv += ['--setenv', 'GSK_RENDERER', args.gtk_renderer]
if args.system_linux_libraries:
    # Insert before the Wine-specific directory binds, which must take priority.
    position = argv.index(wine_bindings[1]) - 1
    argv[position:position] = [
        '--ro-bind', str(sysroot / 'usr/lib/x86_64-linux-gnu'), '/lib/x86_64-linux-gnu',
        '--ro-bind', str(sysroot / 'usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2'), '/lib64/ld-linux-x86-64.so.2']
if args.loader_trace:
    argv += ['--setenv', 'LD_DEBUG', 'libs,files']
bindings = {}
if args.network_checks:
    network_inputs = network_peer_files()
    bindings.update(network_inputs)
    for path in [Path('/usr/bin/python3').resolve(), *[Path(value) for value in network_inputs.values() if value.endswith('.so')]]:
        for dependency in dependencies(path):
            bindings[dependency] = str(Path(dependency).resolve())
for name in ['qemu-x86_64', 'bash', 'env', 'sh']:
    exe = Path(shutil.which(name)).resolve(); bindings['/usr/bin/' + name] = str(exe)
    for dependency in dependencies(exe):
        bindings[dependency] = str(Path(dependency).resolve())
if not args.omit_utf8_locale:
    bindings.update(utf8_locale_files())
if args.display_session and not args.omit_runner_fonts:
    fonts = Path('/usr/share/fonts/truetype/dejavu')
    if not (fonts / 'DejaVuSans.ttf').is_file():
        raise SystemExit('Missing standard DejaVu system fonts for private Wine display')
    for item in fonts.glob('*.ttf'):
        bindings[str(item)] = str(item.resolve())
bindings['/bin/sh'] = str(Path('/bin/sh').resolve())
if args.host_unwind:
    unwind = host_unwind_file()
    bindings[str(unwind)] = str(unwind)
if not args.omit_wine_zlib and not hq_layout:
    zlib = wine / 'usr/x86_64-w64-mingw32/lib/zlib1.dll'
    if not zlib.is_file():
        raise SystemExit('Missing private Wine runner dependency: ' + str(zlib))
    bindings['/prefix/drive_c/windows/system32/zlib1.dll'] = str(zlib)
for registration in Path('/proc/sys/fs/binfmt_misc').iterdir():
    if registration.name not in ['qemu-x86_64', 'x86_64']:
        continue
    match = re.search(r'^interpreter (.+)$', registration.read_text(), re.M)
    if match:
        bindings[match.group(1)] = bindings['/usr/bin/qemu-x86_64']
for dest, source in sorted(bindings.items()):
    argv += ['--ro-bind', source, dest]
launch = ['/usr/bin/qemu-x86_64', wine_command, *command]
if args.network_checks:
    peer_directory = logs / (args.name + '-network')
    peer_directory.mkdir(exist_ok=False)
    argv += ['--bind', str(peer_directory), '/evidence']
    launch = ['/usr/bin/study-python', '/runner/network_peer.py', '--report', '/evidence/network.json',
              '--tcp-expect', b'line-test\r\n'.hex(), '--tcp-expect', '000141ff',
              '--udp-expect', b'udp-test\n'.hex(), '--udp-expect', 'ff007f20',
              '--timeout', str(args.timeout - 5), '--', *launch]
argv += ['--', *launch]
metadata = {'argv': argv, 'started': time.time(), 'scope': 'Private Wine under QEMU; no native Windows result',
            'wine_root': str(wine), 'wine_layout': 'WineHQ /opt' if hq_layout else 'Ubuntu /usr',
            'prefix': str(prefix), 'application': str(args.appdir.resolve()), 'serial_device': serial_device, 'display': display,
            'network_peer': str(peer_directory / 'network.json') if args.network_checks else None,
            'runner_files': {dest: {'source': src, 'sha256': hashlib.sha256(Path(src).read_bytes()).hexdigest()}
                             for dest, src in bindings.items()}, 'required_markers': args.expect}
record.write_text(json.dumps(metadata, indent=2) + '\n')
with logfile.open('w') as output:
    try:
        result = subprocess.run(argv, stdout=output, stderr=subprocess.STDOUT, timeout=args.timeout)
        status = result.returncode
    except subprocess.TimeoutExpired:
        status = 124
output_text = logfile.read_text(errors='replace')
passed = accepted(status, output_text, args.expect)
metadata.update(exit_status=status, finished=time.time(), acceptance='pass' if passed else 'fail',
                crash_diagnostics=crash_diagnostics(output_text),
                missing_markers=[marker for marker in args.expect if marker not in output_text])
record.write_text(json.dumps(metadata, indent=2) + '\n')
print(json.dumps(metadata))
print(output_text[-2500:])
raise SystemExit(0 if passed else (status or 1))
