/**
 * demo/gtk4/scroll_controller.nut
 *
 * Interactive GTK 4 scroll controller demo.
 *
 * Exercises Gtk.EventControllerScroll.new(), Gtk.Widget.add_controller(),
 * GtkEventControllerScroll::scroll, ::scroll-begin, ::scroll-end, and
 * ::decelerate. Scroll over the drawing area to pan and zoom the scene.
 *
 * Usage:
 *   sqgi demo/gtk4/scroll_controller.nut
 *   sqgi demo/gtk4/scroll_controller.nut --propagate
 *   sqgi demo/gtk4/scroll_controller.nut --timeout=10
 */

local Gio   = import("Gio")
local Gtk   = import("Gtk", "4.0")
local Gdk   = import("Gdk", "4.0")
local cairo = import("cairo")

local hard_timeout = 0
local claim_scroll = true
foreach (a in vargv) {
    if (a == "--propagate") claim_scroll = false
    else if (a == "--claim") claim_scroll = true
    else if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
}

function scroll_unit_name(unit) {
    foreach (name, value in Gdk.ScrollUnit) {
        if (value == unit) return name
    }
    return "unknown(" + unit + ")"
}

local S = {
    scrolls = 0,
    begins = 0,
    ends = 0,
    decelerates = 0,
    total_dx = 0.0,
    total_dy = 0.0,
    offset_x = 0.0,
    offset_y = 0.0,
    zoom = 1.0,
    last_dx = 0.0,
    last_dy = 0.0,
    last_unit = "none",
    last_velocity = "none",
    area = null,
    status = null
}

function update_status() {
    if (S.status == null) return
    S.status.set_text(format(
        "scrolls=%d begins=%d ends=%d decel=%d | last=(%.3f, %.3f) %s | total=(%.1f, %.1f) | zoom=%.2f | return=%s",
        S.scrolls, S.begins, S.ends, S.decelerates,
        S.last_dx, S.last_dy, S.last_unit,
        S.total_dx, S.total_dy, S.zoom,
        claim_scroll ? "true" : "false"))
}

function print_event(name, detail) {
    print(format("[%-12s] %s\n", name, detail))
}

local app = Gtk.Application.new("org.sqgi.gtk4.scroll_controller",
                                Gio.ApplicationFlags.flags_none)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI - GTK 4 Scroll Controller")
    win.set_default_size(760, 520)

    local root = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    root.set_margin_top(12)
    root.set_margin_bottom(12)
    root.set_margin_start(12)
    root.set_margin_end(12)
    win.set_child(root)

    local title = Gtk.Label.new("Scroll over the drawing area")
    title.add_css_class("title-2")
    title.set_xalign(0.0)
    root.append(title)

    local hint = Gtk.Label.new("Vertical scroll zooms. Horizontal/touchpad scroll pans. Use --propagate to return false from the scroll signal.")
    hint.set_xalign(0.0)
    hint.set_wrap(true)
    root.append(hint)

    local area = Gtk.DrawingArea.new()
    area.set_hexpand(true)
    area.set_vexpand(true)
    area.set_size_request(640, 360)
    S.area = area

    area.set_draw_func(function(self, cr, w, h) {
        cr.set_source_rgba(0.08, 0.09, 0.12, 1.0)
        cr.rectangle(0, 0, w, h)
        cr.fill()

        cr.save()
        cr.translate(w / 2.0 + S.offset_x, h / 2.0 + S.offset_y)
        cr.scale(S.zoom, S.zoom)

        cr.set_line_width(1.0 / S.zoom)
        cr.set_source_rgba(0.28, 0.31, 0.38, 1.0)
        for (local x = -1000; x <= 1000; x += 40) {
            cr.move_to(x, -1000)
            cr.line_to(x, 1000)
        }
        for (local y = -1000; y <= 1000; y += 40) {
            cr.move_to(-1000, y)
            cr.line_to(1000, y)
        }
        cr.stroke()

        cr.set_source_rgba(0.95, 0.66, 0.18, 1.0)
        cr.set_line_width(4.0 / S.zoom)
        cr.move_to(-80, 0)
        cr.line_to(80, 0)
        cr.move_to(0, -80)
        cr.line_to(0, 80)
        cr.stroke()

        cr.set_source_rgba(0.18, 0.72, 0.95, 0.85)
        cr.arc(0, 0, 34, 0, 6.28318530718)
        cr.fill()

        cr.restore()

        cr.set_source_rgba(1, 1, 1, 0.78)
        cr.select_font_face("Sans", 0, 1)
        cr.set_font_size(13)
        cr.move_to(16, 24)
        cr.show_text(format("zoom %.2f   offset %.0f, %.0f", S.zoom, S.offset_x, S.offset_y))
        cr.move_to(16, 44)
        cr.show_text(format("last %.3f, %.3f %s", S.last_dx, S.last_dy, S.last_unit))
    }, null, function(_) {})

    root.append(area)

    local status = Gtk.Label.new("")
    status.set_xalign(0.0)
    status.set_wrap(true)
    S.status = status
    root.append(status)
    update_status()

    local flags = Gtk.EventControllerScrollFlags.both_axes |
                  Gtk.EventControllerScrollFlags.discrete |
                  Gtk.EventControllerScrollFlags.kinetic
    local scroll = Gtk.EventControllerScroll.new(flags)
    scroll.set_propagation_phase(Gtk.PropagationPhase.bubble)

    scroll.connect("scroll-begin", function() {
        S.begins++
        print_event("begin", "scroll sequence started")
        update_status()
    })

    scroll.connect("scroll", function(dx, dy) {
        S.scrolls++
        S.last_dx = dx
        S.last_dy = dy
        S.total_dx += dx
        S.total_dy += dy
        S.last_unit = scroll_unit_name(scroll.get_unit())

        S.offset_x -= dx * 42.0
        if (dy != 0.0) {
            local factor = dy > 0.0 ? 0.90 : 1.10
            S.zoom *= factor
            if (S.zoom < 0.25) S.zoom = 0.25
            if (S.zoom > 5.0) S.zoom = 5.0
        }

        print_event("scroll", format("dx=%.4f dy=%.4f unit=%s returning=%s",
                                     dx, dy, S.last_unit,
                                     claim_scroll ? "true" : "false"))
        update_status()
        area.queue_draw()
        return claim_scroll
    })

    scroll.connect("decelerate", function(vel_x, vel_y) {
        S.decelerates++
        S.last_velocity = format("%.3f, %.3f", vel_x, vel_y)
        print_event("decelerate", "velocity=" + S.last_velocity)
        update_status()
    })

    scroll.connect("scroll-end", function() {
        S.ends++
        print_event("end", "scroll sequence ended")
        update_status()
    })

    area.add_controller(scroll)

    win.present()

    if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            print("[timeout " + hard_timeout + "s] closing scroll demo\n")
            win.close()
            return false
        })
    }
})

local status = app.run(0, null)
print("Application exited with status " + status + "\n")

