function sum_by_index(values, n) {
    local total = 0
    for (local i = 0; i < n; i++) total += values[i]
    return total
}
for (local pass = 0; pass < 10; pass++) {
    if (sum_by_index([10, 20, 30], 3) != 60)
        throw "JIT treated a changing array index as constant"
    if (sum_by_index([5, 7, 11, 13], 4) != 36)
        throw "JIT reused a stale loop value"
}
// Forward joins and DMOVE arguments must retain loop-carried scalar values.
function branch_join_step(acc, i) {
    local delta = 0
    if (i % 2 == 0) delta = i % 17
    else delta = 0 - (i % 13)
    return (acc + delta + 97) % 1000003
}
function branch_join_loop(n) {
    local acc = 7
    for (local i = 0; i < n; i++) acc = branch_join_step(acc, i)
    return acc
}

function early_return_step(x) {
    if (x < 0) return 13
    if (x == 0) return 29
    return 41
}
function early_return_loop(n) {
    local sum = 0
    for (local i = 0; i < n; i++) sum += early_return_step(i % 3 - 1)
    return sum
}

function retained_argument_step(x, y, i) {
    x = x + y
    if (i % 2 == 0) x = x * 2
    else x = x + 3
    return x
}
function retained_argument_loop(n) {
    local sum = 0
    for (local i = 0; i < n; i++) {
        local x = i % 7
        local y = i % 5
        sum += retained_argument_step(x, y, i) + x * 11 + y * 13
    }
    return sum
}

function floating_branch_step(x, y, i) {
    if (i % 2 == 0) return x * 0.5 + y
    return x * 0.25 - y
}
function floating_branch_loop(n) {
    local x = 1.25
    for (local i = 0; i < n; i++) x = floating_branch_step(x, i % 5, i)
    return x
}

function boolean_branch_step(flag, x) {
    if (flag) return x + 3
    return x + 7
}
function boolean_branch_loop(n) {
    local sum = 0
    for (local i = 0; i < n; i++) sum += boolean_branch_step(i % 2 == 0, i)
    return sum
}
function toggle_step(flag) {
    if (flag) return false
    return true
}
function boolean_carry_loop(n, flag) {
    for (local i = 0; i < n; i++) flag = toggle_step(flag)
    return flag
}

// Reference accumulation uses foreach, which is outside native loop lowering.
foreach (n in [0, 1, 2, 3, 17, 64, 399, 400]) {
    local join = 7, early = 0, retained = 0, floating = 1.25, boolean = 0
    foreach (i, unused in array(n)) {
        local delta = i % 2 == 0 ? i % 17 : 0 - (i % 13)
        join = (join + delta + 97) % 1000003
        early += i % 3 == 0 ? 13 : (i % 3 == 1 ? 29 : 41)
        local x = i % 7, y = i % 5
        retained += (i % 2 == 0 ? (x + y) * 2 : x + y + 3) + x * 11 + y * 13
        floating = i % 2 == 0 ? floating * 0.5 + i % 5 : floating * 0.25 - i % 5
        boolean += i + (i % 2 == 0 ? 3 : 7)
    }
    for (local pass = 0; pass < 3; pass++) {
        if (branch_join_loop(n) != join) throw "[FAIL] scalar leaf join or loop entry"
        if (early_return_loop(n) != early) throw "[FAIL] multiple scalar returns"
        if (retained_argument_loop(n) != retained) throw "[FAIL] callee mutated caller arguments"
        if (floating_branch_loop(n) != floating) throw "[FAIL] floating leaf branch"
        if (boolean_branch_loop(n) != boolean) throw "[FAIL] boolean leaf argument"
        if (boolean_carry_loop(n, true) != (n % 2 == 0)) throw "[FAIL] boolean loop carry"
        if (boolean_carry_loop(n, false) != (n % 2 != 0)) throw "[FAIL] boolean loop entry guard"
    }
}

// A changed closure must invalidate the inlined target guard.
local original_step = branch_join_step
branch_join_step = function(acc, i) { return acc + 2 }
if (branch_join_loop(40) != 87) throw "[FAIL] stale inlined closure"
branch_join_step = original_step
if (branch_join_loop(400) != 39196) throw "[FAIL] restored inlined closure"

function guarded_divide(x, divisor) {
    if (x < 0) return 19
    return x / divisor
}
function guarded_divide_loop(n, fail_at) {
    local sum = 0
    for (local i = 0; i < n; i++) sum += guarded_divide(i, fail_at - i)
    return sum
}
local caught = false
try { guarded_divide_loop(30, 17) }
catch (e) { caught = e.find("division by zero") != null }
if (!caught) throw "[FAIL] inlined division guard must resume the interpreter"

function guarded_store_loop(state, n, fail_at) {
    local sum = 0
    for (local i = 0; i < n; i++) {
        state.count = state.count + 1
        sum += guarded_divide(i, fail_at - i)
    }
    return sum
}
local state = { count = 0 }
caught = false
try { guarded_store_loop(state, 30, 17) }
catch (e) { caught = e.find("division by zero") != null }
if (!caught || state.count != 18) throw "[FAIL] inlined guard must roll back native writes"

// Dead temporaries may contain references on later invocations even though
// the original native compilation saw null/scalar tags in those VM slots.
function entry_tag_step(x, i) {
    if (i % 2 == 0) return x + i
    return x - i
}
function changing_entry_temporaries(n, old) {
    local sum = 0
    if (old != null) {
        local a = old, b = old, c = old, d = old, e = old, f = old
        if (a != b || c != d || e != f) throw "[FAIL] temporary references"
    }
    for (local i = 0; i < n; i++) sum = entry_tag_step(sum, i)
    return sum
}
for (local pass = 0; pass < 3; pass++)
    if (changing_entry_temporaries(41, null) != 20) throw "[FAIL] entry tag warmup"
local entry_owner = "entry-owner-" + (19382).tostring()
for (local pass = 0; pass < 3; pass++)
    if (changing_entry_temporaries(41, entry_owner) != 20) throw "[FAIL] changed temporary tags"

collectgarbage()
print("test_jit_loop_regressions.nut passed\n")
