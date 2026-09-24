/* test/test_cairo.nut — native Cairo binding regression tests.
 *
 * Exercises:
 *   - import("cairo") returns an overlaid namespace (Context/Surface/Pattern
 *     are our native classes, not GI's foreign stubs)
 *   - cairo.image_surface_create + cairo.Context.create round-trip
 *   - Drawing primitives produce a valid surface (status() == SUCCESS)
 *   - write_to_png produces a non-empty PNG file
 *   - GC of the wrappers does not crash
 *   - cairo.Pattern.create_linear + add_color_stop_rgba + set_source
 *   - cairo.Context dash setters/getters
 *   - wrong native types, argument counts, enum types/ranges and size overflow
 *   - current-source identity, extension modes and wrapper lifetime
 *
 * No GTK / display required.
 */

local cairo = import("cairo")

// ── Namespace overlay ────────────────────────────────────────────────────────
assert(typeof cairo.Context == "class")
assert(typeof cairo.Surface == "class")
assert(typeof cairo.Pattern == "class")
assert(typeof cairo.image_surface_create == "function")

// Enums still loaded from GI (note: lowercase by GI convention).
assert(cairo.Format.argb32 == 0)

// ── Surface + Context lifecycle ──────────────────────────────────────────────
local W = 64
local H = 48
local surf = cairo.image_surface_create(cairo.Format.argb32, W, H)
assert(typeof surf == "instance")
assert(surf.get_width()  == W)
assert(surf.get_height() == H)
assert(surf.status() == 0) // CAIRO_STATUS_SUCCESS

local cr = cairo.Context.create(surf)
assert(typeof cr == "instance")
assert(cr.status() == 0)

// ── Drawing primitives ───────────────────────────────────────────────────────
cr.set_source_rgb(0.0, 0.0, 0.0)
cr.paint()

cr.save()
cr.translate(W / 2.0, H / 2.0)
cr.scale(2.0, 1.0)
cr.set_source_rgba(1.0, 0.5, 0.25, 1.0)
cr.arc(0, 0, 10, 0, 6.28318530718)
cr.fill()
cr.restore()

cr.set_line_width(2.0)
cr.set_dash([6.0, 3.0], 1.5)
assert(cr.get_dash_count() == 2)
local dash = cr.get_dash()
assert(typeof dash == "table")
assert(typeof dash.dashes == "array")
assert(dash.dashes.len() == 2)
assert(dash.dashes[0] == 6.0)
assert(dash.dashes[1] == 3.0)
assert(dash.offset == 1.5)

cr.set_dashes([], 0.0)
assert(cr.get_dash_count() == 0)

cr.set_source_rgb(1, 1, 1)
cr.rectangle(4, 4, W - 8, H - 8)
cr.stroke()

assert(cr.status() == 0)

// ── Pattern ──────────────────────────────────────────────────────────────────
local pat = cairo.Pattern.create_linear(0, 0, W, 0)
assert(typeof pat == "instance")
pat.add_color_stop_rgba(0.0, 1, 0, 0, 1)
pat.add_color_stop_rgba(1.0, 0, 0, 1, 1)
assert(pat.status() == 0)
cr.set_source(pat)
cr.rectangle(8, H - 16, W - 16, 8)
cr.fill()
assert(cr.status() == 0)

// Type errors must be catchable, including wrappers with a different payload.
function rejects(fn) {
    local caught = false
    try { fn() } catch (e) { caught = true }
    assert(caught, "invalid Cairo call must throw")
}
local Gio = import("Gio")
local foreign = Gio.Cancellable.new()
foreach (bad in [surf, cr, foreign, cairo.Pattern(), null, 1, {}, [], "pattern"])
    rejects(function() { cr.set_source(bad) })
foreach (bad in [pat, cr, foreign, cairo.Surface(), null, 1, {}]) {
    rejects(function() { cairo.Context.create(bad) })
    rejects(function() { cr.set_source_surface(bad, 0, 0) })
}
foreach (bad in [surf, pat, foreign, cairo.Context(), null, {}, 1])
    rejects(function() { cairo.Context.paint.call(bad) })
foreach (bad in [cr, pat, foreign, cairo.Surface(), null, {}, 1])
    rejects(function() { cairo.Surface.status.call(bad) })
foreach (bad in [cr, surf, foreign, cairo.Pattern(), null, {}, 1]) {
    rejects(function() { cairo.Pattern.status.call(bad) })
    rejects(function() { cairo.Pattern.set_extend.call(bad, cairo.Extend.pad) })
}
assert(cr.status() == 0 && surf.status() == 0 && pat.status() == 0)

// Check every extension enum on constructed and context-derived patterns.
local source = cr.get_source()
assert(source instanceof cairo.Pattern)
foreach (p in [pat, source, cairo.Pattern.create_radial(0, 0, 1, 0, 0, 2),
               cairo.Pattern.create_rgb(1, 0, 0), cairo.Pattern.create_rgba(1, 0, 0, 0.5)]) {
    foreach (mode in [cairo.Extend.none, cairo.Extend.repeat, cairo.Extend.reflect, cairo.Extend.pad]) {
        assert(p.set_extend(mode) == null)
        assert(p.get_extend() == mode && p.status() == 0)
    }
    foreach (bad in [-1, 4, 4294967299, -4294967296, 3.0, 3.9, true, false, null, "3", [], {}]) {
        rejects(function() { p.set_extend(bad) })
        assert(p.get_extend() == cairo.Extend.pad && p.status() == 0)
    }
}
source.set_extend(cairo.Extend.repeat)
assert(pat.get_extend() == cairo.Extend.repeat)
assert(cr.get_source().get_extend() == cairo.Extend.repeat)
foreach (fn in [function() { cr.get_source(1) },
                function() { source.get_extend(1) },
                function() { source.set_extend() },
                function() { source.set_extend(3, 0) },
                function() { cr.paint(1) },
                function() { cr.set_source() },
                function() { cr.set_source_rgb() },
                function() { cr.set_dash() },
                function() { cr.set_dash([], 0, 1) },
                function() { cairo.Context.create() },
                function() { cairo.Pattern.create_rgb(1, 0) },
                function() { cairo.image_surface_create(0, 4) }]) rejects(fn)
foreach (bad in [0.9, false, 4294967296, -4294967296])
    rejects(function() { cairo.image_surface_create(bad, 4, 4) })
foreach (bad in [-1, 4.5, true, 4294967300]) {
    rejects(function() { cairo.image_surface_create(0, bad, 4) })
    rejects(function() { cairo.image_surface_create(0, 4, bad) })
}
cr.set_dash([2, 1]) // Optional offset remains supported.
assert(cr.get_dash().offset == 0)

// Source wrappers retain the real native pattern across context replacement,
// save/restore and collection in either order.
function retained_source() {
    local s = cairo.image_surface_create(0, 4, 4)
    local c = cairo.Context.create(s)
    c.set_source_rgb(1, 0, 0)
    local p = c.get_source()
    c.save()
    c.set_source_rgb(0, 0, 1)
    p.set_extend(cairo.Extend.reflect)
    c.restore()
    assert(c.get_source().get_extend() == cairo.Extend.reflect)
    c.set_source_rgb(0, 1, 0)
    return p
}
local held = retained_source()
collectgarbage()
assert(held.status() == 0 && held.get_extend() == cairo.Extend.reflect)
cr.set_source(held)
held = null
collectgarbage()
for (local i = 0; i < 1000; i++) {
    local p = cr.get_source()
    p.set_extend(i % 4)
    if (i % 100 == 0) collectgarbage()
}
cr.paint()
assert(cr.status() == 0)

// ── PNG round-trip ───────────────────────────────────────────────────────────
local GLib = import("GLib")
local tmp = GLib.dir_make_tmp("sqgi-cairo-XXXXXX")
local path = tmp + "/result.png"
surf.write_to_png(path)
local f = ::file(path, "rb")
local size = f.len()
f.close()
assert(size > 0, "PNG should be non-empty (got " + size + " bytes)")
Gio.File.new_for_path(path).delete(null)
Gio.File.new_for_path(tmp).delete(null)

// ── GC: drop references and force a collection ───────────────────────────────
cr = null
surf = null
pat = null
::collectgarbage()

print("test_cairo: ok (" + size + " bytes written to " + path + ")\n")
