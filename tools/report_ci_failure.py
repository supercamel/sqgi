#!/usr/bin/env python3
"""Expose bounded build/test diagnostics in GitHub's failure annotations."""
from pathlib import Path
import sys
import xml.etree.ElementTree as ET


def main():
    for name in sys.argv[1:]:
        path = Path(name)
        if not path.is_file():
            continue
        if path.suffix == '.xml':
            root = ET.parse(path).getroot()
            messages = [case.attrib.get('name', 'test') + ':\n' +
                        '\n'.join(node.text or '' for node in case
                                  if node.tag in ('failure', 'error', 'system-out', 'system-err'))
                        for case in root.iter('testcase')
                        if case.find('failure') is not None or case.find('error') is not None]
            content = '\n\n'.join(message[:8000] for message in messages[:3])
        else:
            content = '\n'.join(path.read_text(encoding='utf-8', errors='replace').splitlines()[-150:])
        if content:
            content = content[-24000:].replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')
            print(f'::error title={path.name}::{content}')


if __name__ == '__main__':
    main()
