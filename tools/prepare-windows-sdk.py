#!/usr/bin/env python3
"""Prepare the verified Ooblerg SDK for native Windows or Ubuntu cross builds."""
import argparse
import importlib.util
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, required=True,
                        help='Private SDK directory (must be empty or owned by Ooblerg)')
    parser.add_argument('--cache', type=Path, required=True)
    parser.add_argument('--repository', default='https://ooblerg.xyz/v1')
    parser.add_argument('--cross', action='store_true',
                        help='Use the host MinGW compiler; omit Windows-native build tools')
    parser.add_argument('--offline', action='store_true')
    parser.add_argument('--refresh', action='store_true')
    args = parser.parse_args()
    module = Path(__file__).parent / 'sqgipkg_lib/windows/ooblerg.py'
    spec = importlib.util.spec_from_file_location('ooblerg', module)
    provider = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(provider)
    provider.prepare({
        'root': str(args.root), 'cache': str(args.cache),
        'repository': args.repository, 'download': not args.offline,
        'refresh': args.refresh,
        'packages': ['glib', 'glib-introspection', 'libgirepository-1.0',
                     'libffi', 'cairo', 'gtk4', 'llvm18'],
        'build_packages': ['gobject-introspection'] + ([] if args.cross else ['native-sdk']),
    })
    print('Ooblerg SDK: ' + str(args.root.resolve() / 'mingw64'))


if __name__ == '__main__':
    main()
