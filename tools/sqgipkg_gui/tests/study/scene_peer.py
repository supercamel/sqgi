#!/usr/bin/env python3
"""Serve deterministic imagery/height data and capture a private-display scene."""
import argparse
from collections import Counter
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import struct
import subprocess
import threading
import time
import zlib
from PIL import Image


def png():
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data))
    pixels = b''.join(b'\0' + bytes([32, 128, 32]) * 256 for _ in range(256))
    return b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', 256, 256, 8, 2, 0, 0, 0)) + chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b'')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--session', type=Path, required=True)
    parser.add_argument('--logs', type=Path, required=True)
    parser.add_argument('--name', required=True)
    parser.add_argument('--screenshot', type=Path, required=True)
    parser.add_argument('--library-dir', type=Path, required=True)
    parser.add_argument('command', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    state = json.loads((args.session / 'display.json').read_text())
    if os.environ.get('DISPLAY') != state['display'] or Path(f"/proc/{state['xvfb_pid']}/exe").resolve().name != 'Xvfb':
        raise RuntimeError('Capture requires the owned private Xvfb session')
    os.kill(state['supervisor_pid'], 0)
    args.logs.mkdir(parents=True, exist_ok=True)
    args.screenshot.parent.mkdir(parents=True, exist_ok=True)
    log = args.logs / (args.name + '.txt'); record = log.with_suffix('.json')
    if log.exists() or record.exists() or args.screenshot.exists():
        raise SystemExit('Choose new evidence filenames')
    requests = Counter(); image = png(); terrain = b'\x00\x64' * (1201 * 1201)

    class Handler(BaseHTTPRequestHandler):
        def do_GET(self):
            requests[self.path] += 1
            if self.path.startswith('/tiles/'):
                data, mime = image, 'image/png'
            elif self.path.startswith('/terrain/'):
                data, mime = terrain, 'application/octet-stream'
            else:
                self.send_error(404); return
            self.send_response(200); self.send_header('Content-Type', mime)
            self.send_header('Content-Length', str(len(data))); self.end_headers()
            try:
                self.wfile.write(data)
            except (BrokenPipeError, ConnectionResetError):
                pass

        def log_message(self, *_args):
            pass

    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    worker = threading.Thread(target=server.serve_forever, daemon=True); worker.start()
    ready = args.session / 'scene-ready'; ready.unlink(missing_ok=True)
    env = dict(os.environ, SQGI_STUDY_SCENE_BASE_URL=f'http://127.0.0.1:{server.server_port}/',
               SQGI_STUDY_READY=str(ready.resolve()), LD_LIBRARY_PATH=str(args.library_dir.resolve()),
               GI_TYPELIB_PATH=str(args.library_dir.resolve()))
    command = args.command[1:] if args.command[:1] == ['--'] else args.command
    started = time.time(); captured = False
    try:
        with log.open('w') as output, subprocess.Popen(command, env=env, stdout=output, stderr=output) as child:
            while child.poll() is None:
                if time.time() - started > 45:
                    child.kill(); raise TimeoutError('Scene did not finish')
                if ready.exists() and not captured:
                    subprocess.run(['import', '-window', 'root', str(args.screenshot)], env=os.environ, check=True, timeout=10)
                    captured = True
                time.sleep(0.05)
            status = child.returncode
    finally:
        server.shutdown(); server.server_close(); worker.join(timeout=2)
    pixel_checks = {}
    if captured:
        with Image.open(args.screenshot) as screenshot:
            pixels = list(screenshot.convert('RGB').getdata())
        pixel_checks = {'red_scene_pixels': sum(r > 120 and r > g * 2 and r > b * 2 for r, g, b in pixels),
                        'green_imagery_pixels': sum(g > 60 and g > r * 1.5 and g > b * 1.5 for r, g, b in pixels)}
    peer_ok = (any(path.startswith('/terrain/') for path in requests) and
               any(path.startswith('/tiles/') for path in requests) and
               pixel_checks.get('red_scene_pixels', 0) > 10000 and pixel_checks.get('green_imagery_pixels', 0) > 10000)
    record.write_text(json.dumps({'argv': command, 'started': started, 'finished': time.time(),
        'exit_status': status, 'scope': 'source GI and software-GL execution on private display; local synthetic imagery and 100 m terrain',
        'requests': dict(requests), 'captured': captured, 'screenshot': str(args.screenshot.resolve()),
        'pixel_checks': pixel_checks, 'peer_checks_pass': peer_ok,
        'library_dir': str(args.library_dir.resolve())}, indent=2) + '\n')
    print(log.read_text())
    return status or (0 if captured and peer_ok else 1)


if __name__ == '__main__':
    raise SystemExit(main())
