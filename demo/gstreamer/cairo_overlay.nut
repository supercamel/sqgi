// demo/gstreamer/cairo_overlay.nut
//
// Draw on top of a live video stream using the cairooverlay element.
//
// Pipeline:
//   videotestsrc → videoconvert (BGRA) → cairooverlay → videoconvert →
//   (autovideosink | fakesink)
//
// cairooverlay emits a `draw` signal once per frame whose arguments are the
// element, a Cairo context, the buffer timestamp and the buffer duration.
// The handler decides what to draw — here a crosshair, a moving dot, and a
// timestamp clock.
//
// Run with on-screen output:
//     sqgi demo/gstreamer/cairo_overlay.nut
//
// Headless (CI-friendly, no window, terminates after --frames):
//     sqgi demo/gstreamer/cairo_overlay.nut --analyse --frames=30
//
// Flags:
//     --analyse        use fakesink and a finite number of frames
//     --frames=N       stop after N source frames (default: 600 = 20s @ 30fps)

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local analyse = false
local frames  = 600
foreach (a in vargv) {
    if (a == "--analyse" || a == "--analyze") analyse = true
    else if (a.find("--frames=") == 0) frames = a.slice(9).tointeger()
}

if (Gst.ElementFactory.find("cairooverlay") == null) {
    print("cairooverlay element missing — install gst-plugins-good cairo support\n")
    return
}

local sink = analyse ? "fakesink sync=true" : "autovideosink sync=true"
local src_caps = "video/x-raw,format=BGRA,width=480,height=270,framerate=30/1"
local desc =
    "videotestsrc is-live=true name=src ! " + src_caps + " ! " +
    "videoconvert ! cairooverlay name=co ! videoconvert ! " + sink

if (analyse) {
    // Bound the source so the pipeline terminates after --frames. We keep
    // sync=true so frames are paced; with sync=false the pipeline races to
    // EOS in microseconds and queued draw handlers can be coalesced.
    desc = "videotestsrc num-buffers=" + frames + " is-live=false name=src ! " +
           src_caps + " ! videoconvert ! cairooverlay name=co ! videoconvert ! " +
           "fakesink sync=true"
}

local pipe = Gst.parse_launch(desc)
if (pipe == null) { print("parse_launch failed\n"); return }

local co = pipe.get_by_name("co")

// `draw` signal handler. SQGI strips the emitting element, so the user
// handler receives only (cairo_context, timestamp_ns, duration_ns).
local n_drawn = 0
co.connect("draw", function (cr, ts_ns, dur_ns) {
    n_drawn += 1
    local W = 480.0; local H = 270.0
    local secs = ts_ns / 1000000000.0

    // Background tint (10% alpha black).
    cr.set_source_rgba(0.0, 0.0, 0.0, 0.10)
    cr.rectangle(0, 0, W, 30)
    cr.fill()

    // Crosshair.
    cr.set_source_rgba(1.0, 1.0, 1.0, 0.5)
    cr.set_line_width(1.0)
    cr.move_to(W / 2.0, 0); cr.line_to(W / 2.0, H); cr.stroke()
    cr.move_to(0, H / 2.0); cr.line_to(W, H / 2.0); cr.stroke()

    // Bouncing dot.
    local x = (W / 2.0) + (W / 2.4) * sin(secs * 1.7)
    local y = (H / 2.0) + (H / 2.4) * cos(secs * 2.3)
    cr.set_source_rgba(1.0, 0.4, 0.1, 0.95)
    cr.arc(x, y, 8.0, 0.0, 6.283185)
    cr.fill()

    // HUD: timestamp text.
    cr.set_source_rgba(1.0, 1.0, 1.0, 0.95)
    cr.select_font_face("Sans", 0, 1)        // normal slant, bold weight
    cr.set_font_size(14.0)
    cr.move_to(10, 22)
    cr.show_text(format("ts=%6.2fs  frame=%d", secs, n_drawn))
})

pipe.set_state(Gst.State.playing)
local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error
local ctx  = GLib.MainContext.default()
print("drawing... press Ctrl-C to quit\n")

// Cairo overlay emits its `draw` signal from the streaming thread. SQGI
// marshals signal calls back through an idle source on the VM's main
// context, so we must iterate that context here for handlers to fire.
local done = false
while (!done) {
    // Pump pending signal callbacks (non-blocking).
    while (ctx.iteration(false)) {}

    // Poll the bus briefly so we notice EOS/ERROR.
    local msg = bus.timed_pop_filtered(20 * 1000 * 1000, mask)   // 20 ms
    if (msg == null) continue
    if (msg.type == Gst.MessageType.eos)   { print("[eos]\n"); done = true }
    else if (msg.type == Gst.MessageType.error) {
        print("[error] " + msg.parse_error()[0] + "\n"); done = true
    }
}
// Drain any remaining handler invocations queued in flight.
while (ctx.iteration(false)) {}

pipe.set_state(Gst.State["null"])
print("frames drawn: " + n_drawn + "\n")
