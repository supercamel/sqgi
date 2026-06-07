#!/usr/bin/env python3
"""Run a Squirrel script with JIT stats enabled and summarize reject reasons."""

import argparse
import os
import re
import subprocess
import sys
from collections import Counter
from pathlib import Path


REJECT_REASON_RE = re.compile(
    r"^\[sqjit:stats\] reject reason count=(\d+) reason=(.*)$"
)
REJECT_CATEGORY_RE = re.compile(
    r"^\[sqjit:stats\] reject category count=(\d+) category=(.*)$"
)
REJECT_SITE_RE = re.compile(
    r"^\[sqjit:stats\] reject_site .* count=(\d+) reason=(.*)$"
)
REJECT_TOTAL_RE = re.compile(
    r"^\[sqjit:stats\] rejects=(\d+) unique_reasons=(\d+)$"
)
COUNTER_LINE_RE = re.compile(r"^\[sqjit:stats\] (proto |direct calls |loops )")


def positive_int(value):
    try:
        parsed = int(value)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(f"{value!r} is not an integer") from exc
    if parsed <= 0:
        raise argparse.ArgumentTypeError("value must be positive")
    return parsed


def reason_category(reason):
    lowered = reason.lower()
    if "invalid" in lowered or "operand" in lowered:
        return "invalid-bytecode"
    if "loop" in lowered:
        return "loop"
    if "append" in lowered or "push" in lowered:
        return "array-append"
    if "array" in lowered:
        return "array"
    if "member" in lowered or "field" in lowered:
        return "member"
    if "call" in lowered or "closure" in lowered or "native" in lowered:
        return "call"
    if "class" in lowered or "constructor" in lowered:
        return "constructor"
    if "guard" in lowered:
        return "guard"
    if "unsupported opcode" in lowered:
        return "opcode"
    return "other"


def parse_stats(output):
    reasons = Counter()
    sites = Counter()
    categories = Counter()
    totals = None
    counters = []

    for line in output.splitlines():
        match = REJECT_REASON_RE.match(line)
        if match:
            count = int(match.group(1))
            reason = match.group(2)
            reasons[reason] += count
            continue

        match = REJECT_CATEGORY_RE.match(line)
        if match:
            categories[match.group(2)] += int(match.group(1))
            continue

        match = REJECT_SITE_RE.match(line)
        if match:
            sites[match.group(2)] += int(match.group(1))
            continue

        match = REJECT_TOTAL_RE.match(line)
        if match:
            totals = (int(match.group(1)), int(match.group(2)))
            continue

        if COUNTER_LINE_RE.match(line):
            counters.append(line.removeprefix("[sqjit:stats] "))

    if not categories:
        for reason, count in reasons.items():
            categories[reason_category(reason)] += count

    return totals, counters, categories, reasons, sites


def main():
    parser = argparse.ArgumentParser(
        description="Run sqgi with SQGI_JIT_TRACE=stats and summarize JIT rejection reasons."
    )
    parser.add_argument("script", help="Squirrel script to run")
    parser.add_argument(
        "--sqgi",
        help="sqgi binary to use, defaulting to build-jit-release/sqgi",
    )
    parser.add_argument(
        "--threshold",
        type=positive_int,
        default=1,
        help="JIT hotness threshold, forwarded through SQGI_JIT_THRESHOLD",
    )
    parser.add_argument(
        "--limit",
        type=positive_int,
        default=12,
        help="maximum reason/site rows to print",
    )
    parser.add_argument(
        "--show-output",
        action="store_true",
        help="print the script's non-summary output after the parsed summary",
    )
    args, script_args = parser.parse_known_args()

    root = Path(__file__).resolve().parents[1]
    sqgi = Path(args.sqgi) if args.sqgi else root / "build-jit-release" / "sqgi"
    script = Path(args.script)
    if not sqgi.exists():
        print(f"error: missing sqgi binary: {sqgi}", file=sys.stderr)
        return 1
    if not script.exists():
        print(f"error: missing script: {script}", file=sys.stderr)
        return 1

    env = os.environ.copy()
    env["SQGI_JIT"] = "1"
    env["SQGI_JIT_THRESHOLD"] = str(args.threshold)
    env["SQGI_JIT_TRACE"] = "stats"

    proc = subprocess.run(
        [str(sqgi), str(script), *script_args],
        cwd=str(root),
        env=env,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    output = proc.stdout
    if proc.returncode != 0:
        print(output, end="")
        return proc.returncode

    totals, counters, categories, reasons, sites = parse_stats(output)
    print(f"jit reject summary: {script}")
    print(f"threshold={args.threshold}")
    if totals:
        print(f"rejects={totals[0]}\tunique_reasons={totals[1]}")
    for line in counters:
        print(f"COUNTERS\t{line}")

    if categories:
        print("Top categories")
        for category, count in categories.most_common(args.limit):
            print(f"CATEGORY\t{category}\tcount={count}")
    else:
        print("Top categories")
        print("CATEGORY\tnone\tcount=0")

    print("Top reasons")
    for reason, count in reasons.most_common(args.limit):
        print(f"REASON\tcount={count}\t{reason}")

    if sites:
        print("Top reject-site reasons")
        for reason, count in sites.most_common(args.limit):
            print(f"SITE_REASON\tcount={count}\t{reason}")

    if args.show_output:
        print("Script output")
        for line in output.splitlines():
            if not line.startswith("[sqjit:stats] "):
                print(line)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
