// Exercises hot functions with JIT enabled. Integer-only counted loops and tiny
// unary integer kernels are expected to run as native code today; the other
// cases verify that non-native hot functions still fall back to the normal VM
// with unchanged semantics.

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

function inc_loop_kernel(n) {
    local x = 0
    for (local i = 0; i < n; i++) {
        x = inc_kernel(x)
    }
    return x
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

function numeric_variant_kernel(n) {
    local x = 3
    for (local i = 0; i < n; i++) {
        x = (x + (i % 13) * 5 + 11) % 1009
    }
    return x
}

function wrapped_empty_loop_kernel(n) {
    local bias = 25
    local x = 0
    for (local i = 0; i < n; i++) {
        x = i
    }
    return x + bias
}

function wrapped_numeric_kernel(n) {
    local bias = 17
    local x = 0
    for (local i = 0; i < n; i++) {
        x = (x + (i % 997) * 31 + 7) % 1000000007
    }
    return x + bias
}

function wrapped_numeric_variant_kernel(n) {
    local bias = 29
    local x = 3
    for (local i = 0; i < n; i++) {
        x = (x + (i % 13) * 5 + 11) % 1009
    }
    return x + bias
}

function loop_region_marker(x) {
    return x
}

function mixed_loop_region_kernel(n) {
    local x = loop_region_marker(5)
    for (local i = 0; i < n; i++) {
        x = (x + (i % 997) * 31 + 7) % 1000000007
    }
    return loop_region_marker(x)
}

function mixed_array_set_region_kernel(n) {
    local values = loop_region_marker([0, 0, 0, 0])
    for (local i = 0; i < n; i++) {
        values[i % 4] = values[i % 4] + i
    }
    return loop_region_marker(values[0] * 3 + values[1] * 5 + values[2] * 7 + values[3] * 11)
}

function mixed_array_float_set_region_kernel(n, x) {
    local values = loop_region_marker([0.0, 0.0])
    for (local i = 0; i < n; i++) {
        values[i % 2] = x
    }
    return loop_region_marker(values[0] + values[1])
}

function mixed_table_set_region_kernel(n) {
    local point = loop_region_marker({ x = 0, y = 0 })
    for (local i = 0; i < n; i++) {
        point.x = i
        point.y = i + 1
    }
    return loop_region_marker(point.x * 3 + point.y)
}

function mixed_table_float_set_region_kernel(n, x) {
    local point = loop_region_marker({ x = 0.0, y = 0.0 })
    for (local i = 0; i < n; i++) {
        point.x = x
        point.y = x
    }
    return loop_region_marker(point.x + point.y)
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

function equality_branch_kernel(n) {
    local x = 0
    local y = 1
    for (local i = 0; i < n; i++) {
        if ((i % 5) == 0) {
            x = (x + i * 7 + y) % 1000003
        }
        else if ((i % 3) != 0) {
            y = (y + x - i) % 1000003
        }
        else {
            x = (x + 13) % 1000003
            y = (y + 17) % 1000003
        }
    }
    return (x * 3 + y * 5) % 1000003
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

function float_return_kernel(x, y, z) {
    return x * 1.5 + y / 2.0 - z * 0.25
}

function float_array_dot_kernel(a, b) {
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

function transform_point_kernel(m, p) {
    return [
        m[0] * p[0] + m[1] * p[1] + m[2] * p[2] + m[3],
        m[4] * p[0] + m[5] * p[1] + m[6] * p[2] + m[7],
        m[8] * p[0] + m[9] * p[1] + m[10] * p[2] + m[11]
    ]
}

function cross3_kernel(a, b) {
    return [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0]
    ]
}

function square_kernel(x) {
    return x * x
}

function multi_arg_kernel(a, b, c) {
    return (a * 3 + b * 5 - c * 7) % 1009
}

function guarded_add_kernel(a, b) {
    return a + b
}

function array_read3_kernel(values) {
    return values[0] * 3 + values[1] * 5 + values[2] * 7
}

function table_point_kernel(point) {
    return point.x * 3 + point.y * 5 - point.z * 7
}

function array_mutate_param_kernel(values, n) {
    for (local i = 0; i < n; i++) {
        values[i % 4] = values[i % 4] + i
    }
    return values[0] * 3 + values[1] * 5 + values[2] * 7 + values[3] * 11
}

function table_mutate_point_kernel(point, dx, dy) {
    point.x = point.x + dx
    point.y = point.y + dy
    point.z = point.x * point.y - point.z
    return point.x * 3 + point.y * 5 - point.z * 7
}

function array_mutate_float_kernel(values, dx) {
    values[0] = values[0] + dx
    values[1] = values[1] * 2.0
    return values[0] * 3.0 + values[1] * 5.0
}

function table_mutate_float_kernel(point, dx) {
    point.x = point.x + dx
    point.y = point.y * 2.0
    return point.x * 3.0 + point.y * 5.0
}

function array_call_kernel(n) {
    local values = [1, 2, 3, 4]
    local sum = 0
    for (local i = 0; i < n; i++) {
        sum = sum + square_kernel(values[i % 4])
    }
    return sum
}

function array_push_sum_kernel(n) {
    local values = []
    for (local i = 0; i < n; i++) {
        values.push(i % 251)
    }
    local sum = 0
    for (local i = n - 1; i >= 0; i--) {
        sum = (sum + values[i]) % 1000000007
    }
    return sum
}

function mixed_array_read_region_kernel(n) {
    local values = []
    for (local i = 0; i < n; i++) {
        values.push(i % 251)
    }
    local sum = 0
    for (local i = n - 1; i >= 0; i--) {
        sum = (sum + values[i]) % 1000000007
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
check(inc_loop_kernel(10000) == 10000, "inc loop kernel")
check(empty_loop_kernel(10000) == 9999, "empty loop kernel")
check(numeric_kernel(10000) == 154000345, "numeric kernel")
check(numeric_variant_kernel(10000) == 274, "numeric variant kernel")
check(wrapped_empty_loop_kernel(10000) == 10024, "wrapped empty loop kernel")
check(wrapped_numeric_kernel(10000) == 154000362, "wrapped numeric kernel")
check(wrapped_numeric_variant_kernel(10000) == 303, "wrapped numeric variant kernel")
check(mixed_loop_region_kernel(10000) == 154000350, "mixed function loop-region kernel")
check(mixed_array_set_region_kernel(100) == 32500, "mixed array set loop-region kernel")
approx(mixed_array_float_set_region_kernel(5, 1.25), 2.5, 0.0001,
    "mixed array float set loop-region kernel")
check(mixed_table_set_region_kernel(100) == 397, "mixed table set loop-region kernel")
approx(mixed_table_float_set_region_kernel(5, 1.25), 2.5, 0.0001,
    "mixed table float set loop-region kernel")
check(branch_kernel(20000) == 1004999480001, "branch kernel")
check(equality_branch_kernel(20000) == 11624, "equality branch kernel")
approx(float_geometry_kernel(1000), 25716.453125, 0.01, "float geometry kernel")
approx(float_return_kernel(2.0, 4.0, 1.0), 4.75, 0.0001, "native float return kernel")
approx(float_array_dot_kernel([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]), 32.0, 0.0001, "native float array dot kernel")
local transformed = transform_point_kernel([
    1.125, -0.250, 0.375, 3.500,
    0.500, 0.875, -0.125, -2.250,
    -0.375, 0.625, 1.250, 1.750
], [1.0, 2.0, -3.0])
approx(transformed[0], 3.000, 0.0001, "native transform x")
approx(transformed[1], 0.375, 0.0001, "native transform y")
approx(transformed[2], -1.125, 0.0001, "native transform z")
local crossed = cross3_kernel([3.0, 0.375, -1.125], [0.25, -0.75, 1.5])
approx(crossed[0], -0.28125, 0.0001, "native cross x")
approx(crossed[1], -4.78125, 0.0001, "native cross y")
approx(crossed[2], -2.34375, 0.0001, "native cross z")
check(multi_arg_kernel(17, 23, 5) == 131, "multi-arg native integer kernel")
check(guarded_add_kernel(20, 22) == 42, "guarded add integer path")
check(guarded_add_kernel("sq", "gi") == "sqgi", "guarded add fallback string path")
check(array_read3_kernel([11, 13, 17]) == 217, "flat array native read kernel")
check(table_point_kernel({ x = 11, y = 13, z = 17 }) == -21, "table point native read kernel")
local mutate_values = [0, 0, 0, 0]
check(array_mutate_param_kernel(mutate_values, 100) == 32500, "array native write kernel")
check(mutate_values[0] == 1200 && mutate_values[3] == 1275, "array write side effects")
local mutate_point = { x = 11, y = 13, z = 17 }
check(table_mutate_point_kernel(mutate_point, 2, 3) == -1218, "table native write kernel")
check(mutate_point.x == 13 && mutate_point.y == 16 && mutate_point.z == 191, "table write side effects")
local mutate_float_values = [1.0, 2.0]
approx(array_mutate_float_kernel(mutate_float_values, 1.5), 27.5, 0.0001,
    "array native float write kernel")
approx(mutate_float_values[0], 2.5, 0.0001, "array float write first side effect")
approx(mutate_float_values[1], 4.0, 0.0001, "array float write second side effect")
local mutate_float_point = { x = 1.0, y = 2.0 }
approx(table_mutate_float_kernel(mutate_float_point, 1.5), 27.5, 0.0001,
    "table native float write kernel")
approx(mutate_float_point.x, 2.5, 0.0001, "table float write x side effect")
approx(mutate_float_point.y, 4.0, 0.0001, "table float write y side effect")
check(array_call_kernel(1000) == 7500, "array call kernel")
check(array_push_sum_kernel(1000) == 124506, "array push sum kernel")
check(mixed_array_read_region_kernel(1000) == 124506, "mixed array read loop-region kernel")
check(array_set_kernel(100) == 32500, "array set kernel")

print("test_jit_fastpath.nut passed\n")
