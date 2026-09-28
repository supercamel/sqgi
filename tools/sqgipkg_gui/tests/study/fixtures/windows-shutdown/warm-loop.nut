function sum(n) {
    local value = 0
    for (local i = 0; i < n; i++) value += i
    return value
}
for (local i = 0; i < 100; i++)
    if (sum(100) != 4950) throw "incorrect loop result"
print("SCRIPT COMPLETE warm-loop\n")
