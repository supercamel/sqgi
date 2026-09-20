# SqLegends LLVM JIT profile — 2026-09-20

Subsequent work: [read-only table predicate lowering and measurements](tables.md).

The profile found real missed lowering in the two frequently called clamp
functions. This change adds LLVM floating-point comparisons and independently
typed scalar return paths, so those helpers can execute natively. It improves
coverage, but the full headless simulation timings do **not** establish an
end-to-end speedup.

## Workload and method

- Host: aarch64 Orange Pi; timed processes pinned to CPU 6.
- SQGI base revision: `dad493c68ec9bcae43a3b82731a5522c161da023`.
  Release build, LLVM bytecode JIT and LLVM typed kernels enabled.
- Runtime: `SQGI_JIT=1`, default threshold 1000; experimental precise exits
  remain disabled. Spatial and targeting kernels remain enabled.
- Headless: SqLegends `tests/balance_headless.nut --games=1 --max-seconds=90`.
  This uses the game's deterministic tournament setup and 0.05-second steps,
  rather than the GUI's 60 Hz steps.
- GUI: `main.nut --benchmark --timeout=14`, including the seeded 90-second
  warmup. Its frame profiler excludes the first two seconds of the timed window.
- Statistics runs use `SQGI_JIT_TRACE=stats`; timing runs explicitly unset it.
  Call counts identify frequent functions, not their exclusive CPU time.
- The game has no Git metadata. [Source hashes](game-source-sha256.json) identify
  the profiled Squirrel/kernel files. No game source was modified.

The baseline executable was saved as `/tmp/sqgi-sqlegends-baseline` before the
lowering changes. The updated executable is `build-install-release/sqgi`.
The existing `build-llvm-release` directory points at a historical source copy
and cannot run the current game's spatial kernel; it was excluded from results.
The installed `/usr/local/bin/sqgi` was not replaced.

## Missed hot functions

The baseline headless run compiled only 5 of 81 hot function prototypes. It
recorded 3,586,924 VM function entries and 506,695 successful direct native calls.
CPU sampling at 499 Hz attributed 48.81% of samples to `SQVM::Execute`, 4.68% to
`SQTable::Get`, and 3.81% to `SQVM::LeaveFrame`. This is a short whole-run CPU
sample, including startup; it does not attribute time to individual Squirrel
closures. See [sampling summary](baseline-perf-summary.txt).

| Function (source line of first instruction) | Baseline calls | Main lowering gap |
| --- | ---: | --- |
| `Math.clamp`, `engine/math.nut:8` | 472,125 | Float comparisons; differing numeric return tags |
| `write_row`, `engine/targeting.nut:6` | 267,914 | Table reads/writes, conversions, native kernel-array `set` |
| `is_alive`, `game/match.nut:411` | 230,032 | Object argument, null check, short-circuit member access |
| `consider_projectile_target`, `game/match.nut:781` | 217,313 | Captured helpers, object access, nullable results and writes |
| `Targeting.ready`, `engine/targeting.nut:50` | 182,217 | Receiver/table identity checks and short-circuit logic |
| `Targeting.invalidate`, `engine/targeting.nut:49` | 182,148 | Receiver access and conditional table write |
| `kernel_enemy`, `game/match.nut:627` | 182,148 | Default parameter, captured helpers, object/native calls and loop |
| Collision `clamp`, `engine/collision.nut:6` | 175,180 | Float comparisons |
| `Math.move_toward`, `engine/math.nut:34` | 112,653 | Math call, branch, escaping result array |

The two copies of `distance_sq` already compile; their roughly 490,000 calls
are not a missed-lowering opportunity. The broader table/object routines are
still outside the default scalar backend. Simply enabling more opcodes is not
enough: writes and native calls require correct publication and side exits.

The GUI profile confirms the same simulation hotspots. It also finds 216,435
calls to `Camera.visible` (`engine/camera.nut:62`), which is still interpreted:
it combines table fields, captured screen constants, a default argument and
short-circuit comparisons. GUI counts include simulation warmup and depend on
the number of rendered frames. See [GUI statistics](gui-after-stats.txt).

## Implementation

- LLVM scalar plans accept float/float and mixed integer/float `<`, `<=`, `>`,
  `>=`, both value-producing comparisons and fused conditional branches.
- Lowering follows `SQVM::ObjCmp`, including its raw-bit equality rule for two
  floats. This matters for opposite signed zeros and different NaN payloads;
  ordinary IEEE predicates alone would change Squirrel behavior.
- Separate return instructions publish their own proven scalar type. A clamp
  can return an integer bound on one branch and a float on another. Live joins
  with conflicting types remain unsupported. Existing argument and host FP
  environment guards remain in force. Default non-LLVM leaf plans retain their
  existing restrictions.
- Diagnostics now rank 24 functions by total observed calls (`enters` plus
  successful direct calls), retaining source lines for anonymous closures.
  Capacity increases from 256 to 4096 prototypes with indexed lookup and safe
  removal of retired addresses. Capacity usage is printed so truncation is
  visible. This game records 514 prototypes in the GUI run; loop diagnostics
  still reach their separate 256-entry limit.

The original diagnostics filled their prototype table during GUI startup,
before gameplay, and performed linear lookup on every recorded event. Its GUI
rankings are therefore incomplete. **Do not compare the frame times in
`gui-baseline-stats.txt` and `gui-after-stats.txt` as a JIT speedup:** the profiler
itself changed substantially. Use the separate untraced timing runs instead.

## Coverage and timing

The fixed headless workload now compiles 8 hot prototypes and records 981,124
successful direct native calls, up from 506,695: **474,429 additional direct
native calls**. Collision clamp records 174,180 direct successes. Math clamp
records 297,435, but 173,690 calls still fail its specialized argument guards
and fall back. Both direct and framed attempts record those failures, so their
combined guard-failure counter must not be mistaken for distinct calls.
See [before](baseline-stats.txt) and [after](after-stats.txt).

Eight alternating before/after pairs were run on CPU 6; the first pair was
discarded. All 16 runs produced byte-for-byte identical game output. Seven-pair
median process wall time was **2.621 s before, 2.614 s after** (about 0.3%, within
run-to-run noise). These include process startup and compilation. See
[raw timing observations](headless-timings.json).

The [focused clamp benchmark](clamp_benchmark.nut) calls the actual game helper
one million times with a stable float signature after 2000 warmup calls. Five
alternating pairs gave medians of **202.897 ms before, 154.428 ms after**: 23.9%
less time, or 1.31× throughput, with identical checksums. This includes the
Squirrel driver loop; it is a helper benchmark, not a whole-game speedup. See
[measurements](clamp-timings.json).

Untraced GUI measurements were inconclusive. The completed runs varied from
18.6 to 26.0 ms mean paint intervals; a later baseline run failed to produce any
paint samples because `assets/generated/butterfly-v1/world-sprite-atlas.png`
was missing. During the comparison, the game's `main.nut`, `match.nut` and
`strategy.nut` also changed externally relative to the saved source hashes.
The comparison was stopped without repairing or modifying SqLegends. The
individual `gui-before-*.txt` and `gui-after-*.txt` logs are retained, but no FPS
gain is claimed from them. The earlier fixed headless comparison had identical
outputs for every before/after pair.

The next likely improvements are guarded table-member access and short-circuit
logic for helpers such as `is_alive`, followed by bounded specialization for
functions called with multiple numeric argument signatures. The latter would
address the remaining clamp guard misses. Native-call and captured-variable
support are needed before the high-frequency targeting wrapper can lower.

## Validation and reproduction

All 30 JIT-labelled CTests pass, including differential comparisons against
the interpreter for all four predicates, fused branches, float/float and both
mixed numeric signatures, quiet NaN payloads, signed zeros, infinities and large
integers. Tests also check mixed clamp return tags, argument-type fallback,
unchanged default leaf restrictions, and diagnostic address reuse beyond the
old capacity. See [CTest output](tests-jit-final.txt). SqLegends'
[headless tests](game-headless-tests.txt) pass with the updated executable.

From SQGI:

```sh
cmake --build build-install-release -j4
ctest --test-dir build-install-release -L jit --output-on-failure -j2
```

From SqLegends (substitute the absolute SQGI path on other machines):

```sh
SQGI_JIT=1 SQGI_JIT_TRACE=stats taskset -c 6 ../sqgi/build-install-release/sqgi \
  tests/balance_headless.nut --games=1 --max-seconds=90
SQGI_JIT=1 SQGI_JIT_TRACE=stats taskset -c 6 ../sqgi/build-install-release/sqgi \
  main.nut --benchmark --timeout=14
env -u SQGI_JIT_TRACE SQGI_JIT=1 taskset -c 6 ../sqgi/build-install-release/sqgi \
  main.nut --benchmark --timeout=14
env -u SQGI_JIT_TRACE SQGI_JIT=1 taskset -c 6 ../sqgi/build-install-release/sqgi \
  ../sqgi/reports/sqlegends-jit-2026-09-20/clamp_benchmark.nut
```

Raw `perf` recordings and build logs are kept locally and ignored by Git.
