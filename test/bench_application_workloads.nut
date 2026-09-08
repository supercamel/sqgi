// Independent application-component workloads. Exclude this file from PGO training.
local GLib = import("GLib")
function option_int(prefix, fallback) {
    foreach (arg in vargv) if (arg.find(prefix) == 0) return arg.slice(prefix.len()).tointeger()
    return fallback
}
function make_inputs(seed) {
    local codes = [], words = [], next = [], weights = []
    for (local i = 0; i < 4096; i++) {
        codes.append((i * 73 + seed * 19) % 1024)
        words.append("word_" + ((i * 37 + seed) % 257))
        next.append((i * 109 + 89 + seed * 2) % 4096)
        weights.append((i * 31 + seed) % 997)
    }
    return { codes = codes, words = words, next = next, weights = weights, seed = seed }
}
function route_step(acc, code, threshold) {
    local delta = 0
    if (code < threshold) delta = code * 3 + 11
    else delta = code * 7 + 23
    return (acc + delta) % 1000003
}
function route_events(n, data, threshold) {
    local codes = data.codes, size = codes.len(), acc = 17
    for (local i = 0; i < n; i++) acc = route_step(acc, codes[i % size], threshold)
    return acc
}
function route_balanced(n, data) { return route_events(n, data, 512) }
function route_skewed(n, data) { return route_events(n, data, 1000) }
function price_event(price, quantity, category, cap) {
    price = price * quantity
    if (quantity == 0) return 0
    if (category < 2) return price + 17
    if (price > cap) price = cap
    return price + category * 3
}
function pricing_events(n, data) {
    local codes = data.codes, size = codes.len(), sum = 0
    for (local i = 0; i < n; i++) {
        local code = codes[i % size], price = code + 19, quantity = i % 11
        sum = (sum + price_event(price, quantity, code % 7, 4000) + price + quantity) % 1000003
    }
    return sum
}
function filter_step(previous, sample, mode) {
    if (mode < 3) return previous * 0.75 + sample * 0.25
    return previous * 0.5 + sample * 0.5
}
function filter_stream(n, data) {
    local codes = data.codes, size = codes.len(), value = 0.5, sum = 0.0
    for (local i = 0; i < n; i++) {
        value = filter_step(value, codes[i % size], i % 5)
        sum += value * 0.0001
    }
    return sum + value
}
function record_updates(n, data, size) {
    local records = []
    for (local i = 0; i < size; i++) {
        // Alternate insertion order while retaining the same logical fields.
        if (i % 2 == 0) records.append({ balance = i % 97, count = 0, weight = i % 7 + 1 })
        else records.append({ weight = i % 7 + 1, count = 0, balance = i % 97 })
    }
    local sum = 0, seed = data.seed
    for (local i = 0; i < n; i++) {
        local row = records[(i * 73 + seed) % size]
        row.balance = (row.balance + i % 31 + row.weight) % 1009
        row.count += 1
        sum = (sum + row.balance * row.weight + row.count) % 1000003
    }
    return sum
}
function records_64(n, data) { return record_updates(n, data, 64) }
function records_4096(n, data) { return record_updates(n, data, 4096) }
function word_count(n, data) {
    local words = data.words, size = words.len(), counts = {}, sum = 0
    for (local i = 0; i < n; i++) {
        local key = words[i % size]
        if (key in counts) counts[key] += 1
        else counts[key] <- 1
        sum = (sum + counts[key] * key.len()) % 1000003
    }
    return sum
}
function graph_walk(n, data) {
    local next = data.next, weights = data.weights, cursor = data.seed % 4096, sum = 0
    for (local i = 0; i < n; i++) {
        cursor = next[cursor]
        sum = (sum + weights[cursor]) % 1000003
    }
    return sum + cursor
}
local iterations = option_int("--iterations=", 200000)
local warmups = option_int("--warmups=", 5)
local seed = option_int("--seed=", 17)
local data = make_inputs(seed)
local cases = [
    ["route_balanced", route_balanced], ["route_skewed", route_skewed],
    ["pricing_events", pricing_events], ["filter_stream", filter_stream],
    ["records_64", records_64], ["records_4096", records_4096],
    ["word_count", word_count], ["graph_walk", graph_walk]
]
foreach (item in cases) {
    local warm = null
    for (local w = 0; w < warmups; w++) warm = item[1](iterations, data)
    local start = GLib.get_monotonic_time()
    local checksum = item[1](iterations, data)
    local elapsed = GLib.get_monotonic_time() - start
    if (warmups > 0 && checksum != warm) throw "[FAIL] unstable application checksum"
    local value = typeof checksum == "float" ? format("%.17g", checksum) : checksum.tostring()
    print(format("BENCH\t%s\t%d\t%.9f\t%s\n", item[0], iterations,
        elapsed.tofloat() / iterations, value))
}
