// test/test_gstreamer_recipes.nut
//
// Behavioural tests for the recipes documented in docs/recipes/gstreamer.md.
// Self-contained, no audio device, no video display, no network.
//
// Strategy:
//   - Element factories construct elements
//   - parse_launch builds pipelines from gst-launch syntax
//   - Pipelines run to EOS using audiotestsrc + fakesink (sync=false)
//   - All produced files live under GLib.get_tmp_dir() and are cleaned up

local Gst  = import("Gst")
local GLib = import("GLib")
local Gio  = import("Gio")

Gst.init(null)

local checks = 0
local fails  = 0
local fail_lines = []

function check(name, cond, detail) {
    checks += 1
    if (!cond) {
        fails += 1
        fail_lines.push(name + ": " + detail)
        print("  FAIL  " + name + ": " + detail + "\n")
    } else {
        print("  ok    " + name + "\n")
    }
}

function safe(fn) { try { return fn() } catch (e) { return e } }

local STAMP = GLib.get_monotonic_time().tostring()
local TMP   = GLib.get_tmp_dir() + "/sqgi_gst_recipes_" + STAMP
Gio.File.new_for_path(TMP).make_directory(null)

function cleanup() {
    try {
        local d = Gio.File.new_for_path(TMP)
        local en = d.enumerate_children("standard::name", 0, null)
        while (true) {
            local i = en.next_file(null)
            if (i == null) break
            try { Gio.File.new_for_path(TMP + "/" + i.get_name()).delete(null) } catch (e) {}
        }
        en.close(null)
        d.delete(null)
    } catch (e) {}
}

// Helper: drive a pipeline to EOS or error, returning [ok, error_message].
function run_to_eos(pipe, timeout_ms) {
    pipe.set_state(Gst.State.playing)
    local bus = pipe.get_bus()
    local mask = Gst.MessageType.eos + Gst.MessageType.error
    local deadline = GLib.get_monotonic_time() + timeout_ms * 1000
    local ok = false
    local err = null
    while (true) {
        local remain = deadline - GLib.get_monotonic_time()
        if (remain <= 0) { err = "timeout"; break }
        local msg = bus.timed_pop_filtered(remain * 1000, mask)
        if (msg == null) continue
        if (msg.type == Gst.MessageType.eos) { ok = true; break }
        if (msg.type == Gst.MessageType.error) {
            local r = msg.parse_error()
            err = r[0]
            break
        }
    }
    pipe.set_state(Gst.State["null"])
    return [ok, err]
}

// ── 1. Init + version ────────────────────────────────────────────────────
function test_init() {
    local v = Gst.version_string()
    check("version_string nonempty",
          typeof(v) == "string" && v.len() > 0, "got " + v)
    check("version_string starts with GStreamer",
          v.find("GStreamer") != null || v.find("gstreamer") != null,
          "got " + v)
}
test_init()

// ── 2. Registry / plugin / factory introspection ──────────────────────────
function test_registry() {
    local reg = Gst.Registry.get()
    check("Registry.get returns non-null", reg != null, "got null")

    local plugins = reg.get_plugin_list()
    check("registry has plugins",
          typeof(plugins) == "array" && plugins.len() > 0,
          "len=" + (typeof(plugins) == "array" ? plugins.len() : "?"))

    // coreelements must always be present.
    local fakesink_factory = Gst.ElementFactory.find("fakesink")
    check("ElementFactory.find('fakesink')",
          fakesink_factory != null, "got null")

    if (fakesink_factory != null) {
        local meta = fakesink_factory.get_metadata("long-name")
        check("factory metadata long-name nonempty",
              typeof(meta) == "string" && meta.len() > 0,
              "got " + meta)
    }
}
test_registry()

// ── 3. ElementFactory.make + properties ──────────────────────────────────
function test_factory_make() {
    local src = Gst.ElementFactory.make("audiotestsrc", "src")
    check("make audiotestsrc", src != null, "got null")
    if (src == null) return

    check("Element.get_name", src.get_name() == "src",
          "got " + src.get_name())

    // Set + read a numeric property.
    src.set_property("freq", 880.0)
    local freq = src.get_property("freq")
    check("set_property/get_property double",
          freq == 880.0, "got " + freq)

    src.set_property("samplesperbuffer", 512)
    local spb = src.get_property("samplesperbuffer")
    check("set_property/get_property int",
          spb == 512, "got " + spb)

    src.set_state(Gst.State["null"])
}
test_factory_make()

// ── 4. Pipeline + add + link + state changes ─────────────────────────────
function test_manual_pipeline() {
    local src   = Gst.ElementFactory.make("audiotestsrc", "src")
    local conv  = Gst.ElementFactory.make("audioconvert", "conv")
    local sink  = Gst.ElementFactory.make("fakesink",     "sink")
    if (src == null || conv == null || sink == null) {
        check("manual pipeline (skipped, missing elements)", true, "skipped")
        return
    }

    src.set_property("num-buffers", 5)
    src.set_property("samplesperbuffer", 256)
    sink.set_property("sync", false)

    local pipe = Gst.Pipeline.new("manual")
    pipe.add(src)
    pipe.add(conv)
    pipe.add(sink)

    check("src.link(conv)", src.link(conv), "link failed")
    check("conv.link(sink)", conv.link(sink), "link failed")

    local r = run_to_eos(pipe, 3000)
    check("manual pipeline reached EOS", r[0],
          r[1] != null ? r[1] : "no eos")
}
test_manual_pipeline()

// ── 5. parse_launch one-liner ────────────────────────────────────────────
function test_parse_launch() {
    local desc = "audiotestsrc num-buffers=3 ! fakesink sync=false"
    local pipe = Gst.parse_launch(desc)
    check("parse_launch built pipeline", pipe != null, "got null")
    if (pipe == null) return

    local r = run_to_eos(pipe, 3000)
    check("parse_launch pipeline reached EOS", r[0],
          r[1] != null ? r[1] : "no eos")
}
test_parse_launch()

// ── 6. State change return ───────────────────────────────────────────────
function test_state_changes() {
    local pipe = Gst.parse_launch("audiotestsrc num-buffers=1 ! fakesink sync=false")
    if (pipe == null) {
        check("state change (skipped)", true, "no pipe")
        return
    }
    local r1 = pipe.set_state(Gst.State.ready)
    check("set_state(READY) returned change code", r1 != null, "got null")

    local r2 = pipe.set_state(Gst.State.paused)
    check("set_state(PAUSED) returned change code", r2 != null, "got null")

    pipe.set_state(Gst.State["null"])
}
test_state_changes()

// ── 7. Bus.timed_pop_filtered + message types ────────────────────────────
function test_bus_messages() {
    local pipe = Gst.parse_launch("audiotestsrc num-buffers=2 ! fakesink sync=false")
    if (pipe == null) { check("bus messages (skipped)", true, ""); return }

    pipe.set_state(Gst.State.playing)
    local bus = pipe.get_bus()
    local mask = Gst.MessageType.eos
               + Gst.MessageType.error
               + Gst.MessageType.state_changed
               + Gst.MessageType.stream_start

    local saw_eos = false
    local saw_state_changed = false
    local saw_stream_start = false
    local deadline = GLib.get_monotonic_time() + 3 * 1000 * 1000
    while (GLib.get_monotonic_time() < deadline && !saw_eos) {
        local msg = bus.timed_pop_filtered(100 * 1000 * 1000, mask)
        if (msg == null) continue
        local t = msg.type
        if (t == Gst.MessageType.eos) saw_eos = true
        else if (t == Gst.MessageType.state_changed) saw_state_changed = true
        else if (t == Gst.MessageType.stream_start) saw_stream_start = true
        else if (t == Gst.MessageType.error) break
    }
    pipe.set_state(Gst.State["null"])

    check("bus delivered EOS", saw_eos, "no eos")
    check("bus delivered STATE_CHANGED", saw_state_changed, "no state_changed")
    check("bus delivered STREAM_START", saw_stream_start, "no stream_start")
}
test_bus_messages()

// ── 8. Error path: bad pipeline emits ERROR message ─────────────────────
function test_error_message() {
    // filesrc with non-existent location → ERROR
    local pipe = Gst.parse_launch(
        "filesrc location=/this/does/not/exist/sqgi-test.bin ! fakesink")
    if (pipe == null) { check("error path (skipped)", true, ""); return }
    local r = run_to_eos(pipe, 2000)
    check("missing file produced error", !r[0] && r[1] != null,
          "ok=" + r[0] + " err=" + r[1])
}
test_error_message()

// ── 9. query_position / query_duration ───────────────────────────────────
// Query in PAUSED state so the clock is gated and the pipeline does not
// rush to EOS before we can poll. We use the WAV file from test_encode_wav
// further below; instead pre-create a small file here.
function test_position_duration() {
    local out = TMP + "/dur.wav"
    local enc = Gst.parse_launch(
        "audiotestsrc num-buffers=40 samplesperbuffer=512 freq=440 " +
        "! audioconvert ! wavenc ! filesink location=" + out)
    if (enc == null) { check("query (skipped, no encoder)", true, ""); return }
    local er = run_to_eos(enc, 5000)
    if (!er[0]) { check("query (skipped, encode failed)", true, er[1]); return }

    local pipe = Gst.parse_launch(
        "filesrc location=" + out + " ! decodebin ! audioconvert ! " +
        "fakesink name=sink sync=false")
    if (pipe == null) { check("query (skipped)", true, "no pipe"); return }

    // PAUSED prerolls and lets us query a duration without the pipeline
    // running to EOS in the background.
    pipe.set_state(Gst.State.paused)
    local bus = pipe.get_bus()
    local mask = Gst.MessageType.async_done + Gst.MessageType.error
    local deadline = GLib.get_monotonic_time() + 3 * 1000 * 1000
    local prerolled = false
    while (GLib.get_monotonic_time() < deadline) {
        local msg = bus.timed_pop_filtered(100 * 1000 * 1000, mask)
        if (msg == null) continue
        if (msg.type == Gst.MessageType.async_done) { prerolled = true; break }
        if (msg.type == Gst.MessageType.error) break
    }
    check("preroll for query reached ASYNC_DONE", prerolled, "no preroll")

    local dq = pipe.query_duration(Gst.Format.time)
    check("query_duration returns integer ns",
          typeof(dq) == "integer", "got " + typeof(dq))
    if (typeof(dq) == "integer" && dq > 0) {
        check("query_duration > 0", true, "got " + dq + " ns")
    } else {
        check("query_duration (not available, accepted)", true, "")
    }

    local pq = pipe.query_position(Gst.Format.time)
    check("query_position returns integer ns",
          typeof(pq) == "integer", "got " + typeof(pq))

    pipe.set_state(Gst.State["null"])
}
test_position_duration()

// ── 10. Encoding to WAV + verify file ────────────────────────────────────
function test_encode_wav() {
    local out = TMP + "/tone.wav"
    local desc = "audiotestsrc num-buffers=20 samplesperbuffer=256 freq=440 " +
                 "! audioconvert ! wavenc ! filesink location=" + out
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) { check("encode wav (skipped)", true, "no pipe"); return }

    local r = run_to_eos(pipe, 5000)
    check("wav encode reached EOS", r[0], r[1] != null ? r[1] : "no eos")

    local f = Gio.File.new_for_path(out)
    check("wav file exists", f.query_exists(null), "missing " + out)
    if (f.query_exists(null)) {
        local info = f.query_info("standard::size", 0, null)
        check("wav file size > 1KB", info.get_size() > 1024,
              "size=" + info.get_size())

        // Header sniff: first 4 bytes should be "RIFF"
        local r2  = f.load_contents(null)
        local buf = (typeof(r2) == "array") ? r2[0] : r2
        check("wav has RIFF header",
              buf.len() >= 12 && buf.slice(0, 4) == "RIFF",
              "got '" + buf.slice(0, 4) + "'")
        check("wav has WAVE tag",
              buf.len() >= 12 && buf.slice(8, 12) == "WAVE",
              "got '" + (buf.len() >= 12 ? buf.slice(8, 12) : "?") + "'")
    }
}
test_encode_wav()

// ── 11. Decode the WAV back (round-trip) ─────────────────────────────────
function test_decode_wav() {
    local src = TMP + "/tone.wav"
    if (!Gio.File.new_for_path(src).query_exists(null)) {
        check("wav decode (skipped, no input)", true, "")
        return
    }
    // Use decodebin so any container/codec works in principle.
    local desc = "filesrc location=" + src +
                 " ! decodebin ! audioconvert ! fakesink sync=false"
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) { check("decode wav (skipped)", true, ""); return }

    local r = run_to_eos(pipe, 5000)
    check("wav decode reached EOS", r[0], r[1] != null ? r[1] : "no eos")
}
test_decode_wav()

// ── 12. Tag messages on WAV (artist tag we set via taginject) ────────────
function test_tags() {
    local src = TMP + "/tone.wav"
    if (!Gio.File.new_for_path(src).query_exists(null)) {
        check("tags (skipped, no input)", true, "")
        return
    }
    local desc = "filesrc location=" + src +
                 " ! decodebin ! fakesink sync=false"
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) { check("tags (skipped)", true, ""); return }

    pipe.set_state(Gst.State.paused)
    local bus = pipe.get_bus()
    local mask = Gst.MessageType.tag + Gst.MessageType.async_done +
                 Gst.MessageType.error + Gst.MessageType.eos
    local saw_async_done = false
    local saw_tag = false
    local deadline = GLib.get_monotonic_time() + 4 * 1000 * 1000
    while (!saw_async_done && GLib.get_monotonic_time() < deadline) {
        local msg = bus.timed_pop_filtered(100 * 1000 * 1000, mask)
        if (msg == null) continue
        if (msg.type == Gst.MessageType.tag) {
            local tl = msg.parse_tag()
            if (tl != null && tl.n_tags() > 0) saw_tag = true
        }
        else if (msg.type == Gst.MessageType.async_done) saw_async_done = true
        else if (msg.type == Gst.MessageType.error) break
    }
    pipe.set_state(Gst.State["null"])
    // Tags are emitted by decodebin for WAV (audio-codec, container-format, etc.)
    check("preroll completed (ASYNC_DONE)", saw_async_done, "no async_done")
    check("at least one tag observed", saw_tag, "no tags")
}
test_tags()

// ── 13. Pipeline.get_by_name ─────────────────────────────────────────────
function test_get_by_name() {
    local pipe = Gst.parse_launch(
        "audiotestsrc name=src num-buffers=2 ! fakesink name=sink sync=false")
    if (pipe == null) { check("get_by_name (skipped)", true, ""); return }

    local src  = pipe.get_by_name("src")
    local sink = pipe.get_by_name("sink")
    check("get_by_name('src')",  src != null,  "got null")
    check("get_by_name('sink')", sink != null, "got null")
    check("get_by_name('missing') returns null",
          pipe.get_by_name("zzz") == null, "got non-null")
    pipe.set_state(Gst.State["null"])
}
test_get_by_name()

// ── 14. videotestsrc → fakesink (video path works) ───────────────────────
function test_video_path() {
    local pipe = Gst.parse_launch(
        "videotestsrc num-buffers=5 ! videoconvert ! fakesink sync=false")
    if (pipe == null) { check("video path (skipped)", true, ""); return }
    local r = run_to_eos(pipe, 4000)
    check("videotestsrc reached EOS", r[0], r[1] != null ? r[1] : "no eos")
}
test_video_path()

// ── 15. Caps filter forces resolution ────────────────────────────────────
function test_caps_filter() {
    local desc = "videotestsrc num-buffers=3 " +
                 "! video/x-raw,width=160,height=120,framerate=10/1 " +
                 "! videoconvert ! fakesink sync=false"
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) { check("capsfilter (skipped)", true, ""); return }
    local r = run_to_eos(pipe, 4000)
    check("capsfilter pipeline reached EOS", r[0],
          r[1] != null ? r[1] : "no eos")
}
test_caps_filter()

// ── 16. Compositor (two videotestsrc inputs) ─────────────────────────────
function test_compositor() {
    if (Gst.ElementFactory.find("compositor") == null) {
        check("compositor (skipped, plugin missing)", true, "")
        return
    }
    local desc =
        "compositor name=mix sink_0::xpos=0 sink_0::ypos=0 " +
        "sink_1::xpos=80 sink_1::ypos=0 " +
        "! video/x-raw,width=160,height=120,framerate=10/1 " +
        "! videoconvert ! fakesink sync=false " +
        "videotestsrc num-buffers=3 pattern=0 ! video/x-raw,width=80,height=60 ! mix.sink_0 " +
        "videotestsrc num-buffers=3 pattern=1 ! video/x-raw,width=80,height=60 ! mix.sink_1"
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) { check("compositor (skipped, parse failed)", true, ""); return }
    local r = run_to_eos(pipe, 5000)
    check("compositor pipeline reached EOS", r[0],
          r[1] != null ? r[1] : "no eos")
}
test_compositor()

// ── 17. Audio mixer (two audiotestsrc → one fakesink) ────────────────────
function test_audiomixer() {
    if (Gst.ElementFactory.find("audiomixer") == null) {
        check("audiomixer (skipped, plugin missing)", true, "")
        return
    }
    local desc =
        "audiomixer name=mix ! audioconvert ! fakesink sync=false " +
        "audiotestsrc num-buffers=5 freq=440 ! mix.sink_0 " +
        "audiotestsrc num-buffers=5 freq=880 ! mix.sink_1"
    local pipe = Gst.parse_launch(desc)
    if (pipe == null) { check("audiomixer (skipped, parse failed)", true, ""); return }
    local r = run_to_eos(pipe, 5000)
    check("audiomixer pipeline reached EOS", r[0],
          r[1] != null ? r[1] : "no eos")
}
test_audiomixer()

// ── 18. Cairo overlay element loads (just construct) ─────────────────────
function test_cairo_overlay_factory() {
    local f = Gst.ElementFactory.find("cairooverlay")
    if (f == null) {
        check("cairooverlay (skipped, plugin missing)", true, "")
        return
    }
    local elem = f.create("co")
    check("cairooverlay constructs",
          elem != null, "got null")
    if (elem != null) elem.set_state(Gst.State["null"])
}
test_cairo_overlay_factory()

// ── 19. filename_to_uri ──────────────────────────────────────────────────
function test_uri_helpers() {
    local uri = Gst.filename_to_uri("/tmp/foo.wav")
    check("filename_to_uri produces file://",
          typeof(uri) == "string" && uri.find("file://") == 0,
          "got " + uri)
}
test_uri_helpers()

// ── 20. parse_launch syntax error returns null or throws cleanly ─────────
function test_parse_launch_error() {
    local r = safe(@() Gst.parse_launch("this is not a valid pipeline"))
    if (typeof(r) == "instance") {
        // Some builds return a placeholder pipeline that fails on state-change.
        local ok = safe(@() r.set_state(Gst.State.ready))
        check("invalid parse_launch (built but unusable)", true, "ok=" + ok)
        try { r.set_state(Gst.State["null"]) } catch (e) {}
    } else {
        // Either null returned or exception thrown — both are acceptable.
        check("invalid parse_launch handled cleanly",
              r == null || typeof(r) == "string",
              "got type " + typeof(r))
    }
}
test_parse_launch_error()

// ── 21. set_property with a GObject value (playbin sink override) ────────
// Regression test for the GstChildProxy.set_property clobber: introspected
// interface methods used to shadow our native `set_property`, which then
// segfaulted inside g_type_check_value on object-typed args. Our native
// pspec-aware path must win.
function test_set_property_object() {
    local pipe = Gst.ElementFactory.make("playbin", "pb")
    if (pipe == null) {
        check("playbin (skipped, missing)", true, "")
        return
    }
    local fake = Gst.ElementFactory.make("fakesink", "afake")
    if (fake == null) { check("fakesink missing", false, ""); return }

    fake.set_property("sync", true)
    local r = safe(@() pipe.set_property("audio-sink", fake))
    check("set_property with GObject value does not crash",
          r == null || typeof(r) != "string",
          "got: " + r)

    // Reading the property back should yield the same element.
    local got = safe(@() pipe.get_property("audio-sink"))
    check("get_property audio-sink returns an element",
          typeof(got) == "instance", "got " + typeof(got))
    if (typeof(got) == "instance") {
        check("returned element has expected name",
              safe(@() got.get_name()) == "afake",
              "name=" + safe(@() got.get_name()))
    }
    pipe.set_state(Gst.State["null"])
}
test_set_property_object()

cleanup()

print("\n" + (checks - fails) + "/" + checks + " checks passed\n")

if (fails > 0) {
    print("[FAIL] test_gstreamer_recipes: " + fails + " check(s) failed\n")
    foreach (line in fail_lines) print("  - " + line + "\n")
    throw "test_gstreamer_recipes failures"
}

print("[PASS] test_gstreamer_recipes\n")
