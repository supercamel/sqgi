#!/usr/bin/env python3
import argparse
import time


def emit(name, n, started_ns, checksum):
    ms = (time.perf_counter_ns() - started_ns) / 1_000_000.0
    print(f"python\t{name}\t{n}\t{ms:.3f}\t{checksum}")


def bench_numeric(n):
    started = time.perf_counter_ns()
    x = 0
    for i in range(n):
        x = (x + (i % 997) * 31 + 7) % 1_000_000_007
    emit("numeric", n, started, x)


def bench_empty_loop(n):
    started = time.perf_counter_ns()
    x = 0
    for i in range(n):
        x = i
    emit("empty-loop", n, started, x)


def inc(x):
    return x + 1


def bench_function_call(n):
    started = time.perf_counter_ns()
    x = 0
    for _ in range(n):
        x = inc(x)
    emit("function-call", n, started, x)


def bench_array(n):
    started = time.perf_counter_ns()
    a = []
    for i in range(n):
        a.append(i % 251)
    total = 0
    for i in range(n - 1, -1, -1):
        total = (total + a[i]) % 1_000_000_007
    emit("array", n, started, total)


def bench_table(n):
    keys = [f"k{i}" for i in range(2048)]
    table = {k: 0 for k in keys}
    started = time.perf_counter_ns()
    for i in range(n):
        k = keys[i % len(keys)]
        table[k] += 1
    emit("table", n, started, sum(table.values()))


def bench_string(n):
    started = time.perf_counter_ns()
    s = ""
    for i in range(n):
        s += "sqgi:"
        s += str(i % 100)
        s += ";"
    emit("string", n, started, len(s))


def bench_glib_clock(n):
    try:
        import gi

        gi.require_version("GLib", "2.0")
        from gi.repository import GLib
    except Exception:
        print(f"python\tglib-clock\t{n}\tSKIP\tPyGObject unavailable")
        return

    started = time.perf_counter_ns()
    x = 0
    for _ in range(n):
        x = (x + (GLib.get_monotonic_time() % 97)) % 1_000_000_007
    emit("glib-clock", n, started, x)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--scale", type=int, default=1)
    args = parser.parse_args()
    scale = max(1, args.scale)

    bench_empty_loop(2_000_000 * scale)
    bench_numeric(1_000_000 * scale)
    bench_function_call(500_000 * scale)
    bench_array(300_000 * scale)
    bench_table(250_000 * scale)
    bench_string(30_000 * scale)
    bench_glib_clock(200_000 * scale)


if __name__ == "__main__":
    main()
