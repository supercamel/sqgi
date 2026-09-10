#!/usr/bin/env python3
"""Summarize unchanged, equally weighted 56-component performance studies."""
import argparse
import json
import math
from pathlib import Path
import statistics

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('study', type=Path)
args = parser.parse_args()
suites = ['kernels-seed17', 'applications-seed17', 'roots-seed17',
          'members', 'owners', 'methods', 'floats']
groups = {}
rows = []
for suite in suites:
    data = json.loads((args.study / 'results' / f'{suite}.json').read_text())
    assert data['completed_rounds'] == 5
    current = []
    for name, medians in data['medians'].items():
        sample = data['samples'][name]
        assert all(len(values) == 5 for values in sample.values())
        row = {'suite': suite, 'name': name, 'ns': {k: v * 1000 for k, v in medians.items()},
               'speedup': medians['sqgi_baseline'] / medians['sqgi'],
               'ranges_ns': {k: [min(v) * 1000, max(v) * 1000] for k, v in sample.items()}}
        current.append(row)
    groups[suite] = {'count': len(current),
                     'speedup': statistics.geometric_mean(r['speedup'] for r in current)}
    rows.extend(current)
assert len(rows) == 56
totals = {}
for engine in ['sqgi_baseline', 'sqgi']:
    totals[engine] = {}
    for reference in ['node', 'gjs']:
        ratios = sorted(r['ns'][engine] / r['ns'][reference] for r in rows)
        totals[engine][reference] = {'geomean': statistics.geometric_mean(ratios),
                                    'p90': ratios[math.ceil(len(ratios) * 0.9) - 1]}
summary = {'aggregation': '56 equally weighted components; application seed17; nearest-rank p90',
           'speedup': statistics.geometric_mean(r['speedup'] for r in rows),
           'groups': groups, 'totals': totals, 'rows': rows,
           'regressions_over_5pct': [r for r in rows if 1 / r['speedup'] > 1.05]}
(args.study / 'results' / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps({k: v for k, v in summary.items() if k != 'rows'}, indent=2))
