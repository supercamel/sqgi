// demo/gstreamer/http_stream.nut
//
// Stream a video over HTTP and play it.
//
// Walk-through:
//   - playbin handles HTTP, demuxing, decoding and rendering on its own
//   - the bus is pumped for ERROR / EOS / BUFFERING / state messages
//   - playback finishes either when the file ends or --duration elapses
//
// Run (headless analysis, no display):
//     sqgi demo/gstreamer/http_stream.nut --analyse
//
// Run with display (auto-detected sink):
//     sqgi demo/gstreamer/http_stream.nut
//
// Flags:
//     --uri=...        override the URI (must be playable by playbin)
//     --duration=N     stop after N seconds (default: 8)
//     --analyse        force fakesink for video/audio (no display, no audio)
//     --verbose        print every bus message
//
// Notes:
//     The default URI is a small Big Buck Bunny clip served by
//     test-videos.co.uk. If the host is unreachable the demo prints a
//     diagnostic and exits non-zero.

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local DEFAULT_URI =
    "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/Big_Buck_Bunny_360_10s_1MB.mp4"

local uri      = DEFAULT_URI
local duration = 8
local analyse  = false
local verbose  = false

foreach (a in vargv) {
    if (a == "--analyse" || a == "--analyze") analyse = true
    else if (a == "--verbose") verbose = true
    else if (a.find("--uri=") == 0)      uri = a.slice(6)
    else if (a.find("--duration=") == 0) duration = a.slice(11).tointeger()
}

print("URI       : " + uri + "\n")
print("Duration  : " + duration + " s\n")
print("Mode      : " + (analyse ? "analyse (fakesinks)" : "auto sinks") + "\n\n")

local pipe = Gst.parse_launch("playbin uri=" + uri)
if (pipe == null) { print("parse_launch failed\n"); return }

if (analyse) {
    // Replace video/audio sinks with fakesinks so we don't need a display.
    local vfake = Gst.ElementFactory.make("fakesink", "vfake")
    local afake = Gst.ElementFactory.make("fakesink", "afake")
    vfake.set_property("sync", true)
    afake.set_property("sync", true)
    pipe.set_property("video-sink", vfake)
    pipe.set_property("audio-sink", afake)
}

pipe.set_state(Gst.State.playing)

local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos
           + Gst.MessageType.error
           + Gst.MessageType.warning
           + Gst.MessageType.buffering
           + Gst.MessageType.state_changed
           + Gst.MessageType.async_done

local deadline = GLib.get_monotonic_time() + duration * 1000 * 1000
local exit_code = 0
local last_pct  = -1

while (true) {
    local now = GLib.get_monotonic_time()
    if (now >= deadline) { print("\n[duration reached]\n"); break }

    local remaining_ns = (deadline - now) * 1000        // µs → ns
    if (remaining_ns > 200 * 1000 * 1000) remaining_ns = 200 * 1000 * 1000

    local msg = bus.timed_pop_filtered(remaining_ns, mask)
    if (msg == null) continue

    local t = msg.type
    if (t == Gst.MessageType.error) {
        local r = msg.parse_error()
        print("[ERROR] " + r[0] + "\n")
        if (verbose && r.len() > 1) print("        debug: " + r[1] + "\n")
        exit_code = 1
        break
    }
    else if (t == Gst.MessageType.eos) {
        print("[EOS]\n"); break
    }
    else if (t == Gst.MessageType.buffering) {
        local pct = msg.parse_buffering()
        if (pct != last_pct) {
            print("[buffering] " + pct + "%\n")
            last_pct = pct
        }
    }
    else if (t == Gst.MessageType.async_done) {
        print("[async-done] preroll complete\n")
    }
    else if (verbose) {
        print("[msg] type=" + t + "\n")
    }
}

pipe.set_state(Gst.State["null"])
print("exit " + exit_code + "\n")
