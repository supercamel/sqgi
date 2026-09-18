# Typed kernel demos

Run from the repository root with a kernel-enabled SQGI build:

```sh
cmake -S . -B build-kernels -DSQGI_ENABLE_KERNELS=ON -DSQGI_KERNEL_BACKEND=LLVM -DCMAKE_BUILD_TYPE=Release
cmake --build build-kernels -j
./build-kernels/sqgi demo/kernels/astar.nut
ctest --test-dir build-kernels -L kernel --output-on-failure
```

LLVM needs development headers and its shared library; see the
[build instructions](../../docs/kernels/README.md). `-DSQGI_KERNEL_BACKEND=NATIVE`
uses the dependency-free x64 emitter instead. No MSYS2 shell is required on
Windows: run the built `sqgi.exe` from the repository root in PowerShell.

Each `.nut` script loads its matching `.sqk`, allocates typed buffers, runs native
code, and checks the result against a Squirrel calculation. The numerical `.sqk` files are also loaded by the C++ differential tests and
the [benchmark suite](../benchmarks/kernels/README.md). Typed objects have
dedicated language/integration tests and a separate benchmark.

| Demo | What it exercises | Capacity/layout |
| --- | --- | --- |
| `compiled_workflow.nut` | Whole single-object simulation, native local objects and scratch arrays | One oscillator and four local doubles |
| `typed_objects.nut` | Persistent controller class, scalar methods and compiled method chains | Runtime-sized arrays, including empty arrays |
| `geometry.nut` | Struct transforms, processing 600 vertices in batches | 256 `Vec3` per batch |
| `reductions.nut` | Sum, dot product, prefix sums, empty input | 1,024 doubles |
| `particles.nut` | In-place state, inactive particles, gravity and bounces | 128 `Particle` records |
| `image.nut` | Helper functions, clamping, thresholding, ASCII output | 1,024 grayscale **i64** values, not bytes |
| `math.nut` | Scalar math, predicates, domain guards, complete math benchmark loops | Binary64 scalars and local scratch |
| `matrix.nut` | Three nested loops, matrix multiplication | 16×16 doubles, row stride **16**, even for smaller matrices |
| `routing.nut` | Inclusive rectangle overlap, short circuiting, hit flags | 256 obstacle boxes |
| `histogram.nut` | Indirect indexing, requirements, clearing output | 1,024 input indices, 16 bins |
| `stencil.nut` | Four-neighbour diffusion, fixed edges, ping-pong buffers | Up to 32×32 doubles, packed row stride **width** |
| `astar.nut` | Branch-heavy search, structs, scratch storage, path reconstruction | Fixed 16×16 grid |

## A* contract

`search(grid, state, path, start, goal)` uses four-neighbour, unit-cost movement
and Manhattan distance. Grid cells are `0` (free) or `1` (blocked), indexed
`row * 16 + column`. Invalid indices or cell values raise a requirement error.
The host owns all three buffers; each call initializes search state and clears
the entire path. `Search.status` is 0=unseen, 1=open, 2=closed.

The return value is the **number of path nodes**, or `-1` for an unreachable or
blocked endpoint. The returned path runs **goal to start**, including both;
unused entries are `-1`. Start equal to goal returns one node when traversable.
The demo's two walls force a 48-move detour and its independent breadth-first
search verifies the shortest distance.

The open set is a linear scan with deterministic lowest-index tie breaking.
This keeps the example readable, but costs O(V²) in the worst case; it is not a
heap-based large-map pathfinding implementation. Tests cover random maps,
unreachable destinations, blocked endpoints, row boundaries and budget limits.

## Reuse and failures

Load each module once and reuse its typed buffers. Fixed extents are capacities;
most examples take a checked logical count or width. Kernel structs live in
arrays; scratch arrays can be supplied by the host or declared locally with a
fixed extent inside compiled code. Writable arguments
must not alias other buffers passed to the same call.

Requirements, bounds checks and the execution budget can terminate a call after
it has written some output. Such calls are not transactions: histogram resets
and earlier bins, for example, remain written when a later sample is invalid.
The differential tests compare all buffer cells, remaining fuel and error lines
on both successful and failing calls.

The matrix module also exports `recurrence(n)`, a complete compiled port of the
ordinary-Squirrel matrix benchmark. See the [matrix recurrence comparison](../benchmarks/kernels/README.md#evolving-3x3-matrix-recurrence)
for correctness checks and cross-runtime timings.

`vector.sqk` exports `recurrence(n)`, the runtime suite's Vec3 update loop using
fixed local storage. See the [vector comparison](../benchmarks/kernels/README.md#vec3-recurrence)
for tests and timings. Call it with:

```squirrel
local vectors = sqgi.kernel.load("demo/kernels/vector.sqk");
local checksum = vectors.recurrence(80000);
```
