# Frozen SqLegends end-to-end benchmark

## Comparison

Both executables have ordinary LLVM JIT enabled. **Before** is the saved
SQGI executable from before the float/clamp and table-predicate improvements;
**after** contains both improvements. This measures the incremental SQGI
changes, not JIT on versus JIT off. The base revision is
`dad493c68ec9bcae43a3b82731a5522c161da023`.

The complete workload was frozen under `/tmp/sqgi-end-to-end-20260920`, including
674 source, asset and native renderer files. Every copied file was checked
against the original immediately after copying. Both executables then used
this same snapshot. The [manifest](snapshot.json) records file and executable
SHA-256 hashes. No original SqLegends files were modified.

## Method

- Release SQGI builds with LLVM bytecode JIT and LLVM typed kernels enabled.
- `SQGI_JIT=1`, `SQGI_JIT_THRESHOLD=1000`, `SQGI_JIT_PRECISE_EXITS=0`;
  `SQGI_JIT_TRACE` unset. Existing spatial and targeting kernels stay enabled.
- Same aarch64 host, processes pinned to CPU 6 with `taskset`. Governor and
  background load are not controlled; temperatures, frequency and load averages
  are recorded at both ends of every run.
- One unmeasured warmup pair per mode, then five measured pairs. Execution order
  alternates before/after and after/before. Each run uses a fresh process.
- Headless: `tests/balance_headless.nut --games=1 --max-seconds=300`, using the
  game's deterministic tournament setup and 0.05-second simulation steps.
  Process wall/CPU times include startup and JIT compilation. Every run's stdout
  must match byte-for-byte across both variants.
- GUI: `main.nut --benchmark --timeout=20`. The existing benchmark starts from
  seed 17, advances 5400 fixed 1/60-second simulation steps outside the timed
  window, then runs live simulation/rendering at the default camera zoom 1.75.
  The existing frame profiler discards the first two seconds of the timed window.
  Both variants must report the same initial benchmark scene.
- GUI measurements use the game's existing opt-in frame profiler, identically
  enabled in both builds; SQGI JIT diagnostics remain off. Simulation time is
  per `Game.update` call. World time measures CPU-side submission, not GPU time.
  GTK draws/s is reciprocal mean `after-paint` interval, not independently
  measured physical display presentation. Live GUI runs share their initial
  scene but do not promise identical frame/update scheduling or final state.
- Tables report the median of each run's metric, not pooled per-frame samples.
  Per-pair percentage changes expose variation between adjacent runs.

## Reproduction and raw data

With the frozen workload and binaries still present:

```sh
python3 reports/sqlegends-jit-2026-09-20/end-to-end/benchmark.py
python3 reports/sqlegends-jit-2026-09-20/end-to-end/analyze.py
```

The [runner](benchmark.py) verifies snapshot hashes before starting, stops on
workload errors or inconsistent outputs, and persists observations after each
run. [Results](results.json) include commands, timings, machine conditions and
per-run log names. [Analysis](analysis.json) contains medians and paired changes.
The `/tmp` snapshot and executable copies are local artifacts, not committed
game assets or a portable rebuild of the baseline.
