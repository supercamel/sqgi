/**
 * demo/gtk4/scroll_diagnostics.nut
 *
 * GTK 4 scroll-event diagnostic harness.
 *
 * Attaches two Gtk.EventControllerScroll instances to the same widget: one in
 * capture phase and one in bubble phase. Both print the received signal
 * payloads, the current event time/state/device, and the scroll unit reported
 * by Gtk.EventControllerScroll.get_unit().
 *
 * Usage:
 *   sqgi demo/gtk4/scroll_diagnostics.nut
 *   sqgi demo/gtk4/scroll_diagnostics.nut --capture-claim
 *   sqgi demo/gtk4/scroll_diagnostics.nut --bubble-propagate
 *   sqgi demo/gtk4/scroll_diagnostics.nut --timeout=10
 */

local Gio = import("Gio")
local Gtk = import("Gtk", "4.0")
local Gdk = import("Gdk", "4.0")

local hard_timeout = 0
local capture_claim = false
local bubble_claim = true
foreach (a in vargv) {
    if (a == "--capture-claim") capture_claim = true
    else if (a == "--capture-propagate") capture_claim = false
    else if (a == "--bubble-claim") bubble_claim = true
    else if (a == "--bubble-propagate") bubble_claim = false
    else if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
}

function scroll_unit_name(unit) {
    foreach (name, value in Gdk.ScrollUnit) {
        if (value == unit) return name
    }
    return "unknown(" + unit + ")"
}

function state_string(state) {
    if (state == null) return "null"
    return "" + state
}

local D = {
    capture_scrolls = 0,
    bubble_scrolls = 0,
    status = null
}

function update_status() {
    if (D.status == null) return
    D.status.set_text("capture scrolls=" + D.capture_scrolls +
                      " return=" + capture_claim +
                      " | bubble scrolls=" + D.bubble_scrolls +
                      " return=" + bubble_claim)
}

function install_scroll_logger(widget, name, phase, claim) {
    local flags = Gtk.EventControllerScrollFlags.both_axes |
                  Gtk.EventControllerScrollFlags.discrete |
                  Gtk.EventControllerScrollFlags.kinetic
    local ctrl = Gtk.EventControllerScroll.new(flags)
    ctrl.set_name(name)
    ctrl.set_propagation_phase(phase)

    ctrl.connect("scroll-begin", function() {
        print("[" + name + "] scroll-begin\n")
    })

    ctrl.connect("scroll", function(dx, dy) {
        if (name == "capture") D.capture_scrolls++
        else D.bubble_scrolls++

        local event_time = ctrl.get_current_event_time()
        local event_state = ctrl.get_current_event_state()
        local event_device = ctrl.get_current_event_device()
        local device_name = event_device == null ? "null" : event_device.get_name()

        print(format("[%s] scroll dx=%.5f dy=%.5f unit=%s time=%d state=%s device=%s return=%s\n",
                     name, dx, dy, scroll_unit_name(ctrl.get_unit()),
                     event_time, state_string(event_state), device_name,
                     claim ? "true" : "false"))
        update_status()
        return claim
    })

    ctrl.connect("decelerate", function(vel_x, vel_y) {
        print(format("[%s] decelerate vel_x=%.5f vel_y=%.5f\n",
                     name, vel_x, vel_y))
    })

    ctrl.connect("scroll-end", function() {
        print("[" + name + "] scroll-end\n")
    })

    widget.add_controller(ctrl)
    return ctrl
}

local app = Gtk.Application.new("org.sqgi.gtk4.scroll_diagnostics",
                                Gio.ApplicationFlags.flags_none)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI - GTK 4 Scroll Diagnostics")
    win.set_default_size(680, 520)

    local root = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    root.set_margin_top(12)
    root.set_margin_bottom(12)
    root.set_margin_start(12)
    root.set_margin_end(12)
    win.set_child(root)

    local title = Gtk.Label.new("Scroll diagnostics")
    title.add_css_class("title-2")
    title.set_xalign(0.0)
    root.append(title)

    local desc = Gtk.Label.new("Scroll inside the framed area. The capture-phase and bubble-phase controllers both log signal payloads to stdout.")
    desc.set_xalign(0.0)
    desc.set_wrap(true)
    root.append(desc)

    local frame = Gtk.Frame.new("event target")
    frame.set_hexpand(true)
    frame.set_vexpand(true)
    root.append(frame)

    local box = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    box.set_margin_top(12)
    box.set_margin_bottom(12)
    box.set_margin_start(12)
    box.set_margin_end(12)
    frame.set_child(box)

    local target = Gtk.Label.new("Use a mouse wheel, touchpad, or touchscreen scroll here.\n\nTry --capture-claim to stop propagation before the bubble controller.\nTry --bubble-propagate to let default handlers continue.")
    target.set_hexpand(true)
    target.set_vexpand(true)
    target.set_wrap(true)
    target.set_xalign(0.0)
    target.set_yalign(0.0)
    target.add_css_class("monospace")
    box.append(target)

    local filler = Gtk.Label.new("The lower scrolled window is intentionally present to make propagation/default-handler behavior easier to compare.")
    filler.set_wrap(true)
    filler.set_xalign(0.0)
    box.append(filler)

    local scrolled = Gtk.ScrolledWindow.new()
    scrolled.set_min_content_height(120)
    scrolled.set_vexpand(false)
    local long_text = "Nested Gtk.ScrolledWindow\n"
    for (local i = 0; i < 30; i++) {
        long_text += "  line " + i + ": default scrolling should still work when controllers propagate\n"
    }
    local nested = Gtk.Label.new(long_text)
    nested.set_xalign(0.0)
    nested.set_yalign(0.0)
    nested.add_css_class("monospace")
    scrolled.set_child(nested)
    box.append(scrolled)

    local status = Gtk.Label.new("")
    status.set_xalign(0.0)
    status.set_wrap(true)
    D.status = status
    root.append(status)

    install_scroll_logger(frame, "capture", Gtk.PropagationPhase.capture, capture_claim)
    install_scroll_logger(frame, "bubble", Gtk.PropagationPhase.bubble, bubble_claim)
    update_status()

    win.present()

    if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            print("[timeout " + hard_timeout + "s] closing scroll diagnostics\n")
            win.close()
            return false
        })
    }
})

local status = app.run(0, null)
print("Application exited with status " + status + "\n")

