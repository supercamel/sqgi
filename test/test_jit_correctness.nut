// Semantic regression tests for the optional JIT.
//
// This file is intentionally less benchmark-shaped than test_jit_fastpath.nut.
// It checks that JIT-enabled execution preserves math, arrays, calls, branches,
// and return values across normal function bodies, including functions that are
// hot but not eligible for native compilation yet.

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

function absf(x) {
    return x < 0.0 ? -x : x
}

function approx(actual, expected, epsilon, label) {
    if (!(actual == actual) || absf(actual - expected) > epsilon) {
        throw format("[FAIL] %s got %.9f expected %.9f", label, actual, expected)
    }
}

function integer_math_kernel(n) {
    local a = 17
    local b = -23
    local c = 5

    for (local i = 0; i < n; i++) {
        a = (a + i * 3 - b) % 1000003
        if ((i % 4) == 0) {
            b = b - a + c
        }
        else {
            b = b + (a % 97) - i
        }
        c = (c * 7 + a - b) % 65521
    }

    return a * 3 + b * 5 + c * 7
}

function float_math_kernel(n) {
    local x = 1.25
    local y = -2.5
    local z = 0.75

    for (local i = 0; i < n; i++) {
        local t = x * 0.125 + y * -0.25 + z * 0.5
        if (t > x) {
            x = t - y * 0.03125
        }
        else {
            x = t + z * 0.0625
        }
        y = y * -0.125 + x * 0.25
        z = z + x * 0.015625 - y * 0.0078125
    }

    return x + y * 3.0 + z * 7.0
}

function recurrence_kernel(n) {
    local bias = 29
    local x = 3
    for (local i = 0; i < n; i++) {
        x = (x + (i % 13) * 5 + 11) % 1009
    }
    return x + bias
}

function array_append_sum_kernel(n) {
    local values = []
    for (local i = 0; i < n; i++) {
        values.push(i % 17)
    }

    local sum = 0
    for (local i = n - 1; i >= 0; i--) {
        sum = (sum + values[i]) % 1009
    }
    return sum
}

function array_set_get_kernel(n) {
    local values = [0, 0, 0, 0, 0]
    for (local i = 0; i < n; i++) {
        values[i % 5] = values[i % 5] + i * 2 + 1
    }
    return values[0] * 3 + values[1] * 5 + values[2] * 7 + values[3] * 11 + values[4] * 13
}

function return_value_kernel(x) {
    if (x < 0) {
        return -11
    }
    if (x == 0) {
        return 0
    }

    local y = 0
    for (local i = 0; i < x; i++) {
        y = y + (i % 5) * 7 + x
        if (y > 500) {
            return y + 3
        }
    }
    return y - 3
}

function add_one(x) {
    return x + 1
}

function call_return_kernel(n) {
    local x = 0
    for (local i = 0; i < n; i++) {
        x = add_one(x)
    }
    return x
}

function nested_call_kernel(n) {
    return call_return_kernel(n) + return_value_kernel(3)
}

function guarded_write_then_late_guard(values) {
    values[0] = values[0] + 1
    return values[1] + 1
}

function repeated_array_write_then_late_guard(values) {
    values[0] = values[0] + 1
    values[0] = values[0] + 2
    values[2] = values[2] + 3
    return values[1] + 1
}

function table_write_then_late_guard(point) {
    point.x = point.x + 1
    point.y = point.y + 2
    return point.bad + 1
}

function float_array_write_then_late_guard(values) {
    values[0] = values[0] + 1.5
    values[2] = values[2] * 0.5
    return values[1] + 1
}

function float_table_write_then_late_guard(point) {
    point.x = point.x + 1.25
    point.y = point.y * 2.0
    return point.bad + 1
}

function float_array_assignment_result(values, x) {
    return values[0] = x
}

function float_table_assignment_result(point, x) {
    return point.x = x
}

function array_float_sum(values) {
    return values[0] + values[1]
}

function table_float_sum(point) {
    return point.x + point.y
}

local outer_value = 5
function outer_value_plus_one() {
    return outer_value + 1
}

function pair_plus_one(values) {
    return [values[0] + 1, values[1] + 1]
}

function loop_region_marker(x) {
    return x
}

function loop_region_write_then_guard(values, n) {
    loop_region_marker(0)
    for (local i = 0; i < n; i++) {
        values[0] = values[0] + 1
        local late = values[1] + 1
    }
    return loop_region_marker(values[0])
}

function loop_region_float_write_then_guard(values, n, x) {
    loop_region_marker(0)
    for (local i = 0; i < n; i++) {
        values[0] = x
        local late = values[1] + 1
    }
    return loop_region_marker(values[0])
}

check(integer_math_kernel(2000) == 1167537359, "integer math")
approx(float_math_kernel(750), 3185.652832031, 0.0001, "float math")
check(recurrence_kernel(10000) == 303, "integer recurrence")
check(array_append_sum_kernel(1000) == 916, "array append/sum")
check(array_set_get_kernel(64) == 31954, "array set/get")
check(return_value_kernel(-3) == -11, "negative early return")
check(return_value_kernel(0) == 0, "zero early return")
check(return_value_kernel(3) == 27, "fallthrough return")
check(return_value_kernel(20) == 513, "loop early return")
check(call_return_kernel(10000) == 10000, "call return")
check(nested_call_kernel(1234) == 1261, "nested call return")
local write_ok = [0, 10]
check(guarded_write_then_late_guard(write_ok) == 11 && write_ok[0] == 1,
    "guarded write warmup")
local write_bad = [0, "x"]
check(guarded_write_then_late_guard(write_bad) == "x1",
    "guarded write fallback result")
check(write_bad[0] == 1,
    "guarded write fallback does not duplicate side effects")
local repeated_ok = [0, 10, 20]
check(repeated_array_write_then_late_guard(repeated_ok) == 11 &&
    repeated_ok[0] == 3 && repeated_ok[2] == 23,
    "repeated array write warmup")
local repeated_bad = [0, "x", 20]
check(repeated_array_write_then_late_guard(repeated_bad) == "x1",
    "repeated array write fallback result")
check(repeated_bad[0] == 3 && repeated_bad[2] == 23,
    "repeated array write fallback rolls back before replay")
local table_ok = { x = 1, y = 2, bad = 10 }
check(table_write_then_late_guard(table_ok) == 11 &&
    table_ok.x == 2 && table_ok.y == 4,
    "table write warmup")
local table_bad = { x = 1, y = 2, bad = "x" }
check(table_write_then_late_guard(table_bad) == "x1",
    "table write fallback result")
check(table_bad.x == 2 && table_bad.y == 4,
    "table write fallback rolls back before replay")
local float_write_ok = [1.0, 10, 4.0]
check(float_array_write_then_late_guard(float_write_ok) == 11,
    "float array write warmup result")
approx(float_write_ok[0], 2.5, 0.0001,
    "float array write warmup first value")
approx(float_write_ok[2], 2.0, 0.0001,
    "float array write warmup second value")
local float_write_bad = [1.0, "x", 4.0]
check(float_array_write_then_late_guard(float_write_bad) == "x1",
    "float array write fallback result")
approx(float_write_bad[0], 2.5, 0.0001,
    "float array write fallback rolls back first value")
approx(float_write_bad[2], 2.0, 0.0001,
    "float array write fallback rolls back second value")
local float_table_ok = { x = 1.0, y = 4.0, bad = 10 }
check(float_table_write_then_late_guard(float_table_ok) == 11,
    "float table write warmup result")
approx(float_table_ok.x, 2.25, 0.0001,
    "float table write warmup x")
approx(float_table_ok.y, 8.0, 0.0001,
    "float table write warmup y")
local float_table_bad = { x = 1.0, y = 4.0, bad = "x" }
check(float_table_write_then_late_guard(float_table_bad) == "x1",
    "float table write fallback result")
approx(float_table_bad.x, 2.25, 0.0001,
    "float table write fallback rolls back x")
approx(float_table_bad.y, 8.0, 0.0001,
    "float table write fallback rolls back y")
local float_assignment_array = [0.0]
approx(float_array_assignment_result(float_assignment_array, 4.25), 4.25, 0.0001,
    "float array assignment result")
approx(float_assignment_array[0], 4.25, 0.0001,
    "float array assignment side effect")
local float_assignment_table = { x = 0.0 }
approx(float_table_assignment_result(float_assignment_table, 5.5), 5.5, 0.0001,
    "float table assignment result")
approx(float_assignment_table.x, 5.5, 0.0001,
    "float table assignment side effect")
local loop_region_write_ok = [0, 10]
check(loop_region_write_then_guard(loop_region_write_ok, 4) == 4 &&
    loop_region_write_ok[0] == 4,
    "loop-region write warmup")
local loop_region_write_bad = [0, "x"]
check(loop_region_write_then_guard(loop_region_write_bad, 4) == 4 &&
    loop_region_write_bad[0] == 4,
    "loop-region write fallback rolls back before replay")
local loop_region_float_write_ok = [0.0, 10]
approx(loop_region_float_write_then_guard(loop_region_float_write_ok, 4, 2.5), 2.5, 0.0001,
    "loop-region float write warmup result")
approx(loop_region_float_write_ok[0], 2.5, 0.0001,
    "loop-region float write warmup side effect")
local loop_region_float_write_bad = [0.0, "x"]
approx(loop_region_float_write_then_guard(loop_region_float_write_bad, 4, 2.5), 2.5, 0.0001,
    "loop-region float write fallback result")
approx(loop_region_float_write_bad[0], 2.5, 0.0001,
    "loop-region float write fallback rolls back before replay")
approx(array_float_sum([1.5, 2.25]), 3.75, 0.0001,
    "float array specialization warmup")
check(array_float_sum([3, 4]) == 7,
    "float array specialization falls back for integer arrays")
approx(table_float_sum({ x = 1.5, y = 2.25 }), 3.75, 0.0001,
    "float table specialization warmup")
check(table_float_sum({ x = 3, y = 4 }) == 7,
    "float table specialization falls back for integer tables")
check(outer_value_plus_one() == 6,
    "integer outer specialization warmup")
outer_value = 2.5
approx(outer_value_plus_one(), 3.5, 0.0001,
    "outer specialization falls back after type change")
local int_pair = pair_plus_one([3, 4])
check(int_pair[0] == 4 && int_pair[1] == 5,
    "array return specialization warmup")
local float_pair = pair_plus_one([1.5, 2.25])
approx(float_pair[0], 2.5, 0.0001,
    "array return specialization fallback first value")
approx(float_pair[1], 3.25, 0.0001,
    "array return specialization fallback second value")

print("test_jit_correctness.nut passed\n")
