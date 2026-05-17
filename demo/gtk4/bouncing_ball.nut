/**
 * demo/gtk4/bouncing_ball.nut
 *
 * GTK 4 + Cairo bouncing-ball animation.
 *
 * Uses SQGI's native cairo binding (src/sqgi_cairo.c) — the `cairo_t*`
 * delivered to `Gtk.DrawingArea.set_draw_func`'s draw callback is wrapped as
 * a `cairo.Context` instance so we can issue real Cairo draw commands from
 * Squirrel.
 *
 * Animation is driven by `area.add_tick_callback`, the GTK 4 idiomatic
 * per-frame timer; we just call `area.queue_draw()` to invalidate, and the
 * draw callback fires on the next frame.
 *
 * Usage:
 *   sqgi demo/gtk4/bouncing_ball.nut
 *   sqgi demo/gtk4/bouncing_ball.nut --timeout=3
 */

local Gtk   = import("Gtk",   "4.0")
local Gio   = import("Gio")
local cairo = import("cairo")

// ── CLI ────────────────────────────────────────────────────────────────────
local hard_timeout = 0
foreach (a in vargv) {
    if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
}

// ── State (closed over by callbacks) ───────────────────────────────────────
local S = {
    x  = 60.0,  y  = 40.0,
    vx = 220.0, vy = 170.0,    // px/sec
    r  = 24.0,
    last_us = -1,
    frames  = 0,
    win     = null
}

// ── Application ────────────────────────────────────────────────────────────
local app = Gtk.Application.new("org.sqgi.gtk4.bouncing_ball",
                                Gio.ApplicationFlags.flags_none)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI — GTK 4 + Cairo Bouncing Ball")
    win.set_default_size(540, 360)
    S.win = win

    local area = Gtk.DrawingArea.new()
    area.set_size_request(540, 360)

    // Draw callback: (drawing_area, cr, width, height). `cr` is a real
    // cairo.Context wrapper, not an opaque pointer.
    area.set_draw_func(function(self, cr, w, h) {
        // Background vertical gradient.
        local bg = cairo.Pattern.create_linear(0, 0, 0, h)
        bg.add_color_stop_rgba(0.0, 0.06, 0.07, 0.12, 1.0)
        bg.add_color_stop_rgba(1.0, 0.02, 0.03, 0.06, 1.0)
        cr.set_source(bg)
        cr.rectangle(0, 0, w, h)
        cr.fill()

        // Soft glow under the ball.
        local glow = cairo.Pattern.create_radial(S.x, S.y, 1.0,
                                                 S.x, S.y, S.r * 2.4)
        glow.add_color_stop_rgba(0.0, 1.0, 0.78, 0.20, 0.65)
        glow.add_color_stop_rgba(1.0, 1.0, 0.78, 0.20, 0.00)
        cr.set_source(glow)
        cr.arc(S.x, S.y, S.r * 2.4, 0, 6.28318530718)
        cr.fill()

        // The ball: radial gradient for shading.
        local fill = cairo.Pattern.create_radial(S.x - S.r * 0.35,
                                                 S.y - S.r * 0.35,
                                                 S.r * 0.1,
                                                 S.x, S.y, S.r)
        fill.add_color_stop_rgba(0.0, 1.0, 0.95, 0.6, 1.0)
        fill.add_color_stop_rgba(1.0, 0.95, 0.55, 0.1, 1.0)
        cr.set_source(fill)
        cr.arc(S.x, S.y, S.r, 0, 6.28318530718)
        cr.fill()

        // Outline.
        cr.set_source_rgba(0, 0, 0, 0.4)
        cr.set_line_width(1.5)
        cr.arc(S.x, S.y, S.r, 0, 6.28318530718)
        cr.stroke()

        // HUD text.
        cr.set_source_rgba(1, 1, 1, 0.75)
        cr.select_font_face("Sans", 0, 1) // weight=bold
        cr.set_font_size(12)
        cr.move_to(10, 18)
        cr.show_text(format("frame %d  pos (%.0f, %.0f)", S.frames, S.x, S.y))
    }, null, null)

    // Per-frame tick. add_tick_callback(cb, user_data, destroy_notify);
    // cb signature: (widget, frame_clock) → bool (true = keep firing).
    area.add_tick_callback(function(widget, clock) {
        local now = clock.get_frame_time() // microseconds
        local dt = (S.last_us < 0) ? 0.016 : ((now - S.last_us) / 1000000.0)
        S.last_us = now
        if (dt > 0.1) dt = 0.1  // clamp on stalls

        S.x = S.x + S.vx * dt
        S.y = S.y + S.vy * dt

        local W = widget.get_allocated_width().tofloat()
        local H = widget.get_allocated_height().tofloat()
        if (S.x < S.r)       { S.x = S.r;       S.vx = -S.vx }
        if (S.x > W - S.r)   { S.x = W - S.r;   S.vx = -S.vx }
        if (S.y < S.r)       { S.y = S.r;       S.vy = -S.vy }
        if (S.y > H - S.r)   { S.y = H - S.r;   S.vy = -S.vy }

        S.frames = S.frames + 1
        widget.queue_draw()
        return true  // G_SOURCE_CONTINUE
    }, null, null)

    win.set_child(area)
    win.present()

    if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            print(format("[timeout %ds] frames=%d  final=(%.1f,%.1f)\n",
                         hard_timeout, S.frames, S.x, S.y))
            S.win.close()
            return false
        })
    }
})

local status = app.run(0, null)
print("Application exited with status " + status + "\n")
