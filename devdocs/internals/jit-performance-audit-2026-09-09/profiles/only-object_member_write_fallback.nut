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

function scalar_branch_step(acc, i) {
    local delta = 0
    if (i % 2 == 0) delta = i % 17
    else delta = 0 - (i % 13)
    return (acc + delta + 97) % 1000003
}

function branch_call_kernel(n) {
    local acc = 7
    for (local i = 0; i < n; i++) acc = scalar_branch_step(acc, i)
    return acc
}

function scalar_float_step(x, y) {
    return x * 0.5 + y
}

function float_call_kernel(n) {
    local value = 0.0
    for (local i = 0; i < n; i++) value = scalar_float_step(value, i % 7)
    return value
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

function dynamic_key_get_set_kernel(n) {
    local keys = ["a", "b", "c", "d"]
    local state = { a = 1, b = 2, c = 3, d = 4 }
    local acc = 0

    for (local i = 0; i < n; i++) {
        local key = keys[i % 4]
        local next_key = keys[(i + 1) % 4]
        local current = state[key]
        local next_value = (current + i * 3 + 7) % 1000003
        state[key] = next_value
        acc = (acc + state[next_key] + next_value) % 1000003
    }

    return acc + state.a * 3 + state.b * 5 + state.c * 7 + state.d * 11
}

function object_member_write_fallback_kernel(n) {
    local state = {
        active = [1, 2, 3],
        spare = [4, 5, 6],
        label = "init"
    }
    local sum = 0

    for (local i = 0; i < n; i++) {
        local previous = state.active
        state.active = state.spare
        state.spare = previous
        state.label = (i % 2) == 0 ? "even" : "odd"
        state.active[i % 3] =
            (state.active[i % 3] + i + state.label.len()) % 997
        sum = (sum + state.active[(i + 1) % 3] +
            state.spare[(i + 2) % 3]) % 1000003
    }

    return sum + state.active[0] * 3 + state.active[1] * 5 +
        state.spare[2] * 7 + state.label.len()
}

function array_append_kernel(n) {
    local values = []

    for (local i = 0; i < n; i++) {
        values.append(i % 251)
    }

    local sum = 0
    for (local i = 0; i < n; i++) {
        sum = (sum + values[i] * ((i % 7) + 1)) % 1000003
    }
    return sum + values.len() * 13
}

function array_write_kernel(n) {
    local values = [0, 0, 0, 0, 0, 0, 0, 0]

    for (local i = 0; i < n; i++) {
        local slot = i % 8
        values[slot] = (values[slot] + i * 5 + slot) % 1000003
    }

    local sum = 0
    for (local i = 0; i < 8; i++) {
        sum = (sum + values[i] * (i + 3)) % 1000003
    }
    return sum
}

function math_intrinsic_kernel(n) {
    local total = 0.0

    for (local i = 0; i < n; i++) {
        local x = ((i % 97) + 1).tofloat()
        total += sqrt(x) + sin(0.0) + cos(0.0)
        total += fabs(-3.5) + floor(1.75) + ceil(1.25)
        total += pow(1.0001, (i % 5).tofloat())
    }

    return total
}

// All arguments vary, so this also measures actual transcendental work.
function math_variable_kernel(n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        local x = ((i % 97) + 1).tofloat() * 0.01
        total += sqrt(x) + sin(x) + cos(x) + log(x) + atan2(x, 0.75) + pow(x, 1.125)
    }
    return total
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

function array_read_kernel(n) {
    local a = [1, 2, 3, 4]
    local sum = 0
    for (local i = 0; i < n; i++) sum += a[i % 4]
    return sum
}

function array_float_kernel(n) {
    local a = [0.5, 1.5, 2.5, 3.5]
    local sum = 0.0
    for (local i = 0; i < n; i++) sum += a[i % 4]
    return sum
}

function run_correctness() {
    check_eq(array_read_kernel(200), 500, "array read checksum")
    approx(array_float_kernel(200), 400.0, 0.0005, "float array checksum")
    check_eq(direct_call_kernel(400), 193938, "direct call checksum")
    check_eq(branch_call_kernel(400), 39196, "branch call checksum")
    approx(float_call_kernel(400), 5.0551181102362204, 0.000000000001, "float call checksum")
    check_eq(numeric_loop_kernel(400), 2500508, "numeric loop checksum")
    approx(vector_kernel(120), 0.021712587807413163, 0.000000000001, "vector kernel checksum")
    check_eq(dynamic_member_kernel(160), 186190, "dynamic member checksum")
    check_eq(dynamic_key_get_set_kernel(200), 470622, "dynamic key checksum")
    check_eq(object_member_write_fallback_kernel(120), 82710,
        "object member write fallback checksum")
    check_eq(array_append_kernel(300), 134408, "array append checksum")
    check_eq(array_write_kernel(300), 461837, "array write checksum")
    approx(math_intrinsic_kernel(80), 1161.3127449959120, 0.000000001,
        "math intrinsic checksum")
    approx(math_variable_kernel(80), 122.66761111643609, 0.000000001, "variable math checksum")
    approx(matrix_kernel(200), -0.31467322972993278, 0.000000000001, "matrix kernel checksum")
}

function bench_one(name, iterations, fn) {
    if (name != "object_member_write_fallback") return;
    local warmups = parse_arg_int("--warmups=", 0)
    local warm_checksum = null
    for (local w = 0; w < warmups; w++) warm_checksum = fn(iterations)
    local start_us = GLib.get_monotonic_time()
    local checksum = fn(iterations)
    local elapsed_us = GLib.get_monotonic_time() - start_us
    if (warmups > 0) check_eq(checksum, warm_checksum, name + " warm checksum")
    local per_iter = elapsed_us.tofloat() / iterations.tofloat()
    local checksum_text = typeof checksum == "float" ? format("%.17g", checksum) : checksum.tostring()
    print(format("BENCH\t%s\t%d\t%.6f\t%s\n",
        name, iterations, per_iter, checksum_text))
}

run_correctness()

if (has_arg("--bench")) {
    local iterations = parse_arg_int("--iterations=", 2000)
    bench_one("direct_call", iterations * 20, direct_call_kernel)
    bench_one("branch_call", iterations * 20, branch_call_kernel)
    bench_one("float_call", iterations * 20, float_call_kernel)
    bench_one("numeric_loop", iterations * 20, numeric_loop_kernel)
    bench_one("vector", iterations, vector_kernel)
    bench_one("dynamic_member", iterations, dynamic_member_kernel)
    bench_one("dynamic_key_get_set", iterations, dynamic_key_get_set_kernel)
    bench_one("object_member_write_fallback", iterations,
        object_member_write_fallback_kernel)
    bench_one("array_append", iterations, array_append_kernel)
    bench_one("array_write", iterations, array_write_kernel)
    bench_one("array_read", iterations * 20, array_read_kernel)
    bench_one("array_float", iterations * 20, array_float_kernel)
    bench_one("math_intrinsic", iterations, math_intrinsic_kernel)
    bench_one("math_variable", iterations, math_variable_kernel)
    bench_one("matrix", iterations, matrix_kernel)
}
else {
    print("test_jit_perf_correctness.nut passed\n")
}
