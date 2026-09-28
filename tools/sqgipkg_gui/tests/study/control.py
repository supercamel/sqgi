#!/usr/bin/env python3
"""Operate and capture the real GUI in a verified field-study session."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('session', type=Path)
    parser.add_argument('--op', default='inspect')
    parser.add_argument('--key')
    parser.add_argument('--id', type=int)
    parser.add_argument('--label')
    parser.add_argument('--text')
    parser.add_argument('--index', type=int)
    parser.add_argument('--active', choices=['true', 'false'])
    parser.add_argument('--expanded', choices=['true', 'false'])
    parser.add_argument('--shot', type=Path)
    parser.add_argument('--note', default='')
    args = parser.parse_args()
    if args.shot and args.shot.exists():
        parser.error('Screenshot already exists; choose a fresh evidence filename')
    session = args.session.resolve()
    state = json.loads((session / 'display.json').read_text())
    os.kill(state['supervisor_pid'], 0)
    os.kill(state['xvfb_pid'], 0)
    executable = Path(f"/proc/{state['xvfb_pid']}/exe").resolve().name
    if executable != 'Xvfb' or state['display'] in [':0', ':1']:
        raise RuntimeError('Refusing a display that is not the private study server')
    command = {key: getattr(args, key) for key in
               ['op', 'key', 'id', 'label', 'text', 'index', 'active', 'expanded']
               if getattr(args, key) is not None}
    for key in ['active', 'expanded']:
        if key in command:
            command[key] = command[key] == 'true'
    request_command = command
    if args.op in ['xkey', 'xtype']:
        tool_root = session.parent / 'tools/root'
        input_env = dict(os.environ, DISPLAY=state['display'],
                         LD_LIBRARY_PATH=str(tool_root / 'usr/lib/aarch64-linux-gnu'))
        input_env.pop('WAYLAND_DISPLAY', None)
        argv = [str(tool_root / 'usr/bin/xdotool')]
        argv += ['key', '--clearmodifiers', args.text] if args.op == 'xkey' else [
            'type', '--clearmodifiers', '--delay', '1', args.text]
        subprocess.run(argv, env=input_env, check=True, timeout=10)
        request_command = {'op': 'inspect'}
        time.sleep(0.35)
    response = session / 'response.json'
    response.unlink(missing_ok=True)
    temporary = session / 'request.tmp'
    temporary.write_text(json.dumps(request_command))
    temporary.replace(session / 'request.json')
    deadline = time.monotonic() + 15
    while not response.exists():
        if time.monotonic() > deadline:
            raise TimeoutError('GUI did not acknowledge the action; inspect application.log')
        time.sleep(0.05)
    result = json.loads(response.read_text())
    if result.get('ok') and args.op not in ['inspect', 'quit']:
        # GtkButton.activate includes a brief activation animation. Wait for
        # its action and another GTK frame before recording the resulting UI.
        time.sleep(0.35)
        response.unlink()
        temporary.write_text(json.dumps({'op': 'inspect'}))
        temporary.replace(session / 'request.json')
        deadline = time.monotonic() + 15
        while not response.exists():
            if time.monotonic() > deadline:
                raise TimeoutError('GUI did not settle after the action')
            time.sleep(0.05)
        result = json.loads(response.read_text())
    if args.shot:
        args.shot.parent.mkdir(parents=True, exist_ok=True)
        capture_env = dict(os.environ, DISPLAY=state['display'])
        capture_env.pop('WAYLAND_DISPLAY', None)
        time.sleep(0.15)
        subprocess.run(['import', '-window', 'root', str(args.shot)], env=capture_env,
                       check=True, timeout=10)
    record = {'time': time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime()),
              'command': command, 'note': args.note,
              'screenshot': str(args.shot.resolve()) if args.shot else None,
              'result': result}
    with (session / 'actions.jsonl').open('a') as log:
        log.write(json.dumps(record) + '\n')
    print(json.dumps({k: v for k, v in result.items() if k != 'widgets'}, ensure_ascii=False))
    for row in result.get('widgets', []):
        if row['kind'] in ['GtkBox', 'GtkViewport', 'GtkScrolledWindow']:
            continue
        content = row.get('label') or row.get('text') or row.get('title') or ''
        if content or row['kind'] in ['GtkEntry', 'GtkDropDown', 'GtkTextView', 'GtkCheckButton']:
            print(f"{row['id']:3} {row['kind']:20} {content[:300]!r}")
    return 0 if result.get('ok') else 1


if __name__ == '__main__':
    raise SystemExit(main())
