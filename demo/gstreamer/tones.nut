/**
 * demo/gstreamer/tones.nut
 *
 * Synthesise a short tone sequence using element-factory + properties
 * rather than parse_launch. Sends the audio to a fakesink and prints the
 * level / element messages from the bus, exercising:
 *
 *   - Gst.ElementFactory.make (create+name)
 *   - Gst.Pipeline.add / Gst.Element.link
 *   - GObject.set_property / set on integer, double, enum properties
 *   - Bus.timed_pop_filtered draining
 *   - State change → playing → paused → playing → null
 *
 * Usage:
 *   ./build/sqgi demo/gstreamer/tones.nut                # 3 tones, fakesink
 *   ./build/sqgi demo/gstreamer/tones.nut --audible      # to autoaudiosink
 */

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

local audible = false
foreach (i, a in vargv) {
    if (a == "--audible") audible = true
    else if (a == "--help" || a == "-h") {
        print("Usage: sqgi demo/gstreamer/tones.nut [--audible]\n")
        return
    }
}

// ── Build pipeline by hand ──────────────────────────────────────────────────

local src     = Gst.ElementFactory.make("audiotestsrc", "src")
local convert = Gst.ElementFactory.make("audioconvert", "convert")
local sink    = Gst.ElementFactory.make(audible ? "autoaudiosink" : "fakesink", "sink")

if (src == null || convert == null || sink == null) {
    print("Failed to create one or more elements\n")
    return
}

// audiotestsrc: 0=sine, freq in Hz, volume 0..1, num-buffers caps duration.
// 256 frames * 43 buffers ≈ 250ms at 44.1kHz; we cycle through 3 tones below.
src.set_property("wave",          0)        // sine
src.set_property("samplesperbuffer", 256)
src.set_property("num-buffers",   43)
src.set_property("freq",          440.0)
src.set_property("volume",        0.2)

if (!audible) sink.set_property("sync", false)  // run as fast as possible

local pipe = Gst.Pipeline.new("tones")
pipe.add(src)
pipe.add(convert)
pipe.add(sink)
if (!src.link(convert) || !convert.link(sink)) {
    print("Linking failed\n")
    return
}

local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error + Gst.MessageType.state_changed

// ── Play three short tones, mutating freq between them ─────────────────────

local tones = [440.0, 554.37, 659.25]   // A4, C#5, E5  (A major chord, broken)

foreach (i, hz in tones) {
    src.set_property("freq", hz)
    print(format("[%d/%d] tone %.2f Hz\n", i + 1, tones.len(), hz))

    pipe.set_state(Gst.State.playing)

    // Drain until EOS (audiotestsrc emits EOS once num-buffers is reached)
    local done = false
    while (!done) {
        local msg = bus.timed_pop_filtered(GLib.MAXINT64, mask)
        if (msg == null) break
        local t = msg.type
        if (t == Gst.MessageType.error) {
            local r = msg.parse_error()
            print("  ERROR: " + r[0] + "\n")
            done = true
        } else if (t == Gst.MessageType.eos) {
            done = true
        }
    }

    // Rewind: drop to READY so num-buffers counter resets on next PLAYING.
    pipe.set_state(Gst.State.ready)
}

pipe.set_state(Gst.State["null"])
print("done.\n")
