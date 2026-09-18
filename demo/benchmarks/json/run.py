#!/usr/bin/env python3
"""Identical JSON inputs, full result validation, rotating runtime order."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import statistics
import subprocess
import sys
import tempfile

BASE = Path(__file__).resolve().parent


def fixtures():
    nested = {"leaf": [None, True, False, -17, 0.125]}
    for i in range(32):
        nested = {"level": i, "child": nested, "name": "branch"}
    return {
        "small_message": {"id": 42, "method": "update", "active": True,
                          "position": [12.5, -3.25], "label": "sensor", "error": None},
        "integer_array": [(i * 17) % 10007 - 5000 for i in range(8192)],
        "long_strings": [f"record-{i}:" + "abcdefgh01234567" * 64 for i in range(128)],
        "whitespace": [{"id": i, "value": [True, None, i / 8]} for i in range(64)],
        "numeric_array": [((i * 17) % 10007 - 5000) / 8 for i in range(8192)],
        "records": [{"id": i, "name": f"item-{i}", "active": i % 3 == 0,
                     "position": [i / 8, -i / 4], "tags": ["route", "signal"],
                     "parent": None if i % 7 == 0 else i - 1} for i in range(512)],
        "wide_object": {f"property_{i:04d}": i * 3 for i in range(1024)},
        "nested": nested,
        "escaped_unicode": [f'row {i}: café Ελληνικά 漢字 😀 "quoted" \\path\n\t\r\b\f'
                            for i in range(256)],
    }


def same_json(actual, expected):
    if isinstance(expected, dict):
        return (isinstance(actual, dict) and actual.keys() == expected.keys()
                and all(same_json(actual[k], v) for k, v in expected.items()))
    if isinstance(expected, list):
        return (isinstance(actual, list) and len(actual) == len(expected)
                and all(same_json(x, y) for x, y in zip(actual, expected)))
    if type(expected) in (int, float):
        return type(actual) in (int, float) and actual == expected
    return type(actual) is type(expected) and actual == expected


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--sqgi", required=True)
    p.add_argument("--baseline-sqgi", help="optional preserved SQGI binary for before/after comparisons")
    p.add_argument("--node", default="node")
    p.add_argument("--gjs", default="gjs")
    p.add_argument("--python", default=sys.executable)
    p.add_argument("--runs", type=int, default=5)
    p.add_argument("--mib", type=float, default=16, help="input MiB per timed batch")
    p.add_argument("--cpu", type=int)
    p.add_argument("--output", type=Path, required=True)
    a = p.parse_args()
    if a.runs < 1 or a.mib <= 0:
        p.error("runs and mib must be positive")
    if a.cpu is not None:
        os.sched_setaffinity(0, {a.cpu})
    binaries = {k: shutil.which(v) for k, v in
                {"sqgi": a.sqgi, "node": a.node, "gjs": a.gjs, "python": a.python}.items()}
    if a.baseline_sqgi:
        binaries["sqgi-before"] = shutil.which(a.baseline_sqgi)
    if not all(binaries.values()):
        p.error(f"missing runtime: {binaries}")
    commands = {k: [v, str(BASE / {"sqgi": "bench.nut", "sqgi-before": "bench.nut", "node": "bench.js",
                                  "gjs": "bench.js", "python": "bench.py"}[k])]
                for k, v in binaries.items()}
    runtimes = {}
    for k, v in binaries.items():
        version = subprocess.run([v, "--version"], capture_output=True, text=True)
        runtimes[k] = {"path": v, "sha256": digest(v),
                       "version": (version.stdout + version.stderr).strip()}
    report = {"schema": 1, "platform": platform.platform(),
              "cpu_affinity": sorted(os.sched_getaffinity(0)), "runtimes": runtimes,
              "source_hashes": {f.name: digest(f) for f in BASE.iterdir()
                                if f.suffix in (".py", ".js", ".nut")},
              "runs": a.runs, "mib": a.mib, "cases": []}
    with tempfile.TemporaryDirectory(prefix="sqgi-json-") as tmp:
        for name, payload in fixtures().items():
            value = {"marker": 37, "payload": payload}
            text = json.dumps(value, ensure_ascii=True, separators=(",", ":"), allow_nan=False,
                              indent=16 if name == "whitespace" else None)
            path = Path(tmp) / (name + ".json")
            path.write_text(text, encoding="utf-8")
            # Squirrel's verbatim literal loads the identical bytes without
            # measuring file I/O or depending on GI's byte-array conversion.
            Path(str(path) + ".nut").write_text('return @"' + text.replace('"', '""') + '"\n')
            n = max(100, min(100000, int(a.mib * 1048576 / len(text))))
            for operation in ("parse", "stringify", "roundtrip"):
                case = {"name": name, "operation": operation, "input_bytes": len(text),
                        "input_sha256": digest(path), "iterations": n,
                        "samples_ns": {k: [] for k in commands}, "output_bytes": {}}
                for r in range(a.runs):
                    order = list(commands)
                    shift = r % len(order)
                    for runtime in order[shift:] + order[:shift]:
                        proc = subprocess.run(commands[runtime] + [str(path), operation, str(n)],
                                              capture_output=True, text=True, timeout=180)
                        if proc.returncode:
                            raise RuntimeError(f"{runtime}/{name}/{operation}: {proc.stderr}\n{proc.stdout}")
                        timing, output = proc.stdout.split("\n", 1)
                        ns, checksum = timing.split("\t")
                        output = output.rstrip("\n")
                        actual = json.loads(output)
                        if not same_json(actual, value):
                            raise AssertionError(f"incorrect result: {runtime}/{name}/{operation}")
                        units = (len(output.encode("utf-8")) if runtime.startswith("sqgi") else
                                 len(output.encode("utf-16-le")) // 2 if runtime in ("node", "gjs") else len(output))
                        expected = n * (units if operation == "stringify" else 37)
                        if int(checksum) != expected or float(ns) <= 0:
                            raise AssertionError(f"invalid timing/checksum: {runtime}/{name}/{operation}")
                        case["samples_ns"][runtime].append(float(ns))
                        case["output_bytes"][runtime] = len(output.encode("utf-8"))
                case["median_ns"] = {k: statistics.median(v) for k, v in case["samples_ns"].items()}
                case["sqgi_over_node"] = case["median_ns"]["sqgi"] / case["median_ns"]["node"]
                report["cases"].append(case)
                print(f"{name:18} {operation:9} " + " ".join(
                    f"{k}={v / 1000:.3f}us" for k, v in case["median_ns"].items()), flush=True)
    report["all_results_validated"] = True
    root = BASE.parents[2]
    report["runtime_source_hashes"] = {str(f.relative_to(root)): digest(f)
        for f in list((root / "src").glob("sqgi_json*")) + [root / "CMakeLists.txt"]}
    report["cpu_model"] = next((line.split(":", 1)[1].strip()
        for line in Path("/proc/cpuinfo").read_text().splitlines()
        if line.startswith("model name")), platform.machine())
    a.output.parent.mkdir(parents=True, exist_ok=True)
    a.output.write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
