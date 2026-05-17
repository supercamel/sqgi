/**
 * demo/gstreamer/play.nut
 *
 * Minimal GStreamer demo: play a video URI through `playbin` and pump the
 * pipeline bus until EOS or an error. Defaults to streaming "Big Buck Bunny"
 * from test-videos.co.uk.
 *
 * Usage:
 *   ./build/sqgi demo/gstreamer/play.nut [--uri=<URI>] [--audio-only] [--timeout=<sec>]
 *
 * The demo opens a real video window (autovideosink) unless --audio-only is
 * passed.  Pass --timeout=<seconds> to bound the run; the demo otherwise plays
 * until EOS or until you Ctrl-C it.
 */

local Gst  = import("Gst")
local GLib = import("GLib")

// ── Command line parsing ────────────────────────────────────────────────────

local default_uri = "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/Big_Buck_Bunny_360_10s_5MB.mp4"

local uri        = default_uri
local audio_only = false
local timeout_s  = 0   // 0 = unlimited

foreach (i, a in vargv) {
    if (a.find("--uri=") == 0) {
        uri = a.slice(6)
    } else if (a == "--audio-only") {
        audio_only = true
    } else if (a.find("--timeout=") == 0) {
        timeout_s = a.slice(10).tointeger()
    } else if (a == "--help" || a == "-h") {
        print("Usage: sqgi demo/gstreamer/play.nut [--uri=<URI>] [--audio-only] [--timeout=<sec>]\n")
        return
    }
}

// ── Initialise GStreamer ────────────────────────────────────────────────────

Gst.init(null)
print("GStreamer initialised; playing: " + uri + "\n")

// ── Build the pipeline ──────────────────────────────────────────────────────
//
// playbin is GStreamer's high-level playback element — it auto-builds the
// decoding + sink graph for any supported URI.  We use parse_launch so the
// description matches the gst-launch-1.0 command line equivalent:
//
//     gst-launch-1.0 playbin uri=<uri>

local pipeline_desc = "playbin uri=\"" + uri + "\""
if (audio_only) {
    // Discard the video stream by routing it to a fakesink.
    pipeline_desc += " video-sink=fakesink"
}

local pipeline = Gst.parse_launch(pipeline_desc)
if (pipeline == null) {
    print("Failed to build pipeline\n")
    return
}

// ── Helpers ─────────────────────────────────────────────────────────────────

function ns_to_seconds(ns) {
    return ns / 1000000000.0
}

function format_clock(ns) {
    if (ns < 0) return "??:??.???"
    local total_ms = ns / 1000000
    local ms  = total_ms % 1000
    local sec = (total_ms / 1000) % 60
    local min = total_ms / 60000
    return format("%02d:%02d.%03d", min, sec, ms)
}

// ── Start playback ──────────────────────────────────────────────────────────

local change = pipeline.set_state(Gst.State.playing)
print("set_state(PLAYING) returned: " + change + "\n")

local bus = pipeline.get_bus()

// Listen for the messages that matter for a playback session.
local mask = Gst.MessageType.error
           + Gst.MessageType.eos
           + Gst.MessageType.state_changed
           + Gst.MessageType.buffering
           + Gst.MessageType.duration_changed
           + Gst.MessageType.async_done

local start_us  = GLib.get_monotonic_time()
local deadline  = timeout_s > 0 ? start_us + timeout_s * 1000000 : 0
local done      = false
local exit_code = 0

// 250 ms timed pop in nanoseconds — keeps the loop responsive enough to print
// progress while still mostly sleeping in C.
local POP_TIMEOUT_NS = 250 * 1000000

local last_progress_print = 0

while (!done) {
    local msg = bus.timed_pop_filtered(POP_TIMEOUT_NS, mask)

    if (msg != null) {
        local mt = msg.type

        if (mt == Gst.MessageType.error) {
            local r = msg.parse_error()
            print("\n[ERROR] " + r[0] + "\n")
            if (r[1] != null && r[1] != "") {
                print("[debug] " + r[1] + "\n")
            }
            exit_code = 1
            done = true
        }
        else if (mt == Gst.MessageType.eos) {
            print("\n[EOS] End of stream reached.\n")
            done = true
        }
        else if (mt == Gst.MessageType.state_changed) {
            // Filter by element name to avoid spam from internal elements.
            try {
                local s = msg.parse_state_changed()
                local src_name = ""
                try { src_name = msg.src.get_name() } catch (e) {}
                if (src_name == "playbin0" || src_name == "playbin") {
                    print("[state] " + src_name + ": " + s[0] + " -> " + s[1] + "\n")
                }
            } catch (e) {
                // Some bindings don't expose parse_state_changed; ignore.
            }
        }
        else if (mt == Gst.MessageType.buffering) {
            local pct = msg.parse_buffering()
            print("\r[buffering] " + pct + "%        ")
        }
        else if (mt == Gst.MessageType.async_done) {
            print("[async-done] pipeline ready\n")
        }
        else if (mt == Gst.MessageType.duration_changed) {
            print("[duration-changed]\n")
        }
    }

    // Periodic position/duration progress line.
    local now_us = GLib.get_monotonic_time()
    if (now_us - last_progress_print >= 500000) {
        last_progress_print = now_us
        try {
            local pos = pipeline.query_position(Gst.Format.time)
            local dur = pipeline.query_duration(Gst.Format.time)
            // Both queries return an integer in nanoseconds (or -1 / 0).
            if (typeof(pos) == "integer" && typeof(dur) == "integer" && pos >= 0 && dur > 0) {
                print("\r[playing] " + format_clock(pos) + " / " + format_clock(dur) + "    ")
            } else if (typeof(pos) == "integer" && pos >= 0) {
                print("\r[playing] " + format_clock(pos) + "        ")
            }
        } catch (e) {
            // Position/duration queries may not be supported yet — ignore.
        }
    }

    if (deadline > 0 && now_us >= deadline) {
        print("\n[timeout] Reached --timeout limit.\n")
        done = true
    }
}

// ── Shutdown ────────────────────────────────────────────────────────────────

pipeline.set_state(Gst.State["null"])
print("Stopped.\n")
