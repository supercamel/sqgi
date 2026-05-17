# libsoup 3 Cookbook

Practical recipes for HTTP work — clients **and** servers — from SQGI using
libsoup 3. This document assumes you've read at least chapters 9–11 of
`docs/language/` (async, Tasks, GIO) and skimmed `docs/api/README.md`.

All examples are runnable with:

```bash
./build/sqgi path/to/script.nut
```

See `demo/soup/` for fuller working scripts (`http_get.nut`, `vget.nut`).

> **Namespace and version.** Always import `Soup` explicitly. On a libsoup 3
> system you'll get the 3.0 typelib; if both 2.4 and 3.0 are installed pass
> the version: `import("Soup", "3.0")`. The 3.x API is the one documented
> here. The 2.x API is incompatible.

## Contents

- [1. Setup and a 5-line GET](#1-setup-and-a-5-line-get)
- [2. The two ways to fetch a body](#2-the-two-ways-to-fetch-a-body)
- [3. Status codes and errors](#3-status-codes-and-errors)
- [4. Request and response headers](#4-request-and-response-headers)
- [5. Query strings and URL building](#5-query-strings-and-url-building)
- [6. POST / PUT / DELETE with a request body](#6-post--put--delete-with-a-request-body)
- [7. JSON: GET and parse, build and POST](#7-json-get-and-parse-build-and-post)
- [8. Form submissions (application/x-www-form-urlencoded)](#8-form-submissions-applicationx-www-form-urlencoded)
- [9. File downloads (streaming to disk)](#9-file-downloads-streaming-to-disk)
- [10. Cancellation and timeouts](#10-cancellation-and-timeouts)
- [11. Parallel requests](#11-parallel-requests)
- [12. Cookies, redirects, user-agent](#12-cookies-redirects-user-agent)
- [13. A minimal `Soup.Server`](#13-a-minimal-soupserver)
- [14. Routing and method dispatch](#14-routing-and-method-dispatch)
- [15. JSON endpoints](#15-json-endpoints)
- [16. Reading the request body](#16-reading-the-request-body)
- [17. Async work inside a handler](#17-async-work-inside-a-handler)
- [18. Common pitfalls](#18-common-pitfalls)

---

## 1. Setup and a 5-line GET

Every libsoup client needs three things: a `Soup.Session` (the HTTP engine),
a `Soup.Message` (one request/response), and a way to drive its async I/O.
SQGI's [auto-async wrappers](../api/README.md#auto-async-gio-wrappers) turn
any `_async` / `_finish` pair into a single awaitable call.

```squirrel
local GLib = import("GLib")
local Soup = import("Soup")

local loop = GLib.MainLoop.new(null, false)

async function main() {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("GET", "https://example.com/")

    local bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)

    print("status : " + msg.get_status() + "\n")
    print("length : " + bytes.get_size() + " bytes\n")
    loop.quit()
}

main()
loop.run()
```

What's going on:

- `session.send_and_read_async(msg, priority)` is the auto-async wrapper.
  The cancellable and callback arguments are handled for you; the call
  returns a Task you can `await`. (If you need an explicit cancellable, see
  §10.)
- The awaited result is a `GLib.Bytes` containing the full response body —
  what the underlying `send_and_read_finish` would have returned.
- `msg.get_status()` is meaningful only **after** the operation completes.

That's the entire client surface for "just fetch this URL". The rest of this
cookbook is variations on those four lines.

---

## 2. The two ways to fetch a body

libsoup gives you a buffered API and a streaming API. Pick by size.

### Buffered: `send_and_read_async` (recommended for ≤ a few MB)

Resolves to a `GLib.Bytes` instance with the whole body. Easy. Used in §1.

To turn the bytes into a Squirrel string just call `.get_data()`:

```squirrel
local text = bytes.get_data()    // 8-bit-clean Squirrel string
print(text + "\n")
```

That string is fine for UTF-8 text. For binary data treat it as a byte
buffer (use `s[i]` for `int` per-byte access, or `sqgi.bytes_to_array(s)`).

Going the other way — build a `GLib.Bytes` from a Squirrel string with
`GLib.Bytes.new(s)`. Many libsoup setters (e.g. `set_request_body_from_bytes`)
require an actual `GLib.Bytes` userdata, **not** a raw string.

### Streaming: `send_async` + `read_bytes`

`await session.send_async(msg, priority)` resolves to a `Gio.InputStream`.
Read it in chunks. Use this for big downloads — see §9.

---

## 3. Status codes and errors

libsoup distinguishes **transport errors** (DNS, TLS, connection reset →
the async call rejects) from **HTTP errors** (404, 500 → call succeeds but
`msg.get_status()` is non-2xx).

```squirrel
async function get(url) {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("GET", url)

    local bytes
    try {
        bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)
    } catch (e) {
        // Transport-level failure: DNS, TLS, network down, cancelled, etc.
        print("transport error: " + e + "\n")
        return null
    }

    local status = msg.get_status()
    if (status < 200 || status >= 300) {
        print("HTTP " + status + " " + msg.get_reason_phrase() + "\n")
        return null
    }
    return bytes
}
```

Common status constants live on `Soup.Status` (e.g. `Soup.Status.ok`,
`Soup.Status.not_found`) but plain integer comparison is fine.

---

## 4. Request and response headers

`Soup.Message` exposes `get_request_headers()` and `get_response_headers()`,
each a `Soup.MessageHeaders`.

```squirrel
local msg = Soup.Message.new("GET", "https://httpbin.org/headers")

local rh = msg.get_request_headers()
rh.append("Accept", "application/json")
rh.append("User-Agent", "sqgi-demo/1.0")
rh.append("X-Custom", "hello")
```

After the request completes, read response headers the same way:

```squirrel
local h = msg.get_response_headers()
local function or_q(s) { return s != null ? s : "?" }
print("Content-Type   : " + or_q(h.get_one("Content-Type"))   + "\n")
print("Content-Length : " + or_q(h.get_one("Content-Length")) + "\n")
```

Iterate all of them:

```squirrel
h.foreach(function(name, value) {
    print(name + ": " + value + "\n")
})
```

> Header names are case-insensitive in libsoup. `get_one("content-type")` and
> `get_one("Content-Type")` return the same thing.

---

## 5. Query strings and URL building

The simplest approach is to construct the URL yourself with
`GLib.Uri.escape_string`:

```squirrel
function build_url(base, params) {
    local pairs = []
    foreach (k, v in params) {
        pairs.push(GLib.Uri.escape_string(k.tostring(), null, false) + "=" +
                   GLib.Uri.escape_string(v.tostring(), null, false))
    }
    if (pairs.len() == 0) return base
    local sep = (base.find("?") == null) ? "?" : "&"
    return base + sep + pairs.reduce(@(a, b) a + "&" + b)
}

local url = build_url("https://api.example.com/search", {
    q     = "hello world"
    page  = 2
})
// → https://api.example.com/search?q=hello%20world&page=2
```

For parsing a URL you receive, use `GLib.Uri.parse(url, GLib.UriFlags.none)`
and then `uri.get_host()`, `uri.get_path()`, `uri.get_query()`.

---

## 6. POST / PUT / DELETE with a request body

`Soup.Message.new(method, uri)` accepts any HTTP method. Attach a body with
`set_request_body_from_bytes(content_type, GLib.Bytes)`:

```squirrel
local GLib = import("GLib")
local Soup = import("Soup")

async function post_text(url, body_text) {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("POST", url)

    local bytes = GLib.Bytes.new(body_text)
    msg.set_request_body_from_bytes("text/plain; charset=utf-8", bytes)

    local resp = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)
    print("status: " + msg.get_status() + "\n")
    return resp
}

post_text("https://httpbin.org/post", "hello sqgi")
```

`PUT` and `DELETE` (with a body) work identically — just change the method
string. `DELETE` usually has no body; pass an empty `GLib.Bytes`, or skip the
`set_request_body_from_bytes` call entirely.

---

## 7. JSON: GET and parse, build and POST

This is what most HTTP work boils down to. SQGI ships JSON in the stdlib:
`sqgi.json.parse(text)` and `sqgi.json.stringify(value)`. See
`docs/api/README.md` § JSON.

### GET and parse

```squirrel
async function get_json(url) {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("GET", url)
    msg.get_request_headers().append("Accept", "application/json")

    local bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)
    if (msg.get_status() != 200) {
        throw "HTTP " + msg.get_status()
    }

    return sqgi.json.parse(bytes.get_data())
}

async function demo() {
    local data = await get_json("https://httpbin.org/get")
    print("URL echoed by server: " + data.url + "\n")
    foreach (k, v in data.headers) {
        print("  " + k + " = " + v + "\n")
    }
}
demo()
```

### Build and POST

```squirrel
async function post_json(url, value) {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("POST", url)
    msg.get_request_headers().append("Accept", "application/json")

    local body_text = sqgi.json.stringify(value)
    local arr = []
    for (local i = 0; i < body_text.len(); i++) arr.push(body_text[i])
    local body = sqgi.bytes_from_array(arr)
    msg.set_request_body_from_bytes("application/json", body)

    local resp_bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)

    local rarr  = sqgi.bytes_to_array(resp_bytes)
    local rtext = ""
    foreach (b in rarr) rtext += format("%c", b)
    return { status = msg.get_status(), body = sqgi.json.parse(rtext) }
}

post_json("https://httpbin.org/post", { name = "sqgi", tags = ["http", "json"] })
    .then(function(r) {
        print("server saw: " + r.body.json.name + "\n")
    })
```

---

## 8. Form submissions (application/x-www-form-urlencoded)

```squirrel
function form_encode(fields) {
    local pairs = []
    foreach (k, v in fields) {
        pairs.push(GLib.Uri.escape_string(k.tostring(), null, false) + "=" +
                   GLib.Uri.escape_string(v.tostring(), null, false))
    }
    return pairs.len() ? pairs.reduce(@(a, b) a + "&" + b) : ""
}

async function post_form(url, fields) {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("POST", url)
    local body    = GLib.Bytes.new(form_encode(fields))
    msg.set_request_body_from_bytes("application/x-www-form-urlencoded", body)
    return await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)
}
```

For `multipart/form-data` (file uploads), build the body with
`Soup.Multipart` (`new("multipart/form-data")`, `append_form_string`,
`append_form_file`) and call `Soup.Multipart.to_message(headers, multipart)`
to compose the full message — or just hand-roll the body if it's a one-off.

---

## 9. File downloads (streaming to disk)

For anything bigger than a few MB, don't buffer the whole body. Open a
`Gio.InputStream` with `session.send_async` and copy to a file. This is the
pattern used in `demo/soup/vget.nut`:

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")
local Soup = import("Soup")

function download(uri, output_path) {
    local task    = sqgi.Task()
    local session = Soup.Session.new()
    local message = Soup.Message.new("GET", uri)
    local in_stream  = session.send(message, null)   // sync open; reads stay async

    local out_file   = Gio.File.new_for_path(output_path)
    local out_stream = out_file.replace(null, false, Gio.FileCreateFlags.none, null)

    local CHUNK = 65536
    local total = 0

    // A 0-ms timer is a dispatch-safe driver — see vget.nut for the
    // explanation of why we don't `await` between chunks here.
    sqgi.timeout_add(0, function() {
        try {
            local chunk = in_stream.read_bytes(CHUNK, null)
            local n = chunk.get_size()
            if (n == 0) {
                in_stream.close_sync(null)
                out_stream.close_sync(null)
                task.resolve(total)
                return false        // remove source
            }
            out_stream.write_bytes(chunk, null)
            total += n
            return true             // keep ticking
        } catch (e) {
            try { in_stream.close_sync(null)  } catch (_) {}
            try { out_stream.close_sync(null) } catch (_) {}
            task.reject(e)
            return false
        }
    })

    return task
}

async function main() {
    local n = await download("https://example.com/big.iso", "big.iso")
    print("downloaded " + n + " bytes\n")
}
```

Content length, if the server sent one, is in
`message.get_response_headers().get_content_length()`.

---

## 10. Cancellation and timeouts

### Per-request cancellation

The auto-async wrapper already allocates a `Gio.Cancellable` and binds it to
the returned Task — so `task.cancel()` aborts the request:

```squirrel
local task = session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)

// Later, from anywhere:
task.cancel()

try {
    local bytes = await task
} catch (e) {
    // e is a cancellation marker: { __cancelled = true, reason = ... }
    if (typeof e == "table" && ("__cancelled" in e)) {
        print("cancelled\n")
    } else {
        throw e
    }
}
```

If you need to share one cancellable across several requests, drop down to
`sqgi.gio_async` and pass your own `Gio.Cancellable` (see
`docs/api/README.md`).

When cancelled at the C level, the underlying call rejects with a
`G_IO_ERROR_CANCELLED`.

### Timeout

```squirrel
async function fetch_with_timeout(url, ms) {
    local timed_out = sqgi.Task()
    sqgi.timeout_add(ms, function() {
        timed_out.resolve("__timeout__")
        return false
    })

    local fetch = (async function() {
        local s = Soup.Session.new()
        local m = Soup.Message.new("GET", url)
        return await s.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
    })()

    local winner = await sqgi.race([fetch, timed_out])
    if (winner == "__timeout__") throw "timeout after " + ms + "ms"
    return winner
}
```

You can also set a global session timeout via the property:

```squirrel
session.timeout = 10        // seconds, 0 = no timeout
```

---

## 11. Parallel requests

`sqgi.all` runs N awaitables concurrently and resolves to an array of
results in the same order. Each request must use its own `Soup.Message`
(messages are single-use), but a single shared `Soup.Session` is fine —
and recommended, for connection reuse.

```squirrel
async function fetch_all(urls) {
    local session = Soup.Session.new()
    local tasks = []
    foreach (u in urls) {
        local msg = Soup.Message.new("GET", u)
        tasks.push(session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT))
    }
    return await sqgi.all(tasks)
}

async function demo() {
    local results = await fetch_all([
        "https://example.com/",
        "https://example.org/",
        "https://example.net/",
    ])
    foreach (i, b in results) print(i + ": " + b.get_size() + " bytes\n")
}
```

If any one rejects, `sqgi.all` rejects with the first failure. Use
`sqgi.allSettled` (if available in your build) or wrap each call in a
`try/catch` to keep going on partial failure.

---

## 12. Cookies, redirects, user-agent

```squirrel
local session = Soup.Session.new()

// User-Agent for every message on this session:
session.user_agent = "sqgi-app/1.0 "

// Disable redirect-following:
session.set_accept_language_auto(true)   // honour LANG/LC_*
session.max_conns_per_host = 4
```

For cookies, attach a `Soup.CookieJar`:

```squirrel
local jar = Soup.CookieJarText.new("./cookies.txt", false)   // persistent
// or: local jar = Soup.CookieJar.new()                      // in-memory
session.add_feature(jar)
```

The jar persists across calls on this session, so logins survive between
requests.

To control redirect behaviour per-message:

```squirrel
msg.set_flags(Soup.MessageFlags.no_redirect)
```

---

## 13. A minimal `Soup.Server`

libsoup ships a small HTTP/1.1 server. Bind it, register handlers, run a
GLib main loop. That's it.

```squirrel
local GLib = import("GLib")
local Soup = import("Soup")

local server = sqgi.new_object(Soup.Server, {})

server.add_handler("/", function(server, msg, path, query) {
    msg.set_status(200, null)
    // set_response wants (content_type, memuse, char*, size_t).
    // A Squirrel string is the right argument here — GLib.Bytes does NOT
    // marshal correctly to the C `char*` parameter.
    msg.set_response("text/plain; charset=utf-8",
                     Soup.MemoryUse.copy, "hello from sqgi soup\n")
})

server.listen_local(8080, Soup.ServerListenOptions.ipv4_only)
print("listening on http://127.0.0.1:8080/\n")

local loop = GLib.MainLoop.new(null, false)
loop.run()
```

Hit it with `curl http://127.0.0.1:8080/`.

Key APIs:

- `sqgi.new_object(Soup.Server, props)` — create the server. `Soup.Server`
  has no static `new()`; use `sqgi.new_object` with a properties table.
  Pass `{ "tls-certificate" = cert }` for HTTPS.
- `server.listen_local(port, options)` — bind to loopback only. Port 0 lets
  the kernel pick one.
- `server.listen_all(port, options)` — bind to all interfaces.
- `server.add_handler(path, callback)` — register a path. `null` path means
  "fallback for anything not otherwise matched".
- `server.get_uris()` — return a list of `GLib.Uri` the server is bound to.

The handler signature is `(server, msg, path, query)`:

- `server` — the Soup.Server (same one).
- `msg` — a `Soup.ServerMessage`. Like `Soup.Message` but with server-side
  setters: `set_status`, `set_response`, `get_method`, `get_request_body`,
  request/response headers.
- `path` — the request path string.
- `query` — a hash table of decoded query parameters, or `null`.

---

## 14. Routing and method dispatch

`add_handler` only matches by path prefix. Dispatch by method inside the
handler:

```squirrel
function route_users(server, msg, path, query) {
    local method = msg.get_method()
    if (method == "GET")    return list_users(msg, query)
    if (method == "POST")   return create_user(msg)
    if (method == "DELETE") return delete_user(msg, path)

    msg.set_status(405, null)            // Method Not Allowed
    msg.get_response_headers().append("Allow", "GET, POST, DELETE")
}

server.add_handler("/users", route_users)
server.add_handler("/", function(_s, msg, _p, _q) {
    msg.set_status(404, null)
    msg.set_response("text/plain", Soup.MemoryUse.copy, "not found\n")
})
```

For path parameters (`/users/:id`) parse `path` yourself — libsoup's router
is intentionally tiny.

```squirrel
function delete_user(msg, path) {
    // path is e.g. "/users/42"
    local id = path.slice(7)            // "42"
    db_delete(id)
    msg.set_status(204, null)            // No Content
}
```

---

## 15. JSON endpoints

```squirrel
function json_response(msg, status, value) {
    msg.set_status(status, null)
    msg.set_response("application/json; charset=utf-8",
                     Soup.MemoryUse.copy, sqgi.json.stringify(value))
}

server.add_handler("/api/hello", function(_s, msg, _p, query) {
    local name = (query != null && "name" in query) ? query["name"] : "world"
    json_response(msg, 200, { greeting = "hello, " + name })
})
```

`curl 'http://127.0.0.1:8080/api/hello?name=sam'`
→ `{"greeting":"hello, sam"}`.

`query` is already URL-decoded.

---

## 16. Reading the request body

For POST/PUT, call `msg.get_request_body()` to get a `Soup.MessageBody`,
then `.flatten()` for a `GLib.Bytes` over the full payload, then
`.get_data()` for it as a Squirrel string:

```squirrel
server.add_handler("/api/echo", function(_s, msg, _p, _q) {
    if (msg.get_method() != "POST") {
        msg.set_status(405, null); return
    }

    local text = msg.get_request_body().flatten().get_data()

    local ct = msg.get_request_headers().get_one("Content-Type")
    if (ct != null && ct.find("application/json") != null) {
        local value = sqgi.json.parse(text)
        json_response(msg, 200, { received = value })
    } else {
        msg.set_status(200, null)
        msg.set_response("text/plain", Soup.MemoryUse.copy,
                         "got " + text.len() + " bytes\n")
    }
})
```

By default libsoup buffers the full request body before invoking your
handler, which is what you want for small JSON payloads. For streaming
uploads, see `Soup.ServerMessage::got-chunk`.

---

## 17. Async work inside a handler

If you need to call out to a database or another HTTP service, you can
either:

1. Reply synchronously after a quick blocking call (fine for trusted local
   work).
2. Hold the response, do `await` work, then complete the message:

```squirrel
server.add_handler("/api/proxy", function(_s, msg, _p, query) {
    if (query == null || !("url" in query)) {
        msg.set_status(400, null); return
    }
    local target = query["url"]

    // Tell libsoup we'll finish this later.
    msg.pause()

    (async function() {
        try {
            local session = Soup.Session.new()
            local m = Soup.Message.new("GET", target)
            local bytes = await session.send_and_read_async(m, GLib.PRIORITY_DEFAULT)

            local up_ct = m.get_response_headers().get_one("Content-Type")
            msg.set_status(m.get_status(), null)
            msg.set_response(
                up_ct != null ? up_ct : "application/octet-stream",
                Soup.MemoryUse.copy, bytes.get_data())
        } catch (e) {
            msg.set_status(502, null)
            msg.set_response("text/plain", Soup.MemoryUse.copy,
                             "upstream error: " + e + "\n")
        }
        msg.unpause()
    })()
})
```

The key calls are `msg.pause()` and `msg.unpause()`. Between them the
response is held open; the GLib main loop is free to service other
connections.

---

## 18. Common pitfalls

| Symptom | Cause | Fix |
|---|---|---|
| `send_and_read_async` rejects with "unsupported scheme" | URL has no `http://` or `https://` | Always pass a full absolute URI |
| `msg.get_status()` is `0` | Read it before the request finished | Only inspect after `await` returns |
| `wrong argument type, expected 'userdata'` from `set_request_body_from_bytes` | Passed a raw string | Wrap with `GLib.Bytes.new(string)` |
| `the index 'new' does not exist` on `Soup.Server.new()` | `Soup.Server` has no static `new()` constructor | `sqgi.new_object(Soup.Server, {})` |
| 2xx response but empty `bytes` | Used `send_async` and didn't drain the stream | Either use `send_and_read_async`, or read the stream to EOF |
| Hangs forever | No `GLib.MainLoop.run()` (or `Application.run`) anywhere | Async work needs a running main context |
| TLS errors against self-signed certs | libsoup validates by default | Set `session.set_tls_database(null)` or `msg.set_tls_certificate(...)` deliberately for testing — never in production |
| 411 Length Required when POSTing | Server wanted Content-Length and you streamed | Use `set_request_body_from_bytes`, which sets the length |
| Server handler runs but client sees no body | Forgot `set_response` (only called `set_status`) | Always pair them, or `msg.set_status(204, null)` for no body |
| `query` argument is `null` | URL had no `?` | Check with `query != null` before indexing |
| Server-side `msg.get_request_body().data` is truncated or empty | The `.data` accessor on `Soup.MessageBody` doesn't always reflect the full buffered body in this binding | Always read with `.flatten().get_data()` |
| Random crashes during a large download | Awaiting between chunks while libsoup's input stream is iterating the main loop | Drive chunked reads from a `sqgi.timeout_add(0, …)` source (see §9 and `demo/soup/vget.nut`) |
| Mixing Soup 2 and Soup 3 | Both typelibs present, wrong one picked | `import("Soup", "3.0")` explicitly |

---

## Further reading

- `demo/soup/http_get.nut` — minimal GET, end-to-end.
- `demo/soup/vget.nut` — full CLI download tool with progress.
- `docs/api/README.md` — auto-async wrappers, `sqgi.json.*`, `sqgi.bytes_*`,
  `sqgi.Task`, `sqgi.all`, `sqgi.race`.
- `docs/language/09-async.md` and `10-tasks.md` for the async model these
  recipes lean on.
- Upstream libsoup 3 API reference:
  <https://libsoup.gnome.org/libsoup-3.0/>.
