// test/test_json_fuzz.nut
//
// Deterministic fuzzer for sqgi.json.parse and round-trip-stability of
// sqgi.json.stringify. We:
//   1. throw 5000 random byte sequences at parse — none must crash
//   2. round-trip 2000 randomly constructed Squirrel values — they must
//      survive stringify → parse with equal structure/scalars

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

local GLib = import("GLib")
// SQGI_FUZZ_SCALE divides iteration counts (default 1, e.g. 10 under ASan).
local _scale_s = GLib.getenv("SQGI_FUZZ_SCALE")
local SCALE = (_scale_s != null && _scale_s.len() > 0) ? _scale_s.tointeger() : 1
if (SCALE < 1) SCALE = 1

local J = sqgi.json

local state = 0xC0FFEE
function rnd() {
    local x = state
    x = x ^ (x << 13)
    x = x ^ (x >>> 7)
    x = x ^ (x << 17)
    state = x & 0x7fffffff
    return state
}
function rndrange(n) { return rnd() % n }

// ── 1. Random-bytes parse ─────────────────────────────────────────────────
local pool = "{}[],:\"\\0123456789-+.eEtrunNlfase \n\t\r"
local survived = 0
local thrown = 0
for (local i = 0; i < 5000 / SCALE; i++) {
    local n = rndrange(64) + 1
    local s = ""
    for (local k = 0; k < n; k++) {
        s += pool[rndrange(pool.len())].tochar()
    }
    try { J.parse(s); survived++ } catch (e) { thrown++ }
}
check(thrown > 0, "fuzz: at least some inputs must fail to parse")
check(survived + thrown == 5000 / SCALE, "fuzz: total accounted for")

// ── 2. Random value round-trip ───────────────────────────────────────────
function gen_value(depth) {
    if (depth >= 6) {
        // leaf
        switch (rndrange(5)) {
        case 0: return null
        case 1: return rndrange(2) == 0
        case 2: return rnd() - 0x40000000
        case 3: return 1.5 * (rndrange(1000) - 500)
        default: {
            local n = rndrange(12)
            local s = ""
            local chars = "abc\n\"\\xyz"
            for (local i = 0; i < n; i++) s += chars[rndrange(chars.len())].tochar()
            return s
        }
        }
    }
    switch (rndrange(7)) {
    case 0: return null
    case 1: return rndrange(2) == 0
    case 2: return rnd() - 0x40000000
    case 3: return 1.5 * (rndrange(1000) - 500)
    case 4: {
        local n = rndrange(8)
        local s = ""
        local chars = "abc\n\"\\xyz"
        for (local i = 0; i < n; i++) s += chars[rndrange(chars.len())].tochar()
        return s
    }
    case 5: {
        local a = []
        local n = rndrange(5)
        for (local i = 0; i < n; i++) a.append(gen_value(depth + 1))
        return a
    }
    default: {
        local t = {}
        local n = rndrange(5)
        for (local i = 0; i < n; i++) {
            local k = "k" + i
            t[k] <- gen_value(depth + 1)
        }
        return t
    }
    }
}

function deep_eq(a, b) {
    local ta = typeof(a), tb = typeof(b)
    // JSON has only one number type — treat int/float interchangeably.
    if ((ta == "integer" || ta == "float") &&
        (tb == "integer" || tb == "float"))
    {
        local da = a.tofloat(), db = b.tofloat()
        local diff = da - db
        if (diff < 0) diff = -diff
        local mag = (da < 0 ? -da : da)
        if (mag < (db < 0 ? -db : db)) mag = (db < 0 ? -db : db)
        return diff <= 1e-9 + mag * 1e-12
    }
    if (ta != tb) return false
    if (ta == "array") {
        if (a.len() != b.len()) return false
        for (local i = 0; i < a.len(); i++)
            if (!deep_eq(a[i], b[i])) return false
        return true
    }
    if (ta == "table") {
        if (a.len() != b.len()) return false
        foreach (k, v in a) {
            if (!(k in b)) return false
            if (!deep_eq(v, b[k])) return false
        }
        return true
    }
    if (ta == "float") {
        // tolerate dtostr round-trip
        local diff = a - b
        if (diff < 0) diff = -diff
        local mag = (a < 0 ? -a : a)
        if (mag < (b < 0 ? -b : b)) mag = (b < 0 ? -b : b)
        return diff <= 1e-9 + mag * 1e-12
    }
    return a == b
}

local rt_ok = 0
for (local i = 0; i < 2000 / SCALE; i++) {
    local val = gen_value(0)
    local s = J.stringify(val)
    local back = J.parse(s)
    if (!deep_eq(val, back)) {
        throw "[FAIL] round-trip mismatch at i=" + i
    }
    rt_ok++
}
check(rt_ok == 2000 / SCALE, "all round-trips succeeded")

print("[json-fuzz] parse: " + survived + " survived, " + thrown + " threw; "
      + "round-trip: " + rt_ok + " ok\n")
print("[OK] test_json_fuzz passed\n")
