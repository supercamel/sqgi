// demo/gstreamer/webcam.nut
//
// Capture from a V4L2 webcam and display it.
//
// Pipeline:
//   v4l2src device=/dev/video0 ! videoconvert ! videoscale !
//   video/x-raw,width=W,height=H,framerate=F/1 ! videoconvert ! autovideosink
//
// Flags:
//     --device=/dev/videoN   pick a different webcam (default: /dev/video0)
//     --width=N --height=N   force a frame size (default: 640x480)
//     --fps=N                target framerate (default: 30)
//     --probe                list available /dev/video* and exit
//     --analyse              use fakesink + 30 frames; never opens a window
//
// If the device doesn't exist this demo falls back to videotestsrc so it
// still demonstrates the pipeline shape on a headless system.

local Gst  = import("Gst")
local GLib = import("GLib")
local Gio  = import("Gio")

Gst.init(null)

local device  = "/dev/video0"
local width   = 640
local height  = 480
local fps     = 30
local probe   = false
local analyse = false

foreach (a in vargv) {
    if      (a == "--probe")   probe = true
    else if (a == "--analyse" || a == "--analyze") analyse = true
    else if (a.find("--device=") == 0) device = a.slice(9)
    else if (a.find("--width=")  == 0) width  = a.slice(8).tointeger()
    else if (a.find("--height=") == 0) height = a.slice(9).tointeger()
    else if (a.find("--fps=")    == 0) fps    = a.slice(6).tointeger()
}

if (probe) {
    local dir = Gio.File.new_for_path("/dev")
    local en  = dir.enumerate_children("standard::name", 0, null)
    local found = []
    while (true) {
        local i = en.next_file(null)
        if (i == null) break
        local name = i.get_name()
        if (name.find("video") == 0) found.push("/dev/" + name)
    }
    en.close(null)
    if (found.len() == 0) print("(no /dev/video* found)\n")
    foreach (p in found) print(p + "\n")
    return
}

// Does the device exist?
local have_cam = Gio.File.new_for_path(device).query_exists(null)
if (!have_cam) {
    print("[warn] " + device + " not present — falling back to videotestsrc\n")
}

local sink = analyse ? "fakesink sync=true" : "autovideosink sync=true"
local caps = "video/x-raw,width=" + width + ",height=" + height +
             ",framerate=" + fps + "/1"

local desc
if (have_cam) {
    desc = "v4l2src device=" + device + " ! videoconvert ! videoscale ! " +
           caps + " ! videoconvert ! " + sink
} else if (analyse) {
    desc = "videotestsrc num-buffers=30 pattern=ball ! " + caps +
           " ! videoconvert ! fakesink sync=false"
} else {
    desc = "videotestsrc pattern=ball ! " + caps + " ! videoconvert ! " + sink
}

print("pipeline: " + desc + "\n")

local pipe = Gst.parse_launch(desc)
if (pipe == null) { print("parse_launch failed\n"); return }

pipe.set_state(Gst.State.playing)
local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error

local deadline = analyse
    ? (GLib.get_monotonic_time() + 5 * 1000 * 1000)        // 5s safety
    : 0                                                     // no deadline
while (true) {
    local now = GLib.get_monotonic_time()
    if (analyse && now >= deadline) break
    local wait_ns = analyse ? ((deadline - now) * 1000) : GLib.MAXINT64
    if (wait_ns <= 0) break
    local msg = bus.timed_pop_filtered(wait_ns, mask)
    if (msg == null) continue
    if (msg.type == Gst.MessageType.eos) { print("[eos]\n"); break }
    if (msg.type == Gst.MessageType.error) {
        local r = msg.parse_error()
        print("[error] " + r[0] + "\n")
        break
    }
}
pipe.set_state(Gst.State["null"])
