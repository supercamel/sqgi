#!/usr/bin/env python3
"""Reclassify historical Wine passes with fatal QEMU diagnostics, without edits."""
import argparse
import json
from pathlib import Path
from runner_support import crash_diagnostics

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--logs', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
if args.output.exists():
    parser.error('Choose a new audit path; evidence is immutable')
rows = []
for record in sorted(args.logs.glob('*.json')):
    try:
        data = json.loads(record.read_text())
    except (ValueError, UnicodeError):
        continue
    if not isinstance(data, dict) or 'Wine' not in data.get('scope', ''):
        continue
    log = record.with_suffix('.txt')
    if not log.exists():
        continue
    crashes = crash_diagnostics(log.read_text(errors='replace'))
    if crashes and (data.get('acceptance') == 'pass' or data.get('exit_status') == 0):
        rows.append(dict(record=str(record.relative_to(args.logs.parent)),
                         raw_exit_status=data.get('exit_status'),
                         original_acceptance=data.get('acceptance'),
                         corrected_acceptance='fail', crash_diagnostics=crashes))
args.output.write_text(json.dumps(dict(reason='FS-28: zero-exit wrappers can conceal fatal QEMU diagnostics; original evidence unchanged', affected=rows), indent=2)+'\n')
print(f'{len(rows)} affected records; {args.output}')
