// demo/gstreamer/compositor_pip.nut
//
// Picture-in-picture: composite two video sources into a single output.
//
// Pipeline:
//   compositor name=mix sink_0::xpos=0 sink_0::ypos=0
//              sink_1::xpos=480 sink_1::ypos=270
//   ! video/x-raw,width=640,height=360 ! videoconvert ! autovideosink
//   videotestsrc pattern=smpte ! video/x-raw,width=640,height=360 ! mix.sink_0
//   videotestsrc pattern=ball  ! video/x-raw,width=160,height=90  ! mix.sink_1
//
// Each pad on compositor exposes xpos/ypos/alpha/zorder properties via the
// `sinkN::prop=value` syntax in gst-launch descriptions.
//
// Flags:
//     --frames=N     bound the source (default: live, run forever)
//     --analyse      headless: fakesink, finite frames

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local frames  = 0       // 0 = infinite
local analyse = false
foreach (a in vargv) {
    if      (a == "--analyse" || a == "--analyze") { analyse = true; if (frames == 0) frames = 30 }
    else if (a.find("--frames=") == 0) frames = a.slice(9).tointeger()
}

local nb = frames > 0 ? ("num-buffers=" + frames + " ") : ""
local sink = analyse ? "fakesink sync=false" : "autovideosink sync=true"

local desc =
    "compositor name=mix background=black " +
    "sink_0::xpos=0   sink_0::ypos=0 sink_0::alpha=1.0 " +
    "sink_1::xpos=480 sink_1::ypos=270 sink_1::alpha=1.0 " +
    "! video/x-raw,width=640,height=360,framerate=30/1 ! videoconvert ! " + sink + " " +
    "videotestsrc " + nb + "pattern=smpte ! video/x-raw,width=640,height=360 ! mix.sink_0 " +
    "videotestsrc " + nb + "pattern=ball  ! video/x-raw,width=160,height=90  ! mix.sink_1 "

print("pipeline: " + desc + "\n")
local pipe = Gst.parse_launch(desc)
if (pipe == null) { print("parse_launch failed\n"); return }

pipe.set_state(Gst.State.playing)
local bus = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error
while (true) {
    local msg = bus.timed_pop_filtered(GLib.MAXINT64, mask)
    if (msg == null) continue
    if (msg.type == Gst.MessageType.eos) { print("[eos]\n"); break }
    if (msg.type == Gst.MessageType.error) {
        local r = msg.parse_error()
        print("[error] " + r[0] + "\n")
        break
    }
}
pipe.set_state(Gst.State["null"])
