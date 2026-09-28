#!/usr/bin/env python3
"""Run the field study on a private X server; never fall back to the desktop."""
import argparse
import json
import os
from pathlib import Path
import select
import signal
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--tools', type=Path, required=True)
    parser.add_argument('--session', type=Path, required=True)
    parser.add_argument('--size', default='1440x1000')
    parser.add_argument('command', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    command = args.command[1:] if args.command[:1] == ['--'] else args.command
    if not command:
        parser.error('a command is required')
    session = args.session.resolve()
    session.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ)
    for key in ['DISPLAY', 'WAYLAND_DISPLAY', 'DBUS_SESSION_BUS_ADDRESS',
                'DBUS_SESSION_BUS_PID', 'XAUTHORITY', 'SESSION_MANAGER',
                'DESKTOP_STARTUP_ID', 'XDG_ACTIVATION_TOKEN', 'GTK_MODULES',
                'GTK_PATH', 'LD_LIBRARY_PATH', 'GI_TYPELIB_PATH']:
        env.pop(key, None)
    for key, folder in [('XDG_RUNTIME_DIR', 'runtime'), ('XDG_CONFIG_HOME', 'config'),
                        ('XDG_CACHE_HOME', 'cache'), ('XDG_DATA_HOME', 'data')]:
        path = session / folder
        path.mkdir(mode=0o700, exist_ok=True)
        path.chmod(0o700)
        env[key] = str(path)
    env.update(GDK_BACKEND='x11', GSK_RENDERER='cairo', GTK_A11Y='none',
               GIO_USE_VFS='local', GTK_USE_PORTAL='0', XDG_CURRENT_DESKTOP='SQGIStudy',
               LIBGL_ALWAYS_SOFTWARE='1', GSETTINGS_BACKEND='memory')
    tool_env = dict(env, LD_LIBRARY_PATH=str(args.tools / 'usr/lib/aarch64-linux-gnu'))
    bin_dir = args.tools / 'usr/bin'
    read_fd, write_fd = os.pipe()
    children = []
    logs = []

    def launch(argv, child_env, logfile, **kwargs):
        log = (session / logfile).open('w')
        logs.append(log)
        child = subprocess.Popen(argv, env=child_env, stdout=log, stderr=log,
                                 start_new_session=True, **kwargs)
        children.append(child)
        return child

    def stop(_signum, _frame):
        raise KeyboardInterrupt

    signal.signal(signal.SIGTERM, stop)
    try:
        server = launch([str(bin_dir / 'Xvfb'), '-displayfd', str(write_fd),
                         '-screen', '0', args.size + 'x24', '-nolisten', 'tcp',
                         '-noreset'], tool_env, 'xvfb.log', pass_fds=(write_fd,))
        os.close(write_fd)
        if not select.select([read_fd], [], [], 15)[0]:
            raise RuntimeError('Private X server did not become ready')
        display = os.read(read_fd, 128).decode().strip()
        os.close(read_fd)
        if not display.isdigit() or server.poll() is not None:
            raise RuntimeError('Private X server failed; see xvfb.log')
        env['DISPLAY'] = ':' + display
        tool_env['DISPLAY'] = env['DISPLAY']
        tool_env['XDG_DATA_DIRS'] = str(args.tools / 'usr/share') + ':/usr/share'
        subprocess.run(['xdpyinfo'], env=env, check=True, stdout=subprocess.DEVNULL,
                       stderr=subprocess.PIPE, timeout=10)
        config = session / 'openbox.xml'
        config.write_text('<openbox_config xmlns="http://openbox.org/3.4/rc">'
                          '<theme><name>Clearlooks</name></theme>'
                          '<focus><focusNew>yes</focusNew></focus>'
                          '</openbox_config>')
        manager = launch([str(bin_dir / 'openbox'), '--sm-disable', '--config-file', str(config)],
                         tool_env, 'openbox.log')
        time.sleep(0.5)
        if manager.poll() is not None:
            raise RuntimeError('Private window manager failed; see openbox.log')
        (session / 'display.json').write_text(json.dumps({
            'supervisor_pid': os.getpid(), 'xvfb_pid': server.pid,
            'openbox_pid': manager.pid, 'display': env['DISPLAY'], 'size': args.size,
            'environment': {k: v for k, v in env.items() if k.startswith(('XDG_', 'GDK_', 'GSK_'))},
        }, indent=2) + '\n')
        child = launch(['dbus-run-session', '--', *command], env, 'application.log')
        print(json.dumps({'session': str(session), 'display': env['DISPLAY'],
                          'child_pid': child.pid}), flush=True)
        while child.poll() is None:
            if server.poll() is not None or manager.poll() is not None:
                raise RuntimeError('Private display stopped during study')
            time.sleep(0.25)
        return child.returncode
    finally:
        for child in reversed(children):
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try:
                    child.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL)
                    child.wait(timeout=5)
        for log in logs:
            log.close()


if __name__ == '__main__':
    raise SystemExit(main())
