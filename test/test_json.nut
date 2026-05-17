// test/test_json.nut
//
// Verifies sqgi.json.parse / sqgi.json.stringify type mapping, escaping,
// and error reporting.

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

local J = sqgi.json

// ── Primitives ────────────────────────────────────────────────────────────
check(J.parse("null") == null, "null")
check(J.parse("true") == true, "true")
check(J.parse("false") == false, "false")
check(J.parse("0") == 0, "zero")
check(J.parse("42") == 42, "int")
check(J.parse("-17") == -17, "neg int")
check(J.parse("3.14") > 3.13 && J.parse("3.14") < 3.15, "float")
check(J.parse("1e3") == 1000.0, "exponent")
check(J.parse("\"hello\"") == "hello", "string")
check(J.parse("\"\"") == "", "empty string")

// ── Escapes ───────────────────────────────────────────────────────────────
check(J.parse("\"a\\nb\"") == "a\nb", "newline escape")
check(J.parse("\"a\\tb\"") == "a\tb", "tab escape")
check(J.parse("\"\\\"\"") == "\"", "quote escape")
check(J.parse("\"\\\\\"") == "\\", "backslash escape")
check(J.parse("\"\\u0041\"") == "A", "\\u escape")
// Surrogate pair → 😀 (U+1F600) → 4 UTF-8 bytes
local emoji = J.parse("\"\\uD83D\\uDE00\"")
check(emoji.len() == 4, "surrogate pair length")

// ── Arrays ────────────────────────────────────────────────────────────────
local a = J.parse("[]")
check(typeof(a) == "array" && a.len() == 0, "empty array")
a = J.parse("[1,2,3]")
check(a.len() == 3 && a[0] == 1 && a[2] == 3, "int array")
a = J.parse("[1, [2, [3]]]")
check(a[1][1][0] == 3, "nested arrays")

// ── Objects ───────────────────────────────────────────────────────────────
local o = J.parse("{}")
check(typeof(o) == "table" && o.len() == 0, "empty object")
o = J.parse("{\"a\":1,\"b\":\"two\"}")
check(o.a == 1 && o.b == "two", "object access")

// ── Whitespace ────────────────────────────────────────────────────────────
o = J.parse("  {\n  \"x\" : 1 ,\n  \"y\" : 2\n}\n")
check(o.x == 1 && o.y == 2, "whitespace tolerated")

// ── stringify primitives ──────────────────────────────────────────────────
check(J.stringify(null) == "null", "stringify null")
check(J.stringify(true) == "true", "stringify true")
check(J.stringify(42) == "42", "stringify int")
check(J.stringify(-1) == "-1", "stringify neg int")
check(J.stringify("hi") == "\"hi\"", "stringify string")
check(J.stringify("a\nb") == "\"a\\nb\"", "escape newline")
check(J.stringify("\t") == "\"\\t\"", "escape tab")
check(J.stringify("\"") == "\"\\\"\"", "escape quote")

// ── stringify containers ──────────────────────────────────────────────────
check(J.stringify([]) == "[]", "empty array")
check(J.stringify([1,2,3]) == "[1,2,3]", "int array compact")
check(J.stringify({}) == "{}", "empty object")
local s = J.stringify({a=1})
check(s == "{\"a\":1}", "single-key object; got: " + s)

// ── Pretty-print ──────────────────────────────────────────────────────────
local pretty = J.stringify([1, 2], 2)
check(pretty == "[\n  1,\n  2\n]", "pretty array; got: " + pretty)

// ── Round-trip a complex value ────────────────────────────────────────────
local original = {
    name = "SQGI",
    version = 0.1,
    tags = ["scripting", "glib", "gobject"],
    nested = { a = [1, 2, 3], b = null, ok = true }
}
local s2 = J.stringify(original)
local back = J.parse(s2)
check(back.name == "SQGI", "rt name")
check(back.version > 0.09 && back.version < 0.11, "rt version")
check(back.tags.len() == 3, "rt tags")
check(back.tags[1] == "glib", "rt tags[1]")
check(back.nested.a[2] == 3, "rt nested.a[2]")
check(back.nested.b == null, "rt nested.b")
check(back.nested.ok == true, "rt nested.ok")

// ── Errors ────────────────────────────────────────────────────────────────
function throws(fn) {
    try { fn(); return false } catch (e) { return true }
}
check(throws(function(){ J.parse("") }), "empty input throws")
check(throws(function(){ J.parse("{") }), "unterminated object throws")
check(throws(function(){ J.parse("[1,]") }), "trailing comma throws")
check(throws(function(){ J.parse("nope") }), "bad literal throws")
check(throws(function(){ J.parse("1 2") }), "trailing garbage throws")
check(throws(function(){ J.parse("\"unterminated") }), "unterminated string throws")
check(throws(function(){ J.parse("\"\\x\"") }), "bad escape throws")

// Cycle detection (recursion-cap)
local cyc = {}
cyc.cycle_ref <- cyc
check(throws(function(){ J.stringify(cyc) }), "cycle throws")

// NaN / Inf
check(throws(function(){ J.stringify(0.0/0.0) }), "NaN throws")
check(throws(function(){ J.stringify(1.0/0.0) }), "Inf throws")

// ── _tojson metamethod ───────────────────────────────────────────────────
class Point {
    x = 0
    y = 0
    constructor(a, b) { x = a; y = b }
    function _tojson() { return { x = x, y = y } }
}
local p = Point(3, 4)
local js = J.parse(J.stringify(p))
check(js.x == 3 && js.y == 4, "_tojson works")

print("[OK] test_json passed\n")
