#!/usr/bin/env python3
"""Summarize measured pairs; negative time changes mean faster execution."""
import json
from pathlib import Path
import statistics

HERE = Path(__file__).resolve().parent
results = json.loads((HERE / "results.json").read_text())
assert results["status"] == "complete", results["status"]
rows = [row for row in results["runs"] if not row["warmup"]]
metrics = [
    ("Headless wall (s)", "headless", lambda r: r["wall_seconds"]),
    ("Headless CPU (s)", "headless", lambda r: r["cpu_seconds"]),
    ("GTK draws/s", "gui", lambda r: r["gtk_draws_per_second"]),
    ("Paint interval mean (ms)", "gui", lambda r: r["metrics"]["paint_interval"]["mean_ms"]),
    ("Paint interval p95 (ms)", "gui", lambda r: r["metrics"]["paint_interval"]["p95_ms"]),
    ("Simulation step mean (ms)", "gui", lambda r: r["metrics"]["simulation"]["mean_ms"]),
    ("Simulation step p95 (ms)", "gui", lambda r: r["metrics"]["simulation"]["p95_ms"]),
    ("World submission mean (ms)", "gui", lambda r: r["metrics"]["world"]["mean_ms"]),
    ("HUD mean (ms)", "gui", lambda r: r["metrics"]["hud"]["mean_ms"]),
]
summary = {}
print("| Metric | Before median | After median | Change | Paired changes |")
print("| --- | ---: | ---: | ---: | --- |")
for name, mode, getter in metrics:
    samples = {v: {r["pair"]: getter(r) for r in rows if r["mode"] == mode and r["variant"] == v}
               for v in ["before", "after"]}
    before, after = (statistics.median(samples[v].values()) for v in ["before", "after"])
    pairs = {p: 100 * (samples["after"][p] / samples["before"][p] - 1) for p in samples["before"]}
    change = 100 * (after / before - 1)
    summary[name] = {"before_median": before, "after_median": after, "median_change_percent": change,
                     "paired_change_percent": pairs, "samples": samples}
    print(f"| {name} | {before:.3f} | {after:.3f} | {change:+.2f}% | "
          + ", ".join(f"{pairs[p]:+.2f}%" for p in sorted(pairs)) + " |")
(HERE / "analysis.json").write_text(json.dumps(summary, indent=2) + "\n")
