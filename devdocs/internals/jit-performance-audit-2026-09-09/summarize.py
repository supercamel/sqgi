#!/usr/bin/env python3
from pathlib import Path
import hashlib, json, math, statistics, re

ROOT=Path(__file__).resolve().parent
FILES=['kernels-seed17','applications-seed17','roots-seed17','members','owners','methods','floats']

def pct90(values):
    return sorted(values)[math.ceil(.9*len(values))-1]

def summarize():
    allrows=[]
    groups={}
    for name in FILES:
        d=json.loads((ROOT/'results'/f'{name}.json').read_text())
        assert d['completed_rounds']==5
        rows=[]
        for kernel,m in d['medians'].items():
            samples=d['samples'][kernel]
            row=dict(suite=name,kernel=kernel,ns={k:v*1000 for k,v in m.items()},
                     ratios={k:m['sqgi']/m[k] for k in ['node','gjs','sqgi_baseline']},
                     relative_range={k:(max(v)-min(v))/statistics.median(v) for k,v in samples.items()})
            rows.append(row)
        groups[name]=dict(count=len(rows),geomean={k:statistics.geometric_mean(r['ratios'][k] for r in rows) for k in ['node','gjs','sqgi_baseline']})
        allrows+=rows
    assert len(allrows)==56
    totals={}
    for runtime in ['node','gjs','sqgi_baseline']:
        ratios=[r['ratios'][runtime] for r in allrows]
        totals[runtime]=dict(geomean=statistics.geometric_mean(ratios),p90=pct90(ratios),
                             maximum=max(ratios),within_2x=sum(v<=2 for v in ratios),within_5x=sum(v<=5 for v in ratios))
    summary=dict(count=56,aggregation='each of 56 components equally weighted; applications seed17 only; p90 nearest-rank',
                 groups=groups,totals=totals,rows=allrows,
                 baseline_sha256=hashlib.sha256((ROOT/'baseline/sqgi').read_bytes()).hexdigest())
    (ROOT/'results/summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    lines=['| Suite | Cases | SQGI / Node | SQGI / GJS | SQGI / committed |',
           '| --- | ---: | ---: | ---: | ---: |']
    for k,v in groups.items():
        g=v['geomean']; lines.append(f"| {k} | {v['count']} | {g['node']:.2f}× | {g['gjs']:.2f}× | {g['sqgi_baseline']:.2f}× |")
    lines+=['','| Aggregate | SQGI / Node | SQGI / GJS |','| --- | ---: | ---: |']
    for k in ['geomean','p90','maximum']:
        lines.append(f"| {k} | {totals['node'][k]:.2f}× | {totals['gjs'][k]:.2f}× |")
    lines+=['','| Workload | SQGI ns | Node ns | GJS ns | / Node | / GJS | SQGI range / median |',
            '| --- | ---: | ---: | ---: | ---: | ---: | ---: |']
    for r in allrows:
        n=r['ns']; q=r['ratios']; spread=r['relative_range']['sqgi']*100
        lines.append(f"| {r['suite']}/{r['kernel']} | {n['sqgi']:.2f} | {n['node']:.2f} | {n['gjs']:.2f} | {q['node']:.2f}× | {q['gjs']:.2f}× | {spread:.1f}% |")
    (ROOT/'tables.md').write_text('\n'.join(lines)+'\n')
    print(json.dumps(dict(groups=groups,totals=totals),indent=2))

def profiles():
    summaries={}
    for file in sorted((ROOT/'profiles').glob('*-flat.log')):
        rows=[]
        for line in file.read_text().splitlines():
            m=re.match(r'\s*([0-9.]+)%.*?\[\.\]\s+(.*)',line)
            if m: rows.append(dict(percent=float(m[1]),symbol=m[2].strip()))
        summaries[file.stem]=rows
    (ROOT/'results/profile-summary.json').write_text(json.dumps(summaries,indent=2)+'\n')
    for name,rows in summaries.items():
        print(name)
        for row in rows[:10]: print(f"  {row['percent']:6.2f}% {row['symbol']}")

if __name__=='__main__':
    import sys
    profiles() if len(sys.argv)>1 and sys.argv[1]=='profiles' else summarize()
