#!/usr/bin/env python3
"""Run SQGI JIT benchmark comparisons repeatedly and report medians."""

import argparse
import os
import statistics
import subprocess
import sys
from pathlib import Path


def parse_summary(output):
    rows = {}
    for line in output.splitlines():
        if not line.startswith("SUMMARY\t"):
            continue
        parts = line.split("\t")
        name = parts[1]
        values = {}
        for field in parts[2:]:
            key, raw_value = field.split("=", 1)
            values[key] = float(raw_value[:-1] if raw_value.endswith("x") else raw_value)
        rows[name] = values
    return rows


def positive_int(value):
    try:
        parsed = int(value)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"{value!r} is not an integer") from exc
    if parsed <= 0:
        raise argparse.ArgumentTypeError("value must be positive")
    return parsed


def main():
    parser = argparse.ArgumentParser(
        description="Run tools/run_jit_benchmarks.sh repeatedly and report medians."
    )
    parser.add_argument(
        "iterations",
        nargs="?",
        type=positive_int,
        default=8000,
        help="benchmark iterations passed to run_jit_benchmarks.sh",
    )
    parser.add_argument(
        "--runs",
        type=positive_int,
        default=7,
        help="number of comparison runs to collect",
    )
    parser.add_argument(
        "--sqgi",
        help="sqgi binary to use, forwarded through SQGI_BIN",
    )
    parser.add_argument(
        "--threshold",
        type=positive_int,
        default=1,
        help="JIT hotness threshold, forwarded through SQGI_JIT_THRESHOLD",
    )
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[1]
    bench = root / "tools" / "run_jit_benchmarks.sh"
    if not bench.exists():
        print(f"error: missing benchmark script: {bench}", file=sys.stderr)
        return 1

    env = os.environ.copy()
    env["SQGI_JIT_THRESHOLD"] = str(args.threshold)
    if args.sqgi:
        env["SQGI_BIN"] = args.sqgi

    samples = {}
    for run_index in range(args.runs):
        output = subprocess.check_output(
            [str(bench), str(args.iterations)],
            cwd=str(root),
            env=env,
            text=True,
        )
        summary = parse_summary(output)
        if not summary:
            print("error: benchmark output had no SUMMARY rows", file=sys.stderr)
            return 1
        for name, values in summary.items():
            row = samples.setdefault(name, {"off_us": [], "on_us": []})
            row["off_us"].append(values["off_us"])
            row["on_us"].append(values["on_us"])
        print(f"completed run {run_index + 1}/{args.runs}", file=sys.stderr)

    print(
        f"jit_perf_correctness medians, runs={args.runs}, "
        f"iterations={args.iterations}, threshold={args.threshold}"
    )
    for name in sorted(samples):
        off_us = statistics.median(samples[name]["off_us"])
        on_us = statistics.median(samples[name]["on_us"])
        speedup = off_us / on_us if on_us else float("inf")
        print(
            f"SUMMARY_MEDIAN\t{name}\toff_us={off_us:.6f}\t"
            f"on_us={on_us:.6f}\tspeedup={speedup:.3f}x"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
