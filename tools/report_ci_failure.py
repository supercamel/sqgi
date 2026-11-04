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
            messages = []
            for case in root.iter('testcase'):
                failures = [node for node in case if node.tag in ('failure', 'error')]
                if not failures:
                    continue
                details = [node.get('message') or node.get('type') or node.tag for node in failures]
                output = '\n'.join(node.text or '' for node in case
                                   if node.tag in ('failure', 'error', 'system-out', 'system-err'))
                messages.append(case.attrib.get('name', 'test') + ': ' + ', '.join(details) + '\n' + output)
            content = '\n\n'.join(message[:1000] for message in messages[:3])
        else:
            content = '\n'.join(path.read_text(encoding='utf-8', errors='replace').splitlines()[-150:])
        if content:
            # GitHub truncates long annotations; retain the end of build logs.
            content = content[-3500:].replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')
            print(f'::error title={path.name}::{content}')


if __name__ == '__main__':
    main()
