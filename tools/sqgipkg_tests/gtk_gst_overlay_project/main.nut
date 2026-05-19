#!/usr/bin/env sqgi

local GLib = import("GLib")
local Gio  = import("Gio")
local Gtk  = import("Gtk", "4.0")
local Gst  = import("Gst")

local ball_mod = import("ball_state.nut")

Gst.init(null)

local analyse = false
local hard_timeout = 0
foreach (a in vargv) {
    if (a == "--analyse" || a == "--analyze") analyse = true
    else if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
}

local WIDTH = 640.0
local HEIGHT = 360.0
local state = ball_mod.BallState()
local W = {
    pipeline = null,
    app = null,
    video_widget = null,
    picture = null,
    embedded_video = false,
    draw_source = 0,
    speed_label = null,
    status_label = null,
    bus_source = 0
}

function set_status(text) {
    if (W.status_label != null) W.status_label.set_text(text)
    print(text + "\n")
}

function update_speed_label() {
    if (W.speed_label != null)
        W.speed_label.set_text(format("Speed: %.2fx", state.speed))
}

function draw_overlay(cr, timestamp_ns, duration_ns) {
    state.step(timestamp_ns, WIDTH, HEIGHT)

    cr.set_source_rgba(0.0, 0.0, 0.0, 0.22)
    cr.rectangle(0, 0, WIDTH, 36)
    cr.fill()

    cr.set_source_rgba(1.0, 1.0, 1.0, 0.45)
    cr.set_line_width(1.0)
    cr.move_to(WIDTH / 2.0, 0.0)
    cr.line_to(WIDTH / 2.0, HEIGHT)
    cr.stroke()
    cr.move_to(0.0, HEIGHT / 2.0)
    cr.line_to(WIDTH, HEIGHT / 2.0)
    cr.stroke()

    local glow = 2.2 * state.r
    cr.set_source_rgba(0.0, 0.0, 0.0, 0.28)
    cr.arc(state.x + 4.0, state.y + 5.0, glow, 0.0, 6.28318530718)
    cr.fill()

    cr.set_source_rgba(0.1, 0.85, 1.0, 0.94)
    cr.arc(state.x, state.y, state.r, 0.0, 6.28318530718)
    cr.fill()

    cr.set_source_rgba(1.0, 1.0, 1.0, 0.95)
    cr.select_font_face("Sans", 0, 1)
    cr.set_font_size(15.0)
    cr.move_to(12.0, 24.0)
    cr.show_text(state.hud_text())
}

function draw_fallback_frame(widget, cr, w, h) {
    local now_ns = GLib.get_monotonic_time() * 1000
    state.step(now_ns, w.tofloat(), h.tofloat())

    local t = (now_ns / 1000000000.0)
    local colors = [
        [0.90, 0.12, 0.18],
        [0.95, 0.75, 0.10],
        [0.15, 0.65, 0.22],
        [0.12, 0.48, 0.90],
        [0.46, 0.22, 0.72],
        [0.92, 0.42, 0.12]
    ]
    local stripe_w = w.tofloat() / colors.len()
    local offset = sin(t * 1.7) * stripe_w * 0.35
    foreach (i, c in colors) {
        cr.set_source_rgba(c[0], c[1], c[2], 1.0)
        cr.rectangle((i * stripe_w) + offset - stripe_w, 0, stripe_w + 2.0, h)
        cr.fill()
        cr.rectangle((i * stripe_w) + offset, 0, stripe_w + 2.0, h)
        cr.fill()
    }

    cr.set_source_rgba(0.0, 0.0, 0.0, 0.30)
    cr.rectangle(0, 0, w, h)
    cr.fill()

    cr.set_source_rgba(1.0, 1.0, 1.0, 0.30)
    cr.set_line_width(1.0)
    cr.move_to(w / 2.0, 0.0); cr.line_to(w / 2.0, h); cr.stroke()
    cr.move_to(0.0, h / 2.0); cr.line_to(w, h / 2.0); cr.stroke()

    cr.set_source_rgba(0.1, 0.85, 1.0, 0.96)
    cr.arc(state.x, state.y, state.r, 0.0, 6.28318530718)
    cr.fill()

    cr.set_source_rgba(1.0, 1.0, 1.0, 0.95)
    cr.select_font_face("Sans", 0, 1)
    cr.set_font_size(15.0)
    cr.move_to(12.0, 24.0)
    cr.show_text("GTK fallback renderer  " + state.hud_text())
}

function create_video_widget() {
    if (!analyse && Gst.ElementFactory.find("gtk4paintablesink") != null) {
        W.embedded_video = true
        local picture = Gtk.Picture.new()
        picture.set_content_fit(Gtk.ContentFit.contain)
        picture.set_can_shrink(true)
        picture.set_hexpand(true)
        picture.set_vexpand(true)
        W.picture = picture
        W.video_widget = picture
        return picture
    }

    W.embedded_video = false
    local area = Gtk.DrawingArea.new()
    area.set_content_width(WIDTH.tointeger())
    area.set_content_height(HEIGHT.tointeger())
    area.set_hexpand(true)
    area.set_vexpand(true)
    area.set_draw_func(draw_fallback_frame, null, function(_) {})
    W.video_widget = area
    return area
}

function make_pipeline() {
    if (W.embedded_video && Gst.ElementFactory.find("cairooverlay") == null) {
        set_status("missing GStreamer cairooverlay element")
        return null
    }

    local sink = W.embedded_video ? "gtk4paintablesink name=video_sink sync=true" : "fakesink sync=true"
    local buffers = analyse ? "num-buffers=180 " : ""
    local caps = "video/x-raw,format=BGRA,width=640,height=360,framerate=30/1"
    local desc = null
    if (W.embedded_video) {
        desc =
            "videotestsrc " + buffers + "is-live=true pattern=ball name=src ! " +
            caps + " ! videoconvert ! cairooverlay name=overlay ! " +
            "videoconvert ! " + sink
    } else {
        desc =
            "videotestsrc " + buffers + "is-live=true pattern=smpte name=src ! " +
            caps + " ! videoconvert ! " + sink
    }

    set_status("pipeline: " + desc)
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) {
        set_status("failed to create GStreamer pipeline")
        return null
    }

    if (W.embedded_video) {
        local overlay = pipe.get_by_name("overlay")
        overlay.connect("draw", function(cr, timestamp_ns, duration_ns) {
            draw_overlay(cr, timestamp_ns, duration_ns)
        })

        local video_sink = pipe.get_by_name("video_sink")
        local paintable = video_sink.get_property("paintable")
        W.picture.set_paintable(paintable)
    }

    return pipe
}

function stop_pipeline() {
    if (W.draw_source != 0) {
        sqgi.source_remove(W.draw_source)
        W.draw_source = 0
    }
    if (W.bus_source != 0) {
        sqgi.source_remove(W.bus_source)
        W.bus_source = 0
    }
    if (W.pipeline != null) {
        W.pipeline.set_state(Gst.State["null"])
        W.pipeline = null
    }
}

function poll_bus() {
    if (W.pipeline == null) return false

    local bus = W.pipeline.get_bus()
    local mask = Gst.MessageType.eos + Gst.MessageType.error
    local msg = bus.timed_pop_filtered(0, mask)
    if (msg == null) return true

    if (msg.type == Gst.MessageType.eos) {
        set_status("GStreamer EOS")
    } else if (msg.type == Gst.MessageType.error) {
        local err = msg.parse_error()[0]
        set_status("GStreamer error: " + err)
    }

    stop_pipeline()
    if (W.app != null) W.app.quit()
    return false
}

function start_pipeline() {
    W.pipeline = make_pipeline()
    if (W.pipeline == null) return
    W.pipeline.set_state(Gst.State.playing)
    W.bus_source = sqgi.timeout_add(30, poll_bus)
    if (!W.embedded_video && W.video_widget != null) {
        W.draw_source = sqgi.timeout_add(33, function() {
            W.video_widget.queue_draw()
            return true
        })
    }
    set_status(W.embedded_video
        ? "playing embedded GStreamer video with cairo overlay"
        : "gtk4paintablesink not available; showing in-window GTK fallback while GStreamer runs")
}

local app = Gtk.Application.new("org.sqgi.tests.gtk_gst_overlay",
                                Gio.ApplicationFlags.flags_none)
W.app = app

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI packaging test - embedded video + controls")
    win.set_default_size(720, 560)

    local root = Gtk.Box.new(Gtk.Orientation.vertical, 10)
    root.set_margin_top(14)
    root.set_margin_bottom(14)
    root.set_margin_start(14)
    root.set_margin_end(14)
    win.set_child(root)

    local title = Gtk.Label.new("GStreamer video inside a GTK4 window")
    title.add_css_class("title-2")
    title.set_xalign(0.0)
    root.append(title)

    local video = create_video_widget()
    root.append(video)

    W.speed_label = Gtk.Label.new("")
    W.speed_label.set_xalign(0.0)
    update_speed_label()
    root.append(W.speed_label)

    local row = Gtk.Box.new(Gtk.Orientation.horizontal, 8)
    root.append(row)

    local slower = Gtk.Button.new_with_label("Slower")
    slower.connect("clicked", function() {
        state.slower()
        update_speed_label()
    })
    row.append(slower)

    local faster = Gtk.Button.new_with_label("Faster")
    faster.connect("clicked", function() {
        state.faster()
        update_speed_label()
    })
    row.append(faster)

    local reset = Gtk.Button.new_with_label("Reset")
    reset.connect("clicked", function() {
        state.reset()
        update_speed_label()
    })
    row.append(reset)

    W.status_label = Gtk.Label.new("starting...")
    W.status_label.set_xalign(0.0)
    W.status_label.add_css_class("dim-label")
    root.append(W.status_label)

    win.connect("close-request", function() {
        stop_pipeline()
        return false
    })

    win.present()
    start_pipeline()

    if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            set_status("[timeout " + hard_timeout + "s] closing")
            stop_pipeline()
            win.close()
            return false
        })
    }
})

local status = app.run(0, null)
stop_pipeline()
print("Application exited with status " + status + "\n")
return status
