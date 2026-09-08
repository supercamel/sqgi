#!/usr/bin/env python3
"""Measure repeated-target and distinct-target rollback logging separately."""

import argparse
import os
from pathlib import Path
import statistics
import subprocess

from run_jit_median_benchmarks import positive_int


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sqgi", required=True, help="SQGI executable")
    parser.add_argument("--runs", type=positive_int, default=5)
    parser.add_argument("--repetitions", type=positive_int, default=10,
                        help="invocations per timed batch (maximum 1000)")
    args = parser.parse_args()
    if args.repetitions > 1000:
        parser.error("--repetitions must not exceed 1000")
    script = Path(__file__).resolve().parents[1] / "test" / "bench_jit_write_log.nut"
    env = os.environ.copy()
    env.update(SQGI_JIT="1", SQGI_JIT_THRESHOLD="1", SQGI_JIT_TRACE="0", SQGI_JIT_TRACE_STATS="0")
    samples = {}
    expected = {(shape, size) for shape in ("repeated", "distinct") for size in (1000, 8000, 16000)}
    for _ in range(args.runs):
        output = subprocess.check_output([args.sqgi, str(script), str(args.repetitions)], env=env, text=True)
        seen = set()
        for line in output.splitlines():
            if not line.startswith("WRITE\t"):
                continue
            _, shape, size, elapsed = line.split("\t")
            key = (shape, int(size))
            if key in seen or key not in expected:
                raise RuntimeError(f"unexpected benchmark row: {line}")
            seen.add(key)
            samples.setdefault(key, []).append(float(elapsed))
        if seen != expected:
            raise RuntimeError("missing write-log benchmark rows")
    print(f"write-log scaling, runs={args.runs}, repetitions={args.repetitions}, threshold=1; microseconds per invocation")
    for (shape, size), values in sorted(samples.items()):
        print(f"WRITE_MEDIAN\t{shape}\t{size}\t{statistics.median(values):.1f}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
