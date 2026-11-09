#!/usr/bin/env python3
# Regression reference only. The CLI and installed Android backend use SQGI.
"""Versioned process boundary between sqgipkg and Android assembly."""
import argparse
import json
from pathlib import Path
import subprocess
import sys
import tarfile
import xml.etree.ElementTree as ET

from common import atomic_json


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--request', type=Path)
    parser.add_argument('--result', type=Path)
    parser.add_argument('--check-sdk', type=Path)
    parser.add_argument('--abi', choices=['x86_64', 'arm64-v8a'])
    parser.add_argument('--min-api', type=int, default=31)
    parser.add_argument('--ndk', default='')
    args = parser.parse_args()
    result = {'protocol_version': 1, 'ok': False, 'diagnostics': []}
    status = 1
    try:
        if args.check_sdk:
            from assemble import toolchain
            from sdk import SDK
            sdk = SDK(args.check_sdk, args.abi, args.min_api).validate()
            toolchain({'ndk': args.ndk})
            result.update(ok=True, sdk_sha256=sdk.sha256, runtime=sdk.metadata['runtime'])
            print(json.dumps(result))
            return 0
        if not args.request or not args.result:
            raise ValueError('Build requests require --request and --result')
        request = json.loads(args.request.read_text())
        if request.get('protocol_version') != 1:
            raise ValueError('Unsupported Android backend request')
        if request.get('operation') == 'resolve-sdk':
            from packages import resolve
            result.update(resolve(request), ok=True)
        elif request.get('operation') in ('build', 'prepare'):
            from assemble import build
            result.update(build(request), ok=True)
        elif request.get('operation') == 'bundle':
            from bundle import build
            result.update(build(request), ok=True)
        else:
            raise ValueError('Unsupported Android backend operation')
        status = 0
    except (OSError, ValueError, KeyError, RuntimeError, tarfile.TarError, ET.ParseError, subprocess.SubprocessError) as error:
        result['diagnostics'].append({'severity': 'error', 'code': 'android_backend',
                                      'message': str(error), 'path': ['platforms', 'android']})
        print('sqgipkg android: ' + str(error), file=sys.stderr)
    if args.result:
        atomic_json(args.result, result)
    else:
        print(json.dumps(result))
    return status


if __name__ == '__main__':
    sys.exit(main())
