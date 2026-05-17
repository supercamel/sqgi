/**
 * demo/gstreamer/record.nut
 *
 * Encode a synthetic sine sweep to a WAV file. Demonstrates a real encode
 * pipeline (audiotestsrc → audioconvert → wavenc → filesink) and busy-loops
 * the bus while occasionally rewriting an audiotestsrc property so the
 * output sweeps through frequencies.
 *
 * Usage:
 *   ./build/sqgi demo/gstreamer/record.nut [out.wav] [--seconds=N]
 *
 * Default: 3-second sweep 220→880 Hz written to /tmp/gsq_sweep.wav.
 *
 * Exercises:
 *   - parse_launch with filesink location=
 *   - Gst.Element.set_state with explicit READY pre-roll
 *   - Bus.timed_pop_filtered shorter than EOS to allow live property edits
 *   - Querying pipeline position via query_position (returns ns as integer, or -1 if unknown)
 */

local Gst  = import("Gst")
local GLib = import("GLib")
local Gio  = import("Gio")

Gst.init(null)

local out_path   = "/tmp/gsq_sweep.wav"
local seconds    = 3
foreach (i, a in vargv) {
    if (a.find("--seconds=") == 0) {
        seconds = a.slice(10).tointeger()
    } else if (a == "--help" || a == "-h") {
        print("Usage: sqgi demo/gstreamer/record.nut [out.wav] [--seconds=N]\n")
        return
    } else if (a.find("--") != 0) {
        out_path = a
    }
}

// Use a generous num-buffers (43 ≈ 250ms at 44.1kHz/256-frame buffers).
// 4 * seconds buffer-blocks gives us ~ seconds of audio.
local num_buffers = 43 * seconds

local desc = "audiotestsrc name=src wave=0 samplesperbuffer=256 num-buffers=" +
              num_buffers + " ! audioconvert ! wavenc ! filesink location=\"" +
              out_path + "\""
print("pipeline: " + desc + "\n")

local pipe = Gst.parse_launch(desc)
if (pipe == null) {
    print("Failed to parse pipeline\n")
    return
}

// Reach the bin's child by name to flip frequency mid-run.
local src = pipe.get_by_name("src")
if (src == null) {
    print("Couldn't find 'src' element\n")
    return
}

src.set_property("freq",   220.0)
src.set_property("volume", 0.3)

pipe.set_state(Gst.State.playing)

local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error

local start_us       = GLib.get_monotonic_time()
local deadline_us    = start_us + seconds * 2 * 1000000   // 2x safety
local done           = false
local exit_code      = 0
local sweep_lo       = 220.0
local sweep_hi       = 880.0

while (!done) {
    // 100ms pump
    local msg = bus.timed_pop_filtered(100 * 1000000, mask)
    if (msg != null) {
        local t = msg.type
        if (t == Gst.MessageType.error) {
            local r = msg.parse_error()
            print("[ERROR] " + r[0] + "\n")
            exit_code = 1
            done = true
        } else if (t == Gst.MessageType.eos) {
            print("[EOS]\n")
            done = true
        }
    }

    // Update freq as a function of position so the sweep is buffer-aligned.
    local pq = pipe.query_position(Gst.Format.time)
    if (typeof(pq) == "integer" && pq > 0) {
        local pos_s = pq / 1000000000.0
        local t     = (seconds > 0) ? (pos_s / seconds) : 0.0
        if (t > 1.0) t = 1.0
        local hz = sweep_lo + (sweep_hi - sweep_lo) * t
        src.set_property("freq", hz)
    }

    if (GLib.get_monotonic_time() >= deadline_us) {
        print("[timeout]\n")
        done = true
        exit_code = 1
    }
}

pipe.set_state(Gst.State["null"])

// Verify the output file looks like WAV (basic header sniff).
local f = Gio.File.new_for_path(out_path)
local info = f.query_info("standard::size", 0, null)
print("wrote " + out_path + " (" + info.get_size() + " bytes)\n")
print(exit_code == 0 ? "OK\n" : "FAILED\n")
