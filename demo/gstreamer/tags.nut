/**
 * demo/gstreamer/tags.nut
 *
 * Pre-roll a media URI through a discoverer-style pipeline (filesrc/uridecode
 * + decodebin + fakesink) and dump every TAG message the bus emits, plus the
 * combined TagList once preroll completes (ASYNC_DONE).
 *
 * Usage:
 *   ./build/sqgi demo/gstreamer/tags.nut <file-or-uri>
 *   ./build/sqgi demo/gstreamer/tags.nut /tmp/gsq_sweep.wav
 *
 * Exercises:
 *   - Gst.MessageType.tag dispatch
 *   - Gst.Message.parse_tag → Gst.TagList
 *   - TagList.to_string / n_tags
 *   - URI vs path heuristic + Gst.filename_to_uri
 *
 * The demo will exit non-zero with an explanation if the URI can't be opened
 * (so it doubles as a quick "is this media file readable?" check).
 */

local Gst  = import("Gst")
local GLib = import("GLib")

Gst.init(null)

if (vargv.len() < 1) {
    print("Usage: sqgi demo/gstreamer/tags.nut <file-or-uri>\n")
    print("       (try: demo/gstreamer/tags.nut /tmp/gsq_sweep.wav)\n")
    return
}

local arg = vargv[0]
local is_uri = (arg.find("://") != null)
local uri = is_uri ? arg : Gst.filename_to_uri(arg)
print("URI: " + uri + "\n")

// uridecodebin is the most portable preroll element: it autodetects the
// container/codec, fans out elementary streams, and emits tags as a side
// effect. We sink each pad into a fakesink so the pipeline reaches PAUSED.
local desc = "uridecodebin uri=\"" + uri + "\" name=dec ! fakesink"
local pipe = Gst.parse_launch(desc)
if (pipe == null) {
    print("Pipeline build failed\n")
    return
}

local change = pipe.set_state(Gst.State.paused)
print("set_state(PAUSED) -> " + change + "\n")

local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos       + Gst.MessageType.error
           + Gst.MessageType.tag       + Gst.MessageType.async_done
           + Gst.MessageType.warning

local tag_count = 0
local done      = false
local exit_code = 0
local deadline_us = GLib.get_monotonic_time() + 5 * 1000000   // 5 seconds

while (!done) {
    local remaining_us = deadline_us - GLib.get_monotonic_time()
    if (remaining_us <= 0) {
        print("[timeout]\n")
        exit_code = 1
        break
    }
    local msg = bus.timed_pop_filtered(remaining_us * 1000, mask)
    if (msg == null) continue
    local t = msg.type

    if (t == Gst.MessageType.tag) {
        tag_count++
        local tl = msg.parse_tag()
        if (tl != null) {
            print("[tag #" + tag_count + "] (" + tl.n_tags() + " entries)\n")
            // to_string produces a single-line gst-launch-style dump that's
            // good enough for a demo; structured iteration would need
            // TagList.foreach which takes a callback.
            print("  " + tl.to_string() + "\n")
        }
    } else if (t == Gst.MessageType.async_done) {
        print("[async-done] preroll complete (" + tag_count + " tag messages total)\n")
        done = true
    } else if (t == Gst.MessageType.error) {
        local r = msg.parse_error()
        print("[ERROR] " + r[0] + "\n")
        if (r[1] != null) print("[debug] " + r[1] + "\n")
        exit_code = 1
        done = true
    } else if (t == Gst.MessageType.warning) {
        print("[warning]\n")
    } else if (t == Gst.MessageType.eos) {
        done = true
    }
}

pipe.set_state(Gst.State["null"])
print(exit_code == 0 ? "OK\n" : "FAILED\n")
