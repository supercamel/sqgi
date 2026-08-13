#!/usr/bin/env python3
"""Enforce checker-owned GCC coverage without third-party Python packages."""

import argparse
import gzip
import json
from pathlib import Path
import sys


OWNED = {
    "tools/sqgicheck/analyzer.cpp",
    "tools/sqgicheck/metadata.cpp",
    "tools/sqgicheck/project.cpp",
    "tools/sqgicheck/main.cpp",
}


def percentage(covered: int, total: int) -> float:
    return 100.0 if total == 0 else covered * 100.0 / total


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-root", required=True, type=Path)
    parser.add_argument("--report-dir", required=True, type=Path)
    parser.add_argument("--min-lines", required=True, type=float)
    parser.add_argument("--min-functions", required=True, type=float)
    parser.add_argument("--min-branches", required=True, type=float)
    parser.add_argument("--exclusions", required=True, type=Path)
    args = parser.parse_args()

    source_root = args.source_root.resolve()
    metrics = {
        name: {"lines": set(), "hit_lines": set(), "functions": set(),
               "hit_functions": set(), "branches": 0, "hit_branches": 0,
               "line_branches": {}}
        for name in OWNED
    }

    reports = sorted(args.report_dir.glob("*.gcov.json.gz"))
    if not reports:
        print("sqgicheck coverage: no gcov JSON reports found", file=sys.stderr)
        return 2

    for report in reports:
        with gzip.open(report, "rt", encoding="utf-8") as stream:
            data = json.load(stream)
        for record in data.get("files", []):
            path = Path(record["file"]).resolve()
            try:
                relative = path.relative_to(source_root).as_posix()
            except ValueError:
                continue
            if relative not in metrics:
                continue
            item = metrics[relative]
            for function in record.get("functions", []):
                identity = (function["demangled_name"], function["start_line"])
                item["functions"].add(identity)
                if function.get("execution_count", 0) > 0:
                    item["hit_functions"].add(identity)
            for line in record.get("lines", []):
                number = line["line_number"]
                item["lines"].add(number)
                if line.get("count", 0) > 0:
                    item["hit_lines"].add(number)
                branches = [branch for branch in line.get("branches", [])
                            if not branch.get("throw", False)]
                item["branches"] += len(branches)
                item["hit_branches"] += sum(
                    branch.get("count", 0) > 0 for branch in branches
                )
                item["line_branches"].setdefault(number, []).extend(branches)

    try:
        exclusion_data = json.loads(args.exclusions.read_text(encoding="utf-8"))
    except (OSError, ValueError) as error:
        print(f"sqgicheck coverage: invalid exclusions: {error}", file=sys.stderr)
        return 2
    if exclusion_data.get("version") != 1 or not exclusion_data.get("reviewed"):
        print("sqgicheck coverage: exclusions need version 1 and a review date",
              file=sys.stderr)
        return 2

    excluded_lines = {name: set() for name in OWNED}
    excluded_branches = {name: 0 for name in OWNED}
    excluded_branch_lines = {name: set() for name in OWNED}
    seen = set()
    for kind in ("lines", "branches"):
        for exclusion in exclusion_data.get(kind, []):
            required = {"file", "line", "source", "reason", "mitigation"}
            if kind == "branches":
                required.add("uncovered")
            if not required.issubset(exclusion):
                print(f"sqgicheck coverage: incomplete {kind} exclusion: {exclusion}",
                      file=sys.stderr)
                return 2
            if not str(exclusion["reason"]).strip() or not str(exclusion["mitigation"]).strip():
                print(f"sqgicheck coverage: empty rationale in {kind} exclusion",
                      file=sys.stderr)
                return 2
            name = exclusion["file"]
            line = exclusion["line"]
            identity = (kind, name, line)
            if name not in OWNED or identity in seen or line <= 0:
                print(f"sqgicheck coverage: invalid or duplicate exclusion: {identity}",
                      file=sys.stderr)
                return 2
            seen.add(identity)
            source_path = source_root / name
            try:
                actual_source = source_path.read_text(encoding="utf-8").splitlines()[line - 1].strip()
            except (OSError, IndexError) as error:
                print(f"sqgicheck coverage: stale exclusion {identity}: {error}",
                      file=sys.stderr)
                return 2
            if actual_source != exclusion["source"]:
                print(f"sqgicheck coverage: stale exclusion {identity}; "
                      f"expected {exclusion['source']!r}, found {actual_source!r}",
                      file=sys.stderr)
                return 2
            if kind == "lines":
                if line in metrics[name]["hit_lines"] or line not in metrics[name]["lines"]:
                    print(f"sqgicheck coverage: stale line exclusion {identity}",
                          file=sys.stderr)
                    return 2
                excluded_lines[name].add(line)
            else:
                branches = metrics[name]["line_branches"].get(line, [])
                missing = sum(branch.get("count", 0) == 0 for branch in branches)
                count = exclusion["uncovered"]
                if not isinstance(count, int) or count <= 0 or missing != count:
                    print(f"sqgicheck coverage: stale branch exclusion {identity}; "
                          f"declares {count}, gcov reports {missing}", file=sys.stderr)
                    return 2
                excluded_branches[name] += count
                excluded_branch_lines[name].add(line)

    for name in OWNED:
        for line, branches in metrics[name]["line_branches"].items():
            missing = sum(branch.get("count", 0) == 0 for branch in branches)
            if missing and line not in excluded_branch_lines[name]:
                print(f"sqgicheck coverage: unjustified uncovered branch at "
                      f"{name}:{line} ({missing} outcome(s))", file=sys.stderr)
                return 1

    totals = {key: 0 for key in (
        "lines", "hit_lines", "functions", "hit_functions",
        "branches", "hit_branches"
    )}
    for name in sorted(OWNED):
        item = metrics[name]
        counts = {
            "lines": len(item["lines"]) - len(excluded_lines[name]),
            "hit_lines": len(item["hit_lines"]),
            "functions": len(item["functions"]),
            "hit_functions": len(item["hit_functions"]),
            "branches": item["branches"] - excluded_branches[name],
            "hit_branches": item["hit_branches"],
        }
        for key, value in counts.items():
            totals[key] += value
        print(
            f"{name}: "
            f"lines {counts['hit_lines']}/{counts['lines']} "
            f"({percentage(counts['hit_lines'], counts['lines']):.2f}%), "
            f"functions {counts['hit_functions']}/{counts['functions']} "
            f"({percentage(counts['hit_functions'], counts['functions']):.2f}%), "
            f"branches {counts['hit_branches']}/{counts['branches']} "
            f"({percentage(counts['hit_branches'], counts['branches']):.2f}%), "
            f"excluded {len(excluded_lines[name])} line(s)/"
            f"{excluded_branches[name]} branch outcome(s)"
        )

    actual = {
        "lines": percentage(totals["hit_lines"], totals["lines"]),
        "functions": percentage(totals["hit_functions"], totals["functions"]),
        "branches": percentage(totals["hit_branches"], totals["branches"]),
    }
    print(
        "TOTAL: "
        f"lines {actual['lines']:.2f}%, "
        f"functions {actual['functions']:.2f}%, "
        f"branches {actual['branches']:.2f}%"
    )

    thresholds = {
        "lines": args.min_lines,
        "functions": args.min_functions,
        "branches": args.min_branches,
    }
    failed = [name for name in actual if actual[name] + 1e-9 < thresholds[name]]
    if failed:
        for name in failed:
            print(
                f"sqgicheck coverage: {name} {actual[name]:.2f}% is below "
                f"{thresholds[name]:.2f}%",
                file=sys.stderr,
            )
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
