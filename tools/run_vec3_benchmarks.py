#!/usr/bin/env python3
"""Compare checksum-equivalent Vec3 representations with the JIT on and off."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
import math
import os
from pathlib import Path
import statistics
import subprocess


VARIANTS = (
    "arrays_operators", "arrays_methods", "fields_operators", "fields_methods",
    "reuse_methods", "arrays_reused", "scalars",
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sqgi", required=True, type=Path)
    parser.add_argument("--iterations", type=int, default=80000)
    parser.add_argument("--warmups", type=int, default=5)
    parser.add_argument("--runs", type=int, default=5)
    parser.add_argument("--cpu", type=int, default=0)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    if min(args.iterations, args.runs) <= 0 or args.warmups < 0:
        parser.error("iterations/runs must be positive; warmups must be nonnegative")
    root = Path(__file__).resolve().parents[1]
    benchmark = root / "test/bench_vec3.nut"
    binary = args.sqgi.resolve(strict=True)
    conditions = [(jit, variant) for variant in VARIANTS for jit in (0, 1)]
    samples, expected = [], None
    env = dict(os.environ, SQGI_JIT_THRESHOLD="1", SQGI_JIT_TRACE="0")
    env.pop("LD_PRELOAD", None)
    for run in range(args.runs):
        # Rotate process order so one mode does not always run first.
        offset = (run * 3) % len(conditions)
        for jit, variant in conditions[offset:] + conditions[:offset]:
            command = ["taskset", "-c", str(args.cpu), str(binary), str(benchmark),
                       f"--only={variant}", f"--iterations={args.iterations}",
                       f"--warmups={args.warmups}"]
            result = subprocess.run(command, cwd=root, env=dict(env, SQGI_JIT=str(jit)),
                                    capture_output=True, text=True, check=True)
            lines = [line.split("\t") for line in result.stdout.splitlines()
                     if line.startswith("BENCH\t")]
            if len(lines) != 1 or len(lines[0]) != 5:
                raise RuntimeError(f"invalid benchmark output: {result.stdout!r}")
            _, name, iterations, elapsed, checksum = lines[0]
            ns, value = float(elapsed) * 1000, float(checksum)
            if (name != variant or int(iterations) != args.iterations or
                    not math.isfinite(ns) or ns <= 0 or not math.isfinite(value)):
                raise RuntimeError(f"invalid benchmark sample: {lines[0]!r}")
            if expected is None:
                expected = value
            if not math.isclose(value, expected, rel_tol=0, abs_tol=1e-10):
                raise RuntimeError(f"checksum mismatch for {variant}, JIT={jit}: {value} != {expected}")
            samples.append(dict(run=run + 1, jit=jit, variant=variant, ns_per_iteration=ns,
                                checksum=value, command=command, stdout=result.stdout,
                                stderr=result.stderr))
        print(f"Completed round {run + 1}/{args.runs}", flush=True)
    medians = {variant: {str(jit): statistics.median(
        sample["ns_per_iteration"] for sample in samples
        if sample["jit"] == jit and sample["variant"] == variant
    ) for jit in (0, 1)} for variant in VARIANTS}
    report = dict(timestamp=datetime.now(timezone.utc).isoformat(), binary=str(binary),
                  binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                  benchmark_sha256=hashlib.sha256(benchmark.read_bytes()).hexdigest(),
                  iterations=args.iterations, warmups=args.warmups, runs=args.runs,
                  cpu=args.cpu, threshold=1, medians_ns=medians, samples=samples)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n")
    print("variant\tinterpreter_ns\tjit_ns\tjit_speedup")
    for name, modes in medians.items():
        print(f"{name}\t{modes['0']:.3f}\t{modes['1']:.3f}\t{modes['0']/modes['1']:.2f}x")


if __name__ == "__main__":
    main()
