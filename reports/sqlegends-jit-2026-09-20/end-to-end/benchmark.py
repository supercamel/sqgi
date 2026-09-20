#!/usr/bin/env python3
"""Compare two frozen SQGI executables on the same frozen SqLegends workload."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import resource
import statistics
import subprocess
import time

HERE = Path(__file__).resolve().parent
PROFILE = re.compile(r"^PROFILE (\w+) n=(\d+) mean_ms=([\d.]+) p95_ms=([\d.]+) max_ms=([\d.]+)$", re.M)


def machine_state():
    paths = {
        "temperature_millic": "/sys/class/thermal/thermal_zone0/temp",
        "cpu6_khz": "/sys/devices/system/cpu/cpu6/cpufreq/scaling_cur_freq",
        "governor": "/sys/devices/system/cpu/cpu6/cpufreq/scaling_governor",
    }
    return {**{name: Path(path).read_text().strip() if Path(path).exists() else None
               for name, path in paths.items()}, "loadavg": os.getloadavg()}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pairs", type=int, default=5)
    parser.add_argument("--gui-seconds", type=int, default=20)
    parser.add_argument("--simulation-seconds", type=int, default=300)
    parser.add_argument("--core", type=int, default=6)
    args = parser.parse_args()
    snapshot = json.loads((HERE / "snapshot.json").read_text())
    workload = Path(snapshot["workload"])
    for name, digest in snapshot["files"].items():
        assert hashlib.sha256((workload / name).read_bytes()).hexdigest() == digest, name
    for binary in snapshot["binaries"].values():
        assert hashlib.sha256(Path(binary["path"]).read_bytes()).hexdigest() == binary["sha256"]

    env = dict(os.environ, SQGI_JIT="1", SQGI_JIT_THRESHOLD="1000", SQGI_JIT_PRECISE_EXITS="0")
    env.pop("SQGI_JIT_TRACE", None)
    env.pop("SQGI_APP_RESOURCES", None)
    output = {"settings": vars(args), "host": platform.platform(), "status": "running", "runs": []}
    references = {}

    def save():
        (HERE / "results.json").write_text(json.dumps(output, indent=2) + "\n")

    save()
    try:
        for mode in ["headless", "gui"]:
            # Pair zero warms each workload and is excluded from summaries.
            for pair in range(args.pairs + 1):
                order = ["before", "after"] if pair % 2 == 0 else ["after", "before"]
                for variant in order:
                    command = ["taskset", "-c", str(args.core), snapshot["binaries"][variant]["path"]]
                    if mode == "headless":
                        command += ["tests/balance_headless.nut", "--games=1", f"--max-seconds={args.simulation_seconds}"]
                    else:
                        command += ["main.nut", "--benchmark", f"--timeout={args.gui_seconds}"]
                    row = {"mode": mode, "pair": pair, "variant": variant,
                           "warmup": pair == 0, "command": command, "machine_before": machine_state()}
                    usage = resource.getrusage(resource.RUSAGE_CHILDREN)
                    start = time.perf_counter()
                    proc = subprocess.run(command, cwd=workload, env=env, text=True,
                                          capture_output=True, timeout=180)
                    row["wall_seconds"] = time.perf_counter() - start
                    end_usage = resource.getrusage(resource.RUSAGE_CHILDREN)
                    row["cpu_seconds"] = end_usage.ru_utime + end_usage.ru_stime - usage.ru_utime - usage.ru_stime
                    row["machine_after"] = machine_state()
                    row["returncode"] = proc.returncode
                    row["log"] = f"{mode}-{variant}-{pair}.txt"
                    (HERE / row["log"]).write_text(proc.stdout + proc.stderr)
                    output["runs"].append(row)
                    save()
                    if proc.returncode or re.search(r"AN ERROR HAS OCCURRED|could not load|Failed to open file", proc.stdout + proc.stderr):
                        raise RuntimeError(f"Workload failed: {row['log']}")
                    if mode == "headless":
                        digest = hashlib.sha256(proc.stdout.encode()).hexdigest()
                        row["output_sha256"] = digest
                        if "headless" not in references:
                            references["headless"] = digest
                        if digest != references["headless"]:
                            raise RuntimeError(f"Simulation output changed: {row['log']}")
                        detail = f"wall={row['wall_seconds']:.4f}s cpu={row['cpu_seconds']:.4f}s"
                    else:
                        row["metrics"] = {name: {"samples": int(n), "mean_ms": float(mean),
                                                  "p95_ms": float(p95), "max_ms": float(maximum)}
                                          for name, n, mean, p95, maximum in PROFILE.findall(proc.stdout)}
                        if any(name not in row["metrics"] for name in ["paint_interval", "simulation", "world", "hud"]):
                            raise RuntimeError(f"Missing GUI measurements: {row['log']}")
                        scene = re.search(r"^BENCHMARK .+$", proc.stdout, re.M)
                        if not scene:
                            raise RuntimeError(f"Missing seeded scene: {row['log']}")
                        row["scene"] = scene[0]
                        if "gui" not in references:
                            references["gui"] = scene[0]
                        if scene[0] != references["gui"]:
                            raise RuntimeError(f"Seeded GUI scene changed: {row['log']}")
                        fps = 1000 / row["metrics"]["paint_interval"]["mean_ms"]
                        row["gtk_draws_per_second"] = fps
                        detail = f"GTK={fps:.2f}/s simulation={row['metrics']['simulation']['mean_ms']:.3f}ms"
                    save()
                    print(f"{mode} pair={pair} {variant}: {detail}" + (" (warmup)" if pair == 0 else ""), flush=True)
        output["status"] = "complete"
        output["summaries"] = {}
        for variant in ["before", "after"]:
            rows = [r for r in output["runs"] if r["variant"] == variant and not r["warmup"]]
            headless = [r for r in rows if r["mode"] == "headless"]
            gui = [r for r in rows if r["mode"] == "gui"]
            output["summaries"][variant] = {
                "headless_wall_median_s": statistics.median(r["wall_seconds"] for r in headless),
                "headless_cpu_median_s": statistics.median(r["cpu_seconds"] for r in headless),
                "gtk_draws_median_per_s": statistics.median(r["gtk_draws_per_second"] for r in gui),
                "gui_medians_ms": {metric: {stat: statistics.median(r["metrics"][metric][stat] for r in gui)
                                             for stat in ["mean_ms", "p95_ms"]}
                                   for metric in ["paint_interval", "simulation", "world", "hud"]},
            }
        print(json.dumps(output["summaries"], indent=2), flush=True)
    except Exception as exc:
        output["status"] = "failed"
        output["error"] = str(exc)
        raise
    finally:
        save()


if __name__ == "__main__":
    main()
