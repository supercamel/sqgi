// demo/gstreamer/tee_split.nut
//
// `tee` duplicates a stream so the same data can flow to multiple sinks.
// This demo records a 3-second sine sweep to a WAV file AND plays it to
// the speakers at the same time.
//
// Pipeline:
//   audiotestsrc num-buffers=300 ! audioconvert ! tee name=t
//   t. ! queue ! autoaudiosink     (or fakesink if --silent)
//   t. ! queue ! wavenc ! filesink location=/tmp/sqgi-tee.wav
//
// Each branch downstream of `tee` MUST start with a `queue` element.
//
// Flags:
//     --silent      route the audible branch to fakesink
//     --out=FILE    output file (default: /tmp/sqgi-tee.wav)

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local silent = false
local out    = "/tmp/sqgi-tee.wav"
foreach (a in vargv) {
    if      (a == "--silent")        silent = true
    else if (a.find("--out=") == 0)  out = a.slice(6)
}

local audible = silent ? "fakesink sync=true" : "autoaudiosink sync=true"
local desc =
    "audiotestsrc num-buffers=300 freq=440 wave=ticks ! audioconvert ! tee name=t " +
    "t. ! queue ! " + audible + " " +
    "t. ! queue ! wavenc ! filesink location=" + out + " "

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
print("recorded " + out + "\n")
