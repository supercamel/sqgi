// test/test_gvariant_classes.nut
//
// Coverage-driven sweep of sqgi_push_gvariant — every GVariant class tag is
// exercised through the unwrap-on-return path. We route everything through
// GLib.Variant.parse(text-form) because it goes through the standard GI
// method-call return path (which IS wired to unwrap), unlike bare
// constructors which currently return opaque wrappers.

local GLib = import("GLib")

function check(c, m) { if (!c) throw "[FAIL] " + m }

function parse(text) {
    return GLib.Variant.parse(null, text, null, null)
}

// ── scalar classes ───────────────────────────────────────────────────────
local b = parse("byte 200")
check(typeof b == "integer" && b == 200, "BYTE: " + b)

local i16 = parse("int16 -1234")
check(typeof i16 == "integer" && i16 == -1234, "INT16: " + i16)

local u16 = parse("uint16 60000")
check(typeof u16 == "integer" && u16 == 60000, "UINT16: " + u16)

local i32 = parse("int32 -2000000")
check(typeof i32 == "integer" && i32 == -2000000, "INT32: " + i32)

local u32 = parse("uint32 4000000000")
check(typeof u32 == "integer" && u32 == 4000000000, "UINT32: " + u32)

local i64 = parse("int64 -9000000000")
check(typeof i64 == "integer" && i64 == -9000000000, "INT64: " + i64)

local u64 = parse("uint64 9000000000")
check(typeof u64 == "integer" && u64 == 9000000000, "UINT64: " + u64)

local d = parse("3.14159")
check(typeof d == "float" && d > 3.14 && d < 3.15, "DOUBLE: " + d)

local s = parse("'hello'")
check(typeof s == "string" && s == "hello", "STRING: " + s)

local bv = parse("true")
check(typeof bv == "bool" && bv == true, "BOOLEAN: " + bv)

local op = parse("objectpath '/org/example/Foo'")
check(typeof op == "string" && op == "/org/example/Foo", "OBJECT_PATH: " + op)

local sig = parse("signature '(is)'")
check(typeof sig == "string" && sig == "(is)", "SIGNATURE: " + sig)

// ── nested variant ("v") ─────────────────────────────────────────────────
local nested = parse("<42>")
check(typeof nested == "integer" && nested == 42,
      "VARIANT-wrapped int: " + nested)

local nested_str = parse("<'inner'>")
check(typeof nested_str == "string" && nested_str == "inner",
      "VARIANT-wrapped string: " + nested_str)

// ── maybe (some / none) ──────────────────────────────────────────────────
local some = parse("@ms 'present'")
check(typeof some == "string" && some == "present", "MAYBE some: " + some)

local none = parse("@ms nothing")
check(none == null, "MAYBE none: " + none)

// ── tuple ────────────────────────────────────────────────────────────────
local tup = parse("(42, 'two', true)")
check(typeof tup == "array", "TUPLE type: " + typeof tup)
check(tup.len() == 3, "TUPLE len: " + tup.len())
check(tup[0] == 42 && tup[1] == "two" && tup[2] == true, "TUPLE values")

// ── array of ints ────────────────────────────────────────────────────────
local arr = parse("[1, 2, 3, 4, 5]")
check(typeof arr == "array", "ARRAY type: " + typeof arr)
check(arr.len() == 5 && arr[2] == 3, "ARRAY values")

// ── array of strings ─────────────────────────────────────────────────────
local sarr = parse("['a', 'b', 'c']")
check(typeof sarr == "array", "string ARRAY type")
check(sarr.len() == 3 && sarr[0] == "a" && sarr[2] == "c", "string ARRAY")

// ── dict (a{si}) → table ─────────────────────────────────────────────────
local de = parse("{'k1': 10, 'k2': 20}")
check(typeof de == "table", "DICT → table")
check(de.k1 == 10 && de.k2 == 20, "dict values")

// ── bytestring ───────────────────────────────────────────────────────────
local bs = parse("b'hello'")
check(typeof bs == "string", "BYTESTRING type: " + typeof bs)
check(bs == "hello", "BYTESTRING value: " + bs)

// ── nested: tuple containing array containing dict ───────────────────────
local complex = parse("([{'k': 1}, {'k': 2}], 'tail')")
check(typeof complex == "array", "complex TUPLE")
check(typeof complex[0] == "array", "complex tuple[0] is array")
check(typeof complex[0][0] == "table", "complex inner is table")
check(complex[0][0].k == 1, "complex inner.k")
check(complex[1] == "tail", "complex tail")

print("[OK] test_gvariant_classes passed\n")
