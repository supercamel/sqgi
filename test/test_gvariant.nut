// test/test_gvariant.nut
// Verify GVariant ↔ Squirrel marshalling: scalars, strings, dicts.
//
// Previously GVariant return values surfaced as opaque wrappers,
// forcing demos to call `.get_string()` / `.print()` manually.
// Now they unwrap recursively into native Squirrel values.

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── Test 1: scalar variants unwrap to native types ────────────────────────
{
    local sv = GLib.Variant.new_string("hello")
    check(sv != null, "new_string returned null")
    // Round-trip: build a tuple containing the variant, then read it back.
    // Easier: feed through a VariantDict.
    print("test 1 (variant string construction) passed\n")
}

// ── Test 2: VariantDict round-trip — the demo-relevant case ───────────────
{
    local d = GLib.VariantDict.new(null)
    d.insert_value("uri", GLib.Variant.new_string("https://example.com/x"))
    d.insert_value("count", GLib.Variant.new_int32(42))
    d.insert_value("verbose", GLib.Variant.new_boolean(true))

    // lookup_value returns a GVariant; with the new marshalling it should
    // recursively unwrap into the native Squirrel value directly.
    local uri = d.lookup_value("uri", null)
    check(typeof uri == "string",
          "expected string for 'uri', got " + typeof uri)
    check(uri == "https://example.com/x", "uri mismatch: " + uri)

    local count = d.lookup_value("count", null)
    check(typeof count == "integer",
          "expected integer for 'count', got " + typeof count)
    check(count == 42, "count mismatch: " + count)

    local verbose = d.lookup_value("verbose", null)
    check(typeof verbose == "bool",
          "expected bool for 'verbose', got " + typeof verbose)
    check(verbose == true, "verbose mismatch")

    local missing = d.lookup_value("nope", null)
    check(missing == null, "missing key should yield null")

    print("test 2 (VariantDict.lookup_value unwrap) passed\n")
}

// ── Test 3: dict variant (a{sv}) unwraps to Squirrel table ────────────────
{
    local d = GLib.VariantDict.new(null)
    d.insert_value("a", GLib.Variant.new_string("alpha"))
    d.insert_value("b", GLib.Variant.new_int32(7))

    local v = d.end()  // GVariant of type a{sv}
    check(typeof v == "table",
          "expected table for a{sv}, got " + typeof v)
    check(v["a"] == "alpha", "dict[a] mismatch: " + v["a"])
    check(v["b"] == 7, "dict[b] mismatch: " + v["b"])

    print("test 3 (a{sv} dict → table) passed\n")
}

print("test_gvariant.nut passed\n")
