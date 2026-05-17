// demo/gstreamer/seek.nut
//
// Seeking with playbin: jump around a file by issuing seek_simple().
//
// Pipeline:
//   playbin uri=file://… [video-sink=fakesink audio-sink=fakesink in --analyse]
//
// Seek protocol:
//   - Wait for ASYNC_DONE before seeking (preroll must complete).
//   - playbin.seek_simple(format, flags, target_ns)
//   - Common flag combo: Gst.SeekFlags.flush + Gst.SeekFlags.key_unit
//
// Flags:
//     --uri=URI       file:// or http:// URI (default: synthesised wav)
//     --duration=N    seconds to run before exiting (default: 6)
//     --analyse       fakesink everything

local Gst  = import("Gst")
local GLib = import("GLib")
local Gio  = import("Gio")

Gst.init(null)

local uri      = null
local duration = 6
local analyse  = false
foreach (a in vargv) {
    if      (a == "--analyse" || a == "--analyze") analyse = true
    else if (a.find("--uri=")      == 0) uri      = a.slice(6)
    else if (a.find("--duration=") == 0) duration = a.slice(11).tointeger()
}

if (uri == null) {
    // Synthesise a 6-second tone we can seek inside of.
    local tmp = GLib.get_tmp_dir() + "/sqgi-seek-demo.wav"
    local pre = Gst.parse_launch(
        "audiotestsrc num-buffers=600 samplesperbuffer=441 freq=440 ! " +
        "audioconvert ! wavenc ! filesink location=" + tmp)
    pre.set_state(Gst.State.playing)
    local b = pre.get_bus()
    local m = b.timed_pop_filtered(GLib.MAXINT64,
                  Gst.MessageType.eos + Gst.MessageType.error)
    pre.set_state(Gst.State["null"])
    if (m == null || m.type == Gst.MessageType.error) {
        print("failed to synthesise source\n"); return
    }
    uri = Gst.filename_to_uri(tmp)
}
print("uri: " + uri + "\n")

local pipe = Gst.parse_launch("playbin uri=" + uri)
if (pipe == null) { print("parse_launch failed\n"); return }

if (analyse) {
    local vfake = Gst.ElementFactory.make("fakesink", "vfake")
    local afake = Gst.ElementFactory.make("fakesink", "afake")
    vfake.set_property("sync", true)
    afake.set_property("sync", true)
    pipe.set_property("video-sink", vfake)
    pipe.set_property("audio-sink", afake)
}

pipe.set_state(Gst.State.paused)
local bus = pipe.get_bus()
local mask = Gst.MessageType.async_done + Gst.MessageType.error + Gst.MessageType.eos

// Wait for preroll.
local prerolled = false
local dl = GLib.get_monotonic_time() + 5 * 1000 * 1000
while (GLib.get_monotonic_time() < dl) {
    local msg = bus.timed_pop_filtered(200 * 1000 * 1000, mask)
    if (msg == null) continue
    if (msg.type == Gst.MessageType.async_done) { prerolled = true; break }
    if (msg.type == Gst.MessageType.error) {
        print("[error] " + msg.parse_error()[0] + "\n"); break
    }
}
if (!prerolled) { print("preroll timed out\n"); pipe.set_state(Gst.State["null"]); return }

local dur = pipe.query_duration(Gst.Format.time)
print("duration: " + (typeof(dur) == "integer" ? (dur / 1000000000.0) + "s" : "unknown") + "\n")

// Seek to halfway, then play.
local flags = Gst.SeekFlags.flush + Gst.SeekFlags.key_unit
local half  = (typeof(dur) == "integer" && dur > 0) ? (dur / 2) : (2 * 1000000000)
print("seeking to " + (half / 1000000000.0) + "s\n")
pipe.seek_simple(Gst.Format.time, flags, half)
pipe.set_state(Gst.State.playing)

local end = GLib.get_monotonic_time() + duration * 1000 * 1000
local m2 = Gst.MessageType.eos + Gst.MessageType.error
while (GLib.get_monotonic_time() < end) {
    local wait = (end - GLib.get_monotonic_time()) * 1000
    local msg = bus.timed_pop_filtered(wait, m2)
    if (msg == null) continue
    if (msg.type == Gst.MessageType.eos) { print("[eos]\n"); break }
    if (msg.type == Gst.MessageType.error) {
        print("[error] " + msg.parse_error()[0] + "\n"); break
    }
}
pipe.set_state(Gst.State["null"])
