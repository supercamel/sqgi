// demo/gstreamer/audio_mix.nut
//
// Mix multiple audio sources into a single output using audiomixer.
//
// Pipeline:
//     audiotestsrc freq=440 ! volume volume=0.3 ! audiomixer.sink_0
//     audiotestsrc freq=660 ! volume volume=0.2 ! audiomixer.sink_1
//     audiotestsrc freq=880 ! volume volume=0.2 ! audiomixer.sink_2
//     audiomixer ! audioconvert ! audioresample ! autoaudiosink
//
// audiomixer is a request-pad element: feed sinks named sink_0, sink_1, …
// (gst-launch syntax automatically requests them).
//
// Flags:
//     --duration=N    seconds of audio (default: 4)
//     --silent        write to fakesink instead of speakers
//     --record=FILE   also encode the mix to FILE.wav

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local duration = 4
local silent   = false
local record   = null
foreach (a in vargv) {
    if      (a == "--silent")              silent = true
    else if (a.find("--duration=") == 0)   duration = a.slice(11).tointeger()
    else if (a.find("--record=")   == 0)   record = a.slice(9)
}

local n_buffers = duration * 100        // 100 buffers/s ≈ 10ms each
local mix_sink
if (record != null) {
    // Tee the mix to both audiosink and a wav file.
    mix_sink =
        "audiomixer name=mix ! audioconvert ! audioresample ! tee name=t " +
        "t. ! queue ! " + (silent ? "fakesink sync=true" : "autoaudiosink sync=true") + " " +
        "t. ! queue ! wavenc ! filesink location=" + record + " "
} else {
    mix_sink =
        "audiomixer name=mix ! audioconvert ! audioresample ! " +
        (silent ? "fakesink sync=true" : "autoaudiosink sync=true") + " "
}

local desc = mix_sink +
    "audiotestsrc num-buffers=" + n_buffers + " freq=440 ! volume volume=0.30 ! mix.sink_0 " +
    "audiotestsrc num-buffers=" + n_buffers + " freq=660 ! volume volume=0.20 ! mix.sink_1 " +
    "audiotestsrc num-buffers=" + n_buffers + " freq=880 ! volume volume=0.20 ! mix.sink_2 "

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
if (record != null) print("wrote " + record + "\n")
