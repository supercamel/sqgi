#!/usr/bin/env python3
"""Run SQGI demo benchmarks with JIT off/on repeatedly and report medians."""

import argparse
import os
import statistics
import subprocess
import sys
from pathlib import Path


def positive_int(value):
    try:
        parsed = int(value)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"{value!r} is not an integer") from exc
    if parsed <= 0:
        raise argparse.ArgumentTypeError("value must be positive")
    return parsed


def parse_demo_output(output):
    rows = {}
    for line in output.splitlines():
        parts = line.split("\t")
        if len(parts) != 5 or parts[0] != "sqgi":
            continue
        rows[parts[1]] = float(parts[3])
    return rows


def main():
    parser = argparse.ArgumentParser(
        description="Run demo/benchmarks/sqgi_bench.nut repeatedly and report medians."
    )
    parser.add_argument("--runs", type=positive_int, default=7)
    parser.add_argument("--scale", type=positive_int, default=3)
    parser.add_argument("--sqgi", help="sqgi binary to use")
    parser.add_argument(
        "--threshold",
        type=positive_int,
        default=1,
        help="JIT hotness threshold, forwarded through SQGI_JIT_THRESHOLD",
    )
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[1]
    sqgi = Path(args.sqgi) if args.sqgi else root / "build-jit-release" / "sqgi"
    bench = root / "demo" / "benchmarks" / "sqgi_bench.nut"
    if not sqgi.exists():
        print(f"error: missing sqgi binary: {sqgi}", file=sys.stderr)
        return 1
    if not bench.exists():
        print(f"error: missing benchmark script: {bench}", file=sys.stderr)
        return 1

    samples = {}
    for run_index in range(args.runs):
        for jit_enabled in (False, True):
            env = os.environ.copy()
            env["SQGI_JIT"] = "1" if jit_enabled else "0"
            env["SQGI_JIT_THRESHOLD"] = str(args.threshold)
            env["SQGI_JIT_TRACE"] = "0"
            output = subprocess.check_output(
                [str(sqgi), str(bench), f"--scale={args.scale}"],
                cwd=str(root),
                env=env,
                text=True,
            )
            rows = parse_demo_output(output)
            if not rows:
                mode = "on" if jit_enabled else "off"
                print(f"error: benchmark output had no sqgi rows for JIT {mode}", file=sys.stderr)
                return 1
            key = "on_ms" if jit_enabled else "off_ms"
            for name, milliseconds in rows.items():
                samples.setdefault(name, {"off_ms": [], "on_ms": []})[key].append(milliseconds)
        print(f"completed run {run_index + 1}/{args.runs}", file=sys.stderr)

    print(
        f"demo sqgi_bench medians, runs={args.runs}, "
        f"scale={args.scale}, threshold={args.threshold}"
    )
    for name in sorted(samples):
        off_ms = statistics.median(samples[name]["off_ms"])
        on_ms = statistics.median(samples[name]["on_ms"])
        speedup = off_ms / on_ms if on_ms else float("inf")
        print(
            f"SUMMARY_MEDIAN\t{name}\toff_ms={off_ms:.3f}\t"
            f"on_ms={on_ms:.3f}\tspeedup={speedup:.3f}x"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
