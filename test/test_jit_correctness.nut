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

function integer_neg_kernel(x) {
    return -x
}

function float_neg_kernel(x) {
    return -x
}

function loop_neg_kernel(n) {
    local x = 1
    for (local i = 0; i < n; i++) {
        x = -x + i
    }
    return x
}

function counted_loop_kernel(n) {
    local total = 0
    for (local i = 0; i < n; i++) {
        total += i * 3 + 1
    }
    return total
}

function compiler_optimizer_kernel(x) {
    local neg = -x
    local kind = typeof neg
    if (kind == "integer") {
        return neg
    }
    return 0
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

function array_len_method_kernel(values) {
    return values.len()
}

function fresh_array_push_append_kernel(a, b, c) {
    local values = []
    values.push(a)
    values.append(b)
    values.push(c)
    return values.len()
}

function fresh_array_push_loop_len_kernel(n) {
    local values = []
    for (local i = 0; i < n; i++) {
        values.push(i % 17)
    }
    return values.len()
}

function array_set_get_kernel(n) {
    local values = [0, 0, 0, 0, 0]
    for (local i = 0; i < n; i++) {
        values[i % 5] = values[i % 5] + i * 2 + 1
    }
    return values[0] * 3 + values[1] * 5 + values[2] * 7 + values[3] * 11 + values[4] * 13
}

function array_len_bound_sum_kernel(values) {
    local sum = 0
    for (local i = 0; i < values.len(); i++) {
        sum = sum + values[i]
    }
    return sum
}

function array_len_bound_set_kernel(values) {
    for (local i = 0; i < values.len(); i++) {
        values[i] = values[i] + i
    }
    return values[0] + values[1] * 3 + values[2] * 5 + values[3] * 7
}

function array_len_bound_append_kernel(values) {
    local seen = 0
    for (local i = 0; i < values.len(); i++) {
        seen++
        if (i == 0) values.append(99)
    }
    return seen
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

function array_literal_constant_mix() {
    return [7, 2.5, true, "jit"]
}

function array_literal_stack_mix(a, b, c) {
    return [a, b, c]
}

function table_literal_constant_mix() {
    return { a = 7, b = 2.5, c = true, d = "jit" }
}

function table_literal_stack_mix(a, b, c) {
    return { a = a, b = b, c = c }
}

function table_member_cache_loop_kernel(tbl, n) {
    local total = 0
    for (local i = 0; i < n; i++) {
        total += tbl.value
    }
    return total
}

function table_member_cache_mutation_kernel() {
    local tbl = { value = 1 }
    local first = tbl.value
    tbl.value = 5
    local second = tbl.value
    return first * 10 + second
}

function direct_field_setter(point, x, y, z) {
    point.x = x
    point.y = y
    point.z = z
}

function array_const_setter(holder, x, y) {
    holder.values[0] = x
    holder.values[1] = y
}

function array_dynamic_setter(holder, i, x) {
    holder.values[i] = x
    return i
}

class IndexedBox {
    values = null

    constructor(values) {
        this.values = values
    }

    function _get(i) {
        if (typeof i == "integer") return this.values[i]
        throw null
    }

    function _set(i, value) {
        if (typeof i == "integer") {
            this.values[i] = value
            return value
        }
        throw null
    }
}

class StaticRootAccess {
    static SCALE = 3
    value = 0

    constructor(value) {
        this.value = value
    }

    function sum(n) {
        local total = 0
        for (local i = 0; i < n; i++) {
            total += StaticRootAccess.SCALE + this.value
        }
        return total
    }
}

class InlineMemberBox {
    values = null

    constructor(values) {
        this.values = values
    }

    function get(i) {
        return this.values[i]
    }
}

class FullProtoMemberBox {
    value = 0
    nested = null

    constructor(value, nested) {
        this.value = value
        this.nested = nested
    }

    function sum(extra) {
        return this.value + this.nested.bias + this.nested.deep.scale + extra
    }
}

class StableShapeBox {
    x = 0.0
    y = 0

    constructor(x, y) {
        this.x = x
        this.y = y
    }

    function weighted(n) {
        local total = 0.0
        for (local i = 0; i < n; i++) {
            total += this.x + this.y
        }
        return total
    }
}

class StableShapeGuardBox {
    value = 0

    constructor(value) {
        this.value = value
    }

    function plus_one() {
        return this.value + 1
    }
}

class StableShapeWriteBox {
    value = 0.0
    bad = 0

    constructor(value, bad = 0) {
        this.value = value
        this.bad = bad
    }

    function write_float(value) {
        this.value = value
        return this.value
    }

    function write_then_guard(value) {
        this.value = value
        return this.bad + 1
    }
}

class BoolWriteBox {
    enabled = true
    values = null

    constructor() {
        this.values = [true]
    }

    function disable() {
        this.enabled = false
        return this.enabled
    }

    function enable() {
        this.enabled = true
        return this.enabled
    }

    function set_first(value) {
        this.values[0] = value
        return this.values[0]
    }
}

class ArrayFieldCtorBox {
    values = null

    constructor(a = null, b = null, c = null, d = null) {
        if (typeof a == "array") {
            this.values = []
            foreach (v in a) this.values.append(v)
        }
        else if (a == null) {
            this.values = [0.0, 0.0, 0.0]
        }
        else if (b == null) {
            this.values = [a]
        }
        else if (c == null) {
            this.values = [a, b]
        }
        else if (d == null) {
            this.values = [a, b, c]
        }
        else {
            this.values = [a, b, c, d]
        }
    }
}

function array_field_constructor_kernel(n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        local x = i * 1.0
        local values = ArrayFieldCtorBox(x, x + 1.0, x + 2.0)
        local copied = ArrayFieldCtorBox(values.values)
        total += copied.values[0] + copied.values[1] + copied.values[2]
    }

    local defaults = ArrayFieldCtorBox()
    local one = ArrayFieldCtorBox(7.0)
    return total + defaults.values[0] + defaults.values[1] +
        defaults.values[2] + one.values[0]
}

function array_field_constructor_clone_kernel() {
    local source = [1, 2, 3]
    local copied = ArrayFieldCtorBox(source)
    source[0] = 99
    return copied.values[0] + copied.values.len() * 10
}

function array_field_constructor_null_kernel() {
    local values = ArrayFieldCtorBox(null)
    return values.values.len()
}

FullProtoRootTable <- {
    scale = 5,
    nested = {
        bias = 6
    }
}

function full_proto_root_member_sum(extra) {
    return FullProtoRootTable.scale + FullProtoRootTable.nested.bias + extra
}

class InlineMutationBox {
    values = null
    value = 0
    bad = 0

    constructor(values, bad = 0) {
        this.values = values
        this.bad = bad
    }

    function set_index(i, value) {
        this.values[i] = value
        return i
    }

    function set_value(value) {
        this.value = value
        return value
    }

    function set_first(value) {
        this.values[0] = value
        return value
    }
}

function inline_mutation_call_kernel(n) {
    local box = InlineMutationBox([0, 0, 0])
    local total = 0
    for (local i = 0; i < n; i++) {
        total += box.set_index(i % 3, i)
        total += box.set_value(i)
    }
    return total + box.value + box.values[0] + box.values[1] + box.values[2]
}

function inline_mutation_write_then_late_guard(box, n) {
    local out = 0
    for (local i = 0; i < n; i++) {
        box.set_first(box.values[0] + 1)
        out = box.bad + 1
    }
    return out
}

function inline_bool_mutation_kernel(n) {
    local box = BoolWriteBox()
    for (local i = 0; i < n; i++) {
        box.enable()
        box.set_first(true)
        box.disable()
        box.set_first(false)
    }
    return (box.enabled == false && box.values[0] == false &&
        typeof box.enabled == "bool" && typeof box.values[0] == "bool") ? 1 : 0
}

function inline_member_call_kernel(n) {
    local box = InlineMemberBox([1, 2, 3])
    local total = 0
    for (local i = 0; i < n; i++) {
        total += box.get(i % 3)
    }
    return total
}

function inline_min_helper(a, b) {
    return a < b ? a : b
}

function numeric_abs_helper(x) {
    return x < 0 ? -x : x
}

function numeric_max_helper(a, b) {
    return a > b ? a : b
}

function numeric_clamp_helper(x, lo, hi) {
    return x < lo ? lo : (x > hi ? hi : x)
}

function numeric_select_helper_kernel(n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        total += numeric_abs_helper((i % 5) - 2)
        total += inline_min_helper(i * 0.5, 3.25)
        total += numeric_max_helper(i - 4, 1.5)
        total += numeric_clamp_helper(i - 3, -1.5, 2.5)
    }
    return total
}

function inline_conditional_call_kernel(n) {
    local total = 0
    for (local i = 0; i < n; i++) {
        total += inline_min_helper(i % 7, 3)
    }
    return total
}

function number_tofloat_call_kernel(n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        total += (i % 5).tofloat()
    }
    return total
}

function array_compound_arith_kernel(values, n) {
    for (local i = 0; i < n; i++) {
        values[i % values.len()] *= 2.0
    }
    return values[0] + values[1]
}

function mixed_numeric_array_float_mul_kernel(values, scalar, n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        total += values[i % values.len()] * scalar
    }
    return total
}

function math_native_call_kernel(n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        total += sin(0.0) + cos(0.0) + sqrt(4.0) + atan2(0.0, 1.0)
        total += pow(2.0, 3.0) + floor(1.75) + ceil(1.25) + fabs(-3.5)
    }
    return total
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
check(integer_neg_kernel(17) == -17, "integer unary neg")
approx(float_neg_kernel(2.5), -2.5, 0.0001, "float unary neg")
check(loop_neg_kernel(25) == 11, "loop unary neg")
check(counted_loop_kernel(0) == 0, "counted loop zero trips")
check(counted_loop_kernel(1) == 1, "counted loop one trip")
check(counted_loop_kernel(2) == 5, "counted loop even trips")
check(counted_loop_kernel(17) == 425, "counted loop odd trips")
check(compiler_optimizer_kernel(9) == -9, "compiler optimizer move forwarding")
check(array_append_sum_kernel(1000) == 916, "array append/sum")
check(array_len_method_kernel([1, 2, 3, 4]) == 4,
    "array len method specialization")
check(fresh_array_push_append_kernel(3, 4.5, "ok") == 3,
    "fresh array push/append specialization")
check(fresh_array_push_loop_len_kernel(25) == 25,
    "fresh array push loop len specialization")
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
local constant_mix = array_literal_constant_mix()
check(constant_mix[0] == 7 && constant_mix[2] == true && constant_mix[3] == "jit",
    "array literal constant return specialization")
approx(constant_mix[1], 2.5, 0.0001,
    "array literal float constant return specialization")
local stack_mix = array_literal_stack_mix(3, 4.5, "ok")
check(stack_mix[0] == 3 && stack_mix[2] == "ok",
    "array literal stack return specialization")
approx(stack_mix[1], 4.5, 0.0001,
    "array literal stack float return specialization")
local constant_table = table_literal_constant_mix()
check(constant_table.a == 7 && constant_table.c == true && constant_table.d == "jit",
    "table literal constant return specialization")
approx(constant_table.b, 2.5, 0.0001,
    "table literal float constant return specialization")
local stack_table = table_literal_stack_mix(3, 4.5, "ok")
check(stack_table.a == 3 && stack_table.c == "ok",
    "table literal stack return specialization")
approx(stack_table.b, 4.5, 0.0001,
    "table literal stack float return specialization")
check(table_member_cache_loop_kernel({ value = 7 }, 11) == 77,
    "table member cache loop lookup")
check(table_member_cache_mutation_kernel() == 15,
    "table member cache invalidates on mutation")
local setter_point = { x = 0, y = 0, z = 0 }
direct_field_setter(setter_point, 3, 5, 7)
check(setter_point.x == 3 && setter_point.y == 5 && setter_point.z == 7,
    "direct field setter specialization")
local setter_holder = { values = [0.0, 0.0, 0.0] }
array_const_setter(setter_holder, 1.25, 2.5)
approx(setter_holder.values[0], 1.25, 0.0001,
    "const array setter specialization first value")
approx(setter_holder.values[1], 2.5, 0.0001,
    "const array setter specialization second value")
check(array_dynamic_setter(setter_holder, 2, 4.0) == 2,
    "dynamic array setter specialization return value")
approx(setter_holder.values[2], 4.0, 0.0001,
    "dynamic array setter specialization side effect")
check(array_len_bound_sum_kernel([1, 2, 3, 4]) == 10,
    "loop array len bound sum specialization")
local len_bound_set_values = [1, 2, 3, 4]
check(array_len_bound_set_kernel(len_bound_set_values) == 84,
    "loop array len bound set specialization result")
check(len_bound_set_values[0] == 1 && len_bound_set_values[1] == 3 &&
    len_bound_set_values[2] == 5 && len_bound_set_values[3] == 7,
    "loop array len bound set side effects")
check(array_len_bound_append_kernel([1]) == 2,
    "loop array len bound skips hoist when body changes length")
local indexed_box = IndexedBox([10, 20, 30])
check(indexed_box[1] == 20,
    "guarded indexed getter specialization")
indexed_box[2] = 44
check(indexed_box.values[2] == 44,
    "guarded indexed setter specialization")
local indexed_box_threw = false
try {
    local bad_index = indexed_box["bad"]
} catch (e) {
    indexed_box_threw = true
}
check(indexed_box_threw,
    "guarded indexed getter fallback throws")
check(StaticRootAccess(4).sum(100) == 700,
    "loop root/static member read specialization")
local full_proto_box = FullProtoMemberBox(4, { bias = 7, deep = { scale = 8 } })
check(full_proto_box.sum(1) == 20,
    "full-proto member read warmup")
check(full_proto_box.sum(2) == 21,
    "full-proto member read specialization")
local stable_shape_box = StableShapeBox(1.5, 2)
approx(stable_shape_box.weighted(3), 10.5, 0.0001,
    "stable instance field read warmup")
approx(stable_shape_box.weighted(4), 14.0, 0.0001,
    "stable instance field read specialization")
local stable_shape_guard_box = StableShapeGuardBox(5)
check(stable_shape_guard_box.plus_one() == 6,
    "stable instance field guard warmup")
stable_shape_guard_box.value = "x"
check(stable_shape_guard_box.plus_one() == "x1",
    "stable instance field guard fallback after type change")
local stable_shape_write_box = StableShapeWriteBox(0.0)
approx(stable_shape_write_box.write_float(2.5), 2.5, 0.0001,
    "stable instance field write warmup result")
approx(stable_shape_write_box.value, 2.5, 0.0001,
    "stable instance field write warmup side effect")
approx(stable_shape_write_box.write_float(3.75), 3.75, 0.0001,
    "stable instance field write specialization result")
approx(stable_shape_write_box.value, 3.75, 0.0001,
    "stable instance field write specialization side effect")
local stable_shape_write_ok = StableShapeWriteBox(0.0, 10)
check(stable_shape_write_ok.write_then_guard(1.25) == 11,
    "stable instance field write before late guard warmup")
approx(stable_shape_write_ok.value, 1.25, 0.0001,
    "stable instance field write before late guard side effect")
local stable_shape_write_bad = StableShapeWriteBox(0.0, "x")
check(stable_shape_write_bad.write_then_guard(4.5) == "x1",
    "stable instance field write fallback result")
approx(stable_shape_write_bad.value, 4.5, 0.0001,
    "stable instance field write fallback rolls back before replay")
local bool_write_box = BoolWriteBox()
check(bool_write_box.disable() == false && bool_write_box.enabled == false &&
    typeof bool_write_box.enabled == "bool",
    "bool instance field write preserves false")
check(bool_write_box.enable() == true && bool_write_box.enabled == true &&
    typeof bool_write_box.enabled == "bool",
    "bool instance field write preserves true")
check(bool_write_box.set_first(false) == false &&
    bool_write_box.values[0] == false &&
    typeof bool_write_box.values[0] == "bool",
    "bool array write preserves false")
check(bool_write_box.set_first(true) == true &&
    bool_write_box.values[0] == true &&
    typeof bool_write_box.values[0] == "bool",
    "bool array write preserves true")
check(full_proto_root_member_sum(3) == 14,
    "full-proto root member read warmup")
check(full_proto_root_member_sum(4) == 15,
    "full-proto root member read specialization")
check(inline_mutation_call_kernel(9) == 74,
    "loop inlined side-effecting method specialization")
local inline_mutation_ok = InlineMutationBox([0], 10)
check(inline_mutation_write_then_late_guard(inline_mutation_ok, 1) == 11 &&
    inline_mutation_ok.values[0] == 1,
    "loop inlined side-effecting method warmup")
local inline_mutation_bad = InlineMutationBox([0], "x")
check(inline_mutation_write_then_late_guard(inline_mutation_bad, 1) == "x1",
    "loop inlined side-effecting method fallback result")
check(inline_mutation_bad.values[0] == 1,
    "loop inlined side-effecting method rolls back before replay")
check(inline_bool_mutation_kernel(4) == 1,
    "loop inlined bool side-effecting method specialization")
approx(array_field_constructor_kernel(20), 637.0, 0.0001,
    "array-field constructor fast path warmup")
check(array_field_constructor_clone_kernel() == 31,
    "array-field constructor fast path clones array input")
check(array_field_constructor_null_kernel() == 3,
    "array-field constructor fast path falls back for explicit null")
check(inline_member_call_kernel(120) == 240,
    "loop inlined member accessor specialization")
check(inline_conditional_call_kernel(20) == 42,
    "loop inlined conditional helper specialization")
approx(numeric_select_helper_kernel(20), 238.75, 0.0001,
    "numeric conditional-select helper specialization")
approx(number_tofloat_call_kernel(20), 40.0, 0.0001,
    "loop numeric default delegate conversion specialization")
local compound_values = [1.0, 2.0]
approx(array_compound_arith_kernel(compound_values, 4), 12.0, 0.0001,
    "loop compound array arithmetic specialization")
approx(compound_values[0], 4.0, 0.0001,
    "loop compound array arithmetic first side effect")
approx(compound_values[1], 8.0, 0.0001,
    "loop compound array arithmetic second side effect")
approx(mixed_numeric_array_float_mul_kernel([1, 2.5, 3, 4.5], 2.0, 20),
    110.0, 0.0001,
    "loop mixed numeric array float multiply specialization")
approx(math_native_call_kernel(20), 350.0, 0.0001,
    "loop native math call specialization")

print("test_jit_correctness.nut passed\n")
