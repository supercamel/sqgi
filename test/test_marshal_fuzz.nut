// test/test_marshal_fuzz.nut
//
// Deterministic marshaller stress test. We drive a small set of pure-string
// and string+int GLib functions with thousands of adversarial Squirrel
// values:
//
//   - wrong types in string slots (int, float, table, instance, null)
//   - strings with embedded NUL bytes
//   - very long strings
//   - invalid UTF-8 byte sequences
//   - edge-case integers (0, -1, INT_MAX, INT_MIN)
//   - edge-case floats (NaN, ±Inf, denormals)
//
// SUCCESS = process survives all iterations without a crash. Any Squirrel
// exception raised by sqgi_get_gi_argument's type validation is expected
// and caught. This test is most valuable under ASan in CI — it stresses
// the marshaller's bounds and free paths against pathological input.

local GLib = import("GLib")
local Gio = import("Gio")

// ─── Deterministic xorshift PRNG ─────────────────────────────────────────
local state = 0xdeadbeef
function rnd() {
    local x = state
    x = x ^ (x << 13)
    x = x ^ (x >>> 7)
    x = x ^ (x << 17)
    state = x & 0x7fffffff
    return state
}
function rndrange(n) { return rnd() % n }

// ─── Adversarial value generators ────────────────────────────────────────
local edge_ints = [0, 1, -1, 127, 128, 255, 256, 32767, 32768, 65535,
                   65536, 0x7fffffff, -0x80000000]
local edge_floats = [0.0, -0.0, 1.0, -1.0, 1.0/0.0, -1.0/0.0, 0.0/0.0,
                     1e308, -1e308, 1e-308]
local nonstring_vals = [null, true, false, 42, -1, 3.14, [], {}, "ok"]

function gen_string() {
    local k = rndrange(8)
    switch (k) {
    case 0: return ""
    case 1: return "x"
    case 2: {
        // long string
        local s = ""
        for (local i = 0; i < 1024; i++) s += "A"
        return s
    }
    case 3: return "embedded\x00nul"
    case 4: {
        // invalid UTF-8: lone continuation bytes
        return "\x80\x81\x82valid"
    }
    case 5: return "\xff\xfe\xfd"
    case 6: {
        // very deep nested-looking string
        local s = ""
        for (local i = 0; i < 32; i++) s += "/.."
        return s
    }
    default: return "normal/path/file.txt"
    }
}

// ─── Targets ─────────────────────────────────────────────────────────────
//
// Each target takes a `mk()` that returns an args array, then calls
// the named function with those args. Errors are caught and counted.

local survived = 0
local thrown = 0

function fuzz_call(fn, args) {
    try {
        // Squirrel call-with-array idiom: use acall
        fn.acall([this].extend(args))
        survived++
    } catch (e) {
        // Any Squirrel-level marshalling error is expected.
        thrown++
    }
}

// SQGI_FUZZ_SCALE divides iteration count (default 1, e.g. 10 under ASan).
local _scale_s = GLib.getenv("SQGI_FUZZ_SCALE")
local SCALE = (_scale_s != null && _scale_s.len() > 0) ? _scale_s.tointeger() : 1
if (SCALE < 1) SCALE = 1
local ITERS = 2000 / SCALE

for (local i = 0; i < ITERS; i++) {
    local pick = rndrange(6)
    switch (pick) {
    case 0:
        // markup_escape_text(text, length)
        fuzz_call(GLib.markup_escape_text, [gen_string(), -1])
        break
    case 1:
        // wrong type in string slot
        fuzz_call(GLib.markup_escape_text,
                  [nonstring_vals[rndrange(nonstring_vals.len())], -1])
        break
    case 2:
        // path_get_basename(filename)
        fuzz_call(GLib.path_get_basename, [gen_string()])
        break
    case 3:
        // path_is_absolute(filename) — bool return
        fuzz_call(GLib.path_is_absolute, [gen_string()])
        break
    case 4:
        // uri_escape_string(unescaped, reserved_chars_allowed, allow_utf8)
        local allow = (rndrange(2) == 0)
        fuzz_call(GLib.uri_escape_string,
                  [gen_string(), gen_string(), allow])
        break
    case 5:
        // edge-case ints/floats fed into a string slot
        local v = (rndrange(2) == 0)
                  ? edge_ints[rndrange(edge_ints.len())]
                  : edge_floats[rndrange(edge_floats.len())]
        fuzz_call(GLib.markup_escape_text, [v, -1])
        break
    }
}

print("[marshal-fuzz] iterations=" + ITERS +
      " survived=" + survived +
      " thrown=" + thrown + "\n")

// Sanity: at least some should have succeeded and some should have thrown.
if (survived == 0) throw "[FAIL] no calls succeeded"
if (thrown == 0)   throw "[FAIL] no calls threw — type validation missing?"

print("[OK] test_marshal_fuzz passed\n")
