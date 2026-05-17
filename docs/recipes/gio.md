# Gio Cookbook

Practical recipes for GIO — files, streams, subprocesses, sockets, and the
`Gio.Application` framework — from SQGI. This is the largest GObject library
you'll touch day-to-day; almost everything in the libsoup, GTK 4, and
GStreamer cookbooks builds on it.

Read [docs/language/](../language/) chapters 9–11 (async / Tasks) and skim
[docs/api/README.md](../api/README.md) first.

All examples are runnable with:

```bash
./build/sqgi path/to/script.nut
```

The full source for every snippet here lives in `demo/gio/` — it's the
biggest demo directory, with 19 end-to-end scripts.

## Contents

- [1. Setup and the GIO async style](#1-setup-and-the-gio-async-style)
- [2. Files: the basics](#2-files-the-basics)
- [3. Reading files](#3-reading-files)
- [4. Writing files](#4-writing-files)
- [5. Streaming copies with `splice_async`](#5-streaming-copies-with-splice_async)
- [6. Stream converters (gzip etc.)](#6-stream-converters-gzip-etc)
- [7. Listing directories](#7-listing-directories)
- [8. File metadata (`stat`-style)](#8-file-metadata-stat-style)
- [9. File monitoring](#9-file-monitoring)
- [10. Running subprocesses](#10-running-subprocesses)
- [11. `Gio.Application` skeleton](#11-gioapplication-skeleton)
- [12. Command-line options](#12-command-line-options)
- [13. Actions (`GAction`)](#13-actions-gaction)
- [14. DNS lookups](#14-dns-lookups)
- [15. TCP client](#15-tcp-client)
- [16. TCP server (`Gio.SocketService`)](#16-tcp-server-giosocketservice)
- [17. TLS over a raw socket](#17-tls-over-a-raw-socket)
- [18. UDP and `socket_add_watch`](#18-udp-and-socket_add_watch)
- [19. Cancellation](#19-cancellation)
- [20. Parallel I/O](#20-parallel-io)
- [21. Common pitfalls](#21-common-pitfalls)

---

## 1. Setup and the GIO async style

Almost every interesting GIO call has an `_async` / `_finish` pair. SQGI's
auto-async wrappers turn those into a single awaitable method that resolves
to whatever `_finish` would have returned:

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local loop = GLib.MainLoop.new(null, false)

async function main() {
    local f = Gio.File.new_for_path("/etc/hostname")
    local r = await f.load_contents_async(null)
    // load_contents_finish returns [contents, etag] — multiple-out
    local contents = r[0]
    print("hostname is: " + contents)
    loop.quit()
}

main()
loop.run()
```

Three rules that apply to every recipe below:

1. **You need a main loop.** Either `GLib.MainLoop.new(null, false).run()`
   for a plain script, or `Gio.Application.run(...)` for an app. Without
   one the async callbacks never fire.
2. **`_finish` return shape may be an array.** When the C signature has
   multiple `out` parameters (notably `Gio.File.load_contents_finish`),
   SQGI returns them as a Squirrel array. The auto-async wrapper preserves
   that shape. The pattern `local x = (typeof(r) == "array") ? r[0] : r`
   handles both single- and multi-out cases.
3. **Errors `throw`.** A GIO async call that fails (file missing, network
   error, cancelled) rejects the Task — caught by `try { await … } catch`,
   or by `.catch(...)`.

### When auto-async isn't enough

For raw control of the cancellable, or for non-standard finisher pairings,
drop down to `sqgi.gio_async(initiator, finisher)`. See
[docs/api/README.md § sqgi.gio_async](../api/README.md#sqgigio_async).

---

## 2. Files: the basics

Everything starts with a `Gio.File`. It's a *path handle* — creating one
costs nothing and doesn't touch the filesystem.

```squirrel
local f = Gio.File.new_for_path("./README.md")        // by local path
local u = Gio.File.new_for_uri("file:///etc/hostname") // by URI

print("path:     " + f.get_path()     + "\n")
print("basename: " + f.get_basename() + "\n")
print("uri:      " + f.get_uri()      + "\n")
print("parent:   " + f.get_parent().get_path() + "\n")
print("exists:   " + (f.query_exists(null) ? "yes" : "no") + "\n")
```

Useful instance methods:

| Method | Returns |
|---|---|
| `get_path()` | local filesystem path or `null` for remote URIs |
| `get_uri()` | `file://…` (or `http://…`, etc. for GVFS resources) |
| `get_basename()` | last path component |
| `get_parent()` | the parent `Gio.File` (or `null` at root) |
| `query_exists(cancellable)` | bool, synchronous |
| `delete(cancellable)` | unlink the file |
| `make_directory(cancellable)` | mkdir (non-recursive) |

For mkdir-p, build the components manually and call `make_directory` for
each in turn, ignoring "already exists" errors.

---

## 3. Reading files

### Whole-file buffered (≤ a few MB)

```squirrel
async function read_text(path) {
    local f = Gio.File.new_for_path(path)
    local r = await f.load_contents_async(null)
    return r[0]      // [contents, etag] → contents
}
```

The contents come back as an 8-bit-clean Squirrel string. For UTF-8 text
you can use string operations directly. For binary, treat it as a byte
buffer: `s[i]` gives an int 0..255.

### Streaming

For larger files, get a `Gio.FileInputStream` and read it in chunks:

```squirrel
async function read_chunks(path, on_chunk) {
    local f  = Gio.File.new_for_path(path)
    local in = await f.read_async(GLib.PRIORITY_DEFAULT)
    while (true) {
        local b = await in.read_bytes_async(64 * 1024, GLib.PRIORITY_DEFAULT)
        if (b.get_size() == 0) break          // EOF
        on_chunk(b.get_data())
    }
    in.close_sync(null)
}
```

`read_bytes_async` returns a `GLib.Bytes`. `.get_data()` is the
8-bit-clean string view.

> **Why `close_sync` here?** Closing a `FileInputStream` is fast; using
> the async variant is fine too but it just costs you another
> round-trip through the main loop.

### Line by line

If you're parsing newline-separated data, wrap the stream in
`Gio.DataInputStream`:

```squirrel
local din = sqgi.new_object(Gio.DataInputStream, {
    "base-stream": in,
})
din.set_newline_type(Gio.DataStreamNewlineType.any)
while (true) {
    local res  = await din.read_line_async(GLib.PRIORITY_DEFAULT)
    local line = (typeof(res) == "array") ? res[0] : res
    if (line == null) break          // EOF
    print(line + "\n")
}
```

`read_line_finish` is one of those multi-out cases — `[line, length]` —
hence the array-or-not check.

---

## 4. Writing files

### Whole-file replace

```squirrel
async function write_text(path, text) {
    local f = Gio.File.new_for_path(path)
    local out = await f.replace_async(
        null,                          // etag
        false,                         // make_backup
        Gio.FileCreateFlags.none,
        GLib.PRIORITY_DEFAULT)
    await out.write_bytes_async(GLib.Bytes.new(text), GLib.PRIORITY_DEFAULT)
    out.close_sync(null)
}
```

`replace` atomically swaps the new contents in. Existing files are
overwritten. Pass `Gio.FileCreateFlags.private` to set restrictive
permissions on creation.

### Appending

```squirrel
local out = await f.append_to_async(Gio.FileCreateFlags.none,
                                    GLib.PRIORITY_DEFAULT)
await out.write_bytes_async(GLib.Bytes.new("more\n"), GLib.PRIORITY_DEFAULT)
out.close_sync(null)
```

---

## 5. Streaming copies with `splice_async`

`Gio.OutputStream.splice_async` is the canonical idiom for "let GIO drive
both sides of the pipe". It works regardless of whether the streams are
backed by files, sockets, pipes, or remote GVFS resources. From
[demo/gio/stream_copy.nut](../../demo/gio/stream_copy.nut):

```squirrel
async function copy(src_path, dst_path) {
    local src = Gio.File.new_for_path(src_path)
    local dst = Gio.File.new_for_path(dst_path)

    local input  = await src.read_async(GLib.PRIORITY_DEFAULT)
    local output = await dst.replace_async(null, false,
                                           Gio.FileCreateFlags.none,
                                           GLib.PRIORITY_DEFAULT)

    local flags = Gio.OutputStreamSpliceFlags.close_source |
                  Gio.OutputStreamSpliceFlags.close_target
    local n = await output.splice_async(input, flags, GLib.PRIORITY_DEFAULT)

    print(format("copied %d bytes  %s  →  %s\n", n, src_path, dst_path))
}
```

The flags above mean splice closes both streams when EOF is reached. If you
plan to keep them open, omit those bits.

---

## 6. Stream converters (gzip etc.)

GIO ships a small zoo of `Gio.Converter` implementations you can chain into
a pipeline by wrapping any stream in `Gio.ConverterInputStream` /
`ConverterOutputStream`. The classic example is gzip:

```squirrel
local zlib = sqgi.new_object(Gio.ZlibDecompressor, {
    "format": Gio.ZlibCompressorFormat.gzip,
})

local base_in = await src.read_async(GLib.PRIORITY_DEFAULT)
local conv_in = sqgi.new_object(Gio.ConverterInputStream, {
    "base-stream": base_in,
    "converter":   zlib,
})

local out = await dst.replace_async(null, false, Gio.FileCreateFlags.none,
                                    GLib.PRIORITY_DEFAULT)
local n = await out.splice_async(conv_in,
    Gio.OutputStreamSpliceFlags.close_source |
    Gio.OutputStreamSpliceFlags.close_target,
    GLib.PRIORITY_DEFAULT)
```

Other useful converters: `Gio.ZlibCompressor` (gzip/deflate output),
`Gio.CharsetConverter` (encoding transforms).

> **Construction via `sqgi.new_object`.** `Gio.ConverterInputStream` has no
> `new()` shortcut that takes the base stream — its constructor takes the
> `base-stream` and `converter` as construct-only properties, so use
> `sqgi.new_object(Cls, {…})`.

---

## 7. Listing directories

`Gio.File.enumerate_children_async` returns a `Gio.FileEnumerator` that you
page through with `next_files_async`. From
[demo/gio/ls.nut](../../demo/gio/ls.nut):

```squirrel
async function ls(path) {
    local dir = Gio.File.new_for_path(path)
    local attrs = "standard::name,standard::type,standard::size,time::modified"

    local enumr = await dir.enumerate_children_async(
        attrs, Gio.FileQueryInfoFlags.none, GLib.PRIORITY_DEFAULT)

    while (true) {
        local infos = await enumr.next_files_async(64, GLib.PRIORITY_DEFAULT)
        if (infos == null || infos.len() == 0) break
        foreach (info in infos) {
            print(format("  %s  %d  %s\n",
                         info.get_file_type() == Gio.FileType.directory ? "d" : "-",
                         info.get_size(),
                         info.get_name()))
        }
    }
    enumr.close_sync(null)
}
```

`attrs` is a comma-separated attribute selector. Common shortcuts:

| Selector | What you get |
|---|---|
| `"standard::*"` | name, type, size, content-type, display-name, … |
| `"standard::name,standard::size"` | only those two — fastest |
| `"unix::*"` | uid, gid, inode, device, mode, … |
| `"time::*"` | modified / access / created stamps |

Pick the minimum — each extra attribute can mean an extra stat-equivalent
syscall.

---

## 8. File metadata (`stat`-style)

`query_info_async` is the single-file variant:

```squirrel
async function stat(path) {
    local f = Gio.File.new_for_path(path)
    local info = await f.query_info_async(
        "standard::*,unix::*,time::*",
        Gio.FileQueryInfoFlags.none,
        GLib.PRIORITY_DEFAULT)

    foreach (a in info.list_attributes(null)) {
        print(format("  %-32s = %s\n", a, fmt_attr(info, a)))
    }
}
```

`Gio.FileInfo` exposes typed getters per attribute. The dispatch on
`info.get_attribute_type(attr)` from
[demo/gio/stat.nut](../../demo/gio/stat.nut) is worth memorising:

```squirrel
function fmt_attr(info, attr) {
    local t = info.get_attribute_type(attr)
    if (t == Gio.FileAttributeType.string)
        return info.get_attribute_string(attr)
    if (t == Gio.FileAttributeType.byte_string)
        return info.get_attribute_byte_string(attr)
    if (t == Gio.FileAttributeType.boolean)
        return info.get_attribute_boolean(attr) ? "true" : "false"
    if (t == Gio.FileAttributeType.uint32) return "" + info.get_attribute_uint32(attr)
    if (t == Gio.FileAttributeType.int32)  return "" + info.get_attribute_int32(attr)
    if (t == Gio.FileAttributeType.uint64) return "" + info.get_attribute_uint64(attr)
    if (t == Gio.FileAttributeType.int64)  return "" + info.get_attribute_int64(attr)
    return "<type=" + t + ">"
}
```

For the well-known attributes there are also shortcut accessors:

```squirrel
info.get_name()                    // standard::name
info.get_size()                    // standard::size
info.get_file_type()               // standard::type → Gio.FileType
info.get_content_type()            // standard::content-type
info.get_modification_date_time()  // time::modified → GLib.DateTime
```

---

## 9. File monitoring

`Gio.File.monitor_directory` returns a `Gio.FileMonitor` that fires its
`changed` signal for every event. From
[demo/gio/watch.nut](../../demo/gio/watch.nut):

```squirrel
local mon = Gio.File.new_for_path(".").monitor_directory(
    Gio.FileMonitorFlags.none, null)

// changed(file, other_file, event_type) — `other_file` is non-null for renames
mon.connect("changed", function(file, other, event_type) {
    print(file.get_path() + " : event " + event_type + "\n")
})
```

Useful values of `event_type` (the `Gio.FileMonitorEvent` enum):

| Event | When it fires |
|---|---|
| `changed` | content modified, file still open |
| `changes_done_hint` | writer closed the file (good "commit" signal) |
| `deleted` | unlinked |
| `created` | new file appeared |
| `attribute_changed` | chmod/chown/utime |
| `renamed` | moved (`other` is the new path) |

For recursive watches, monitor sub-directories explicitly when `created`
fires for one. GIO doesn't recurse on its own.

`mon.cancel()` stops the watch.

---

## 10. Running subprocesses

### One-shot, blocking (simplest)

```squirrel
local res = GLib.spawn_command_line_sync("uname -a")
// res = [stdout_string, stderr_string, wait_status_int]
print(res[0])
```

Exit code: `(res[2] >> 8) & 0xFF`. Killed-by-signal: `res[2] & 0x7F`.

### Non-blocking (fire and forget)

```squirrel
async function main() {
    local ok = await GLib.spawn_command_line_async("notify-send hello")
    print(ok ? "launched\n" : "failed\n")
}
```

You don't get the child's status back from `spawn_command_line_async`. If
you need that, use `Gio.Subprocess`.

### `Gio.Subprocess` — for real work

```squirrel
local p = Gio.Subprocess.new(
    ["ls", "-la", "/tmp"],
    Gio.SubprocessFlags.stdout_pipe + Gio.SubprocessFlags.stderr_silence)

local s = p.get_stdout_pipe()
local out = ""
while (true) {
    local b = s.read_bytes(8192, null)
    if (b.get_size() == 0) break
    out += b.get_data()
}
p.wait(null)
print("exit: " + p.get_exit_status() + "\n")
print("out:\n" + out)
```

`Gio.Subprocess.new(argv, flags)` is variadic-ish: `argv` is an array, and
flags combine `stdin_pipe`, `stdout_pipe`, `stdout_silence`, `stderr_pipe`,
`stderr_silence`, `inherit_fds`. Pair an `..._pipe` flag with the
matching `get_*_pipe()` to get a stream.

For full async I/O against a subprocess, combine `stdout_pipe` with
`splice_async` into a memory-output stream or a file.

---

## 11. `Gio.Application` skeleton

`Gio.Application` adds: a session-bus name, single-instance behaviour,
GAction support, command-line option parsing, and `activate` / `startup` /
`shutdown` lifecycle.

```squirrel
local Gio = import("Gio")

local app = sqgi.new_object(Gio.Application, {
    "application-id": "io.sqgi.demo.app",
    "flags":          Gio.ApplicationFlags.flags_none,
})

app.connect("startup",  function() { print("startup\n")  })
app.connect("activate", function() { print("activated\n") })
app.connect("shutdown", function() { print("shutdown\n") })

local rc = app.run(0, null)
print("exit " + rc + "\n")
```

Useful flag combinations:

| Flag | Effect |
|---|---|
| `flags_none` | single-instance, activates without files/argv |
| `handles_open` | second instance forwards file args via `open` signal |
| `handles_command_line` | second instance forwards full argv via `command-line` |
| `non_unique` | every launch is its own primary |
| `is_service` | run as a background D-Bus service |

`app.hold()` / `app.release()` add and drop refcounts on the run loop — use
them to keep the app alive while async work is in flight, then release.

---

## 12. Command-line options

If you set `handles_command_line`, you get argv in a `command-line` signal
handler. Register options with `add_main_option` first. From
[demo/gio/argp.nut](../../demo/gio/argp.nut):

```squirrel
app.add_main_option("verbose", 'v', 0, GLib.OptionArg.none,
                    "Enable verbose output", null)
app.add_main_option("name",    'n', 0, GLib.OptionArg.string,
                    "Greet someone by name", "NAME")
app.add_main_option("count",   'c', 0, GLib.OptionArg.int,
                    "Repeat count", "N")

app.connect("command-line", function(cmdline) {
    local opts = cmdline.get_options_dict()    // GLib.VariantDict

    local verbose = (opts.lookup_value("verbose", null) != null)
    local name    = opts.lookup_value("name",  null)
    if (name == null) name = "world"
    local count   = opts.lookup_value("count", null)
    if (count == null) count = 1

    for (local i = 0; i < count; i++) print("hello, " + name + "!\n")
    return 0
})

// Forward our argv to the app:
local argv = ["sqgi-app"]
foreach (a in vargv) argv.append(a)
app.run(argv.len(), argv)
```

Notes:

- The second argument to `add_main_option` is a `char` (ASCII codepoint).
  Use `'v'` for `-v`. Pass `0` for "no short form".
- `--help` is generated automatically from the option metadata.
- `lookup_value` returns either `null` or the already-unwrapped Squirrel
  value (`int`, `string`, etc., matching the `OptionArg` type).
- Return `0` from the handler to exit cleanly. Non-zero values become the
  app exit code.

---

## 13. Actions (`GAction`)

Actions are named, optionally-parameterised commands. They show up in
menus, can be invoked from the command line via D-Bus, and decouple the UI
from the implementation. From [demo/gio/actions.nut](../../demo/gio/actions.nut):

```squirrel
// Parameterless action
local act_hello = Gio.SimpleAction.new("hello", null)
act_hello.connect("activate", function(_param) {
    print("[hello] activated\n")
})
app.add_action(act_hello)

// String-parameter action
local s_type    = GLib.VariantType.new("s")
local act_greet = Gio.SimpleAction.new("greet", s_type)
act_greet.connect("activate", function(name) {     // already unwrapped
    print("[greet] hello, " + name + "!\n")
})
app.add_action(act_greet)

// Activating from code:
app.register(null)
app.activate_action("hello", null)
app.activate_action("greet", GLib.Variant.new_string("Squirrel"))
```

The `activate` callback receives the parameter **already unwrapped to its
native Squirrel type** — that's a SQGI convenience.

`GVariantType` strings worth knowing:

| String | Type |
|---|---|
| `"s"` | string |
| `"i"`/`"u"` | int32 / uint32 |
| `"x"`/`"t"` | int64 / uint64 |
| `"d"` | double |
| `"b"` | boolean |
| `"as"` | array of strings |
| `"a{ss}"` | string→string dictionary |

For stateful actions (toggles, radio groups), use
`Gio.SimpleAction.new_stateful(name, param_type, initial_state)`.

---

## 14. DNS lookups

```squirrel
local r = Gio.Resolver.get_default()

async function resolve(name) {
    local addrs = await r.lookup_by_name_async(name)
    foreach (a in addrs) print("  " + a.to_string() + "\n")
}

async function reverse(addr_string) {
    local addr = Gio.InetAddress.new_from_string(addr_string)
    return await r.lookup_by_address_async(addr)
}
```

Both calls take a Cancellable internally (auto-async wires one up).
Errors throw `Gio.ResolverError`.

For multiple lookups in parallel, fan out with `sqgi.all` — see §20.

---

## 15. TCP client

```squirrel
async function fetch_head(host, port) {
    local client = Gio.SocketClient.new()
    local conn   = await client.connect_to_host_async(host, port)

    local req = "HEAD / HTTP/1.0\r\nHost: " + host + "\r\n\r\n"
    await conn.get_output_stream().write_bytes_async(
        GLib.Bytes.new(req), GLib.PRIORITY_DEFAULT)

    local din = sqgi.new_object(Gio.DataInputStream, {
        "base-stream": conn.get_input_stream(),
    })
    din.set_newline_type(Gio.DataStreamNewlineType.any)

    while (true) {
        local res  = await din.read_line_async(GLib.PRIORITY_DEFAULT)
        local line = (typeof(res) == "array") ? res[0] : res
        if (line == null || line.len() == 0) break
        print(line + "\n")
    }
    conn.close(null)
}
```

`connect_to_host_async(host, default_port)` accepts `"host"`, `"host:port"`,
or an IP literal. SRV records, IDN, and address-family fallback are all
handled for you.

For raw byte reads (binary protocols):

```squirrel
local got = await inp.read_bytes_async(8192, GLib.PRIORITY_DEFAULT)
local data = got.get_data()
if (data.len() == 0) { /* EOF */ }
```

---

## 16. TCP server (`Gio.SocketService`)

A `Gio.SocketService` accepts connections and fires `incoming` per accept.
From [demo/gio/tcp_echo.nut](../../demo/gio/tcp_echo.nut):

```squirrel
local service = Gio.SocketService.new()
local addr    = sqgi.new_object(Gio.InetSocketAddress, {
    "address": Gio.InetAddress.new_loopback(Gio.SocketFamily.ipv4),
    "port":    9101,
})
service.add_address(addr, Gio.SocketType.stream,
                    Gio.SocketProtocol.tcp, null)

service.connect("incoming", function(connection, _source) {
    local inp = connection.get_input_stream()
    local out = connection.get_output_stream()

    // Echo: pipe input back to output, close both on EOF.
    local flags = Gio.OutputStreamSpliceFlags.close_source |
                  Gio.OutputStreamSpliceFlags.close_target
    out.splice_async(inp, flags, GLib.PRIORITY_DEFAULT, null,
        function(self, res) {
            try { out.splice_finish(res) } catch (e) {}
        })

    return false       // let other handlers run too (rare)
})

service.start()
GLib.MainLoop.new(null, false).run()
```

If you don't care which port you get:

```squirrel
local port = service.add_any_inet_port(null)
print("listening on " + port + "\n")
```

Each `incoming` callback runs in the main thread. Don't block in there — kick
off async work and return.

---

## 17. TLS over a raw socket

`SocketClient.set_tls(true)` transparently wraps the connection in a
`Gio.TlsClientConnection`. From
[demo/gio/tls_get.nut](../../demo/gio/tls_get.nut):

```squirrel
local client = Gio.SocketClient.new()
client.set_tls(true)
local conn = await client.connect_to_host_async("example.com", 443)
```

For client certificates, set `client.set_tls_validation_flags(...)` or
hook the `Gio.TlsClientConnection::accept-certificate` signal on the
returned connection.

For HTTP specifically, prefer libsoup ([docs/recipes/soup.md](soup.md)) —
it handles redirects, content-encoding, connection pooling, and keepalive.
The raw socket path is for non-HTTP TLS protocols.

---

## 18. UDP and `socket_add_watch`

UDP doesn't have GIO's async pair. Instead, set the socket non-blocking
and use `sqgi.socket_add_watch` to attach a readiness callback. From
[demo/gio/udp_echo.nut](../../demo/gio/udp_echo.nut):

```squirrel
local s = Gio.Socket.new(Gio.SocketFamily.ipv4,
                         Gio.SocketType.datagram,
                         Gio.SocketProtocol.udp)
s.set_blocking(false)
s.bind(sqgi.new_object(Gio.InetSocketAddress, {
    "address": Gio.InetAddress.new_from_string("0.0.0.0"),
    "port":    9201,
}), true)

sqgi.socket_add_watch(s, GLib.IOCondition.in, function(sock, cond) {
    local r    = sock.receive_bytes_from(1500, 0, null)
    local data = r[0].get_data()
    local from = r[1]
    print("recv " + data + " from " + from.get_address().to_string() + "\n")
    sock.send_to(from, "pong: " + data, null)
    return true         // keep watching; return false to remove
})
```

`receive_bytes_from(maxlen, timeout_seconds, cancellable)` returns
`[GLib.Bytes, GInetSocketAddress]`. For send, `send_to(dest_addr, bytes_or_string, cancellable)`
returns the number of bytes sent.

Multicast: `s.join_multicast_group(addr, source_specific, iface)`. See
[demo/gio/udp_multicast.nut](../../demo/gio/udp_multicast.nut).

---

## 19. Cancellation

Every auto-async wrapper allocates a `Gio.Cancellable` and binds it to its
Task — so `task.cancel()` aborts the in-flight C call. From
[demo/gio/cancel.nut](../../demo/gio/cancel.nut):

```squirrel
async function slow_get(host) {
    local client = Gio.SocketClient.new()
    local conn   = await client.connect_to_host_async(host, 80)
    // ... long read ...
}

local task = slow_get("example.com")

sqgi.timeout_add(50, function() {
    task.cancel()           // cancellable propagates into GIO
    return false
})

task.then(
    function(n) { print("done\n") },
    function(e) {
        // e is { __cancelled = true, reason = ... } on cancel
        print("err: " + e + "\n")
    })
```

For a shared Cancellable across multiple operations, build your own:

```squirrel
local c = Gio.Cancellable.new()

local t1 = sqgi.gio_async(
    @(_c, cb) f.read_async(GLib.PRIORITY_DEFAULT, c, cb),     // shared `c`!
    @(r)     f.read_finish(r))
local t2 = ...

// Cancel everything together:
c.cancel()
```

The `null` cancellable arg to `lookup_value`, `query_exists`, etc. just
means "uncancellable" — pass a real `Gio.Cancellable` if you want to
cancel a sync call from another fiber/source.

---

## 20. Parallel I/O

`sqgi.all` runs N awaitables concurrently and returns their results in the
same order. From [demo/gio/tasks_all.nut](../../demo/gio/tasks_all.nut):

```squirrel
async function load_one(p) {
    try {
        local r = await Gio.File.new_for_path(p).load_contents_async(null)
        return [p, r[0], null]
    } catch (e) {
        return [p, null, e]
    }
}

async function load_many(paths) {
    local tasks = []
    foreach (p in paths) tasks.append(load_one(p))
    return await sqgi.all(tasks)
}
```

`sqgi.all` rejects on the **first** failure. To keep going on partial
failure, catch inside each task (as above) and return an `[err, value]`
tuple, or use `sqgi.race` for "first one wins" semantics.

For DNS, the same trick fans out N lookups in parallel — see
[demo/gio/resolver.nut](../../demo/gio/resolver.nut).

---

## 21. Common pitfalls

| Symptom | Cause | Fix |
|---|---|---|
| Hangs forever with no output | No main loop running | `GLib.MainLoop.new(null, false).run()` or `app.run(...)` |
| `await` works at REPL but hangs in script | Script returned without starting a loop | Keep `loop.run()` at the end |
| `the index '?' does not exist` on `_finish` result | Result is `[value, …]`, you indexed it as a scalar | `local v = (typeof(r) == "array") ? r[0] : r` |
| `FileInfo.list_attributes` returns `null` | You queried a remote file the attribute namespace doesn't apply to | Pass `null` for "all"; check for `null` before iterating |
| `query_info` is much slower than `stat(2)` | Asked for `"standard::*,unix::*,time::*"` | Pick the smallest selector you need |
| `Gio.ConverterInputStream.new(...)` throws | It has no shortcut constructor — uses construct-only props | `sqgi.new_object(Gio.ConverterInputStream, {"base-stream"=…, "converter"=…})` |
| TCP server's `incoming` callback fires but the handler never finishes | You're `await`-ing inside the signal callback | Kick off an async function and return immediately, don't block the signal |
| TLS errors against a self-signed cert | Default cert verification rejects it | Set TLS validation flags on the connection (testing only — never in prod) |
| `socket.send_to` raises "would block" | Socket is non-blocking and the kernel buffer is full | Watch for `Gio.IOCondition.out` with `socket_add_watch` and retry |
| `task.cancel()` doesn't seem to stop the work | The C call doesn't check the cancellable, or you cancelled a Task that wasn't created via auto-async | Use auto-async wrappers, or pass a shared `Gio.Cancellable` and call `c.cancel()` |
| `Gio.Application.run` returns immediately | Forgot `app.hold()` while doing async work, or forgot to connect `activate` | Connect `activate` and either build a window or call `hold()` |
| Argv parsing prints "Unknown option" but my flag was registered | You ran the app without `HANDLES_COMMAND_LINE` | Set `Gio.ApplicationFlags.handles_command_line` |

---

## Further reading

- [demo/gio/](../../demo/gio/) — 19 runnable examples covering every recipe
  here.
- [docs/api/README.md](../api/README.md) — `sqgi.gio_async`,
  `sqgi.socket_add_watch`, `sqgi.bytes_to_array`, `sqgi.Task`, `sqgi.all`,
  `sqgi.race`.
- [docs/language/](../language/) — chapters 9–11 cover the async model
  these recipes lean on.
- [docs/recipes/soup.md](soup.md) and [docs/recipes/gtk4.md](gtk4.md) — both
  build on the patterns here.
- Upstream GIO reference: <https://docs.gtk.org/gio/>.
