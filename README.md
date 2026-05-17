# SQGI — script the entire GObject world from Squirrel

> **One import away from GTK, GIO, GStreamer, libsoup, GdkPixbuf, WebKit, and
> hundreds of other libraries.** SQGI is a tiny embeddable Squirrel runtime
> bolted onto GLib + GObject-Introspection. No bindings to generate, no FFI
> to write — if a library ships a `.typelib`, you can call it.

```squirrel
local Gtk = import("Gtk")        // GTK 4
local Soup = import("Soup")      // libsoup 3
local Gst  = import("Gst")       // GStreamer 1
local Pb   = import("GdkPixbuf") // GdkPixbuf
// ...you get the idea.
```

---

## Why?

GObject-Introspection is one of the best-kept secrets in Linux desktop dev:
every major C library on a modern Linux system ships machine-readable type
metadata (`.gir` + `.typelib`) that lets *any* language with a GI binding
call into it. Python, JavaScript and Vala have used this for years.
**Squirrel hadn't, until now.**

SQGI is what you get if you take a small, fast, embeddable scripting
language (Squirrel — used in Counter-Strike, MaNGOS, IO games, embedded
shells), and wire it directly into the GLib type system with libffi. You
end up with:

- **Native-feeling glue** — `gio.File.new_for_path("…").load_contents(null)`
  just works.
- **A real async runtime** — `async function … await foo.bar_async(…)` on top of
  the GLib main loop, with Promise/Task semantics that match JavaScript
  (`Task.cancel()`, `sqgi.all`, `sqgi.race`, unhandled-rejection reporter).
- **Full signal interop** — `widget.connect("clicked", fn)`, including
  cross-thread emits (e.g. GStreamer streaming-thread signals) marshalled
  back onto the VM's main context automatically.
- **GObject subclassing from a script** — `sqgi.register_class({...})`
  registers a brand-new `GType` whose vfuncs are Squirrel closures. Use it
  to plug a Squirrel handler into any C API that calls back through a
  virtual function.

It's small (~10kLoC of C), MIT-licensed, has no runtime dependencies
beyond GLib / libffi / Squirrel, and embeds into existing C apps with a
single `pkg-config --cflags --libs sqgi`.

## What's in the box

| Area                 | What you get                                                                                                  |
|----------------------|---------------------------------------------------------------------------------------------------------------|
| Calling C libraries  | Every introspected GIRepository function, including out-args, byte arrays, GBytes, GError                     |
| Constructing objects | `Klass.new(…)` plus `sqgi.new_object(Klass, {prop=value, …})` for property-bag construction                   |
| Properties           | `obj.foo`, `obj.foo = bar`, `obj.get_property("foo")`, `obj.set_property("foo", obj_value)`                   |
| Signals              | `obj.connect("name", fn)`, `obj.emit("name", args…)`, cross-thread-safe via the VM's main context             |
| GValue / GVariant    | Full bidirectional marshalling, including typed accessors and recursive container marshalling                 |
| Async / await        | `async function`, `await`, `Task`, `Task.cancel()`, `sqgi.all`, `sqgi.race`, JS-style unhandled-rejection log |
| GIO async helpers    | Every `_async`/`_finish` pair auto-becomes an awaitable; cancellation flows into the underlying `GCancellable`|
| Subclassing          | `sqgi.register_class` with `overrides = {vfunc = closure, …}` + `sqgi.chain_up()` to call the parent          |
| Cairo                | Native bridge: cairo Context / Surface / Pattern arrive as first-class instances in signal handlers and draw funcs |
| JSON                 | `sqgi.json.parse` / `stringify` (compact + pretty), `_tojson` hook for classes                                |
| Errors               | `sqgi.GError` instances with `.domain` / `.code` / `.message`, throwable & catchable                          |

## 60-second tour

### Hello, GObject world

```squirrel
local Gio = import("Gio")

local f = Gio.File.new_for_path("/etc/os-release")
local ok, contents, _, _ = f.load_contents(null)
print(contents)
```

### Async / await — the GIO way

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local main = async function() {
    local f = Gio.File.new_for_path("/etc/hostname")
    local r = await f.load_contents_async(null)
    print("hostname: " + r[0])
}
main()
GLib.MainLoop.new(null, false).run()
```

Every introspected `*_async`/`*_finish` pair becomes a single awaitable
call. No `_finish` boilerplate, no callback indentation pyramid.

### Signals that just work — including from worker threads

```squirrel
local Gst = import("Gst")
Gst.init(null)

local pipe = Gst.parse_launch(
    "videotestsrc num-buffers=120 ! cairooverlay name=co ! " +
    "videoconvert ! autovideosink")
local co = pipe.get_by_name("co")

// GStreamer fires `draw` from the streaming thread — SQGI marshals
// the call back onto the VM's main context for us, and the cairo
// Context arrives as a real cairo.Context instance.
co.connect("draw", function (cr, ts, dur) {
    cr.set_source_rgba(1, 1, 1, 0.5)
    cr.arc(120, 80, 30, 0, 6.283)
    cr.fill()
})

pipe.set_state(Gst.State.playing)
```

### Fetch a URL with libsoup

```squirrel
local Soup = import("Soup")
local GLib = import("GLib")

local main = async function() {
    local s   = Soup.Session.new()
    local msg = Soup.Message.new("GET", "https://example.org/")
    local body = await s.send_and_read_async(msg, GLib.PRIORITY_DEFAULT, null)
    print("got " + body.get_size() + " bytes\n")
}
main()
GLib.MainLoop.new(null, false).run()
```

### Decode an image and save a thumbnail

```squirrel
local Pb = import("GdkPixbuf")

local thumb = Pb.Pixbuf.new_from_file_at_scale("/tmp/big.jpg", 256, 256, true)
thumb.savev("/tmp/thumb.png", "png", [], [])
```

### Subclass `Gio.Application` from a script

```squirrel
local Gio = import("Gio")

local MyApp = sqgi.register_class({
    name   = "MyApp",
    parent = Gio.Application,
    overrides = {
        activate = function (self) {
            print("hello from " + self.application_id + "\n")
        },
    },
})

local app = sqgi.new_object(MyApp, { application_id = "org.example.demo" })
app.run(0, null)
```

That `MyApp` is a real, introspectable `GType`. C code that calls
`g_application_run` invokes your Squirrel closures through libffi
trampolines.

### Cancellable tasks, JS-style

```squirrel
local job = sqgi.sleep(5000)
sqgi.timeout_add(100, function() {
    job.cancel("user pressed stop")
    return false
})

job.then(function(v) { print("slept " + v + "ms\n") })
   .catch(function(e) {
       if (e.__cancelled) print("cancelled: " + e.reason + "\n")
   })
```

## Status

SQGI is a working technology preview that's accumulated real coverage:

- **45 CTest targets** — unit tests for marshalling, signals, async, GVariant,
  GIRepository binding, subclassing, JSON, stack-balance regressions, plus
  4 C-side tests for cross-thread signal paths.
- **16 end-to-end behavioural tests** (`test/run_tests.sh`) exercising GLib,
  Gio, libsoup, GStreamer, GdkPixbuf, and the application/async runtime.
- **59 self-contained demos** across `demo/glib/`, `demo/gio/`, `demo/soup/`,
  `demo/gstreamer/`, `demo/gtk4/`, and `demo/gdkpixbuf/` — including a full
  libsoup VGet clone, a GStreamer cairo HUD, picture-in-picture compositor,
  and a hermetic libsoup → PixbufLoader pipeline.
- **6 cookbook chapters** under [`docs/recipes/`](docs/recipes/): GLib, Gio,
  libsoup, GStreamer, GdkPixbuf, GTK 4 — recipes with runnable code,
  pitfalls, and links to every demo.
- ~81% branch coverage on the C binding sources (`gcovr --filter src/`).
- **The full .nut test suite runs clean under AddressSanitizer +
  LeakSanitizer** — see `test/run_tests_asan.sh`. The binding tracks
  ownership of every transferred GObject, boxed record, GVariant, GBytes,
  GList/GSList spine, `gchar**` array, and constant-info value, and frees
  them through the Squirrel GC. Residual leaks are confined to known
  library-internal caches (libgio's worker-thread pool, GStreamer factory
  singletons) and are suppressed via `test/lsan.supp`.

Edge cases on exotic library shapes may still surprise — please file an
issue if you find one. But every API surface exercised by the demos,
recipes, and tests above is leak-free end-to-end.

## Build

Requirements (Debian/Ubuntu names):

```sh
sudo apt install cmake build-essential libglib2.0-dev libgirepository1.0-dev libffi-dev pkg-config
```

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j
build/sqgi --version
```

For debugger-friendly builds, use `-DCMAKE_BUILD_TYPE=Debug`. With Makefile
generators, leaving `CMAKE_BUILD_TYPE` empty produces an unoptimized binary,
which is useful for quick local hacking but misleading for benchmarks.

Run the tests:

```sh
./test/run_tests.sh           # behavioural .nut suite
cd build && ctest --output-on-failure   # C unit tests
```

Run the demos:

```sh
./build/sqgi demo/soup/vget.nut https://example.org/file.tar.gz
./build/sqgi demo/gstreamer/cairo_overlay.nut --analyse --frames=120
./build/sqgi demo/gdkpixbuf/mosaic.nut
./build/sqgi demo/gtk4/bouncing_ball.nut
```

## Install / embed

```sh
cmake --install build --prefix /usr/local
```

Installs `libsqgi.so`, the `sqgi` binary, public headers under
`include/sqgi/`, and `sqgi.pc`. Embedders pull it in with one line:

```sh
gcc myapp.c $(pkg-config --cflags --libs sqgi)
```

### AddressSanitizer build

```sh
cmake -S . -B build-asan -DSQGI_ENABLE_ASAN=ON
cmake --build build-asan -j
```

## CLI

```
Usage: sqgi [options] [script [args...]]

Options:
  -e <src>       Evaluate inline Squirrel source and exit
  -v, --version  Print version and exit
  -h, --help     Show this message and exit
```

## Where to go next

| You want to…                                  | Read                                                                      |
|-----------------------------------------------|---------------------------------------------------------------------------|
| Learn the language as it ships with SQGI       | [`docs/language/`](docs/language/) — 11 chapters incl. async patterns     |
| Look up an API surface                         | [`docs/api/README.md`](docs/api/README.md)                                |
| Read end-to-end recipes for a specific library | [`docs/recipes/`](docs/recipes/) (glib / gio / soup / gstreamer / gdkpixbuf / gtk4) |
| Browse runnable code                            | [`demo/`](demo/) — 59 small, focused scripts                              |
| Embed SQGI in a C app                          | `include/sqgi/sqgi_vm.h` + `pkg-config sqgi`                              |

## Architecture

```
src/
  main.c             CLI entry point + REPL
  sqgi_vm.c          VM init, root table, std lib wiring
  sqgi_gi.c          GIRepository function dispatch + libffi callbacks
  sqgi_gi_object.c   Object/struct wrappers, property accessors
  sqgi_marshal.c     GIArgument / GValue / GVariant push/pull
  sqgi_signal.c      GObject signal connect/emit (with cross-thread dispatch)
  sqgi_async.c       async/await runtime (Tasks + GLib idle wakers)
  sqgi_subclass.c    GType registration + vfunc override trampolines
  sqgi_cairo.c       Native cairo bridge (Context / Surface / Pattern)
  sqgi_import.c      `import("Module")` for typelibs and .nut files
  sqgi_json.c        Dependency-free JSON codec
```

Callbacks passed to GI functions are dispatched through libffi-generated
closures, so any signature exposed by a typelib (GAsyncReadyCallback,
GFileProgressCallback, GFunc, …) works without per-signature trampolines.

## License

SQGI is released under the MIT license — see [LICENSE](LICENSE). The
Squirrel sources under `Squirrel3/` retain their upstream copyright.
