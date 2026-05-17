/**
 * demo/gio/stat.nut
 *
 * stat(1)-style metadata dump. Queries every standard / unix / time attribute
 * via Gio.File.query_info_async("standard::*,unix::*,time::*"), then iterates
 * the resulting Gio.FileInfo and prints each attribute with its declared
 * type.
 *
 * Usage:
 *   sqgi demo/gio/stat.nut [PATH]   (defaults to "demo/gio/stat.nut")
 *
 * Exercises:
 *   - query_info_async with wildcard attribute selectors
 *   - Gio.FileInfo.list_attributes + per-type get_attribute_string/uint32/…
 *   - Gio.FileAttributeType enum dispatch
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local path = (vargv.len() >= 1) ? vargv[0] : "demo/gio/stat.nut"
local loop = GLib.MainLoop.new(null, false)

function fmt_attr(info, attr) {
    local t = info.get_attribute_type(attr)
    if (t == Gio.FileAttributeType.string)
        return info.get_attribute_string(attr)
    if (t == Gio.FileAttributeType.byte_string)
        return info.get_attribute_byte_string(attr)
    if (t == Gio.FileAttributeType.boolean)
        return info.get_attribute_boolean(attr) ? "true" : "false"
    if (t == Gio.FileAttributeType.uint32)
        return "" + info.get_attribute_uint32(attr)
    if (t == Gio.FileAttributeType.int32)
        return "" + info.get_attribute_int32(attr)
    if (t == Gio.FileAttributeType.uint64)
        return "" + info.get_attribute_uint64(attr)
    if (t == Gio.FileAttributeType.int64)
        return "" + info.get_attribute_int64(attr)
    if (t == Gio.FileAttributeType.object)
        return "<object>"
    if (t == Gio.FileAttributeType.stringv) {
        local v = info.get_attribute_stringv(attr)
        return "[" + (v == null ? "" : v.tostring()) + "]"
    }
    return "<type=" + t + ">"
}

async function stat(path) {
    local f = Gio.File.new_for_path(path)
    local info = await sqgi.gio_async(
        @(c, cb) f.query_info_async("standard::*,unix::*,time::*",
                                    Gio.FileQueryInfoFlags.none,
                                    GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     f.query_info_finish(r))

    print("path: " + path + "\n")
    local attrs = info.list_attributes(null)
    if (attrs == null) {
        print("  (no attributes)\n")
        return
    }
    foreach (a in attrs) print(format("  %-32s = %s\n", a, fmt_attr(info, a)))
}

stat(path).then(@(_) loop.quit(),
                function(e) { ::print("error: " + e + "\n"); loop.quit() })
loop.run()
