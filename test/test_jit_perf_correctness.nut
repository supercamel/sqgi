// Self-contained JIT correctness and benchmark workloads.
//
// The shapes here mirror the broad VM/JIT behavior we care about without
// depending on an external project: numeric loops, direct Squirrel calls,
// array element access, table/instance member access, object-valued member
// writes, and vector-like arithmetic.

local GLib = import("GLib")

function check_eq(actual, expected, label) {
    if (actual != expected) {
        throw format("[FAIL] %s got %s expected %s",
            label, actual.tostring(), expected.tostring())
    }
}

function absf(x) {
    return x < 0.0 ? -x : x
}

function approx(actual, expected, epsilon, label) {
    if (!(actual == actual) || absf(actual - expected) > epsilon) {
        throw format("[FAIL] %s got %.9f expected %.9f", label, actual, expected)
    }
}

function parse_arg_int(prefix, dflt) {
    foreach (arg in vargv) {
        if (arg.find(prefix) == 0) return arg.slice(prefix.len()).tointeger()
    }
    return dflt
}

function has_arg(name) {
    foreach (arg in vargv) {
        if (arg == name) return true
    }
    return false
}

function scalar_step(acc, a, b) {
    return (acc * 33 + a * 17 - b * 9 + 97) % 1000003
}

function direct_call_kernel(n) {
    local acc = 7
    for (local i = 0; i < n; i++) {
        acc = scalar_step(acc, i % 251, i % 127)
    }
    return acc
}

function numeric_loop_kernel(n) {
    local acc = 13
    for (local i = 0; i < n; i++) {
        acc = (acc + (i % 997) * 31 + (acc % 17) * 7 + 11) % 1000000007
    }
    return acc
}

class Vec3 {
    values = null

    constructor(x = 0.0, y = 0.0, z = 0.0) {
        this.values = [x, y, z]
    }

    function get(i) {
        return this.values[i]
    }

    function set(i, v) {
        this.values[i] = v
        return v
    }

    function _add(o) {
        return Vec3(this.values[0] + o.values[0],
                    this.values[1] + o.values[1],
                    this.values[2] + o.values[2])
    }

    function _sub(o) {
        return Vec3(this.values[0] - o.values[0],
                    this.values[1] - o.values[1],
                    this.values[2] - o.values[2])
    }

    function _mul(s) {
        return Vec3(this.values[0] * s,
                    this.values[1] * s,
                    this.values[2] * s)
    }

    function dot(o) {
        return this.values[0] * o.values[0] +
               this.values[1] * o.values[1] +
               this.values[2] * o.values[2]
    }

    function cross(o) {
        return Vec3(this.values[1] * o.values[2] - this.values[2] * o.values[1],
                    this.values[2] * o.values[0] - this.values[0] * o.values[2],
                    this.values[0] * o.values[1] - this.values[1] * o.values[0])
    }
}

function vector_kernel(n) {
    local pos = Vec3(1.0, -2.0, 0.5)
    local vel = Vec3(0.125, -0.250, 0.375)
    local axis = Vec3(0.25, 0.5, -0.75)
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local wind = Vec3(((i % 11).tofloat() - 5.0) * 0.01,
                          ((i % 7).tofloat() - 3.0) * 0.02,
                          ((i % 5).tofloat() - 2.0) * 0.015)
        local force = vel.cross(axis) + wind - pos * 0.0125
        pos = pos + force * 0.05
        vel = vel + pos.cross(force) * 0.0025

        local idx = i % 3
        local next = (idx + 1) % 3
        pos.set(next, pos.get(next) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    }

    return pos.dot(vel) + checksum
}

class PayloadBox {
    payload = null
    label = ""

    constructor(payload, label) {
        this.payload = payload
        this.label = label
    }

    function swap_with(other, label) {
        local previous = this.payload
        this.payload = other.payload
        this.label = label
        other.payload = previous
        return this.payload[0] + other.payload[1]
    }
}

function dynamic_member_kernel(n) {
    local keys = ["x", "y", "z"]
    local state = {
        x = 3,
        y = 5,
        z = 7,
        active = null,
        label = "init"
    }
    local boxes = [
        PayloadBox([1, 2, 3], "a"),
        PayloadBox([4, 5, 6], "b")
    ]
    local sum = 0

    for (local i = 0; i < n; i++) {
        local key = keys[i % 3]
        local old = state[key]
        state[key] = old + (i % 17)
        state.active = boxes[i % 2]
        state.label = key

        local box = state.active
        sum = (sum + box.swap_with(boxes[(i + 1) % 2], key)) % 1000003
        box.payload[i % 3] = (box.payload[i % 3] + state[key] + i) % 997
        sum = (sum + box.payload[(i + 2) % 3] + state[key]) % 1000003
    }

    return sum + state.x * 3 + state.y * 5 + state.z * 7 +
        boxes[0].payload[0] * 11 + boxes[1].payload[2] * 13
}

function matrix_kernel(n) {
    local a = [
        [1.0, 0.5, -0.25],
        [-0.75, 1.25, 0.375],
        [0.625, -0.5, 1.5]
    ]
    local v = [1.0, -2.0, 0.75]
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local x = a[0][0] * v[0] + a[0][1] * v[1] + a[0][2] * v[2]
        local y = a[1][0] * v[0] + a[1][1] * v[1] + a[1][2] * v[2]
        local z = a[2][0] * v[0] + a[2][1] * v[1] + a[2][2] * v[2]
        v[0] = x * 0.125 + ((i % 5).tofloat() - 2.0) * 0.01
        v[1] = y * 0.125 - ((i % 7).tofloat() - 3.0) * 0.015
        v[2] = z * 0.125 + ((i % 11).tofloat() - 5.0) * 0.005
        a[i % 3][(i + 1) % 3] = a[i % 3][(i + 1) % 3] * 0.99 + v[i % 3] * 0.001
        checksum = checksum + v[0] * 0.25 + v[1] * 0.5 - v[2] * 0.125
    }

    return checksum + v[0] * 3.0 + v[1] * 5.0 + v[2] * 7.0
}

function run_correctness() {
    check_eq(direct_call_kernel(400), 193938, "direct call checksum")
    check_eq(numeric_loop_kernel(400), 2500508, "numeric loop checksum")
    approx(vector_kernel(120), 0.021712612, 0.0005, "vector kernel checksum")
    check_eq(dynamic_member_kernel(160), 186190, "dynamic member checksum")
    approx(matrix_kernel(200), -0.314673245, 0.0005, "matrix kernel checksum")
}

function bench_one(name, iterations, fn) {
    local start_us = GLib.get_monotonic_time()
    local checksum = fn(iterations)
    local elapsed_us = GLib.get_monotonic_time() - start_us
    local per_iter = elapsed_us.tofloat() / iterations.tofloat()
    print(format("BENCH\t%s\t%d\t%.6f\t%s\n",
        name, iterations, per_iter, checksum.tostring()))
}

run_correctness()

if (has_arg("--bench")) {
    local iterations = parse_arg_int("--iterations=", 2000)
    bench_one("direct_call", iterations * 20, direct_call_kernel)
    bench_one("numeric_loop", iterations * 20, numeric_loop_kernel)
    bench_one("vector", iterations, vector_kernel)
    bench_one("dynamic_member", iterations, dynamic_member_kernel)
    bench_one("matrix", iterations, matrix_kernel)
}
else {
    print("test_jit_perf_correctness.nut passed\n")
}
