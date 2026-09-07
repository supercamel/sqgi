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
collectgarbage()
print("test_jit_loop_regressions.nut passed\n")
