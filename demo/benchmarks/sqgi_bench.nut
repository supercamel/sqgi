/**
 * SQGI side of demo/benchmarks.
 *
 * Output columns:
 *   runtime  benchmark  iterations  ms  checksum
 */

local GLib = import("GLib")

local scale = 1
foreach (a in vargv) {
    if (a.find("--scale=") == 0) {
        scale = a.slice(8).tointeger()
        if (scale < 1) scale = 1
    }
}

function now_us() {
    return GLib.get_monotonic_time()
}

function emit(name, n, start_us, checksum) {
    local elapsed_us = GLib.get_monotonic_time() - start_us
    local ms = elapsed_us.tofloat() / 1000.0
    print(format("sqgi\t%s\t%d\t%.3f\t%s\n", name, n, ms, checksum.tostring()))
}

function bench_numeric(n) {
    local start = now_us()
    local x = 0
    for (local i = 0; i < n; i++) {
        x = (x + (i % 997) * 31 + 7) % 1000000007
    }
    emit("numeric", n, start, x)
}

function bench_empty_loop(n) {
    local start = now_us()
    local x = 0
    for (local i = 0; i < n; i++) {
        x = i
    }
    emit("empty-loop", n, start, x)
}

function inc(x) {
    return x + 1
}

function bench_function_call(n) {
    local start = now_us()
    local x = 0
    for (local i = 0; i < n; i++) {
        x = inc(x)
    }
    emit("function-call", n, start, x)
}

function bench_array(n) {
    local start = now_us()
    local a = []
    for (local i = 0; i < n; i++) {
        a.push(i % 251)
    }
    local sum = 0
    for (local i = n - 1; i >= 0; i--) {
        sum = (sum + a[i]) % 1000000007
    }
    emit("array", n, start, sum)
}

function bench_table(n) {
    local keys = []
    for (local i = 0; i < 2048; i++) {
        keys.push("k" + i)
    }

    local t = {}
    foreach (k in keys) {
        t[k] <- 0
    }

    local start = now_us()
    for (local i = 0; i < n; i++) {
        local k = keys[i % keys.len()]
        t[k] = t[k] + 1
    }
    local sum = 0
    foreach (k in keys) {
        sum += t[k]
    }
    emit("table", n, start, sum)
}

function bench_string(n) {
    local start = now_us()
    local s = ""
    for (local i = 0; i < n; i++) {
        s += "sqgi:"
        s += (i % 100).tostring()
        s += ";"
    }
    emit("string", n, start, s.len())
}

function bench_glib_clock(n) {
    local start = now_us()
    local x = 0
    for (local i = 0; i < n; i++) {
        x = (x + (GLib.get_monotonic_time() % 97)) % 1000000007
    }
    emit("glib-clock", n, start, x)
}

bench_empty_loop(2000000 * scale)
bench_numeric(1000000 * scale)
bench_function_call(500000 * scale)
bench_array(300000 * scale)
bench_table(250000 * scale)
bench_string(30000 * scale)
bench_glib_clock(200000 * scale)
