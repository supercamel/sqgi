#!/usr/bin/env python3
"""Same object-tree traversal and result allocation as RouteTastic spatial_index."""
import json
import sys
import time


def intersects(a, b):
    return not (a['maxx'] < b['minx'] or b['maxx'] < a['minx'] or
                a['maxy'] < b['miny'] or b['maxy'] < a['miny'])


def query(root, box):
    out, pending = [], [root]
    while pending:
        node = pending.pop()
        if not intersects(node['bbox'], box):
            continue
        if node['entries'] is not None:
            for entry in node['entries']:
                if intersects(entry['bbox'], box):
                    out.append(entry['obj'])
        else:
            pending.append(node['right'])
            pending.append(node['left'])
    return out


fixture = json.load(open(sys.argv[1]))
runs = []
for repeat in range(6):
    start = time.perf_counter()
    checksum = matches = 0
    for box in fixture['queries']:
        for item in query(fixture['tree'], box):
            checksum = (checksum * 31 + item) & 0x7fffffff
            matches += 1
    seconds = time.perf_counter() - start
    assert checksum == fixture['checksum'] and matches == fixture['matches']
    runs.append(dict(repeat=repeat, seconds=seconds, checksum=checksum, matches=matches))
print(json.dumps(dict(queries=len(fixture['queries']), runs=runs)))
