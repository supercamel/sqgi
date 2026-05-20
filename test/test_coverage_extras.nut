// test/test_coverage_extras.nut
//
// Targeted "100% strive" pass: hits previously-uncovered branches in
// sqgi_json.c (unicode/surrogate/4-byte UTF-8/error paths), sqgi_marshal.c
// (HANDLE variant + bytestring null + dict_entry-from-parse), and the
// struct field _get/_set path in sqgi_gi_object.c via GLib.String.

local GLib = import("GLib")

function check(c, m) { if (!c) throw "[FAIL] " + m }
function expect_throw(fn, sub, label) {
    try { fn(); throw "[FAIL] " + label + ": no throw" }
    catch (e) {
        if (typeof e != "string" || e.find(sub) == null)
            throw "[FAIL] " + label + ": got '" + e + "' want '" + sub + "'"
    }
}

// ── struct field _get / _set (sqgi_struct_get/set) ────────────────────────
local s = GLib.String.new("hello world")
check(s.str == "hello world", "GString.str initial")
check(s.len == 11, "GString.len initial: " + s.len)
check(s.allocated_len > s.len, "GString.allocated_len > len")
// Write a field
s.len = 5
check(s.len == 5, "GString.len after set")
// Unknown field
expect_throw(function() { local x = s.nonexistent_field }, "doesn't exist",
             "struct get nonexistent")
expect_throw(function() { s.nonexistent_field = 1 }, "doesn't exist",
             "struct set nonexistent")

// ── HANDLE variant class ─────────────────────────────────────────────────
local h = GLib.Variant.parse(null, "handle 7", null, null)
check(typeof h == "integer" && h == 7, "HANDLE variant: " + h)

// ── 4-byte UTF-8 emit_utf8 (codepoint ≥ 0x10000) ─────────────────────────
local emoji = sqgi.json.parse("\"\\uD83D\\uDE00\"")  // 😀 U+1F600
check(emoji.len() == 4, "4-byte UTF-8 surrogate pair: len=" + emoji.len())

// 3-byte UTF-8 (Basic Multilingual Plane)
local bmp = sqgi.json.parse("\"\\u4E2D\\u6587\"")  // 中文
check(bmp.len() == 6, "3-byte UTF-8: len=" + bmp.len())

// 2-byte UTF-8
local accent = sqgi.json.parse("\"\\u00E9\"")  // é
check(accent.len() == 2, "2-byte UTF-8: len=" + accent.len())

// ── JSON \u escape error paths ───────────────────────────────────────────
expect_throw(function() { sqgi.json.parse("\"\\u00X1\"") },
             "bad \\u", "bad hex digit in \\u")
expect_throw(function() { sqgi.json.parse("\"\\u00\"") },
             "bad \\u", "truncated \\u")
expect_throw(function() { sqgi.json.parse("\"\\uD800\\u0041\"") },
             "bad surrogate pair", "high surrogate + non-low")
expect_throw(function() { sqgi.json.parse("\"\\uD800\"") },
             "lone high surrogate", "lone high surrogate")
expect_throw(function() { sqgi.json.parse("\"\\uDC00\"") },
             "lone low surrogate", "lone low surrogate")
expect_throw(function() { sqgi.json.parse("\"\\q\"") },
             "bad escape", "bad escape char")
expect_throw(function() { sqgi.json.parse("\"\x01\"") },
             "control", "control char in string")
expect_throw(function() { sqgi.json.parse("\"unterminated") },
             "unterminated", "unterminated string")

// ── JSON number errors ───────────────────────────────────────────────────
expect_throw(function() { sqgi.json.parse("01") },
             "trailing", "leading zero with digit")  // may differ
expect_throw(function() { sqgi.json.parse("-") },
             "invalid number", "bare minus")
expect_throw(function() { sqgi.json.parse("1.") },
             "digit expected after '.'", "trailing dot")
expect_throw(function() { sqgi.json.parse("1e") },
             "digit expected after exponent", "bare exponent")
expect_throw(function() { sqgi.json.parse("1e+") },
             "digit expected after exponent", "exponent sign no digit")

// ── JSON token / structural errors ───────────────────────────────────────
expect_throw(function() { sqgi.json.parse("") }, "", "empty input")
expect_throw(function() { sqgi.json.parse("tru") }, "", "truncated true")
expect_throw(function() { sqgi.json.parse("[1,]") }, "", "trailing comma array")
expect_throw(function() { sqgi.json.parse("{\"k\":1,}") }, "", "trailing comma obj")
expect_throw(function() { sqgi.json.parse("[1 2]") }, "", "missing comma array")
expect_throw(function() { sqgi.json.parse("{1:2}") }, "", "non-string key")
expect_throw(function() { sqgi.json.parse("{\"k\" 1}") }, "", "missing colon")
expect_throw(function() { sqgi.json.parse("nope") }, "", "bad literal")
expect_throw(function() { sqgi.json.parse("[1] junk") }, "", "trailing garbage")

// JSON parse args
expect_throw(function() { sqgi.json.parse() }, "", "no arg")
expect_throw(function() { sqgi.json.parse(42) }, "", "non-string arg")

// ── JSON stringify: _tojson that throws ──────────────────────────────────
// (Squirrel's default error handler may print the inner throw to stderr
//  even though our outer wrap catches it. That noise is cosmetic — the
//  important thing is the outer error contains "_tojson threw".)
class Boom {
    function _tojson() { throw "kaboom" }
}
seterrorhandler(function(...) {})
expect_throw(function() { sqgi.json.stringify(Boom()) },
             "_tojson threw", "_tojson throws")
seterrorhandler(null)

// ── JSON pretty-print with indent (covers indented branches in writers) ─
local pretty = sqgi.json.stringify({a=1, b=[1,2], c={d="x"}}, 4)
check(pretty.find("\n") != null, "pretty has newlines")
check(pretty.find("    ") != null, "pretty has indent spaces")

// Pretty-print of empty object/array
local empty1 = sqgi.json.stringify({}, 2)
check(empty1 == "{}", "empty obj pretty: " + empty1)
local empty2 = sqgi.json.stringify([], 2)
check(empty2 == "[]", "empty arr pretty: " + empty2)

// Indent 0 (compact, but indent param present)
local compact = sqgi.json.stringify({a=1, b=2}, 0)
check(compact.find("\n") == null, "indent 0 stays compact")

// Long number literal (>64 chars) → promotes to float
local zeros = ""
for (local i = 0; i < 80; i++) zeros += "0"
local big = sqgi.json.parse("1" + zeros)
check(typeof big == "float", "long literal promotes to float, got: " + typeof big)

// Repeated in-place string appends should preserve normal string semantics.
local built = ""
for (local i = 0; i < 256; i++) {
    built += "x"
    built += i % 10
}
check(built.len() == 512, "string append len: " + built.len())
check(built.slice(0, 4) == "x0x1", "string append prefix: " + built.slice(0, 4))
check(built.slice(-4) == "x4x5", "string append suffix: " + built.slice(-4))
local built2 = ""
for (local i = 0; i < 256; i++) {
    built2 += "x"
    built2 += i % 10
}
check(built == built2, "grown string equality")
check(!(built < built2) && !(built > built2), "grown string comparison equality")
local lookup_key = ""
lookup_key += "x0"
lookup_key += "x1"
local lookup_key2 = "x0x1"
local table_with_grown_key = {}
table_with_grown_key[lookup_key] <- "ok"
check(table_with_grown_key[lookup_key2] == "ok", "grown string key lookup by literal")
check(table_with_grown_key.rawin(lookup_key2), "grown string rawin lookup by literal")
local mixed = ""
mixed += null
mixed += ":"
mixed += true
mixed += ":"
mixed += 1.5
check(mixed == "null:true:1.5", "mixed direct string append: " + mixed)

// Float formatting: integer-valued floats get .0
local intf = sqgi.json.stringify(3.0)
check(intf == "3.0" || intf == "3", "float 3.0 stringify: " + intf)

// String containing all escape forms
local esc = sqgi.json.stringify("a\"b\\c\nd\re\tf\bg\fh")
check(esc.find("\\\"") != null, "stringify escapes quote")
check(esc.find("\\n") != null, "stringify escapes \\n")
check(esc.find("\\\\") != null, "stringify escapes backslash")

// Control char in stringify (forces \u00XX path)
local ctrl = sqgi.json.stringify("\x01\x02")
check(ctrl.find("\\u00") != null, "stringify escapes control: " + ctrl)

// Round-trip emoji and accented strings
local round = sqgi.json.parse(sqgi.json.stringify(emoji))
check(round == emoji, "emoji round-trip")

print("[OK] test_coverage_extras passed\n")
