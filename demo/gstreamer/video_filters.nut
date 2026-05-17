// demo/gstreamer/video_filters.nut
//
// Tour of basic raw-video effect elements.
//
// Pipeline:
//   videotestsrc ! videoconvert ! videoflip method=… ! videocrop top=… !
//   videoscale ! capsfilter ! videoconvert ! autovideosink
//
// Flags:
//     --flip=N        videoflip method (default: 0; 1=clockwise, 2=180,
//                                       3=ccw, 4=horizontal, 5=vertical)
//     --crop=N        videocrop pixels off each edge (default: 0)
//     --width=N       output width  (default: 320)
//     --height=N      output height (default: 240)
//     --analyse       headless: fakesink + 60 frames

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local flip    = 0
local crop    = 0
local width   = 320
local height  = 240
local analyse = false
foreach (a in vargv) {
    if      (a == "--analyse" || a == "--analyze") analyse = true
    else if (a.find("--flip=")   == 0) flip   = a.slice(7).tointeger()
    else if (a.find("--crop=")   == 0) crop   = a.slice(7).tointeger()
    else if (a.find("--width=")  == 0) width  = a.slice(8).tointeger()
    else if (a.find("--height=") == 0) height = a.slice(9).tointeger()
}

local sink = analyse ? "fakesink sync=false" : "autovideosink sync=true"
local nb   = analyse ? "num-buffers=60 " : ""
local caps = "video/x-raw,width=" + width + ",height=" + height +
             ",framerate=30/1"

local desc =
    "videotestsrc " + nb + "pattern=smpte ! videoconvert ! " +
    "videoflip method=" + flip + " ! " +
    "videocrop top=" + crop + " bottom=" + crop +
    " left=" + crop + " right=" + crop + " ! " +
    "videoscale ! " + caps + " ! videoconvert ! " + sink

print("pipeline: " + desc + "\n")
local pipe = Gst.parse_launch(desc)
if (pipe == null) { print("parse_launch failed\n"); return }

pipe.set_state(Gst.State.playing)
local bus  = pipe.get_bus()
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
