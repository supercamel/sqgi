# SQGI — Squirrel bindings for GLib / GObject / GIRepository

SQGI is a Squirrel-language runtime layered on top of GLib that exposes the
entire GObject ecosystem through GIRepository. If a library ships a
`.typelib` (GTK, GIO, GTK4, libsoup, libxml2, GStreamer, …), you can call
it from Squirrel with no glue code:

```squirrel
local Gio = import("Gio")

local file = Gio.File.new_for_path("/etc/os-release")
local ok, contents, _, _ = file.load_contents(null)
print(contents)
```

It also ships a JS-style `async function` / `await` runtime built directly
on the GLib main loop, and full GVariant / GValue marshalling.

## Status

SQGI is a working technology preview. It powers small demos (`demo/soup/vget.nut`
downloads a file via libsoup and prints a progress bar), and runs a CI test
suite of 41 ctests covering marshalling, signals, async, GVariant, the
GIRepository binding, subclassing, JSON, and stack-balance regressions.
Branch coverage on the C binding sources sits around 81% (`gcovr --filter src/`).
It is not yet hardened for unattended production workloads — see the gap
analysis below.

## Build

Requirements (Debian/Ubuntu names):

- `cmake` ≥ 3.16, a C/C++ toolchain
- `libglib2.0-dev`, `libgirepository1.0-dev`
- `libffi-dev`
- `pkg-config`

```sh
cmake -S . -B build
cmake --build build -j
build/sqgi --version
```

Run the test suite:

```sh
cd build && ctest --output-on-failure
```

## Install

```sh
cmake --install build --prefix /usr/local
```

This installs `libsqgi.so`, the `sqgi` binary, public headers under
`include/sqgi/`, and a `sqgi.pc` pkg-config file so external embedders can do:

```sh
pkg-config --cflags --libs sqgi
```

## Optional: AddressSanitizer build

```sh
cmake -S . -B build-asan -DSQGI_ENABLE_ASAN=ON
cmake --build build-asan -j
```

## Quick tour

### Calling GIRepository

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local loop = GLib.MainLoop.new(null, false)

local file = Gio.File.new_for_path("README.md")
file.load_contents_async(null, function(source, result) {
    local ok, contents = source.load_contents_finish(result)
    print("read " + contents.len() + " bytes\n")
    loop.quit()
})
loop.run()
```

`async`/`await` works on any callback that ships an `_finish` companion, or
on any `sqgi.Task`:

```squirrel
local main = async function() {
    local ms = await sqgi.sleep(100)
    print("slept " + ms + "ms\n")
}
main()
GLib.MainLoop.new(null, false).run()
```

### Signals

```squirrel
local Gtk = import("Gtk")  // GTK 3 or 4 typelib

local app = Gtk.Application.new("org.example.demo", 0)
app.connect("activate", function(self) {
    print("activate fired\n")
    self.quit()
})
app.run([])
```

### Tasks / Promises

```squirrel
local t = sqgi.Task()
sqgi.timeout_add(100, function() { t.resolve("done"); return false })

t.then(function(v) { print(v + "\n") })
 .catch(function(e) { print("err: " + e + "\n") })
```

Two-arg `.then(succ, fail)`, `task.cancel(reason)`, `sqgi.all([t1, t2])`, and
`sqgi.race([t1, t2])` work as in JavaScript:

```squirrel
local job = sqgi.sleep(5000)
sqgi.timeout_add(100, function() { job.cancel("user-pressed-stop"); return false })
job.catch(function(e) {
    if (e.__cancelled) print("cancelled: " + e.reason + "\n")
})
```

Unhandled rejections print to stderr on the next idle tick (matches Node.js
semantics):

```
[sqgi] Unhandled promise rejection: <error>
```

### Constructing GObjects with property bags

`Klass.new()` calls a class's GI constructor. To use
`g_object_new_with_properties` instead, pass a property table to
`sqgi.new_object`:

```squirrel
local Gio = import("Gio")

local app = sqgi.new_object(Gio.Application, {
    "application-id": "org.example.demo",
    "flags": 0,
})
```

### Errors

Failures from GI calls — anything that would set a `GError *` in C — are
thrown as `sqgi.GError` instances with structured fields:

```squirrel
local Gio = import("Gio")
local f = Gio.File.new_for_path("/nope")
try {
    f.load_contents(null)
} catch (e) {
    if (e instanceof sqgi.GError && e.domain == "g-io-error-quark") {
        print("IO error " + e.code + ": " + e.message + "\n")
    } else {
        throw e
    }
}
```

`sqgi.GError` exposes `.domain` (string), `.code` (integer), and `.message`
(string). Its `_tostring` returns `"<domain>:<code>: <message>"`, so plain
string concatenation and the unhandled-rejection reporter both render
usefully.

### GIO async calls

`sqgi.gio_async(initiator, finisher)` wraps a GIO `*_async`/`*_finish` pair
as an awaitable `Task` whose `cancel()` propagates through a `GCancellable`:

```squirrel
local Gio = import("Gio")
local f = Gio.File.new_for_path("/etc/hostname")

async function read_file() {
    local result = await sqgi.gio_async(
        @(c, cb) f.load_contents_async(c, cb),
        @(res) f.load_contents_finish(res))
    return result
}

local task = read_file()
// Decide later we don't want the result after all:
task.cancel("user navigated away")
// → task rejects with { __cancelled=true, reason="user navigated away" },
//   and g_cancellable_cancel() fires on the underlying GIO op so the
//   filesystem read aborts as soon as possible.
```

`initiator` receives `(cancellable, ready_cb)` and is expected to invoke
the `*_async` method with them. `finisher` receives the `GAsyncResult` and
must call the corresponding `*_finish` method (and return its value).

### Subclassing GObjects

`sqgi.register_class({name, parent, overrides})` registers a new `GType`
derived from any introspectable GObject class and lets you override its
vfuncs with Squirrel closures:

```squirrel
local Gio = import("Gio");

local MyApp = sqgi.register_class({
    name = "MyApp",
    parent = Gio.Application,
    overrides = {
        activate = function(self) {
            print("activated " + self.application_id);
        },
    },
});

local app = sqgi.new_object(MyApp, { application_id = "org.example.myapp" });
app.run(0, null);
```

The override receives the instance as its first argument (`self`) followed
by any GI arguments declared on the vfunc. Properties, methods, and
signals inherited from the parent class are available on instances through
the usual `_get` / `_set` metamethods. Overrides must only be invoked from
the GLib main thread, matching SQGI's single-threaded VM constraint.

To invoke the parent class's implementation from inside an override, call
`sqgi.chain_up()`. It re-issues the parent vfunc with the original
arguments and returns its return value:

```squirrel
local MyApp = sqgi.register_class({
    name = "MyApp",
    parent = Gio.Application,
    overrides = {
        shutdown = function(self) {
            print("about to shut down\n")
            sqgi.chain_up()  // run GApplication's default shutdown
        },
    },
})
```

### CLI

```
Usage: sqgi [options] [script [args...]]

Options:
  -e <src>       Evaluate inline Squirrel source and exit
  -v, --version  Print version and exit
  -h, --help     Show this message and exit
```

### JSON

`sqgi.json` is a hand-written, dependency-free codec.

```squirrel
local J = sqgi.json

// parse
local obj = J.parse("{\"name\":\"ada\",\"tags\":[1,2,3]}")
print(obj.name + " has " + obj.tags.len() + " tags\n")

// stringify (compact)
print(J.stringify(obj) + "\n")

// stringify (pretty: pass indent width 1..16)
print(J.stringify(obj, 2) + "\n")
```

Type mapping (Squirrel ↔ JSON):

| Squirrel        | JSON           |
| --------------- | -------------- |
| `null`          | `null`         |
| `bool`          | `true`/`false` |
| `integer`       | number         |
| `float`         | number         |
| `string`        | string         |
| `array`         | array          |
| `table`         | object         |
| instance + `_tojson` | result of `_tojson()` |

Notes:

* Parser and serializer cap recursion at 128 levels to defeat DoS via deep nesting; cycles trip the cap and throw.
* Table keys must be strings on stringify.
* `NaN` and infinities are rejected on stringify (not representable in JSON).
* JSON has only one number type — `integer` survives if the literal is integral, otherwise it round-trips as `float`. Floats always serialise with a `.0` or exponent so the type indicator is preserved.
* Implement `_tojson` on a class to control how its instances serialise.

## Architecture

```
src/
  main.c          CLI entry point + REPL
  sqgi_vm.c        VM init, root table, std lib wiring
  sqgi_gi.c        GIRepository function dispatch + libffi callbacks
  sqgi_gi_object.c Object/struct wrappers, GValue boxing
  sqgi_marshal.c   GIArgument / GValue / GVariant push/pull
  sqgi_signal.c    GObject signal connect/emit
  sqgi_async.c     async/await runtime (Tasks + GLib idle wakers)
  sqgi_subclass.c  GType registration + vfunc override trampolines
  sqgi_import.c    `import("Module")` for typelibs and .nut files
```

Callbacks passed to GI functions are dispatched through libffi-generated
closures, so any signature exposed by a typelib (GAsyncReadyCallback,
GFileProgressCallback, GFunc, …) works without per-signature trampolines.

## Known gaps

These are real and explicit, not roadmap aspirations:

- **`sqgi.gio_async` requires a manual `(initiator, finisher)` pair.** It
  isn't (yet) inferred from GIR metadata, so each async call site is two
  small closures rather than one. The cancellable is wired automatically.

A PR adding any of these is welcome.

## License

SQGI is released under the MIT license — see [LICENSE](LICENSE). The
Squirrel sources under `Squirrel3/` retain their upstream copyright.
