// Real GTK draw callbacks must use the same owned native wrappers as factories.
local C = import("cairo")
local Gtk = import("Gtk", "4.0")
local GLib = import("GLib")
Gtk.init()
local loop = GLib.MainLoop.new(null, false)
local window = Gtk.Window.new()
local area = Gtk.DrawingArea.new()
window.set_default_size(64, 64)
window.set_child(area)
local draws = 0
local legacyDraws = 0
local replaced = false
local failure = null
local held = null
// The binding supplies the closure data and its destroy notifier.
local draw = function(widget, cr, w, h) {
    try {
        assert(cr instanceof C.Context)
        cr.set_source_rgb(1, 0, 0)
        local p = cr.get_source()
        assert(p instanceof C.Pattern)
        p.set_extend(C.Extend.pad)
        assert(cr.get_source().get_extend() == C.Extend.pad)
        if (draws == 0) held = p
        p = null
        collectgarbage()
        cr.paint()
        assert(cr.status() == 0)
        draws++
    } catch (e) { failure = e }
}
area.set_draw_func(draw)
local timedOut = false
local timeout = GLib.timeout_add(0, 5000, function() {
    timedOut = true
    loop.quit()
    return false
})
local tick = GLib.timeout_add(0, 30, function() {
    if (failure != null || legacyDraws > 0) { loop.quit(); return false }
    if (draws > 0 && !replaced) {
        // Legacy explicit closure/destroy slots must not leak unused wrappers.
        area.set_draw_func(function(widget, cr, w, h) {
            draw(widget, cr, w, h)
            legacyDraws++
        }, null, function(_) {})
        replaced = true
    }
    area.queue_draw()
    return true
})
window.present()
loop.run()
if (!timedOut) GLib.source_remove(timeout)
else GLib.source_remove(tick)
area.set_draw_func(null)
window.destroy()
area = null
window = null
collectgarbage()
if (failure != null) throw failure
assert(!timedOut && draws >= 2 && legacyDraws > 0,
       "GTK drawing callback did not complete through both registration forms")
assert(held.status() == 0 && held.get_extend() == C.Extend.pad)
local surface = C.image_surface_create(C.Format.argb32, 4, 4)
local cr = C.Context.create(surface)
cr.set_source(held)
held = null
collectgarbage()
cr.paint()
assert(cr.status() == 0)
print("test_cairo_gtk: ok\n")
