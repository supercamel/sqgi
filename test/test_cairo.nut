/* test/test_cairo.nut — native cairo binding sanity test.
 *
 * Exercises:
 *   - import("cairo") returns an overlaid namespace (Context/Surface/Pattern
 *     are our native classes, not GI's foreign stubs)
 *   - cairo.image_surface_create + cairo.Context.create round-trip
 *   - Drawing primitives produce a valid surface (status() == SUCCESS)
 *   - write_to_png produces a non-empty PNG file
 *   - GC of the wrappers does not crash
 *   - cairo.Pattern.create_linear + add_color_stop_rgba + set_source
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

// ── PNG round-trip ───────────────────────────────────────────────────────────
local path = "/tmp/sqgi_test_cairo.png"
surf.write_to_png(path)
local f = ::file(path, "rb")
local size = f.len()
f.close()
assert(size > 0, "PNG should be non-empty (got " + size + " bytes)")

// ── GC: drop references and force a collection ───────────────────────────────
cr = null
surf = null
pat = null
::collectgarbage()

print("test_cairo: ok (" + size + " bytes written to " + path + ")\n")
