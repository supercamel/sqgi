# SQGI demos

Small, runnable examples organized by GObject library. Run any of them with:

```sh
./build/sqgi demo/<library>/<example>.nut
```

## Layout

| Folder         | Library       | Examples                                                          |
| -------------- | ------------- | ----------------------------------------------------------------- |
| `glib/`        | GLib          | `mainloop_timer.nut` — main loop + periodic timeout<br>`datetime.nut` — `GLib.DateTime` / `TimeZone` construction, formatting, arithmetic<br>`bytes_checksum.nut` — `GLib.Bytes`, `compute_checksum_for_string`, base64 round-trip<br>`variant.nut` — `Variant` / `VariantType` / `VariantDict` tour<br>`keyfile.nut` — INI-style config write + load round-trip<br>`paths_env.nut` — filesystem paths, `find_program_in_path`, env vars, escaping<br>`idle_drain.nut` — manually pump a `MainContext` with `ctx.iteration` |
| `gio/`         | Gio           | `actions.nut` — `Gio.Application` + `Gio.SimpleAction` with typed parameters<br>`argp.nut` — command-line options via `add_main_option` + `command-line` signal<br>`cancel.nut` — task cancellation via `Task.cancel()` + propagated `GCancellable`<br>`file_read.nut` — async file read via `Gio.File.load_contents_async`<br>`gz_inflate.nut` — GZIP decompression via `Gio.ZlibDecompressor` + `ConverterInputStream`<br>`http_head.nut` — raw-TCP HTTP HEAD using `SocketClient` + `DataInputStream`<br>`ls.nut` — async directory listing (`enumerate_children_async` + paged `next_files_async`)<br>`resolver.nut` — async DNS resolve + reverse lookup with `Gio.Resolver`<br>`run.nut` — child process via `GLib.spawn_command_line_sync` + captured output files<br>`stat.nut` — wildcard attribute dump (`standard::*,unix::*,time::*`) with per-type formatting<br>`stream_copy.nut` — `cp(1)` clone via `OutputStream.splice_async`<br>`tasks_all.nut` — fan-out/fan-in parallel file reads with `sqgi.all`<br>`tcp_client.nut` — async TCP client (`--self` mode can launch an in-process echo server)<br>`tcp_echo.nut` — loopback echo server via `Gio.SocketService` + `splice_async`<br>`tls_get.nut` — HTTPS HEAD over `Gio.SocketClient` TLS transport<br>`udp_broadcast.nut` — UDP broadcast send/receive under one main loop<br>`udp_echo.nut` — UDP echo client/server with `sqgi.socket_add_watch`<br>`udp_multicast.nut` — multicast join/send/receive + cleanup<br>`watch.nut` — directory `Gio.FileMonitor` printing change events (`--timeout=N`) |
| `soup/`        | libsoup 3     | `http_get.nut` — single async HTTP GET<br>`json_get.nut` — GET + `sqgi.json.parse`<br>`json_post.nut` — POST a JSON payload and parse the JSON reply<br>`headers.nut` — set request / inspect response headers<br>`parallel.nut` — fan-out fetches via `sqgi.all`<br>`cancel.nut` — abort an in-flight request with `task.cancel()`<br>`server.nut` — multi-endpoint `Soup.Server` with optional `--selftest`<br>`vget.nut` — full Gio.Application port of Vala's VGet (CLI + async download) |
| `gstreamer/`   | GStreamer 1.x | `info.nut` — registry/plugin/factory introspection (`gst-inspect`-style)<br>`play.nut` — minimal `playbin` URI player with timeout<br>`record.nut` — synthesize and encode a sine sweep to WAV<br>`tags.nut` — extract bus TAG messages and merged `TagList`<br>`tones.nut` — build a pipeline with `ElementFactory.make` + property control<br>`http_stream.nut` — stream video from the web with `playbin` or headless `uridecodebin`<br>`cairo_overlay.nut` — draw HUD/crosshair/text on live video via the `cairooverlay` `draw` signal<br>`webcam.nut` — `v4l2src` capture with device probing and a `videotestsrc` fallback<br>`audio_mix.nut` — mix several tones with `audiomixer`, optional simultaneous WAV record<br>`compositor_pip.nut` — picture-in-picture with `compositor` request pads<br>`transcode.nut` — `decodebin` → re-encode to wav/ogg/mp3/m4a<br>`tee_split.nut` — `tee` one source to speakers + filesink simultaneously<br>`video_filters.nut` — chain `videoflip`, `videocrop`, `videoscale`<br>`seek.nut` — preroll + `seek_simple` to jump around a file |
| `gdkpixbuf/`   | GdkPixbuf     | `format_convert.nut` — load + re-encode to JPEG/TIFF/BMP with format options<br>`thumbnail.nut` — `new_from_file_at_scale` aspect-preserving thumbnail<br>`mosaic.nut` — composite N tiles into a grid via `Pixbuf.composite`<br>`loader_pipeline.nut` — incremental `PixbufLoader.write` + signal connections<br>`inspect.nut` — `get_file_info` + `get_formats` (file(1)-style image inspector)<br>`transform.nut` — every geometric & colour transform in one script<br>`from_http.nut` — fetch image bytes via libsoup, stream into a `PixbufLoader` |
| `gtk4/`        | GTK 4         | `hello_world.nut`, `counter.nut`, `widgets.nut` (signal-exercising gallery), `bouncing_ball.nut` (Cairo-rendered animation via `Gtk.DrawingArea.set_draw_func`), `image_viewer.nut` (bundled image resource via `Gtk.Picture`), `scroll_controller.nut` and `scroll_diagnostics.nut` (GTK 4 scroll event/controller handling), `textbuffer_iters.nut` (headless `Gtk.TextBuffer`/`Gtk.TextIter` smoke demo) |
| `benchmarks/`  | Runtime demos | `run.sh` — compare SQGI with Python, Node.js, and GJS on core loops plus a GLib GI-call benchmark |

## Note on Cairo

`cairo-1.0.gir` declares every cairo record (`Context`, `Surface`, `Pattern`,
…) as `foreign="1"`, meaning GObject-Introspection deliberately refuses to
marshal those types and defers all knowledge of them to the language binding
(pycairo for PyGObject, the gjs cairo module, etc.). SQGI ships its own
native bridge in `src/sqgi_cairo.c`, so `import("cairo")` returns a namespace
where `Context` / `Surface` / `Pattern` are Squirrel classes backed by real
`cairo_t*` / `cairo_surface_t*` / `cairo_pattern_t*` userdata, and the
`cairo_t` argument delivered to e.g. `Gtk.DrawingArea.set_draw_func`'s draw
callback arrives as a fully usable `cairo.Context` instance. See
`demo/gtk4/bouncing_ball.nut` for the canonical usage.

## Adding a demo

Drop a self-contained `.nut` file into the appropriate library folder. Keep
demos short, runnable end-to-end, and prefer `await obj.method_async(...)`
over `await sqgi.gio_async(...)` in normal code. Use `sqgi.gio_async(...)`
only for edge cases that need explicit control of a raw `_async`/`_finish`
pair.
