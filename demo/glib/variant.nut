/**
 * demo/glib/variant.nut
 *
 * Build, print, introspect, and dispatch over GLib.Variant values — the
 * canonical "tagged value" type used by GAction, GSettings, D-Bus, and
 * GIO command-line options.
 *
 * Usage: sqgi demo/glib/variant.nut
 *
 * Exercises:
 *   - GLib.Variant.new_string / new_int32 / new_boolean / new_double
 *   - get_type_string + per-type accessors
 *   - GLib.VariantType + .is_basic / .equal
 *   - GLib.VariantDict for typed key/value storage
 */

local GLib = import("GLib")

local values = [
    GLib.Variant.new_string("squirrel"),
    GLib.Variant.new_int32(42),
    GLib.Variant.new_boolean(true),
    GLib.Variant.new_double(2.71828),
]

print("== variants ==\n")
foreach (v in values) {
    local t = v.get_type_string()
    local printed = v.print(true)        // type-annotated text form
    print(format("  %-3s  %s\n", t, printed))
}

print("\n== type checks ==\n")
local s_type = GLib.VariantType.new("s")
local i_type = GLib.VariantType.new("i")
print("  's' basic:    " + s_type.is_basic() + "\n")
print("  's' = 's':    " + s_type.equal(GLib.VariantType.new("s")) + "\n")
print("  's' = 'i':    " + s_type.equal(i_type) + "\n")

print("\n== VariantDict ==\n")
local d = GLib.VariantDict.new(null)
d.insert_value("name",   GLib.Variant.new_string("sqgi"))
d.insert_value("count",  GLib.Variant.new_int32(7))
d.insert_value("enabled",GLib.Variant.new_boolean(true))

foreach (key in ["name", "count", "enabled", "missing"]) {
    if (d.contains(key)) {
        local v = d.lookup_value(key, null)
        print("  " + key + " = " + v + "\n")
    } else {
        print("  " + key + " absent\n")
    }
}
