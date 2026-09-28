#!/usr/bin/env python3
"""Local deterministic scene data for an isolated packaged application."""
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


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--evidence', type=Path, required=True)
    p.add_argument('--timeout', type=int, default=60)
    p.add_argument('--host-network', action='store_true', help='Record explicitly that this peer uses the host loopback namespace')
    p.add_argument('command', nargs=argparse.REMAINDER)
    args = p.parse_args()
    record = args.evidence / 'scene-peer.json'
    ready = args.evidence / 'scene-ready'
    if record.exists() or ready.exists():
        p.error('Scene evidence must be new')
    command = args.command[1:] if args.command[:1] == ['--'] else args.command
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data))
    pixels = b''.join(b'\0' + bytes([32, 128, 32]) * 256 for _ in range(256))
    image = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', 256, 256, 8, 2, 0, 0, 0)) + chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b'')
    terrain = b'\x00\x64' * (1201 * 1201)
    requests = Counter()
    class Handler(BaseHTTPRequestHandler):
        def do_GET(self):
            requests[self.path] += 1
            if self.path.startswith('/tiles/'):
                data, mime = image, 'image/png'
            elif self.path.startswith('/terrain/'):
                data, mime = terrain, 'application/octet-stream'
            else:
                self.send_error(404); return
            self.send_response(200)
            self.send_header('Content-Type', mime)
            self.send_header('Content-Length', str(len(data)))
            self.end_headers()
            try:
                self.wfile.write(data)
            except (BrokenPipeError, ConnectionResetError):
                pass
        def log_message(self, *_args):
            pass
    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    worker = threading.Thread(target=server.serve_forever, daemon=True)
    worker.start()
    env = dict(os.environ, SQGI_STUDY_SCENE_BASE_URL=f'http://127.0.0.1:{server.server_port}/',
               SQGI_STUDY_READY=str(ready))
    started = time.time()
    try:
        try:
            status = subprocess.run(command, env=env, timeout=args.timeout).returncode
        except subprocess.TimeoutExpired:
            status = 124
    finally:
        server.shutdown(); server.server_close(); worker.join(timeout=2)
    peer_ok = any(s.startswith('/tiles/') for s in requests) and any(s.startswith('/terrain/') for s in requests)
    record.write_text(json.dumps(dict(argv=command, started=started, finished=time.time(),
        application_exit_status=status, requests=dict(requests), peer_checks_pass=peer_ok,
        ready=ready.exists(), scope='host loopback HTTP; not network-isolated' if args.host_network else 'loopback HTTP in isolated application network namespace'), indent=2)+'\n')
    return status or (0 if peer_ok and ready.exists() else 1)

if __name__ == '__main__':
    raise SystemExit(main())
