#!/usr/bin/env python3
"""Run an unchanged app beside loopback TCP/UDP echo peers in its namespace."""
import argparse
import json
from pathlib import Path
import socket
import subprocess
import threading
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--report', type=Path, required=True)
    parser.add_argument('--tcp-port', type=int, default=18080)
    parser.add_argument('--udp-port', type=int, default=18081)
    parser.add_argument('--tcp-expect', action='append', required=True, help='Hex bytes; stream fragments concatenate')
    parser.add_argument('--udp-expect', action='append', required=True, help='Hex bytes for each expected datagram')
    parser.add_argument('--timeout', type=int, default=180)
    parser.add_argument('command', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    command = args.command[1:] if args.command[:1] == ['--'] else args.command
    if not command or args.report.exists():
        parser.error('Supply a command and a new evidence filename')
    expected_tcp = b''.join(bytes.fromhex(value) for value in args.tcp_expect)
    expected_udp = [bytes.fromhex(value) for value in args.udp_expect]
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    tcp.bind(('127.0.0.1', args.tcp_port)); tcp.listen(4); tcp.settimeout(0.2)
    udp.bind(('127.0.0.1', args.udp_port)); udp.settimeout(0.2)
    stop = threading.Event()
    stream = bytearray(); datagrams = []; events = []; errors = []

    def serve_tcp():
        while not stop.is_set():
            try:
                connection, address = tcp.accept()
            except socket.timeout:
                continue
            try:
                with connection:
                    connection.settimeout(0.2)
                    while not stop.is_set():
                        try:
                            data = connection.recv(4096)
                        except socket.timeout:
                            continue
                        if not data:
                            break
                        stream.extend(data)
                        events.append({'protocol': 'tcp', 'time': time.time(), 'hex': data.hex()})
                        connection.sendall(data)
            except OSError as error:
                errors.append('TCP: ' + str(error))

    def serve_udp():
        while not stop.is_set():
            try:
                data, address = udp.recvfrom(65535)
            except socket.timeout:
                continue
            datagrams.append(data)
            events.append({'protocol': 'udp', 'time': time.time(), 'hex': data.hex()})
            try:
                udp.sendto(data, address)
            except OSError as error:
                errors.append('UDP: ' + str(error))

    workers = [threading.Thread(target=serve_tcp), threading.Thread(target=serve_udp)]
    for worker in workers:
        worker.start()
    started = time.time()
    print('STUDY_NETWORK_READY TCP=%d UDP=%d' % (args.tcp_port, args.udp_port), flush=True)
    try:
        try:
            status = subprocess.run(command, timeout=args.timeout).returncode
        except subprocess.TimeoutExpired:
            status = 124
    finally:
        stop.set()
        for worker in workers:
            worker.join(timeout=2)
        tcp.close(); udp.close()
    passed = status == 0 and bytes(stream) == expected_tcp and datagrams == expected_udp and not errors
    record = {'argv': command, 'started': started, 'finished': time.time(),
              'scope': 'Loopback peers inside the application namespace; GUI interaction supplied externally',
              'application_exit_status': status, 'tcp_port': args.tcp_port, 'udp_port': args.udp_port,
              'expected_tcp_hex': expected_tcp.hex(), 'received_tcp_hex': bytes(stream).hex(),
              'expected_udp_hex': [data.hex() for data in expected_udp],
              'received_udp_hex': [data.hex() for data in datagrams], 'events': events,
              'errors': errors, 'acceptance': 'pass' if passed else 'fail'}
    args.report.write_text(json.dumps(record, indent=2) + '\n')
    print('STUDY_NETWORK_RESULT ' + json.dumps(record), flush=True)
    return 0 if passed else (status or 1)


if __name__ == '__main__':
    raise SystemExit(main())
