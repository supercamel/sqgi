#!/usr/bin/env python3
"""Run one or more separately built backends; only Python's stdlib is needed."""
import argparse
import json
import math
import os
from pathlib import Path
import platform
import subprocess
import sys
import tempfile


def validate(result, quick):
    expected = 25 if quick else 85
    if result.get("schema") != 1 or len(result.get("cases", [])) != expected:
        raise ValueError("unexpected benchmark schema/case count")
    keys = set()
    for case in result["cases"]:
        key = (case["workload"], case["size"], case["pattern"])
        if key in keys:
            raise ValueError(f"duplicate case {key}")
        keys.add(key)
        for field in ("kernel_ns", "cpp_ns", "cpp_over_kernel", "module_compile_ms"):
            if not math.isfinite(case[field]) or case[field] <= 0:
                raise ValueError(f"invalid {field}: {key}")
        if case["repetitions"] < 1 or not case["checksum"].isdigit():
            raise ValueError(f"invalid repetitions/checksum: {key}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("binaries", nargs="+", type=Path, help="sqgi_kernel_benchmark_suite binaries")
    parser.add_argument("--quick", action="store_true", help="short correctness/sampling smoke run")
    parser.add_argument("--sqgi", type=Path, help="also run the Squirrel boundary benchmark")
    parser.add_argument("--node", nargs="?", const="node", help="compare workloads with Node.js (optional executable)")
    parser.add_argument("--output", type=Path, help="write combined JSON (otherwise stdout)")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[3]
    report = {"platform": platform.platform(), "machine": platform.machine(),
              "processor": platform.processor(), "cpu_count": os.cpu_count(), "runs": []}
    if hasattr(os, "sched_getaffinity"):
        report["cpu_affinity"] = sorted(os.sched_getaffinity(0))
    for binary in args.binaries:
        binary = binary.resolve()
        command = [str(binary), "--root", str(root)] + (["--quick"] if args.quick else [])
        completed = subprocess.run(command, cwd=root, check=True, text=True, capture_output=True)
        result = json.loads(completed.stdout)
        validate(result, args.quick)
        result["binary"] = str(binary)
        cache = binary.parent / "CMakeCache.txt"
        if cache.exists():
            prefixes = ("CMAKE_BUILD_TYPE:", "CMAKE_CXX_COMPILER:", "CMAKE_CXX_FLAGS", "SQGI_KERNEL_BACKEND:", "SQGI_LLVM_LIBRARY:")
            result["cmake"] = [line for line in cache.read_text().splitlines() if line.startswith(prefixes)]
        report["runs"].append(result)
    # The same seed/input must produce the same answers on different backends.
    checksums = None
    for result in report["runs"]:
        current = {(c["workload"], c["size"], c["pattern"]): c["checksum"] for c in result["cases"]}
        if checksums is not None and current != checksums:
            raise ValueError("backend checksums differ")
        checksums = current
    if args.node:
        report["node"] = []
        for storage in ("float64", "int32"):
            command = [args.node, str(root / "demo/benchmarks/kernels/node_astar.js"), storage]
            result = json.loads(subprocess.run(command, cwd=root, check=True, text=True, capture_output=True).stdout)
            for case in result["cases"]:
                key = ("astar", 256, case["pattern"])
                if case["checksum"] != checksums[key]:
                    raise ValueError(f"Node/kernel checksum mismatch: {key}")
            report["node"].append(result)
        # Export shared inputs and native expected output, rather than keeping
        # two independent pseudo-random fixture generators in sync.
        command = [str(args.binaries[0].resolve()), "--root", str(root), "--fixtures"] + (["--quick"] if args.quick else [])
        fixtures = json.loads(subprocess.run(command, cwd=root, check=True, text=True, capture_output=True).stdout)
        repetitions = {(c["workload"], c["size"], c["pattern"]): c["repetitions"] for c in report["runs"][0]["cases"]}
        for case in fixtures["cases"]:
            case["timing_repetitions"] = repetitions[(case["workload"], case["size"], case["pattern"])]
        with tempfile.TemporaryDirectory(prefix="sqgi-node-workloads-") as directory:
            path = Path(directory) / "fixtures.json"
            path.write_text(json.dumps(fixtures))
            command = [args.node, str(root / "demo/benchmarks/kernels/node_workloads.js"), str(path)]
            report["node_workloads"] = json.loads(subprocess.run(command, cwd=root, check=True, text=True, capture_output=True).stdout)
            command = [args.node, str(root / "demo/benchmarks/kernels/node_workloads.js"), str(path), "int32"]
            report["node_integer_workloads"] = json.loads(subprocess.run(command, cwd=root, check=True, text=True, capture_output=True).stdout)
            if args.sqgi:
                command = [str(args.sqgi.resolve()), "demo/benchmarks/kernels/boundary.nut", str(path)]
                report["boundary_workloads"] = json.loads(subprocess.run(command, cwd=root, check=True, text=True, capture_output=True).stdout)
        expected_cases = set(repetitions) - {key for key in repetitions if key[0] == "astar"}
        actual_cases = {(c["workload"], c["size"], c["pattern"]) for c in report["node_workloads"]["cases"]}
        if actual_cases != expected_cases:
            raise ValueError("Node workload cases differ from native suite")
    if args.sqgi:
        command = [str(args.sqgi.resolve()), "demo/benchmarks/kernels/suite.nut"]
        report["squirrel"] = subprocess.run(command, cwd=root, check=True, text=True, capture_output=True).stdout
    text = json.dumps(report, indent=2) + "\n"
    if args.output:
        args.output.write_text(text)
        print(f"Wrote {args.output}", file=sys.stderr)
    else:
        print(text, end="")


if __name__ == "__main__":
    main()
