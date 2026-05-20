// Exercises the executable baseline JIT tier with bytecode shapes used by
// numerical kernels: simple calls, counted loops, integer arithmetic, float
// arithmetic, comparisons, and branches.

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

function absf(x) {
    return x < 0.0 ? -x : x
}

function approx(actual, expected, epsilon, label) {
    if (absf(actual - expected) > epsilon) {
        throw format("[FAIL] %s got %.9f expected %.9f", label, actual, expected)
    }
}

function inc_kernel(x) {
    return x + 1
}

function empty_loop_kernel(n) {
    local x = 0
    for (local i = 0; i < n; i++) {
        x = i
    }
    return x
}

function numeric_kernel(n) {
    local x = 0
    for (local i = 0; i < n; i++) {
        x = (x + (i % 997) * 31 + 7) % 1000000007
    }
    return x
}

function branch_kernel(n) {
    local x = 0
    local y = 1
    for (local i = 0; i < n; i++) {
        if ((i % 2) < 1) {
            x = x + i * 3
        }
        else {
            y = y + x - i
        }
    }
    return x * 17 + y
}

function float_geometry_kernel(n) {
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

function square_kernel(x) {
    return x * x
}

function array_call_kernel(n) {
    local values = [1, 2, 3, 4]
    local sum = 0
    for (local i = 0; i < n; i++) {
        sum = sum + square_kernel(values[i % 4])
    }
    return sum
}

function array_set_kernel(n) {
    local values = [0, 0, 0, 0]
    for (local i = 0; i < n; i++) {
        values[i % 4] = values[i % 4] + i
    }
    return values[0] * 3 + values[1] * 5 + values[2] * 7 + values[3] * 11
}

check(inc_kernel(41) == 42, "inc kernel")
check(empty_loop_kernel(10000) == 9999, "empty loop kernel")
check(numeric_kernel(10000) == 154000345, "numeric kernel")
check(branch_kernel(20000) == 1004999480001, "branch kernel")
approx(float_geometry_kernel(1000), 25716.453125, 0.01, "float geometry kernel")
check(array_call_kernel(1000) == 7500, "array call kernel")
check(array_set_kernel(100) == 32500, "array set kernel")

print("test_jit_fastpath.nut passed\n")
