# GStreamer Cookbook

Recipes for building and driving GStreamer pipelines from SQGI: parsing
gst-launch one-liners, hand-rolling pipelines, pumping the bus, querying
positions, encoding to files, streaming video over HTTP, capturing from a
webcam, drawing on top of live video with Cairo, mixing multiple audio
sources, compositing video, transcoding, and the bookkeeping that keeps
everything from leaking.

Every snippet uses the [`Gst`](https://gstreamer.freedesktop.org/documentation/)
namespace. Read [docs/language/](../language/) chapters 9–11 if you need
a refresher on async/await, and skim the [GLib](glib.md) and
[Gio](gio.md) cookbooks for the main-loop and I/O primitives that
GStreamer demos plug into.

Every snippet is runnable with:

```bash
./build/sqgi path/to/script.nut
```

Working scripts for each section live under `demo/gstreamer/`.

## Contents

- [1. Setup and version](#1-setup-and-version)
- [2. `parse_launch` one-liners](#2-parse_launch-one-liners)
- [3. Building pipelines by hand](#3-building-pipelines-by-hand)
- [4. The bus and message types](#4-the-bus-and-message-types)
- [5. State machine: NULL → READY → PAUSED → PLAYING](#5-state-machine-null--ready--paused--playing)
- [6. Element properties](#6-element-properties)
- [7. Pads, caps, and capsfilter](#7-pads-caps-and-capsfilter)
- [8. URI playback with `playbin`](#8-uri-playback-with-playbin)
- [9. Streaming video over HTTP](#9-streaming-video-over-http)
- [10. Webcam capture (`v4l2src`)](#10-webcam-capture-v4l2src)
- [11. Drawing on live video with Cairo](#11-drawing-on-live-video-with-cairo)
- [12. Multiple audio streams with `audiomixer`](#12-multiple-audio-streams-with-audiomixer)
- [13. Video compositing / picture-in-picture](#13-video-compositing--picture-in-picture)
- [14. Tags and metadata](#14-tags-and-metadata)
- [15. Position, duration, and seeking](#15-position-duration-and-seeking)
- [16. Encoding audio to a file](#16-encoding-audio-to-a-file)
- [17. Transcoding](#17-transcoding)
- [18. `tee`: one source, many sinks](#18-tee-one-source-many-sinks)
- [19. Video filters (flip, crop, scale, rate)](#19-video-filters-flip-crop-scale-rate)
- [20. Registry introspection](#20-registry-introspection)
- [21. Pitfalls](#21-pitfalls)
- [22. Further reading](#22-further-reading)

---

## 1. Setup and version

Always call `Gst.init(null)` before constructing any element. Calling it
more than once is harmless.

```squirrel
local Gst = import("Gst")
Gst.init(null)
print(Gst.version_string() + "\n")    // → "GStreamer 1.24.2"
```

Demo: [demo/gstreamer/info.nut](../../demo/gstreamer/info.nut).

## 2. `parse_launch` one-liners

The fastest way to build a pipeline is the same syntax `gst-launch-1.0`
takes:

```squirrel
local pipe = Gst.parse_launch(
    "audiotestsrc num-buffers=20 ! audioconvert ! wavenc ! filesink location=/tmp/tone.wav")
pipe.set_state(Gst.State.playing)
local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error
bus.timed_pop_filtered(GLib.MAXINT64, mask)
pipe.set_state(Gst.State["null"])
```

Notes:

- Use `Gst.State["null"]` (bracket-indexing) for the NULL state because
  `null` is a Squirrel keyword.
- `Gst.MessageType` values combine with `+` to form a mask.
- `GLib.MAXINT64` means "wait forever". Pass nanoseconds for finite
  timeouts.

A bad description either returns `null` or constructs a partial pipeline
that fails on `set_state`. Guard both.

## 3. Building pipelines by hand

When you need to wire up signals on a specific element, build it by hand:

```squirrel
local pipe = Gst.Pipeline.new("manual")
local src  = Gst.ElementFactory.make("audiotestsrc", "src")
local conv = Gst.ElementFactory.make("audioconvert", "conv")
local sink = Gst.ElementFactory.make("fakesink",     "sink")

src.set_property("num-buffers", 5)
src.set_property("freq",        880.0)
sink.set_property("sync",       false)

pipe.add(src)
pipe.add(conv)
pipe.add(sink)

if (!src.link(conv) || !conv.link(sink)) {
    throw "failed to link pipeline"
}
```

`Pipeline.add` takes one element at a time. `Element.link(other)` returns
a bool — always check it because pad mismatches fail silently otherwise.

Demo: [demo/gstreamer/tones.nut](../../demo/gstreamer/tones.nut).

## 4. The bus and message types

`pipe.get_bus()` returns a bus you poll with `timed_pop_filtered(ns, mask)`:

```squirrel
local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos
           + Gst.MessageType.error
           + Gst.MessageType.warning
           + Gst.MessageType.buffering
           + Gst.MessageType.state_changed
           + Gst.MessageType.async_done

while (true) {
    local msg = bus.timed_pop_filtered(500 * 1000 * 1000, mask)   // 500ms
    if (msg == null) continue
    local t = msg.type
    if (t == Gst.MessageType.error) {
        local r = msg.parse_error()
        print("[ERROR] " + r[0] + " (" + r[1] + ")\n")
        break
    }
    else if (t == Gst.MessageType.eos)         { print("[EOS]\n"); break }
    else if (t == Gst.MessageType.buffering)   print("buffering " + msg.parse_buffering() + "%\n")
    else if (t == Gst.MessageType.async_done)  print("preroll complete\n")
    else if (t == Gst.MessageType.state_changed) {
        local s = msg.parse_state_changed()
        print("state " + s[0] + " → " + s[1] + "\n")
    }
}
```

Message accessors used above:

| accessor                  | returns                          |
|---------------------------|----------------------------------|
| `msg.parse_error()`       | `[error_message, debug_message]` |
| `msg.parse_state_changed()` | `[old_state, new_state]`       |
| `msg.parse_buffering()`   | percentage (integer 0–100)       |
| `msg.parse_tag()`         | a `Gst.TagList`                  |

Demo: [demo/gstreamer/play.nut](../../demo/gstreamer/play.nut).

## 5. State machine: NULL → READY → PAUSED → PLAYING

`pipe.set_state(target)` is asynchronous — preroll completes via an
`async-done` message. Common transitions:

- `Gst.State["null"]` — fully shut down; no resources held.
- `Gst.State.ready` — elements opened (e.g. file handles).
- `Gst.State.paused` — pre-rolled; first buffer rendered (paused).
- `Gst.State.playing` — running.

Always tear down with `pipe.set_state(Gst.State["null"])`. Skipping this
leaks file descriptors, decoders, and X11/Wayland surfaces.

## 6. Element properties

Elements expose properties via `set_property(name, value)` /
`get_property(name)`. Types follow GLib's:

- Bool: `sink.set_property("sync", true)`
- Int: `src.set_property("num-buffers", 100)`
- Double: `src.set_property("freq", 440.0)`
- String: `filesink.set_property("location", "/tmp/out.wav")`

`pipe.get_by_name("name")` retrieves an element by its instance name
when you built the pipeline through `parse_launch`:

```squirrel
local pipe = Gst.parse_launch("audiotestsrc name=src ! fakesink name=sink")
local src  = pipe.get_by_name("src")
src.set_property("freq", 880.0)
```

Object-valued properties work too — e.g. you can swap a `playbin`'s
sinks at runtime:

```squirrel
local pipe = Gst.ElementFactory.make("playbin", "pb")
local vfake = Gst.ElementFactory.make("fakesink", "v")
local afake = Gst.ElementFactory.make("fakesink", "a")
pipe.set_property("video-sink", vfake)
pipe.set_property("audio-sink", afake)
```

## 7. Pads, caps, and capsfilter

Force a specific resolution or framerate by inserting a caps string
between elements (this is the "capsfilter" element in disguise):

```squirrel
local desc =
    "videotestsrc num-buffers=30 ! " +
    "video/x-raw,width=320,height=240,framerate=30/1 ! " +
    "videoconvert ! fakesink sync=false"
local pipe = Gst.parse_launch(desc)
```

For elements with request pads (e.g. `tee`, `audiomixer`, `compositor`),
gst-launch's `name=foo` plus `foo.sink_0` / `foo.sink_1` syntax requests
the pads for you.

## 8. URI playback with `playbin`

`playbin` is a self-contained URI player. Give it any URI the system can
decode:

```squirrel
local pipe = Gst.parse_launch("playbin uri=" + Gst.filename_to_uri("/tmp/a.wav"))
pipe.set_state(Gst.State.playing)
// pump the bus as in §4
pipe.set_state(Gst.State["null"])
```

`Gst.filename_to_uri(path)` builds a properly-escaped `file://` URI from
an absolute path.

Demo: [demo/gstreamer/play.nut](../../demo/gstreamer/play.nut).

## 9. Streaming video over HTTP

Plain HTTP / HTTPS URIs work with `playbin` because `souphttpsrc` is the
default HTTP source on Linux:

```squirrel
local pipe = Gst.parse_launch(
    "playbin uri=https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/" +
    "Big_Buck_Bunny_360_10s_1MB.mp4")
pipe.set_state(Gst.State.playing)
```

Watch for `Gst.MessageType.buffering` messages: if the percentage drops
below 100 you should pause until it climbs back. The demo prints every
percentage change.

For a headless run that avoids opening a window, swap playbin's sinks
for `fakesink`s before starting playback:

```squirrel
local pipe = Gst.ElementFactory.make("playbin", "pb")
pipe.set_property("uri", uri)
pipe.set_property("video-sink", Gst.ElementFactory.make("fakesink", "v"))
pipe.set_property("audio-sink", Gst.ElementFactory.make("fakesink", "a"))
```

Demo: [demo/gstreamer/http_stream.nut](../../demo/gstreamer/http_stream.nut).

## 10. Webcam capture (`v4l2src`)

```squirrel
local desc =
    "v4l2src device=/dev/video0 ! " +
    "videoconvert ! videoscale ! " +
    "video/x-raw,width=640,height=480,framerate=30/1 ! " +
    "videoconvert ! autovideosink sync=true"
local pipe = Gst.parse_launch(desc)
```

Detecting cameras: enumerate `/dev/video*` via Gio:

```squirrel
local Gio = import("Gio")
local en  = Gio.File.new_for_path("/dev").enumerate_children("standard::name", 0, null)
while (true) {
    local i = en.next_file(null); if (i == null) break
    if (i.get_name().find("video") == 0) print("/dev/" + i.get_name() + "\n")
}
en.close(null)
```

Demo: [demo/gstreamer/webcam.nut](../../demo/gstreamer/webcam.nut).

## 11. Drawing on live video with Cairo

The `cairooverlay` element calls back into Squirrel once per frame with a
real `cairo.Context`. SQGI wraps the boxed Cairo type for you so the
handler gets the same `cr` you use elsewhere.

```squirrel
local pipe = Gst.parse_launch(
    "videotestsrc ! video/x-raw,format=BGRA,width=480,height=270,framerate=30/1 " +
    "! videoconvert ! cairooverlay name=co ! videoconvert ! autovideosink sync=true")
local co = pipe.get_by_name("co")

// SQGI strips the emitting element from signal handlers, so the handler
// receives (cairo_context, timestamp_ns, duration_ns) — three args, NOT four.
co.connect("draw", function (cr, ts_ns, dur_ns) {
    local secs = ts_ns / 1000000000.0
    cr.set_source_rgba(1, 1, 1, 0.6)
    cr.move_to(10, 22)
    cr.set_font_size(14.0)
    cr.show_text(format("ts=%.2fs", secs))
})
```

`cairooverlay`'s "draw" signal is fired from the streaming thread.
SQGI marshals it back to the VM thread through a `GMainContext` idle
source. **Your code must pump that context for handlers to fire**:

```squirrel
local ctx = GLib.MainContext.default()
while (!done) {
    while (ctx.iteration(false)) {}                             // dispatch
    local msg = bus.timed_pop_filtered(20 * 1000 * 1000, mask)  // 20 ms
    if (msg == null) continue
    // …
}
while (ctx.iteration(false)) {}                                 // drain
```

Otherwise the bus pop blocks the VM thread and the idle sources never
run.

Demo: [demo/gstreamer/cairo_overlay.nut](../../demo/gstreamer/cairo_overlay.nut).

## 12. Multiple audio streams with `audiomixer`

`audiomixer` is a request-pad element: feed it `sink_0`, `sink_1`, …

```squirrel
local desc =
    "audiomixer name=mix ! audioconvert ! audioresample ! autoaudiosink " +
    "audiotestsrc num-buffers=200 freq=440 ! volume volume=0.30 ! mix.sink_0 " +
    "audiotestsrc num-buffers=200 freq=660 ! volume volume=0.20 ! mix.sink_1 " +
    "audiotestsrc num-buffers=200 freq=880 ! volume volume=0.20 ! mix.sink_2 "
local pipe = Gst.parse_launch(desc)
```

Use `volume` elements per branch for independent gain. `audioconvert` +
`audioresample` after the mixer normalise format and rate before the
sink.

Demo: [demo/gstreamer/audio_mix.nut](../../demo/gstreamer/audio_mix.nut).

## 13. Video compositing / picture-in-picture

`compositor` accepts request pads with per-pad position and alpha:

```squirrel
local desc =
    "compositor name=mix background=black " +
    "sink_0::xpos=0   sink_0::ypos=0   sink_0::alpha=1.0 " +
    "sink_1::xpos=480 sink_1::ypos=270 sink_1::alpha=1.0 " +
    "! video/x-raw,width=640,height=360,framerate=30/1 ! videoconvert ! autovideosink " +
    "videotestsrc pattern=smpte ! video/x-raw,width=640,height=360 ! mix.sink_0 " +
    "videotestsrc pattern=ball  ! video/x-raw,width=160,height=90  ! mix.sink_1 "
```

Per-pad properties use the `sinkN::prop=value` syntax. Common compositor
pad properties: `xpos`, `ypos`, `alpha`, `zorder`, `width`, `height`.

Demo: [demo/gstreamer/compositor_pip.nut](../../demo/gstreamer/compositor_pip.nut).

## 14. Tags and metadata

`uridecodebin` reports tags on the bus as it pre-rolls. Subscribe to
`Gst.MessageType.tag`:

```squirrel
pipe.set_state(Gst.State.paused)
local mask = Gst.MessageType.tag + Gst.MessageType.async_done + Gst.MessageType.error
while (true) {
    local msg = bus.timed_pop_filtered(100 * 1000 * 1000, mask)
    if (msg == null) continue
    if (msg.type == Gst.MessageType.tag) {
        local tl = msg.parse_tag()
        print("tags: " + tl.n_tags() + "\n" + tl.to_string() + "\n")
    }
    else if (msg.type == Gst.MessageType.async_done) break
    else if (msg.type == Gst.MessageType.error)      break
}
```

`TagList.to_string()` returns a single-line, structured representation.
`n_tags()` returns the count.

Demo: [demo/gstreamer/tags.nut](../../demo/gstreamer/tags.nut).

## 15. Position, duration, and seeking

Both queries return **a single integer in nanoseconds** (or `-1` if the
information is not yet known):

```squirrel
local pos = pipe.query_position(Gst.Format.time)
local dur = pipe.query_duration(Gst.Format.time)
if (typeof(pos) == "integer" && pos >= 0 && typeof(dur) == "integer" && dur > 0) {
    print(format("%.2f / %.2f s\n",
                 pos / 1e9, dur / 1e9))
}
```

> ⚠️ Earlier docs claimed `[ok, value]` tuples — that was wrong. The
> binding returns a plain integer.

Seek to a position once the pipeline is `paused` or `playing`:

```squirrel
local flags = Gst.SeekFlags.flush + Gst.SeekFlags.key_unit
pipe.seek_simple(Gst.Format.time, flags, 3 * 1000000000)        // 3 seconds
```

Useful flag combinations:

- `flush + key_unit`           — fast, snaps to nearest keyframe
- `flush + accurate`           — frame-accurate (slower)
- `flush + key_unit + segment` — segment seek; emits `segment-done` instead of `eos`

Demo: [demo/gstreamer/seek.nut](../../demo/gstreamer/seek.nut).

## 16. Encoding audio to a file

A canonical WAV writer (sweep + buffer count + filesink):

```squirrel
local pipe = Gst.parse_launch(
    "audiotestsrc num-buffers=200 samplesperbuffer=1024 freq=440 ! " +
    "audioconvert ! wavenc ! filesink location=/tmp/tone.wav")
pipe.set_state(Gst.State.playing)
pipe.get_bus().timed_pop_filtered(GLib.MAXINT64,
    Gst.MessageType.eos + Gst.MessageType.error)
pipe.set_state(Gst.State["null"])
```

Common encoders / muxers:

| target           | chain                                |
|------------------|--------------------------------------|
| WAV PCM          | `audioconvert ! wavenc`              |
| Ogg Vorbis       | `audioconvert ! vorbisenc ! oggmux`  |
| Opus in WebM     | `audioconvert ! opusenc ! webmmux`   |
| FLAC             | `audioconvert ! flacenc`             |
| MP3 (lame)       | `audioconvert ! lamemp3enc`          |
| AAC in MP4       | `audioconvert ! avenc_aac ! mp4mux`  |

Demo: [demo/gstreamer/record.nut](../../demo/gstreamer/record.nut).

## 17. Transcoding

Read any source `decodebin` can handle, then re-encode:

```squirrel
local desc = "filesrc location=/tmp/in.wav ! decodebin ! " +
             "audioconvert ! audioresample ! " +
             "vorbisenc ! oggmux ! filesink location=/tmp/out.ogg"
local pipe = Gst.parse_launch(desc)
```

`decodebin` builds the demuxer + decoder chain dynamically once it
sniffs the container. Always insert `audioconvert ! audioresample`
between the decoder and the encoder so format negotiation has room to
work.

Demo: [demo/gstreamer/transcode.nut](../../demo/gstreamer/transcode.nut).

## 18. `tee`: one source, many sinks

`tee` duplicates a stream so several branches can consume the same
buffers. **Every branch downstream of `tee` must begin with a `queue`**
to give each branch its own thread:

```squirrel
local desc =
    "audiotestsrc num-buffers=300 ! audioconvert ! tee name=t " +
    "t. ! queue ! autoaudiosink " +
    "t. ! queue ! wavenc ! filesink location=/tmp/copy.wav "
local pipe = Gst.parse_launch(desc)
```

Without the `queue` elements `tee` will deadlock when one sink blocks.

Demo: [demo/gstreamer/tee_split.nut](../../demo/gstreamer/tee_split.nut).

## 19. Video filters (flip, crop, scale, rate)

```squirrel
local desc =
    "videotestsrc pattern=smpte ! videoconvert ! " +
    "videoflip method=1 ! " +            // 1=clockwise, 2=180, 3=ccw, 4=h, 5=v
    "videocrop top=20 bottom=20 left=20 right=20 ! " +
    "videoscale ! video/x-raw,width=320,height=240,framerate=30/1 ! " +
    "videoconvert ! autovideosink sync=true"
local pipe = Gst.parse_launch(desc)
```

`videorate` between `videoscale` and the sink will resample the
framerate (useful for slow-mo or recording at a different fps than the
source).

Demo: [demo/gstreamer/video_filters.nut](../../demo/gstreamer/video_filters.nut).

## 20. Registry introspection

The default registry knows every installed plugin and element factory:

```squirrel
local reg = Gst.Registry.get()
foreach (plug in reg.get_plugin_list()) {
    foreach (feat in reg.get_feature_list_by_plugin(plug.get_name())) {
        // print element names, klass, etc.
    }
}

local fact = Gst.ElementFactory.find("audiomixer")
print(fact.get_metadata("long-name") + "\n")
print(fact.get_metadata("klass") + "\n")
print(fact.get_metadata("description") + "\n")
```

Useful metadata keys: `long-name`, `klass`, `description`, `author`.

Demo: [demo/gstreamer/info.nut](../../demo/gstreamer/info.nut).

## 21. Pitfalls

| symptom                                                       | cause                                                                                                       | fix                                                                                                          |
|---------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| `the index 'null' does not exist`                             | `null` is a Squirrel keyword.                                                                              | Use `Gst.State["null"]` (bracket-string) for the NULL state.                                                  |
| Signal handler never fires                                    | Handler signature includes the emitter, or the main context is never iterated.                              | SQGI strips the emitter; declare *one less arg*. Pump `GLib.MainContext.default().iteration(false)` regularly. |
| `query_position` / `query_duration` "always negative"          | Pipeline ran to EOS before the query, or queries were called in NULL/READY.                                  | Query in PAUSED or PLAYING after `async-done`. Returns `-1` until the value is known.                         |
| `tee` deadlocks                                                | Branches downstream of `tee` skipped the required `queue`.                                                  | Insert `queue` at the head of every `tee` branch.                                                             |
| `videotestsrc num-buffers=N ! fakesink sync=false` reaches EOS in microseconds and timers/draw signals don't fire | `sync=false` rushes the pipeline; cross-thread signal idle sources are coalesced. | Use `sync=true` when you need per-frame callbacks. Always pump the main context.                              |
| `parse_launch` returned non-null but `set_state` fails         | gst-launch syntax errors only show up at state-change.                                                       | Always check the first ERROR message on the bus.                                                              |
| HTTP playback never starts                                     | Buffering not handled; pipeline rendered before fully buffered.                                              | Watch `Gst.MessageType.buffering`; pause until percentage hits 100.                                          |
| `RIFF`/`WAVE` headers missing from wav output                  | Pipeline torn down before EOS was received.                                                                  | Wait for `Gst.MessageType.eos` on the bus before `set_state(null)`.                                          |

## 22. Further reading

- [GStreamer manual](https://gstreamer.freedesktop.org/documentation/application-development/)
- [`gst-inspect-1.0 <element>`](https://gstreamer.freedesktop.org/documentation/tools/gst-inspect.html)
  on the command line for live property/signal docs.
- [`gst-launch-1.0`](https://gstreamer.freedesktop.org/documentation/tools/gst-launch.html)
  syntax cheatsheet — same syntax as `Gst.parse_launch`.
- [Plugin reference](https://gstreamer.freedesktop.org/documentation/plugins_doc.html).
- [Cairo cookbook in SQGI](gtk4.md#drawing-with-cairo) for drawing primitives.
- [GLib cookbook](glib.md) — main-loop and timing helpers used here.
- [Gio cookbook](gio.md) — file I/O, network primitives, and URI helpers.
